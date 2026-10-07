Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC3E39902D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791382571; cv=none; b=mwuq3sbJ8+0tmowx1TEqzdUt3Ev3BBXa9Uq4osENqSbGS/J+p41n1dMLaZzAaXz4ucifY3hW8+ljyHwg7tP8h2fy1wfIsmYM/vpGEymGi3baVdLtkhZKA2StGvzUN0aZjqI7O7jYsIi03H7YpVS+AQPEhk7bACmDx4UXkqJkWQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791382571; c=relaxed/simple;
	bh=em0Q1tXDM9gdGpwolJt86ETVFZgxUN4/VENRvrcVISc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DsxXwsRDIja2T1hsSV/+bM3bNIm+1861o7rMk6vlLvk+SO70shuAs2+UeoGzmg6FhhSJ/CDS1I3UOK9h6rQ4y9Vt/rfF+X6+SWAMZ2K90Sp3C8gvMlQs7wnQDAL+jnPMn8JEnGZe7At4nKJK/6l5+k3ebjKM7o0PsvtsLHzRDDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phOhwuN8; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phOhwuN8"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5351e6a2230so14563011cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791382565; x=1791987365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WRti667jeSRhARCPDfXNMpJ3JE2wRVrSoYMAVxfOv7Y=;
        b=phOhwuN8r5PdJMD2yTuJ1Hv8gByn67REvGvib83YvhnRGuS5ZdWX6d3Z8Eh77XdoSa
         l4HnwYu7g9rtNkpTbLPRxiscTBy00n1tnCYEvYrpsHvSEdj+NncjR/ehAaMGZiN8IU/w
         r6KW4TKBduPEMd/oP12FqHXKOKI+QZOhSsZ6Q/t8XRnN8N+MNkuPKDeKtw2jhyczYmCs
         OvVUnNNBvYilPpBG6ZcrRoBSGKzDFH12euv5FOX0xK31RXct0LdTY1hXOhSOlZNvkU68
         sxsISjcWzIQII6dqTuBTwDcV/rliunDVGkSGs6CMDMvRFtBIf2khxOL0t1heP/mqaZjU
         fF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791382565; x=1791987365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WRti667jeSRhARCPDfXNMpJ3JE2wRVrSoYMAVxfOv7Y=;
        b=wGXJl2eXKT3nM/19xJUGQ4jwierJfD4afaVTCDhH71yu78eFQ0WTPxJx5+GB7FCuxB
         rERhIO+ol401BdhriAIfX4j1bEVj1Jw7LGm5ZrS4qKSwO6xFrUS++SRdNhn3s+xMIbR6
         WgHNdgeNSAMoRvNVR3aKEHz63enWvX7rWu5S2halznXq8wln5ARNFqossrWpdfMXTvcx
         BdmXqsos6mP11EA6EysV7ncScW6JFQJul7higZZtVBmPF3UBJksoeFxaNLcx7qSF/mio
         e2Q6ln1Z7KfHqpzx3TcELRtoh20q+1pDsgDi4UQTrlFGi1OG0JLol3a7+G0QmKO2HRZw
         Fd8w==
X-Forwarded-Encrypted: i=1; AKwUvBxMux8euySE0f8Nc9hFlhE5y2/fgYzdsHGVssYIrSEhithAFGogZNWLwoYKGGD0ewF+cNPdgHkY9FZol6A=@vger.kernel.org
X-Gm-Message-State: AFuF++koWhcUzgXr58xTK+emAEYTrfigkKpQRGV7bDbj2X5ews8wXypr
	CCgSr73UPxs3Ls2hWK11jgd/gKrnwlet/wBmIedQAMo3IXRUXJHrvLNgJb7jrezX
X-Gm-Gg: AYBFou1GLGkPUALKGgvy2KRY93n6RNE3wrnp0YZYZ6l6Jl2gmAndIj//NeR9Lymj6aO
	tKQzBy2J1ZKaWY7rGXjVPeI63A/kKTfzVAy1tGVeJAT4ewPk0NTwJsx/d2ft80UpfoiftzODvxo
	Zyplnd4wAnCnB7EtiK1kY5/y+cIKVZSH0pIEQcTRQB3Ot3H9wAwOaUD6EN4ERN2GUa4yDLs/f9e
	9zTKrBZAw9ImkiidTO3ppdjy2JwOQdvzAdnXNuuWzIruHSASnJ606KEoZ0mK/1ONRxW96nrlR0J
	eIwfD33Kzuo8iRDBBpsvQuY8aV570y3D6Zm9X76tQhfeKmOKTyOR9kt+9ZCLCMh5MldVX1MIl/0
	QeriMwExsrQE/O5xXUyvVaC6/Q2/zkdQaijU9eU8W1OWPgUSOVf31/9LB6GX8CCMzVXru+84oBz
	w78BrmH8N9Cn5a4y65lSkrN4udMQKsxb4VOxoOEZO7vVt+uq0X4RW1DQ2zvf742NovtB5dGG9sC
	FRYNsCN0KN05nSpw9Nkwq7Ph1TjzG4SaUuhlpFQ3ls1y+ZCcsqv357eUvJibVXTeMKeBrOoSPJf
	rqSCJK8h
X-Received: by 2002:a05:620a:4629:b0:93e:96cb:3083 with SMTP id af79cd13be357-93e9b76d319mr419482085a.33.1791382564280;
        Wed, 07 Oct 2026 07:16:04 -0700 (PDT)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e99104308sm229406385a.16.2026.10.07.07.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 07:16:03 -0700 (PDT)
From: Ziyi Guo <guoziyi114@gmail.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com,
	thecharlesjenkins@gmail.com
Cc: debug@rivosinc.com,
	zong.li@sifive.com,
	vulab@iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <guoziyi114@gmail.com>
Subject: [PATCH] riscv: refuse PMLEN=16 when its tag bits overlap the canonical VA sign bit
Date: Wed,  7 Oct 2026 14:15:58 +0000
Message-Id: <20261007141558.2914604-1-guoziyi114@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tagged address ABI lets userspace enable pointer masking (Supm) and
request a PMLEN of 7 or 16.  access_ok() validates untagged_addr(ptr),
which strips the top PMLEN bits and sign-extends from bit 63 - PMLEN.
Supervisor-mode accesses are not subject to the U-mode pointer masking,
so any site that dereferences a user pointer without re-applying
untagged_addr() -- e.g. the futex atomics and the unsafe_*() accessors,
operates on the raw, still-tagged address.

When the canonical VA sign bit (bit VA_BITS - 1) falls inside the masked
tag field, i.e. VA_BITS > 64 - PMLEN, an unprivileged task can craft a
pointer whose untagged form is a valid user address (so access_ok()
passes) but whose raw form is a canonical *kernel* VA.  Among the
supported configurations this is only Sv57 + PMLEN=16 (48 < 57): the tag
field [63:48] covers the Sv57 sign bit (56), so the pointer can name any
address in the linear map and a raw dereference becomes an arbitrary
kernel read/write.  Sv39/Sv48 are not reachable (the raw address is
non-canonical and faults) and Sv57 + PMLEN=7 is fine (the tag stays
above the sign bit).

It is triggerable and can be reproduced today under QEMU, which emulates
Supm and Sv57 (tested with qemu-system-riscv64 11.1.0, -cpu
rv64,sv57=on,supm=on): on an otherwise unmodified kernel an unprivileged
prctl(PR_SET_TAGGED_ADDR_CTRL, PMLEN=16) succeeds, after which a futex on
a tagged linear-map pointer, whose untagged form passes access_ok(), 
performs the atomic on the kernel address.

Only advertise PMLEN=16 when its tag bits sit entirely above the
canonical VA sign bit (PMLEN <= 64 - VA_BITS).  have_user_pmlen_16 is the
single gate used by both the prctl() and ptrace() paths, so this closes
the reachability for every such accessor at once.

This bounds reachability rather than fixing the individual raw
dereferences; the futex / unsafe_*() paths should additionally untag the
user pointer after access_ok() so that tagged pointers work there as the
ABI intends.

Link: https://lore.kernel.org/all/a25d01cd-e21d-4e51-9d24-6cc41589c041@sifive.com/
Fixes: 09d6775f503b ("riscv: Add support for userspace pointer masking")
Signed-off-by: Ziyi Guo <guoziyi114@gmail.com>
---
 arch/riscv/kernel/process.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 7cc5a6a5c020..afaeaaa247c2 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -433,7 +433,16 @@ static int __init tagged_addr_init(void)
 	 */
 	csr_clear(CSR_ENVCFG, ENVCFG_PMM);
 	have_user_pmlen_7 = try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
-	have_user_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
+	/*
+	 * PMLEN=16 masks bits [63:48].  On Sv57 that overlaps the canonical VA
+	 * sign bit (bit 56), so a tagged user pointer whose untagged form
+	 * passes access_ok() can still name a canonical kernel VA when
+	 * dereferenced raw (the futex and unsafe_*() accessors do exactly
+	 * that).  Only offer a PMLEN whose tag bits stay above the sign bit,
+	 * i.e. PMLEN <= 64 - VA_BITS; this refuses only Sv57 + PMLEN=16.
+	 */
+	have_user_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16) &&
+			     VA_BITS <= 64 - PMLEN_16;
 
 	if (!register_sysctl("abi", tagged_addr_sysctl_table))
 		return -EINVAL;
-- 
2.34.1

