Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304643;
	b=RC8gPehcUSp3e/oxCzS4nds21qiPSVBTSYtytjb+B+riORKsUaGbvnbDI9CaPf2hGj06
	 esnddOehQJTkrR38+HLIkskwYTInA4C1HcGUCX+TdsFKtCayeTSxj3PW0U3h8lzcl1ziR
	 LVLmMAedYfAENqmYvkr0b0bwkDjxqd4hhTTGiyw+1qVu1jlPg8OJHzKg2a1RrKoF+MaLs
	 e5SdkFGoKoPrBNhD14WreSLpy5sdP4u9NFAnsq6+oGuHvzomKERahXMQw3fgO0oF47thk
	 M9gS+tz54vjARhLzwnkgSTN74E7J/GxgXAN48cky8mDaJf6KTgvQw/xQ+T9gSYT2MRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+Prg47iXD919tYCgVMOQ6+zwqLgIY/fyOVcPOF91tfY=;
	b=k5GvWTezV3oEGNs5m410c4SDAlNywKYlQ3JQ5KXykwviO5Az3+BrpEy/jORK1/g9RyXf
	 V3FqDqTXVoBUqT5Vfj1fdehQFRDFYXTX9UV/JJgIKJ0R72L2FrxLvl7SNEUbGF0IJUyiF
	 ZANp3Tq6LeOvnjB73zwuAQ0ibN/shyntX/qlCBsa0Ru9yPUUdvQBSX/azAhCMgI9yTUaH
	 yUIJOED98KNb32WOL+ZhzSnLk+Cqt6GEY+raNBqwFhYnWUzvVdAqdMPFTP8H8yfXuogRf
	 rS3Pk/0AJfHCcIZulLm8qEKIxpU3s57HcB8Fo9EPlTDCM7d+y22c9bSwlHNLCz93vsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edWE7KND;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA818606A926
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA818606A926
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edWE7KND
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15dd124bbe7so2174022c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304642; x=1794909442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Prg47iXD919tYCgVMOQ6+zwqLgIY/fyOVcPOF91tfY=;
        b=edWE7KND3B6QGpko8/W3B9RsuOX87YlGKLwatgFylw5xfU5EF65tCuzv+vSR7zFL64
         MsJEknrCUvoSDPYFS+c3uSG7f4PsAIR5FgsYbAkM38I73UOfpfh8nULxehU+UbUECFXy
         Xd5maBC5kbjrKUpIG3q3ZpQ1aLVr0mPlqv7HTDow/w3nHstjV2JgribRIuo+QCjHPq/i
         XDzGhM9kuIaKc1Bfq7+4hjrQKwUKZ9aMoUnYCcNWzGbdM1dMT5i2xNdMMlKYIjACFGI+
         7eIS796E9IqwMCkc6Zt6uid/AzoLM4tdF39bDdl11oBRqJpV7m/urWs2D1ShzFHovfgE
         Ba5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304642; x=1794909442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Prg47iXD919tYCgVMOQ6+zwqLgIY/fyOVcPOF91tfY=;
        b=MvVlLNgipsU6o944TUOB+aWlj11xD3nafBCJ8CLNH9BPymf3zihYrgrQHijmsM/hth
         Mz+yYHAcWazD7clvuHPfts5oB0r4osbDhSVMrls5+48d7jYxIAp/oUoUZltjkuyEiS4a
         Oub+4HNpkZLtpv1t8F6UB24Nnl9Slh1KxMkxQ+TOL0D7+1DizwY9OYR2FSr02qK98Kar
         bo/j8CayHKoOhQoobyJ9QVCjNDqQK6fNO09BZSRF4FYJzTMvCuNG+NNWEQFkWqIfUXPp
         espQj6Ax1BxhRorRGSqSBDm1TOTcI7P+hByoR0z30Jd4NMlPV7JA+XgeK7wlJbbhnhZ2
         VcuA==
X-Forwarded-Encrypted: i=1; AL+hErFuSzO6aPgrN8RTwGa+UnWf4Wet8qI9WHK7n9soy1j/nXtCH8O2ALJKA96hZwfTjKlsZHN/Cqa/KFQIHo4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U3SlFJDvBDf4hPjTdjWnc6b2sTFT7AJUNLSA5a14uDuu9KZXX
	fTsaxhG97LFWBjmRwR8P3Kwcw11jBzmYZshk0NmxhxQuGflNrbdEThf5
X-Gm-Gg: AYBFou1F/X/ss2WWG2h0WJ6SKvIjxre+GJzQ8ii9xnUVU0yQaAMtJMSi8M8djcW3l2w
	FqCnDnDGUj8123o3V4CE43iad9fTvn0UchggSYPZJr7UV1cJCC1NATBFfktPCbsj9hNP3sjVcF0
	qY27LIsTpv6Sm84eth+woo7vQgSrQJvDI5gi9zKK1kU7XBh3q2A0xzo4HFT5Eh3pm4CY5Th34sz
	taBFHdb4bTamZU831hGJAExqD3ICxLd8OBOy3AUzEk0/Df0LOllrePo8JtQeYWaYq4WupfTMZJg
	4922jL7M6eLUoLcUPyhmF/qsZkg2Rq5SMrGZ7HOxXc1Ce7pB33xi+yHirCypnX/MrmiEDi+l4rt
	Y3TB2x0uphcALVtPIpl6cimdDd5WJdmEaV2fqz8O6yrazAS3vbDnjSMrqwk7XXTLaIhFtFUHpG4
	CSGli1ky69gBX7yWABFM6qdIxDaNRgS3ubYYOK0rc3/tYgXB7VT1FFvCQIMMHGlJPgOLNzf1sHu
	kDRPVzH3bHjAN1BQpQ7Z2C5UptxqaCDvjTSFuzJ2A/9JWJH6TUN0UHnkzEEPnPl0vWUh/OwlG51
	T85tCk8Ho9udGDM1gclxyQpeBLPZPlWi1LGT4EVylGVVL1taowbdDWr6GpII9l/91BhDH04Ffef
	hAHXwr6nWeYYzNVVip/HE4gWppi+XNAskb8Aj5PdRwJSM
X-Received: by 2002:a05:701b:291b:b0:13e:5a50:1e17 with SMTP id a92af1059eb24-1b3b5fa8f4amr2584323c88.3.1794304641806;
        Tue, 10 Nov 2026 01:57:21 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b75d42sm5203801c88.20.2026.11.10.01.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:57:21 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 6/6] ASoC: dwc: Remove redundant error messages
Date: Tue, 10 Nov 2026 16:55:25 +0700
Message-ID: <20261110095525.504660-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110095525.504660-1-phucduc.bui@gmail.com>
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
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

The underlying functions already report these errors deeper in
the call chain, making the additional dev_err_probe() and
dev_err() calls unnecessary.

Also fix the indentation of the affected code and correct a typo
in the DAI format error message.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add the indentation and typo fixes to this commit.

 sound/soc/dwc/dwc-i2s.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 0d2be2d8d31a..d09cf1cd07f4 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -331,7 +331,7 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
 			}
 		} else {
 			u32 bitclk = config->sample_rate *
-					config->data_width * 2;
+				     config->data_width * 2;
 			if (dev->tdm_slots)
 				bitclk = config->sample_rate *
 					 config->data_width * dev->tdm_slots;
@@ -417,7 +417,7 @@ static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 		dev->frame_offset = 0;
 		break;
 	default:
-		dev_err(dev->dev, "DAI format unsupported");
+		dev_err(dev->dev, "DAI format unsupported\n");
 		return -EINVAL;
 	}
 
@@ -752,7 +752,7 @@ static int jh7110_i2s_crg_master_init(struct dw_i2s_dev *dev)
 
 	ret = clk_bulk_get(dev->dev, ARRAY_SIZE(clks), clks);
 	if (ret)
-		return dev_err_probe(dev->dev, ret, "failed to get i2s clocks\n");
+		return ret;
 
 	mclk = clks[0].clk;
 	mclk_ext = clks[1].clk;
@@ -830,7 +830,7 @@ static int jh7110_i2s_crg_slave_init(struct dw_i2s_dev *dev)
 
 	ret = clk_bulk_get(dev->dev, ARRAY_SIZE(clks), clks);
 	if (ret)
-		return dev_err_probe(dev->dev, ret, "failed to get i2s clocks\n");
+		return ret;
 
 	mclk = clks[0].clk;
 	mclk_ext = clks[1].clk;
@@ -966,10 +966,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	if (irq > 0) {
 		ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
 				pdev->name, dev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to request irq\n");
+		if (ret < 0)
 			goto err_assert_reset;
-		}
 	}
 
 	dev->i2s_reg_comp1 = I2S_COMP_PARAM_1;
@@ -1010,10 +1008,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, dev);
 	ret = devm_snd_soc_register_component(&pdev->dev, &dw_i2s_component,
 					 dw_i2s_dai, 1);
-	if (ret != 0) {
-		dev_err(&pdev->dev, "not able to register dai\n");
+	if (ret)
 		goto err_assert_reset;
-	}
 
 	if (!pdata || dev->is_jh7110) {
 		if (irq >= 0) {
-- 
2.43.0

