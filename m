Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520564;
	b=mIyVCqdoTlLE53dIyCfH6XPNc0cHIgZpoPnFSPrHzHu3AXW0LWGjoQWKqutH0W9vO0Ra
	 RK03bSz/chefUV0G45BUgcS7M05PfItfxV0DPrga1SjwtBce8GPZkDyaaRER+jTTk2kAn
	 tuKYr/ZgAvg47XyZbji8CwS7m2NV0+Zzj6YRMt3teR4RRo+SlU2pLEX6rrAmzvN3HVo+i
	 jQ4y/98UU5pGN45mZo5Fn/ZwQhiSCEInFmxJVTWLs9U1lDvuPh+VKlJ0M4uw5zpgwNaLz
	 v/dcGfEPpZUTVOt0u383sYc0Ux6EZBJ27CPMLaf7JJvRfu/VdkSUFesnZztlIqb4JGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QBkELidHnujeG3xBjThPr+adF0FJwgUwsd5WBy30Lkc=;
	b=engHe+oTQWEAJqOv2G3XEvsvSN+L9CFwQKHc/rift4r/D4tYUekGsjRPIqvMdBHEJKql
	 keDRfElL16wFsnsaSBZC8ErbnOiQJCv83RVMvhLhPySAOhRdIr0yO0XoPyKM0PyzCIuCH
	 mvMEVTK4BBBOpu4t4nd+z7d/gAveXlq9XcckQRsUUkQljNhPLKSxs5jaW5JG8k4knZusK
	 VaiId0hNQNY6v8CFpcY3wWEJ2NzwTmH+pxKA1TnkjKRKqBpwMKTZU2Y/Kf47KQ4AoBXO0
	 Ns9xPH4HPCJuTnkGaXnaHWImpmU8LZZZxkG46+sL7Ua4Q77nHG+nIqsOoXtvk4i8dtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UCiKwgE1;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15F5606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B15F5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UCiKwgE1
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3514b90bb89so9736884eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520563; x=1793125363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QBkELidHnujeG3xBjThPr+adF0FJwgUwsd5WBy30Lkc=;
        b=UCiKwgE1munICdPucccsS61rgAr8sNDaXJOSU/TLALuS9a1Dr23yGosoCSNij4gb5N
         aMItYkFB9I8uAu5e5l+qi7ilgNrv+u4c8WgoXeTS2GplpXRa/KlRUxzGg2cl+GEGAuEe
         pfHXIe5HE5dtKMBixNO6bpP/CdhGjFqSW0Wg29BHp8X704DryyV1PnCKszt4YDmpZyLS
         IbIz4GjiQxwRTdUwFuZbSaEv5et6adr71xuAb+NOjTVvvCgAgMwK5hFVWtP/4DHYs+xd
         Ydjy65sfKvXYuJcbyZ+TmlK+G44mejeyiWB5i58vYOXiJSAyxZ6YImS5hyFm8+g5Mew/
         DPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520563; x=1793125363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBkELidHnujeG3xBjThPr+adF0FJwgUwsd5WBy30Lkc=;
        b=Qnxd8SfVYx7MFnAnymfLpPOEEd8rUOBWX0cLRLwhv38pkTlG/MPD7ewiLdVil6PZ+5
         MmA8DqtU3336qwfOuzTEmVup45Ha6R2Q6tcmA22apNz5tt5X6TLNRGjOVxXGLLUEHmj5
         OrjuHoW3yX0H7L3GvFMbxAFX4cd2VvGtfwacV7uVWVoEpRt6u4ZSCWmztvfzbChRtksO
         7nf0e0RVoQkiBqNJLqXkQ9byPhyUZrLmYspkGjFB0/+eIxcHlfA68FZTs9JXsdtuc1sY
         NvjqCnjaQVdSkzvhPjOoz1d/SUsZqMdFuTDsSLGzDbq5XCDKGDQLkIo5cHxlU8XoLUhP
         leOQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5dyeJMi5n0m4mROBFOsPKZpyNFm+S99Y8/dtTq+zUGoOaen8w6mf3tRH1j+2iF7924G4jitDDnaVg5LM=@vger.kernel.org
X-Gm-Message-State: AFq9FYILMQdz7+2UZ7sybbEOeVUu6oqICpcJzbZXJAmhaIeJlUdHVcq2
	/QJfuYfWhzgl84ENScN173QYqB+ygLgkqDm8CYSZQ3JVRLRO6BdBWhiV
X-Gm-Gg: AYBFou022v+AuD7nok7Vxx55wQrhsRwWYzBS1UjoozsuFkW8LAkZpXtzkUJUiBpGCwL
	qthVLwnyCzdJpLwefv3BV8YhPMRLBAV2bqry6BRCqyh4vhxcEjTjPRqtvq4UuxzZxgwbCWrwtai
	pKannOgP9gRxT2HdMtcd4i5DUmGshmwEAMc1HwCoJRxNTY6Ea9Y9zxysSBjvLueUFooPdUp8hT1
	GLNr4Ij9i/+RzeXsGl3x8OE09MLB//I3plHhprrDuTq6TQWlRNXGrdFtK0w6p8Num2tlidnKtpA
	h2OoAdtqaO690lXyegVPmw5GXFcPVAf3gOQNnck/1yL7Hi7dveNAHUNt8v1kgdUfHgxLtyJrPqC
	CZPNapYw2J3XLir498DRgSaxVTgui8X88Lxevb+uosk1m673/0qiHq0nqEH886CQ3Q1D+Y8dFVj
	OeeUO7j3WWNKa8nAPjzHUbLtB9KFoXJHVhEXhGNrhQTogm48GQErM5J3Z4ahEkHGYBlbaYKy0xQ
	n7lm94mad5+D89IfX6ZpaBDRuKU4O5uYNEzGlvpnBGV/eg8KPMZ9ek=
X-Received: by 2002:a05:693c:65cc:b0:367:23b6:94e1 with SMTP id 5a478bee46e88-3674e25bf5cmr71459eec.41.1792520562401;
        Tue, 20 Oct 2026 11:22:42 -0700 (PDT)
Received: from localhost.localdomain ([206.206.192.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm402866eec.11.2026.10.20.11.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:22:41 -0700 (PDT)
From: Yibo Liu <yiboliume@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+0845f49852fd568f@bugs.sh,
	Yibo Liu <yiboliume@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] drbd: validate digest size in checksum resync and verify requests
Date: Tue, 20 Oct 2026 18:22:00 +0000
Message-Id: <20261020182200.236875-1-yiboliume@gmail.com>
X-Mailer: git-send-email 2.34.1
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

receive_DataRequest() sizes the digest buffer of P_CSUM_RS_REQUEST and
P_OV_REPLY packets from the length the peer puts in the packet header,
without checking it against the digest size of the negotiated csums-alg
or verify-alg. w_e_end_csum_rs_req() and w_e_end_ov_reply() later
memcmp() crypto_shash_digestsize() bytes of that buffer; the D_ASSERT()
on the size only logs a message.

A peer that sends a shorter digest thus causes a slab-out-of-bounds read
in the worker, and a peer that declares a huge length makes the receiver
attempt an oversized kmalloc() that triggers a page allocator warning.

  BUG: KASAN: slab-out-of-bounds in memcmp (lib/string.c:676)
  Read of size 8 at addr ff11000007b9d630 by task drbd_w_r0/601
  Call Trace:
   memcmp (lib/string.c:676)
   w_e_end_csum_rs_req (drivers/block/drbd/drbd_worker.c:1182)
   drbd_worker (drivers/block/drbd/drbd_worker.c:2189)
   drbd_thread_setup (drivers/block/drbd/drbd_main.c:314)
   kthread (kernel/kthread.c:436)
   ret_from_fork (arch/x86/kernel/process.c:158)
   ret_from_fork_asm (arch/x86/entry/entry_64.S:245)

  Allocated by task 605:
   __kmalloc_noprof (mm/slub.c:5439)
   receive_DataRequest (drivers/block/drbd/drbd_receiver.c:2715)
   drbd_receiver (drivers/block/drbd/drbd_receiver.c:5371)
   drbd_thread_setup (drivers/block/drbd/drbd_main.c:314)
   kthread (kernel/kthread.c:436)

Reject the packet and drop the connection unless the declared digest
length matches the digest size of the corresponding transform, or if
no such transform is configured.

Fixes: b411b3637fa7 ("The DRBD driver")
Cc: stable@vger.kernel.org
Reported-by: co+0845f49852fd568f@bugs.sh
Signed-off-by: Yibo Liu <yiboliume@gmail.com>
---
Changes in v2:
- Drop patch 1/2 (P_DATA_REPLY size check); this is now a single patch.
- Check the digest length only in receive_DataRequest(), before the
  buffer is allocated, and leave drbd_worker.c unchanged: with the exact
  size enforced on receive, the sizes compared in the worker always match.

v1: https://lore.kernel.org/all/20261015222800.85928-1-yiboliume@gmail.com/

 drivers/block/drbd/drbd_receiver.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 2135c14354a8..d45c4e68f83b 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -2711,7 +2711,17 @@ static int receive_DataRequest(struct drbd_connection *connection, struct packet
 		break;
 
 	case P_OV_REPLY:
-	case P_CSUM_RS_REQUEST:
+	case P_CSUM_RS_REQUEST: {
+		struct crypto_shash *tfm = pi->cmd == P_CSUM_RS_REQUEST ?
+			peer_device->connection->csums_tfm :
+			peer_device->connection->verify_tfm;
+
+		if (!tfm || pi->size != crypto_shash_digestsize(tfm)) {
+			drbd_err(device, "%s: unexpected digest size %u\n",
+				 cmdname(pi->cmd), pi->size);
+			goto out_free_e;
+		}
+
 		di = kmalloc(sizeof(*di) + pi->size, GFP_NOIO);
 		if (!di)
 			goto out_free_e;
@@ -2742,6 +2752,7 @@ static int receive_DataRequest(struct drbd_connection *connection, struct packet
 			goto submit_for_resync;
 		}
 		break;
+	}
 
 	case P_OV_REQUEST:
 		if (device->ov_start_sector == ~(sector_t)0 &&

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.34.1

