Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395850;
	b=r8xHFRmM6DAb1HC+PJfHHYVDV6q3ClhjBV583oqM9P9WjghlpjVyR90PXtVUNs+L2Q1F
	 rtQ2VML4W4kG/OFPS0NNyAKELW4/lbGvzG/xTilIbR95OTIUaPGeauWWFuNGis/lS3Ysi
	 JuUV7jqvJy0qen8h8+yXZVDzTzBXbeow4pyUrG6ZxIev49gWLgrs9LXcss8Rg3tgo19Ry
	 nKAWJ5uYgpWr9N0NNwO0FojBiC685xIDmRzhVk3u/ewK32E/uijK+EZFF6NT2nLIaSL7I
	 zz6On1iioKB5Vs7irvobZtNnCA3eE0gp3nk0MW/nvZrXlEwPhf+lm6zklpVtcns4tPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=kSfbC2+mf7pLRYYOsFaYSilY48BYbZvDABBLiRafnd0=;
	b=MCzlW0lcTvuwJx0auAxppz1qP5DTIOtjG6KVFryownoFRayQFASfS+XeQSAGSOW51geJ
	 sMia38FAaLqF+zdpPko8Lt3a1fa8dyWsjNzCpEcO2uqbsl+r02DIjcna0+1cYti1LEvS+
	 qgP3aektwzERICzFZH5mixEIInz/T6JaELPm6BsT9JXujtBF7srkc/LAEj1XcoBYDked1
	 jxz7BW2WcnCF2Wj+YPsY43Crpi8clOd5u+sqkvjsUF/fXTK13UZTN7kmJbXU/YvxRDPQ5
	 8cdQ9RL+4ud4CCCxb8JYL/EUzgdPXgYypUfNFNn5zTT8TmI8lKvNjM5nJBCtcRBTbOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Clz9SMno;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BB0606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20BB0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Clz9SMno
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-497614c95f0so1652523f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395848; x=1795000648; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kSfbC2+mf7pLRYYOsFaYSilY48BYbZvDABBLiRafnd0=;
        b=Clz9SMnogMbfMQgLBtu+nfo9Y3/b15Q5GNXmjPlMFpK1Cjp5r10QQkFlenazwm+XNK
         cDu36Xu0cHHoRFWDmi2jofInp5wFIHtnMioHi/1dRtD6CQ2gHVVuYrokxJtGiBGAE/2x
         Szbrfu0Xv4crls5ErwH9J3SyVBQj46aowJe1QQ3gBfgK8g3xWU69AyKDrkJJE/40WLBA
         1OoRsyp/QlTv0O4tkUbEhlt4oKJPHDae+cd69BsWv4w/TU+4qJUktJy3hkmnEu5D4C7v
         RoOkrOUffm0nu5Po9+zfvIy4aS+yC9Zue2ocigPG8KE1nH16Pej1aTanycbdbzhF9Ss9
         ImxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395848; x=1795000648;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSfbC2+mf7pLRYYOsFaYSilY48BYbZvDABBLiRafnd0=;
        b=lSipseK5IKob+97Mx3mQnb587kUy3RCC7Qc3A3dhkr4kfPEBbSUdXv8fAy/mOb2/aa
         EJ81Ojg8B8K72enNlTkuJSLbA+1iPn5ZVhFV+90xrjM2jvHoUSNaD8ITLkRzD5SE6hHW
         9yekvIRl1jGNlTlHRutp2ShRum8fEhjsHfBc8mCp/lngy05I55SN/ZJvL9ek6/wkYEmr
         /yWrOpucwKT6WBp669+hX2OM+nbqMTMw3wUzCa0HrCzcGNycG1C7iY8jeyqeCmmivse6
         rKjVU9br7veIu3rXh0Og9UtaxAa+iTVcZdbkF6XEbrHaKdr4SXMrGOTfwk55KdP20RYD
         LdZw==
X-Forwarded-Encrypted: i=1; AL+hErFRdWLLqMESRVr2lilPi495gojGGY75cdss5aa0ssq4kgfzU5AmC/nl8t7JWZZTzP4afHxRmUUBCLIakFY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nT01hcrKrtfYhW4XL6HJqRo64UgpH1hlRPuYQmEcJhXlwjyfX
	HdCYPk7N03Ll/rWSKbpzjU8lSyncNk+aDt/u3t6xemeBR6MPqBgAtjR1kOlEJeE3FQ==
X-Gm-Gg: AYBFou1x+HFWPl43OSSeSTeYpuMPR/7XUikja9jb5f7qtO0bZYexrGZxTmFYEUTuirY
	HtRLsvqtufahIExgN0Oti226DHjtCq8r0ayjfX83b2TatdNfsbXfnvHYV1mG3VlJahew1e19s/l
	1WecuHt1eokLJii9VEyQaASXvkLqXbWhuLEP4gRHi+c4hwknGQYc2ez+q6+cU8zABDSKXqCFYiZ
	KHnXyVk74PADabjfxKQp3JaDpTKAwnMV+8GaQ498WrksRjn9rsQkWEr2xJJkMSPu2DU/DeflUto
	067UIdOTnvmP2NQ3Ee6xQqcaKSbNlN1V92nF41gLCv925JDFTXYBjNi2Chk87ySxcnVPrtOJS0s
	8ofod373dCyVOwmCCYDlh8YLJHDvI6TrrHVipGG/4RsHql9BbqUiyuohoIGJUfysYaGuu15p0tJ
	V8ExsS3ihC14xV2lH4eTBarF/VwxUHbpNvnxD7cTqFkkPydQOn1pjvAI4JGImb40G6T7aY7Racx
	VZMrvraG8qlZnDQnqttDRoVqJIOqVDJQgSJuP0kj8+EVUnIT4ZzbrVtsxlTpdiYnfyGZCz4iJxu
	emqSIs0ROSriGNGA2nf1MtWne2z01Z0lBeYxm1nxOF81L6kD6WDRwd7EKf7V+bTJYPD3U4GAZ20
	=
X-Received: by 2002:a5d:6f0e:0:b0:48d:f3a4:a6aa with SMTP id ffacd0b85a97d-499c7ef52a0mr3257287f8f.35.1794395847822;
        Wed, 11 Nov 2026 03:17:27 -0800 (PST)
Received: from elver.google.com (124.100.205.35.bc.googleusercontent.com. [35.205.100.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835e20327sm10917417f8f.26.2026.11.11.03.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:17:26 -0800 (PST)
Date: Wed, 11 Nov 2026 11:17:22 +0000
From: Marco Elver <elver@google.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 00/14] Stop lockdep_assert_held*() from assuming lock
 ownership
Message-ID: <avROwpyToVNLOolq@elver.google.com>
References: <cover.1793654853.git.bvanassche@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="kN9fNHIrqDuj/ERC"
Content-Disposition: inline
In-Reply-To: <cover.1793654853.git.bvanassche@acm.org>
User-Agent: Mutt/2.3.2 (2026-04-26)


--kN9fNHIrqDuj/ERC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2026 at 01:34PM -0800, Bart Van Assche wrote:
> Hi Peter and Marco,
> 
> Since commit 7c451541743c ("lockdep: Annotate lockdep assertions for
> context analysis"), lockdep_assert_held*() and lockdep_assert_in_rcu_*()
> not only verify at runtime that a lock is held but also instruct Clang
> context analysis to assume that the lock is held. This has the following
> disadvantages:
> - These assertions silence context analysis warnings in functions that
>   lack a __must_hold*() annotation. Hence, the compiler neither reports
>   the missing function annotation nor checks at compile time whether
>   callers hold the lock.
> - lockdep_assert_held() makes context analysis assume exclusive lock
>   ownership, even if a reader-writer lock is held in shared mode.
> - lockdep_assert_held*() can only be used with lock types that are
>   defined with context_lock_struct().
> 
> This patch series removes the context assumptions from the lockdep and
> RCU assertion macros and introduces separate macros for code that needs
> to inform context analysis that a lock is held:
> - lockdep_assume_ctx_held() and lockdep_assume_shared_ctx_held().
> - lockdep_assume_in_rcu_read_lock(), lockdep_assume_in_rcu_read_lock_bh(),
>   lockdep_assume_in_rcu_read_lock_sched() and
>   lockdep_assume_in_rcu_reader().
> Unlike the __assume_*() macros, which only inform context analysis, the
> new lockdep_assume_*() macros also verify the assumption at runtime.
> 
> This patch series is organized as follows:
> - Patches 1-4 fix issues in the existing context analysis support:
>   __bitlock() operator precedence, false positives for __free() helpers,
>   enabling WARN_CONTEXT_ANALYSIS_ALL for allmodconfig and allyesconfig
>   builds, and a too strict SRCU reader requirement in
>   srcu_dereference_check().
> - Patches 5-7 add __must_hold*() annotations to functions that currently
>   rely on lockdep_assert_held() for context analysis.
> - Patch 8 introduces lockdep_assume_ctx_held() and
>   lockdep_assume_shared_ctx_held().
> - Patches 9-11 convert code that accesses locks through pointer aliases
>   or that uses __assume_ctx_lock() to lockdep_assume_ctx_held().
> - Patch 12 removes the context assumptions from lockdep_assert_held*().
> - Patches 13-14 do the same for the RCU assertions and introduce the
>   lockdep_assume_in_rcu_*() macros.

Patches 1-7 are fixes that stand on their own; split them out so they
can go in separately.

I'm still 50/50 on this; while it looks better than removing completely,
I'm still not convinced by 8-14 esp. in light of my below Coccinelle
experiment.

The end state is still inconsistent: rwsem_assert_held*() and
lockdep_assert_rq_held() still carry __assumes_ctx_lock(). Either
"assert does not assume" is the rule or it is not.

More fundamentally: assert-implies-assume is what Clang's
assert_capability was designed for (I mentioned this before). What this
series had to do to flip that is 6 missing __must_hold() (patches 5-7),
and in exchange ~35 Bluetooth alias workarounds are renamed 1:1. It's
the same but under a new name, which results in churn and confusion.

I understand that the goal is finding functions with
lockdep_assert_held() that lack __must_hold(), which is strictly
speaking a legacy-code problem.

But I believe we can have our cake and eat it too, without changing what
the existing API means. Prototype (AI generated) Coccinelle script
attached.

On v7.4-rc2:

  rwsem.c:396: rwsem_del_waiter() asserts &sem->wait_lock is held but lacks __must_hold(&sem->wait_lock)
  rwsem.c:437: rwsem_mark_wake() asserts &sem->wait_lock is held but lacks __must_hold(&sem->wait_lock)
  pi.c:919: fixup_pi_state_owner() asserts q->lock_ptr is held but lacks __must_hold(q->lock_ptr)
  fabrics.c:650: nvmf_lookup_transport() asserts &nvmf_transports_rwsem is held but lacks
  __must_hold(&nvmf_transports_rwsem)
  [...]

i.e. the functions with an assertion that patches 5-7 annotate. It also
reports more, e.g.:

  pi.c:51: pi_state_update_owner() asserts &pi_state->pi_mutex.wait_lock is held but lacks
  __must_hold(&pi_state->pi_mutex.wait_lock)
  rtmutex.c:518: rt_mutex_enqueue_pi() asserts &task->pi_lock is held but lacks __must_hold(&task->pi_lock)
  rtmutex.c:526: rt_mutex_dequeue_pi() asserts &task->pi_lock is held but lacks __must_hold(&task->pi_lock)
  [...]

It is a prototype (only run on a handful of files, misses annotations on
prototypes in headers), but it shows missing annotations can be found
without making the APIs worse. Coccinelle was designed for this kind of
thing I believe.

If other maintainers prefer the explicit API I won't stand in the way,
though.

Thanks,
-- Marco

--kN9fNHIrqDuj/ERC
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename=0001-coccinelle-locks-Add-must_hold.cocci.patch

From 59f9f24bdc0e374a019a76e3bb8469c2cdc85646 Mon Sep 17 00:00:00 2001
From: Marco Elver <elver@google.com>
Date: Wed, 11 Nov 2026 10:50:19 +0000
Subject: [PATCH] coccinelle: locks: Add must_hold.cocci

Clang's context analysis treats lockdep_assert_held*() as an assumption
that the lock is held. A function that asserts instead of being
annotated with __must_hold() therefore passes the analysis, but its
callers are never checked.

Add a script that reports functions which assert on all paths that a
lock is held, where the lock can be named in a function attribute (it is
reachable from a parameter or is a global lock), and which lack a
__must_hold*() or __releases*() annotation.

For example, on v7.4-rc2:

  kernel/locking/rwsem.c:396:1-20: rwsem_del_waiter() asserts &sem->wait_lock is held but lacks __must_hold(&sem->wait_lock)
  kernel/locking/rwsem.c:437:1-20: rwsem_mark_wake() asserts &sem->wait_lock is held but lacks __must_hold(&sem->wait_lock)
  kernel/futex/pi.c:919:1-20: fixup_pi_state_owner() asserts q->lock_ptr is held but lacks __must_hold(q->lock_ptr)
  drivers/nvme/host/fabrics.c:650:1-20: nvmf_lookup_transport() asserts &nvmf_transports_rwsem is held but lacks __must_hold(&nvmf_transports_rwsem)

Limitations:

 - Annotations on a prototype in another file are not seen; non-static
   functions are reported with "check prototype".
 - Annotations are detected textually and are not matched against the
   asserted lock.
 - Functions that require a lock without asserting it are not found.

Signed-off-by: Marco Elver <elver@google.com>
---
 scripts/coccinelle/locks/must_hold.cocci | 100 +++++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 scripts/coccinelle/locks/must_hold.cocci

diff --git a/scripts/coccinelle/locks/must_hold.cocci b/scripts/coccinelle/locks/must_hold.cocci
new file mode 100644
index 000000000000..ba45544afc46
--- /dev/null
+++ b/scripts/coccinelle/locks/must_hold.cocci
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/// Find functions that unconditionally assert with lockdep that a lock is
+/// held, but lack the corresponding __must_hold() annotation. For such
+/// functions the compiler's context analysis trusts the assertion instead of
+/// checking the callers.
+///
+/// Only locks that can be named in a function attribute are reported, i.e.
+/// those reachable from a parameter or a global lock (&lock). Assertions on
+/// locks reached through local aliases are skipped.
+//
+// Confidence: Moderate
+// Comments: Annotations on a prototype in another file are not seen; such
+//	     functions are reported with "check prototype".
+// Options: --no-includes --include-headers
+
+virtual report
+virtual org
+
+@initialize:python@
+@@
+
+import re
+
+def squash(s):
+	return re.sub(r'\s+', '', s)
+
+def missing_must_hold(f, ps, E, pf, p):
+	e = squash(E)
+	m = re.match(r'[&(]*(\w+)', e)
+	if not m:
+		return None
+	params = re.findall(r'(\w+)\s*(?:\[[^\]]*\]\s*)*(?:,|$)', str(ps))
+	if m.group(1) not in params and not re.fullmatch(r'&\w+', e):
+		return None	# Local alias: cannot be named in an attribute.
+
+	with open(pf[0].file, errors='replace') as fp:
+		lines = fp.readlines()
+	first, last = int(pf[0].line), int(p[0].line)
+
+	# Attributes between the declarator and the assertion.
+	hdr = ''.join(lines[first - 1:last - 1])
+	if re.search(r'__(must_hold|must_hold_shared|releases|releases_shared|'
+		     r'context_unsafe|no_context_analysis)\b', hdr):
+		return None
+
+	# Attributes on a prototype in the same file.
+	for d in re.finditer(r'\b%s\s*\([^;{}]*\)([^;{}]*);' % re.escape(f),
+			     ''.join(lines)):
+		if '__must_hold' in d.group(1):
+			return None
+
+	static = 'static' in ''.join(lines[max(first - 3, 0):first])
+	shared = 'lockdep_assert_held_read' in lines[last - 1]
+	return "%s() asserts %s is held but lacks __must_hold%s(%s)%s" % (
+		f, e, "_shared" if shared else "", e,
+		"" if static else "; check prototype")
+
+@r@
+identifier f;
+parameter list ps;
+expression E;
+position pf, p;
+@@
+
+f@pf(ps)
+{
+	...
+(
+	lockdep_assert_held@p(E);
+|
+	lockdep_assert_held_write@p(E);
+|
+	lockdep_assert_held_read@p(E);
+)
+	...
+}
+
+@script:python depends on report@
+f << r.f;
+ps << r.ps;
+E << r.E;
+pf << r.pf;
+p << r.p;
+@@
+
+msg = missing_must_hold(f, ps, E, pf, p)
+if msg:
+	coccilib.report.print_report(p[0], msg)
+
+@script:python depends on org@
+f << r.f;
+ps << r.ps;
+E << r.E;
+pf << r.pf;
+p << r.p;
+@@
+
+msg = missing_must_hold(f, ps, E, pf, p)
+if msg:
+	coccilib.org.print_todo(p[0], msg)
-- 
2.56.0.542.g3ef89b7020-goog


--kN9fNHIrqDuj/ERC--
