Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E634EF12E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894701; cv=pass; b=MbthQ2P6aTD1EA6V936WyqxDUOSuusOphu4Qfw9YjdDsf0MjYqsxaigQQrxVzWEzISuxgHOhgfMDz19ihsPus0qwTNIsJgKLxTeJ8q2MkRz+ZMBXKfbLpaW0zU6L8XaLBIReUJIVhT85s2GiM6fhgQ/9TmGbAOZZuCg9E7uG1Fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894701; c=relaxed/simple;
	bh=bQuvyd+lLMLpP+/naLydRfyvKQ0tICbP+2oXkYg2JWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D31vZ7aL1wi5jZ5oIW0A1IHthgvjhToZjNlz7Y1oMyYIclSUddxURJ6GnwAocCFdsEcvMEDlRiR+RTHEbtI3jIsU5xiW48pK4GG80CmxpYPAz6Q5ke1aGtBnmyOlw3vqR7/UvChL3TQGlKXEoX+st4e322ApZfGNiFkE+qdUi4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=rMGIzNtm; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="rMGIzNtm"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-676858d42f8so2170374d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791894698; cv=none;
        d=google.com; s=arc-20260327;
        b=ZwZ2FEwEr+4HcAbZCE1Lvp8/RB1lUNgTgfjrNOa8zl+mKCRmuJ6NmcF97yGZTzSXgH
         4V5cCl/fn3J6wwvK5TLS8iLsIeiC3o+EATtsSkP/tIK9rL5OxDEXzfN2fop1kK3IXu9V
         4XwfArVGzk6UupGYQjS1BOgBKz+XERVhK3No8yc3qJwDnmsygJkNeH4OhC7rfw6PWnkE
         0BqZTjPpnAD+vNWKjFIv8O7lT+0EQsfApm/s43JuKLznraiwXPBQ9ROfFqsGO52+6wS2
         uM92IqNNeiDk04OqG++r7hpovv1PAaqNVRZYnsTirR267bg2Me+MhFgqX5Rf1vKrH+Yk
         8RiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bQuvyd+lLMLpP+/naLydRfyvKQ0tICbP+2oXkYg2JWE=;
        fh=v8thuijo6OkD88gLNIiSAcq3VoAW7cl1gI+M17qq+yo=;
        b=HYzoUu450h/vIQ4RKRPxBzOrTxBu7rXKK+qKPLKXjWkRIhSs2KdHnj0neQpouqEV+W
         s6F8cb1Ka2o/oDisd1NNNFoSPttovVlxT0g5Sev+hnKaYmUQZ9X0uOsce3A+9wi1s/oe
         L30D48VoFbuyPl87a3MknDwnkoRHE7Rvjxtp70W8kMhlmVTwHq/fJHnq2H3njNd07ccs
         2z4Q/ssZZxsqFJkviinAgvwUBe7hCznqExq/rm7wYqugk8hhuRK1DE+g2IONb6bgG+Jv
         Kwia6NrggLPp0TpG4kNdz1v+Dfb5DGoyS3vlp+yzLbHlV9z/MCEq37eazdkwxZ6wRq2Y
         NVuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1791894698; x=1792499498; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bQuvyd+lLMLpP+/naLydRfyvKQ0tICbP+2oXkYg2JWE=;
        b=rMGIzNtmZ2LTP4fb+HRn7UnXWzwpEnMhQ83qiWXYn4CN/oEBf8B5Np3sMm98DEy2qb
         ftdZAMfGP4YjCTeVCvJIfOgolt4iXYJtaH/x0+cSIHZLt+yhdVS56BecrrP+Z6YQ7Cts
         KHF0AJOavpzubN5VRn+z3pjQpZB6k4o8grKu0n6LrlPOHC6TFCIjH8Jc+WwGVQz3OdZ3
         d4abxQdpX7+Og2N1FRS0MHgcYbmO7G9OPyQxd7+nZSTVIJOzT06kKGu1kmKLDtZbp8Lr
         hXcwF1HJaPcb+WuiUAVuZ50Iz6xr7FQyGyiTCRw0/JCbeJYKtfR7O9gNMHsVB+TMi5w9
         BWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894698; x=1792499498;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bQuvyd+lLMLpP+/naLydRfyvKQ0tICbP+2oXkYg2JWE=;
        b=jC+h6cq0j7Q5ekBHoE0TFlA+ZLkrj8OBPR3WR+SIlO7o412Q6pKx3KFRWqcDNaSoGv
         dH7sojAZY9Bdl1fG6vyKYXeLi2tZAjOPDMkRRVY7xNS1VL4DQAI+tfUtpNW/nwwoIItc
         75/eQ98mh7KJcaUqWw0NR4XPKdfue03/ldKPFcrZPzJfD+I53fCbrTAXvnzghdo0yDLE
         4M9dwh7yKWFYL3E36hP3/zzV+jR1ITOp6/wTZTdCs8zrwOE9ouV+RfpdF2+6BiBzIlC7
         fNGxOlOa1zPIwZjIMW07UMzy6wZkx0Rs+/dYy/HWxznMW38WPJte977Mkpv/wEsTzlAb
         vNiw==
X-Forwarded-Encrypted: i=1; AKwUvBz0+PM7Y+OD2BrjGs7f2Q3WNnuf+7VFUlsfaGn1S23jNyA//UXE5jrdZH4qOA8UFExIIno8/gq/0qKkbnE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkP6uexg7qIiFf8jYNFjc6kO4hws95nNOIlMl/zG8uRFdMXkDp
	VTWNIOxHuE0YtSwFJeIs0gs4PEd2Yy/u3FrCE7g3lgaKArdxv1WpP/GUVIhhPTdI0iVOANfl20A
	k8uq7LtoM/5+lRcbGc20z1ldymFt/RJMf836CMhN4B6mUacA+9Lm2kY4rn44=
X-Gm-Gg: AYBFou3DbCvbKZIPdLH/k1qaS0kK+VZJvVwB3NGLphZU/g7M/iJLvG4KSB++w/X/SHR
	TKaYGCsIHKsZFPBE+G1A3hM6trhO79EpjAkXSIkqSxwkcLE5HJVsHbaeh1FGmCat8H6Xq7sgHtY
	xETZ69/P0+72K3M5pFRXweHYySnG4aexbgFwl/upSnNxuuqjp3JEjG3I5OGp+Qwm7CSeDoIhk5b
	c3GWUvUu+wVyihpPI2Wxb2f7BX5EjE+S+zTECM2OvdPh6ZOMsgQriOnHuYXbJimIDE+j8ONXzIo
	q5foO57Nkrw9UBKVq7FNxnO/ZVuLGVZgwIpCfCz2O+VmckhHyv1bOrcryeZXE3nynA4kqKhzc+e
	/1c96mLvA2pM=
X-Received: by 2002:a05:690e:1c1c:b0:676:85ca:71a0 with SMTP id
 956f58d0204a3-67936297c42mr4229864d50.112.1791894698388; Tue, 13 Oct 2026
 05:31:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783352430.git.sean@starlabs.systems> <7acac70a471452a6ccf23b7ccc557f3c3861e0ad.1783352430.git.sean@starlabs.systems>
 <20261005103011.03175826.michal.pecio@gmail.com> <CABtds-3t+ECCPeFShq__iNa9niRAge=WOED4cHtNZAFVw6kPzw@mail.gmail.com>
 <20261013142737.7b10a5b0.michal.pecio@gmail.com>
In-Reply-To: <20261013142737.7b10a5b0.michal.pecio@gmail.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Tue, 13 Oct 2026 13:31:26 +0100
X-Gm-Features: AclHuK-gfZVil9yXDIcZhUFuimzZc6z2C6fJBrCjyXvykiGCNcXOlXVVejAHGvM
Message-ID: <CABtds-0s8Co-qWk0xm=R1pdz3JyV_GyaiwYzgxS9g2tFwtHRzg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] misc: rtsx_usb: avoid USB I/O in runtime autosuspend
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ricky Wu <ricky_wu@realtek.com>, 
	Lee Jones <lee@kernel.org>, Roger Tseng <rogerable@realtek.com>, 
	Dan Carpenter <error27@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I have a card reader with RTS5178 and a simple SD slot, no tray.

Thanks, but what is that attached to? i.e. Arrow Lake

On Tue, 13 Oct 2026 at 13:27, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> On Mon, 12 Oct 2026 22:34:14 +0100, Sean Rhodes wrote:
> > > How is the driver supposed to detect card insertion after the last
> > > poll but before the reader goes to suspend and can issue remote
> > > wakeup?
> >
> > The reader uses remote wake; what hardware are you testing on?
>
> I have a card reader with RTS5178 and a simple SD slot, no tray.
>
> Remote wake doesn't work when the reader is not suspended, so before
> suspending we used to check one last time that no new card has been
> inserted. This made sense.
>
> Any delay between the last time the reader is polled (by anyone, for
> any reason) and actually placed in suspend is a time when a new card
> can be inserted and completely undetected, forever.
>
> Regards,
> Michal
