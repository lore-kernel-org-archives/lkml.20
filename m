Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878E952122B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799988; cv=none; b=Q5M4CPz6elfqY6kLX2s7H6QS/6TDS8ry/YAxsGZZLnAGIiZ5qrmmk+VgGcwkx21afFqJLh2+Zja2lywrtKSO6Jp60MmAkFn9rrl0USbfhLtPrMkEw7An77p2UjiDfljyCRdWn8sHaFpGJpcGRWjSs7ZHOcsUdBHz3HDOzH75QdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799988; c=relaxed/simple;
	bh=R3NKE8VV7/HGFaVaAkyaFS//KWA1lQPQoXgESTqRSFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwRnoQjrCqmnAnC6ZmAOGpc2iF/hpdZv2lvEUFhc9Pg9MMb1zwFgOUeDf0uYCzwi2gKDax85joOnTQ3xyRRZJxw52DGHmeZflqA6wVFe3N07r8dUG1JpZCHjysmGY61Vfdih+fEWfWxsKM06EWEVJJxrFlfNNIk/NLJ4liZHHZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQfgxVBd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQfgxVBd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so29955525e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788799985; x=1789404785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAeQPdPGwWZkycRcbqHqvUFSglicl66turt58h60TpQ=;
        b=qQfgxVBdYHALDM8ysUetakrcOL/+wv44doC0iXNdGiWZ+YeOeYKW1cU0cYuhF7sQ6p
         5G+R3jnC4IQIsn8CLP7ChtEvJiKd59FPO7lCdi74pgxBOf/8IyoxAtnN3AuE8r15hOjh
         hzXllWXyex75czpT14rftxHj7A2YDKDV87AWWNuIknMAkViO7pKno+8npEqiOBi4usQr
         wxX0T7twXd/9BuIbreM3NqQT/0luxObM2+VtTnXB899GSLyZsub/8vPfyitpOX6tTdrL
         0NCaWIeQ2CyO7BI2pJRW48vhoCpEv3zBythIKSvMPF6rYPIvyoZELWyuFISiJitzvgAT
         JqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788799985; x=1789404785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAeQPdPGwWZkycRcbqHqvUFSglicl66turt58h60TpQ=;
        b=puTQWd9Hs1zgRSy8/KElZjvcMR/CdYXaojUaSburA5kLXJc9cL/D/yIk+eZxCkB0el
         9WHbUgbHeACPl3vm7ArlGTTpkpOVWrKE/uPSjbuVrUDrch9BfDRM5FBKUJXX52vAHZBi
         WPfoKkmmJhdsnyDMUsgntl3hhlGxQPYiTvbiXp3xBc67yyuqi+mi2+oL7nnLvuE2M+kN
         lr/aaO7XcRjV3e3pyoaF/0wSZ5MoQ9auVS7QQr5uNEAehdEN84puv8jZixS+4zQ4qj+W
         w+lN/MOf8k22UHE3kAU5a0V4v42T9MqV82DROIDY1N2mP/Lp//o8sLIPRApsRBpy83Uw
         DIdA==
X-Forwarded-Encrypted: i=1; AKwUvBzftKIRi74sxdYnBBo/Az+TU04dwGEHQMnPPrzQIBpvjIOhJ8cNchDgrP4n0/npVJgA0bLVdOPKM/2ueNw=@vger.kernel.org
X-Gm-Message-State: AFuF++ntWrDwCe9i6A8utMXmsHew7AmhCy7gv3AUjMLCphCpIvQ4DZz8
	dWEiCCvOQ0D86Yd8zQGUYc4ewwbsiXuCsGGd0YfiFHX1brT8eXT9L/Sb
X-Gm-Gg: AYBFou2InWl8w+N6n4xXCUa/lorpciM8Ir8S/2NEoC6RNixeK+eVpZMLCWNGqR39y3t
	OIdKSHnCRf0y/tn5wUmjvFS8h5Z7PGSjX5MJ4mwytmEUpw3wVyZXbPtSvoKNxTCcOUn9R51Weo3
	3gCl0MZikMOAk2M1Z04OYOGYKpwAmE8U8aNr1jTn38lkPHurtO5oeUHVaz9q1aMEjKYuS/qcpO5
	FG62I1HYcxQ8/beJIiu9YkwZLtGu4kRmpStVntIJsRT2wA6bdgLz/TlDVhGUj0FJ4AbkpxSNJir
	nvdREAPEQMMofTJ3TQO0LjZNAfDtNmomVOw06icLaa9Ijs4JEXiXTIInL4KDWf8N7DQ64/QSGUp
	7fNadAy3XK5IKNcgQTlChEy6O47Pv7p4vG1H8V6xYhn7w1NFhYSxbKTspeYlV9uVmFqbRxSL/Gh
	tkUkcl9bL5dLzeYUk91NSh06iM7BBRUTTV6ISBAFt1GgAhE+8lj9sEHsuVFwYFrgcZd2X0cbGYb
	g==
X-Received: by 2002:a05:600c:474a:b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49cf823f60amr212091925e9.11.1788799984684;
        Mon, 07 Sep 2026 09:53:04 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm233022415e9.13.2026.09.07.09.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:53:04 -0700 (PDT)
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
Subject: [PATCH bpf-next v5 4/7] bpf: Allow reads through trusted-or-null BTF pointers
Date: Mon,  7 Sep 2026 19:52:17 +0300
Message-ID: <20260907165220.52431-5-tasos.papagiannnis@gmail.com>
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

Currently, a trusted-or-null pointer
(i.e. PTR_TO_BTF_ID|PTR_TRUSTED|PTR_MAYBE_NULL) has to be checked
for NULL before it can be dereferenced. Marking a field from
PTR_TO_BTF_ID typing to trusted-or-null can reject programs that
previously dereferenced the pointer directly. This is useful as we
need to mark new fields as trusted in order to pass those as arguments
to kfuncs.

Allow reads through pointers marked as
PTR_TO_BTF_ID|PTR_TRUSTED|PTR_MAYBE_NULL without an explicit NULL
check. Treat these pointers as potentially faulting so the reads happen
through BPF_PROBE_MEM. If a read produces another BTF pointer, clear its
trusted flags and mark it as PTR_UNTRUSTED.

This applies only to reads. Other cases still require an explicit NULL
check. After such a check, the pointer retains PTR_TRUSTED and can be
used normally.

The unchecked read path has two consequences:

1. It uses BPF_PROBE_MEM, which is slower than a normal load. An
   explicit NULL check refines the pointer to PTR_TRUSTED and allows a
   normal load.

2. A faulting read returns zero, which is indistinguishable from a
   legitimately zero-valued field. Programs that need to distinguish
   those cases must check the pointer before reading the field.

The next patch updates current tests and also introduces more checks to
ensure this change does not break anything.

Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
---
 include/linux/bpf_verifier.h |  9 ++++++++-
 kernel/bpf/verifier.c        | 12 +++++++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index 9727df5af83a..4f032ad83c67 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -1339,6 +1339,11 @@ static inline bool bpf_is_ptr_to_mem_or_btf_id(enum bpf_reg_type type)
 	}
 }
 
+static inline bool bpf_is_trusted_or_null_btf_ptr(enum bpf_reg_type type)
+{
+	return type == (PTR_TO_BTF_ID | PTR_TRUSTED | PTR_MAYBE_NULL);
+}
+
 static inline bool bpf_may_fault_on_deref(enum bpf_reg_type type)
 {
 	/*
@@ -1346,7 +1351,9 @@ static inline bool bpf_may_fault_on_deref(enum bpf_reg_type type)
 	 * protection, that is, the ones bpf_convert_ctx_accesses() has to
 	 * turn a BPF_LDX into a BPF_PROBE_MEM one for.
 	 */
-	return type == PTR_TO_BTF_ID || (type_flag(type) & PTR_UNTRUSTED);
+	return type == PTR_TO_BTF_ID ||
+	       (type_flag(type) & PTR_UNTRUSTED) ||
+	       bpf_is_trusted_or_null_btf_ptr(type);
 }
 
 static inline bool bpf_prog_has_arena_ctx_arg(const struct bpf_prog *prog)
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 9e79750e2480..b5186e664aea 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -6168,6 +6168,15 @@ static int check_ptr_to_btf_access(struct bpf_verifier_env *env,
 	if (ret != PTR_TO_BTF_ID) {
 		/* just mark; */
 
+	} else if (bpf_is_trusted_or_null_btf_ptr(reg->type)) {
+		/*
+		 * An unchecked load through a trusted-or-NULL pointer is
+		 * fault-protected. Any pointer derived from that load must be
+		 * untrusted, as a fault produces a NULL value.
+		 */
+		clear_trusted_flags(&flag);
+		flag |= PTR_UNTRUSTED;
+
 	} else if (type_flag(reg->type) & PTR_UNTRUSTED) {
 		/* If this is an untrusted pointer, all pointers formed by walking it
 		 * also inherit the untrusted flag.
@@ -6644,7 +6653,8 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, struct b
 		if (!err && t == BPF_READ && value_regno >= 0)
 			mark_reg_unknown(env, regs, value_regno);
 	} else if (base_type(reg->type) == PTR_TO_BTF_ID &&
-		   !type_may_be_null(reg->type)) {
+		   (!type_may_be_null(reg->type) ||
+		    (t == BPF_READ && bpf_is_trusted_or_null_btf_ptr(reg->type)))) {
 		err = check_ptr_to_btf_access(env, regs, reg, argno, off, size, t,
 					      value_regno);
 	} else if (reg->type == CONST_PTR_TO_MAP) {
-- 
2.55.0

