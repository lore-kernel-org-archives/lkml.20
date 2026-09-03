Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE7D4EBAF4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455302; cv=none; b=HSVN1G9isBH8AwZgILbmqGxAp/k2bNej7PSqYrHFE8Ggxn3zIsJqYnoN5I9kgpQgHz0yZBbLH4epOGiHL1UJLe7W33xEyqDCGHiVbG/kXpAfXyzTdtIYe720ZEuGL+IAxJVhvJlwOaJt6rx18JdCcHZ3pFxcqYln9rMEEGFx0xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455302; c=relaxed/simple;
	bh=IVoujA+C+M/kei9eyCb8PbxU2gqfAVemANW0Mr7KYQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SqxXWa92U/zunWsjhBqj4bRUvOz5/bb8vhFg6x7YXhnO6iP4ewdzjHFsUPfxHjvFxn+JfNVZ2x779p3o+7ochx+p659R3yfbGX+plYsgFSlBmxiEbkjLryuZxiJWcUcIS8HTan0K0tycPdriVVWhsHDbJx3nMzGYL0dC27S1u2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTFEh7yp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTFEh7yp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so964265e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788455299; x=1789060099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NF+0Eh+B7CRrv91L1LEQIL8RYBdIoY5OhO6aCb2cgjw=;
        b=VTFEh7ypJtqezN1xOZG4LHLbfpdzKofzWHViAaNVB7BIUoBuzr6SB5DjUcKObyuNo+
         t8E2jGUhRz70+iOgyCL4eN8c6sY7AuBMvtZvR7PXFfuhYe34yjl34fkpesGMHti/uQVn
         pe4JoUQ6r21G1e/DCe7NkQXv30IARtBio123uQWlVgTog0j04ANltEm0G3kC0XLbeGnA
         AUSLe5jSBsYUXCHk9H9OTMJO6g8r5UtXRsTIWZjxkTFqonzzwu8hk0QH9AondF7Ny4FW
         GOg7QNKcziWJ+u9Ebx8yxM7vc2tYwynhwweUkO7skwnuj/VB/qGs4Qz6apXUMF5mjq0B
         35ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455299; x=1789060099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NF+0Eh+B7CRrv91L1LEQIL8RYBdIoY5OhO6aCb2cgjw=;
        b=dWLE36u+PYwsk9LxkAT3cA0qPQQW+MVXxEMDDCGP9hXcQbw4+iTvdfS5YbgDG/yuRi
         zilTk9Tn80ANWqMgh6N/myxir/3dsDWlLUzvYBjE+ccCSkDKcjpfcXf2q4i5Xn9RBEW9
         QEq/7SJq2KZW1rzIVnsO/EThGve1F6Z4Dq3Jt7pV6Yyo7F2BaQWrokxTFND+kyVcM28w
         LzlGy0R7+c1/PP7zFjETvEEGXLgS33YXzwM/sizY5wb9pXMRJdSzK+jREI2pmfAvCNPp
         HeGdpUEUsD+tqHdj4DCO8MZqAbkq9VO3OlKRdhAqc1KMMMnml0uj32N62hz5KHZI+aiy
         4QmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfAMBJfe4uwP8wB6yoch+Md6w56+cbughdFoJ6MxetU5LMidrufycTqnvl1sOSHIb4TkR8HC4TE+jB2kk=@vger.kernel.org
X-Gm-Message-State: AFuF++lM3qu4nWh9GXR7WGfeZiFRXMlOq4+2Cj7ryw0aAOT8l3eP02fS
	olSBySLIZL8J17ifffkwI61ajMAFEC0apIRgpCjpFpwkfkpCimENnQ5N
X-Gm-Gg: AYBFou3AS2Ez4ORAXGp+w4VCdPCkEVSFiRLZP2Oc5xl+LAhB6kJiyIf/9v2HS1p0zPq
	QBBi73RgUIY8zuiIGJ8BPvfTAxN6O+APtVwiFinbzTg7KcINuVk5dErPedP0Rxc+bTOQ26MKiHX
	r8HerM7knR17qBKGP4+Q99u350ksGGF6NeHznUQhuLRip76Z5t4X8MoKNOI6O4yZxhMbV7d6P8g
	Aj1v8oapnYordausojlu7+ewVQxKiLWmCE3Exjd/PfnFVc9v+b7q0ZGGugOufQErEH7NWYxAMDk
	FNLLGcqpCoK0uwVREu1yS4fpHmoEFovrcgDSJ11j+v0wyJ089dYxwUCHa0gBB/Llai6iQvXlvT8
	IUDO4DGYPul42CzS5hVzMJgsLOoVBxnIOF4MTNKhhQJPJWZ2NXDUQarxAlW1FarjeiY2v4rR/op
	jKsIvxo6i9hwxx7p66jP0ligzbiJMeZmn4DnTl/N6ThPqFd1pWlA3CHSB1+vGbHcQHU+8W+sz0j
	djhmrL+G5/iNt+MmSV56y9TwyLhm8PUkCBa2M/1qFnP1XpfNgieEx00brOlGgfrxtxScX3aJCeR
	r15rUAtum5k/MlkEH2ecR8SBGCmfoPLPCm1jKw==
X-Received: by 2002:a05:600c:4f87:b0:49c:d293:70c8 with SMTP id 5b1f17b1804b1-49cf4f9dce9mr56543595e9.3.1788455299039;
        Thu, 03 Sep 2026 10:08:19 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm107799565e9.3.2026.09.03.10.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:08:18 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 03 Sep 2026 19:08:01 +0200
Subject: [PATCH 1/2] arm64: dts: freescale: imx95-toradex-smarc: Add ENETC
 port 2 in SGMII mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-add-enetc-port2-v1-1-2a21139d7a7c@toradex.com>
References: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
In-Reply-To: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

The SMARC ETH2 uses the ENETC port 2 as a SGMII Ethernet interface.
Enable the required support.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts | 8 ++++++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi    | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
index 7437e523ff639..ffe537ccd5bd5 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
@@ -64,6 +64,14 @@ &enetc_port1 {
 	status = "okay";
 };
 
+/* SMARC SERDES_0 - ETH2 */
+&enetc_port2 {
+	phy-handle = <&ethphy3>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+	status = "okay";
+};
+
 /* SMARC CAN0 */
 &flexcan1 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index a6c5398a81e3c..27ac9731733ce 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -15,6 +15,7 @@ aliases {
 		can1 = &flexcan2;
 		ethernet0 = &enetc_port0;
 		ethernet1 = &enetc_port1;
+		ethernet2 = &enetc_port2;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
@@ -221,6 +222,12 @@ &enetc_port1 {
 	phy-mode = "rgmii-id";
 };
 
+/* SMARC SERDES_0 */
+&enetc_port2 {
+	clocks = <&clk_serdes_eth_ref>;
+	clock-names = "ref";
+};
+
 /* SMARC CAN0 */
 &flexcan1 {
 	pinctrl-names = "default";

-- 
2.43.0

