Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657718;
	b=TtFjaE3Tpo4J5S7Z86UWJYn9w02Zl8soy5+WXzoIOJC/KwrNfbLeZu9U4EZvCfM/hIaH
	 QJtkag9iqTHb0Hq3ICo+1q0kguF+alxQ7aeqGScKIukZ6+VXaDVIeXDLsVzRazgOXT+rn
	 PXENfMi24dwNa0Ixw8zQmv5+olcPtcTELRTL73OjBZHmGHbpRjp4r+IPrFRu++uEru0KH
	 z4JqWwVt1Yc0+ZodhhQpg7ufecrxCFdxTRk9x16LMyCT2bQgaCmKCuJKNYnUArwJ8ySYA
	 v+grLTlQkzY2qxeqi2KE9pIKHky6lKiwC+tfLfPKxORyn9POUBRVOxrx4/1DDVWqJCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DDDq9vrORSWbnT/BmB95bS2gOj2xanzImuHp41SDLD8=;
	b=e4tCG93ajYOp47kVuNLmsenJpgsxZA/9bWBXJSlJOTLkvLga/HrYreOHSls5rMPkonVP
	 WogKgrRxr6lo90MKZui+Bz4yd4wNQc/tpDAEx3dcgYybxf0kX0gQuYr2tJzkvvSsU2DjO
	 kfevbvbxIuMmywMcWu+59R68M7+pJaqC6XimRH+mbUrtA4bYESkdvtTlidoRSv5Werwud
	 lmHwi+clX5vuIB7861SiSvFmS7kPqX7JPjAdt2ZbFnvxuFbe0+FQKSBk0WvLcQotQd2KY
	 fB+lifKgoIrUvVDyV48vnHLjQJT00eSMY8ym2uY1tt7jH7ptsQDVhsbes+7pu8H+tkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC41606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EC41606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so864834a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1793657711; x=1794262511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDDq9vrORSWbnT/BmB95bS2gOj2xanzImuHp41SDLD8=;
        b=TokvcMKc+KYIST87Mai260x4nopeORdiWMi79Bv4kzPWRQ+VEYVkBgKM7J7ubgfMct
         EAUHAd4PTv1r8+90sVT307xC2pRCL993JZJfQlLMk2O6IzZh1NLpuneUl+BUTtg8XxYx
         /QTo1JyjHQrs21R11/IBFyP5jg0n9Iy6VouHwlbd7HPaMecsZ/Wd/mOSzz0t9MTSXdHE
         aLOuN4vTnqJnwHQIzjkLQ3OlWd9efODyiNk9U0HJfXWPInLzKqDV8kugDOiez/o1io2s
         hF/KO9aruPizc94q+0RDxqUUSB5RHH4v19BLqwrotuv1CHCNEUPHBmPNWoT2ul3T99/0
         V06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657711; x=1794262511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDDq9vrORSWbnT/BmB95bS2gOj2xanzImuHp41SDLD8=;
        b=TiqYJF2D2jf6fQEc2ZPe8ehUAi9Y2ue6nWfSpgeM0VTBbnBSv2HFAGcskClvEsZYpm
         W8osInv8G7h7lyeO7h/C21CtO+BivYWaMzjffX9DEt9V80D45wGy06oKW11NexD+iW51
         3DZnZxxwPTYWYf08/OvkOAvz20BN2mFN6cBPfBTnsz8v/ojYXie/l3E7gdh3xbXg5zEP
         SEQSwyRkSZSzKv2tdDUpt1svEU6gx9Oh8zhcyyivMLyj2OP/8+eZZ09VlrzERBJDfTVi
         IBtJrYCu01F3dDpWB9X0VfPuJs//elr2jUFPdIOhLQDqwl5XboBakOJRdSGRuYgjuVcm
         4CaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFRDhs9T92T0gRK/KNlqGmW3e7bk6uhDryGMoGuphGmaVA3Mcb2Ky5IOewRKckJ0VylWookQhM44/W5hc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nL5AdjeVUsWYcOofRhEa+myVDxY9xfAGU6sAjLMAQStyncc83
	VYDYnJGy+P2GhpcGmSimPCxyehvWHXA+BddM8jJ6exHdAz6ijmw4P0S78oPZBqwKnA==
X-Gm-Gg: AYBFou0bdIaYiRHjxI4IEZbVquq7aQyFRGVxYx3Bh3ZaLZrixMESP1kPXtcAXLK9PNx
	gzH2Xaid5rgihb67P/vvqAUvQfPyegAz2lFPldWRTfsXVGsYwgO7bPHth+K78KL8VCwfi/oAqHJ
	9OH/AaIFJvg9T96nLZvUPDemZTsCq5DPhZ+ddzvpZ29IVi7CkEAgqLlNwOlwLG8sk+4QkNre4ZR
	1KndZS3JPOejLgNpa6SaknNTFSvQE5QD8/44cyKBOuoJybwdSKrzfIHIFuKtfpVlDB/GmWWxwia
	wQ4MEKrk4WUC7zXwxnZlFjBRAsBCTcl9K+B+xdrknccd97V1sAPWOMbn20XClL3MsoWs76AQcB5
	4jWS5Mwp36A2CGvXh8qRxncMxJAlo5wDqJfSkr+V/++D5/cHICxradXJaQojABiZxp9JNy9JciU
	DMy1LQsJV1jUPmFu1boWfr9KDYZOpIg4hUbXcKAe5DDZyCL0dpvGCE5SDvvUTW5vcilRLejaOoV
	rwAp/s/gL2XKun3hXB+egoMu72qNiBW+ThEzayl3TBzYnG9MPCKdBYeBKil3vJ5LeEpmLieCNBm
	yGYrh011DVFUux9QIDqNXmLhMa4Df7OXg6gLWAE=
X-Received: by 2002:a17:90a:fc4b:b0:3ab:b64:5893 with SMTP id 98e67ed59e1d1-3ae8981bf35mr8240104a91.53.1793657711239;
        Mon, 02 Nov 2026 14:15:11 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8b1913sm984336a91.10.2026.11.02.14.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:15:10 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH] rpmsg: virtio: Reject a message shorter than its header
Date: Tue,  3 Nov 2026 07:15:04 +0900
Message-ID: <20261102221504.175116-1-lian@is.s.u-tokyo.ac.jp>
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

rpmsg_recv_single() rejects a message whose msg_len exceeds len -
sizeof(struct rpmsg_hdr), where len is the used length the device
reported. Since len is an unsigned int, a used length shorter than the
header wraps the difference, and every msg_len passes. The endpoint
callback receives up to 65535 bytes from a receive buffer of 512 bytes
by default, and rpmsg_char copies them into an skb that userspace reads.
The receive and transmit buffers share one DMA allocation, so the copy
can run through the following buffers and, with small vrings, past the
end of the allocation. With vrings of 16 buffers and a header claiming
65535 bytes, KASAN reports:

  BUG: KASAN: slab-out-of-bounds in rpmsg_ept_cb+0x4d/0xb0
  Read of size 65535 at addr ffff888002484010 by task rpmsg_echo/140
  Call Trace:
   rpmsg_ept_cb+0x4d/0xb0
   rpmsg_recv_done+0x29f/0x840
   vring_interrupt+0x32a/0x540
   vp_interrupt+0x146/0x180

Compare the sum of the header size and msg_len with len. The sum cannot
overflow, since msg_len has 16 bits. Move the check ahead of the debug
output, since dynamic_hex_dump() reads sizeof(*msg) + msg_len bytes
when its dynamic debug site is enabled.

This patch is assisted by Claude Opus 5.5.

Fixes: 9648224e564a ("rpmsg: validate incoming message length before propagating")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 23ff6c8b7a20b..a9125e81cb150 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -661,6 +661,16 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	unsigned int msg_len = __rpmsg16_to_cpu(little_endian, msg->len);
 	int err;
 
+	/*
+	 * We currently use fixed-sized buffers, so trivially sanitize
+	 * the reported payload length.
+	 */
+	if (len > vrp->rx_buf_size ||
+	    sizeof(struct rpmsg_hdr) + msg_len > len) {
+		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
+		return -EINVAL;
+	}
+
 	dev_dbg(dev, "From: 0x%x, To: 0x%x, Len: %d, Flags: %d, Reserved: %d\n",
 		__rpmsg32_to_cpu(little_endian, msg->src),
 		__rpmsg32_to_cpu(little_endian, msg->dst), msg_len,
@@ -671,16 +681,6 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 			 msg, sizeof(*msg) + msg_len, true);
 #endif
 
-	/*
-	 * We currently use fixed-sized buffers, so trivially sanitize
-	 * the reported payload length.
-	 */
-	if (len > vrp->rx_buf_size ||
-	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
-		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
-		return -EINVAL;
-	}
-
 	/* use the dst addr to fetch the callback of the appropriate user */
 	mutex_lock(&vrp->endpoints_lock);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

