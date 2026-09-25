Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EF03C5857
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311837; cv=none; b=pRogCoYbOUBJ3KVhXZFEM0BgtwDgk8Tcb70B02jIMnZSB1GGhx9GWmC+jFDwILq7++uoJiiie5TwUGKGwani9uaEb8elhTFMLwww4CVPIadgaQcAlUqtIMPlc57yJsRsZRX5B2cEOXM89iem3JmPseX2Ddtc2J/zD+pWMZLCVGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311837; c=relaxed/simple;
	bh=fMdH2xjhZ8APiCyIap+VJT8agwXNMjNGO0L5Q3aG5e4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6X1ipupX1/DcvM7WPoVJ8BLEA8IAnGT40dvB2Fq8K3bgauWfihkW9wJ169xvKyjwaQzKsqku8KeFQcLCJtH3apLlMJfOjhTtvNKKN0UGg5iI/KlZAk9JM4ZH7yZmrU/SuRJ2/6S5ykAWOm8N9adLoxDOD7D+ogWeRjzNMdoVBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzW3ucCi; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzW3ucCi"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so150945a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311834; x=1790916634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u5cOpKUrfnSjz/MBJQnHunIOTLFWIe1DjKdr4y4mBIY=;
        b=bzW3ucCijN43ZXsKqTGlG9mx0Ci+PYV/oaey6aj1TZJcu/u8cWJBZPQe80AayZcQPH
         KE8n8Inm9NuHTtnbit7+a0qgWJ1EvVySJBl4ZGXlCO6CGmaYvec1JAevCyW/fXBIZMQh
         cfIirHU8XISJgkXS+JI94kGdMLJkC/eLWJ+j0PQ2GXo7s4ved/jGmWcBcfzn2mYeiRWn
         +bffArEHCrXYHwtXymoeY+f0hVdDwvcAZbgyyo8uUQl0EN/VF5tkm+1Ccu6vzVgKLBHc
         UpQDhy/ajizNC+eGOwARf5EJOQsbeBAWM4IFJhXmuZ1pF+GOTcRZjTeseC5Gg/sshrLU
         LpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311834; x=1790916634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u5cOpKUrfnSjz/MBJQnHunIOTLFWIe1DjKdr4y4mBIY=;
        b=tX6YGCF5cQeShwS6EfHh7OZm1vAPRW74UNuNwBC0sDtvZYL9S6Aiq3OdNUNJjPVuPi
         NrjKc4tMWzEloiUfQ3LCKvUcqbiuhLOpxLjJ+pciUFWsnwBgPDD9QF+MvQwlvvRXiQzW
         BIy1hYNuO0nXm/F+p+ppkw4yXP9qsTSQZiH8nDp7Ponpi1xcyGSOhiupRIW1JW+DdoWO
         iEVj9LK1vuZ5Mm7fGODWc9EE58Iun7egy6W/UTbZnbWZgR223tOlzbpmn4e16ejkSIB2
         jt7TDTUv/Nm0eOyFEKBiHs0mTWwhgCSd/mY6UC4mJXL9mw937OKURzqKWYZapUu7ow+y
         UrEA==
X-Forwarded-Encrypted: i=1; AKwUvBz/Z3TdX6dKqiu7VvZtQUdyIYrrJrR7+kj6kLnYQW4hpuPmHMnb1QJPZVIi85tl9iPlK3JEjmEiVAHvcgE=@vger.kernel.org
X-Gm-Message-State: AFuF++meknTEedKFFHQQpTLlxuWxdai/eUIB/Pc5gALyaCDT5X79I2uh
	Yuhtsy2NqgGBk41cCLoPh/CqPj5KYd7BaWTextY4SLwXHzauJ66hCMft
X-Gm-Gg: AYBFou3a2idLgv9s48ZywaLQmq2gEE/GMxfcr6143GPLV6slctVoOdiYYDgS0Hsd30K
	i6K6lJM5kllqSmAcIisr2i9bT5YvSE1142J81ZFA6K/MfL7DKHkTRcrzIJPorZX1oe1T7GlebEV
	YiwcmS5h7LmiTsQg076s5g/yc5teGs9ibjFisjv+f8RQbRE4Pkg3Qt7r7XKHNCCdmwmrAfmS4g8
	TFTbacRjeidUGjAHzL3DjaVZMmD1jWIcTUXAknC6d9jnezuzjL14wuhqdPfKrxeoA5z+yOajZ9n
	aMxOyBkL0IM0LQivpgMFkNeA3ZYy/IG1hDXKnQnX4LDdqDyt4bsEjGcGyPepHIyGLGCiyytNLTo
	TDoH/i6gZXBDHIDzZPZwJKMve6qTXGWh3yo+KrFIcH0UMXZlDMMj+PFLgAUn2fnAScOFQNbDNCC
	z8Q8dKz/uy6GV1QTC4rw80Cz5h4EpSEL+XBqgrTrzsLrj9VTXnnO9D1y4KazjhO9+1LtfUp7LTa
	5vp62//ccG8HSLYoRQTjjzaHXT1cdaNjnV0TWWT26VWyBu8oQr6sinWJkFTLqBmrEL4Q1M0V1kW
	YQ/qEPIjErD30w==
X-Received: by 2002:a17:90b:3b51:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3a0b31224ebmr1565733a91.23.1790311834493;
        Thu, 24 Sep 2026 21:50:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 09/14] ASoC: mediatek: mt8195: Propagate IRQ lookup errors
Date: Fri, 25 Sep 2026 11:49:03 +0700
Message-ID: <20260925044908.450775-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate the error returned by platform_get_irq() instead of
replacing it with -ENXIO.

This preserves errors such as -EPROBE_DEFER for proper handling
by the caller.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index b8c3636cb64a..057f116645c6 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3125,7 +3125,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return -ENXIO;
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-- 
2.43.0

