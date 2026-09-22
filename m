Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C01E3E51FF;
	Tue, 22 Sep 2026 08:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064839; cv=none; b=TYDgE9g0zdH4kFFGwRrKoFw9mqhobDfcItAiVMX5yIo8REMj2XlaHJMPzwToeR5qlu1T5hIa3Ln9nE7GTcoJsCOwzjGDmys94YyoOzF11u0aFdqBPJ5igVLDmLDxbaw+xB4jv6JTII18VWrYqr0AMx0TnHOvs+c0oiD7Y4Mb0WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064839; c=relaxed/simple;
	bh=4gXkdQy4Bdd93dMK4RXw8t3xfqUapZRTBFou4X2qdkw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=MmDtX11ErrU0Enj2uq0tzP8rUvkPHKxxgXlPus1TJT6MBsL9uguZBfSeIfO8UYWHwB9csviB3eo0hjNTso6FKWPPPFxwBDFN/X4NWm/Xx6j4Y8fdz3J6Og94LvV+nBAr9xdfZr02HBfExjFERxssajckYo/HcatuFltmnZThbMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HY2KOg4e; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OAEe5Mfu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HY2KOg4e";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OAEe5Mfu"
Date: Tue, 22 Sep 2026 08:13:53 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790064835;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7TMV1mieJG8KlNC/La7EAi767k2pjX0W55cws55W0Ic=;
	b=HY2KOg4ezjMKVsThjAeFxk710499lJrcE42WZw/Gsx4i1j5SXEFPbPo5J6cXYQq8g9BjIP
	edK4D4SYb9MjP2NGImKMvZWYWG5yO5MBqMn3ixbud87rewvi+qJmBYrjmv6OLw1en2coLK
	kZ9nMBMg7It1GH37ZUEUsC4nFlIU1gVNsuGZmvyXU2KTAh/B9jRikqFg+PgysAeWlvzZJj
	ze8zN2qX2f1t+oOJ9Wsr8JS0hdMfYYG7m71DMaO85CAI5sKrTAQYtnSaB0YUCpmL9UbPO0
	UwSpQbFE9cbIKNH2JzXWGkFe1/WXpeMMcBiimIJxfj21AikRHDRvQcPruE0UMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790064835;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7TMV1mieJG8KlNC/La7EAi767k2pjX0W55cws55W0Ic=;
	b=OAEe5Mfu4Ypat3yYbV3QHqqd3UhEQulND1rcP8EAHQVcbl70Kf6le+DMbgImsJllyZm4NS
	3nCUlIR7sDYdF9Dw==
From: "tip-bot2 for Thomas Huth" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/headers: Replace __ASSEMBLY__ with
 __ASSEMBLER__ in the <uapi/linux/sched.h> header
Cc: Thomas Huth <thuth@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260922064641.61120-1-thuth@redhat.com>
References: <20260922064641.61120-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179006483307.2819794.1535470533909108609.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     a9b3c7570564de40acb0998ab85c89d546b2122f
Gitweb:        https://git.kernel.org/tip/a9b3c7570564de40acb0998ab85c89d546b=
2122f
Author:        Thomas Huth <thuth@redhat.com>
AuthorDate:    Tue, 22 Sep 2026 08:46:41 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 22 Sep 2026 10:08:38 +02:00

sched/headers: Replace __ASSEMBLY__ with __ASSEMBLER__ in the <uapi/linux/sch=
ed.h> header

While the GCC and Clang compilers already define __ASSEMBLER__ auto-
matically when compiling assembly code, __ASSEMBLY__ is a macro that
only gets defined by the Makefiles in the kernel. This can be very
confusing when switching between userspace and kernelspace coding, or
when dealing with uapi headers that rather should use __ASSEMBLER__
instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
this confusion.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://patch.msgid.link/20260922064641.61120-1-thuth@redhat.com
---
 include/uapi/linux/sched.h                         | 2 +-
 tools/perf/trace/beauty/include/uapi/linux/sched.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/sched.h b/include/uapi/linux/sched.h
index 33a4624..19ffeba 100644
--- a/include/uapi/linux/sched.h
+++ b/include/uapi/linux/sched.h
@@ -53,7 +53,7 @@
  */
 #define UNSHARE_EMPTY_MNTNS 0x00100000 /* Unshare an empty mount namespace. =
*/
=20
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 /**
  * struct clone_args - arguments for the clone3 syscall
  * @flags:        Flags for the new process as listed above.
diff --git a/tools/perf/trace/beauty/include/uapi/linux/sched.h b/tools/perf/=
trace/beauty/include/uapi/linux/sched.h
index 33a4624..19ffeba 100644
--- a/tools/perf/trace/beauty/include/uapi/linux/sched.h
+++ b/tools/perf/trace/beauty/include/uapi/linux/sched.h
@@ -53,7 +53,7 @@
  */
 #define UNSHARE_EMPTY_MNTNS 0x00100000 /* Unshare an empty mount namespace. =
*/
=20
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 /**
  * struct clone_args - arguments for the clone3 syscall
  * @flags:        Flags for the new process as listed above.
