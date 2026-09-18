Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1264B4053
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722691; cv=none; b=IqWDFxn2HiiBi7oAVGfpJUdQdC05dL3Lb22kxjFh6VLV7Kk5spXhfvjgVxOPPUdn26Rr4AiB+/U8IsfGRwgUL7fHamZne/uQOlKSE/qvc3AGb4W3sj6FacUpJ1O9v/x8oinfymxV/iTlHBLUjloJA/zr5JmcZAeqCYyfG7emGjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722691; c=relaxed/simple;
	bh=WysipF1mqedAt7TWX+jnDzYCZRvt4e7MAMvf3MNSBSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6ohkMjIgCZo+Uhp3iXNzcj/e1h4fxX4H9I5vPu0jrhf9BzPD8/7Er1WvNLa0blO/dtZNSMlbhhdL4eDSOUbOhWLl81Jho1qo1Fiqfg+Lic2iTBVC5ICqAKm4hK3ihCv0Mi4e1R94IY6qyL7y7Giu54oFRSN9UyTVIo5IFRmzU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pz3y81+y; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pz3y81+y"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so2033155e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789722687; x=1790327487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgg2ZQjMkxD6u2VdMZWByOLhVUwC2QQ6a1L3XaBvWsU=;
        b=pz3y81+yTEYBs/nCGr4BdpncXFqyfLOXSJg6Hpy8MEYPbSGKLNwb65l5JgAvKSE8/o
         ZP8K+5lC4KOP2poyYvWTjsO+xiywk+dGxn3evSsk+N5d1OsC1d5PY8dTw//2AWcnEW4U
         rQ6qFf2heHi6qJvOUZx75Nvlgh2T6no1W9jFjxYBn4/qkDhdSev7KmQzU2+b4h/2wdA/
         GJB4QJdd5B/i3+z2Ccx1Xgf0yOgE1zxoy56Gwl6KePfzVVNaidRJdqrc+4npjOcoK4RF
         lsnUphTW5B6UM945yUzPoO7FPM2DloZpZVeS3o3LGxAhY6rFEP06jhlpNo4CNaQfduz8
         WIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722687; x=1790327487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vgg2ZQjMkxD6u2VdMZWByOLhVUwC2QQ6a1L3XaBvWsU=;
        b=T234zNGil6D8KCV5/O5sukQqacjJBszhckLhU0oa8azJBUHCjp9xAbLhYnncOxrC6b
         bpTpOLv1EJYcBni+vdx3RKDj6sUI3u5Tcwv9aRDofDA+o4/np0Eh8dJj571TURD7pfNp
         /Y9dA9Cx3ZUxDYoudKNe/2LReiSkmsTUTEwT1DbLf+9aniqbqjQcdHawy/0uyFf+OS15
         t7yTPCEDVLGu9ymBna7/GS11tZnkXWSq3cKBLg0qjrf3ErlO52JWEQwu46ncgiiNHX6I
         7GKB24DTxWS701KS4ZOq1rmNsJ20vlZ93HzFaYdlURCDa9tNumYggz+NNkXmYWkzxdx7
         NPmw==
X-Forwarded-Encrypted: i=1; AKwUvBxoXsLLjqHNaWDWKN4CtL7ccdmbXRRxVv/YYkrJI4Nb77X00ZppOS33OE4QY+IFvXHpeOr2fW4XXBpJf1o=@vger.kernel.org
X-Gm-Message-State: AFuF++nxG7guyeHvAcTvdIVcVSkw3swq1TVfvirZnU2c8srrf6CI+yBZ
	kw8Xg/zzkH919yM7GsfV70MQhnbI7aGt7OikimyDlN3uaVKbhwNEfSip
X-Gm-Gg: AYBFou0tWdlM9a9eSoSInhBJqgecF+4kjxnEjwl/1wMzL0KUhCVKxsYHA1UT5t3yogX
	p8LzYs3+WrBTN+1ftm0O24/W2vAUJJ89W/FetsZtKFCRbo5X/Q9F3EvK4PJAFmF6sixJ1fzTod7
	QlthQqL/CFJ2cySCVUlOoiq8i2iUtIHf6GAckOsAfEIXlHOVTekAK4IbxAiE9hfnQ5mih+tAe9J
	mAueJ59/ow/bt1+wpQ9i3+xiFSqfr2oxKHbmzk7sjYWbGjgdOrbGga6r52ABOng7XHsliZ0lTvm
	EntchhNo8te3wjHxlnhP1fYaLsA7RpBtXJw1nlJkeashLqzaTHTfkf7LbyGNc8rRVW0VcODdO5w
	Ww0OjqMP9MnrbbVgprAEWfXC6F7C1O5p72fpIcPBLwNlJ630fLc/cuvRxNUSgHq+eFwBfUNnbp4
	Q6cA75p4bFzVBOnKGHAZnt03jnACF4RMEh76qafGicXiEIxnb+pcQ1Rjrp5to00xolkP4Z9hbeP
	U1Byci2K9bYYbU=
X-Received: by 2002:a05:600c:83c9:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49fc4ff402cmr25215605e9.10.1789722686994;
        Fri, 18 Sep 2026 02:11:26 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b4e:8500:290c:210b:1c76:5710])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1d0978sm138774275e9.2.2026.09.18.02.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:11:26 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: bpf@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	andrii@kernel.org,
	ast@kernel.org,
	brauner@kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	kpsingh@kernel.org,
	ljs@kernel.org,
	matt@bobrowski.net,
	memxor@gmail.com,
	song@kernel.org,
	sun.jian.kdev@gmail.com,
	utilityemal77@gmail.com,
	viro@zeniv.linux.org.uk,
	tasos.papagiannnis@gmail.com
Subject: [PATCH bpf-next v8 3/5] bpf: Add user memory access kfuncs for mm_struct
Date: Fri, 18 Sep 2026 12:10:56 +0300
Message-ID: <20260918091058.297740-4-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918091058.297740-1-tasos.papagiannnis@gmail.com>
References: <20260918091058.297740-1-tasos.papagiannnis@gmail.com>
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
existing BPF user memory helpers cannot access it.

Add bpf_copy_from_user_mm() and bpf_copy_from_user_mm_str() kfuncs. Both
take a struct mm_struct pointer directly, allowing callers to access
trusted address spaces that are not associated with a task_struct.

bpf_copy_from_user_mm() has similar semantics to
bpf_copy_from_user_task(). bpf_copy_from_user_mm_str() copies one
NUL-terminated string and returns its size including the NUL terminator.
It accepts BPF_F_PAD_ZEROS to clear unused destination bytes on success.

Refactor the task-based helpers and the new mm-based kfuncs to share
static internal implementations. The task-based interfaces validate their
arguments before acquiring and holding a reference to the task's mm for
the copy. No behavior change is intended for the existing task-based
interfaces.

Register both new kfuncs and mark them KF_SLEEPABLE because accessing a
remote address space can fault.

Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
Reviewed-by: Matt Bobrowski <matt@bobrowski.net>
---
 kernel/bpf/helpers.c | 130 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 118 insertions(+), 12 deletions(-)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 051b6654e57c..f6b3eee6098a 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -679,9 +679,44 @@ const struct bpf_func_proto bpf_copy_from_user_proto = {
 	.arg3_type	= ARG_ANYTHING,
 };
 
+static int __bpf_copy_from_user_mm(void *dst, u32 size,
+				   const void __user *user_ptr,
+				   struct mm_struct *mm)
+{
+	int ret;
+
+	ret = access_remote_vm(mm, (unsigned long)user_ptr, dst, size, 0);
+	if (ret == size)
+		return 0;
+
+	memset(dst, 0, size);
+	/* Return -EFAULT for partial read */
+	return ret < 0 ? ret : -EFAULT;
+}
+
+static int __bpf_copy_from_user_mm_str(void *dst, u32 size,
+				       const void __user *user_ptr,
+				       struct mm_struct *mm, u64 flags)
+{
+	int ret;
+
+	ret = copy_remote_mm_str(mm, (unsigned long)user_ptr, dst, size, 0);
+	if (ret < 0) {
+		if (flags & BPF_F_PAD_ZEROS)
+			memset(dst, 0, size);
+		return ret;
+	}
+
+	if (flags & BPF_F_PAD_ZEROS)
+		memset(dst + ret, 0, size - ret);
+
+	return ret + 1;
+}
+
 BPF_CALL_5(bpf_copy_from_user_task, void *, dst, u32, size,
 	   const void __user *, user_ptr, struct task_struct *, tsk, u64, flags)
 {
+	struct mm_struct *mm;
 	int ret;
 
 	/* flags is not used yet */
@@ -691,13 +726,16 @@ BPF_CALL_5(bpf_copy_from_user_task, void *, dst, u32, size,
 	if (unlikely(!size))
 		return 0;
 
-	ret = access_process_vm(tsk, (unsigned long)user_ptr, dst, size, 0);
-	if (ret == size)
-		return 0;
+	mm = get_task_mm(tsk);
+	if (!mm) {
+		memset(dst, 0, size);
+		return -EFAULT;
+	}
 
-	memset(dst, 0, size);
-	/* Return -EFAULT for partial read */
-	return ret < 0 ? ret : -EFAULT;
+	ret = __bpf_copy_from_user_mm(dst, size, user_ptr, mm);
+	mmput(mm);
+
+	return ret;
 }
 
 const struct bpf_func_proto bpf_copy_from_user_task_proto = {
@@ -3659,6 +3697,68 @@ __bpf_kfunc int bpf_copy_from_user_str(void *dst, u32 dst__sz, const void __user
 	return ret + 1;
 }
 
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
+	if (unlikely(flags))
+		return -EINVAL;
+
+	if (unlikely(!dst__sz))
+		return 0;
+
+	return __bpf_copy_from_user_mm(dst, dst__sz, unsafe_ptr__ign, mm);
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
+{
+	if (unlikely(flags & ~BPF_F_PAD_ZEROS))
+		return -EINVAL;
+
+	if (unlikely(dst__sz == 0))
+		return 0;
+
+	return __bpf_copy_from_user_mm_str(dst, dst__sz, unsafe_ptr__ign,
+					   mm, flags);
+}
+
 /**
  * bpf_copy_from_user_task_str() - Copy a string from an task's address space
  * @dst:             Destination address, in kernel space.  This buffer must be
@@ -3682,6 +3782,7 @@ __bpf_kfunc int bpf_copy_from_user_task_str(void *dst, u32 dst__sz,
 					    const void __user *unsafe_ptr__ign,
 					    struct task_struct *tsk, u64 flags)
 {
+	struct mm_struct *mm;
 	int ret;
 
 	if (unlikely(flags & ~BPF_F_PAD_ZEROS))
@@ -3690,17 +3791,20 @@ __bpf_kfunc int bpf_copy_from_user_task_str(void *dst, u32 dst__sz,
 	if (unlikely(dst__sz == 0))
 		return 0;
 
-	ret = copy_remote_vm_str(tsk, (unsigned long)unsafe_ptr__ign, dst, dst__sz, 0);
-	if (ret < 0) {
+	mm = get_task_mm(tsk);
+	if (!mm) {
 		if (flags & BPF_F_PAD_ZEROS)
 			memset(dst, 0, dst__sz);
-		return ret;
+		else
+			*(char *)dst = '\0';
+		return -EFAULT;
 	}
 
-	if (flags & BPF_F_PAD_ZEROS)
-		memset(dst + ret, 0, dst__sz - ret);
+	ret = __bpf_copy_from_user_mm_str(dst, dst__sz, unsafe_ptr__ign,
+					  mm, flags);
+	mmput(mm);
 
-	return ret + 1;
+	return ret;
 }
 
 /* Keep unsigned long in prototype so that kfunc is usable when emitted to
@@ -4925,6 +5029,8 @@ BTF_ID_FLAGS(func, bpf_iter_bits_new, KF_ITER_NEW)
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

