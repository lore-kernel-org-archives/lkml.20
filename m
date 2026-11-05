Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880691;
	b=D4DTwx84nd0eyED/nN2na1bYSxYuKE/5KNGIWeZIfSIiqHu86JqfAp3IL7m0pTfY9usZ
	 3EEi1UbQEEsswkOcmAFufbEIM0EmN0ZVwlfwGLFajhGAq418wCDgaZk3Ze3mnUXj4GuJf
	 gWNbDpOzMahV4mKxJAY3kcJPUwLRfpsx3YvRhqEJDtaIVeoh2ymkcgSRgYN2INqdiYtIU
	 NLJ+n83R3dZG1JUVKyUA23OpEgFCRGls0uS+f0IjUllObI/IjafuBNwYDH3NOQyDJzG7K
	 9kD1vI2NY81U+LfVI4kNkR3QVEgfRalHE9OqeElMB8GGtpkc2h0N/k770OERkYD78iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b+CmWncL7kwlaiOlUzGSlbN8SKe/VBMyBDE+45su+XU=;
	b=ucrFpKFxu7P4juPNeXke/fgnmGaXHGtcP9I/TB4iY2dmgXiMTeCyhtRNa+UUVGWhp+ts
	 opyotHWL6tdZ6tM9LIH59GrQEJUVrY6Mac9GQBkOBIZ9xzGMYCD3vDMk8MC2mQ/7PWDh1
	 l489TAFBGizCPxxgf3zdJGCXGvX6KAJ1M5ndls+CJJuxFSCxXYjjp0++PdMo4PU5egCIP
	 Y5udXsMmsRoNMXOo/6iZ3DYesVFdwNX41/B+lE6StmRau3OJcwqaPT35iiX7JhjzZ/jVm
	 pNeBdvpc/Xfmi5f4XQDYWdKsxr11VeQfZT2dUjWaBQUULkDd2TSKCJEdVskbwKxrrqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TR8OsAv/";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F702606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F702606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR8OsAv/
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so16854045e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793880690; x=1794485490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+CmWncL7kwlaiOlUzGSlbN8SKe/VBMyBDE+45su+XU=;
        b=TR8OsAv/YsPNWNpVrMCE5cD32Tibu91NPJjk+QzARhYEOFihEoqI/xYFDIKRS6ifZx
         0jMqwnOZRKUKkP44KANXGDxObBYqSff8Hn40lFWcx1SARV26sZSpsSGfJzWXWBYysW0S
         Rxdmikr5RKS1eaJLDF2AuI8LTgGpAnvta0FQLjQEnBWwPhTeCX56TFnsWYoqat45JtxK
         IVlW9RywwZys9dtkRQ90IK3nRnZ1XKO2+7m9WGHMM+BstqFlGDdE/LjP/VkWTLoZXEHK
         ABWQKuPwqPiAuQiv3J0YCBKF7X3m6CX+tDnX0Dbsn/jSRHH49b12nVWdXPgJKX11m2a8
         h/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880690; x=1794485490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+CmWncL7kwlaiOlUzGSlbN8SKe/VBMyBDE+45su+XU=;
        b=tKeQc4O+ajTagPUJkjWVXOY6F/CVFgdlTqzwQrH6bSku25h1sW2j5MkeqI/GUPVMIF
         tL/sempqFExeECMNrnqnBSHhpN1HILkKYYqKj7zOD65o2mAmzivdZTu2Wnj1tcrVXwyx
         CY5dTkhWqPjVTUJOc95dYolgzvErx/k5c8rzsf/pMoYs7Cff3hFmeRUK7tbvaV4Fs5od
         NwYhRO1it8RzqFvvmeqxY5cbjgo5YCBsQFoyG42k/7ncXR05zJyhtSiR+uES0eF76qMv
         eHhpzeywbeM9dMeul4rfb8jVDyUv+hlgdlV3nZATmujfAp0FFZs1yPF5igS5dnl0B0f2
         mQ9g==
X-Forwarded-Encrypted: i=1; AKwUvBwS8vmCTczmUXeK33ASAhkOF+/xjNyDFWmIm1Kfrr+gNAs0++990/15wWbbfHhk3yCN7HkJk0gu1yryCZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ILaqgymFOAo3tx+Nx8/umo8hOcgilQFpWXUxJ3IvEIQYHUiT7
	o6+N3Mv0MARP2Xm8Ux3x0T9h4MsGLjnWV2/2/T81gGmtMPaj7hDzPBNR
X-Gm-Gg: AYBFou1Mz+tgn172dzVHqoQmfgYBaBwzWr/xES49iwzeXRyT7y9TUEgD2M/nqSB+oFV
	mMfu0K3xssZxty2lwF83MqqY4lmN15QM6jvBTAGro2K1nbAvzWG8DD0ff61TwDGGjTMdW+N95Qp
	ppqJ+cz3W1wQolEsnqJHslpKgK3sY6kEPqY/ClYPWsev261+dLHAQ4X4zkDNNp0U+g091o++n/J
	6WEe0nHD3kM0AeQ8HiAlaqDNGgFXXIbyPlTAniTSnDEzTQQVE0+ZYwetjBFkgpU3vgf3XcAfb1J
	/RV77GFtnis3w47GB2a5EE33htv4UKy/zjAcanmDuh74KHX1cbZn2tPZO5NzlNTKbQcW85auTj6
	2xMCS2PYWg9B0LpZgTigipCIv892Cs9Uy0CanwGhhhOg2Apf75Pth5JJ2b2qDvdsh/vfj9tq6nv
	Tm8+fO41wQxvd8UdIkctRlY5Lv4rlgwj0ypE/t+5/8WcwNFwkUxwMBwPhA0X/TMhHxwcRuUWtbn
	UPm7Rpeb0uVekyh1vi+ExMHo2NlZ8DU8aS61fkz3j+wmijzPDxTRie4jOPtepKb7mzYy9phxUzw
	Y9w4d9xrU/qTeS3j+k5IbgQRcGVr+YD+cjEuqLADOvy3ABgv4iwmduj6/rd545gwVCiQPVcqjOU
	T19xy2GqNPd3r213H0VwbJTzu
X-Received: by 2002:a05:600c:1f93:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4ac180f2fd3mr439395475e9.30.1793880689556;
        Thu, 05 Nov 2026 04:11:29 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm58869885e9.7.2026.11.05.04.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:11:29 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v10 4/5] clk: en7523: generalize register clocks function
Date: Thu,  5 Nov 2026 13:10:57 +0100
Message-ID: <20261105121059.11201-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105121059.11201-1-ansuelsmth@gmail.com>
References: <20261105121059.11201-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index c05d0bfa2340..979dd9c20a4f 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -151,6 +151,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -801,12 +802,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   struct regmap *map, void __iomem *base)
 {
+	const struct en_clk_soc_data *soc_data;
 	struct clk_hw *hw;
 	u32 rate;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7581_base_clks[i];
+	soc_data = device_get_match_data(dev);
+
+	for (i = 0; i < soc_data->num_clocks - 1; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		int err;
 
@@ -1290,6 +1294,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

