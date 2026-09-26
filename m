Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B3B34DB41
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790413541; cv=none; b=qz8Dqgr953OUVd4LH1+bN8A4NWugK+Uyr1ca7izWNjP193dmh8WA/gyxmIC3mcailrVqrapk9VstrgGOUNkfV+CSoh0Prt6R/1pDWyAO85dyDrXRhUnDmPXBcnyVa2jwQNfyrwjoEG/bubml7eKwOV1wAeSjAtAbWp07RGmYW18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790413541; c=relaxed/simple;
	bh=bOq/KC7QV2tvJFM35jOsgBb72IHn6gw8K6n9ZJ4bhiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mgCL0HASnRcqfQA/IqbdG7pqrpz8c1VM6YYHXlINym4EZBwKwqnyB1uMy1/LGEEYb8L57ptIIS3QRixeONtf8EW1CB7vHnNsB8HFl5KNGef3dTZEpAWcUfAUVqQ6sR5qV/PbV8r3q2OV2TWGyvGsA0OzfzrYrNas6eOEsQQPcMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=vH8TQGJA; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="vH8TQGJA"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2df8de41d6eso10311915ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790413540; x=1791018340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=poyGQFhxfjPpwyIrTQh0fZ+JdUzuLojhwNaxF0pNYJE=;
        b=vH8TQGJA4r18z1+dgFbflGl6PgYEhctJF4fTqUcj85dMgiDVK4ykl6G3sMw/f1R/PW
         KnbdSVjz913qe0XCToQezSrPweIeYgCKkgXr7NjzzWgy1dIOEcmW8O+d+cJxnWe5VJyd
         y2fBtfjPpqWy/0Rq3GtgUUrV4OyYH6Fo+Qa3dGdObru3tbBOANjs218ieOdgZHYfU4SJ
         GWMyOukhdK00T9gSVa4iOTUVYrCtwCBjtcAnaImZC+u2khpnRn5MbD/lUJNpd4TFDrPt
         vGOKJiIKM4rM1Cl1cG5/Z3sZhLkCoERRDMq+4rRbd2sn9+tq7XWDad6cgcHZmeb7/ur3
         EwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790413540; x=1791018340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poyGQFhxfjPpwyIrTQh0fZ+JdUzuLojhwNaxF0pNYJE=;
        b=ZAQVxFlTVzNmlUUCCz4kAEBaU4oVWymBcUeonA6h+a90vLQ6/wiwHIbVHI+DN9mYJ1
         HnW1CJAlgqu6nKFeOZMkXKpndQhXD6J7OEm7kw+JYb3kWtF8EMTrlk4JcfeuSwpGSQoh
         V2paPe2ilLOggmPW8h6RvdqZTDcLbS2ak6q0LGzjz5YvdunDXKfHgvtunrPCziF08BUw
         gRcgLCDa4d81+PEy10x+EMzKeguEmXsiWl0vd5xV4bZUlhzByc40xrnXpJhevzMuHG9T
         DTW6PINxSM7YLzH8aJV2CbMG8m1nUnU/sqcpO+M+l5e8Gz/3bowKFbh9wVuQly0P1bEv
         W+rQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRhBbFmywU1SN/jtSq+48624LsFXMDpP1kFbmAZCv/uFBeJvXbjDk87970//CRbIb+kjDUzfKTX+fRUoM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1J+bXkNFF1soKJTNLRLJRff0D24tzthWJpge3B9f9TxClFQ1A
	jU+2ApRJz8wpnEj5LlBAGvWrBmUMzp01zBIhjOPAhw7BGK44l61sE28LaQsthSoxodHD
X-Gm-Gg: AYBFou1TEO/QiMjeaekSZRluUQxg4B2h3DKXrUBsxpRYFon3pCv5EuZ+NgulMvwnJbI
	MBtO6wn8myyxNipAs+e0AMALvrdxkCL9TgBFucEhrWrKcLz+wB4Ugqy4b4DaM+0DH/ZKmKxhQ/t
	54lFDX1jy54yKQ5rHqGgWQKYDuL5M/TNIrp/g2FQkm4yMFXDQv2EJUSGVvE2rTNRRO4xZlnW8O+
	k8lFo9iwgxdi+TLcHEiDFWMoVXwEJSJqnDNvxgJGBpSu7fOMH7Eu+9WXPlTzvVJnlBiOb90sAUA
	LR3Zi03eoidJ6gMDMwl0nEzwc3w7l5ZU8wOlk3wMwgfvbgqT5aie+HBnJkaJN+sIhnhbvSkP6Rt
	KACa+UftMUho4cgzHlDlqBueMCOr5+E2RxzncZGjeb7gLpG7n+MNITwcl+AktcSjtBkkB96QHEa
	rJdfhvHA6oI9lDuu3iH9vcJ0IhT1JJiRhd4+pFELtwQhbypzD7iEb2RQSVcpUYR6kj/A==
X-Received: by 2002:a17:90b:3b90:b0:3a0:cbe2:9e00 with SMTP id 98e67ed59e1d1-3a0cbe2a110mr2426179a91.42.1790413539584;
        Sat, 26 Sep 2026 02:05:39 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc787959599sm2299078a12.26.2026.09.26.02.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 02:05:39 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH] drm/sun4i: dsi: Get the A100 mod clock at bind time
Date: Sat, 26 Sep 2026 16:05:32 +0700
Message-Id: <20260926090532.126025-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A100 variant gets its module clock from the TCON TOP, which only
registers its clocks when it is bound. Requesting the clock in probe
defers the DSI forever, so the display never comes up on the D1 and
T113, which use this variant:

  sun6i-mipi-dsi 5450000.dsi: Couldn't get the DSI mod clock

Request the clock at bind time instead, as the TCON driver does.

Tested on a T113-S3 with a DSI panel.

Fixes: 4b71e269f5a5 ("drm/sun4i: dsi: Add the A100 variant")
Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index d504ae583..69987bb5b 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1062,6 +1062,17 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
 	int ret;
 
+	/*
+	 * This module clock comes from the TCON TOP, which registers it only
+	 * when it is bound, so it cannot be requested in probe.
+	 */
+	if (dsi->variant->has_mod_clk && !dsi->variant->set_mod_clk) {
+		dsi->mod_clk = devm_clk_get(dev, "mod");
+		if (IS_ERR(dsi->mod_clk))
+			return dev_err_probe(dev, PTR_ERR(dsi->mod_clk),
+					     "Couldn't get the DSI mod clock\n");
+	}
+
 	drm_encoder_helper_add(&dsi->encoder,
 			       &sun6i_dsi_enc_helper_funcs);
 	ret = drm_encoder_init(drm, &dsi->encoder, &sun6i_dsi_enc_funcs,
@@ -1160,7 +1171,7 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (variant->has_mod_clk) {
+	if (variant->has_mod_clk && variant->set_mod_clk) {
 		dsi->mod_clk = devm_clk_get(dev, "mod");
 		if (IS_ERR(dsi->mod_clk)) {
 			dev_err(dev, "Couldn't get the DSI mod clock\n");
-- 
2.34.1

