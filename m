Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7284B404B;
	Fri, 18 Sep 2026 10:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726175; cv=none; b=fMWUUyPgzsY7egEVZheEO01c52uumcgbtOM8F7R9VjAfuOwVU0VGm+IB4l9Jcz9p99TKnylSrjI5t7pQdOETYuHlJbXyKkP1WLWqIh/NgWAYbo7WKep6lICZkxbAiVjUC1V3b8cwJE4J7cyZHqMoD5HPYhsGhvoOV0l7pOYURsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726175; c=relaxed/simple;
	bh=s35/1GGALqBw0aT2d53MqCWSCAL/qtzIa00XAAwtfrk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ddo4/tOGwBuXV+uH8+/lG4yNU9Jq7GeeBeQPYA2fYcty+sHp+agd5WAIzMOUnFk9lG8PQmow6d7NdgZ6lXwoSjRCAXQNv54NcpYmZ855r8MPNpv8oLVuetXirmlp3deyjXXN3rH6NUuE1Yo698E84PAFXUkQ+1P2Po7gDPtb1uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YybMATPK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eq9Qs9Pd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YybMATPK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eq9Qs9Pd"
Date: Fri, 18 Sep 2026 10:09:22 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726164;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Mi9u5KRPFLMrVg0dCwYdoTTzTudG+maOTwgj6dlfPQ=;
	b=YybMATPK2zGH7/WiQOTGu9Ja5Il5/QcLgwbAWC13XieZ/dLqpGANI5U6dgbBEEUCKEg/xK
	vBBNchDk8L+K6CdABM1h57lpxEyWY9raYtE1o/5dMzA11nihC3qdmCDHtdPzAYtINOGrvu
	N2AbO/vjLsZRw5SDzDTgRtjQ3byecCpDHLKkOu/LO03W7uKbmpdrzxqzrMs5vp3vdEazTo
	xh3Gi7m/D9N5BNvnH6IDr8S4msCQhlFkUl6+MEqQGOqp5VtHChtE5KpjDCfC/Hs2jCun+0
	bpTn/iMU11QqsogrNcuAHJ1WCga0PpyZpAoPW7gttnN54xOPQf8/3NJRA9b5qg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726164;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Mi9u5KRPFLMrVg0dCwYdoTTzTudG+maOTwgj6dlfPQ=;
	b=eq9Qs9PdC4r3SKETN9gvmumRasa+sjCg9rTJ3OKRasnDZmNytZh/gvNVZ3xJHsn0UrPRAv
	5qO/rqjeuTcxuWDQ==
From: "tip-bot2 for Ulises Mendez Martinez" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/urgent] objtool: Validate disassembler headers in
 libopcodes probe
Cc: Alice Ryhl <aliceryhl@google.com>,
 Ulises Mendez Martinez <umendez@google.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260904150710.2997558-1-umendez@google.com>
References: <20260904150710.2997558-1-umendez@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972616263.1720534.1273749146212540867.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/urgent branch of tip:

Commit-ID:     7e61560628d17ea6b1d8ee370f6d42694cff8758
Gitweb:        https://git.kernel.org/tip/7e61560628d17ea6b1d8ee370f6d42694cf=
f8758
Author:        Ulises Mendez Martinez <umendez@google.com>
AuthorDate:    Fri, 04 Sep 2026 15:07:09=20
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Sun, 13 Sep 2026 18:15:43 -07:00

objtool: Validate disassembler headers in libopcodes probe

commit 3f2de814c059 ("objtool: Fix libopcodes linking with static libraries")
tested for libopcodes availability by linking a test snippet with a forward
declaration of disassemble_init_for_target().

However, testing symbol linkage with an extern declaration only verifies
the presence of the library (.so/.a) and bypasses checking for development
headers (binutils-dev). On systems where libopcodes is present without
development headers installed, the probe succeeds, enabling BUILD_DISAS.
Subsequent compilation of objtool then fails:

  fatal error: 'bfd.h' file not found
    113 | #include <bfd.h>

Additionally, the probe invokes $(HOSTCC) without $(HOSTCFLAGS), ignoring
any sysroot or include flags specified for the host compiler.

Fix this by including <bfd.h> and <dis-asm.h> directly in the test snippet,
passing $(HOSTCFLAGS) so host compiler options are respected, and defining
PACKAGE=3D"objtool" to satisfy the configuration check in <bfd.h>.

Fixes: 3f2de814c059 ("objtool: Fix libopcodes linking with static libraries")
Fixes: 436326bc525d ("objtool: fix build failure due to missing libopcodes ch=
eck")
Reported-by: Alice Ryhl <aliceryhl@google.com>
Assisted-by: Antigravity:Gemini-Next
Signed-off-by: Ulises Mendez Martinez <umendez@google.com>
Link: https://patch.msgid.link/20260904150710.2997558-1-umendez@google.com
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index a4484fd..4cc2e75 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -89,9 +89,11 @@ LIBOPCODES_LIBS :=3D $(shell \
 		    "-lopcodes -lbfd" \
 		    "-lopcodes -lbfd -liberty" \
 		    "-lopcodes -lbfd -liberty -lz"; do \
-		echo 'extern void disassemble_init_for_target(void *);' \
-		     'int main(void) { disassemble_init_for_target(0); return 0; }' | \
-			$(HOSTCC) -xc - -o /dev/null $$libs 2>/dev/null && \
+		printf '%s\n' \
+		       '$(pound)include <bfd.h>' \
+		       '$(pound)include <dis-asm.h>' \
+		       'int main(void) { disassemble_init_for_target(0); return 0; }' | \
+			$(HOSTCC) $(HOSTCFLAGS) -DPACKAGE=3D'"objtool"' -xc - -o /dev/null $$libs=
 2>/dev/null && \
 			echo "$$libs" && break; \
 	done)
=20
