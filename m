Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C14BEE5E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789172612; cv=none; b=ICN1Nw0zkKuKWmPsfDp+kiJaFzS+COPfehv6pSgAYp4GKW8Lfr5k1Uptbd8UjpJERYd8WmmMX97i+L2ESQoEDGQi0LlFc53s05tFOHiBgoeLsk11Xk90+r71qZkcHnbejw2ruQQ3pr6Y+k+icZrawOA/KPNIawRKzlzmOFRPnMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789172612; c=relaxed/simple;
	bh=0nPcm+58pJfEAXygSakPQx72e6W/l6Dp/b8T+CvBjD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aL8B1Y+mKnKo1ah8ijzolmmKjWQbkBB9t3mtIL7ibP5SkmUMkQlNJl35sym++QZPkLY/kwbGwkgVjyenH/tgr8/d37WS9hLVPyIXZAp3ibHKt01ik9eg2puBpGo3uFwBe6Kt4yxGTKTasc6KjzIeLzk4j+zzCPo+ap+RmArUtyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQ0KvVJo; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQ0KvVJo"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2192511a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789172611; x=1789777411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eigGeAMP83LxrsKBiSA2Uv71rHDhlLqddwKc16SH2gs=;
        b=WQ0KvVJooAObOPgWZunfr4YKCQ7VUR3DdhiM1jrbU49c9y+W2x+VKHbj0880qjB8xO
         TH90u2cwGdR9jO2sDgrX35/l5+tl4AM8D9VZRgNfPpBH8Rne1QUZPrK6tX+ysBY+LPR0
         RrUOCUNfgotX0hcWg/vMqRi/iNz0MnzRd+tZdo/vC4LQ4pIaEtF2V6GEFzxQsy8v0kBu
         JPUbHF+dgds0fxBTEEJQ3JtRl5t9Flk4uVYtn7W731tKmDdXo7hX6IZL2tSj14IA6Oc+
         0NOiyixns9q4hn+/k0eSiqSaYV6aHPXazkPbo91nqWMx/Y2EG2bt+JyD9qYZROZe5wia
         mUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789172611; x=1789777411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eigGeAMP83LxrsKBiSA2Uv71rHDhlLqddwKc16SH2gs=;
        b=Ew2sCdfYShgs5C3xpgGW5WMJD5XQGjDWtiedFmJw8OQkqTfZkE/8RyVZz3FnQI/TS2
         NUME4uAXsLwdNHZO/0asorL+6qXYkFhb7rqZwS0jm90ieY3s1WaXqto902VYt1fKH1HL
         5oQ5FZCqVC72fE2AxcNisGOVzH99GdljkWuAi8j7wwnAtywfrBBXkuUSpkyF2E8QZzxN
         52AvJ165ONQ4dbko02fO+IdGZOZB+umZ+6DqJw2n+60n6WjSxcxupmF34gaD0ev6XKj7
         k3WBcDNhTLYLhZNL61lzJUFXeCEbQNqAlVpg8vEJB4VDxlaYJKV42skp+6uNjgNopk6s
         J/zw==
X-Forwarded-Encrypted: i=1; AKwUvBzftB1XGHlDlgcKzxCLTeN6DgbecWLsYHF6TEfAlio0243/bEx9k3mlYO6s7aDga8DkWx0M+DhZD07mfjU=@vger.kernel.org
X-Gm-Message-State: AFuF++nMKQ05wG7/XiWWDEpnxMviNbafLqz5PbmyPpeQAtU5DV5WE2VL
	DZu/jEv802NaGFTAcQtIa+lepzErDHCJwS85trJuY4xiBBjSx+lnN0u1
X-Gm-Gg: AYBFou2lJIxHr2N+3G/R4p50i4PfPCLGHUHZoKRto6pTf/KCnR9uC9pvPFlZvo+qUb0
	lnwVC12I7tPF6bJPzTVahxJPyQEekKPJai08sH+U3PzOb7MS0rBwivzLwyO8sVQ3qeplPyGNrG2
	aOnyo5QbB316RZ4PxDo/0POdP1YtZiNE7kD+6lcDxQi2jbXMGzHWwl7Fa7C1Y6MJrlk70qgXYdB
	7cpYc+lJ7CEoQtnSTI64o8T80SWscWhkhlGfe7fDRcWhjBKkSZVsoB8VWxEDBLSkoi6xTdROE6h
	syGwU8fJeX3ByDPgFKNpgtIkv9n/LuH9cyyxWs3ntLblI8hMebO2GftiSdJN/XbsuaRWh5Gdo1Q
	IgC2CxDJ38KlMRxtM5YyNHUiNOr97AZBTPo+BegxjybLak9t25szTS87ovHK2JAHM3gwKmdQ1nQ
	DX4m5e6LChC87IKbIqhRc1Yg48SqNyvq8WozBPezhCsYXlKF58atPcSJ5gw9Wqx0lHK3ZZPb9l3
	Nuw2/Svtc4cd8uuV05/trwpluPRXT2ZKchK965ocVtqV6CqsR/oLjcfhnFswB0F6wzpCejrPZ7G
	B/Gni4w6IxOqzG+h2+B2OF7KL5CzL3PDCEMMVvtNDJ06+rn1
X-Received: by 2002:a17:90b:270c:b0:39b:a8d8:985 with SMTP id 98e67ed59e1d1-39d9c0ad3edmr11221696a91.12.1789172610740;
        Fri, 11 Sep 2026 17:23:30 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cff6780sm17510475ad.76.2026.09.11.17.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:23:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/NUVOTON MA35 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND] clk: nuvoton: ma35d1-divider: simplify allocation
Date: Fri, 11 Sep 2026 17:23:26 -0700
Message-ID: <20260912002326.237419-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member instead of kcalloc + pointer that is not
actually const.

Simplifies allocation slightly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index e992e7c30341..6eaca5b35dd8 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -17,9 +17,9 @@ struct ma35d1_adc_clk_div {
 	u8 shift;
 	u8 width;
 	u32 mask;
-	const struct clk_div_table *table;
 	/* protects concurrent access to clock divider registers */
 	spinlock_t *lock;
+	struct clk_div_table table[];
 };
 
 static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_hw)
@@ -83,30 +83,25 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 {
 	struct ma35d1_adc_clk_div *div;
 	struct clk_init_data init;
-	struct clk_div_table *table;
 	struct clk_parent_data pdata = { .index = 0 };
 	u32 max_div, min_div;
 	struct clk_hw *hw;
 	int ret;
 	int i;
 
-	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
-	if (!div)
-		return ERR_PTR(-ENOMEM);
-
 	max_div = clk_div_mask(width) + 1;
 	min_div = 1;
 
-	table = devm_kcalloc(dev, max_div + 1, sizeof(*table), GFP_KERNEL);
-	if (!table)
+	div = devm_kzalloc(dev, struct_size(div, table, max_div + 1), GFP_KERNEL);
+	if (!div)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < max_div; i++) {
-		table[i].val = min_div + i;
-		table[i].div = 2 * table[i].val;
+		div->table[i].val = min_div + i;
+		div->table[i].div = 2 * div->table[i].val;
 	}
-	table[max_div].val = 0;
-	table[max_div].div = 0;
+	div->table[max_div].val = 0;
+	div->table[max_div].div = 0;
 
 	memset(&init, 0, sizeof(init));
 	init.name = name;
@@ -122,7 +117,6 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 	div->mask = mask_bit ? BIT(mask_bit) : 0;
 	div->lock = lock;
 	div->hw.init = &init;
-	div->table = table;
 
 	hw = &div->hw;
 	ret = devm_clk_hw_register(dev, hw);
-- 
2.55.0

