Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B217549F134;
	Thu, 10 Sep 2026 13:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047339; cv=none; b=o+Dj2REWc3t3ms8qfjCXTRscs7puQSjGxmccDigWFQUetiRy1zuNzqHIusCLcqu2OFRuOwVEx/MlYrRtaF+CofYKQpGSk2VTUYQjbznLmyDP0K3YRF+Mvg0S1Oa/f8nNuPP3ych0ozF7PnbisO/JqPU7VClj/s1o/SpocY8F4bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047339; c=relaxed/simple;
	bh=DoGowj4v55nBBEq+iip4Zm4WBOyuRaxvLazd1hFH7tA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kTxPIXF9YzT3W8gnY+f54SeA/kK4Rm1f7OMnXB4PqxMcd7cxNzLwS3oU8Fysei3uTNBqQ0+kpEQ34xXJ9BOn7gWQFXT9jloxE9/21Fu55WAbHymgQMv11mUi7YLfmpaKAr+bcnjLsxu+bRbqlSCa8KsH3rKQe6VJFIf3Js80wZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IijqPaXd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IijqPaXd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789047335;
	bh=DoGowj4v55nBBEq+iip4Zm4WBOyuRaxvLazd1hFH7tA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IijqPaXdt78Q6dSsfKZdgPGhBrtpt3N12vIGOCuuuSICbdVMn/qgZAM7pqQA5Rmga
	 6ZX7+018QuMwnZmO94i6S5c8IUUDJFvYtQDRWfQzerOCnGSlBqRn9syvv0dZN20ET5
	 mAJih15I0QFeu7lWi4xvOBnkfZDiXNTnYRpRN0dQa4Fe7mCb5j9ijEsLF0qECNB6VL
	 v0Dji00MTM43Dt11AnmRL5xdL4pIwGmMuAiy6E4K/L6FBJodNHSWTp7+VDhkwA0Pit
	 bEiW+xR4wcwjwW+sK3rNMVzVSyVAYtIZJ/a9cTCaSs4syzpKxoRqZzizftU6lnEMw6
	 zXSiBobxnamDQ==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA7EE17E03E1;
	Thu, 10 Sep 2026 15:35:33 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 10 Sep 2026 09:34:46 -0400
Subject: [PATCH v2 4/8] arm64: dts: rockchip: Rename rk3328 HDMI audio card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fix-rockchip-hdmi-audio-names-v2-4-1396a6168e20@collabora.com>
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

Rename the card from "HDMI" to "RK3328 HDMI" so it identifies the SoC
in user-visible ALSA fields and no longer collides with the identical
"HDMI" string used by other Rockchip SoCs.

Fixes: 29e8976e604f1 ("arm64: dts: rockchip: Add RK3328 audio pipelines")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 03b7c4313750..26c9f4558ed9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -207,7 +207,7 @@ hdmi_sound: hdmi-sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <128>;
-		simple-audio-card,name = "HDMI";
+		simple-audio-card,name = "RK3328 HDMI";
 		status = "disabled";
 
 		simple-audio-card,cpu {

-- 
2.55.0

