Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520392;
	b=T2r38CqSBbdcYGk3OXxyV3pVfYHVzKIHyx7HgVkSrVSnUCDkeFw/Ke0jVdi4D+bjRMRu
	 iWfMWWTDZGlE/qtgBYKRPgtQX84ivl2ej8SHM5FvqcnbwIDIWqElFhZNbIQUNnDMa1JIw
	 p2OftR7BhLyjtm/2eyhLEIpJgY00i9yFmP1NX0zLIz5pjU6uu3ddR+k0tBpoAe2qUr+wn
	 VVqdQITLF5O+7bnrhUJTzYB2Npd+ky3ffsOoEi+XXw64FQiWIX+cHJxkpyK4NMF8rzKAw
	 Q0Hnfj352njmv9l/eeQvQc4770XoxhvNhTORTyyxey4cW8GnY4L4NaLw37g+zedsbiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=FXROYGPQWGFmqEgtHLT36Aa9jNEnUAaU6PbR3cRnznM=;
	b=rzIK5FrT4H+Z4wVuCx+b1JTR84mD+GHzf0N0hIGWH2wqg0RQu/YePYV80rqKMLrdaAAC
	 owtCzOGcSfStZRPgzqJeGriV8eUYV1RK+b2a5IDeKlDyeaBhbptMQTofTa4A2gYVOaq7V
	 GmedggUOlL4eUqNsINnls3sXEdmLQjoh1IZQyrU+cT4YaASEQPg4X17ktyDmwi5WhUl0h
	 mOWHLevsrigz6TSFYuBVlcv+6IKtWunvB9PYRlB7NY3lN9pi5q6svVklHZd3pyBtZr6TW
	 9YBcZI3j59nhtagslsHwENPGF0QNTe1j173fgasPEwchntSDyCdN5JzKqo8hC/8O+dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f4ha7Nx3;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AEE606A331
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1AEE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f4ha7Nx3
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35d0be18c71so1105005eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520391; x=1793125191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FXROYGPQWGFmqEgtHLT36Aa9jNEnUAaU6PbR3cRnznM=;
        b=f4ha7Nx3LaTZJebKpSss2s3cOpW+KTb0A6iFDBwM+dl0uifl7WpLfO8bldFdOzryha
         OITFEugeZMXe+ikzHQSNu+bSf/mOyD1ahNZTt2FAB9ND+hkSN7+k8RqPwKKCloNWm52d
         /idHGYB4sFykYx1D/NYxNLWSBrT5gXs+/NDi+ZEKM7ZzCqy5r6kXLg0VwXiA8JTEi99T
         QrF4yq6MHZr6KQnNbMxILqswkNpWAiK6HmzbWjWc/sWFT7oo037t3M4w0qGMb3SEAQQn
         Jr2icg6o9oTQvreLusFe5paR2JP0SCodmoC3HpH/gw8Q1jdBlJqoYkRQpqOdZZ7x9Wp/
         pTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520391; x=1793125191;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXROYGPQWGFmqEgtHLT36Aa9jNEnUAaU6PbR3cRnznM=;
        b=HocwLPZa/X9sy5sW++/ez4xq+EQ6h9LyCBlVEzzvlRXwZXQ9ZJ+CnrOLxDaLKOyzNI
         vNC/vS+ZfQvpu36aQBcAtJyN9zmSCljutl2l9+hGmgs/pno3BmIZGh5MHofJvrqcXxmS
         2QreXkbWxsB4Jnnb3YgCVKf1Sjuchbr4iJQEVpP+fW/AzgIHMIiA9xT1mBxdKjWESQkK
         nPZIaj+2TuGipDAPJVwxdwzF03NCyjrwenMHwjW8Mo59VIKVRjdBfpwAYKQqnsYsPvQg
         P151yAjdIG9nz8s8DIYUG0L+9s42c8XPlcIekcY2T22SGdExBKYIabBCRuN1rWv+z3mp
         qojA==
X-Gm-Message-State: AFq9FYJ9WUUIPSfo8huVY71SPILeZi5xus3n4rMrqDVxy8jJMQQqMM9t
	X+3mDmVj5XB3B0ZiiFZv1djo6n2V+f4d3kzx4jHNxiO7GnjW3g+o9bDT
X-Gm-Gg: AYBFou3xsvvL3cEv3mYszqjbJnAuc4FA/NF+bF6V1EhnharczfyLEw29hx/RrJavvcB
	iWWheGnEFGMU3HcjViYT4ao31zjxLIUJXprl3lOPBU/8EqAvZNhTWxf/5BK/bqXw0h20K3rnD+D
	NgxXbpB5Y7Glmyj//Fvqx/5PHfOb0CkwoSJj3H96tUj0DRmceVntd8PIUrRxKKw1qnwZ3qY4Jqw
	AJ9N4RvU5STw/cqDU0tLg6t0J98hkouSZu+0pCU6yvAls8nvfHvyltdaJ6FC2EP7YPxTVeeigB/
	xfMUl6JMVpr3Ke85umCxm/QRnTdCHnoQveHZg0UHIyhyrjUcjV0MBuKn4U+KuhrUQDR0w1xt9DG
	d8GqylGWck7cNpdG33uYDUkF1OTI988Ea6xfu8oz4lZs4+fTMIlrsqZb4haEMcyro0x1kB02gyD
	IvLewUbV5r0QfC38FEUoaWgBLMNsj5uZIIz93/LBuIkt+GYoy2O7Y8LZjLY0ENcMlV0gzu40Y8E
	Co=
X-Received: by 2002:a05:7301:160a:b0:366:6c79:212b with SMTP id 5a478bee46e88-3666c792450mr2214856eec.25.1792520390778;
        Tue, 20 Oct 2026 11:19:50 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm523728eec.2.2026.10.20.11.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:19:50 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] riscv/shstk: release shadow stack on failed fork
Date: Tue, 20 Oct 2026 15:19:31 -0300
Message-ID: <639e84e5294f48e6b3d595161c42ebb7b89557ce.1792519121.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792519121.git.ivanrwcm25@gmail.com>
References: <cover.1792519121.git.ivanrwcm25@gmail.com>
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

copy_thread() maps a shadow stack for a CLONE_VM child and can still
return 0. A later copy_process() failure, including clone3()
CLONE_PIDFD when put_user() fails, goes through
bad_fork_cleanup_thread and exit_thread(). riscv did not select
HAVE_EXIT_THREAD, so that free was a no-op. shstk_release() already
documents this call. Normal task exit reaches it through
deactivate_mm(), while the failed-fork path did not.

Select HAVE_EXIT_THREAD and call shstk_release() from
exit_thread(). The helper already refuses a different mm and a
cleared base, so CLONE_VFORK, !CLONE_VM, and a second call after
deactivate_mm() stay no-ops.

Do not free when shstk_alloc_thread_stack() fails. That error
returns from copy_thread() with the inherited parent base still in
place, and copy_process() skips exit_thread() on that path.

Tasks created through the args->fn path (kernel_thread(),
create_io_thread(), and similar) do not allocate a user shadow
stack in copy_thread(). They still inherit tracking via
arch_dup_task_struct(), and with CLONE_VM a later failed
copy_process() still shares the caller's mm, so shstk_release()'s
mm check does not save us. Clear that tracking with
set_shstk_base().

Fixes: fd44a4a85516 ("riscv/shstk: If needed allocate a new shadow stack on clone")
Cc: stable@vger.kernel.org
Cc: Deepak Gupta <debug@rivosinc.com>
Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 arch/riscv/Kconfig          |  1 +
 arch/riscv/kernel/process.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5874ca30f4f6..7635f8cb0397 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -169,6 +169,7 @@ config RISCV
 	select HAVE_FUNCTION_GRAPH_FREGS
 	select HAVE_FUNCTION_TRACER if HAVE_DYNAMIC_FTRACE
 	select HAVE_EBPF_JIT if MMU
+	select HAVE_EXIT_THREAD
 	select HAVE_GENERIC_TIF_BITS
 	select HAVE_GUP_FAST if MMU
 	select HAVE_FUNCTION_ARG_ACCESS_API
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 7cc5a6a5c020..b9b765264cc8 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
+#include <linux/sched/task.h>
 #include <linux/sched/task_stack.h>
 #include <linux/tick.h>
 #include <linux/ptrace.h>
@@ -213,6 +214,16 @@ void arch_release_task_struct(struct task_struct *tsk)
 		riscv_v_thread_free(tsk);
 }
 
+void exit_thread(struct task_struct *tsk)
+{
+	/*
+	 * shstk_release() documents this call for a failed CLONE_VM
+	 * clone. copy_process() reaches it only after copy_thread()
+	 * returns 0; deactivate_mm() does not run on that path.
+	 */
+	shstk_release(tsk);
+}
+
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 {
 	fstate_save(src, task_pt_regs(src));
@@ -261,6 +272,15 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
 		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
+		/*
+		 * Tasks created through the args->fn path do not
+		 * allocate a user shadow stack here. Clear inherited
+		 * allocation tracking so a later failed copy_process()
+		 * cannot release the caller's stack when the mm is
+		 * still shared (CLONE_VM), as with kernel_thread() and
+		 * create_io_thread().
+		 */
+		set_shstk_base(p, 0, 0);
 	} else {
 		/* allocate new shadow stack if needed. In case of CLONE_VM we have to */
 		ssp = shstk_alloc_thread_stack(p, args);
-- 
2.43.0

