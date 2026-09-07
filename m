Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4131B3B19
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 00:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788742777; cv=none; b=Rw/qnoYYzQe6JSG9bQ26OW5Zs/29OHSnTOW02YMUHIHGpgJvdD0i2/xsysQUubqz6mkNOvMH7hmqleGkWEQSfhT2Q90o5rvyvLwADKNSbm8efLa1fZRnLA2eUilOYS2VVI5bTxYYJQCGrkhyxYVaavk/srstlf/dta9LR3GczH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788742777; c=relaxed/simple;
	bh=0PXGBHSc1a175hQ+EqQtqP6z5/0CGy6l4ZJGVwUeaZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OA1hZdBhJDtoId2/JJaFgYVFsmV5ZBbDZV76DDZcIcPHQTz5kYbPZqWdffmE6ywrr9bwf8EsLF2sEAJoU/e2US8ouqIaXXOStvX5wIGlRABxAsHXGs8Hm35j1IjOR5sVtHWsWGahOTCUh7PCFpZTuKElm2KBh9ry5yaIA8Coe9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdU0MZ0Z; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdU0MZ0Z"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so2234820b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 17:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788742776; x=1789347576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3G2fpMnHxfT6KHZD6xOx0AGQFY9wvoJVYEba4PDrt34=;
        b=MdU0MZ0ZwjxcloSfaZU+9WUBTowoqV7wHbCFInlm6PnZHhAvpI/8mOxrJjgCGqlllL
         DDchiExwS7NIPwNL/fRkvwrUFklMgA/7+5Dll6n5Hws6wpaGdtoRfsLubl5J/h/xh1ln
         12lLvQMjJewI772dJ1kqm0X32pR0i3Mx46lPrCGvWxzyBQZuHQYhPOg8NC+TN4qr5hNQ
         CAeAmgpVoP4MkVGA8TTOUr5z/rlRgYyIEvu4U9mGoCMm/FlvTcQ2oLOc5gZ7nnFRvkLQ
         N/cZ8KwdogOtwFtBMVEHqdD+v/tfG54alMiOtVsWBfixwvkJQCZEyYqgHyolROsMFC/L
         Ggag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788742776; x=1789347576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3G2fpMnHxfT6KHZD6xOx0AGQFY9wvoJVYEba4PDrt34=;
        b=V3reAtJxxbh+x1J48U3rzmHb0m9RfGJE633vtFR6IFA4Ua4AH0hjSt67sQT29EUc0O
         w0J9ihPmEGiiyevFU5YBm9EfEZQ/To9E0A6QykBDkD5vmvLHyhPgJIX/j8ldzan1gwt7
         86Nx6x/B0KYcONEw7THcQY4qsQwRCMr4vA+xiNMb9Hnhlbek5zl617iXz+0hczF4CfBD
         5ciecJx3bgG6iHqJpwtZaTMT+uI//0fjlI3YoLVKHH2Op5Rz64QnuKhma6Uyn7SkXgOC
         Tkex1vJtzrWGKYPuNXuNUdK9hkJiFAtaxGMzYStFdbzJG0hMD7Eqgdi3+FQhDAWLBGCt
         ztkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbbas/1OfEYz2dYyscjqdoxAItwB+jbP5f6kdCBpm/MWV3T8agz+NxZxSRbbV1XJAIuSFbwbuBonCO4PA=@vger.kernel.org
X-Gm-Message-State: AFuF++m6KZqNR+xts/I8DL5f+3zqZLcwzNHrCc/VcdRecLQVUPoh/psQ
	BMdPT7jb1oIhcNDVvB5dBvR2AyuYFMMKVUVTmbn5E+PHxWk6ivGvjBC2
X-Gm-Gg: AYBFou3dy2f6TSWp5eeu7BrZsC/xtNuirsU/WThN0/lUpgi5rk0e32qw/0S5r5wmPar
	XQNTtWQ88uri1IRlkt/KHnNe0IYaSyWk1WExtyOh6/TYuXiE2fWS6LL11owxFITsJV9LrXTi2Lz
	sK1vHnwx+ufzV7/eVUZdWUUHAD2FlY36QPax5ZucdRPL7A1P1Qb/9gQfDmvG0WNt/RBCrRGgyJr
	omGW3mhM4Ro2+wn+AUMPtjCm060koT0VHsI3sFPuYZVGW8xJmk8BlIn7Hxs6KYSRKvfXYTxPxdJ
	9gl+EJDeAub/ooiE5acdNznnaVpum39vaPDPu/jQzTYtNXG09UKnFtZvKerDAFMNX1VsIPgZtoY
	mjQhlSdKS+DptnHk/hshcS6jjnqSmtqt0/VMfmQLZBZ7EUocslAE1s4eFGFfrzzsU1wMUv2MD+o
	dfrl7vQVy1OK3JiJcCQOLxxrwfImQPaoaxM69e5WkPWDOrGekoUSf785hzkHo18fmwz90t+2ih0
	UlMTeP+Mp8xTySLvq0VmXhDzvcN3vOQym1CtfmzYszt7cSpLiVB58WSMWma1GCv/tYh2WcXoe/s
	mHwHhRi4NOQ3wHL8kfEHIDB+QmTrwrRgjwOWpg==
X-Received: by 2002:a05:6a00:440f:b0:84e:b7ed:7d50 with SMTP id d2e1a72fcca58-861684928fcmr27242447b3a.16.1788742775744;
        Sun, 06 Sep 2026 17:59:35 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-861527382f0sm3628242b3a.24.2026.09.06.17.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 17:59:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
Date: Sun,  6 Sep 2026 17:59:33 -0700
Message-ID: <20260907005933.230766-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCA9655s on the ClearFog and Helios4 boards are
register-compatible with the pca9555, and the gpio-pca953x driver has
matched "onnn,pca9655" in its OF match table since
commit 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi
pca9655").  OF matching is tried before the legacy I2C ID-table
matching that the old comment alluded to, so the restriction no longer
applies.  List the real part and drop the stale comment.

The I2C client is now named "pca9655" instead of "pca9555", but the
expander is otherwise identical.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: rebase so it applies
 arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi | 7 +------
 arch/arm/boot/dts/marvell/armada-388-helios4.dts   | 9 +--------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
index f8a06ae4a3c9..4a61e9d1a2c0 100644
--- a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
@@ -131,12 +131,7 @@ &i2c0 {
 	 * 15-SFP_MOD_DEF0
 	 */
 	expander0: gpio-expander@20 {
-		/*
-		 * This is how it should be:
-		 * compatible = "onnn,pca9655", "nxp,pca9555";
-		 * but you can't do this because of the way I2C works.
-		 */
-		compatible = "nxp,pca9555";
+		compatible = "onnn,pca9655";
 		gpio-controller;
 		#gpio-cells = <2>;
 		reg = <0x20>;
diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 39b2d4fa742c..bf6d70e2078b 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -160,14 +160,7 @@ i2c@11000 {
 				 *  6-USB3 power
 				 */
 				expander0: gpio-expander@20 {
-					/*
-					 * This is how it should be:
-					 * compatible = "onnn,pca9655",
-					 *	 "nxp,pca9555";
-					 * but you can't do this because of
-					 * the way I2C works.
-					 */
-					compatible = "nxp,pca9555";
+					compatible = "onnn,pca9655";
 					gpio-controller;
 					#gpio-cells = <2>;
 					reg = <0x20>;
-- 
2.55.0

