Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8883597B;
	Sun,  6 Sep 2026 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788703106; cv=none; b=GUvF58xW7vLxQs5YKMrxThPhBenW3/IxuuwaFBkh4mmwCqMUnnext7eQtTDVDaqVdad5Q+j22P6zix2y4AZLI15V3S5fyNRjsacYBWpe2HnRow20GgyutKQQlPgO7nZn5Iqb/o3jleVarTDAuBIPPg5vp0fpwYhX7zHSThUSDfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788703106; c=relaxed/simple;
	bh=GOM8XxqDFjkbB6g2HVCxclX8MgAzz1Zjvu6y5y4pW6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ptv4h0v9Xs81xIFW85gPy8MZj4RsS0meFLa3dzvcrrXmfLIH9Wu5SfuAIBULH4p2fgqbHciRT879NMJdCuFWmUWeFc6QT86ZtWb8+KuNOR5QtgAmIpLHVhsxL8ZXqHyo/XBontU+c9P8w1Nxm9CWf9NiPxC3/wP3OJZ62jtRe14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ad5vPUdl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ad5vPUdl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E8A5C2BCFB;
	Sun,  6 Sep 2026 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788703106;
	bh=GOM8XxqDFjkbB6g2HVCxclX8MgAzz1Zjvu6y5y4pW6E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ad5vPUdlfpJOw/ZZ0rDesF0YXD4LXxGvkTvdC7bGIkmW/hvfcZTyRK3f0euk8K7zM
	 hy9gyZeUCK3Qcic4dZxhKB4CxAlYQKHE5RkdQYjib/dhL2BYdAJ7T0PVLjT02pg8l8
	 gTfCxMs0NOOc5t9uBak+hsmvKSXXCEYWmdH3sAyst0Cf2SXABMJW7juBt5SudlbYxv
	 3v1u60REwYzi4nITapGrn3TVEPTrYJHUzcr5UtW0VXH5vR4UZKLzMYkd+bG7tn0ZUC
	 SZhPDmd2FyoPiJr6mQaxQoefsDxnW0CZwpkicA5DMltOqH0yHKzKStVfDZ4+i2A7d+
	 9vfo9ZA3+KVsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E387CC79F85;
	Sun,  6 Sep 2026 13:58:25 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 06 Sep 2026 15:58:21 +0200
Subject: [PATCH 1/2] arm64: dts: imx93-11x11-frdm-common: fix the rtc
 aliases
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-imx93_frdm_rtc-v1-1-3fadbda0bea1@hotmail.com>
References: <20260906-imx93_frdm_rtc-v1-0-3fadbda0bea1@hotmail.com>
In-Reply-To: <20260906-imx93_frdm_rtc-v1-0-3fadbda0bea1@hotmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788703104; l=851;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=BMNbgRGZryoXpTYGm7+rXC+ZV8ZnELNCq8RAs2p09Cg=;
 b=VDqYxWi6vFmns83ATAsUrFlV2oA/mNC2qqZiAY1xgxkD3YU6fdva837VwqbhXk4jFb8f1SOC7
 SZzhYQOxrILDrnIY/X70ZtBMVaHQP4SUd0GSZ3fwMlb8W+6M8L35ERu
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

pcf2131 has been assigned the rtc0 alias, but if the bbnsm_rtc gets
probed first it will take this name.

Properly assign bbnsm_rtc to rtc1 so that this doesn't happen

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
index 5c8fdd77ec15..97d89288db3c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
@@ -13,6 +13,7 @@ aliases {
 		mmc0 = &usdhc1; /* EMMC */
 		mmc1 = &usdhc2; /* uSD */
 		rtc0 = &pcf2131;
+		rtc1 = &bbnsm_rtc;
 		serial0 = &lpuart1;
 		serial4 = &lpuart5;
 	};

-- 
2.55.0


