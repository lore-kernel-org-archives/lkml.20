Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792511466;
	b=WyXg8zNy4ZfSuLKhnVzzfxkSVjIsJx+FQv1JOw3hLpuDODGnSUX90KceFQrXuEJZTy7T
	 z2cJdk8ISnPEP7LUm7GQCrhm9aCTGU0lYtn39ipCumnl5Ce8A5JqjXIQaBe81iDR0i2z/
	 Anw3+cFtJzo0yi9dhxxCBvwiZkELdGt47eaMLguh8/PmUPbYoTbzN8cXuz0sTyUuGSpVd
	 sSJnbEqwz8rZAkc3x9NzU1zBaj8jLFpyHQlhDRdy1lIpNIKa4K4QMSSI4Nak/iZpkg6y+
	 7ccctkgdrla9LGFIqNRHiyXsSYHEhE1an7wNV+QawDYNc5+l2woYb6dCBAjTvMr9HqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792511466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OFVAQrFmT1oDNxMyfNklZUb3FR+1d06U5iKfR+KInKQ=;
	b=g5jrYrSItQosPvQiefiDukIMnF6f//z6bMGVz0XV7GJfMSTjLnGo8BKwFNaGVK68li9t
	 ThajWJTqPPmtF9ebKIr5ml44s+YUeBakNSbUMamKgeSHkSlskXAOGCjYwNuECsgcfvwyH
	 2H0CYbI/VAMV/csMQvKYmu0Bu6sQrcN4MTIJL61P/XDoUDRNH45Xo3lgVmbT5skde1Thf
	 pk2nun5NrvPeYI8RTa9uNzCqxY2XXsju6LnAGNHgXrRiO9Va2vBGrhZZ902Cb5KPHItUI
	 IaRVtL/gZjSyS/5AaG30a5A6KlhSIigCRTnnN9jd4otXQacLpcLtlD4mJ8ZhhuSRKKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UdXm5k0F;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EDA606A324
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07EDA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UdXm5k0F
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b042c0759so2291681f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792511464; x=1793116264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFVAQrFmT1oDNxMyfNklZUb3FR+1d06U5iKfR+KInKQ=;
        b=UdXm5k0FNyZfN1sNLifVL0+kQdEAmh7EVCH5isCKWhxJZ8NJHVqhWP2qY37Ziokfj6
         ltSycZDGUgHv0pfaahQTzIU+bgvmZXw85k+CcxsN7PyZtcyV1WoPFx/xya/CJdheYab/
         Q1G2ZOuAHUCdJvb07+x6CuVqY6hr5xMF99nm99sXFpU16KsTRefsH2O6MWDl4kZhQ9WO
         NnGL1PeGYNngt9Sr/LAWadFNLz3/J7R63nbQZncs9hLXYy8bBoOMuzBVoUvlbkPR4jHm
         kEpgVs84qXzIjaksQcp2Uk9LOiwV0ykPuYUWai8HLQ1Mj3xCLplteSaeUMp8lmI7Ru5d
         SnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792511464; x=1793116264;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFVAQrFmT1oDNxMyfNklZUb3FR+1d06U5iKfR+KInKQ=;
        b=oByGQ9TxTw1L3f8NQU0d95s3R8bjUHkNaksJBQPYEArzssfqhGm0ihsbiGCZ5JydpV
         FqQPEzqtIUajfbPED2O4L8HgonoVpL9tlUz2/qfHk9IUPmZnd440Vez0L/Sz6pJKI9DI
         BoQ6d0uIN1V4hsW7SJFCkHT7bd6qJPLfetmosx4kwiX/0vEE2lEAouZkndqIGEpm0cr+
         kXgTWyRzrz4kGSg/PF4Xlh+HPmimZJ/6b0hNBElgWgDDDRPStnpoo6w+ja0T7SU/Bzf6
         kVgaFIHDnV0WuAFHFye75MAA9+AVfXvl3vGIk4HQXEoAkTAjl5K1WK0/aP8Op4Lb35Vd
         yv4A==
X-Forwarded-Encrypted: i=1; AKwUvBxtlBpoJiAbDSBUmtzn50gnofmRqY6eacYQYPFTIaUHHbJZkWFdrKfeRLbva9diR0lPtEnB6vhY9VEdRno=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsjoVg0Yo2WbuVTDLUyI7t40JAfV6XOWAddrL5LuiilJnYs2Hq
	63RRIJtitxECJQPuYBm6DOh8iBEyZISAzXsN6dQ5xNqhRpsZQXUzxvNT
X-Gm-Gg: AYBFou105frsRIjdgwMMKRjehk+JIned5XwQ/Y87CuZKqUn/bfToITNVJIUmAyOCGCd
	WaIt+woWQjaOIenhD6plSnG7g1qhJZsYYfCZ23mykxank5Xi0TJ33JXZtvY28NdZ5xhDYJEWltn
	zO5p7M/fTasrlb7616Ib5qflFpkrNgYWNdDAVEIxbVuLcxEWv7bo7wSZlkfZEg2OXvUd4veo2T3
	97dFZKZzEbh0TTP5or6UlVkJ3wARvudfJpdFmRaoopWkDfOtQPGrXd/FpyU1HGYfvyFSs/x0/yH
	WVJG+Sh3inH1nPqnnAEQ2zluNkpGO8MEJWOuuI22LZXBpW+gGfQ6qUpNrZV79R4vyJoBhs/LRzu
	CmCFIPWYnLFDnl1SWD2q90Tvy2+2M0Mj7QgbCY08VKOlSDA4iCIRg59NwUhebvi8JvL8N/JQy1s
	qe7lXUhfa2i3CnvvHk9ZNWH0h6pW6A3ftKyUg/qTej/HoPXu02/wlw0XaT51hMzcRvxqgaYfJ0G
	KDdE2QnhPviDUBDm+djrAcTxI8eyYlrZUc=
X-Received: by 2002:a05:600d:82e1:b0:4a1:f377:5c50 with SMTP id 5b1f17b1804b1-4a1f3775e78mr82090745e9.30.1792511464096;
        Tue, 20 Oct 2026 08:51:04 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817f8dsm6788859f8f.23.2026.10.20.08.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:51:03 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:51:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Ian Rogers <irogers@google.com>, Thomas
 Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Stefan Kerkmann
 <s.kerkmann@pengutronix.de>, Christophe Leroy <chleroy@kernel.org>, Arnaldo
 Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Eric Biggers <ebiggers@google.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option
 for ARMv5
Message-ID: <20261020165101.5e74ab2d@pumpkin>
In-Reply-To: <20261020-nice-turquoise-dinosaur-3079bc-mkl@pengutronix.de>
References: <20261019201257.3805356-1-irogers@google.com>
	<31fe09f6-0a14-40fc-8ad8-c03998fb1f5c@app.fastmail.com>
	<20261020-succinct-zebu-of-vigor-6cb2cd-mkl@pengutronix.de>
	<d2afb4cb-145e-488b-8f6e-c83e38735526@app.fastmail.com>
	<20261020-nice-turquoise-dinosaur-3079bc-mkl@pengutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 16:56:40 +0200
Marc Kleine-Budde <mkl@pengutronix.de> wrote:

> On 20.10.2026 10:24:51, Arnd Bergmann wrote:
> > > FYI: there is the kconfig Symbol HAVE_EFFICIENT_UNALIGNED_ACCESS. Can we
> > > make use of it?  
> 
> Just noticed that sashiko's review contained the same remark, but the
> bot only posts to the linux-perf-users@vger.kernel.org list, where I'm
> not subscribed:
> 
> https://lore.kernel.org/all/sashiko-outbox-178182@kernel.org/
> 
> > That would be better, but I still hope we can just get back to the
> > portable code across all architectures for the in-kernel version.
> >
> > I have one more request for you: can you check /proc/cpu/alignment
> > on the system that shows the performance regression with and without
> > the patch?  
> 
> When booted via NFS-root to the login prompt, we have about 570k System
> alignment fixups, all in the IP stack: :/
> 
> __udp4_lib_rcv+0x78/0xc6c
> icmpv6_echo_reply+0x160/0x504
> ip_send_unicast_reply+0xf0/0x3f8
> ndisc_send_skb+0x15c/0x40c
> rawv6_recvmsg+0x114/0x3b4
> tcp_rcv_established+0x3ec/0xba0
> tcp_v4_fill_cb+0x70/0xec
> tcp_validate_incoming+0x540/0x868
> 
> Comparing v7.0.12 with mainline "unaligned.h" and reverting commit
> a339671db64b ("vdso: Switch get/put_unaligned() from packed struct to
> memcpy()") brings no difference with respect to alignment problems. But
> I see the increase in I/O performance (measured with "fio" [1]) on a
> UBIFS/NAND file system:

So the nand fs is hit by the memcpy() but there are misaligned transfers
in the network stack.
 
> - v7.0.12 NFS root
>   User:           0
>   System:         573956 (tcp_measure_rcv_mss+0xe4/0x1e0)

I can't find __udp_lib_rcv(), but that looks like it could be from expanding
tcp_flag_word(tcp_hdr(skb)).
Which would rather imply that the network driver isn't correctly aligning
all receive packets (honouring NET_IP_ALIGN).

When I were a lad the kernel just paniced and userspace core dumped :-)

David
