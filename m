Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC9639795B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179987; cv=none; b=qq+CbKYqODO+vtu51IKCuKOsaan33I84CUF5/cJVgcv4C9J1WkMWOzUClFG3OQiPCDUmPpF7dc73sdylxzQhJc6yGgnJTe0QkueIpdPASTB56AqSsEaHTieJBfx0oZ82D72Ya60RVyWBDjIlWeKxPhiaJ+L8JFwm8QBBMe5sU/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179987; c=relaxed/simple;
	bh=UKHfm3hib73pa55eKddhtXLxTqC68GbL0KmbqqEd5N8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LU0QpMhtWyG/ivCeGbKXy5evpa07sQjYJbvjtDV1haY6SGORz/FMqn9fbC0BdHhHJ90hWbRdxauo43VHy3qeZ4IypVMH/utyElYVbZGX8yVaWLGxTVSLGAez2/Fh3MnsK+Em6NFCFo2YMFtaebvXB/id/QC8UnOfIQOoLJKzb0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxWzW2es; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxWzW2es"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35ef6b49813so481037eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792179985; x=1792784785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mzEjDaJTDISex2ZPOiizRCuwngZ28JcDGHKte0m6HrM=;
        b=HxWzW2esgtZm1ryn5BNufXdKutdKZI3lAbTKQqmMFjJixbLB4IIr7lBpKPBgmJ/ceL
         SSzgzLnNdNqsYJZoy8qijie/5TC0csi0Ps2m8VtelH869ZGh0xLJ5cIHT+04Sek2TEU9
         lxKa6LGhnVeADv/DNlZGEr4wBSgAPjxPbedffvhkb0spn+Ck0T0rVQV6OmvgKeA5uR/r
         GIQ8s97TEedxC2cE/9H12sJ1FdgWh9ckbJip4LxdVak6DL8Zo0+4ytvFjylgBYHcyLcV
         GKX13kq2swhqprDUmXDVS5vsy7AyXyjOkJJMOyjee5JgzEBWYogYQFHHH+r4Ds0wuu+/
         NT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179985; x=1792784785;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzEjDaJTDISex2ZPOiizRCuwngZ28JcDGHKte0m6HrM=;
        b=IXT6hgZXmMKvPdybukVnxpS5GvrcIq99+vXvzeFXqf2Vva2BPl8upf8Eoxkhb5F0Ny
         XinO0ipmWw0JUXJAZ4GtYm7hc65Uq9NJK6FU+K69huVRPYHt3M5M88N5CsFgX+JFFxTD
         87yIgj6fvBrzhDHbgzI90bp3Hiup+Wd3lxG2ZuIa6eMLJEcpnJH6+J9Js8Pk2vyVfA0K
         G/pRIIuVMP1PpsD5eJ8ClYeiCZCymabd3T+xuol0m1p6ErgxnevXHXoiPxeIlOh1e5Nq
         un345kUhR59JvEatYjum0rxgOS155j5ui15orWniZX3s/WL4eV5KCXurK1uS0hDzn47Z
         vFSQ==
X-Gm-Message-State: AFq9FYI5BPRR3QaKExY7IgZCSDAW1RUyVsdonooTvn/R+6v9zBK/SAcv
	oUE6exIvW0dQe4HYCDtoiuNGtoVa0HGznLpJ3tegJdWDhGxNHcCOESXi
X-Gm-Gg: AYBFou2uCijsQop8qfDyWBlmsmCfnNnHhVxFhIXPfWfSGQb/n+DfChuFMOF5dLL1j+c
	OCkv86eZSJobuEuuYhG6LLVanQwXUj7/vi+IR/0gQbjkzqI9FzMbxUId7m6JVFzX09tfNxfX8Bm
	DoWeOKUX9MTEaRhJXX6HVzmCxVi/d2WpkfNuYwgHX5zf/JCtgrTC/QQpHnbzvKo6Y3RR0G72yp+
	TZhCXfc/aQNcU54c8JCqLWvtJAcWd73fgVl3Qw7xeI1by9A/tflrhot29zxUpMucbC5it34Sdz9
	RA6k/fMM6jXnOJ0C61pmkJK3HejB2zoZOXTtXz59PE1SDs4l4aBKK7QnCXzKaTNnsjjbhYZ9dBK
	VS4z3RCLS7rHbwlNQcRoBB2K0MbQp38pj66FGKTmUEZrFgz5aWKbUlDro0N3IOpKo2cIVryH8Im
	U183QiJZKfWVH5fihSxZ/xHcKvjFdgjXSJumKI5UBSdKXsslaaZitpKo/jcpS6C9tmvJ+ckzA0w
	z0=
X-Received: by 2002:a05:7022:f90e:b0:168:3243:c937 with SMTP id a92af1059eb24-185119e3cfamr1015727c88.16.1792179983649;
        Fri, 16 Oct 2026 12:46:23 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm11008321c88.16.2026.10.16.12.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:46:22 -0700 (PDT)
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
Subject: [PATCH 2/4] riscv/shstk: release shadow stack on failed fork
Date: Fri, 16 Oct 2026 16:46:01 -0300
Message-ID: <75e29a5db0166247c407bd51f184864b398a2ee6.1792179433.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792179433.git.ivanrwcm25@gmail.com>
References: <cover.1792179433.git.ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

copy_thread() maps a shadow stack for a CLONE_VM child and can still
return 0. A later copy_process() failure, including clone3()
CLONE_PIDFD when put_user() fails, goes through
bad_fork_cleanup_thread and exit_thread(). riscv did not select
HAVE_EXIT_THREAD, so that free was a no-op. shstk_release() already
documents this call; deactivate_mm() is the only path that actually
reached it.

Select HAVE_EXIT_THREAD and call shstk_release() from
exit_thread(). The helper already refuses a different mm and a
cleared base, so CLONE_VFORK, !CLONE_VM, and a second call after
deactivate_mm() stay no-ops.

Do not free when shstk_alloc_thread_stack() fails. That error
returns from copy_thread() with the inherited parent base still in
place, and copy_process() skips exit_thread() on that path.

A kthread copies the caller's tracking via arch_dup_task_struct().
kernel_thread() uses CLONE_VM, so during a failed copy_process()
the child still shares the caller's mm and shstk_release()'s mm
check does not save us. Clear the inherited tracking as part of
kthread setup.

Fixes: fd44a4a85516 ("riscv/shstk: If needed allocate a new shadow stack on clone")
Cc: stable@vger.kernel.org
Cc: Deepak Gupta <debug@rivosinc.com>
Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 arch/riscv/Kconfig          |  1 +
 arch/riscv/kernel/process.c | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

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
index 7cc5a6a5c020..def1f520d9ef 100644
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
@@ -261,6 +272,13 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
 		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
+		/*
+		 * kernel_thread() uses CLONE_VM, so a failed
+		 * copy_process() still shares the caller's mm.
+		 * Inherited tracking would then look like a child
+		 * mapping to shstk_release().
+		 */
+		set_shstk_base(p, 0, 0);
 	} else {
 		/* allocate new shadow stack if needed. In case of CLONE_VM we have to */
 		ssp = shstk_alloc_thread_stack(p, args);
-- 
2.43.0

