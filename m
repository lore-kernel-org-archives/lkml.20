Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFDB3A59BC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668278; cv=none; b=EVe7NCOYqMeG5PNHQfqgqF7ix3te+FMS73+44cPZum0Veogd72VJtBp9fVGrmKYxYPL7u4KmPgHdK66LH8awq8yghhN6WRYwP7VfAYmFQCDt+Z4Ev2Fa2IkK066/evYpeyO0qbnXTqIOOHm9idIFsKskbGj8C4WnnTV7VlInH8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668278; c=relaxed/simple;
	bh=l1bSSMi0JlkeBJuDi7dYojJLqK5qlcS3wYZVhjgik+8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=US8xPoJjffuxuG9NaBgrFpkf6GFAZmRjbjDa2WKJQv3cklyNUGteTqULFV0TydkeLs/021XYv62j31C9pAorXZwrlADNMtts/vuTChhVxa5JmoXAmBdfoG/WHWfM9lHmZhAAKIvh3ML8ucjWHdEpumtl5nlj1eGFQai0bSzpOMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0Uxoe17; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0Uxoe17"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3a0aa5e2b20so1231073a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790668276; x=1791273076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzcdTpogRZ+AxGuwL3IEbWBoohYfCz3D35l9Eoy+zTU=;
        b=a0Uxoe17/jxs6HXU3gn+nBU4lIPUODgC23JSP3EVssScdn84cCHj1BPSVr1/2IIFkD
         X9XTDfy/BybPyS6V2sMR+OTRAtuZ4nnCG91dKWwWw8Cn6kI45D/q4wx3IsVGlviPQ00Q
         uPSnmJULORONervaOPfHHLJAM/yiI8omVtNbA2paxnvPxzsBlUL9OHiy3sfn8Pxkl3c7
         mwMQDxyiSq/hBfYay4UxqIjn0kXhqm651Migu669QJcacTKGWY/tJDVQAWRtCjsqTYmt
         APujbTpXY0W9VGpkb2O3QZSiqOyovP/Qd/EtytApLJ7EzpL7R5MCCuj6f5NYpNnlUqNA
         eY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790668276; x=1791273076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzcdTpogRZ+AxGuwL3IEbWBoohYfCz3D35l9Eoy+zTU=;
        b=gFAvBH3JR1RKVyjQHhIv0wXk5tpAkT1tG5KMMwXCaorTlszkN2V+DM4c1Aujif1FPW
         PfTdM4vF8UMqfMiT+0YkhzUcLHXP2G6Rok6Oxp88ogKOTiC2tfCRNU/2Abq/EMhQ6WD0
         cqIt2ZEUHsdC1VI9R4vBrMQZ8LnWVUons93GS1G7TWWJ8R8Hkyxm3A3uwlj06cZGvsjG
         uf4jwiUkAdUo6vD4OiijRf8AfbtQNot6zlBbPvMaiGmw10Gftvf/wYVgRqK8b07jh9c/
         JRcrjDXdyg1gq9o0CtlvkXJqKGAhOF4PFfblkBfRa37SXlEibU1Lah077GWc/R1wPhk0
         wWlg==
X-Forwarded-Encrypted: i=1; AKwUvByK1mZ0juhoAAQuZ26yKM5iuFiOjQ9wirjV43RdHfyuB7KMt1iDIC7EtouJuKE7nzTupIGDlHE3s56PXNc=@vger.kernel.org
X-Gm-Message-State: AFq9FYICO45QZ09OGiR5GMT8xjtBOTUuEdUOP6Q86rquQlraUxFEvZ27
	A4E9yuO9u++djTqA2V/UItiHjJoS0TS4JP/seaCpZPy4TEmYso5Xh6FO
X-Gm-Gg: AYBFou17dRpX3v0pEPRTM41bbVnWA/aBRHPzpbmzvjpcs2p2KkuADI5tW7KNAJDa2sz
	MoTOia4TSAi5G2IZ3bSMKf95CIwLNwleJS3k667k4vDwbCDFgs/bqOr9l3Gvr8YDgBc0WbBG11x
	WKLJcAoRETvuAQ303KiwHQPRkyDds3gzGkOd6w5diB2E21X61bv19IvHMx3cSKWDn7Ip0/833cr
	w3JTvzwHOE1DS/5KZdbKURBIRj1UHhsoPJkAEjQHD/Sf8tGDgB/HmJ2LtreHGujKK4kdrKb5dUv
	np3FAN7lbc3oXLG2uC45/M32d7qUsc8LEkidnRasIEgNLfqKIVZo62CSBELfMxHHgkCzZfpZ5pK
	B6KqbVOi61gdlEZb/8tNeJkl5gRdKLETRoF7SV8wIlRYg4wNg1jMEIDN9c0DLGpI1p5zjBNab+s
	Jvh0zGF+ZGP5FmAvPf/Gq0xzn36UC82BDDZ29DFk6g7KLtOJTJuwjfrfB5ys5DPsA/jfXmXRz1N
	pIK/vd9jgn6sjng3w20JJWz1JXzHZa33OsuJe2ni/qh8YkWO70HBUlld6hVNpmuIAc=
X-Received: by 2002:a17:90b:4c4f:b0:3a0:bf0a:c9da with SMTP id 98e67ed59e1d1-3a0bf0ad1cbmr11593880a91.47.1790668276375;
        Tue, 29 Sep 2026 00:51:16 -0700 (PDT)
Received: from suewang-PC.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497ebc998sm4049236a91.2.2026.09.29.00.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:51:15 -0700 (PDT)
From: Sue Wang <suwangquanta@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	patrick@stwcx.xyz
Cc: Steward.Shih@quantatw.com,
	Martin.Peng@quantatw.com,
	Fred.Zhang@quantatw.com,
	p.k.lee@quantatw.com
Subject: [PATCH v14 0/2] Add Meta (Facebook) Ventura BMC (AST2600)
Date: Tue, 29 Sep 2026 15:51:04 +0800
Message-Id: <20260929075106.74731-1-suwangquanta@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Linux device tree entry related to Meta (Facebook) Ventura specific
devices connected to the BMC (AST2600) SoC. The purpose of Ventura
is to detect liquid leakage from all compute trays, switch trays
and rack sensors within the rack, log the events, and take necessary
actions accordingly.

---
v1:
    1. Create ventura dts file.
    2. Add commit msg.
    3. Use format-patch to generate patch.
    4. Add subject prefixes matching the subsystem.
---
v2:
    1. Modify email content.
---
v3:
    1. Add mail list.
---
v4:
    1. Apply git send-email --thread option.
    2. Sort nodes in the dts alphanumerically.
---
v5:
    1. Run scripts/checkpatch.pl and fix reported warnings.
    2. Remove unnecessary 88E6393X CONFIG FRU.
---
v6:
    1. Add a new stage for the DTS change.
    2. Run scripts/checkpatch.pl and fix reported error.
    3. Fix the issue in a separate patch.
---
v7:
    1. Fix broken indentation in the device tree file.
    2. Sort nodes alphabetically, then by address if equal.
    3. Rename fan sensor nodes from 'hwmon' to 'fan-controller'.
---
v8:
    1. This patch series has significant changes compared to
       previous versions, and quite some time has passed since the last
       submission.Therefore, previously received Acked-by/Reviewed-by/Tested-by
       tags are not included in this version.
       If needed, tags can be added again after review of thisnew version.
---
v9:
    1. Reordered the node sequence under i2c5.
    2. Added a description of the platform's intended use to the commit
       messages.
    3. Added 3 GPIO expanders to i2c10 and defined the necessary GPIO
       line names.
---
v10:
    1. Added IRQ support in GPIO expanders under i2c10 to handle edge-triggered
       events.
    2. Reordered the nodes.
---
v11:
    1. Modified the position for i2c3mux0ch6 and i2c3mux0ch7.
---
v12:
    1. Added a GPIO expander at address 0x11 on i2c10, and assign an SGPIO pin
       as the IRQ for it.
    2. Fixed the "failed to match any schema with compatible" issues.
    3. Reorder the nodes in alphabetically.
---
v13:
    1. Add two GPIO expanders (0x16 and 0x17) to i2c10 and assign two SGPIO
       pins as IRQs.
    2. Move the RPU_READY_SPARE_PLD_R and RPU_2_READY_PLD_R pins from
       SGPIO to the GPIO expander (0x10).
    3. Add all tray PWREN pins to the GPIO expanders (0x16, 0x17 and 0x1b).
    4. Add explanatory comments for "unmanaged mode" under &mac3 and
       "intentionally left empty" under &mdio.
---
v14:
    1. Modify "Facebook ventura RMC" to "Facebook Ventura RMC"
    2. Add a description for each bus alias.
    3. Revise commenting style.
    4. Enable mac0
    5. Remove two GPIO expanders (0x16 and 0x17) to i2c10 and two SGPIO
       pins as IRQs.
    6. Move the RPU_READY_SPARE_PLD_R and RPU_2_READY_PLD_R pins from
       the GPIO expander (0x10) to SGPIO.

Sue Wang (2):
  dt-bindings: arm: aspeed: add Meta Ventura board
  arm: dts: aspeed: ventura: add Meta Ventura BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-ventura.dts    | 1607 +++++++++++++++++
 3 files changed, 1609 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts

base-commit: c0538446e769fab620225578d378a0627b883bd5
branch: dev-6.18
-- 
2.34.1

