Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73091224234
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 06:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789281127; cv=none; b=C0sQaL+2hDAmTtb1Zc/NHvgLafJCMH7nQVkDJqYDg/sfuOrLnmrIuLqZ4jKLj7CAIHVMjxYCPzQDAKDQK+skSdChFBlyNuYd0lhTaodG1Rh563hDuGkGjLDMz4x5gZq29cjAp6CqNX9ZxRjHQoGrY6y3Z8otg4Ud4v3CZrEwlnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789281127; c=relaxed/simple;
	bh=H4ETr6mwXUYrX8RAIMZz7ErNDPXTHuQ7d2Pd0f6oSws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g0f4tsE12y7IOC6h5LSl2AuG7eGg1Hyu2LY55MGDHldeGW2hCu+mfiHXsP89ujDur2NiBh+EqBKLrSXaWhewcP2jtKACkBqyJkQJ1ApFPV5LlWpDbL9G2ZprklCbS8cs5qU8HoD3CZfGJRir+An+8Yr5pRCrV6emGV+lFK9zMcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=opORQWCp; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="opORQWCp"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so1550437b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 23:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789281125; x=1789885925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EIS5RKlZgBWCHN8Ol/C+0jNYOT5tZB/4WMxwPWSV000=;
        b=opORQWCp+GqyypjOmQQmAI4LmM4fcYXniQVTdF+gT2Xt8Gs0GFRHSUTOH1jFTU1/7Z
         Y/3ZHwiWR1+7PplM9mEk8DnrrCTQ5IOKId43l08IHvYrm0eoZZvLVtgEKCDYoxDmvZb3
         E+cvaFZUeMc8UoIxTZNJWWvxh5zC3q3TqctE8K5mmPYeyVQUsVceUWN2b+Jo5FKNM0go
         k3OCCc1dqIcEr970GejCQ0Uc3NmxsdpCcrKcua7T1VYzXjMN+j3uGxhaCejCPdOAPYjU
         HxRWibm1gqztYHZCSWoAaZmbzSxc10q38mvyE422zlRmdoRdWXt6yFAbC7/CgOFV9fvh
         6ncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789281125; x=1789885925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EIS5RKlZgBWCHN8Ol/C+0jNYOT5tZB/4WMxwPWSV000=;
        b=PD9r46EdWz21tWFVMAX907LncklFWWuDmb9maYduPc60EggXWE5L534j04aFbwU5vy
         SuM+K8VoUcqF+5qKfoTsNvXh8CMUANirnBh2rUgJy+EamMircKW7e6ijMDBqiZQ6wMk/
         UqbiwyQVQSzHNwUF8VxXcnePSPr/iweAcbKa7vMA58JwhdmXrQi1tz5s4GUJy5oGC0RD
         6mzFVUPpkcFX6NEqKZ6h7QB8X8Z5zDnfYxN3g21JgdiK1w92+PttGkXFJL2CE24T5u2X
         Zzl7aKhcbF/ljsS12yme5L64pdlAgmgijuQJfVCWrK90Ytc/oSPHkS9ieGklw5zz+phr
         +dEw==
X-Forwarded-Encrypted: i=1; AKwUvBy6iMMxzWkhPKNCIftiQI7WFh8/OgbV8bxg09iIH6Ue8YQaiNwm4S5Bbai3e7DnEf2yYjdsJVB7xz7widg=@vger.kernel.org
X-Gm-Message-State: AFuF++lDK4JNFD3bnhJ/Pcqt+wf25vscY5kHq34ppG4IEeh4wbYT1OAr
	Big4Ugcx+agX0EPegqIMknNAqYOu2hPND8u9YbVyp7dIKYU7si5eYAg=
X-Gm-Gg: AYBFou1uINo9qpkZDjUrX7jpmmAsEwZal7wlxSyERQaDlCqFMC1uxFq06deVFN7Y0UL
	bLGmrXg7F7agEBExguA5Fr+XCis1/I8Fl0nebyVE/Z+mLDVT4NlLfDigS78I4kTUqjh0dVohwuC
	WtGuav04a7tN8YoNn/cVDrwT8TXfMgjglZNZ9cDdw0OtypGpehf4cnEWtRYrQRHeYzc0VZM2R0Z
	9bI02Cu0ojcpxoZKS0pjD94GcY0r4FYxJtDX/pR+2NXdi/fzBI608aG6hcC3VJWVhVcOvRzkCgT
	1QuGYNLhv7LYPXqXfpcMpmiAcJt5PGFik4aZMzqPP/tONEuMh7Lc/k8Q2jK+CHOgzfIEG4PTjN8
	iJyzwQO9EI2UQxk12EfGfxlPCnt+j18l6OeqqjDUTvK0K6HWNtZXxkkosOLWpN/8QlaN9GZFRCW
	nzchDxaZp/UazqFyIwHiT1e3ZuiCbQwcowWJx3JJaboSkwQw5diXm+YjEdZEnDbWX1JZuTQ21Tn
	9eha8EJi6kmTksZ8Ajke1Kx8PuCLQfTkFe+
X-Received: by 2002:a05:6a21:7314:b0:3da:ec28:2cc9 with SMTP id adf61e73a8af0-3daed3b990cmr22208557637.23.1789281124737;
        Sat, 12 Sep 2026 23:32:04 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:b91:ff81:c860:362e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6585f94sm3247894a12.25.2026.09.12.23.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 23:32:04 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	"Martin K . Petersen" <mkp@kernel.org>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Christoph Hellwig <hch@lst.de>,
	Adriano Cordova <adrianox@gmail.com>,
	linux-block@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v2] blktrace: fix the field offsets of the synthesized v1 record
Date: Sun, 13 Sep 2026 15:31:55 +0900
Message-ID: <20260913063155.708520-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

blk_trace_synthesize_old_trace() emits a classic blk_io_trace for the
binary trace_pipe output by copying 32 bytes from the ring buffer
entry's sector onward into a struct blk_io_trace. The entry is a
blk_io_trace2, and the two layouts diverge after bytes: v2 has a 32-bit
pid at 28 and a 64-bit action at 32, where v1 has a 32-bit action at 28
and pid at 32. Every field from action on lands one slot off, so a
consumer reads the pid as the action, the device as the cpu, and the cpu
as error and pdu_len.

The PDU comes from the wrong offset as well. The copy ends at v2 offset
48 + pdu_len while the PDU starts at 64, so for any event carrying one
-- BLK_TA_REMAP, SPLIT, UNPLUG_*, DRV_DATA, BLK_TN_MESSAGE -- the bytes
appended are the error, pdu_len and pad trailer rather than the PDU.

Assign each v1 field from its v2 counterpart and append the PDU from the
end of the v2 record, bounded by the entry size.

This applies on top of Adriano Cordova's "blktrace: always record ftrace
events as blk_io_trace2", <20260903202932.156278-1-adrianox@gmail.com>,
and needs it. Without that patch __blk_add_trace() still reserves a
48-byte v1 entry when the trace was set up by BLKTRACESETUP, and nothing
in the entry says which layout it has: magic and sequence are the ftrace
trace_entry header and neither writer fills them, and the two sizes
overlap, because a v1 record carrying a 16-byte BLK_TA_REMAP PDU is also
64 bytes. Removing the short entry is what makes reading the v2 layout
unconditionally correct.

Fixes: 4d8bc7bd4f73 ("blktrace: move ftrace blk_io_tracer to blk_io_trace2")
Link: https://lore.kernel.org/all/20260903202932.156278-1-adrianox@gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5
---
Note: this applies on top of Adriano Cordova's "blktrace: always record
ftrace events as blk_io_trace2" and is not correct without it -- please
apply it after his.

  https://lore.kernel.org/all/20260903202932.156278-1-adrianox@gmail.com/

v2:
 - Drop the iter->ent_size test v1 used to tell a v1 entry from a v2
   one. It cannot: a 48-byte v1 record carrying a 16-byte BLK_TA_REMAP
   PDU is also 64 bytes, so a v1 entry took the v2 arm and came out with
   every field from action on shifted and the PDU dropped. Caught by
   sashiko-bot, <20260913031030.E85191F000FF@smtp.kernel.org>.
 - Depend on the patch above instead, so no v1 entry reaches this
   function.
 - Drop the syzbot Reported-by/Closes. That report is the unbounded copy
   driven by pdu_len read past the end of a 48-byte entry, and his patch
   is what closes it; this one fixes the field offsets, a separate
   defect on the same line.
v1: https://lore.kernel.org/all/20260913025827.457116-1-donggeunyoo.kernel@gmail.com/

QEMU x86_64, origin/master 2f0c1cf72f46 plus his patch, one config and
one initramfs across all three arms. BLKTRACESETUP on a partitioned
virtio disk, blk tracer with options/bin, and a partition read for a
BLK_TA_REMAP with a 16-byte PDU. Binary stream decoded at v1 offsets:

  mainline    action 0x0811000f, pid 0x75, device 0x0fe00010, pdu_len 16
              and the correct PDU, then 8 bytes too many, so the next
              record's magic no longer lands on a boundary.
  v1 of this  action 0x75 -- the pid -- pid 0x0811000f, device 0, cpu
              0x00100000, error 0xd00f, pdu_len 0, PDU dropped. In sync,
              wrong.
  this patch  action 0x0811000f, pid 0x75, device 0x0fe00010, pdu_len
              16, the correct PDU, next record on the boundary.

Not exercised: the syzbot splat. iter->ent points into a ring buffer
sub-buffer page, so KASAN sees an over-read only when it crosses the
page end; 120 rounds over varying buffer sizes did not land it.
 kernel/trace/blktrace.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
index ae010969c144..875c04d86c93 100644
--- a/kernel/trace/blktrace.c
+++ b/kernel/trace/blktrace.c
@@ -1728,17 +1728,24 @@ static enum print_line_t blk_trace_event_print(struct trace_iterator *iter,
 
 static void blk_trace_synthesize_old_trace(struct trace_iterator *iter)
 {
+	const struct blk_io_trace2 *t = te_blk_io_trace(iter->ent);
 	struct trace_seq *s = &iter->seq;
-	struct blk_io_trace2 *t = (struct blk_io_trace2 *)iter->ent;
-	const int offset = offsetof(struct blk_io_trace2, sector);
 	struct blk_io_trace old = {
 		.magic	  = BLK_IO_TRACE_MAGIC | BLK_IO_TRACE_VERSION,
 		.time     = iter->ts,
+		.sector   = t->sector,
+		.bytes    = t->bytes,
+		.action   = lower_32_bits(t->action),
+		.pid      = t->pid,
+		.device   = t->device,
+		.cpu      = t->cpu,
+		.error    = t->error,
+		.pdu_len  = min_t(size_t, t->pdu_len,
+				  iter->ent_size - sizeof(*t)),
 	};
 
-	trace_seq_putmem(s, &old, offset);
-	trace_seq_putmem(s, &t->sector,
-			 sizeof(old) - offset + t->pdu_len);
+	trace_seq_putmem(s, &old, sizeof(old));
+	trace_seq_putmem(s, t + 1, old.pdu_len);
 }
 
 static enum print_line_t
-- 
2.53.0

