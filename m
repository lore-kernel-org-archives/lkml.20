Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C96F443C1C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392989; cv=none; b=I1rhlX8xMIP5him45ZgDEMvagAyE06klXup3yQmCtzFnjfXOU+BZmcAM77rHiHP7guPrbdq05fOpmxnN/kbeTIBJcO5c7ZLCuF1VPJbX/rdnQsxPM++fdrmhIA1ikx16sNyO6V1UgGBx6SL5hd5o5rhJrum2g6cWLWfLi0hU5sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392989; c=relaxed/simple;
	bh=/meGI1Tm/tBlcwjTqS5kgSZy411s5gxaStb0PgqmkWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j6CpanE1i6eWzQZrFn0LayjY0zPHzWwnfN0EJCVYpQLBOVpbbQHj9vBk+kZ0becbWsayTJT3mCgYsF2PBpvqfFafJ64mfm+EYU//TJIBwG4WrmZiuw9ULqWjrDG912jnRpr5u+wcNtoBQwx6m7H7Evy9WclMycaZCibIvhOUSng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIRn27ym; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIRn27ym"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25400so1550975b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392987; x=1789997787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcAESydmQLFB9r6OKjQ0xxj/qfnH2J6wLUt6Y4fcG04=;
        b=SIRn27ymZKciixj9RgY87RWdzpQ/eJL+qyr6dRiN6t5g9jjAO5efbykvT/cIEl53Di
         ZnF9GEuNyeZlA6C+vwmPfFXbvrF4OtvsLdk3OE3b6qY4n8Qk+1iE/kcg9dy3459Kv9tF
         0BecMcF1+BOUJzi4CzofRjaHkqvH5Zt3Ypb285+sWK1F7YKX/gWGA/ioHBbonedVlU1+
         tsfdED3IT2hgURaowT2Rxn9C/+3oTGfuH2CDS4//WFYHynRKwFFJxykwPEQrDvFg/JzM
         WJHcFnBhIxMN/Bj7E8zYmJyF/vN/WUgf0FtZCI+qKBvOi+zKNB8hbwZShe+4OpDQo3gp
         ahpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392987; x=1789997787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kcAESydmQLFB9r6OKjQ0xxj/qfnH2J6wLUt6Y4fcG04=;
        b=o8rwIFA5tKXIBJShZf0gM5ya8URutjB+OZ/caVXQ1g+/wbRhs2B5Zqzww56kGSn1en
         rTyLJ7UZOOYl/ak8UTNODMfQw7J8+o4XE3i6rJKdRHogDxh888bTnEdA0V0xb/D/ucMr
         bBhsq+YerpKqA7udECxuyeh54jMgnwt3qXgbl4iBj5SvRW6RmzUsZr9JVdbPSJbfySc2
         fDs+fA4Zro1D/Wdk33ECbf7O8puKMBr284Y9nZe08vufepk9Rf3NLxwYd157dBzybMDW
         kvQ9dKzWpcI/8PtGf7ILdnvXwAoVfKG9eRJ0emASl/Leh/3e3u9gTE55fPF6J0WjrIMZ
         a/ww==
X-Forwarded-Encrypted: i=1; AKwUvByWNW18+TZtavuyCGp4k5psC80o9eE78447lLTlQ8aTlrkt6XuFWnDn1gAHzYsPJhyPuTbIN1eK7iX+Onc=@vger.kernel.org
X-Gm-Message-State: AFuF++lJrZD5y360G8d+yFEtF7R9gkSb5+2qrkAk5gyPgvThIXJ7pK29
	ccDnLoIbWcdZlrMokAFgEUXwiOj4PW4KZy3ZqlpK5j2trq5quQFFpzmAgwrh2g==
X-Gm-Gg: AYBFou3tgXH9FRfM5ElJEeZyyVwPopcjveK/UUAQYJnUxNCvoijRoYCLUibIebnkLUI
	3He+1Dpn0mgoBahbTHhX1kLataMJ0TasayRKD3abMAoaxCW32mkPjE5VAGPnOfoHc9MyKfc/bnl
	1PLxClxfkh7ECVhr2pamkZb0L5Qq2XnzM0RuW4QwlrsCtG3PdkVRWDmYxHUkaLIlXvzTt1Th8+L
	fWQxuZgN/TzIR10ELZ5BwH0/Vt+/WhngvIiorgcmBTLSHuxrYvT0owNkjPZcWRXOYU8bvrWp9JM
	ZZ+mlIVRIpHHY1Q7leVsqo7sSgn1WoG3GxmZfeHFV9WJCI9+j2lTPBl39Mc/oUzEtAoN0lDtIMO
	Qt7Y/Vc2wFG7RVlyJKVQnLr/71ZrWiNKo3aOhnb235m1/zkTXEwbz7KDGipJiSa1I1BksayTmLC
	vWvkiyTWKeg24b1Jq2LKqyOJQUqOkU6wpAzPNiypeJ50jwvBMBJRbmlNJPhISDGPgfUV1eZqoCG
	v7lE9A8Xmij5NZIow==
X-Received: by 2002:a05:6a20:430f:b0:3da:6bdd:2c74 with SMTP id adf61e73a8af0-3db404bcbc1mr5150299637.10.1789392987256;
        Mon, 14 Sep 2026 06:36:27 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:380f:6f8c:214d:70f7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6549ec0sm5081489a12.15.2026.09.14.06.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:36:26 -0700 (PDT)
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
Subject: Re: [RFC PATCH] scsi: virtio_scsi: bound EH timer resets to avoid unkillable hang
Date: Mon, 14 Sep 2026 20:36:20 +0700
Message-ID: <20260914133620.15712-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <28865bba-ac60-4c6e-aec8-64b1fcdb1c8f@suse.de>
References: <20260911163509.684191F000FF@smtp.kernel.org> <20260911164417.33860-1-ngocthang2710.1999@gmail.com> <28865bba-ac60-4c6e-aec8-64b1fcdb1c8f@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/14/26 11:17 AM, Hannes Reinecke wrote:
> So the better fix would be to implement a host_reset() callback for
> virtio-scsi which would reset the virtio setup, terminating all
> outstanding commands and reset the queues.

Thanks for the suggestion, Hannes -- that's exactly what the patch
below does (also posted separately as [PATCH v2], Message-ID
<20260914133144.15509-1-ngocthang2710.1999@gmail.com>; linking it back
into this thread since the subject changed and a couple of mail
clients won't merge the two threads on their own).

It adds eh_host_reset_handler backed by virtio_reset_device(): once
virtio_reset_device() returns, the device is guaranteed to have
stopped touching guest memory, so it's safe to let
scsi_eh_offline_sdevs() free the stuck commands' DMA buffers
afterwards -- the guarantee that was missing before (falling through
to offline with neither target, bus, nor host reset implemented).
Reuses virtscsi_remove_vqs() + virtscsi_init(), the same
teardown/rebuild sequence already used across suspend/resume.

Verified against the same QEMU virtio-scsi repro (PCI_COMMAND_MASTER
cleared mid-write): EH now runs abort -> device reset -> host reset ->
abort -> device reset -> host reset -> offline, dd's stuck fsync
returns EIO, D-state drains to 0, ~244s total.

Suggested-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
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

Thanks,
Thang
