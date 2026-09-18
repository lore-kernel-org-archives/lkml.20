Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DB94D17B3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728598; cv=none; b=ds2g0pVd0zRWyJkkZONvFxbQDxS1f2LDmOuQ5vC/Du6azWZVFlZ5QrcB9j+lSOuOJuPgKyFPAr61HbsDv4l53nP50e6S0YLdQ1Yzzh7Z6aA6gCG6rdK4hGb/GamQk4tKVu5jTYPYPGMsRhHUYwzlcrITJnEe4nFrgkuqHJG4YCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728598; c=relaxed/simple;
	bh=VDT0gosUKlKyUP/LqVdpjlvegUJ6Vvc/r6oZAzPMHB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/SX4S1gFUnhxxPs/FnQ+iDqgVeiveu9YuR2OkNK2L5moKMQxbVhECUimOva1Fj8+fVPsN3y2nJ9RtCpL20UIwJrXq8al9QVU06KBL6d5p1vvjP8IYFL0UPFomwnXTzRDc0iy86PHp9JfXkN90P8AdmqGl0dqaJNPRjVfQc+rsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYr8yUIU; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYr8yUIU"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b93204449so227355e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789728594; x=1790333394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDT0gosUKlKyUP/LqVdpjlvegUJ6Vvc/r6oZAzPMHB4=;
        b=WYr8yUIUQT/04VHvCzfMX1SkdTufBl/pUffuEXpZgPCfYAg83T76sunHqaxDDn/cnX
         1t8FtF01MtRmn74hMVEOIN+PzvyoqmkKs77P6B5Gab2dIrFwBVUh54VvufMWLzJZZjmo
         sjVfpSiqPMgEevMMIbVlPHLHYw14BD//19huzpnuQpzFqP291aPWxVDjlUR1bx/qC3TC
         +mpoAP5WUZ3/DcrZ8hinXOtahd5GCHBNBIhsPh+YoHNH5V5Thh1/ga/URO267ACgyd7O
         7Ix7E2Uz1ngXgrLWt5CSjUCNbun2LTvoNx7DmAdw0+LePudCz+0ZDAHVVm0cLT3tdQ4M
         jBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728594; x=1790333394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VDT0gosUKlKyUP/LqVdpjlvegUJ6Vvc/r6oZAzPMHB4=;
        b=VKX0G9IpZNVdqCcN+zKDVStTDkG3mq8CtaTd3fu2STnezbqlxaTeyAGkVs4llkFgSa
         BoIO3rZ8hjSCzLrUnyLRppPLdPB20kp6RhTeee7baymfuYpls67pKP8RvUoF8We0m9yg
         +LXAEjqnO4Sds5lWJddsp/FzB4OO+AK0mLMCJNkStP3ZFVjGEDkOv35xQ0rm9xo4mCD+
         2MHDH2C2j2pqpcPLI+kIKQjCCl1fmPqvguirZ/NSaaycLRs1Z7BoHcXGXWne+P+zFTby
         YsrhaAdrnsXBHaVAsdtQ3z5YOZKDpk89X5vFEEWlO74fCGFQJTMY88Ivrf7ui0/GVVOu
         w3Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzaokaRNsdBCsujtj68kxgO/N54OZJ+Pv52xBD3ySYTvTuAE/m+kkW1i2HeUpmCJv4kts9FfsabyYErc64=@vger.kernel.org
X-Gm-Message-State: AFuF++mfHAfxv8TnVOrNnU1gq6PpoK9mnpfkbcVyD84nL9DfUObmE+q0
	IdP4hhvwhRKH16veirFCeINVPA4Hdo06UaWMfSTHPHrLqQaKiW1F85yQ
X-Gm-Gg: AYBFou1oegYIwsjpSBLHJGas1m8MVEC6dtJcqbKVbBrZoTHs6CH6iocswzaFd8DqUNa
	FQsTFIqZBd+IUJss2phZ3g6mDwffaCmujXt3SdAWT16gT831/nEjQemPYMYAYY4pKIh/fQo/i3M
	2bvop/mtoSKcSCkcYTOCLBK9Mv/BAutGhY7xFTL2p7Uy6ws/fbnBWwxckWNjpR6/gKPkPQ0c97b
	KYuLQWY0uXZeyCRSWD9qK+2nscMHkZzKrrW+JDBL7Orr61VQa5Tdg99uJ5aB4L0UF6c7RjTf6qJ
	8JYU+l0CMZd+/9E/Q0BMIu7EzM874dNK7EsYQDezrgtQsy2oJWVwAPUHdIzcZliTXfsCWy3ASQr
	6pbXY2ZGL/HiuC+MJ04CGg5BchDL1ruxb5Ho8VgeqOtH+MMJfH3IJAFoZ/00oSxLJquDFMkgChh
	BlmmGkjKeDxQWitmsoimVkIJOFgd26pw/0JnO2WIRmEfNSJmiKHxt5kuOdU++yR0NrraGHn3evY
	J4mcRvpng5Shz7nJxvFlesXS5qxx/VZYPHb07UhiLYbdwHPVY+Tra9OhDsTcsRefoGSutGt7xzU
	Tq0=
X-Received: by 2002:a05:600c:a00a:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49fc7b83237mr20725205e9.0.1789728594305;
        Fri, 18 Sep 2026 03:49:54 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B829B006E521A2A508563A3.dsl.pool.telekom.hu. [2001:4c4e:1b82:9b00:6e52:1a2a:5085:63a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3ae1fsm2975686f8f.8.2026.09.18.03.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:49:53 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Lu Yao <yaolu@kylinos.cn>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND] drm/amd/display: fix audio playing speed up on POLARIS12
Date: Fri, 18 Sep 2026 12:49:25 +0200
Message-ID: <20260918104925.33904-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251205074344.143063-1-yaolu@kylinos.cn>
References: <20251205074344.143063-1-yaolu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lu Yao,

I hit the same bug on a Polaris10 (RX 580) with a TV at 3840x2160@60
in YCbCr 4:2:0, and your patch was the only fix I could find, thank
you for posting it.

I have sent a patch that fixes the DTO0 module for HDMI 4:2:0 on
DCE 11.2, 11.22 and 12.x, which should cover POLARIS12 too, and
leaves ACR (N/CTS) as it is:

https://lore.kernel.org/r/20260918100443.23694-1-royalnet026@gmail.com

I could only test Polaris10. If you still have the RX550, a test of
that patch on a tree without yours would help a lot.

An LLM helped me draft this mail.

Thanks,
Igor
