Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC822E2DDD
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791223330; cv=none; b=QSGonnbZJDZqY58JVA8LQnMpgSoTuxEO+hpes1V9sRcSS494wRXXbJEV6US8OxoU6rFQFBr91n9SRqao8wjSq2i03G2usZYFuXMjO7OYjSdEaAGcVz9ix3etEH1lpOxMvNm95rINCAvnWxjcVi/C/xbI9S1vbFISkG+1TtZenqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791223330; c=relaxed/simple;
	bh=k+Sd5IRfr42qzga2kRtE0wB4KL4a3GKKQis3oo1GrQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tw7Wc1zWEquhNF7adkOBbAm88t3LnUoY0j4+W7Cccwh8MVM/MzCo5hOs6XtFNkXZ0IpOtE8DEPJvbVekdqoCbyK6KvZxaMMS8lPmHK9op9y38561vfKm4SuXY2kb0GB/MLuQmCF3eTnmqhuB2+T/8j50lLKCh3SoByS3P/k4ZpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEUQtKG6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEUQtKG6"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so13729185e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791223327; x=1791828127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LnVgwZ0Ax9BPhjLqXni98Fj4ELNlpNrDohzywKqSoSM=;
        b=BEUQtKG6/8A3nob/74qIYsG6bgRBk7yMLje7R5uc8WBUEp6c00mOfkaygmV2eka/w5
         41RBBUv5MAxQJccdv57ordEQ4LSUy0Mwr+P3y5qMZrvn+bublFoxtHNKRJ46Pbin2/fs
         OKf77+0AMzs1nf3MY7kOUlpFnz8MV1LOUirtLlUVET/Ifs3NsrcN91M10Fi7Kz9TjKmi
         qc3th+XJVspbGd6FthtQEa+uPyuMq+Ls+U9afCuDYVlsSd0kvwK/gQmHsAoQqqno6zVx
         YCdPcEuhMXH5kHpSyN2bzeZkHuG+3RKKtTCnvDO+O3dq8TPkP56y6QSZmWOOTukV7KQ8
         bHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791223327; x=1791828127;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnVgwZ0Ax9BPhjLqXni98Fj4ELNlpNrDohzywKqSoSM=;
        b=MAYA4wSPw8xXgnsJZx0Hwd6uyUOikIEj+VK3DeSy9Z694twQwkGIeAWV1jBl8BGKPE
         R5mmyFOEY0leXm9Fsw/w/Ci/xEmq0Cu8PgzaBHa2ucZLZKNl8WZrN4G46x/5dqk+qrrh
         thOVPbKr/Xt1hrqZdEoc41mxN6LYd7F6IZjOk8SHys9C4kEOHP/xR5u//rSXo7DdjRtj
         +LRG9B0KgqfRmkhWRuV9maWl9wdOf9On9iUR3A8HiqqcHkyGQtMk2PEa0D3WdMDl7fXx
         4XQ6q+uXZCrFUc7cX5eVEwF6sQBYZ9ie04eP89D+OHgWHlLz5Ye9FUU712ykkmEYSMzJ
         Z0Ow==
X-Forwarded-Encrypted: i=1; AKwUvBxn67J6tBXzgraYGGU4sMbH2UOGl/FAoHoXSZ3A/DTov9lQzy0Iwkc9QNecR9s1aSUC13yDVr4qK3yn5ek=@vger.kernel.org
X-Gm-Message-State: AFuF++nTyIGZy7CD8kDv2pvRfri3pMr24lryRx4h0LNooiD+TbKmvTE2
	4DFv3ZAwzmAiSTvPrFxcZuW1Cp7e0CSHh0JmJKEGYxPO9aoE2ymXTFZA
X-Gm-Gg: AYBFou0yq3B1p2Os0CmhO4Xw35qlVrJ4qQ89x4mmOZl0e1bGiZqKvsowDholflvn1+l
	VpnU8v4kthdJ/7hrw8H14sFg8mRSW8hSOOakONxyFVhol2dnHYlv0tWWCVpwkv9O9O5X0bpdq03
	SsvWnRW0GN+K43MiBicI7r3avDBEqv0zIdkLChyBW4m+Myttl6NhatkE12+A24BriG/bTqQJJ4x
	nyRLkXbYuV73TeDIhL0FAO3k+8sjYaAAe7uBpCTvbNGSwqp7bSHECVImZ1D65+MgYrbi4fR9D9d
	9gl+AXyEURUIb673gHrlmEgm1U23KGoDP3S5YngwHmcCqsOqoIW6QHRfCEj9U9CBB1oyIhuFfse
	Lg+IbZXjYgc5r8NI/CRiN8UF73KX90Oq4EyYziQAepKe98FN/pRIwM/kf+43OI6JMJ/cG8FEuaN
	MHwobj9ObkaaSAK1jOiZctQPOkixZFEoTDmeqNT2wzVxVbUmgn0UmlHU+es7fZGzQNTF0uMp5Dk
	VjTfuyoi19WLM5svNPujhK4x3ksHmlWqyw=
X-Received: by 2002:a05:600c:b95:b0:49f:d087:6526 with SMTP id 5b1f17b1804b1-4a168106239mr136305905e9.34.1791223326914;
        Mon, 05 Oct 2026 11:02:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c4008esm7441325e9.6.2026.10.05.11.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 11:02:06 -0700 (PDT)
Date: Mon, 5 Oct 2026 19:02:05 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: akpm@linux-foundation.org, vgupta@kernel.org, guoren@kernel.org,
 chris@zankel.net, jcmvbkbc@gmail.com, arnd@arndb.de, paulmck@kernel.org,
 glaubitz@physik.fu-berlin.de, ysato@users.sourceforge.jp, dalias@libc.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add two-byte cmpxchg emulation and wire it into
 the architectures
Message-ID: <20261005190205.26f17469@pumpkin>
In-Reply-To: <20261005120700.383058-1-brads@mainlining.org>
References: <20261005120700.383058-1-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  5 Oct 2026 12:06:57 +0000
Bradley Morgan <brads@mainlining.org> wrote:

> This is v5 of the two-byte cmpxchg emulation series, reduced to the
> three architectures still missing after Paul McKenney queued the lib
> and sh patches, ARC, csky and xtensa.
> 
> The v4 attempt at these folded in a type checking idiom,
> (unsigned long)(0 ? *ptr : old), meant to make cmpxchg(&p, 4, 5) fail
> to compile. The kernel test robot and Vineet Gupta showed that idiom
> breaks real callers, fs/crypto/hooks.c passes a char * and an
> unsigned char * to cmpxchg_release(),

That ought to be a bug...

David

> and the conditional expression
> then has incompatible pointer types, which is a hard error on gcc 14
> and newer. So this version only adds the case 2 dispatch, the
> declarations the architectures already have are kept as is.
> 
> The ARC sizeof bug that v4 fixed along the way is in mainline
> separately through Vineet's f050c3e61d2a ("ARC: arch_cmpxchg_relaxed
> to use size of pointed type not pointer"), so the ARC patch here is
> only the case 2 wiring on top of that.
> 
> On the why, RCU previously used single-byte cmpxchg(), which is what
> motivated cmpxchg_emu_u8() in the first place, and Paul has now
> queued cmpxchg_emu_u16(). Unused new code is frowned upon, so wiring
> it into the architectures that need it is the missing half, and
> there are existing workarounds for the missing two-byte cmpxchg() in
> the tree, _Q_PENDING_BITS for one, that can make use of it.
> 
> Per Paul's suggestion each patch is standalone and can go in
> independently, they only depend on the lib patch already queued.
> Each one was build tested with the real cross toolchain, ARC with
> arc-linux-gnu-gcc and csky and xtensa with the gcc 16.2 crosstool
> builds Vineet pointed at, W=1, with the macro instantiated on
> u8, u16, u32 and pointer types, confirming the new dispatch is
> reached and no new warnings appear. The pointer instantiation
> covers the fs/crypto/hooks.c case that broke v4.
> 
> Bradley Morgan (3):
>   ARC: Emulate two-byte cmpxchg
>   csky: Emulate two-byte cmpxchg
>   xtensa: Emulate two-byte cmpxchg
> 
>  arch/arc/include/asm/cmpxchg.h    | 3 +++
>  arch/csky/include/asm/cmpxchg.h   | 9 +++++++++
>  arch/xtensa/include/asm/cmpxchg.h | 1 +
>  3 files changed, 13 insertions(+)
> 

