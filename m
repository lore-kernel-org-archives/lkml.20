Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751BE4CE695
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499022; cv=none; b=qU3z5SNyYNBbMM1nDWjjXWr64wi3ryqAS9HmQHSqs6MdIOtAb0R+KTnvI+DL1E+970OpRdOLkfkC3ESDnX+Az7UzSTfAyMJoX5F9/XKrT0DIafwhuUosSWMTfqtCPaOwzxBwjkOI+0jsd/01iKaLfXWIPAuzkQyU5kbE1i2HW+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499022; c=relaxed/simple;
	bh=8Fq4P+2Ju4lSwhzSxj9aVcUt1KO3M3r6gAx7Y5yu310=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FBvvNg2pIUnawuig39jsELyMSys7qKlMFXpLRfBJ0xQ1InH2d6Dfkr2G25MdzGnl40tnbFHHDHsi2vWfWATIt8XiIcZ+1RIGKTToOHWZpmkGTT3EfzGh2cmQpCG8yYwZAd37K8L/f5mwEayNjyaKitM+Q4D7b7EeHSkMlKiK4Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBvOeSf0; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBvOeSf0"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a30eac5so111901b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789499019; x=1790103819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XXNu+ljv2q2jdXLpwbKTjv8fXsZBsxA93MzoFmASwE=;
        b=SBvOeSf0Ndr9XqbOGryF32rtdhESYe+aVpeuBD5T33vfFF/ZJ/QG2VpbuTVJ8zV5EW
         WMSwv4Tnl54bDbNsTbyC83MmqEIz59st4gQy4ktb/PjLpiFjDNV0QMITCoPEr++hVO7D
         mJX7k7dugP3DkcQZxG8DSzGMiboU0MSZs4/tXHU3UwqqUaDqbHgM6+a+L1anRNB1kXs2
         Dg1ISLPdmxKmTm90zTNGxY9OoC3y/1aQ1N9PdNhYMSCQyQetcatJbVJa5HSVg4blksZF
         5VFkBmki6WbhJddLWNG3ZtOLLFHZ0vVQbKGx90z7zlT7VmFPK8ibutd0/7/errVyj8oY
         Z9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499019; x=1790103819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XXNu+ljv2q2jdXLpwbKTjv8fXsZBsxA93MzoFmASwE=;
        b=ai8Kdm4cqbJwSKt7FhtJxfwvbeKMOyEnrwGTs5MpvmmrKdLmygD2YyGiD0d2Y4mZ7y
         rGtudGVvJVaAkL+gzNePDxGYCb3JdytU/c8BYsAK8tP6e6TureZm7pIYXp3/htILBilH
         GVmgDjrSqomuo5Di5S0+0Nst9bqyh1b/4LNinwy1DnViT22juIgJdYwiK2jVzRxCj2q4
         rdt0k8b8rdSSPFqsRCchY7X/xe9M46T4/lKUoddYKSHYt4u990d5UMdKkwfy4/cWFerX
         60Pu1DpkhC5ubd+XLyqA/q0OtHYPzo2uS+b+7Fmv/7+hXAG0+17vxeGFjTq2bHVPLp29
         fptQ==
X-Forwarded-Encrypted: i=1; AKwUvBytEgCWzqcAJ2qpB+mX+3CtovtErfmuJn44ZHJJc6SVO8wyM4U6MGjDWCooBUjZJ/BjEsd6et8ChGQ3T2k=@vger.kernel.org
X-Gm-Message-State: AFuF++k9Ed9uCrboX3D0tjxhhebRsWhIiHpkXZcATRErQBGZzHgVGWvV
	Y29fq/cdcRAmIGnPUOCb/zHMqZck0NM52k6KkdEXasSaLh9IANbnxIHb
X-Gm-Gg: AYBFou04qVXs4LOpx+LZBD3NrPjCNL4eqZ4ETQce26I6D8tOFH6NSfpp+s4XeFGB93B
	VWemVK8MblU0jd0mcHKltOWysbu/StrAaM0/gyGPIDe9Tz011oMeNy3sIRi237QgmUDomFqoZRG
	7u4LCgYXOof9S/zLEhu1YVI7FoxUDzQdWu0xGFntVpmYZITaatp+jHrW4Gsqim8KdBSXVfAFTg+
	I09WXmVILrusClYsZyRFOo+2aRCK8SSdRIOVpD58g1GbauB4sxlmlrYZMwKlynkAiiPnyXT0Pyx
	vwdI6pvPbmsKwy9njcBFNfzjbIPiKQJdaVCGHzgE61KILvGNVfMtZWe6XV8EzIZx0mpzR5g6kO0
	4ginb2AutUJ6O7ycuO9mIUIwfTps1QgTXwXlbIY6EcNjpxsOPZAN55r07E2i09aEYLGe9n+9ead
	PuQ/pd3tL2TCKjXS2G5QtXaYsCR6wF3Hm6G0GeN9OYW2rWaVVuq1F4pJI83jn89MHfTfOHMXrJ7
	a7/MaSxjBbqKa24aToR4nuEk1CGMRMbohcM527O2PxJUN7AtfbvwToy34SmT0k1vrmoVDZBHi6B
	Q70nLw0jqnVV9WhoqGjumCT+7egFxAKshPTKKH71nsvmGZni25lTcucTvVAarsvHtSCjpqERaML
	/x8mmMmGgNXEfnU0UnJaG7A==
X-Received: by 2002:a05:6820:169e:b0:6aa:cce3:ab61 with SMTP id 006d021491bc7-6c53f555385mr8191833eaf.9.1789499018615;
        Tue, 15 Sep 2026 12:03:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842546a51bsm836569fac.0.2026.09.15.12.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 13:03:19 -0600
Subject: [PATCH net-next 2/2] net: stmmac: sun8i: add support for Allwinner
 H616 EMAC1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-submit-h616-emac1-v1-v1-2-195de0bb1f8a@gmail.com>
References: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
In-Reply-To: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Its EPHY is provided by a
companion AC200 or AC300 package rather than an internal PHY block.

Add an EMAC1 variant using the dedicated register and mark the PHY as
external. The register retains the standard five-bit RX and three-bit TX
clock delay chains, so expose their supported ranges to the shared
syscon setup.

Co-developed-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..fdc0c3384af8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -81,6 +81,13 @@ static const struct reg_field sun8i_syscon_reg_field = {
 	.msb = 31,
 };
 
+/* EMAC1 clock register @ 0x34 in the "system control" address range */
+static const struct reg_field sun8i_syscon_reg_field_emac1 = {
+	.reg = 0x34,
+	.lsb = 0,
+	.msb = 31,
+};
+
 /* EMAC clock register @ 0x164 in the CCU address range */
 static const struct reg_field sun8i_ccu_reg_field = {
 	.reg = 0x164,
@@ -143,6 +150,18 @@ static const struct emac_variant emac_variant_h6 = {
 	.tx_delay_max = 7,
 };
 
+static const struct emac_variant emac_variant_h616_emac1 = {
+	.syscon_field = &sun8i_syscon_reg_field_emac1,
+	/*
+	 * The "internal PHY" is in a companion AC200 or AC300 package,
+	 * rather than on the H616 die.
+	 */
+	.soc_has_internal_phy = false,
+	.support_rmii = true,
+	.rx_delay_max = 31,
+	.tx_delay_max = 7,
+};
+
 #define EMAC_BASIC_CTL0 0x00
 #define EMAC_BASIC_CTL1 0x04
 #define EMAC_INT_STA    0x08
@@ -1278,6 +1297,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
 		.data = &emac_variant_a64 },
 	{ .compatible = "allwinner,sun50i-h6-emac",
 		.data = &emac_variant_h6 },
+	{ .compatible = "allwinner,sun50i-h616-emac1",
+		.data = &emac_variant_h616_emac1 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_dwmac_match);

-- 
2.53.0

