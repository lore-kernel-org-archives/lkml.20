Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C703BB12A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869451; cv=none; b=ZLDZjDIXY/1iur56F3pXAZ2CetRrsF3Gip0iTI7VV4r0ayzwwqgFBhbihb3UnMxY9cAzd5zfdQaAdGT7om0ya4Ib4HWWuNsHwcBrlzn20eev4e8O4KtWthnHQPVFZUaaGzm4UwUJU2CcALKpdudCH3Y8Sr2n5bweqwJElqM/qos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869451; c=relaxed/simple;
	bh=AZpMcQVd242wNsymyeLV+kUSdiW8V59Q0tvwcs6k848=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBWPgdk3ayCScJJO6Z6ZloZktkz9eAJadK7GJm2PcuiTyto2vnhyLQZ+enyr32JTxkWC8ABbn27u3KPnqOqAaiUbTUczarsfCqLooreKqRgiK+Tq1ygxPaDcJC3cxoReU73dkxBI4VVfuVWVlMqocg3iamXcpnJWAq4guIlAPmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAm+48JX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAm+48JX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e7006bbf77so13884555ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791869446; x=1792474246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mgSlMltKjH9fZj/9bm3MvgD0zfBRnf6rS+vp3uicNHM=;
        b=aAm+48JXIaxa1Cfmyh/YaGggJpzq7MjEaX4d2V9/vZaqvHRT4fr0BU1XbReNQFEDAA
         ae+D+qnbFO9iLbEOW4IvIbRZU7MmLIpdVDVZntYhwAZOo+lhxEUenI5VD0Z1WobzKx96
         I+HjSB7s+lmaCBHO5BVhKN6jM7cMY3Q/VV8u48lyneJW9WBuMQR4WTjjVqxVnL9OznUR
         hHpksf3JBKMiKqzhoQplkDyciWODmleVL7uAmpIKAjkUb/Rks3qq6kl8znzOaK8fBYDn
         ABf1dmGRdza3WaPFbUboAFhHcg6aQW/aHbkt+8hcNxh5fIeIIOye7Ad00MlBLpKBL4BM
         0qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869446; x=1792474246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mgSlMltKjH9fZj/9bm3MvgD0zfBRnf6rS+vp3uicNHM=;
        b=nSziVG3t3xOOmNKNFTYF+5Fiai3rBWII3Coz2U6/ccYobarPjBNeqp7aKmMcMKMQH/
         BQfUWHVpe5QK47a5wD7t3qqtomFSrDiCDheAFAlZ6FPcuxqrFlPeWWEBMsJpjskRNvJv
         YTJ1vFl6pZ/wQa/CP+v5zvzNzCqYNz4IhQL24PKzMdzx8dLE+phaz+vKzR24YFVWnzbL
         Hf660/XiJN7yW2uw+nP2okmzhJigJCRy9hxgVB+BQSrkR8M0124Axj4jgX5BRijiIXxM
         BCpEl9U6hx9+4MhXNC+BVzctiPtLz83Ewj/vb6/Dj+YThFCRhF8MZ8OOPtfM+Yhb9rBC
         +DsA==
X-Forwarded-Encrypted: i=1; AKwUvBw2BQusihWYG03oJ5dpi5osjt9OPS+wMK6oKCXV4wQ5QsL/oox2w8DOf5irQnT+OQ9u2uiqN8uWHIktx8Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoJzbBm3Zjnk/jP3C8pm7qg7KEqy6IHHDC8aT7hETtuPTzNR+6
	qYkQ2Fu1Hqz3HxgJzue0bvAplKp8WGB0keJT4pyhWlk0YxmdVlDPQzbY
X-Gm-Gg: AYBFou1Dvvo4iGMfGQo8aBWmP68ck7s1K12Ervxk8GsroG2qmi+vMpdK4Dbc9EXoKJx
	odWuNDCtpvSOJ10PF26k3Wxw8TPlj7e5HzMZ3FNoRlj0qIUHAWLZ2wOLN6+oUSoWpWsoZZCINBv
	MPWvdt0tGoEiQ6TDDS/Chj4e2Oo77An1HdGrU/a8Hi9rKSa4hGVJs/zJn/gfwCaHRcKoBjkkkNP
	qHqJySwxQpPVYgPO4x+yfOcrk1MT9DL4CAOHDIWep0pxzt8B17MSLa+/nrEN/t+WCvzqAwlPTrp
	TPPfwvRtB+OnmBcdcHbfePx3OLhJVY8MUGtMpQlH6eeY8XMlZ+9wShGynmX02TVg2HAFLilbRz5
	Y6VSgEtHTAHT0rXW4ppT4juV/oz6tHRQeUNZwVVoMIPqfOS2OsBCSXsa36eSay6+wK4F2PPlQfw
	G5elX38Zi3MIcufK1B8mGVh3c0BUjyIXh/qbAtRnGK7wqD3r88e9E4MeqaZC15koXYQ+bm/KV6C
	BqwLZPCycLc+to3Pk9Ow/c9wI551q1ojuNc6NVW4y6HD9B84I0RegV8t0xrdoLsArgVUomFTOGN
	f/vuyXXmxHZZAoD0
X-Received: by 2002:a17:903:3c45:b0:2e5:64ad:2da4 with SMTP id d9443c01a7336-2e842e0b50bmr113874005ad.56.1791869445546;
        Mon, 12 Oct 2026 22:30:45 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cb6sm50820915ad.60.2026.10.12.22.30.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 22:30:44 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: Joonho Lee <mynameisjune111@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] ALSA: virtio: Retain PCM DMA pages until messages are freed
Date: Tue, 13 Oct 2026 14:30:25 +0900
Message-ID: <6b6421f719a49ce0195c3d43f58b50e40a6e9347.1791867377.git.mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791867377.git.mynameisjune111@gmail.com>
References: <cover.1791867377.git.mynameisjune111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PCM I/O scatterlists point directly into the ALSA runtime's vmalloc
buffer. If RELEASE or queue draining times out, ALSA still frees that
managed buffer during hw_free/close while the device may retain the
queued descriptors. Keeping only the virtio_pcm_msg objects alive does
not keep their backing pages allocated.

Take a reference to each page backing the PCM buffer before building the
I/O scatterlists, and release those references only when the messages
are freed after device ownership ends. This keeps late device DMA away
from pages that the allocator could otherwise reuse after ALSA releases
the vmalloc mapping.

Fixes: f40a28679e0b ("ALSA: virtio: handling control and I/O messages for the PCM device")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
Validation: separate ARM64 W=1 module build at this commit. With the
full series, delayed capture completion passed two KASAN/QEMU runs;
the tree through patch 3 reproduced freed-page reads. Playback late
access and allocation-failure paths also have ASan/UBSan shim tests.

 sound/virtio/virtio_pcm.h     |   5 ++
 sound/virtio/virtio_pcm_msg.c | 110 ++++++++++++++++++++++++++++++++--
 sound/virtio/virtio_pcm_ops.c |   2 +
 3 files changed, 112 insertions(+), 5 deletions(-)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 8837dfc12828..56ac2769b05b 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -13,6 +13,7 @@
 
 struct virtio_pcm;
 struct virtio_pcm_msg;
+struct page;
 
 /**
  * struct virtio_pcm_substream - VirtIO PCM substream.
@@ -38,6 +39,8 @@ struct virtio_pcm_msg;
  * @msgs: Allocated I/O messages.
  * @nmsgs: Number of allocated I/O messages.
  * @msg_count: Number of pending I/O messages in the virtqueue.
+ * @dma_pages: Pages backing DMA messages, retained until messages are freed.
+ * @ndma_pages: Number of retained pages.
  * @msg_empty: Notify when msg_count is zero.
  */
 struct virtio_pcm_substream {
@@ -60,6 +63,8 @@ struct virtio_pcm_substream {
 	struct virtio_pcm_msg **msgs;
 	unsigned int nmsgs;
 	unsigned int msg_count;
+	struct page **dma_pages;
+	unsigned int ndma_pages;
 	wait_queue_head_t msg_empty;
 };
 
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 5371f4985fd0..46bf4df65974 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -3,6 +3,9 @@
  * virtio-snd: Virtio sound device
  * Copyright (C) 2021 OpenSynergy GmbH
  */
+#include <linux/limits.h>
+#include <linux/mm.h>
+#include <linux/overflow.h>
 #include <sound/pcm_params.h>
 
 #include "virtio_card.h"
@@ -75,6 +78,73 @@ static int virtsnd_pcm_sg_num(u8 *data, unsigned int length)
 	return num;
 }
 
+/**
+ * virtsnd_pcm_dma_pages_put() - Release retained PCM buffer pages.
+ * @vss: VirtIO PCM substream.
+ *
+ * Context: Process context.
+ */
+static void virtsnd_pcm_dma_pages_put(struct virtio_pcm_substream *vss)
+{
+	while (vss->ndma_pages)
+		put_page(vss->dma_pages[--vss->ndma_pages]);
+	kfree(vss->dma_pages);
+	vss->dma_pages = NULL;
+}
+
+/**
+ * virtsnd_pcm_dma_pages_get() - Retain the pages backing the PCM buffer.
+ * @vss: VirtIO PCM substream.
+ * @data: PCM buffer address.
+ * @length: PCM buffer size.
+ *
+ * Keep the backing pages alive while virtqueue descriptors can still refer to
+ * them, even if ALSA releases the vmalloc mapping after a failed drain.
+ *
+ * Context: Process context.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_pcm_dma_pages_get(struct virtio_pcm_substream *vss,
+				     u8 *data, size_t length)
+{
+	size_t i;
+	size_t npages;
+	size_t span;
+
+	if (!data || !length || !is_vmalloc_addr(data))
+		return -EINVAL;
+	if (vss->dma_pages || vss->ndma_pages)
+		return -EBUSY;
+
+	if (check_add_overflow(length, (size_t)offset_in_page(data), &span))
+		return -EOVERFLOW;
+
+	npages = span / PAGE_SIZE + !!(span % PAGE_SIZE);
+	if (npages > UINT_MAX)
+		return -EOVERFLOW;
+
+	vss->dma_pages = kcalloc(npages, sizeof(*vss->dma_pages), GFP_KERNEL);
+	if (!vss->dma_pages)
+		return -ENOMEM;
+
+	for (i = 0; i < npages; i++) {
+		struct page *page = vmalloc_to_page(data + i * PAGE_SIZE);
+
+		if (!page)
+			goto err_put_pages;
+
+		get_page(page);
+		vss->dma_pages[vss->ndma_pages++] = page;
+	}
+
+	return 0;
+
+err_put_pages:
+	virtsnd_pcm_dma_pages_put(vss);
+
+	return -EINVAL;
+}
+
 /**
  * virtsnd_pcm_sg_from() - Build sg-list from vmalloc'ed buffer.
  * @sgs: Preallocated sg-list to populate.
@@ -133,22 +203,42 @@ int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
 			  unsigned int periods, unsigned int period_bytes)
 {
 	struct snd_pcm_runtime *runtime = vss->substream->runtime;
+	size_t buffer_bytes;
 	unsigned int i;
+	int rc;
+
+	if (vss->msgs || vss->nmsgs || vss->dma_pages || vss->ndma_pages)
+		return -EBUSY;
+
+	if (check_mul_overflow((size_t)periods, (size_t)period_bytes,
+			       &buffer_bytes))
+		return -EOVERFLOW;
+
+	if (!runtime->dma_area || buffer_bytes > runtime->dma_bytes)
+		return -EINVAL;
+
+	rc = virtsnd_pcm_dma_pages_get(vss, runtime->dma_area, buffer_bytes);
+	if (rc)
+		return rc;
 
 	vss->msgs = kzalloc_objs(*vss->msgs, periods);
-	if (!vss->msgs)
-		return -ENOMEM;
+	if (!vss->msgs) {
+		rc = -ENOMEM;
+		goto err_free_pages;
+	}
 
 	vss->nmsgs = periods;
 
 	for (i = 0; i < periods; ++i) {
-		u8 *data = runtime->dma_area + period_bytes * i;
+		u8 *data = runtime->dma_area + (size_t)period_bytes * i;
 		int sg_num = virtsnd_pcm_sg_num(data, period_bytes);
 		struct virtio_pcm_msg *msg;
 
 		msg = kzalloc_flex(*msg, sgs, sg_num + 2);
-		if (!msg)
-			return -ENOMEM;
+		if (!msg) {
+			rc = -ENOMEM;
+			goto err_free_msgs;
+		}
 
 		msg->substream = vss;
 		sg_init_one(&msg->sgs[PCM_MSG_SG_XFER], &msg->xfer,
@@ -162,6 +252,15 @@ int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
 	}
 
 	return 0;
+
+err_free_msgs:
+	virtsnd_pcm_msg_free(vss);
+	return rc;
+
+err_free_pages:
+	virtsnd_pcm_dma_pages_put(vss);
+
+	return rc;
 }
 
 /**
@@ -177,6 +276,7 @@ void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss)
 	for (i = 0; vss->msgs && i < vss->nmsgs; ++i)
 		kfree(vss->msgs[i]);
 	kfree(vss->msgs);
+	virtsnd_pcm_dma_pages_put(vss);
 
 	vss->msgs = NULL;
 	vss->nmsgs = 0;
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index f2362f0dd80a..82f2d2f9dd64 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -25,6 +25,8 @@
  *   signal or due to a timeout. In this case, the device can still access
  *   messages even after calling ops->hw_free(). It can also issue an interrupt,
  *   and the interrupt handler will also try to access message structures.
+ *   The messages retain references to the PCM buffer pages until they are
+ *   freed, so late DMA does not target pages released by ALSA.
  *
  *   Therefore, freeing of already allocated messages occurs:
  *
-- 
2.54.0 (Apple Git-157)

