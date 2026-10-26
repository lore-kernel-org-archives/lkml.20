Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013737;
	b=WSfaH+CrZqRqkgerlHn+/zUvAq6WttHtwrvy6Jqn5zukxBF+yLm/0BCpzg7SD/XYL/6T
	 26LKrPTqhK7eiBWvnvhNO0udBEjkB/1JGEF4r5mRi4flxmtpx3UhiKp4LCrmFkWFR03Nr
	 bJYyVzvLPaLQykGGfIKtJ5QZh4zNQPw3EUeqqt1BZuJXlyDwND/oDMMGpbKYvhKrrtPub
	 6Wsuuf1hgaIStY+cRRzE9U84nyI3VgvwqG5YKHhQtXjwx4P0ebPytpRXcwkEDknRCLmCk
	 BofxYq2W3cARsKfWBPX++L2YAFNj1gijTqQ9qpGk3MrPUX8NLcj+wlv/C6TgeJWQV7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ueFejEZrKtsOeSpK53EAFsxF9wHlmejap/cPAZ2o63c=;
	b=fyhXvU2mncEPKbrekL7KAlDMQ1yDQoHS4JtPtBk93o0rqJLHv/0mlstcIMt/0yywgPiy
	 9bOKkDzxgzL1dZHCRCct+TOS/uoV32uICrhTjCcSjPyN5uMvDaJFecMX1vkTohl+Q4G0M
	 enE2h99zI5XYUMH7qhJnIgw8C91pB5phCrEDV3eVIUpyy5LmqBwrIHmCKRsgehj4dkjrr
	 /XPs/YuN2P77h95ugCKFR/eZV/HxuPUBEBNNmq/XY8Xal3wbDm2T51Lhp8JnpGByb4jY5
	 ODDSSJJ0m5Yj+6HfQoqB0WlLU77KYzcEG/B4wF8v3gNyuKeo0DHv5Ee/fbrcDyRw8mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="K/ZCaCFn";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5713F60A2615
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5713F60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K/ZCaCFn
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so16386235e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013736; x=1793618536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ueFejEZrKtsOeSpK53EAFsxF9wHlmejap/cPAZ2o63c=;
        b=K/ZCaCFnHC+KWhwoXbaL/Nt4HC47qntoDJ8TPLIppmlu74hfqGjICbpN9pJevtvtAx
         eNQ2KlRzB7LneCU8dcIEi2Vop+9r3pTqlSt5L0irBquwocC8istdlOUSkA1EgxHpvsLd
         07csBCH7d24TWeJ5AKXE+H2GA96onSyRJRWmsPZB0cj5deeBHKm8TuOdRUvNXHtlDQPn
         k5uDJo3lDJnr8aEtQiFH6qMMsps1witAAs1evsF6VmAEGmmYYKgreb4q8mVc2RdNi+Ns
         TfYAWl3sK9pCB9glSowlPbUXkWkIZeblC76AJM++agE0iFg5c7m5qN9cuolsLNWKqabi
         SPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013736; x=1793618536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ueFejEZrKtsOeSpK53EAFsxF9wHlmejap/cPAZ2o63c=;
        b=immpApkUaNTfQGRV7Uqwr6SE2r2Pb11sM330fKagqE+IRa7FESFbEUWw3fjXIeWb9w
         aRfg3lKynAT/FWsL3JdIZRaKqqvuYpNzFdAnvKhdhwiAM4+xjhjez1S6GT6cv0TbjfjF
         cctWLAQryKiieSJjpBgnlTjQ2yB7nwVsIRFeiC/Is8C8UlD4B5m6pziykFJEcJNh92Yf
         2C5vlhiZf/pY8J0vXpX1qsVOJTwvj27AxV/l1M+3R7TQiQRbUjbIEDBvJFER8aD6z2aM
         HYurgmzwGctxVKp6vqLFtVnTc5XCxD6Ymp9Tjpdq4GzrgZMG3cJG4BxFkJlR2KxZR+Ov
         mVig==
X-Forwarded-Encrypted: i=1; AKwUvBy7mrNkirUDpxZ0TwUV+eHa6JcEOaW85ZzyYncYenvE3+yLLD7v633ME1QuSo3AIst5gnxO314vMhihBoM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJIraNcPnUjbPH361Ms4+r2gODYAguQf0nnIpL114h0ZmpRLB3
	X+CM8Do+CP6fl5BX28n4Cu/17qqfMc8urqgfW+wiHxzE8UZbxRMcYfk=
X-Gm-Gg: AYBFou1tyaYJ3oTwEt0MGKAqfvmbJC3bziDKV4HlVnnCG2IuIIVpLbLWB22DV8Wj+l3
	7aRCYhblx2VDW6/EFRO39n4gp5guemYH1CmP24t99Ow8/LiMTCVd0WSO93FSggHkutQxJ1gXg79
	xCk3UBx837FYzkGLHlGug4hQJkr9Pi7C3oHgY3Ez/XBMO0I6qBvv9kQju+cptIwlpo8hglXt+0h
	+87L+pdvznAJAeP/iB5ncoP2AvmzhW0ZoLZFkXCpxjgd+j8mGBzBHHRdWOfcGOWwbmOFLWqnwTv
	M4Mtz/8zP4mrJGsPGq2/N92j/Jqjxq67qV/VpcGrvYPkhE7SQM7G6XB+6TaUoI678ksMzPd/GEX
	vxkFnN3qSEqd54C4ZmvAgfWGqj7r9CQW3PktN5509110ggfQ0Tx7IOln3zAyJdF28iSemW8/DIs
	TFU3x0oNz4AHRc8TwSNqrlODfEkLmVZIKd8a1QqWE5YiSMFJtqrseC41RVb7+mLxm4T57VF/bDr
	wk7vO+R9LKlPMbPR9AgEqmp
X-Received: by 2002:a05:600c:870c:b0:4a5:4589:24e2 with SMTP id 5b1f17b1804b1-4a545892686mr70915305e9.7.1793013735596;
        Mon, 26 Oct 2026 04:22:15 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm129141265e9.0.2026.10.26.04.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:22:14 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jorge Eduardo Candelaria <jorge.candelaria@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 1/4] ASoC: rt5668: cancel pending delayed works on component remove
Date: Mon, 26 Oct 2026 11:22:09 +0000
Message-ID: <20261026112212.2519775-2-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026112212.2519775-1-tristmd@gmail.com>
References: <20261026112212.2519775-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

The rt5668 codec initializes two delayed works (jack_detect_work,
jd_check_work) but neither is cancelled during component removal.
If the card is unbound while these works are pending, they fire on
freed resources when snd_soc_jack_report() dereferences the cleared
card pointer.

Track successful IRQ acquisition with a flag so that disable_irq()
only quiesces a line this driver actually owns.  On component remove,
disable the IRQ to stop the handler from rescheduling work, then
drain both delayed works before resetting the codec.  On the next
component probe (card rebind), re-enable the IRQ to restore jack
detection.

Fixes: d59fb2856223 ("ASoC: rt5668: add rt5668B codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/rt5668.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 4154bad276101..01b14c62fde7f 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -62,6 +62,8 @@ struct rt5668_priv {
 	int pll_out;
 
 	int jack_type;
+	bool irq_acquired;
+	bool irq_disabled;
 };
 
 static const struct reg_default rt5668_reg[] = {
@@ -2213,6 +2215,12 @@ static int rt5668_set_bias_level(struct snd_soc_component *component,
 static int rt5668_probe(struct snd_soc_component *component)
 {
 	struct rt5668_priv *rt5668 = snd_soc_component_get_drvdata(component);
+	struct i2c_client *i2c = to_i2c_client(component->dev);
+
+	if (rt5668->irq_disabled) {
+		enable_irq(i2c->irq);
+		rt5668->irq_disabled = false;
+	}
 
 	rt5668->component = component;
 
@@ -2222,7 +2230,15 @@ static int rt5668_probe(struct snd_soc_component *component)
 static void rt5668_remove(struct snd_soc_component *component)
 {
 	struct rt5668_priv *rt5668 = snd_soc_component_get_drvdata(component);
+	struct i2c_client *i2c = to_i2c_client(component->dev);
 
+	if (rt5668->irq_acquired) {
+		disable_irq(i2c->irq);
+		rt5668->irq_disabled = true;
+	}
+
+	cancel_delayed_work_sync(&rt5668->jack_detect_work);
+	cancel_delayed_work_sync(&rt5668->jd_check_work);
 	rt5668_reset(rt5668->regmap);
 }
 
@@ -2531,7 +2547,9 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
 		ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
 			rt5668_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
 			| IRQF_ONESHOT, "rt5668", rt5668);
-		if (ret)
+		if (!ret)
+			rt5668->irq_acquired = true;
+		else
 			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
 
 	}
-- 
2.47.3

