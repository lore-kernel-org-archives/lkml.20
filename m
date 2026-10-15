Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848B251A722
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071245; cv=none; b=lV7PB8hWPeU1jX2Xu4Yf0tdnHTYNhMvzm09GCw9F2RspvvQzRSdiPiCCIkXjMXYrNApAtzQro7amCStNkP0PHhBy3rBdSlrCQyvbFf6ijEqm6bd9iWQ8cZoa4Hzx0XFLAp5cCAJrk72btHSLHkhIVT8hcCMKr/Oeuw2tS6kkTn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071245; c=relaxed/simple;
	bh=WCD2n/2+3bhUZwAYLWmoHqc8fEGZWl66sj35ydmf5M8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=rZj2nFY77Ey3pFg5064McFll0rKg3BLRAEldB5rH0H2vL6n0yi4iXaDN+t986A+8HNUNsFJ9+DZwZNiu/7jz3N8wx5sUGi4n33DBVrOb6doi1lZmP98tuHgm/TFiIoRJjAQaTDZlZ1kboZm/jBt7/tPzMtI7V46ejzjOI5/a7I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFbcNgbs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFbcNgbs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6490C1F000CC;
	Thu, 15 Oct 2026 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792071244;
	bh=DjKzbWi5QfjSbzGE6O0t3Rga+rFRhEnzhGR/VdPNEjU=;
	h=Date:From:To:Cc:Subject:References;
	b=NFbcNgbsbo/phffm1BCPSQobmg9BsJgxoAAKtk/+ZAAruY64i9tQI6rrGX5k2Who6
	 3VyAaoOZirmW45RCf9BFeofXoYHGmnfCgUzo0DTh4nICvWCXw3ERNowm+MoEaXmsV5
	 4OgtOVk8eA513x0io7rjecxjwvbBYLozzM+NQzYLWnYd4V+gm/SlIFmOrfdI7JVqLu
	 bNo5Nint89lrpoETYsPTZThg+E85Zsx39Fj9dWA9lTK7rFSTgGPyc0DkYLa/+3SnkB
	 CHRXvfA6V8mD1eRqQSfuqyaS3AeMBM8Sipir1WZvTE9df/KaC/i3nIvkTAjnRYY9/J
	 bRvEfX1pIRHaQ==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHLat-00000000Mdr-3CrP;
	Thu, 15 Oct 2026 09:34:03 -0400
Message-ID: <20261015133403.580663910@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 15 Oct 2026 09:33:18 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 08/16] tracing: Fix simple_ring_buffer undef check on sparc64
References: <20261015133310.731003448@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Vincent Donnefort <vdonnefort@google.com>

simple_ring_buffer relies on headers that end up including
<asm/thread_info.h>. On sparc64, this emits the undefined symbol
current_thread_info_reg. Allow this symbol.

Link: https://patch.msgid.link/20260923074213.3077182-4-vdonnefort@google.com
Fixes: 1211907ac0b5 ("tracing: Generate undef symbols allowlist for simple_ring_buffer")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/all/5574c9e6-9ed2-4ee6-a2b2-fb6ee81e83a1@roeck-us.net/
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index 0e1846f7dda3..3860bc53a4be 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -146,6 +146,7 @@ KASAN_SANITIZE_undefsyms_base.o := y
 
 UNDEFINED_ALLOWLIST = __asan __gcov __kasan __kcsan __hwasan __sancov __sanitizer __tsan __ubsan __msan \
 		      __aeabi_unwind_cpp __s390_indirect_jump __x86_indirect_thunk simple_ring_buffer \
+		      current_thread_info_reg \
 		      $(shell $(NM) -u $(obj)/undefsyms_base.o 2>/dev/null | awk '$$2 {print $$2}')
 
 quiet_cmd_check_undefined = NM      $<
-- 
2.53.0
