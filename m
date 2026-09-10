Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA75849BD71;
	Thu, 10 Sep 2026 13:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047332; cv=none; b=NfD56KUEPVntiSMJbVa9E0fj2usgDBf/6l8ZjhXyimppS3apmW1D+DIMo7+W4zX/GKsNHfdinY/PJioFIQqaAdgfmm6QGGsc/F2XOkvNLc15IjSMimD0a/7OXZaKNQcJwMCuR0YV09DUlMcfLHUU+LOSnd0vBzFJXprO4QDI6n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047332; c=relaxed/simple;
	bh=pJmqpcEGREq4W7//BMoI1cMXR4zhI0TzTl2ERbFmqW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mI/TmpJwcdDKntxSyhXBpVmnJFNnIJ+hung4sU5Uw0zTUFsljjFa0H5USrQI5aCR0VnGj5hQ1tiTCRoqcmv3+Fo1nzetPDZ0MvSSol1KcH4T+xVrLvzzVYHP/6yOReO18WWPwjEkXfaLUgoiRI99hSLjHP3LpvBy1ur+evLjovQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Of2wE9UR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Of2wE9UR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789047328;
	bh=pJmqpcEGREq4W7//BMoI1cMXR4zhI0TzTl2ERbFmqW0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Of2wE9URLUbLE7WxDya6/0tMSUK+vjkN6nu9Sck24CDFZHxAio4OpNe+msxrfwTC/
	 WlzNuXWpbbVoVoKjGuJbmqNfxMf+2HJK3XMjiXo8lXhlrVgON+9cMUAiMj2Av5AVhX
	 TAwIc6ImNYEmqy4oqT/6O4OsNl0CE/cuKrxVQ1JYTd2oNx7xmfOQdvUIn0yAd48w6+
	 MzLJkd5pkwnDcLJ65G4ajc91tpcuPhCSH6917CelSV+EcttUYH1C62Pip07RlqI+gL
	 Sl1dPBPAp9ThKdmNDKc9XJR+bYwBDvk9iRYOIkXRb7lb+G4KvFL0mtAa4lEXKvwoFt
	 DZID8AUED8zzA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D882C17E0D43;
	Thu, 10 Sep 2026 15:35:26 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 10 Sep 2026 09:34:43 -0400
Subject: [PATCH v2 1/8] ARM: dts: rockchip: Rename rk3066a HDMI audio card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fix-rockchip-hdmi-audio-names-v2-1-1396a6168e20@collabora.com>
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

