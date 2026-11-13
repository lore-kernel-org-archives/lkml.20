Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546491;
	b=vjVsU+XHGHe1JtoulHmtYL9FhSTmKJhBSqknR3xYfzJy1vAkE7D1/ZA+vDefI9KkAFb8
	 Omh7u/pvcEomdDLETl6vWGEgYZUflwEY81mnr66W9RtU/H1dXHJefHNKbP/6I88KN2pu3
	 KXlBmB3dQukWKZx1qLcvW9YyRD4qKYYptD6b5wqkU6NZ9ZP+oiApYionkQJUKwePKLRHp
	 vvJ9GbojhyAKvQRVYaIVpHbAoduEk9blf02evF37ZTfQobtJHK8secpcT8HMQvaj5rRrU
	 fxDWfjSPCGvPuOlWi+nOu/aGuSrABtIilrq5HYQFxiDUzJUfJXYaRS7lD+phA4kPtsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ADGcsJLWHH299RpecEFnjkTKrpHnNUktG/Mb17Rashk=;
	b=LcS0ZDzkKlix3STYw7dln1llMArYSmtHwvxYsatimOWpD75d5MfQIre/+S+8FroDgUJD
	 AYcQHBdpZ8n6w7bcHFTGQ158mm7gTDSquv31LcPWQsmhtIbfdmYqE//XhmZGeNHcwdwbt
	 D99mXlVs9lLsqrzR7hQjlWLr+Wek5G7Ht29I0IJKccsD19INMNZe0YV+HPxdDChyftcwQ
	 +c4fAyPHh7HTpaIHI8+rSkglhkobuYl7W05CA36th/1S1ng4KSnZN4RSRKDYnfWGOYZym
	 JmYRQbTcrSqzSFNO+Ey/T4fJo4yUtdj43+RDI0gBrVsxc3q9h0Z8QiMJz8WbobEPTBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yUg7n6xS;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600F9606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 600F9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yUg7n6xS
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so423230a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794546490; x=1795151290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADGcsJLWHH299RpecEFnjkTKrpHnNUktG/Mb17Rashk=;
        b=yUg7n6xS6b5wr/7ImkqnG+YvinFqaLzxnVYRWY/iAcX9sO8IPGN5f8xkGEbuEdvcfE
         l8mZGzVXWy0HyDBQMXQSMovVB/Hb/WIiNZTQqn1CmWeGwwziPtXs4CaquD+yPQokF//c
         3PHcJScWVMhqLHL6L/EVruxlF1t1IkqPYcORGxgsg/kS8i7pAoJEVIEL0fUfvbHkAc02
         4QinmxWWvxe6T4sYQkKf4WrXjrBnrsCpS08UGvWH5dDpNBFQQONVO6klkt+BKMumHQgm
         504pDAniLq5XE+Q7pYBEcIJB8MWdq3zfWF024xsOvNycp+L9H6Aui+Cu1OaTBNWim1Fd
         r+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546490; x=1795151290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ADGcsJLWHH299RpecEFnjkTKrpHnNUktG/Mb17Rashk=;
        b=x6wU08HitQU6QkTSM46B8DM/F1G7Hcnd5PFC8Fkb5wGFffELL9mDLk9oHoZsLsOOLa
         8kqSBx0TNsT7+3nkA7+fXZBPMrulv6LW9Yo/WOsUB3gQywKTx9x+syHJHL3u2y4cn6uc
         nmMlUfNGPXpWh4MpSZXUGpfrBvYZbtFnJ/BtkOIBO82mTq2/H8a/faWWu2VBz0XoMmYo
         UVH0iX6+43WVRhBZHOxw4+JuKLnn2S2hh2Ox0JMgwLBZOOcSw5nYHTYiH+uI+nlb+iBx
         LB5Sfm9eX2YgfW1lKM5uVHMTCnWz6fqvliB7iJH6OtqkTtKcJcJUKrL7GEpP0ujLdiiY
         MKcw==
X-Forwarded-Encrypted: i=1; AL+hErH+SJKhFQnuWK0/7nNhFQEFH1W4YRRmqGYQOr78tapvQmaGB3w6If2JwZOP84c7gHFM5oI0If7E/HyTd1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mTfJP7qzEfxx1bwP9uiSRiFFIk7viyBXv8Ixh2GXZ/GQUEG6J
	SJPxjYBMvOJrPEObjncI2JC+fjFn8lXh1+MyOhBbKYYOd5sTHPnRYRzw
X-Gm-Gg: AYBFou1UEK8uhQ/TrQp321ihEIC6n+glbWabYeWmmJYE+7HOqxjV++eXlNea3Pr81rv
	/zaJMhMOe4fwmwmxdQsfsF0sDffwZdS3k3ZLExWqBC5Eu5ZV+FcuSl19K2BuH3SVwYpMHsSTNbw
	E5m1LtToZP69ijVpSNWF7HH5nke9xlRbdAA321R+XJQF4RgyhRXPeMtJuHj03nWCxXqGv39FSgO
	uBR6QiWguXX+I5aBBXrsnDosIYIEo1LLMolWaKiAPl1iBG2YQxqk62X3DfMuSUqtsUyC82dgyUC
	FhRD4DnqrUsbbigbMr2pLXXg+0fnf3R+3pdiZF7ixm9sV7g8KueI9X/yl7oejoYjLnw13o5T5hp
	FGoK97niJTTnN7kMwroQWblRxhJqg6SwG4j65/uXP3CgKtfgO1XqREoGg0lh7uzfvfrCRB4w1bi
	7aSRz/cpOJaz1BpQlOXWH7QE5edw2ie5P0w8oaCLgpKF5v+5qzkndkkUrSGwn7VZWt8HdPldp7o
	aa4uEESqU9L5ePxfYE1dZzzUJ+f6X9e0jJtjW3GaQfOsneKBTGdCIx14IN+HoMkdSZgPlXA1PI1
	LtalLHpdpxRMUEUePVMbelPtqJU1XY6d9CiFHb4sCzl64tnQy6i0niNCNkCU6KAaI/yiPY6QEoY
	LLKNxa1WKJOdnjgLntkWMQ+Z0aszIVkY5LlHHrnvf8Z4A
X-Received: by 2002:a17:90b:5585:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b1b0a12f15mr1032070a91.24.1794546490576;
        Thu, 12 Nov 2026 21:08:10 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm7643420a91.16.2026.11.12.21.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:08:10 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/6] ASoC: fsl_asrc: Fix runtime PM usage count on init failure
Date: Fri, 13 Nov 2026 12:07:24 +0700
Message-ID: <20261113050727.14053-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113050727.14053-1-phucduc.bui@gmail.com>
References: <20261113050727.14053-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Balance the runtime PM usage count when fsl_asrc_init() fails
after pm_runtime_resume_and_get() succeeds.

Fixes: cab04ab5900f ("ASoC: fsl_asrc: Don't use devm_regmap_init_mmio_clk")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Change in v2:
 - Update the commit based on Sashiko's review.

 sound/soc/fsl/fsl_asrc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index c91ffb5e0c5e..f7ac60724c6c 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1432,6 +1432,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	ret = fsl_asrc_init(asrc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to init asrc %d\n", ret);
+		pm_runtime_put_noidle(&pdev->dev);
 		goto err_pm_get_sync;
 	}
 
-- 
2.43.0

