Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D8E3F20EC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790853478; cv=none; b=dq6coV/z0QJQAefN76rw9UmvJXeABLLgKjqhzRRQ00i/sCtLxTHG1350ueJgxsxa+NcZifzmYTahQtJJFQBgA9qWrUJ+AYGm044Pf1uSnc5Ol9IPTKIEPUK0F8+FduVlK8NA9dwBNtdgK++Rt/YbnyXtTFwB8S/GQiC9P0qfAAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790853478; c=relaxed/simple;
	bh=IVjGiVYslexfxMICXy6eISfMJ5kmnGVdCXms6l5qJKM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I1YUvQReTN441hBhtL69WVUbfI4zdG0UOUM798A4ZjbE5XyPUnjltzzOwMhcb7WY8rwB87YpZoyoYCSQATc9dhxeO0SW5336qCVDcEpjNpuKbp2Uj0LwEnYrVf0H9D537hOAv4xBnOmeTFi98G+q7Vs2gIdRXFbWOKXdIcjJxgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bz9Z9V/3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BfiOt4GQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bz9Z9V/3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BfiOt4GQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790853476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6XQ0LxDigeeaZqBMssbCnY6iBpDsmsz0VQ1JYSkHCwo=;
	b=bz9Z9V/3rY9hrfYg0RGJ2GYm5wv9Woeyv5XAMglizXR95FuuD3tNNADLJfoO1FwJj24n0z
	Q1ZDHGSENkvXr/L+fTcHNcix3lJ1Hd44hegOH2Z8OrzkbgmDZAeck2EmlZQqC8Bsr9/kc1
	l6FBpL3A2xp884s9V4NBPWeNDCTqsrw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-syTpRgHVOXGFRcEP-cGBpA-1; Thu, 01 Oct 2026 07:17:52 -0400
X-MC-Unique: syTpRgHVOXGFRcEP-cGBpA-1
X-Mimecast-MFC-AGG-ID: syTpRgHVOXGFRcEP-cGBpA_1790853472
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48b026b8133so1132323f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790853471; x=1791458271; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6XQ0LxDigeeaZqBMssbCnY6iBpDsmsz0VQ1JYSkHCwo=;
        b=BfiOt4GQmvR8FGuzCR1flNnNymlZPWMxYYqHsKxXGYt+Y48iJ6HqbFbNIj9qk+QcEQ
         UB4luNEPiU4TRSg4NVU0lqZk3yy7m0+te7djL3UAXYxQ3WLUbvlT/otQqZVL9hJ4Sh+i
         tFGpsrbVQq7Hf5xqCorOOR/WHDiVLZJ5KvYFbG8OXSB/W0WdOErP1zotCLBW6/0cMYoa
         I4HpuhJMj6ZQ7Lw88R1XIRYFiPA3tXqMdONs6NtvEGZvwtPNGMEFN1B6m27sklbiOKnK
         P6KQ1V9EtK/ve5DDeLB071A6iX4+4+YFGJvn3UxEO8FUQwZUxNa95T+hzf8VeLNnIRAV
         p2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790853471; x=1791458271;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6XQ0LxDigeeaZqBMssbCnY6iBpDsmsz0VQ1JYSkHCwo=;
        b=UjtfhEt3UnZ+mmxT4PXHAtVrHjMglAyhZ865bBevOkCCY6+uzqkvWjj16Ixq9OtJbu
         P1c3VLD4E85r1y1TN5n3JAKB/mopu/kVGGWdEMPg2s4jytNNCf+64NrW1umz5/PYj66s
         ps4HWLUAXGur6LW7IvLEjufFbND6f+GhndlC2hblF/yPdGQNj8PHzATNdxgB5aJ3d2bV
         K4rOmjfX3eYi3e4u1+4HiZhk5/PFL7NDuoij8ZMMcAWoarbZkhdHsMYCJIZ8M0GJKUEu
         f7+3Jy//N8cmPSlwn5TZ9EgBKT1u6nfesODwb1D3kF5ftCuSTGDGbetTmFUpR1s5McfC
         LSkg==
X-Forwarded-Encrypted: i=1; AKwUvBxEiCl08Ap4YR68sexZfHmI3j45cT0wYcDhcQP9N48cmarMuHw2d0cXxssku4+UkXOnAflYy3xKfj46wGE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKG0fMWyrlbxQkN6TupH/yGULZH1jymYHIKOPocLczDiORm95OQ
	ZTpPN29MRi3QD+Ea7YiF31cCZCpzWXW8ERzSHEurPyNZlAl+7NfDlUQ7Ud5A+zrGx8OYgy+c+j+
	UAGMeCGbQOFh+rXWQg1UxWA6PJEsqerS1/1NjqEVnLsHRTdo8KVzYYfPlZDf44KtQNQ==
X-Gm-Gg: AYBFou1LS7Msx3P2GGBzWRgFsnEjc9v2VfQOBKoAeGfUki7P0diJp175qpVtKH50tBt
	xO6DMm2P+pHAtXW2yZ+2+QmlplVY1A52lsdWMNGw4CJCT+7HqfTolY5nt2ThiSsM4x7iiwpuaPi
	YDTLqgPAJoErVmm1itxflgvD7dagcuUyl86Zll95tlKmx1pQoHLFlUXRqur9Jr+4C5vC0Y2aPVT
	+nS5AkMO5ejXP0hTAacfz8e6Cfbnnquf9TCh0+Y3Pg2/7F3d0miY3GW43KclULeE4QEMXXBsPFG
	HTgzQUEBRXxywRc5K+r43YjKYbldKNfp3nvvVk9uB0KRE1T1+xD5J39hQDQUeGxxjybPA/NyJ/N
	kLEo7e9Ao3PPMUeSxtsYdANlCbnA=
X-Received: by 2002:a05:6000:4024:b0:48a:f8dc:ae14 with SMTP id ffacd0b85a97d-48b0245a3b1mr9283425f8f.2.1790853471596;
        Thu, 01 Oct 2026 04:17:51 -0700 (PDT)
X-Received: by 2002:a05:6000:4024:b0:48a:f8dc:ae14 with SMTP id ffacd0b85a97d-48b0245a3b1mr9283388f8f.2.1790853471205;
        Thu, 01 Oct 2026 04:17:51 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068bd8c9sm5587597f8f.2.2026.10.01.04.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:17:50 -0700 (PDT)
Message-ID: <e91ee6fcd36a6ae4616fbd61121b2354594099f9.camel@redhat.com>
Subject: Re: [PATCH] rv/rtapp/wakeup: Use "rv_this" the rv_monitor variable
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, John
 Ogness	 <john.ogness@linutronix.de>
Cc: stable@vger.kernel.org
Date: Thu, 01 Oct 2026 13:17:49 +0200
In-Reply-To: <e6f78faca93f92981130621d712ac05374d83b05.camel@redhat.com>
References: <20261001044218.3508990-1-namcao@linutronix.de>
	 <e6f78faca93f92981130621d712ac05374d83b05.camel@redhat.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-10-01 at 08:31 +0200, Gabriele Monaco wrote:
> On Thu, 2026-10-01 at 06:42 +0200, Nam Cao wrote:
> > Commit d9e4c61a12dd ("rv: Use generic rv_this for the rv_monitor
> > variable in LTL") renamed the rv_monitor variable to rv_this. But
> > rtapp/wakeup monitor was late to the party and missed that.
> >=20
> > So for this monitor, rv_this is an empty struct. The reactor fails to
> > work, because rv_react() checks monitor->react and sees NULL.
> >=20
> > Correct to "rv_this" and make the reactor work again.
> >=20
> > Signed-off-by: Nam Cao <namcao@linutronix.de>

d9e4c61a12dd was introduced in the same pull request but after introducing =
the
wakeup monitor.
So for me that's the commit that is "broken" (should have accounted for wak=
eup):

Fixes: d9e4c61a12dd ("rv: Use generic rv_this for the rv_monitor variable i=
n
LTL")

>=20
> Damn.. Thanks for noticing!
>=20
> That's a weird one, I cannot think of a way to only declare the rv_this, =
so
> the
> compiler is perfectly happy to give you the empty one..
>=20
> I'm taking this, but I believe it deserves the Fixes tag. What do you thi=
nk?
>=20
> Thanks,
> Gabriele
>=20
> > ---
> > =C2=A0kernel/trace/rv/monitors/wakeup/wakeup.c | 6 +++---
> > =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/kernel/trace/rv/monitors/wakeup/wakeup.c
> > b/kernel/trace/rv/monitors/wakeup/wakeup.c
> > index 01b47416f24e..2e803e79181e 100644
> > --- a/kernel/trace/rv/monitors/wakeup/wakeup.c
> > +++ b/kernel/trace/rv/monitors/wakeup/wakeup.c
> > @@ -128,7 +128,7 @@ static void disable_wakeup(void)
> > =C2=A0	ltl_monitor_destroy();
> > =C2=A0}
> > =C2=A0
> > -static struct rv_monitor rv_wakeup =3D {
> > +static struct rv_monitor rv_this =3D {
> > =C2=A0	.name =3D "wakeup",
> > =C2=A0	.description =3D "Monitor that real-time tasks are not woken by
> > lower-
> > priority tasks",
> > =C2=A0	.enable =3D enable_wakeup,
> > @@ -137,12 +137,12 @@ static struct rv_monitor rv_wakeup =3D {
> > =C2=A0
> > =C2=A0static int __init register_wakeup(void)
> > =C2=A0{
> > -	return rv_register_monitor(&rv_wakeup, &rv_rtapp);
> > +	return rv_register_monitor(&rv_this, &rv_rtapp);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void __exit unregister_wakeup(void)
> > =C2=A0{
> > -	rv_unregister_monitor(&rv_wakeup);
> > +	rv_unregister_monitor(&rv_this);
> > =C2=A0}
> > =C2=A0
> > =C2=A0module_init(register_wakeup);

