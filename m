Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEF4544D43
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080644; cv=none; b=FPi5DuuWsKLA2RQLVu4gfE9Kx48HQ1DCmrHX+jHcXtq9I0akhAe5N6Foo//FQL7YwgUHfc1pY03Za225+8gVYADC6zrZVDFJ5mjLtGuzmgvjmki/JqASgiGLXNxoF3n7IcPtTmMdZ8uKabQ9YeXshUr5voAUmk38ECGEeKHIpWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080644; c=relaxed/simple;
	bh=5NrQ0i9ZNaZcHW2sMy4/POEkSP7UIxG/VSc5oqI9g54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aVZjeRv37RtHKmLNpReI795N91FeHnFyqf+nqOFRLBhsZ3fj3Mye+IVcy/vzFrfORUYAv+73UAoS9oXbNHEkmC0YE9EYGNKt3/7b3JAzcvY7lrzpmvVHLVxGee5e0T2GevvmVqH9m0F0/kV/Lk4TiU/YAKcvHPaT3QF6h9YNzXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyZc9rVA; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyZc9rVA"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc147d86bebso862458a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790080639; x=1790685439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSFIDyEBXWq4SCc8zo/QNh6HqGLSDKyG+17t+RiabUE=;
        b=UyZc9rVAIR1FO4jx4tky8KiEODCyCzpVM5LNa42EL7j0C5BZzIReQkVEZgHLw3MGoW
         ZRp2MbW5IJgQPCx4ByFLWmS+0jTY7a7hBOoYq6akYT/WSCYjt18XjN2U+6uO5xlQZ0lR
         mIoVEm4/H6AGEBTVHqZceU0x/+cn9PgAsuXdbAfiIHU9wFN8igaQfeBfwr1flKDIRrya
         ynxE9916lCHRwlDj2wT7HFz7yZ/ki+roFhnJ2AHyXmFHhooh+BWwKKv9xbCpKat5UkJ5
         hq/UMFRDAM3ImytmAPVGnxPK+uZB31b7nyvjgJPTZS4cxnhK/Eu2sYmpRS9J9sc4MLoi
         ZA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080639; x=1790685439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSFIDyEBXWq4SCc8zo/QNh6HqGLSDKyG+17t+RiabUE=;
        b=ROJBXg5392Q/mPuS/s/DOWAfbtGPaCGFCEOJ49xl8z9wMXqv7bm9W+mFQYVtHJHlyc
         mGUyoOREEcEtqiIU2wyUvA3rucieyrMUH/hi0NP6nBM/N4BPczUBY1nq30cy/1SfSoKi
         J2Gte2jzqpdWzxMkJYmkXbYQQo2JykdYbheAGXr+ylIGBX5iQcsqXwi1N8fp3hOlmssN
         TyJNObviSdYnLhjGW4bpEttIc1r2P6rjNmkd4d1nC2gS7IxJ2fwP+Ag8M50JTrV9TIOk
         qw2q+KcVU0Cnf258847TtHvIpMFGARRbHONVuWUJ8PW3rjpMlL1jActb+u39wO1rOKjr
         2ZFw==
X-Forwarded-Encrypted: i=1; AKwUvBwRnCJbZpsLOyiuUPd9WLS+A3gW7o416q156CGw6dz/Z4ldUmDGr0MERobaayJdeftAKAr4N5VsbhUTl/M=@vger.kernel.org
X-Gm-Message-State: AFuF++mLBH3dL4Djzuak02SKv/k3Hjo8rSL6b13fXl7HolW2+At6GAf6
	40kXOKJGcEMVqZAhI8RtYbKnPfOCWtLq7/+FNbQCLC7S9ynaEjNunEnk
X-Gm-Gg: AYBFou2rBCHZhNV6SZ+CTK1+5Xkoc4tYkP8zPiJo8NYEsF1oKqtRCJLsqURSJItuX+K
	LinuO00/1fBNGtbJIEbXc+krU1qCuFah4dMcI5Hgzpkld0FGnAyZOauq5NxvwnYMGwWGBTCrgHv
	yienbyrhO9/AtuEYMTm3GpzHBsGD6ZkAjeLx2/gm9+/2tRBD9mKZs25X3cnTD80gxs5jnUsjm6C
	PmE0c29f8gVlKTSEC6JjGo9Lg1YaQqEvV7QKCWQc/8OsAZAEXj970+4BdRO0ges1WBfdrIg2VJL
	DWKJzG3NHyYkB2X/ULePgw9kL+924tDh/+5l59Lqd4KfJgRKrk25aZRun242syVtnHlrk8sVn3E
	fpSelcVkDwCGrb1xqi2JJdufrfST9vKJF+wikDQAT/LpVwLx3zp8Wkrk/mCeMTx8bLnnWpohuTV
	UEOU54K7Iiz86pdjbHQoZW1aKIz/0E7iqQ7xBjEC/qSWXU8nx60+SoUjiHjWd+niO2BIRmTrNyP
	37mBRxAGooCdOndpupsYPMQwPI=
X-Received: by 2002:a05:6a21:7e01:b0:3db:280:b0f with SMTP id adf61e73a8af0-3ddec65f674mr701021637.14.1790080639455;
        Tue, 22 Sep 2026 05:37:19 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612ccd46sm6453922eec.18.2026.09.22.05.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:37:18 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au
Cc: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	andrew@lunn.ch,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v7 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC support
Date: Tue, 22 Sep 2026 18:04:58 +0530
Message-ID: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the ASRock Rack B650D4U BMC, based on the ASPEED AST2600 SoC.

The series adds the board compatible string and describes the BMC memory, SPI NOR flash layout, UART console, GPIO line names, graphics reserved memory, I2C EEPROM, and MAC0 connected to an RTL8211F Ethernet PHY.

MAC0 obtains its MAC address from the EEPROM on I2C7 and uses RGMII-ID mode.

Changes in v7:

* Correct the GPIOP bank line names for the reset, power and NMI button/control signals according to the confirmed board mapping.
* Remove the obsolete GPIOF5 reset-button line name.
* Leave the binding patch unchanged.

The B650D4U DTB builds successfully using aspeed_g5_defconfig.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 135 ++++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

-- 
2.47.3

