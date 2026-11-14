Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637556;
	b=D5VI9m/aYi9Y/zEE8fB4/GUWnlLLaAhM79FUvFKF8NyF3/gq6saLmAHpCwkNoP9Rdc97
	 I+ZQ4BsVXIgPCMEndndXO4O90F817ibvyIXBE1JSFpq2C9cuzapM6lXtyCwbwUb+0Qzoh
	 VpVUxOvBoR1wp+H7sQddTcCxp076LzTsJThGuXWhfx7//RzQkSJzsGDtDWcnuO920x015
	 hq71lFPaUbXtQ/0NRzTscyw57t7PKGgOFLaDRRqBskNB1g031LiNiKHDR1SNkAAXKtJDD
	 RdA2i/X0QDlnasGkC9xvvGlHgxgiZ4l0eEdaywr8s2NnfjT558VQYoNMFJYXSVNriBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2G/wlgst0b3QmNrVuRQ50SldBGJC/pdF4BObZ2EI5Ls=;
	b=Du9uMoUJVe7q8Fo/z4yO++BHiH4/E93y8/2Y6ocuclHoI6TOCQTQW/m+StK+dzsDu1h0
	 GKsMBxl7T5WHqfgFGPx+hvWE9q34dtczh6gxZja+jL5I5xMClK/W16cvYJzxw2IkoYY64
	 g7mIl8b54/39XNRfmmDEm7cT4CVDorSyb6JqtS4x112CEasQWMJKCG3yjy3QIx4zLbiGw
	 2FAcltQAs+eZeTG2ds0mhMVuqtGzP5SPh9YnXYf4nn4oBnfoc/K7nrTBtB6Qa9k61+f1b
	 7hZCEhQ86xjZkA0Zbw1VqfGvroKTUYuzUYcjeaM+w3JaTC1EQ06F1b6mK/7PT5oIaKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PJ6HP7tQ;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBDC606A891
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FBDC606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PJ6HP7tQ
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-372cba0ecf9so189977eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637555; x=1795242355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2G/wlgst0b3QmNrVuRQ50SldBGJC/pdF4BObZ2EI5Ls=;
        b=PJ6HP7tQeeuDG4zzlhNDMmZ7tS0LVez9oRI3SvJOvGfzY2SI/mcYzl7mD81NFnCOFs
         L0AZNWqY/+L3PXXnKBewPmcAWRCrXFHvXXi6gJydDne3MwTHhp2hO5F1ygjsbxOgNtey
         ZGYI4TFAx9WjHOmrqEv18kPAXdgodpvqlB3wFVttrPawXvLwSvIUfC8r/oa2G9iue4LM
         3oDqlxy8ixl2rpabpUzi9L3Iw5tNN4EmG8hYkLJt8H1wGA7TvKcpsp9OZxq6g1anlcLV
         4Vrbh1rJEpAi/SGFsZqyRNt87/IAt/3j8ODaqCEnURDSxJq+w2qM0p7CSfCqF3IRhpeI
         fmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637555; x=1795242355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2G/wlgst0b3QmNrVuRQ50SldBGJC/pdF4BObZ2EI5Ls=;
        b=Lu2qqmTE3ut9vjsiUoiD4Lm5GONnKn6fyqmkXceHlmOZhpv2fiKvmu5bIciBXkzYgg
         cjYbNEKt+70zxdDvLZijqf3HS3URZjZkneptuS0fDsJrqqiNG+b4ktxdRgjuaN3n8zwe
         iYMJfm2yUQ39l8bIHkZcErEuTUeohi1hy2y9sOuMP0I36ZQqDZBsfI0voUpZwkvWfUaE
         7iveBcssHDM7LYae2lUZ2ILvhmfYCaJ/jpEZRSHea/mP5lao9EO7aDNQzO0AcR+GpmCx
         mFL2UC24CUxpiDXvrogsSt/kNXzBViQckCHIHxQuO4cllgvUC8Wv74s24IFXEDctGukt
         py9w==
X-Forwarded-Encrypted: i=1; AL+hErHZNNkXPvZVYdquzCJga6c9Jjm05BdU2T5pz4PUPPD9WoatPoklhqVqCVI5ljO70U7mo+dUhgcEQ4l89CY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N16b5JzntasSli82FRQ0qS41iQI0QqhjKbDJOljvComTTG4PF
	GtfspqUgha68UkBLsAJCimCazJC/Ncqgr8SwYWif3Pn9G2mh/A4Y5Mow
X-Gm-Gg: AYBFou2rhugOzRZUet+C251AtjhfU35WRf0sGyaPWb4yacB1ESCu9BuBXwqmYhw+Etu
	UHe7/KDs+qZt9iCx9kK5E5bD7C+Yq/llIswh9nRty91CmSKhPlJBrJgDagB0xtQwb8LhgtWlD60
	JsazyXFW/oHz9w70q0BCjvFguVWY/eqghp4dbisQfGxASGpFJfThLLoxJrVR9lSK8PDevTJPF/G
	fl0NaQmZWrcp4jCaMAruhvfdftefKHgupl9hzLGqAJOIc6jFEjxHWKJgJG9k9QPus4OMQ1mIdq6
	QF8BCgOB1pL1jRCZh6VuDlrhR2P+I+AIdz3ELUfro9yx4Sghqd2lqs2PwqkAYBHxyx++p+DtmH9
	9ZHoz/minoGFrpMO14/aB645CP3Yl4XCJqm5omh+aEGTWlwVvey25/DljAiIyD7S8Na+zjrcwrk
	Ceyt19kQTwDT6gd/1wGqcm4ubLilbpHAmQ4rSgese/Kv/tZBHXIrFfpxQePxxyWNu2ZW5Cjmhe2
	dMPRypfLpJzE9SsHsYJaFxEjN++pt7aBmeFFXgoMiPYPMIODB9iPjGsytdSW7dv8o28Z5LD/2jt
	JAyFopsSNqZX067QAVCTPN348Ekl3/+yUE9DAs8b3dsMl+hJ4Z5bkDsaHPw+oJpROnPIgDzt0Hg
	TUkY=
X-Received: by 2002:a05:693c:881c:10b0:36d:5fbc:8c8d with SMTP id 5a478bee46e88-379655d503emr6618386eec.2.1794637555183;
        Fri, 13 Nov 2026 22:25:55 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm13537585eec.13.2026.11.13.22.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:25:54 -0800 (PST)
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
Subject: [PATCH 2/2] drm/msm: Put the VM_BIND queue last in msm_vma_job_free()
Date: Sat, 14 Nov 2026 15:25:41 +0900
Message-ID: <20261114062541.2001-2-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114062541.2001-1-arpe1618@gmail.com>
References: <20261114062541.2001-1-arpe1618@gmail.com>
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
Independent of 1/2.

 drivers/gpu/drm/msm/msm_gem_vma.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 0cf518420656..b4b284ca5b38 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -775,7 +775,6 @@ msm_vma_job_free(struct drm_sched_job *_job)
 	job_foreach_bo (obj, job)
 		drm_gem_object_put(obj);
 
-	msm_submitqueue_put(job->queue);
 	dma_fence_put(job->fence);
 
 	/* In error paths, we could have unexecuted ops: */
@@ -788,6 +787,12 @@ msm_vma_job_free(struct drm_sched_job *_job)
 
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

