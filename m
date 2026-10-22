Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792654443;
	b=RQER1o508lKeH5VkhQCMmhJGar5rMbc4J27hI6YEn4FsiF+w1FlJkqcLoCZBG48L+JzN
	 3OUqOIloM1EDHhr/F4+ftUkB3TIUeY57ixKE0MEKdhuonX7fR28zsG0bxIN8d9d+/n/Ma
	 T+5Kkb/Uw8coVekLw0fRsfzL9bCe/hb2dtSjmBFkQAq1QlkhALjrr5vhQOuHsm6D/pSqR
	 dLfnKOO9a/p6Xb91zLPlNIrWH45d9PdbCsT18xiPNselRjLp1jNgKCsXrRH70pciYqir6
	 iW0VBoLZCIkAYETxdvUZzBz2y9WSk92TNjFs3sKzB42KmnnOQHhxLey3XCkmyndFqTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654443;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=BcAf1J/2lrij2CTltQkfDHr8Waxgr+ILRHzLs1xcgNM=;
	b=YbKkYVbQlyKPFbdEV/Wztn3hbOCO5guc+PpNrbXXP65PNTtbIVW6Lx3/mrva/s8X9Vvw
	 L2bsHdElug+fb5GTPKsqvipIKSRbuN6TzkGFNDCrKWOMhAHmjSdQh8R/IMmU74hky4OPK
	 ini5nvFnRlvyC0eBIENOoi7goz/B6HYduiFiVV4jYncxqI9xYZFosWNgrQS37hmWyP2GQ
	 ArNlyUO0C6IMT8yTF+CzLjuLzdvisDj67wRoSxt8w35v9bofEw2iGPKssGFhoe2y6bhWS
	 1/Sac2M7QXXC099LwH0Mlnv+bFN1lNq6T2TqHAQhLdXvDru8lBy1PT0weMc6wELxKww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=clg1p9pc;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IvQzt39S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5EA606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B5EA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=clg1p9pc;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IvQzt39S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792654442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BcAf1J/2lrij2CTltQkfDHr8Waxgr+ILRHzLs1xcgNM=;
	b=clg1p9pc0wIM7rO49uIB4aIKxK9egJSuSEAF4Oo2Nxf2l+HOwAnmhzNMoNt2jd61WzEo4H
	+o/1IkqLB91JfWXzasjP4fDc1YFCtFS+DCHY0cLTxnCh/wrZImDSxfFQ4R/mLZ4Zc38qKZ
	S2dAMJleQkVBI+JeCHvfoyiGMGxTagI=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-sTtL2d2zO2WArAmCMzCgcQ-1; Thu, 22 Oct 2026 07:34:00 +0000
X-MC-Unique: sTtL2d2zO2WArAmCMzCgcQ-1
X-Mimecast-MFC-AGG-ID: sTtL2d2zO2WArAmCMzCgcQ_1792654440
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-679a2297c50so1727967d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792654440; cv=none;
        d=google.com; s=arc-20260327;
        b=LLdD4O67UCc4F6I22vHTUNG5hkeVxkP5puwGqt3K0lgL5EzmqnCeULLLy+elI9JF2U
         sZlRW3RzSl+u8IaK1snJpSWFcMOSvx/oUZFKTFLhpPEDKJZospT3XJR/LAfE6Viww7rI
         k0ItLu/5xaAz0pc6mdZm74zzN9IQamcIbMlT1928ujeZP9TvxbFNu08f0JMEo1iBOQqP
         hW8mEUfplCV7r/NXEPtVWtOUh3JoZXVirIlHyRChgaXRC4K+qGMtc5Y6bjiu2hODso30
         rBnEwNsN4zCU0KiLPUU9W1zvlKxUTHexdBXdh+pWjikzYNQpt1BDdFisxVlZBoAmpGch
         teRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BcAf1J/2lrij2CTltQkfDHr8Waxgr+ILRHzLs1xcgNM=;
        fh=2GHeRD8s0YpRWQNscSrCap7J+ETmVuSZ0ots7GR5H30=;
        b=kTUDsPW0UwJGdLi2wiUHok6awlu6UcPBTiVU8+z4+ZD8g69Ft/HKULnN+pJVPKw7lq
         cBaicWVGN3D13NAHQuVsXFDFqmJNIWd8YhoFJqBt9ED/lGTTVvrMUtuOQ9YudBF8NlEO
         9ovoUj7lJh5tfwvsr4JBHRJTeRXSf103kp4pZZRQ5CMeiARcLwIg6cxlfJiB/b6GrHaj
         61ohSDA/7IHxEWv7MVxremlnZVhYk1vs1TsJl2NifGqIQtCn+IsAfi6yyfvflLbFXjSC
         g5+JHvHmxb7QEI0kgQIeuB0HGBuvDzjgb5ZwpJz42wUwgSS7HTH6Dvwl5Ig/onQj1acl
         d32A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792654440; x=1793259240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BcAf1J/2lrij2CTltQkfDHr8Waxgr+ILRHzLs1xcgNM=;
        b=IvQzt39S1T35lapZVZmpq2kydUoR2do2RmsqrgtDvU/v1xA+oz2nUZ5Zh7xGR8Mpuy
         GW9TnqAscnBCVBlSofhuMbFtk8ipqBRP68WI3lWf9XqGTxuzVw7twbs0wMzNGBcYAMuv
         Hqv4R9HTNMJrtLExUm5mhpKxUGGCASBQtqpUDAkQu0zaxMrwAFycDw9I+0ApW2GRYP3r
         XbtEL21RcgIQ4V7WmHPxkWGyjvzF1wIH7ytoW6xMywzGZdRz8ZCRJ/h1hVrterL7QOVb
         evxs9cPwjaPPPL3czrDv74WQ0CZxfGEbO/HhTG1N+6ELxuko818Z5oMjYHQ/HSqgClcE
         R0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792654440; x=1793259240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BcAf1J/2lrij2CTltQkfDHr8Waxgr+ILRHzLs1xcgNM=;
        b=bGbTNxF7czMcz59TOWP3z09Qli8qS4dRX6K3qLhrHp+jppH/OVjmC2/LzlkolAZD/S
         Z7XRyMWc1SLAnWZgDGK8s60i6Rm1WqwmMjt/BDDAo/scLukLRupF8XAhwTRQRkjDH3vf
         0ICWPY3Ya9Uo4gkZW8A9b3k/2Riaq0rwIP0KF/W7EV/M81n9IppP40iNdxEwj9w8y24h
         TwWUa3JXxkKR28U5ByuPi/tj62LMiQHKRxhGUG1ppSF59bN9O0oLVdfgY04PbO4e5Ufr
         Mgls1mqDOZ+2/wtleO3M7VqB6Tt312QGVKvG0lzzrGCutbqhcp7zBBk+lFxfa6/Y62M0
         /0CQ==
X-Forwarded-Encrypted: i=1; AKwUvBykbEWem62HY6Tk5T9m40xjayVpOAF6+6OxebDc5om5SNXtiOqxCOTA8QXEtOg/FUtWJ20hEX/zZeQnkkg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWfhUOr9qAHZpjfZdp8pPTuWpcQQfuYLiSh1iQLDNHl+vIk6aA
	RjcUYuC2j+nKlbT6Cx3ewRfrq/aOuVNDnmFqRBKA2pb3TWtQw4Aq6aqwQA7u95KWYUd6uOSNhuM
	q+xaT515mDKMtPy1lACJ8sbVnjIT6xEonPGEpXsA48IB3aYOUNNVguMyIpJPQow3V+RPxwzwryS
	Q8a8Niut24SF1DAY3GWGDfjKzw8RTxDlTuiKKHnVnq
X-Gm-Gg: AYBFou1IUKQremmntGXrsGGwSerB2DAQmTilqxj27K++0yz8k8Tp4ARl6FuYzdz7IIb
	lcUPqM+NRjXie9YJ46wbb8ty7jYwr9ss887rJ15NqA4TYi252hEa7GRpT2K2kKd4faF+jodtd1/
	EXUUXzf3EBqTlPoohmqhVwGG/S3qfp/kjIAx9RLct61jmNox+Qxdwzng==
X-Received: by 2002:a53:ce83:0:b0:679:91c8:8366 with SMTP id 956f58d0204a3-67a0e5c7963mr1269261d50.108.1792654440111;
        Thu, 22 Oct 2026 00:34:00 -0700 (PDT)
X-Received: by 2002:a53:ce83:0:b0:679:91c8:8366 with SMTP id
 956f58d0204a3-67a0e5c7963mr1269250d50.108.1792654439461; Thu, 22 Oct 2026
 00:33:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260924-port-smem-v3-0-fbc2ea81a654@redhat.com>
 <20260924-port-smem-v3-1-fbc2ea81a654@redhat.com> <2c748a4d-b416-4f33-a6c7-195ccda6a5ee@oss.qualcomm.com>
In-Reply-To: <2c748a4d-b416-4f33-a6c7-195ccda6a5ee@oss.qualcomm.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 22 Oct 2026 09:33:46 +0200
X-Gm-Features: AclHuK9ZBhHeOzYstu_mP2ikq1hvzgJLewdIlmjd_fnmryXddeOSGKMDVXUUqwY
Message-ID: <CADSE00J1ys0c4RJgAno2U_O8SZuYNV1ZfNcPBM=RsdwoEL_C3g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] soc: qcom: smem: add IN_PARTITION_RANGE helper
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sarannya S <quic_sarannya@oss.qualcomm.com>, 
	Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>, 
	Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 2:23=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/24/26 3:10 PM, Albert Esteve wrote:
> > From: Sarannya S <quic_sarannya@oss.qualcomm.com>
> >
> > Add IN_PARTITION_RANGE() to test that a pointer lies in [start, end]
> > and that pointer + size does not wrap.
> >
> > Signed-off-by: Sarannya S <quic_sarannya@oss.qualcomm.com>
> > Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com=
>
> > Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/soc/qcom/smem.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > index b5e7bd8c1512..6783a3c533f0 100644
> > --- a/drivers/soc/qcom/smem.c
> > +++ b/drivers/soc/qcom/smem.c
> > @@ -2,6 +2,7 @@
> >  /*
> >   * Copyright (c) 2015, Sony Mobile Communications AB.
> >   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >   */
> >
> >  #include <linux/debugfs.h>
> > @@ -88,6 +89,17 @@
> >  /* Processor/host identifier for the global partition */
> >  #define SMEM_GLOBAL_HOST     0xfffe
> >
> > +/* Entry range check
> > + * ptr >=3D start : Checks if ptr is greater than the start of access =
region
> > + * ptr + size >=3D ptr: Check for integer overflow (On 32bit system wh=
ere ptr
> > + * and size are 32bits, ptr + size can wrap around to be a small integ=
er)
> > + * ptr + size <=3D end: Checks if ptr+size is less than the end of acc=
ess region
> > + */
> > +#define IN_PARTITION_RANGE(ptr, size, start, end)            \
> > +     (((void *)(ptr) >=3D (void *)(start)) &&                  \
> > +      (((void *)(ptr) + (size)) >=3D (void *)(ptr)) && \
> > +      (((void *)(ptr) + (size)) <=3D (void *)(end)))
>
> LLM is unhappy about the 32-bit base and suggests this instead:
>
> #define IN_PARTITION_RANGE(ptr, size, start, end)               \
>         ((void *)(ptr) >=3D (void *)(start) &&                    \
>          (void *)(ptr) <=3D (void *)(end) &&                      \
>          (size) <=3D (uintptr_t)(end) - (uintptr_t)(ptr))
>

I see. I will update it in the next version. Thanks.

> Konrad
>

