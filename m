Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3A7F9C0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566661; cv=none; b=Ga/bfxVkk3Xulgbk1YQ9EVsKAsK2gW9Ll/c0GvUpyBJdI+CjYmWmcQa70zYaQ2v+O3o9sW187yu7Eg+EC/zATdn98q3QaSDCLprdpl5dDwFONCfVToAEMuHigJtbIrrAOIIIBlDRkBNi11SILWO/QMqVGg0QVty009E4iIOaysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566661; c=relaxed/simple;
	bh=u7Y9DpTbLT1QXKT9NULVSoWd53oeRToOrHQD5cTZpJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gYDFn0GQAKq6+FN6Wohv5OQ1L6FNmsv4YfsGBF1+Y2k/fpdFWCn1o92VHGW03UdfzMfQW+AUxLyFmfX/f4xVPYhceRqOM7bulzhxB36bP2d0sZRoN7Nd6+oQr5Jz6hp/jSElcYoPtKP3faXUXQqZa2/HSug6uTZnPQWzCEuxiXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECyfDux/; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECyfDux/"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90cd96389efso21329856d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788566659; x=1789171459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4RGLSHOixg+9K49QmcrmGAtJTwJQ8BvkUSf74DteswI=;
        b=ECyfDux/n94dsHc4HxbF3epIOta+pgOKK582+9f+KMxRBCoEv0TrjK02W1zueYeahs
         srlPzoY09qztLkG1sy9zk1ByoHV3jzv4yWdPX19gYwMeqSsFIkfn1S48V+c0SjlfS3Gb
         6t6alLdiCNx/1QE7U++K6zb92vKjigWm1LH0we2M7c0Y2o0MK6cdMf/VdVRTww6arsce
         PhEJex8KQ/+8sovYyRjADPjkuaMBgq8aGMRiKHHQK98fnbIBKpQjfioztMKkZS603iH2
         G5IQqiAYQvYT2U9SQghMH+KZ2L/1EDGMAi8N8RnLR2QXpYJcf0NQiBL4Brd2ou8mtlk/
         IFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788566659; x=1789171459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4RGLSHOixg+9K49QmcrmGAtJTwJQ8BvkUSf74DteswI=;
        b=SEMDRCIRKzTpB+B+wHPNCdtUGAJ/HvpmD2fttgg2DDbS2W/U/plxQ5lGM2pVUZTMzy
         pg1qlGw66EamlAr4Rf4lCqMhX5OHzXNdBRjlrf9yUCDqonoiatyVd6X1TyAQLlwQAVXA
         bWqnOJnKlBWdWLqQRnWTt+Gmuw/Vus1/8Y/PqA0CfPU47/qMlrdyQm74sHVQNioB7OAO
         kscV8meiqKLyCH5XveSswxVz8Q92bDZuwaha7YnHsBmthl+zGDH4Q8UyyNg1VFlWgMS5
         amtvuZdyXXkhrv/mXvEbGRRmgWBrwU/yFrJPZIIdIb8nxl3y17Upzr26GVIW0BxzQ1CA
         WbKw==
X-Forwarded-Encrypted: i=1; AKwUvBwvG3LbsSmD2ePVH9lyLyf1+9cjNzxUMjQ4SyuGwlBe7HiaPZfkwO6a3u7CuBbrBZPz44BBZp1Kltk0ZKo=@vger.kernel.org
X-Gm-Message-State: AFuF++k+q6VvGUFHvNyVm4A4idNfB1ptQSrWGwpgHRER4s1V097uDSHK
	CAIsmi3cYupGJCw+zA6rQ9rdlh0XYsoAJV28VYuRbqMVhFQbs8B6s2RK6puKpg==
X-Gm-Gg: AYBFou2VKxcjYcRHv1VbZ44E/FuUn8UsAgs20vxesHV0MjNCVMFE4zGvJ3mRy+pzdAW
	S1OewM/rGxTbWu/z49gpbHhqBrj3NFDWddnmMZ35bEs31G6NFiwMFCSi6v4PpWHcaP21RCU36m8
	FdC5AzVBwGcUfXEnFz44iucKUMM9l0dh6yZz06Y8HCB2Nd16dGkxMND/8RS0bmgC6rhm/Ae9nT6
	x/xTXJBcm5OZcctcs0UFJGuTezrFhQIvMF0YIbwUxxbMF7xTq0zbPb9hU4nUip7roMtzMgWZfvE
	zI70dGn8L59b2IbvFt95K8D5KOO44fSbCLkjL6ISoc8r+iBIjYV2D7TB21BA4N9Okta8lw7GEog
	lKCx50vJStEh7dvUqyVa3KZEmDgflScfSlqWa0aJNcmsfLtx7g7iHt03DHwG74yOEOxxlnT7Agj
	28WlH+3yG8eIFd1zEZKdEqrMkHuHzux4FiiSdh7UCqG2GsX5GMQpN9DVkItbzHNNGl4OGVA50TH
	+kiG1xLfn8m2Rgj/cdty9tTc2rAANjsiETBXUSG++51rdKkUKNta1DBZSSWgu94jeZ7Z2M5Ye1p
	IEtNSMqVlHppTl8GRrMAyJTvluIEz2w68g580g==
X-Received: by 2002:a05:6214:5990:b0:907:aec2:6cdf with SMTP id 6a1803df08f44-9103ef729camr138630826d6.8.1788566659120;
        Fri, 04 Sep 2026 17:04:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040664be1sm32861156d6.18.2026.09.04.17.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:04:18 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
Date: Fri,  4 Sep 2026 17:04:15 -0700
Message-ID: <20260905000415.153682-1-rosenp@gmail.com>
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
 arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi | 7 +------
 arch/arm/boot/dts/marvell/armada-388-helios4.dts   | 9 +--------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
index 6321425eb9c6..34f63b6fbc74 100644
--- a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
@@ -92,12 +92,7 @@ &i2c0 {
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
index c1c1b16392ef..562fa2e34da1 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -195,14 +195,7 @@ &i2c0 {
 	 *  6-USB3 power
 	 */
 	expander0: gpio-expander@20 {
-		/*
-		 * This is how it should be:
-		 * compatible = "onnn,pca9655",
-		 *	 "nxp,pca9555";
-		 * but you can't do this because of
-		 * the way I2C works.
-		 */
-		compatible = "nxp,pca9555";
+		compatible = "onnn,pca9655";
 		gpio-controller;
 		#gpio-cells = <2>;
 		reg = <0x20>;
-- 
2.55.0

