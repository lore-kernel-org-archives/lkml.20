Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4289734040D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789844200; cv=none; b=iLSG0GjGnDLmdGMggLEjDLvPp7C4HUXY0uxzntwZReTIHEakYq79LNb3kblHda7BVbR2LMVqAkt6Dh0mrI8tpsM7eF0RlGrzA0qrcWgtbMd+ILrJh7jGaQ8CeDFMTzkLH33OsxSfisXBiZDtbN9BBobmyb6xP7GgFDLX9mYzD7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789844200; c=relaxed/simple;
	bh=QzcOeUhcQT30kOdtJT+OOTCa8SgVFGhsQyd1iqtHmOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXtcFihDm/CHcf6aGWqwVBLijefuTGZ1bzijvoQQSw5Z+xCChlGc2erOkLKq6o98yLAsfRd9cJCzqKvqODhWDTikDbevdGn3f97N8q/t577xezh+HOXt8c7hhLN8rmycaOpG8q4kchZkiz2w53C2sRjZTrMRla9WU58PnYCzIt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncEAR9Ee; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncEAR9Ee"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a67fa7a64eso2809879a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789844197; x=1790448997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzcOeUhcQT30kOdtJT+OOTCa8SgVFGhsQyd1iqtHmOk=;
        b=ncEAR9EeuUSwUZf6pq4IuRIRi2VAEc0PJ2iQsbEOvpIhliCjKONdAyBHSPxsr6pE3X
         8SbyoPi/OP8WGsHO5V2KIiv+A/8CNNQbXSvRRDS66Kn/YE544+p/nYmNxd+vDioYXDrM
         b9rtAxLyBPsb+WJYlayQFPPV/yLx3UZQ851tpX/zDmc/a7SVkVEhskCYBMVDbjZ0mDAT
         O0Z6CaRN1dOQ28xubDUju3Da5BmgSaB6hADWamRoJUaVbWIFoaL4hRR7WdmxVCiZuHs5
         0TIA4UpLw6i+JVQE3GbXkKL9kiPMWxu4JR17d6AKKHRZWkwLD1dTD2Uj1jz0UPQg1Xle
         WxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789844197; x=1790448997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzcOeUhcQT30kOdtJT+OOTCa8SgVFGhsQyd1iqtHmOk=;
        b=a6x+GOpj9TGmtrkhdT5NXPZ/9a6yM75yBMW+ljGTwRKNl3Wb8mgqTiQsIOE16KaNpP
         HDDpf6K5XAbBPcHYdwdBry1S3s82n2SggmQr8eypdQMo4ZVz5zvMRpRRyD4owMTmMEx1
         5X9hxvGoFW9G/X3nyOV3YTwsjLMfc0UTDebDbSulBZY2YiooheeX7yUmAFj9/fpb2ojL
         XgIeooxEJsPh3rhLap8z8HULnnu8bpIsZLIUohMq+mlW20sJPg6beHxmJwhnFoVIJRG6
         gmO80xrDRCMdBHpAD+FKT62NE7Ll+a2xcQTMQslUEtWT31t+1poK9NEoW1oZgr9TEczK
         gcxw==
X-Forwarded-Encrypted: i=1; AKwUvByBjrckNCPqoFW1+BvGIcNQVgUlI2YMwSBGGPBlLiEFDnXS9MbIn1KPHnVt5X/w6RtGJnSw6PL+sakGrJU=@vger.kernel.org
X-Gm-Message-State: AFuF++lWBjEqDCatBQ/sHUIGmADPqaOqq140se4lx7X/qOa9+QmQmLpG
	mLVcHYXTOE8eJ9ZOqtQIAXSFuiuzZTLqY8bsCd1hC9JhCqjlbhzQ4rcG
X-Gm-Gg: AYBFou2ozgiKG8G/rdjid/5UGeL2Or863p2tpQGM/Jh3PrqnyD2+Fibo5pv1rLQobx/
	W4ZG6Tlq8Yy9LuSV85NnEMQ/Zr2rBkmfWL4ooM1/bs0thQ4nBX6mqfEC5zLUjrL6K2imOr7zgwW
	ZMlfGgfukmNHx6uoC1G/zPK028x8ULpR0/mUvfq4lkYwHBLCDjSeZ65r/3vpQ44OBpK3WpF8iHW
	Df2pQix5bvCOQ5AThLhPa4008P1W1cVHvorKF53vQfsGs4dauax/LvXuCkvxjGRZFRUEShbJ6aO
	nW2+E4fNCrMBdEIS4JyTws/u2ClfrmFhDv65XGS5jFw49Dgae2ilT/Gkv96+jCw6hKe2CjF0sWy
	LyzBfk6MkJ1iv6OsA47FUBfDbRKe26qUNaPx9MG5yxRqeSuVyAlulmcHbuB4ZJEbyWBxE4mJUCt
	+2VyVxmKvImp5SJ27BQKKsPYV1f6mFlFBj3Dlo+OL0Tg3QlIesM6jR5vzlpwDRirQas32hg5hDW
	obTsVdXQU8AUFphnJrlO24HZOnAQ+s=
X-Received: by 2002:a05:6402:4018:b0:6aa:e95:9c01 with SMTP id 4fb4d7f45d1cf-6aa5699d549mr4837509a12.34.1789844197054;
        Sat, 19 Sep 2026 11:56:37 -0700 (PDT)
Received: from localhost (78-2-209-42.adsl.net.t-com.hr. [78.2.209.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67e3051esm1583360a12.29.2026.09.19.11.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 11:56:36 -0700 (PDT)
From: Dmitry Sinyavin <sinyavin@gmail.com>
To: Janne Grunau <j@jannau.net>
Cc: Dmitry Sinyavin <sinyavin@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmem: core: Fix OOB read for bit offsets of more than one byte
Date: Sat, 19 Sep 2026 20:56:36 +0200
Message-ID: <20260919185636.3054303-1-sinyavin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20250901-nvmem-read-oob-bit-offset-v1-1-b610e18cdd3c@jannau.net>
References: <20250901-nvmem-read-oob-bit-offset-v1-1-b610e18cdd3c@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Janne,

Thanks for the patch. I independently ran into this bug while testing
Qualcomm MDM9607 TSENS calibration. I tested the exact change against the
current NVMEM for-fixes branch at cee9395acd80.

Without the patch, a focused KUnit case with a 26-bit offset returned the
expected value but produced three KASAN out-of-bounds reports. On the
MF283V, the unmodified kernel produced exactly seven reports from four
TSENS calibration cells, matching the accesses predicted from their bit
offsets.

With the patch, the focused test and a 16,384-case extraction matrix pass
under KASAN. A hardware A/B test using otherwise identical Linux 6.18.44
kernels produced no KASAN report with the fix, and all five TSENS zones
reported plausible temperatures between 36 and 38 degrees Celsius.

Tested-by: Dmitry Sinyavin <sinyavin@gmail.com>

I could not find the patch in the current NVMEM for-fixes or for-next
branches. Are you planning to send a v2 with the stable Cc requested in
the earlier reply? I can send the KUnit coverage separately if useful.

Regards,
Dmitry
