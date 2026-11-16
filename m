Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821093;
	b=lkCBWHPzYORLfHcVfR+JQfBlJyOZx9iI1D/x2l81RYtSZNTKQ1nzbpW/wWpfa5ecRpyh
	 qIuRw+rWh2FV0Y3XUii9PeC3tUsyDbyuetKdqFUQoKZoCZpq2QEA83b7cIC0K8FNWjPJI
	 0H2t5JI4gdbrZKP4VitknaZaZCP0ZHSJTNEuUoiVu694dqz079ArvZKGI875t8U2Tcatj
	 VdWZEBwd/WUB+fKr0JWYng5IEokLW14tjxv3AUsnmTw7pBvqwN5okrp4KlnH7HSQRnC74
	 Vs6U09K6kg6bZSmrLRsK/lFUFpJl1B1FXltFYSYIdCZ1l0StJMrv8T4/Rh7bNg2F8FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wWFReQCNmO0chmlv4z0vEYsw9XSwzNSVOiZAm6Q6bTo=;
	b=OxNn0MBvBXtLgZ7XZZ54rMjSxPibk7+z4MpR+xwiecpozJXoxaK2gRtCcMYJMaRLfw9G
	 repZZzvbxucIbLZxN8Fq88peJZp/F0Z3mry2N7AfTPlKB8UvhQ3lV8s1feIuvDszGXuAL
	 dQ5m1WqlQoLmGO/Ab5WhPO8k4ORagZKnKe+PqdNcEGyD5p8G1nt4WIzJd+juZYuh+LMMJ
	 NQeOXTLgmwghyLxrXfK3rBxrqB3yZjzFFtTXn0zwwcmP0PJSodUDJVxaM1DAT6DPDbyys
	 b0C5ewbszkSXs+Y7Tvu8ew2vnIdUomS6IrBvvl3DB9dIXTfTB44Bo6vQk5F+06MmSVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=d1xH0vwW;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6A7606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE6A7606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=d1xH0vwW
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3704d30b84fso3733419eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1794821092; x=1795425892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWFReQCNmO0chmlv4z0vEYsw9XSwzNSVOiZAm6Q6bTo=;
        b=d1xH0vwW72dNf8B6ts19L8aOBpw3sMMg2s+Kb7smIenN9JByd8YzcP3EJ7vvYMnaz/
         ZLlHedxVBOxcvOp/t8GiPAV5qKkppj9fYHBpCX8idlDNSURV/YgjTH9cSlLEyp0cD5Fg
         CO5vC4p2O2dOHzJ8ikYPitSKQp0PhAJgVhmNygodgIYvOxZKF+u97D71QiRCcR7RO70V
         Ze6QIgH0cbiwEpGR27t2F49pPAHbNFlu92fxRPDduJIyuv1H5lM+1RIqhbiVSeWuyMzr
         3iJ/NL6IiWEB9jrVbOANK4ySE91+bRk6TwP1H6uiv2u3mVuK1URa+Aa0nQeUK5J1DPyN
         kOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821092; x=1795425892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWFReQCNmO0chmlv4z0vEYsw9XSwzNSVOiZAm6Q6bTo=;
        b=DvZq6JZkfgS8aMu3LETd3AL0zgien+ubDOE6pr81NYDkEjTZ5S+BZV5Ii+l9XEaXM2
         7yS26dsMyGYuOJLg6vGRije2/GoskULTJJUgcHZGx3cPe+5iRmMOzTxy6eWtQ/S3RlsB
         izZ49iPWrZdiJIos05D6Gy63pWNU4pjDPN6eYRuli2gH5jQlNMCag7E1ntKjJ87wywKg
         GTV+qIzXEvFVkMPXYG1ePCyaFj9IBqRlJ4M0Bw1m6p6rIv5bt1zrtpZRiPrGAweQqGEU
         WjTnVZGorJUP0gqJg3urfC8nYzgwWXEM9efs3JvDXUYJ2Dmce041/V7nYnf+0eoSnFh6
         lK9A==
X-Forwarded-Encrypted: i=1; AL+hErHcDZZ7wUQ3iDMn2epzX8+RTqTMrJsVNj7isiLmufYgHNA+U1aZuJpIJm3JSvaPeTTHuH1G2jcdG3PcQk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OK8uByv8Vf8F7pE2uCGp/vtYgl4Pc56w5LvLjpgFy3IOtvR1r
	gAN5yMxD7MTuktna0seosZ3u2UgTzG12vrseScHJpXiL61w7skPC3ebMnwIQ1WZqZQ==
X-Gm-Gg: AZFdTZckgD2M31MZzKxaG6/sKo/67LYSn3BxVozUI0D6uhXLWYsxbmZuqr3evrmqrOz
	Pk1VaobN9bh/cHT639ds/FY+lsPs6K+F4ZSwA98f0ZUuXj1bsYqBgFkaVEiXBPbszbKIZqfzlYA
	Jt4es5xLnAY1GOM7BjpsAzA9F4Jo2R2P8BdBYKkCPKznHrUT9FnojMfDfJBZlmuTOLYFJDMLYVG
	U8KKFwsFEmQdJINX0fKmAGrt7wONBtqTYxpo558lNJ0yfZoMGzkCVNHIvCq03As7zK1hktISJv8
	rNTpSRXFnlWeZDptRCSv61Cnu7G4lt7pZhLeG/6IxTMFjoOvfCk+YQ6Metjr10AkpzlASj4MkTZ
	8SQ82jjgkkbkK/hCtEUpdKfgWL6LpiwhziO8InWk3O/SNRdYUFLVGY/Yhvzn9Lf4rh6qlbSV6BJ
	uvXTq5SrgSHJnAxqFUwDsK6DDnieM4oP5j9elMIrr2EUYL+PJ+jnMkkh0Y4zA2avC/mBhVXiBgg
	di4rr9RQHZoSsaAERnBY8RAyQ22E70VlV7Izy/EGWteRfYn6fwujB4PZzv3UWp6XRxTTmM45Ws1
	oKodS76nZOXF/bYPCgK7ilp9zqT1HKSD6P0pRQ==
X-Received: by 2002:a05:7300:d40b:b0:376:b957:c08 with SMTP id 5a478bee46e88-37966c489d6mr10969239eec.9.1794821091716;
        Mon, 16 Nov 2026 01:24:51 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm32056314eec.26.2026.11.16.01.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:51 -0800 (PST)
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
	Michael Bommarito <michael.bommarito@gmail.com>,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH net v3 1/4] virtio_net: reject stats replies for queues outside the request
Date: Mon, 16 Nov 2026 18:24:42 +0900
Message-ID: <20261116092445.3391334-2-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116092445.3391334-1-lian@is.s.u-tokyo.ac.jp>
References: <20261116092445.3391334-1-lian@is.s.u-tokyo.ac.jp>
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
device's statistics reply to virtnet_fill_stats() without checking it.

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
outside the range of queues in the request. The control vq is checked
separately, since the vqs of the queue pairs beyond curr_queue_pairs lie
between that range and the control vq.

Claude Opus 5.5 was used to audit the driver and draft this patch. To
reproduce, the virtio-net device in QEMU was modified to offer device
statistics and to answer the request of ethtool -S with a record for a
nonexistent receive queue. On an unmodified kernel, KASAN reports a
write past the ethtool -S output array:

  BUG: KASAN: vmalloc-out-of-bounds in virtnet_fill_stats+0x6c1/0xf20
  Write of size 8 at addr ffffc90000085140 by task ethtool_stats/158
  Call Trace:
   virtnet_fill_stats+0x6c1/0xf20
   virtnet_get_hw_stats+0x5d6/0x7c0
   virtnet_get_ethtool_stats+0x11b/0x920
   ethtool_get_stats+0x150/0x1f0
   dev_ethtool+0xaaa/0x1be0
  The buggy address belongs to a 1-page vmalloc region starting at 0xffffc90000085000 allocated at ethtool_get_stats+0x120/0x1f0

With this patch, the driver rejects the same reply. When ethtool -L
leaves queue pairs unused, the driver also rejects a record for the
first unused receive queue, while a well-formed reply fills the
statistics as before. The drivers/net/stats.py selftest passes when the
device answers with well-formed records.

Fixes: 941168f8b40e ("virtio_net: support device stats")
Fixes: d888f04c09bb ("virtio-net: support queue stat")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
v3:
- No functional changes.
v2: https://lore.kernel.org/all/20261102205550.4148064-1-lian@is.s.u-tokyo.ac.jp/
- Add a comment and a sentence on why the control vq is checked apart
  from the range of the other queues.
- Add the KASAN report and a test with unused queue pairs.
v1: https://lore.kernel.org/all/20261022182710.2055771-1-karin0.zst@gmail.com/

 drivers/net/virtio_net.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index ed20e76fbc4c..57d7a98ecb57 100644
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
+	ok = __virtnet_get_hw_stats(vi, ctx, req, sizeof(*req) * j, reply,
+				    res_size, first_vq, last_vq, enable_cvq);
 
 	kfree(req);
 	kfree(reply);
-- 
2.56.1

