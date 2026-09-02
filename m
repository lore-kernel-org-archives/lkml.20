Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9BA47F2F6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349813; cv=none; b=DdmC6SDqAJtwdC8jgfv6PtPlyPX2YmGP1XdYBj7idQX7BiNZNQIdWgDFkzwJ/tvO2T6JcL7+RaAMWYTXPF8eagO4yUP7HDIbl6LYxwV4YFLn5wEBbemwbYvF0ZhI/q6yM2msBoYco5WyXRoBCceqfEUQvcmyN5DnjDBQ2UoimXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349813; c=relaxed/simple;
	bh=rcPjaCxjt4CqChPDbRtD9fLW1IyZqlZXFp1Fz2irvHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NIEvxtgNOucMEk1I+YR+YPgp0RnSMjDwjbyKwm8akB9d1LwBD4vWGWep6UsD7TOIxTQ5jN1qVvnVoplPuazXr8qmXH2BhVz734kvBkpFiRqdwUHk+5gfEnQl7h+P2BdfpH8v0CfQqRp0GzahAOqM1wuH0UtXP3lMy8E6roAn2dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czkdSIGI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czkdSIGI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso9495735e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788349803; x=1788954603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQYhF3JRqYQ4KMxSdHkJy21dirNqkSr4/Y/EOxbYYiE=;
        b=czkdSIGImZsA+QX6Hd8JQzj3yIowP8njwux0xWSHfO8znKMPT5tgSmJRSAeezNWua0
         2nBlEFuwpTNFGdjPV/tQ80exhRGeu1BLo/UwWEPTcxgVvMfaYdqehDN8+ZU0WJL77Zt6
         bbFK3+x/IemNYEg5l4MCaxC1ntGJjw8THGEaz7Ye+YhCRW3YR1o+Fb68jm/tQa6mK1/c
         IOzbALtTnsTO3bJJ24oIsrrh0gBILje+CXoyY2f8ita5C4quB95wPSvyJBfVGBqnXqif
         ZIuBVLOIUoeGQF/jFOVqL8OaZDRVuxD5UFnbBBboLuv4AldJCQpicF4OhqwWmG0w2ufx
         uHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349803; x=1788954603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KQYhF3JRqYQ4KMxSdHkJy21dirNqkSr4/Y/EOxbYYiE=;
        b=otvzdm+SG7fqfVgvaT4iZafywojbHOD/Zy6jLZcp9drbRztY4242LqJsPru2epQZjZ
         FuGsAT3bw/3qJWnOxRKLgsmQ34ZypYadkmyabyz1h+5Jz6spCOYBxbI6CeCJu9U4Ohhv
         FdRmH98j78/nYPgNUW4KJejeKclIdsUp+hJbAUqdIj+xpJEIjc2lxWlvf7qwh7vpjaWQ
         ZuAmz/cQj6APH9hN3/HOizHH3hwlHzwArduEa7drCKmKndNA5xYaC0dfdKuh0W9OPXgV
         8mAdUjOE09q4RuIYHcajH2X/vxRlUNe6xgVuJ1l6aALFpe4XE7DabfwYPFTtNznHSbVg
         bg+A==
X-Forwarded-Encrypted: i=1; AHgh+RoJeqULtrRkdsCVKpbEJIlvf8tAq9uBkCdZMc1phCauRn+NhmwEPr4LlVuzXQmsaHSLBf35ctHNfVzKxjs=@vger.kernel.org
X-Gm-Message-State: AFuF++m1jV+vnW+EnkU3ygq2bFPNARZfOZ1OW9ToTUrGNbb3xW1rTQpY
	zVS3/UGvDVUJZK8t6GDRAolIumzJE6cXyEMSF/2rXCPGLz3KArJ8h9r5
X-Gm-Gg: AR+sD13QH2zRfyXT3c/kUokiflCRaLVF1J6/s1oF2C3a9QclMChXclxnjXf9Qr0+v+y
	iuGXHfljAwCKDAe/+l9WElNULTsMeim57n0rMoCK+gVVyw72yOggAj3g048TSv+g2F+PJtqktKH
	wOSic2i+OzXNEg4mPP73wo1n/JdhYi8gYtLmetxTyF8p7uoiQTOQ/pMdUY6uaWuH58dOOM3VzBl
	8YNrbar4i0M2WdqTEzTdhYL5tQcYtynpxRy7afQCUIkwuO82MQ9AfQ4lY6fvv/eBekWcgbusAYD
	ikhz56kMjISGevG9hyR+HexEdTgVG0a2DdHh9gAqjJndXE1AYZqjSsGlIcYP5ECp/UvCR/j7z4H
	3Tn8nB8EXYtdl2Y7qEiCfPyttZBEVK0hfV/KpAGDrAdDRbc/DtP3z7Xoglqf6TfqBTgsfIRs6nu
	g7W9cmw4uhypuakb0UmYGu47DeODVkRmRd8+lhIRKce6qxVIxjjc95/s5nrAHyndoqlExl1FVAM
	p9jXKl3sJwC/n2ekut4dW4aacEs9yXwsN1wRIfieTHSWswwYfN2HvhXJ8u6ZA==
X-Received: by 2002:a05:600c:8b05:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49ce5817bfemr91781575e9.6.1788349802440;
        Wed, 02 Sep 2026 04:50:02 -0700 (PDT)
Received: from drago.hgw.local ([2a00:1d34:e871:1c00:d71:a9eb:b721:e4dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm33475835e9.2.2026.09.02.04.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:50:01 -0700 (PDT)
From: Deniz Aydogan <denizaydogan1902@gmail.com>
To: lizhi.hou@amd.com,
	amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Deniz Aydogan <denizaydogan1902@gmail.com>
Subject: [PATCH v2] accel/amdxdna: add NULL check for job->cmd_bo
Date: Wed,  2 Sep 2026 14:49:59 +0300
Message-ID: <20260902114959.9553-1-denizaydogan1902@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829080016.10002-1-denizaydogan1902@gmail.com>
References: <20260829080016.10002-1-denizaydogan1902@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amdxdna_cmd_submit() leaves job->cmd_bo as NULL for internal driver
commands that use AMDXDNA_INVALID_BO_HANDLE. The cleanup paths in
amdxdna_cmd_submit() error handling and amdxdna_sched_job_cleanup()
call amdxdna_gem_put_obj(job->cmd_bo) unconditionally.

Although drm_gem_object_put() handles NULL, adding an explicit check
makes the code more robust and easier to reason about.

Signed-off-by: Deniz Aydogan <denizaydogan1902@gmail.com>
---
 drivers/accel/amdxdna/amdxdna_ctx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index 31a414c3f..21f0560e6 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -575,7 +575,8 @@ void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job)
 	trace_amdxdna_debug_point(job->hwctx->name, job->seq, "job release");
 	amdxdna_pm_suspend_put(job->hwctx->client->xdna);
 	amdxdna_arg_bos_put(job);
-	amdxdna_gem_put_obj(job->cmd_bo);
+	if (job->cmd_bo)
+		amdxdna_gem_put_obj(job->cmd_bo);
 	dma_fence_put(job->fence);
 	mmdrop(job->mm);
 }
@@ -676,7 +677,8 @@ int amdxdna_cmd_submit(struct amdxdna_client *client,
 put_bos:
 	amdxdna_arg_bos_put(job);
 cmd_put:
-	amdxdna_gem_put_obj(job->cmd_bo);
+	if (job->cmd_bo)
+		amdxdna_gem_put_obj(job->cmd_bo);
 free_job:
 	if (job->mm)
 		mmdrop(job->mm);
-- 
2.55.0

