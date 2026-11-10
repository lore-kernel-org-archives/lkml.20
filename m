Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347863;
	b=cIkHQk9ecpJiJIZL3BB1bLcu84GQls09ZiJkvGMblaaYzj19zewiba9V9M3OYQhZjK56
	 Gnzxv0NuaZ7IVDdXxTArF7G5wDYcwRdk8exhzm13Kr2CMoAVq56GKEcHEQ+eC3aCgqvWQ
	 oHAKlh4Kp5PJ0sg4QovqRWC42PVMaFnrMgsj6HftRJ10f22HyGylRkarqnYRkMzw6SRcj
	 7+n0J7fzTd5bE0i0lgK5DvTYCjV3mVI5/+4HJ6EQBgIWx4upcu5v2uHZnkl5ZA/tq6pXW
	 yUC7ezfzXGtzXTdU5lRdgFChKlOHtQw+8XWauCBG98dN5VENNqKVU8SsqCFmXadMJ5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KtNiiE9TTBKD7Se2r/k45iohaRRy+fN+xVDbL1SGOtg=;
	b=mLUt7d+QWjCp6bLiK8ch2GErNLCxAsMcXTxSvVSzDagb6ZI7B/gcPTed9yqppe60EKd7
	 qSw4el2Mr3aJnpox2gHcUF67MbN1p+kiTR/qRDPyONkGRwL82Tq8EgIPGsoywke7AyYs9
	 VPUhxMR/j2g0PtHwuT+LIrVmS8ovK4SLfUgoOwrdtIkazo0up2ln3R9MyLOnRy6MfHiew
	 aBXoVwxaYX/wtsTu2scrocVI87oGCaMeDhnSEuz7tYiUz3LPs/mJJUFBAi+caR/NWZFuc
	 /jCPhGKXSzxIAWTPAjI2zkl2CEbnorTTF2AXSkQ8CrDxKVhKv7hX/JZJTJeKt0E1ycw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rYdAUEGa;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE8C60A2614
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BE8C60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rYdAUEGa
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b10d24345dso26409077b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794347862; x=1794952662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KtNiiE9TTBKD7Se2r/k45iohaRRy+fN+xVDbL1SGOtg=;
        b=rYdAUEGayiJdOKCxNPQLEpQR5kU5VPdw5jnM7jQQwdaXvGiVR/TF0WdMqnhnpeHUWo
         josep6Xf1xx5+U3fFudBb9taGXUUKk/VU1fKLQKAfQgurzMqfpgaaMZCLJPV2/OYHiek
         MhLEcZ4XXsCtRa9dZ2eEto5ZWudLGNPruwrCrJm75bBjpQ8IVRzzDQV95FKHaABdpnHL
         mXbA3JRmahUbVKmYUH7OfudaUYhcc+Tmdr7tMWHDRvRqSf2PYD41lz4NOBP26GXQlwqp
         fbA1QpLgjCOQuFsfx7+lnoCvNlS+13TkXbstn7DC5QrVAxenqdBaiPCcm+QzkGUpsam9
         3Pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347862; x=1794952662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KtNiiE9TTBKD7Se2r/k45iohaRRy+fN+xVDbL1SGOtg=;
        b=CyLDRtypDzaSmdZSszN1lovVNIrkysKgurYh5XAKowRT198urZMKfyfy9X8+qho9kT
         nV2e8+H7j5PoXo4mpKsxokbnoLznhTlXF7rbM8orn5gzwP25jpEvG86Lb7UPNeEhwgd4
         j1PcVK1YE9ZEJVxyYKnkUNHVKODmOB/32TZPeAye8mBk7zh2FsUzr0EbEn4fijV/NV7S
         8+PWjWyd4fmtseJmZuRJ7bjIL0U66Rfq6Fdh81LiSGZFYTXBXOqlTTpqo9qp7jBC6DJR
         4inDYBEUIHGNxOglajti8XKeF2P3TSKdhZ+eKwUrxzrBbETq/0UVPD5LNqI9gd4h9QqP
         ZyRA==
X-Forwarded-Encrypted: i=1; AL+hErGJakypbDPJwxCwqex5ENcV/5tlbh6gOHG1sYcNa4mwwF3RpOtx0k4JiTTebt/ZTEv0ykZMLhuoh/+Xk0o=@vger.kernel.org
X-Gm-Message-State: APuU4Z85gic8lJUkdz9q4DB6TZxFE5L/LMGSB8Xv5p/mnjTFnGqlsuDF
	A5g1F1/hF2HKRtylgK5fRPdJYkbOh1xO2+AZb+CoTz0QZ94dukF344uB
X-Gm-Gg: AYBFou3JoDLCz0bb+8Loy3Dw+TMqB+NrAsV7YICrT8IE6e6SS26ewSgttGGuq6tsea8
	vhMkcvjhXJh32hGHt1YxpV2WITNQQ/1RxqTt8aAPNxFk3kY1A2nr9dsp635vlGbDe1wZ6jkuSCn
	Un2OoOcyMj/go+ai5/6MgXxEIEG5o+l8iDcEmh6eTqYBh0knq9EDelkR9IJMVcHcFN2H7z+xGY6
	IDKfbWdAHjR48DfxjSdDXsnww/+Xy/EBwVZC/S4F2/eCAqKQcjmLAMUGkKEghV1VXjfA7FO3JIf
	aV4Va87mqt40S/ybpHGx6vP6HwQGq67Lm6r+bzG/8vgd1bqIHZ5bVPZzCpyv3MgyvfWHHnQrNvH
	IskVwwXuaTKQSWyiOihFdJXl3YKYSlZ1F3mFmxbKyoFNP9wirffPErmDffFzT5TQGMv2Sj+k2/d
	gEqLQXvjnZr0h0dwfDC77SCQhtNOqYqLF+cybFT8wlGA1BnoJ0kPbw4atoNHFsTbpYjbspxEABy
	20vESK3t1sW9ma4Ren29OtDaMpR/+TUfmzbr2WhWVVD3sTAjb2Boks24ZlK2dvhWWbe4Noj2F0m
	uxBAXRNYDcgtwZzTsZaEGivHbFFXo0vCv/UyyK0Z0G8ieL6Qwr391v1hX5PeqCCLmGQS8SBb8Ta
	S2jpISf1E
X-Received: by 2002:a05:690c:e20c:10b0:8b3:34b6:4bb6 with SMTP id 00721157ae682-8b3a7e06f27mr3032297b3.5.1794347861960;
        Tue, 10 Nov 2026 13:57:41 -0800 (PST)
Received: from fedora ([187.120.157.132])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933d365fsm29877687b3.20.2026.11.10.13.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:57:41 -0800 (PST)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
	syzbot+d7d72f3d467710442af0@syzkaller.appspotmail.com
Subject: [PATCH] nbd: fix circular lock dependency
Date: Tue, 10 Nov 2026 18:57:23 -0300
Message-ID: <20261110215723.199948-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
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

nbd_genl_reconnect_sock_cb() replaces a dead socket with a new one
obtained through nbd_get_socket(), but unlike nbd_add_socket() it never
runs the socket through nbd_reclassify_socket().  The replacement socket
therefore keeps the generic sk_lock-AF_INET/AF_INET6/AF_UNIX lock class
instead of the NBD-specific class leading to a possible lock dependency.

Move the reclassification into nbd_get_socket(), the single place where
sockets are acquired for NBD, so both the connect and reconnect paths
reclassify the socket.

nbd_add_socket() no longer needs to do it.

Reported-by: syzbot+d7d72f3d467710442af0@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=d7d72f3d467710442af0
Fixes: d532cddb6c60 ("nbd: Reclassify sockets to avoid lockdep circular dependency")
Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
---
 drivers/block/nbd.c | 66 +++++++++++++++++++++++++--------------------
 1 file changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index ffce519bf008..bc74ddb1d9d1 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1210,34 +1210,6 @@ static blk_status_t nbd_queue_rq(struct blk_mq_hw_ctx *hctx,
 	return ret;
 }
 
-static struct socket *nbd_get_socket(struct nbd_device *nbd, unsigned long fd,
-				     int *err)
-{
-	struct socket *sock;
-
-	*err = 0;
-	sock = sockfd_lookup(fd, err);
-	if (!sock)
-		return NULL;
-
-	if (!sk_is_tcp(sock->sk) &&
-	    !sk_is_stream_unix(sock->sk)) {
-		dev_err(disk_to_dev(nbd->disk), "Unsupported socket: should be TCP or UNIX.\n");
-		*err = -EINVAL;
-		sockfd_put(sock);
-		return NULL;
-	}
-
-	if (sock->ops->shutdown == sock_no_shutdown) {
-		dev_err(disk_to_dev(nbd->disk), "Unsupported socket: shutdown callout must be supported.\n");
-		*err = -EINVAL;
-		sockfd_put(sock);
-		return NULL;
-	}
-
-	return sock;
-}
-
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 static struct lock_class_key nbd_key[3];
 static struct lock_class_key nbd_slock_key[3];
@@ -1274,6 +1246,43 @@ static void nbd_reclassify_socket(struct socket *sock)
 static inline void nbd_reclassify_socket(struct socket *sock) {}
 #endif
 
+static struct socket *nbd_get_socket(struct nbd_device *nbd, unsigned long fd,
+				     int *err)
+{
+	struct socket *sock;
+
+	*err = 0;
+	sock = sockfd_lookup(fd, err);
+	if (!sock)
+		return NULL;
+
+	if (!sk_is_tcp(sock->sk) &&
+	    !sk_is_stream_unix(sock->sk)) {
+		dev_err(disk_to_dev(nbd->disk), "Unsupported socket: should be TCP or UNIX.\n");
+		*err = -EINVAL;
+		sockfd_put(sock);
+		return NULL;
+	}
+
+	if (sock->ops->shutdown == sock_no_shutdown) {
+		dev_err(disk_to_dev(nbd->disk), "Unsupported socket: shutdown callout must be supported.\n");
+		*err = -EINVAL;
+		sockfd_put(sock);
+		return NULL;
+	}
+
+	/*
+	 * NBD sockets are used from block/swap/writeback context, which can
+	 * already hold locks that fs_reclaim depends on.  Give them their own
+	 * lockdep class so that a page fault on an unrelated userspace socket
+	 * (sk_lock -> mmap_lock) is not chained to the NBD socket lock.
+	 */
+	if (sock)
+		nbd_reclassify_socket(sock);
+
+	return sock;
+}
+
 static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 			  bool netlink)
 {
@@ -1296,7 +1305,6 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 	sock = nbd_get_socket(nbd, arg, &err);
 	if (!sock)
 		return err;
-	nbd_reclassify_socket(sock);
 
 	if (!netlink && !nbd->task_setup &&
 	    !test_bit(NBD_RT_BOUND, &config->runtime_flags))
-- 
2.52.0

