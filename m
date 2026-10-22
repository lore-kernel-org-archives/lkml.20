Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792636587;
	b=VDGZj4IVWAsPXjaG0Q9qQCYQjw9XzV6vcmh+Pas2jluhu0EDuw8LPpiXDd5EWVqkEaU5
	 IuTD6dEVXHVSRX8JVxErsnHEZ1LpEcPtQw5I/ue0xGDsaPDiuLYUC/SSDfe29lNVdmk38
	 1SM8PDRofHx56Tzyw7ImRbGdPQrXSo5c/WrEni/aukkVhfrFonhiQSQklK7XZV1qSPS33
	 4ie1pLKAu2O6SKbVb7odEJ8MyLI9RD9Iue0b2umnBZPLVBiLsKERxnRJr0x21MQ9JgEev
	 JYjs+SVteOzFKPnkJg8GMOWNFtT2NaZsadwNzZ5RTN6RdVe++IWl23lSRE10FzkZp6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=OnfyzMLO0P5DWvV355CXnkmHdcF8VekAj3yYMzW5EvM=;
	b=DQo3BgQqNtO8zlsvK/27OitcWjwdrRqVs56incNa6OJVNBET97WInYdMy3kTGZ4GT2Zy
	 +8GkUbR97trNKozZrtuQL0XoDJxJLQRNMz7XM/LUqfY5NKJD2gFcnvG479Vsb4flRYPUT
	 xn505/Q7qLO8IJ+l9eztfj3p6s6mEWs6WMVplMExoVlDVMnOck/2snAuMhsGOlwMeYTAg
	 +Mc+GjdYSATC1cbUZZ/ZwgGgfTE/W3YSZ7k+WXKjik/P2dZCfFbHInsNPA4psPfL+3ecc
	 qDrbgXycQ2j2ojwfDi5TJCH++SMHx386TB/2H1a7KdlErNMcOn+V42dGOTu8PtClMNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FEA606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80FEA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-536605c4d8fso9233701cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792636580; x=1793241380; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OnfyzMLO0P5DWvV355CXnkmHdcF8VekAj3yYMzW5EvM=;
        b=DXfRIZohrO6JOR9N2TQfXwi6cS3IFf0u3AYrwtcV6cAz/rVDD7gYA/cEnUd7wXfC6H
         sfSTAy7j3LwrJCHxVAhzWFOpiEsgVwT/fRT6BmOjP8g4NxugF58Kv64hPA8hnbMyMMLg
         Bn4uk+VUNjJYH35He0ZZnX1j8fnuR9z1X+77UXRo20wYlj3BIhM4ayOT/xvxHjPPdiU+
         FfSYeOstSqlXfhKWllHX+JM7bKGrsEHmlMhl8dWpG2+mPCDE3Y3naPT+E0bU+/a3txYD
         pdUabMTzTxVpr1fgM8p26nP5aBPgBmL9e1ItEt0i/hYPGLmhUgvgszhgzDYl95JPGZok
         h0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636580; x=1793241380;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnfyzMLO0P5DWvV355CXnkmHdcF8VekAj3yYMzW5EvM=;
        b=Q3IFbYp8tfpZd/SjdoUCa4DShdeUiK8D4Wk6dbxciy4WXBnhQUpJYQ9mwqgOkY0JwL
         4piCquY5tdSzjvhzS/OeK9y/ZH/57IqRSEzEuPcXs/hE0brDYthH1caqcH4Am0IBMsM7
         ohNZvAYCqpArhlHWapauA/SGwg6j+T+yOZM0e1W7r1NCfaVpvRBKssA8YhvIZrvq68IY
         fgPDd1N/9EQ8+Hs2JGJKYgZJes1nCWGLMq9XBhyQiZiOpM4tTOLRa/7OrpNFFS67GuGA
         +hnCQsHMJlJc0e5udh8+HIuGmwBAJasPKThaYck6kgUJmGOHHRBdbHA1Jc4lo6tlU36B
         2Iog==
X-Forwarded-Encrypted: i=1; AKwUvBxA98xyUi5JdRGBCHgu2VP/442LLRBDsXhJoukESDrSjPTJOQmTwiKAY9dfZPjvNyXtwG3b6PXAtzsC2FY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3L1O9jWbrhQyphYZNcLHYKuHX3EOQAUfX/CDwTSALugOhUk2A
	KNSVTlyB5UqG8LEkbx23F8/9Nvfbdol7//Ary9bzNIDZWQnktB2sP6L8xjROv1tM8a4=
X-Gm-Gg: AYBFou2EBnZCbqm0XNgb7nFGgXlYhECRk5LfEcAEcFlHN9+HbHhcs2Hqz20Cr6+HZjU
	uHSMDEtn+H8H5sClvM83tbyowi6CXTUxOllFc8mYOKOgpbLmTo0rBgiAPXSY65dD6BBo0K1UZ+m
	luhIleKso8QfLwIVPSBMKPthWiicTKzeKatHH5C5yx/YXz4n2mQ10fXUuHjPleLDS5S85SPeDmc
	/H5c7Tf5Pyecl20ryCwZlGEMRkT4+0VY+ScRfMBnadtsGJT5JJtkK1qdcG3ZcwzhRNBysKAOrbN
	FmgrunoSFlts0N7K7xiCVOqDhbKKYMnQ9ViJ1/8tBV7GwLux+251xMYgnMa+Sjrr1TchXuaZ4Bf
	fIfqGeqtRL8l1X9MaZnLP2X6ZAECtj6mwWPjHNd7NjQyVpwSiS4hOM5cVonEk76pWMCI1MvPZ09
	NndIHCB/zs3MWcvv0t89RH6egAAnLgmmHDVymQFHVUv0biV4x28opHd3N2S2CpihSnVtVA7GnBq
	T3cBY8WKpna6kHhYg7q7rkVqCXzcpdkwbEBolc6Ngdy7lgAhrwURmP/hMXPJ/ztHuCgWRQAgD5W
	DOiRq9mGJ0UE3IvfZj8n6JxiBfc=
X-Received: by 2002:a05:622a:4cd:b0:533:2bf3:3301 with SMTP id d75a77b69052e-5369b86ae59mr66504611cf.36.1792636580301;
        Wed, 21 Oct 2026 19:36:20 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536ab73b09dsm16032801cf.17.2026.10.21.19.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:36:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 00/12] Virtual Swap Space (Swap Table Edition)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com, 
 hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
 shakeel.butt@linux.dev, yosry@kernel.org, david@kernel.org, 
 muchun.song@linux.dev, shikemeng@huaweicloud.com, baoquan.he@linux.dev, 
 baohua@kernel.org, youngjun.park@lge.com, chengming.zhou@linux.dev, 
 ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
 surenb@google.com, qi.zheng@linux.dev, axelrasmussen@google.com, 
 yuanchu@google.com, weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
 haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
 baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
 skhan@linuxfoundation.org, rdunlap@infradead.org, kunwu.chan@linux.dev, 
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, cgroups@vger.kernel.org
In-Reply-To: <20261021060323.553433-1-nphamcs@gmail.com>
References: <20261021060323.553433-1-nphamcs@gmail.com>
Date: Wed, 21 Oct 2026 22:36:17 -0400
Message-Id: <179263657717.2549665.11401372071846447074.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-20 23:03 -0700, Nhat Pham wrote:
> B. Semi-synthetic Workloads (memhog, usemem, kernel build)
> ==========================================================
> 
> All values are mean +/- standard deviation across rounds.
> 
> Test system: x86_64, 52 cores, 64 GB swapfile for all 3 benchmarks.
> Swap backend: zswap (zstd) with the traditional active/inactive LRU. We
> focus on zswap here because it is the motivating use case for vswap.
>

I get that the motivation is zswap, but it would be nice to have
disk-swap performance numbers here as well right in the cover.

If only because...

> For each benchmark, we test 3 kernels:
> * Baseline: mm-unstable, no vswap patches.
> * VSS off: vswap series applied, vswap=off, to verify that there is no
>   regression to existing swap paths when we disable vswap.
> * VSS on: vswap series applied, vswap=on.
> 

If the numbers you presented carry through, I'm left wondering why this
is a boot option and not a build option.  I rather dislike the boot
option compromise in general - but other reasoning aside, if there's no
performance impact, then I don't see why it shouldn't be the default.

~Gregory

-- 
Gregory Price (Meta) <gourry@gourry.net>
