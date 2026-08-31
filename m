Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA03F3D16EF;
	Mon, 31 Aug 2026 08:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165136; cv=none; b=Fi+Hmgrr/53sz5XhtuTK7ufl1jdKBuN3KMaEoS5SoNZY6dt/Jhrv7r9ls3SPydfCLAQEtn7MK1HfE5PRur+PoRobxUr2iXSinoHjq5PMqaoqLbV8YhoD5xjEkxNIrWxIGBa67rSSiE3HdPEoRKs+IDGJH3CV8Tg9TZeh7+MUx60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165136; c=relaxed/simple;
	bh=Zpmh8tNY6Pnt5n65mitKLOwn/ENmAmMsvrIVDSYl1f4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=spCaOklp9jIUk1fq2/OIktQ0mX1drc5AXBpG+kKGkvIJBVAcyJAH4BgEIfAh+4cUtvroVhrzCbnbUYLd5GWHzLUOSeMWXlRvUhWZh5GiFN8eWKy9ugHlDNhnklTiwr4sPSbrC1YH0pG8R7jeo0ksIKRF3PSNldLwoNWkieBe9gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPqMBynU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPqMBynU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87448C2BD04;
	Mon, 31 Aug 2026 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788165135;
	bh=Zpmh8tNY6Pnt5n65mitKLOwn/ENmAmMsvrIVDSYl1f4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RPqMBynU65LjI6Vl/7KIXtttXK5iORr2AKGob9TfoUzvwtTPxdLhsjtPtbRpAnNeW
	 ZM7AvBqa8ndzY8zzPgveTMGGB4YX2vVO56ysz1tewB9na9zmoOBie+Lu7yvyyaKhr2
	 OhS3XNyqvk+StAOlARKgaGuV6Qhd4NDwfya02IIgy/vszmNLljD524Dp9f7CMjH5hI
	 mqUd8UqmXHr3EoySLW0g7UHFdbCtHB77/3nH9s69j6j61b6ZwGdXm4/yghib2NHlZV
	 +FBAW4cl7wX/wmO9kgqH8On8eMmgBUkfdp1pBlailyIy5nXQSWgxqN0Uuw2ZeYMJDn
	 8LtN0kU5jW/fA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F91C61DE2;
	Mon, 31 Aug 2026 08:32:15 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 31 Aug 2026 16:32:07 +0800
Subject: [PATCH v8 6/6] arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-b4-s4-vdec-upstream-v8-6-830195b9bd91@amlogic.com>
References: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
In-Reply-To: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788165132; l=809;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=A5HDTanmoeQPb4xnQrPVjYVDpBjIBDOzhYRIxgeYOhA=;
 b=q/HvGSIYqTfiuTOxoGZD+U+Pzn15T2JtOwrokLrChiO/prI0nPmQ0him8Lf1nESJZYXTAsD7e
 qu/qUh4VbH3CIAEusSGKF+4napilCUEb0sCr+y9bMrOPFPvUgDjMz39
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
index 6ec8d3a69c98..7be4e5a284ba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -919,6 +919,7 @@ CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_AMPHION_VPU=m
+CONFIG_VIDEO_AMLOGIC_VDEC=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_VIDEO_WAVE_VPU=m
 CONFIG_VIDEO_E5010_JPEG_ENC=m

-- 
2.42.0


