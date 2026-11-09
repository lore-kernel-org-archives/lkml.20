Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221601;
	b=MEss6bsfXeAAdpMZAiRYN8e/E6OTQ1R2HS8c7G/ohRXT1VimOe5EY5mUisxBNLtkf4dy
	 sYtBzXqavJdePunLr3SqKqOgKSUdh8GhPKPp1CD2ApBur6YYDPcQnGhNKiAMMoZss8yXS
	 488jIQ5zlj895WdwU8FEzGJ15C2Uojueij0nwM3U7WVfGktoV1U9cLs4aHCfkOF/xQQJ9
	 ZqnI6A3/jPtaYASjKC11JQMp7ttKOw81ID6B9TxCZTWW2Z/FwgRqFQT9NWYA9/U5pMksp
	 lqLlHch8KrEcLyWHvbrChLjm12Y0W27nhYwevBKx5ty4lh6emOziSe0qSLqcnKa3x0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yRJunyFxJTxNbMZ/8F4LlLR5Z3XEUtdXwi3weUw7flA=;
	b=sfKXCQB1AQz/NN6esu3Vy+60n8UFWeFxzQQYdV1er30jaK/vp4peIyxiIXQLkzMyYl+b
	 vR3IyiJUyRAsRXHnB/2DQCY1IkKzcfPZBpIRSroqawSp6J93VVToWS83ME55a9VKaxJlR
	 Fx3tGPjeD0ZorJ2Tg1BVTg3DN0usyCEsKoaf6tUm+ObD9BybVgyFgz/7Ie27pG1FEVJEd
	 BeAtnUulzRqKIV3/+g8lV6cH/irKgus+QzPUsVdgF4F7EMdIflJXQQbwgyp7yKe4kUzv+
	 ELM2e5GSzLNJxTW3w/TcraXzfiWbX4YYUm+lp9VJ7YbHoB3IqMcdW+yRHzwOhY0ZIbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b="WbYUcye/";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00142606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00142606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=WbYUcye/
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1097139c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1794221586; x=1794826386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yRJunyFxJTxNbMZ/8F4LlLR5Z3XEUtdXwi3weUw7flA=;
        b=WbYUcye/Wh3eUMwCeeB4zvCzv5J0SJTJ55IKpmHb6ll0m6Af03Q5QwAVIjMy/uOg9L
         vpqPrOeXXV5jdlOgEZuWTy7M0BjTKh3qmeuI72hr3S3wf+EZi7WirUd0KhQL7Uxv44O5
         O5UlLGn36bket41zt9POfOI1J8kaFMG4J1gxSvR/z6dMo/baR0Z42MDVqZoEiwb1JzW7
         tJTcjyuIRU8OOh/Bby3eLsvEkJwWfAb7R4oUuMfh75Cv2QqI8wCcDCCQmB5OlAuPNZ1h
         ClK1FM8uY6BJDJvHj5TFG9jjM/r5nBvLl5r63vk/dJImAQe7x2/Aj98FRE5z8RwzG6UM
         k3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221586; x=1794826386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yRJunyFxJTxNbMZ/8F4LlLR5Z3XEUtdXwi3weUw7flA=;
        b=CZ0o44myEKeFKoKpTIrEl3FRibl3f+lkoZiPUkdeQSf995Rhkpu1gQCF+ajyDFaHoy
         2c1onUXsjUiPQQ0k4nx2TfiYTONxTX63nTbg9qA1DBHomeUPFdTQD0FRkUbpat6uYrGt
         FrEgeYPxQVpvkN/ndX5oWv5CIP1v32BIvOlQXw/yIceCDe/UsQjfk6WKbEdh9jiKFVzd
         LWc3462QvO/PpYrRkoFrbPq18bj0KD3v4C45B5yqtHmOztiTA4s9ikSIUYqaUIVI8Str
         +Aae3sX/xSdEoTuzpB1+eGMku7OmLZS4ufev6wyN7wCu4Ih4EYe/JghSb3Hj9TIQLECW
         /KGQ==
X-Forwarded-Encrypted: i=1; AL+hErHxdKvi7WcMBslPeVyfzlf+mm6xFR38Z4bV6f44KMuzCRcVuTvuJX1jcz7r76QY7Oiz8Nwu/OQIvNKcssY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RLA9Qi5lrD/BAcCGY/VMqHsZkFyqTDAk0aBLjxdnXG6/VQJtk
	j6LaaRhcD6AFjA6v0lc6UUPRtv07LHQ6k/1fH9qkOqiUmasoUz5WPnpqew9juQtyEw==
X-Gm-Gg: AYBFou0wipqlfXJLAj4LoXM1kCVmRhL4T5nzpj2aQu3kR5174KHVDwhY8xgGrlT7P+k
	8c5r/ypyluLXdEUaA6sYZpcFtTu9AbCJJz7wIoKB15Ogg9d3/hcVZ/xBfTMvNk1CLFv4D/dWTbk
	zk6CN45U9+v3H5FjchqQB0Awo3WuK2USi+I5sokVTWPL71RcDSfU080HB6R/SFfbCE7BOg7tAuO
	3gfea7CPp7Y/mKKQ/l7SImp/zQnmAMRAFpdzGhm/pEump9yAC4jscvYkzUfEbiGZiaVIvSy4X6l
	UVZIJFtxuj81F/OTNdiddpxDA+ZXaSajqD//271/asvdHmb2f9QqLpKQgpAOD5rqGpYlRyNqf6y
	eOfR6yCgJBBqJgLUDwkH5BimU+giizw3PO7alUShMezg09vbunOEQmgXpM1z0/vqadzMn9vPfAV
	3VWGVLGjUtv5q7pHv2mFScJYHVj1T6fmQzbkV8epQVuRQ2OKuEjyIJGfvZx8ZopsU92NtWBhimJ
	ebSghwb3MHhQy2lAKTYbH9Vj0PwcglN8+VNwt5qUn43KQ3ZcXIvBI7+1obvzh3HeC26WZhBOGax
	PyBSsaMRgxIbwOs3nUFFy6NWrtnkr5/bWNXpvQ==
X-Received: by 2002:a05:701b:2705:b0:189:d6bf:7ec7 with SMTP id a92af1059eb24-1b39fe946b5mr6255466c88.19.1794221586094;
        Mon, 09 Nov 2026 02:53:06 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375726fd1sm12228744c88.14.2026.11.09.02.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:53:05 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Simon Horman <horms@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Tomas Bortoli <tomasbortoli@gmail.com>,
	Chirantan Ekbote <chirantan@chromium.org>,
	Greg Kurz <groug@kaod.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	v9fs@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH 3/5] 9p/virtio: keep a request until the device returns it
Date: Mon,  9 Nov 2026 19:52:49 +0900
Message-ID: <20261109105251.2545764-4-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109105251.2545764-1-lian@is.s.u-tokyo.ac.jp>
References: <20261109105251.2545764-1-lian@is.s.u-tokyo.ac.jp>
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

When the RFLUSH of a pending request arrives, p9_virtio_cancelled()
drops the virtio transport's reference to it. However,
p9_virtio_zc_request() has already dropped that reference if a fatal
signal ended its wait for room in the ring, since the request then never
reached the device. Such a request is still flushed, so the reference is
dropped twice. This can happen when concurrent requests fill the ring
and a waiting process is killed:

  refcount_t: underflow; use-after-free.
  WARNING: lib/refcount.c:37 at refcount_warn_saturate+0x84/0xd0, CPU#3: dd/293
  Call Trace:
   p9_req_put+0xe5/0x190
   p9_client_zc_rpc+0x52e/0x970
   p9_client_read_once+0x237/0x6c0
   p9_client_read+0x9d/0x140

Additionally, a misbehaving device can return the request after the
RFLUSH, so req_done() writes into the freed request:

  BUG: KASAN: slab-use-after-free in req_done+0x1d9/0x280
  Write of size 4 at addr ffff88800392d758 by task swapper/1/0
  Call Trace:
   req_done+0x1d9/0x280
   vring_interrupt+0x32a/0x540
  The buggy address belongs to the object at ffff88800392d708
   which belongs to the cache p9_req_t of size 136
  The buggy address is located 80 bytes inside of
   freed 136-byte region [ffff88800392d708, ffff88800392d790)

Fix this by dropping the reference in req_done() for a buffer without a
reply as well, since the device can return a flushed request without
one. p9_virtio_cancelled() is no longer needed.

This patch is assisted by Claude Opus 5.5.

Fixes: 728356dedeff ("9p: Add refcount to p9_req_t")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
 net/9p/trans_virtio.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/net/9p/trans_virtio.c b/net/9p/trans_virtio.c
index 53046668c16b1..68c3457bec401 100644
--- a/net/9p/trans_virtio.c
+++ b/net/9p/trans_virtio.c
@@ -145,6 +145,9 @@ static void req_done(struct virtqueue *vq)
 		if (len) {
 			req->rc.size = len;
 			p9_client_cb(chan->client, req, REQ_STATUS_RCVD);
+		} else {
+			/* No reply, so put the ref that p9_client_cb() puts */
+			p9_req_put(chan->client, req);
 		}
 	}
 	spin_unlock_irqrestore(&chan->lock, flags);
@@ -195,13 +198,6 @@ static int p9_virtio_cancel(struct p9_client *client, struct p9_req_t *req)
 	return 1;
 }
 
-/* Reply won't come, so drop req ref */
-static int p9_virtio_cancelled(struct p9_client *client, struct p9_req_t *req)
-{
-	p9_req_put(client, req);
-	return 0;
-}
-
 /**
  * pack_sg_list_p - Just like pack_sg_list. Instead of taking a buffer,
  * this takes a list of pages.
@@ -806,7 +802,6 @@ static struct p9_trans_module p9_virtio_trans = {
 	.request = p9_virtio_request,
 	.zc_request = p9_virtio_zc_request,
 	.cancel = p9_virtio_cancel,
-	.cancelled = p9_virtio_cancelled,
 	/*
 	 * We leave one entry for input and one entry for response
 	 * headers. We also skip one more entry to accommodate, address
-- 
2.56.0

