Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920591;
	b=CjpLgbSFzWtQ8/0uXMkfPe7VzQZjXBqXNAYTFIesAWFKfS5GfuxICoMl5dwFztXxn0DS
	 z7YD+MkhBaoQFCEMcC6fbArubnpJf+D8lCxfCO0ZwsOM2iBan0FyMVA1gvKRctHmKHEXv
	 p0pXxH3nwMZ6FCj8G8Nl1C+GyNtb0ssU2Uu2kSfnIyatbczSUvgU21Q6/iT2D2sLMye8i
	 0WfiJmu17RmRtVMZbpp02fDvro+QK7Gmvjh5+KC/9tcn8k7T90YkWn+LAeUQpq3fhuscv
	 3f3aL1OMHcE0wyhcpBEM5L9lNED444ZdVrzCoReR+EtQHJm2zd6qK75lQT5X4J0BX1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eW3ue9WLZfBB2HPCyt9e+mQsboV2j3UFlOqWCXb+McI=;
	b=K9UmtA7iUuRx0UzziW0jEr5NmkVsMODdNYgJ9HwKuugJr647yIMyhPtkvOWMDH5bkCc8
	 p/r1oG8/BkQ/9IzhrgT/evYvjv+q/wJnKdfB3WfJReJv3B4fP8+2GAu/Ia6wV2hKkQUvE
	 tsfX7F/SVMm2IIPr1ylzRPs2wAMpvr3ZxSGpsqX9vLToYdB9YQOQCrvj8N+WKtMuGVJ0s
	 VC2tGf57MaJDKgoYWiSmSRJN3L24632oc0oQl/Io7WlOt7jxir7BtdEPvzAcZ4lLtipEs
	 uOw/mf01B2T3dG6/HZI4GOIpo3WznvBJgGYw6M7h+Q6wFvDDkOU6aeCj0EsUI40KBrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s4VJzlrs;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D146606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D146606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s4VJzlrs
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso231605e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793920590; x=1794525390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eW3ue9WLZfBB2HPCyt9e+mQsboV2j3UFlOqWCXb+McI=;
        b=s4VJzlrsSrvhPA/OLDwHmfM65D8hpBx2G4WNsRKMxZ+ZY820YJI1Z32gaxweC6e8IU
         X68dtLL2dLclHFTTfap514rxVB6ftpIMGLLmCj9LuSGqL5fxpWOaVCFhWTzKeFdXT9fC
         j4jxggOlfBbuoaob57s9Qejz/kaEnDdGfSxb/ug2WKLfg9ttXMFQ3hhituCXeHT3k87Z
         hna3yQLk5H4A1fVEAbCyoJbh9nEdFc/m2pRbJtxi7b1C68u+Vk1dBlBzsDsb+shJDNJx
         vROOKbncRp1L+RMVcJDaje+aYufY/CXrbT5q4eotN0ZMteOcY/NV2qc1sLfN8IGXs/jG
         Tv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920590; x=1794525390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eW3ue9WLZfBB2HPCyt9e+mQsboV2j3UFlOqWCXb+McI=;
        b=Fu5z4sB6oV3lx4svElB7hzvHPe8f9mBCYlywDHMvLe6w+BUwWT4TRP81dZZDbkUED2
         7FiN1mF65uDWL2bDrS3EkhwQZHFCKkWQHHXGrgmxF+EAWCSVg/qmJN3iQkSF9LQ3MVbw
         EIGncx+Ve3f3k0li7u27bTtV/YfAsGF0mee65FZfw6286mVd+ZSn34LMI42zcOXfPGMj
         z5GQeKieG+nG+ENN2PWhgUcq5Jxn+v5Dxr0dctJelWtFH2zY+iqbKoxgQQFSkePWRmL/
         T2+X3MBpaZ6holgPxgVaVgW3+9xtNBogWU9NwMXhF9juoKIr+FGtXX0+bA2EK6dItlOx
         aW8A==
X-Forwarded-Encrypted: i=1; AKwUvBy9tzopJauP4dgShjh+2eptMuH5mhO/jfUi5sg5/vvnnKH7PsCE65TrsKBnoPHFrFI8NEYfpfX9jxNB9bQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k9nhfj7xusvt4j5nr5v52rvAFm9GTP06DOZk2U2u14GrzDXcu
	cF9RyLBvrvJKTLA+dMXUk5zB6NqXfVxmta4GvKg1ckoIYHCDgzVEEXvC
X-Gm-Gg: AYBFou2yH/wn/Vkt7w+1tUD6nqXlXY84mWKQF5P3nL+Uy9jOI1OI8y4roD/P7g1X878
	KH/at2QNbKTmL047/GXj9GkvDsR/ijgDLeywl2+UWjbO/2oGyx6NF97NGHHoBo9Xd+KrDpIJV+5
	NN2Rgf0cuoNUH8SxEg1HD76zMwUSb6CitvMUOF3yJ0oI84qfvZTRPjoTMU+O1m3mY68lkgXr2m3
	mwvZpRm0D0bW3gPAbFsmZTHnfwhKOG/jG2CQ7557sq0LszxJ30I0vF+oLo8RMianbZUa6XHzf+M
	tKFrEnljFdCOk+RqcGiUlEhllUTdjWhQgVqWpnzNhjMHk4/gQq/yEzdqMbEm1Z4EsLQWJ2JIHCz
	pKvKmwSnUyaeeQFDYymzhwfgXNmlMgvDwjT3hxDhPGIq1VDRE1A3nbAHU+ftXvzYar98BOQwFWy
	oi8j4Plh9yL6IsMzBYodGL87Ht1R/kUPsaWD390T4pBlcHHWGJp7o25EskRNJ+HGfrhJAQn47Ro
	Ph6b0yTU3zRkCqZ8kW6HcCC7h99CHEw6OcOR6IqhOF2gyWvi1FlMIMd7GI2R35msHLZu7iy7mL4
	KF2FUQgNMsvN8dM1yrrJ48FRPoazpFgXieQuWfka5nUb7c/0oepoFfTh20jrAg5oRFRqCJY64d9
	8BldP91r8S4WXZTYLCbH3azAuLIYx9+1+tIw=
X-Received: by 2002:a05:600d:82f2:b0:4a3:7344:13b4 with SMTP id 5b1f17b1804b1-4b6df3fd27dmr10978655e9.14.1793920589397;
        Thu, 05 Nov 2026 15:16:29 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e24012c3sm10754385e9.13.2026.11.05.15.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:16:28 -0800 (PST)
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
Subject: [PATCH v2] media: mali-c55: Require an enabled link to start a video node
Date: Thu,  5 Nov 2026 23:15:59 +0000
Message-ID: <20261105231626.7152-1-devnexen@gmail.com>
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
Signed-off-by: David Carlier <devnexen@gmail.com>
---
Changes in v2:
- Add missing Signed-off-by.
- Cc stable, as d5f281f3dd29 is in the stable tree.

Build tested only (W=1, checkpatch --strict clean). Not tested on
hardware; the disconnected-node STREAMON/STREAMOFF sequence is from
code reading.
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

