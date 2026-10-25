Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792946470;
	b=dwf4Ly0TIMEg4GmTz2vGpWtWTkrFnCuXGSdoWEMXJci78JhpZEAF/fmGCqNb0vmbTkaE
	 FQyVXhnJpFZoSDtDUndjFcr8uiP1lJnHjYPBHoZ91ocKDj9DztXHlSwlmsynHjQJfzKpY
	 Z/rRcj2q6rfGMGBjjDjvQi4iCaSACjy8iw4dh4+EcjvhOPayT9ZkrzL39xxzBK/ivoyWG
	 T9bgdVPSyMlZhaBV6kD9FYPTSqCH+q5x2xEeAsyb1oxIUsGshtO/gr1ypjUapq8/u/TyD
	 i0mP2ujWn8IPR2NjF1I7CjcF2m5AMwxGrZxAerjU8HSSY8RqgHGnJXdmVLVf49O95MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792946470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JmLdIeJLU5Zg8gQdXAkuqH4+EIySSj8cGqNAiNAR22I=;
	b=KicDYRf2Jhl1w4ZotOUfBxEc6egMLrBBiWEYmWGnstdCZaG4hwHUbfL8GlIg1xA3ndL9
	 /dDfVxAfILJPiQtmHu3RkAOIM11EDP2LLbzK6xxAV8sZX81KLlO8ZaScKLaZd0wofnG47
	 X5rRCNIg6uz6y4CR/HIbDOgBZ/+jDR/D3hztZthv7VplFIFB0FXPp28eCgEFw07jvR9eu
	 fbUirqDwZr7NDEBEc9IL8lDW1Tz6n9rfCwB8Pf5mmf+3bA02qps0RT+hRrPMQQaxK7xIe
	 MmH18N9xYVgKG6+S+ue90zbh4UhMvOw0ye4NlFUIzCJThA+ORgHp0DSIgXm8Qi9NipQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BbPfUDYD;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F436606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F436606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BbPfUDYD
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so18208665e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792946469; x=1793551269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JmLdIeJLU5Zg8gQdXAkuqH4+EIySSj8cGqNAiNAR22I=;
        b=BbPfUDYDtaTD74tV97IBv3KB6VSU27UVf0Dp7Hz+N6SYX1csLyVFz7ThweJFUJI8kG
         aINOUaj+jPoMxHxW6VvR7oxTh9OurBAsokyaZiHdtyH0IIq9ObOuQMpC2AXMnosblmPI
         kmPYpFpJF2IIrgkjsUpndEwdJlufdmcwwdiTGnX2AkCGX341WzfrFdNRUbDn6afr9rF2
         tM603V4IpsO08b1k+BqLjTsjVG7SnI3tUtuOB0znuuKRlzEtp3S7S/wYeyN8Hw0NvBZ7
         G6NGZ67qFTh08HyURJk4zNJofXLjJZsF+r/DiTSPQsSrvAM4aAvdtdg+FZWh0axVgPWy
         uRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792946469; x=1793551269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JmLdIeJLU5Zg8gQdXAkuqH4+EIySSj8cGqNAiNAR22I=;
        b=WbsiptkTYVDEcTsd2vNxxxxFZOj0Ma1x805vMvgdfaCX+R0k9B+3zS7l73zvygQJEO
         aTUn5Z73kvMAFSTcNZTfhrOWbZKJpVCzvzpnuGi5Nqoqa+gPkYqddsSPcugefCJLZrlY
         TApGKotyrNr13reGfZb20yp7Ej9LQ1ktsNTnr4Em6yOkhfkuRkRRIu7C/gTEfitVL1n+
         US31/eFlnFy8SVrhlqR7zH6cKL0OEmqjEmrArVIzi+edHOo7P5LLULbjTaA5SHErTAZS
         XYLAAmc2o3B80CHEtLQ+NDthH4PjXbVSh2xTfjKFWLrLpfDaEIB9RH7nEKSv4ONPlVRE
         ZTTA==
X-Forwarded-Encrypted: i=1; AKwUvByGJXCrdDLV3U+CsMXViMr3fMav8LC8dAZtzMRaN1+O7pp/bT1wyIFtum+8ByRrussjgrvTIJwhURgQZW8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKV2eamDyYBkWElR6PZ60xUZKM3TTm48OOjicI2USDquQ1n+xug
	tblcpd75WUKlIMzWjd3N+IwnAucFiI10NDqmfKmdh6C/BQwnHWV2ZV8B
X-Gm-Gg: AYBFou023jlLVtRq6SbE8xGo/iYRcKo8vdl4rP+g0e7IHVHQpl1BPvR+EzOoXnF3lw0
	0nV+wH1VAE8C2LfEGUd7PnA1iClsSRq/rbOJhumXN7m68Awh0eeJDeD45V0Nl4XBSQE1zEDXbl+
	B0+LDuU3SRBrJdJ1rmd4tpbBywLH8PT2t1cH9hQr2vJa+BHN2whBQqfdrUt1ltIBLbIHtrpGRZQ
	QF6Sb3QIQ62Xx00NvoX2HvZTJSN8ZC+XWOrgAilGcxVaq5H91RUMEg/Kn4w3RjH5RuSjUQFgxYi
	3d8PYLaIyunXeVZ3/VDXFrvnV5Ofsw9qI82k6CERhA2sMI25i0ACtUOpwOImHT6MTvEOwvC8Lco
	2ZgGKxh0nbUCx6dFHvswqJVBWCiaOrzukrqG3eodLiW9/n/8ilenPFfeHAjd77STEy8p5CQ+pe4
	PHGPAfTsfWxdxZCzv0pQjpgD8j7iC988GPBueaR3gigR8Yepn6b0lWZz8h20ohpr//hpznIkx+W
	iF+c+CwOhuQ04JtP75v6ab6xPJhxT37EDBu1ATvH/Svf35gvnr8uQS3FjinnenkLII0ihnvzO3i
	EyM=
X-Received: by 2002:a05:600c:34d5:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a35aca2b53mr70429975e9.25.1792946468523;
        Sun, 25 Oct 2026 09:41:08 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([213.137.79.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm158194305e9.1.2026.10.25.09.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:41:08 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] genirq/matrix: Update availability for offline managed IRQ changes
Date: Sun, 25 Oct 2026 18:40:46 +0200
Message-ID: <20261025164045.2513933-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The IRQ matrix caches available vectors after a CPU's first online
transition. Managed IRQ reservations can be added or removed while
the CPU is offline, but irq_matrix_reserve_managed() and
irq_matrix_remove_managed() only update cm->available for online CPUs.

When the CPU comes back online, irq_matrix_online() adds the stale
count to m->global_available, causing vector availability to be
overestimated (or potentially underestimated).

Update cm->available whenever the CPU matrix has been initialized,
regardless of its online state. Continue updating global availability
only for online CPUs, leaving first-time initialization to account
for existing reservations.

Fixes: 651ca2c00405 ("genirq/matrix: Handle CPU offlining proper")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/irq/matrix.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/irq/matrix.c b/kernel/irq/matrix.c
index faafb43a4e611..5a6adf8844903 100644
--- a/kernel/irq/matrix.c
+++ b/kernel/irq/matrix.c
@@ -225,10 +225,10 @@ int irq_matrix_reserve_managed(struct irq_matrix *m, const struct cpumask *msk)
 		if (bit >= m->alloc_end)
 			goto cleanup;
 		cm->managed++;
-		if (cm->online) {
+		if (cm->initialized)
 			cm->available--;
+		if (cm->online)
 			m->global_available--;
-		}
 		trace_irq_matrix_reserve_managed(bit, cpu, m, cm);
 	}
 	return 0;
@@ -275,10 +275,10 @@ void irq_matrix_remove_managed(struct irq_matrix *m, const struct cpumask *msk)
 		clear_bit(bit, cm->managed_map);
 
 		cm->managed--;
-		if (cm->online) {
+		if (cm->initialized)
 			cm->available++;
+		if (cm->online)
 			m->global_available++;
-		}
 		trace_irq_matrix_remove_managed(bit, cpu, m, cm);
 	}
 }

base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
-- 
2.43.0

