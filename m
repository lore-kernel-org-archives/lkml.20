Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F772D7817
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792218722; cv=none; b=Bq1037A9WjiPOK6sxU/KmvLb44U3cJd50HwgmuYlJiZNF+1ft0OL8VmPz7btLLi5n0q8geh/UmWIgT/RgMsOjSbTOXMWH7Q7MSSRTC6fxKRAQl+0viZsk/fdRQqmsION1O7PiFigf1qwz4hgK4pAVzZkbRiOa3hllwTJ7R/EFOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792218722; c=relaxed/simple;
	bh=PuRmOLLiOl0vNbuSoX1aqr5Q3nJPu3xcfW6e+17K9WA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u+ik9D0LupRFJpZTGOj31TrGbbXb2wjrFTriHnG62t78jAK9B9x+C3h6XkpaM3XQ7T9mvawYCbFGR7q8w1F/so4CLRGfegH4lYQ9k+e653cyNTE8hbtKFSk4L7y4kjaA9PYKX7kNZxfrqzvk1LJr9LXN7gcfLpEtIOohmnmaqeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RM3aiJ2Z; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RM3aiJ2Z"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30b6dad2382so1649993eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792218721; x=1792823521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gFJIItUD6Bm1Jl/9pga1RYfX1oYrLogK7vi+7ExnOlI=;
        b=RM3aiJ2ZvAVDL78rxBZ7mKFkTPhQWA04kbjZxUJcc0X8QSR4CMoPM0dzyb0nszVtYC
         J4sQYPq6Wg2s87iaBKeAGsu0JtwVui23nMZQBG2mlq8STwIeR6H6UC/Qh8qQ0FtnqT1Q
         QUsGhNxokbwC1jUztcx+5qtaDAYfPrxrFrPeuWQ4I+JZsA00egEYLevQs0DRncWaGjIB
         6+EmFILOy0FRCIZtL5BaCrwCByAPrleo8hHNlbHusypyNO950qNekIzYa966TAVr35lO
         G8+GuVYthHedCTiskcg2vrypImKT7XGLQgK8K03vwtU+Z07RNqcvRqFBlinzS/YJ60+/
         wibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792218721; x=1792823521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFJIItUD6Bm1Jl/9pga1RYfX1oYrLogK7vi+7ExnOlI=;
        b=VBkMREvpAoceUgPml3NP0gq5cb4/pIjJ1GLSUv2D4sC7qYsbMPXGBQidpRFBkDEpPU
         rpGFusfH0+C//Mk0saOdfBeY5w90ld+iHSnqSJ+vRwk+FVEw2bS55qfy5qaaaRX1HV7S
         l2AyOFnbqELAKNB/jOAfckZj+U4JmqVzZXEcmAlCkpkHd1BDr0qFbAJuA8hgJWM+1c+E
         xJkFyAutFBZR2pgLyuYUYsKfpahsmSQfn9lk0+AF6OGSoGLyJw886KceFvO50aJ/PDaM
         sWqo7Mrku5dtCRR6X7PapfOBFNrB80awGyJIYkyAWjZCoSE6hUaycVJO8fPt0AuFT8LM
         U+XA==
X-Forwarded-Encrypted: i=1; AKwUvBzmUvsyA5RMroZdmN8grk7jaiX/aGMXaTy/e0GONkeGoyhnb7dhaWfTQnSd2WfIlcHQRtjizejEk+pFaSY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL17YLHaAhfup/Y4XeWROPvT9Ol2GQd/D/JgsmbuqTCW96ZzWln
	tqLJO2PD0PYWbwB5XVy0yVNuCLMOycwQgs8XKDGaIAiLFFqf8oyxd7Ea
X-Gm-Gg: AYBFou2NMS6ReF3rblVDfV0Gs41hq6XdjiUN9VxZl+Zaj7T/Xn131gsRJyohZ5kuiP7
	0Avh6OMH+tb0pvK7ehXa8y70MOZ96jNRdLdEP2oDn4pEAm1SLXjAUnXEUcY43JHXlGenAv5d7kj
	GnmmlfifJb9MV5aX6713DkIPw0OTgLo3osYX9CFpGwIea6Hd9dWHLt5beTmFc5pJquusI2r3g6T
	wr13kHsgCbFJ98ied5m2AcM882H8E11bgaaP9Ir9bE1h4dMQsAs6T1p1G01u2zh12/Ln98g3Ky4
	tAiX6zmZpWJKD3tlnat3DF6aSg+ZxQ/YrK8hjNsuaFGZ3py4OpdMU7oEBQ1RiZjKn2shfEdSC13
	GPNg9WBhJ2nSre9GG1Zl/4wAZK3OcZVP3sKBQVrWSQYodVibuerBn2TlM7PXpdWo8Hawn7YKsro
	YJryyUhT1VSOG0JV1TogOH9agiVuiJnhbYkkGMxaF3PWFQp4HEeliZ6tKBqcNU9d4yntfa6fYi4
	DrpofzAKYbnMaGeE4h6MHvG1qnEqtyIFYmOffIy/VWX5i73sOcGzJ1E5elk7gZVeSnR3IoF3jdd
	/xAFRbCCpp/uGEF+dTBz+6Ht4xRXg9sg5O94pnY5MGXRP7ww6Q==
X-Received: by 2002:a05:7301:428c:b0:359:525f:74cb with SMTP id 5a478bee46e88-361a195b342mr2373779eec.24.1792218720406;
        Fri, 16 Oct 2026 23:32:00 -0700 (PDT)
Received: from LAPTOP-97G9G880.bbrouter ([106.51.148.253])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm22374749eec.24.2026.10.16.23.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 23:31:59 -0700 (PDT)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: sj@kernel.org
Cc: akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Karthikeyan KS <karthiproffesional@gmail.com>
Subject: [PATCH] mm/damon/sysfs: make next_update_jiffies per-kdamond
Date: Sat, 17 Oct 2026 06:31:52 +0000
Message-ID: <20261017063152.994182-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damon_sysfs_next_update_jiffies was a single static variable shared by
all kdamonds, so with two or more kdamonds using refresh_ms their
threads race on it in damon_sysfs_repeat_call_fn().

Signed-off-by: Karthikeyan KS <karthiproffesional@gmail.com>
---
Testing notes for review:

- Found and confirmed with KCSAN.
- Repro setup: QEMU (x86_64, 2GB RAM, multiple vCPUs), two paddr
  kdamonds, both refresh_ms non-zero. kdamond.0 watching [0, 1GB),
  kdamond.1 watching [1GB, 2GB).
- On the unpatched kernel, KCSAN kept reporting the race on
  damon_sysfs_next_update_jiffies, again and again.
- Ran the same setup after the fix, KCSAN still on, nothing reported.
- Tried the same with vaddr kdamonds too, could not repro there.

 mm/damon/sysfs.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/mm/damon/sysfs.c b/mm/damon/sysfs.c
index 160292f077dd..872b89f58bd1 100644
--- a/mm/damon/sysfs.c
+++ b/mm/damon/sysfs.c
@@ -1789,6 +1789,7 @@ struct damon_sysfs_kdamond {
 	struct damon_sysfs_contexts *contexts;
 	struct damon_ctx *damon_ctx;
 	unsigned int refresh_ms;
+	unsigned long damon_sysfs_next_update_jiffies;
 };
 
 static struct damon_sysfs_kdamond *damon_sysfs_kdamond_alloc(void)
@@ -2215,18 +2216,16 @@ static struct damon_ctx *damon_sysfs_build_ctx(
 	return ctx;
 }
 
-/* Tracks when the next periodic re-commit via repeat_call_fn() is due. */
-static unsigned long damon_sysfs_next_update_jiffies;
-
 static int damon_sysfs_repeat_call_fn(void *data)
 {
 	struct damon_sysfs_kdamond *sysfs_kdamond = data;
 
 	if (!sysfs_kdamond->refresh_ms)
 		return 0;
-	if (time_before(jiffies, damon_sysfs_next_update_jiffies))
+	if (time_before(jiffies,
+			sysfs_kdamond->damon_sysfs_next_update_jiffies))
 		return 0;
-	damon_sysfs_next_update_jiffies = jiffies +
+	sysfs_kdamond->damon_sysfs_next_update_jiffies = jiffies +
 		msecs_to_jiffies(sysfs_kdamond->refresh_ms);
 
 	if (!mutex_trylock(&damon_sysfs_lock))
@@ -2274,7 +2273,7 @@ static int damon_sysfs_turn_damon_on(struct damon_sysfs_kdamond *kdamond)
 	}
 	kdamond->damon_ctx = ctx;
 
-	damon_sysfs_next_update_jiffies =
+	kdamond->damon_sysfs_next_update_jiffies =
 		jiffies + msecs_to_jiffies(kdamond->refresh_ms);
 
 	repeat_call_control->fn = damon_sysfs_repeat_call_fn;
-- 
2.43.0

