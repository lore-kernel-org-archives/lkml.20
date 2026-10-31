Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793449239;
	b=PU9qsWcM1qRnLmXO/rJBnh60BngPxM/dV7/STsinuO9Sgnr2koYJP1yoIdtOQOHcHzw2
	 6/DIbInToNeC0gILcMtGj9t6SD7YskotS7RWBlC8eb2q4sVQFaum6zeMEI04Q9XUmema6
	 ahg6MCPKPAE2E+f0qgIvTqyjAX07lmR4oR3x5j5qk2Ea5S9IgEchdb+GDtJlGCB3aEm2G
	 5A0G8QG/X+sng7TYul0yhfhawtzf4lz3iXpc3eJ+l7eFu5+zWFi1jiYb2BAYHuHN8z1uR
	 ElXkhYp2p7F2H4VlvP1QTQxMgbUlKsOpEidwieltCZ6fGl3eboh8kVGEUoQEeNbGiGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793449239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9bOAqTsOXodJ3DV3e/3hRQIH3+U18bEo6K95SKJR4yg=;
	b=rpdN45nZ16s3csh9ykIzBPbdDKfqenyNA1dgMQokjQkJT0VrPS1SeGhU0uMPOLhq6fBk
	 M9ttQwTU9b3Q5D1f2ozRXSYGMUmuPLyPWDg9yRTcqjeywvuJRBn6cfrgei6WaU1RSYSA2
	 eUsjF0M76JYRjMVXgGHL+PELIfxrgiQ/YE3F7jU1akno0NT8jaqTOyqHgRpEKRVXgolhd
	 bD7ge5mxg2AXyGgk8RmQ3jyL5nUknk04VMD0Ro482Vov2l/H4i1yHil0trZNNsQGRBLfl
	 wEmV8WI+QOTxG4mpatWxz1PrlT2Q2rO8GOTuqwedn13Oh2hp7wKpUIk3CtqulKtrEow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dq5ASzGC;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94D5606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94D5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dq5ASzGC
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1931ff67a29so1506612c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793449238; x=1794054038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9bOAqTsOXodJ3DV3e/3hRQIH3+U18bEo6K95SKJR4yg=;
        b=Dq5ASzGCUCbP3s4CjHUCJfbiI8248Fzg7Wz26kY9mjEVD5/Vu24MzJrU1vY5Fa4Zhv
         5Zfa0Lal7zrKL9fmuC2yuzkzvh5wULU9Dw8vOllwRZdcpELHXnxE2wHO0nWfgWQBjEfJ
         qpSgsb5Gbhkb3+6TLJvyGGrUqHjjg0txczDZeWGX4ku2K/sbbE50qnKOTcclq8eHRzDI
         NYyN/HcRM0OvbT+emolv23gU3ZmKkPbKjeFawzj8jQInJX+ZxjmErCatMn4S9HxfAEbN
         zYPZzIijoWY757+Y6IGiFJ9mesnNnOPxh0b1HKtL6TX1T68ajCq1xF1sI1smVofJBEJe
         3kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793449238; x=1794054038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9bOAqTsOXodJ3DV3e/3hRQIH3+U18bEo6K95SKJR4yg=;
        b=V2d2RqKv8sxeQaWP5OhBmvr52hRNzg2NADbm8HgMRA7FMOlzUbSRz9s9onDANJzhWR
         ja04WrsrTxoqwrFgvbPMA3E4HaoWqV3smrQGZH8mI0lkPwRiOzcVQXLlTALuruJTVefo
         J6VX3O83qs7a0yLxbIVPfzyVa6b51lLhWtw7xhsV8KnLNA1chznbANuE/KYgpWjGnazY
         sQ3Ar042ddDll5UZaR/CSkjOnlC3n5h0ZTPKljMhRbu8SMyGU0ziQieLF7Exf/+mtV7T
         Hf0A0LmMHnRcO79JrKTAc10Lh+iMb/i0ritOgjX0gik4/vPPoWUaIBjc6tDQmEj4OVxI
         NwNw==
X-Forwarded-Encrypted: i=1; AKwUvBwZ7Xx3Fxk9xavN85judwvL/XOnndK+68l45g6FAgfCLFx0vjabbvM3WXEH+Wf5FZEsaPSu6DRGZdvPKbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNvXAbIaE298oh8wtRM66kxYaUZda7nOdtVfTx+thRuv7enBT2
	poGWsC2ak8Lc0UF02xaG7sTdZewKm1JzmbonVToIEvzc3i90f/Kdo1Nm
X-Gm-Gg: AYBFou0fOUS2hmBPah43bJ1ix/yeqXd4trTV4mE/i+gTPPs84YhyFWNj21dQ+pg+K3b
	O3j4JyIrsc72PcjWxFhpPHfn1yeqrUFgBEkCdObSE4eHZ3dkp09rWEdDcCgcIeOPny8IuhioyK7
	S4jvDVCwmVBfm112zwvhMp8CBlfcFvQBI/yK3dxgkCQPt3zAth2GjhGRY3XafHpBG6fhh8eh9WD
	P8GxDYuzzZ4+8zPIqgQDTshV40tlvErKFD2diZblG5RyCHwD6zHZC4ozCaa3Ggi9sMd/xxzrWTY
	I+c8VFlAOVobAm0pvQV88O2cI/eBtMPtS02fzY3d03qp40GcPzgiYWgI722KCyI7ubvsH6Dk+Nb
	LwNiKNXfze/7Qlm9sZd8bCL5VXH/WgaRxMBTkq5OUDJOc6WOHCV4CQdTsJyjF73Nv0gZ9TCF/Jr
	PlYq04XfdehYqF2UG4k9ylyN4DCdU+1j2sSjZhadXVdoIRRcrXoxaMlbjTKleAKrHPxj54F4cYU
	wAi7GNls2KNn068F5Iwys/alJogwvh2ccdfl8dHX5FIdUjdFs5UprCqK0RVXgukswmeqhQM9AOi
	/fqmnepBXL/Pmtq9vcGdTspM+Ne9dRv5HUqZQ0AVUwC6ssBqOA==
X-Received: by 2002:a05:7022:ea4b:b0:1a7:979f:ecc0 with SMTP id a92af1059eb24-1ac5b7e1074mr6738341c88.27.1793449237687;
        Sat, 31 Oct 2026 05:20:37 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm26919177c88.10.2026.10.31.05.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:20:37 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: hare@suse.de,
	hch@lst.de,
	kch@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: Re: [PATCH v2] nvmet: preserve ANA log page copy errors
Date: Sat, 31 Oct 2026 12:19:57 +0000
Message-ID: <20261031121957.2808-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031083505.4767-1-sreekuttan2156239@gmail.com>
References: <20261031083505.4767-1-sreekuttan2156239@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

After further investigation, I found that the existing header-copy behavior is intentional for short ANA log-page reads. My proposed changes do not provide a functional fix.

I am withdrawing this patch. Please disregard both versions.

Sorry for the noise.

Thanks,
Sreeraj
