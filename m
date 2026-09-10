Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2301416858
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027497; cv=none; b=gBqNAy39P+9g3DPhn3tAgRFJrOb5E4xoq7zxglJjOshoFZKqtkc0FzmnMxwvA7h4SgfyR6S3ixGnrk7lobliE+YinH5wT+LMMPm7DChBHhQ0x6ptHX4ujVhxt9f3bn5BIA7c50G4Bbnww2sSk6SXQ7HYoqMpEQ8FpVu2vkoN4XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027497; c=relaxed/simple;
	bh=gRm8k0lA6+IZmwfDi7QHofPJ1tCqLQVpoNOipJBhfV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gGlDeZkF8BvsVRIJ8AptSC0FLbVawk5V/sZiZCTgVasbei9KXRrTEVweQ3fyUhvfhx+6UgyyWSfxwFcjXbMIgOwAL/F81QYuyJhIoeDpudLUFqNBNpULV/WAJv+lbDtQYhDuZmaEgqlmR7oUSShY28TLdo760tcPtnmy3qOf5G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hk2/+M/6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hk2/+M/6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398b3c37877so6362289a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789027493; x=1789632293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4T51EgZly4ibicIo5lw/2SC/Zwq/woe+QZug39a3X1M=;
        b=Hk2/+M/6OqWHRRLGIFPQBmCMYQtQD465y/yLQe0m5li2xUsqYKK0ZjWkcEPjv+CTKA
         jTOZMmUcXpAiIzPpwXdKmCswKt8adCAhRAoOybV6H/QhUcf35Y1UgumhkqvGYeqdU6to
         j9B/aIUKkNKniJMmn8KzmEuJdmsFVn4HmoJ6kUuQsXEUj+wR4nFz87N6ZJcJpcfWj6lt
         jju0gBTI/JMg9JIk1wDFa8Hxr69ynbXQqurnotSfn4/AsX1lrlS5lJ79ua/baZDdskQ9
         NSLUe8lQYW3tTcaztncGZawsAEsM1ANITj5Hmpq3Q0ebqKzw/a/phhK903AETnAJxO0a
         wjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789027493; x=1789632293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4T51EgZly4ibicIo5lw/2SC/Zwq/woe+QZug39a3X1M=;
        b=kTeAilL7YleOsz/r5P1x2ykcXZxP1QprBxh92Qa3S1Uagt68jUpldApfMFS7U+ZOqJ
         ESD1lGOT82TiiO+wnaHXCpD5DEurqn/jBnLTih91o6adjlxeFcodEdHQebem/kQJX08o
         2ANIZpWTAFCSr5Ze0QWyh0geQuTz1SbwX06Dg9ydZfg5s8iiM9emrO3g49pH4LdYoy9p
         5xI4eDWXncHyZHRsxg3BSUSdgiNKZ/FDFrW6EULpaA5MDmCSGSX37+AlzXfFtA5vtf6z
         78bkPVxA3tlB9Uu/Bl/fZp3o51rE+XXVYugu/5BeHTCV09BPNDyqnyMHhIbwX7oVREy9
         8qGw==
X-Forwarded-Encrypted: i=1; AKwUvBymU5QCATrC0MHnVx1PVf6wCxhuulmX6frmU96FBhK2TIbAWxO5IPmPwLnG4tCHyGucKzquh4k5G8Lm34g=@vger.kernel.org
X-Gm-Message-State: AFuF++lF0T7Dtu7MfH/2wCyVFjmrVmR3WjC2Jk2ueAyo9t2aV4taKoNh
	12gYDz+YLkCldLYp2uyhe+GGwegmcIbz+8ehptM4JQ4fQcQslZNotdH0
X-Gm-Gg: AYBFou2zrRgU3ENk9IJ6SqXdlpAY3NgLgFXlwzIfU/WZG5fd+tt8N0sKq+2nSplhi2U
	/qAaT43zYU5mlQ06DEvzwteZAGD3uFu7OUatuPNmooHCrhmYuFEctiqylVF8XZiPy32OwXxFRTy
	0F4VfCvDi9XmpL9NO9oYKVteVu8NbKb8dkSjPANUa+sTq7grKaTqBo5M0u6eGI4XEvbLiWtjBnS
	w01uUDLz0CnBsHuaEAqLlDHpacMyKTI3001BzBz9fxM+4DbLOc65tVLbEyxJV8n5SCIJDNNXZax
	+tzyYijeXD4DcZw3jmvONFvLDfxuvtyZcy3SVmGaTW+aQFZ+7eGmHyaZf5qr0Jed8aa2g8SyTLY
	CvIxCH+bvW4EzYote+sNNLnY+fLWt5m6D9rTM4YSUplV9SsvgK2Tt97BBSTm+F+dcaYJencZNQG
	uuvfs2oB4CKt7EE6N//PKJruFMY5Kmm+25dvd0+ZjyS7OOa2oPg1cRrDLzYdy3HSKh40PLNFRG
X-Received: by 2002:a17:90b:4fd1:b0:398:bd37:6a49 with SMTP id 98e67ed59e1d1-39b261cfd8cmr59864613a91.12.1789027492801;
        Thu, 10 Sep 2026 01:04:52 -0700 (PDT)
Received: from ali-laptop ([218.212.161.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cd20b187asm2710589a91.4.2026.09.10.01.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:04:52 -0700 (PDT)
From: Syed Ali <syedalia1000@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	vebohr@gmail.com,
	linux-kernel@vger.kernel.org,
	Syed Ali <syedalia1000@gmail.com>
Subject: [PATCH v2] media: airspy: replace deprecated V4L2_TUNER_ADC
Date: Thu, 10 Sep 2026 16:04:43 +0800
Message-ID: <20260910080443.28080-1-syedalia1000@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V4L2_TUNER_ADC is the deprecated alias of V4L2_TUNER_SDR.
Use V4L2_TUNER_SDR directly throughout the driver.
no change of function.
Signed-off-by: Syed Ali <syedalia1000@gmail.com>
---
 drivers/media/usb/airspy/airspy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 358a66ab8e48..85587c0fbadf 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -50,7 +50,7 @@ enum {
 static const struct v4l2_frequency_band bands[] = {
 	{
 		.tuner = 0,
-		.type = V4L2_TUNER_ADC,
+		.type = V4L2_TUNER_SDR,
 		.index = 0,
 		.capability = V4L2_TUNER_CAP_1HZ | V4L2_TUNER_CAP_FREQ_BANDS,
 		.rangelow   = 20000000,
@@ -713,7 +713,7 @@ static int airspy_g_tuner(struct file *file, void *priv, struct v4l2_tuner *v)
 
 	if (v->index == 0) {
 		strscpy(v->name, "AirSpy ADC", sizeof(v->name));
-		v->type = V4L2_TUNER_ADC;
+		v->type = V4L2_TUNER_SDR;
 		v->capability = V4L2_TUNER_CAP_1HZ | V4L2_TUNER_CAP_FREQ_BANDS;
 		v->rangelow  = bands[0].rangelow;
 		v->rangehigh = bands[0].rangehigh;
@@ -739,7 +739,7 @@ static int airspy_g_frequency(struct file *file, void *priv,
 	int ret;
 
 	if (f->tuner == 0) {
-		f->type = V4L2_TUNER_ADC;
+		f->type = V4L2_TUNER_SDR;
 		f->frequency = s->f_adc;
 		dev_dbg(s->dev, "ADC frequency=%u Hz\n", s->f_adc);
 		ret = 0;
-- 
2.55.0

