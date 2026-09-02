Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5660B44AB7E;
	Wed,  2 Sep 2026 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345206; cv=none; b=iZGvw3T08KQKY+mvL0/VWN8nWr8aFREWVNjkrkd/swgaWr0iK5g/XwdM/ycJsSHSVMRVZTmOjeFbn3J0gWcwH0wJo8S9ZnRSgA87pbf4x8SJ3SLOWm6VuCi4ugEQxEugVIi5ooA6FoXAGvK6X0YWBSQFvV+Z4LN4OeGKCTrRBG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345206; c=relaxed/simple;
	bh=Iy+VUNXDXW8cWtqhoAcajkOwEmooMeEJCbxXu8rQQOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lm1hbihkCU1PajI2upU2LRAz3obGvLOy4WePHf90yRtO6AgGZuI3J2FAfr3NLL6dJ7Keqg99UQsaAMF3c7Vq7Smlgb+6xS2vviWt2AaFoOk6jJvaBGzM3TWQIcttAiL+I58qzBBOMyA6J/AHYAFsSDCZDI+JvSb1cBawo0Cundg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=POWuk7sd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="POWuk7sd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788345198;
	bh=Iy+VUNXDXW8cWtqhoAcajkOwEmooMeEJCbxXu8rQQOs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=POWuk7sdMsPIg1zcWIim2kuet5JxYBmhJG6SFrb9VcEt2CfsK1hM8cI5oK3fJQIvF
	 5XcgkAR+aYJTiNYVtTHmFcAZtkPj9E4aHvkvs2heFQaBlssCUbTQzIKVIN+J3CUPqg
	 rlYQqPMqssgCrFzk/kchPsPUGT7lPmqppZ/fd7OOEZg5Lh4KTdxgv6mO74T/DrKdar
	 yFPEg38BsCY6jhenufqkDlpj0XQx6/S7MMNKaftFCyozJxQGPDXfPraSXaGPeMVBhm
	 1o2ZWRMsr3y8qEMX4YMFHiz08rs3xNGGq0gloYYZJJZNC3ef86a5SbfQia7ImQqxZz
	 dPEZDpE3ES/Qw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 76D0217E11F5;
	Wed, 02 Sep 2026 12:33:17 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 02 Sep 2026 12:32:46 +0200
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8395-radxa-nio-12l: Complete
 UFS power supplies
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mediatek-ufs-cleanup-dts-v1-3-7876e7a27a9d@collabora.com>
References: <20260902-mediatek-ufs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com>
In-Reply-To: <20260902-mediatek-ufs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788345194; l=1050;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Iy+VUNXDXW8cWtqhoAcajkOwEmooMeEJCbxXu8rQQOs=;
 b=c940H5zXtUUgCV2sxRtdhKxlcCdgXiSInmQ1m1p15P0fCc6REDVxahRltrLYYFGv6Z/dWMvKJ
 r3EureIi3lSDVQbsIYWdtnhDJS+zxKJXTxYtS3WtfSyJykNR8tRgN3r
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

The MT8195 UFS host controller dt binding now describes the power supplies
feeding the host controller, that were previously missing from supply
description.

So, add in the Radxa NIO-12L board devicetree the regulators used to
power MT8395 UFS controller on the board.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 9cf0315da035..7e9cabdd2825 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -1184,6 +1184,9 @@ &uart1 {
 };
 
 &ufshci {
+	avdd12-supply = <&mt6359_vrf12_ldo_reg>;
+	avdd12-ckbuf-supply = <&mt6359_vbbck_ldo_reg>;
+	avdd18-supply = <&mt6359_vio18_ldo_reg>;
 	vcc-supply = <&mt6359_vemc_1_ldo_reg>;
 	vccq2-supply = <&mt6359_vufs_ldo_reg>;
 	status = "okay";

-- 
2.55.0

