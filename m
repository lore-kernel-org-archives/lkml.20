Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794665954;
	b=d6o33xUgPV//pXof1nmyi38nGMs8wr4lTfD0KLvzaOdAmh94COn7QHns/NgblpFQSVcw
	 KaXBRRU0gbkbW9zaG1kNbtEdxVtpI457oiGp126Ik8Xb3CuKtqnLB+m+WW7sBNuAfrD7U
	 FQJTuZUoteujOhzggtCAz5Rw0dCpzL7aeTlhfbemZ1uuAZE61+TL7QSFVxlt74M2Jaz3W
	 XnW3CSqE+k9qY8csQ3tU2W2/Gp5ziQ0DAslJzFaFvhE6JV/RK59GCwAOmpoRFnLa+l+Ig
	 RzkCvrRm/AB9EsKhbALLIwKT8vXsd2282PksfMqBRAm5/Yfc3rTBGMDdqGK247dTahg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AdmBh3xC9KRN8uEPKMGQW7/JjymKHmtkhbvdkKIOQCs=;
	b=OrNvTTSxglouvAOG9E7ThWoAzIgNld2nBzQ9hmnsGLT0mVUfH6MT5LW1rlf9feLUYrxH
	 gYS+rlH2mos/spU8/AwOxNyGu3eC6L/+GX54e9g6ujCoVkJf+fL/RlhfEaOdujWPdszrx
	 xjvX4Oiz2kY0JMINLmR0fTeOD/CqcdX8sAylxMdKVVP4QnvQORzGI8n8l4/KcPrtrgZrZ
	 Lpu//svoDnEUCctoSa//7ttJzESePvyZMB9cc+aG1rA60oG1x/AMF+HET57jgktp9KG27
	 ppjZlVqnEjUWpeOindQRpTnojv36dlulC9S5U04Pbd1385KRAH3HaDRHovokxOsmD/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p6kMdBel;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B45606A33A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31B45606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p6kMdBel
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36e90071735so314448eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794665952; x=1795270752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AdmBh3xC9KRN8uEPKMGQW7/JjymKHmtkhbvdkKIOQCs=;
        b=p6kMdBeltiYaeGuBoulkvnkV8Zx8StjYzuHAWm0mCRTD0Gjf/2ppOvcLTKcnDqH60K
         sNp++6tso/BiGGsyauXQDk2INGl/TTi6x4ijHloXXPiQzp9AYgE9gfg0RAnF/JnVL5J3
         nyYw5LQxiBi0QclPQiPLdqYqi0ZzG5JSfrazzW2KA2x7R5ez+WLRvTOBV1fEDU6pb5Px
         PHMgRCDKhQ87EAt1mMz7cTI1EZw19KpLyoyAd2D/g/Akieh9/6Wvw+qruWvc29owFyll
         F+9Dq4nttToiAqOs4YEcOqDN4ZKmZY6Zu9a+VUqw7DZn05duSp2NU6sCK7NfyX32ZKw/
         hvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794665952; x=1795270752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AdmBh3xC9KRN8uEPKMGQW7/JjymKHmtkhbvdkKIOQCs=;
        b=Sy4qPMkuPRe0bcD6/WxDeedWO2cPxVPDYpv3x5eaGsHPohedp93Mb1ljbYxXOplPu5
         9sWk8EsQfQg9iKPqdXV5+fsu5RC/sWqguxNKcW1Le82RVt4nPFpuwyeAAYoiL7KGpPrl
         FbvXJKalONVx7NYQ9nXGkXsdrGi2ec7kDeItOUXv1o7QyIP/EHn7cakRa+M7aqGJmZt5
         W1wxIHB6csiiUZil7OEkHKBiO9ity/PxpmYZCsU7RlA96mumxQBtrKBvOZ8qyDgqNma3
         oehlT5bNblTafliv2gSwjbzI74kPD2Vu0UJprxJCpN0zeAMUAeIFrTUWQEy/EC2OzcQY
         9z6A==
X-Forwarded-Encrypted: i=1; AL+hErGEWO0Kw2q4Otwjqzkk86YmRteCwtRr47c35HKayjlbs1nSdbHYHaYo8RR2XZWANMVUuTPrWAG0t18lDAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JAFfhRlWGryM5slxvYausDxN9D5kCM0dvBIjI8cgdtaP+VgMz
	e1lAZhRAWafh8/MWpzLkaUdPtJ5mexevOh45JN1MhmeZDPeK/3XDnF5u
X-Gm-Gg: AYBFou0tI25IxtF58dzi55zaFdhVs/A9+8k7VagwMnH+rysFId7Vnkyc65Q1Ki6klX4
	CtCS5Z4R73c65e633VIS6KHKsO2qeip8NreOSQhZloCyks/tmPPIM8pycjSdDEuuK/R4+48bEFo
	NrfFxXGPNf1R10/GOaUJVVauLzQS6hVOJnpgPz7ZUOi2Cvb+IX2TUW3scs9rsjIdNDl3cigj25h
	Na3QDSfL/Md+kuRc01GRGtdv98D38PgbLlqSq2IDmGIOU9X0sAD3pwVxSEvcxnP7lEIXtzWjcXw
	W1s9EWG2HIbuxA26gBS8Hi422JUOEg08S655naCOiG1W8+Z19a7zhlEoGwD3lEwwODGfIbnO46l
	zvu5oL43fR+j+SyUZLS2qugTzaZ1JDZ2B4K22hCP1M1tYC7RpidOIGknvf+AiQDGZOz5NOQUIAt
	VKwBzeZoH4nUOzCtYU4Ypm97wOBFYRiI0c938yPDqtplLEtiSufg2hTTWa5g7kowB6P/pQ9Na1e
	/lEzebCoexedtJ95sPrOLhhbstMeOigcUuiZvFWtuy3yFbluZqkrXptUgS1Y7x9LQBlxllit7zI
	6+YF+huB6mrldhDRqf1VXGYteRWKUim/LKZkLoyFGNslAf6zp9BcJeAkSoCbSjW1gzt2O4Fa1qi
	IJ/8=
X-Received: by 2002:a05:701b:4508:10b0:1b3:a881:a67b with SMTP id a92af1059eb24-1b5030b6337mr8411764c88.1.1794665952002;
        Sat, 14 Nov 2026 06:19:12 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm14745032c88.13.2026.11.14.06.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:19:11 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Julius Bairaktaris <julius@bairaktaris.de>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 2/3] drm/msm: Destroy the VM_BIND entity when its queue is closed
Date: Sat, 14 Nov 2026 23:18:50 +0900
Message-ID: <20261114141851.134290-3-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114141851.134290-1-arpe1618@gmail.com>
References: <20261114141851.134290-1-arpe1618@gmail.com>
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

The entity of a VM_BIND submitqueue is attached to the per-VM scheduler,
and msm_gem_vm_close() calls drm_sched_fini() on that scheduler when the
file is closed, which frees its run queues. The submitqueue itself is
only destroyed on its final put, though, and every VM_BIND job holds a
reference to it. msm_submitqueue_close() only flushes the entity, and a
queue that was closed earlier with MSM_SUBMITQUEUE_CLOSE is not flushed
at all.

The flush gives up after a timeout when the process exits, or on a
fatal signal, and it only kills the queued jobs when the process exits
because of SIGKILL. In these cases, and after MSM_SUBMITQUEUE_CLOSE,
the entity can still have a callback armed on the in-fence of a
VM_BIND job when drm_sched_fini() runs. When that fence signals,
drm_sched_entity_wakeup() dereferences entity->rq->sched, and so reads
a run queue that drm_sched_fini() has freed. If the jobs were killed,
the final put of the queue then calls drm_sched_entity_destroy(), which
reads the same freed run queue in drm_sched_entity_flush(). If they
were not, they never run, and keep the queue, its context and the VM
alive.

Destroy the VM_BIND entity when userspace closes the queue, on file
close or with MSM_SUBMITQUEUE_CLOSE, instead of on the final put, and
refuse new VM_BIND jobs on a closed queue. In the MSM_SUBMITQUEUE_CLOSE
path, do it after dropping ctxlock, as destroying the entity waits for
the jobs queued on it.

As a result, MSM_SUBMITQUEUE_CLOSE on a VM_BIND queue now waits
(killably) for the jobs already queued on it, and a fatal signal during
that wait cancels the remaining ones, where they used to still run. On
file close, the jobs still queued when the wait gives up are now always
cancelled, as they already were when the process was killed while
exiting, instead of being left on the entity. With the previous patch,
such jobs apply their unmaps and release their pins and references.

This was found with an AI coding assistant, which also drafted this
patch and its changelog. It has not been reproduced, and the change
has only been compile-tested.

Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
Cc: stable@vger.kernel.org
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
The scoped_guard() in msm_submitqueue_remove() relies on commit
ea69d489d3a6 ("drm/msm: Rework queuelock"), so trees older than v7.3
need a manual backport.

If MSM_SUBMITQUEUE_CLOSE should rather not block, the destroy of closed
VM_BIND queues could instead be deferred to file close, e.g. with a
per-context list of them. That would also keep the ioctl out of a
killable wait for the queued jobs, which the freezer cannot interrupt.

 drivers/gpu/drm/msm/msm_gem_vma.c     |  5 +++
 drivers/gpu/drm/msm/msm_gpu.h         |  6 ++++
 drivers/gpu/drm/msm/msm_submitqueue.c | 50 +++++++++++++++++++--------
 3 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 0b9f2e8916b7..ce9d97582df5 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1557,6 +1557,11 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	if (ret)
 		goto out_post_unlock;
 
+	if (queue->vm_bind_closed) {
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
 	if (args->flags & MSM_VM_BIND_FENCE_FD_IN) {
 		struct dma_fence *in_fence;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index bc5b31eb1eca..561f2d998e99 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -596,6 +596,12 @@ struct msm_gpu_submitqueue {
 	struct kref ref;
 	struct drm_sched_entity *entity;
 
+	/**
+	 * @vm_bind_closed: the queue was closed by userspace, and its VM_BIND
+	 * entity is being or has been destroyed.  Protected by @lock.
+	 */
+	bool vm_bind_closed;
+
 	/** @_vm_bind_entity: used for @entity pointer for VM_BIND queues */
 	struct drm_sched_entity _vm_bind_entity[0];
 };
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 8d550d281704..2dbe42551bd8 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -79,9 +79,6 @@ void msm_submitqueue_destroy(struct kref *kref)
 
 	idr_destroy(&queue->fence_idr);
 
-	if (queue->entity == &queue->_vm_bind_entity[0])
-		drm_sched_entity_destroy(queue->entity);
-
 	msm_context_put(queue->ctx);
 
 	kfree(queue);
@@ -107,6 +104,25 @@ struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_context *ctx,
 	return NULL;
 }
 
+/*
+ * The VM_BIND scheduler is torn down by msm_gem_vm_close() when the file is
+ * closed, but a VM_BIND queue can outlive that, as long as a job still holds
+ * a reference to it.  So destroy the VM_BIND entity here, when userspace
+ * closes the queue, rather than on the final put.  Both ways a queue is taken
+ * off ctx->submitqueues come through here.
+ */
+static void msm_submitqueue_close_vm_bind(struct msm_gpu_submitqueue *queue)
+{
+	if (queue->entity != &queue->_vm_bind_entity[0])
+		return;
+
+	mutex_lock(&queue->lock);
+	queue->vm_bind_closed = true;
+	mutex_unlock(&queue->lock);
+
+	drm_sched_entity_destroy(queue->entity);
+}
+
 void msm_submitqueue_close(struct msm_context *ctx)
 {
 	struct msm_gpu_submitqueue *queue, *tmp;
@@ -119,8 +135,7 @@ void msm_submitqueue_close(struct msm_context *ctx)
 	 * be any more user ioctls coming our way
 	 */
 	list_for_each_entry_safe(queue, tmp, &ctx->submitqueues, node) {
-		if (queue->entity == &queue->_vm_bind_entity[0])
-			drm_sched_entity_flush(queue->entity, MAX_WAIT_SCHED_ENTITY_Q_EMPTY);
+		msm_submitqueue_close_vm_bind(queue);
 		list_del(&queue->node);
 		msm_submitqueue_put(queue);
 	}
@@ -326,7 +341,7 @@ int msm_submitqueue_query(struct drm_device *drm, struct msm_context *ctx,
 
 int msm_submitqueue_remove(struct msm_context *ctx, u32 id)
 {
-	struct msm_gpu_submitqueue *entry;
+	struct msm_gpu_submitqueue *entry, *queue = NULL;
 
 	if (!ctx)
 		return 0;
@@ -338,16 +353,23 @@ int msm_submitqueue_remove(struct msm_context *ctx, u32 id)
 	if (!id)
 		return -ENOENT;
 
-	guard(rwsem_write)(&ctx->ctxlock);
-
-	list_for_each_entry(entry, &ctx->submitqueues, node) {
-		if (entry->id == id) {
-			list_del(&entry->node);
-			msm_submitqueue_put(entry);
-			return 0;
+	scoped_guard(rwsem_write, &ctx->ctxlock) {
+		list_for_each_entry(entry, &ctx->submitqueues, node) {
+			if (entry->id == id) {
+				list_del(&entry->node);
+				queue = entry;
+				break;
+			}
 		}
 	}
 
-	return -ENOENT;
+	if (!queue)
+		return -ENOENT;
+
+	/* Not under ctxlock: destroying the entity can wait for its jobs */
+	msm_submitqueue_close_vm_bind(queue);
+	msm_submitqueue_put(queue);
+
+	return 0;
 }
 
-- 
2.43.0

