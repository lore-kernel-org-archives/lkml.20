Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B1849EC76;
	Thu, 10 Sep 2026 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047341; cv=none; b=TEYeH4OmyCJS43FejvSUfAxpSKBLxVBRccs0I8Zm2XZebRaqniwZEDAcDr88+I44uz1erquizVHmAInAaZuh6s9iAlwtggP7oQx0IeW1qWTxXfjPcjRcFWt/RYI4uRfFAVEUQ1HCgu0WggIhhqsTPIy9ZV+MIXU8ka1Vec7RWqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047341; c=relaxed/simple;
	bh=BoOMfIFPIGwvljgrOki6vDKw076yvIl6ObzO4+ZHHUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DKEFMXdRmah2EYpGPWBzK2VCV7XRObzLVSCHNWMM0KDAMLsCRChfNntclbQgBsthOObtHZcLqhQt/KVrrhF5Hocwv7KUb/f31rSI4qNYToO/eK4aiL66VYOLOCJbOpSTx0Mkq6LlXfR9m6SHniOjAy4r6X9k+mmnfOV9LbtnLps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jM5VKKB2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jM5VKKB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789047338;
	bh=BoOMfIFPIGwvljgrOki6vDKw076yvIl6ObzO4+ZHHUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jM5VKKB2jyUgY4IYCO7MPurWpDYnR+fBjdroLnWI0Yg0/nbJRpM+9qwo0IzmrV2Oh
	 k527jf+d3ahA1ZQjz+UdRRzW7DEHuaNHBRtkdE09ZGS1SCA6CQ/hYmZGXTZA9cIbx6
	 Q64dyBTGzEaBstnAnVgeYysW9DzQdVryv141RW5bg526lnpc0d41noBd3bIBhl6c/T
	 DupbVcuzbImxI4ItXqN2ex/8ysyZZosGjUII4E7Al096LQul6OjhP45uFD3Jdbf5Du
	 2tEUelr/19ewDPT8hHeUx1UdfF8fxZlbuLrDOnPyDQKjqFbZS0vP4V4MbrdYsiAgDm
	 jGjgpGp2+vRhA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 33D9C17E0EB0;
	Thu, 10 Sep 2026 15:35:36 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 10 Sep 2026 09:34:47 -0400
Subject: [PATCH v2 5/8] arm64: dts: rockchip: Rename rk3399 HDMI audio card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fix-rockchip-hdmi-audio-names-v2-5-1396a6168e20@collabora.com>
References: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
In-Reply-To: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Johan Jonker <jbx6244@gmail.com>, Alex Bee <knaerzche@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 David Summers <beagleboard@davidjohnsummers.uk>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

Rename the card from "hdmi-sound" to "RK3399 HDMI" so it identifies
the SoC in user-visible ALSA fields and matches the naming scheme
used across the rest of the Rockchip family.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 49c68fe65de6..c46e58d4af0d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -2008,7 +2008,7 @@ hdmi_sound: hdmi-sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,name = "hdmi-sound";
+		simple-audio-card,name = "RK3399 HDMI";
 		status = "disabled";
 
 		simple-audio-card,cpu {

-- 
2.55.0

