Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2795D20E023
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 14:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295338; cv=none; b=EcHquQPaGwdXCUx82GiRBiHnDtaCr4YH6lTGZqeGJAGSJvHf1JORWRDcXlLw2Sx37tZwYTZqWPj0kRuFB4O9VlZDNBlVNOK+ZQ3PvUMZkoNugURgt/24RApgivQUywQE8A7EzWrekgNNMvIAvw8ZoKKgQsiCw9UYPLsTm7IdofI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295338; c=relaxed/simple;
	bh=7a/r0c22USbKub7O9zDQbjz1OA+PpCzhZQ4bovs1osY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nRPmj3U759agzrXxTJaatE3L3gulfsei5yxjHWWqdG7IcufgsnD8jkoI7SyF247jRphuIw5udXcNcl0zMCzCpiOsBxAloQgMQL9MaNjGwoNtV4mRTFjtQRjAnF6rxftx5n9BrfPawP8zKqNv1dLUrg/F//E4n3yoDdRZU4vVxMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m69zvNik; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m69zvNik"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e4c00d71aso44246985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295336; x=1791900136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPvl7PbyU/2kfsD+JpTBP33aFuEJTpqh+wQCTs8+mrY=;
        b=m69zvNik5YVUvTfQ0uhiG8LZpmLKfmTHekzbYzXBppQ6UM7XSASAqO1rKNMTTlSXdt
         4hCkCYQCUy/vTeUiT2MsruwCC5Z58zv9zJbMctOUI7b4Gso1Iy4B8mhPmSrjjjyyRlM2
         Viu5WRjLX33rofQcJsfVR76OclD5TA5WKGXbd69n4z7Yk+o99Gt8woeAs1yixpAk0rWS
         kkreXRI5J2XNMB2oW7x/yW34OZCJWDscvjisqtCnfZPeZ3LHYEisHm87e+RKlBvoSGwd
         3W8qekX35wRvDYmq4LGczy5E0iH9Z7hCiX08ptX7nZmcyHy65M7WPqJj4Gfm1Ti/LPbH
         REZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295336; x=1791900136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPvl7PbyU/2kfsD+JpTBP33aFuEJTpqh+wQCTs8+mrY=;
        b=UVY1eep3QPcDu/6AwNPecimtlCtasN1ywCL154Me+Ynu5l26uWIy4PGahcvnzUYn+S
         wt5bdOxH2pQGKo3DnBGVwWxsBpGt4OiDQGHZIk+3PYPxyiwErtSqTq8Eu4maAFc5sZaM
         VOuXQECueRs/35T8sRhlD9rhSUroI1DqD9/y/qVpkiP3BZbZnL0Ref5ARKW366oqc1Xj
         Y4tZzkR432Rw12AiR7oTGHfaZwOF0p2LYkuGUZR3nsvzgLKrFyQOg/jQ/m4iJbD51CiR
         sPPYE3M39QE6ulsT779bl71OFRRtEdux2FxJ2eSbJ+Arf9UXsGRefNXl3t59Jjg438w7
         F8bA==
X-Forwarded-Encrypted: i=1; AKwUvBwPtnaA1rpxzBU1Fbb56/FL5NgfyjAA/jZcPrN8OAuI3gWSuM/+bqFWS2KKgH5a4Qnp+Gn8y5s35LwvZgY=@vger.kernel.org
X-Gm-Message-State: AFuF++m1U8acqV+TV+Ull37Ve4nNmRoFTB/7RyoXUhDMw3d0jB915B/I
	aPYiQMOYQ7z0LWpNUVH61ih4Rq7E1+wv5GMZ22Rquf/++5OFVOa3YMyB
X-Gm-Gg: AYBFou1cBCvf0uDBM5bqqSGzYktMGCbwlLI5MpUq1jNKxjnqL6PEp3T8244hS8ohv1o
	gDcNS9SDGQvV1B/AzPMH1ObCBySiv+CEEis4O8+kbdPV1+LcELZywhdstAWeWn9ZyywRD8tcOHc
	2Ix0cKFCn6iwCSr+uBL9ouLSoBOdiCbILD5Bzi2V37SKC6WFdGUkmrxoHNWMjqjkxUMpREaZI0j
	OZLxBySdsIZauIKNim/AlVMVWELJb7v6ygm4NuIK1Usmr4njuq7Hx9uPbgQ+Elnoco/UE4gIgsq
	GquuMxwHsM77Tnc/I3CPW8oo0IAX7wfguRqs8lGTJkEZr3TOSivuuEY7rtWtmSzbPb57zTNRZXa
	hxAn9teioHOT6PfYSChAgzz/8g5suVTZcNq3ZuGQVfAO7mfmFdbUHc+9sCr/u5zC7B/+eC1/jna
	qOeKmwUrIDk0fUt/oo4h1bHNzErejw30F6aWXHIVe5CpRS8zGszdlCO3NC054UBwMHklG31kaQl
	ppogKXB1yGe2r6yBvbOj1baIXRpkpNf/lLk6fJdDPr/77WUp7UiHzCdn0z2DaN49PWsB0BB0Yf3
	aRslSxNu
X-Received: by 2002:a05:620a:4101:b0:93e:4bbf:cc11 with SMTP id af79cd13be357-93e8f35972dmr280007185a.30.1791295335737;
        Tue, 06 Oct 2026 07:02:15 -0700 (PDT)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cc9d80ae3sm1138742185a.0.2026.10.06.07.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:02:15 -0700 (PDT)
From: Ziyi Guo <guoziyi114@gmail.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: samuel.holland@sifive.com,
	thecharlesjenkins@gmail.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ziyi Guo <guoziyi114@gmail.com>
Subject: [PATCH v2] riscv: futex: untag the user pointer before the atomic access
Date: Tue,  6 Oct 2026 14:02:00 +0000
Message-Id: <20261006140200.877263-1-guoziyi114@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001184355.2395068-1-guoziyi114@gmail.com>
References: <20261001184355.2395068-1-guoziyi114@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

access_ok() checks untagged_addr(uaddr), but arch_futex_atomic_op_inuser()
and futex_atomic_cmpxchg_inatomic() hand the raw uaddr to the inline asm
amoswap/amoadd/.../lr.w+sc.w through the "+m" (*uaddr) operand.  When the
tagged address ABI is enabled (CONFIG_RISCV_ISA_SUPM, prctl
PR_SET_TAGGED_ADDR_CTRL with PMLEN != 0), those two addresses differ: a
user pointer whose top PMLEN bits hold a tag passes access_ok() after
untagging, but the atomic is then performed on the still-tagged raw
address.

Supervisor-mode data accesses are not subject to the U-mode pointer
masking (that is governed by menvcfg.PMM, which the kernel does not set),
so hardware does not strip the tag for the kernel's own access.  With
Sv57 and PMLEN=16 the tag bits overlap the canonical-address bits, so a
tagged pointer can name a canonical kernel virtual address (e.g. in the
linear map) whose untagged form is a valid user address.  An unprivileged
process can thus make FUTEX_WAKE_OP perform an atomic read-modify-write on
an arbitrary kernel address, with the matching FUTEX_OP_CMP_* result
serving as a read oracle.

get_user()/put_user()/raw_copy_{to,from}_user() already untag the pointer
after the access_ok() check; do the same in the futex helpers so the
atomic operates on the address that was actually validated.

Fixes: 2e1743085887 ("riscv: Add support for the tagged address ABI")
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Ziyi Guo <guoziyi114@gmail.com>
---
Changes in v2:
- Drop the inline comments (Samuel Holland)
- Add Samuel's Reviewed-by

v1: https://lore.kernel.org/all/20261001184355.2395068-1-guoziyi114@gmail.com/

 arch/riscv/include/asm/futex.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index 90c86b115e00..6f3bc9bdb85e 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -40,6 +40,7 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
 
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
+	uaddr = untagged_addr(uaddr);
 
 	switch (op) {
 	case FUTEX_OP_SET:
@@ -82,6 +83,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
+	uaddr = untagged_addr(uaddr);
 
 	__enable_user_access();
 	__asm__ __volatile__ (
-- 
2.34.1

