Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013018;
	b=EzGgcwke09mdhvhFXui2jOcQX1skAOlxMxIjtZIVxJZ+JAuJ1etxHsqbe2uyQXLM4SFk
	 sJuC4tYcRJi4rmGg3ZEq7BKrMoX2s18AetGjTKTdGcpdWFnLs6De1lpLufJYAfO8sbRdI
	 P8Q7FQhYldrMmlQ8rvstK3Y8qSN4IYAgrSPkUgzItevK3x0urH09bV94JPvBEFtSiCwGO
	 zxXms6yoetmeK2choOw3U1i3FHvNM/ly91ORWs2tvsrv+NYZ7tIA4+79yTYeN+pekj8ws
	 T8swTzc1bPfoUWXY7gCgJqusGfVWQR1mXZ28RZ/KOvVCDSHc0Pt7geiAtYpX93SUSnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WfWK7ETWVc6JPLXBBH1usp1GYHzRwLQXcJjehdWx/dU=;
	b=0ctIbOKDY/7lTi+PO9Ca1PecNyH5KTpAGfkvp2obX7u6B6UQ1uVlzw/btW8Y+WjkYteQ
	 2PdCUxfIFblPDKqrvB8tr675ECJABmUiuKsrrXPmvZ0XXopxR1suX0dzl1kn+zdHYmkZX
	 a+QcDiUtafL3Y7oSTPdkJheWX98CBwyYVuHs7aK7aO5pfnIFazwDnEMkFbMuR2yqPzjuW
	 YFnzRRKRhjeVzaqLOI2Jlxiu0t9gpDGrKqLbr3JSd+hfoCn6RmITOQ/dlUkn5hOi/860x
	 ECbLvfYnEupC1qEhDcXMRoByLg+Zkp1YY6up1rT1q0+A8i+8Ok1jYlZ01YK2mMgbyFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FF1MZ3tb;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFC1606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CFC1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FF1MZ3tb
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso29360485e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013016; x=1793617816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WfWK7ETWVc6JPLXBBH1usp1GYHzRwLQXcJjehdWx/dU=;
        b=FF1MZ3tbfMa+I3Hp68i+GoqS5xJQCOAdAEyU3AgVRrX2Vlf8WAQZW2Grn+avxiLLI3
         zdyFYKtS2WtCeGEOowSYBKYvnBZoK6tP4vh63lFMovCllUsG44h+mEz1IP6VvoGlkDXq
         YQuSCMIIKLJxsmdEVQiN8lNZVo4pv6I/vH4DE8Lz5sTIW+YC6TN0F79yue+AirnmCI1g
         hsyKgsxNOhuJSYTB2XYn2ufURC63XVMPEW+7g3mTqpw+6CTLsASK4oTH37/2KjxQhBi8
         ZPP9bS++j2T8OH77fGX80QI8Se2YofnpLSQvTal0KDEw2Pc7jKpHmlg/EtqEoG8Ga1WQ
         /V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013016; x=1793617816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WfWK7ETWVc6JPLXBBH1usp1GYHzRwLQXcJjehdWx/dU=;
        b=XskqzGzWXZPwgQLicrHNFpClTWke7w+4UtkHtqbwMdomGZ/TZf5P2WP57d+SFP1iV4
         StBbajo1nvyNGsAr4NsG2xXaw3ehD5KFBG+ws8bg68Rq9PioTSdD20eKGMowKD6EO4fb
         Bm3n7B58m+nGkOIkFGDXrlTYZ2hsgyJD5oiKYAdixU/HeSogSuusGh8legXKpxYnKZGf
         /EgGlbFxPFRsTKFB6bxR9q9rbyJw2XRJK129sh6N6+CrS3paUmohmFGfXy44av2Ue1Cv
         hMqa9VU2ECMWDMw9mjhgcWIFOUfWHRNUzVJ37tkTpt9ySd3+/9seEi/FQcLadgdW0p/f
         f8aw==
X-Forwarded-Encrypted: i=1; AKwUvBwqA+AAMpgDK4DwfUGQb6vaoImaWUVri26WmEBlXdir7Tbwa7VemHeiP8R1IiOzFH0WipRg79shlXsk5aI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0EPNzzGd99OPzGIusnR+diMW4fBySZF2mQjJpgXfj5kjMJcRp
	RtKJp7eg0OqUYY76pidrmRtUUnob1M5g+um08n+6gkZnF7kp14QiElRI
X-Gm-Gg: AYBFou36S7vDQ7P5HleXOBg92Mlufg04KGR2ryNGEnYiSJU7io2GxcYy0u3kehaBOLl
	deHNMF1uCe2ewExnpRNWdQmzkjRmj1dwCqn3uPG/eNvLWEnTN8UFD7Hr9T8duKrfrcSbVDACzB+
	X+N47kUD4NXDgH5sEMkfVP34cThJf74CHFbh+7N5zbPnN6KLygqOU5KC41Q3jjSHv3QaYV2fIuY
	RMAgLjk1JRcWl72Imtntt5+9VLXVievZduSXHhZtNzqdZCOkSbIz1M8gxnjPQ06vgheTs7DdFzJ
	5XD4vNBZhsZfjlwYs/OeaeJbCCZY7dSNe+HWjw9RAhubdyp+PfN8tpt6g6ybjONTSi9+dX8TA3a
	99wkK+UNwckpDxXB7SBsZMR2Y34ilKDFKXNcHyBEg45TYu9uJ9op+WYEWMMTmuccEAkjt8KvZHD
	WKaL9d0iFKsuc2PsTYv6eZqUmLHZSwAU++rWHsb/Pl8l0BN4ZJYhsvbo3EIWNn30gmiILibnRoq
	GUwuYFQVtyEXCAdKSU4pkAlOwfH2pinFkVEsVZ9KrzmVsSKgxrZUor/mQ53OI8GkIl08Rv9WH07
	qD0VGtaWL0aCJw==
X-Received: by 2002:a05:600c:b86:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a35acc1129mr115388295e9.33.1793013015679;
        Mon, 26 Oct 2026 04:10:15 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm499383945e9.1.2026.10.26.04.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:15 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>,
	Hao Yao <hao.yao@intel.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: int3472: Use actual clock frequency for DSM method
Date: Mon, 26 Oct 2026 11:10:10 +0000
Message-ID: <20261026111012.33347-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025162614.95385-1-lsa.uz@pm.me>
References: <20251208035122.2147678-1-hao.yao@intel.com> <20261025155048.42957-1-fernandorimoli11@gmail.com> <20261025162614.95385-1-lsa.uz@pm.me>
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

Hi Sergey, Hao,

On 25/10/2026 16:26, Sergey Lebedev wrote:
> Fernando, a run with 0 in place of 3 would tell, and your own DSDT
> whether it still matches the dump.

It takes 0. The DSDT on this machine (BIOS 23.102.143, 11/25/2025) still
matches the dump: the clock _DSM on ICL0, ICL1 and ICL2 calls ICLK.CLKC
with Arg3[1] and then ICLK.CLKF with Arg3[2], and CLKF does

	CLKx = (CLKx & ~1) | Arg1

with nothing masking Arg1, so 3 also sets the enable bit again on the
way down, as you say.

I changed the int3472 discrete module to pass 0 when the SSDB asks for
24 MHz and 1 otherwise, so the two 19.2 MHz cameras get what they get
today, and swapped it in at runtime (the _DSM runs on every clock
prepare). With the previous driver at 600 MHz, the infrared sensor goes
from 57.60 fps to 72.00 fps, which is 57.60 times five fourths, and back
to 57.60 with the unmodified module loaded again. So 0 gives 24 MHz
here, and 1 and 3 both give 19.2 MHz.

So the value depends on the generation: 3 where CLKF takes two bits, as
on the Surface Pro 11, and 0 on Alder Lake, where coreboot's Tiger Lake
and Alder Lake camera_clock_ctl.asl document bit 0 as "0: 24MHz, 1:
19.2MHz". v3 would need to pick it per platform. I can test it on the
Surface Pro 9, and I will run your driver at 396 MHz with it then.

Fernando
