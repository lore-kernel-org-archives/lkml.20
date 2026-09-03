Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A3F4E8DF0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450252; cv=none; b=EzlwDjnPT2Mqe7z6fNmSlvfsP6W+1L9OhrHFU+PfK7tH1lteiTb4R9N3r18F2lQS07iohG1cw9mlUedf0EzWIZ7KNSY0diObcD8Wfjp8dXjsQUR1eY7r3qLA0oc/hhGcrmZB3IDkhoMXZBHzj3vzNpfyOxqrT8gcetQ3FV2HSs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450252; c=relaxed/simple;
	bh=V6nah0thlCYDVKr67EXMA19FoQoM8eKaKF4GgRzztzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E1d9Yn49Ivts0wLY6OEguYFUBNwZH0UxnqH9yv93q8VNgRZ5tPGo2Rc36/P8hqsiz7MfuEjGxdlKotu8mzY5TMyFzpagRklp3WYnWHA9R+jSw2Rh6pJ2D5ErYb6vSjnCkjyBMfx5yv/tdvGgtCEZ4yPoegEbKtWDOqL76d7bUKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs3fQS80; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs3fQS80"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so127715e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788450249; x=1789055049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mry3nYNEPrZxqkxatWuTZFq3w4sR1ZqgrHlSjI3OqFs=;
        b=bs3fQS80VrhImXtKDaFPWd8i82XKcQ0TpcKVII4a3qkpVr0kwAtGBmc44xUef9fFvJ
         v9511dsT2ZeQ8GDIoLPY97iKV1R2vxGsc+XftGI68TwRN/joKHhXI5vYcxmduaN3By1v
         w6o3ykQ1+juLJX1eyPE8lGbUU2R32GmKkgrfqFIePRAswmZ5D5Q4tw+Y+0uZo2jLNE+3
         2p3Erd+ZESl+Q7Hu/VzEvDrhe68Ov9ywpKVl5XV2nv4xi+debjjAPWwjTvonx417KjKF
         6gNxDRexIXgSzgztlDewzhpgCkw0BRKF/PPP7Rsn1tni68VK9mBpBXEaSDwdcZgOPhXP
         5hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788450249; x=1789055049;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mry3nYNEPrZxqkxatWuTZFq3w4sR1ZqgrHlSjI3OqFs=;
        b=V9LzENqeTAimY5zE2VXr+faWxZ/90AkjMiruxtD3WKJSKQwEMN7HklNSuHUoFgjLRW
         M2iZcrOfgVhEL0Y6ijD7n76W4oGx7ToDwHKOwqQCTd055tpjiekokLhPdacvSntpi65O
         nehZzvK3p5jiJjQ3aQYTUuKHOLKWYPUcfzUeot2hBq6XzD1g6niljTn7S3Wo9/moV+H5
         LFCvD1uQI7Kdu4fvgyYoHdi1Xg4MfNvmxmc5zcNTPMAp7ND6aHpEFNT7D9S1kT5iAHc2
         tfiX9/GWuiQV22835qL4m955J7WqhEwAZeMfeqAsRe9kGvj2Oe+jaHjPY7VqEQVWIeVN
         nB5g==
X-Forwarded-Encrypted: i=1; AKwUvBw967Nhy9/RuGxjgBEF8NUQ7mnVGS2zpO43znJUhJi4kyyfnrX25hSoydTXLg66Fjy81BQlLGZjU6e6uEI=@vger.kernel.org
X-Gm-Message-State: AFuF++mvORpI9IsP4FmDee2mkle7bXPcsYahVhC4pompixde2lQ7g7LY
	b7/D+uLN5Oj8imLYS0grV0LHHkefZ8vkt7S05vbrDK5gveRWVnJHZLce
X-Gm-Gg: AYBFou096n68l6RvlAoxgQQqIpsFrtl2J6rZE7HcOLZSQc1mYH9P0dm/0i5GLVqhsfw
	iIfF4hX2uAapBskSD8br3UmXesPUaUag8/gNSymDGPoHQ4357oBvPZ9Bc1W39fWyS3+oazHwppt
	osWXSfIwObgoP8wM7BmLb+ybkghC3S4mPM78bRHndOO8Z4U03BPwvcbc+rIwec7ImPJHm9DrrFK
	EJVpsK0aj1MkFaic5v+xhK9tl0zTYJTySS8f3IIES9TPMj+qplvdN4On21TBjqTLnX+jrFZVliG
	XRrGf2IIm6dSvKLmuKCj+BMcwYKKAdg/Sy9NQuYiekbyuguKVmi4kc8gGqkqImneDeqrEHR2FHz
	xRNa4oQMgYQCaYNBulRScOJZ8p9+gmavIcswdWF4qJsJxxTMl2eG++pT9E2hmdip2bSJK//46++
	hLrPHGNdwvOnOpAM81/lse7mSCgU5CkH5bpU0GVTOTwgCHPVU9vZYyJsb2Og0=
X-Received: by 2002:a05:600c:6c4a:b0:49c:edd8:ba35 with SMTP id 5b1f17b1804b1-49cf5baafc7mr14910805e9.6.1788450248541;
        Thu, 03 Sep 2026 08:44:08 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47b9817sm121063135e9.1.2026.09.03.08.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:44:07 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: mt76: mt7996: Fix spelling mistake "retriving" -> "retrieving"
Date: Thu,  3 Sep 2026 16:42:04 +0100
Message-ID: <20260903154204.20872-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are multiple spelling mistakes in dev_warn messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
index b8006b8729a1..3fb9f39c2f61 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
@@ -283,7 +283,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rx ring0 addr\n");
+			 "failed retrieving NPU wlan rx ring0 addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_BAND0].regs->desc_base);
@@ -292,7 +292,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rx ring2 addr\n");
+			 "failed retrieving NPU wlan rx ring2 addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_BAND2].regs->desc_base);
@@ -302,7 +302,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan msdu pg ring addr\n");
+			 "failed retrieving NPU wlan msdu pg ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_MSDU_PAGE_BAND0].regs->desc_base);
@@ -311,7 +311,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan msdu pg ring addr\n");
+			 "failed retrieving NPU wlan msdu pg ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_MSDU_PAGE_BAND1].regs->desc_base);
@@ -320,7 +320,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan msdu pg ring addr\n");
+			 "failed retrieving NPU wlan msdu pg ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_MSDU_PAGE_BAND2].regs->desc_base);
@@ -330,7 +330,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan ind_cmd ring addr\n");
+			 "failed retrieving NPU wlan ind_cmd ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_IND].regs->desc_base);
-- 
2.55.0

