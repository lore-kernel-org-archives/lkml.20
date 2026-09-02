Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107473290B0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788324132; cv=none; b=Ms2nDzeTEJ767nDneyZSVQw7LO6A9UYk/MQvX8SBaxSMWRllfL6nnqjOM0n/lqdj8eVyjMI5M+b8KM8YsB9d1ZLQLjYe9SXWYte1v/yaREzPutJ/wiaFCd1Mvik56dkraLD1C8EnYjymundb7AOSSKgJkqPZxSgjjRsBKg9r/70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788324132; c=relaxed/simple;
	bh=LXFqGSPU6uxrVcsyBUi9g49Ou8b7JGqIdU5mSeZDps4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X9GEp3wWZnw0/Y0kmMyzmtCjnKeWIwqtU5gF6cseObf+W+L1j2tTxnAmLmg6tLipOOzbjM93zNS67pqofyaRQlqujAV3u8hY4SA5pFkN7xAaqzS3olQ6m9UPYwchSKT+5LoN6EmAGN7T6QiRLV999MfmoZ5yzj5Yt5BWAItKx7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Azo8Y4Ov; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Azo8Y4Ov"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso7908255e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 21:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788324129; x=1788928929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ai11qm4QGJgktgxHSdbSgMC+yqSgpeOZ79fxhBHEcOg=;
        b=Azo8Y4OvukdbtyFWidxRB+MJxUIjfQmOTOuOLMspmQ2mm9IMoZa+jludRRzZDC+Jmw
         V4kzA5jStt7FKxDusSU0bp9ZzXAY8PH+7uDAlM9FJRXfYWLfq1eQF9NBXekwmEYZv9L8
         K60IW998iIKZXnd1ivPsKqEePbZnlf7M0uFo3dmxbZN7MVJ1uiOWnA797g6UmooZEPaC
         bprbBattHBmXwzU0Xl3wCk0IwPgEm6Pj7jb7DhWY2UyHWhS2fUFWRDkKHHUWfrNXTzzU
         4aRBvtWSfTbCThvIwyziq782VHxH45fqtCMdL7rBAGToiiIIFxk9ln2t6kv0SqtI0l4k
         D0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788324129; x=1788928929;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ai11qm4QGJgktgxHSdbSgMC+yqSgpeOZ79fxhBHEcOg=;
        b=ndiQYG2eNYf2642CohovUJTod5Owf13GL4wETJ5d8kQ9NbFfC6DrfDmdE6/NKG9NJ+
         FlVZoxL4wNw4rh7QQeoksGGg3jqhIuRwxpYdKMX9omqgNZA8jmPq4UGgcTemLjHwnveJ
         liT4wK4+90jA+wwMZUfVNFJkmvRb5nkJlQx+E+BxEiWfhcZ5C4405WX5bCIekWEMATt7
         EQS8IpB09ZUXid1tdZ4SOEdJg5ueSYra0FLzyyqv2KYgq9Vk9b0fh1ywlNFG9wP34Lfs
         rwdryPJcY3iM2VsHJVu398Eb/CAOQvVVUJqYxQe2BI/tNxo/rELiMKpvWEYWwvCmydaG
         volA==
X-Forwarded-Encrypted: i=1; AHgh+RpT3KyrYFoGGXdCNG/GkNAl2yD7gb32vpmlxwtoCi8dmthTFWRoeHliFmazRRDV0StVHLWYVOekntH5FWA=@vger.kernel.org
X-Gm-Message-State: AFuF++nd8qO1znQfM6OSWdWaLJ5b3x40zNXc56gRnuVmezG+85wdr1sy
	4CKg4k29LWP5P7e6b4/TuL4i/8kmo7SVFJ7XjdgH238CEGMCq7mS0Cjl
X-Gm-Gg: AR+sD10cEfIS/2bVLYAjUoLZmjbWODe/npsTdd5ZqvnoiIyitwIFSVl/BlLxkTwNpj7
	rJ/pDPRYxEQ7uWrbMWCn3IMmm7QKHSft7Lz/2DKf+QkW3o1rAg2isL3VMRGslmitVq3uW5kF7mY
	a3DutadC3IKIYPOULdQ5ArK9O8L7LICA8gOdbQAk67EqwEkGXa3NoyTRo4gL0q2somTxYcMTHLM
	bKwWS6IxjQjLoUHxLpoBH/QWV2bUTH3B178GBvLZAmglT1V/94BAeX21WnZPwBj8LtiVy7qF9Hd
	oDdAno5kG4dhpJhrgYtjRsG6hRVJ2q/8Xan6JYP3zmJIUTuSj+HRaYPJaRSDJutdD8VlgzQtVPD
	TRRfvqbW505wIOEJtQiGJ2snLa++onCeg3fQjCnRXx2atAPGibv9w+hKKShxyLfKGdaJOtAoCOM
	b+G1BaW87kITDxsB8e7cwF2NAspp9p2+mw+/q9zsFHARU8/9n3bJY7DVWz8/npGV/haZlfh7ZFp
	c83Vg==
X-Received: by 2002:a05:600c:1da1:b0:499:9eb8:a1d7 with SMTP id 5b1f17b1804b1-49ce5842935mr37954975e9.9.1788324129258;
        Tue, 01 Sep 2026 21:42:09 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce171c3sm125809605e9.8.2026.09.01.21.42.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 01 Sep 2026 21:42:08 -0700 (PDT)
Date: Wed, 2 Sep 2026 06:42:04 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Julian Oes <julian@oes.ch>
Cc: oneukum@suse.com, gregkh@linuxfoundation.org, johan@kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: generic: recover from a stalled bulk-in
 endpoint
Message-ID: <20260902064204.1a47cd73.michal.pecio@gmail.com>
In-Reply-To: <20260901231355.114733-1-julian@oes.ch>
References: <746c4df4-abd5-4e04-9edc-3ff8f17506bf@suse.com>
	<20260901231355.114733-1-julian@oes.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  2 Sep 2026 11:13:53 +1200, Julian Oes wrote:
> On Tue, Sep 01, 2026 at 10:28:08AM +0200, Oliver Neukum wrote:
> > But why do you get a port stalling?
> > It seems your hardware is quite broken.  
> 
> Maybe, yes, but as I wrote to Greg, I believe I have seen this (or
> similar stalls) over the years in the past with various hardware.
> Maybe it's just me but if it is not, it would be nice to fix it for
> others too.

What you are probably seeing is USB 2.0 hub(s) returning STALL
handshake when a transaction attempt with downstream low/full-speed
device fails three times. See USB 2.0 section 11.17.1 page 364.

If that's the case, the device endpoint isn't actually halted and you
would see the traffic resume if you simply ignored the error and kept
resubmitting until communication is restored.

That being said, calling usb_clear_halt() is indeed the only recovery
supported by USB specs, both for -EPIPE and -EPROTO or similar. Linux
has traditionally ignored this and things are quite broken sometimes,
particularly with xhci-hcd, even if you call usb_clear_halt().

I suppose you can try this and see how it works, and if you run into
xhci-hcd bugs we could try to fix them too. The -EPIPE case is easier
because drivers don't rely on out of spec behavior of the USB stack.

Related discussion: (gonna need *a lot* of popcorn for that one)
https://lore.kernel.org/linux-usb/261996a8-7ad4-4df2-a469-f6602da71255@suse.com/

Alan Stern tried to come up with some solution in USB core, but not sure
how far that got.

It seems there is only one risk of usb_clear_halt() in such cases:
- you send a packet to an OUT endpoint
- and the device accepts it but you never receive the ACK
- even after re-sending three times
- you call usb_clear_halt() and queue the same packet again
- the device may accept the packet twice

The recommended solution is to query the device by class-defined means
to determine whether it has received the apparently lost packet or not,
or to put it into some known and desired state. Common problem: nobody
knows how to do that with given device.

(And the same could happen in IN direction if you usb_clear_halt() after
a successful transfer, but drivers are unlikely to do that).

> > Your conceptual mistake is seeing the recovery from stall
> > as an indivisible process. It is not, as it has two parts.
> > Once your port is in a stall, you should send the feature
> > request to unblock the halt. There is no reason to cancel the
> > feature request if you close a port. You just need to refrain
> > from resubmitting the read URB.  
> 
> That makes sense. I'll try to fix that for v3.

Yes, if you are going there, just clear the halt and reset everything
unconditionally. Then the pipe will be ready for new transfers.

One note about rate limiting: it would perhaps make sense to perform
the first attempt ASAP and only slow down for retries. But arguably
anything at all is better than just giving up like now.

Regards,
Michal
