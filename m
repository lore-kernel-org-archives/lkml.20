Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506175;
	b=PhEbflD3JpZkOfCCkO4rHFTenvi1K2tFw24fF1ko0eSKaXKNOMd54sdMwHKrI2G1XM1r
	 ZTpfSMqAbqs6cNuLbU4Q57KP2XUmnCcseY5a0Wa2E//4/o+OPPwbLYf1ldqJKHWGD20j8
	 bIrMaMZhoqyyXrrrupKmPC7IlbC5lcNmpxNO2bqMYwWG1AGsNJ0SF5USWBmpipYtzRF72
	 x5jSPLJ3+7CV6H+u7xulm5HHdW196K2MttimX8AL9jp7GvYUIv10r8nXFnIYdbUyvc6QZ
	 Og/eYW9NfPZlRvUd5k71sN8/9SSRZMcoBf/Vec0EZpzqXB0sH3xTNtQBn1qF8vDHY/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0Po6NV+wXWi97vWY2tLsfy/Tq0VC6nM3yrCItfEC7uY=;
	b=1mQ6zQ2VMPSyr1YDap5iioVv+VNPtHSMndbRiXtXbHLlvsASALR2Ht/ByCJKIyjet3TC
	 Z28rdsnXO8jr5NjGOcxg7qLX3yyXY7+3+2VS3HdsGyEDAthNLhluKARXrMs09NXn3Rbyb
	 +DzEg8o/Ms56oDh+ZjfssdccIgsEHA16p+0aoPiWI49UjlgdpNkTtJS9wBS8UTPse4UMX
	 FpvdUV7xFfbFJCVN0CN+5hzxb57/+e0PS4lB0gT0ir5gcLaStMs1SWRCcwTUM3bbSWgnw
	 0LqM/eKKrGozAt8kFEi0sEFbDs63gtnKpQECbQWTAh7h/aWTK3hqj1ZCp6j5ntIWgSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K4R12YOC;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D885A60A2604
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D885A60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K4R12YOC
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1178559eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506174; x=1793110974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Po6NV+wXWi97vWY2tLsfy/Tq0VC6nM3yrCItfEC7uY=;
        b=K4R12YOCrAh6mzEDRtlBL6/07vYZGhaX4UNkSMg3BXcn7NbRyDymdAEsVPnvvCSV9d
         KST6fCZGU7xlroi4Ao9SMbbM3DBT4pV8XGiOxGPuzyPCcFC21YOb3sVbf3VpsgwrgNVN
         PG/Zt0mkYcbvDRCGoxXuKh63R5VmykTzVv0+ouK+whj1zF5H6QT0Yzp2ch/WWFXmla5d
         DSHd4UNMNqBmYXypAZX6T13wquE3m+WqtFQVD0pGsXr0RcCkLM0AdObeRfAIMkAJGHut
         5YUc1M1ihMBI6PkSrzt4aPkX2XsOTv1anpygsQUwZMhWjWFRSLYLT5TBJXlqgGv2lYC0
         iI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506174; x=1793110974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Po6NV+wXWi97vWY2tLsfy/Tq0VC6nM3yrCItfEC7uY=;
        b=FlXkt5oNrm9oWV+A8qy2M87l6CK9LCjmmxlJcZ2tGiuImvQ8ROuPpwlkqy6gnHvfDf
         jA+zYf7SwvPyRUcMexR02/Cd3Rvn4UjSCHHlR7t1hecOmHbuXhv+oe2ZNx/hF4oHo9dA
         wSNRGDHDdiuN7nuYezS8e84BrXEnL4qeoaBZyBXaOtbolIfEugxu+DgVOZza550Rh7TB
         XumhWXIaGKPXjXvAJeudbgLzoEszGKgPLwPVKw5CwT47gNR+owajZ8vO5mcN/FDY5RFz
         HySrKCKDNxljyKKiveiV3lCyesrbEqaTqe7d7GUeIUaXtaheay2EH1XtYZ/oi1OSPpXP
         71pw==
X-Forwarded-Encrypted: i=1; AKwUvBycTQXWwbdkPdvjlwU991qZxALpaebFf+iWqa+Y1gFfRnTZUUtahV/2bynjvoQed/fqPVvl/v1DyiR3EDc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhLvQ9KC+8AVSMIh2nbzrDPkHG3dVNINsyfMZMOgHp1gvtqq2U
	Fk1vF4MQUgX0TPf/k0WwJdvuT3hSEoIItk2KIcPdNdUDyA85/C5TYOJA
X-Gm-Gg: AYBFou3EzFW0YI350JDZlMFqkKOhSZJfL2lK1Ux8kxrKNrYlZMPc7ChAA78DHTTsnp3
	kCtgavU1RIIIdE1GkA1Qi4pV21V7HBqQ5cWRhprlw9CzZUi9TPOGDh0OvHQ7ojZZQAvKxVcCOQq
	DNJ3SkAOgpXMgYHtJV+g4DS0dptT6zZszeTBoFphUCktiFPNmkVrvy3073F+WRYpHPU8eAZ+h0A
	NcFU2fYusWejxzzBe/W7vrGVaEUU2rUVnRu2qyhOVsxUeF/0fBHfCSJEGu5F1bwWiTN6ECcpuvo
	CS5JibY6hOtp1JiF0Tx6gqBZLA34au19Q6MiHZWN1YG8YNYiqbd4vmVFoHwu8/ol3b8uuF2bShZ
	AAXCPCz8wPxsKx3xh+mJBQS0AF+Rf+bbhfuof8hVQbLVyasTRY73/jZxsF7XgB2/rv/rwRFvZ2S
	CbOQ4TuhyBOI6aMHP4nLuntcvECN5xMMvvhv6sy43C/0XHX1F/55csdCA9sGvOSujzONkBSu7wX
	F3mRfPM8dA=
X-Received: by 2002:a05:7300:d94e:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-361a1b52654mr15441463eec.21.1792506173172;
        Tue, 20 Oct 2026 07:22:53 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm66917444eec.12.2026.10.20.07.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:52 -0700 (PDT)
From: Sushmit Singh Rathore <sushmit718@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sushmit Singh Rathore <sushmit718@gmail.com>
Subject: [PATCH v2 0/3] clk: qcom: sm8450: Fix eUSB clkref and camera clock collapse
Date: Tue, 20 Oct 2026 14:21:28 +0000
Message-ID: <20261020142157.1749-1-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
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

These fix three clock problems found bringing up mainline on an SM8475
phone (Nothing Phone (2)): the eUSB2 PHY reference clock reads 0 Hz so
USB never probes, and the camera GDSCs lose register state and leave
RCGs running across power collapse.

Changes in v2:
- Use my full name in From and Signed-off-by.

Sushmit Singh Rathore (3):
  clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to bi_tcxo
  clk: qcom: camcc-sm8450: Retain flops across camera GDSC collapse
  clk: qcom: camcc-sm8450: Park the camera RCGs when they are disabled

 drivers/clk/qcom/camcc-sm8450.c | 113 ++++++++++++++++++++------------
 drivers/clk/qcom/gcc-sm8450.c   |   4 ++
 2 files changed, 74 insertions(+), 43 deletions(-)

-- 
2.43.0

