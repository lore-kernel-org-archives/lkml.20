Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B062BE7A7
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330400; cv=none; b=FJU8eB5S7+aj9pg7mAd6XQNdD14zmTDo6Xbxfz93RUIvd0Ja4up1a43rdjPIM+Q3wJwNmyXztNhJDbYv7HY5wUY1tf9QH4Jv6gw9yfJhJWxUkbhIQsphX0lrp961RE9x49XlgGYWVWz+o84Bu+oOGCNnSydwa/bS4aYTz6pGKWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330400; c=relaxed/simple;
	bh=J4YxcFJ1g3QSmDzzRn6C3yahYut4pyt2reRRU8H73OA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jqpOQenLp2XTYq2VlZLJYpXHxdrs5bzeNreoNm4DXyP7Kij92p8Zin8LXlv3RJugve4Z5yAOSV/RbUPSDMGL4aa6DEvJBd8hIcrNIMDKg/sCI+nfnqvit6or+uO0DQvhEbow3MwemzNTRSI1aScH6qflwtywQwd8gNY1klMzE88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtG0cRtO; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtG0cRtO"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76668f4ddso632764e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789330397; x=1789935197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvQTHWXId30lHl89cQONJGQBaXvDgk+KicdEmbWVsGQ=;
        b=FtG0cRtO2/M+MbW3dr3IZLzSJgQgykkz7udtYjHBX0xyDgb177sSINfkGGYqXX4qkl
         HIg9naHjqX3UzUvw84NvpitT5n6JV8p9s7rT8jZfZbb4Mbaf4syLxwzOfC6tdHRErTkh
         v3FUH2u9p67+zYMIp2JmO4y2ic2GjtMEmxTtmXo70pXf7o3fqbJuhibZZrO/le3fs/pN
         4BsM1VfoPRTXPUjPXebWNmwFza4AbdmYt5dq3c4AzpLSiCrMu6Zz2wGNNvjiko9GOlVq
         zIAzd7V3llkmIKWocCAykPOLnww699pI+pyTtzhe6SSwIoZyQVLpyXHeeW9LyduJaPK7
         6MmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330397; x=1789935197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tvQTHWXId30lHl89cQONJGQBaXvDgk+KicdEmbWVsGQ=;
        b=EPAn3Vgbmjf+/fPjgOkilTdjZrqVb05J5Vd07jujS1nLM/KWoU4r4IfmI+RG+yoZm/
         h4jdug8cLPB3o5g+JlPCepIM6m0lynVKObJFC0ibdBtznEaYDYetjE7NJJc4mFQmr6ET
         oPVpCusjKB1SH6t2IO+8eHv22p40DvhzFAcj1vI97rZhmxCu4/LKmdhJ+xoe97PxWgEW
         xLpR7w0brwS/QB5yYZA7Ug3fNXHjm+/xxB9ZRpQNGgVesCI/kWX0GsDbLzYB70W2ONCd
         biCyoCW7MD9VSZytwn7mIFaTnAiOZ6OmGRpDTf5LuPSwz1nTBozCHMg3rd4+yV5+0NTA
         73nA==
X-Forwarded-Encrypted: i=1; AKwUvBxDnLA1sdDH7SN1QjEdyuWo0SKJKGvkBbarMIP/wLMD/FLWOzzBRLhlfisUAHUI9gX5TsUWMmxMtsD8LFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lxm7nYlWaNa519y9knArO5Jg0reOqm3u1gOPKm5x12Wpc+crU6
	P73eXYLslehe2D/sRBaP+0A5XO9nz0dFDcZVXDSHMbz8UoR6iebR8B5K
X-Gm-Gg: AYBFou1qEaLGywoYpNduQNyJpeMITGI3FCg7mX3pXYLtj+x1C+JIENVSeazbQjpK7dw
	cvG2hcGQVID88uqb1SIEnMP0ZJoTs3nPwfnpLAzpi+SS65M476S/MwaU8tmJV4IpGg84yc5g2My
	uEZtLfT4wE4yKgG7K8l7jvsb6mkoGMGVJevjWWeidC9Qo3Dqahd5zpq3+JN1M9Fg96NQOuHOhKX
	5lDtTsyZazdkxvcd6xnJ8oPtgD5z7VP7hsQLaDKNvA6aGXlZC1xSZwK6lV9wKwEIVSx25b/BHg4
	KGgNnPUZEzWHZSUrVFvHUAeuw61lCn6uwDhZLp0ab7oH4Sxu/15YOkXKTD6I/l55DHyGI1Hazl4
	VczuWV9IqD8n2rpySM5aAo8cqoVMxOxeSBTEpl6L25MiAUqsraLvnKrNo9DMQ3oubYtSvBP7Qqy
	/B+S4Oz1ycws1xzCSXL5dYVGN9arNlCcrUQLIJ7bd/PMCP79XXsmbxZySugvzONWO5ic6ul7HR6
	YumDd1th4ab2ZsUXGP5G7RkRec9oGPNajpQXBuXvS9o
X-Received: by 2002:a05:6512:159b:b0:5b7:f0b4:de57 with SMTP id 2adb3069b0e04-5b8abae311amr551289e87.6.1789330396785;
        Sun, 13 Sep 2026 13:13:16 -0700 (PDT)
Received: from tallipc.shacknet.nu (91-157-240-22.elisa-laajakaista.fi. [91.157.240.22])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a03a85cesm2003345e87.1.2026.09.13.13.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:13:16 -0700 (PDT)
From: Risto Pajula <or.pajula@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Risto Pajula <or.pajula@gmail.com>
Subject: [PATCH 2/2] drm/nouveau/fifo: use global nonstall event on legacy FIFO
Date: Sun, 13 Sep 2026 23:12:25 +0300
Message-ID: <20260913201225.5975-3-or.pajula@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913201225.5975-1-or.pajula@gmail.com>
References: <20260913201225.5975-1-or.pajula@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-runlist nonstall interrupt handling change made channel
nonstall event registration use the runlist ID instead of the global
event index 0.

Legacy FIFO implementations do not provide a nonstall constructor.
They have a single global nonstall event, and their interrupt handlers
signal event index 0. Registering channel events using runl->id can
therefore leave fence completion waiting for an event that is never
signalled.

Use the runlist ID when per-runlist nonstall interrupts have been
constructed, and keep using event index 0 for legacy FIFO
implementations.

Fixes: 55e1a5996085 ("drm/nouveau/fifo/ga100-: add per-runlist nonstall intr handling")
Assisted-by: LLM
Signed-off-by: Risto Pajula <or.pajula@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
index d6a87cec2..b96e84192 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -52,7 +52,8 @@ nvkm_uchan_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 
 	switch (args->v0.type) {
 	case NVIF_CHAN_EVENT_V0_NON_STALL_INTR:
-		return nvkm_uevent_add(uevent, &runl->fifo->nonstall.event, runl->id,
+		return nvkm_uevent_add(uevent, &runl->fifo->nonstall.event,
+				runl->fifo->func->nonstall_ctor ? runl->id : 0,
 				       NVKM_FIFO_NONSTALL_EVENT, NULL);
 	case NVIF_CHAN_EVENT_V0_KILLED:
 		return nvkm_uevent_add(uevent, &runl->chid->event, chan->id,
-- 
2.47.3

