Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582925;
	b=G9djv2Yr8D84eEhHpCr9oeRQWhNSr2w8FJGV9t+AOieQ0gQe8t1QugNwObIlaezIQ8CA
	 ELtNBptKlM/EqoOK4GsW6fZi9M5RYj1w5jZUKBdsEwGHx7ANz+GaCv0hShAbk7hYm6hYj
	 qRIGyO8umTFgZKiY6WxWKEU59yJaKLyLW/CY/B7X+yiOAVWIxeChnwvoj4u5PgJOv7ULJ
	 pVtEI53/EvpcuapVaLdC5C3JBDaa+NksuhYTLhIpWsDmHETunT22/jaomBVlVWHBUwR55
	 JEcGPQfJZE/9qHsfwYu6CSWtKxDn4VdCy7mf4TGUf6rdbk8Mm6a0wcmdkXETxvm0l1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582925;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7AQy591sW2qpmVT+yV9lxlyc42SglJ8EBrk/w5VU6/4=;
	b=hTRbgsfV80pG2f29A7PZdc1+3h9bUwjGSnKH7wleSHwR6LKJi6E4HYg8UDVMC2+71hgs
	 n0M0xCBylLU9r77KZa263lVonRgc42fD3vlP828ncvyx+iVOnOBhZJmIMIjWpLNy965Nr
	 huTXMt6OlPO7J5xL/pt+nqqGwSI9aXRegTPE/+zA0izJQSYuKDpA1QC1PI8VllzNqIxvy
	 QKnFOkXGLSAp5cyUH83xa1VpqOoju64X65St2ocQ8U4Mm8x7KLIwFWk0J72SAvgItsur6
	 Rrnya6fBkxHA/oduSDVGs0AnU4B/5PcIil8Fehm7rOc5R59xPP5WPJmI7KXe1Hrxc+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BObqSflQ;
	arc=none smtp.remote-ip=95.215.58.222
Received: from mta1.migadu.com (out-222.mta1.migadu.com [95.215.58.222])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A567606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A567606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BObqSflQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=64EUThuXFfGNpHT4ZZSg8kH8sluzCgH+OsnF24WjA1U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794582922; v=1; x=1795187722;
 b=BObqSflQ7aL/30m8sKY4vW97j+T0BNAzMlQfHqvc5P0FICgKRNY1pZ5LFkYx2DdtnVgZB9Sb
 fGpiSXWKf0Ty6aDIXgjHdOkqUVgceWtvwB/ovL2LCIwaINZnmEUbDoqM3rsUxWxIBz6EPIfOIC5
 /6tOP4EbkjGe0DtHSQE0fDXI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a63f21fb11cc9b35;
	Fri, 13 Nov 2026 15:15:21 +0000
X-Mizu-Trace-ID: a63f21fb11cc9b35
X-Migadu-Flow: FLOW_OUT
From: Leon Hwang <leon.hwang@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	Feng Tang <feng.tang@linux.alibaba.com>
Cc: Lance Yang <lance.yang@linux.dev>,
	linux-kernel@vger.kernel.org,
	Leon Hwang <leon.hwang@linux.dev>
Subject: [PATCH] lib/sys_info: avoid showing locks info twice in __sys_info
Date: Fri, 13 Nov 2026 23:14:51 +0800
Message-ID: <20261113151451.72419-1-leon.hwang@linux.dev>
X-Mailer: git-send-email 2.55.0
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

In __sys_info(), if the si_mask has both SYS_INFO_TASKS and SYS_INFO_LOCKS,
the locks info will be printed twice: debug_show_all_locks() is also
called inner show_state().

Since commit
8b2b9b4f6f4f ("hung_task: add hung_task_sys_info sysctl to dump sys info on task-hung"),
hung_task will print locks info twice when
sysctl -w kernel.hung_task_sys_info="tasks,locks".

[ 4658.894440]
               Showing all locks held in the system:
[ 4658.894445] locks held by khungtaskd/119: 1, last CPU#7:
[ 4658.894449]  #0: ffffffff9159cd00 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3b/0x1f0
[ 4658.894468] locks held by cat/674: 1, on CPU#8:
[ 4658.894472]  #0: ffffffffc01681a0 (dummy_mutex){+.+.}-{4:4}, at: read_dummy_mutex+0x34/0x80 [hung_task_tests]
[ 4658.894487] locks held by cat/676: 1, on CPU#8:
[ 4658.894490]  #0: ffffffffc01681a0 (dummy_mutex){+.+.}-{4:4}, at: read_dummy_mutex+0x34/0x80 [hung_task_tests]
[ 4658.894504] locks held by dmesg/677: 5, last CPU#8:
[ 4658.894507]  #0: ff426e3f828ee0a0 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read+0x34/0x40
[ 4658.894521]  #1: ff426e3f828ee128 (&tty->atomic_write_lock){+.+.}-{4:4}, at: file_tty_write.isra.0+0xaa/0x360
[ 4658.894535]  #2: ff426e3f828ee2c8 (&tty->termios_rwsem){++++}-{4:4}, at: n_tty_write+0x9d/0x4c0
[ 4658.894549]  #3: ff4fe07e82c57370 (&ldata->output_lock){+.+.}-{4:4}, at: remove_wait_queue+0x1b/0x60
[ 4658.894563]  #4: ffffffff927b1278 (&port_lock_key){-.-.}-{3:3}, at: uart_write_room+0x4e/0x230

[ 4658.894581] =============================================

[ 4658.894583]
               Showing all locks held in the system:
[ 4658.894586] locks held by khungtaskd/119: 1, last CPU#7:
[ 4658.894589]  #0: ffffffff9159cd00 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3b/0x1f0
[ 4658.894604] locks held by cat/674: 1, on CPU#8:
[ 4658.894607]  #0: ffffffffc01681a0 (dummy_mutex){+.+.}-{4:4}, at: read_dummy_mutex+0x34/0x80 [hung_task_tests]
[ 4658.894622] locks held by cat/676: 1, on CPU#8:
[ 4658.894625]  #0: ffffffffc01681a0 (dummy_mutex){+.+.}-{4:4}, at: read_dummy_mutex+0x34/0x80 [hung_task_tests]
[ 4658.894639] locks held by dmesg/677: 5, last CPU#8:
[ 4658.894642]  #0: ff426e3f828ee0a0 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read+0x34/0x40
[ 4658.894655]  #1: ff426e3f828ee128 (&tty->atomic_write_lock){+.+.}-{4:4}, at: file_tty_write.isra.0+0xaa/0x360
[ 4658.894669]  #2: ff426e3f828ee2c8 (&tty->termios_rwsem){++++}-{4:4}, at: n_tty_write+0x9d/0x4c0
[ 4658.894683]  #3: ff4fe07e82c57370 (&ldata->output_lock){+.+.}-{4:4}, at: n_tty_write+0x190/0x4c0
[ 4658.894697]  #4: ffffffff927b1278 (&port_lock_key){-.-.}-{3:3}, at: uart_write_room+0x4e/0x230

[ 4658.894713] =============================================

To avoid showing locks info again, check '!(si_mask & SYS_INFO_TASKS)'
when checking 'si_mask & SYS_INFO_LOCKS' in __sys_info().

Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 lib/sys_info.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sys_info.c b/lib/sys_info.c
index f32a06ec9ed4..750803012f43 100644
--- a/lib/sys_info.c
+++ b/lib/sys_info.c
@@ -147,7 +147,7 @@ static void __sys_info(unsigned long si_mask)
 	if (si_mask & SYS_INFO_TIMERS)
 		sysrq_timer_list_show();
 
-	if (si_mask & SYS_INFO_LOCKS)
+	if ((si_mask & SYS_INFO_LOCKS) && !(si_mask & SYS_INFO_TASKS))
 		debug_show_all_locks();
 
 	if (si_mask & SYS_INFO_FTRACE)
-- 
2.55.0

