Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793038335;
	b=H7euqk1C9zdVlz0nazf44X9DMF7woIXPVG7SU43AliYWXuq6ZrTj+A6x88IEMCc7Sc99
	 RCjz9UxAa32uA+vXApFtIV8v1KvTkVuHNQ0lk5KjjvzjIIzfSyJnSoJVzGtC4bPscWFRW
	 XF5VQZlrjvSvKffFybIiJhcMOmNPwnL6EnmWu0SfhkHaJ2PvTnvavfQJ0IEZ93+eKuL82
	 SYcXJckYxjJBI4xGMt2EELVTBGAzH0BzhH6xsM2J2rlSw7TEqVbFTAfrAuDWLLPOofbDV
	 oyFWtt8sF0UK9l/QcxiGX92XgrYInb8IOgceV14oefHKMovDHwF6PzYrWPqfrF86peg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038335;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=q5LRojRVuKvX7mEgiFNp5sY87D/Oh0+01py2kiHB1uk=;
	b=1/rpmss/PmpVnIn5m3GvVgUIjsbF2F+tSra62e3lGQLEl7U5fpA+zTLObYYxeKTGKmPV
	 WvD4nucsUDd7PBLpqkQry4KT1hZnIUtW9SOI3fY9Tl2131wRbh5g/Krq8kf3jm8BUibCp
	 zdVrC3mWKRswL6FlQN/1ulBjP0Bp6tmo2Irp9lXj/G2+6sJZqMGpEzHCCl+dipsRK2B9a
	 G+rNamIq+ux0MBH4lGpJZcP45aGQS7lXsgkaiv0p3cM3pHcKSXCHTCLsGjtBJARvyknL6
	 lIXGQj/cpMktb+wAZTXfdeYXJy0OAMYMp5UtSP1DDDfr4emx4Ax1U19kRNLjg1/5saQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FWAXJW4P;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=afJ7wroS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424FC606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 424FC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FWAXJW4P;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=afJ7wroS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793038334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5LRojRVuKvX7mEgiFNp5sY87D/Oh0+01py2kiHB1uk=;
	b=FWAXJW4Pif4ia1yY5VWlNPMCoF4HzsjAQCeM1kUExCmBvSNOTp8fabxJZaFK3fh0iV0sxG
	OEOiPTHtlkCi1uCduyiQMeF4ezu/1SpB2s8sy5TFDumSVYlmSsiorxdFW5UlyN2V1Kq5R6
	ET2XxGnBrTgvtWh1xr/KgHPv4FlIo6A=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-vSMJIu5bNg-VfhzDko5qPQ-1; Mon, 26 Oct 2026 14:12:12 -0400
X-MC-Unique: vSMJIu5bNg-VfhzDko5qPQ-1
X-Mimecast-MFC-AGG-ID: vSMJIu5bNg-VfhzDko5qPQ_1793038331
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3ab2bd84bd3so3077331fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793038331; cv=none;
        d=google.com; s=arc-20260327;
        b=ZXSjKu9KmXkGmSqYT0teRr05ewKKeRBP2KWQlIAK9m2pnz5suGZdG1yVuhZwbRhevF
         jLAZm0lxlgGHWYB5gyHIfPYhFvCKh40qxSLX7YhzUtWmLcY2ohYLSgtL+70uF6/67wBl
         K+0EzucwwfngScmGuQ+xQttTCTnMy7K5vtxZUIffJ4VcJPR15Y2PxuEyTTSDo9OC9Mmw
         F2T9ZZ+uUGQfoE/iTWkblPP4v/SLW2uGdFj91WUQzxcocdwZaXNoPwRxeJg2A1U/5EAx
         r1mqske15aa9bZo9noSvpE2spIrygtFvF1+/mlJGhyZTLADjjBOMeK4JrOpntKpz6qa/
         1WBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q5LRojRVuKvX7mEgiFNp5sY87D/Oh0+01py2kiHB1uk=;
        fh=3vJse+cf5RfAVAB1JK2VWC3f7TtDi3Bx2iePlzkmmE4=;
        b=X+8LSWE7mpFJwEi3ONiu0V2RkYyaCLuviZt1tJLJzuIICVVoQDhR9DCtmVsqjIC8wd
         n2/fgc6aNNUpUBan2gu9VnNhYzLT6DBvlvkvJ75zdDIRxwPH15vkAgz5eMlLClAGtxRo
         gLR2ZMxpNjKAMqDCOIN4g2AW93IJOP2kmK5TyK2jUOguX8fyBB/kZs9rc50UOv5D0fTR
         kKzj3DIgTEdVRhG7GY6ndUJZK+Nvpgm1hta0ghSKeDS/GSTmRKLh3e9x7CIjfy175pE3
         iAXRnFjfg4Eqp0vK5gk+BQ1X0TcdKNGGLdpm7qAa0CdDUqqHAjUCq8i6/YENDDfSDJa0
         EtVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793038331; x=1793643131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q5LRojRVuKvX7mEgiFNp5sY87D/Oh0+01py2kiHB1uk=;
        b=afJ7wroSyfWjXiq1TyD2uda7KZxD0tZVNWVLmGp7otmMhyyolGPCl9SQaqJUjjycUg
         I/Lu+g59DI1ZoSeLcLSuaVlBfQrCumOPV0sn3GpZQTRLQF+HeDojHzrq/M1wwZcJgHYX
         lq+NAUBLbHmUhOxRH4GG1Z4skAXoD8NZNZOmAS/DiIpJHbGY0cd0A81Hv6P5R6+mMXqm
         QHsskZYXmExC7pMcjxqKqIppJmwDpU8UrTIPrKgwxeuBrAis0Awvf2b5/T608nztVUag
         OYahRzBufz3djH9lj0dMr8SUhjszvR8XYybWLcqgKjHoEj4IdWJ8egOmPL1atv7XvuB8
         NXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038331; x=1793643131;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5LRojRVuKvX7mEgiFNp5sY87D/Oh0+01py2kiHB1uk=;
        b=YUnSloihCZRcQ2qGo1AJh5qZm0+nrx+UwMrC+LGGmcehTBM7oYXqY594HkwaysDcVN
         LfHlIxiIsBWFsXPwM2PJmNHDb76d31WUnyOObNqapUcOI0S4qaEHnx5xdyGbAjZdMXJ1
         cqSu94ucXYOiO7k6JrwQ3JW6r/F5Goeszpy9K92Cr8xElE8epPANf3OCRTkBW3JYHvL3
         rC8ZNSde3A/YHGinDeg55Oadaq7z49sMiUtXQAZ4tv1sElTOX1hftzl5M35A8MEdRYQ6
         FA7iiHM+TcSwhdaHSf/CH0g81UiYzreEVIfKRsl61jxfd2CNNJFmwIRarlodtNy/+3Bp
         mPeA==
X-Forwarded-Encrypted: i=1; AKwUvBzPHsl0TNyREhMwA8zqb8UpzYikBb2Vy2/miNWnfzkRpcp4v17t0fifwOOvcmE/vSdt0I7p5/7d9yX0bxU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIifOC32IYkCABVY0BjbNONGUD2ttIdCBRw/4RgznJHZqrT50kC
	BHk6tnDVbWuYcTS929x3t0DRI6K6ht2FTmkDXwFOqIk+EWpVY7elxlQNAUN3J+xx+IgZoQO4PUJ
	sm5sxHxYCozy+Jx190rKj+M1yQUzTaxFRuqPVSb9fXqevhqGGanWUTDDZrnGYg2ZayODsK3CRqy
	Zj1BAb6N82WyNZ1w86fyk79CNeu7X7T9yuhsmlTGCgEm8JYqWSCic=
X-Gm-Gg: AYBFou28xbdwoAlkocAkm//uJO++dFn3CaUbkdCW7Cx8IfM5l2KaxyqZi7hpyyPWdDZ
	n2sGpiOV8y6A+T/iC2oJygXQuHTRVqB4+p9QzUg47ceAd73/a3trMSywUh1W1AxM4k3MurZz1tY
	yen09kn17G/hhE0rAx5LkK/L48foeZvGeCgvCvNmbngSGL72aYujlOkvt4
X-Received: by 2002:a2e:80d1:0:b0:3a6:5cdf:d9a4 with SMTP id 38308e7fff4ca-3ac6fca987dmr13222211fa.2.1793038331212;
        Mon, 26 Oct 2026 11:12:11 -0700 (PDT)
X-Received: by 2002:a2e:80d1:0:b0:3a6:5cdf:d9a4 with SMTP id
 38308e7fff4ca-3ac6fca987dmr13222151fa.2.1793038330658; Mon, 26 Oct 2026
 11:12:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-nxp-stm-fixes-v1-0-20a64a4ea454@redhat.com>
 <20261026-nxp-stm-fixes-v1-2-20a64a4ea454@redhat.com> <sashiko-outbox-184830@kernel.org>
In-Reply-To: <sashiko-outbox-184830@kernel.org>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Mon, 26 Oct 2026 19:11:59 +0100
X-Gm-Features: AclHuK81-1LK4q_yytgG1uMwQPIDanhJ70i6Kw8EPDWxX6uc0SJ6PQv6pFkREWI
Message-ID: <CALE0LRuWsWm-i3PPvdsJV66MAUmm9GZgWJRvXfD6iNp10McfLQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] clocksource/drivers/nxp-stm: Fix missed comparator
 match in set_next_event
To: sashiko-reviews@lists.linux.dev
Cc: linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 26, 2026 at 10:50=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] clocksource: nxp-stm: overshoot race in nxp_stm_clockevent_set_n=
ext_event()
> --
>
> commit 45f273b782a28cec6ef30880d738a9cb690edce9
> Author: Enric Balletbo i Serra <eballetb@redhat.com>
>
> clocksource/drivers/nxp-stm: Fix missed comparator match in set_next_even=
t
>
> This patch fixes the overshoot check in nxp_stm_clockevent_set_next_event=
()
> by using a signed comparison between the target comparator value and the
> current counter value to avoid missed matches and 32-bit wraparound stall=
s.
>
> > diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/=
timer-nxp-stm.c
> > index ee249fed1b918..ed7662a4e2bc4 100644
> > --- a/drivers/clocksource/timer-nxp-stm.c
> > +++ b/drivers/clocksource/timer-nxp-stm.c
> > @@ -247,7 +247,7 @@ static int nxp_stm_clockevent_shutdown(struct clock=
_event_device *ced)
> >  static int nxp_stm_clockevent_set_next_event(unsigned long delta, stru=
ct clock_event_device *ced)
> >  {
> >       struct stm_timer *stm_timer =3D ced_to_stm(ced);
> > -     u32 val;
> > +     u32 val, now;
> >
> >       nxp_stm_clockevent_disable(stm_timer);
> >
> > @@ -258,16 +258,12 @@ static int nxp_stm_clockevent_set_next_event(unsi=
gned long delta, struct clock_e
> >       writel(val, STM_CMP0(stm_timer->base));
> >
> >       /*
> > -      * The counter is shared across the channels and can not be
> > -      * stopped while we are setting the next event. If the delta
> > -      * is very small it is possible the counter increases above
> > -      * the computed 'val'. The min_delta value specified when
> > -      * registering the clockevent will prevent that. The second
> > -      * case is if the counter wraps while we compute the 'val' and
> > -      * before writing the comparator register. We read the counter,
> > -      * check if we are back in time and abort the timer with -ETIME.
> > +      * If the counter reached or passed 'val' during or before the
> > +      * write to the comparator, the hardware match will be missed,
> > +      * resulting in a full 32-bit (32.2s) wraparound lockup.
> >        */
> > -     if (val > nxp_stm_clockevent_read_counter(stm_timer) + delta)
> > +     now =3D nxp_stm_clockevent_read_counter(stm_timer);
> > +     if ((int)(val - now) <=3D 0)
> >               return -ETIME;
> >
> >       nxp_stm_clockevent_enable(stm_timer);
>
> [Severity: High]
> Can the counter still advance past val before nxp_stm_clockevent_enable()
> arms the channel comparator in drivers/clocksource/timer-nxp-stm.c?
>
> At the beginning of nxp_stm_clockevent_set_next_event(), channel 0 is
> disabled before programming STM_CMP0:
>
>         nxp_stm_clockevent_disable(stm_timer);
>         ...
>         val =3D nxp_stm_clockevent_read_counter(stm_timer) + delta;
>         writel(val, STM_CMP0(stm_timer->base));
>
> Unlike timer-imx-gpt where the compare interrupt remains enabled while
> writing TCMP, writing STM_CMP0 in the NXP STM does not arm the comparator
> until nxp_stm_clockevent_enable() writes STM_CCR_CEN to STM_CCR0.
>
> Because now is read from STM_CNT before nxp_stm_clockevent_enable() is
> called, if now is sampled just below val (so (int)(val - now) <=3D 0 is f=
alse)
> and STM_CNT reaches or passes val before the subsequent write to STM_CCR0
> takes effect in hardware, the match occurs while channel 0 is still disab=
led
> and is missed.
>
> Should nxp_stm_clockevent_enable(stm_timer) be called before reading now =
for
> the overshoot check, with nxp_stm_clockevent_disable(stm_timer) called on
> the -ETIME path?
>

The race is possible but I believe it cannot occur in practice with
the current min_delta:

set_next_event is called with local interrupts disabled, so
nothing can preempt or extend that window. The gap between reading
now and the writel in nxp_stm_clockevent_enable() is a
comparison, a branch, and a single MMIO write. With min_delta =3D 2us, the
check is still close to the write.

Reordering to enable-before-check introduces a different problem: if
the comparator match fires between nxp_stm_clockevent_enable() and
reading now, the interrupt handler delivers the event via
ced->event_handler(ced) and then we also return -ETIME, causing
the clockevents layer to program another event =E2=80=94 a double delivery.

This check-then-enable ordering is also pre-existing in the original
driver; this series only fixes the comparison logic, not the
sequencing.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-nxp-stm-=
fixes-v1-0-20a64a4ea454@redhat.com?part=3D2
>

