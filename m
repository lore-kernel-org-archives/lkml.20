Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE0B3E0C4D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168229; cv=none; b=jNSS0cvLql63BGycxZmV1xEtHaJ6KnP+eal0CtYglA0bM/6rrTl5JSVq+xilLzXZmN7F8arsP+ewgzvurV66A4inHg8WP7KiUldoL906DIrhENAoHrBAlQX9lOdEWLH8Yi5cvg6LMsvoD3AQ2PySHXfUR9bDzPnEHdhedIqW+0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168229; c=relaxed/simple;
	bh=13iQWQ5HVzeaIU5YKMesEX4qv3/IZAsHfcBKEHM64kU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9b5lskAhduEk0pvBC2cz/Kmm4MLWApPgHCjJe2YP5UPeftW/8HKP1rceKpGgrQ24Ovd2ez2NgtfjpgoJsDpm2Q05As8SFl2zkMgWgaHt3Dm7YpKQZhEt5ZrPiABveove1UbLyPc4GaGx3A06Dlb5ZG42zWWUHx2Iv4hrPksZbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpKVo+cl; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpKVo+cl"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47fd4531020so1967095f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788168224; x=1788773024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xLhekP1hyFFXIKTW9u0l4JwtljKTcvPghf3/4G/CKiA=;
        b=mpKVo+clJlm27fzllIEo9zyytJ6gQ6cMAv6T8ddJ2YX3XBOds4sDX0cCr9cIImOh/p
         XF2wCKzox0Igoal6dw0l1XaJF/LqY9IK67hLD/Uya/vuYjm/HgMes7x0vx1t3pD8PNBg
         sl3TkffVmxQdpkvo37cW80e4rAfmCOhrXsKleo00jHEdrwQyE9MtQ+EwUYuyAHS1aTQF
         C6Yb61H4cZRbePy0J0BFCr7VcXmrsaymPKpl1LfoG3wRISyPcfaCuqGwcyEjsJYw1wxw
         88FrnY1q0gCtpZg022gdpalX9Zy1A3gjRsyfM5UfrlP3im73WdvsfuhFCgfwQ0PLC8QT
         Mmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168224; x=1788773024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xLhekP1hyFFXIKTW9u0l4JwtljKTcvPghf3/4G/CKiA=;
        b=X9amzf/gJnuRqMw/hpxMfeCDe3vNPXxxUWm79wyDDPLQ50mOmxI7sHoawOeNi2wbEv
         w1H8oiBrtioXRUZSFKFyQSnOtpBmDcyUg6lcdeKJV7AMjwlBskQglvIV85RkExGGqGg6
         ygKX6AYwceMpXnqSENOH6i2hgYOCO//7cphFKYyEkHexg7DgTXbQOuV0Nus6Wd+zrheW
         91UxBjUKD00e1Ltut9pk/Ugt6d2c/4WoGzwfU+SbG25NR/sFq4iYEjKyazpQM16AYt4q
         cZNUhNoJZLE5VDfoM5NcTulE0MpdGCgP2UfUXZXzPkg2cIaarOkiot8CvHhuB0ht2q0u
         CQNQ==
X-Gm-Message-State: AFuF++lJQ1nIwum9J0H09Jf8a6Zq1okXFZKdMiPH8a6RJznuV7IJQURI
	Vq6Qs3WPC8V6ukmWVJT5/15EUopw4M2To+TT+hlz6T/+5zQuNBOQhogL
X-Gm-Gg: AR+sD12bZPHN7HHf6zTx1eUApqfGwwzIxndA59RZn1UDRDYpZ5EQOJzcLHe3pJE/a1z
	5M+68C2GCLdxB7u1zGda5FY9yuNaQ9cYSPZhHWtAiVxuCSr1EjNyi6yFYh0BuNYCwPSyr+6RAOP
	6PLX1wO8WR5D8vRWmAB7naeGnBh79LcZWZHam5+6KLvJ07BjjHJ4PrYPTuFTaTDk/Tv1SfwKGyd
	JGQOcZ6TwASJ2Afs6iX7O8xV5oE7aCFvboCSIppJy1JvtsXi4yZ0aSpwI53sZgZMQwy8IDfIYyQ
	+sUY1DWJha416KgYU7VslCNsGw9qQxky6W1z4h2Hqm+bumJRQSpm4ZtfVTJ/TOXOGKGAij+FXeB
	HV9fdAeuMVRRmzZM0QZJ5MZJAo6AF2irI6EE66Jz8iwdKDg65xR6WmOcXaYNTQ6NcZwRHFEm/EM
	Ix1fVCZJOOvtQ4Z+AgqS0yWxooBIhXnfjeOHlVIXiMb1gyG7sp2hOWs3sHfVVEeIMJkMLUDceDn
	Q==
X-Received: by 2002:a05:600c:3e1a:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49ccee2a541mr225871815e9.16.1788168224225;
        Mon, 31 Aug 2026 02:23:44 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c80asm318248155e9.9.2026.08.31.02.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:23:43 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	kpsingh@kernel.org,
	matt@bobrowski.net,
	song@kernel.org,
	utilityemal77@gmail.com,
	tasos.papagiannnis@gmail.com
Subject: [PATCH bpf-next v3 2/7] bpf: Add user memory access kfuncs for mm_struct
Date: Mon, 31 Aug 2026 12:23:00 +0300
Message-ID: <20260831092305.42062-3-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831092305.42062-1-tasos.papagiannnis@gmail.com>
References: <20260831092305.42062-1-tasos.papagiannnis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On CONFIG_MMU kernels, when security_bprm_check() runs, the argument and
environment strings for the exec have been copied into bprm->mm. The new
address space is not associated with a task_struct until exec_mmap(), so
existing BPF user memory helpers can only read from the calling task's old
address space.

Add bpf_copy_from_user_mm() and bpf_copy_from_user_mm_str() kfuncs. Both
take a struct mm_struct pointer directly, allowing callers to access
trusted address spaces that are not associated with a task_struct.

bpf_copy_from_user_mm() has similar semantics to
bpf_copy_from_user_task(). bpf_copy_from_user_mm_str() copies one
NUL-terminated string and returns its size including the NUL terminator.
It accepts BPF_F_PAD_ZEROS to clear unused destination bytes on success.

Register both kfuncs and mark them KF_SLEEPABLE because accessing the
remote address space can fault.

On !CONFIG_MMU, exec argument and environment strings remain in
bprm->page[] until the binary loader transfers them to the new process
stack. They are therefore not accessible through bprm->mm at the
bprm_check_security hook. The linux_binprm use described above is
CONFIG_MMU-only, although the new kfuncs remain available for other
address spaces on !CONFIG_MMU.

Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
---
 kernel/bpf/helpers.c | 115 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 101 insertions(+), 14 deletions(-)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index b3cc5c8fc875..19c01aa734ae 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -32,6 +32,13 @@
 
 #include "../../lib/kstrtox.h"
 
+int bpf_copy_from_user_mm(void *dst, u32 dst__sz,
+			  const void __user *unsafe_ptr__ign,
+			  struct mm_struct *mm, u64 flags);
+int bpf_copy_from_user_mm_str(void *dst, u32 dst__sz,
+			      const void __user *unsafe_ptr__ign,
+			      struct mm_struct *mm, u64 flags);
+
 /* If kernel subsystem is allowing eBPF programs to call this function,
  * inside its own verifier_ops->get_func_proto() callback it should return
  * bpf_map_lookup_elem_proto, so that verifier can properly check the arguments
@@ -682,22 +689,15 @@ const struct bpf_func_proto bpf_copy_from_user_proto = {
 BPF_CALL_5(bpf_copy_from_user_task, void *, dst, u32, size,
 	   const void __user *, user_ptr, struct task_struct *, tsk, u64, flags)
 {
+	struct mm_struct *mm;
 	int ret;
 
-	/* flags is not used yet */
-	if (unlikely(flags))
-		return -EINVAL;
-
-	if (unlikely(!size))
-		return 0;
-
-	ret = access_process_vm(tsk, (unsigned long)user_ptr, dst, size, 0);
-	if (ret == size)
-		return 0;
+	mm = get_task_mm(tsk);
+	ret = bpf_copy_from_user_mm(dst, size, user_ptr, mm, flags);
+	if (mm)
+		mmput(mm);
 
-	memset(dst, 0, size);
-	/* Return -EFAULT for partial read */
-	return ret < 0 ? ret : -EFAULT;
+	return ret;
 }
 
 const struct bpf_func_proto bpf_copy_from_user_task_proto = {
@@ -3680,6 +3680,83 @@ __bpf_kfunc int bpf_copy_from_user_str(void *dst, u32 dst__sz, const void __user
 __bpf_kfunc int bpf_copy_from_user_task_str(void *dst, u32 dst__sz,
 					    const void __user *unsafe_ptr__ign,
 					    struct task_struct *tsk, u64 flags)
+{
+	struct mm_struct *mm;
+	int ret;
+
+	mm = get_task_mm(tsk);
+	ret = bpf_copy_from_user_mm_str(dst, dst__sz, unsafe_ptr__ign,
+					mm, flags);
+	if (mm)
+		mmput(mm);
+
+	return ret;
+}
+
+/**
+ * bpf_copy_from_user_mm() - Copy data from an address space
+ * @dst:             Destination address, in kernel space
+ * @dst__sz:         Number of bytes to copy
+ * @unsafe_ptr__ign: Source address in the address space
+ * @mm:              Address space to copy from
+ * @flags:           Reserved for future use; must be zero
+ *
+ * Copies data from the user address space associated with @mm. The destination
+ * is zeroed if an attempted copy cannot be completed in full. Unsupported
+ * flags return -EINVAL without modifying @dst.
+ *
+ * Return: 0 on success, -EINVAL if @flags is non-zero, or -EFAULT if the copy
+ * fails or is partial.
+ */
+__bpf_kfunc int bpf_copy_from_user_mm(void *dst, u32 dst__sz,
+				      const void __user *unsafe_ptr__ign,
+				      struct mm_struct *mm, u64 flags)
+{
+	int ret;
+
+	if (unlikely(flags))
+		return -EINVAL;
+
+	if (unlikely(!dst__sz))
+		return 0;
+
+	if (unlikely(!mm)) {
+		memset(dst, 0, dst__sz);
+		return -EFAULT;
+	}
+
+	ret = access_remote_vm(mm, (unsigned long)unsafe_ptr__ign,
+			       dst, dst__sz, 0);
+	if (ret == dst__sz)
+		return 0;
+
+	memset(dst, 0, dst__sz);
+	return ret < 0 ? ret : -EFAULT;
+}
+
+/**
+ * bpf_copy_from_user_mm_str() - Copy a string from an address space
+ * @dst:             Destination address, in kernel space. This buffer must be
+ *                   at least @dst__sz bytes long
+ * @dst__sz:         Maximum number of bytes to copy, including the trailing NUL
+ * @unsafe_ptr__ign: Source address in the address space
+ * @mm:              Address space to copy from
+ * @flags:           The only supported flag is BPF_F_PAD_ZEROS
+ *
+ * Copies a NUL-terminated string from the user address space associated with
+ * @mm. If the string is too long, @dst is still NUL-terminated unless @dst__sz
+ * is zero.
+ *
+ * If the flags are valid and BPF_F_PAD_ZEROS is set, the unused portion of
+ * @dst is cleared on success and all of @dst is cleared on a copy failure.
+ * Unsupported flags return -EINVAL without modifying @dst.
+ *
+ * Return: The number of copied bytes including the NUL terminator on success,
+ * or a negative error code on failure.
+ */
+__bpf_kfunc int bpf_copy_from_user_mm_str(void *dst, u32 dst__sz,
+					  const void __user *unsafe_ptr__ign,
+					  struct mm_struct *mm, u64 flags)
 {
 	int ret;
 
@@ -3689,7 +3766,15 @@ __bpf_kfunc int bpf_copy_from_user_task_str(void *dst, u32 dst__sz,
 	if (unlikely(dst__sz == 0))
 		return 0;
 
-	ret = copy_remote_vm_str(tsk, (unsigned long)unsafe_ptr__ign, dst, dst__sz, 0);
+	if (unlikely(!mm)) {
+		if (flags & BPF_F_PAD_ZEROS)
+			memset(dst, 0, dst__sz);
+		else
+			*(char *)dst = '\0';
+		return -EFAULT;
+	}
+
+	ret = copy_remote_mm_str(mm, (unsigned long)unsafe_ptr__ign, dst, dst__sz, 0);
 	if (ret < 0) {
 		if (flags & BPF_F_PAD_ZEROS)
 			memset(dst, 0, dst__sz);
@@ -4924,6 +5009,8 @@ BTF_ID_FLAGS(func, bpf_iter_bits_new, KF_ITER_NEW)
 BTF_ID_FLAGS(func, bpf_iter_bits_next, KF_ITER_NEXT | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_iter_bits_destroy, KF_ITER_DESTROY)
 BTF_ID_FLAGS(func, bpf_copy_from_user_str, KF_SLEEPABLE)
+BTF_ID_FLAGS(func, bpf_copy_from_user_mm, KF_SLEEPABLE)
+BTF_ID_FLAGS(func, bpf_copy_from_user_mm_str, KF_SLEEPABLE)
 BTF_ID_FLAGS(func, bpf_copy_from_user_task_str, KF_SLEEPABLE)
 BTF_ID_FLAGS(func, bpf_get_kmem_cache)
 BTF_ID_FLAGS(func, bpf_iter_kmem_cache_new, KF_ITER_NEW | KF_SLEEPABLE)
-- 
2.55.0

