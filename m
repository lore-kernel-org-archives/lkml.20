Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298720;
	b=bqMGnjcMYHXGkpqSRzF05vGYO8B2gerclILRAjBmHwa+9E5cUhQKYG0NkR59+nDfJhW3
	 K8mFydQuy6A4OakXnWg7GhFMMTXSwtDKXMfJ4G8jnwFQJTu3sVoyfIWzjYRa7R58D0yUQ
	 ghJ41qhDVM95vMSjHV+UBflla4QN6KuFepgC0OEb8pTsDyEPWRITnE9Xkv4hoXTdyRrb8
	 lRcL/x++quRt/v8ohnx8yvU2eEK0D7VDQPpMPkP6raYfTJcabeSzv1wWjS8GeFQtd2A0F
	 +T0hMjpjkct2VLmsPh5vZsI1+HzZw6hkPyi0Z4yhhkF+ESNuN9aE7QDwYxmypAXVoPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AJjN4yOJO47ZPiYrwc/9QIPNcniGJgIrcFp8qD1WpVk=;
	b=VWwoPQrkPitRrbFdEIxIJvO6PkTaMyns9rksbno6M2M4MIIYdLwA4mBVJXifJyyS5fck
	 liWpkTKA4V3lsnBYWQymysknfWcdC1BkJs3YyZsXAvUMvBsAMKUtvjlJeyjJVeachZaFU
	 RjYcjbv6Row3tb2HPFQ4PnQKs+j9+G0YH22QPZCxeR2a4NxMSYhuwG8f1ahs3hCrpEO7w
	 sRVNr0BaqyGMDU7tW02Pybknhr2SGWu1qjLIWazro0gRiL1SULRX4dzjsWZWFL4zXheoE
	 Uj6DbfdkuvXyGibqIbZojxdUZXp+/uUtYvcRXE+QcskzhE1fMmTNmsu3Co8l5AV8fQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRxMP17B;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E164F606A338
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E164F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRxMP17B
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36e2b1db9bfso204191eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298719; x=1794903519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJjN4yOJO47ZPiYrwc/9QIPNcniGJgIrcFp8qD1WpVk=;
        b=jRxMP17BmWpIjo4oI3xzNJiK0Lr+h7IrJdoOpgyyai6FudWgmyYQ3IqBxsnNociTBF
         GLtNs2RJo1N6vYOIbEt4JIMkODhYRzcK9S0ylgos7SU0XQDtCNcQFn+XziDR+BJh3QtF
         85N291oOAWR2nKTd5iegUZLlv3ReDRdhlWUrAaDidTcn7q4H44EezVLGRppBRYGuYCro
         7aMQrDceC5EV8I7LMqMfiT8avDS7bLUMhX8XjndlT1rkwDDKpLBYFEGxvoEPrp0+4Wzi
         RSIXGbSZ369HtbHIBktGTyWT01//7A9KkawJCpi02K9P/+dw9gpbN8Qz2O5KWjx8DZVh
         30Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298719; x=1794903519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJjN4yOJO47ZPiYrwc/9QIPNcniGJgIrcFp8qD1WpVk=;
        b=ALsJSQ3fjKMfC/wgw3U8jJpWn1/LBijdZnTr7/NIqPqnf67DQgtLhwSCk5/m2FfSz8
         HiDFWXtt2lZFIeMRVGrte2PSMdoNBjRXoVIGq2Ylr9SshWNXrJdHhw5iCs51nlBWT0GJ
         gmYuMCT16MWT8oB+hp+NGyEoIE6uQyMAPfCf7jmsPfQuBf0LyPeJ5cMRRk3oJXGHsZuC
         j/lf6uauFp7gGP5jM6j+pLDg/HImoc+sEtNx6wNA1Cul0hAHR5YhYxCHz8l8f4R96Mx9
         hDdn6bHdqE50bpVNKkhjJY26xMnC+1EMFZS6/RDOrJU0eSWsFKftYjV4eH1sx97UJjRq
         ihjw==
X-Forwarded-Encrypted: i=1; AL+hErF0kwKggZ2VC7/urM53/SmtK6q9Mpd+XcH3qwjKW+dREfY5lct/Yq6QUf76iE1O/VBaTJGQsdAhEvCx2C8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CJdYotfW2H7SCXGteupqiYwE+vTv5zWoHIFC4Px4wVvJFAoBm
	LpY+pTCK8vct4m6ITMuB+Zv2rj9Z8yJHDuQ3IG42XD6BwuD4mkQCqcZO
X-Gm-Gg: AYBFou2e7PcDfW3A2nCfWrPZPnpU0f+O7zF9DbJstuhCi9EaswmMRzGmxhQsm1XjWwu
	mVxjcwlg5PFsCOkEd192A43G5eNZtq8HSlIXsYPfrm+SO1EaPe+U1fEbJExrctOMdVAd7ZS5ixP
	dg39aJtUj+97yATsvoS8G5HaNLnzgWfersybSVb4GCTadR22JjMRht9Tvk9Xincc1jSnHlVajCA
	B+WxVc392WNetFjjWgeXT151t7plpmATmsDtmi7JnxSEKgpuIHgHBQ0TsM05Rds2TsExoLmDgO0
	zBNvev38fzHMu7rsivgS5c2oONm3Lnr9CZ8wM4b/NeDozK01vTozQTBB+1XAyTWuPEQGYOor2YF
	mFcVq9Pit0lfv7DEdQ/SzW2JR12dWfEMXCPY/Gnqnsv1R49jmf+chNEI3NI5fTF4FVpTRn9kQ3J
	7b0w6BSeQ/HceCj2cbePxuLKHz0epikonqe7Z3GnrjyIXYjgp59u0kUUIdxtV6FT65MY0+Jzllf
	x9+SdUUNlsezVWDWM7l5o6SVzw970M1wVQESDcmCzbo2JVlmh4304y1VkcDfMQh1ez4mi8GEZpI
	3SSSevTqbhkKrKpE62aXfEDotP9j8NUKsQgRbK7zXXvBBmWMkyM9TInFSPQw
X-Received: by 2002:a05:7301:d193:b0:36a:13fd:b5c with SMTP id 5a478bee46e88-3751eb8d9c1mr3960604eec.2.1794298718342;
        Tue, 10 Nov 2026 00:18:38 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:37 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:08 +0800
Subject: [PATCH v6 5/9] phy: rockchip-samsung-dcphy: Move block-level setup
 to runtime resume
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
Message-Id: <20261110-dcphy-rx-v1-v6-5-d681ba20b36a@gmail.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298692; l=2404;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=mM+rLgEKgftG4Li8VSkT3B5/6VzsZyoCu0+g9BozRtQ=;
 b=MhBIYlgHOfxIY0JdSsH11bY+ntMFX2QUl/Z+iUhq/Sj47py5uFQSNEZQ1a0S+/TDMphNcVUxz
 /PMKTJMSDxOBRnNExGVQFfBDNfshgq7qCsOxLRZAFzlsGMu2EG+KYGb
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The APB reset and the BIAS references have to be treated as block-level
[1]: both the transmitter and the receiver need them, and they only have
to be programmed once. They are programmed from the transmitter's
power-on path today.

A later change registers one struct phy for each of them, and a second
consumer coming up would then reset the block underneath a PHY that is
already running.

Program them from runtime resume instead, where whichever of the two
comes up first brings the block up and a second one no longer resets it.

This puts the BIAS writes ahead of the per-PHY reset assert, where the
TRM's worked example has them after [1]. That is safe: neither M_RESETN
nor S_RESETN covers the BIAS registers, and the values written are those
registers' reset defaults.

[1] RK3588 TRM: sections 22.4.1 (address map), 22.4.2 (reset values),
    22.6.1.2 (reset) and 22.6.4.1 (D-PHY transmitter start-up)

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 7a009d87a665..d6acc3e2d448 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1346,7 +1346,6 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 
 	reset_control_assert(samsung->m_phy_rst);
 
-	samsung_mipi_dcphy_bias_block_enable(samsung);
 	samsung_mipi_dcphy_pll_configure(samsung);
 	samsung_mipi_dphy_clk_lane_timing_init(samsung);
 	samsung_mipi_dphy_data_lane_timing_init(samsung);
@@ -1373,10 +1372,6 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
-	reset_control_assert(samsung->apb_rst);
-	udelay(1);
-	reset_control_deassert(samsung->apb_rst);
-
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
 		return samsung_mipi_dphy_power_on(samsung);
@@ -1667,6 +1662,12 @@ static __maybe_unused int samsung_mipi_dcphy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	reset_control_assert(samsung->apb_rst);
+	udelay(1);
+	reset_control_deassert(samsung->apb_rst);
+
+	samsung_mipi_dcphy_bias_block_enable(samsung);
+
 	return 0;
 }
 

-- 
2.43.0

