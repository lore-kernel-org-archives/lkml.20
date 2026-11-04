Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776932;
	b=xWUwOyKz8F3ctduJjyuXis7vX8IYx+D0f6NW7XurCiEyj5SrD2woPxWjpNEO5R0sYzB3
	 FpIjeN+MPKS+jvQn/l/sbaet5RAOEvd+IqFNfSfhW/cNPzPlFc8fCgNQFmo63tZ7WYB0m
	 OJvGK3z21XEiIWbCVMJaH26WNASFt/t4q1MjlNLS0A3IMIs5w2idJKmEaAosONo4Dxvdz
	 Jgouw/cn+kvJkstxyWTUJeRcYTHT+jFgJQMaKvxiZGMQ+D/MbcBrWPjsHrJGWIu7uLnNI
	 J6PNACxqHbf6bxgPgjJNjb3ysTKNpZv25i7bVJRWO7L/bI0OKJl73PLPzicKNyvTsfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776932;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=KWd1bLESMPqSe69meA+Zxhw7IRaeDbUT5Ak0xIwBjFs=;
	b=kTEtxUAghio4Dw9Yb+tC2VlKsUm5vO1qeby2c4CLExEinQx2GORhZ3sujoF+Qx2xJDl8
	 UaNvjvwlqW4wZJxZBT48tFOOKZVQCMGMg611++ascSXfN7ort6ObyhbQzZqqtTzKq4SxR
	 KIrrgdrL+3W3zVrjOB2gf80vINQna+MlrcrlqYqjS2mch62GenEOPaTsstYRc8MnVaDH4
	 aVusE4/YqbNO+Lpv/IjsrcJKCDR853+2ypwxPOmmhqm6671d3IzmJPEYXoXmvSB2Ot0Yy
	 AxZEPSjYKcaeZMI2IBIagBKk3ZQj7SnZDn/MvN+fl/fh5QAYZgf400PaG+wOH1J7yLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=euIh2TGf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B194606A326;
	Wed,  4 Nov 2026 07:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=euIh2TGf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776932;
	b=jBjd9cDB71jM5baZyUIEQqSTDEqjN7dk0fJM7xwyYPn6XwQdK9UnozEnV07ILwsN3/Yf
	 1JSKzcZys/ZNEx4ohca68x8y5AkSC7MAHh99olZ77p1a/AkHmkzB/T466ecvLNgzxOAgc
	 WIzYilXNDBKRpeFESknI1Bcd7vQiPWw4oc4a2GLxRR/fy/3dRy6AKhvKrvYOl0Jf4YN6P
	 jHXW5U66gG7m65VJ/lLu+Nq3nkTdbAa36VFonDemHPKSSK3wgMigru++Cxu1bGUcrTvmF
	 RgOqr1N6IPOFPZ+7sB9PJKhLoQCqFrdlAfY8PcfCX4bQAtu37TV6UCf+EZjmhhyGaNw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776932;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=KWd1bLESMPqSe69meA+Zxhw7IRaeDbUT5Ak0xIwBjFs=;
	b=ZJ59NkqSIF03cj3QhwvECF+G4vYOnCWlwl4iML0OjgabP5Ayijwqm3TDuY0ToMqLR9Mb
	 8F6jzj1CAzwUdQtNp5dUgKotV0ydPtjaat7/VDWW6emxuSWB+5d2UX6mzTBg+fS1tGPTL
	 J+OoG0c1qyGM/ah0hCNb55bnbf+zyC51WAz/arAc/YyRuHa3lzZBWpkkHCAoxg1wHcEZV
	 EEzW4MPsnymvavQR5D2eBDWVY9vJjtAqPxxEqSl1w0YkUB8WuDR8QTmXQMj5ENWLuE3Q7
	 jNNia5MvSHqI5TXXTKgz2VA609BnBoAgQOiGexUkTRK1azswlJhlQWKqlfofz/w73rA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27E9C1F00A16;
	Wed,  4 Nov 2026 07:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776932;
	bh=KWd1bLESMPqSe69meA+Zxhw7IRaeDbUT5Ak0xIwBjFs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=euIh2TGfPaonXtHbbf8/A2jjQlkseU3ZNDU2Gypx07G9O86d/eaSytf5Z4R/EeFL+
	 ae4mJbkQ8/F1w7SkdeuhP0Pw82BeVX78+DF3L3YXs5MKOEHUoEirKxyzuqLG81iJCx
	 4KEiKO8jma7L1uf8Gj6X3xOHqiwAEI0lx09kuGRESedLjGbm9IlccCQ6wnK/ezOMYA
	 yYssPZ9LTD233w2tVulPpw87Z524N5c7GxG+WMqwkMBqfHXL3tOetsMyEeQRp+2GXP
	 QCdctU7uaKTvFRUT/YhoZ3nnqkzaDfkO/C38bQfcVNsrrjzqSLdqd9njzmrfLrC7kw
	 39idBrBqWZtdw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B1F6546D1D;
	Wed,  4 Nov 2026 07:22:10 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 04 Nov 2026 02:22:07 -0500
Subject: [PATCH 2/3] usb: dwc2: Add Siflower SF19A2890 support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-sf19a2890-dwc2-v1-2-d959375e26ab@telaak.dev>
References: <20261104-sf19a2890-dwc2-v1-0-d959375e26ab@telaak.dev>
In-Reply-To: <20261104-sf19a2890-dwc2-v1-0-d959375e26ab@telaak.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776930; l=1563;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=MDtPwfl6Th0PkvI7Z1Y+LGIu11doKKB4kqplBwGeUCs=;
 b=G0d+lB1otAcPXOo/UZILLhyUDs9letOhYgjaKwkkj2uzOcx4N0lWYNGRuj3Zc43f5InYGC7ER
 4fCn6vVABKZDcXXHk/AWI2FDK2JWppkQseYG4V+54oCo7Dkuemi85ws
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

From: Chuanhong Guo <gch981213@gmail.com>

The Siflower SF19A2890 has a DWC OTG 3.30a controller. Limit its
transfers to 65535 bytes and its AHB bursts to INCR4, the settings the
OpenWrt port has run it with.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[jt: from OpenWrt's siflower target, rebased on v7.4-rc1, commit message,
 subject]
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/usb/dwc2/params.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 091bfcfef..f6379e616 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -237,6 +237,14 @@ static void dwc2_set_cv1800_params(struct dwc2_hsotg *hsotg)
 	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
 }
 
+static void dwc2_set_sf19a2890_params(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+
+	p->max_transfer_size = 65535;
+	p->ahbcfg = GAHBCFG_HBSTLEN_INCR4 << GAHBCFG_HBSTLEN_SHIFT;
+}
+
 static void dwc2_set_stm32f4x9_fsotg_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
@@ -336,6 +344,8 @@ const struct of_device_id dwc2_of_match_table[] = {
 	{ .compatible = "apm,apm82181-dwc-otg", .data = dwc2_set_amcc_params },
 	{ .compatible = "sophgo,cv1800b-usb",
 	  .data = dwc2_set_cv1800_params },
+	{ .compatible = "siflower,sf19a2890-usb",
+	  .data = dwc2_set_sf19a2890_params },
 	{ .compatible = "st,stm32f4x9-fsotg",
 	  .data = dwc2_set_stm32f4x9_fsotg_params },
 	{ .compatible = "st,stm32f4x9-hsotg" },

-- 
Git-155)


