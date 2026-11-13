Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588025;
	b=SFviDmL/5MbkN2c+JvDxRtIrmtJQRfim7DshTbF6mNO/eAc/uJRTuiJgV9VPog29W+yl
	 LUkUBTY9KYu/THrlF/YlXbVGw4SaT7QwMLCGWZV0U/oWdkeNCTFF7J2DSUC6Bxl2WHtaA
	 JI8Xtzu5RRRBKK9akVsV6LSdzMrY7NeKQt4EYpZjZVKeGLkwba5H+5M79oUKrt78+ALrO
	 TRLJ8V89GUPkgV8nzDDzFmZNCJrY0yP/kedJpu6UjtCkxz/VNbxJEyELzqEBgCkrErbmm
	 UV9yJvJvOuDoBQYHxnc2MGEwI6hyOClw6iYTuuEEyyrmPt4CnfGDZ4cDtsG49XiKi1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588025;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CTmDdK4yx/ilBj706jmlBng+CnRv/oAeImnEyV1mTDE=;
	b=A34xf9rJ4GQlAzzSb7KpKuFphynIDJvBW2pi5kZuK0tHR7uJdHsiesU0DCdTF2Hqr0HU
	 CvYrVkb9ZoK7bdgYCsucvzF77/xSO8uTHYqw6Jrma8lplr8gbuK01XlqGAqBffA0BcjMh
	 2/9Tmzkc9voQraha+7vKNK3yElEp2LoATIyGWL7Noa14PjntppW6LiFISXc3r1BPhmUw7
	 tqU7fbdL7yrwDhq7/GY+cn922sgowXghRh6Vp5sTqAjB6NLpbl+bn2in49x27Ha0OEqB/
	 Shz2eWjDmoTNwU6ExkzmdNBHQn2DUSuqGZyh2kRuD+yu6kahsz9kAeBBe/R2ivjLs3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RTbQLs7E;
	arc=none smtp.remote-ip=95.215.58.161
Received: from mta1.migadu.com (out-161.mta1.migadu.com [95.215.58.161])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E37460A5BC7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E37460A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RTbQLs7E
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7CNWPeLUqQA2aSfveUaT7AuouQXnQ2KqxlObNJOr9Qs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794588023; v=1; x=1795192823;
 b=RTbQLs7E0ZdJfaTVJVET66FjLoBu2zMtue+cgThMgjwcdgCTSAkoRJW/btnpoE29I8F5Uf6c
 SdC6cp5fsE0VrNXUZ1HnY7EciS60bZ+slKGHkvaJj/e6PEftM/C1RDBskyiB/CHAVq5nTVN3X3s
 k9NAXOdeIGVWMlIwsifx9Veo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 71419fe01abb6ea8;
	Fri, 13 Nov 2026 16:40:22 +0000
X-Mizu-Trace-ID: 71419fe01abb6ea8
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: leon.hwang@linux.dev
Cc: akpm@linux-foundation.org,
	feng.tang@linux.alibaba.com,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/sys_info: avoid showing locks info twice in __sys_info
Date: Sat, 14 Nov 2026 00:40:11 +0800
Message-ID: <20261113164011.31104-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261113151451.72419-1-leon.hwang@linux.dev>
References: <20261113151451.72419-1-leon.hwang@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Fri, Nov 13, 2026 at 11:14:51PM +0800, Leon Hwang wrote:
>In __sys_info(), if the si_mask has both SYS_INFO_TASKS and SYS_INFO_LOCKS,
>the locks info will be printed twice: debug_show_all_locks() is also
>called inner show_state().

Good catch!

>Since commit
>8b2b9b4f6f4f ("hung_task: add hung_task_sys_info sysctl to dump sys info on task-hung"),
>hung_task will print locks info twice when
>sysctl -w kernel.hung_task_sys_info="tasks,locks".
>
>[ 4658.894440]
>               Showing all locks held in the system:
>[ 4658.894445] locks held by khungtaskd/119: 1, last CPU#7:
>[ 4658.894449]  #0: ffffffff9159cd00 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3b/0x1f0
>[ 4658.894468] locks held by cat/674: 1, on CPU#8:
>[ 4658.894472]  #0: ffffffffc01681a0 (dummy_mutex){+.+.}-{4:4}, at: read_dummy_mutex+0x34/0x80 [hung_task_tests]
>[ 4658.894487] locks held by cat/676: 1, on CPU#8:
>[ 4658.894490]  #0: ffffffffc01681a0 (dummy_mutex){+.+.}-{4:4}, at: read_dummy_mutex+0x34/0x80 [hung_task_tests]
>[ 4658.894504] locks held by dmesg/677: 5, last CPU#8:
>[ 4658.894507]  #0: ff426e3f828ee0a0 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read+0x34/0x40
>[ 4658.894521]  #1: ff426e3f828ee128 (&tty->atomic_write_lock){+.+.}-{4:4}, at: file_tty_write.isra.0+0xaa/0x360
>[ 4658.894535]  #2: ff426e3f828ee2c8 (&tty->termios_rwsem){++++}-{4:4}, at: n_tty_write+0x9d/0x4c0
>[ 4658.894549]  #3: ff4fe07e82c57370 (&ldata->output_lock){+.+.}-{4:4}, at: remove_wait_queue+0x1b/0x60
>[ 4658.894563]  #4: ffffffff927b1278 (&port_lock_key){-.-.}-{3:3}, at: uart_write_room+0x4e/0x230
>
>[ 4658.894581] =============================================
>
>[ 4658.894583]
>               Showing all locks held in the system:
>[ 4658.894586] locks held by khungtaskd/119: 1, last CPU#7:
>[ 4658.894589]  #0: ffffffff9159cd00 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3b/0x1f0
>[ 4658.894604] locks held by cat/674: 1, on CPU#8:
>[ 4658.894607]  #0: ffffffffc01681a0 (dummy_mutex){+.+.}-{4:4}, at: read_dummy_mutex+0x34/0x80 [hung_task_tests]
>[ 4658.894622] locks held by cat/676: 1, on CPU#8:
>[ 4658.894625]  #0: ffffffffc01681a0 (dummy_mutex){+.+.}-{4:4}, at: read_dummy_mutex+0x34/0x80 [hung_task_tests]
>[ 4658.894639] locks held by dmesg/677: 5, last CPU#8:
>[ 4658.894642]  #0: ff426e3f828ee0a0 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read+0x34/0x40
>[ 4658.894655]  #1: ff426e3f828ee128 (&tty->atomic_write_lock){+.+.}-{4:4}, at: file_tty_write.isra.0+0xaa/0x360
>[ 4658.894669]  #2: ff426e3f828ee2c8 (&tty->termios_rwsem){++++}-{4:4}, at: n_tty_write+0x9d/0x4c0
>[ 4658.894683]  #3: ff4fe07e82c57370 (&ldata->output_lock){+.+.}-{4:4}, at: n_tty_write+0x190/0x4c0
>[ 4658.894697]  #4: ffffffff927b1278 (&port_lock_key){-.-.}-{3:3}, at: uart_write_room+0x4e/0x230
>
>[ 4658.894713] =============================================
>
>To avoid showing locks info again, check '!(si_mask & SYS_INFO_TASKS)'
>when checking 'si_mask & SYS_INFO_LOCKS' in __sys_info().
>
>Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
>---
> lib/sys_info.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/lib/sys_info.c b/lib/sys_info.c
>index f32a06ec9ed4..750803012f43 100644
>--- a/lib/sys_info.c
>+++ b/lib/sys_info.c
>@@ -147,7 +147,7 @@ static void __sys_info(unsigned long si_mask)
> 	if (si_mask & SYS_INFO_TIMERS)
> 		sysrq_timer_list_show();
> 
>-	if (si_mask & SYS_INFO_LOCKS)
>+	if ((si_mask & SYS_INFO_LOCKS) && !(si_mask & SYS_INFO_TASKS))
> 		debug_show_all_locks();

LGTM, thanks!

Reviewed-by: Lance Yang <lance.yang@linux.dev>

> 
> 	if (si_mask & SYS_INFO_FTRACE)
>-- 
>2.55.0
>
>
