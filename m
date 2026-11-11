Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794406457;
	b=t6yInFe0LNp9ttxtYwQqLOjyeCOQGwU5yMz2JsTnQzkpfrYcE2Gh5/1+HYSo3VcTXRJZ
	 OC+D81e79vybuWtTnIZc9yNfJEzzg1zCCjc8GuHUeHrgd86hv45IL1QyezGFBbFPma6mS
	 4qBboXZB3CuJv0zLAkbQLf6h2190k92UPuOlIASmru+Ysu5a2EQ5zeQ0JPEHq/r+w1gOL
	 GGD0HH6ykvb+upoitsdY5zum3Ke1y28StUybWCdqi1yb28A69aoIqG2KkWnTI+435UBGq
	 qpVB2/mZOfntn5iGfsmCX0V/DVGF2agVyBbhF9MHe5ZRS/Hcz7IYWlhM8bsgVXlOGxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406457;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=tJEwk0yeQZ5BY0HMxF5cN+S8qbdxO56EHI6uRg64h7U=;
	b=r+lLfHaYCirBndOsuYc7wFUEUkhgjgPAQFNw8qO1RURAu5xI9Z4rdnuAyssp/SJjzkWA
	 NhwgqFZ6u39346ugXBQhla8gUD5HEvrkwKJk0UUvKx0Up/mza9YIFnS2npMjYhtcX3tPj
	 jxhrTKBr1KH8s0d9stxHBAvq7VNou9OHcMkybdpfqDM0GHOITarMaEAXVXBuzUc6ZsJsi
	 gLKVGJ6ivndoR0g6244DqdUuA4o9TV+wj6KVHF5vaLXdy+UjNi6ExIpS2z6ipbkE22qZ3
	 M0MTTjhAb83GbUFIHrJLL4Lrma+5doKac6xSsoarHeDHaFGV2lpblNeU6+wAhkGsisQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L9DIM96a;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=O+Cibhiu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F63B606A88D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F63B606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L9DIM96a;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=O+Cibhiu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794406456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJEwk0yeQZ5BY0HMxF5cN+S8qbdxO56EHI6uRg64h7U=;
	b=L9DIM96ag7eNSQenf9LvhuxDE8Y+okz+V5/UDdgvs0et6BG1+XFbQxh91+b4nbcG5Z7zro
	S3MZw+eRa5CwXGN394jasjX27Ddizuc+bCh/bWIdcCZTQMZGVKWSc9L99LOxyoHfbk5KR0
	XLKinpTkDaKOlVZnTY7RU1QqYKTc0l4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-FsJlDxxvPRm0tXWov_t9RQ-1; Wed, 11 Nov 2026 09:14:14 -0500
X-MC-Unique: FsJlDxxvPRm0tXWov_t9RQ-1
X-Mimecast-MFC-AGG-ID: FsJlDxxvPRm0tXWov_t9RQ_1794406453
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c50547b4992so154058266b.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:14:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794406453; cv=none;
        d=google.com; s=arc-20260327;
        b=ULK6uhuTvhxlZsI233jEKcFtNyZsIaGdN/XATm21wuRFVuOTTKpO/RDH5m6Ejhe7ce
         23sPRx7+4UOs8XGK09TPzIoOauV1Mqmk2j5dAQReCRLIbxOmvol4RjjbN1mLxYYQLzBa
         dHgIr+x5LZquAvI6OW5/hn0QXooczVuVeZ20LPbCG6wJZ+8whoLSb17wQwSa0QMuG2cJ
         bG21u1lnS4SVLs1/fcXPJ6YZhqeXscwdSynNxoPXMINV6xXZbFSg5vntfnyN70UEPFAt
         UmLLmPOkPvLlG5JDfMUtdRXJAyEm2rlnCIpAWzIsNdEg0lSNpYGtM0e3vgmT7WyjI9ps
         PfDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJEwk0yeQZ5BY0HMxF5cN+S8qbdxO56EHI6uRg64h7U=;
        fh=FZ9tQL8rBqhHGLL5+yHFGSR+258IoZUFQu47k++QV9A=;
        b=lf1DMN9rUZTGa4X0Jf+us+99BKBc5o00F8tyjDt10I+Y3zQeFFJ2jm4hiewT/4RMiS
         v/nZn3pWkRGAbeHam2v1icNyiJr1Eqi29obKOXPN/M0xiAK+IUTRE4U+1htz2oXC6k+f
         Kp2jTZCIv/3Bc2f0f0er9OnGDW58y2OHYdJgsBSXXr3NYM+KQrvs7khkHtKizDFcNVRj
         GqwpTWujKJVU0s2/pZ+M4Xmr/+QQ78sP05C6Mc/hxNLVRrrC4+KLEh3OIEJJIm9eQqJU
         OMcGkEWQt/kYiCaudh7Ag+QKslQNTGqr0Ta71DTvvuHDaK+lgvV8vta0IJcfpLisP9bg
         +0hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794406453; x=1795011253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tJEwk0yeQZ5BY0HMxF5cN+S8qbdxO56EHI6uRg64h7U=;
        b=O+CibhiuAUairrUxpqFZ59nnHHKKYUe4X/WfhOlj6LbLJYfuA1x6nPsSxBhYr+t6QM
         tkmz5vsSWUYkGpZWr2xvI00arb3Kf0IJbcJW+gyDjpDgcmUVAzSg25m62Y821uAL9hDw
         jd73R0O5nKUgiBMjAwqxk14gKmiaEqZtIrj/4eeEt9MV/Y+RbonPIzxMVrNfIoPZQQZG
         quUaQItc2xzB51JJVKYOA7BjmvqHsoqzeFQNK0O6ym/1jXo5RuYtAKqWZCnsA4gIR8sg
         w90roKWOP9Mh8342NPkyALH5Zf2TGF4yS+EGGbUJyx/YI8ZgW+2gs7mSHsRVfEubFNar
         jRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406453; x=1795011253;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJEwk0yeQZ5BY0HMxF5cN+S8qbdxO56EHI6uRg64h7U=;
        b=mjV9UpAIFrGw06SwrL5xnq8Y5VJwco+DveQpGE2AEBDhAYpd5YjxYfXZa/wnI/+92z
         mduSavhDp5GhS+n+SKH/UETPFA6EHOgbblP+JuzKqILxK6CFEnAj4EJFl1+ZVeLLf3Zd
         lL/m8VOIMq/0gPOWe4fDmZ8pSVsdOMBnHFPTonOK6DmHIQwduOoX9ej9upCgPJRyi8u9
         Ip2YFQaDwQ7v8JVIYIUvtDaAtr43ynm2mYRBD6DOgRXAv2IQI+P5CqbZbAdbtC21eyaJ
         ybDm+ORMCqvVa94XKQgYd/0HAyBw36sTcmDTAFT/bGbAv5Rm0e6g9xXtllnDm4rYS8fr
         ZeFw==
X-Forwarded-Encrypted: i=1; AL+hErEtwgce2HTZhEQ4/365hlpqnSo5en0vePjyImcWXJ+a6SuoBwxCM7uPlSb0oL/0U4WLDib/NLoSN8KiWzY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HuI4wi7aBBFRpJlmWFh2F81SDNUArXhisk6LGu1i+eEdBWLP3
	plMazHJVuwLah6i4cPKPf3CKrGa1bmn/xGyPT59xYtkEm7pYS3nHXGhbFZ4F2RITs9ugV098KEg
	Bh7nnZ6Fc+vrxn3bgg/Y/Ok+24kOdCEc3Eaf3B8QI0wjWGQ1E+zQRmAa7syIFIu+P6f5LIe/f2p
	ermSXmIampYgoFzLzZ++RTB1y8JjsPR/fDb+/HANjq
X-Gm-Gg: AYBFou0X9E4hts7nJesHgBQ7Q8N+ahYSMKYcL/244lkIQi4BPLoPC2OSsCkMceX4MvX
	rB44a+cGOsCZ3QkZVn7jMaK9uivkR1EQEjDNbghQ34xSKeDvAVh8xRyjkz9O3SRHPcVSqvkYFU8
	g6A4n+XWL2WyO0VBTT/mRf11E8UY8zOeVPM1Vqk7AWgRibKfam/zCjlgTKi2F7K8bquQrelS5pf
	8Jdrgp48ig9Z7bcqVBD2kHbNEYyeUVRQ0yyUoptEd0GkbRTcoknQ4IHgRoZDA/vlYtksKPQfGD1
X-Received: by 2002:a17:906:9fd0:b0:c40:5ee3:8698 with SMTP id a640c23a62f3a-c5066b563cfmr215906066b.31.1794406453467;
        Wed, 11 Nov 2026 06:14:13 -0800 (PST)
X-Received: by 2002:a17:906:9fd0:b0:c40:5ee3:8698 with SMTP id
 a640c23a62f3a-c5066b563cfmr215902966b.31.1794406453032; Wed, 11 Nov 2026
 06:14:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015113738.435986-1-juhee.kang@redhat.com> <a626dba9-6aa2-4cf9-883d-8c6f94770d6c@oss.nxp.com>
In-Reply-To: <a626dba9-6aa2-4cf9-883d-8c6f94770d6c@oss.nxp.com>
From: Juhee Kang <juhee.kang@redhat.com>
Date: Wed, 11 Nov 2026 23:14:01 +0900
X-Gm-Features: AclHuK-LaKGJTHFBtUxEsdfkP6i27gB8i--xEgkyocEdovtvbwJs8a06wnvjStU
Message-ID: <CANBgpCxKYVExEgpS-8PqWqHvXV1nkF+1CzekQKnHGsTJCq7WKA@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource/drivers/nxp-stm: Register sched_clock once
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Dustin Black <dblack@redhat.com>, stable@vger.kernel.org, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Just following up on this v2. Ghennadi reviewed and tested the patch.
Could you take a look when you have a chance and let me know
if anything else is needed?

Thanks.

On Thu, Oct 15, 2026 at 8:40=E2=80=AFPM Ghennadi Procopciuc
<ghennadi.procopciuc@oss.nxp.com> wrote:
>
> On 10/15/2026 2:37 PM, Juhee Kang wrote:
> > [You don't often get email from juhee.kang@redhat.com. Learn why this i=
s important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Each probe updates stm_sched_clock before calling sched_clock_register(=
)
> > again. The call then subtracts the counter value saved during the
> > previous registration from the new STM's counter. If the new counter is
> > smaller, the subtraction wraps and the timestamp jumps forward.
> > (e.g. from 0.4 to 32.9 seconds below)
> >
> >   [    0.403653] sched_clock: 32 bits at 132MHz, resolution 7ns, wraps =
every 16243448316ns
> >   [    0.404056] clocksource: timer@40120000: mask: 0xffffffff max_cycl=
es: 0xffffffff, max_idle_ns: 14456668980 ns
> >   [   32.890509] sched_clock: 32 bits at 132MHz, resolution 7ns, wraps =
every 16243448316ns
> >   [   32.890882] clocksource: timer@40124000: mask: 0xffffffff max_cycl=
es: 0xffffffff, max_idle_ns: 14456668980 ns
> >
> > To fix this, register sched_clock once at the end of the first
> > successful probe. Clocksource and per-CPU clockevent registration
> > remain unchanged.
> >
> > Fixes: cec32ac75827 ("clocksource/drivers/nxp-timer: Add the System Tim=
er Module for the s32gx platforms")
> > Reported-by: Dustin Black <dblack@redhat.com>
> > Signed-off-by: Juhee Kang <juhee.kang@redhat.com>
> > Reviewed-by: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> > ---
> > Changes in v2:
> >   - add the comment
> > ---
> >  drivers/clocksource/timer-nxp-stm.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/=
timer-nxp-stm.c
> > index 6fe098a4a33f..23b2d44e4b78 100644
> > --- a/drivers/clocksource/timer-nxp-stm.c
> > +++ b/drivers/clocksource/timer-nxp-stm.c
> > @@ -211,10 +211,6 @@ static int nxp_stm_clocksource_init(struct device =
*dev, struct stm_timer *stm_ti
> >         if (ret)
> >                 return ret;
> >
> > -       stm_sched_clock =3D stm_timer;
> > -
> > -       sched_clock_register(nxp_stm_read_sched_clock, 32, stm_timer->r=
ate);
> > -
> >         dev_dbg(dev, "Registered clocksource %s\n", name);
> >
> >         return 0;
> > @@ -473,6 +469,15 @@ static int nxp_stm_timer_probe(struct platform_dev=
ice *pdev)
> >                         return ret;
> >         }
> >
> > +       /*
> > +        * STM counters run independently at the same rate. Use the fir=
st
> > +        * probed instance for sched_clock to avoid timestamp jumps.
> > +        */
> > +       if (!stm_sched_clock) {
> > +               stm_sched_clock =3D stm_timer;
> > +               sched_clock_register(nxp_stm_read_sched_clock, 32, stm_=
timer->rate);
> > +       }
> > +
> >         return 0;
> >  }
> >
> > --
> > 2.55.0
>
> Thank you for addressing this issue!
>
> Tested-by: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>
> --
> Regards,
> Ghennadi
>

