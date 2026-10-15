Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B583B5310
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076295; cv=none; b=lfU/hS53WPqoWkBy5JW8gV91qgU67ZoYDHr6HMQNF3ArsFG2TU0/ys4mELCSGwnWAaLLya8WGlKgSqjU4jN/5m8AdBxuRDluh8bTYjO3+o4BHtyCfwyJeIdrwu+Hpinmz3INRNGULmEvC9ovhuSvMr/DteM5HW2p2TB+ULXfwLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076295; c=relaxed/simple;
	bh=EPq/03fdA7jHQZTI5Tv/jx3i5dZSK2Mbttbhsp2Ilcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Eud7KjTikW0TEQcYw761OYjR7aJ7Unzk7jGBN55wKH9H+/XCovwUECMNBOrot3U1EYwYFl7VJUpM4g5vE7/9XZF/HcReii/ZeW/YCXElzGsqvS1tUQSY22HDgGUG+sP/8Q9iI/5w5/x+zVphBzItkcDqkAJY2mky0uhPX2/AtgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=CABNLYiG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="CABNLYiG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so47858055e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792076291; x=1792681091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g79lxdI+JwJ9lYZtMApsuAitGX7WOKQsF0SW8/j4ox0=;
        b=CABNLYiGyurbiiCEnNXgBxHw9QeAZ6QsOCJwu9TzyAR9F2noH/QJ17g5SC/Fh0dS/S
         G8OYPItLZpFZ+DeCPaiIZ/AeJrErvtZkl8GspRuALlFgMhkkExzFSU+NRCsfyXQhVGTs
         vJKiruL6t5G0Jbd+Bkzp2SXYb9gusrlAY3LLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076291; x=1792681091;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g79lxdI+JwJ9lYZtMApsuAitGX7WOKQsF0SW8/j4ox0=;
        b=Yh+E5bzGAG4aLhLi23LFOsnBfCnJlAr/SQfc/cEx4OZbif59i9BBQCphopnWRsAKsg
         eYsccOUxVHlqwM0caym/T/Nc5ljy6GcBLNO/TpX1OSOmYynUjN1IY85Q9BCsc1/Gh1iP
         tpQvOjlfJKYAm7thcLGbOzLsNqH9imiYtB45deAAGGb0JKv1bMaCwS8ITaP/R+qkfc1y
         rdIn6u0rfMA6r27BHukON0LSZcDPgCUvh2QwfWOi//ekP6a/SVpmRbqEfSyfOVp8gpHp
         I6EOjANrQTF9/sRHhiknlGlpAQr8xsKgtxFnCJDsfbirD4wV+FhA04fvAvY4Zndooc3U
         uB1g==
X-Gm-Message-State: AFq9FYICxIK+VUS148thwhRE0FKMa9waYzJYZV7kIVuC/filAQ+J9/3e
	0U2Yp622bCD27ck/pVUjK11OnZMoxR+i/a2+977WtMcTcirH9Xemxkylg2IF/lT/4rZBXSCs5V0
	SKVGI
X-Gm-Gg: AYBFou3Ou3SYNP9Ib8uz9PVpcBPUbk7hOGEFw9hcXG3Va3A/t1HvVQpOI+z1q+E06ol
	IStXOyvyxCNOhF2biWJbZtZw8JHbEqoPsOZg3hK3PMKYBp/UrNP4MFncCuvByg2c3zkl5G9CoqX
	q7EIL3Z1/fN4URJyEcCHMQdAIuVSXCfPgizYb5YjcAbE35r5dN0edOH7RYBkyKlsa7qqeLSO3e2
	JnIiYt8Zs/p0ICpSiEENRZU45Tgx1SR4PNohTmtBebsJEXBcT6l8DzpJs2aPAnr9rtXuXDjV3cT
	rU0yF9+JepQ08o10NEmqFqVvC2GtrdFWZNeKtTgZ5bvWHQnTBtHz2VKmhuQLQjCLFMY/R1R5OOz
	iRCjKq3Kgr1p44m7wIFKHp6LYtLEvLTf54/oKKBMijHpGm789z2nIV2UVS+5V1mdQGb/KDPVrJ2
	cEoueQAPNqoHtcShjAYJdYxHsyz6bqpnZnPYL0f5EZKRzIX3YAXwLN5BMN54WLbCexvDotDrn+S
	CKyodEeWGOnmoM=
X-Received: by 2002:a05:600c:3e83:b0:4a1:6d35:779a with SMTP id 5b1f17b1804b1-4a18e446880mr356608145e9.3.1792076290783;
        Thu, 15 Oct 2026 07:58:10 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd97ed33sm88053985e9.5.2026.10.15.07.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:58:10 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v11 0/3] arm: dts: altera: add Draeger M48 CPU board
Date: Thu, 15 Oct 2026 17:58:00 +0300
Message-ID: <20261015145804.3632839-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the SoCFPGA devicetree part.

in v11:

  - replace the ethphy compatible string;

and in v10:

  - add device_type back to the memory node;
  - move the compatible string under the phy node;

news for v9:

  - remove the name property from the memory node;
  - fix a typo in a comment;
  - attached phy-specific skew properties to dedicated mdio phy sub-node;
  - add Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

now in v8:

  - modified draeger,m48 to draeger,socfpga-48 because it is more consistent;
    with its other imx counterparts imx6q-m48 and imx6dl-m48;
  - dropped gpio3 and gpio4 bindings;

new in v7:

  - replaced module with board as this seems to be confusing to some;
  - add Acked-by: Conor Dooley <conor.dooley@microchip.com> tag;

Petko Manolov (3):
  dt-bindings: vendor-prefixes: add Draeger AG
  dt-bindings: arm: altera: add Draeger M48 dual-cpu board
  arm: dts: altera: add Draeger M48 CPU Module

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 101 ++++++++++++++++++
 4 files changed, 105 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

