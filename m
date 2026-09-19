Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08503B47C4
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789807202; cv=none; b=lBjGCK+PDMcMJZhgrYm/PYI/trmG+ehH8pJ7jY8KuqseZTyWCylguboFrgmtTGw3ntXX25HhyD5Ub+ygYlNB1qRFRJ72pOnxmedsyPaqRxcKanndIeqmlqD6X/PJ+3wHwHTgTjh4FWv/kR8Ka+qPhwS6nz4lJiPwGLDuaLmtW7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789807202; c=relaxed/simple;
	bh=zE6k5Ig59a6BiWfQcHQLflmwTOVEnPsyzyhXJKlVBpA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fDfqd+udKyKvY67IrYJ5tQP9ktIbSv7MPt1v2x4ec/VU0uJvgCWfKLx81jhC2PuL3QoH3aXKs5nM0NhU/UJ3WAjsocV/yNN/H95MwF0z4MzJfyG/+gW4kaX0EGeDITZgIRGlvO+YVAwFmnAzA108uOpCM18NvXnJI9Xbr2TdhmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mU5jSN/4; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mU5jSN/4"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea34ef4so1670053a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789807200; x=1790412000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IjxeXk0B5Zhbon0UoJLU1d05zMabiWk2BOUao5Ox3BI=;
        b=mU5jSN/4ZA6UGSRDsQPRjod02O1gUGF/t4StjNGi1K6ZB8Jcc4v+RsYah1CpYuz51U
         zsR7Jb6oPpf7oY5e3B79edeQgQuJJA7chvsg8iuVUHVou2qMFrnmiwTMAniGpdBtv410
         /E5M8BEozsh0xvPoV6xjAOoaNSeszihKcV6BCl/Etai8ViP9lSf5aLqEdHT12sa5n/OV
         CbbbWTfpm74pAI1wLtUMjWMIrKH4nD/h0GjF/zQdPm0SIt2SY8wjmXI9TMxLIr96bIM9
         GCfuK8Gq2+EFyisZFk9hEkHdDA0WRKeonysNOcIFLW0tZbfTaRcGGp3X65LOXLAwMmXT
         B9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789807200; x=1790412000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IjxeXk0B5Zhbon0UoJLU1d05zMabiWk2BOUao5Ox3BI=;
        b=GDLikG8aWPJPA27VTdsw6i2vLjafwvWv4R3D5qXy1zWtlVaPznup1c08pVZgJLPPw4
         v/74HkLfRqtgBm9n/aLHI+UZrHPSre1IxlqcYKBSVryw+LxjA7uz4Ww1cAaM/R+JlsgC
         y1g1FOrrT+zdOASFCkwzIJ0cDJHmfPGbaUfUFbbfZqBpRJwOCEjT2A19Z9WV6co4RUnm
         6IJJr0wiqL3aY4h9/xaC5G1g50hFkF7nda8Ueoqk/jeaCK+mqu5XDO0txzrNLdCDXH3+
         sbzSkEdiomlAmf2AFHRBTZiExLqdii6z6yYUycz+d9/0uE9nJsCd33Kan2N+9TgV20U5
         VxLA==
X-Forwarded-Encrypted: i=1; AKwUvBxR0weO6BRy3NHZHdp9P3+gFPbCfDBCeqbil6dZmsuOabtLiTdkfT/OhElBCfDdhaUNMYiOM13dDIMsB1w=@vger.kernel.org
X-Gm-Message-State: AFuF++kis1MnUnkd78SMlQPGGgf1lqKadGfxTkFlhDWrudcW6xEpuyBQ
	8Wa4rFJAc9P8q9O9LoQLz/2q29oallh133VfBlVGbB7+fke+Mrgf/nqU
X-Gm-Gg: AYBFou0Wx19Gbk4dHl/PK1O3t0TQhR07Isi1+WMsCsskCcEW9IoanUFErSEe0N0foSN
	cqM1Zn7Pj+dko75uhQPnVG9zbEcG6+etxU89IhU9+A+pfb1k+u2Ucbpl8d8mSqfDUYRz9ZESdZD
	bWdKxFDsYd2RuBx+pEdxmTDrMd6onWk/9P46jeKmghifdRRvkvF0IZX+q/eOXS7lJVhiafT3igz
	3cQOZuYiMAuPu+TAoICP0N4dEOD9rug8Z+3aC/Q9DDQ22t9hjjL0OSuZi8CCzz9Yeu+MWJ4hJDZ
	lyjeeH/g5fvOfXMYonX5Uh17pZycnGy1WYfy7vnuwVAs0XyYGF4MhIABEpJm70JOVUwIJDqBAkI
	HARbcZHjFPPl7R1guEL30l9p68WXjPV9DSg5w5uuRX/uvIRgCyO1z54PnRrdgT6viOJn0oo90qD
	NuRRhzTVeSzkaX+4oz+UejaBH5huyau5/7SuJvyM84HT4UHlRxqfLwCE5XaCqLkWDGsUzCdXgSn
	lq7+NKX
X-Received: by 2002:a17:90b:558b:b0:39e:6c69:9b93 with SMTP id 98e67ed59e1d1-39e6c69b270mr3178636a91.56.1789807199634;
        Sat, 19 Sep 2026 01:39:59 -0700 (PDT)
Received: from gmail.com ([188.253.12.32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bfec0sm6425596c88.7.2026.09.19.01.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 01:39:59 -0700 (PDT)
From: Jia Jia <physicalmtea@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Xie Yongji <xieyongji@bytedance.com>
Cc: virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jia Jia <physicalmtea@gmail.com>
Subject: [PATCH] vduse: avoid infinite loop when no affinity CPU is online
Date: Sat, 19 Sep 2026 16:39:33 +0800
Message-Id: <20260919083933.104437-1-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If all CPUs in vq->irq_affinity are offline, cpumask_next() walks to the
end of the mask, and the loop then resets the cursor to IRQ_UNBOUND and
restarts the scan. When VDUSE_VQ_INJECT_IRQ is issued, the intersection of
vq->irq_affinity and cpu_online_mask is empty, so the caller busy-loops in
kernel context on its current CPU (e.g. CPU2).

Replace the while loop in vduse_vq_update_effective_cpu() with
cpumask_next_and_wrap() to find the intersection of vq->irq_affinity and
cpu_online_mask in a single wrapped scan. If the intersection is empty, set
curr_cpu to IRQ_UNBOUND and let the existing unbound workqueue handle
injection, avoiding repeated rescans when all CPUs in the affinity are
offline. Use cpus_read_lock()/cpus_read_unlock() to keep the selected CPU
online.

Fixes: 28f6288eb63d ("vduse: Support set_vq_affinity callback")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/vdpa/vdpa_user/vduse_dev.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
index 49a231b..f953353 100644
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/cdev.h>
 #include <linux/device.h>
+#include <linux/cpu.h>
 #include <linux/eventfd.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
@@ -1430,14 +1431,10 @@ static void vduse_vq_update_effective_cpu(struct vduse_virtqueue *vq)
 {
 	int curr_cpu = vq->irq_effective_cpu;
 
-	while (true) {
-		curr_cpu = cpumask_next(curr_cpu, &vq->irq_affinity);
-		if (cpu_online(curr_cpu))
-			break;
-
-		if (curr_cpu >= nr_cpu_ids)
-			curr_cpu = IRQ_UNBOUND;
-	}
+	curr_cpu = cpumask_next_and_wrap(curr_cpu, &vq->irq_affinity,
+					 cpu_online_mask);
+	if (curr_cpu >= nr_cpu_ids)
+		curr_cpu = IRQ_UNBOUND;
 
 	vq->irq_effective_cpu = curr_cpu;
 }
@@ -1672,10 +1669,12 @@ static long vduse_dev_ioctl(struct file *file, unsigned int cmd,
 		ret = 0;
 		index = array_index_nospec(index, dev->vq_num);
 		if (!vduse_vq_signal_irqfd(dev->vqs[index])) {
+			cpus_read_lock();
 			vduse_vq_update_effective_cpu(dev->vqs[index]);
 			ret = vduse_dev_queue_irq_work(dev,
 						&dev->vqs[index]->inject,
 						dev->vqs[index]->irq_effective_cpu);
+			cpus_read_unlock();
 		}
 		break;
 	}
-- 
2.34.1
