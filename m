Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405242;
	b=cBaNxelHL4P43TkgCgdrUawJ8RKr5RoxlWLj9dtJKH8kuX3i4DuEL4jeneIsxQfFSf7Z
	 Nrav2Kn4+QugYt1cBqIFjPf77tIwPrC2cuB3H6iqgGlzP/6pC4gzjJknxSkR/Dz/rGrXU
	 rsux+y84dLUgloSV6Jj6jyqSc0iuEMU/v5ZFRpMlu3zSj2OaaoHbZ3yciitu/tSzDUZ7s
	 EY4LbAuzHmwSiFAYCsnP5RkLh1zdS/Hk1d19or3Et1MgRlVqOtTGwcuG637EayRc19jeL
	 rdkMpM7Aymq8AOGJeD0egv6CU5t8j1tqoUAPD3Pp37E4wJc5h1y4AZbVUMbYOpixzwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
	b=JZnnK1GGWFN0uLatvf++BR1GTf3n4iVctswm4JTVKjj0899C79+t0rUinoSNkYhL2GCA
	 j7PKTKJztgrQd2X91wvPasMR7ZRI8nnJKCZXco0yTEOhJ14tCiNBM6Qg1uQRLJLxJc2DJ
	 ota04JQLnter9BfHvn562eQLQ3xCxiO+xD1r9gJFJ+DTidhCW5tkH/I2GWC+2l/Tf7gTV
	 ibdxQ7MTfBwastbyQFtr+Ub4YWLOKDvX68v8Oh/RsUNxDL+kWMxwAnDPfrkC1U1OEG6Ns
	 3ocKeAsJIzn1jJXJysLUVnEA7NOUy4aq2xz6cLtoUuCDoMNGQwn3ADVztW9JMH+gQjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JLYlk39A;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1306D606A891
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1306D606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JLYlk39A
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7d2ee9e7093so1004907137.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794405241; x=1795010041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=JLYlk39A+LWuJ5c5BVu06EQUramJHojKBYOzACSa9v7IUaad883H39T5vT3jdiazuT
         FsPEWbTjY7gL1CFEyrDa6RMVWReweb9MskpIwhEPt4w9RDlJZ4CcsERLdkhK/UkNBDB3
         3vbsBgdIMlCPHxoKs7vfOpAoq/UivQAS0sq24NfxMo6EjmAOLLafZkQJ/aJyrPRTHV9D
         bKRz76RDqXhmHZAFBmuKNIJbpxfoTbwVp0jpAii7eOAyg4SB2KnbUc4LkNmTp6EDRg9l
         1Zw9ZQCD+42M+CsTwbOadDOwjpItO3mjJirfzyF32jWE5eoJFAZRW4f+Nk95IyK+6X7u
         L1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405241; x=1795010041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=2diIx72M5q5EvtCwjCuFICMCbbe00EraxmIO+xQoE0nkDgZPkDRtZu45s8nw7UNwal
         Uz+cJPOHZp+viDzYQ0TVT2j3nyFco50UGt67XlayhWcuqd/KIImV19nzFvQoCKQTWwjV
         wQF5l2K1B+GF4YVu9s/nsamQs44rNzpwrNXgEMkctL6Y+a0aNM5wxDhY5HMlcDB35uqb
         u/dOoxVltQIXoSNdfaCkHybv2yIk+yDTXwnSjmNOIGrkFvD6oYX/l0lNqpnMrLV3vPpI
         4M3znBO3yIc2eIaDXISf2ko9XUSNwUfBhcA44hWaWl6H/GQuLgCgtz9ZbzTy8J/A6PXN
         XWVw==
X-Forwarded-Encrypted: i=1; AL+hErGPr/wTRAN4oZb6CTYA0We4xBQVtg96jZeHtRtN0R3wwgTcPdQbSbuhgChCbXatJEnJ/h0KNQUiS1KsKc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EzKJHsFxksXM6XXgmanPYj+Il9cipMSpfSg69ihJq7G784Rnt
	+XJfE0FvbUBaw6yzEdB/Cl12AGJB6j8jVoBAHawWYsRg+DqYhVqc/B6iVLAHfCHRSnI=
X-Gm-Gg: AYBFou1dNvNXuWxgtvDFY4twmKtvJrJsNynIkp/Dktdqh7mgqiTg5hkpUqQNzr00K0U
	tDMg4N7S7NZMCobs3S0vVirEGUz3vM3LeTM0QthZY5ITxP0FV5qTuBxaecbjskNXg2XX0LBaSEj
	DDqyLisxefmYG8ZaFQBLbyO67Nh1IKrAvnN7Xe1BbdEOO+pW58e3/2OAJT65TMx5OZXnRRDwjie
	5iA7hL7OOWZUIZ9Qxbf+yK6FfW8ho81cqVs32J8QH8F7cGmhW5NJxOhRp7oG4Mbf4/f0xy89gR3
	ddn69r8AH98J7gv34RaC88N4pNiDsC8TRd3dw+hwB3FOr011xE6k+/UbebZLpTDGeQkw7468t3i
	u2ua7+S5zsmz2FZ0VIkh+Pxy6kWQY9cCsjINRcSFeqj5IunhadXqb3FlzkP1tycz/JcLm8/UMyu
	XTDm2KDMNXRN12w14oXiE+E4sjGHmA1W2gCtcB1sRkjD2SsHIbL9IwXbSacY49PBVZfV2vmPnmR
	IDQQ0Xu9H7+VufADXnF8PwGwV/uyTKTxNhD2m1AonmVnq2ALjIhMpd43cRjEjDeae3cGUIdfz6W
	aYOf+Osc3x8XyTr9LLr7ga68TFu6j5NrMqNCixoZ7C8CZS0s6LnfAF7QHhtcWoftDJBCCcpn0AF
	pct4y
X-Received: by 2002:a05:6102:2928:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7d5060b5d1bmr601415137.14.1794405240958;
        Wed, 11 Nov 2026 05:54:00 -0800 (PST)
Received: from localhost.localdomain ([104.28.212.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d62241eca6sm786932137.11.2026.11.11.05.53.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 05:54:00 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] media: qcom: camss: do not fail CSID power up without a matching VFE
Date: Wed, 11 Nov 2026 10:53:38 -0300
Message-Id: <20261111135338.27008-5-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
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

csid_set_power() powers up the VFE with the same index as the CSID
before the CSID itself, through parent_dev_ops->get(). The VFE
implementation, vfe_parent_dev_ops_get(), returns -EINVAL when there is
no VFE with that index.

On the ISPIF based SoCs there are more CSIDs than VFEs: MSM8916 (and
MSM8226) have two CSIDs and a single VFE, and the ISPIF routes either
CSID to it. Streaming from CSID1 then fails right away with

  qcom-camss ...: Failed to power up pipeline: -22

although the pipeline CSID1 -> ISPIF -> VFE0 is valid.

Return 0 when there is no VFE of the same index: there is nothing to
power up for that CSID, the VFE in the pipeline is powered by its own
subdev. vfe_parent_dev_ops_put() already ignores such indexes.

Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93..532f6d36d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4631,15 +4631,16 @@ static int camss_read_version(struct camss *camss)
 
 static int vfe_parent_dev_ops_get(struct camss *camss, int id)
 {
-	int ret = -EINVAL;
-
-	if (id < camss->res->vfe_num) {
-		struct vfe_device *vfe = &camss->vfe[id];
-
-		ret = vfe_get(vfe);
-	}
+	/*
+	 * On the ISPIF based SoCs any CSID can feed any VFE, and there may be
+	 * more CSIDs than VFEs (MSM8916: two CSIDs, one VFE). A CSID without a
+	 * VFE of the same index has no parent to power up: the VFE that ends
+	 * up in the pipeline is powered by its own subdev.
+	 */
+	if (id >= camss->res->vfe_num)
+		return 0;
 
-	return ret;
+	return vfe_get(&camss->vfe[id]);
 }
 
 static int vfe_parent_dev_ops_put(struct camss *camss, int id)
-- 
2.43.0

