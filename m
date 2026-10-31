Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417574;
	b=Lx8fkg9WAGuWBSQXuL/TIPW0vzpOizDPyarkt4dVwZ8Kx2wpXP/t6h6km9ILQCuU+0/K
	 GWM/7fH30GLfytwkrfb6+/5SBFrG1IScHWREh37eZYI50Qbm/LSExYwjeDcoODBkrNNNe
	 AGvUo8vpxqtU8IWsOS93nhXx9WrZAJztGNyjSOhEpTFiAwPvwMekAIxD1f3SsuE/SDwjj
	 bruEEm828uwAG5WHE/xJRvxTKnrAPMRGAAfNfJrWXJxelXvOvMpYqtLEabvk4cR6RrPNH
	 koZWuqOB1gIkN5kIn0aqN4GklvDnTYcTSOtxWqo2FjKkteGB96eFt4tWFI9HVPGO8Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yNBCcyYS48KOF7Z3SVlpQ1pq/HG3PypPDg7sc6kq5zE=;
	b=eWW5E7e282IsLpAA375XmR4vJYPC9vT5teOv9l/M4kg3/QyF1C5L94d0WmpEe+CtrEPq
	 8DKO9er1g59XGrTMjjeVqZVpIykcfCIugs8yALEBJaoPIoCp1MW+Zb9FdJwY3nyYd4ofy
	 jpCEs6ntuhZS2AVSFO5tuBOnsGhj2Ih/FRZlgrblK62UJrdKCy+2Xp3QKck+i9Dp27ZdQ
	 Hw27FXqRxRnda578720zFSx40hAq02tS+XhLTYtJL2OZUEpsRlXc3CHaPBjQuIVtKffpV
	 OqacgqpIUqCBDWvGlhqQBOSzFRN1ZZrMaB5cd4X9FwgX04yglqjxAvd3d+jLdDgTSdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BSGsgJ7R;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2F4606A322
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB2F4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BSGsgJ7R
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3550c917fd3so1833839eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793417573; x=1794022373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yNBCcyYS48KOF7Z3SVlpQ1pq/HG3PypPDg7sc6kq5zE=;
        b=BSGsgJ7RcTrehIg5BXsMqBpgIgZVJn6DvdLhe1XmYzIAfJFoYcAfKeo57i1+6Lb7XM
         05Bb+8zse6Y7zJXGhnxY5kT/TlVlok50MwP4TLdvKUAnEg/uAkA1vUcWFFN4V5AZe7XA
         eccHJTMXy3soVRWfRAw6H7+Kxjb0wZV+LR1FAvG2f5C2LCFcdXlTklir+7HVJV4MammI
         qRcgOTMQK+dnUorXJIx79GkEBCKpdfugnmi9VsILQ9GDm/LRHpT9rArl+NxPBgu989U0
         px4zEl5QCQHPemvwTXIX0nV0JjRXW6EtINh0w2abtJDfu7PRbZw5POHhASuXlfTi8kVF
         GSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417573; x=1794022373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNBCcyYS48KOF7Z3SVlpQ1pq/HG3PypPDg7sc6kq5zE=;
        b=XNVpTRohDtYNCAF+tJnZFEmop5Ol3kRmUTOuaVQmp/EejphduKoZ3tYvWacjFTW3ql
         TDi2ql7A82ygx9s2WseEIaUM7YCJg7D54AvlJzia3FMAGPcQym2ZVipNxMFKU6947PzS
         ZlRQFY5111A9q+Ffp6UZdRXnW3vUT1uK5QQfXNGiOxqmTWM3Duw7bj7CHPaJhkALCokv
         0sk6LQ5VCYXtztT9Xk4fZ2kAXeP97xKaaYFQbN0yjSc6IoPzYu5dqMB5xoBR6VVQayBK
         1XjJ2j1JkEF8kF+1wsUkhwqWfVzeap2i6KqwklQ/ZvPw4e1vmpZ9Kp3VdmE9wUX1RbFC
         eLWA==
X-Forwarded-Encrypted: i=1; AKwUvBxLgN5DarYXlwcGqR2gk+kQLgxteTVb0DfdwFi4wp7Q+56HbTa5hUvifq9GCFQwQhVecqdg5LcMPtWVil8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/bpgMin2OcfMPa2bL+51rLoWHj3xKMuZvBG4xwi6l1PF+5h/s
	7Q7dLnpqDTlwZg9qzOnrWJnLnakRs/QkWYHKY+B0Cj/naOyknNwTKxGKs8GoMv8gI3I=
X-Gm-Gg: AYBFou13WLPTkhgVrFDyy17daYxeV48gxeBld6At4Yk+tQ4PNRf+ajqMBEtFbHO2D7B
	SaO3iVLRKujq/DdqVuspJOPtt2mpyHXocwZgjdIL2iG6DTi3WH3y1Ev6ItGwy3hRVX4xLpw6j9v
	V1jzdOoNY6tylwgb04a/wrFk45/Mboc6+qMa8AQczpmwneAMfUq5kRoNOaqHei8lbmPXx6KGjiD
	6SLomXrSLfBZZjDvKGqi5iYw19VLizaFXE5Ttu/zOaIZU8EVa4yOghZJfU6BFBFjJk0eG6ufI/t
	HXCoCQxbTy4xCIKbNghCOMl6lnj5o8gQGi58P2rr9SPdgmvLxur7fs37Kbo20E0FskxkuvXoDpi
	9BkcqlNe071SiR89vAYFr3iz501Ga/KFPfz1rCWeDppEnItj1FwL8lw5uGvFhdEcGEB+naCiZQK
	JU50IZf8p/eDYql+Zl+S8JvfHkjS9LFIpJ3PBzSWlgrkCeIi5ALWx9ZPwmcrXwyA+BG5xlcEXRE
	wSIz4+pZa41KTSrKKXBUP2LPCCgAfC72SUbm9InZfztNhIB7TSd5lsVsNN1DlJIQIC0C5drA10u
	IYDVMY6tjCwIdmdTKrKFUnn/NLQEJfudYAgxngeqpq+p0KeN6NHyXeXPJQfms9GOGNFM3cifYNf
	jTLFWfBGgHXL3/6H0nyT443Tg9pnodQd/nHDbNHkvcFGlejwNS39fhiU7nFp400MakCBihXUp8i
	92M2yZ0/DzUoDU12tFFhBgD7pjiz94GpFsIKw=
X-Received: by 2002:a05:701b:42d4:10b0:143:2967:c0b1 with SMTP id a92af1059eb24-1ac5b7e1cdfmr5936493c88.25.1793417572110;
        Fri, 30 Oct 2026 20:32:52 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm12841651c88.11.2026.10.30.20.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:32:51 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: pxafb: stop smart-panel thread and notifier
Date: Sat, 31 Oct 2026 11:32:48 +0800
Message-ID: <20261031033248.2491098-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Validate smart_update before creating the smart-panel thread, so the
thread cannot exit independently before kthread_stop().  Use the
freezer-safe stop API and stop the thread on removal and every probe
error path after it has been created.  Unregister the cpufreq notifier
during removal.

Found by Sashiko AI review.

Link: https://lore.kernel.org/dri-devel/20260722075803.570532-1-panchuang@vivo.com
---
 drivers/video/fbdev/pxafb.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index 1912cfce28d6..1b2a16590999 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -1248,20 +1248,10 @@ static int pxafb_smart_thread(void *arg)
 	struct pxafb_info *fbi = arg;
 	struct pxafb_mach_info *inf = fbi->inf;
 
-	if (!inf->smart_update) {
-		pr_err("%s: not properly initialized, thread terminated\n",
-				__func__);
-		return -EINVAL;
-	}
-
 	pr_debug("%s(): task starting\n", __func__);
 
 	set_freezable();
-	while (!kthread_should_stop()) {
-
-		if (try_to_freeze())
-			continue;
-
+	while (!kthread_freezable_should_stop(NULL)) {
 		mutex_lock(&fbi->ctrlr_lock);
 
 		if (fbi->state == C_ENABLE) {
@@ -1290,6 +1280,9 @@ static int pxafb_smart_init(struct pxafb_info *fbi)
 	init_completion(&fbi->command_done);
 	init_completion(&fbi->refresh_done);
 
+	if (!fbi->inf->smart_update)
+		return -EINVAL;
+
 	fbi->smart_thread = kthread_run(pxafb_smart_thread, fbi,
 					"lcd_refresh");
 	if (IS_ERR(fbi->smart_thread)) {
@@ -1299,8 +1292,15 @@ static int pxafb_smart_init(struct pxafb_info *fbi)
 
 	return 0;
 }
+
+static void pxafb_smart_exit(struct pxafb_info *fbi)
+{
+	if (!IS_ERR_OR_NULL(fbi->smart_thread))
+		kthread_stop(fbi->smart_thread);
+}
 #else
 static inline int pxafb_smart_init(struct pxafb_info *fbi) { return 0; }
+static inline void pxafb_smart_exit(struct pxafb_info *fbi) { }
 #endif /* CONFIG_FB_PXA_SMARTPANEL */
 
 static void setup_parallel_timing(struct pxafb_info *fbi,
@@ -2364,6 +2364,7 @@ static int pxafb_probe(struct platform_device *dev)
 	if (fbi->fb.cmap.len)
 		fb_dealloc_cmap(&fbi->fb.cmap);
 failed_free_mem:
+	pxafb_smart_exit(fbi);
 	free_pages_exact(fbi->video_mem, fbi->video_mem_size);
 failed_free_dma:
 	dma_free_coherent(&dev->dev, fbi->dma_buff_size,
@@ -2382,6 +2383,11 @@ static void pxafb_remove(struct platform_device *dev)
 
 	info = &fbi->fb;
 
+#ifdef CONFIG_CPU_FREQ
+	cpufreq_unregister_notifier(&fbi->freq_transition,
+				    CPUFREQ_TRANSITION_NOTIFIER);
+#endif
+	pxafb_smart_exit(fbi);
 	pxafb_overlay_exit(fbi);
 	cancel_work_sync(&fbi->task);
 	unregister_framebuffer(info);

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
prerequisite-patch-id: 44b1c2680cb029871e123eb11eab7764a807ef24
prerequisite-patch-id: f4dfbbaaec2d208ac255451cf032c22f0e7fed2d
prerequisite-patch-id: ff6a574f35399a0059df3a759cbd2a558d24300c
prerequisite-patch-id: 784ec68755ba9ffc1d5693e1baff1f59d574c331
-- 
2.56.0

