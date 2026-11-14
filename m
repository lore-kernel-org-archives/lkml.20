Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644367;
	b=qpUQ14dsN0CWLIHpPR68kfp7RiRkJihoRJ83d3MPemSrO/OkzEfAsMZa+PpEQsGkssOA
	 6AHE9+IiNaenFwMJO2b7LsbgyvwexLt+z1e3Iq1jqldI2jTqj8qfFry7WBqr4Dzl9J+jv
	 ewhgtAdVgccUTpE0EJNMyZIIjdL+/+YXZDSiB4n1zObiDmWbqZhVRRK0vTwtWzWGDkgQt
	 dYmcZoiPaoPFo7KpAiug2GMOExCE+znFc474Vo5nXFgvro+guKV9bzU0h4yawXFYeeobQ
	 1gV1zTvNhg9gqdqPabgxGfQB/Msz0FL2EHN4FDvqb036JhXjtJf06zAU7HrbpqcAw2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C58R8Pgzd1hKqtVMoaWOgYvgQVTOllRn5nwLnk9mw7k=;
	b=SJCZ/nywXSQLX00s6DgrzaxrRkFYGoDKfR3KaknnTAdu65WIDcXXPl3Qq31/YTqyK9KX
	 vWFJXLEzrgvVpioBbpvRIJdijDSnKhSQ5EWz7UDPUUGX81Lb68zt5ZX/qHqZUyHZO0hZ8
	 eSUzXZeG+HPxY61ER3mNBWj5zCYu3AjCHeekmd+AEtDoSgRqWtRd5RIdSbRWoCMagmM9m
	 4efCgeBRLALMMHL7Lh9h5l2Odcwkw7SDRbY/9gxm5uwqf5sHmP+hiOBx+N15yzkP9jcMz
	 K6wO/Yvnl1tZOHwwxdcNzS21qsD/GvtV3CBdF+QaHkCBN52lxQJNaxdDOBETwvUEFdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXb5T5gB;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029D1606A88B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 029D1606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXb5T5gB
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bb5afa736so186632eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794644366; x=1795249166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C58R8Pgzd1hKqtVMoaWOgYvgQVTOllRn5nwLnk9mw7k=;
        b=EXb5T5gB5jjsfWt7HDzjvl+XqaWGVUS/bSslZmlUqzZyaggFpVpgJscso1Oqqn79Ps
         bwz+OV1KpZiN6nFUhZsB9fe0drNScYB3Ct5lR1azIJsovPl/tLFRo7eSJUw0k1D+dPeK
         FnhwIkm0vN6qd4U2BFLu8W0siU4GWLKsix7UIlUYf+J5GXKxhS5XfHXMjB+ETofnBIaX
         0mdxDtqq5peMFIDeMqNKhOBgItgcX9aTXyOhieIkIK1IPWrUY0ySje0h2R+meEJIWWlq
         pmwrtsBLanmQ3S1qFyARuhDlFcvWq9REY5mvfwWBQPt4YOkSqVh1s2dp8MZekKjezYg5
         RjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644366; x=1795249166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C58R8Pgzd1hKqtVMoaWOgYvgQVTOllRn5nwLnk9mw7k=;
        b=2xEnB//q2gbuoWs0wN9KQFcEMDIdkUYtxyQCK3MV3rIGH8sbVKmtQy9k4LlC6oCiWD
         EJYoEUZbuXzGm+Pd+/qzAb3CGyUgH7xCk+KawGYTluYeL2CGW9VC0h0Ly+Jxf1lAcMo1
         98sPznVQ8cuhFWC+p3o/tYxYcrpE83KG1iPzECfTtPAg8xcWWsRaobSba8UBabYvmCOp
         2c0pMGVNbyd5q4Y++NjdFmNv31tUD4FBx/e08vwBJqEIrxmhb6+o7BHMK3TW7onJStRS
         PbH1xY6x9XuADphEG5HSWqdDYjzp4VJqAyhcvYsivuKYgCTw8fRpkYgeYOvqJq/TfYL3
         b3KA==
X-Forwarded-Encrypted: i=1; AL+hErFUhG0w/Np+nY9SzSV3rh+NLhHSb4MhObsqYjhfzenWVpmCc7imAuvfalDyPAYqks4Bd39iUrfahiYORi0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D94+5PWgOpButuongvWARwzbN4/9djLwNr2Pa5J7O8ZvPP90v
	v3gvCZ9+3fbVn79cvRzS0lHWsPoiVE5hoJFBaly4R5UIR4e3OV2L3B22
X-Gm-Gg: AYBFou1KPcgX0/a0hppetDKcmckhhPVC/ofvavWt/MwdoLhulnek8aaTWl8Rp/k7VyS
	DMiI3pucbVoyMXs2KfW1lyWiINV+/qjliXJuEV3QwZWHLcJk9ytl2wOKXQ0/ZmY0gjqjpcP9rFt
	5TRroi5lcDjEGuugRFj4xGs3GuXWCT6PBE4Sk7jAk96uqNtQvTxBn8cnuQit+w+dYiK1zJMTMNF
	l5m1QuKvqvyCPFzGjkueCOccj370OJN6DVYz1V3t8c6cFlJLRKqKtRPo72+deQesqK3YwDGgDoi
	8e2J+CiROaxcGH7vXwhTgupmzf7xBVVWEBlcFSKm6ClefGsxNYhZP0L9jacsPpvXznIxvq0fi6h
	NUtba6AC/ZBcUxKoVYzhW/Jks+kQvxZ8Bs40fJQ5ifBoRsBo6mFFbwBB3J56XTAiA7y8J3qGbh5
	A1cf4I+zH9LIqAjNXmKXVRSnqT2f5srQ4ojS3Y5P5BbhORUgwdH/FfZpKMKhG1SjtMPab7Z/S5r
	W5MPhIugaZtO6UCun8z2Jzs5i9ebCpdHbs6Yn3/bVB+oa3at2Ye5cxYSYEeTFKInzoORIJkBPIu
	IJ03hrJESqz1MDOHSUbD2QfcMEGcfOy/r3ijAVU8dGxebk1ZYQzanPyjjTuKpb7PrKuI0tDe5WU
	9WbLVOtbAU6Fu3tYQ52SLl1dN
X-Received: by 2002:a05:693c:881a:20b0:36e:66d8:1424 with SMTP id 5a478bee46e88-3796047ff23mr7029007eec.0.1794644366120;
        Sat, 14 Nov 2026 00:19:26 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm14008333eec.3.2026.11.14.00.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:19:25 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Antonino Maniscalco <antomani103@gmail.com>,
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
Subject: [PATCH v2 3/3] drm/msm: Put the VM_BIND queue last in msm_vma_job_free()
Date: Sat, 14 Nov 2026 17:19:02 +0900
Message-ID: <20261114081902.1669-4-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114081902.1669-1-arpe1618@gmail.com>
References: <20261114081902.1669-1-arpe1618@gmail.com>
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

msm_vma_job_free() puts the job's submitqueue and then wakes up
vm->prealloc_throttle.wait. The job does not hold a reference to the
VM of its own: the VM is kept alive by the context, which the queue
holds a reference to. When the job holds the last reference to the
queue, as it can once the file has been closed, for example when a
cancelled job is freed, the put can drop the last reference to the VM,
and the wakeup then uses a VM that msm_gem_vm_free() has released.

Since commit 01c8d1f385f7 ("drm/msm: RCU-free the scheduler-containing
ring and VM objects"), msm_gem_vm_free() frees the VM with kfree_rcu(),
but msm_vma_job_free() is not in an RCU read-side critical section, so
a grace period can still end before the wakeup, e.g. if the task is
preempted in between. Before that commit, the VM was freed right away.

Put the queue only after the last use of the VM.

This was found with an AI coding assistant, which also drafted this
patch and its changelog. It has not been reproduced, and the change
has only been compile-tested.

Fixes: b74fae5492d1 ("drm/msm: Add VM_BIND throttling")
Cc: stable@vger.kernel.org
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index b1fa1d749c2f..1bffade78623 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -816,11 +816,16 @@ msm_vma_job_free(struct drm_sched_job *_job)
 	job_foreach_bo (obj, job)
 		drm_gem_object_put(obj);
 
-	msm_submitqueue_put(job->queue);
 	dma_fence_put(job->fence);
 
 	wake_up(&vm->prealloc_throttle.wait);
 
+	/*
+	 * The queue may hold the last reference to the context, and so to the
+	 * VM, so put it only once we are done with the VM.
+	 */
+	msm_submitqueue_put(job->queue);
+
 	kfree(job);
 }
 
-- 
2.43.0

