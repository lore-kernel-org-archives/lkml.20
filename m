Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223594;
	b=sJjL7sSzO8if3jbdAHjARo/5SHZ+WDn27q1Uk2PJfXVNhNaC79qrzjDQJlSO50XqTHOf
	 GhkzrOdlqMS7lsv0SnxOCKivEkImwOcfY6pzAAWwJmo0o9FQYJ/sZFgPfetiVs1K30w/a
	 WE6npZfbS+JUEW6y0pIerH3eEo/AovgbaSawvJ3XrT7b0xVtsun8fU4YaI8/RU3upGW+x
	 kgTE4MvtaktOswcJN+eqHCOW9e+lbeST6vHAL944KoD/FZaDULM64lDZ61KgfK/xkPrFM
	 PV3KIoEeDfzhM/NjFJBrMLLBj3y8KumiNKaBJowd/7ibUjR5AYqlIStIBOng2a9/46Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
	b=SeVi7c+qK6F/FWb/S1tB7yhEicUrzLyF48Nr9kmNqsQ2kD/wxYttsTzc4uEzhUzggAIb
	 ckfYgMmcd4mT4bI3bHh7bd2Jkk2K66AfZjH4U3558IOvDmyN6VNRoo2XwRVGtAMoPddTF
	 +yFpdcYEJmbxgnUhsnxzl6wlc39WoJolDlrni/UNLxiqC7Jg8LLswvw/Ss2LjE/aRA6nB
	 Zem+/YnPl6BT1QgIqWJgonAvFFx96iSSfzX+EGvXFDvDQFIsE7SFunZbheUegy/fJ6GZX
	 LC0nX4PZ7rY8U7JkXJ4EsHr2gOPrPpGVNCTsK094HFViL7dhExNXmcJiBvXDxUJld+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="HRvk/q7h";
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F6D606D823
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F6D606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HRvk/q7h
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b31fc13124so4643557b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794223594; x=1794828394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=HRvk/q7hv6GUxA6ex5QAp3j4lsMWUjdxCseq0wkxqkLNanJUBMmVT86O+ISZV4DVUt
         agZ7fAqjne/fIDciMzkFujvfPOWDPOi9ENgtVCvUOe+X9NaSD6MX0SiCHZQejumyH9hE
         0JplMJt4OknrPIug7uAxojAkE3CfAz/szXEuk8V6oLXoXDOfAMC8YU1ug52yevy/P16A
         pJWm+NGoYZSCIMdn0pxjA8NktfBI/J3RrQPwAhIdDtFTTvqP8pbHG/6l7tpFaXbn4wqR
         V0zoAIMPmvLNDBgTsYcltkD351vEkKT4tjiUO3DGVpynrmZlxKMRzDk2z4QdfkknYr1J
         LSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223594; x=1794828394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=lrYcdEJkrrswH4lKGm91gjWh9Cm3+mu1iopzhEY/zaXkAwasNBSznGtn+Qv87Zx3r7
         iskFAbxWiGVWJ9uxMvtsq2dULz0r/fUpgSFMsHjuzWj8KL73roZYSJtJ8UaoN/kHa9Es
         EtRzLqjEJmQJPkboG9q26NlQz7aF7G7WZABK+3esIiDF0fTQorfR7KleHUDs0l+4c4BJ
         Ave6joYm2GIVSXSr4oIZo/G9Cj1hHKtOLUiANuif22nURH04bLGkLgUD+bzYPFyguPOK
         YPJYHIVnnNJLbzqPArX+geldrfufuxC2xj2iK8YTUy9Hoghrx55pQ6ohUwzb3+tr7OzR
         ruMw==
X-Forwarded-Encrypted: i=1; AL+hErFYYhvc531HbkcLx2THRLE41SOO6RFzukmo/GmQmDXkHos1pFkl+SqSKffH1R2Lf3CDvGfHYMW3H1nliDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z862ZuPHug6MqR+xPu4dbK2V8iNaUmBzsJyP6oObUf5Z3yPPVHx
	N1akcwEjtjr2xHQH6tUliuB8HEtAh+CzEsI0vXW9F0QKQTEcAgj52UDGGe9GPJKPI7s=
X-Gm-Gg: AYBFou1I46xBkU11fE59ioRvmdGX/MAgUkTKSqurcfA4pqs+dYhttUzXzuQucRKrFZU
	3gM6fT1jR/LuCBlWGePZyjbQ7pYT5qqxmuhe0Zoq94Kg8FjD38ia3Dyujgd2SMxbhkhyuxMKKnG
	1h40zjbanPeczhNo9P2ALydCxGfabNWpzSCnE0hYyIgsx2Nnok5iYr2PHGQDLLfqaZoyh9z/x7H
	6R0n0DTzVZxWJOZ9iE+r80EBVEvjR7UZlxRjo2MWtDQkZxu5sQPByi3UvtShq4Pxw7XuEBxlwmE
	pRFLu24eyfvCj++y0nawjW1ADFNSu1Wz+xEpbgAbFgAgHxXTAzsRFO+ULYEs+d9M9d2mCBhffnJ
	CyrsO8eclcoo0cMIhXVWK1TczMu7niTAVm3xgCjBTxjwOq8HcvzxGnLw6vvRixkN8KE1HZa5D9X
	wM/90bpdSqf2/Ste3FLw+HzwjhAgspdsKa7URG3AjJlpbHxWyZ8GFyWWxbGqbrhRBZrDJMfEt5T
	nvRJi8D3/FwHhgWbF0YPtSEQ8+l1fsv+XP5+fcstCqIJ9CzCMvV8hvKgU6ASvvDlE4J6YchQJIb
	7Gw/5AEgYhYLzORcL5wEb9G3GlukkGDWOvgo8iI2kCZ71td3WqroiTLY4Kg5/IH6aKdx
X-Received: by 2002:a05:690c:386:b0:8b0:d9ff:4f74 with SMTP id 00721157ae682-8b36cb0c321mr27400357b3.42.1794223593551;
        Mon, 09 Nov 2026 03:26:33 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbffb49sm32385477b3.28.2026.11.09.03.26.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 03:26:33 -0800 (PST)
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
Subject: [PATCH v2 4/4] media: qcom: camss: do not fail CSID power up without a matching VFE
Date: Mon,  9 Nov 2026 08:26:11 -0300
Message-Id: <20261109112611.94010-5-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
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

