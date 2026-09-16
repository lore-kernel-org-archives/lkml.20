Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B0D4B828A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789582931; cv=none; b=BO+nDvayuRjTDFFxZ02JgntNIkBwReGDK9Ngwex/CKIg8h4pprMVOqqGeQob3ijbiV9AMY5yo2VAd6L8y56lvF/2udCOxNChuzpDQaHbx/OdE7q42ZIEYEDkNR5HlXAHwy86zwPUQ+L+YahiiTKrCreuoj0DcadDiRBO7em4nes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789582931; c=relaxed/simple;
	bh=VlaIIXAgtNH9CjpXUFsGzgsQokBenQSI3ZDOBobz3oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kn1ysPorqxMWYprYuqGZJA4hJRG0vIRoIPKGy/AYyUwFiPyuQe9fBhH2RPmPBBYbOsQKqHncbrmFN5+OwOzbfMLOX7W93LCwMRNPkYlbWb2m/75ER5mSVFqti2mSUFr25uPJKc+I2bUA4Nngf2l6MqdMsXHRA1oY2TiNOKWE+nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmhmG8k/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmhmG8k/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so344385e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789582923; x=1790187723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzigpOKL1OFYCaoRua6BtFJqvREz04FyyrYb1+IZ6O0=;
        b=MmhmG8k/XUwdm6SGTDTeG2/NPWjNBsDLhnTG3ErEtaZ7UK0k032Ocm3K0DfAz5Q0xz
         E+cvNga4/ruCMe6G46ES4bCYviBA6ZWviMCCLKZJKfYN5Cls55sErELXDOla+YqkOtVJ
         3mYKq8U/BVKSEvuSbT5GITD2XgK4agBqN1Nr+AGPTYW43mxYRoJlpwKiXT9cqdyuxz5e
         LxTmsb4HNYBPNZA2pNYZyHxUtvTL21/POGSQMKla/aOYQ7lGzrosSRLDI0x7/WxVGCUH
         6+s1KGwbdhYYXLuEZilZL+RYDqkdJL+qcE6cLSTyrfpPnnXTNMVUSi5HDoAm8a0LFnoF
         hjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789582923; x=1790187723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzigpOKL1OFYCaoRua6BtFJqvREz04FyyrYb1+IZ6O0=;
        b=P0RBNd8KbehHbcq+9yT0BnoUwYEOSL3EQji94NV4XHzVNdZ7f0gRZLQVeqrZp/gJ+g
         R8CWCbi5GXk5UcsEExBWYIFsx2I4LlkzsmPosbUqlpql2Wy0Gr66uLfUNM496ffdrsYh
         HW6T18GKKECnZy5ojxZqwhtEdhw5BeVsNqF9j8V0TIXAPxk0xQdsX0VIOLl1QO5W/fGr
         2Kzm4/8/5tpU8WNgfuTA0jCqM0wzRG1N9Z2/UKqZ5auW9dWhAQvC1HvzWX8E2bjrY03F
         /GRY7vmFzpjPVUAVUzv07CrJcssn11tnWerbW+XzC6ssshzin08x6G3vzgUL4qX+6yHU
         DDGA==
X-Forwarded-Encrypted: i=1; AKwUvBw9OV8dKoXK0TXFlElhXZMyNO/T8uW2NajXPE2ALqzvWUP72ge56Y85ZaKxaPQxXy+c1GDJeFSRc7/b+bM=@vger.kernel.org
X-Gm-Message-State: AFuF++l3D7mtwBmpEB9zqeIc57J+c1AmxI8kUiAko4zPNxwj3BJDfOEQ
	nZhY6tOLuSOnPB5oeY8vjyZ9ZQy+GzmpK+2p9RntP4ilvRJff1XGvloi
X-Gm-Gg: AYBFou0nPqonLdVgJSrBrLjv9FkyRh/Qj0cred8XNhsg6YD/5QpvxYW4YT5EBI/sJym
	TFfMqogf8jJBoPeVz7Whl+TDhaNbSd4yoiF9q5YVwRW8OzU5VtK8BOBbQ2UbYyKJsRR69xRYBnp
	iJ4fx89y1lzw+v153Cp/ZA3tybpgpSTT6HRMiPBBDIOLlLsqDrWREPNpviN5frbQSq4/VG0XoXU
	xyzgVmV3GandtWm0p3zHb7QcthibwKmlNplUO9CgmU4UpAnrjlcXJYmtJRuPeXo4htB8aS+0e9X
	ISBAbdlyVaei7FeHjEoLWt3FgETuUlj+mlFgu2r0WDduzhRmhkARmabc2LWAcFNMo++u8zT8sS9
	EjJU+VcO9QI7hHeQcBUHndEcHDXzfv8TwGjfwef0ydYF6QDdzyjW7Vmlsu+pbSC0DhuE2iFsMs2
	zsnEUmxTJQwDjZJxZU6fIx4FBv/Peu7vtlY3js2/qqtHLdnjY7B59naxiCbujIyUUq+WhfXWJK0
	I5Ae/3XTTnv5L8JdHPi9nfJdw0NyxN1pbcC6b978wmlXF7vbhsxFpLBjrAlwLGcNABWxE7o30be
	GVdlN3zA
X-Received: by 2002:a05:600c:4e48:b0:49c:fc6e:a3d6 with SMTP id 5b1f17b1804b1-49eb732d07emr51536565e9.21.1789582922778;
        Wed, 16 Sep 2026 11:22:02 -0700 (PDT)
Received: from fedora ([2a01:261:818:9401:46b1:9fe8:a5e3:32be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbbd951a0sm22282645e9.4.2026.09.16.11.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:22:02 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RESEND] x86/process: Use thread.gsindex for 32-bit gs, drop dead thread.fs
Date: Wed, 16 Sep 2026 20:21:39 +0200
Message-ID: <20260916182159.7982-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

thread_struct duplicates what 64-bit already does for segment
tracking: on X86_64 the active FS/GS selectors live in the 16-bit
fsindex/gsindex fields, while X86_32 instead carries its own
"unsigned long fs, gs" pair, flagged since day one with:

	/*
	 * XXX: this could presumably be unsigned short.  Alternatively,
	 * 32-bit kernels could be taught to use fsindex instead.
	 */

Do the second half of that TODO for gs, and just delete fs.

gs is the only one of the two that actually needs storage in
thread_struct on 32-bit. pt_regs does have a gs slot, but on
32-bit it is repurposed to hold the interrupt vector number
("On interrupt, gs and __gsh store the vector number. They never
store gs any more.", see struct pt_regs in ptrace.h) rather than
the real %gs selector, so __switch_to() and ptrace() need
thread.gs as the only place the actual value lives. fs has no
such repurposing - its pt_regs slot genuinely holds %fs (see
PT_FS / regs->fs) and sigcontext does too - and thread.fs has had
no reader or writer anywhere in the tree for years: it's dead
weight in every 32-bit task_struct.

Move gsindex out of the CONFIG_X86_32 #else branch so it's shared
between 32-bit and 64-bit instead of 32-bit growing its own copy,
and update the corresponding .gs sites in process.c, process_32.c and
ptrace.c to match. Segment selectors are 16 bits wide, so narrowing
from unsigned long to unsigned short loses nothing - ptrace's
set_segment_reg() already truncates to u16 before the assignment.

No functional change; thread_struct also gets a little smaller on
32-bit as a side effect.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/processor.h | 10 +---------
 arch/x86/kernel/process.c        |  2 +-
 arch/x86/kernel/process_32.c     |  6 +++---
 arch/x86/kernel/ptrace.c         |  4 ++--
 4 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index ec9db0dfa0df..d80a28fb51ec 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -476,19 +476,11 @@ struct thread_struct {
 	unsigned short		es;
 	unsigned short		ds;
 	unsigned short		fsindex;
-	unsigned short		gsindex;
 #endif
-
+	unsigned short		gsindex;
 #ifdef CONFIG_X86_64
 	unsigned long		fsbase;
 	unsigned long		gsbase;
-#else
-	/*
-	 * XXX: this could presumably be unsigned short.  Alternatively,
-	 * 32-bit kernels could be taught to use fsindex instead.
-	 */
-	unsigned long fs;
-	unsigned long gs;
 #endif
 
 	/* Save middle states of ptrace breakpoints */
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 346c438ac880..5b1a132ff84e 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -204,7 +204,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		set_bit(MM_CONTEXT_LOCK_LAM, &p->mm->context.flags);
 #else
 	p->thread.sp0 = (unsigned long) (childregs + 1);
-	savesegment(gs, p->thread.gs);
+	savesegment(gs, p->thread.gsindex);
 	/*
 	 * Clear all status flags including IF and set fixed bit. 64bit
 	 * does not have this initialization as the frame does not contain
diff --git a/arch/x86/kernel/process_32.c b/arch/x86/kernel/process_32.c
index 168dabf9853f..f520039d7d15 100644
--- a/arch/x86/kernel/process_32.c
+++ b/arch/x86/kernel/process_32.c
@@ -172,7 +172,7 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
 	 * used %fs or %gs (it does not today), or if the kernel is
 	 * running inside of a hypervisor layer.
 	 */
-	savesegment(gs, prev->gs);
+	savesegment(gs, prev->gsindex);
 
 	/*
 	 * Load the per-thread Thread-Local Storage descriptor.
@@ -202,8 +202,8 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
 	/*
 	 * Restore %gs if needed (which is common)
 	 */
-	if (prev->gs | next->gs)
-		loadsegment(gs, next->gs);
+	if (prev->gsindex | next->gsindex)
+		loadsegment(gs, next->gsindex);
 
 	raw_cpu_write(current_task, next_p);
 
diff --git a/arch/x86/kernel/ptrace.c b/arch/x86/kernel/ptrace.c
index 3dcadc13f09a..09fcbfba8a45 100644
--- a/arch/x86/kernel/ptrace.c
+++ b/arch/x86/kernel/ptrace.c
@@ -192,7 +192,7 @@ static u16 get_segment_reg(struct task_struct *task, unsigned long offset)
 		if (task == current)
 			savesegment(gs, retval);
 		else
-			retval = task->thread.gs;
+			retval = task->thread.gsindex;
 	}
 	return retval;
 }
@@ -230,7 +230,7 @@ static int set_segment_reg(struct task_struct *task,
 		break;
 
 	case offsetof(struct user_regs_struct, gs):
-		task->thread.gs = value;
+		task->thread.gsindex = value;
 	}
 
 	return 0;
-- 
2.55.0

