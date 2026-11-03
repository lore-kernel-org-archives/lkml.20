Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691672;
	b=FDIP5lQIZROepDG6P6TTEXTOojQfqk9wkccBUBfJrNxD6kplBMjtTCubMrwFxQimXmIe
	 JxSODRa3wuvzKCzQI1y7lexH3PojiJDGTwQ8zUk+7Vqdb8Nb0WSaCAouk3cprI9emqwfq
	 lC7xUOgDoi7JS+X8i8e4bzAHV4yZgW63sP/IPBULBzvuuA8dr6jB+4MwoaRsjh77H3Cy+
	 pGsXR+amoHMbXnAJpgLmavDnTSTSpshx8U2p60qzHeYVNR1O8gvmysm30GwPtjmOXNNfp
	 bqx1hcVcnXfkumVc2noK/XEG9Wrl76SEq3NDjcZysCXrx3j/m3txDXxUf3B5KaEqWCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZzVZd7Sd5nTndrVxkEAfFRXwZl3Unz5GPtpn9y+HXD0=;
	b=3lji/P1bzyKwaBCPDSA+iNN7HxP+GA1JpFheQhIeqZ7qqoE1LL9QQ1aRBKxz2wim56JB
	 H3iqYuzRhxefqfdNLTO0tJxXWymuifc2UZNnbqh/HGdWMe0znJcIGIb7bOwMjUg7oYmzN
	 TkGBJ4TPXJSgeQZPgsr0+2eG8/BLWj+VRqrAQjpY64I1BcEn8bIdkssFrUEHUwx33c8Hx
	 glmxcjy8+Jj2UHRSCMyZM3MwDwK8vAlXPfJW/Yi3nkVqh1ZTW6zAqbXRIoAttALKDQF+y
	 avjEi8mbSlbUwVyf9At0cMnPHdTk/NyBxLQOZph53XlpRXfT52SWXAMlID1YDxrdgQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZqlL7Br;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57337606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57337606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZqlL7Br
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso1723299a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691671; x=1794296471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzVZd7Sd5nTndrVxkEAfFRXwZl3Unz5GPtpn9y+HXD0=;
        b=GZqlL7BrWlZyuXUeUESSneSvR59/v7EsOw+HT2GDB044L9f00feUe8TGORYlP2WxGJ
         Ks8SwuUUYI2dgxH+W4OfFZSQlm2kYh//77BVnQgBOkl6hfOP0ufUo+zw1Rz/7SDYl8kp
         PPG0VP6h1bbRSF+QglgfG/d1tocj2mKisThgCJZdlLezhdCwhDnC3mh6jEIMjw9HSWlH
         Eqx3PAYC072wmpf6jDaxW+1J/w94Cncz8znFiIlRqiKjJIkGxztqY+CHi+GxfitubNCS
         SucMQxLtit23/W9+3fIg9d45CR4yJjwvlTjy/PtUzyWu+9UsU4Z3jYSkgZodC/HSjgfS
         XBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691671; x=1794296471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzVZd7Sd5nTndrVxkEAfFRXwZl3Unz5GPtpn9y+HXD0=;
        b=gAeosRLwKHqUsxD9Y3IT+Vatl6VaZnOs1Iy3/Wfa6eyOgWl/L9lO+iszeN2LNM6vQe
         rUe3eHcDhb8ckmDxOLmiJhBISQKLedsQH1g2B1lo9OIUnNwX4SOx7rIPAjsAgGBY2aQg
         DjnzhdJHsVq+KGLE4bRMZcAgHdKxy1FkNEve02e/OkiYfRJoQaBhkQr+xzDLo6ZOlb5v
         7Z1qheGJ1IJpwZa/lCNMz+b543UC7A/Py+Z2O38gc5wmD70lkZiTcR81teEpHiNh7aOS
         5dxmL8rV9Ret346ZKSkcA+JvOa836b/srOKqxkrUrqnwsHZ59gNf7sOMa1HXjftbqPy/
         0DYQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/CkNhT+dSGlftlYNdFSc8HEnXtkcs22VDQ+hJmziPNrVodylM7e5Wb+1lXRkxH9yt8XeX86a717vxZhk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3lAV9RtSs8HT7zTBeoA8+ZWfPAv/fK7J+MPfq6cAzGfYa7hx1
	lSrVr6GXEgcvKtL6I7TzEAdFBbQaaun2HtKy96WIKESNk6FrmzgHGcnq
X-Gm-Gg: AYBFou3xmLnRdl4hp0qjuCOUFhpLqyl+GyVZZSqL84XmRUCktmG/OutaWjhzvlEDtpH
	zovEWF6wQGA6fpHItCAGH1SLA+BH1Gb9ln8VA703lbq0JFT8sc5akn1wnTpcqPj/XNAOBfMn/kd
	aYNGa3z9/sPLgp9C9UQPvMiWRVLaO6YODBAZqIMLG/sRdDvcm93kg1W/7sFMrQWuVUEjAmA28TJ
	G9YxrZVzvoYVXPtTq90vkFvwiI9saJ+qPtslJ7QePQQ1vO1VoM0ueLjlxEIVbC6q+1F7fJCW92g
	4O1Vq52zw1ioEKoLM/wHzmzAGPCUWc5IoXtqSmjRf4zipO4g8ZLSNfkme13MCcYrr/nUgC0xexu
	O4G7y9IsG7e5Qv/epfmdU8avrc6Da0rbLNOA21cC2CVXq2FprsrwgZ7NbVOsYq4M/gyzFVh8Qmn
	0ESTB4qz5Aq8GQx4J6dQR5mJeBwIpVXHa4Y7X+43SqPzPx5VFq2uGN5OfQAUFDMC4GXloHBeXKA
	MUGf3O3QvKWjQOcmXy2C2zjhT6tSZrV5KLD7UyLCTTg/8w7Xchb0HwvAx2xfGfjxgajjMNbPZeF
	mA5aeLGOJbW3w3TFe8Mh+XeXSzAzUm1k8oDqDgLJFUMJydd72YLCMRRy+imbqyNc9qKbulGI8Wx
	ri12jRllr+OLkas7QlP0klN5m3P3TrhvRt6ywt33h3eGbocrx/CyC0l1FlOcUeTZRMJJhjc2+4C
	iCmgk=
X-Received: by 2002:a17:90b:1c07:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3ae897c9501mr9764839a91.19.1793691670795;
        Mon, 02 Nov 2026 23:41:10 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:10 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:55 +1000
Subject: [PATCH v4 07/22] ASoC: card: Let 'fixup_controls' return errors
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-7-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3703;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2OZVyHzqzH+8PcXoAdYlRjbU/QYAqY/WFwuuw7hvh0s=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88dv6PWURB1okEw5aSq8G7Wic51S16aXTmtcOFTt
 eLLV2z3OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFMdvpPhf2bIkuV7z5n6rp6tmH227+eD7Ie9ojtd1veKTHyVlxhwSZvhf+iWG13
 LWxZ/3KeeNcnGfUeJ1OWZzZXCR3bNaWVlULpzkA8A
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Let the 'fixup_controls' card method return error values which will roll
back the half-done binding of the card.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-card.h                  |  2 +-
 include/sound/soc.h                       |  2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c |  4 +++-
 sound/soc/soc-card.c                      | 12 +++++++++---
 sound/soc/soc-core.c                      |  5 ++++-
 5 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index 1f1e7d45f553..c392e6c4844b 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -44,7 +44,7 @@ int snd_soc_card_resume_post(struct snd_soc_card *card);
 
 int snd_soc_card_probe(struct snd_soc_card *card);
 int snd_soc_card_late_probe(struct snd_soc_card *card);
-void snd_soc_card_fixup_controls(struct snd_soc_card *card);
+int snd_soc_card_fixup_controls(struct snd_soc_card *card);
 int snd_soc_card_remove(struct snd_soc_card *card);
 
 void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *preifx);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index c77119f92dd3..771234028fd1 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -992,7 +992,7 @@ struct snd_soc_card {
 
 	int (*probe)(struct snd_soc_card *card);
 	int (*late_probe)(struct snd_soc_card *card);
-	void (*fixup_controls)(struct snd_soc_card *card);
+	int (*fixup_controls)(struct snd_soc_card *card);
 	int (*remove)(struct snd_soc_card *card);
 
 	/* the pre and post PM functions are used to do any PM work before and
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index f07aeb637108..f93e830ef4a6 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1283,7 +1283,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	},
 };
 
-static void mt8188_fixup_controls(struct snd_soc_card *card)
+static int mt8188_fixup_controls(struct snd_soc_card *card)
 {
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
@@ -1305,6 +1305,8 @@ static void mt8188_fixup_controls(struct snd_soc_card *card)
 		else
 			dev_warn(card->dev, "Cannot find ctl : Headphone Switch\n");
 	}
+
+	return 0;
 }
 
 static struct snd_soc_card mt8188_mt6359_soc_card = {
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 282d666dae9e..e4d81329cde3 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -184,10 +184,16 @@ int snd_soc_card_late_probe(struct snd_soc_card *card)
 	return 0;
 }
 
-void snd_soc_card_fixup_controls(struct snd_soc_card *card)
+int snd_soc_card_fixup_controls(struct snd_soc_card *card)
 {
-	if (card->fixup_controls)
-		card->fixup_controls(card);
+	if (card->fixup_controls) {
+		int ret = card->fixup_controls(card);
+
+		if (ret < 0)
+			return soc_card_ret(card, ret);
+	}
+
+	return 0;
 }
 
 int snd_soc_card_remove(struct snd_soc_card *card)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f33bece378b6..d4743d68deb6 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1845,7 +1845,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		if (ret < 0)
 			goto probe_end;
 	}
-	snd_soc_card_fixup_controls(card);
+
+	ret = snd_soc_card_fixup_controls(card);
+	if (ret < 0)
+		goto probe_end;
 
 	ret = snd_card_register(card->snd_card);
 	if (ret < 0) {

-- 
2.56.0

