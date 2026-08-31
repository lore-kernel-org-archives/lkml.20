Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75AA45562C;
	Mon, 31 Aug 2026 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186066; cv=none; b=RsKyQ87wbyeG5BgZ2jatqqWc0CU3gy0k7EEaiR4m7PQv6ZUuZgUmZaFlhjU5P9sfrRxiz3Et/5iMBnvjzv5+MoAueReP37ntkQVSPVvL0dad3l4e8Lu96akRARjdheljUiHGP4AM3eib5hD7uFrZ+l8FUDANk05qt+SozFsIfH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186066; c=relaxed/simple;
	bh=pJmqpcEGREq4W7//BMoI1cMXR4zhI0TzTl2ERbFmqW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ERimkShtUvSuh1gW1f4giMVqQrFYSTUH42eaRLOrm0hkL1kRk/eY7yMfROfOIFTR+pnlR9VezmwYUhbJ9OURgWv0Ox0qTFwvrknNLXqsOJ6cIQ+3olh9D9U0g6Gke3zDqJhuMrCwq/Vik5E22BkYUwEBGGmcdpThTk7Zp9o+qTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IiUx9EKI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IiUx9EKI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788186062;
	bh=pJmqpcEGREq4W7//BMoI1cMXR4zhI0TzTl2ERbFmqW0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IiUx9EKIpoJF3CvOYfevFqGSwiKVJYCOFG+yz9eHgCL5lQ/aGNDAL0yBfJ9uWCRlV
	 3cLJIZMVIG5FHceCz89xDqgbqcnagwKILjaPdeZHIRmEyTUjkBnmZX3LjQRc71PAdK
	 +ZL6OFfkWpu9HK8PMggmQFgKMC5tUXXSSBw8wP+2Ki+rEABl1rER+OsZ3S8Z4lfWK4
	 EcpIgYb6B+7Lbq7yJHMdpBXrb02ZsS1JnzN9zrA96pzO2o3N1vGw1Rsln1nMV3CgMx
	 dEiwNvq89CZ29yT7/bCgNxxca6etZblDAcTM53rvuKKsBawyAFOFwWQ15g1EL30vNR
	 vkFJnq3sQML+w==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BE2F417E0180;
	Mon, 31 Aug 2026 16:21:00 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 31 Aug 2026 10:20:48 -0400
Subject: [PATCH 1/7] arm64: dts: rockchip: Rename rk3066a HDMI audio card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-fix-rockchip-hdmi-audio-names-v1-1-5b155ae05293@collabora.com>
References: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
In-Reply-To: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Johan Jonker <jbx6244@gmail.com>, Alex Bee <knaerzche@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

Rename the card from "HDMI" to "RK3066a HDMI" so it identifies the
SoC in user-visible ALSA fields (shortname / longname / driver) and
no longer collides with the identical "HDMI" string used by rk3288,
rk3328, rk356x and rk3576.

Fixes: 041f240e4df6c ("ARM: dts: rockchip: add hdmi-sound node to rk3066a")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm/boot/dts/rockchip/rk3066a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3066a.dtsi b/arch/arm/boot/dts/rockchip/rk3066a.dtsi
index 3f6d49459734..12a3cbdfb481 100644
--- a/arch/arm/boot/dts/rockchip/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3066a.dtsi
@@ -55,7 +55,7 @@ display-subsystem {
 
 	hdmi_sound: hdmi-sound {
 		compatible = "simple-audio-card";
-		simple-audio-card,name = "HDMI";
+		simple-audio-card,name = "RK3066a HDMI";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <256>;
 		status = "disabled";

-- 
2.55.0

