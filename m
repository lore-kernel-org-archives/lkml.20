Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408C04483A1
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723275; cv=none; b=PUW92F1AXBH3Z2wAQG3vCDaTqI5xNd9Uiaer4qdJ3FUMPhVj/vHJDs1nbZOOQ5NPCixJ0cHNSqTKWtoehz7u9Si3icMUF/P3Ge+MQmRt69kVYD2Rjc/iLa4OGvokLGhn/cafhv0T4h9xKdte6lpT360hED3f+bJMqDsn2v2Xxwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723275; c=relaxed/simple;
	bh=BljPXRps8xjbLho6X1ZoNVOk6CUa6vnUVpwHPT+7JbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YpWp+qwZTbyOL5I1jaAw7jLhLX3ylvldmsS4/y73ge0QIhE6yx7ZpaWqAVrgJbfa9PsNQIpWbE5GQZYvtIA/4pEz+t4Ua3HkzMD3UHYqybN1P8gyhZqlr3pihtzJo5SrYlQFjBEGGZhcZHaFvV+atXDeL1nu3k9jTiHW2MSJdxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWUR54pQ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWUR54pQ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-88834d30002so429901b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791723273; x=1792328073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwkyR+d13Yt35PeifZJYjSerizH5kaNtuABNu7XQY84=;
        b=TWUR54pQb9mgaV0pll6uCLtEUbu8ozw9hYjl7/bKq859QNHdn4eNynHneuCcdhGcC0
         pKlk6tcc6T0CtKvekoCpL6T18F7B2o/K9/O9jymzL4A+cC2jothLZh3u65DSy7dK9QPO
         IjgXs+B96j/HCR0aT5eg4U/FzRBOKw/z3RhQ+gWrKKdEZ3FaiwyjI4NQijYpWf2v16eb
         +mXghcd1Usy9Krj9ZyC8IHR51HInfLkH2o3cgHMrtO9Z0BlpYgiwlG51fZf9D+L1MDBb
         nPiYxavhcylTxrG+C3Ap1eSA880d0mnraEyGuAuP3ejFC3Tb12b0jv8R/G3UCaA9i35E
         3JTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791723273; x=1792328073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwkyR+d13Yt35PeifZJYjSerizH5kaNtuABNu7XQY84=;
        b=w2qHvlrxPHuUxjJErxmGqUQOnvKQAPi20ryZO/NcX0hpC2pvYydmDBehyRMaLghPRD
         evRycRwTuF4v0kg4wRnA6FHBb2fuZaF2rhl27NGepEpZVtuP8B2azPhvGxbnTx6ud4nQ
         rqA8yYJDaSFGFc6u6tW3YqVJs6kJOeE2Hs3MgexrnbY6ocjGwzokdUJsKHLFhwxNXNWg
         Gr5I/qSRsGRIbPJDbmgCQR4rRU5PY4TuArhK9vdJCK4wbfxyRMFuUvv+ORxHBLeVEFFh
         U/nMaFarDRWzwMCtWpgE9RUPDKMVUlcWJ2O05Gc+CAEe+gkCk2PlvhSV5nxx/SE13xCW
         +oMQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0u202+KtvyyucztJ56Bu6BtdmzjSSktfDGaO60VCXzv0P7ir3+WZn9M/qm2ggiiXuQSYi6cWsiWaC1iY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMHbOIV1LkNiCppk96wEYl6vWSdusfgiO4+GTTBggW9vFRBQS4
	9Cu2xPXlbcRbZC+LduoQj0ScEoQLByS0YAfclTj2CoJc4ICQfdshBZGV
X-Gm-Gg: AYBFou2rFtoJ6B/4+RCcWya/cTE3t3HXyxkIiXHOzDj/Nw9GyCf8m/svOOV1WN10Z2h
	0ajIloA2z/bOYknfbdrh3OQ0zi2FGifo7bLtBSqMNVmKQhIxSazZw9vn0erD8DAlWQaZHe5Jf3E
	kYLCs0JAbTfoi0oExHuxCQ/j4tuNyzz1M3SHJ/UXMAB3o6d2J6x2SxZ7eCtKWjAC+8Kq13XP4sv
	zxxLrzew+2o5MukJxehKmFNvaiZRycsJPQ8EfZOuRnGXUtsWYcJMctpvndf/M67s3Cthzm/lvlS
	qZbcTI2Y6TMH3yKW6wrPhi+4kFYVbFTbPmznHg6Xld7DBOIncu9kSwgDYgvt+8psCZ8osnE7gXW
	pNbYvtIz5YS1R+tw/mm7ODWu4n7xc1D74mhdE8t4/KtqZYsWsxDwifZaDRTBv48CJki9a0eHwLM
	XCXDVFbEWQC/nHZIh3Q1OCDOmdDuMCQB95tEexUGzptKEKShSnNFobSGEEfLy3NkTJA/9k64Uex
	qsc+abBOL5KqUtt+sKpBnmLByaftOIl3Bisu3SsmnxJXtXhergQIa5Ue8+e8CTMx1z+ao/SpEGY
	Fcc8AZHq1aXfl5Z0LuwX/WpPop/RdFSywSA37e3U/4aNGWGvGdC2YSzHZb9PX1L8IRuePEX9RlX
	W3sPj5QIEELsVbl1ZKItHA21cXKsva6CvFc9cZCIDEWijambFizm4b5mtDBB7D+eTN9o/2dxS
X-Received: by 2002:a05:6a00:23c8:b0:87d:dc3c:1b5e with SMTP id d2e1a72fcca58-897c634d89fmr5838569b3a.26.1791723273443;
        Sun, 11 Oct 2026 05:54:33 -0700 (PDT)
Received: from desktophank.localdomain (111-242-217-19.dynamic-ip.hinet.net. [111.242.217.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-899b738d03bsm929232b3a.41.2026.10.11.05.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 05:54:32 -0700 (PDT)
From: Ting-Han Hou <ue081723@gmail.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: virtio: reset I/O message fill level on prepare
Date: Sun, 11 Oct 2026 20:54:26 +0800
Message-ID: <20261011125426.35745-1-ue081723@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit fe981e67568c ("ALSA: virtio: use ack callback"), an I/O
message is only queued to the device once the application has filled
the whole period: virtsnd_pcm_msg_send() accumulates the transferred
bytes in msg->length and queues the message when it reaches
period_bytes.  msg->length is reset to 0 only when the device completes
the message.

If the substream is stopped (e.g. snd_pcm_drop()) while a period is
only partially filled, the corresponding message is never queued and
keeps its partial length.  virtsnd_pcm_prepare() resets msg_count,
hw_ptr and the indirect PCM state, but not msg->length.  After the
next start, the stale length is added to the new data, the sum never
equals period_bytes, and the message is never sent again.  Playback
then stalls once hw_ptr reaches that period: writes fail with -EIO
("DMA or IRQ trouble") and drain fails with -EIO.  Capture is affected the
same way after a partial read.

Clear the fill level of all messages in prepare.  Outside of the resume
path, virtsnd_pcm_prepare() already refuses to run while I/O messages
are pending, so no message is owned by the device at this point and the
reset does not race with message completion.

Reproduced in QEMU (virtio-sound-pci, wav audiodev): prepare, write 1.5
periods, drop, prepare, write 16 full periods, drain.  Without this
patch WRITEI returns -EIO after 14 periods and DRAIN fails; with it all
16 periods are played and DRAIN succeeds.  Period-aligned prefill works
in both cases.  The same sequence on capture (read 1.5 periods, drop,
prepare, read 16 periods) fails with -EIO after 10 periods without this
patch and reads all 16 with it.

Found by code inspection, confirmed with the reproducer above.

Fixes: fe981e67568c ("ALSA: virtio: use ack callback")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
Testing notes:
- Tested only with QEMU's virtio-sound-pci (wav and none audiodevs) on
  x86_64 with KASAN enabled, using a raw-ioctl ALSA test program;
  not tested with other device implementations (e.g. crosvm,
  vhost-user-sound) or with alsa-lib based players.
- Suspend/resume during playback (pm_test=devices) was also tried in
  QEMU and works with and without this patch.
- Lockdep was not enabled.

 sound/virtio/virtio_pcm.h     |  2 ++
 sound/virtio/virtio_pcm_msg.c | 19 +++++++++++++++++++
 sound/virtio/virtio_pcm_ops.c |  1 +
 3 files changed, 22 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 368dafa5df3f..8837dfc12828 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -118,6 +118,8 @@ int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
 
 void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss);
 
+void virtsnd_pcm_msg_reset(struct virtio_pcm_substream *vss);
+
 int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
 			 unsigned long bytes);
 
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index a5c4e7027717..72103f606716 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -182,6 +182,25 @@ void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss)
 	vss->nmsgs = 0;
 }
 
+/**
+ * virtsnd_pcm_msg_reset() - Reset the fill level of all I/O messages.
+ * @vss: VirtIO PCM substream.
+ *
+ * Messages that were only partially filled by the application when the
+ * substream was stopped are never sent to the device, so their length must be
+ * cleared before the substream is started again.
+ *
+ * Context: Any context. Takes and releases the VirtIO substream spinlock.
+ */
+void virtsnd_pcm_msg_reset(struct virtio_pcm_substream *vss)
+{
+	unsigned int i;
+
+	guard(spinlock_irqsave)(&vss->lock);
+	for (i = 0; vss->msgs && i < vss->nmsgs; ++i)
+		vss->msgs[i]->length = 0;
+}
+
 /**
  * virtsnd_pcm_msg_send() - Send asynchronous I/O messages.
  * @vss: VirtIO PCM substream.
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index 1105e7ff3523..1091100a4c98 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -299,6 +299,7 @@ static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
 	vss->xfer_xrun = false;
 	vss->suspended = false;
 	vss->msg_count = 0;
+	virtsnd_pcm_msg_reset(vss);
 
 	memset(&vss->pcm_indirect, 0, sizeof(vss->pcm_indirect));
 	vss->pcm_indirect.sw_buffer_size =
-- 
2.53.0

