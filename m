Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794665957;
	b=zy9/VB3xFLJHLgMSuyzb4XoU0/ImkwFufputxEzu+oaVpWMwR0xSzHSPfgP6y+6epuj/
	 NoBIYzV/xNdxgNSKknFNzDU+KzkuEpYX7zGPODnTlw2+KMj5H+deFf5favoLhX2LohoY9
	 eqaaJDr7a9swgkkVRLEFNYpbFvPNmr64IWwzRugKaQOk26u54AahX4Qn8Ej9WbuU/zrqw
	 8N2MouybLwRjN5U35JLKxf3chE9apCzIujgyrwRwQhECpEirVGHkIX7S/Oqk6+q4JscMw
	 hwexqGJEuF2CeuYcvgHTWuDMi8Nek2d7R3MX3Yez47Bp7TOoPvQtEAtV7YYY+MX3goQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QjbH7+OnTujQtkedXacpeWPzVbsofxl7bIa9QcXu1+I=;
	b=r3EV1x74BErlM0HhvzGlZfSK64LjR2DMVEHXrrZsnytIXU6CtHAld5M3WqXoodOL70AC
	 2RsutCLg3mhPYK8IN6cb/sJl8AjOos72dNA+QT/IBeJVEFSN3BYcg5FwvDgKC36t3sMKH
	 oD/xhIvCMwWBxK0IcGuBzQ7GXUs8im3VUBXcY5M4upBmMV/KZbf2dVUODk1CuT23bVNx8
	 mQXnxCUaFV5nMs7YN4YvJH4MC0a70xkhqodAuo7IFptwqKTqDK5zubrxCyyCD0utNhRi/
	 B+3LOr1GtN4Be1EjOk2Ue0MtXJd8UoQeXVpMjMBqOZijxKPctjW1GSqNt6WheT7LmVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JGaonD2E;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18151606A333
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18151606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JGaonD2E
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1397a4855beso61156c88.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794665956; x=1795270756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QjbH7+OnTujQtkedXacpeWPzVbsofxl7bIa9QcXu1+I=;
        b=JGaonD2EVegvZ7RR/LnBg7cajt/DQt3tdYO0cSZhVgHTcYXCYg1RTKKhS9J8P0VIaF
         U+3mUILGSgAnXIz78m35cLzKZ9Tg4LxxGfLyUGdxPfRiWEsC+9I3wvM3PKCJwMJD2qbR
         3FNtjGAvupblQLi4qpyTN5HzEmruo4LJrYiaAPIq37cdrXaooQXpoi1MLeoYip5yH+BO
         1Ok87M7m2t1WJJf7lgha94zYcuRG4CjImCEnCuYPKlo0Q2msrKkn57h7hj2eFAbtY8P0
         v/fgsL0r/6h/A9rTFIRKY8tNg2f98hFF7fpZvIQkdgU7RhtxdXckcCAqnr1UhGeAqVjv
         ITfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794665956; x=1795270756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QjbH7+OnTujQtkedXacpeWPzVbsofxl7bIa9QcXu1+I=;
        b=KZASTmZSFJVJCzSlGXrQRRwCH+1i5W4RTXyHACIVtqL8Wra9wDiWaVEGwn4Qd9vK6e
         mx5THFaiFCkSdnA3abYYgj1sneOqnARIaezr8DPxGadNYFh7v1QpBRkx4D1eI6tmUMES
         0GRP5MK14MZO89u4Efgst2g81IYU8hORj98UDdmB/a7bgvK73AhvT+aTZvmcoJ+4nvIP
         rBjd72TGm/QAsyOSVR0KSOsOks7nRmrb03zgeB/XXMOR7tX7dCqBsexBxqjs4e96Fpjm
         qRwT+CQFRz+5lDOOx1Y+Eaobe3FK5xqr7tzP4BiqMAGogZJPFce+CUQn2UnOnP7orhlK
         P0WA==
X-Forwarded-Encrypted: i=1; AL+hErG6ZyVecfm+YbvJQwNvydMfcSlz5MZMh0CgJaumBc89B3E2tx8aDc//EPXKC6UpTw4ocT+nr+3JM+dv2UA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JYFrAazkRYAh3UFQ5mD9LDrxvwD4WkHSAmh0IGN3EjL/Nf0Bz
	IwxE0MlWHP4fnvildwYOuCWy11vAdXzZoK9PkWJ2WZXHY6Rgdm/IUrHv
X-Gm-Gg: AYBFou1Izx+ebEZzvD+Wt5g41ROKyxllK8iL+z/8vffSS1ME+Uj8I/lR9u4BQ0NJqMw
	SD5+Ev8zNTfRVxyHHx3EzTpxzVIg8yh8mXC+5Vlu60Qkd3GWvoHn3NP8HxWeN0wXk4HsCnadoXr
	sUYIe01rzFSG1nFPhvi/YrrSLlyWG03ajtnKqoG0XJuvpP8JJ1MXTf++nKbhwzc9e20mu+AXL2U
	KEkaij+eIiXATOtVX0ve4/HgLwKVkfG7P9h8hcmPBhTZqW358daqFZUc74et5Nf6F/+4rYK8kMP
	QdZ07FLr1ol2zt4ZgbMkNG2lRh7S7QeFGy/x+QaRzwhFX84Jgp7DtmTwo2ummoOff6bTrhhIvEY
	S2AQV63z7kYwV5YHegw5v8IDa3+WxSI6DbayD0H2ryllSYlpNynVQXjy+HH67u7tBwRBPMi2Fyk
	7+KUp6we2BUdmf1BGMtlR9K4TQVbHuifNx8dWyo8wX+aDLmpl0PXjvaQYcWIBhQQJ11yESWarqN
	PATumRjk+vJRhMCuhOt1E9vNxnKCEhfnASzD6fp2eOL9VZGa2QjIAS3t1swuKIiCYoS2IsBB6c8
	XhpYfoyZzUclOKHZNvtezzPYoZ6ikGren8YERJHwIVC8P5rx+an9aWu4T8K/+4Ap/mkHkDNfgTU
	vQFo=
X-Received: by 2002:a05:701b:4508:20b0:147:d430:7322 with SMTP id a92af1059eb24-1b5030d2df3mr8446285c88.1.1794665956061;
        Sat, 14 Nov 2026 06:19:16 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm14745032c88.13.2026.11.14.06.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:19:15 -0800 (PST)
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
Subject: [PATCH v3 3/3] drm/msm: Put the VM_BIND queue last when freeing a VM_BIND job
Date: Sat, 14 Nov 2026 23:18:51 +0900
Message-ID: <20261114141851.134290-4-arpe1618@gmail.com>
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

vm_bind_job_free() puts the job's submitqueue and then wakes up
vm->prealloc_throttle.wait. The job does not hold a reference to the
VM of its own: the VM is kept alive by the context, which the queue
holds a reference to. When the job holds the last reference to the
queue, as it can once the file has been closed, for example when a
killed job is freed, the put can drop the last reference to the VM,
and the wakeup then uses a VM that msm_gem_vm_free() has released.

Since commit 01c8d1f385f7 ("drm/msm: RCU-free the scheduler-containing
ring and VM objects"), msm_gem_vm_free() frees the VM with kfree_rcu(),
but vm_bind_job_free() is not in an RCU read-side critical section, so
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
index ce9d97582df5..07f427c4afad 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -810,7 +810,6 @@ vm_bind_job_free(struct msm_vm_bind_job *job)
 	job_foreach_bo (obj, job)
 		drm_gem_object_put(obj);
 
-	msm_submitqueue_put(job->queue);
 	dma_fence_put(job->fence);
 
 	/* In error paths, we could have unexecuted ops: */
@@ -823,6 +822,12 @@ vm_bind_job_free(struct msm_vm_bind_job *job)
 
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

