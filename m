Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD44B3D813C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790415964; cv=none; b=iV+pEOV2KTVys0TuZ9h5OiIsy8JEbdLGWdySnhtLT9Sug4VWJO9asB5h9gn34e5UVRHcGwR0Jjy24lOTGYrXpgSB/RGfZBOKpdtdYOFfE1N0zMM5vKZ/4Fu+4s33SW521J0tiI7W1BFsV8xz1SwIXmKvNGYTLQxDAWlcXDfA8XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790415964; c=relaxed/simple;
	bh=UH2A5NK9SgdrmzDfWv8ahzli7q0fuGF43H/u10D04xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gxvapKkeK7JNAwDqF2os6iw0cSJEWc454RHqoGX1L/aiHnIXnnghq/7M67+Gq6dhr6hXCJhtiNQZc71Ox8cVlFvLyV1Zm07NFO2NKTxbMUGE3KbmqptjTylCHDgBC8CafE8v0nlW5edOPgdvs8SoYIYKEtLtk4ksoOFuCganIb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ni7uPmgD; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ni7uPmgD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Zm
	hgy8VLcc991RdByPGcppYjL+AucZ6fnyr9HJ17QAw=; b=ni7uPmgDmyiXZHfoQZ
	9ZwandFI5jOmSh6G1TwOGz0KghPLdt1b9dVOomK+ITjbPbg4DMDk7SWFaeRtl4MM
	8UNWndZYjJDB4e2Ghbufns+NXIGEN1PhpBBgi3ytGmF0hMbP79IhdK/uS9/KW29Y
	v+pPI21L/UPxqbG6naZ6BS0PY=
Received: from wang-MACHR-WX9.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3j54hlLdqcWLHAw--.41710S2;
	Sat, 26 Sep 2026 17:45:06 +0800 (CST)
From: Wang Wensheng <wsw9603@163.com>
To: pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	linux-kernel@vger.kernel.org
Cc: wsw9603@163.com
Subject: [PATCH v2] printk_ringbuffer: Avoid needless read of prb_desc
Date: Sat, 26 Sep 2026 17:45:02 +0800
Message-ID: <20260926094502.251204-1-wsw9603@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3j54hlLdqcWLHAw--.41710S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw4rJrW8XrW7Kr1kGw4kWFg_yoW5Ww1rpF
	s3Ka9rKrWDu34rXr17uFy8ZF9xuan3A3yrXFWDZrWSvF1xtrWFqFnIvryFyF15JrWDAr12
	ywn0v3srAa1UZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi89NxUUUUU=
X-CM-SenderInfo: pzvzmliqt6il2tof0z/xtbC+QK1vWq3lCI56AAA3J

Since commit f244b4dc53e5 ("printk: ringbuffer: Improve prb_next_seq()
performance"), desc_read() allows @desc_out to be NULL. We can drop the
local `desc` variable in desc_reopen_last() and prb_first_seq(). Also
update the comment for desc_read().

v1->v2:
Update the comment suggested by John.

Signed-off-by: Wang Wensheng <wsw9603@163.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/printk_ringbuffer.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 85c0c854b3ce..d38e7c2f6887 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -439,13 +439,12 @@ static enum desc_state get_desc_state(unsigned long id,
 }
 
 /*
- * Get a copy of a specified descriptor and return its queried state. If the
- * descriptor is in an inconsistent state (miss or reserved), the caller can
- * only expect the descriptor's @state_var field to be valid.
+ * Get the state of a specified descriptor.
  *
- * The sequence number and caller_id can be optionally retrieved. Like all
- * non-state_var data, they are only valid if the descriptor is in a
- * consistent state.
+ * Optionally, a copy of the descriptor, sequence number and/or caller ID can
+ * be retrieved. However, (with the exception of @desc_out->state_var) all
+ * retrieved values are invalid if the descriptor is in an inconsistent state
+ * (miss or reserved).
  */
 static enum desc_state desc_read(struct prb_desc_ring *desc_ring,
 				 unsigned long id, struct prb_desc *desc_out,
@@ -1335,7 +1334,6 @@ static struct prb_desc *desc_reopen_last(struct prb_desc_ring *desc_ring,
 {
 	unsigned long prev_state_val;
 	enum desc_state d_state;
-	struct prb_desc desc;
 	struct prb_desc *d;
 	unsigned long id;
 	u32 cid;
@@ -1346,7 +1344,7 @@ static struct prb_desc *desc_reopen_last(struct prb_desc_ring *desc_ring,
 	 * To reduce unnecessarily reopening, first check if the descriptor
 	 * state and caller ID are correct.
 	 */
-	d_state = desc_read(desc_ring, id, &desc, NULL, &cid);
+	d_state = desc_read(desc_ring, id, NULL, NULL, &cid);
 	if (d_state != desc_committed || cid != caller_id)
 		return NULL;
 
@@ -2007,14 +2005,13 @@ u64 prb_first_seq(struct printk_ringbuffer *rb)
 {
 	struct prb_desc_ring *desc_ring = &rb->desc_ring;
 	enum desc_state d_state;
-	struct prb_desc desc;
 	unsigned long id;
 	u64 seq;
 
 	for (;;) {
 		id = atomic_long_read(&rb->desc_ring.tail_id); /* LMM(prb_first_seq:A) */
 
-		d_state = desc_read(desc_ring, id, &desc, &seq, NULL); /* LMM(prb_first_seq:B) */
+		d_state = desc_read(desc_ring, id, NULL, &seq, NULL); /* LMM(prb_first_seq:B) */
 
 		/*
 		 * This loop will not be infinite because the tail is
-- 
2.43.0

