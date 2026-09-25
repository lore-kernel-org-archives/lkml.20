Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE1C4E1C87
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363198; cv=none; b=Z6u1kfUT1maasinjJWHklAVTYZgv9i+AB2Qi6ViXrci0sjsXR8PoWdgJmrr5VFmrR5SWcFDnoLeQAlumtGFyU184m4BnDuxiGyFW4cCiwW/Ybmx5YIYh7Ea7sb8tWFfmoVhixmuwKJO5OHmcP0NLmo7Oz55HGcurNYjfMD1uya4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363198; c=relaxed/simple;
	bh=+Sl7ScK8B1tFiC7RJKsPWHN+Q+SI72P85oWHpyIA7o4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X5+1/k+SqZGvbjJaz4T0WxhSbhkQ39ywHF3QNJrxjKcIf/TECo/n21nRa9QHMe5JJu9Mig01qtlyQiV+f8voulEz3Sf/EQCQ0/Cc7QYoYO1kJ6R5ZxnHxlCbZkb7zm21OJ5kTJPsgseD5PGXdIBsZE8qVziy8oXAiUpNbEaq90M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AS/Bxqg0; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AS/Bxqg0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so711786f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363194; x=1790967994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKydHBQhZg4wQNNFJ7SLaFYuzOXlWjr3DhFhWOomnTs=;
        b=AS/Bxqg0jqkFhcrxvcEQ4e5oNVo6tjU54K+xWPbL0ixqcqV/7VedghstVGYEICrP60
         TvopU4CPfBIgx534y3uW7VHagfB+UCJG3MClkD9gxc61BX/a9hyjllDGys8gLlf8L7/t
         pGzURqPFnxSj+0JVw3hvCjLZJgSox9CiF67AJG+KLLV4S2vnGkqFSkmyuZb12DKe6ZhC
         gtqAZCLCnz81dyMA0LKa4dS22kSncD94DRLdljfcPwiA0VPZwAyyDz5yWR5R1ZM5S9I0
         e7ywK7Z2eFn4IbQwQmNZVx9/uUg7CA9GGnRHLEkXaC3i7DekNhXT1vuJW6Aaq6XLG71t
         Z/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363194; x=1790967994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKydHBQhZg4wQNNFJ7SLaFYuzOXlWjr3DhFhWOomnTs=;
        b=vAo4u+tVbvr/sbY0zBINQ+DcDGoLtCA345HGHoLEwecdVoRA3c9Juy30klF1GMQ6Eh
         HmNUb0BsgDoRPBLN+E2bCA+i9jh9IqneVPHcA+Ffy9Taz+rvNzl/R3VURdZQZmvRnFpf
         9bAYQ8SWJZa8SaO74WOD/SQZcrlH+mwe8Tdlg7dpbAaIsGRzHOPUPAcinNXIJNz2I/q5
         RCPCavlFVVKGKsCHRoo+dGSZ7IyApnGr3jOGzelRYauxzKcqjf/zepzJ/KUPFlzZPbgJ
         RhbdWNUxZ514C47Khz+RRSzulCQzKtlztzjOk0DhNRVeSssvLPq/kYIV8nFF+Eot/QZy
         b7CQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9z5+nNtQ3yRu4FxbdaYNMl9ruHZQDF2qyj8KMzpMf3wc69hGjB5nG2cEYo3JhwlaDDwzpqofuKOh7JR4=@vger.kernel.org
X-Gm-Message-State: AFuF++l4WYGPPOuiuZDg5VncD+jS+eiU6awVU5MYId0TCI78lhFBXDF0
	ReEECNnAgDqttNk68tB28KdJimOUqL0Emm8wdgTlVNIzGk0xQR7rJguC
X-Gm-Gg: AYBFou1Px9GaMbOUuDKWODL+S6eHOQxiFYZM+jD4+pJO2bf+h58h5U54HBHIDrDmu2Q
	oFqNLTaDxI34hxqLfSTp97B1Gzh+pxghw2fsj+TKTMy3js5f+T2DmBStHZVmCwmmAsAj+tt8TOn
	zAQwlG6rYCX5HwDrmoDS6o4BU76bTjMUOKAz3nKJWhBdAjxIongmSH2VtX6PEB3B1s6LhkyAVJP
	5E6Snyj9YCIBuGB3RPfASxwIIpXQtaVlV017X0seEVW9m79DsXafPstwEWubmLA3XehJHILROt9
	GvjHlf2aQHcQB6+zed7yYU7RVwF4NpXAuIi8kWVPsrfuxFZRxLeEBlkfC2Q1Qjtiv9f2+/J5XB2
	2Y7t6EgaIROVdgo/NNlPOW43rXalNwpDwS70jWN8TL15QEEtNJFtmW4Z3zrzdhW2waH5HFe2OSE
	wszf4KDCNcWAT10GqbB0L7tMOVdyulmgtrsIP2Q3Z8s98ZzQ40d5i3iwkmNZCy4yeKOy9SmpToH
	+6pgH82U4Br6jBEff4zEULlqbk=
X-Received: by 2002:a05:6000:2083:b0:487:27f6:a4e4 with SMTP id ffacd0b85a97d-488716bc8c3mr10976651f8f.52.1790363194187;
        Fri, 25 Sep 2026 12:06:34 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:33 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:16 +0200
Subject: [PATCH v2 7/8] mtd: rawnand: qcom: rename 'nand_stats' structure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-qcom_nandc-share-more-code-v2-7-a1b088052d6a@gmail.com>
References: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
In-Reply-To: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

Give 'read_stats' structure a 'qcom_nandc' prefix to indicate that
it corresponds to the Qualcomm NAND driver. The definition is going
to be moved into a common header this helps to avoid global namespace
pollution/collision.

No functional changes. This is in preparation of moving the declaration
into the 'nand-qpic-common.h' header to allow reusing it from the
'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - No changes.
---
 drivers/mtd/nand/raw/qcom_nandc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index cc1e64ac4245..99fe2c434ce7 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -438,7 +438,7 @@ static bool erased_chunk_check_and_fixup(u8 *data_buf, int data_len)
 	return true;
 }
 
-struct read_stats {
+struct qcom_nandc_read_stats {
 	__le32 flash;
 	__le32 buffer;
 	__le32 erased_cw;
@@ -619,12 +619,12 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	unsigned int max_bitflips = 0, uncorrectable_cws = 0;
-	struct read_stats *buf;
+	struct qcom_nandc_read_stats *buf;
 	bool flash_op_err = false, erased;
 	int i;
 	u8 *data_buf_start = data_buf, *oob_buf_start = oob_buf;
 
-	buf = (struct read_stats *)nandc->reg_read_buf;
+	buf = (struct qcom_nandc_read_stats *)nandc->reg_read_buf;
 	qcom_nandc_dev_to_mem(nandc, true);
 
 	for (i = 0; i < ecc->steps; i++, buf++) {

-- 
2.55.0

