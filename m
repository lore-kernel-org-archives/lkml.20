Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BF84B4863;
	Sat, 10 Oct 2026 20:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791662423; cv=none; b=AeT5uOtTJ+v8TmvlI0ycyWooalGf9o/xQU+52A6je2DdOY9y/KllkrppUjlA0Q5vAunvuDjupBI+QHJqXsma7ZSNPa4JqdxyGQp1MTiMlL1/tdecCtEej+dPDiJgo9QtKvWzHKKQCnB3/yRqRL6H5quqlFOx6gg+bFfswbURbd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791662423; c=relaxed/simple;
	bh=INhYC89c0fkz7duYIP5TtM0wbq9gO2yYmBeJHMpXEdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XBk/NbzUP7J72qDZ6MAwNDFcTI5VRVGjssmM7VrvBf8KyJdI+5yCLg75bpmbB9N7UtZInpYAcOl1ng+/8E6abCggnX6KJ4xCGWjZCrCByURFgLYpaoS31pQoQ3oSOTdeneenTFVSeZqopga/5kMSaA2t03/KhCLl0gxgnfcIoz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfXy1Pp9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfXy1Pp9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 096DFC2BCB9;
	Sat, 10 Oct 2026 20:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791662423;
	bh=INhYC89c0fkz7duYIP5TtM0wbq9gO2yYmBeJHMpXEdo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=mfXy1Pp9LFsulrG2ge35MGdOxR5P986wKoXB8oHZBNWt/QSHLd918tDNP8fQStoxS
	 SYx7pyQbltQj65vbdAkdHFDe2j2ohDM0kQIwYZ1pFSoEFDcqheN9OGiLjtYS91t0kn
	 2/o/N4DEN9ucHRhhYezpxfZAhZJwtpzMoUhtHM9vi5y/62Z5cBw0VarVYC2kgMF1hi
	 ML3NERBSElFFfFXbQOVzUBG+16CL5Hw4Nq0UJiA6t5+Qf1GkA25b0re6S6e9GBgPdf
	 DlaWZj6CU545Xc8jgBZKGZg3hz0iEfHzMAx4AK69qt/AmzGKl+pUc6Yx4LpegzxxsV
	 d3woNnuXFSxgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DDACA9EC1;
	Sat, 10 Oct 2026 20:00:22 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sat, 10 Oct 2026 23:00:16 +0300
Subject: [PATCH] arm64: dts: rockchip: Add the buzzer to Kobol Helios64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-b4-helios64-beeper-v1-1-6235643158cf@iav.lv>
X-B4-Tracking: v=1; b=H4sIAFCZymoC/x3MwQpAQBRG4VfRXbt1ZwzJq8hi8OOW0ExJad7dZ
 PktznkpIigidcVLAbdGPY8MUxY0bf5YwTpnkxXbGDHCo+MNu56xcTwCFwJ7Uwmst1UtLeXwClj
 0+af9kNIHU5U6eGQAAAA=
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=CLjRnKOQVnSgjGYiJTawa4WmYQi+xZfiDphqtnkUSz0=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFmnZgZGPnopq23L8KTpTftrtQJp7gzji4+ZMvW/F58Ie
 +W8cPLpjlIWBjEuBlkxRZYJhzRuZSy5+tffw/wBzBxWJpAhDFycAjCRrXIM/wyqdJSauPsM2HNq
 bZt9Tv3l2RL3XP6PRmEmT1eES3jvNIb/EbXJe2aGTNzAqqE4W9+N0fHuHI/cz4otD3aEh13yXcf
 JDwA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

From: Igor Velkov <iav@iav.lv>

Helios64 has a 2-pin header, P4, for an external buzzer: pin 1 is 5 V,
pin 2 is switched to ground by a MOSFET driven from GPIO4_D3
(BUZZER_ON), active high. Describe it as a gpio-beeper.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Schematic, sheets 30 and 35:
https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf
P4 in the header list ("Buzzer Alarm Speaker"):
https://wiki.kobol.io/helios64/hardware/

Tested on mainline: GPIO4_D3 follows the beeper input events. Nothing is
plugged into P4 here, so no sound check.
---
 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index 63ad79b4c8ac..d84b777b7153 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -58,6 +58,11 @@ avdd_1v8_s0: regulator-avdd-1v8-s0 {
 		vin-supply = <&vcc3v3_sys_s3>;
 	};
 
+	beeper {
+		compatible = "gpio-beeper";
+		gpios = <&gpio4 RK_PD3 GPIO_ACTIVE_HIGH>;
+	};
+
 	chosen {
 		stdout-path = "serial2:1500000n8";
 	};

---
base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
change-id: 20261010-b4-helios64-beeper-a130e2a23508

Best regards,
-- 
Igor Velkov <iav@iav.lv>


