Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586734;
	b=deMOggun6ZQ2cM9vMcExtN+qeKuXV/UoMrRcrmE0HV94ET/qsmaOjTFWFWMuGcC+gc0G
	 ETp+RKFMngzYFJdBHhSPQ+l1U8ibndMEXjY5vhmDBKiRSKlZqs73izQO3mOsBygybsc3Q
	 a1UfKgM+BWI0ityeqxEitUnqQ5Mi5pUrqrqCNIRrXU3MTHmytsnIDAWoEz/+gsewavLoC
	 6JYQyHO3sJ2cwdmSHx3osrM5zTst14Yg6joUxz1GgiSMpyxkKpFi1RVBQYbyb1RiSV6nb
	 rZk9v0R53nMIHIJgeW+K0omOkblARDmIvBSoQHVNiSjKbQeanCJNirnMaiUffAyThUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3uheoZqKSe+Qa8Rhr1Yml0QAXpH3QvZRuhTv2QAVUqE=;
	b=Cwv9MQlnkjVvJMEchz8oa4LObAhL7VZyRVjpAxj1/nXYR9IznAH5Yl4L2ENjNpJueRc/
	 DpFHnCEo2yPDvnAer7vJQjuCDcw0koQrrQcXRwtp15rSgRL47UKQGaXYuvmWtM2lpjCH5
	 vVhatmDy4FX5w8XafgQiiwahVC/m+tO4SIpEMQmf3s6fITjcijU5mW4FkJ7YpZ5EzwBSI
	 04H3wD5BTTBKnNOThfu06u4GJ5nzNZTxiCLwN6OBmyDIpVeV6oCeDEi61rBr5yqEz00qI
	 LeidhhPCDHo0QCKLBU0rwtbTPePtMyTDhLIRowa5lfQa42/Zg2kA88y0fcdRp2P+0Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EKGHOM+6;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02F06070FEC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C02F06070FEC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EKGHOM+6
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso268356366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586732; x=1795191532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uheoZqKSe+Qa8Rhr1Yml0QAXpH3QvZRuhTv2QAVUqE=;
        b=EKGHOM+67PvXagtzegPTNbgvC9/8qWJ5ECM0fAkVsI6RP3Sec5nomHwM/BQF7xCBLV
         WsKuLQv4jP3yDwVgT1Rnjcfctu7R/+DJiQpklkz50yr9sY4yidZYwTh8bQAONFjGwiIi
         Vhd7xH2XqywcU3mHl73J+dOP33BAIF/TcIz6o1YjbXoFpsyBnF7OJ2dyCSXAWiM7802f
         AJu7Ej7Bzt9rnWUwUbuCUnUPWR8ARNMI7tm3Svzf4FOsPGuW2bLq6VwTbIjoaKn8GbfP
         MS4IJbN2tKlI3w0V4evDkh7YFUYkatNB8NpmCo+4DO91YwXO6paGJo4b7CHpFEXpEmX1
         zztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586732; x=1795191532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3uheoZqKSe+Qa8Rhr1Yml0QAXpH3QvZRuhTv2QAVUqE=;
        b=Ni95piGkVvD7LBd1vyfwokeViwFNbtDLgAEp08qJGCHH7YySfzErYkmcoTxGNO3Dzc
         nhj3dcFGSjU+hYfCxAQAx7gnXMJ0SVmJPcdAJQxwz4VOopvQQZvHgK4zrQcQNdrOO64f
         bPUgF5HSqh0ySl5aIu7DBfUp+BtINwGFTEgvroUhXV195O6VDnQuZNNtt6zIbsE/cM53
         yeTTp9qnm2WKx8xH0ac/ab2zzzOIEOv9UzOD3ljKZtUYkEIMe9EbLG6ajxjiUWkVhBUL
         /kK8K47xHs3miQ4Nw51kCGs1cTqWql8G4KXg3ed+DvOnlr7oOl+fI8y/AEiz8LeJRF+6
         j4og==
X-Forwarded-Encrypted: i=1; AL+hErHclWO3ok+esW+F/VpnqDrrDWTsE+OOX0eSDbH2ipwFK5MwkSRbMYspCjfmoq87mlazy8YRF8G29x1ZK9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j+2HPCuIjidoD1bx8ZIaDZGXpAIwSndB+7XXQqGF8TiOS6nFG
	qSJ9N/e+Ro1slw3uJeU0l0iFsYnSymoksC1Da758VpNSZNapfQNQdFPu
X-Gm-Gg: AYBFou2c7HdRSMA+fNjd2U6LC8YFRrAtoRnaI2crLBkwxvHhp7Q09m1cLgvXdIereBe
	TJBTX6qrtvE2zX7iluWuOXXiGecWt6Hp5kadJfdoUDBUmsJUWZqb+FIGwlwuGoupk1NsjLJAv/x
	sLp27qVIzvJR9nIbxG5nITAIhklIKwxQF51rvZfMHFWdqbc5N3FHLCZTE8sLoZI+eSV5M7VD04l
	4MWCJ+kPT75of/9xWV13ACU+vfaia5vQ22MV2GR9j/NJE1mO6I6sNJEbXV47Cu4QFP3fZERmjSl
	W+EwAioiPyE1IW1CeAeuZdYOTBEQ+NPRIFeHbVxylJnkbSeMHAMVnrAlmzSk3O+vpH4jGxzSRwG
	r7Sw3XFtFlq9LfLenuTSEAzHGqiJt48D+4J9DSO4kh3LYh18+8wNDnWgDsNKW6LwlwWccx5dyGj
	W1yknZ71SQoAnshccYhpDSOVFZo/sXzzFPPy53lMGujhCvItWoOej5Mpu7H+KBt/WFA+vtxDTil
	UIakZP+lNo2oEtMGKrU+DQAL6dNYPAFd/bdk/XFTZt0Gbr7u1WK3ch2IE3TrcrcgpO7r/HtjOJI
	Pi4GmgJASV6rngQE+FIVHWH/O8CxZrPoIPb0XL/Q7HtRRNDD8mYkrloRiMXjmju1LRPIIGo9Jbc
	OPc/vIj51FQ==
X-Received: by 2002:a17:907:3f93:b0:c50:4a71:cb5 with SMTP id a640c23a62f3a-c5096325a62mr275095266b.15.1794586732058;
        Fri, 13 Nov 2026 08:18:52 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:50 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 06/10] media: tegra-video: vi: Adjust pad assignment logic
Date: Fri, 13 Nov 2026 18:18:15 +0200
Message-ID: <20261113161819.36847-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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

The VI driver does not populate the pad entry in v4l2_subdev_*_enum
structures that contain it. Leaving it unpopulated assumes that the source
pad will always have index 0, which may not be true for more complex
sensor drivers.

To resolve this, assign the pad value in v4l2_subdev_*_enum using the
source pad index obtained via media_get_pad_index() from the source
subdev.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 30 +++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 5c649e3162fe3..0228a11013b05 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -348,6 +348,9 @@ static int tegra_channel_enum_framesizes(struct file *file, void *fh,
 	fse.code = fmtinfo->code;
 
 	subdev = tegra_channel_get_remote_source_subdev(chan);
+	fse.pad = media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
+				      PAD_SIGNAL_DEFAULT);
+
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, NULL, &fse);
 	if (ret)
 		return ret;
@@ -380,6 +383,9 @@ static int tegra_channel_enum_frameintervals(struct file *file, void *fh,
 	fie.code = fmtinfo->code;
 
 	subdev = tegra_channel_get_remote_source_subdev(chan);
+	fie.pad = media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
+				      PAD_SIGNAL_DEFAULT);
+
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_interval, NULL, &fie);
 	if (ret)
 		return ret;
@@ -465,7 +471,9 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	}
 
 	pix->field = V4L2_FIELD_NONE;
-	fmt.pad = 0;
+	fmt.pad = media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
+				      PAD_SIGNAL_DEFAULT);
+
 	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
 
 	/*
@@ -540,9 +548,11 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 
 	fmtinfo = tegra_get_format_by_fourcc(chan->vi, pix->pixelformat);
 
-	fmt.pad = 0;
 	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
 	subdev = tegra_channel_get_remote_source_subdev(chan);
+	fmt.pad = media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
+				      PAD_SIGNAL_DEFAULT);
+
 	ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, NULL, &fmt);
 	if (ret < 0)
 		return ret;
@@ -570,6 +580,9 @@ static int tegra_channel_set_subdev_active_fmt(struct tegra_vi_channel *chan)
 	 * is corresponding match in the Tegra supported video formats.
 	 */
 	subdev = tegra_channel_get_remote_source_subdev(chan);
+	fmt.pad = media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
+				      PAD_SIGNAL_DEFAULT);
+
 	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
 	if (ret)
 		return ret;
@@ -614,6 +627,7 @@ static int tegra_channel_g_selection(struct file *file, void *priv,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.target = sel->target,
 	};
+	u32 pad;
 	int ret;
 
 	subdev = tegra_channel_get_remote_source_subdev(chan);
@@ -622,6 +636,12 @@ static int tegra_channel_g_selection(struct file *file, void *priv,
 
 	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
+
+	pad = media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
+				  PAD_SIGNAL_DEFAULT);
+	fmt.pad = pad;
+	sdsel.pad = pad;
+
 	/*
 	 * Try the get selection operation and fallback to get format if not
 	 * implemented.
@@ -667,6 +687,9 @@ static int tegra_channel_s_selection(struct file *file, void *fh,
 	if (vb2_is_busy(&chan->queue))
 		return -EBUSY;
 
+	sdsel.pad = media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
+					PAD_SIGNAL_DEFAULT);
+
 	ret = v4l2_subdev_call(subdev, pad, set_selection, NULL, NULL, &sdsel);
 	if (!ret) {
 		sel->r = sdsel.r;
@@ -1041,6 +1064,9 @@ static int vi_fmts_bitmap_init(struct tegra_vi_channel *chan)
 	 * supported video formats.
 	 */
 	subdev = tegra_channel_get_remote_source_subdev(chan);
+	code.pad = media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
+				       PAD_SIGNAL_DEFAULT);
+
 	while (1) {
 		ret = v4l2_subdev_call(subdev, pad, enum_mbus_code,
 				       NULL, &code);
-- 
2.53.0

