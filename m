Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744176;
	b=dsLKuq1pkMzUvd5aE9dWBOggJi3wmLhtbcZlh6TdDuYOOoYeDzY0sDgZpCneOtWSNIwA
	 LjsOS6HaYzBTmj03jlBSxFCjSOEkn9hyXzal1y6z0xwVP6G59twbC1EWMgZpFCvVxF/vj
	 LUFa2FI8YCcpPRsWEvxLRnf+WCichDFcScsORJsPOXVM0CUOZnWnGyp1bVcIAvRZ5hX9I
	 LEbO8qfaygHqxf2fgbH/pqbVHBe0yb3XtTk2Z0oOX9wXqGUwRIJrrfJxEov/kT0lRJWf+
	 mRZz6Izsuz1ZeeZ5PR1UOWrmp5L3mRe47XWMwSO9gIfTxKLnhoxTK+VjWJxaZ08sKFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744176;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=zQhASDOLNWCYZbbeXaQ7+mEuVmEL3e7UOmkqC/kQG0U=;
	b=SE0sBA9en5hTbHxaAQth/WBGAdo4oH5pOFpuJKA90KOOKT3jkZv/KDLJa5RsNJD8Dlsv
	 lLKhlVaqGBdEWYAXteBuRRmvCq6ZNiURXDgvKo0ZF6UDpXXGJEw125buvpVlY+SQgphLi
	 XF5m6SA/czO74+npF+fdfTCHoMv+nD+NcfJEeIvVA02+6MG47I7oOoXpu/9s4Z9uXMlrS
	 m3/csSYdFFroB/Wdd2kneNCPPCp7KNhtX5ya6MX+3eFcADb8iMs9xi85ZvBLy3ctALvJM
	 XZue1uPWOz6593EMrJ24irEm55U/njLH+DPAeAPe+L8jb6Kb8JqGwgdhGui4EzvJm4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xi69WWci;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB15C606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xi69WWci
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2563D1F000C4;
	Sun, 15 Nov 2026 12:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794744176;
	bh=zQhASDOLNWCYZbbeXaQ7+mEuVmEL3e7UOmkqC/kQG0U=;
	h=Date:From:To:Cc:Subject;
	b=Xi69WWciRbJrAgEtC4BuMLmXtP6z5BEHe8I0W/LO7cPaxxjn6/5Aoo8QNOB+fCEgU
	 spsO43ADAfZ4LPngz3Bj0u2fVnIpbFfzuIZIGSlSRyMUm8dYmt9JFPHYaQPWDkH6Im
	 HMLwunlQ1xjS33V3BmOpikoqLIjTX8xAEs3diEb/MC0LC5dYJKXTCffLuiX1y8v+Q1
	 OCwW0WRl56mThs3l0C1nI8KT9DonfNRSLOtlSDcOfMNghss8YMXma+ONYKisKRtvjD
	 3nsyVC8el2Y1yuUMA0Jk00qPJqZmvcU63DtusdstB3Nvne17eOFIFtUWJKUa2nZ2k7
	 GcbiBDFgDNlzw==
Date: Sun, 15 Nov 2026 13:02:51 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [GIT PULL] core/urgent fixes
Message-ID: <avmfa9udOnu4gFmp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest core/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core-urgent-2026-11-15

for you to fetch changes up to efe191f1605a149b06eb0fe1ff975e7d3137c9bb:

 - Two generic syscall entry code fixes for return code
   data type definitions. (Florian Bezdeka)

 Thanks,

	Ingo

------------------>
Florian Bezdeka (2):
      entry: Fix return type of syscall_trace_enter()
      entry: Complete syscall_enter_from_user_mode_work() to bool migration


 include/linux/entry-common.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index fa2854fed1f2..15278416f886 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -62,7 +62,7 @@ void trace_syscall_enter(struct pt_regs *regs);
 void trace_syscall_exit(struct pt_regs *regs, long ret);
 void syscall_enter_audit(struct pt_regs *regs);
 
-static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsigned long work,
+static __always_inline bool syscall_trace_enter(struct pt_regs *regs, unsigned long work,
 						long syscall)
 {
 	/*
@@ -202,7 +202,7 @@ do {									\
 									\
 	instrumentation_begin();					\
 	local_irq_enable();						\
-	long _ret = syscall_enter_from_user_mode_work(regs, syscall);	\
+	bool _ret = syscall_enter_from_user_mode_work(regs, syscall);	\
 	instrumentation_end();						\
 									\
 	_ret;								\
