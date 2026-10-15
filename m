Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FD34F30C0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792103286; cv=none; b=Ien68zI57DxuY5M2G+OqejMGKSBnq9Q5m7caTB6vhz09aSvGMBkJZ5C+n/Gz3jnKIiZdntEzkMHH2qnK8OulaJ2i7sCynd+qsFEOUsH4lmlDpGAtTJIkJCmEBv8s5DmCF0Rx4OXt6u9hBS8CAHxxHeTJzFUNwtISEAMQtpHysA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792103286; c=relaxed/simple;
	bh=bVJbmuh2Z6L0fhHJG0FQsb2y8FSWqxobc73yJaXV8aU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=slUxRclPm7/uObtQBsHR2XJorNhLJR2bKIWMIwb4pM9VsJKV0gAHIewPhCklbGVzlVTopGUHei0ys1zTVXRMeSYsaAN9ECXGW/qU0KSqkGPo5yL0PyNDJ2Og8zVsLJXqiitOsQrt3jhATPMqYOe+J8EJxTcHNcNTjU2a59z47Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lo/dFP8l; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lo/dFP8l"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15756f82e8aso310987c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792103284; x=1792708084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uo7AcE10nfV9W8UwlYp+hn2TzXz6q+VsQs/rEy/+Mk=;
        b=Lo/dFP8lSQ+r0fVrrhxnwhwBathR5tjD41ysL4wqZm8V7qg9b3pk6JMwBBB7/e/cUE
         iYLmnkIm2zWhiVBs6FxKvBiIGKQc52OpTAnPdkmxk7QurP+lyKWku4L7aicH7eKXb2Ke
         BjvRoVXiyLvPbekP1b5YSf3wXuXt0NIP1CjtZYEXru8YbbFOvns8XTopggnbX1lB5nGc
         n2ImMWaJvnDeFgLQga4SriYsaByEW+Y48rkr1rYlbeSDDfdrMzInRUpvQLnVcqbtVA+M
         +xbZcoq8UNNE1MpE98Rm3rHBp+/85Z3m/LKrrcaf6UWrrDet7GZP4ZeD/SQYVlKRhs02
         RtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792103284; x=1792708084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6uo7AcE10nfV9W8UwlYp+hn2TzXz6q+VsQs/rEy/+Mk=;
        b=Qu9IpPRnA7qNmWX7WVqvsBBb8GYvpVIwtaNQZ5nwEDJwMWhlVhJzG4u/yWaPi7Jh47
         3Us8Mk34EF4W68oXmpN2TAjZ67oiN8vfs/PVSaT/WOcHhVkiLlAneOz4+961lpYu3Tnx
         7l97nV1W7EdhPEg3nK+e7H28dibt2Ift2r72B7z2E292JJufTQJTz7QqJqPmxz7vVkuo
         zn0UwEr8SbDpNVUUiMdR9YYXcP5bRLf+8YCYxs8vkvKQAWVrGz/zw4G2+LahrODOxj6n
         GDNl2GMtgTEPLL4xvIbUrQ5mZXVv9CN/b/VxTYoBviK2SQbobYKLdTkKBWhkFxz1FhAc
         jMag==
X-Forwarded-Encrypted: i=1; AKwUvBy4do7O7m0ie1AFJGlH80hEwXM0D738vbyzBBxKLr7s7twQ6kitqM/poSI47Y3585PRcLv6Po6JRwuRBls=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0eD53U9XLk11uBTu45UeN7SjLt9hGyCnUubErpHVVpu1fjIhu
	mrXZwYc7G9Z7N/1zh7r0HQKrNyQG8a7Zxs73WNm9/XVQbvlTR4apy2NX
X-Gm-Gg: AYBFou1fX41O+EiWpqQuRQxM/gkoRBi76a/WUcbTrCQhGaWDSm4FcdI/hFBsW92uC0k
	9POuf0bPp6UIiiCy7sATGP9+PaN6fDbIpqX6lqIfOjzXPfQNc6Nckqx6cc3IrKdfyixp1e7PZK2
	xBKylH9oQPuoGcZqT8qH7N/ZqgYjY97hsGwA0IybdCR9reumDd43Tnah8b3LW9ps01KKLEhX2lu
	STWSon4KODKg6+I89fcvg/dpHMvy9MyCP7029/QRqPeikvv5GS0PC6eNqjPnQHdwltU701nHchF
	mNhg5bZoyGE+GjUdqp8HjqvbM3hep+dyNFZEqMq3STq59Exg3Zvrzqll3+eBHe4mb+vVyvZJlfR
	qqr+quL+TuLHc74zSROK/wgVYLRVbnNiE+h+zVW1CQTG40wABe0iJ0bGIVmhkax+rO/ar8pLbF5
	1BZgVvB+WE/JAxbm8s/ntsCbmQMl1M8jsCFSCWFmaxmMwVPBimOrlgbbpyG6Kl2w5iPGYuXpr/z
	JDMYGyxHz3H47M+beohqUbYbL+qdnatqlPuvNZ8d2Q/qWpkUTvLFytp1m4P81rEjp7JeWFaLkw=
X-Received: by 2002:a05:7022:3a8a:b0:15b:1959:15e0 with SMTP id a92af1059eb24-182570eccd1mr1740173c88.4.1792103283611;
        Thu, 15 Oct 2026 15:28:03 -0700 (PDT)
Received: from yibos-mbp.3500.dhcp.asu.edu ([2620:d8:8000:8078:404b:acf5:562d:50f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081fa5a6esm873307eec.16.2026.10.15.15.28.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 15:28:03 -0700 (PDT)
From: Yibo Liu <yiboliume@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Liu <yiboliume@gmail.com>
Subject: [PATCH 2/2] drbd: validate digest size in checksum resync and verify requests
Date: Thu, 15 Oct 2026 15:28:00 -0700
Message-Id: <20261015222800.85928-3-yiboliume@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261015222800.85928-1-yiboliume@gmail.com>
References: <20261015222800.85928-1-yiboliume@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

receive_DataRequest() takes the digest length of P_CSUM_RS_REQUEST and
P_OV_REPLY packets from the packet header and passes it to kmalloc()
without any check. The worker later compares the received digest with
one computed by the local csums or verify algorithm. A size mismatch is
only reported by D_ASSERT(), and memcmp() runs anyway.

A digest that is shorter than the algorithm's digest size therefore
makes w_e_end_csum_rs_req() and w_e_end_ov_reply() read past the end of
the digest_info allocation:

  BUG: KASAN: slab-out-of-bounds in memcmp+0x1b8/0x1d8
  Read of size 8 at addr ffff00000a638610 by task drbd_w_r1/212
  Call trace:
   memcmp
   w_e_end_csum_rs_req
   drbd_worker
  Allocated by task 240:
   __kmalloc_noprof
   receive_DataRequest
   drbd_receiver

A digest length larger than the page allocator can serve triggers the
WARN_ON_ONCE() for oversized allocations, as GFP_NOIO does not include
__GFP_NOWARN:

  WARNING: mm/page_alloc.c:5340 at __alloc_frozen_pages_noprof
  Call trace:
   ___kmalloc_large_node
   __kmalloc_noprof
   receive_DataRequest
   drbd_receiver

Reject these packets unless the digest length matches the digest size
of the configured csums or verify algorithm, and also reject them when
no such algorithm is configured. In the worker, only compare digests of
the same size: the peer can switch csums-alg or verify-alg with
P_SYNC_PARAM after the request was received, and a size mismatch is
then treated as "not in sync" instead of reading out of bounds.

Fixes: b411b3637fa7 ("The DRBD driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yibo Liu <yiboliume@gmail.com>
---

Notes:
    - Reproduced in the same setup with csums-alg=sha1, the proxy rewriting
      one P_CSUM_RS_REQUEST: a 0-byte digest gives the KASAN report above,
      a 1 GiB digest length gives the WARNING above. With the patch both are
      rejected with "CsumRSRequest: unexpected digest size ..." and there is
      no KASAN report or warning. A complete csums-alg resync followed by an
      online verify with verify-alg=sha1, without tampering, still passes.
      The harness is available on request.
    - In LINBIT's DRBD 9 tree, receive_digest() only rejects negative sizes
      and the sender keeps the D_ASSERT() before memcmp(), so the pending
      DRBD 9 rework series probably needs the same checks. I have not
      checked the posted series itself.

 drivers/block/drbd/drbd_receiver.c | 9 +++++++++
 drivers/block/drbd/drbd_worker.c   | 8 ++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 97b306676626..87e714477050 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -2629,6 +2629,7 @@ static int receive_DataRequest(struct drbd_connection *connection, struct packet
 	sector_t capacity;
 	struct drbd_peer_request *peer_req;
 	struct digest_info *di = NULL;
+	struct crypto_shash *tfm;
 	int size, verb;
 	struct p_block_req *p =	pi->data;
 
@@ -2713,6 +2714,14 @@ static int receive_DataRequest(struct drbd_connection *connection, struct packet
 
 	case P_OV_REPLY:
 	case P_CSUM_RS_REQUEST:
+		tfm = pi->cmd == P_OV_REPLY ? connection->verify_tfm :
+					      connection->csums_tfm;
+		if (!tfm || pi->size != crypto_shash_digestsize(tfm)) {
+			drbd_err(device, "%s: unexpected digest size %u\n",
+				 cmdname(pi->cmd), pi->size);
+			goto out_free_e;
+		}
+
 		di = kmalloc(sizeof(*di) + pi->size, GFP_NOIO);
 		if (!di)
 			goto out_free_e;
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index 0697f99fed18..31e54960c5de 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -1174,8 +1174,8 @@ int w_e_end_csum_rs_req(struct drbd_work *w, int cancel)
 		 * introducing more locking mechanisms */
 		if (peer_device->connection->csums_tfm) {
 			digest_size = crypto_shash_digestsize(peer_device->connection->csums_tfm);
-			D_ASSERT(device, digest_size == di->digest_size);
-			digest = kmalloc(digest_size, GFP_NOIO);
+			if (digest_size == di->digest_size)
+				digest = kmalloc(digest_size, GFP_NOIO);
 		}
 		if (digest) {
 			drbd_csum_ee(peer_device->connection->csums_tfm, peer_req, digest);
@@ -1301,8 +1301,8 @@ int w_e_end_ov_reply(struct drbd_work *w, int cancel)
 		if (digest) {
 			drbd_csum_ee(peer_device->connection->verify_tfm, peer_req, digest);
 
-			D_ASSERT(device, digest_size == di->digest_size);
-			eq = !memcmp(digest, di->digest, digest_size);
+			eq = digest_size == di->digest_size &&
+			     !memcmp(digest, di->digest, digest_size);
 			kfree(digest);
 		}
 	}
-- 
2.39.5 (Apple Git-154)

