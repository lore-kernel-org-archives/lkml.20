Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1CB51D513
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799977; cv=none; b=Xxkre7mCPEklSayKNpY6brULOZQ74nbtUcvr0bdsjlejSrALlEO/MpYb+YX5LLYSwWnCb3yHDZvLOE42yyb8jasbvz7yLpcu9pQQoLabVPh91OLoy5CvIkIBk544/l8lyc3SbTXy7aZfW9A3HyQ8qcmgNBiMloXVlUTuDYh9sso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799977; c=relaxed/simple;
	bh=Q0tWSBlQLFk3oEvXn8y4hkhcwkljNZY80ooFvpI2RrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SiHSIa7Lnwt5u0MEBi1goZE3nWvgmKxKZg3zHErhlxbeT0tPKM4rIobB798ApyPZhqbcnNmxaIBCu26zQLCxhsorpyTJxYTIDZM6x03VbZDJ2RjIEj7jrMAa//9AP/6fjumd3X7zuQwXJsOUoCH7GLp1Ylegg4nda4EG11M92hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9dAsqCs; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9dAsqCs"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47de0093c42so3648719f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788799974; x=1789404774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYJwxo5Nb9UiMMNksSdgP6g3PKaxvBMYGoOE/hW9Rkk=;
        b=U9dAsqCsC1Ng7j2pEbxxLUChmGYvpqUervfvREs7heCNRIOn9cu9aMRFNGKnSknHYh
         C2fzC0K9xb39/myBFYeRVx0hBDg5E8IxTeGv8un+Cfc+9Nehw7osc1sVHg5QZOdbPF47
         yfSFYlde+XetyaAago/GAJPiihSea7kU1TF0Sizw2mw0kdeWHTMohDTkWjyqlPed9mm9
         sWQqemLNx+AFhc1cNhBSKi6o5I1gjYYdoPQZEJMDKIAOYPenHBeIjyb9LB2YihTIWlAA
         QKT0rBPph+hU9wAV3xVc1MbGyc5PlG68LUcG2d0ob5Cmh3L36EmrkZOJCC6WZQIsjigb
         s8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788799974; x=1789404774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYJwxo5Nb9UiMMNksSdgP6g3PKaxvBMYGoOE/hW9Rkk=;
        b=BGlX0738VZK8ITvfjDkNEAmEtN5QQjuHIkt7aihbqfPvCisl8xZyYsqP3fnWGSL+KJ
         PLsHJw7lCVG3f8Juzq/Xix6WHcHmCaVt2SGvZGNrBdwCF8uWmzsvMJH7R0Uk8agTIAZu
         SGW+Bm+njmAqqgLTv4ze+UMmKBIxa8eA2LDMczZhQ/kwvnlpqO6NXErHNqATSw89Xyp1
         U2rRtUTjgRkP2ZC7l2F0nlaEwGlj4AyYWpJpTB5Kdub73LV2NcfsSZCg+9IyxiPS/LEf
         CDKWBbRllxY9Y6LhUfEEClV0+QdIQJISr6X7q02NjSGhLwLFdWxY+xuBNkWvq/gnXWGC
         NtVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwuM1PVacK/IIuDoRlJ1EREwO2s46g6zPfCTfPmKn40UfgVcQnoSKGBzWjCLQnr3VCeo1eQJgpQkhbBKE=@vger.kernel.org
X-Gm-Message-State: AFuF++nJAXPBVHt04KMOMDrPz05BH8Fb8oNd+KmjcRYbQWOlMu9VYSOc
	Inpr+zHko+LkkImS83r8BKSz/iXinzChGwkw57LawwsSl/aD51h8ojHN
X-Gm-Gg: AYBFou2PiIBTpZMXAI9mbFNl6V6yoMl3RnUboA0RpkXLer42XprvfhRAzyEQMSyTYRR
	BYjHkqjEQ1iUIIrfVJbKAxsuhpvCulrHq5OmqdFIEBjCAi87lWiSfCd2/3tajh0838g7kuyGgww
	Zctgtzllya/tH+KMdxj0YZvKrV7Oz2cTawpmGxVhE7eOEaS3CXViqrHAtrcb35czND3NSjs2qYA
	8vxo/bwslZfEJgOciSQEZtDWr5wOEIQSjjnf93zuUf9hI1PgeONTSBK6uTwq3kNZFG65iKckWT1
	rvNB1NpnNprAiVz66U96X8R1zRkR5YZeY1WHEPV0RgtdbtqOcSGkG5PC8SKUaE/V0he05JH4QsD
	LbQHy96yjKCu68StxQuKIdT7JLyC0uCh2pKSK1WtZrp55NJzIPLp+5aTSGEvyTfzGIxRdL1svvu
	3ar3xdKXvsf5RGUhsoKgvKccbr7kPVUMuVVW6eLrOCMkXiCUH65SC5/QcY4jMgQN/3xO8hwCIi6
	A==
X-Received: by 2002:a05:600c:4fc9:b0:49c:fc6e:8cb9 with SMTP id 5b1f17b1804b1-49cfc6e8e1emr209497255e9.29.1788799973392;
        Mon, 07 Sep 2026 09:52:53 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm233022415e9.13.2026.09.07.09.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:52:52 -0700 (PDT)
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
	tasos.papagiannnis@gmail.com,
	utilityemal77@gmail.com,
	viro@zeniv.linux.org.uk
Subject: [PATCH bpf-next v5 1/7] mm: Add copy_remote_mm_str()
Date: Mon,  7 Sep 2026 19:52:14 +0300
Message-ID: <20260907165220.52431-2-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907165220.52431-1-tasos.papagiannnis@gmail.com>
References: <20260907165220.52431-1-tasos.papagiannnis@gmail.com>
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

Use a common internal interface for the MMU and NOMMU implementations
and define both public wrappers in mm/util.c. Preserve the existing
copy_remote_vm_str() behavior, including handling zero-length requests
before acquiring the task's mm.

Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
---
 include/linux/mm.h |  2 ++
 mm/internal.h      |  5 ++++
 mm/memory.c        | 41 ++----------------------------
 mm/nommu.c         | 41 ++----------------------------
 mm/util.c          | 62 ++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 73 insertions(+), 78 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index dd09c438fa23..d5bde1f71a97 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3326,6 +3326,8 @@ extern int access_remote_vm(struct mm_struct *mm, unsigned long addr,
 		void *buf, int len, unsigned int gup_flags);
 
 #ifdef CONFIG_BPF_SYSCALL
+extern int copy_remote_mm_str(struct mm_struct *mm, unsigned long addr,
+			      void *buf, int len, unsigned int gup_flags);
 extern int copy_remote_vm_str(struct task_struct *tsk, unsigned long addr,
 			      void *buf, int len, unsigned int gup_flags);
 #endif
diff --git a/mm/internal.h b/mm/internal.h
index 38b1165212c9..8264a346d18a 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -25,6 +25,11 @@
 struct folio_batch;
 struct hstate;
 
+#ifdef CONFIG_BPF_SYSCALL
+int __copy_remote_mm_str(struct mm_struct *mm, unsigned long addr,
+			 void *buf, int len, unsigned int gup_flags);
+#endif
+
 struct huge_bootmem_page {
 	struct list_head list;
 	struct hstate *hstate;
diff --git a/mm/memory.c b/mm/memory.c
index 8b0c2c735d3d..fe2f5e988fb9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -7331,8 +7331,8 @@ EXPORT_SYMBOL_GPL(access_process_vm);
  * Copy a string from another process's address space as given in mm.
  * If there is any error return -EFAULT.
  */
-static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
-				void *buf, int len, unsigned int gup_flags)
+int __copy_remote_mm_str(struct mm_struct *mm, unsigned long addr,
+			 void *buf, int len, unsigned int gup_flags)
 {
 	void *old_buf = buf;
 	int err = 0;
@@ -7407,43 +7407,6 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
 		return err;
 	return buf - old_buf;
 }
-
-/**
- * copy_remote_vm_str - copy a string from another process's address space.
- * @tsk:	the task of the target address space
- * @addr:	start address to read from
- * @buf:	destination buffer
- * @len:	number of bytes to copy
- * @gup_flags:	flags modifying lookup behaviour
- *
- * The caller must hold a reference on @mm.
- *
- * Return: number of bytes copied from @addr (source) to @buf (destination);
- * not including the trailing NUL. Always guaranteed to leave NUL-terminated
- * buffer. On any error, return -EFAULT.
- */
-int copy_remote_vm_str(struct task_struct *tsk, unsigned long addr,
-		       void *buf, int len, unsigned int gup_flags)
-{
-	struct mm_struct *mm;
-	int ret;
-
-	if (unlikely(len == 0))
-		return 0;
-
-	mm = get_task_mm(tsk);
-	if (!mm) {
-		*(char *)buf = '\0';
-		return -EFAULT;
-	}
-
-	ret = __copy_remote_vm_str(mm, addr, buf, len, gup_flags);
-
-	mmput(mm);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(copy_remote_vm_str);
 #endif /* CONFIG_BPF_SYSCALL */
 
 /*
diff --git a/mm/nommu.c b/mm/nommu.c
index 498e01ee40b0..98596e60311f 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -1746,8 +1746,8 @@ EXPORT_SYMBOL_GPL(access_process_vm);
  * Copy a string from another process's address space as given in mm.
  * If there is any error return -EFAULT.
  */
-static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
-				void *buf, int len)
+int __copy_remote_mm_str(struct mm_struct *mm, unsigned long addr,
+			 void *buf, int len, unsigned int gup_flags)
 {
 	unsigned long addr_end;
 	struct vm_area_struct *vma;
@@ -1781,43 +1781,6 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
 	mmap_read_unlock(mm);
 	return ret;
 }
-
-/**
- * copy_remote_vm_str - copy a string from another process's address space.
- * @tsk:	the task of the target address space
- * @addr:	start address to read from
- * @buf:	destination buffer
- * @len:	number of bytes to copy
- * @gup_flags:	flags modifying lookup behaviour (unused)
- *
- * The caller must hold a reference on @mm.
- *
- * Return: number of bytes copied from @addr (source) to @buf (destination);
- * not including the trailing NUL. Always guaranteed to leave NUL-terminated
- * buffer. On any error, return -EFAULT.
- */
-int copy_remote_vm_str(struct task_struct *tsk, unsigned long addr,
-		       void *buf, int len, unsigned int gup_flags)
-{
-	struct mm_struct *mm;
-	int ret;
-
-	if (unlikely(len == 0))
-		return 0;
-
-	mm = get_task_mm(tsk);
-	if (!mm) {
-		*(char *)buf = '\0';
-		return -EFAULT;
-	}
-
-	ret = __copy_remote_vm_str(mm, addr, buf, len);
-
-	mmput(mm);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(copy_remote_vm_str);
 #endif /* CONFIG_BPF_SYSCALL */
 
 /**
diff --git a/mm/util.c b/mm/util.c
index bf0513d1d3d0..2eca27b02791 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1061,6 +1061,68 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen)
 	return res;
 }
 
+#ifdef CONFIG_BPF_SYSCALL
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
+	if (unlikely(len == 0))
+		return 0;
+
+	return __copy_remote_mm_str(mm, addr, buf, len, gup_flags);
+}
+
+/**
+ * copy_remote_vm_str - copy a string from another process's address space.
+ * @tsk:	the task of the target address space
+ * @addr:	start address to read from
+ * @buf:	destination buffer
+ * @len:	number of bytes to copy
+ * @gup_flags:	flags modifying lookup behaviour
+ *
+ * Return: number of bytes copied from @addr (source) to @buf (destination),
+ * not including the trailing NUL. If @len is zero, return 0 without accessing
+ * @buf. Otherwise, @buf is always NUL-terminated. On any error, return
+ * -EFAULT.
+ */
+int copy_remote_vm_str(struct task_struct *tsk, unsigned long addr,
+		       void *buf, int len, unsigned int gup_flags)
+{
+	struct mm_struct *mm;
+	int ret;
+
+	if (unlikely(len == 0))
+		return 0;
+
+	mm = get_task_mm(tsk);
+	if (!mm) {
+		*(char *)buf = '\0';
+		return -EFAULT;
+	}
+
+	ret = __copy_remote_mm_str(mm, addr, buf, len, gup_flags);
+
+	mmput(mm);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(copy_remote_vm_str);
+#endif /* CONFIG_BPF_SYSCALL */
+
 int __weak memcmp_pages(struct page *page1, struct page *page2)
 {
 	char *addr1, *addr2;
-- 
2.55.0

