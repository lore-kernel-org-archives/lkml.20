Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF6B39A05D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377337; cv=none; b=PkyIvGd02aFGJnnv3LsYlhs8zPZXH+Glikxv5Ngh9m9Tq3cK8CCjVZEplgPXnNMGDwhhxm1Q97Y6x6TcCXs2a0XulaGTiwzj6cUJogeQZWZzVu7I0K3pQ0Xb7oVYa6eO1w7XDK+2SWHcxrcuq3kI/O9zxUH1jG1q/s+sbBwUSwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377337; c=relaxed/simple;
	bh=PN7g6f8q4rSe1aDYWdm44A7DdQCKh0cTB6fHIX0phH0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j9JIwyhrfPWC0J8cFfVGCVkzamSWunYR5AOQuGj+5wSRFXC85Aih2YcozvOcrmJN78uxvOsPt3k55c1DnTXKXXh+eR1ReK+jAdizw8d0JkG6Z9wMagz5GUBrV62YvamEeJxRajk0JOxyZoNfvGPU3dJKSqJaz34GQcCkRYrFiJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpiRoY3f; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpiRoY3f"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b1a1a442c1so888306eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377317; x=1788982117; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BW8pn0cJ7xlLT4nbmLaz0pA0nlL+jRYhrPKHSPcS2Ws=;
        b=IpiRoY3ffPrZpoo5zhUDtQ9c8tQsIQN1qbdqskpBzHRsO6BxSmWIW80qfd4TNgppdp
         +OBeRW9sCLPIQ5aQjXV9E8Ta5aSVVKspDUm2Le8nfkvkHCQ6nymqk/J1Jlthw6K5mmTz
         ZMBSShTvBtU5NiGEDAwdc6D3D7uHLzB8nOPigvx5ScgCu74BZSmX0IW7pJQ7De4yPJOW
         PSGZivWXRJlH0AMouG12fwm7BN1HpN1pHe9lf7c6qRQabC4V05iKYQcpaoIPVKe5qX6m
         EudN5KMRYxLisiorC2sa+tW0/jcm0uxeKVBbe8pVrae2PGqgkXwYQTGWb78Yq39SEKIc
         k4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377317; x=1788982117;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BW8pn0cJ7xlLT4nbmLaz0pA0nlL+jRYhrPKHSPcS2Ws=;
        b=QiFmDebcyfJXKFSMGXABvPs678srglO6KLvVLfGci7n9kRKqOon/uwiJ5LYZyBF61C
         pjVZgyylmoseRe6EaLNBRyi6q1k0ScIbY5zJRlxIpQkJz/b2PytFar50hIhDohREQQ6u
         VyavvivHmEd9NkjNdGImS1TfQX1TIKXmbYaMxq8mXsOL/mWZV4KYfUG/c2ZQdQx1YYxk
         UJKnXCj3/aBxzGaTA0YoFQljysTb3gCyC+G8rJ55Teo9bzjyDJ3Tx2ABloJvoFm2wlpt
         eAtcc8dKeX9MEv0s980UXi/eFs0FKebQJVavseIHCwtllwNIMa/Y7ZBBQU/onOVibdAk
         8blQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLwvmGcQQ7mE+pMMxcTlWRdYnrN4L4YWnDxOJlOWghOwqMKPe9Ma3QukcbVigA34h4DKDeC2yii0vWxh0=@vger.kernel.org
X-Gm-Message-State: AFuF++mj9qmvg1xTogYRkbsD4ee4Qbr6bsra21fAVWyqAr2ed4JYGPln
	A9fCxVQLnnVzFW9vDFsiVIK6S+cZZ8oatb3VPBaZJnvYcROslgFM78IE
X-Gm-Gg: AR+sD13tuo0CghNDus4IvVFPlVJjrrxugmLMxLZna6j+hh698NXbYg1A63+9XnmS8zg
	QNcdGjubSQaow3QfvACG0LdCDzo9p7oS6fDf7TeeBuHRP+XOvaMRdERbnf6+HdTOv6zcJ+WXY+g
	eSiuhjw79g7nZMu8ZasryWKWFHtDpR0Uw2k80rpkotJwul8p3h9p+xViDmv5Hd9f+bwTOWRdMDp
	ZHwcFoUmiOhxGao3Rd0uVxVAxULzcpGS1GWArlNqr2i6nTqXbKlas9Hf2SX0XmGZvDxAgDXYIy8
	4pToWT7idgpeH5vIt8x3JdoCGAIB772FZAXismxkPBTWVX4+B0do6Ym+T2ACSjuQj7p/1wvOudc
	V8uJvJqM3lAGy+eiPqysjam9mGdtGveyyiXmU6TCETM+8SshXVEST/DQmqyib9Y5+cT9Q4VeTVx
	gKjN8Zgi+qfaHNd9W4MAEztdJnJJ3OahAx7yExnr8LjAASXe6UO5stL97ao3DtY6szO1UEZpv/5
	fBHCTyoykkqiybKt8AJgwRxEXHWGo0fjCouAHIIrTRb79B7twNjG/v6pvGC97u0gJM0rhczLBFS
	m/onPQeU+M4xudJVcPNKO6uQdYtPlXnvJKFB8qrV77uYcigwlX8aIvhegGZ1bW/FSY5DlXW+iR2
	ghlblY5iW3q4T27ziyvM=
X-Received: by 2002:a05:6820:4c83:b0:6b1:be9f:ce6c with SMTP id 006d021491bc7-6b47ecca88cmr6183827eaf.4.1788377316798;
        Wed, 02 Sep 2026 12:28:36 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f30baa0d4sm4932181fac.6.2026.09.02.12.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:28:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v8 0/2] mfd: add X-Powers AC200 support
Date: Wed, 02 Sep 2026 13:28:23 -0600
Message-Id: <20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XO3YrCMBAF4FeRXDuSBJNOvfI9ZC/yqyOmlaYbF
 Om7b+oKCgpeHjjznbmxHAYKmW0WNzaEQpn6rgZcLpg7mG4fgHzNTHKpOQoB+dcmGsE4yTmk6AG
 t8drzNkhUrJ6dhxDpcid3P/+53hyDG2dnbhwoj/1wvW8WNfcePG+f/KXyfQR/7UwiB0VAUcDBR
 iMiKoFW4nafDJ1Wrk9sHir6hfr0adEVcMoK2UqH6/YNaL4BTQXQch2Vkmbtm1dgmqY/Bjsxtk4
 BAAA=
X-Change-ID: 20260811-submit-ac200-mfd-8bad6d09e285
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The X-Powers AC200 is an I2C-controlled mixed-signal companion IC with
a paged register map shared by its audio, video, RTC and Fast Ethernet
PHY functions.

Add the parent binding and an I2C provider which enables and rate-locks
the shared input clock, initializes the paged regmap and controls the
common reset. Audio, video and RTC functions can be added as MFD
children.

The current regmap consumer is the separately submitted AC200/AC300
Ethernet PHY series:

  https://patch.msgid.link/20260818-submit-acx00-of-dynamic-v1-v9-0-b8c8d9ad0d83@gmail.com

The PHY remains enumerated on MDIO, its primary management bus. Its
AC200 package node follows the x-powers,ac200 phandle for ancillary I2C
register access, adds a managed device link and obtains the regmap with
dev_get_regmap(). This series and the PHY series can be merged in either
order; AC200 Ethernet support requires both.

This work builds on earlier AC200 work by Jernej Skrabec and Andre
Przywara:

  https://github.com/jernejsk/linux-1/commits/ac200-v4

Public AC200 documentation is linked from:

  https://linux-sunxi.org/AC200

Validation included an x86_64 W=1 object build, dt_binding_check, and a
combined W=1 build with the PHY series. On AC200 hardware, the provider
and PHY completed 100 overlapping bind cycles while preserving both
device links and recovering a 100 Mbps full-duplex link.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v7 -> v8:
- identify the PHY series as the current regmap consumer
- describe future MFD children and the MDIO/I2C split
- store the regmap directly as driver data  (suggested by Lee Jones)
- reset the chip from the remove callback  (suggested by Lee Jones)
- drop the revision log and inherited-driver attribution  (suggested by Lee Jones)
- add Krzysztof's Reviewed-by tag to the binding
- rebase on the current MFD for-mfd-next branch
- Link to v7: https://patch.msgid.link/20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com

Changes v6 -> v7:
- drop the managed external-syscon helper and AC200 syscon registration
- leave the regmap attached to the I2C provider for direct device lookup
- reduce the MFD series from three patches to two
- Link to v6: https://patch.msgid.link/20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com

Changes v5 -> v6:
- split the MFD work from the independently mergeable networking series
- put the merge routing and shared DT design at the start of the cover letter
- rebase on the MFD for-mfd-next branch
- Link to v5: https://patch.msgid.link/20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com

To: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: mfd@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (2):
      dt-bindings: mfd: x-powers: Add AC200
      mfd: ac200: Add X-Powers AC200 support

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    |  49 ++++++++
 drivers/mfd/Kconfig                                |  11 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 136 +++++++++++++++++++++
 4 files changed, 197 insertions(+)
---
base-commit: 9d0e4b1ae5b045a2c92b0b9a1c3b268191c219d9
change-id: 20260811-submit-ac200-mfd-8bad6d09e285

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

