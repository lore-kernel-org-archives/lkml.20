Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FE2503BD4;
	Tue, 13 Oct 2026 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903893; cv=none; b=mGX0Jvg8/xpjXFxBnJaSC1M5d0s5F7JonD6Ov9i4kTecnvo6t0Mk+geO5dcvujVm5cjZUZ5hog4daMTQIy1pftZJzfwxeJz24hkHEh/QQJT4ObJHRuuN+6B4OpUyIr3NUuyeaLGj/UrySxGWLGW9uph9S8t3qaY6L6uSphyDMgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903893; c=relaxed/simple;
	bh=iGK+XDeF5LRCgZT6TVHdzPc2Nv4eswmoGZ7cthlsXwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ciZAeuWmDFWW++6Kf0yM9CHthjOsL41ysjOgHN1ci5DlbY+a7QLPIKMjGEREGwvhqqrjCFtNFd1wopTwKHM4pe5bCUniftmabpVWvCRd8nOlw8lppAAMWZcWE6pWzcOmLHgkqdVyf702tD8BlJMVwT9+O0RZdtsks6QO6q0y494=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzkVXpIK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzkVXpIK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D827C2BCF4;
	Tue, 13 Oct 2026 15:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791903893;
	bh=iGK+XDeF5LRCgZT6TVHdzPc2Nv4eswmoGZ7cthlsXwc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HzkVXpIKn7vH5c5cLxcFc8GvfZWYQjMAjRyKWp0LKIxLjELYN5tgXXMOVe7khRAkJ
	 JMm1mJ9JfRTvOiOCTipjarSVCnAdhnedS3let2X2S0fOImU1fxBDXy8AhVAfI/V+Um
	 o52NSxQfbgqCmMGzuhI/efZGnagXOJG0B9X4+wsAmKXqkci4aPysT+6RvX70tfH+1c
	 7zzMyq6Jnafh/F+1h4dcOGtal9urFaEmRuEID+6O1q4whq++zZeEeRoF2+olAwxdkz
	 rgSxEW9Gr80G6zLi+uDxqAdI4OYK8FCT6wf5uGEgQ4EG0GmqhT4UWDd8KXakgqc5Cg
	 FjxRcHWTpa8rQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A308CC6B0E;
	Tue, 13 Oct 2026 15:04:53 +0000 (UTC)
From: Mizuno Miotsuki via B4 Relay <devnull+founder.crepuse.com@kernel.org>
Date: Tue, 13 Oct 2026 23:04:52 +0800
Subject: [PATCH v3] arm64: dts: rockchip: add UNIHIKER M10 V1.2 touchscreen
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-review-self-touchscreen-v3-20261013-v3-1-beec2a35cdb8@crepuse.com>
References: <20261013-review-self-touchscreen-v3-20261013-v3-0-beec2a35cdb8@crepuse.com>
In-Reply-To: <20261013-review-self-touchscreen-v3-20261013-v3-0-beec2a35cdb8@crepuse.com>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528;
 i=founder@crepuse.com; s=20261012; h=from:subject:message-id;
 bh=niQemHq0zIYyejRqSf64CgT+VZtMHF21KC+IBXETBh4=;
 b=kA0DAAoWFtY8A0Xkb6QByyZiAGrOSJOg3Uk1iEB/UQW6AHIMhLgXnDiU/com3J6bMPYkquRg5
 4iRBAAWCgA5FiEEmxUHd8KDqNadkII+FtY8A0Xkb6QFAmrOSJMbFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMCwzAAoJEBbWPANF5G+k60YBAJhYsdJkB1AQZ/lpiN34RkGKJ+49aU5kZqH53WFi8OO
 HAQCi6cmGzLlP1oQ4AldK1QEhNyzjsfgcY19W2UmQtAzOBg==
X-Developer-Key: i=founder@crepuse.com; a=openpgp;
 fpr=9B150777C283A8D69D90823E16D63C0345E46FA4
X-Endpoint-Received: by B4 Relay for founder@crepuse.com/20261012 with
 auth_id=1166
X-Original-From: Mizuno Miotsuki <founder@crepuse.com>
Reply-To: founder@crepuse.com

From: Mizuno Miotsuki <founder@crepuse.com>

Enable the NS2009 on I2C2 with the validated raw Z1 contact threshold and
Y-axis inversion. Connect its VDD to the existing always-on vcc_io supply.

The NS2009 VDD is connected to the board's common 3.3 V rail, represented
by vcc_io. This connection was verified by continuity measurements
against the exposed 3.3 V header. Additional measurements around the
SD/MMC interface and SoC decoupling capacitors are consistent with the
existing vcc_io supply topology.

Reuse the existing supply without adding an enable GPIO or changing its
shared supply constraints. The 10-pin NS2009 has no separate VREF pin.
PENIRQ routing has not been established; retain polling without declaring
an interrupt or claiming that the pin is disconnected.

Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>
---
 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts b/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
index 0c03f118378a..933d3a139ace 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
@@ -134,6 +134,14 @@ &emmc {
 &i2c2 {
 	clock-frequency = <400000>;
 	status = "okay";
+
+	touchscreen@48 {
+		compatible = "nsiway,ns2009";
+		reg = <0x48>;
+		vdd-supply = <&vcc_io>;
+		touchscreen-min-pressure = <150>;
+		touchscreen-inverted-y;
+	};
 };
 
 &io_domains {

-- 
2.56.0


