Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513549;
	b=DvZ7oz2rvtWcangdM9xM9/tWqhPo47sHXgl1IIs0/qLoLuahUCuah5hI8ZCay/SHIcRC
	 vv7ROC/Yf0RFmtIFFBpp3ITFxagGkRKGKy0LuTjm1GtwdpH/h7vrioeEOz8fOLXN1wJsF
	 GehJP2yec37HnHmLeVsWC8sm/SI9kFpEE9WtcfKR38MYsao/aw1Lrx27alXOINGFGuZdW
	 j8/s/xxRyU7rLbI+qZb7J/IxAsluVVcB/o0SX4TxRzBwO//CQ7aXMaJgEQGlZvOPt4CRr
	 dwK4unjMHzypWRZIFdm/lzdLkGw9XFBrqPUuEKo5gerEnc3NoMfflIRZ2mgkEXDplHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=T/wWb7fRaZUGBhzDhHV/eUFOWgluySiOaHkvWzqe8FM=;
	b=ZVoi2icXfpOZAPFDbribTzSyDQTWDRE67w/w6ryeMiAoRbrumUNPg1OjKPoBD7Sp4g0/
	 lzHE4Ia0AdOycPsrdK4vFvme5l8qnOaDSE+4jknuHo+QjFoQhAur7nPbz5mO4Gve4Xbwd
	 WKwOhbvS3lktimFK8Q8RQ/LvaMr2whpAln/td+GfgTHTbgfwgA7Xva5nMKc+o/UiBewN+
	 Zii8mVyHAcFekA3k0+tNZfbDtew9Nb0UDoqp7GdWfNOaBZ2ZBVzGfC8oPCOY5K+cRa/FC
	 QZ+7s1DHTEISr2ObSNchf9xF8K6o+dh1B+yNjW8VQUJigSh122neOGMbpsp/ctVQOZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZ99iNli;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057BC606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 057BC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZ99iNli
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso176846a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794513548; x=1795118348; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T/wWb7fRaZUGBhzDhHV/eUFOWgluySiOaHkvWzqe8FM=;
        b=nZ99iNli759lMAvhBbAMaHI4hL3nQwqz1Nsq0QOZXT8qpzrscDd3JSrlc3xG0/w1ss
         Nm/+eLkmQRT1o7ffssVqdFEfKY1Tg0f9G6j1GiHyJikbuFchJSqkXb4hrb/POXYl44Xq
         YBKDZRwUjSdmcl87FPpc9Nguo+mzOXATLf0hIs1F3C18yIWDSQldm7zk3Caxcl7TSoxS
         RrFf0GyszcFOdlOVRqel4dF/0Sa3LoQMY2vRsXDoHxHkX59n7ZJLg4VHdVctijhiV6he
         KAY6C72+00GzPDhM5Tk2cHQ8TnLprNZ7kmUEqGJ7NRYrRdqhaFRESOQdzlX97UQqOf6g
         lipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794513548; x=1795118348;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/wWb7fRaZUGBhzDhHV/eUFOWgluySiOaHkvWzqe8FM=;
        b=jdfaBLMc0KDJiqzt41opQWp0Q1Z1i43a0kCvXH6SC3GfAf/zteQFlCrmXBz1+2Mut5
         cZ3aGPCNfdJxYrWeM4ia1DSDdDzL2pbMtvD9UPlnP/sH4XfC7hbs9sM6/aFXHWR2wbZD
         1Dm8z7FzFstxq5f74b1uAbyEHhg1SqmOwUN4WF5to/dGH6PFQF/Kb1XZBBtkxs5mrH9/
         yrguoVT4Q8SH1JUjn6WBHldF8qhE6Oiodd4znr4IKIpgzuO9IkgUfrz163uf/dufVIFJ
         phJFfQxPrLrUQ0py1tt9W92cPMLsBjHHEHlSWQMYPkLtuWflf8sbrjPwX919XqwwcfyV
         ITzg==
X-Forwarded-Encrypted: i=1; AL+hErGlimvH4VXkIK/EMHYXv1ke/UontHPjib3zRrWL5esgHP/Yj/AAhzzlW1UUSe24HXYD9jZBgrqnf7oT7oE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f1neQ731jR0iwYmSTuCc+iaLek1J9C8j0aXeIuXgkza2fTG1D
	7ZGtosxBP1pqcrn8KiWTKltWSdbA/9Y7EqiDpcKb0ksHCYuK8A081h1D
X-Gm-Gg: AYBFou1FgVsuYdHGQNv5bVvolpqarLseZF0L2a3bbcN2TECBQvvYyI6ZEI3DebG7Ip9
	I2RpYDz+dY0zaumYkD6D98/jSM0GtZOWOeBslg5cMrizOMVMq2rkDsQoxiSq29ex7r89CeNww64
	e8cpZchgm0SgbSa9PZg8ScY0SG/A9ULJ6yFL2p+L4sgJwrCbHHl9jVYEOhkMmCRZNkai94u5FCm
	VYGk4kGEfzxXu2Fm41xdpmwHPvacDCMdvE9OfVCRdDN6PMfRYYgtXryiT0p23xHVR2N1qCJx8tX
	LYxwnEfwlC45Kq38OTMtKpo3i+zsYVlrrEuNIiH0whSbYCd2AdWJpsyzBdjlWZoVle5eUUm0XPb
	nNlr8mmHz6bA7eWjPiUlTmaG4kAJvAcTGO9EvHY1YqTtkQvE8ib7qmbtJ0mCHDcD4uQ6rQ8J1qJ
	JiR56BSxP8UJSlFKSQ5IRdDPXsvVx781ZfL7rxrEptGg0oj3UBCGsOkCJkigkfxlWr7zb30SiB1
	GLrDSqf4JfJUnuQ0lK+IoSQs9DPBGfxS8Q/UViMfJxm7Jb7+M5dL61+nGv28gxejpfL/0UlZl2Z
	YiLZnSzL6NpVL0NpOiWVF9zd06FZa3t3rdy2iVJ2ouM3PCOGfCqiJ5dxJAvcuyy+p/XotDMmKiP
	Bf8dfVuHeSdHKXxz4Hgzx+E8RjoT4pgc8kw==
X-Received: by 2002:a17:90b:280c:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b1b0b669camr123766a91.12.1794513547754;
        Thu, 12 Nov 2026 11:59:07 -0800 (PST)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec3a903sm838062a91.8.2026.11.12.11.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:59:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 19:59:06 +0000
Message-Id: <DMTHYMNVPCR4.1GZZE98IRO363@gmail.com>
Cc: "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: Fix soft lockup in fd_array_map_free()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Li Jinyue" <jinyue.li@linux.alibaba.com>, <bpf@vger.kernel.org>,
 "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261112122015.3356106-1-jinyue.li@linux.alibaba.com>
In-Reply-To: <20261112122015.3356106-1-jinyue.li@linux.alibaba.com>

On Thu Nov 12, 2026 at 12:20 PM UTC, Li Jinyue wrote:
> fd_array_map_free() walks all map entries to assert that the map is
> empty before its memory is freed. max_entries is not bounded, and the
> free runs from the bpf_map_free_deferred work item, so with a large
> max_entries the scan occupies the CPU for a long time without a
> scheduling point:
>
>   watchdog: BUG: soft lockup - CPU#1 stuck for 26s! [kworker/u8:5:8894]
>   Workqueue: events_unbound bpf_map_free_deferred
>    epc : fd_array_map_free+0x7c/0xea

I don't think you root caused it correctly.

pw-bot: cr


