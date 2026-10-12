Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0676443C1E;
	Mon, 12 Oct 2026 07:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788789; cv=none; b=S61U7/XRcECy8v1Pay1zOtuYs3m8TLGDHlXOhJtKzkGGR/JExSpmPKgRA5zroZDckrlGFCcwn/dWxdwChzMHtYG7S4cEc37824XbO90Ryv0NwE0B6Yn0QamTPNyUWts3gDB1l8LYQrioo4wN/gpfEpdtIcYzzUZwyD/U5OTIanU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788789; c=relaxed/simple;
	bh=oU7OSGsGCChxtb0imBFJs3qamuS58txChbo4oafcXSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KQMwU2imc08fC8+KUP5bN4RecmOKzut4BVbfFxW/eeJUHB5l/A096yBoIr9xrAh1ltOd2XZRzSdUQw9O5/oNWDI0zbd99utlyuHBTFydtpA/FGsG+SCtwKyKXgza9/6STj5weHi1YHqOWOb8HNMdEH5DWUrTFm6uLpDpa25GTng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mp+klYBA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mp+klYBA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FB43C2BCFC;
	Mon, 12 Oct 2026 07:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791788789;
	bh=oU7OSGsGCChxtb0imBFJs3qamuS58txChbo4oafcXSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mp+klYBAMaWAWfcey/L7zaWD/C2dR7z7LrLqnb0g+674eBjSSXfEK7cDHJceWDtkG
	 duIZl0pOLfuKza7+ju7S3ezSKdhijNZHwCl44uDgUOVFzg3Mj7FMRpMZJIKM7Ud+4I
	 wPrBObJBbYbr1OGmsp+UuxHBkzLaCpNUvq2VsoHLgbvHbyufHhrket7dHtT5Km+H+x
	 ZOav8f8grIgeBfOWTp2LpZvt/BcTHHQMFhhNYepeZtWllt4DbDonQ6l0FwK3Ak0EX6
	 kK6FhC+gIDSzoVTHe3exziYriYu4SCBOkRqshjg4qvFAHDaHk3N5tYTX+bXBgB6+r5
	 boRjK9I0RZhog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCBFCA9EDC;
	Mon, 12 Oct 2026 07:06:29 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 12 Oct 2026 15:06:15 +0800
Subject: [PATCH v11 6/6] arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-b4-s4-vdec-upstream-v11-6-25939f85ada5@amlogic.com>
References: <20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com>
In-Reply-To: <20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791788786; l=804;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=JWQCGjDWj4OlMHRQFRIjAM7LOPDvpPJR+CoIv/avXVE=;
 b=1o5Q9JSQKVn9zZDCHaAK4UyabPQ0AmoJV/Y90IaWa5Xc02Guf0pJqPZio0apOvVSjpDljLVYE
 7RhTu8piZoED2fzQU+G3V3Ko4SA1V+/QinbHDwGDOA6oKoqjJLbMyAw
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Enable the Amlogic V4L2 stateless video decoder driver as a module
in the arm64 defconfig to support stateless video decoder on Amlogic
SoCs. The driver is used by Amlogic S4 platform, such as S805X2
board.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 50d6357727af..46f2bd71aa31 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -930,6 +930,7 @@ CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_VIDEO_AMLOGIC_VDEC=m
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_VIDEO_WAVE_VPU=m

-- 
2.42.0


