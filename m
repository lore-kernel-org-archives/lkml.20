Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6A54E13F4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533680; cv=none; b=Q+JzH90YLwKG4DtfBQxvyU3JUmtgVjK5uhJxnS+DEonAmlOjCMWK8ApH7ouihtBFLj4dYSRxg/ecA98okY40ihkehUK+RRo04PNUTFCuySLsIRLsmXxWvgtdMcUtIMft+zfjwD+zSEvwDRV/aBVWZ6jTP8PUgcV69ApoprzwjVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533680; c=relaxed/simple;
	bh=BoToj5o8PqZre7KOXTIXCd/pmWvmBwSW+UyCYhJUVPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvjMBAmHZ+6gunOilhPP3q4q06kWUnOagwpb5v8n7WTATrcOkhelvyKZj6ejoquJ2zxDEKn0YDkFa8h7t9dgtph2VTOjOXetW3WtUn+9X3OjQ17AcgnLgKP/sM7EoTJs/Xp0N63XwM8M79xODwz+2YTl+R+tslnZdX7x9uaxAGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mq7LrrBn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mq7LrrBn"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so10200805e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788533676; x=1789138476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/JbBdz368b9964VnW5n9v0EGlaen6tXu6qawPHYWGBI=;
        b=Mq7LrrBnyLqd71OfFuLGy646HUZ2usMhGEIR81g2nApPu1yKjh0zmcQ1Y5jbj1pcPp
         mbn4hGmYlpHb5h/qxBS3xnO6xdBHVaqR/FDeHF7icqkRHU5z3zNxCbld7bYQDcqm2qdL
         RBZBT+VNmUKyqdg924bgpdpJ2oJrodu8uxQjXB28CpgZhiiYrCYxLL14nf+dhC6nloVf
         T7RdXjynd+Ax+/8kA40UkCDFeJ+QimFzmXpNs2LuskmCsC1WVDoSb3qsGXnH86zjqWdQ
         ogZj9rh9maHtPDzerSw5DgHR1l8D6Xtia8D/lWWZ06WybDsViUK/lMzJfVtcfpx0AVqO
         kM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533676; x=1789138476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/JbBdz368b9964VnW5n9v0EGlaen6tXu6qawPHYWGBI=;
        b=h/bD9r0ML+xw2yITzsigbFdLoWSZAiVcNMesdWUSJFsY8IJWAM1mh0RdUsi3ow6UDS
         tLI3BbECVgLL0msSRcq/QYTh3g3AbmnHdFkbTgQED9FKHZgZroAo75Ceve0JHK/BQ2PT
         u1VvJhMpqifkoXfJxyJJ+nANH5Z2MpF1Cwet4KH7mWWyYI2lT051s/0vdDyREpMIAVJx
         nsKUng9dZuZfeL2xcS/sWkb+DGtVYPpEB4S8hbEv1my4+wdkSA2B2ac6ond5r64TXW4z
         HeU3v9v9YTbRc5fhZo2xTa/ZoRDWdwktaAY0/yfzBTeFW9rcR4UW+gwJeAStxDeNnDM3
         zUdA==
X-Gm-Message-State: AFuF++mpRo3IFwExNplj2rRxtwYBAuyDw5rCvfGtFm5YhL6QJAufmdB5
	5YCe+Vw6jv563ZRc27R+5bQBfgafMY6oJviyIweQxMWWuPYhmWH6wDkp
X-Gm-Gg: AYBFou26Ii9voVmhOecJ/kEMMhMEdtrCFeDYfrS0lW6UAYS0NBFNGM5ViNNvf4amX65
	wB2uc3cfZ4eRsIYSR3vYNCOqekU/F5q2+1MrEkdswqY2DMR41Mge/6sYJYkiGERBjMbNt6qR6Ow
	Kpm+3PKka8hhw4MF1Inoj4CFWtvQQNAWZzV5wqSgMwbodyEB2+bVl31O3JUP4JSWi7hF+B0A/YO
	jlVd41Mmvh+cXA1W/+vMoERJz2UJaNuBnxwP7j9weFsNlMWjMluvmdsyp41iZAPEg6JdFfr3qSk
	hacENrHSGloGc6iFUOIeecFhvccw5gCwuHWwIeyh6Adk4qPUU1XaFLVNSZ3ardlYvlsKluTIcFF
	+8ZtUqoe8eygjbxHgOQl8jqlX9b1XBRezCffZ5M6XRhZujsV1duyEsck5L8lWVahumIeCU/Gflf
	UUXASDGnJxX6nBxOOHkYdeW81ykFQ8TuYRiC/jgNWGLkOrw/FFJzeskXpjqNwSoI77OgtV0STUE
	XV3woAxoxL9
X-Received: by 2002:a05:600c:4e90:b0:49c:f3dd:e166 with SMTP id 5b1f17b1804b1-49cf826ca60mr61264505e9.13.1788533675701;
        Fri, 04 Sep 2026 07:54:35 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885cb03asm6802799f8f.37.2026.09.04.07.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:54:35 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 6/7] bpf: Mark linux_binprm->mm as trusted-or-null
Date: Fri,  4 Sep 2026 17:53:39 +0300
Message-ID: <20260904145340.40212-7-tasos.papagiannnis@gmail.com>
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

Mark linux_binprm->mm as a trusted-or-null nested pointer so BPF programs
can pass it to kfuncs after a NULL check.

The field is either NULL or points to a live mm_struct whenever BPF can
access a linux_binprm. On successful exec, exec_mmap() installs the new
address space before begin_new_exec() clears bprm->mm. The bprm_mm_init()
error path clears the field before mmdrop(), and free_bprm() clears it
before mmput(), as ensured by an earlier patch in this series.

Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
Reviewed-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 kernel/bpf/verifier.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 386401fe051d..584c79326b9c 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -5958,6 +5958,10 @@ BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct dentry) {
 	struct inode *d_inode;
 };
 
+BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct linux_binprm) {
+	struct mm_struct *mm;
+};
+
 BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct socket) {
 	struct sock *sk;
 };
@@ -6012,6 +6016,7 @@ static bool type_is_trusted_or_null(struct bpf_verifier_env *env,
 {
 	BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct socket));
 	BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct dentry));
+	BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct linux_binprm));
 	BTF_TYPE_EMIT(BTF_TYPE_SAFE_TRUSTED_OR_NULL(struct vm_area_struct));
 
 	return btf_nested_type_is_trusted(&env->log, reg, field_name, btf_id,
-- 
2.55.0

