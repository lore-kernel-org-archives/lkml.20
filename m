Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8D3400DF6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789205336; cv=none; b=rYUauxTCCjR2CMBJpQGAe/kj7hSDXmjlZRMQVKOgUgPhmA5ez873LkwIg+ceTJOnM9in2/79eUEO61x5KFp/kICHdse/2y4RhBnJzKXlE4gRiCoOnkhwJTXdpbRkiklxw5ZkPCzHADuN04zY5vn1Fkjp8MIwHleiCNE99EbkhmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789205336; c=relaxed/simple;
	bh=irnNQGM4SxSqT6WlZtxSSdiba+n3L62mlvpQAyinunk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QW8wpYxE+VlYMc/B+Od84NZGlDlrtdkYgPOfXDX3SPwOW1dTm1HShX/jddMtnnPHfu+6uR5MogKm+Gj3lK3KS/j3VF8XzyqTab2YKLJze2S5W1YSI98kt8dqGVyu4KR3CErVo6F+KvFjCKs4o4lvJc5aCaSQAWf/Qi/nRlvaPak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rSV2M65Z; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rSV2M65Z"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874fso153217f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789205333; x=1789810133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oZB+hcVlJrpLepGmrLZu6QnJEDDc9JmtrXYXn1Q09aY=;
        b=rSV2M65Z2a6wgtai4cv8SOvcONx5Gs4e/aajvyCPYH8Hca3S6TJ0NHtBVz7fYhGv2X
         2NiqiHG67rY4DyuDnils1/BJA1u6IsRmotjVLz3BJ8uXRkLqq9/wPTp6nTgIH5mSEHA1
         YhFvEiC6OOUDZ5IFRJXgsYkBKMC4uDyXz6WyeEuI1DiVCebPj1JyFCQGP3Q9mo6PFJid
         hhpud0Dr2C+Paz+eet1Ghc8jndc+qraJqT7XYxZqEBQeIXkcxsj4t3Snq8NYa+8WqPnU
         nYKBoaL2vh5SXidY8TCfBEYdJQrdHsgr73yIQ572dbF4jk5d51rNYnz1avSiQAPkUt0H
         YGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789205333; x=1789810133;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZB+hcVlJrpLepGmrLZu6QnJEDDc9JmtrXYXn1Q09aY=;
        b=rYNRPGCjaGYp3V9JZ1zdb9jGcRqD4jpvPnkq9j7LaAqdVD6CEu1M9Gd4Jod8Kgk49V
         4z/DMeCnTDGOxVDZ8bRqCe2dO7LcsjTPYEoCFog8KZuwsxnxUsMfMZCFRrweUX2af4qW
         gcAUYChGqR/LYCwMsPj8FVgjoONO5Z79t6fWIoYK2EgA2xhrsAN7AxjoQZoWE2dx0vYR
         2kveMuhkVb/9pO2z5d1pe5IHHXcthm/1z8M+c/sMtW82tcX5P+XdmcPUBdgg27Ffh99g
         iVK763ctIFA446ON6U4vJtTFmAWtcc7DpZP3sm7TTS2HcJynyPIS3Ph7p5MJh22IltPy
         RoWw==
X-Forwarded-Encrypted: i=1; AKwUvBys6RJ0MLJ8Jn+m0VCDt/1rbarbc5asx5PIZQa1nRPrab5VJg15GzFTk+ZBoX9BVTzyHwqUyyi2xWZvdt4=@vger.kernel.org
X-Gm-Message-State: AFuF++kxnjmAq/Q4jgNoA6pLp0vWamziRiL88VzCcHe2987rrVQAZeB7
	lZy2yTXn/DqvjnyuMKVjCoT1qiV9Z36WB6wp20/3RiGfIc0+teGYS7Oj
X-Gm-Gg: AYBFou3OqKENs3zmV9crpxk5Klhj1kKD5ZDIA0VFtKlEC7V6Le2pyuoJ9GVtOPAFBMs
	wnHuaz3onu6qvcPWmjny7HTp4wR/7LbG3fRFDeq6RV1p6W1gZ20xy5YiNZjFPMSeg8iloGKVqPI
	srUwpC6DU+Wua0BW38+aqG48Tgnkl9FTJplp0VHBhlnCGzGfuBNb0+lKk0wrbl1K8mtnfZuUmLL
	ocvhHlbC5Grqxl1weG6ViVquOlzyeGLLw7kdTBSspK9LUsPbFsXBdmSzCnEJUXKzYxb3wwS0LmT
	qvs07BFmausJGePsXbax9jORkaHRQA1Qgxr5BFucsm+OAUUYR3kvxOGgL2qEyo0O9gkO72FjJx0
	wlF7wgydHNtAr8B6VsNVii0yfGK6GGlajiFbdCDO94VuxDm/Gytx2URKw5eRGppaEx5PMP1NJgb
	2fVUzk0A9VYk+l/1Sc24lsCjtXjxOTt7r8+gZyGZdAHZlwt2YQdQ3GmLKMTmuMKEqQ7eCBno0E0
	s9Q4EDixJEhZtPPVV/PqmQtTCPQA34dXYWzLTyKfJ20thQNLehxx8nPtTc5mFhFYXqI48kCpBxS
	11qfzacUQ0EzV4nnTrxyQJKVnOgaGmdivYxrjOgLX63N8wALroqlrHn+zYBl4tXRyvlanBnK464
	=
X-Received: by 2002:a05:600c:3509:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49e61082a1dmr93634965e9.10.1789205332807;
        Sat, 12 Sep 2026 02:28:52 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c0cb676sm50621125e9.14.2026.09.12.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 02:28:52 -0700 (PDT)
Date: Sat, 12 Sep 2026 11:28:51 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Marco Elver <elver@google.com>, 
	Bradley Morgan <include@grrlz.net>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kcov: report the first spurious PC in the interrupt
 selftest
Message-ID: <aqUa5t19bDfcGkqP@gmail.com>
References: <20260724192122.73080-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724192122.73080-1-kmehltretter@gmail.com>

On Fri, Jul 24, 2026 at 09:21:22PM +0100, Karl Mehltretter wrote:
> Changes in v2:
> - Use kcov_start() and kcov_stop() instead of open-coding their logic.
> - Add decanonicalize_ip() next to canonicalize_ip() and use it when
>   reporting the recorded PC.
> - Retest under QEMU on arm64, mips64le, and x86_64.
> 
> This patch improves the failure diagnostics.

Friendly ping. Bradley has given his Reviewed-by for this v2.

Thanks,
Karl
