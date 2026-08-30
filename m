Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A243B47C3
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788105786; cv=none; b=eNFsaOJh0kjTRAJlwuSq8u8IgxKijIoPMVV6UchbWhk7lkuBJ0FpaTXkNteqaiuAeZC4uKOByIbDda9dBIhIuF2eKOGa2hpVpB0AP0lqiSB61bmY8d97feM5bYGbJuVRRunxCGczzapm8lGTeJtYzMtbcNiiZDazDmAY5cjVzpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788105786; c=relaxed/simple;
	bh=xmKKzjCAtL6wSzbj7b1CUTRGlabduq+pCSy4GjqEQz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Puu11J0jaosAJ3rtdSE79EAGIKNe/MWRTkxqYWDSNsHtBtZCNyfKuKCQPWTjagc2zJ03I6MEApIyHGLZhqqfwAgwttoXvQ4aLIbt/LJXhVislBBp47Q+o8jx6Z0WMU6bisD5MS+9bVsQfDrnvQCtHWrF5GY05zOAjMnUOZwt63s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6deg9t3; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6deg9t3"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-855d2bfae95so2769642b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105784; x=1788710584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pG5hjYJsgEQzoTLm/xPUh1x5QPpaw7ZAGE9j4vcwlU8=;
        b=E6deg9t3nq0b8elhkqFUgQqsdAYKMjsi2ac4uSme5aaHySKFHaZHLxdKUNYUDINDks
         qQDOn93KYsDHVw0ePan/lAbVea1oiZI2FkQhRIJo9uRtp4AXR6QQqIGrB+wRpWPvzqF8
         8uX+heUm0FwhdxYKe1mpxqvkv222qoim+6c370MXuT5u5TgRSX6ysrAQu9z9pBoSiyTU
         fjurU0W6X7L8WGmZuOQw9disMgH0fh6JUm32mqNh4FM4z2ZrXEyi9ROVnab6osVO0zfM
         OKnE7t2trGZW3kxgWE4oz9pOkS0YirrU69X8tgCknJlI20CfFJrEE4HMYjziGXQLNdN4
         H83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105784; x=1788710584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pG5hjYJsgEQzoTLm/xPUh1x5QPpaw7ZAGE9j4vcwlU8=;
        b=deyd82I5Eb8iCXO9mmwa7gk1foF8T1zmIO5ptJ9AUjpwR7vy99LcpkVNVUIkd7cwn3
         pSZ61evW+gZxuolJnQ5ObMq7HeVSBpydesIn1krhCAkCJ6IzXvr4WzGJ1XXpLv612hFP
         exYPLwlrxvc9tH02CJ42Qux10IvnnHz2JRumgLOChe/FKxp0puT2juTnaLNJiyOI1kvE
         YdiF6MI2RzUrk+yh0kmpL3tGDDYpTq0cZO5Z+RK8/hVFPp7S2ODejHw2TIYo26X85MxE
         x2aFeqB19bn46pOYUJxoA9HR4rZLwrKqRsTdDUEunTw1vvcC1JH0pZk5xkbLQ6HLQ1Zn
         toMA==
X-Forwarded-Encrypted: i=1; AHgh+Rox+k1M6nQLHThKn4IDrZPU8EmsR+xNUmp03718bZEEEespQSiQ1I188PO4B1tlj0pcyb2kfcwm/CMXfHA=@vger.kernel.org
X-Gm-Message-State: AFuF++ke8uMQ/niCtas2Fm0zKfGvIEpFO28HZcaKjlQfxEhDTB10/ezD
	iWZfHc+f/bE68Phx5pmVir0xUl8EcQn6HnXdqQMoXzwXHYno782DTb0a
X-Gm-Gg: AR+sD12Nb0u+CurTsDhaDzzK4xdCODRtmbJDGK8ApPAAISQKVogeCXbBc//9XMLXwpH
	RKoPlxX/KWd0xJlwbUGleZUDV0GiP4Y8cfF5FnwCfgud7mwCuloHk2TzF1r8bQL+RDOKSBDpP6s
	3olmNqUj/w6yWnE3ahVFMSeh303MPvwGeagf7ge4N8i9YQIkvRyLGra+LSQIjGkMgkXu3Y0hqie
	AVvj/HJVSz2XbKE2yDXDcJDFFsy3EEyjpixuzGJcB1paG+nxAJByv0Jg3BXluMDBum2vztjKl0F
	qHN8B9VD78SzcJ01GZ0y1dEV6hFNeSXal3wxU7D1/ucWUOqJP2p0t7iIvAProDlezMKEuDiFeZr
	FcZSpjZz46U3BiBQUB0gy8lkRrRMLvNpXFIryA8oKBlBMqG7+WRTMorxQX8ugTH6b3yazIJ85tG
	mmu+mqQVxC8bUA/4G5JiOkK6ZQ8X6winvftaCXlYZD4IO+1iqi7l4FYiEeqBmfB2hR5JPoNmbN3
	sYbXJ3TlG7O2lEp4EjiQn+3nPQdWy+KDFQG3aAAFOY+mWg93hmm
X-Received: by 2002:a05:6a00:464e:b0:84a:2b96:5986 with SMTP id d2e1a72fcca58-85994f5cfb6mr2189880b3a.8.1788105784320;
        Sun, 30 Aug 2026 09:03:04 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:03:04 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 3/5] media: hi846: Fix modes handling for different lane cases
Date: Mon, 31 Aug 2026 00:00:23 +0800
Message-ID: <20260830160025.211384-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830160025.211384-1-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using 4-lane, v4l2_find_nearest_size may return an unsupported
mode, 640x480 mode, use v4l2_find_nearest_size_conditional() to filter
out it.

Reported-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Closes: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm
Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Link: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v6:
- Add link freq check in filter.
v5:
- Use v4l2_find_nearest_size_conditional() to filter for different lane cases. (Sakari)
---
 drivers/media/i2c/hi846.c | 63 ++++++++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 2f8624f9bdf3..648192521344 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1713,6 +1713,21 @@ static int __maybe_unused hi846_resume(struct device *dev)
 	return hi846_power_on(hi846);
 }
 
+static bool filter_modes(const void *array, size_t index, const void *context)
+{
+	const struct hi846_mode *mode = array;
+	const struct hi846 *hi846 = context;
+	bool valid_link_freq;
+	int freq_idx;
+
+	freq_idx = hi846_get_link_freq_index(hi846, mode);
+	valid_link_freq = freq_idx < 0 ? false : true;
+
+	return ((hi846->nr_lanes == 2 && mode->reg_list_2lane.num_of_regs) ||
+		(hi846->nr_lanes == 4 && mode->reg_list_4lane.num_of_regs)) &&
+	       valid_link_freq;
+}
+
 static int hi846_set_format(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
@@ -1736,20 +1751,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 		return 0;
 	}
 
-	if (hi846->nr_lanes == 2) {
-		if (!hi846->cur_mode->reg_list_2lane.num_of_regs) {
-			dev_err(&client->dev,
-				"this mode is not supported for 2 lanes\n");
-			return -EINVAL;
-		}
-	} else {
-		if (!hi846->cur_mode->reg_list_4lane.num_of_regs) {
-			dev_err(&client->dev,
-				"this mode is not supported for 4 lanes\n");
-			return -EINVAL;
-		}
-	}
-
 	mutex_lock(&hi846->mutex);
 
 	if (hi846->streaming) {
@@ -1760,9 +1761,12 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	hi846->fmt = fmt;
 
 	hi846->cur_mode =
-		v4l2_find_nearest_size(supported_modes,
-				       ARRAY_SIZE(supported_modes),
-				       width, height, mf->width, mf->height);
+		v4l2_find_nearest_size_conditional(supported_modes,
+						   ARRAY_SIZE(supported_modes),
+						   width, height,
+						   mf->width, mf->height,
+						   filter_modes, hi846);
+
 	dev_dbg(&client->dev, "%s: found mode: %dx%d\n", __func__,
 		hi846->cur_mode->width, hi846->cur_mode->height);
 
@@ -1853,6 +1857,8 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct hi846 *hi846 = to_hi846(sd);
+	int i, count;
 
 	if (fse->pad || fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
@@ -1862,15 +1868,24 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 		return -EINVAL;
 	}
 
-	fse->min_width = supported_modes[fse->index].width;
-	fse->max_width = supported_modes[fse->index].width;
-	fse->min_height = supported_modes[fse->index].height;
-	fse->max_height = supported_modes[fse->index].height;
+	for (count = i = 0; i < ARRAY_SIZE(supported_modes); i++) {
+		if (!filter_modes(&supported_modes[i], i, hi846))
+			continue;
+
+		if (count == fse->index) {
+			fse->min_width = supported_modes[i].width;
+			fse->max_width = fse->min_width;
+			fse->min_height = supported_modes[i].height;
+			fse->max_height = fse->min_height;
+			dev_dbg(&client->dev, "%s: max width: %d max height: %d\n", __func__,
+				fse->max_width, fse->max_height);
+			return 0;
+		}
 
-	dev_dbg(&client->dev, "%s: max width: %d max height: %d\n", __func__,
-		fse->max_width, fse->max_height);
+		count++;
+	}
 
-	return 0;
+	return -EINVAL;
 }
 
 static int hi846_get_selection(struct v4l2_subdev *sd,
-- 
2.55.0

