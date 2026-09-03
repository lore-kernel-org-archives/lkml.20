Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2474F4724
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466127; cv=none; b=NP3TCW+cWNm91K1TpFTq6DnEfv2MymRMMG9+Za4JJDbjEsK5cCzXm4iTgpClG/yimrQD7lrdQqJU36DZnq7Jo+o67/zNCCkMwTsxGQO6fcgzBw8rcM7jyGEenShDzoHr/aKfjwBesuL+NX1hjlJLtSfc3GH2WgXvgp23xSyHejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466127; c=relaxed/simple;
	bh=hsrgcgU9CZNuY0+VZvpv/GXeh+OPQpXqePsOLlbif7E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Gc3DYx3Al4GNSgce/WeVrFKeN9NXvriR+WR6rYcG3tewjGbX00FoL8X9VXASCzvotOTRfxfZbwBI4LKBQJUXS8BUYMPTbW0IVcgrKGXJE/ZMBOacZrmdlJ+P+OFH1zmm9VKCyQXMR3qsqB13obrcdw8+LFXVdVI3k8rbRucS5GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b352d9062fso237449eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466108; x=1789070908;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VnMzAUyte/LPqtrh3wboPC3T/dDvfiZgFPOrJVHL5rY=;
        b=R6z2aWQ3BSxle5t+zXWjKr0PuAbyIvQk1Lv9tGvk0yCFB2cFs2EtxmovbiuyVG2GUn
         +LvPNG24ILKDhu/e1hx3Eajo883xPUkhHAMkQAAJT8EQdj3nFr3ntPpn+cxpPTBc87eB
         v0AUk8BD2sZivPHtRyrUrwPXtoIp6Jc+4yzP0OOnqTv27awQYhfdl11cSab/z7CX1R2i
         PDa2zNT5d8NfGWvWyGtgs2jbEJHynZ33OVhAT5MeTGYoeP/sb+Am1PTFwvaPfcoCldKM
         Vr2vYqmXc6n0yto4/banrZi9QifHdZAooEQGyN5AaIa+v80v1bQ1JFJyHiBCdDzB3Dnn
         MUMw==
X-Gm-Message-State: AFuF++mzJjQsH1E/MuVrNSUv6hbGXBUr/HBYbMWs7A5YkTMXZlsQRF9s
	U1E5SODeYtJbobdFa/IOfSqPygHceBU7KKEUbgDHeudSfpxIMrERpyYDAXMqVzF3qUXLmKp07gP
	rp+f8qW+VzgPTNNjWhuBc9myh7rryMAgkn5SrMe+hnaC95Jwr8NYP61vnhqg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4c84:b0:6b1:8780:70fe with SMTP id
 006d021491bc7-6b6f98d1493mr1231975eaf.2.1788466108549; Thu, 03 Sep 2026
 13:08:28 -0700 (PDT)
Date: Thu, 03 Sep 2026 13:08:28 -0700
In-Reply-To: <6a917b28.4d659fcc.734b4.001e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a99d3bc.9266084e.bf0d7.027a.GAE@google.com>
Subject: Forwarded: [PATCH] blktrace: always record ftrace events as blk_io_trace2
From: syzbot <syzbot+4dfd96209d744263a972@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] blktrace: always record ftrace events as blk_io_trace2
Author: adrianox@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
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

