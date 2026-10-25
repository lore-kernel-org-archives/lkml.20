Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792942866;
	b=QVVsblmfgP3S1Bbq7yxl1gUNiFfxdbUwoTSMTDa9/Wcy2TNiRpTcWVr/aWj1Fno3n+7p
	 MtGibJnRV5ID5RSuhvBOJEWsvmlJYQ30hi1K49+lHs/ITudAe/qya73X6UDlmf6eF5ckH
	 McTToJs9HU6SRX6eqifY4nAG85gm5Lrx8qQgd5/TCstTAyxXZRNtAOX+avoq1ym4R/Xvs
	 OAxAdMu9IO+C2ithwTGrh/hktwLHW1dgdhnANBeasAh6gy/hTMnXqimQ6cdFxJQH+2DHt
	 0rAUFepE857gpCcHCWSXocbw3a9ZUQeTNErxtPKwNi1hFZhji81uXvTFm9gvg9Ewhjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792942866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CNhZAWFJxg03dxJBO1MbF9eR9aWYSPoEwZ+ATuYEVfI=;
	b=hkXlfxF/TbFxqaa4NHfCBgIm6IxrptiIbiRafyF1ljqqhELn9XARhPF+lvnHaUwGjYkt
	 f6Cgygxj5HKYhMqVDKj6oohzvJIIohEHInGUlOhwbc6Xu+DOEk0e3jGvbv63SPh7OiBCH
	 f+FenuERCWmWVRCfcjGxP7q4EqNbKbW3nRCLMjpgA9xLmSUcO6v/tya+UBF2i8Cls4Zt0
	 YRJ7WmAChJt2n9QUmkSZYH7WVfaYPK5rLQxrbH9Gt4AZRazylPAqJDNRZJTgRAE9duyyE
	 MtXr+fqMTjyJXa/qQaA6mBAn95fsF7m2oM+G81d2nf5FEME+8j1jLidJNtPYfubCWHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CGnLGRg2;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D81606A337
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52D81606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CGnLGRg2
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1343865f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792942865; x=1793547665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNhZAWFJxg03dxJBO1MbF9eR9aWYSPoEwZ+ATuYEVfI=;
        b=CGnLGRg2bLY5q4ihmT8WlU5l2fnMdm/ff0UqEnEiJiLO7cjuES/912YQNX8vl8nHzU
         1dEOmV1fPTLLoWZYPzCySR2/vq/7TzAFAOykXHSwTYBsEB82CGkLYNdeNQY5LZo1aQlr
         zp23/YRWTHIQnkNy2c42rQUcGi44gtq6zyYQQqlUQFFG/OpVwT74CN/4rCa18D7z3AcQ
         SJZdhKVZkywbbhOD/3W0thkIlRmBc9EU1U1l/mdC51fNvCRQQcy2or2CGUxJTJe5ToUB
         Y1glv61h+TGpTyC4a5l9pYYIx9omfRU44ayj09ghx0SY873yG0t04anziunNLX+wg600
         mVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792942865; x=1793547665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CNhZAWFJxg03dxJBO1MbF9eR9aWYSPoEwZ+ATuYEVfI=;
        b=QvhpKqA7aU96KgF4BN0BAUQyQ8DhAgUAqpPxwis+oold5R5RDwxDaGwyrW3Jtav9VX
         yUrk5Yu8+eNKDrYtX5G6yuU4oKAbgBkbetRMnXTiCnT8mlWsEq5xGlhHfcn3OZBna4wB
         YZFYtm+BZmtRQZAUpq6c448S//bKySQ0k14G4HNFkH2sZpBVTD8YiKAvauMjEAetfmWt
         luEPOJ3JA7EVtQzzFET/iD60dYEkLTPKa+VCNBgYlE3HzEDNlU26x/u0KJqo5Hd/26ep
         i3tN2erb1+PX8U0yb7PioSV/jDo53Zxo5pNRggADUyuN8X7DQNpSqSKyR+/ewq5YlWXu
         xB2Q==
X-Forwarded-Encrypted: i=1; AKwUvBytKDvy+lto+w2qvINhH6IgxKuC4+7qWdgQzeBp0bkUtr3HObeWoQ1U1WJYN8kPPiDUczqFYFG3oJW+0MQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv59ODk5U7NE2sVffc+lUxM7r5wldTsHGpuyEQkw9DIhDFkJlo
	x1W0l7aO5i8ye+qVvGlYlcXhM3rFMH1hBOMza//TEHGwEQFfLSu1W7Cd0FuObbds
X-Gm-Gg: AYBFou1trAgQHzC4dkxf6+B7xqz5N7SrZIMUu7Wz/EUnd9b7mp5XeMRL3HYlPfgE6n9
	Hsjdbhqd9Q3FvDDGSfSMogsrpF0l7fLWWbklWYD6m88AWyZ+XY6D65GxhaSuZLDB+klDS/uPK5W
	y86EPZGwMfTdtNzEhqDSkfgFyrPf/gD08Y1ypReuDdqcvduM7yKf5/ogVF7418KUGDb2zau7gbL
	LcgFqrs2lF0wN2dQlFrrrvOa79gLW7Lj++eG37iSZSHho2EDLTE3kEl4zAIOYuUOe/tkj6YRr5e
	mUISD+Hkj8IVEX1UFLB8XTC4A+cuAv1v1hNOu3dpjxUR9oHPWbNrh4UCn8pw2XACL+rxboOMg5g
	Hdo6jUWYG/3XgPDMmS/FYkLpQX9HTODeV1bqaJY2xHh8SSzyI0ye30wPZuP5sASPuGmJ2fA3lRq
	UxWb7ZCRIVwqK7n9iYN71u7XKxFYSJVhfXgJ7POD5K8aV3q49JhjhBs63u5UNXL+sRntEQyEuSS
	z0yPM2/QdsELe8ANbKFDW4PeMQeOR+9yPcyYC7xjt8iGlryyNT4k9pJm7X8pz+Opd6NVuHTjUCZ
	4Yplt7h6pbs3EqRwbt9yYEaFwsb9RM4qCsc=
X-Received: by 2002:a05:6000:200e:b0:48e:4831:ae20 with SMTP id ffacd0b85a97d-48e4831aeedmr4908781f8f.37.1792942864592;
        Sun, 25 Oct 2026 08:41:04 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm10487861f8f.16.2026.10.25.08.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:41:03 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: vd55g1: Support control events
Date: Sun, 25 Oct 2026 15:40:26 +0000
Message-ID: <20261025154031.27083-3-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025154031.27083-1-fernandorimoli11@gmail.com>
References: <20261025154031.27083-1-fernandorimoli11@gmail.com>
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

The sensor subdev exposes controls but does not implement the control
event operations, so VIDIOC_SUBSCRIBE_EVENT fails and v4l2-compliance
reports:

  fail: v4l2-test-controls.cpp(1108): subscribe event for control 'User Controls' failed
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

Add the standard control event subdev operations and set
V4L2_SUBDEV_FL_HAS_EVENTS.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 69ffb3a..162c2d5 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1447,7 +1447,13 @@ static const struct v4l2_subdev_video_ops vd55g1_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
+static const struct v4l2_subdev_core_ops vd55g1_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_ops vd55g1_subdev_ops = {
+	.core = &vd55g1_core_ops,
 	.video = &vd55g1_video_ops,
 	.pad = &vd55g1_pad_ops,
 };
@@ -1918,7 +1924,8 @@ static int vd55g1_subdev_init(struct vd55g1 *sensor)
 	int ret;
 
 	/* Init sub device */
-	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_HAS_EVENTS;
 	sensor->sd.internal_ops = &vd55g1_internal_ops;
 
 	/* Init source pad */
-- 
2.43.0

