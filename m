Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211279;
	b=R0Bmw1BEf3OHP2pupJ8j37ofUbJMqvuT6x/ZcNsnXo6j9rv79e4gaudgMYGVDfFLRBeP
	 qKymtRKmsFRjkOuymPIZJyXVDItWV+GnWWQA3i0O2TryYzCQqK9hQg0CjvG0RFLmyEFqX
	 JQGhFbEIDBnQDTrFKAWkVZ6A2QFm6Ed5JyDhD7s5a4aMv4ym+wpVYkx6wqQpnEmxMDPkl
	 pvGgkeaJ5VvrHdtstj9TYNthPJfFL85P6OBD1GJJPQpJp6u4tIqdaELTpfZtEfQD8jNMV
	 VgDm46MOqSjrVN5FFzuuAGeAUWyuV7CB9o71ZsDLkQrIK47Hu4AqOyEoFy1h8VezcJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211279;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EZ1n97WIaS0quFafvxQMGHq1ybtUxrApBPjDUdcn/Xg=;
	b=DPuGLPvFDduw4KDLJ6zI81n+0xBdfu6MePetPlT9Nbc0eGjQFCBxp93ehmOdgZkIpUgU
	 kvxH4c9yBV/T9ykkTw5ERWqATCeD1BLyouEMkVAwmXLJaXhA4Odmt2LPZcDSkrwpg/gJ5
	 1kWzbdWhJHieRiXZLVzHSwnfvFaQ4v0v6McS529ZOCEr+ipkAh6uxIVJ/vVqkmWijI4Cw
	 08Hu1F678HYSCHBpjO0Yc8dxgELUwAccbeer2Q0SMhwWovK8S9GN67+YQJLanWgUKS69K
	 3VOMi5V8ua+B16gvup4r3wdpLj0/lSfN9RgcpL1V+ACFHYtdnyAq9usDig0np+FzZAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J7987JCn;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=WjrjWl3a;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DAE60A3817
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66DAE60A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J7987JCn;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=WjrjWl3a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793211278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EZ1n97WIaS0quFafvxQMGHq1ybtUxrApBPjDUdcn/Xg=;
	b=J7987JCnYPaMleitW4DskfEM0uiJ4Gr/QUT5pZ2ic2ABvJf88x3V/a7E0Tb9hpaIw10wcb
	Arhn3J7j7i7kk5jP74EzAZrRJSfKnwMADuTzaIboBmC6pfbDXcuhudvS3ff00q0ODle468
	5kyQDymqd8gBZdY3AnyNVLZjhMsl9G8=
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-69rz6M0LOB6TTDiaX9gq_Q-1; Wed, 28 Oct 2026 14:14:31 -0400
X-MC-Unique: 69rz6M0LOB6TTDiaX9gq_Q-1
X-Mimecast-MFC-AGG-ID: 69rz6M0LOB6TTDiaX9gq_Q_1793211270
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c3c370b17so1959915eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793211270; x=1793816070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZ1n97WIaS0quFafvxQMGHq1ybtUxrApBPjDUdcn/Xg=;
        b=WjrjWl3aYwUjX0D2cx/jSfQHkockQt0lS6u/y8/Ew0ZMbZxSzrRRmYNdQ8rqPa8+ZK
         jhbmlDr7hzPKY85XZJdFu8r7x72fir3JoS+FdNt6ndEBxgjIGsTfnt/GtzcoEMvogdLt
         2qTQbyNfsNNZsTNTwZpJPSRdKXJYUnSIaU6aN9YnG8r4UfXzVdslaUWnjD1gV/U1hmWk
         N7jgXNToIkb2SgfnhrMIjMGYCYKiUKz/zzuLmqilXKtvy8K6IYNnOUoqBCehEyF3K7CW
         1ZzyaPuOsx9gahDQLwwp/aZ11KkfDKXeqQCJ0tGf9CjxNJpy8RrYDdaFkHYPXA5xxWWI
         RhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211270; x=1793816070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZ1n97WIaS0quFafvxQMGHq1ybtUxrApBPjDUdcn/Xg=;
        b=LoV6H1UYdxv528vxiPxIA5DR0AIhdTzDSJyHCMkjGmOU9/6meEXEIu4/OMsHw9fAtF
         F+fygO9lp4kLc63Os2T47XaZ+TSW2dlzatuarnujG/ZZg6iqlvfccLwbFdrDAOG0XJc0
         WCPDdGa/lnBC81g5l+GCdh3m3szJ29IrnUqzyuayNRKlVYdneDvtKQlO1wmoxkUk+ylS
         lJtS9FYtWsitjlZAGR7S/rbt63l0JnYLPJdWNL1B7eVVUwZPAYntTD6iG81yZ5OayHEs
         2Z3V19s/6BBfeD8P91LgCapMtSZ8y42iVw3hsolEtUsKkBW6JrLkagosgDjFwGEJWa8r
         ONgw==
X-Forwarded-Encrypted: i=1; AKwUvBw0yG6Mud5ECG5IMCVrS48qS+O62C8kRq6gFxLLrN1pgmZQXjLWubl1v72jiajIPMYR9ouZb0SCVNo4nEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRYOzoXpfEvl2GqobXSmPXb7SVOqL+dGcmh/5Eb8HXeKMpqQVq
	GFDG6tWDembmN3EvKWi5qY9LIx3fjbG9Z41EzGofgTNq6UU+9ntbc9Vii/ua4c1Ti7AGxeLQCvU
	20aX0kz0qPDtJQNO9XX+AaLxqMmzC668MHbYhWQ6WgivNCoL/o2fFDaNDUg8dmSQS1g==
X-Gm-Gg: AYBFou0IOmfxpatylY+54Da6BdnnZ/Sb9G1kn3x7s19ZB/6w+C6k0SBA7pYc65yB35i
	ju+3ISjlFN49OcbL0O3796VDeqq+qsDE4xxlmOJtbRuaGB8K1QCkM07JLH6Y+yRtNhfSbvVGv8A
	MPoffOiT8iwhwkG+Dim1e9SZRa7Et9N+8HbBYqPGdVrHKuxbsPQUoABFsLOvTwpqyB7r5Evoc1e
	x48w14tGlywhxYphLcbBFzPypx8SZHTHnBmYSPev4sxXLRfGTgj5qk3L6RNQx1BRfz3o8BN5/Do
	yG8EcbxzDKI7FNm8Co2TQxm2peuDL6qT9O9c84J0fGxUeKRPuCwXdH5vXHhLTK7p6YwXzElHP5G
	6PXX25tVx62Dfh6GNKeNUbr/a58uyZ2EgZ76+
X-Received: by 2002:a05:701b:2414:b0:19d:81db:1ec6 with SMTP id a92af1059eb24-1a6cbf75087mr3886292c88.14.1793211269657;
        Wed, 28 Oct 2026 11:14:29 -0700 (PDT)
X-Received: by 2002:a05:701b:2414:b0:19d:81db:1ec6 with SMTP id a92af1059eb24-1a6cbf75087mr3886246c88.14.1793211269001;
        Wed, 28 Oct 2026 11:14:29 -0700 (PDT)
Received: from alpha ([76.166.245.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c9fd2b4sm7438411c88.6.2026.10.28.11.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:14:28 -0700 (PDT)
From: Kyle Bader <kbader@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
Cc: Kyle Bader <kbader@ibm.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	linux-block@vger.kernel.org,
	io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] block: only fail dma-buf bios that need block layer PI
Date: Wed, 28 Oct 2026 18:14:12 +0000
Message-ID: <20261028181412.1919506-1-kbader@redhat.com>
X-Mailer: git-send-email 2.56.0
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

From: Kyle Bader <kbader@ibm.com>

Any dma-buf I/O to a device with a PI checksum fails today.
blkdev_init_dma_buf_io_ctx() returns -EOPNOTSUPP at registration, and
blk_mq_submit_bio() fails each dma-buf bio with BLK_STS_NOTSUPP. The
checks prevent a crash: bi_dmabuf_map shares a union with bi_io_vec,
and bio_integrity_generate() and bio_integrity_verify() walk bi_io_vec
to compute the guards over the data.

Only the BI_ACT_CHECK action walks the data, and a dma-buf bio does not
need it in two cases. In the first case, the submitter attaches its own
integrity payload, for example with the io_uring PI attribute
(IORING_RW_ATTR_FLAG_PI). Then bio_integrity_action() returns 0, and
the device checks the PI as the submitter asked. The block layer only
touches the integrity buffer, to remap the ref tags. In the second
case, read_verify or write_generate is off. Then the device inserts and
strips the PI, or the block layer allocates an integrity buffer without
PI in it. This is the same as for any other bio.

The first case lets an application read data into device memory, for
example a GPU buffer or an NVMe CMB. The device checks each block and
puts the guards in host memory. The application can then check the
data, or combine the guards into a checksum of the whole buffer. The
CPU does not read the data.

If bio_integrity_action() asks for BI_ACT_CHECK, fail the dma-buf bio,
and otherwise let it through. Remove the check at registration, because
the integrity payload comes with each I/O. With the default integrity
settings, a dma-buf I/O without an integrity payload still fails with
-EOPNOTSUPP.

Link: https://lore.kernel.org/all/bbb87d6b-b7a3-487a-8be4-27f3f9ce4a1b@samsung.com/
Assisted-by: LLM
Signed-off-by: Kyle Bader <kbader@ibm.com>
---
This applies to for-7.4/io_uring-dmabuf (45b716456dd9).

Anuj's check in v10 fixed the crash in blk_integrity_iterate(). This
patch keeps that check for the bios that need block layer PI, and lets
the other dma-buf bios through.

The sysfs knobs change the integrity flags only with the queue frozen,
and blk_mq_submit_bio() holds a queue reference from the new check to
bio_integrity_prep(). So the two calls to bio_integrity_action() give
the same result for a bio.

I tested in a QEMU 10.2.2 guest, with udmabuf and with an NVMe CMB
that a small module exports as a dma-buf. The namespaces have 4 KiB
blocks with these metadata formats:

 - 16 bytes, PI type 1 with the 64b guard
 - 64 bytes, PI type 1 with the 64b guard in the last 16 bytes
 - 8 bytes, PI type 1 with the 16b guard
 - no metadata

With a user PI buffer, reads and writes pass on all three PI formats,
and the data and the PI match. This is also true for a 2 MiB I/O that
the block layer splits, and for four commands with one PI slice each.
A write with one bad guard fails with -EILSEQ from the device. Without
a PI buffer, a dma-buf I/O fails with -EOPNOTSUPP. If read_verify or
write_generate is off, that I/O passes. Pavel's rw-dmabuf test from
liburing rw-dmabuf-tests-v8 passes on the namespace without metadata.
On the PI namespaces it passes with read_verify=0 and write_generate=0,
and with the defaults it fails with -EOPNOTSUPP on the first read.
The tree builds with CONFIG_BLK_DEV_INTEGRITY=n.

Without this patch, every PI case fails at registration with
-EOPNOTSUPP, also with read_verify and write_generate off.

If a liburing test helps, I can turn the test program into one.

 block/blk-mq.c | 9 ++++++++-
 block/fops.c   | 2 --
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 7fff1305b..3fc9fdeb3 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3138,8 +3138,15 @@ void blk_mq_submit_bio(struct bio *bio)
 		goto queue_exit;
 	}
 
+	/*
+	 * The block layer cannot generate or verify PI for a dma-buf bio, as
+	 * that walks the data pages.  Only fail the bio if it needs that, not
+	 * if the submitter attached its own integrity payload or if PI
+	 * generation or verification is turned off for the device.
+	 */
 	if (unlikely(op_is_dmabuf(bio->bi_opf) &&
-		     bdev_has_integrity_csum(bio->bi_bdev))) {
+		     bdev_has_integrity_csum(bio->bi_bdev) &&
+		     (bio_integrity_action(bio) & BI_ACT_CHECK))) {
 		bio_endio_status(bio, BLK_STS_NOTSUPP);
 		goto queue_exit;
 	}
diff --git a/block/fops.c b/block/fops.c
index 01bc8afe3..5c8024011 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -947,8 +947,6 @@ static int blkdev_init_dma_buf_io_ctx(struct file *file,
 		return -EINVAL;
 	if (!disk->fops->init_dma_buf_io_ctx)
 		return -EOPNOTSUPP;
-	if (bdev_has_integrity_csum(bdev))
-		return -EOPNOTSUPP;
 	return disk->fops->init_dma_buf_io_ctx(bdev, ctx);
 }
 

base-commit: 45b716456dd99488a0cef58482120dc0474aa696
-- 
2.54.0

