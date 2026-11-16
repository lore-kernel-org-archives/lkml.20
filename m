Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841844;
	b=R9OY67XEifaAKWZiXE85fcEgM0ME9m1P3y+cStoEM5ca8xAzMxH39bMDIvpvf2BrEa0S
	 kVf0mQNiaeKfocAiQOWEyipoBrCUb6uokMvDUIbU4+9OTCENZdjKJO3SRGgIbGMI+UAmZ
	 TKmq9Ohqnf+td2hNjcqoiM0N5HseK7ztHvtvnYnqubjdS2A+viRg1HBDjZiv3uQRvx8A3
	 Xmd7zC0cCu0N6eZ5PfZ4mmAvkp7KhFQw/KhllIlrAhH5c8RXPi3wZn6nfxaQA3s/D9LHQ
	 75pSR56bur7lGFIV9hBmb9i0ONTEUS9f4mLPJrXFh6vli6QCGAOySBQlv+RGepIiFjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mbvLcy9HUv2G6MMG8rNmvtC6ROCR4D1d+RS6v72Z6yA=;
	b=eQq8xjz7uEVQnDaly7tjnyiFT7Vvr4qZYIpCOBJpwLvoyrowwOXhzlzAhnjBks73WO/8
	 7TWpC2+wuy5vTcjzRzFfMSV6E/2GVa9JBrPCYvZdsAde5Kx85V9vXFBKEBlrWv+NmxMEn
	 1lHGovcLzGD+WWfyOl35FWJPBq6FFe3EXo/eJ75o9+ncPRJpo2SMqUI2SaGfjvGKdNEJY
	 QN16vHXRZ/RVfLHp8o/0jxNCDxnFalNLG1HCA9Dkq+evxn2OPhqiaHUO/zDhhidOHPkEE
	 AFzjmaFAYgTNStAKQ5At9YZ9yYQr2FKuN3pYMm94hBu8DWExMnGh4l4u63dCGLT3aIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TFN8p1e/";
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18706606A89C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18706606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TFN8p1e/
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50e26763a4so131544766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841842; x=1795446642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbvLcy9HUv2G6MMG8rNmvtC6ROCR4D1d+RS6v72Z6yA=;
        b=TFN8p1e/uSzKxrjcenNwkH1QG5fZ7s+9FWDCaDpCd6eWIWq7HTDxfuqFQuqLs4XrAl
         TE7DT6E+SExpy3/sDwNYKRzlo3ZaISXpZanItqvbsUFxn0hNX71BusAt1CDEmqQHZdnD
         RFm6e+XgA2WAe+OIn2dbVE3RHhF47VlpqXj4xatsl6nOJjf9csqCHT3Vu3nNSDdHQQ54
         YaGrQYjz4DQuQf8b2tgWOm4NJ+2wFbXbaS9aByDDs9NPF+47zIo/a1tvASJ++aaFpRXc
         3IFKGdcALDq0konLECwZIKh2OIXUVWkoK9k1P2tS8iDJGZs9DwmuFU6Bl9th1onY1hcM
         3gCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841842; x=1795446642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mbvLcy9HUv2G6MMG8rNmvtC6ROCR4D1d+RS6v72Z6yA=;
        b=fPen7IyY4uw+kpP08j5F6ETD2iTt4mIGOhDyOKekIX6rKUuWIvW2OZfm/9q6MttYh8
         lK+t0qK4kPKC7rSUdQTwHvY4ahSQ3JhzS0auCc3l6oYGNjtu9nPW4U3AqPLZu8Z12yzj
         zpP3joDCZ6Hh0aiS9pNTmXB+UnTC9ZkqWRYOOct9q9seWqK/rL4yOOonSd/ycgtuwge5
         O7PUUrc9dukUtlKbv/qvztkoocU609f/5a0dbBRbkrivHtnuEfY1PvUgwlpc+XYtea8H
         Xrw3Hlr0An/v/qrmfzedkUJKrhYzmlwelyXUi/C87lDHXB5TPubeDcptzZZPh8csDJJw
         OaXQ==
X-Forwarded-Encrypted: i=1; AL+hErG/UhuTAQCEGicm4Ak4nXiMR+f7cQS29kkN1OmIEchsvPbrYgYZDOvBFOEKpyqlOLmd6vaMVxpItz9NYRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GDVH2DLNb/5pn9m52b1J9pTrZSDSdqh4FkAZMgKaDlX4Qshwc
	QH/y9/PMuBrZWoHhWdipJr99vfH+zYr2/X5Ekb01q5bHODmvAx89eGnv
X-Gm-Gg: AYBFou3rtHzw+9VHtr2U0IkA6F5ITzF9xlcwr2GuJKC2Eq7fvQAHCVqxJq7ZPmcunOu
	gF4x3H/uokUvd6RV7ycWHI8CNiBvSoISTmPKZeKK+r+sIA2HIUGO3bDn2KGT2W6GBfDCAMJ8M1c
	ZNRV9vd2LfANLMWIwP1ynDQAIDAIKAFpqbD/sM9dF1G6D+cQptKjbXIDngiIEb8BLx5goZXc13+
	3DdssQ+CjKYKl14ely3feBHj+ibsS8RLc3Z/WETV42OsZwX5pZRaSYeszcMahlA2JnJlS0ITkWu
	4Y6xIZni/glAdMm5dpoTDTTEiweRv3M5YyyVuzjSkA+3MAKtMMtXAUhq+5rSm27UvYaoC7H6TLN
	HVMkRx+ZySMzsANb9m+f/3esa/e+VXlKMJI1usoMXq5DH50tyEdHTz//y7GB3XjzOVZP/7FHAmw
	EfTfBThTdmv9kPRhjddyU3BIeQriAdL0FBHKrWUuN5uSrweMDfVMYIMeyZP/KL0qQdU8pEJqndm
	PnZiGc29eJTaBqx8/5yDFobR43cW5wH8WGOsO9TfxgtSFPmDFjXgqfLGtT+RxGRph/N13coNv27
	8hjWTul3vePW4MTnLeG1wDbYJlLTQdySs/cNWAskanmHqpHxa/MMrp5eHKPXD/maVpdH1wOWZVc
	31HIi2TxzQq0=
X-Received: by 2002:a17:907:8686:b0:c40:b59:1b with SMTP id a640c23a62f3a-c5096389f41mr846550366b.44.1794841842225;
        Mon, 16 Nov 2026 07:10:42 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:41 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 05/12] drm/panel: panel-lg-lh400wv3: Drop redundant disable() operation
Date: Mon, 16 Nov 2026 17:10:10 +0200
Message-ID: <20261116151017.274764-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
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

Squash the disable() and unprepare() functions, since there is no need for
host adjustments between them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
index 63efeb434be13..c6834e5312089 100644
--- a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
+++ b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
@@ -115,7 +115,7 @@ static int lg_lh400wv3_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int lg_lh400wv3_disable(struct drm_panel *panel)
+static int lg_lh400wv3_unprepare(struct drm_panel *panel)
 {
 	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
 
@@ -126,13 +126,6 @@ static int lg_lh400wv3_disable(struct drm_panel *panel)
 	panel_dbi_command(priv, 0xc1, 0x01);
 	usleep_range(10000, 11000);
 
-	return 0;
-}
-
-static int lg_lh400wv3_unprepare(struct drm_panel *panel)
-{
-	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(lg_lh400wv3_supplies), priv->supplies);
 
@@ -175,7 +168,6 @@ static int lg_lh400wv3_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs lg_lh400wv3_panel_funcs = {
 	.prepare = lg_lh400wv3_prepare,
 	.enable = lg_lh400wv3_enable,
-	.disable = lg_lh400wv3_disable,
 	.unprepare = lg_lh400wv3_unprepare,
 	.get_modes = lg_lh400wv3_get_modes,
 };
-- 
2.53.0

