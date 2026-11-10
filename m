Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269290;
	b=wfi0ery51IoO3Lp534Qpzesxrnma/E41kgjIRH3yiG6Tp9HP9OqmnSd7Bia40KMNoMoq
	 6FHi8N/vxfqhJm5sACcSxS6lbAyaNFFwQwy7AIhnq9bxZE0M6e2vjGLdONyn6cEH7EbCD
	 8Ze3vBzvJoE1kKeLAtQysy5YIXq+YalLycoC6lIIkkL7JxkkUmXZJFVNfQBQxgVtqmJLM
	 WBHfj/sBXok9jqOIknqUOX1e0CrebGwFhxHZfuqHXreeqib+SV7E3HorX0JDireghz5U1
	 LnM8mIOVEm58h1biqYZuUItZ7YbaB8S2ebnyIVOfLDFSfICEYiBs8f8lUZkV4mCaQzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
	b=nr5jWYQ2SeRC6o3BPTVFq9lMse9qJ/3K2NWm36iZo0fL6+U0VOktFgl7LJtuSY9gLpQc
	 8KWYzNpuRkNAvHFoOQCqxAmKC6rbezd8qO3sXCOGObrckQIicsp2m3TxFxCJlbz6Kfcpu
	 zkBQFWBU2qKeMsznYumeEb3HpE9brD57un3T87YzLqjkAmq5zXY+EJ/VW9DdBcHM3WQ/i
	 yfpq3NPg8tF2cXAO3WOVEHLqLc/IVP/RGMyTZBOSTxGgIaq3Vqjdk+W6h6ujvezOfFpFN
	 Xf5y6KE8kEPQ/jG+dbLX+wa7LKS7uxCZLh396OR+73/pGKR7md3exc9TY3y9wvp/X2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fAT/bcyF";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E83060A261B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E83060A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAT/bcyF
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1246208f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269289; x=1794874089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
        b=fAT/bcyF94tPNIyAtZNuFvVu25DD39UP0tsXgVALMMITkcXdx4F2P0SUEwY0K86s1s
         HeC9TFkDEbWLcwNm+5FsT+WG1ZaoQwSsv/Wc7yPMmfNiIe7fJjN4jTDZFK8xw0inJzZV
         7/7hSxUntpvMfzQTau+SSllyj6MLOPxQtPiAWowsbfArxB+J5WU0b/3ePEvHEO6IJQgE
         YboiXsN3ioo3wvXLBZ7ZaLPdAYoA55ccPVurWQ4cu9hNID1KbYm0E36fUhN5OF/A2+Tu
         FJO76NOBVp7oWMyS+7AJGwP3iy90/Puo9MV4D86jZ4xYnl2YDtLl8glWCcE3RGF3ogYc
         hIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269289; x=1794874089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
        b=HIUOlbG9N3i+wHs1uIWGyLp2rJpmNW8FdQVa+NiVXEI5Vfi+N/jt0qRAX0XFWNdlfx
         6vWY9gAEJQJD8oAIyWkV4OviMe2GUG7VmFunvPVo7SxMffQ/gtolSljEJ81MqIsbQfVu
         k3qyXPHdv1uXnlnAMtuLR1zf8QYikSQTxtpFhe9jx7zNoOMgluelwrwA9QoBy0/P1Knh
         59aAzz0sPDZDiws7glKlNkiLr7AN81mUODMSn1GLpB1R71kO0KsvWb8MgrE5ZnZS0PLq
         a9VdEjDIlJ2K/5yUq/vMiOQx/+4bihvnbii9YOjfwAR9HzlClwW9aUtjWvsj2WDGFUuf
         2O6w==
X-Forwarded-Encrypted: i=1; AL+hErHeGqGZVPqrCPi/JwJCRRpsnVUkg7/M5xXp30i5aTAOZYpwolAj77moFbu2Oe5Xrn96aq7pvosijdwcmyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YjsSqIEPsF2LWPdmoguMDenPqZB3j4AKl4EJ38kZnHwuZXvpn
	8MO4XHXRdOs7WOTBQHib60sZfyKr7/HDIsSYG4Yul5uEtwi6+iNtvVRw
X-Gm-Gg: AYBFou0/2N6+5wrDxcrSM8oeJJi2+hYGYGYdoDJk4KM6om340nwz0XMoeEhjpJ+EY36
	E6VyxtGS3LBiMHISm/xq+/+jw09GFQGoTSmNie/zLpbqaZ0Dlpqit7nlAElhVo3p3j/rVa0R+MK
	BUvM18TftOcObV6hI54q7hc2Wqu2nesuhFch/pXwAIdRvt8wPzwKgIDCPd3HyoK4yD2EX1Ne6I/
	66rHO9jppSiwrwEuviUevDeCdLqkvIMVNmVvXvt8Uz0UMwfyb9OdDCMgJyJ/gIoPS254CvdoWAj
	78hOp5wNxyfg7e4KQ7cpBUNfpqHiHWi1/7ULKBnDiYBjKXOQBUgkF2JgkFzIqg69EXAPhy99Rxl
	ZZeIsoqfpt9Om1Bfbfw9Nw4Ha3dtyK5RJO/5s29PdWCblI/q8ZZzYYtezJMFlB35BR/+c6sMDC1
	9VOq6ZVAqZxTgUDv3aeqVrxAVpQMbGYccT84SU5Pob5/7d1dncPc7HybPqfEYWlBs9rUyYj5f9l
	ekqBpBXv87EX/LtygNk9MBXgfUC0V+YLGCMIue3d3jxVvi5nnTfrZEKXb5mN0a9HYFA5deJeu9Y
	nAmOQO8HiEBCjVboplDCmxUcsxHek1jEOYg/953klQQsiwti3mN6ifDNSCyV9iAFtt5GRc1goUD
	5bLTpMBQbauQATpYP33VmMsxSFgtsvjqFjxPopVZk5ntD6XKpHWk=
X-Received: by 2002:a05:6000:641:b0:490:b23b:802d with SMTP id ffacd0b85a97d-498308b94famr1294764f8f.37.1794269288613;
        Mon, 09 Nov 2026 16:08:08 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm1704703f8f.37.2026.11.09.16.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:08:08 -0800 (PST)
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
Subject: [PATCH v12 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Tue, 10 Nov 2026 01:07:47 +0100
Message-ID: <20261110000753.508-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110000753.508-1-ansuelsmth@gmail.com>
References: <20261110000753.508-1-ansuelsmth@gmail.com>
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

Use devm variant for clk_hw_register and clk_hw_register_fixed_rate
to correctly unregister the clocks on probe fails.

This should never happen under normal condition but it's better to
handle these cleanup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..2baec734df9f 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -651,7 +651,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
+	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
 
 	return &cg->hw;
@@ -708,7 +708,7 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		val = readl(base + reg);
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -770,7 +770,7 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		}
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -1105,7 +1105,7 @@ static void en751221_try_register_clk(struct device *dev, int key,
 	if (WARN_ON_ONCE(key >= EN751221_MAX_CLKS))
 		return;
 
-	hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+	hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 	if (IS_ERR(hw))
 		pr_err("Failed to register clk %s: %pe\n", name, hw);
 	else
-- 
2.55.0

