Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003258;
	b=FgWYbXP+K2/em0nAyDg4Rk/6xI266+Lr9cPuNcukZVyMZTzIimGv+Ak6Ig0ktHkjd4hB
	 +sPxC3z4mNaZAi/QYT/+2SiuWV2Pk12L70Se5MToK8aTp1A3PLPfVKvSbshArbiJRyjPE
	 i6H41xHBnzfaL/0We1DUHcdQUmYmFw4FpDq9xSzmueAzADmzzRNuvmzfcvcoNELFTB8Lc
	 Q1zkbbshgUon+G3KS8kuWcU/XHHj4sIkX2KdT3U934mu5z+FrE++IvypqFW0HxESKXZv/
	 e1SEI9OpIIqmmMnqvT1rBnizUqQhzAZNMIf3PpLyFokVdvA8ev4UGieaKFVwN5jTFsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=C2nkaK+IZo7uol3FOyATuuSoOwljEXWN6zBbxAECZI8=;
	b=04uLDTKb7HOnAzJ0sHL1z6UOI1qM/Ej3DRXldDJX6SnJj6c09ZUVyBkOXmEnMqXPof2F
	 loc1yLzcFxJsMKkvRYG3fFRY1WldEoMlyXTdGTwaQMfPPiui6JKKJiOPqUq7it0MI+GpS
	 zPKa8Hx5ACb/heLOL78ggVWmSqFOo4trihbj9oY1J95+7h9R1I2MD7A9wsIklNJ8kascT
	 PdiR5esPrEkp2o3z2aB6OQi4CZj4qsr3yhn7sBNn/o3QEpWDSCLx07Dna1xIwqmi4AkTB
	 1hIVPiVP/6dSZNwc3KDwsHnxHmnY0j0+z3z7VlzDcHFiRXYM+QPMZXnInKFXVsop1kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BMGbesW7;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13855606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13855606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BMGbesW7
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so843036a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003257; x=1793608057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2nkaK+IZo7uol3FOyATuuSoOwljEXWN6zBbxAECZI8=;
        b=BMGbesW7WIUslLvmrTBjAjQD44CdimJOYY35ECU0SUimSBycMAxqO8uvNgL9nalB1s
         Kjoz/uj2JQcGAFNYp8iIV8ITlcR88El/b6MmSIFHx+Vz5X4EygcT3eB/JG3E+SSJNEkB
         WXJvEX1TW9U5nq7a+UXDaEaGU7m32a0iasPuwKt50+QcsRzTlohjJJW1BsU1NtjBKTYd
         FHMUUcvqGOMx+wopr8GG3yiyKV1difMKXQ+acSQOs1Hu9hR7YoF7ed70iICRj2Vkaipc
         nn+qOf4L0IGelC8aEo/+qP7oUh9gv+qiVLsw1chD7SnkHIGR5FfIJX7JStqG3tLo+A9C
         ImGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003257; x=1793608057;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C2nkaK+IZo7uol3FOyATuuSoOwljEXWN6zBbxAECZI8=;
        b=yfFlTQgmxwhKFv2AjHsGxd2xoZY8q1DQdeJAEsoBlhXD/g6DB4oV/kS2smEGNbMxsi
         QsiTgWmgxT4p8Wsp2UZ3HAM4RVFTsmTR5rlInZgFPGxHFY/EYaRbcrmO8Qk1linOBldu
         SZ1p6gNDIAG40XitoJXAmic4NyJ1h3Zgj/cr8g0SCkdPHYi1fFfOn+IHN3XlOPSrjguN
         kUkJ7oIceiRDbEwBTRDBo/CPc33AJtzQquEgpehgih1xryErg4dehtTQmg5pQn73Iqec
         H7+cfjbs/UVW2l/M4QXgvlcY7BU6I7Xnc6KV7D8z+FH241Ma78D+kcduch4HD9vI9gfT
         6tZg==
X-Forwarded-Encrypted: i=1; AKwUvBzWXM22b1iPcMKPu4A3lOUq8jEc0xzOvs23eW6VENYFyBnTgH85lQp9CY/azCoYDJ1xrdrVp2mD8/HIX4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhETVV3ZIX4/vTEWsDr5FjsJwdZoxvRoQtNLHy30HZEUccwJQk
	fGrbKINgEwNHaMdDM+KnGo1nLB86DIT5GFd8IG9ev7vqSCU8/Yvo+Krp
X-Gm-Gg: AYBFou1tunXNwa8mAlTkCkXPqsXhjTOPzDX3Hns9kj2iSeW6Ago/2jzLj34Ar0XYPvi
	t1F5VwR0BPA8xkIw7ZeeQ2B9nSTcyLhjLgdGLI5txZHs2zp21g2HeOFj2C7mF6v6X04Wbk67ZeA
	L4/0BomnEg1EZAw7/rabV4jDyBG9CIqYi+gQD6B+qKgT5aXLkePCSPiKUsgVKGsXuzwHC092bn2
	jS/3ZIcU7mQh7JPXVqKQ+0CNIvbMQwY5DG8iSv2x29izdBOkdljpOzPBuB4RO26sCR9tKdMMjs8
	jm8oMsCRQTIx3tUP7IsrXh1XLUpRcEXql279lgu0JRCCev6IDxZOVbjRwCVpYriUL6veBQSqCqR
	gS60ARTd5BuQhhgEP4m0U7Uf8pni7Pg4S6oAAL+G2GsfpDenmaF/b9dze3XFEVHhsb483wBmWSa
	KzikVEa1NXNxQU05AWAiq0djXBbGpI0Mp1jYUQLCeB3wNgFfIqJjnhDh2P9E16mjq3imEqvoeXv
	mchbp2sbsG6GWaOlTk/9luqWukOX7eHVp6Q+9U88h4cFH9qQChikLdEDEiZk7gLyioyX69H
X-Received: by 2002:a17:90b:1b01:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3adead249fcmr5315716a91.29.1793003257392;
        Mon, 26 Oct 2026 01:27:37 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa3794sm7530156a91.14.2026.10.26.01.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:27:37 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: zhangqiao22@huawei.com
Cc: tglx@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	peterz@infradead.org,
	maz@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	Zhan Xusheng <zhanxusheng1024@gmail.com>
Subject: Re: [QUESTION] sched/clock: Potential timestamp jump due to inter-CPU counter skew?
Date: Mon, 26 Oct 2026 16:27:30 +0800
Message-ID: <20261026082730.2117173-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cf7a043c-384c-0642-204c-8f207eff3d42@huawei.com>
References: <cf7a043c-384c-0642-204c-8f207eff3d42@huawei.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Qiao,

On Mon, Oct 26, 2026 at 02:53:25PM +0800, Zhang Qiao wrote:
> 1. Are there hardware or architecture specifications (e.g., ARM64 architected
> timers, RISC-V) requiring counters on all CPUs—including those on different
> dies/sockets—to be perfectly synchronized? If skew is permitted, is there a
> specified maximum allowed skew?

RISC-V's Zicntr extension requires the real-time clocks of all harts to
be synchronized to within one tick.

On arm64 the system counter is meant to give all PEs a common view of
time, and keeping the copies on separate dies in step is the
implementation's job.  The kernel has no tolerance for skew.  The counter
errata handled in arm_arch_timer.c (Freescale A-008585, HiSilicon
161010101, Cortex-A73 858921, Allwinner A64) are all reads on a single
CPU returning a wrong value, worked around by reading twice; none of them
is skew between CPUs.

> 2. If the sequence above is theoretically possible, does generic sched_clock()
> already have a mechanism to handle a counter read that lags behind the shared
> epoch_cyc?

No.  __sched_clock() masks the difference and converts it directly.
Timekeeping's clocksource_delta() returns 0 when the masked delta exceeds
max_delta, but sched_clock has no such check, so a read behind epoch_cyc
gives a delta of nearly a full period and cyc * mult overflows.

Thanks,
Zhan Xusheng
