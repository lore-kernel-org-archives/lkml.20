Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF2C3AB28F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459419; cv=none; b=AVKZSjLxTjfOXl7pRq3bgWuTMByeINQo5V+SxXU38Q8yOHoiVQbAyenUIZ4xA9OLYp0SNm2XEdkUoKPHw/xfrVaMzcjO6BAJNFKvbFlPlZyxjmwH6Qkj52vk3RAkDBQ9KD4hduWWmTWCJzhDyfs25DT0tDGvcwdFxPNEEwOYm2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459419; c=relaxed/simple;
	bh=Q/Mlj7u02ffjMHUUly5ZVRZxAUczNu/Z2hQt+HvgIbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o8akxF47i+ldn7aI4UPZd6NZpc4dQ95SlV4ZQWMjHuBckPwSEOq8F+fzF3nE/C/1ci2MYpNU/zOSy4eUs6cZML68A0FlecC4NN9gLNLHUbcyBkLv6NvPeeJAnfibI+BL5ya1TcY4gBa6ifNv7JKaF13jWmkWlhHQqs5rFyyZ5/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2V0VAyY; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2V0VAyY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f88so1640912f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459415; x=1790064215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByCPXnnC7KpXzoaLnGFreo/33oFOqB5OMw022838T44=;
        b=V2V0VAyYDjWOSmolt2VQBx7u9YD2XsoSEIC6QS2XjYOVdI47wfloaFUjuINacZLJ64
         sU8axkFwfXcYrqcM32QN05tt1ZIK/RLHh40MNaUA7Kz1VeDwLjYEnDk183Aq6Q1Zauvx
         8pDIhvssvfpLns9f8VuWtKR0TA2eBqkULeCbyGp06hz1mHjocsmrw6QrecoYMsP1LZej
         A2Ky65IQjpazIEfNOcJ2OArCesJHp1xL7Zu9WxwzLBq9ISy1+Stps6RqcoZNG3G0OBCg
         w+sHmLTcvGCb7JR4razaJKq/sWhFSJ3iOjlgplicJqiWHEPo/U7dKVZXkPpBsUmwM6p/
         fRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459415; x=1790064215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ByCPXnnC7KpXzoaLnGFreo/33oFOqB5OMw022838T44=;
        b=pxv12kFJWYSkI6epaAsPPSbKQETdy1r/OcosswmkzhBkTdzhjrImJhWYQB+dXl/uT1
         22PdLVEuSYtBe2YaLnTvB6SFWIGTv1lkVUUScmJ5zyS8SJkE3eVaRSgj5JXEyaYmKORB
         oXMq8GDvKsvGGboJ8q6mddVjXFcxaMBtsC/X+gOr6Wgka4IBG1mKxqKxqvnFtxO9weg/
         TIU0VkD17crF8WM1MPx6rnHx3vNuM8oQRT+8CUisLTyF4ap8sRy8NSOJ5Qnm57NLaviE
         PN5ApWvwSoVoegA6jUHN+IzvLGoNFL+7nXXURDk5ldmSgUGRFLJ0962dkxRXiU9TECok
         P85w==
X-Forwarded-Encrypted: i=1; AKwUvBzmyhOs9UbkezNKI/5A2+STZMJUEwNMC/I7FqvLdWeMjH/E26Hxao84q9MBTmAB1YMUgOLWgrbftVJlXa4=@vger.kernel.org
X-Gm-Message-State: AFuF++mPWxpQdssd4WLSM2xPcAZjq8xf3410arul9iByy2jXY3KoXhsM
	ctHyqZ515NqizZBrrASax4x/C8QRIcv1DdvQamJk+mH6vmz7xXKmgOwf
X-Gm-Gg: AYBFou2Yh0G9edYkmqA5CrPI4N0Bgpxqx8oohIJlndGAzjTXQcLKvZr5jdNSBrgR9OK
	AuzbmzIRdAR0aYaCgCdDobuvcfaXufF1DVCTD7drigLhK1RGd1mjxQsJetWwVDxp8BsIRR7zS5s
	b+GBkw0NRpqItEaZcxhZffmfz2TbmAdAkwFpjadabyjHCmYIDmazvPUx2WCBF1Gciuyb3NSXLIp
	oCFys/rfK2f2jdFoos8/+xqejw7BTvguUv/FNUsRu3hAQltGLiRA5jHed/UQAYl2cxKH+3Wtj19
	lWQXyBqdZX5MNjoIIzqt6Wof5QALoBRQZV7NG5EwJ4Fd3gxDa+5MzD752Jnyl1EscQ+Iexv4T+9
	HFRsno4wb74zWoQwPxXn8BRx5RpxWg0kwYhmTZO3olMYM5u9MFyrAKzaMwskUo7+JAN/KKW2KWf
	S69oJMSxUOk83esslZ8Kfk9FvB5sbI/BQbdmOMpo2uPdefhoe1BA76huNrN727qz5zC4zEUBNjz
	gN3EajGuRF69gU=
X-Received: by 2002:a05:6000:178d:b0:487:77c:f6c4 with SMTP id ffacd0b85a97d-487077cf6f9mr1897099f8f.35.1789459414412;
        Tue, 15 Sep 2026 01:03:34 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b4e:8500:290c:210b:1c76:5710])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35c071sm33764675f8f.33.2026.09.15.01.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:03:33 -0700 (PDT)
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
Subject: [PATCH bpf-next v7 3/5] bpf: Add user memory access kfuncs for mm_struct
Date: Tue, 15 Sep 2026 11:02:53 +0300
Message-ID: <20260915080255.48929-4-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915080255.48929-1-tasos.papagiannnis@gmail.com>
References: <20260915080255.48929-1-tasos.papagiannnis@gmail.com>
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

