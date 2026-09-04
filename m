Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD454CC273
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533659; cv=none; b=lmA+T1wZS770V0Gir/OtziNoKweIZeD//fvp7QlB1ziiiztGimPxignNyYJzZ8sz+M/fe+8DBSDAYTJekRr2vfno4oYMDy4PMt4Jc0zXzcu0+Z1XGUeNBQh6yGL7IBS/YtP0mf1IVx9Ew6xsw0sUYTmygZfQDsDGdtP7ZgEqEN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533659; c=relaxed/simple;
	bh=xspFFxFjYAqvjceAxqadMuKixodXwHOZDcpMBk8R9S8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DxiO4HqwsmClxb2URniKS2/x/rNY9/4JVnDQYKZv11MRZv8fZOuWO4iXBjFNcRRnptLCyCZwitnPcCymuWQdhHWXDu73bQo4YOXC04RuP1qoZut2IpV0Hp4wAzEa8UTApNurjPacyU/loc0tncatp8f28zYymiEAzdHHOMROevg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0vS7Afq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0vS7Afq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso10806655e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788533655; x=1789138455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gy3RmBcuruQaR7WrIBsKEmLLWdsVsMuBKWJEzmGMhsc=;
        b=a0vS7Afq/9alZgZ0Jawly0EImxLdLm3wmU3Lbei8CJpMIuKK2s6N3ocv5PmL4MTfSc
         Utlj6PSuqXis/oJ3bPt51u0II+NWov9xI1FJOhJ/qWk+WqoaSqHUqWLgDcsTJA4i85wn
         hbCVRE7y4P+EOm9dcXyE2dsSnHnZ6DEV/bk1pXlyK2T8742QX8rlQBh7ntobMfSRe66N
         z3w/+n91+QMncpncv7Cu9T+8UIeRVoCssiwXI+dvzGjyEpEIvuK6/PvNHg0BYvwfmShc
         ms0xWapNJ11iy2vAxzav20fAcsJ3dpRP5aQeoVry+bBucjnji38Y4UtmgCjrgNOTk9/B
         0dOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533655; x=1789138455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gy3RmBcuruQaR7WrIBsKEmLLWdsVsMuBKWJEzmGMhsc=;
        b=X9V3ko+jWXs5Tm0aIbMETwfxvYxk2tBcl7w+UEY+Sz0o3Q7ZIx2ULM5B+L4KHnj2iz
         XaQxezpyC3edmoir/OqQ8+xIptLo58rucJ4+I6ehCjSOqFqUu5KqCxVH600qyPTLjTbA
         sJzN33yQZxTHWf50CeYQ+svqNCnUIfLJPz6qOhWtauP7Vgt/D74kuOPDz387tGKWtzp+
         Bv6zH5+CPPlbW9S3noDv4llbVtnYhsJOvDhVcEHOE2KpFnMQB337lsWTHeJjvu7ZrHCw
         iCP8MEZsPL3TTG5Crk88wO1lfabRuxxuhQLu14A802Vxo+82UuXyiS/olxSO8QEIAyJw
         ebEg==
X-Gm-Message-State: AFuF++k1C588Fk0A0US/tNu3+zn8XTpyvo54eAjSaa7z2TSEL1TdPe9R
	SRryv5aOSvlEXEjcqIJQa+7dI15bU6k950WKyGi8dkoYoWgtraCNCfgo
X-Gm-Gg: AYBFou33kSU0HIlbk10XEEftYCSkIdK4brdWpP36LJcugdfnTJOrj1oz3n4wxRiKLYQ
	FCr8kgsoNijgaunWh4R0H7MOnt9AGc0PewpeuZeatE9uaPSG5+NE/RHKxSDYg83wuyLhjhtQTht
	rwBI7ApEENhJ1eGG46/Hl/Xtko7qXhZ71MxR+WRO3bijK7vCNzMHkxW0AGFtlkkeznfMKPyQC59
	I8q7w329e2rMWuc/VkUPVLBbWVOI/wMo67n2xdLFdEMstiUbRPOPcTpky0rZ2CfkMYTVXmDFcTG
	uOWkLU+yFP5LFaBBJDT5jEQeIskmJR2YxQIY0/b23Rn987CfNSS/2Jody4hq9R37SCvGPSNnv+b
	Il/b6BsMefDn8oHsufHZ84b9DFP3GqBADFV2SG8Gse+CWRRdE+HlS03yb/Wt/eexRSOPNDdeJNb
	NTbDlsDke+1rjfmpJCmpLwMf6k9DdMsy7/zbEH4KkWCzrBvg+VWK7kCCzc2ztxeZSZm5uIRivqD
	A==
X-Received: by 2002:a05:600c:a6a6:b0:49d:3:1f96 with SMTP id 5b1f17b1804b1-49d00032134mr4877525e9.15.1788533654774;
        Fri, 04 Sep 2026 07:54:14 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885cb03asm6802799f8f.37.2026.09.04.07.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:54:14 -0700 (PDT)
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
	sun.jian.kdev@gmail.com,
	tasos.papagiannnis@gmail.com
Subject: [PATCH bpf-next v4 1/7] mm: Add copy_remote_mm_str()
Date: Fri,  4 Sep 2026 17:53:34 +0300
Message-ID: <20260904145340.40212-2-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904145340.40212-1-tasos.papagiannnis@gmail.com>
References: <20260904145340.40212-1-tasos.papagiannnis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

copy_remote_vm_str() gets the target address space from a struct
task_struct. This does not work for an address space that exists but is
not yet associated with a task_struct, such as the mm held by struct
linux_binprm during exec.

Add copy_remote_mm_str(), which operates directly on a struct mm_struct.

Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
---
 include/linux/mm.h |  2 ++
 mm/memory.c        | 33 +++++++++++++++++++++++++++++----
 mm/nommu.c         | 33 +++++++++++++++++++++++++++++----
 3 files changed, 60 insertions(+), 8 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 485df9c2dbdd..eede435bf4a3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3222,6 +3222,8 @@ extern int access_remote_vm(struct mm_struct *mm, unsigned long addr,
 		void *buf, int len, unsigned int gup_flags);
 
 #ifdef CONFIG_BPF_SYSCALL
+extern int copy_remote_mm_str(struct mm_struct *mm, unsigned long addr,
+			      void *buf, int len, unsigned int gup_flags);
 extern int copy_remote_vm_str(struct task_struct *tsk, unsigned long addr,
 			      void *buf, int len, unsigned int gup_flags);
 #endif
diff --git a/mm/memory.c b/mm/memory.c
index 6b8280cfc1db..4c5f0b629889 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -7141,12 +7141,15 @@ EXPORT_SYMBOL_GPL(access_process_vm);
  * Copy a string from another process's address space as given in mm.
  * If there is any error return -EFAULT.
  */
-static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
+static int __copy_remote_mm_str(struct mm_struct *mm, unsigned long addr,
 				void *buf, int len, unsigned int gup_flags)
 {
 	void *old_buf = buf;
 	int err = 0;
 
+	if (unlikely(len == 0))
+		return 0;
+
 	*(char *)buf = '\0';
 
 	if (mmap_read_lock_killable(mm))
@@ -7218,6 +7221,27 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
 	return buf - old_buf;
 }
 
+/**
+ * copy_remote_mm_str - copy a string from a remote address space.
+ * @mm:         the remote address space
+ * @addr:       start address to read from
+ * @buf:        destination buffer
+ * @len:        number of bytes to copy
+ * @gup_flags:  flags modifying lookup behaviour
+ *
+ * The caller must hold a reference on @mm.
+ *
+ * Return: number of bytes copied from @addr (source) to @buf (destination),
+ * not including the trailing NUL. If @len is zero, return 0 without accessing
+ * @buf. Otherwise, @buf is always NUL-terminated. On any error, return
+ * -EFAULT.
+ */
+int copy_remote_mm_str(struct mm_struct *mm, unsigned long addr,
+		       void *buf, int len, unsigned int gup_flags)
+{
+	return __copy_remote_mm_str(mm, addr, buf, len, gup_flags);
+}
+
 /**
  * copy_remote_vm_str - copy a string from another process's address space.
  * @tsk:	the task of the target address space
@@ -7229,8 +7253,9 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
  * The caller must hold a reference on @mm.
  *
  * Return: number of bytes copied from @addr (source) to @buf (destination);
- * not including the trailing NUL. Always guaranteed to leave NUL-terminated
- * buffer. On any error, return -EFAULT.
+ * not including the trailing NUL. If @len is zero, return 0 without accessing
+ * @buf. Otherwise, @buf is always NUL-terminated. On any error, return
+ * -EFAULT.
  */
 int copy_remote_vm_str(struct task_struct *tsk, unsigned long addr,
 		       void *buf, int len, unsigned int gup_flags)
@@ -7247,7 +7272,7 @@ int copy_remote_vm_str(struct task_struct *tsk, unsigned long addr,
 		return -EFAULT;
 	}
 
-	ret = __copy_remote_vm_str(mm, addr, buf, len, gup_flags);
+	ret = copy_remote_mm_str(mm, addr, buf, len, gup_flags);
 
 	mmput(mm);
 
diff --git a/mm/nommu.c b/mm/nommu.c
index ed3934bc2de4..94e3709e95fd 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -1716,13 +1716,16 @@ EXPORT_SYMBOL_GPL(access_process_vm);
  * Copy a string from another process's address space as given in mm.
  * If there is any error return -EFAULT.
  */
-static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
+static int __copy_remote_mm_str(struct mm_struct *mm, unsigned long addr,
 				void *buf, int len)
 {
 	unsigned long addr_end;
 	struct vm_area_struct *vma;
 	int ret = -EFAULT;
 
+	if (unlikely(len == 0))
+		return 0;
+
 	*(char *)buf = '\0';
 
 	if (mmap_read_lock_killable(mm))
@@ -1752,6 +1755,27 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
 	return ret;
 }
 
+/**
+ * copy_remote_mm_str - copy a string from a remote address space.
+ * @mm:         the remote address space
+ * @addr:       start address to read from
+ * @buf:        destination buffer
+ * @len:        number of bytes to copy
+ * @gup_flags:  flags modifying lookup behaviour (unused)
+ *
+ * The caller must hold a reference on @mm.
+ *
+ * Return: number of bytes copied from @addr (source) to @buf (destination),
+ * not including the trailing NUL. If @len is zero, return 0 without accessing
+ * @buf. Otherwise, @buf is always NUL-terminated. On any error, return
+ * -EFAULT.
+ */
+int copy_remote_mm_str(struct mm_struct *mm, unsigned long addr,
+		       void *buf, int len, unsigned int gup_flags)
+{
+	return __copy_remote_mm_str(mm, addr, buf, len);
+}
+
 /**
  * copy_remote_vm_str - copy a string from another process's address space.
  * @tsk:	the task of the target address space
@@ -1763,8 +1787,9 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
  * The caller must hold a reference on @mm.
  *
  * Return: number of bytes copied from @addr (source) to @buf (destination);
- * not including the trailing NUL. Always guaranteed to leave NUL-terminated
- * buffer. On any error, return -EFAULT.
+ * not including the trailing NUL. If @len is zero, return 0 without accessing
+ * @buf. Otherwise, @buf is always NUL-terminated. On any error, return
+ * -EFAULT.
  */
 int copy_remote_vm_str(struct task_struct *tsk, unsigned long addr,
 		       void *buf, int len, unsigned int gup_flags)
@@ -1781,7 +1806,7 @@ int copy_remote_vm_str(struct task_struct *tsk, unsigned long addr,
 		return -EFAULT;
 	}
 
-	ret = __copy_remote_vm_str(mm, addr, buf, len);
+	ret = copy_remote_mm_str(mm, addr, buf, len, gup_flags);
 
 	mmput(mm);
 
-- 
2.55.0

