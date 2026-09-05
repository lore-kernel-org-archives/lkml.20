Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2199F3019BA;
	Sat,  5 Sep 2026 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788597842; cv=none; b=tOwZzR3cQtkWEb8n6VeTklt6cpoOvYZ5nuB6orHquLI7wVc/CwZOWYlUkz33R3Cushj9u+464c+0kJhlbO1XXlMLMvxaBVNpjfqoLW++VFur5MXwp4Sih3QMPNYoGP8K0QETLvVpiyBy3AxZQianAk3MEczrrUrPOq8MDLnn/X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788597842; c=relaxed/simple;
	bh=HVNpsjgWPfTAAu+WJ2hwLLqU8d9wbqtfNZgvk7cmuFQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Iy+39JF0vwpbF8Ke6cOUn0ba0XPJIsPf3GwzdfWgSSgT+kbQJ1n8B9BcmtwSZpPS31XOETvPH9AYwiKtotSgW4IZ/EMOwav4AKhegP0JOYrtrEwJARl0CsFlVzLaBtumUdcHUbBQ8W/4QiGOqdGUx6tO3v+aOIX6vfsvsE9Ct9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n45UFJeb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n45UFJeb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0590B1F00A3D;
	Sat,  5 Sep 2026 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788597840;
	bh=TqHxrurdJhNzBV3eFI/kHdibDuBoPuJBWEjFN7cWhls=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=n45UFJebFtAjpDIOQvQV6ILE4X7MHItuVnpyCO6mUMJT8AXVeHMpqd0snSOdXyDoC
	 zzU9B/7atWIOLzsPiAei1sXp+RPDcxNsLQp3/HNA7p2/qia6Y7iAOodsD0tPVWfiFn
	 Rd364Le1+++FmU/fQ5K1ezV1jAbMWMnpTPnLAIFuVLH2SAoOWE/202b4OzCkDDk03E
	 vnhgebbCWxSLAMCbCL9agEzksRK33yvkS81CY5FaIqId45H6KHo2fh9gxSEmr1Byz9
	 sGZd7nGrfZYKmt81BTe9QERcbQmkH/TJ6XI34/347HOhyPu9nWX7pcvFFd+CwQuqUL
	 6PZlcWRna20YQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-riscv@lists.infradead.org
Subject: [PATCH] entry: Guard syscall_enter_audit() invocation with
 CONFIG_AUDITSYSCALL
In-Reply-To: <875x0k7i9k.ffs@fw13>
References: <202609031938.ZvZZaRQy-lkp@intel.com> <87wlt29k5v.ffs@fw13>
 <aprKt3OlFvdQN5w+@rli9-mobl> <875x0k7i9k.ffs@fw13>
Date: Sat, 05 Sep 2026 10:43:57 +0200
Message-ID: <87tso45bqq.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

A bunch of older cross compilers notably RISCV64 and S390 fail to eliminate
the dead code when CONFIG_AUDITSYSCALL=n. The code in question is:

     if (unlikely(audit_context())
     	syscall_enter_audit(regs);

and in case of CONFIG_AUDITSYSCALL=n:

  static inline struct audit_context *audit_context(void)
  {
        return NULL;
  }

which should make the compiler eliminate the syscall_enter_audit()
call. But a RISV64 GCC12 cross compiler translates that into:

        if (unlikely(audit_context()))
    1c34:       00000097                auipc   ra,0x0
    1c38:       000080e7                jalr    ra # 1c34 <.L785>
    1c3c:       c511                    beqz    a0,1c48 <.L787>
                syscall_enter_audit(regs);
    1c3e:       8526                    mv      a0,s1
    1c40:       00000097                auipc   ra,0x0
    1c44:       000080e7                jalr    ra # 1c40 <.L785+0xc>

and then claims in the failing link:

   include/asm-generic/preempt.h:54:(.noinstr.text+0x1a20):
	undefined reference to 'syscall_enter_audit'

which is obviously hallucination.

Add an explicit IS_ENABLED(CONFIG_AUDITSYSCALL) check into the condition to
cure this compiler madness.

Fixes: 6f25517010dd ("entry: Rework syscall_audit_enter()")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/oe-kbuild-all/202609031938.ZvZZaRQy-lkp@intel.com/
---
 include/linux/entry-common.h |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -102,7 +102,14 @@ static __always_inline long syscall_trac
 	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT))
 		trace_syscall_enter(regs);
 
-	if (unlikely(audit_context()))
+	/*
+	 * The config check works around broken compilers which fail to
+	 * eliminate the dead code in case of CONFIG_AUDITSYSCALL=n as they
+	 * insist on creating a always false runtime condition based on
+	 * audit_context() which returns NULL in that case. The explicit
+	 * IS_ENABLED() check makes that madness go away.
+	 */
+	if (IS_ENABLED(CONFIG_AUDITSYSCALL) && unlikely(audit_context()))
 		syscall_enter_audit(regs);
 
 	return true;
