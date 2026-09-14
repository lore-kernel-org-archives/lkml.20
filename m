Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BF737F72E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410467; cv=none; b=bG8UqvtqW66+RlWtu6a8ccxhe7X1m/bEvvkC0m44lUrMFawHlfTgug094zObr9pIOGBpeMny2rzhMamyVb6mot6il2ltD+ffOTOII6e8qp7L03bOW0yzCUtL9SnmgiRAticSKbDpVlTr9A1Wl4bE8ySWge5bmHtcY9QmybcAxKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410467; c=relaxed/simple;
	bh=ABuqQ5XwX/cOdcoTPdO+KaRpLQdKgjCBdnNplj1yLLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J4ET1KY5iMhEgZ7F5/zReTNH64rI1JI/dlq05rgceyDG0NQ5cWf3qhAZTxvEYXPwnpzk659jq8tTBZY6G0LraMW4RYNgjLAV7Re2sodENpBX/q+UyfmapPtXNO/+EFY6vgOhO4+naB8G+vtC+vBw2y+NIwM7WAo1Huhx9tCLW2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ph1mYqku; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ph1mYqku"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-486955ae01eso3018325f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789410464; x=1790015264; darn=vger.kernel.org;
        h=content-transfer-encoding:reply-to:content-type:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mwRvzG4BggeeZAyOCJrpDH7mtfHbO/g8nfKHTJvLmaw=;
        b=Ph1mYqkuccsZrJHvhZE8HMXSMveacHvliW9ETMZix2u76c7tb1C70hNKOS/QUpd4/N
         XYonQ8Gq9gX223+5zfQnXnuauU9kxVVL3mqOWLbmloGdtYccxOaawgD7UDBJHehsaOqD
         WuLacRuPNI0PuKzAHJ37zY2AbtEl5b7ayjbAxiZrCdvbMxQhU2RulPvZbWq2rrnSFgAL
         D50O3tE6hm/5lrlKwz7sssJYQbdCtku8cSqGM9mFB2HPfo83WLrfE331b0JRepaPWLuH
         Ep7P1lpSSOtRCrLPfvJDs7fOzHTodr47qK7hGntvdATcDqHTcwKfJ8tOANkEf2dwsm9X
         shPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789410464; x=1790015264;
        h=content-transfer-encoding:reply-to:content-type:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwRvzG4BggeeZAyOCJrpDH7mtfHbO/g8nfKHTJvLmaw=;
        b=UWBHhxLGZ1DRjOZnYCXO6azNfV5pPFqCBGWyf2WzUIJzYiv5MTYCImJJhQ20dx7ndB
         KTTJoeBM4Mriy+g/kw6QUOA5+LPawdyhHU/rmmI1iOzxF63OHt9as426yxf48eEX78yt
         tUsxLZ3m5zl19+GNM5Lb47y4jmAHXRu0dL7XSsFVqfGd7AQQ84ozorB/St3vhBj4rpaX
         Uc0cyBxlqiOIjesUSoig87VCYwZTvoE3ywBgDIq1P0XCHjlJgi14XNbCG/NJ63fbbo0p
         o6pj7m/+jBi+f9ReWaYohqG1jI0Sh4CNBuCRd4iwiDAT/G7++qxx3P+M0wUNBb+m4KM0
         CWVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaok8WZlRGG0ZCe3RL6bonmhMULCRQtCMmdBO3Ry6gs7nA9hcN3ezo4MVo7Gi5tZTslGRdXGKaUlvRj5M=@vger.kernel.org
X-Gm-Message-State: AFuF++llvOadEof4mcrCi9kfNK/UaHU4Lfj8si2J7hchYtMiyEgKqXlR
	tL/9/JaNv7S3uFPlsKFX5faCt8C4MghdY5h290kd3FHzQ3rU4gOvuc3S0guoGwdM4RQ=
X-Gm-Gg: AYBFou2oww+GuV9wHFjAUVlxNgGB4Q398bA5PHCpkKaePUxjQujWVbdmqbFbvdor+mD
	6Dbsz0tt7RtEMvZkgQPA9oF2XlqApMSPhpTTX6UqeJRy180nIcLoWJ6ovGj1sBRgqAivZ2nTvR1
	4IDCrVhnpM671OVE+hNmO/cgftjGWSgknEsUlpJZxTG4hsp9NU07vzPddm/s3ZHyILhm5RbF6UC
	Dhc3i2YJON/zWjLLDm/ld3xUVOYmyZ7JlZOqPPSfbMyjZ3GdHNdvaapA/8EALzO3lB7tkDUriP5
	GnPHOudr3eDC7+q6EMYSRL5Jh4fDezvNYnhFay1pPE0O4n4hsaNOFGnYx0B5ognyTijhSNGhNY4
	wDDj006bXQ1wyNuLEhJUKUCy3BWbjvVBS8+oFb9dk94IFNxVPUTEWPeaxWAQeYamOv7tIavpS9k
	23FpQd8puvSqu08kAzOqwTcfK2wM8baepmkH3M3A0IPTyphObrlZa66larE2uxI1+y0zLnVV93L
	qP7dyxGMFQ=
X-Received: by 2002:a5d:6f1c:0:b0:487:7d:4e77 with SMTP id ffacd0b85a97d-48702b3dc21mr4168772f8f.40.1789410463848;
        Mon, 14 Sep 2026 11:27:43 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15de:500:7152:15ad:a382:94fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f0403125sm25397683f8f.8.2026.09.14.11.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:27:43 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: phasta@kernel.org,
	malhyuk97@gmail.com,
	tursulin@ursulin.net,
	matthew.brost@intel.com,
	dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mdaenzer@redhat.com,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com
Subject: [PATCH 2/2] drm/sched: document the RCU dependency
Date: Mon, 14 Sep 2026 20:27:40 +0200
Message-ID: <20260914182740.1587-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914182740.1587-1-christian.koenig@amd.com>
References: <20260914182740.1587-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 8bit

Tvrkos patches added RCU protection to the returned strings from
get_timeline_name()/get_driver_name() callbacks of the dma_fence
backends.

This fixed use after free problems for a couple of drivers, but we never
documented the consequences for the drm_sched_fence.

Add a few words on the function documentation to note that we need an
RCU grace period between signaling the last scheduler fence and
scheduler teardown.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 6cb6f95464938..f73c5141b4e5c 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1203,6 +1203,11 @@ static void drm_sched_cancel_remaining_jobs(struct drm_gpu_scheduler *sched)
  * is implemented, all jobs will be canceled through it and afterwards cleaned
  * up through &struct drm_sched_backend_ops.free_job. If cancel_job is not
  * implemented, memory could leak.
+ *
+ * The user must wait one RCU grace period between signaling the last hardware-
+ * fence and calling this function because the timeline name returned by
+ * scheduler fences must stay valid until all readers have exited their RCU read
+ * side critical section.
  */
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
-- 
2.43.0

