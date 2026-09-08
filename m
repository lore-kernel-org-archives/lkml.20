Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8D13769EA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788847485; cv=none; b=bWeB/joW1p7ytRIBiM4eqX0rHYhKeIWXTlRXWIpQGtFr94Lg+ZlYDmh8kPj4Ho3vACuH0D6g3G+hlE1o7+qQ0v/QUcKXRYOiUf8a9IVpzXSqMdsWIxEnnfFLwDuX71BHu69xOY/hpd6PHRQ1lQKGNKjigOugTcIdecVm4qnVG3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788847485; c=relaxed/simple;
	bh=PsznWssVyIqIXSXM5IDeRFr2n7xdjfEbEsc54ZDtEc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IsogJocQeXp9dCtic78n+32zmDmov5JlC/5gsCr7Qkz0I1P0/+ad6fMi1R0tFDLLf2/sHnad7k2jEntUafIXw+KbmSIQgIDp+5hnzcq6wnAoeBEBjx0Et1iQJawOAzpjEZqJFxspqpitx775yBGjDyNfiRxzcvELr0//a3rM4XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0s89Rfl; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0s89Rfl"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9390dd46b45so247535785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788847483; x=1789452283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu1eV+ojnBTJPL8f3pcCNNrGxkcxWdZpDJsAdQaiRXE=;
        b=E0s89RflFOid8r/z/m1mb+hl0ztcRIeFY3MUE5yMNkTn1ztqOoWlg2nOBuT6PuG5Oz
         EHRQcLpl/8L0beKzwckps+dorfHqm34pbgoU+r8aL66eeu6mYyAVd/jADdhSu8nrBZf4
         7XlwgvznTUWCAVdRw1TtfB556qw0+LiGnqOBM4jdiy6adckc+gLtrqqDjhyFqCnp+sFt
         aau0ImNaDAAd6k3tV0zaAxZTkSyN1G7ndyX32LcGEikw55VF2Xb0p4rwsTXrUIWpX8KQ
         a3XF94CD3KLAW2uP6IsKlLEMO+jcoxzRFIQbVQC7rHBi+MJbd6hm9G8LscsN4+vvzjId
         HaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788847483; x=1789452283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu1eV+ojnBTJPL8f3pcCNNrGxkcxWdZpDJsAdQaiRXE=;
        b=Z6eg31HmQID/hKlULKRjbNXF3O548zLbCpbD/3WRybT8jT4Dkr88ENSM823xI39GiZ
         MdlHeC8WTJyywYaVvebo1sOelbs02wd6dU6gZPOd5KseJxPQ3IHEVbBuwONJpqMpgLvV
         Qy3nZLaXNSzb4+oQKiuQLrxDsHNhWEeMPHZwON/mWcNPzgxVhn+kknbd66ZhFKTG9rhW
         ZN400Rmy+vb79rT6CRH66bYQE0PnPm0tB0Q10ROBMoLGzq3w/iMNhY+c3EscXt98CfAE
         7DPgY0ncRT0WSoaA9j56JjrgZ+fzUYFolgdtY48KH7/uvTEYzMy/scca49P8l0TVHa7L
         tYYA==
X-Forwarded-Encrypted: i=1; AKwUvBxGQgkDCXa+8fpSzA0BS0Op19mAPONsMe4vPSH4yES1IqUp5Rh9vN/Ghndf1ZAjqqXWObwJ5bFdRIX4J3w=@vger.kernel.org
X-Gm-Message-State: AFuF++lsTimhNWS1ZmwI6twKU+BCVZvg/7l8s5rwcZDqhtFwnc2F8GnD
	N4ObSFh9Dtj+IlzD6u4LVtI2/W54p5uzAyGqYpinMMmS2ue8h9P7FDQ6
X-Gm-Gg: AYBFou2kCciObhQxcQNhbK4ZYH9St4qC8CGd1wtBqYVeWFTlHro5gJ157xGuHrKjxrD
	P1m2z0prsFOxlE3gubVuEtv2be7sLM5O9ECwkl8bXsgrseV7o71w3hdRF08wiL1oqMJyGsV7D+2
	sbqCJZLtsNni4JnaOfbdOOqX+iofO2AvsY4JBfl1vKoBP0FTM4Ext343Q8E9Mg33QKBWCdKvIaI
	cpQjrYVvAvidGx9221yXtowCxblNkSAIFuFcoGrjVzoLsHCVvfsd99ungZfDxerHJ+qUHC8/JdF
	Oa0XCU5j2ZIF3u6XbAIVQQVm9qwAQLK82gVREh2fIG2lwHbIOO684co6H1JvNq7r2gGgjXlJ1Jm
	i0mGDBD/vcgTqj5sax/I/HN5kBa1OVGVLbkjMxw2iCbO3fWCcbDJ5V/p+h93jrEhRVHQzlmwF9A
	Skxp8w4WSaEo2fZO8Sy9PortBJVLOTtUf36t4zGHXPCgJbMUVUbYPtX50wQAti3MPA4kIccZ4Op
	dQaVsDsjtyzPPkoTm0qlLiHGydMd6pIZ49JFXN2+pSduCEL1l0zARyzw3kUU5EStV+zGU9CTG+P
	XcB3+p/3XZzh3OWGOZBCyF6YsUGyDM4sCnWMvc2BXAQCRgES
X-Received: by 2002:a05:620a:40d1:b0:939:8c80:669 with SMTP id af79cd13be357-9398c801af9mr1048705185a.42.1788847482693;
        Mon, 07 Sep 2026 23:04:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939bcfc56dasm108701885a.6.2026.09.07.23.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:04:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
Date: Mon,  7 Sep 2026 23:04:38 -0700
Message-ID: <20260908060438.43338-1-rosenp@gmail.com>
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
 v2: rebase.
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

