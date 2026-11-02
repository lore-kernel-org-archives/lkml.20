Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793652966;
	b=cYlpibLT2RD3+oS2qkiFzAjVdtwrEganfLrBVKeazRyMqrJdD87a8ZEDSCvdrVRk9Iw0
	 Va7S6xJiDVbfT+Q4gxd42DeZshUBv0fwTJlK5cwtTt5CRYQhB28h23TUFtBxsBo/OPb3q
	 VotNWiLIPC08mh7X+lvjsPSNIWrCwQXrWJsD9sEiT6NNBM5oT2mzlNHmATKoVhoEqIEEP
	 k2XobbdmA1Jf237cUK9avz/l7kP7S5x4nvpguQqARpob7uQwUCTzsNh3P1gwNbYxmCOVV
	 zYTVOqYizgl6xjEKODgC1l+lREJ26GlqoHBdck3o5MTT37kqupompn8VBT3iI3UBD8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=34/enFLIcr3bLKmEVfWgIj1ncOTd12aTSiQazCvWsF0=;
	b=TWfGVxhY370qTyaCtVXOb49TOv28NJhqPuecWtZEPW/rEVc5jIndIaAqwFS6uyLF+6ZM
	 67z9COahtV+RBM7G6v+jMJGTZMcJ67YW6Lf1gvRsM/fA8tixJbCLLTa6cd+zjM6cmWBXq
	 owqtS2PPPOsxi5iD2/Gh/mnuhwbdGKqDc0uThmojSh1jay8V9hrtUYhaWDGPBVbpXlCKG
	 a0jfzBqQF6HcPDwrreKU2ZyFbt3LHRXm98x5U44KmO4IuqZ2f5rFcAe0HgxqLBRlk8S3f
	 Fu1WONfHYLABxIEJXvlQxPH4uE4NTic+3H7X5N9wst1flGFIiLJiZxapB2foFvDidfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=MaIexn6l;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C584606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C584606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=MaIexn6l
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e940d5d2beso13186115ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1793652960; x=1794257760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=34/enFLIcr3bLKmEVfWgIj1ncOTd12aTSiQazCvWsF0=;
        b=MaIexn6l8jhOzO+C90T9YJ1ByGapZzhiobmeq6evgOOlpQ9xt5CKe3eYl4+l3wIf5H
         WzRd2NhiXSlXSCeMtq4vJaOqMeYxPkO0l/AbAUaFdCZ8Q6uqxX3h8Vz74USgbEVAQSLW
         JcB03b9pO+bQrTHJsJVZMjRlD6kGqs9CxeeYEh0/PwVZKZcW4+rHraYtbiE3JV4mKIAM
         jmxqsQChHeLOXTx6qrLrxK5TgysursRrBNWQu0LifOaTu1mSFaeZW9CVxJFTPubh/VsO
         dKqAiuhiRKcn50ZDObKLL94mfMVujWbaQRwnz8nS2wutTZfENqkm6gz38RcBa4Bte7Ep
         WNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652960; x=1794257760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=34/enFLIcr3bLKmEVfWgIj1ncOTd12aTSiQazCvWsF0=;
        b=EVbVCZm7SQTwP3PWZmfv1C/QYnDG5qi77wBso8S/O/NIJIornD081E2/hWgxxYKe6C
         U79xK9i079gtdqw4DTUUgUYOexK3WuQP8fz/eeNbXN0TYD/tXXC5Wj7dcp991obopbm9
         niWMMh5K2+rMwBtS6jPHsZnqXN6gV5ezapFjQKRbRO+Yk9TbJSva05zoJorXN3lsuWnX
         HoT1+/2nbn3Gi2XJFrtTbabo9YH5xgnz6vVb0kv2heNTpvk7p5O79GZwURrjQtpCIh1a
         U0Ca2MA+c/z+ol6ulyRHEK9MdCpFEDCp00j/QkgfInjNUiZb8IljTDzDQrDG2NsOck8V
         tY1A==
X-Forwarded-Encrypted: i=1; AKwUvBw/Q/qN4oA0FTrFkoJ/anax9qdmWjO2vpz7mqz/Qvsq9dze4OAkfAeg5nKrpoCzBybWJkCPZtBNc3nXeYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oiFibxhaFOXxo39/GMWkUlDFkhboqxf5Iew9YB9DtJZN/gt3a
	a2aHChOLzeAnXc1BBZgHAricBLHH46gofyskwTkrgrRyvGky6MAvPKJSdBAkwMNDYw==
X-Gm-Gg: AYBFou0uQA66MhF5La75Rarm7WHXYDVYaIO4tr9ydu8zK/KRnqqa5aqJhpHFNzA4L4y
	uUDF790BLpL9rBmpZ9SJ4yvMct2nkoNu3AwyylBiSLm+dGVqNu5d+sjq92CcjYIg3i5Tpapk1Cu
	eLSBGFsQ+n9yuQ7TOGGl0F3pRpXYPxTh1GCPnpXoDLgWKby+VGlDIBh52T2UmS5GDSHMFdYdiIB
	/MGWkYNoTYJ1jGPKR93QHlYcRLoyyHzDRpXAJU5KAYsVZcR8k4awGIKiuWrpUvRBXM2d0XPvnvy
	KRyR006fOVxE5InC4akSwXGJ6eCWsMvpvtHY6Z7i6EbItmY1i1IoMubdjwWFpcyNIpjcl6VRs3w
	2SWx3cPl6cVyfOE8zbozB5Odzh/arncOGkg/A/ObnmQ5473t/e1oUGHhud/TZytbB5GztBGecRT
	5RDaoW5CMN5ngrxVWo5ne0BkjcOY8dRTvZN6+ryYztvH9KnUf9wjzEG0Hvi9HeKnA8zhFI5fL8r
	Dp9wTEovXo2eWgLZ6m1Z71jjlqBWNC2kNOwZrsXuI9Rw75QJbrmId7fbVkHJZkk4/RqqgcRXnA0
	05ljW/E4uJ3P0cj6ILVXsIqQm9ubUsZ6jzXj3Q==
X-Received: by 2002:a17:903:4b0f:b0:2e9:6645:e99f with SMTP id d9443c01a7336-2eb3642fdc1mr89382025ad.21.1793652959534;
        Mon, 02 Nov 2026 12:55:59 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922fc14sm32364015ad.26.2026.11.02.12.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:55:59 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	netdev@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH net v2] virtio_net: reject stats replies for queues outside the request
Date: Tue,  3 Nov 2026 05:55:50 +0900
Message-ID: <20261102205550.4148064-1-lian@is.s.u-tokyo.ac.jp>
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

__virtnet_get_hw_stats() passes the vq_index of each record in the
device's statistics reply to virtnet_fill_stats() without checking it,
so the device decides where the driver writes the counters.

For ethtool -S, virtnet_fill_stats() uses vq_index as an offset into the
output array, which the ethtool core sized for curr_queue_pairs. A
record with the vq_index of a higher queue can make the driver write
past the end of the array.

For the per-queue netlink stats, the queue type also comes from
vq_index. A receive record in reply to a request for a transmit queue
makes the driver fill the struct netdev_queue_stats_tx on the stack as
if it were a struct netdev_queue_stats_rx. If the device offers
VIRTIO_NET_STATS_TYPE_RX_SPEED, this writes one counter to the eight
bytes after the tx struct.

Fix this by rejecting the reply when the vq_index of a record lies
outside the range of queues the request asked about. The control vq is
checked apart from that range, since the vqs of the queue pairs beyond
curr_queue_pairs lie between that range and the control vq.

Claude Opus 5.5 was used to audit the driver and draft this patch. To
reproduce, the virtio-net device in QEMU, which has one queue pair, was
modified to answer an ethtool -S request with a record for a nonexistent
receive queue. On an unmodified kernel, KASAN reports a write past the
ethtool -S output array:

  BUG: KASAN: vmalloc-out-of-bounds in virtnet_fill_stats+0xab1/0xec0
  Write of size 8 at addr ffffc90000066140 by task ethtool_stats/159
  Call Trace:
   virtnet_fill_stats+0xab1/0xec0
   virtnet_get_hw_stats+0x5d6/0x7c0
   virtnet_get_ethtool_stats+0x11b/0x920
   ethtool_get_stats+0x150/0x1f0
   dev_ethtool+0xaaa/0x1be0
  The buggy address belongs to a 1-page vmalloc region starting at 0xffffc90000066000 allocated at ethtool_get_stats+0x120/0x1f0

With this patch, the driver rejects the same reply with "Failed to get
hw stats.". When ethtool -L leaves queue pairs unused, the driver also
rejects a record for the first unused receive queue, while a well-formed
reply fills the statistics as before, those of the control vq included.
The drivers/net/stats.py selftest passes on a device that reports
receive and transmit statistics.

Fixes: 941168f8b40e ("virtio_net: support device stats")
Fixes: d888f04c09bb ("virtio-net: support queue stat")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
v2:
- Add a comment and a sentence on why the control vq is checked apart
  from the range of the other queues.
- Add the KASAN report and a test with unused queue pairs.
v1: https://lore.kernel.org/all/20261022182710.2055771-1-karin0.zst@gmail.com/

 drivers/net/virtio_net.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index dd2c41ef6fbe7..db56f984bb86a 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -4973,7 +4973,8 @@ static void virtnet_fill_stats(struct virtnet_info *vi, u32 qid,
 static int __virtnet_get_hw_stats(struct virtnet_info *vi,
 				  struct virtnet_stats_ctx *ctx,
 				  struct virtio_net_ctrl_queue_stats *req,
-				  int req_size, void *reply, int res_size)
+				  int req_size, void *reply, int res_size,
+				  int first_vq, int last_vq, bool enable_cvq)
 {
 	struct virtio_net_stats_reply_hdr *hdr;
 	struct scatterlist sgs_in, sgs_out;
@@ -4994,6 +4995,13 @@ static int __virtnet_get_hw_stats(struct virtnet_info *vi,
 	for (p = reply; p - reply < res_size; p += le16_to_cpu(hdr->size)) {
 		hdr = p;
 		qid = le16_to_cpu(hdr->vq_index);
+		/* The vqs of the queue pairs beyond curr_queue_pairs lie
+		 * between last_vq and the control vq.
+		 */
+		if ((qid < first_vq || qid > last_vq) &&
+		    !(enable_cvq && qid == vi->max_queue_pairs * 2))
+			return -EINVAL;
+
 		virtnet_fill_stats(vi, qid, ctx, p, false, hdr->type);
 	}
 
@@ -5073,7 +5081,8 @@ static int virtnet_get_hw_stats(struct virtnet_info *vi,
 	if (enable_cvq)
 		virtnet_make_stat_req(vi, ctx, req, vi->max_queue_pairs * 2, &j);
 
-	ok = __virtnet_get_hw_stats(vi, ctx, req, sizeof(*req) * j, reply, res_size);
+	ok = __virtnet_get_hw_stats(vi, ctx, req, sizeof(*req) * j, reply, res_size,
+				    first_vq, last_vq, enable_cvq);
 
 	kfree(req);
 	kfree(reply);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

