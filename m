Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644438;
	b=RNO1KmqEvVKixnapkVkyLaE4qBXDbYz7WtITluckAJ11SOrNACX0gRPZ9eQVv5wqzYfy
	 bdYqaSUuAACjfP9zm3Mw6EmV3Ca/WIQZowUEklRklzT1bwvyRZR95Dd754FxKlPCTmYrU
	 IXnYJTwmPXqnRCmXUQwyyvb886Vdz2RZxfaPgwTfXsJQRqB1Uhuas2c/LVdq9d+WDdqNm
	 ABQA47+3P/MjGZvnJnuDht+OjRInEPWAyNGJesA3mkZOD8CrVCso9K2dnjihTRSEgAERH
	 SCvgfvswukXDq1CVsEiXZPe8NHLPfRTPGREvJZ0HZlg3x0SQ2cnfhOb5oH8aVIKwqrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5+RlFqufX4xhL1zOaDcekPTcuiYRW3XbXJOszvYL5u4=;
	b=DzS3zorKoxSWfG++IGlQjBK37+svPmI6Q8E6QYZDKJmlR3LdPMbarEAIK/ONDUPS10+q
	 GIo50ZhHuZ2v3IBXogVvKBQ+OvtLn/f9eaPZBRT/3FNIWppCcyLPqZCmRM2/CvO/rp8En
	 AhFB47nybrHpYhsc6ni7vUnJiY0qviGPwdsncberJbaF1EXbCR3jRhHFiZTr4JAoo6Fal
	 vufnCIsYsMHIdNA3ADZDeT3j2p3oCsq11Ef8QIdns1+LAHS5migPSfIjFLD8EIyEV9miJ
	 WNp9icnL6X4VHCQrauvtRbJKIZVTrxU0QqXrriDr3BOxXN+XeAe0fcvZEUzc/OloJ8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vH/6r+/V";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E61606A887
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97E61606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vH/6r+/V
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33c10faf6easo229994eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794644437; x=1795249237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+RlFqufX4xhL1zOaDcekPTcuiYRW3XbXJOszvYL5u4=;
        b=vH/6r+/VYczRb5vbGj7sljclqqrqvD79C7Q5/g4rfRoKTUmhVwEGcsLlwIfqfiR7Td
         T+TRJPkYXjH/kgBvgkmU+UnAvreR2lW2paQ3iUTIeqlnBnPQdRB5QgfNkBbEYZB42fyE
         XAxY8Ih6kWxk5QklHArBm7g/lzS+Af9/ItfowcZ/yvq9p/ktt8xCa5oaWlnvbXgKu/jp
         9k/hBh1mtRCJfgHJXyDA6CTFvgGgPEmFETTaoIOQqxCIrpUgpiZe2ILH63w/6K1LvPNX
         6KlJHDbAYIsaQk+jHahrUEqui6b9BeWhZAkCXcAxLvrPRmtEMA2FV2ZKWInQVh+muiGa
         Uchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644437; x=1795249237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5+RlFqufX4xhL1zOaDcekPTcuiYRW3XbXJOszvYL5u4=;
        b=YFLJIPMF8REOvTypWwZ9DlEUVj8JIULm0vi/eQy7DcsMVS89oLEswMcQyyIlqntswf
         GlZFx7U4a3NbQ3og8DclpgV40D52wIK9yrsTGHmSGaib2xWmiFDwMPwEZ3TFsoh+Z2dD
         RP7kSTug8i4k1F97qP6bapmlr+S3dR2LiysdtpFN5Grj5in3YocLmb8DJg5DZSUrAD5z
         JOa03grXv5NHsCyp3KvoiPJz36pDhWmcjoiOnilynS2WDSyZ0Ism2zgiafNyrqlzccda
         56bZFB+OSdVseywb5mJITZAXAOI3FTuzIYQm+ZEM3MRxJpeq/jUHrdc9oGSock2kHa4D
         JEbA==
X-Forwarded-Encrypted: i=1; AL+hErHpg5rqS7WBENLF4t31JpNZbBmgGp2yBBFweeYEctLWYTypVfEylMp6u6Imgu7y6/OrW+7z6e1OTyZaVeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iFH3M1Zvxl2RvD3qbgsIC1jf62QR8+4QoLuXbdk7sRrz9LycV
	AFugwN/CBk7j7U2BshQZ/Nw0vV0EXbOjJkByZGrzbHypZN1NWdn6fRkZ
X-Gm-Gg: AYBFou21xvQAClUTnURBz/rn+1CdGwSFRfFpDz81Pjb7XzBSLrCO4AQkNRVIp7WbPYJ
	9p/VqMIihJ1Khnj7snR78zemTov+ugxKfWDHWnwwpt2i0ohK5DppIYAu8Ck6rOHerBUTW3xUujG
	zpJwPTPHu+kUkS/j0ePukiBMu9xMf1hllGCL/afRJLgqXQhwkJ/W9KK20WTY4TnxlYzU2vdcQ1W
	dVV46G5uNAJ1tJChe0yNLGExe6eGqGfY/ohvw0gqMVkTeWYIx/GZPjNM8Ge4wQ3k9mZxqrZ1NtA
	T0HMfN6ICAF2e7zuYsK7JlvLgzqeG6mQPM7k+NO7vrTDWh4/sCHIua6nYE7S8igh1NVOgAocF12
	IajRvbMxJBzoZKcHUImj3oMMdRn+h5sOfQSNfeb4Km6PWfLUcMbiNSXawA6NYHS0srT0WggBoLI
	90qU1/Gw9V8oqw7FsgYNVY1hoxmhivDkjH8e0JKtKRN/EhiBh8QBvPWxOTaVbGo26vKaQO57qSP
	6mdgwbFby8/zA0ViFXaH7fwRVnTlR8iC0hIwI4rkexAEYOaQATIT6KvJ8eWLaT+0G3bJGL4STxP
	pDqZVdXq5VKjppooARQQejBVv2rH9rDzhp1EoDGGoCys+oLKXjMoHrDcCulZ8dDoy4ZrOCLaIHM
	VnKM=
X-Received: by 2002:a05:7300:7481:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-37964ff2d6emr9742335eec.1.1794644436617;
        Sat, 14 Nov 2026 00:20:36 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm19524043c88.9.2026.11.14.00.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:20:35 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] drm/panfrost: Stop a job queued after its JM context was destroyed
Date: Sat, 14 Nov 2026 17:20:15 +0900
Message-ID: <20261114082016.2454-4-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114082016.2454-1-arpe1618@gmail.com>
References: <20261114082016.2454-1-arpe1618@gmail.com>
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

panfrost_jm_ctx_destroy(), which runs on JM_CTX_DESTROY and when the
file is closed, sets jm_ctx->destroyed and then stops the jobs of the
context that it finds in pfdev->jobs[]. panfrost_job_run() checks the
flag once, without any lock, and panfrost_job_hw_submit() can then
sleep in pm_runtime_get_sync() before it queues the job in
pfdev->jobs[] under job_lock. A job that is between the check and the
queueing when its context is destroyed is therefore neither cancelled
nor stopped, and can then be started after its context, and possibly
its file, are gone. With profiling enabled, its engine_usage also still
points into the panfrost_file_priv that panfrost_postclose() frees, and
panfrost_dequeue_job() writes to it when the job completes.

Before commit 6aa8bc58ac88 ("drm/panfrost: Introduce JM contexts for
manging job resources"), the close path called
drm_sched_entity_destroy(), which waits for a run_job() call in
progress on the entity, before it looked for the jobs to stop. The
entities are now only destroyed when the last reference to the context
is dropped.

Move the per-job part of panfrost_jm_ctx_destroy() into a helper, and
call it from panfrost_job_hw_submit() on the job it has just queued if
the context has been destroyed by then. The check in
panfrost_job_hw_submit() and the loop in panfrost_jm_ctx_destroy() both
run under job_lock, and panfrost_jm_ctx_destroy() sets the flag before
it takes the lock, so with the previous patch, such a job is either
found by panfrost_jm_ctx_destroy() or sees the flag, and it then goes
through the same stop and completion path in both cases. Cancelling the
job in panfrost_job_hw_submit() instead would leave a gap in the fence
seqnos of the slot, which the job chain flags rely on. Use READ_ONCE()
and WRITE_ONCE() for the flag, as it is written outside job_lock and
read without it in panfrost_job_run().

This was found with an AI coding assistant, which also drafted this
patch and its changelog. It has not been reproduced, and the change
has only been compile-tested.

Fixes: 6aa8bc58ac88 ("drm/panfrost: Introduce JM contexts for manging job resources")
Cc: stable@vger.kernel.org
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
panfrost_stop_job() is the loop body of panfrost_jm_ctx_destroy() moved
into a helper unchanged, apart from the lockdep assertion.

When the job is in subslot 0, the hard stop is written right after
JS_COMMAND_NEXT=START, as panfrost_jm_ctx_destroy() can already do for
a job it finds just after it was started. Whether the job manager can
miss a stop that early could not be checked on hardware.

Arun Iyengar's "Resume long jobs instead of resetting" series also
changes panfrost_job_hw_submit(); this patch does not depend on it:
https://lore.kernel.org/r/20261113-panfrost-long-jobs-v3-0-80ae78d38f6e@gmail.com

 drivers/gpu/drm/panfrost/panfrost_job.c | 68 ++++++++++++++++---------
 1 file changed, 44 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 7a3137dacb9d..0dbed7a50910 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -202,6 +202,37 @@ panfrost_enqueue_job(struct panfrost_device *pfdev, int slot,
 	return 1;
 }
 
+/* Stop a job of a destroyed JM context, found in pfdev->jobs[slot][subslot]. */
+static void panfrost_stop_job(struct panfrost_device *pfdev, int slot,
+			      unsigned int subslot, struct panfrost_job *job)
+{
+	u32 cmd;
+
+	lockdep_assert_held(&pfdev->js->job_lock);
+
+	if (subslot == 1) {
+		/* Try to cancel the job before it starts */
+		job_write(pfdev, JS_COMMAND_NEXT(slot), JS_COMMAND_NOP);
+		/* Reset the job head so it doesn't get restarted if
+		 * the job in the first slot failed.
+		 */
+		job->jc = 0;
+	}
+
+	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_JOBCHAIN_DISAMBIGUATION)) {
+		cmd = panfrost_get_job_chain_flag(job) ?
+		      JS_COMMAND_HARD_STOP_1 :
+		      JS_COMMAND_HARD_STOP_0;
+	} else {
+		cmd = JS_COMMAND_HARD_STOP;
+	}
+
+	job_write(pfdev, JS_COMMAND(slot), cmd);
+
+	/* Jobs can outlive their file context */
+	job->engine_usage = NULL;
+}
+
 static int panfrost_job_hw_submit(struct panfrost_job *job, int js)
 {
 	struct panfrost_device *pfdev = job->pfdev;
@@ -272,6 +303,16 @@ static int panfrost_job_hw_submit(struct panfrost_job *job, int js)
 			"JS: Submitting atom %p to js[%d][%d] with head=0x%llx AS %d",
 			job, js, subslot, jc_head, cfg & 0xf);
 	}
+
+	/*
+	 * panfrost_jm_ctx_destroy() only stops the jobs it finds in
+	 * pfdev->jobs[], so stop this one here if its context was destroyed
+	 * while we were getting here, e.g. while waiting for the GPU to
+	 * resume. job_lock orders this against panfrost_jm_ctx_destroy().
+	 */
+	if (READ_ONCE(job->ctx->destroyed))
+		panfrost_stop_job(pfdev, js, subslot, job);
+
 	spin_unlock(&pfdev->js->job_lock);
 
 	return 0;
@@ -404,7 +445,7 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
 	struct dma_fence *fence = NULL;
 	int ret;
 
-	if (job->ctx->destroyed)
+	if (READ_ONCE(job->ctx->destroyed))
 		return ERR_PTR(-ECANCELED);
 
 	if (unlikely(job->base.s_fence->finished.error))
@@ -1100,14 +1141,13 @@ int panfrost_jm_ctx_destroy(struct drm_file *file, u32 handle)
 	if (!jm_ctx)
 		return -EINVAL;
 
-	jm_ctx->destroyed = true;
+	WRITE_ONCE(jm_ctx->destroyed, true);
 
 	/* Kill in-flight jobs */
 	spin_lock(&pfdev->js->job_lock);
 	for (u32 i = 0; i < ARRAY_SIZE(jm_ctx->slot_entity); i++) {
 		for (int j = ARRAY_SIZE(pfdev->jobs[0]) - 1; j >= 0; j--) {
 			struct panfrost_job *job = pfdev->jobs[i][j];
-			u32 cmd;
 
 			/*
 			 * The scheduler clears job->base.entity when it pops the
@@ -1116,27 +1156,7 @@ int panfrost_jm_ctx_destroy(struct drm_file *file, u32 handle)
 			if (!job || job->ctx != jm_ctx)
 				continue;
 
-			if (j == 1) {
-				/* Try to cancel the job before it starts */
-				job_write(pfdev, JS_COMMAND_NEXT(i), JS_COMMAND_NOP);
-				/* Reset the job head so it doesn't get restarted if
-				 * the job in the first slot failed.
-				 */
-				job->jc = 0;
-			}
-
-			if (panfrost_has_hw_feature(pfdev, HW_FEATURE_JOBCHAIN_DISAMBIGUATION)) {
-				cmd = panfrost_get_job_chain_flag(job) ?
-				      JS_COMMAND_HARD_STOP_1 :
-				      JS_COMMAND_HARD_STOP_0;
-			} else {
-				cmd = JS_COMMAND_HARD_STOP;
-			}
-
-			job_write(pfdev, JS_COMMAND(i), cmd);
-
-			/* Jobs can outlive their file context */
-			job->engine_usage = NULL;
+			panfrost_stop_job(pfdev, i, j, job);
 		}
 	}
 	spin_unlock(&pfdev->js->job_lock);
-- 
2.43.0

