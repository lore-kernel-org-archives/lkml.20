Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152F65328AA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877874; cv=none; b=FbPwbWRLarp2qmcBfZk+kOjrW6soiAo5UrcdniNxnMe2oUqKsm+QiKGA6fTx7sWbF7WF6HovijO8hMQxMipLl2vbZSC+w+oULU3DG5fyOn8MCBj/A7HX8TW8Tp/x+V9GkXPN7gYsT5oSfT73vNYiMFby6dAboVTQXUdNPgud5dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877874; c=relaxed/simple;
	bh=ePjpuxt69kS50oyNDgw+f5tSDLqVBi+3bO63cn7u3Ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TZuN7w/QLThM3ZA+k7PoqaZpNde9Z1wdVA7fcf3GqdREc5dEO5lMJ8XaDwCdf1rY35bYaaQkYnf56iCu0MznGMsVXvUrmC3/P3D4Zl+CH4HUGP9iK1IXtO/dW0bfLDo6MMPPe7ChZ5+vpA6Misi/0gEdG2Jt2dpSIrYm3/G7UhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nUcrs7wU; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUcrs7wU"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so4888726a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788877861; x=1789482661; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ziivm8PXwNCzw9owyNySO7ntkI+vjyDayy5Z1yIWdeE=;
        b=nUcrs7wUvXH/ri2vLkyZeXkcYniy+mEhu09VaPKcl+W/ZdQRfatJn1TF9IPa5E1cua
         wWJJa0B8mgHdUL6/UlXPWAf9bdBqZ9uekNoHkhYmZ8yadhUZnmAzMxpLxVIvCdJp4kg6
         zukoOx57BxJK1wOp7Q8kJt6iMJQMB3iwZNpQAr0VhIJlNcfif2hqebixU9g9OR200RjK
         L4VSQOnGDTBkqD41deoowfCeKltGcnL1LzcpBRltCDBE+hhFCdjAWVmzmKa/tQ4gkEa6
         AT8at8gJzxp/XmEUS9lfmbbyMvVNFRNlHEC4+Sozhin4oXfjGhJEXFeSsjZu31t6O0jT
         UXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788877861; x=1789482661;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ziivm8PXwNCzw9owyNySO7ntkI+vjyDayy5Z1yIWdeE=;
        b=NRZgj33JGElzASRZCHXpzPEHvmAP3u/u5ygtii7oyFWsh48kbi5LBT22neEw3k9HYx
         h+vSEygAMPtkSFtbHpVZwaqrZhjrEO3GnNW1NxnYvsq5pEa83e7FiBU6Z3C+QhN76wKe
         Q3HLkLnZEhKDlo/HfZdEZMdRaljIIZQ5Mtmwq25KCsH2A59wySKADTjvNe/Rwct26flm
         vXi8UeEuWtzFTr74OciSdPUSvVSu852lOh0YAWGQuqq8qrrgPNQYXUBo36E7vNwRX2aS
         ceHtg5H9bXNcm/OufaE0RASjY/vnetJC/2a+AkR1Y8UTKy1sc9p7lyynVvTF0pHRFCAI
         yMOg==
X-Forwarded-Encrypted: i=1; AKwUvBxvGXRfrVtLf4aUFLMjd8GUDeR8rlZNPC7Z9vnpz8cuJwcY0kiMTWvq6Ksa++kWFYPpF+Z0Wnwal2mhf6A=@vger.kernel.org
X-Gm-Message-State: AFuF++nR4foT8RND7Ic4CAEA6dIVFES2iggR0le7EYYZpZscin0rqtvz
	dPUWTH+dZC3jY2onpFC7/9oOiEmCJsw4MBdpvBp8Dm3kmL9FSUKuhRS5
X-Gm-Gg: AYBFou0pcfghHUYj7JNI4oNhHeUiOBCyslSrEHRfPZ5F4BvtGhXQ0iMJTYPVPfq+zvS
	eSLuMHILnXm7ITy8oyozOFWQ9ZAkvgD0Uzz/MENM8/M31bkKu8g48PJOQbVnZYq3eN2wc2uJBpl
	EAdmQB2Id0T/Sjn5zc1BoUAQkqmF7p63o1mz4s8qrCVlw4kbVMePXQOd1viGewsYHVikwzNVewG
	4ZCW/A+T+Fu4KTmRzThMIFQGoM0AFe9U1XWwL9qyh0JkHGniKObfkxhdOezmFbiY5OoZMh8wrhf
	OXGR2XbqAiC//hfjDegDSPOtRMrvS3Wj+pUiy9WQoDboL7xLcSoB0i+CxPDASi9cBe6bblr8yCG
	ehpLONB4WVwQ2N4/L657DVsMQohJA7Pnvpos/JlpyV6M3PtK6Kf+72ybGpsSI8jdqYuz2JAatVj
	Ris56NBmWcHDi58ZyHe54ApvuWgxr+M+gaOW+WHw/0ohncVBJk8quqT7uRTfVBuGt8zTPwou5y
X-Received: by 2002:a17:90b:57cd:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39b260fead0mr43803215a91.1.1788877860484;
        Tue, 08 Sep 2026 07:31:00 -0700 (PDT)
Received: from [192.168.66.6] ([218.108.80.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26127fddsm26263843a91.12.2026.09.08.07.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:30:59 -0700 (PDT)
From: Linfeng Sun <linfeng.sun.dev@gmail.com>
Date: Tue, 08 Sep 2026 22:30:38 +0800
Subject: [PATCH] vhost-scsi: initialize command pools for late I/O
 virtqueues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-fix-warning-in-sbitmap_get-v1-1-767c2c211a2b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3QrCMAxA4VcZuTaQ9aK4vYoMaWtWMzCOpv7A2
 Ltb9fKDw9nAuAgbjN0GhZ9icteG/tBBugbNjHJpBkfO00BHnOWNr1BUNKMoWpR6C+s5c8XonRs
 Cz4k8QRushVv9m5+mv+0RF071e4R9/wDCN43HfgAAAA==
X-Change-ID: 20260908-fix-warning-in-sbitmap_get-b6229aefc060
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Mike Christie <michael.christie@oracle.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Linfeng Sun <linfeng.sun.dev@gmail.com>
X-Mailer: b4 0.16.0

vhost_scsi_set_endpoint() allocates command pools only for I/O virtqueues
that are already set up, but publishes the backend for every virtqueue. If
userspace finishes configuring a skipped queue later, a kick reaches
vhost_scsi_get_cmd() with scsi_tags uninitialized and triggers the
!sb->alloc_hint warning in sbitmap_get().

Leave skipped I/O virtqueues inactive at SET_ENDPOINT. When SET_VRING_ADDR
later completes their setup, allocate the command pools and activate the
queues. Roll back both if access initialization fails.

Fixes: 25b98b64e284 ("vhost scsi: alloc cmds per vq instead of session")
Signed-off-by: Linfeng Sun <linfeng.sun.dev@gmail.com>
---
I checked QEMU and found no evidence it's affected. I haven't checked 
VirtualBox because I am not familiar with it. However, the virtio spec 
doesn't require a specific operation order, so a new VMM could still 
trigger this issue. 

Crash log:
[   34.698961] ------------[ cut here ]------------
[   34.699385] WARNING: lib/sbitmap.c:286 at sbitmap_get+0x227/0x270, CPU#0: vhost-82/88
[   34.700542] Modules linked in:
[   34.701309] CPU: 0 UID: 0 PID: 88 Comm: vhost-82 Not tainted 7.3.0-rc2+ #14 PREEMPT(full)
[   34.701958] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   34.702717] RIP: 0010:sbitmap_get+0x227/0x270
[   34.703247] Code: 41 8d 5d 01 89 df 44 89 fe e8 f5 3a 46 ff 31 c0 44 39 fb 0f 43 d8 e8 38 46 46 ff 65 41 89 1c 24 e9 25 ff ff ff e8 29 46 46 ff <0f> 0b eb ba e8 20 46 46 ff 44 89 fe 31 ff 45 31 e4 e8 c3 3b 46 ff
[   34.704234] RSP: 0018:ffffc90000ec3bb0 EFLAGS: 00000246
[   34.704677] RAX: 0000000000000000 RBX: ffff88800500dee8 RCX: 0000000000000000
[   34.705166] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88800500dee8
[   34.705584] RBP: ffffc90000ec3be0 R08: 0000000000000000 R09: 0000000000000000
[   34.705988] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000006
[   34.706477] R13: 0000000000000000 R14: 0000000000000000 R15: ffff8880050094d0
[   34.706955] FS:  0000000014d05380(0000) GS:ffff888099c36000(0000) knlGS:0000000000000000
[   34.707463] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   34.707854] CR2: 00007c0c3c20e000 CR3: 0000000008e47000 CR4: 00000000000006f0
[   34.708592] Call Trace:
[   34.709259]  <TASK>
[   34.709822]  vhost_scsi_handle_vq+0x4a9/0x1b20
[   34.710437]  ? update_cfs_rq_load_avg+0x2e/0x230
[   34.710874]  vhost_scsi_handle_kick+0x2c/0x40
[   34.711292]  vhost_run_work_list+0xa6/0xf0
[   34.711673]  vhost_task_fn+0x76/0x1b0
[   34.712003]  ? __sanitizer_cov_trace_const_cmp1+0x1a/0x30
[   34.712506]  ? recalc_sigpending+0xe1/0x130
[   34.712890]  ? __pfx_vhost_task_fn+0x10/0x10
[   34.713325]  ret_from_fork+0x37a/0x630
[   34.713673]  ? __pfx_vhost_task_fn+0x10/0x10
[   34.714031]  ret_from_fork_asm+0x1a/0x30
[   34.714535] RIP: 0033:0x0
[   34.715201] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[   34.715587] RSP: 002b:0000000000000000 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   34.716158] RAX: 0000000000000000 RBX: 000000000048bb20 RCX: 000000000041ca3d
[   34.716571] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
[   34.716957] RBP: 00007ffcac47c4e0 R08: 00000000ffffffff R09: 0000000000000000
[   34.717418] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000004
[   34.717826] R13: 00007ffcac47c778 R14: 00000000004af868 R15: 0000000000000001
[   34.718363]  </TASK>
---
 drivers/vhost/scsi.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index 4f8c0260bc9e..069a6ff4dd40 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -2008,6 +2008,40 @@ static int vhost_scsi_setup_vq_cmds(struct vhost_virtqueue *vq, int max_cmds)
 	return -ENOMEM;
 }
 
+/* Callers must hold dev mutex. */
+static int vhost_scsi_activate_vqs(struct vhost_scsi *vs)
+{
+	struct vhost_virtqueue *vq;
+	int i, ret = 0;
+
+	if (!vs->vs_tpg)
+		return 0;
+
+	for (i = VHOST_SCSI_VQ_IO; i < vs->dev.nvqs; i++) {
+		vq = &vs->vqs[i].vq;
+		mutex_lock(&vq->mutex);
+		if (vhost_vq_get_backend(vq) || !vhost_vq_is_setup(vq))
+			goto unlock;
+
+		ret = vhost_scsi_setup_vq_cmds(vq, vq->num);
+		if (ret)
+			goto unlock;
+
+		vhost_vq_set_backend(vq, vs->vs_tpg);
+		ret = vhost_vq_init_access(vq);
+		if (ret) {
+			vhost_vq_set_backend(vq, NULL);
+			vhost_scsi_destroy_vq_cmds(vq);
+		}
+unlock:
+		mutex_unlock(&vq->mutex);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
 /*
  * Called from vhost_scsi_ioctl() context to walk the list of available
  * vhost_scsi_tpg with an active struct vhost_scsi_nexus
@@ -2105,6 +2139,9 @@ vhost_scsi_set_endpoint(struct vhost_scsi *vs,
 
 		for (i = 0; i < vs->dev.nvqs; i++) {
 			vq = &vs->vqs[i].vq;
+			if (i >= VHOST_SCSI_VQ_IO && !vs->vqs[i].scsi_cmds)
+				continue;
+
 			mutex_lock(&vq->mutex);
 			vhost_vq_set_backend(vq, vs_tpg);
 			vhost_vq_init_access(vq);
@@ -2466,10 +2503,13 @@ vhost_scsi_ioctl(struct file *f,
 	default:
 		mutex_lock(&vs->dev.mutex);
 		r = vhost_dev_ioctl(&vs->dev, ioctl, argp);
-		if (r == -ENOIOCTLCMD)
+		if (r == -ENOIOCTLCMD) {
 			r = vhost_vring_ioctl(&vs->dev, ioctl, argp);
-		else
+			if (!r && ioctl == VHOST_SET_VRING_ADDR)
+				r = vhost_scsi_activate_vqs(vs);
+		} else {
 			vhost_scsi_flush(vs);
+		}
 		mutex_unlock(&vs->dev.mutex);
 		return r;
 	}

---
base-commit: dd886653d2038a510a21bff476fa1be0422a4fb9

Best regards,
-- 
Linfeng Sun <linfeng.sun.dev@gmail.com>

