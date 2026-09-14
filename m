Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F89D3BB67F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392715; cv=none; b=ql3BSCpdplY0Xm9tmveO+mgk/Crcs1EuPOVqiO28aj0twP631ESGRoCnR5j8lS/OJQo7b+Cot9WySx/EsLZwqhR4nRT1F14elw0fWqu5in5LYI6YifF1gA+fmJG4/7NWS7/GntUPx3scjrM4kuNA1l26b+KFwNiNIGLZIMHbS/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392715; c=relaxed/simple;
	bh=bMsdMvSus7U2Fs9+6bR7h1oluEPI74JhEILnfWIGtj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZQomzhe6ut4HBfnOMgMjzVCJWbnKAQS5z8YkztHueykF2bul4CUV/uWmho8oOxbL4CVjeVbLaDkSSxY9IFpcAeLGBWibKKl3MUX4VMcLPCEUp4xPO9bfvHPZj3altDwFv5oZpCuQtkY6LBqM/nHPoIgGvzC+/cZJRsZCgudEss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqjwOeIC; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqjwOeIC"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fe517774so26314485ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392712; x=1789997512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msYkVtDkbmBFevf86iAldrO7owfuyjwEGQdpBpjsguY=;
        b=DqjwOeICQwqyNzy0XtxT7DLbZGMUluk+fpHn2OJagMm2MWdvsQfjLBstwtnYo/1rUC
         1I2MCRMQ/cs0T8EPqODRirE5ykQk1uY7E9v7dunfa5w10WkoFQnaMAWvGeE/u0Mn4LS0
         5kpQ4npGWpugmjfCbD6T3cfluWhMQmvJR7GEueiuVLKpM9flnNDnkR2Cb9cytiMDBGQj
         6xXKO6XqyeyE4S4OcFtzSc8GQ8pvpefnk1t9kBimAmVwAESq/GtwpzeQB4xRczfMSAsN
         QBK7z2d0JnWePs81FpJC/Hdh9/nGwSoKAdUBeL4iyrwS5Q4ogozSLtpJrQ7s1CGywPyA
         GYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392712; x=1789997512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=msYkVtDkbmBFevf86iAldrO7owfuyjwEGQdpBpjsguY=;
        b=V5a/liYNzz+9xcKpGPFfWqNJfE6HB8/v//lFru/xFHl/m9YGRcA8Img3tNH/E8bvLI
         bg2NbsVggyx7HX84wuGqeK3YkZtLfrrV5oFfs8IENids2fIOyNhc+MCX/aqvFG+SmMAQ
         P63T4yJ8dycO4t97ttF1SEx91uYUEScl/KOdS1mvnBL4r1MlEi2ngMqSEdHqP5ujgSAn
         lqw3OY0HFwApxwez2H7MO7ahUSxuUydIeA5RUbH45wOyoqgd3Ov2AnZwimvnhQEOHFzr
         6ZWn9koofmu2XdQkaw6K080kBSCQi6iLP3+HJKxBG3HcdV8iOY3Z2I+/L1Vd+mpWBQ5e
         Dhpw==
X-Forwarded-Encrypted: i=1; AKwUvBzHdmBi7I/ShAfzWTsMCyuvjm7gYQFrrutOWDqoUnH0APT4v6yhQ5x3h34DkuOMC6m83/TZ6/aRcQm9FW8=@vger.kernel.org
X-Gm-Message-State: AFuF++njgJjvNqHDB26JeqLE2plC/yDnFCqMRfPBpj6ctP+G4SCkstIb
	3Qfe/6kIqEW7LWxoBi+YO8vhYgEJ0+KcL/2FjZUkMRbpvYREPXq/G/rG
X-Gm-Gg: AYBFou02KTt7L2bU9OXiHrYes2M0lzwocICyKTdIDdT8HUBUyC+QbAQk1b3GL4dwDh/
	TqGvvwyFrP8h8UW/Si+UeS64u3tBn5S05CY+owDVuHdsd+Ax0ra/hWkBv1kFiArxvUpYIuuAxg/
	kM1WsXYLnQIsE+D64g9jcflM2Nq2bQRiUzesSNWsR8RqsLeyfr9wyW4JP00AP/yRTctnvA9qO47
	tanXUInQ0l9uvYZPYG0UGUjGXZlYngONWI8twR3BiUTTojsyehmpYYGNuvwW8cfPfYMpGdG2bs5
	FK1Gttr9FTaREkjGcFnTf9lsg7AoydIB37BfXOUk0M07QuiJ0t86VuTi7eLtQv/T05ubjW7xOK2
	ljoL/vmLSjrm7QUBXUJt0oQ8eYy/oxCW9hg8994GhAVkc58dRE4Ov/YIQEVU62zFmv6Rr0iUEO8
	4xfIVK6JlY96sojkMoz3xm6Aqw6F0g6YdX2HiRhk7m+iHqTQhaaVRhfQ8bLQsecHOE6299DNsHk
	x8ihvYzGyshMM3cxA==
X-Received: by 2002:a17:903:94e:b0:2db:117e:cf50 with SMTP id d9443c01a7336-2dd6c5bfe2bmr63442775ad.4.1789392712534;
        Mon, 14 Sep 2026 06:31:52 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:380f:6f8c:214d:70f7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb1c94sm48433875ad.31.2026.09.14.06.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:31:51 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Hannes Reinecke <hare@suse.de>
Cc: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	mst@redhat.com,
	jasowangio@gmail.com,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	eperezma@redhat.com,
	virtualization@lists.linux.dev,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: [PATCH v2] scsi: virtio_scsi: implement eh_host_reset_handler
Date: Mon, 14 Sep 2026 20:31:44 +0700
Message-ID: <20260914133144.15509-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <28865bba-ac60-4c6e-aec8-64b1fcdb1c8f@suse.de>
References: <20260911164417.33860-1-ngocthang2710.1999@gmail.com> <28865bba-ac60-4c6e-aec8-64b1fcdb1c8f@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Once virtscsi_eh_timed_out() lets SCSI EH run on an unresponsive host,
abort and device reset both fail the same way (same dead ctrl vq), and
since virtio_scsi implements neither target nor bus reset, EH falls
through to scsi_eh_offline_sdevs(), which frees the stuck commands' DMA
buffers without any guarantee the device has actually stopped touching
them. If bus mastering (or whatever broke the transport) comes back
later, the device can still write into memory the kernel has already
reused.

Add a real eh_host_reset_handler instead. virtio_reset_device() is the
guarantee scsi_eh_offline_sdevs() was missing: once it returns, the
device will not touch guest memory again, so it is safe to hand
outstanding commands' buffers back. Reuse virtscsi_remove_vqs() +
virtscsi_init() -- the exact sequence already used across
suspend/resume -- to tear the virtqueues down and rebuild them.

Verified with a QEMU virtio-scsi repro (PCI_COMMAND_MASTER cleared
mid-write): EH now runs abort -> device reset -> host reset -> abort ->
device reset -> host reset -> offline, then dd's stuck fsync returns
EIO and D-state drains to 0, in ~244s total. No task remains
uninterruptibly blocked.

Suggested-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v1 -> v2: implemented eh_host_reset_handler as suggested by Hannes
Reinecke in review of the original RFC, instead of relying solely on
the EH loop falling through to offline.
---
 drivers/scsi/virtio_scsi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
index b4f20c487718..9698f4f91cc6 100644
--- a/drivers/scsi/virtio_scsi.c
+++ b/drivers/scsi/virtio_scsi.c
@@ -833,6 +833,8 @@ static enum scsi_timeout_action virtscsi_eh_timed_out(struct scsi_cmnd *scmnd)
 	return SCSI_EH_NOT_HANDLED;
 }
 
+static int virtscsi_host_reset(struct scsi_cmnd *sc);
+
 static const struct scsi_host_template virtscsi_host_template = {
 	.module = THIS_MODULE,
 	.name = "Virtio SCSI HBA",
@@ -846,6 +848,7 @@ static const struct scsi_host_template virtscsi_host_template = {
 	.eh_abort_handler = virtscsi_abort,
 	.eh_device_reset_handler = virtscsi_device_reset,
 	.eh_timed_out = virtscsi_eh_timed_out,
+	.eh_host_reset_handler = virtscsi_host_reset,
 	.sdev_init = virtscsi_device_alloc,
 
 	.dma_boundary = UINT_MAX,
@@ -947,6 +950,27 @@ static int virtscsi_init(struct virtio_device *vdev,
 	return err;
 }
 
+/*
+ * No bus/target reset in virtio-scsi, so EH lands here after device
+ * reset also times out. A virtio reset guarantees the device won't
+ * touch guest memory again, so stuck commands can be freed safely.
+ * Same teardown/rebuild already used for suspend/resume.
+ */
+static int virtscsi_host_reset(struct scsi_cmnd *sc)
+{
+	struct virtio_scsi *vscsi = shost_priv(sc->device->host);
+	struct virtio_device *vdev = vscsi->vdev;
+
+	scmd_printk(KERN_INFO, sc, "host reset\n");
+
+	virtscsi_remove_vqs(vdev);
+	if (virtscsi_init(vdev, vscsi))
+		return FAILED;
+
+	virtio_device_ready(vdev);
+	return SUCCESS;
+}
+
 static int virtscsi_probe(struct virtio_device *vdev)
 {
 	struct Scsi_Host *shost;
-- 
2.43.0

