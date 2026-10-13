Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7021539061C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895823; cv=pass; b=cTOsfw4CGtlkl3/CQmtB5AtNkgGfD2G1nG+/80ytLmtSo5UsSH9qY6oeSAAWUkmlYrEnYsU/sDjF568yZ1jCbSKcylveQw/QdrLWOb1mwS96TBongxWUK4Kk/d2wbpddIxu9yl5JNi0iNQ5imdE81RrjrLl+k7WJodcZWSaB4PM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895823; c=relaxed/simple;
	bh=y10B+5McX5GFmcHXrzd/IPUq3EhrQHTcQsvRx7nvMcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FSreBrKKuHUpqCj8uKpD/mhmCVbIyGR7uE1DTrjEX04fqMsWnCrLF5aZRmod1jPVoCyEm8AQdKHS/Eht7B6Y3vjjfh3VhyOpx0J/mL2rW1UoKaE7x+6c498zgt4X85H0spjmHCUwytWbWkl1ZUdoIa4fTT6II+QxP4sQ/zK8Q5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COPa1bxV; arc=pass smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COPa1bxV"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4d198f1a591so1430134b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791895821; cv=none;
        d=google.com; s=arc-20260327;
        b=ORk3bD0f19otXMf67Ua5bX6BqFYvpsUbU2sMb57X0mhqkSeWQyhdFYvWR7RwxdtKSW
         UXSxQrzBWeIgwHtpTaqxf0JA4KYkAU0iNPsvP8QWCFf8fs+IdXjGeuQmXXAG73Ua36tT
         Gbrkw6HB//SrTigs0aweENIfCcVqD2OHU8QkQc5n1941mrS+vMDqGVGCFQYZQFPtvPuF
         eOYD+vyg7zj78tGGAFxnX4U/JIYT0WPv9EppRI1oFaE8YYLsQPK9hPpkKA43QBD8F/J9
         yw/B6kYmFnqAdruFsizqeZK+IMIw8FwWNfB/ebkh7ZrnJz/gEcGV/QHqCJMNwUNj7w4D
         1BOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qPCIf3nqJm+mvruponLSllUxXEgyCZu14V4IgZlQmf4=;
        fh=beat3ho2ctEDLuCJYFcSOZ9+bKJnTqK+2Flc4VspY7A=;
        b=F88QcSlZ6AJ/IT0CrMkW26jGyjSPqT8SaiDtQotkvXgOSZWrlAFsLjaVHIUsd30RSs
         0+s8I8MINFdfyI9kgMC8xFq2w0RMDdUMSiVADpiLETFNvcyTCnmjeQdtyVV6YdAvyx9k
         uPmtTK7cy7ma/l3NcQfYIr+gcCbdUvIDzYhX4QzZ5m0zSFjOg367fU8Bn8ZKdJg5pRfO
         75415a9GiD4yedX0gF3OkArILkfvdSgEOy7Kg94FP6FsquKL/33JYrZfISAQNc1YHzJm
         7F/WKSskA4/pvVnY9DPtEZoRvY3f6Yj6bm53fDgMM+6+/VXonQh4vfMmEcRm25LDaImL
         MaRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895821; x=1792500621; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPCIf3nqJm+mvruponLSllUxXEgyCZu14V4IgZlQmf4=;
        b=COPa1bxVDjjxD5Cx3VNptw3iCvHFxY7xkWm6HOUxvMvxKoKKD8TvWqmRIU6W6tR91W
         IrdcjnyNYXtsoQjX4nqoCQKbQ4YKGH9j5iNzIRtwIf39codNnPxBfEowkyWz6PfGSzrX
         NWitb5EcEA6Qza62vJR+7M5aWXUjYrOFHP9kEV4R0fYZTnCeBdW9+ATi81ANA2Ujf0kL
         tGr8KC+5+tQfSl2myNYVlKj6+MmGiHmfg1e7n8XHXVHtKHHOfvbQbKMx7k4SrnOCol0/
         fMwk9UJmCwjbGmrT7fx7k3cAcnGxDy3oOZuSOJb3d5DHR0+3hfZQ2xHw2M/ynY9gtHip
         Qsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895821; x=1792500621;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qPCIf3nqJm+mvruponLSllUxXEgyCZu14V4IgZlQmf4=;
        b=U1uAVd/RFGW9mkicZkkuhigCBQXdIo5D+wSYyBKRolU+32MAWh8l6462jfIR942S3D
         rndKgeMu2MFbT2Yrj1CPxp5nMP2WdGPboXzPZZ+/xJDpdXggeALiDavarFfjW89cpk0H
         dfJfIJY21MPPG2sFF9seoLFN0Wg8TzM0lOIC7TJuQvDL9qXRYKtz0ftAZSP0UNXUqUDE
         CB6xN3C1qJe6qaa6tXq6dzQoavGqHaLcw7e4Ni9p1u4Jn4KGv9krvEtwulHMOi8mqajB
         UunUIpV0fd4tabqU5T87sBt/fP8wL0C/dVTBpILrbIhg3lfzvPxuedo5V/VCDcgPoGEb
         4Iwg==
X-Forwarded-Encrypted: i=1; AKwUvBxQqfT70/rkGteFB4XMLKuB7nRxemW8Hsqbk8gb4fd8THjiN3r4wotD6ls/04wncShmtcsL2rHCD+6ffWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeD8OuEybTk/5PYJCLpXsF52RmMi6Pe8PCvDTscUcdCRN+JWzR
	F/ZYNmwf//qLxik/yu8C5amiMz/hbwzkZweRq6jV26gGIO+Aw9MWV543bXJq8194QV53ICsoHyQ
	5xaf1HvOtn7Gr4u+47ChUJB59Iz1RXew=
X-Gm-Gg: AYBFou3es1CixdNKSHZMHz8SFJ+CIO4tSOpakDrGYpH5E44Ht5669kqT4z3qCnEYm6j
	alg3nYl/bNsXvQJXAg0BMreT71S6VIeGnreNjz9GnFn9BtG5tEJIV7jp3xnbtVYUaqkr8j+tDLt
	iYZmsOvbMPR6slh/8yimWti387JaPzZf8o7J5NNjEDHQF4t/mOcpgdIeaPMpSAKkJ2aJARYc7ew
	YeeaKYzP+6D2sgRbB7MGlBFqEvjXC0SfneSuiAYhP58Ep091+vfYj9tIHzcv02XhpIyv+hTytg0
	iTyoG60VbXsinZX5Teu6JAjmoH1AZjRj2znjMYzfK0iSHg7rt+6g1e6p2IeJJzv+VjQkuMmkQbD
	024AuPPSrEPAWkQ==
X-Received: by 2002:a05:6808:1b97:b0:4f3:e98f:fa0b with SMTP id
 5614622812f47-50c556bc9d7mr12282169b6e.5.1791895821283; Tue, 13 Oct 2026
 05:50:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012133728.77780-1-hjf3108@gmail.com> <20261013102305.GA58849@wp.pl>
In-Reply-To: <20261013102305.GA58849@wp.pl>
From: Jie Feng <hjf3108@gmail.com>
Date: Tue, 13 Oct 2026 20:49:44 +0800
X-Gm-Features: AclHuK8P-GSOHZTU-eaZSfu6_V1anWwiWDqTC8h6Cz6QgDTAn6y4yoPgEyKi0Nk
Message-ID: <CABOQOSU8KHVUrSc+qkCrpGK9zDBc3dNRqaRWKQ7ka=S6uLLbQA@mail.gmail.com>
Subject: Re: [RFC PATCH] wifi: rt2x00: use VCO_IC 0x2 for RF3053 on 2.4 GHz
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 18:23, Stanislaw Gruszka <stf_xl@wp.pl> wrote:
>
> Hi
>
> On Mon, Oct 12, 2026 at 09:37:27PM +0800, Ho Jie Feng wrote:
> > Using the 0x1, the VCO calibration result is 0x7f on channels 6
> > and below. Using 0x2 fixes it.
> >
> > Hardware: Netgear WNDA4100 (USB 0846:9013, RT3593 rev 0402, RF3053)
> >
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > ---
> > RFC for this since I am not sure if it is a generic fix, since the
> > vendor driver also doesn't use VCO_IC=0x2.
> > Is this also a known issue?
>
> Could you elaborate what is the issue and what you mean by
> "VCO calibration result is 0x7f" ?'
I had accidentally left the description out, sorry about that.

The adapter doesn't work on the lower channels in 2.4GHz,
channels 8 and below. This looked like an issue with
the PLL or something after debugging.

By tuning to channels 1-12 and using the debugfs to dump the
RFCSR registers, RFCSR4 is always 0x7f on the failing channels
consistently. Since there is code to switch RFCSR6 based on
channel, I tried the same as the 5GHz code to switch RFCSR6=0x2
for lower channels and it worked on all the channels surprisingly.

Due to the behaviour of RFCSR4, I think it is a VCO calibration
result since it seems to change after enabling the calibration.

I could not find any mention of this issue elsewhere, and suspect
either this hardware has very few Linux users or my hardware
is special in some way, so I can't guarantee that setting
it to 0x2 will work with another device even if it is the
same WNDA4100 model and chipset, so some testing would
be appreciated.

> Regards
> Stanislaw
>
> > Testing on different hardware would be appreciated.
> >
> >  drivers/net/wireless/ralink/rt2x00/rt2800lib.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> > index 2e2e382b62475..4a44a0222210d 100644
> > --- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> > +++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> > @@ -2979,7 +2979,7 @@ static void rt2800_config_channel_rf3053(struct rt2x00_dev *rt2x00dev,
> >
> >       rfcsr = rt2800_rfcsr_read(rt2x00dev, 6);
> >       if (rf->channel >= 1 && rf->channel <= 14)
> > -             rt2x00_set_field8(&rfcsr, RFCSR6_VCO_IC, 1);
> > +             rt2x00_set_field8(&rfcsr, RFCSR6_VCO_IC, 2);
> >       else if (rf->channel >= 36 && rf->channel <= 64)
> >               rt2x00_set_field8(&rfcsr, RFCSR6_VCO_IC, 2);
> >       else if (rf->channel >= 100 && rf->channel <= 128)
> >
> > base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
> > --
> > 2.55.0
> >
