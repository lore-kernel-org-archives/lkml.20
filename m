Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793713251;
	b=yh+ONp2NMw4FSy8y1i8ADe8NHqo1H1n3A44AEBU3K1hDGxeFVgWbyCy0zGTxzOwhnwxX
	 u74C1pcNLoltN3QiZRDq9d0/2Qv7lPmat2WQj8S8zzJHtOSVLlTFhxSGQKC0VB35G2gV2
	 gWTvqC1TnW4WyPi76JNv6CRi1azQ3zJWVa6+YkIRA/aVv5wK5LZ7UrsntUaFDzdT1ztNp
	 KklaIOQkaSgmqbHDCO0mxIKhq/yF38kt/3VIBWSLjxGOure1bunUALvlm1QH+lYS4Nlb3
	 NI1iA+6McmDYSpW1P5dJhaZWwvVZsOIYJ7XHhpUJDa3XLpF0bqxWJyJrCJBjAqGDV9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J/j7c5nHVkBLldZHba/5tLT/KGy6rOQr01qoSp5i+7k=;
	b=Tbu1N6yjbMxuH59gjXUWJDvONPinUcCsTTB7sjvPCzMCZLYMcoFBTxciPQMhr+Jy55VO
	 zV9BObjV5CWFVKLPhBbgDOFK2HIX+wNLz6s5zmJtDD5eMvOq7yaNiMKNXKe7lAlNgzVW6
	 cUuqKBh+00EMV1dB4h13N3mIW2PkQQU8oWO+Q1F/JiOAyr8Bxi1XoIqCR1qK1y0KvFchq
	 oPPpSqH58UzT47/FFkbWmIckM7Bpn8QhcZyndCOV9mI9t4ZfBx3/9o9zJv673e9LzNkIQ
	 2DxTmAaNT06KNGp8oryDG6hhNH0yqq766Bd76wclqnl0YclPeC9B9u0tirzR5axXNGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J0nvvjdt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09EA606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C09EA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J0nvvjdt
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8ac525c1f05so39138257b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:40:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793713250; cv=none;
        d=google.com; s=arc-20260327;
        b=AwVbebcvCH8/CCAv/EJa2qB3LesNHJofTeU2BWLyiWAVljI0YrLW91a2Xf2Ax+O8N9
         uu4hTRqEndBVAslymIqt7km9kLnbG/eH155Szn2vs2QgVKX76AdSPT61sATOCU8dtsXN
         JBrIlKXkHyaTDTssKQCuKknZi7UIg9+gSCHg3z7vs3rnDSC95zGBunhG1B3WjmpoOKqD
         tg51ke6RY/EPlgMWV5UQUmusosq82zU/OSFHaxfAvQ1TrMN/aHKFoct9HNVhrL5ctnGH
         Ll9sXRa/UQMB5MEGCCbxnNC4G4+E/Brm6GW1m272+0nRQCZu2W/RCVfaZugO/ooSM/uI
         tpBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J/j7c5nHVkBLldZHba/5tLT/KGy6rOQr01qoSp5i+7k=;
        fh=lq5aOiZxq8s0pa/OLR3FawLD+lAGlhT2Ezkg/UheYHE=;
        b=d9o5eKZDgXpWFpaMJShHrp2PvYwzMU7p2mG/JLUwUe6kVuPaAiPKzxfhbaM9GhSE1F
         zxIojv+CSFjzlK0eqTE8WKYGWStzZJF1FKfxiewFazvOIjNTmLCsO+shtNCcTojygNE0
         g6Cw1HqK9zOTeAhDInb58OMsqgR2E8OYBjb8UwodgeXtXIMyS5oiMdW+9vOCgEVU3Bhb
         1Nyx9LgwJ7iU9s5sObr5+l8DJsi+46jdkIzsH3WGy3j6ndbPsmVRpEFFox/CAThtf037
         MissUBw120sODT/vO47U0L7wbxhlTviZhfTsMwmupnsfTXZ6txlWNRDktCCx+AJNMNwX
         P4MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713250; x=1794318050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J/j7c5nHVkBLldZHba/5tLT/KGy6rOQr01qoSp5i+7k=;
        b=J0nvvjdtc1wXHV9DTPxKHuOygQF4gZM0uvtqiJ5/JwNAyLMM5cOXnPWoOZYoKy+eA3
         8YvdXh4ID/eXjzPUafQ0PpFXqhRB9vxSJV6YLZnr7vCJMUYI+liIy9qA4+7qKOK+1OeY
         8BQTD25R56/VWsIrLLLj81M31A0uvfw678N5tHtKLXLLR1E9HFCsO6fN0wJ0CKcJiffl
         +lVQGcnjYrWx/cNIProz5DrlDQMx6LjUEEZZ4piU7H4vSAEQp8Lx1FqTZYJO1Cm+IIxU
         ogTioqlgwRxGnvExVHiJ4so/6X4oWQWudBf3p5lgR0ep5IubxO0n+vW8gN80yDyujjQa
         sEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713250; x=1794318050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/j7c5nHVkBLldZHba/5tLT/KGy6rOQr01qoSp5i+7k=;
        b=b7w61xkjchrGaJuX1SxLkmw+qfQUeA51rWOabT8BBeVPBHsUDhJWOBXzkITD6rkk4r
         4zZhGtGDNAvMbtOYbfzicUUrccmeGUFXmbaHPBXb6eLXVcMb5R5pU/MPWek0QHS2pYT2
         DgGdROXHFi7kgFvnGTPVfF4hz+jZh6bF8r7cJCbh15Gjnxv4bL6jWbwhayb1ZxKJMNbb
         SevpP7Py48Q2e56tfPWYWyriIEP0X8uxQA0VdshvJJOgBxivEUiEZJF2GeaeRtFDJkxg
         eZQmN93f7Yz3eah3nQ16W4TA2hOw3DQq7IMpU43GvHlUWQg4v320ibbqJuvbhvM4scXk
         u0JQ==
X-Forwarded-Encrypted: i=1; AKwUvByGTeZy8in+epg2q7KowpDNRb2eAsnppejiGlsINY/WsFx8+c5+p1gYQ45e1YcOxvb9pQLosaKe9pSfzSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z85ykz07ozwFT4ZIJim0az5BgBhBcqPac2xQY0xKvimhJ7CWu
	LbfHaTpZHfrVD+gGbYq2SxfiBGYnh84QlKYHr5bK2ImZTasjgQTfyqaVRqL5p/zk909kPgfp8rF
	BjNh1jGjmiZ+OPwGq7dm0X5AxRTrhELE=
X-Gm-Gg: AYBFou1VN/khgyPRSWy0qB7bO2CUZOcEYxTj6w8zU5M+UrTiyJzL4n4v/vmkoOo6gF7
	K0dNrzhsnfIl4yaUya8z39fsGFL5+o8L4cel9TECsW7DC5EgdkPEXUKAEVDsIv+6O9u3k6SlqKJ
	oAPybVgTUkbbsdSRqtSxS9tpI1mWxFYZLxdsy0/tD5+wlPzq/Ec8uFeVuJDAxA4C4nGZtm65bCW
	IRNQigMcfrj9rHrb2HVOb/Kg/YHX0Oc1sHcbn0g6UOrs53tG/Uy4lhBd7HGrAl7aipeVeGoxC59
	jUHVPhNdmFq8h0XGkgMc2bD1vVoBeTC/nXI+7PQg1U3DQacYEbT6Ee0ey5P/PhunadJpy8tkpcW
	zQYTXTz6vfyBvAkQmxb81282vTMkq25z3iGFN/50TWrwMn0unzNLAG5D7rpZ13Xr1dIPQ/zI=
X-Received: by 2002:a05:690c:d91:b0:8b0:cee8:53cf with SMTP id
 00721157ae682-8b2b6597d49mr94925277b3.3.1793713248757; Tue, 03 Nov 2026
 05:40:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103103438.2154751-2-thnkslprpt@gmail.com> <auni8vp1hOge-G9I@localhost.localdomain>
In-Reply-To: <auni8vp1hOge-G9I@localhost.localdomain>
From: Avi <thnkslprpt@gmail.com>
Date: Tue, 3 Nov 2026 15:40:11 +0200
X-Gm-Features: AclHuK_U8lZQN1ZaVrUuIUdBX5fWw79eLtx2gY_blPnllOISByC4XZQVYJRE2gs
Message-ID: <CA+jvY9FdLtXtGW-j96yT4bSzSk6x3RKYiP3ArnfVU4gsjZkRcg@mail.gmail.com>
Subject: Re: [PATCH] timers: Stop hrtimer queue traversal after seq_file overflow
To: Frederic Weisbecker <frederic@kernel.org>
Cc: anna-maria@linutronix.de, tglx@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes exactly - harmless, but unnecessary and wasteful.

On Tue, Nov 3, 2026 at 3:34=E2=80=AFPM Frederic Weisbecker <frederic@kernel=
.org> wrote:
>
> Le Tue, Nov 03, 2026 at 12:34:39PM +0200, Avi Weiss a =C3=A9crit :
> > When /proc/timer_list overflows its seq_file buffer, seq_file retries
> > formatting with a larger buffer. print_active_timers() nevertheless
> > continues scanning the remaining hrtimers, restarting its quadratic
> > traversal even though the overflowing attempt will be discarded.
> >
> > Stop traversing at next_one when the seq_file has overflowed. Preserve
> > the SysRq console path, which passes a NULL seq_file pointer.
> >
> > In a (virtual) two-CPU KVM guest with 2,048 timerfds pinned to one CPU,
> > median reader CPU time for a complete /proc/timer_list read fell from
> > 51.1 ms to 14.6 ms. Repeated tests showed no material slowdown for
> > non-overflowing reads (13.7us before versus 13.8 after). Short reads,
> > seek-to-start, and SysRq-Q tests also look fine.
> >
> > Fixes: 289f480af87e ("[PATCH] Add debugging feature /proc/timer_list")
> > Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> > ---
> >  kernel/time/timer_list.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/kernel/time/timer_list.c b/kernel/time/timer_list.c
> > index 0406bf4488e9..84275b6cd2c9 100644
> > --- a/kernel/time/timer_list.c
> > +++ b/kernel/time/timer_list.c
> > @@ -64,6 +64,8 @@ static void print_active_timers(struct seq_file *m, s=
truct hrtimer_clock_base *b
> >       unsigned long flags;
> >
> >  next_one:
> > +     if (m && seq_has_overflowed(m))
> > +             return;
>
> But it's harmless, right? I mean the bad outcome is just to spend useless=
 cycles
> seeking and storing?
>
> Still probably makes sense though.
>
> >       i =3D 0;
> >
> >       touch_nmi_watchdog();
> > --
> > 2.43.0
> >
>
> --
> Frederic Weisbecker
> SUSE Labs
