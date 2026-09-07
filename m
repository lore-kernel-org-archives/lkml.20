Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9AE4FB9DF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799994; cv=none; b=S+xeDSf0hOMndACPiwo+/t9cfCgqqWkkXOOoMhZbreiYhM9omi4iP13Zo0XVLhayU4lhTEg+9v9gyrW7XJ4fARO8psQbcpSO4q0WDM0gA1b9mphSfezLOqOdAq9/EeZ9+dqMhmqDPuvPoJJRTsY/u8LW0kooFJsq+g7ctj24qPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799994; c=relaxed/simple;
	bh=37ZkkZNqxkhdoz/COm3n2Pon+sMf3f11UDjmNND0D2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/ijtPMwyROtd3VmsjGXrvFapInlTOIMEOXn6WrqxQZcfwzBtKRIwOB+PLt9Rfld7ObYbLqrEGFfX1hd5IU561IuOtarBp+ZmZkQ0eaGyWt7+O6NcZ2JeG8J7QN+wle2DLm4B1gsZA+1U7LkMTnIFhU9mIgTbERnUMM5LzdS82k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmw1WqJC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmw1WqJC"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49557167508so45587035e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788799991; x=1789404791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXEATw0LCoNw3+DI3xDTgsz8l5QDzPtCPOwXyA9u26Q=;
        b=hmw1WqJCHRhE3G87DR1g4BeBvh/68di1WUMzePtbbPNHpnNepsaWsyTZ058+17dMhj
         becWdVE0tzS8gom2LRDufMLM68HqVeOYy5QQI/HZMHR6X+aRPgZK/IKqGpMBiUpHgJ8G
         ghckD/wRZpeyY0vw/6wij58gXw0sDZ1t9uVkDQDnKbQiCAh98PxeGMqfES4xWaRKeBur
         MIxWCaHT778rCG7i4VkFPENR+3Y8fQFZOLkL0lUrRu2lcOVaW4j1zjTkKrtULdtMvD/d
         fyLvy13dXZXB/dftz/kymru7gvQ0MsKdRpXePwQ+ONRQ6BOtKfu21Wb0DFV9eZtq5DsZ
         T/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788799991; x=1789404791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OXEATw0LCoNw3+DI3xDTgsz8l5QDzPtCPOwXyA9u26Q=;
        b=kwyj2XSGn1/jGOY2680QoyMxz7mOV9F6zkju0jsCb6RG/nm4KHXd6Z/xxblajGI9xn
         K4AyXmQ9JA3jVHdy/f/jY4m4kSv50vN3ayMpaR9miS0lHzmCBKRoAOF/zymr/rT8h+sW
         HaTvRlgrEQtuOfzNtsbvqWRFhHzd1FSbVn4Kcs4FXlPi5uPlWcqe+cyUwlTtsYu8OrGM
         P6+AkW6ylzF6t5rN0ZzPP+7rjiQA28AYWEx7zknTGcoA+i0Lt2ZxynhZ9w3eeuoHLR3c
         BQkDIydkz5E8lMdb8CHk8vQe/wP5mFZCeNKWBL3yxcPnJWcQVvwMNYzjWm9oYkAL5Zg1
         gOEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjsl/ekShHks9XGgXInmqjMYUpROUS0WAavD1GLVZnCRYMXpph7BwAPQtZw2McRyG/L+VjRM19j8Lk+ug=@vger.kernel.org
X-Gm-Message-State: AFuF++m0UzQlWokJCUx3NNyKlJjtQiFWzy3KlRGnv1CiR5mMaflAQynA
	0HfHTDreHAJWkUHxZJF/ekRTyhsXTi+DtCY4PDgLtQAjX3QY5BIf/UoE
X-Gm-Gg: AYBFou0xALiEGV96vxCfpTYttGX1oZqf+3CGbFy59v0s5EqpH+FCdqmolT+jdzEyWl6
	GL5q84eUeKoCPkaJRjj9SAkcUWt+hmFozGeepkahB5tBiKYuCqtN6OhC9xT7yo4+TR+ZZZI5DvD
	VP5hr3vhMsVj2LxbJvFjxu1BphHZ91bqXuumG9qJwbeDILJu6AnXK54JWY2VV5ERS+KtmCs+eDe
	7BDx2PfOiyi6PI97kb/B6yMCIAn7ZL6F5nFiKAECn2GctIUJSFBtCny3BeLhBdz2RRe5WAQjaYr
	ml1xqOByCelkGOeI02/RYbheY2AMx5VtkNfwMthS8ENj9+rSGz7etbsLbk5Q47xsutU30fbXpOh
	vhQPV3UhFLoeVxNBtLX5BmWXYGA9QhPkILtoPEceh55TYZvWuZQZ3dDteLTJxHDY6xeNvP/Coqo
	ncnA9l+v1pyTNFFEWl6LtfxX86w8IgrZzOtQS27G+FKJ7fC3dQ/W3s83nksuwtCdXV23czWaOE2
	w==
X-Received: by 2002:a05:600c:3485:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49cf825c119mr525133835e9.16.1788799991022;
        Mon, 07 Sep 2026 09:53:11 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm233022415e9.13.2026.09.07.09.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:53:10 -0700 (PDT)
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
Subject: [PATCH bpf-next v5 6/7] bpf: Mark linux_binprm->mm as trusted-or-null
Date: Mon,  7 Sep 2026 19:52:19 +0300
Message-ID: <20260907165220.52431-7-tasos.papagiannnis@gmail.com>
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
index b5186e664aea..6799d9e080fc 100644
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
-- 
2.55.0

