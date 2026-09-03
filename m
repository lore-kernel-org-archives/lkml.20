Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA024F4759
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455288; cv=none; b=qKkMXhC9Q9PMPtSI3W5ndDYQyHs1ZR1PrVaynakTObx6DtGjDzgA5m5KnfjysVtAYbS9ZdwoDpdLvuCVnvWzZ7bhin9OBeDf0Pe2X1UiFKpyLAZbBGj5mOKpAyaPAzCnThj4L53fje34sR+p50SbOytfpUV8/ZIufybMq2/F5Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455288; c=relaxed/simple;
	bh=8lvDWbK+uMGm7vhd8Ln53UrwdC+utMFwdIt6V9HHNHs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VH8Nl5+RDwh9GJ3tBCdkdspOa10T4Y18ALzcJyhOMnK197Gm3jbLhfASeRWHIXkLXjgv9GfsMpvhHdtVDdDoMm1OlHwYazRR4FdIBWp+mG1SXyYom9+BztV/q0ZLlhtt49hxUpMRMnYiyp57LJJPahLutQZsEJDBOPbhBg4f/CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1PPcJaD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1PPcJaD"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so900015e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788455285; x=1789060085; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ldFa7oMAa77O6P3elMvA8a20lvnsyT7s/QBQvG18bbc=;
        b=g1PPcJaDEBREL+qGdYQ8DUYK8wafsjVgqpimYaJ4gdAqEcl7PSHPq5gW7vfIEC+jj/
         t244kWJjpq5gLBe/IWo9EAVKI5KEehp5UOknr3ynNK8RpeotUGOePtJdUeOcOhUd2IuF
         76UKHcebPNlQv8ZyUieX2JPD7Av4ISGeNiHRpq0A7P+XmcKNo5LmX93wcrNdA7UpB75M
         An48gFPOZrWt5aVZf+r0+0qjDystuNpW+6ZNAgiW7tvOYzcO59JcMsFAels31hY/JxWo
         BLDnSA8OPS0tiqklwEWgFNjmba2YpNvVeCueD2+G0HeHPerCHQ+NHbjxTXTRTP0H5oCT
         PW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455285; x=1789060085;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ldFa7oMAa77O6P3elMvA8a20lvnsyT7s/QBQvG18bbc=;
        b=RQGlShxn66CnntjZY7ssoHtDPdlDHUckelbf3x8olLN98TW7d7YJchoe5KtNz6rFsS
         nz8aWB/jfFyF4XKn0dnyoTjIKmH+7IpT2qpOlg665awsGOL0XCLO+acHUO/lVvd7BRah
         ENtmV0EjDsgp8regIIUJ/PpPwT3fGhlspt9fV6XoJPk9fpYdVE3AezRV8nwUcbm+BwCb
         KUi7GOz2+Xs8umejm6OKXHsjIFA9eh0PIaH7pMPyqQQe3tW3VgmKfHj9mWAqCHt4101m
         Kvj3yuV0gWAcJvDWFKRpFSAdZk6uGsXwi+VFer6IgN5LAmsEj5Yf7o5NcTqZpk5VhAtU
         SQCg==
X-Forwarded-Encrypted: i=1; AKwUvBzllTkJ7cGP6jMAbt4y75wChYnCpNnwYjry+jyLs1Pw216wg97ptIHC3sXGoYPFFav4/xH2fLR6JLezizY=@vger.kernel.org
X-Gm-Message-State: AFuF++mcXopBc/mLsdkBIuxhsa4nLvhqU7xqGyZAs/uN89hPAUvt4VPv
	PYam2EJkbt+yK8ujViXuqN6hellTIQArrfnzmh3X45AHYyHoVjmNaFbf
X-Gm-Gg: AYBFou3duLHWfTGJRfRrxOszwIPJMmieHtiyS1IaOFNA/d/3fdiBmuTCNJcDDi1r8Bh
	ytCaRpy8UPU5dJQEnxk4fKs1NWM9Lv+unXY1mX72B193m1r58cZUhA6XCCKUouy40WddeZZO03d
	reMfBzfITrWwc3onyCkyYOm5fXMwl8ILaHjeuG3FBy2WRTRDq0+c3OlktgNMEX1x5/2YMwIxkjj
	rye43yDgFKWmUVYaJMX2tHh9bhr+FnL7Ci8SRLpWym3NJITAwx+dP2PwjHk7H7pkOFgoax1z64I
	v30oE9ww77TVdOzsgFvRKCebXTtPwh/vEuND5dSeOd+myjfoTM2yMkWmfr1R7OV7wJbK7T3DG95
	Xmx040Qv4f36oXx+WP7rGhpajLeutlj10lTOj7+Ax0ra9lSvlHcMoUgQXlTaoL6SFxPETzgUTxt
	84N1SLHeUURpJ5l9/pL6GAR0ebStAjUDv63XhOQrIYwOotv9t7xftK4bpaq4WL73tyk7KBjkWfT
	boSgX1i+BClggDq42rnxxkw5ISd3OzmLZgijHxxS9XIE/3BWTpFnRH0piq+d/PRCunuq7vmxkYe
	wtYDIqqiReE3RbngVobISjTzUKmOPgRJVFSwPKTODsgagUsTQA==
X-Received: by 2002:a05:600c:698d:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49cf4e14cb9mr86335745e9.16.1788455284516;
        Thu, 03 Sep 2026 10:08:04 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm107799565e9.3.2026.09.03.10.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:08:04 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH 0/2] arm64: dts: freescale: imx95: Add ENETC port 2 in
 SGMII mode on Toradex boards
Date: Thu, 03 Sep 2026 19:08:00 +0200
Message-Id: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHCpmWoC/yXMQQqDMBBG4avIrB2IU7ToVcRFmvy24yJKkpaCe
 PdGu/wW7+2UEBWJhmqniI8mXUNBU1fkXjY8weqLSYx0pjfC1ntGQHa8rTEL329tK53tMYujUm0
 Rs36v4zj9nd6PBS6fGzqOHxKkxIZzAAAA
X-Change-ID: 20260902-add-enetc-port2-735526a9ef2c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

Add the ENETC port 2 on Toradex SMARC and Aquila iMX95. The port
is connected as an SGMII Ethernet interface.

Enable the reference clock on the modules and enable the PHY connections
on the supported carrier boards.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Franz Schnyder (2):
      arm64: dts: freescale: imx95-toradex-smarc: Add ENETC port 2 in SGMII mode
      arm64: dts: freescale: imx95-aquila: Add ENETC port 2 in SGMII mode

 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts  | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts     | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi        |  7 +++++++
 .../boot/dts/freescale/imx95-toradex-smarc-dev.dts     |  8 ++++++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi |  7 +++++++
 5 files changed, 58 insertions(+)
---
base-commit: ff1bb9ccce43cd06c766c3ddef796a7e40e623fe
change-id: 20260902-add-enetc-port2-735526a9ef2c

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>

