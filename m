Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3A83C8C49
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132365; cv=none; b=l9T0nTmwCHolSistQ/jbH3+ZSdPRMxJFD8/5/DZXGZOzkIYUgAFYSfihmgjZQHm+hUofiHJZH8PTPtm3SU2MwuVDjfvSf2KPi5AAQW9kmfheSMXAj050LIMxNVAstusrlyVulFH/UC+qvNImO/8x1yWT1UgFugWIz03YsoK2G2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132365; c=relaxed/simple;
	bh=l5oEal4VAJKhbsdVKhFkkLQTTN9gxEOa+mODKSDfhF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JX09Ec3kDGZaZ6fkg8XDdxfJ+A9+1r7brnsP+k6yW2ZcrKme7/y15BkeK+8o3Fn4UEyhPqJcYJ9NvLaSKFGmYXwn2Yh83+mpjxR8iBd7EoGGzzxMdifpgAPDu9M7u//82yfs4ZJqnszyxBGFpC41jX7hVTcl6HPsNx56lBeYcqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqUa020L; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqUa020L"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so7125555e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132361; x=1791737161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IvLGZFohw08LsO9YplAB+8WHFnyYtxpYVPZVN/oLn0=;
        b=SqUa020LlTv/IOjOOlRowv3Dq1/GT0bqbP2z5vXTkA1mM8eNLr4fyf6eH4iqFGKHv8
         NMzNuWfUWovsXHO97I55MiY6Z1++qV34AwBuxvqqFBGT8exvhryGYt9cVR7vv6vbOP9b
         R1Y1R+3q857f+KV9xli+/dHuqG+swcyZPsOox2ah6vjmcM1RQ5PHOsZvl7A4HzOTM1qA
         +6aaj5A9ylw9wpOozNIRiMTYTC3/jDiEkEwz1EmR2w6X72tmAlcxMLUoMJ+jTa+VRs/o
         BpgepNPHAljx8uHLn9rVPGYWX/JNbCQ62PtKifrnfj4stLXN1g6iIaYmxFxOQE1CcFZK
         3obA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132361; x=1791737161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IvLGZFohw08LsO9YplAB+8WHFnyYtxpYVPZVN/oLn0=;
        b=vkoaM5YNhvmE9Q6Dy0EjkJGwAjhzSSfIBuZ6oRR1xbamA/EihhJ2NI1ml0YvFmGb14
         AFTDoZB9Mp95k3OjX/82VzWY2xWIV5ytOGcrW65qJWmeFVOFP41u6znnHMZa1/oXcK0j
         PF6Dm0TV9RcP2DtVZstXAW+yMxZt6OE9GDIs/+7G+WV4sdGw5TC1bxwXxq+iuysRBjJg
         hl9VkvAsI4VKaa3iHjHX2PIU/pcNEmGZQ9V3dgpfPwGMktsRkv31NYXx6mCaf3+cyhr9
         7i+p3+L/R+cXxVUuUdc+j5jY16UEyMZSmT0ThrW76oHTjoSkcaqjmXVJtWsoMEfp55Us
         UvEQ==
X-Gm-Message-State: AFuF++lVPlilzifb6+GJkefrXKr2rkepirdqJrQ1YfI4w0U2dySaROIM
	dynENkRwBMJBOc/y8HUZvBPuOCAe1XFjoHrcEbAug/qv/U3HxHRup2OvVObDKw==
X-Gm-Gg: AYBFou0pALxEtrDXM1c5uWjbfF0jcittkDKJa10DV/Ds0xFL7wP0gnpYidoKIrP3tgh
	44hq/YmFkDErW3/bKXKNN/5w3Wn7vKuSI7l/VFH4OosUn3EYYDClUPYt+f/AnFg4Owywho6KZJm
	65UgWPq5mWlv5GDvszVX/s66L4iW2qpKFQUT16F93kqtnAeB3IJJdGmFXQ18RhAX5j6uZebPzzq
	KAZaZhOx4R1dY89eiwTavKiOPdNGP4BBuTlezmuWp5+VP2qOCk6vty0zmnvuuu5GFANHrAnxSwR
	SMmeshwoJLjke53YymYm0CbPGkujAqBVhuIUFVWBGpnF8I7v2M+RI/++8YZjYFk3w/ofJrRfrL+
	DUc48EtFTM9uhuVYzMpcc3ur36nMdu3lAx0XQeDeN4kiI29aEPsXkaHZEv5PPX1WCE+LGk0kf/q
	FhrkrHBBJ5TYvAqFE9qvUaWrIEp2EuPzTpfOTXelKLyiX1sLTxrJviZxo5j8ZDmq1nPfs6loKtG
	irRVZ/rVbMw/917MSJfnmoy2mVOtg==
X-Received: by 2002:a05:600c:c177:b0:4a0:1c0e:b136 with SMTP id 5b1f17b1804b1-4a168103397mr86677335e9.29.1791132361371;
        Sun, 04 Oct 2026 09:46:01 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0613sm21801435f8f.13.2026.10.04.09.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:46:00 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 0/3] mfd: max8907: Schema, pdata and poweroff
Date: Sun,  4 Oct 2026 19:45:37 +0300
Message-ID: <20261004164540.198446-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.

Schema includes reference to pending tegra-regulators-coupling
conversion. https://lore.kernel.org/lkml/20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com/

---
Changes in v2:
- fixed max8907_power_off return
---

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Convert to use device managed poweroff handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 285 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  38 +--
 drivers/regulator/max8907-regulator.c         |   8 +-
 include/linux/mfd/max8907.h                   |   5 -
 5 files changed, 309 insertions(+), 96 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

