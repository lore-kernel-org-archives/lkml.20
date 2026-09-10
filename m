Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9E739CCF0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789013194; cv=none; b=VTMMmLXY8wBVGcOmX4mscNrZsFT9JXiEkvQGH8Li16ALlNThc/3XN3oyaeHB04/KyO0gFUveGtL4fSi0evehftMjczpyvatTdNPVZRhH1iN3PN719ToVNxrvtcFuMIjhQbEfJCyg7FdN9iWLOqH0ZvYKzcfCrh9GnE3v4xCqgtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789013194; c=relaxed/simple;
	bh=gRm8k0lA6+IZmwfDi7QHofPJ1tCqLQVpoNOipJBhfV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EQnwlF/4CtGqkBdfOlBny2yCjXEuA9A1/IjuepGEpMGJCun9nfQnCh3viSTMogP6eiHCh0lbZM1KCw0+36Pjv4C6R2Kz0pgY9Kd4Qu0K3juNDKAY0sqNjebmQQi7FTEgYYj+lVTIBQ/3MC/3RmWK7BHFpt+I9yWUq/gCWtHHFFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLhIpnvY; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLhIpnvY"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38759bcd877so7147615a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789013192; x=1789617992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4T51EgZly4ibicIo5lw/2SC/Zwq/woe+QZug39a3X1M=;
        b=HLhIpnvYzb71n28WQCBucRJ88u/CTHCRMbct+bbXyAGOplZJdIIed4sFStTIGN9wwg
         N+XLzkhfwbnuSwYFyH3h+QQlH1cyAxv6Us2PGrydzJwFWwzvmSQbpHU+0vfEvrlriRJv
         2w1E8VJHkDB/vuIvPtL5gkREx2n771DRev4DoWlZcdcdzG8sBeLXTmXG9zTmP1lrrbkB
         py0GdHsyPNzWCMP4+3FIcHgNpJ85KusJ9HcGjqToca1R9ORxHP6imELNFqhe9rUQjUlV
         ia7JRNHB6e3m4sUNolnrqw32KJ/SmS510dEeqf/RlDYY8VeMBxAnW8//JIplHuwPoBjk
         BNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789013192; x=1789617992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4T51EgZly4ibicIo5lw/2SC/Zwq/woe+QZug39a3X1M=;
        b=RB6F/DxtLz/4fDZY8h2gVKfJpjcHEEnh3nyYuK94O185WYVMiqXdTromFYtEdw0bDB
         wZ+O5O8rY8kxyxaukR39rtKZU4vGAHHbiJxbxtdhPx7x+pzN4C7FYg26iIoYhv4O/8Tx
         XwefEb09ys5b+tiCvHHHYG7884NwFJiBObROGElSF2M62hZcCtjQNnXa8pvoyvKEmhHG
         BJIVkLJe3e2skKV355L91cbd0q5ogn8k8vsJ4gZrAXgz2YJlvuzV2utLKfeAe9i9AR10
         yOwAP944fLN2v9L2xF2ZuKVKoPlTUZ1HErUmME3ROWwcG/nb9i//6W3/TJIzDsjuRpXN
         +yjg==
X-Forwarded-Encrypted: i=1; AKwUvBwa59qMPZ/9TWWrp4PqSm/M/dJvb66CPUXViF6qRd6pjgSRfKmxbYTxlLBOVQVwZvGbiBuiTXGb8yqgSXA=@vger.kernel.org
X-Gm-Message-State: AFuF++nhNzr79w0gxfFwtsOlWvTCEpiJ5REY+8t3GA2FPjoX9+ppYLi5
	ej2cny6tq9bE2Kh18TKDpAZ+hU9+mO36lQgbjLB1zv6NZaY6lW3nARvO
X-Gm-Gg: AYBFou2MryM+fLzC4lqOVe2zGS5b0WVC0K3MwDf5Dfo5FLmzg3KLzo6G6lTBAs9zRvI
	bebeapxY8ceQQMyCjyhZ/8Ueao47L07fRTmGxYhLYuMGtD/pSRpYYq2q3lOP65GxlcSS9kLZuNo
	aWYCH7N2Q/6df/7chAoGiqZKVFCt2Ml7GlpcPv/VrUaMahNFekVzaqtyQyAr0o7dOtA9z3p9JRp
	CA83KJyfKjThGbgEr6/ZadRJPKUg8qnoqReq87/yGjBGFGmgX4YVciFVIVqVmdEa1VYl/RLfEHJ
	unkUHmDNkSSVABHcWXWky0Jz7s8bzWEnNiTOKts9+HCQ9QnPJGBkrd4IJEEuDErSm6r787wKBIl
	flQ8EMZTAYrStbgZrmJ1g5H+VEmnLopV6j+8Vs8IX80ciWae/w9VVM9jgnCd31+HkVCUg5WjDL3
	zVbEllbeiqsSvnq9vBOomuztnIK71rKzRVFbeFHT+4wYi4V1hoGZDqO1rJl1rze/Et85KlyloXx
	Ak=
X-Received: by 2002:a17:90b:1dc3:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39b26207ee4mr59834307a91.17.1789013192044;
        Wed, 09 Sep 2026 21:06:32 -0700 (PDT)
Received: from ali-laptop ([128.106.179.207])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d776184fesm2902396a91.17.2026.09.09.21.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:06:30 -0700 (PDT)
From: Syed Ali <ali.2012.asghar.cool@gmail.com>
X-Google-Original-From: Syed Ali <syedalia1000@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	vebohr@gmail.com,
	linux-kernel@vger.kernel.org,
	Syed Ali <syedalia1000@gmail.com>
Subject: [PATCH] media: airspy: Replace deprecated V4L2_TUNER_ADC
Date: Thu, 10 Sep 2026 12:06:12 +0800
Message-ID: <20260910040612.23253-1-syedalia1000@gmail.com>
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

