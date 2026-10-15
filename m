Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AB951992F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071245; cv=none; b=FiNH4W9A2l7yXx+kTh5B1SZxPPVfKQfIJmkVnXxGdr171KQJopjZO1dio/EZD2FhGI2NvWIbRjYzC26oAKYJpym0IfL9V6pt70Eh0pTAkE8h9Eln+u60XeSGjdThkCEgSjuTT30brFsPDY19PeC3bYGG0z9pMf3x45NpUPTVYYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071245; c=relaxed/simple;
	bh=H22pMAj5FiNys53DaMXak/U2WiYZOBUZfF77Z+pPOwQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=kcRTj0/8QexEh24eHi7OJ2GCrPOwSWJZHhgr9NLNMgseMzNlnTiC1noumgPlWIk/uVGg67MwP5LWDtmxv7dDLiHLww4aaUA2IAmVRTs1MqpOTiHQPXCzeiv2SSEZIoP9la2/NInSyWCZBbln2dz+AWSZb56kmkPRSA/xxKGZGDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4hhOEki; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4hhOEki"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A361F000CA;
	Thu, 15 Oct 2026 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792071244;
	bh=ANtwYDA0L5TyVSz9dXD3XljmTUB/zboBLunCtqBHSeE=;
	h=Date:From:To:Cc:Subject:References;
	b=B4hhOEkia0kxyc8l/NT5qkh7LH9St9QnzEIp7gFUv5/HnNBaS5hhAl98rbz0aHeBj
	 VUk7mdBAekdK2vu4frh8mwo7s311sQxuUcvuNEbGupq3PT6s16fgsMVkI58nlxEXl0
	 rqP0x8FumrYPh4WVYa1HXk7D98C20sNOvngx8kPGGUThophbvGpFwdc1rpIEXFW7Hq
	 ewO1i672DD+V6o/ulN1dJHwXxmL09ONv5bJW3J3PHLaD3GbECJ5g+jovq3lHbRtbif
	 HxA3jCNzJhFW61NcovtFIikKcyTivRo01KGJooCJ4uL/8sY56qft/n3wde6mshg5eY
	 kCjM/NlFnC4dA==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHLat-00000000MdI-2Ky1;
	Thu, 15 Oct 2026 09:34:03 -0400
Message-ID: <20261015133403.364511757@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 15 Oct 2026 09:33:17 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 07/16] tracing: Fix simple_ring_buffer undef check on parisc
References: <20261015133310.731003448@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Vincent Donnefort <vdonnefort@google.com>

simple_ring_buffer uses local_set() and cmpxchg() on unsigned long. Add
them to undefsyms_base.c to extend the allowlist for the parisc
architecture.

Link: https://patch.msgid.link/20260923074213.3077182-3-vdonnefort@google.com
Fixes: 1211907ac0b5 ("tracing: Generate undef symbols allowlist for simple_ring_buffer")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/all/5574c9e6-9ed2-4ee6-a2b2-fb6ee81e83a1@roeck-us.net/
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/undefsyms_base.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/undefsyms_base.c b/kernel/trace/undefsyms_base.c
index e65baf58e6ff..37310baf706b 100644
--- a/kernel/trace/undefsyms_base.c
+++ b/kernel/trace/undefsyms_base.c
@@ -9,6 +9,7 @@
 
 #include <linux/atomic.h>
 #include <linux/string.h>
+#include <asm/local.h>
 #include <asm/page.h>
 
 void undefsyms_base(void *p, int n);
@@ -18,11 +19,13 @@ static char page[PAGE_SIZE] __aligned(PAGE_SIZE);
 void undefsyms_base(void *p, int n)
 {
 	char buffer[256] = { 0 };
-
 	u32 u = 0;
+
 	memset((char * volatile)page, 8, PAGE_SIZE);
 	memset((char * volatile)buffer, 8, sizeof(buffer));
 	memcpy((void * volatile)p, buffer, sizeof(buffer));
 	cmpxchg((u32 * volatile)&u, 0, 8);
+	cmpxchg((unsigned long *)p, 0, 8);
+	local_set((local_t *)p, 8);
 	WARN_ON(n == 0xdeadbeef);
 }
-- 
2.53.0
