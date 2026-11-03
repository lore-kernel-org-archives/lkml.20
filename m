Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731958;
	b=Kp28ZYQH+j1ItjO/50YyjnoJp9RoSZ86/M6n8zgITVl2FA094zxcvgPOyWj4Kbx9B17S
	 if6rwDR3Hwn0xp8D6ci2PzS0aesUU8ZD8+Cuip/QUqkUsHoYYnPT7Oy/Sg3FtJbV2WsCN
	 0UJFmHmj66qgwINwGBhrBqLQaLmCzRA3IiypvT9LUvwaya1iPTyfZZLddl8b8dvyWyhzG
	 SHeaZr9EBlTD32yQgHQ+UOGX0Z66BORcOelC9S5PvaTQfC0swwZd9M2mtUtC4bsXoFLtS
	 Wq3MNQD3OSNu1Ggh6pQjTotHDkn2GQb4gds7K4p2KDtFTJ1VTHlYe+kL4ZbSqyu3tcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Fkva0xQptZGEjQ3Ay7jurFHXe3jD9HzPP+lrppkDqJM=;
	b=eB7+TMPAKClCDNUfUFBXWTSFume5iNzboM3nq65XUzR7pa5YjEXzstiaYMixmjIQBYtO
	 SEW2uG1WW9tUlXyutiEsMI6y8FpGeV6KK0dHvJOJWd84f4uDdiTyWvuQjMiXS5tM3MxdW
	 YkEQU1tfNJ8SZdobqP3ipWZyB6t+sDEiY2pwqC6dW91cgn5+rVJjuos7TxwP5c3CUP/Cx
	 zZPjYFbycicts0ZKn8Is4DTlMUVMO7OVG/NeupAiR9ZwD4Q+YmhuJu8y+l7p3Kohp8FRJ
	 3eWPcQRtP8TEQEwjefySMaA/Mph4YENw4VS/nxBxv3vjfYUCEw4SimbfAh+a1uNm02Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BKc2ZSDC;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E3E606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E3E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BKc2ZSDC
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso9448277eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793731956; x=1794336756; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fkva0xQptZGEjQ3Ay7jurFHXe3jD9HzPP+lrppkDqJM=;
        b=BKc2ZSDCL1SVMRwct+TAdg/cbhfEwgmvivv40WPD7XaWpuBjfJ/YkU3JltDdAf1fOm
         zYFm61kye5OcQebK3j/3QmlP5c1ypwDmWesNuO2Jugxpi+MQEF4Xme2S8E67L4vRuHbC
         VBWXchDbzJ9H8TuaZRi3DSCh+6FW3kkiyhwcCE+u+RYQTANImthGqaTJ2OFRrW7Nr9nd
         XbUy8OwOVcapxJZyz3mg15Tmoi1u6iWCpQT3vD5Tcr+AD4gVoPH7s0DHsxKvXByPYYgW
         3RWegBsfKdeohK8+crrSNrvtnn/sEUcEj2wR7zT7RzyqmUeo3D7FKv+hvT0JkQHJY2RG
         XuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731956; x=1794336756;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fkva0xQptZGEjQ3Ay7jurFHXe3jD9HzPP+lrppkDqJM=;
        b=OKCeKgTZgsLEmYQ4J5IzesmPCAhhGmkkO5jVVKZ4d7L2wnMtAGNmFAzTz5ZyaVNTvu
         GY4n9RgRXArkiyf5I4U2Ly5uyRp0DUYm56fisI16KB3i2MMqAUu9/3921TKUS/MRx1KD
         vqWaFFJLRtE+q6qz47ha7iSlO0SnVZvIOl1FTqDLcCJ21XZROGMjzVHeErRleEI7nzkx
         Kubre2O80l67le2ZgEG5T/JBy0wcIly35x+ZHLHvdXJmbMhe+tnWjztJ1pJWQpaxzMw1
         ZZt6us3F4eVsNAoBeCnfGAPU+YUU7xco9l07tx9uxhVGJ4YYaBuVOC+EszRiGi6ARG5q
         9tDw==
X-Forwarded-Encrypted: i=1; AKwUvBw7OtTMrKAe43JKP94JeXp+K2nM1GoQwre4f53+2LxamKhcXF0AfYX+mRAFcCUPe7hSHEWnNEPJyXa4L4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F8EURGRhi5woaLDxNqqD1+FudfnFVlErbaP1puDBxsIDQxMhV
	qwzqPh3dIRJytB6mbH25v6R+Hmq+YvwwrYbbLQAqvwg9bOkeOCBEyAOZ58q1X2+BF/rY9/Mu5C7
	yr2brOBAWXPZidvDPWbyI+RstqGTapw==
X-Received: from dybhh13.prod.google.com ([2002:a05:7301:290d:b0:369:7ef0:57a8])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:6090:b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-36a4a68851cmr21561377eec.8.1793731956100;
 Tue, 03 Nov 2026 10:52:36 -0800 (PST)
Date: Tue, 03 Nov 2026 18:50:28 GMT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Message-ID: <18e49db5e159b72d.3137322e32332e3235332e313736.1d9cee.0000sendgmr@google.com>
Subject: [PATCH] dm-verity: use bdev_rw_virt() in verity_recheck()
From: Chris Wiseman <chriswiseman@google.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev
Cc: Benjamin Marzinski <bmarzins@redhat.com>, Eric Biggers <ebiggers@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Christoph Hellwig <hch@lst.de>, 
	LongPing Wei <weilongping@oppo.com>, linux-kernel@vger.kernel.org, 
	Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

verity_ctr() creates a dedicated dm_io_client (v->io) for every
dm-verity target, but its only caller is verity_recheck(), which reads
a single data block into a page from v->recheck_pool after a hash
mismatch.  Because dm_io_client_create() preallocates a mempool of 16
bios and 16 biovec-max (4 KiB) vectors per target, each dm-verity
target permanently pins ~70 KiB of unreclaimable slab that a single-page
read never uses (~2.4 MiB across 35 targets on Android, or ~4.1 MiB
across 59 targets).

Replace dm_io() in verity_recheck() with bdev_rw_virt() and remove
v->io.  bdev_rw_virt() puts the bio and single bio_vec on the stack and
waits for completion, while keeping v->recheck_pool per-target.

Fixes: 9177f3c0dea6 ("dm-verity: recheck the hash after a failure")
Link: https://lore.kernel.org/dm-devel/20250423115013.4004577-1-weilongping@oppo.com/
Signed-off-by: Chris Wiseman <chriswiseman@google.com>
---
TEST (ARM64 QEMU, 59 dm-verity targets, sha256, 4K blocks, mem_profiling=1):

/proc/allocinfo growth from 0 to 35 targets (bytes):
                                     BASE     PATCHED       DELTA
  bio.c:biovec_init_pool        4,587,520   2,293,760  -2,293,760
  bio.c:bioset_init             1,196,160   1,052,800    -143,360
  dm-io.c:dm_io_client_create     107,520      53,760     -53,760
  mempool.c:mempool_init_node      36,680      23,240     -13,440
  Total (35 targets)            5,927,880   3,423,560  -2,504,320 (-71,552 B/target)

Unreclaimable slab saved by target count:
   8 targets:   572,416 B (  559 KiB)
  15 targets: 1,073,280 B (1,048 KiB)
  35 targets: 2,504,320 B (2,446 KiB)  [SUnreclaim: BASE +8,436 kB vs PATCHED +5,960 kB]
  59 targets: 4,221,568 B (4,123 KiB)

 drivers/md/dm-verity-target.c | 24 +++---------------------
 drivers/md/dm-verity.h        |  2 --
 2 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index 6d589867623c..7c240b3a470f 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -379,21 +379,13 @@ static noinline int verity_recheck(struct dm_verity *v, struct dm_verity_io *io,
 	struct page *page;
 	void *buffer;
 	int r;
-	struct dm_io_request io_req;
-	struct dm_io_region io_loc;
 
 	page = mempool_alloc(&v->recheck_pool, GFP_NOIO);
 	buffer = page_to_virt(page);
 
-	io_req.bi_opf = REQ_OP_READ;
-	io_req.mem.type = DM_IO_KMEM;
-	io_req.mem.ptr.addr = buffer;
-	io_req.notify.fn = NULL;
-	io_req.client = v->io;
-	io_loc.bdev = v->data_dev->bdev;
-	io_loc.sector = cur_block << (v->data_dev_block_bits - SECTOR_SHIFT);
-	io_loc.count = 1 << (v->data_dev_block_bits - SECTOR_SHIFT);
-	r = dm_io(&io_req, 1, &io_loc, NULL, NULL, IOPRIO_DEFAULT);
+	r = bdev_rw_virt(v->data_dev->bdev,
+			 cur_block << (v->data_dev_block_bits - SECTOR_SHIFT),
+			 buffer, 1 << v->data_dev_block_bits, REQ_OP_READ);
 	if (unlikely(r))
 		goto free_ret;
 
@@ -1058,8 +1050,6 @@ static void verity_dtr(struct dm_target *ti)
 		destroy_workqueue(v->verify_wq);
 
 	mempool_exit(&v->recheck_pool);
-	if (v->io)
-		dm_io_client_destroy(v->io);
 
 	if (v->bufio)
 		dm_bufio_client_destroy(v->bufio);
@@ -1604,14 +1594,6 @@ static int verity_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		goto bad;
 	}
 
-	v->io = dm_io_client_create();
-	if (IS_ERR(v->io)) {
-		r = PTR_ERR(v->io);
-		v->io = NULL;
-		ti->error = "Cannot allocate dm io";
-		goto bad;
-	}
-
 	v->bufio = dm_bufio_client_create(v->hash_dev->bdev,
 		1 << v->hash_dev_block_bits, 1, sizeof(struct buffer_aux),
 		dm_bufio_alloc_callback, NULL,
diff --git a/drivers/md/dm-verity.h b/drivers/md/dm-verity.h
index e104a651c657..0c42ac99e631 100644
--- a/drivers/md/dm-verity.h
+++ b/drivers/md/dm-verity.h
@@ -11,7 +11,6 @@
 #ifndef DM_VERITY_H
 #define DM_VERITY_H
 
-#include <linux/dm-io.h>
 #include <linux/dm-bufio.h>
 #include <linux/device-mapper.h>
 #include <linux/interrupt.h>
@@ -80,7 +79,6 @@ struct dm_verity {
 
 	char *signature_key_desc; /* signature keyring reference */
 
-	struct dm_io_client *io;
 	mempool_t recheck_pool;
 };
 
-- 
2.56.0
