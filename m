Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116524;
	b=MC+NcdcRef14TzzXgiFhY7uUQQDSzPNqXQV1eQqNQsFnirp2m9Bc/5s2ymB4K+6eN/OK
	 Kc7b4ZVC8DLcSTj7u2lwEWJlSLV+/CfMjVJR30uniLg6sscyopR/OlPef9O6/YfjrI0uU
	 3doZettlKl8QukLxAfHaw2cfkes3ZHo7uJxUX8Wo4ouBlWcdwcD26V2iHkGOjVEM9VDoU
	 GEQbet2isQgleL709J9MQgBVevG9aE/AonjTMKeWNZYT6KT0+GXxzA6VP3yzPHRNBHwMb
	 FLGhvAsnY8CUePq68AjCyQADTC2U0DpFgPy8eIrJp9y2KwVJgfos5yHMaNMrvfhfadA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=nHp1TENsueutwPVZ6BBxO5cqRx7uVSB0t4XvedskQ9Q=;
	b=sz3z7aHVEaIasqW+PXykXJqd0BJ18QUdJSq/K0AiTzj7mDwLZpMTKquFMSHWHmHx1BMH
	 mjJLvudaWpOXcgWdvfh2Pd6UdCtggaXLuUdpUvlD36HeL9FjPTTWo4wC52PyZZGFwxRuy
	 KHPyLxCNHmpBA4zRKltcRkujWTlSqkXzZLsrJ0eQQvRt/0j+hIbUtgDTHfENC7wWBiEVl
	 RfsfzAkn0KcZmq9/Eqo/6pEnx0WvYSbbjLGjd1SUViM8nP0k7ZGWrZAtNQItwdOr46RpW
	 nQuOlvcUotR4xNVRmFNKUPO6YJtF2ewBUqJ6OoZSmNYKcAOrYcloto4ojC1ykiZ0qtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YYAtO14g;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB37606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB37606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YYAtO14g
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e98798cbddso18557445ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793116523; x=1793721323; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nHp1TENsueutwPVZ6BBxO5cqRx7uVSB0t4XvedskQ9Q=;
        b=YYAtO14g6YyipYU7Xy23qUcfcDgX1naqq2UP38OzSC6pbPNZ1WBHPCgKsXfFidmHct
         oEExOd0frDeV5bshZkEldn67Co4G5mLW1orBx7QKN/kCyiTWjNXoP9tGmaCNUGcu1ung
         PIDUkv/K4opp7kJgggzIcZCJrAXyXv3g3IQkuJB3/sLo77jcdg3Op8g+OhxXATeKPSlq
         e/lr4nec5SHCWqzDi9GVhueAp1h6Rk++2rng8S5GHOXMyG0+Mvi3nY35+N5k/zJJvDkG
         PJ7dwvU9ubNQARd6CGAS3glOAcJa2tNw+awYAdqONi3sgaHaeLl6Fo5p7gKzOialWq3a
         WZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116523; x=1793721323;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nHp1TENsueutwPVZ6BBxO5cqRx7uVSB0t4XvedskQ9Q=;
        b=o/0A0uHCx3JGfz2Yj1LZi0UZY6G1tV3RVCHuEaH6MMhNrOi4V4ztAOiXmjm23z1lBU
         uvl/6ByKBzaMZ0jcZFn03LQN2YyNYDnw84KSXyhOqRedvFQQTb7iSkBybKUQMCA0KfuW
         MC3STSK2mVNNa8pClLtw1Qdh/nj51J5PbRLIPz4shfgSjdvJsZMGG2aBGawRz58T/XtW
         yQRkHidDXyU4t1esHBxlaNHo2pXkOnCEg4s8upTZj/j0jKmvjM62WCMTWuQvvX2uCEWc
         cIsOEsRo22P/kFOEfUIQOiYMa2IpE9HzdRQZOdMh7Xh8CqaS1/uB4jii1SHpeUKTOvHS
         wD7A==
X-Forwarded-Encrypted: i=1; AKwUvBxx1EsJSKBiGzWI/ob11/9uRLLRK83vAhPp39T0r/Iu2npT6IkljY0yVYzJMZKU4vKl7V4Mqk/I1dxL5YI=@vger.kernel.org
X-Gm-Message-State: AFq9FYINPe/6bJWfxrHqpHWzviVFPaAdYh1LNu2vtnN40puhHre/AOf/
	a7wyyYwNUBP0vrZFIwFAcuw5EtTn19Nlcld164yY8BAkwFvy717BtFrn9jh99Ho97ko=
X-Gm-Gg: AYBFou10Lh3CRtdyroVa8NCQfk/aDLYMzv+bQ2aaP8ZY3x4BhdMAX5aE1hBgy4g+xHq
	8FbPL9zW4uPJiYHgEW1uK6LjmRvPQ8axnuT0ZWJRXJCtCdR2T6ODnFU1SUBy8fCQjprEIHSfmYP
	Xv5aEffnyEuY4zfKLHbi//EnUCmI+3cc+QDrGzmefhvp5Y1wNjmubYtqs5csBzoCjnOr8grvPqC
	0p234+i3Y2vDiv3sy2heZOGP7iubNE1mzYyxj1KyOIFYnD24c1OsklYFrXAsEs27B7jVNl/3opW
	S/O6A3hv6T8g9YzZWTNETNSm6yVs2IMvmvFYO9Ht3zeMyq+9+jOQLjpZFtPp99+WjNhCs1PqUrm
	3Vs8z2Tcu+RcTDpHfjA1xT9T9cBAO4uHUrtcxq6AqQujoheiDNnSmoicY+zS/fG+CPk7P9lZb0r
	IjD6Za2KLS/lPb+2JOV5WO0VO/4fgk6APyDleDMadSc1xAzZSRPXEfLp7BJuUxUdrLvOiw0I0W+
	uVTh3OaHf7nUnqqNZTIAD86NXyKHqBi97Vj2YFXTP93R50A/ar939FrDOk=
X-Received: by 2002:a17:902:ce0d:b0:2e9:851a:7188 with SMTP id d9443c01a7336-2ea9c7f6e25mr84880745ad.23.1793116523155;
        Tue, 27 Oct 2026 08:55:23 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c0a5:5d28:58c5:eac9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eaeeda3f66sm9720725ad.8.2026.10.27.08.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:55:22 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:55:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: elf_loader: Make
 rproc_elf_load_segments() more generic
Message-ID: <auDJaIHqoBSOxGHK@p14s>
References: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1793008847.git.u.kleine-koenig@baylibre.com>

On Mon, Oct 26, 2026 at 11:09:29AM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> I'm currently working on remoteproc for ADI's ADSP SoC family (SC598 +
> SC846 and others). On at least SC846 the memory of the remote processor
> isn't directly accessible by the main cpu. (The memory is mapped into
> the cpu's memory space, but cannot be accessed directly from non-secure
> EL2.)
> 
> Instead of creating another near-copy of rproc_elf_load_segments() that
> just differs by the memory access functions, generalize this function
> and make the driver that already has such a copy benefit from it.
> 
> This is only compile tested.
> 
> Uwe Kleine-König (2):
>   remoteproc: elf_loader: Create new callback for copying segments to
>     remote cpu
>   remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
> 
>  drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
>  drivers/remoteproc/remoteproc_elf_loader.c |  63 ++++++-----
>  include/linux/remoteproc.h                 |   3 +
>  3 files changed, 69 insertions(+), 117 deletions(-)
>

$ ./scripts/checkpatch.pl *.patch
----------------------------------------------------------------------------
_PATCH_1-2_remoteproc_elf_loader_Create_new_callback_for_copying_segme.patch
----------------------------------------------------------------------------
WARNING: 'addres' may be misspelled - perhaps 'address'?
#56: FILE: drivers/remoteproc/remoteproc_elf_loader.c:233:
+                               dev_err(dev, "Failed to copy segment %d to device addres 0x%llx: %pe\n",
                                                                                  ^^^^^^

WARNING: line length of 101 exceeds 100 columns
#106: FILE: drivers/remoteproc/remoteproc_elf_loader.c:264:
+                                       memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);

WARNING: line length of 102 exceeds 100 columns
#129: FILE: include/linux/remoteproc.h:103:
+       int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src, size_t filesz, size_t memsz);

total: 0 errors, 3 warnings, 86 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

_PATCH_1-2_remoteproc_elf_loader_Create_new_callback_for_copying_segme.patch has style problems, please review.
-----------------------------------------------------------------
_PATCH_2-2_remoteproc_imx_dsp_rproc_Implement_.memcpy_tova_.patch
-----------------------------------------------------------------
total: 0 errors, 0 warnings, 151 lines checked

_PATCH_2-2_remoteproc_imx_dsp_rproc_Implement_.memcpy_tova_.patch has no obvious style problems and is ready for submission.

> 
> base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
> -- 
> 2.47.3
> 
