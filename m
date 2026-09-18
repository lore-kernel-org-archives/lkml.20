Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D334570FA;
	Fri, 18 Sep 2026 10:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727894; cv=none; b=djKNR0nNgN9XLicv0Pros6UlpBrD8RWURZfcnzIRnQk1RhkQ/VJSgaxG9jojm7LybD4HZf7m1iWlZDrAKl8XNI4en7Ic6CsMgcfZ830U0873BMxWigXCGmxIAGDwX25LvI1Atm2FduLNDaOpCU91dQy/ZImIjgSzcdfjtbpdSoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727894; c=relaxed/simple;
	bh=Hbz3iUIfu8I3jQOOaWIfQPqk05oJc+6CmwVzeWhfjTY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=k2ME4QmruCLsm2FBaNFc2Vm6bXosUV/JK387Zpfm4TP6MmZB8YJYnAIimS/fD/hh2aUNWNs29TYbW9TI7gQlmXV4buQBBEL6byKPJN0wq/AOyLD23soh5XyyBZlA49fy7MENljCyUSqm3iPWIfXcFgsuvOs6MdOZnk26V5PfPyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y/4EiKcv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=O9Gf9fhd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y/4EiKcv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="O9Gf9fhd"
Date: Fri, 18 Sep 2026 10:38:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789727890;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LXylCdqoY6qr4PTB6vFlIis3dLgBZxMavbrb14GsttQ=;
	b=y/4EiKcvok0ph9qgNof30SNqyZPAEcS+CJzTe0iBfVKFyRjPomFUrAls/sSDyfpdKswvq/
	ui3lLgIs0vwwWX4/51OV0KGR+Bf6OdpkEtvGkrMQ5YpQUBDVbUh7hCpYUkD4GP6wAqGlKV
	ZGeOkQdbMT1eJfbtgo9pdu0vUFR+8zWMCkeAqrX/SFtqOYj8fKEk15nXlpqCbaj3+Ab3Fu
	69si0HY1LmyMH/Kceev9BBMV55crAsK13kZ2aj79OUT8vQe68vJZgPFgFJbbQAD0V9vcEs
	77JJntRk98h9KsxKd/N4WQ9f/Mx53A//tibU5UNkPJF8zLHbVen0B7Hs5E3lhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789727890;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LXylCdqoY6qr4PTB6vFlIis3dLgBZxMavbrb14GsttQ=;
	b=O9Gf9fhdJ0hJvXa1dV96866zmmAY8ruOrRtFOxV3tQyPoqTwIBo76JfIAoMe5Xe7Adm+ah
	c+IpbqOyelEhOrCA==
From: "tip-bot2 for Matthew Schwartz" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/fred: Reconstruct the #GP context for rejected
 INT instructions
Cc: Paul Gofman <pgofman@codeweavers.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260917230907.2080792-2-matthew.schwartz@linux.dev>
References: <20260917230907.2080792-2-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972788835.1720534.5881481172472606767.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     93f53499d0b945e8ae447f497faf743d60069f61
Gitweb:        https://git.kernel.org/tip/93f53499d0b945e8ae447f497faf743d600=
69f61
Author:        Matthew Schwartz <matthew.schwartz@linux.dev>
AuthorDate:    Thu, 17 Sep 2026 16:09:06 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 18 Sep 2026 12:33:17 +02:00

x86/fred: Reconstruct the #GP context for rejected INT instructions

FRED event delivery does not use the IDT, so the gate DPL check that
rejects a user INT n falls to software (Intel FRED specification [1],
section 8.3). fred_intx() rejects the same vectors as IDT delivery, but
reports a zero error code and the IP after the INT. This breaks the
signal ABI. Wine uses the error code to recognize INT 0x2d, so the
changed context turns a handled breakpoint into an access violation in
Elden Ring.

Rewind IP using the instruction length in the augmented SS and
synthesize the IDT selector error code, (vector << 3) | 2. Set RF in the
saved flags, as the CPU does for a #GP fault. Section 5.2.1 defines the
saved vector, instruction length and RF state. The supplied length
handles prefixes without reading user memory. Limit the changes to
already-rejected software interrupts, preserving the accepted INT3, INT4
and enabled INT80 paths and hardware exceptions. With IA32 emulation
disabled, INT 0x80 now reports the same #GP as the DPL 0 gate IDT
installs there. The rewound IP also stops fixup_iopl_exception() from
inspecting the byte after the INT.

Also clear the software event flag. Section 6.2.3 specifies that ERETU
with this flag and TF set traps before executing any user instruction. A
tracer that suppresses SIGSEGV and resumes with TF set expects the next
instruction to run first, as after IRET. The sigreturn path clears the
same flag for this reason in prevent_single_step_upon_eretu().

[1] Intel Flexible Return and Event Delivery (FRED) Specification,
revision 9.0 (346446-009US), sections 5.2.1, 6.2.3 and 8.3.

Fixes: 14619d912b65 ("x86/fred: FRED entry/exit and dispatch code")
Closes: https://gitlab.freedesktop.org/mesa/mesa/-/work_items/15745
Closes: https://gitlab.freedesktop.org/mesa/mesa/-/work_items/16132
Reported-by: Paul Gofman <pgofman@codeweavers.com>
Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: H. Peter Anvin <hpa@zytor.com>
Link: https://cdrdv2.intel.com/v1/dl/getContent/678938 # [1]
Link: https://patch.msgid.link/20260917230907.2080792-2-matthew.schwartz@linu=
x.dev
---
 arch/x86/entry/entry_fred.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/x86/entry/entry_fred.c b/arch/x86/entry/entry_fred.c
index fb3594d..854899b 100644
--- a/arch/x86/entry/entry_fred.c
+++ b/arch/x86/entry/entry_fred.c
@@ -10,6 +10,7 @@
 #include <asm/desc.h>
 #include <asm/fred.h>
 #include <asm/idtentry.h>
+#include <asm/processor-flags.h>
 #include <asm/syscall.h>
 #include <asm/trapnr.h>
 #include <asm/traps.h>
@@ -71,7 +72,15 @@ static noinstr void fred_intx(struct pt_regs *regs)
 #endif
=20
 	default:
-		return exc_general_protection(regs, 0);
+		/*
+		 * Reconstruct the #GP fault state that IDT delivery would produce.
+		 * Clear the software event flag so ERETU with TF set does not trap
+		 * before the resumed instruction. See prevent_single_step_upon_eretu().
+		 */
+		regs->ip -=3D regs->fred_ss.insnlen;
+		regs->flags |=3D X86_EFLAGS_RF;
+		regs->fred_ss.swevent =3D 0;
+		return exc_general_protection(regs, (regs->fred_ss.vector << 3) | 2);
 	}
 }
=20
