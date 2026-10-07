Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D654746C6
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370237; cv=none; b=GR8vULJLqcCkmIT3nJEIKh3iEQ2hW9SvQflz5qPl7kZ9YseuDch57NgP52vsvgxsLcocLRI1PZ54yOgo6vQHLqSyoHGHr8XN39dYqkS1Ts9o8w7ubf3OZwpoZiHleC758qMJerJlR1z6abEkoOmYsc+aXP2R9a9Zw2J3uP80GXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370237; c=relaxed/simple;
	bh=jlxL5+mbWXP8K77XchM8lW3LCVFpuiszpfwSWbXi6xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RwE8xCOwJoKcOdBbPgQqh83rziEm63NGwJIvhc+Q/VYJjyNxQCiqDbZd78ebY+pD4+lcHc/tOQ1TYjCauVhlNOMj4cP/TmUT8quhLlju7buy0sHyTUa8D2E6k6JgfVf28+2sq1Jdb+OLf8eSPk1O1Avv+6LNI54WVd9P8l8paN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bol3ZsqC; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bol3ZsqC"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso1442150b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791370198; x=1791974998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KA2DWK4h1sH8yjfR9BrVxNR11p9An71w1a1CSOAHpQA=;
        b=bol3ZsqCFElDn3i+wmDWkWjPikqqKeHad16PiBZtShYSCfhOqpK6Iy3Rud3jVW8Fiz
         NxPBYJXPWfvXuyCzJPEfzc6ILBMfS5jd4deEI6929QAXHlD857oOekac6N72pdCW8VdL
         int2oLtzErOxbg+P+imZTShOuJEEI1mZuLNWup6V9O3oH8kxh2SUTbcYU8R7iZENOFfh
         Wz2NRIjB5XVW0uwmcaXYAfihOOipLLN28e3uBM6hLUlvDqJgINpjQoK/ArNP+wJigu0P
         cxFM95uKS3ZHJhQhU+FXCHsI99bWuQRdIctruFOnegXtkgIplYtM7vx0Upj78B/uYHFr
         JEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370198; x=1791974998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KA2DWK4h1sH8yjfR9BrVxNR11p9An71w1a1CSOAHpQA=;
        b=bdupSmufj8x2JWmZmuVBqcX2NVdNXx/8d7DHQcHVE0asIFbN27OB6D9vXt6lfoI/gw
         BJ3QKeYWLhnI0WX025U3qY/VNbmLFRfiVfqofyks+K3zJou7416TiqakY7CiCLWLOY8r
         fpolZguTOYGhP3PlTc6ml+FCWD6j4ZUB2A3GO253UqqHoPzSfwSRU+bExOAVkR2OQZa7
         TWDd2HdnxVpRBFcqETiJ/SInMNc5XDcG0KVye2g20l0aAi6f+dbq46NkoaDW4r1CfNV+
         505AH6/Qi8iMB6jbQ4RccjJz0lXkC94xsBQbp7Tbr5oXua+BSVw9h83pM9V1rQgNhOjZ
         Up0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzka6++MEVo/vfZ/hqc3M/+cTTyNasVt3CZO/xSA66szuLxioWVoRazfTdyRUb/Lwa/gHra3KX+7jo0AQc=@vger.kernel.org
X-Gm-Message-State: AFuF++m+Evdwswl3n2WObXuCVjXnHVZmuFqar4Zi2IF9hcSpcpfd5mox
	3kADS2PEvBKl18rSo/bupmYlgftkoIaxcWQGyUpeHJUpL8A3MDhsvMyi
X-Gm-Gg: AYBFou1hBV/FnueorQf2qpQa2AgkEj1vRsniUzJAcf6PtLPTyrgI14TxyLQza/StKTr
	6s8aKhBUsmtsnFNxCCnLemE4HxFJk8PFtYSpZeqwWpcc/AZQiTggV1YtPPfdNWH6j8eBDKM02eT
	1yXDAl0lcupxV/jm39K9V6Gg0HnmltyTJvS1u1VuC8eMn3qlnDXrLN8QHSBf6ANpo61IRrpGVhD
	aFbj8myUeR/2ehkUudkqXcPTP6Z6XlxO+NkA7N/db3aBVQOBh/kQCjraWjqig2CTxkPjtiqXjZ7
	/B0HZp8ahG1PojtBWiuu/iSNNnixjOday/CwimCTo94elGkj+EBApfm4fi6/x+qFH77/uaGxEzA
	0L+k+PY7UjWjRtX14/RP4Qoa5c3F5wT8HIbVwfLPCIMscJyK/sYeqqS1k+NlXqZT3hZb/hhn2nY
	kPYS6pdzA1HDFbXU+NElTrqVEGFNQyxhXrzSWDEmxBbWNR7kFCA5qFfLt50gRIq0vLUTKmucFIq
	H4DFkZKNX5EOcVvXf+c3+J5QqVf/owfXjgrRGCfraQBzTPmth8/lbcvn1Apdg/vZXKUV+mraWfj
	Qr5cXW8vefUuWQ==
X-Received: by 2002:a05:6a00:929e:b0:891:a63c:df97 with SMTP id d2e1a72fcca58-891b354d63fmr1433538b3a.15.1791370198208;
        Wed, 07 Oct 2026 03:49:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8918891808bsm1197898b3a.10.2026.10.07.03.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:49:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Luca Weiss <luca@lucaweiss.eu>,
	Hans Verkuil <hverkuil@kernel.org>,
	Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] media: i2c: ov2685: propagate reset GPIO errors
Date: Wed,  7 Oct 2026 17:49:37 +0700
Message-ID: <20261007104940.507820-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007104940.507820-1-phucduc.bui@gmail.com>
References: <20261007104940.507820-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() may return -EPROBE_DEFER or other errors,
but ov2685_probe() currently converts them all to -EINVAL.

Use dev_err_probe() to propagate the original error from the reset GPIO
lookup.

Fixes: 0482fbb1c1cc ("media: i2c: ov2685: Make reset gpio optional")
Fixes: e3861d9118c8 ("media: ov2685: add support for OV2685 sensor")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/media/i2c/ov2685.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index 4911a4eea126..92d0f90b3d37 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -793,10 +793,9 @@ static int ov2685_probe(struct i2c_client *client)
 		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
 
 	ov2685->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(ov2685->reset_gpio)) {
-		dev_err(dev, "Failed to get reset-gpios\n");
-		return -EINVAL;
-	}
+	if (IS_ERR(ov2685->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ov2685->reset_gpio),
+				     "Failed to get reset-gpios\n");
 
 	ret = ov2685_configure_regulators(ov2685);
 	if (ret) {
-- 
2.43.0

