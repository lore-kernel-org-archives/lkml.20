Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D4D302155;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630387; cv=none; b=CmvtWsM3hR7wfTHosFq2xgt4SdtCVBpKIPcXLzV7eqk+gD1gSSp9C8aAhefojaUN/Wxg38FkkVMlkemtuxsXryq/mTTbJD8xuzXdLlzYNaNBQsLNOIWquoYX+0cUA6ty/mpPA6ZIzxf/Jrc6egAFPZygXg8U2iQ3Lm6ekYgyRZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630387; c=relaxed/simple;
	bh=JrjRFAUJd/zKp8SmrRTAcUjwzpaGVf1ntLXPFqXwwe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ME/9o87+HFHWJqsKPJ6vHf9OUKzdZt6DN1ZglBT/Y9gVOvqrPbj3h9XD1DeIvjzI4o0oO+vs2yiFACB+SriiHAObY36CRX/ozLOxiCTMrU68OshN2I2KTwvhAar4JUWxdKqKrwjrzd1/kaLBpl9P1aSmelMqt+D1KZALq6jT87A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vGgRgECW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vGgRgECW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE6A9C4AF09;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789630386;
	bh=JrjRFAUJd/zKp8SmrRTAcUjwzpaGVf1ntLXPFqXwwe4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vGgRgECWMIguvYAMzrwyxnRf3KTLYOdBWb/akuzm8x4PjAurTKNm+NfIlVHSSSLsa
	 OOVYBvNwJRk1RnGzMwr4xP3rDERJulIX7dIknHiPdFLQdB271oW0jRQ8Xr3ffffCCV
	 G3gfmx8RgfBPjUfc6uaEcAyit//Y7ezV1lvSJJkRbQbCdMkYDXETEQAjLchLCrEUSa
	 agUr1swO0GsPWiuWa+2fT4uxWsdlfXkvrfknRHoKWUKXxuLY9O+Zs61OIzs6Pt+gT3
	 HiWwAtcXAgZqUKcM39DfJ7fcSxvx+KshMZ3T/xsotYLGEEk2uZrshg1ClpO4G2iPm3
	 Fikj4fJYCPUIw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FB6C982D3;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 17 Sep 2026 10:32:08 +0300
Subject: [PATCH 3/3] usb: mtu3: add mt6595 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-6595-mtu3-v1-3-a2ba7c230d68@protonmail.com>
References: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com>
In-Reply-To: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789630384; l=1062;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=sZViwWtqWfFRXSefwZIoIPpxQbOgrFtCVXkoQ8L9Uwg=;
 b=D5uVFPYcautf7sRmVtTQmFT4QBspLwRkRzybP2kgv6vzIGe75Tfjl0r8/u2BdrHCyoP8mDVxj
 V8/PXosevVhCNc3Kn5GOvQmHDjr3VQUmnA26HWY8NdjPNTfaB/Z0n2/
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a platform data for the MediaTek mt6595 SoC MTU3 IP block with a
quirk for single FIFO slot.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/usb/mtu3/mtu3_plat.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index bc65acdfb0de..c29778b3f009 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -611,11 +611,16 @@ static const struct dev_pm_ops mtu3_pm_ops = {
 
 #define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &mtu3_pm_ops : NULL)
 
+static const struct mtu3_platform_data mt6595_platform_data = {
+	.single_slot = true,
+};
+
 static const struct mtu3_platform_data mt8173_platform_data = {
 	.single_slot = false,
 };
 
 static const struct of_device_id mtu3_of_match[] = {
+	{ .compatible = "mediatek,mt6595-mtu3", .data = &mt6595_platform_data },
 	{ .compatible = "mediatek,mt8173-mtu3", .data = &mt8173_platform_data },
 	{ .compatible = "mediatek,mtu3", .data = &mt8173_platform_data },
 	{},

-- 
2.55.0


