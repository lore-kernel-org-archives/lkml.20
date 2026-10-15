Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912FD51C04B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071245; cv=none; b=AyrSzaMRweBAWVTw8CtzO50taxiR1HiXFEjYx/GOKN2anHHPUJjyHZSPMhRZgEUlrQT4TbIQw7VA10RcHw2RjCEZkKRPMxP8ZdQzST2YGJmm1j34I+w39iBd4HUHpQSB55txD6XDc1ipg1FsiQSnflbRYk5RvsEACf+LbV9EXlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071245; c=relaxed/simple;
	bh=Bma6ut+lIHPFylhYLl6jiyEJ4ay9QtOxps6ouBjOKIs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=qtpNELPoVqfsI+orV0QzTbIglzHkC7Aebi4v2m4IFRBV0itdZv8AucGPj/09pJEY0EEieciuzUaeUFGUKTxoe9RDvL3b7mRIQJGKhdWphY99Vs8IzI7kOAXE3VUuDi8/eP274qMiqa3dEupmnElRINhYDny9JrDsL0QCpfs3yR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LP/bjoss; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LP/bjoss"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05AD01F000CB;
	Thu, 15 Oct 2026 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792071244;
	bh=11m1xelGwRulo2WJfpiwGZ7vv7ZcFKzKRfQi0ZIGvP4=;
	h=Date:From:To:Cc:Subject:References;
	b=LP/bjossQgkcXxc23NE+N4oT0Sb8rqmzAlzPytiswa/j4OzssFFJGGbTccNorcyXS
	 /nVAd9yJKS4y4KqeRVl6o+xmShfcvUVLqcuUPQcMuKhLda148L6E9Palo61R528Nz2
	 Q6ZW5AcaaXmALX6jC7ccKyRLAx4g6Vpdu0kVJyanCYG7HGu8FahzV4dylDnR+XOGI6
	 VjHDn0jbD/pPnMU1UHokyf5WLbWXn08KMsqaUCj6RfBV+LzE09lgIAMVdYsREGbLyf
	 yoB/beF2m2CvgEjsxTIHllmMOiIOfTRIPMLkXM+/wllXcsUyha763Oc0MGjXj1QUE2
	 Ix4RZkqhk1eQQ==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHLat-00000000Mcj-1RqW;
	Thu, 15 Oct 2026 09:34:03 -0400
Message-ID: <20261015133403.155306547@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 15 Oct 2026 09:33:16 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 06/16] tracing: Fix empty symbol names in simple_ring_buffer undef check
References: <20261015133310.731003448@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Vincent Donnefort <vdonnefort@google.com>

Sparc64 emits empty symmbol names. Skips them when establishing the
allowlist and when extracing undefined symbols.

Link: https://patch.msgid.link/20260923074213.3077182-2-vdonnefort@google.com
Fixes: 1211907ac0b5 ("tracing: Generate undef symbols allowlist for simple_ring_buffer")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/all/5574c9e6-9ed2-4ee6-a2b2-fb6ee81e83a1@roeck-us.net/
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index f934ff586bd4..0e1846f7dda3 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -146,11 +146,11 @@ KASAN_SANITIZE_undefsyms_base.o := y
 
 UNDEFINED_ALLOWLIST = __asan __gcov __kasan __kcsan __hwasan __sancov __sanitizer __tsan __ubsan __msan \
 		      __aeabi_unwind_cpp __s390_indirect_jump __x86_indirect_thunk simple_ring_buffer \
-		      $(shell $(NM) -u $(obj)/undefsyms_base.o 2>/dev/null | awk '{print $$2}')
+		      $(shell $(NM) -u $(obj)/undefsyms_base.o 2>/dev/null | awk '$$2 {print $$2}')
 
 quiet_cmd_check_undefined = NM      $<
       cmd_check_undefined = \
-          undefsyms=$$($(NM) -u $< | grep -v $(addprefix -e , $(UNDEFINED_ALLOWLIST)) || true); \
+          undefsyms=$$($(NM) -u $< | awk '$$2 {print $$2}' | grep -v $(addprefix -e , $(UNDEFINED_ALLOWLIST)) || true); \
           if [ -n "$$undefsyms" ]; then \
               echo "Unexpected symbols in $<:" >&2; \
               echo "$$undefsyms" >&2; \
-- 
2.53.0
