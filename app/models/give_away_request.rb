class GiveAwayRequest < Request

  def accept
    self.update_attributes(status: Request::ACCEPTED_CODE)
    self.book.update_attributes(user_id: self.requester.id)
    Event.create_request_event(self,Event::REQUEST_ACCEPTED)
  end
end
