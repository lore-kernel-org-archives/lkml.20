Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794146320;
	b=pvVPfBX1PGpI2FjhlKJLNuzdfdHr6YMrA8F72CBPb0qgRLCnhqerjBv1m9f2eqM7P+xr
	 tzOj2Xtqtuh7VGVOmBqcxEKIQuOzBZ6MQXgIgUpD8UJc7O9OMftEX86XapTRnNAaAA/E2
	 eKtQnZBYZTCEUeLNcqqHUo9GBa4MMYCuv/4IBJXlZvAbgmJQ5HGIee1UQA5NQ+27/puai
	 T5N1ZpDAvA6YEmHnUJ5pq9pthDRAdgve0NEWP+klkIacjChFGUE37jYjvWNHgay2v0La9
	 GtZjmoGK2XgiXcDPuWB4uG4KUHols/sfBy0X/eBeiQJiv0BaEzSOS4bONn+0YZdbm1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794146320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nIt2c7TgqELjjufCcZKCuw1pwzNN3kz5J9LhJ3UcC28=;
	b=weZDrorxnS6Zxm7GXMEKvtZvOx1kMjAEeLGD0FfjSWDliPHDSnKxqex9E6RDNuEUzsbR
	 Vy9iet4Qo8yKGsA9ga/b7v0EewOabC+7gecEMWgWlaAjPPr854Oyg/zE9PpfRasY2u01a
	 H5y94D9JV0EM1S2DeOjLccH/7GYoi0DfayyB0HK6fvyA4k0pvGKw4esjnrtiL18jcJIWd
	 KMUzN3bYG0Q/W1/7svCbrdS+DTtkIPWdrS4A4pTkrNF8WIA89Jcicm4sdgScC47Z8QupQ
	 kTAQK9sdXanbf1HqfUublBY1wn8vpfIVc4Uk1CB08/FJhOM8LL37iNbJDeXMRC0vjHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0i37DeW7;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7AA606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB7AA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0i37DeW7
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdd74e2f608so457a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794146319; x=1794751119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nIt2c7TgqELjjufCcZKCuw1pwzNN3kz5J9LhJ3UcC28=;
        b=0i37DeW7F7ijdAe6j2C3R/w+pFVCb93CjlA/x6VQo1I24BFE/OoyOItIB2StpGwEWR
         nhkLAjwIY5STqm0DDn+MDoqFyQwAMYbTJyZaXyJgiQ7z3kg8jzD8vMFFiXi/04r/wno1
         mpB9eleAXplTOSYSzPoKXnBFFjc/git3iHEBCdiQE4eSkgDprqPNpa6lxfcgXg2tdiof
         1sqMUPSK6X50YEnG1xsUsn6cQJaav5YnnlkTtwwVp+U+w4Jk9u2g1tjuYJC7dICvrW+a
         vNo4ErOl1RlMTLkWZExFufz1le/lWoT3KQS8iqWpfQQqZ7wASv0CLGv5ZDkkwC7Z3rfS
         IpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794146319; x=1794751119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nIt2c7TgqELjjufCcZKCuw1pwzNN3kz5J9LhJ3UcC28=;
        b=Klfv54AzMcGnRB+kQEuIHe4bI1GQfJV3ABylPrFXsrnA3sCrVhfVpJSpDYG+dkofpm
         TOsPqsiizpCQOt7E2D5qmhq0Cme3YtJQgAqlh8rym1dPvhldlgX3hKmYqTLpa9UCpV5w
         tsezAbt2SO6j+MYdBTLNz6XM4yAP371fbIQ3Pbrgfal4dw1p4JQoQ1EDm4LoAxV/ztqc
         KV/ZiGNs7HMRC8gpikr9ZO/ZK2y091lieXc18qCU7m8c/gYT7eZpc45fzOBcV2U5QD1s
         N5sRdQ9solfhQ34MKKoPjFyhmesAjoEpsfcfJ4Yddxn5/XQWdzUS7SXxsZSJPxR9ljRz
         qI9Q==
X-Forwarded-Encrypted: i=1; AL+hErHM1sRQ93xIk2md43BZl8uhrNgvu7sn03M0YOpP+6rhm3VhoBbiLI9Y166X2fUH5k5Im7w6BQ8szxCO5T4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CmCMR+6WRj4cOnfYx3ni6eE6E8nq3l5FK6WqlvnAxLYu3wV51
	qyHGwnHbonLFyaJNpQ1bJGf8OtUs930nNJyA4SvzyK1Pul2CCOmaIPZL
X-Gm-Gg: AYBFou3DRSbawZbg92pePdctkAwFqf5XLhC1AT441+1lngbMVDaHvA1Qvlm5EvtxeE7
	q/BReg81mg4A39NVQBp49ezxGPHoA0HlFgck6bYeGXDQDVSaQMgOWx/phM031n9LM+OXVpE1hv7
	Ph8O4rApEipeZTdaHnW32DJ+KUkDbgOR4tC6uIUtR+4QYXYU4drKTPOGE+j50HZNm2P3MZMW6dC
	8hSEVfYs1q10CRX+1GKwlTpyNYsu8nK0C8KBsSjLVnMGLitdmlFClSzGvyjzb6j3s53ytM5JANe
	HVOFFfZfUmO6DkkYAxMcqeuRBfKNUy00cUY0XBPrm/vgs1eNcjmhvbc6adjyT/L+eT2oD3SancH
	PlnZdUge4YcGZgImjeAgMRFL6qGevKIQViR/yf6sZeFp74Pt+1qfbHStN/bM11ro0xEEGsFzpmF
	piyZZdJ5HpxSQI5dkQo2q3n2xcv6hmvTgxQydqMqZeA2BuK1VgDPcx+QisvNysyM4+lYtavEkfu
	5C47KZgTMydbQHjzFDuLelmc4uB+8qOMe1YTSV3dYDrAizDxT6KBWunvYjMb8EyNeN+rzPZCR5E
	YCHCSCk6wzhAxsBAyf5KgRDE3t5m1XW++bGGv89JYroGoJVazaOt7tgS0psIugAE0pAF4E2ihdY
	cG8VDwOPfFPsuQXSiCsBnoek=
X-Received: by 2002:a17:90b:3912:b0:3b0:9a3e:bf8b with SMTP id 98e67ed59e1d1-3b12d4c5f3cmr2106208a91.6.1794146318912;
        Sun, 08 Nov 2026 05:58:38 -0800 (PST)
Received: from localhost.localdomain ([14.150.132.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb96969220sm647168a12.27.2026.11.08.05.58.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 05:58:38 -0800 (PST)
From: Qihang <q.h.hack.winter@gmail.com>
To: German Maglione <gmaglione@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Miklos Szeredi <miklos@szeredi.hu>
Cc: "Eugenio Perez" <eperezma@redhat.com>,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] fuse: virtio-fs: stop new requests before draining queues
Date: Sun,  8 Nov 2026 21:58:30 +0800
Message-ID: <20261108135830.29924-1-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
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

virtio_fs_conn_destroy() drains the virtqueues and then calls
fuse_conn_destroy(), which aborts the connection.  The abort ends every
request the fuse device still owns, and each ended request is freed as
soon as its waiter wakes up.

The drain only covers the requests that were already counted in
fsvq->in_flight when it started.  A request submitted after it returns is
not covered, but is still handed to the device before the abort runs:

  CPU 0 (umount)                     CPU 1
  ---------------------------------  --------------------------------
  virtio_fs_drain_all_queues()
    /* in_flight drops to 0 and
       the drain returns */
                                     virtio_fs_enqueue_req()
                                       virtqueue_add_sgs()
                                       inc_in_flight_req() -> 1
  fuse_conn_destroy()
    fuse_send_destroy()
    fuse_chan_abort()
      /* ends and frees the
         request above */
    fuse_chan_wait_aborted()
                                     /* the device still owns the
                                        virtqueue descriptors and
                                        DMA-writes into the freed
                                        request and its argbuf */

Stop admitting requests on each queue before that queue is drained.
The flag is set per queue, but that is sufficient: each queue is
drained after its own flag is set, and request admission,
virtqueue_add_sgs() and, on the submission path, the in_flight
increment are serialized by the same fsvq->lock.  A request is
therefore either rejected before the device can see it, or already
counted in fsvq->in_flight and covered by the drain.  There is no
window in between.

Rejected requests use the existing -ENOTCONN error path and are ended by
virtio_fs_request_dispatch_work() through end_reqs, so no new request
completion or ownership state is introduced.  Nothing has to be
discarded in the completion path, and fsvq->in_flight remains the only
state that has to be tracked.

The new state is not folded into fsvq->connected because the request
queues have to stay usable: fuse_conn_destroy() sends FUSE_DESTROY
through them, with args.force set so that fuse_simple_request() waits
for the reply.  Clearing fsvq->connected would make that request fail
with -ENOTCONN and the server would never see the destroy.

FUSE_DESTROY is the sole exception while aborting is set.  It is sent
only after the first drain, and its completion is waited for before
fuse_chan_abort() can end requests, so the destroy is the only request
the device sees after the drain.  virtio-fs exposes no userspace
/dev/fuse fd (and no_control disables the fusectl interface), so
userspace cannot inject another request.

virtio_fs_start_all_queues() clears the flag, so a mount that follows an
unmount starts with admission enabled again.

Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
V1 -> V2:
- prevent new requests from reaching the virtqueue at teardown time
  instead of skipping completions of aborted requests
- keep FUSE_DESTROY working: it is the teardown request and is waited
  for before fuse_chan_abort()
- drop the per-vq aborted flag and the completion-skip branch
 fs/fuse/virtio_fs.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index ba8d79c4bcac6..c6d2120157340 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -55,6 +55,7 @@ struct virtio_fs_vq {
 	struct work_struct dispatch_work;
 	struct fuse_dev *fud;
 	bool connected;
+	bool aborting; /* reject new requests except FUSE_DESTROY */
 	long in_flight;
 	struct completion in_flight_zero; /* No inflight requests */
 	struct kobject *kobj;
@@ -348,6 +349,7 @@ static void virtio_fs_start_all_queues(struct virtio_fs *fs)
 		fsvq = &fs->vqs[i];
 		spin_lock(&fsvq->lock);
 		fsvq->connected = true;
+		fsvq->aborting = false;
 		spin_unlock(&fsvq->lock);
 	}
 }
@@ -1226,6 +1228,28 @@ static void virtio_fs_stop_all_queues(struct virtio_fs *fs)
 	}
 }
 
+/*
+ * Stop admitting new requests before draining the queues.  Admission and
+ * virtqueue submission are serialized by fsvq->lock, so a request is
+ * either rejected before reaching the device or accounted in in_flight
+ * and covered by the drain.
+ *
+ * FUSE_DESTROY is exempt because fuse_conn_destroy() sends it after the
+ * first drain and waits for its completion before aborting the channel.
+ */
+static void virtio_fs_stop_new_requests(struct virtio_fs *fs)
+{
+	struct virtio_fs_vq *fsvq;
+	int i;
+
+	for (i = 0; i < fs->nvqs; i++) {
+		fsvq = &fs->vqs[i];
+		spin_lock(&fsvq->lock);
+		fsvq->aborting = true;
+		spin_unlock(&fsvq->lock);
+	}
+}
+
 static void virtio_fs_remove(struct virtio_device *vdev)
 {
 	struct virtio_fs *fs = vdev->priv;
@@ -1479,7 +1503,8 @@ static int virtio_fs_enqueue_req(struct virtio_fs_vq *fsvq,
 
 	spin_lock(&fsvq->lock);
 
-	if (!fsvq->connected) {
+	if (!fsvq->connected ||
+	    (fsvq->aborting && req->in.h.opcode != FUSE_DESTROY)) {
 		spin_unlock(&fsvq->lock);
 		ret = -ENOTCONN;
 		goto out;
@@ -1669,6 +1694,9 @@ static void virtio_fs_conn_destroy(struct fuse_mount *fm)
 	spin_lock(&fsvq->lock);
 	fsvq->connected = false;
 	spin_unlock(&fsvq->lock);
+
+	/* Nothing may be queued after the drain below */
+	virtio_fs_stop_new_requests(vfs);
 	virtio_fs_drain_all_queues(vfs);
 
 	fuse_conn_destroy(fm);
-- 
2.54.0 (Apple Git-157)

