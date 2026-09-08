Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9F5559302
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875659; cv=none; b=QxAp1YYREEgP1WgvXTQojrd6s3NfCpQeNGFMnzW7LAnKUFEkbG10I9sYX5b2rGsF5tElRlgU+Ekarb97dcGz5/avFCIcSurirJa7/oLnjdDeJ1a2h7L/34TjVNnW0UjcNUr3Q8hkE6rPrx4XShPK9vHCqpQFrStxEj+aqaqr/5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875659; c=relaxed/simple;
	bh=nn6iDL8B9k+PR6cXXKfLJz/cPg/XodyTbC68/H77o/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gin9JCNjMwsIaijTs5kB/3zwgmrgPVI1JZFcTg1z6VW7Dm2tAzhb8uLgFYtLg1uCCNBuXq5l6ytj/OdTBzI8q1hLKnJ110deaOSwE0wX43R6EX2jKt30Kq2eMhjoTN6voD8sN9eWBsopZFlaaCgLINZDvpCWPvYgIeZ/6QPsD4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmEdKU6F; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmEdKU6F"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48436216a98so3240343f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788875626; x=1789480426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EkB8DRl1+/pAks8Eb/LLAKOiFOjTpgaq+26U4zD1T/Y=;
        b=OmEdKU6FFfX3cTa3ls6LLkUB8mwlzpWVRknNJQPZ/X2keZku5/s8ry1o9zd57mYitL
         XsLehqLvUHpnRReQIJtNlh2J9kuMKD6Bg3qSuA7jLcTOblSMUnrF2tDUlZTIGdap2FyB
         l8h9XCEeQg/Y60hCdatflWmzMqhVopXvdHtHoyVd44EhRnSzsFuWzx55YTBuGl1jtZl7
         QMUEFj5PQ6nsi9vPEcf/MhKvvTTSg//A6Ic8zu0b/5LhyLIfxrEC7edGeEfKOWB/1At2
         p03jcq/oL3zaSRHCC/rAauQtbCDIPu3MZBUeGOZr4y8LalORiJ+coVjdHQdDgGtLTP1c
         Lklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875626; x=1789480426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EkB8DRl1+/pAks8Eb/LLAKOiFOjTpgaq+26U4zD1T/Y=;
        b=dU2FMgpz5iCg1sXl27MdY/yNdZ/5ZnryDZyVU/D7KVGdbN7d+tx1alIdXJoUHsxbwA
         gDKejDwiJiiK+lYvAsBX2IiL8WkSHbFPUqqHC6EQ/JH6czt0RpTIICwYh4AxNqQMwnWD
         nTwqmDPJMzDSM4L2zvxqvWvUW9LXUMXuC9U9AwTUdTx1843VPMmquaFl4IszzVLzuKvj
         0L7bQw+RQtpoWP/kVs9dXuTWQHO6XgWWUwz2+gbcH39666BZd/ELvknnHZCF7upw5EHH
         wcoMbApRt1Jvj3M7yA2zsOf5/HUC8PP1d3BSe6h7xw+SfWRdkYeGq//AfL0VcA6zzg4U
         n3YA==
X-Forwarded-Encrypted: i=1; AKwUvByp2daGwMQzSH7czVpjgAirm/clVSeTtgZfd9g9eK6iAlErk0wc9RRcp1o+A20G08awK+VlbZxZZr4KApA=@vger.kernel.org
X-Gm-Message-State: AFuF++nqTYek1dJ5Sg9sPCmJumd7pbglngqSmt5xRK/cdXJDoeRDqqyw
	Y9jRyjJfdigHiMcA3GzLUWoTHo7QRZ3bnDYBS4Rn4meRM6GMcgzBIgHK
X-Gm-Gg: AYBFou3lE6Z1I4Vd2e4IXWhWOM6IhK6HMwjkIZIuQTbSws04jCVmgGDlPJ1ctEmdy4q
	ZvewE2p2GMRGkPyj2KwbwRVdL2exWbSkR5tX6QLfjH7kn084tFuEwwu+NEzB0igAtUibbnwC6I4
	nxDU8qdKduvWVLaUzwGANzLaDJrF8fWzZsWE2SJOgtGz2ChyHukOkKer0wErJtduX0hhM0PzzVe
	A53evQXVRpoH7EOhdLfJJjSEEOQX4BxCn+xLOhinGfG8FKcqJ4B2oGNn175pAHdallXJN1MLkbR
	efb7fsQNNtrdziVgY8b0oPy/+6vuV1ODs+amA7ABykTedu5O0gP7jDg+eHjuY+rJAm+akyAvOMo
	09ia6NrgUJfnsxUG/sw62DDR0W7PsZDRyXEGd/dIGCux0n9iM6JkDf89Khes7WzDr0h2nSJmk5N
	WMBHzlbVf97h3hEMNAXkdStK9gewwi8iQaDRhbgjnJkp29EowT2OULmg1eRkULBcfGN9Hk7DMTi
	e3h2TiTjPKS
X-Received: by 2002:a05:600c:34ca:b0:49c:ee36:10fc with SMTP id 5b1f17b1804b1-49cf820e13bmr281314635e9.8.1788875625455;
        Tue, 08 Sep 2026 06:53:45 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm377235005e9.3.2026.09.08.06.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:45 -0700 (PDT)
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
Subject: [PATCH bpf-next v6 4/5] bpf: Mark linux_binprm->mm as trusted-or-null
Date: Tue,  8 Sep 2026 16:53:01 +0300
Message-ID: <20260908135302.74963-5-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908135302.74963-1-tasos.papagiannnis@gmail.com>
References: <20260908135302.74963-1-tasos.papagiannnis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark linux_binprm->mm as a trusted-or-null nested pointer so BPF programs
can pass it to kfuncs after a NULL check.

The field is either NULL or points to a live mm_struct whenever BPF can
access a linux_binprm. On successful exec, exec_mmap() installs the new
address space before begin_new_exec() clears bprm->mm. The bprm_mm_init()
error path clears the field before mmdrop(), and free_bprm() clears it
before mmput(), as ensured by an earlier patch in this series.

Update the existing LSM selftest to check bprm->mm for NULL before
dereferencing it, as required for trusted-or-null pointers.

Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
Reviewed-by: Sun Jian <sun.jian.kdev@gmail.com>
Reviewed-By: Matt Bobrowski <matt@bobrowski.net>
---
 kernel/bpf/verifier.c                   | 5 +++++
 tools/testing/selftests/bpf/progs/lsm.c | 5 ++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 9e79750e2480..791b3d25caa5 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -6004,6 +6004,10 @@ BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct dentry) {
 	struct inode *d_inode;
 };
 
+BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct linux_binprm) {
+	struct mm_struct *mm;
+};
+
 BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct socket) {
 	struct sock *sk;
 };
@@ -6058,6 +6062,7 @@ static bool type_is_trusted_or_null(struct bpf_verifier_env *env,
 {
 	BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct socket));
 	BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct dentry));
+	BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct linux_binprm));
 	BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct vm_area_struct));
 
 	return btf_nested_type_is_trusted(&env->log, reg, field_name, btf_id,
diff --git a/tools/testing/selftests/bpf/progs/lsm.c b/tools/testing/selftests/bpf/progs/lsm.c
index 7de173daf27b..7441d66c080c 100644
--- a/tools/testing/selftests/bpf/progs/lsm.c
+++ b/tools/testing/selftests/bpf/progs/lsm.c
@@ -113,6 +113,7 @@ int BPF_PROG(test_void_hook, struct linux_binprm *bprm)
 {
 	__u32 pid = bpf_get_current_pid_tgid() >> 32;
 	struct inner_map *inner_map;
+	struct mm_struct *mm;
 	char args[64];
 	__u32 key = 0;
 	__u64 *value;
@@ -121,7 +122,9 @@ int BPF_PROG(test_void_hook, struct linux_binprm *bprm)
 		bprm_count++;
 
 	bpf_copy_from_user(args, sizeof(args), (void *)bprm->vma->vm_mm->arg_start);
-	bpf_copy_from_user(args, sizeof(args), (void *)bprm->mm->arg_start);
+	mm = bprm->mm;
+	if (mm)
+		bpf_copy_from_user(args, sizeof(args), (void *)mm->arg_start);
 
 	value = bpf_map_lookup_elem(&array, &key);
 	if (value)
-- 
2.55.0

