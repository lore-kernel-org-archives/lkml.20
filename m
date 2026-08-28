Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9053385A7;
	Fri, 28 Aug 2026 06:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787898772; cv=none; b=KYTq2hD8BRR5g7K5gQcqe9g5Bg2OpppqZvRbKkMe0QrgHu7V5RbzucCHYyw9rEvxtfsE+0K0CnoKUg7xteich5SNd+bMZXbvpBgYPlTfL5fpXJ5Z/QgzYmfjsP1Qhl6Qn8dHJAp7QvZ+LlEAuPEv3QYJyWFr/2ehCjEy8w47Mcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787898772; c=relaxed/simple;
	bh=R8rVuaUKd3C6aKQGR8br9YFuQKIbSEb83vkIOqpAY+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcmyVXKkVFRhVi+mQHPiDED+/ILOQCy9C24ON3JosUCEAgjHo0r8+mSQEHQP8MdS3qK+l0GBId6CZD6iDAVQMDd2sPDUjWE1swUkJ8RxDEuwkSGSqgmX9Sdb1vNT5OqaVIXcWtIP3GAjPzTUqju7WBxWWYOnJy1RY6Pfcb+8Hu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o8nUzBXU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o8nUzBXU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEFC1F000E9;
	Fri, 28 Aug 2026 06:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787898770;
	bh=TcOqXi+KaJV41I/pBIqyfI6WzMYHULQpXAJYPveaXcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o8nUzBXUpFFDbesyji0wrEfQ/wkIit+sRUX7fnSRJFfRH3rzzagLfJGDPqkXCEyAZ
	 won7QEf0JT6ef2Gmvkt7sUinsWsytzvyY+9p/fIZtffaW/mq1+5ODm09n+rANNjR4b
	 68M0BqN6aooUfAXZdIefTHGYfuboesT1wcH2My98=
Date: Fri, 28 Aug 2026 08:32:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, falemi@asu.edu,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] platform_get_irq_byname_optional -- dwc3-haps registers
 IRQ 0, WARN on first gadget init
Message-ID: <2026082806-irate-popper-0ce1@gregkh>
References: <CA+0ovCh2o46zgc5Be_Z5=6NNJTKnd3W29zeMJ+gBCgL+4fFLAg@mail.gmail.com>
 <2026082853-proofing-pungent-4e23@gregkh>
 <CA+0ovChEnx=kEPqK025rVH9EXRBk-dvSTts8+2ufw6bmt7nrvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+0ovChEnx=kEPqK025rVH9EXRBk-dvSTts8+2ufw6bmt7nrvg@mail.gmail.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Thu, Aug 27, 2026 at 11:16:24PM -0700, Farhad Alemi wrote:
> Greg,
> 
> You're right; sorry. I've stopped sending.
> 
> I'll resend individually, with the reproducer inline, and a proposed fix where I
> can write one. If you'd rather prefer that these not go to
> the lists at all, say so and I'll drop it.

We always want bugfixes, always send those.  But random "here's a kernel
splat" with no information as to what you were doing to cause this, nor
any help in determining if it even is valid or not, is not helpful to
anyone, least of all yourself.

See how syzbot works and emulate that, as it seems like you are doing
almost the same exact thing.

good luck!

greg k-h
