Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0F8568520
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999266; cv=none; b=ViS/AeXza/6Tiq99uW8Q2vmY2Nx/PMPneJfqUUzbW7ot6KJ158sYHh6In3M5tvxaKg77zGc4oUhlCWqlDXFynStZ7GxGoNj+/68qtnlwQja1NBzpzrRVYrStDSQCTTcpDxyO9UvVdMW+UdgSJjD9XTAHZjLWeFZ5Yl3Vxu9Qixo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999266; c=relaxed/simple;
	bh=z7urtDBdxm99lFCE+IrmBbf2satzNbCf6gZ5stCabWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0a86jBF0liMEfxfc2PpiBJ77rU8PxmMpmJat+4Gvc/Bwe6DnIGcWtG7B1ZP5aVQdXJiKb1sooT8RsAtxE5U6YOheOkEVeFm/8+zmC0PF3smRG/1IKackKyxqTWVSg419X8HjbIQOgYPQF/7zM4OtdOnlzpXJehxERfRSymeQfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+mSPPOW; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+mSPPOW"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2dcbcc546fso545141066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999260; x=1792604060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zB3tFoTWkKu7OlBV0vwBAsWhdfh9JAYvpIVESUkex6Q=;
        b=n+mSPPOWi1qQU+GrPzZcN323A0iXlLc3Appp2pqsMZkYtZjOFDZPCVz1MPSfMN4bGB
         mOCKZ3ifLI7qvzKoHAd2LlphItwsN7DWpRtpZHx0/D+JEyTwjAgByxi31tD/FmffO3Gj
         jPrZP1htEKxznoWMzKZv71ynJcfDLMXxCAOiT4OcQv2zaRLX0/keaGDLmPjAmfG9ZsDZ
         OU1qiGh12ZAo6JgpH6g57v3Jfa3q+y/XkSfhOa9Z8UmuZxbpRho7vs1wdwvs9ql591yD
         b0znAaMGMp0Lvok1qmK7hFK3pnBTGxNPMR5CQ2dlSU2pcRuv5BrIUWJ7tQTphJ2WfUx2
         Ab2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999260; x=1792604060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zB3tFoTWkKu7OlBV0vwBAsWhdfh9JAYvpIVESUkex6Q=;
        b=vOPzPMN3dO50cC5RNh9GCN/KapKH/h9wBX0OTQWcJR4HcwsHkkXG2ZVIEmgIJkKcFH
         2K37G4nFL+XjnxBBR0PO9Ks6PLD3/LNnFkpyOeB633ZfQiURdwtXKAd1JYX+Z9aQzBkw
         qRfG/AI147mIHbm+xsXYHX9C6GvWTLQMEC81OTN/K9r0Nt1bRnZ+b4TmXcLQRbJKjhXj
         xswwhNDQ2JBaAXHz+ryvurCDVX0hi6pI0SOuN1WM2/MH3OCgC6uCqD+2ITGsKczjA7lC
         Mwq6kkJohS5hfD6m9TVULrl7B7Ak7Du9cdZK8TSsu2UaiScL3Wt8/SnazPCkr/KuYUoO
         N4dw==
X-Forwarded-Encrypted: i=1; AKwUvBxPxfgvsVoZeH4hfj+vz8RBkGSVJGvAkRvxv5ypYzWlVE9XOixLx8WWbZors+qQlZIaj446Q74C/oFL/8Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLx2WsbHqxb8YYaTghMshMVUD+4WjzVPD/FBnfcllpTRrj8jX5O
	BR5V+PqI2Ly+8cdw4KB0WmGJtEfXryjQ39kdFzvhAAV+aCcSxvr0W9bf
X-Gm-Gg: AYBFou3VebRlgXp1l4H1nGr9UsjoVE5WzXkoE26dVtVfDlEbMTR4QnV0vbc85fZWycH
	bXY3cNffYuZ1DInRRtr+4bjhbhoKkOmvI2B9f2o0wF8QlOqbAGRePGkjzoSwpOHppeNtPudQRIe
	CI3LDXCWs1T40I+7by7ClcVs4rSX4ZhRVWz51COG8VrVikD8rkNn/5XmC40jPn5uEIWSsw2Jt7j
	fBMtZ6Q7745H685DxyP6Cf+KVX6L8kr3ibE16d6toMoo7edihkwfvSquvPigqBfbrk3IqMyUJcr
	cp+aBjKCE+ZrPlVGaCmclzr+2KvwUZa4tP6dx0FeM84PoM5cJR6c19T48oiGt7ZsKeMsKLZECbm
	NxthKsj0yf1ZBAEC6r4VG0C7iYwFFFpDBSy0cmODXwWrZNL1SouxKkSeroMKVlYdNzZtPgSPa3L
	EozwfIyOgj53QuOH+Mx6xhekqdTQdPDD6fgrLo7CSNjRI5ftiz9OJjPWvTyDqZmj+m/uqrTvZIF
	IuD30e3uvsLb/44
X-Received: by 2002:a17:907:3f24:b0:c29:f5d8:9c78 with SMTP id a640c23a62f3a-c31aa097abdmr1559370766b.39.1791999259865;
        Wed, 14 Oct 2026 10:34:19 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:19 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 14 Oct 2026 19:34:03 +0200
Subject: [PATCH v3 04/11] hwmon: chipcap2: defer probe when IRQs are
 unavailable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-chipcap2_locks-v3-4-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
In-Reply-To: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999252; l=1698;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=z7urtDBdxm99lFCE+IrmBbf2satzNbCf6gZ5stCabWs=;
 b=6rpaxMq+xy2PmF4OpjhzxOQV5VfNBDG6M0qQPkYFw4UJnTFEfzbjhn0A5cDC7pUYiVh9Y4BOc
 oBqhPv/FbkuCn9d6dDugwIDnVespG7Xn0Q+3wiM+ivI+mapzzwhrsvV
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

This device can work with or without interrupts, but if they
are provided and still not available, but if -EPROBE_DEFER is read,
its value must be propagated to enable probe retries.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index aec4adf98658..37dbf6a76fbc 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -636,6 +636,8 @@ static int cc2_request_ready_irq(struct cc2_data *data, struct device *dev)
 	int ret = 0;
 
 	data->irq_ready = fwnode_irq_get_byname(dev_fwnode(dev), "ready");
+	if (data->irq_ready == -EPROBE_DEFER)
+		return data->irq_ready;
 	if (data->irq_ready > 0) {
 		init_completion(&data->complete);
 		ret = devm_request_threaded_irq(dev, data->irq_ready, NULL,
@@ -653,6 +655,8 @@ static int cc2_request_alarm_irqs(struct cc2_data *data, struct device *dev)
 	int ret = 0;
 
 	data->irq_low = fwnode_irq_get_byname(dev_fwnode(dev), "low");
+	if (data->irq_low == -EPROBE_DEFER)
+		return data->irq_low;
 	if (data->irq_low > 0) {
 		ret = devm_request_threaded_irq(dev, data->irq_low, NULL,
 						cc2_low_interrupt,
@@ -666,6 +670,8 @@ static int cc2_request_alarm_irqs(struct cc2_data *data, struct device *dev)
 	}
 
 	data->irq_high = fwnode_irq_get_byname(dev_fwnode(dev), "high");
+	if (data->irq_high == -EPROBE_DEFER)
+		return data->irq_high;
 	if (data->irq_high > 0) {
 		ret = devm_request_threaded_irq(dev, data->irq_high, NULL,
 						cc2_high_interrupt,

-- 
2.43.0

