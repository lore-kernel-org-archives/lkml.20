Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146A74C77C8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790058403; cv=none; b=lBmIdhnTfep01oNAQWgDq/aGEPiHJ1/bjsTSfSqCkcpGIeOgFHb9pmtwuhfR7nfFC+xm+gQc3vvfuido/dZ7RY3SE0h7zdtgKm3Z9p24s/9Yn9rendHdgjoOCB//rv8bmfLaWK5qsWoo/8wpMv5u5OsnmAX0QcvWdA5aKQ1bG1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790058403; c=relaxed/simple;
	bh=BmDfjV5U8Q/dGbavXGe5D/dQfPTztZ/W+SpM+Hv93Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UVKspfTuO7QufPKTOOD2GFZbEkvj3ZpdL/8EslIHgQ2ABYe/w0Hc+BQB3/XD1SUO/PWIsa9ufup8cmzZWRRYgLAf8UWQSjWNMzIAwDXLq7AD4M8c/UOaSyvaqh6sHuyTeZFDFQdkRsPRueoAi00DJT8OhyI+iuD4lpdyP0PniJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cyodkQVm; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cyodkQVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ne
	+YDeBeBLmZ5HVMnxArvXwI5LD0u5tZg4h/rvcJthA=; b=cyodkQVmIXB+eDUASB
	7kkMUjP5Y+UUmN34ki/SgE9GZuOOSWNG+1GF/iT4ZWiidl6UOx9Pn+rPNV+KaeNZ
	kiNb2CaduoeDe2ZTQBF+2pjsTlK5o7rIgVDEHL69XgCSUm6GY5uZJqYbE0noVZTe
	kwuIEpmx2IwJHOjfymlDkKeT0=
Received: from wang-MACHR-WX9.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgB37E96H7Jq1OMEAw--.34383S2;
	Tue, 22 Sep 2026 14:26:05 +0800 (CST)
From: Wang Wensheng <wsw9603@163.com>
To: pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	linux-kernel@vger.kernel.org
Cc: wsw9603@163.com
Subject: [PATCH] printk_ringbuffer: Avoid needless read of prb_desc
Date: Tue, 22 Sep 2026 14:25:20 +0800
Message-ID: <20260922062520.248439-1-wsw9603@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgB37E96H7Jq1OMEAw--.34383S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur1Utw15Jr17JFW7CF15Jwb_yoW5Jr4rpr
	s3Ka9rKr4kZ34rXr17uFy8ZF9xu3Z7A3yrWa4DZ3ySvF1xtr4Fq3ZFvryFyr15GrWDAr9I
	y3s0939rAa1jvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pirOzxUUUUU=
X-CM-SenderInfo: pzvzmliqt6il2tof0z/xtbC3h0uNmqyH314CgAA3T

Since commit f244b4dc53e5 ("printk: ringbuffer: Improve prb_next_seq()
performance"), desc_read() allows @desc_out to be NULL. We can drop the
local `desc` variable in desc_reopen_last() and prb_first_seq(). Also
update the comment for desc_read().

Signed-off-by: Wang Wensheng <wsw9603@163.com>
---
 kernel/printk/printk_ringbuffer.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 85c0c854b3ce..607666d37455 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -443,8 +443,8 @@ static enum desc_state get_desc_state(unsigned long id,
  * descriptor is in an inconsistent state (miss or reserved), the caller can
  * only expect the descriptor's @state_var field to be valid.
  *
- * The sequence number and caller_id can be optionally retrieved. Like all
- * non-state_var data, they are only valid if the descriptor is in a
+ * The sequence number, caller_id, and desc can be optionally retrieved. Like
+ * all non-state_var data, they are only valid if the descriptor is in a
  * consistent state.
  */
 static enum desc_state desc_read(struct prb_desc_ring *desc_ring,
@@ -1335,7 +1335,6 @@ static struct prb_desc *desc_reopen_last(struct prb_desc_ring *desc_ring,
 {
 	unsigned long prev_state_val;
 	enum desc_state d_state;
-	struct prb_desc desc;
 	struct prb_desc *d;
 	unsigned long id;
 	u32 cid;
@@ -1346,7 +1345,7 @@ static struct prb_desc *desc_reopen_last(struct prb_desc_ring *desc_ring,
 	 * To reduce unnecessarily reopening, first check if the descriptor
 	 * state and caller ID are correct.
 	 */
-	d_state = desc_read(desc_ring, id, &desc, NULL, &cid);
+	d_state = desc_read(desc_ring, id, NULL, NULL, &cid);
 	if (d_state != desc_committed || cid != caller_id)
 		return NULL;
 
@@ -2007,14 +2006,13 @@ u64 prb_first_seq(struct printk_ringbuffer *rb)
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

