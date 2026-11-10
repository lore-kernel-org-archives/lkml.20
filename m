Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305432;
	b=j4B5SvV43Ft2cdA6GdMI+VnTBBcKwxn1DssaLMw4zQuJO5JmEf+CigRYkgHqhlMcPvpL
	 cIESSBgul8wZHb3zi1QOlDaDVq/SMOEk0eqHzk04XuDom5IBeZ/qOpIdYdFBHAE5TM4Qg
	 CsckbZ8gBpV509WXdzWoFii+QMShbZ58yJe0mmqF0wST3pPATVgSFOhyQOk47WR0B4kH3
	 DdXHrk+54+J6nLzg0ZCqaTs4GhO+7F4DFW5ItkF+fHfEkGE2XWOrmM0wGpvdARYMZnjLk
	 bClek6Amm0xT8U2Fa57969HfTOgQLfcWmma7g+HTNPN5ZsXy/vljAhvjqgV0R0M8RCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305432;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nmJ+yroF4ww/8wTOXK7PVlwTh9fDAL59Srn6/a7QLuk=;
	b=rqDZGiwVxyzYFGGfjZPePkBK8o1G1fnxEXtWX4NmVyNAJqQasV+rj78+l5kmBrDj9AJ5
	 qyaQw0qBJeWH+9uU3p2MGP3EzUmxCOU18xVw1jzCh/jZf1YERIF1dy0kayvKgs+EcGnrr
	 /ch0cQRJnsyJiLp8kNtLoQrazGGEZqj+IlwIMVwJcO25vBfhjoFpA6PRWxwZ/dSD34jbm
	 Bcn9BWLa2iG37W43E0x1IV8foCcjS6m4BbK4S525K31gl/za8TfXdZapz2DV/6Kr8zgn8
	 oLhrsVCq7OeZnE1grGNPJhYt0RJthWO8nGyVWDu+/1Ldc/gULn0wo8VO6JYOtGzgE3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=pVHGerA9;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C71B606B505;
	Tue, 10 Nov 2026 10:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C71B606B505
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=pVHGerA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=pVHGerA9rDpseqz9DHOWt93I0FYzEygND7/biOt9F4SBa2D1hwHgsFgX8k8320qGGZne2YfWP9CVV
	 JvxXkRHPaBd5PEc61eA1d4/whcX1fWCKK0lL9COdgxKprb0WhZXiYCQXVkSkfNRHESgwHhNis5u+Uf
	 TNqXamZKoY7r1ijU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af2ed93f09-aa308;
	Tue, 10 Nov 2026 18:10:29 +0800 (CST)
X-RM-TRANSID:2ee16af2ed93f09-aa308
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af2ed92867-b1643;
	Tue, 10 Nov 2026 18:10:28 +0800 (CST)
X-RM-TRANSID:2ee86af2ed92867-b1643
From: zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Selby Mashiki <mashikiselby@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: qdsp6: Fix device node leaks when parsing "iommus" phandle
Date: Tue, 10 Nov 2026 18:10:26 +0800
Message-ID: <20261110101026.1154-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

q6asm_dai_probe(), q6apm_dai_probe() and q6usb_dai_dev_probe() parse
the "iommus" phandle with of_parse_phandle_with_fixed_args(), which
takes a reference on the iommu device node, but none of them drops
the reference after the stream ID has been read from args.args[0],
so the iommu node is leaked on every probe.

Drop the reference with of_node_put() after reading args.args[0].

This is a refreshed version of the fix posted by Selby Mashiki [1],
which no longer applies because the context in q6apm_dai_probe() has
changed since; the leaks are still present in all three functions.

Originally-by: Selby Mashiki <mashikiselby@gmail.com>
Link: https://lore.kernel.org/linux-sound/20261025190340.449613-1-mashikiselby@gmail.com/ [1]
Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 +++-
 sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +++-
 sound/soc/qcom/qdsp6/q6usb.c | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -1203,8 +1203,10 @@
 	rc = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
 	if (rc < 0)
 		pdata->sid = -1;
-	else
+	else {
 		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
+		of_node_put(args.np);
+	}
 
 	if (apm && apm->gdev &&
 	    apm->gdev->domain_id == GPR_DOMAIN_ID_MODEM) {
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1309,8 +1309,10 @@
 	rc = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
 	if (rc < 0)
 		pdata->sid = -1;
-	else
+	else {
 		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
+		of_node_put(args.np);
+	}
 
 	dev_set_drvdata(dev, pdata);
 
diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -382,8 +382,10 @@
 	}
 
 	ret = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
-	if (!ret)
+	if (!ret) {
 		data->priv.sid = args.args[0] & Q6_USB_SID_MASK;
+		of_node_put(args.np);
+	}
 
 	ret = devm_mutex_init(dev, &data->mutex);
 	if (ret < 0)


