Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184131;
	b=H0WLi9mZc6WcHQyPwFruxBJ6dpSU3/m1Wgd7Rc/zpsWjqqgfu9m7vF+i0oHfsfuVpPIF
	 K5Atklqt+VdSzzsefgcYJV8yd3U9KLXOS/Y9u8rDYK0lLHLPVG6sx0ytg3jgZzl+mcpF5
	 IDaCQCjfZipJPBPo3sdGI22Kv2CHQJgv7ZZvOzz/hS6CJTtpyOlMCd94qEfV8zXItQI3U
	 ZwZX8fQ1hFOQx8cMe8ersgaUKT2fuG4gXnDRNhiu1Czg6NxQO6QMstYbvOYGCpyd+lCPo
	 jY6IYEF06ZEeQmKL+qNmFdJWNxrmw8V3QNfn6IVu7qYNsKKWuhFUUXQCAbTQl5Be5YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cjsCnXQG//ZZRkvM1fxbdTU4TNbSSVMoiWVOYZPqnMA=;
	b=yd+bYFlBDjKQ68cCnL6qad4kRn9lijGc6WGWM30brKhQyDWF1hB9DN7F6qSFXrx7k2Xi
	 KM8iY06om7g5HyArjv0k0IUHx1CIbY1WtHRkqSX8gCMX+K/9W0MFGNSTtCh/XAdM1femm
	 Eh3FN69VKhGa2RyxIiGRaObVRv88Ow2u73oi6Yes6HF2ziWc72cBqdvtNu4nfXANttQZT
	 MAuiFXXDaAm8F1/T4xT5oy67Yu9ZsxlBEHLoc6O8HPBDGXwWYYFwiV8nhwEgOEHkH4m9y
	 HrUty6+SLWcMXJ/2+fjJmbbg6FDpunKyuxMGcAlW94QL41jhgCxY542VrRF7vAlpJuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eo7o4w8Q;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DD4606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01DD4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eo7o4w8Q
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1421834eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184130; x=1793788930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cjsCnXQG//ZZRkvM1fxbdTU4TNbSSVMoiWVOYZPqnMA=;
        b=Eo7o4w8QpzUWMiuEDfFJXwZNoS5fj2JVLvIFGD0d3ckpdymIPIQQiXCNfuAIa2lKhs
         qblYC/UEviTgrFzfDiqraLmxvjr0GiTu5qUPXt9mrbeEsOeuTarNl3zg7AsHsxX6g+VW
         ycH5tk8RiTt3aFtqSoloVYXphT/8RK9X8NJ8qCJ0h8tUMO5kwZtZ92qLJ5uqr8P5LQRJ
         r84z8b+gCmPGLX2Nl17pVznluQJRTxSa6dxpkk8LQ9fIdViIHUIlfxEZJO9w7yEhZgf9
         CVZZpTL8RL8XUVgsgOXlU83e/ul1TMtb6epnDSJn/h1g5XuqYGDTQ344Gui8AnHmdyqh
         J2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184130; x=1793788930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cjsCnXQG//ZZRkvM1fxbdTU4TNbSSVMoiWVOYZPqnMA=;
        b=FfuDwJTwamKslwio5gBPwP9obpB4j53teORsVnRL3QZpQi9Qy3zGM4VoM+NMVI6aZ5
         UOnUdNFUkhfgFjJcE6ynCplBLYVKlo8q1dbOEmO4MIH9O4ttnrRo9JaAvd67wt5MVDGZ
         uRi2r7ilCBQHIHEgkuObxtJPtHsvIso3sCoSoX1dpGrXqR4+VbFAO2lOmcrLeDGjKdi0
         Jz7tl0R6r+4phiPv1DlTqa7xuI6dUWRwNNJ4OpwNM0acTwplcuP1KaHf+9FOkQLfKWFf
         kbDQewKCqyLtYqkG56qW8bVCSDXy0DkN1HRQXMku5gBocSyi9AqZan82pxDPubnFPqat
         Rj8w==
X-Forwarded-Encrypted: i=1; AKwUvByu5hQPC4/VyLm0//3d6Pnc1YMLtMWwW1FjInFEtYgbedL/sZNl07+WAdk8E5ZlWskXqpVQK/+m/SiwSFM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ8vTFMijCz8i9yNanG13YHn11er+lg1LKPq6PbMyQQCK2EVLi
	1vk/j1kvXnKMQxoOLMJtvdKGQxY7210mentgH1ZIu0S01DZqZo2AH6dMrNW4vQ==
X-Gm-Gg: AYBFou3cG3za4QtwMINIvmCQVtpmuHjnIGKmXEU7MQjUx17Cp7JdJiYWWZYJMQ7hqnh
	lQXXVnZgP+/kiODzofL6OhDx/zFHR3LfIgOElMSfS0ULaEwTEMyKkHvV19CVZuzhZP8ZfkCxgST
	fpn+a21LoI05DrLMQxU5GU+CIErVAltTYfcY9cMoWbAnQB9WLUUMP83jLXWqIcIx9jFzVnoPGWa
	Hme6CpsNPcYjsW2U3OtMX8ndkW4B64WFSBTxHEYRFBrkKLTtlAkKGDnAml1CXMLIDYlk9MA2dpH
	1VOYyXg6rjkFzh6DHDVgJs1cgylS/XfLW9vlcvLyPTCRB+jyesjYgw02iKUEweEd/yt+TeYt9bS
	Rdlh6EpVO/+HrjXssr7ZDGoGtxKxxTt4CJJldrQGbwNcsmZXYA3qzUcHur7i/9XW1TDe1Nc9HyS
	q5U64eMOQq7KDs7u2HZqqSASnZTHa+j5k6WFsMs2QSPHZJnrxBwI0Gl3/A4c+PLgvXL4q0rrOhc
	0QUovFu1H0mps6wixLFfVxRyiudpMw6vnoZUi4NtwSmsLDD/8VeX+JNJA0ied2g4yg0pxHxE3oc
	zb/iLSnAYW4JQw9lOza7BaxkNOktkM5nGgXOpeCUqpYnlvCw0eHsZFXqNMw6EOZpmbsB8sMLN57
	QG1SADuzx3Z9pElZdQmgGc+YyG7XSXadkvPa+6wmP6i2z
X-Received: by 2002:a05:693c:894b:10b0:36a:1b23:a1cd with SMTP id 5a478bee46e88-36a20112454mr2703372eec.9.1793184129977;
        Wed, 28 Oct 2026 03:42:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm7521881eec.8.2026.10.28.03.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:42:09 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/3] ASoC: loongson: Handle clock enable errors in set_fmt
Date: Wed, 28 Oct 2026 17:41:38 +0700
Message-ID: <20261028104138.26973-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028104138.26973-1-phucduc.bui@gmail.com>
References: <20261028104138.26973-1-phucduc.bui@gmail.com>
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

loongson_i2s_set_fmt() treats all clock enable errors as timeouts,
warns, and returns success. This hides errors other than -ETIMEDOUT.

Preserve the existing behaviour for -ETIMEDOUT, but propagate other
errors. Also clear MASTER, MCLK_EN and MSB on the error path to
clean up the controller state, including when the clock provider
format is invalid.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/loongson/loongson_i2s.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index 0d5278203024..438bbae0888f 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -185,34 +185,50 @@ static int loongson_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MASTER,
 				   I2S_CTRL_MASTER);
 		ret = loongson_i2s_enable_bclk(i2s);
-		if (ret < 0)
+		if (ret == -ETIMEDOUT)
 			dev_warn(dai->dev, "wait BCLK ready timeout\n");
+		else if (ret)
+			goto err;
 		break;
 	case SND_SOC_DAIFMT_BC_FP:
 		/* Enable MCLK */
 		ret = loongson_i2s_enable_mclk(i2s);
-		if (ret < 0)
+		if (ret == -ETIMEDOUT)
 			dev_warn(dai->dev, "wait MCLK ready timeout\n");
+		else if (ret)
+			goto err;
 		break;
 	case SND_SOC_DAIFMT_BP_FP:
 		/* Enable MCLK */
 		ret = loongson_i2s_enable_mclk(i2s);
-		if (ret < 0)
+		if (ret == -ETIMEDOUT)
 			dev_warn(dai->dev, "wait MCLK ready timeout\n");
+		else if (ret)
+			goto err;
 
 		/* Enable master mode */
 		regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MASTER,
 				   I2S_CTRL_MASTER);
 
 		ret = loongson_i2s_enable_bclk(i2s);
-		if (ret < 0)
+		if (ret == -ETIMEDOUT)
 			dev_warn(dai->dev, "wait BCLK ready timeout\n");
+		else if (ret)
+			goto err;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err;
 	}
 
 	return 0;
+
+err:
+	regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MASTER, 0);
+	regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MCLK_EN, 0);
+	regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MSB, 0);
+
+	return ret;
 }
 
 static int loongson_i2s_dai_probe(struct snd_soc_dai *cpu_dai)
-- 
2.43.0

