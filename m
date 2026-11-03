Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697173;
	b=3ApI7AJGsclLGmMAaRSgM2nXPZ/Cbo4mojgraGuodKbPIUCRjsWbDPiWpgvJz/wquDp+
	 fPbDV3QeLjGGbyzFHlp5fLNBHJn/3xhZ12ribkq4PBD+gTNd5cXt/BUe8xxTfTKpR3tVo
	 dLJ++LhOnZAL+03tYXhVQFgZ9fe0M5UOrmr7DxeQL1mqWZjLtfosprGf2LrWwogY4jlEK
	 aZeqRYeh7j02j4gOxWIiVT77vncuiFe+A8u7+sZmp8bCMelRRQxMqYfzISR4rs4paf4vQ
	 kIyRf7R63NC752w613suMtOFATqi5ezIFa4v+90FqLqEamMKHtWc5a0/9HnpRWKy8Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697173;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WYctKgm5U0KgIwAbyhHaKFrqKfO1EQQ3DAVoCbr5B9w=;
	b=PgjLFvxuB0cWlzjsDeovz/guTYUxJkCfTwhYkL153Y/cgZHWw1O77X9tYc+SVaDReI1R
	 +dOWPHUtoNKINhjK2rScsWEbdiMEMHIBw68zDozEFi9ixW3XKEUpH0jqpUi+8uIQnq+zn
	 IhECBOsyMRPS6TOvPiU7Sy76v/c9/36c1dQdTdhbhynry49P2LhzruX4L+uUlfT/1BIOK
	 MmPvZuvfE/yVlq2dvi4p9hCcmz2ndA1lC/remYQ0ktr+3E9Fegbt/e50a5GI/WF2larXf
	 /yDZpCFq09PepoIVf7OK6z7lP81skBoEaHMhCMiXIc/tbavJT91KzAsOKPa699Ds6vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KqPLHoxK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91441606A324;
	Tue,  3 Nov 2026 09:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KqPLHoxK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654201F000C1;
	Tue,  3 Nov 2026 09:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793697173;
	bh=WYctKgm5U0KgIwAbyhHaKFrqKfO1EQQ3DAVoCbr5B9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KqPLHoxKowixNoj/EmjTsKo1XyRnuuC0rreCMdIVf7sCm83zY4h+C/F+iVXtFoGMf
	 dgqtjEXqPzbKhzhNs+FU0x6gwu6rEGotqRDmFeqy90udelSwSke4Zst8EAntBFe8xY
	 HO8SQq1Van0dbMbUgMe7pZy4sDlsFZ9KNVtPi1Uzb7LiWoTDtESeJP/PcztrDwMg3e
	 2DMdFSBGJvxFmAC9bMnnH6cMH9mRFDsNYBu15N3ydzY0/4AuKR15m/LLdrmCno8QvP
	 sEcHMs2OJSL9uVaKFjaQD6j1yDiFZSn+I6UVslJnXYFj/l2Z9QQTbpBjosmMLcapVq
	 JQkeL1jFW+3Dg==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xOAZW-00000006HOf-48Et;
	Tue, 03 Nov 2026 10:12:50 +0100
Date: Tue, 3 Nov 2026 10:12:50 +0100
From: Johan Hovold <johan@kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Alex Elder <elder@ieee.org>, Maritu Hone <marehone12@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bryan O'Donoghue <bod@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: uart: fix heap buffer overflow in
 gb_tty->buffer
Message-ID: <aumlkgtsSDS1fw4g@hovoldconsulting.com>
References: <20261102195332.19860-1-marehone12@gmail.com>
 <f3848ac6-a105-4581-8f17-fc9d3f748b74@ieee.org>
 <aumfB5MLWIQuTYY3@stanley.mountain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aumfB5MLWIQuTYY3@stanley.mountain>

On Tue, Nov 03, 2026 at 11:44:55AM +0300, Dan Carpenter wrote:
> On Mon, Nov 02, 2026 at 03:33:58PM -0600, Alex Elder wrote:
> > On 11/2/26 1:53 PM, Maritu Hone wrote:
> > > gb_tty->buffer is allocated once in gb_uart_probe() and reused for
> > > every outgoing chunk as the backing store for a
> > > struct gb_uart_send_data_request:
> > > 
> > > 	struct gb_uart_send_data_request {
> > > 		__le16	size;
> > > 		__u8	data[];
> > > 	} __packed;
> > > 
> > > In gb_uart_tx_write_work():
> > > 
> > > 	request = gb_tty->buffer;
> > > 	...
> > > 	send_size = gb_tty->buffer_payload_max;
> > > 	if (send_size > gb_tty->credits)
> > > 		send_size = gb_tty->credits;
> > > 	send_size = kfifo_out_peek(&gb_tty->write_fifo,
> > > 				   &request->data[0], send_size);

> Wow..  Heh...  I have read both the original message and your
> message and I still have no idea which function contains the
> actual memcpy() overflow.  :P

It's the kfifo_out_peek() in gb_uart_tx_write_work() that may write 2
bytes beyond gb_tty->buffer (as its size is currently just
gb_tty->buffer_payload_max).

Johan
