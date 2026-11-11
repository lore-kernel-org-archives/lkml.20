Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364129;
	b=c8gsrWG8JYVm3Z1Hr2Awa7OuItiflz6fULbH4GzgfkpYDvgib+qLbPfkpSTj/BKI04jl
	 /l/ogaDKaeen1P8DZd8fX17DwAHasqtNz5D9UEd3Oe64QKTsj3YxPGkix6XwiJMaMCBUA
	 jc6/dFhsS7wNiYfzPQrNmEUMtYaBNjO+075K/9hUKUS1uBCy9E2DLJGNAHjH1iuQzpY7t
	 tg/UNWJJUJbkNx/519vC82iw/0qWinlzC0OmuhYoJU7Y3KqMJhgPQEN7gBZMIqjUdtu3h
	 LMPcDLG0dXaJEA5ZF8Z0HbWdkXZzKIsZoiE/Fw2v4WHRoHw4KmA71BGEt2uVty7lNcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ep0tEvCtZO5eEY5qcruxpg/MqMxSezdFJKxvhcjiEIM=;
	b=ZWxO2kUXsBqvBdvPu7Iu1gM3DkyjytnJUFr4uchuRXV4j1WFkU1KB5lJ7ZvGB2bdzCVj
	 aZEShkQskQ17uNSuz9BkWK30EykqzHmG9NtlwHFIIG0cKQi+YVBigJ+JRvlWD4j/ULMPU
	 drO/G+6wWqgnuB6s2PL0zUzhUBI7SosIiFR0besOKw2NWhuea7TBXbfYsCjLBKXkE5vw1
	 ESZB2jj1J60hHG+htf7HbzPqwNryOSW11p6rrsUisT795Y+uwkBOY1znw4wqXS9cw5Ljo
	 u8bQIDvJtpN1zzeGjpi9KescSV4xcQE323whmI5f0zNmdK8Pr+HwbWCYzWyByGwBREg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LtICmUkN;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F71606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83F71606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LtICmUkN
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36dbde64409so5641488eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364129; x=1794968929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ep0tEvCtZO5eEY5qcruxpg/MqMxSezdFJKxvhcjiEIM=;
        b=LtICmUkNQAnZAIXPMI7szx/lFOqwm+0CzhAVmu0wD7qN8HRBU6jkjqUF71iHCg6HEr
         IXWWrgjAutTLZingpHwe3vL+S/5W5/cIvA9UyPbB4ak0ZoUNr+Lf1AOSPIG6faEZ7AQJ
         Np0DUKG70ICah7uSCo6bLnjF3buY2f7UBg4tN/jP3xO52XhG+AUhvuJQMyHyLt1jy8fG
         c7Hb9xc2oZeZ6pzYVnQZpJySK9e8mEYPcvulAa5wDxG1nB3xkmEs0olCh6+1dQYIHh5i
         swI/XjCOH4s/UFvGVjFfusi1U0GJApHqgocMjMMKVWfR7iYaQ2oL7KjMUXYr7RQ+NGvu
         I0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364129; x=1794968929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ep0tEvCtZO5eEY5qcruxpg/MqMxSezdFJKxvhcjiEIM=;
        b=IOERfQTb9UNbfCCVGZ0AcIZ6oL1D8KTgQIsJEp6BwfTFpxuNmtNol+pjKCTp/nWt4t
         +sFC2dDkLlp+pekyQLpF4p0YWn3xF+xGS3eH7QS3dvFnUVTdsLgDqtQ3gmrQey6kfafy
         yDwTxQFotztfMAyTVOiFe4Br4gvMb37MQ11InDxyN46l81jKfJ53PiSrhGDPp/HZw4TO
         gJcu+P574jCDSjheM2O0gr5zKeXylk9qRpTyWj/9IYP4Ynristj82gt6Px0w2RA4aqph
         rRfQrvFgZMYyDMsKFka47GocHpUniJQw7SG+4oBGzdLX7vip7HQ35/fvgz8GoAjevye+
         jtlQ==
X-Forwarded-Encrypted: i=1; AL+hErFDiJOjWedCQkgLYFCs7xksA870y2QC00rm22PO2nqvYA4OajuRNshjQNgoNpnTMzDbmvCbdaI3Sjfz6Ww=@vger.kernel.org
X-Gm-Message-State: APuU4Z92E/Frj8GSkej3EIhcXkLwu+63g7Lt5p+8ZiUxd/0lmzoAywDd
	7qcDJm4wjsGuA1xc3fNQbtfEeRW9cjsIyGBzQPSQ0+nQvJMl1Mcha3oj
X-Gm-Gg: AYBFou04Tkk0v1ps47/g6iBK4lrLqjtSDF9k43cF/Ut7X+2oIW0B1qNABlkGDld7tru
	GNvL8oKqE6STQi47TeQcifK5idk0vwf9w+0FhfmNtf8EpeATGrZxJ09Ylr0IMuKfBvoMHdpWjj1
	Ch5f8nPbBSX3LmilP0FN8klDN7DnWmoyEYKOtCwH4bc2HCf2XK+FOw2I4taxuVz4j8GJ7Cuncbs
	Y/rs7SWcSzCiBVNE2Qned9wcr+OmuY2X/ahMwsee5NWAx5BN3xkul8jUFNnbZERVdArxFZes70J
	ZIvOAHWbeTp4zKOrEtqlq6FClbXo6glrJn7V19MIzE4PIcgfyeu+YEfrPaK1S0l6w9dCr0zO5ZY
	kHRNuzbDpx1AOKbtLUh2Ww4j7UDntezStEcr/vlQFdVLfuhB33wT8ePLg0tpF9t+nfHRp/gJpvo
	TndBDEa9pyRwldvyC88Rudh5rR+qM9yA782gArBMsdZCFMTQvHpFGjOTFuusqnqjnzJSHYLMtT2
	h0hr0BzqjILG+/1Umy7RBF1WO9gJCOdaqHSj7vDvNOra/bnBmbwe4MiqCtAwjLjFzXPTk8Dc7Zy
	WIn2diEa3gO6lyylH9CgAbCimkhZwL+cvuDiDzQ4HmG5WctfRVuY+YQl7wzebciGpZV5Mb1T2dT
	p+cJydipyn1jeJYtXz+KdRtKdY9+yXMdpGIekVTxxM6+eHA==
X-Received: by 2002:a05:701a:8148:20b0:194:f017:5a01 with SMTP id a92af1059eb24-1b3c039e744mr1031438c88.42.1794364128579;
        Tue, 10 Nov 2026 18:28:48 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm10054285c88.14.2026.11.10.18.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:48 -0800 (PST)
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
Subject: [PATCH v3 6/6] ASoC: dwc: Remove redundant error messages
Date: Wed, 11 Nov 2026 09:27:31 +0700
Message-ID: <20261111022731.8243-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111022731.8243-1-phucduc.bui@gmail.com>
References: <20261111022731.8243-1-phucduc.bui@gmail.com>
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
index 55a5dca7b79f..8144a5843062 100644
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
@@ -968,10 +968,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
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
@@ -1012,10 +1010,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
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

