Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999072;
	b=OYqhRlbvKLxgLH8S4tRWdsoRp5kFV87dV4POpUAZRiDhkTBa27PnCg+o3l1lCBsBpf9N
	 2R/+p01AXrXhXzUoYBatUww+5zC847Gc5xxZe0WB6xvo0o4FzWFUzpBVh/HNx/TeFtRqC
	 dWi+XZE6Du7Snhk/JVuUDc+nCDCAZVQ+BwFi4cylxvwUi4wmrEuKD8wurEHSpS6xwAWrV
	 HEH9CiPK6NX8EMTZDKq5J1M0YSfhVhh4Kw8CZFhXNGDninVRCY9IShx5WBep1cchQAGZT
	 kMCv8BmWkH+Ibi0kFJJ5reS0mycQ6NBvgkGzai9PO0GNI6bloz7nXI5P4V5YsC889Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HGCg69LbAWBbuCTTtP179KzH2F4LVTblzOcbjp1ClJc=;
	b=SbrorG+8QGzQMGCLv1DI+/g4kirKHiVVDK3ZgaEmQcnW7fZZiCJLHNZyCZQncV5KdG4M
	 EOYxrpp3yCYaCyQoB4x2AQlqXbLrS0ZUkwzvZNS0i0u++vyCU267m/A6uoblAdvOqyVgm
	 IVRkXVMIusxk0dd/7mDKy2wFHeidaS0ara4bxiYrkkNtcCN8foSQfTX2KXe9ztdKDvq9T
	 Ib22SQSHwChTK+kB7/E3HqZMo3hkkq9HQMwjDrg0rSER5EUy9YO6/5HE+q4UCq/uxLAWq
	 uST1Pf2lsin+bh9ubIU8YlYexb9ow25DfWMd8Wuxkxs4ZGGJ7GGHWxncaSvbeV6TScw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g0tFNOOj;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECEB606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DECEB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g0tFNOOj
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1576232f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792999070; x=1793603870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HGCg69LbAWBbuCTTtP179KzH2F4LVTblzOcbjp1ClJc=;
        b=g0tFNOOjjbxDQCczODTc2/oN+MH7WTPjugxRyVbZvu7hhjD4oR6htskt9tZ04lnHQ5
         j6xMvY+MaoG54zOuQlymxac93Iup9ePkEzBdVpBzgA3TIkxQIhy3ueSKlsp3rogCK73o
         yIOBxqPRwo1H7pGB4hNC10LtqOdmQXe9y20ResPNlsNsx/I7u3BNQeUFQHk2/Ue2HGNo
         RNww6MIHIurU08kMVUaGji7BZiV/SCN0uY1CKK9mVZHpG+v4nNsKg5axjl6e5M9Vc9zw
         wVpOhsA++vZgPf6AFNIcTtqvGpENwyeJQ7f8liL/eDh0bwPKNDRThKpe6gihKgwwHG7D
         vIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792999070; x=1793603870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGCg69LbAWBbuCTTtP179KzH2F4LVTblzOcbjp1ClJc=;
        b=SMGYKZ997fVWE4382oR1sLV8d5+gmd9JpHuRKw5TkkxdDaGTxw25sheCNRx+EZgs15
         YERP+UMm+NxSXMAASoy4YBDlMMevzgvqm2rxIR5dN1IaulYDSJNO7yNFreFrjNexXmd0
         /6jtjKca7Npe4Kq03P5du8/563S2/KFQivFqSX88F/UwRIwSGQKIx+7Oz4nGIsAFV2MZ
         t9yIYBbXGRl4XobxKHJkp18RBE2hcJb2RgxeGvB3zzLfMd+Wj+j60F7+CwtfFFFagNYS
         fmirbxH2wfGLu3/N/pgWS+UUJIyu+1LwQe2ScPf14k1T4k+LC1iAF23byGgfl2PHmzn9
         ii3w==
X-Forwarded-Encrypted: i=1; AKwUvBzyvlxk4IVU0I6Bm1lJ6SQGk2aNZHE3r9ygc4ZSZYm1/4evKw3/XLTTqWaNWl2KmLbminHLxf5gVXPRmkY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzEFEqJE8KLcvLqeZUn1zM7aWNBgT3saf3A7BRJ5QHP8SqMDjB
	F0y8afHKZ4MxgTj83WAVlWzmfDa7yp2dPnNaLvXkUvRVDAbtDkiU5GQdnwND9Gg2nOo=
X-Gm-Gg: AYBFou3OA3KyYqAxkACljnU6mhP4S4STeMY3pyJtizFILkW31QJEOs2WO/YGJqxeOSH
	zPxTDBuhll9dPoMnW2uSXjmlMLlK7ww59/aI+iuX9161gl+d+MroGmIf3ZJjjEAhERXhYMNRheZ
	zREkH1VdOIJKpaJ8Wy7mEBc4Hj+46kcQvoQSu8/iDs0+Biguut53AyIbPW0DoZ4aO33nZvf3CpH
	6GFAZRu6nRsPdr3TpOP1UoKkIj84DSHf2axqtzNHvRNP70vn8pfp6cvlggiXYqnLogTBc/kjtO7
	WVLJH2UcxzVVtyk3Gnaj9e1DfL5ofndWKCT5nRQY6HZbqgM++7lr3R//MfFzw97PoldgXXAWsnf
	6CNVd+NDnZKBnWsjRAsW1ES16uLTbU2GfyICwD/s8pEPqERmpbyfontiQ/Uav4rINUa2G7J74le
	Q7/py177UwL5yII0V0oBCjgA0+lwuS5MtxEP1bsKunLiEGXhIrcw4AGaV3BGEDJ8LGYImfLJgvI
	o+F9ww1VrFf8xCvYs1WDHT0y/E+ot5ggTB7BCNs9GqF2XOGNHYVDgROx1KCq8/J29a4iHYU7Oea
	BqglzQ11kSBfdzrQcct/0o4ASE5aHcete7NxmVj1eLqReDGA32Kg2Sn3VZsrMZJrpynrLSsXgZ/
	a2NGM1ioDd1A4yx7I6Bfd+TTWHBuyAiMuzOFBMT/hzlpjWqFSRI3ZkleZoJQYE0hJ2Q==
X-Received: by 2002:a05:6000:41c3:b0:48e:f07:160e with SMTP id ffacd0b85a97d-48e3eb98eeemr9291878f8f.38.1792999069985;
        Mon, 26 Oct 2026 00:17:49 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b1a4-1201-5c78-89f4-99d8-70d7.310.pool.telefonica.de. [2a02:3100:b1a4:1201:5c78:89f4:99d8:70d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm15758606f8f.18.2026.10.26.00.17.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 00:17:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: videobuf2: finish prepared buffers in VIDIOC_REMOVE_BUFS
Date: Mon, 26 Oct 2026 08:17:35 +0100
Message-Id: <20261026071735.37220-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

VIDIOC_PREPARE_BUF leaves a buffer DEQUEUED after calling buf_prepare()
and the prepare() memory operation. VIDIOC_REMOVE_BUFS accepts that state
but frees the buffer without calling the matching finish operations.

With VIDEO_ADV_DEBUG, vivid reports:

  unbalanced counters for queue 000000009fa716f8, buffer 0:
       buf_prepare: 1 buf_finish: 0
       prepare: 1 finish: 0

Factor the per-buffer cancellation tail out of __vb2_queue_cancel() into
__vb2_buf_cancel() and call it from vb2_core_remove_bufs() after the
range check, so prepared buffers are finished and reinitialized before
being freed.

Fixes: a3293a85381e ("media: v4l2: Add REMOVE_BUFS ioctl")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2:
  - Factor the per-buffer cancellation tail out of __vb2_queue_cancel()
    into __vb2_buf_cancel() and call it from vb2_core_remove_bufs()
    after the range check (Tomasz Figa).
  - Send standalone ahead of the rest of the series while the cache-API
    questions on patches 2-4 are resolved:
    https://lore.kernel.org/r/20261019063401.3674-2-kmehltretter@gmail.com/

 .../media/common/videobuf2/videobuf2-core.c   | 88 ++++++++++---------
 1 file changed, 47 insertions(+), 41 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b0a6084f17573..29e539ee002e9 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1717,6 +1717,46 @@ int vb2_core_prepare_buf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb)
 }
 EXPORT_SYMBOL_GPL(vb2_core_prepare_buf);
 
+static void __vb2_buf_cancel(struct vb2_buffer *vb)
+{
+	struct media_request *req = vb->req_obj.req;
+
+	/*
+	 * If a request is associated with this buffer, then
+	 * call buf_request_cancel() to give the driver to complete()
+	 * related request objects. Otherwise those objects would
+	 * never complete.
+	 */
+	if (req) {
+		enum media_request_state state;
+		unsigned long flags;
+
+		spin_lock_irqsave(&req->lock, flags);
+		state = req->state;
+		spin_unlock_irqrestore(&req->lock, flags);
+
+		if (state == MEDIA_REQUEST_STATE_QUEUED)
+			call_void_vb_qop(vb, buf_request_complete, vb);
+	}
+
+	__vb2_buf_mem_finish(vb);
+
+	if (vb->prepared) {
+		call_void_vb_qop(vb, buf_finish, vb);
+		vb->prepared = 0;
+	}
+	__vb2_dqbuf(vb);
+
+	if (vb->req_obj.req) {
+		media_request_object_unbind(&vb->req_obj);
+		media_request_object_put(&vb->req_obj);
+	}
+	if (vb->request)
+		media_request_put(vb->request);
+	vb->request = NULL;
+	vb->copied_timestamp = 0;
+}
+
 int vb2_core_remove_bufs(struct vb2_queue *q, unsigned int start, unsigned int count)
 {
 	unsigned int i, ret = 0;
@@ -1746,6 +1786,10 @@ int vb2_core_remove_bufs(struct vb2_queue *q, unsigned int start, unsigned int c
 			goto unlock;
 		}
 	}
+
+	for (i = start; i < start + count; i++)
+		__vb2_buf_cancel(vb2_get_buffer(q, i));
+
 	__vb2_queue_free(q, start, count);
 	dprintk(q, 2, "%u buffers removed\n", count);
 
@@ -2253,48 +2297,10 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
 	 * be changed, so we can't move the buf_finish() to __vb2_dqbuf().
 	 */
 	for (i = 0; i < q->max_num_buffers; i++) {
-		struct vb2_buffer *vb;
-		struct media_request *req;
-
-		vb = vb2_get_buffer(q, i);
-		if (!vb)
-			continue;
-
-		req = vb->req_obj.req;
-		/*
-		 * If a request is associated with this buffer, then
-		 * call buf_request_cancel() to give the driver to complete()
-		 * related request objects. Otherwise those objects would
-		 * never complete.
-		 */
-		if (req) {
-			enum media_request_state state;
-			unsigned long flags;
-
-			spin_lock_irqsave(&req->lock, flags);
-			state = req->state;
-			spin_unlock_irqrestore(&req->lock, flags);
-
-			if (state == MEDIA_REQUEST_STATE_QUEUED)
-				call_void_vb_qop(vb, buf_request_complete, vb);
-		}
-
-		__vb2_buf_mem_finish(vb);
-
-		if (vb->prepared) {
-			call_void_vb_qop(vb, buf_finish, vb);
-			vb->prepared = 0;
-		}
-		__vb2_dqbuf(vb);
+		struct vb2_buffer *vb = vb2_get_buffer(q, i);
 
-		if (vb->req_obj.req) {
-			media_request_object_unbind(&vb->req_obj);
-			media_request_object_put(&vb->req_obj);
-		}
-		if (vb->request)
-			media_request_put(vb->request);
-		vb->request = NULL;
-		vb->copied_timestamp = 0;
+		if (vb)
+			__vb2_buf_cancel(vb);
 	}
 }
 

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.39.5 (Apple Git-154)

