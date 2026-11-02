Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793656065;
	b=Gi+cbFRRXtYG/51L1mYL7c5DSERdNgCriRN/pJvyJ68PniNG4MXx1xSAAJMaKh83p/B5
	 hB1BgM4ZvFWDLBVH9AEFQeCo5xnHqT0+g8yrUB4Jcnop28vEX80F8X8MRvVVAvBj2KLhw
	 0VOnmmcrwkv50qLiZ1kwcIXFGb/6iUsRsqlQH58OSca3Q+9UagCIFUUxm4vuFDiqVuMrS
	 BJ8sdYDY2nWF6kiwLAWYeayRKovS08wc+kdDl9fO8fsSTVXyZFSIDPyoPIMWu6OLRY7VI
	 1RBInIIG6/1CsoGLPAj9xAO7DG3zdmxd8Kw+zR422XxrDhpkg3E+LZLXAyRoujt3/CA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656065;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=zVy3cyl0CvXI2khtfqIyMnjKNtXJR5EIeczb7Nf6ZU4=;
	b=gL7FvtjG47IB0dXkJCt1s5GZpx9dnBdnfgcLX0izyQpBuF7ZKOs/QyEmlTIPHklmaDJw
	 mt8x2EtgsYyPTQZ7eHaIWCLJyPc8DccC/of0SMf+MygT8F16UW2GHHiOtNuxN7FwaFdUv
	 5c/19uX45LDil46K9/ASkdQDeC9gvpSTpYGPSzTum2QdYwpnvqvE+bDnA8iaONKr6aYxF
	 coN+6VCeIYVpiGbQFovLvL7s3PR54Eut5/mWA21pWoTiyMs7NDRNXYine118RM3oCo2CU
	 BpuY0eea5+/BxDL+OcE3PbL/3pAg0TwXyFdKfn8zzibAi5LPYNBRwT3wxfbmAknAMUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FwjqFcJ4;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Xu1SG3Nr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08077606D827
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08077606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FwjqFcJ4;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Xu1SG3Nr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793656064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zVy3cyl0CvXI2khtfqIyMnjKNtXJR5EIeczb7Nf6ZU4=;
	b=FwjqFcJ4Yyk2TV5FjpclsGWrwhN+QG7bhZsztdzVUmEV9DvPFqcIr1j9rvDFbRE7YAZaCI
	sKtyNhw5HFYhcPWPBOpVaz/iSwrIMxBkiwuDsfklxev7Kgx2Vxkut7NuQkWy0YUkd1z8Du
	0l2U7NXGDUhCYhpXjvqcBQVvOM50va8=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-8c_gK2jaNES0IBkUASorPQ-1; Mon, 02 Nov 2026 16:47:39 -0500
X-MC-Unique: 8c_gK2jaNES0IBkUASorPQ-1
X-Mimecast-MFC-AGG-ID: 8c_gK2jaNES0IBkUASorPQ_1793656058
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3ac5b80c1a9so3244391fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:47:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793656058; cv=none;
        d=google.com; s=arc-20260327;
        b=JU8dqkNWBEli3U3+NZMYf6cPJcgFvEo79oNgf+c89Ym4FVqIhaKqcxkp2pii+Xmhtw
         EZeO3aUn3b1cLrCNE/No67aGUa+y+gyDulK0kH4DtykjD3QloDZZT25Zg44qh5veX8JR
         OKU9XUZ1ADSjci+t8fGNbVgbn1NwLwo4a+lQ0+bxQTo7Netid4HTwD8XoD0kVO4UY/cw
         b30nGCKvgKs905JqTDBCuifqscAd43Q1HVODIWut/RX/ECs0RW7p1mHTN1ZT6UtaQxan
         M+yywL0T48BzY1bP/4g8IgJZbeqUPCv/WWcVJWq48N7UsaRUt6vyUGqIsrPuBIUTo5pp
         0R7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zVy3cyl0CvXI2khtfqIyMnjKNtXJR5EIeczb7Nf6ZU4=;
        fh=eFhECoEyqA4dTOUUR/WTt5db4Clh39WZo8NeX8MSZkY=;
        b=ql8JhbLAJEDe+oILZ6CPDBl+a/POXvUDXkDqhhCi7Sy3lxMJP62iHPERLJm0Tncint
         g6pYiS1ufZQy3n+FDGsCaoVqUAqeYxtSWw/u8ILK34p5NHcEAPbNPpjtuVz5uYsmRBLz
         k3o1LKrR8KSLGS9uyRpGRq0oX7HalCuSwqs74F+368rrBPzQPgHbHFYtQSiBuo/LI4J/
         SY7lTrd/uJuOO2wbqY0c9UpiOVIr9SMRqTIA4DFUVX4rpVpp2/5yPFnhDH9SvQi07+0p
         OO046L45q7vn6pjzxjdDuF02t58PyhNmi33lGPfigAuRnosDiuMOrPcngSU7Jhk4X6JG
         UqkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793656058; x=1794260858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zVy3cyl0CvXI2khtfqIyMnjKNtXJR5EIeczb7Nf6ZU4=;
        b=Xu1SG3Nrstxnrd+xjDK2HlJjMKtfy0iC6BAjn93BsDhx/Su8KjH1mCFsHCCQRKLs21
         c44lQLBkzUvM2ZLg1Njyl8MgLeptB4P8rpWjK3zNNxB+EKo+eLoestZE6oBCyri96OOC
         t7UKg09Zt899fRVQZuvAnORUbvJ5KRuLDtqbwqVr8bWTyL8zRTVmoxFN2U/uAEJ9Wj1U
         BNUzQK7W0Y7U/BfL4fbxJ4tU7WdQKMCKEM7yO7pA24EpuVCXY96cL+VX1X52oLoWVIIo
         q+Pu61rcY7vddaz4lOJ9OgN5DYpHvLD2vaLQuGHbPpoN09C3UZ16q9MjD4neJhRvmj90
         FPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656058; x=1794260858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVy3cyl0CvXI2khtfqIyMnjKNtXJR5EIeczb7Nf6ZU4=;
        b=qtYeBJd65RO1M2y58J9XFs+pGDeYDnynAdbKvLgihkWxcFBjrcYIP75zTzLQ7lbVqP
         Qd5SziTVlRIdAvKVFBKkAjkrTrj6AxQ3vPyAD1st0tqFt8wJwCzNZ9liMQO7GEoh1Rmo
         IGavZKPnUwe+GNT/xnaXOwklyVc0DaosrtlcEWiE1tW/CCUy/ku4jnJEChx7ZGrQkpJD
         c3JuqjNqY6Q3DoSchhQPsa8bmWP5ufSPxkN5UP9a95GDKmGUl+k+XAdHWASN93rcmMjG
         2XDYrIEXjKFANgD7mci45kXRl6W6u7rxoZTzUfqYD5A4fmgCKZAzAflPOEWPgOO938fw
         fHRA==
X-Forwarded-Encrypted: i=1; AKwUvByOMrggLaQ/GDMeWtjFlhq5MaK1M0ZhbKQLmQcEAf4I0F0YKKcyU4pMizRCJg8lQ3yA+dTpYpvchGsbXas=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q4UvWR+kZgLV1uOsTV80bXR3YNfw2D1OKoQjaVI5EWH8qdMGe
	WfvBa2r9n4JZzMjiHepNOjTnYfRJhTrHu3RHDope7akN92xqc1Fl2IK0OtgLVgCoUpieTEmOP8n
	6nJFn9hXD7ii+fkZ8va6hVPEO58TklEGC/Mii74CbIXgZhJMAY2/SwLHDKtBV3LPsBaUBCtF2t3
	iQxsaZHaVR9z9/Dfs+FmwIYvFKk3SUhr+TJjo7FG9b
X-Gm-Gg: AYBFou3xONFx0VwUu5zhGaiQwXh79mF9y1lEaI0mJdjyOZoKz0iMDBCYzq9PxumkSwh
	8KQYv02qA0MgqQkUUySxsOYMSM2+RAo3eFxu+aFk1b5eDBCDOdcYk1iSOtHvBbMtIiNSLV53rRL
	i2Y6IIubgfxIGJgWmkcyOK2UtW4gPnknMwXZkZm7ifj/i1tuhhhEQR6MCS
X-Received: by 2002:a05:651c:435a:10b0:3ac:b2df:c518 with SMTP id 38308e7fff4ca-3acb788bd42mr19471401fa.0.1793656058048;
        Mon, 02 Nov 2026 13:47:38 -0800 (PST)
X-Received: by 2002:a05:651c:435a:10b0:3ac:b2df:c518 with SMTP id
 38308e7fff4ca-3acb788bd42mr19471361fa.0.1793656057467; Mon, 02 Nov 2026
 13:47:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-nxp-stm-fixes-v2-0-8ca2706f30ef@redhat.com>
 <20261102-nxp-stm-fixes-v2-3-8ca2706f30ef@redhat.com> <sashiko-outbox-194195@kernel.org>
In-Reply-To: <sashiko-outbox-194195@kernel.org>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Mon, 2 Nov 2026 22:47:26 +0100
X-Gm-Features: AclHuK_0a2IjcCcwCHH8GxxfGTwals0LlMjXS0TnljknwHPEB3JJYJs346FUJyM
Message-ID: <CALE0LRstkO4x4R9ohB-L+zGUH3xzTNj2Yswg69wtwmvRXo44HQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clocksource/drivers/nxp-stm: Increase min_delta to
 20us for PREEMPT_RT
To: sashiko-reviews@lists.linux.dev
Cc: linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 2, 2026 at 10:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] clocksource/drivers/nxp-stm: overshoot check precedes channel =
enable
> --
>
> commit 1283cc4078852e277605e923b00287b73e75d175
> Author: Enric Balletbo i Serra <eballetb@redhat.com>
>
> clocksource/drivers/nxp-stm: Increase min_delta to 20us for PREEMPT_RT
>
> This commit increases the clockevent min_delta from 2us to 20us in
> nxp_stm_clockevent_starting_cpu() to prevent 32-second timer wraparound
> lockups under heavy bus contention on PREEMPT_RT kernels.
>
> > diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/=
timer-nxp-stm.c
> > index ed7662a4e2bc4..a1a0e23d33426 100644
> > --- a/drivers/clocksource/timer-nxp-stm.c
> > +++ b/drivers/clocksource/timer-nxp-stm.c
> > @@ -335,14 +335,18 @@ static int nxp_stm_clockevent_starting_cpu(unsign=
ed int cpu)
> >       /*
> >        * The timings measurement show reading the counter register
> >        * and writing to the comparator register takes as a maximum
> > -      * value 1100 ns at 133MHz rate frequency. The timer must be
> > -      * set above this value and to be secure we set the minimum
> > -      * value equal to 2000ns, so 2us.
> > +      * value 1100 ns at 133MHz rate frequency. However, under heavy
> > +      * bus contention on PREEMPT_RT, 2us is too tight and can allow
> > +      * the counter to pass the match value before the channel-enable
> > +      * write takes effect, leading to 32s wraparounds.
> >        *
> > -      * minimum ticks =3D (rate / MICRO) * 2
> > +      * Increase to 20us to guarantee the comparator channel is fully
> > +      * enabled before the match value is reached.
> > +      *
> > +      * minimum ticks =3D (rate / MICRO) * 20
> >        */
> >       clockevents_config_and_register(&stm_timer->ced, stm_timer->rate,
> > -                                     (stm_timer->rate / MICRO) * 2, 0x=
7FFFFFFFU);
> > +                                     (stm_timer->rate / MICRO) * 20, 0=
x7FFFFFFFU);
>
> [Severity: Medium]
> As reported by Sashiko on v1 [1], does increasing min_delta to 20us in
> nxp_stm_clockevent_starting_cpu() actually guarantee that the comparator
> channel is enabled before the match value is reached?
>
> Looking at drivers/clocksource/timer-nxp-stm.c:
>
> static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct =
clock_event_device *ced)
> {
>         struct stm_timer *stm_timer =3D ced_to_stm(ced);
>         u32 val, now;
>
>         nxp_stm_clockevent_disable(stm_timer);
>
>         stm_timer->delta =3D delta;
>
>         val =3D nxp_stm_clockevent_read_counter(stm_timer) + delta;
>
>         writel(val, STM_CMP0(stm_timer->base));
>         ...
>         now =3D nxp_stm_clockevent_read_counter(stm_timer);
>         if ((int)(val - now) <=3D 0)
>                 return -ETIME;
>
>         nxp_stm_clockevent_enable(stm_timer);
>
>         return 0;
> }
>
> nxp_stm_clockevent_disable() clears STM_CCR_CEN in STM_CCR0, and the
> hardware only generates a match event when STM_CNT equals STM_CMP0 while
> STM_CCR0[CEN] is enabled. Because nxp_stm_clockevent_enable() is called
> after reading now and checking (int)(val - now) <=3D 0, the latency of wr=
iting
> STM_CCR_CEN to STM_CCR0 is not covered by the -ETIME overshoot check.
>
> For any programmed delta (20us or larger), if bus contention, an NMI, or
> hypervisor/firmware delay between the two counter reads leaves val - now =
as
> a small positive number of ticks, the overshoot check passes while the
> channel is still disabled, and STM_CNT can pass val before the subsequent
> nxp_stm_clockevent_enable() write takes effect in hardware.
>
> Should nxp_stm_clockevent_set_next_event() enable the comparator channel
> before reading now for the overshoot check (and call
> nxp_stm_clockevent_disable() if (int)(val - now) <=3D 0 before returning
> -ETIME) so the counter read is ordered after the STM_CCR0 write on the bu=
s?
>

I answered this in the first version of the PATCH 2/3, this describes
the same race you pointed in the PATCH 2/3 and I think the race is
possible but I believe it cannot occur in practice with the current
min_delta:

set_next_event is called with local interrupts disabled, so
nothing can preempt or extend that window. The gap between reading
now and the writel in nxp_stm_clockevent_enable() is a
comparison, a branch, and a single MMIO write. With min_delta =3D 2us, the
check is still close to the write.

Reordering to enable-before-check introduces a different problem: if
the comparator match fires between nxp_stm_clockevent_enable() and
reading now, the interrupt handler delivers the event via
ced->event_handler(ced) and then we also return -ETIME, causing, if
I'm not mistaken
the clockevents layer to program another event, causing a double delivery.

Thanks,
   Enric

> [1] https://lore.kernel.org/r/20261026-nxp-stm-fixes-v1-3-20a64a4ea454@re=
dhat.com
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-nxp-stm-=
fixes-v2-0-8ca2706f30ef@redhat.com?part=3D3
>

