Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71940511205
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467416; cv=none; b=TBgwQGcwTgg1e5nrLb2/FvgdkJ74FsauDCpS5IEGqweoSHtpC8GrkpRJItaB9E+UkmPvSzlTU7380qEbcSsK7pc3drY8nhp0skkF2twxwzK0Jghh1cI4O/sDIC02khJcwM+6uS2xgxKX0UwG03p+kBM9sjg2p6U5ow9A2R84QZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467416; c=relaxed/simple;
	bh=BpRN0E+h4206Xe8hsUbO3Z8TKNOEgNlJgNv/rQ/udFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ucgZ8/Oc2Y22uNCneoy0WXun1Aqp7CSWS8tbFBkTRVYu+tk1xdd1spwTZ9TrCrbSo+74xScf28VV7OPVDCEiIu7vp7g17lNhV4cOBqG+M+RSYqBZ+oJYOdEWKibEsBL1rjEoJgScdLebjqxL5TRFOMDBNaeH3Xzft+AFoBb2pUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZ5Xfmok; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZ5Xfmok"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-784980b88acso122206137.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467399; x=1789072199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5h3C3ueW/KtTzkUQ4MiM5kplP4HGSznat6sPB/kFpg=;
        b=rZ5Xfmok/DURfKZiJV+SRNLFsaRWx+95jdAXkOk1dl69ZKKKBm6K8vBN7B6ZdMQQM1
         YL26/F1VzK3eOpId3MGEYzjOqEUxu6YPyjroF/Qz/CVDfBiphnYIVLjq4a7rdI3Y9IzN
         VVY84q3jG0E4PP5Bj7u1YeawgETSYZM9SdPkTpKamnONVKJOO9WS9vaxQrpz6n1a0GBJ
         RSjRlKfrg+Ogc5II0rWIoVXVKUSRuOj69+mZlxIsafUTvsyqGyOTZcpW4MQNZMg0AbGh
         O0wDgJIMeWGkuSE8I2zKWpJv1qRLOSvL7lTip+o5+1rijbKx91lCc0N56i7wfteZrz8V
         GWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467399; x=1789072199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5h3C3ueW/KtTzkUQ4MiM5kplP4HGSznat6sPB/kFpg=;
        b=KKBLHMdqurzgl19eysp6gad+e93xA89EMFqZ3vfA8JbIiIYH32C9eewuxJtlNxm6mw
         sjY1dFQD+19OO/n/Dm0ICTXAd3ZPahhjGGWGX3veHnknBnvUa+duonFZRwjBwl9VGP/h
         m/JSiXYFGD0PfOLoKOg9DutLoWGUOXTJe7gE3LNJ3GZ9fy61xbn4e6aRlK3OL7gBlcbO
         HNUZ3aplZADnWjWs4tk6/B/OUK5gnVotslykT6m120l7kEC1nTFfqpcOkp8KkrNhy36S
         b03nnN8b7cFAPYCRf5gTIvzLkS9MEt9rgeIKyaOdnaszBMnsFhaaU4n1z+u5O8naia5G
         9iRg==
X-Forwarded-Encrypted: i=1; AKwUvBwPgq+3NfcSjX5eaNWNKxIVR7onBWb5wRN7RMHX2z591xr/XHG2mCKZBRTvftIUpoDBqFLxBKc0ogtB4AA=@vger.kernel.org
X-Gm-Message-State: AFuF++kGA25c9VjmWw51wI46b/fwcdpy0m9Xq7FRRX09QYOmeY/F6cGl
	HPyP86T/TqupXLVXPRj7Dj1IlH5KV+rLZorOAGo9jKxiF0KfBdVwoh5F
X-Gm-Gg: AYBFou3Pqk7CG0hKKpEPhutSx4QZCEVqqIAZF31uPM1W5vmQHNEoxEgrvp/KojLrd0g
	uRL8wj9FbFvQdkD26oq8FByJMI6OoACxSibaWeGQ7OssUYH80iMHdoDdjgDYBk0Ud75Hj5nDEX5
	zlPm89DyuE0n474FRIq5RePmAJs8hEopMMAjCpdlJixqGr34S4mo1J98cCo40yUxAPcmsjkBDoo
	/uylNFgXfOZrIi7zK5If95xvoJcvjFBkVNYmm5xBPCqkJjcmPxK/yiVq6S8BESI5inFybUuVtvV
	URq4u73H7PU/keZeoqDkyElvKlajPBZyYqQgqlAzdYdsVVL31WCUoH2AVmqOU20zrmgYBJsb0Fw
	gq8ZqmZHOC1sJPmmzWuv5lPOZhvMm751tua03gZpZjPQ7qkGsIsFaY7aSDHJI4kwr03NlKedsMV
	EhEst+qQ5X0RiAX24otfmVX1iCkRj5eXGxMgz+YJGgalQqYkAtT1Iuy6sC33D4eSI=
X-Received: by 2002:a05:6102:5487:b0:77a:2268:9fdb with SMTP id ada2fe7eead31-78a4a995f6cmr108164137.7.1788467398516;
        Thu, 03 Sep 2026 13:29:58 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed7018fsm253962241.6.2026.09.03.13.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 13:29:58 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>,
	syzbot+4dfd96209d744263a972@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] blktrace: always record ftrace events as blk_io_trace2
Date: Thu,  3 Sep 2026 16:29:32 -0400
Message-ID: <20260903202932.156278-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ftrace ring buffer always uses the v2 (blk_io_trace2) format, but
__blk_add_trace() switched the reserve size and record format on
bt->version. That field only describes the relay/classic blktrace record
format and must not change what goes into the ftrace buffer: the ftrace
readers (print_one_line() and friends) unconditionally parse blk_io_trace2.

The BLKTRACESETUP ioctl sets bt->version to 1. With the blk tracer also
enabled, __blk_add_trace() recorded a 48-byte v1 event into the ftrace
ring buffer, but the reader parses the 64-byte v2 layout, so pdu_start()
points 16 bytes past the PDU and blk_log_remap() reads out of bounds - a
use-after-free when the ring buffer page is resized concurrently.

Always use the v2 format in the blk_tracer path, and initialize
bt->version to 2 in blk_trace_setup_queue() so the sysfs-enabled path no
longer leaves it uninitialized.

Fixes: e48886b9d668 ("blktrace: for ftrace use correct trace format ver")
Reported-by: syzbot+4dfd96209d744263a972@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=4dfd96209d744263a972
Tested-by: syzbot+4dfd96209d744263a972@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 kernel/trace/blktrace.c | 74 +++++++++++------------------------------
 1 file changed, 20 insertions(+), 54 deletions(-)

diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
index 8cd2520b4c99..ae010969c144 100644
--- a/kernel/trace/blktrace.c
+++ b/kernel/trace/blktrace.c
@@ -385,66 +385,26 @@ static void __blk_add_trace(struct blk_trace *bt, sector_t sector, int bytes,
 	if (blk_tracer) {
 		buffer = blk_tr->array_buffer.buffer;
 		trace_ctx = tracing_gen_ctx_flags(0);
-		switch (bt->version) {
-		case 1:
-			trace_len = sizeof(struct blk_io_trace);
-			break;
-		case 2:
-		default:
-			/*
-			 * ftrace always uses v2 (blk_io_trace2) format.
-			 *
-			 * For sysfs-enabled tracing path (enabled via
-			 * /sys/block/DEV/trace/enable), blk_trace_setup_queue()
-			 * never initializes bt->version, leaving it 0 from
-			 * kzalloc(). We must handle version==0 safely here.
-			 *
-			 * Fall through to default to ensure we never hit the
-			 * old bug where default set trace_len=0, causing
-			 * buffer underflow and memory corruption.
-			 *
-			 * Always use v2 format for ftrace and normalize
-			 * bt->version to 2 when uninitialized.
-			 */
-			trace_len = sizeof(struct blk_io_trace2);
-			if (bt->version == 0)
-				bt->version = 2;
-			break;
-		}
-		trace_len += pdu_len + cgid_len;
+		/*
+		 * The ftrace ring buffer always uses the v2 (blk_io_trace2)
+		 * format; the ftrace readers parse only that. bt->version
+		 * describes just the relay/classic blktrace record format.
+		 * Recording a v1-sized event here would shift pdu_start() 16
+		 * bytes past the PDU and make blk_log_remap() read past the
+		 * event (a use-after-free on concurrent buffer resize), and v1
+		 * cannot represent the newer 64-bit zone actions anyway.
+		 */
+		trace_len = sizeof(struct blk_io_trace2) + pdu_len + cgid_len;
 		event = trace_buffer_lock_reserve(buffer, TRACE_BLK,
 						  trace_len, trace_ctx);
 		if (!event)
 			return;
 
 		tracing_record_cmdline(current);
-		switch (bt->version) {
-		case 1:
-			record_blktrace_event(ring_buffer_event_data(event),
-					      pid, cpu, sector, bytes,
-					      what, bt->dev, error, cgid, cgid_len,
-					      pdu_data, pdu_len);
-			break;
-		case 2:
-		default:
-			/*
-			 * Use v2 recording function (record_blktrace_event2)
-			 * which writes blk_io_trace2 structure with correct
-			 * field layout:
-			 *   - 32-bit pid at offset 28
-			 *   - 64-bit action at offset 32
-			 *
-			 * Fall through to default handles version==0 case
-			 * (from sysfs path), ensuring we always use correct
-			 * v2 recording function to match the v2 buffer
-			 * allocated above.
-			 */
-			record_blktrace_event2(ring_buffer_event_data(event),
-					       pid, cpu, sector, bytes,
-					       what, bt->dev, error, cgid, cgid_len,
-					       pdu_data, pdu_len);
-			break;
-		}
+		record_blktrace_event2(ring_buffer_event_data(event),
+				       pid, cpu, sector, bytes,
+				       what, bt->dev, error, cgid, cgid_len,
+				       pdu_data, pdu_len);
 
 		trace_buffer_unlock_commit(blk_tr, buffer, event, trace_ctx);
 		return;
@@ -1913,6 +1873,12 @@ static int blk_trace_setup_queue(struct request_queue *q,
 
 	bt->dev = bdev->bd_dev;
 	bt->act_mask = (u16)-1;
+	/*
+	 * This sysfs-enabled path feeds the ftrace blk tracer, which always
+	 * uses the v2 (blk_io_trace2) format. Initialize the version so it is
+	 * never left dangling as 0 for future consumers.
+	 */
+	bt->version = 2;
 
 	blk_trace_setup_lba(bt, bdev);
 
-- 
2.51.0

