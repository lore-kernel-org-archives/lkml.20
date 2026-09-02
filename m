Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E5A3B388C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378444; cv=none; b=cdApO0NymW/CG6Id6NxBX2gOzZ1C67h6niGWq705MMObPsa3DLRCGWM18AML0mU+EBUmsqK09eioVYSAYSkoIP67miijWaYP8CFGgppOroGs2+1WOBzpg00GU/ss7JR6hMMH3L+DtUoTAcXE7p2/XHaf3x5j6TUxYJBT0A91GKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378444; c=relaxed/simple;
	bh=0nDpyHAZVWDLsoBhhy63Ifby8fFRcSPcb4Ws9onqaLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VqPZijOpMQLeGeK2BZ90p77EPATxJv1kLG0pCNyXbWOr61vNCnfQE7er5Q9Dk1NBpO3HrnCbpnI4vWB79WGpJEjaY/7kdXAU1MKAZA3oG3+q6oxynRpIMMJxccufDemv8UV8jSLQXa33mHVf6ahecP3SbVxWxxESdZveEeYFqQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=JNrTBf0Q; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="JNrTBf0Q"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9387752a4d0so134003985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788378425; x=1788983225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwKfYOaniBtFKBvRoVSK69Bg/ErimmVxxQRLm+ngzMY=;
        b=JNrTBf0QaqiJDpswctkn5+CjUZNAAAW0SellCxPU4lcN/kf+eoAXqdf243NdTrkwyI
         PWSnrGVu/E9VS2/SIp+hykiDowIqM7WldrqNVoNnmJeYvLo1EgIeE93PDWWqsi+EYqXF
         hqo11CYhlUS56yzIqBqdPduY4K0m1+Ke5TXYH5Sd7ObQ7x08xUHEGXBwCJbdftHhPeeX
         2cXNW+UWJV9rAj5GHfUUZL+Toab7eJ0Rt8GkeHaXYfMZs4l0hyTJnyC+NIYi7wCuQ3bC
         7XLEFs2oMNGLmS7qUdQfwPu0AKFM8wHSsKGQG1IAF+ZHeiNkQKO2nS3XjxoceH2Y1bjV
         9RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378425; x=1788983225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kwKfYOaniBtFKBvRoVSK69Bg/ErimmVxxQRLm+ngzMY=;
        b=jdfjbcWd4Zl+IX0tJ4eNFw14lgFvyxkAYsxcSABs2CLjj0r2iFunxckpZ3I08Pjz60
         uuHFXA0kp6Bt8z0Oo6cp6S9i8d5ECc6TGBuRHtbBq625dwic4P901HPNPMJtxMwxBC3I
         CzQwy6ZBHFnlhqHd8zFUo/qs+q/6ksik/s2GuhI3e0SYzPOX/KpE+yjcitrw00gMLgVq
         VR2p8LwGxR7Eg+RAdCWAf0GsQIU+BjlcDg60iJcKmOFOFQaXgcg6b9Tf2dhxWPERHEkL
         SLJhoSGpEAH3FNjuXnyKhSuqLHTdQfnZrVW7NCuQWJKHx1rcF2iQS9LbjJzkJ1cMwkSw
         oy+Q==
X-Forwarded-Encrypted: i=1; AKwUvBx3R06KEvj5nafwyGN57u9VmNX4Kgwbd7a03L0f/jUvBmIZu0kSAsOt3SWBQlBFu+SU9+IJXnMBeJ2wXKg=@vger.kernel.org
X-Gm-Message-State: AFuF++m44117aPQYZtQSvC+UGJN/jdaxgpZlhKS8EKVFSuX2uRR1hYlR
	GvVB2iCAFopjjgrY2lZ3oEWLAZXjj06+pnHPjTY0T3zMFp3ZJC68HsftFq90FRIjWjI=
X-Gm-Gg: AYBFou2GTp/oFcPjaR+3oiBWzbmgingNkbc9mCWgM3THuxA9/n9PkaJ0QBPpYg5ViRT
	2YiQ4IP5H8ZujNk1MjX0CkntMKPE79AbSvzasxZbjD+I57gYoimYSUKW2qmLrXofICaUdxSNTNn
	z2LFskEXZXRhtTzlwe/zRxUooEXYVcGEIg7Z7+uqa+CyOh3HqfRYOoWZGO8V+99Z0KzXUkpJm1N
	7jNxG9D/Kcm5/ksFQZMS4OnA8qFMgiBqKyGAsvkYK6X+7gws3VD7bSSR1+g9fIWcjpA0NBEfx+9
	VyAjFQdR1CYydOIC+960s9T6Xl87NQgqzIu430DgxqKxZguJsZ0SMte7A99znsBXlokZWVaiwdG
	jPz/KYxftwvWOaKp+fYENe+Vzc9rJsKty+2tfLG8XOisF+cBrAUHB+PcQP9VfTpZBaJ5W6m7SRM
	bXDg12i3hMR1JFrZUMeHK2ibc8itcvrQVBlRT0Iug+zl7XYE1dEsXBf3nQFXzT7HrMrHBknHJ4b
	Ubq9y2LPoIE/4uVWDJmKDMglw5iBkwdYWiuCr+palN3yg7NKQ==
X-Received: by 2002:a05:620a:4586:b0:930:9585:e08e with SMTP id af79cd13be357-9396f83aa9cmr61071585a.10.1788378421813;
        Wed, 02 Sep 2026 12:47:01 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f18801asm299300585a.16.2026.09.02.12.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:01 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	shuah@kernel.org
Subject: [PATCH 1/5] mm/mempolicy: add mempolicy_create()
Date: Wed,  2 Sep 2026 15:46:53 -0400
Message-ID: <20260902194657.79075-2-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194657.79075-1-gourry@gourry.net>
References: <20260902194657.79075-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_set_mempolicy() builds a validated policy and installs it into
the current running task.

An in-kernel user that wants to construct a mempolicy wants the same
validation without the install step.

Add mempolicy_create(mode, flags, nodes): it allocates the policy and
contextualises it against the calling task's cpuset, and returns the
mempolicy to the caller (or ERR_PTR on error).

do_set_mempolicy() is deliberately left alone rather than reimplemented
on top of it.  For syscall users, mpol_set_nodemask() and the current
task policy swap must run under the task_lock(current) acquisition.

Export the symbol to kvm for use in guest_memfd integration.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 include/linux/mempolicy.h |  3 +++
 mm/mempolicy.c            | 40 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/include/linux/mempolicy.h b/include/linux/mempolicy.h
index 65c732d440d2f..aef018ad92317 100644
--- a/include/linux/mempolicy.h
+++ b/include/linux/mempolicy.h
@@ -128,6 +128,9 @@ void mpol_free_shared_policy(struct shared_policy *sp);
 struct mempolicy *mpol_shared_policy_lookup(struct shared_policy *sp,
 					    pgoff_t idx);
 
+struct mempolicy *mempolicy_create(unsigned short mode, unsigned short flags,
+				   nodemask_t *nodes);
+
 struct mempolicy *get_task_policy(struct task_struct *p);
 struct mempolicy *__get_vma_policy(struct vm_area_struct *vma,
 		unsigned long addr, pgoff_t *ilx);
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 2ad0a5f18280a..da133ffe0b1c8 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1085,7 +1085,45 @@ static int mbind_range(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	return vma_replace_policy(vma, new_pol);
 }
 
-/* Set the process memory policy */
+/**
+ * mempolicy_create - build a validated, cpuset-contextualised mempolicy
+ * @mode: MPOL_* mode
+ * @flags: MPOL_F_* flags
+ * @nodes: target nodemask, or NULL (interpreted per @mode; see mpol_new())
+ *
+ * Creates a new policy and constrains it to the task's cpuset.
+ *
+ * The caller owns the returned reference and frees it with mpol_put().
+ *
+ * Return: the policy (NULL for a default policy), or an ERR_PTR on failure.
+ */
+struct mempolicy *mempolicy_create(unsigned short mode, unsigned short flags,
+		nodemask_t *nodes)
+{
+	struct mempolicy *pol;
+	NODEMASK_SCRATCH(scratch);
+	int err;
+
+	if (!scratch)
+		return ERR_PTR(-ENOMEM);
+
+	pol = mpol_new(mode, flags, nodes);
+	if (IS_ERR(pol))
+		goto out;
+
+	task_lock(current);
+	err = mpol_set_nodemask(pol, nodes, scratch);
+	task_unlock(current);
+	if (err) {
+		mpol_put(pol);
+		pol = ERR_PTR(err);
+	}
+out:
+	NODEMASK_SCRATCH_FREE(scratch);
+	return pol;
+}
+EXPORT_SYMBOL_FOR_MODULES(mempolicy_create, "kvm");
+
 static long do_set_mempolicy(unsigned short mode, unsigned short flags,
 			     nodemask_t *nodes)
 {
-- 
2.53.0-Meta

