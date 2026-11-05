Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917450;
	b=KA9SLYQaKidnUoA1HDwPD4ywYe72L+PwC2xueSDdLoLxUoBaZomVtBt1A44RcvzJ+w7u
	 KzD/mBjdFF3gEvNpWhp6i3/2UEN5iqdf8CSi+26679kcV5wUF2e9MasW+rZjt6iMyvQJ5
	 5FA6L8zs4b6sUhtJW0hKa1pzCh0hciqS+rq6ULgPb+J7VeDfU7TeP3OFXM5h7GG9Vp1LP
	 nGrk159G1C5GtjlFCxPhqItFH0He2Gq5iu10X+UVPSIJVFmOJPWj+NRgYN33OaZOIDl2N
	 Fj3vg0P3nV9O9Ienk4dUxO3UIUmLnBLyoMgLEmZ6RFzMN08rvdJB5NTLFr7v6lQ6Kow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a/93zaw4AX8lGgdPylyfPiPY96a6Y+qU6DA+lwaShs4=;
	b=riq14pfEdge8OAZVmR+tMV91l/mu0Ep4NL3OwRNsxlDovrNKeqhdlHXluNB0nVFAbuIm
	 kdKQ7NTisEcp5/As4hYJbwQG1m5hc3TYmX0sFZW6Goizk5SxeHGZeSEVryLc7+Vtn3C87
	 kF6mcDUxEX9VjGlTvpzO+PmAchE9KmE8DGR6zCeckfda/jA4eC4iw4GvzZq81+1YsHBSY
	 VjKQzZ/7JLn7ya9JgFnvjG0fAV2C/xO9x5MS39Rh9ngHrUoJhI2EBNOKU4z5yQ9VW7Dna
	 AKyXlTm5l7EWPn40227RmuZTaMRrjJU7H3a9O4tGizYIjeW+mMCYS9WBwOXRq0COEUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tF1liiZB;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EF6606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3EF6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tF1liiZB
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so330745e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917448; x=1794522248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/93zaw4AX8lGgdPylyfPiPY96a6Y+qU6DA+lwaShs4=;
        b=tF1liiZBOTcu/CwdREzojs+UHgrpf+bseo5Ggz41KbYGVUEY+3DFe+j/vfIoi4CJ6M
         NReoAYMO6vE7wom1/pj+31MYthiEPXuaHp6/IJw2Me7wQt7LBU80i6qEOf/NTwYNb8RD
         Ve3JE5CpQ/zhdLlITH0k38XtlOP77zvU0ty95g8pyKvDkZYzD8DrirS2CJ3EoczmD3wu
         M31nj0ybZx/Gb6aF2EBAfBitQbgsNqawtY/6ZbFfC7PuWDvfGrkjDdTWcd4ZbwVRUXuJ
         KrtUhnItb4U4Zz1+p597cylY1TK3RYgb9itabU1tmk1Zr+zNnSiG+xQnvsUkbfXDBQXD
         cJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917448; x=1794522248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/93zaw4AX8lGgdPylyfPiPY96a6Y+qU6DA+lwaShs4=;
        b=SCUwAEQ/PWQgwy9M+3jfy8trxt7rsPuZ6NlLgOfF9HbiYakumFjK1OS5sTg5ZE6mI5
         ltD3G+U41+8+sBo6ukhd2COMD+ZaREecXvmhiYfW65QU2r0jfWekUvBzXAXYDyoJhjQB
         6Xqmb2dH1dJI3L2ejwT3wjQhmFdUzzM6i46OwMQkMUju8F3Ozhw2v0/rZiLRdF06eyHp
         BJ1HY1IRaKxwpvTNrRafQdsuB1JaKrLVlrNp9we2GVHzqBe+abMy2PXrLb4am1MpovoS
         eXjmWd+CFSRzGrYmNBVU0F4j8FUj3uc6trd+tKYYUA9mrxh3MHYbmZyzK4IByYtfZSnf
         b6tQ==
X-Forwarded-Encrypted: i=1; AKwUvByGQg98dXYXyEj2WHOWPqD869PmectNZjQrdW6kimuwv9eOo5m+g4wTdkVa3Y9hmNSNfRuxI1RGb5sY/gU=@vger.kernel.org
X-Gm-Message-State: APuU4Z88VGQb+zrgoXBRE9H8uqH+h5KEa1N7s0ecTPGVRPTI0RBOLPj1
	X6gNiMYFY57nJ0w/i2bxGkWEfD7LePzegh4rnNlp157BxDJOD7MtkShi
X-Gm-Gg: AYBFou0BCeZ3WzeY6DBcShqpv2krOtq/UvJKT6nQhrIZZQI+sGfH6AhfIM9+ardYlf0
	5mrwQmlsyVJGOgcF6EuGzhS6xXiACM98J61Z0hF6izl6okAISXuz9BTfrYmwY1/qa3A+qtL2WvG
	0XkglN1JhGhV3t1PLDa+jLln+CmCLZYXRrCmk8gXQnBWGK8cKi3L1JiuEB8EINtG9wYHuafGLmJ
	ci1fiiQZdDmvz9rX8l6O39uqqXmjzsoi+JBevrm3FG7BS85FFchxZ6wMyIoHzQiCgEuRW0P5+2b
	nyoykOywDOLqsH4RzXY8ZajX7O2rlBKzZuKPo+fxwedTucyd8elxAodOByL8E0Tm8J9Uxtf1261
	NvIuBrRkGdVguHJbx7OxuU31OIpd7rtEcHzI36GphcbWCsKWWcccBEmv4QAA+4v1g1bGgs91LkX
	628aN88wSYF08UtKqfyKORXxGG4tCftuN+RihqoweapA2GPzFv5ijqQHYysu+HhQduYL+9jE3Jw
	n96LhHd313DVsUNnIBbzYSz5e2Xxl1yZqPKh3TYDz3ErGqEKaYbdhzNcb3E26x1kJ1r3JPynYoO
	2lmn6tHQnRJJskbBEBr4jmDYCakEZAvGnhY3bFiLRQjOJlh/Vfs4dDDuotN5lg3Ta17l/5XpjK9
	aoEo39kQUIH5aCA==
X-Received: by 2002:a05:600c:608a:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4b6d82b2c9cmr8760265e9.0.1793917448067;
        Thu, 05 Nov 2026 14:24:08 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63b79sm27407f8f.20.2026.11.05.14.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:24:06 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: jacopo.mondi@ideasonboard.com,
	dan.scally@ideasonboard.com
Cc: nayden.kanchev@arm.com,
	mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	linusw@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: mali-c55: Require an enabled link to start a video node
Date: Thu,  5 Nov 2026 22:23:31 +0000
Message-ID: <20261105222403.186948-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

mali_c55_pipeline_ready() skips queues whose link is disabled, but such
a queue can still start streaming on its own, as the video node pads
lack MEDIA_PAD_FL_MUST_CONNECT. Stopping it later sees a ready pipeline
and disables the ISP under the connected queues still capturing.

Mark the video node pads MUST_CONNECT so that starting a disconnected
node fails with -ENOLINK.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
---
Build tested only (W=1, checkpatch --strict clean). Not tested on
hardware, and no reproducer was run; the STREAMON/STREAMOFF sequence
on a disconnected stats node is from code reading.
 drivers/media/platform/arm/mali-c55/mali-c55-capture.c | 2 +-
 drivers/media/platform/arm/mali-c55/mali-c55-params.c  | 2 +-
 drivers/media/platform/arm/mali-c55/mali-c55-stats.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
index ff01553026fb..2dbce550d089 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
@@ -855,7 +855,7 @@ static int mali_c55_register_cap_dev(struct mali_c55 *mali_c55,
 		goto err_destroy_mutex;
 	}
 
-	cap_dev->pad.flags = MEDIA_PAD_FL_SINK;
+	cap_dev->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	ret = media_entity_pads_init(&cap_dev->vdev.entity, 1, &cap_dev->pad);
 	if (ret)
 		goto err_destroy_mutex;
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 16e895e3488e..0888dc4a340e 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -1014,7 +1014,7 @@ int mali_c55_register_params(struct mali_c55 *mali_c55)
 	INIT_LIST_HEAD(&params->buffers.queue);
 	spin_lock_init(&params->buffers.lock);
 
-	params->pad.flags = MEDIA_PAD_FL_SOURCE;
+	params->pad.flags = MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_MUST_CONNECT;
 	ret = media_entity_pads_init(&params->vdev.entity, 1, &params->pad);
 	if (ret)
 		goto err_destroy_mutex;
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
index a9c28b090b2a..a9172781925c 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
@@ -275,7 +275,7 @@ int mali_c55_register_stats(struct mali_c55 *mali_c55)
 	INIT_LIST_HEAD(&stats->buffers.queue);
 	spin_lock_init(&stats->buffers.lock);
 
-	stats->pad.flags = MEDIA_PAD_FL_SINK;
+	stats->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	ret = media_entity_pads_init(&stats->vdev.entity, 1, &stats->pad);
 	if (ret)
 		goto err_destroy_mutex;
-- 
2.55.0

