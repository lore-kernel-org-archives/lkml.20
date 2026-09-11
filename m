Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AF137F8C4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102629; cv=none; b=IW3vFpw6uTfgGwb9M3X5OfqnYCfKTzYzXP4AG47l38CafzUKMlkbmzMGTJSvlTRpS7xtjdYIMvTejduLcEzDTWVptUtD/3DT7OSN8BxbsQl3SG4csHHtddgIt/p0e3ytbbiRHCFPv3NyTgGI5r1DFlIYwo5ie2J6tIZAQZNUvJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102629; c=relaxed/simple;
	bh=HcgpT/AXq8ah4/W7KrD5/rpTq65AzhJILFfp25IX/6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PdOpqokiniFzPtEfZ6MvAO8UARlSw89uWFmcK+ZSydaRWeiRcwLF/3s3ZINm19UQvh5hQD56m21165HonJwXT2jIUrUXZY/dmlQmiGZAQzYtnVXh3F7vpPk2YXO7AqjRZU/2ICOIFXVgv6OjTQCu+jPbB+942u7VNRV8KDcfG6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrXci/3E; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrXci/3E"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso397348a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789102627; x=1789707427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WmpZZXMsdqMV2V4eNDvwbvfcyiTszzMT6zcGXuns9Y8=;
        b=RrXci/3ELhFC4XoaKzAZtnMAOKKg0bT5D+iTyMEnSb5dEMZjlJsbY2UxohDBiKtbxu
         vIE2QU3cDTV3NX4bUxK+ftNcgDEprbsoOq40gW/GHS6JneDnZi7hQeiynJL1bAS/l6ly
         flnrsmBRv1UIJxQ029hHtYzlm3xcBtW1LUu4CdkdUUq3vROvc28mfUXmV9HEa0s8gVWs
         zPPCPyRH+ld2jvR77GqIc+4ie1l49MZM80q/C+NUyyHMP2anzJ1QyMbKJSyVGL92Zjef
         e5yf+e5upyFYzyG0sNHqfI3mf2F4d7SzZXkBYBfkTtGMfzIs7gidJGQIAOrehx+GCZUY
         wdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789102627; x=1789707427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WmpZZXMsdqMV2V4eNDvwbvfcyiTszzMT6zcGXuns9Y8=;
        b=dFcIt2BBvcm0VkO2s2+mxuOJmZ87jbmj+FuOgyLuowqZQSqYWspsDkJUYWavAFYOlM
         +tH0FeOKJSqp4Dh+NvVudiO5cnCzGLOjEB1coi5+/I3tv3jPpFCunQ81PgZA+GPMGpGD
         FTgBJ6fkxeAAfZyt5VeU4dPw2KEI22vvPxRG27BrtBKiWlszOmHBaI3bYQeAHkJczWuo
         32O8yOJMwqtm0RGJYJtF+2+Y5A/qC+SKHdcMEaS2XEqgKLQVyThQE81Y1FzXl7jMqef1
         grCM9K4DuYulANZCs9fOx0uysP1XhGwTTQTRAHCGfySzrfEJP6CsFCPDCi/uo3W8ukNn
         4NgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTERNQx1gJQ6NH37op5sHk3ekqJaeHkRzjixQqkwN34DcaoqnjOODTavU8HRxw73Uv1BfycKN/ZrLt5RM=@vger.kernel.org
X-Gm-Message-State: AFuF++mJOHgPgumBcx6zkofXnhXPUmfvcZwg4He805eLA0c9GFXKHDyO
	IaRVlBszKVFuUN9Hszxy6iRwKeMErMSuvaf+X+umazsScfgTSbErDBhX
X-Gm-Gg: AYBFou1V5/LzMjLmojGEVFQB53Hig7SjP/AfmP+Rp7kXaO7BQJ5GUSiUk3qMBJZYwIe
	FAIIsAOhk2LmNPOsyEEs+M+5I+3OjILhZn09VJ9kRkOyD3uywSfRttMvDT/tIhktp/vrlP17/iv
	CQXuQZB+raXVWSYL4Vn3gQCCQqXga4C5Al0SKKHYNBYCRdZgBSVnJw2TAnvTOLQ3NidNHwl1yds
	9zhoLzY/Uadh32jY7z40zJmL48bsXb82z3E8X16P7IWzyZqOxTuKd6PVV0ZLFZk/ooA0NTCm2/X
	RlQq4Z9HgL2vCWh7oLGck+7W+svzzaujMUpWiw0ni6a9nWOr4fmVHBtpV3+NTQeVs66KjC9eODr
	gH4XEy1AhGgcYcZg0eeSCKZcRv5mooNlHytt/LuYJKEImDY0+9qWVztVHGNsxl2/rKy4i4DM7kc
	yD7tN0RrtZ3025SKEfkPzWpaKlD8cICJos7EFR7IP+epiM1dL/za7O5SaXqG9qs0LM9hPEP+H3r
	MJnUmrT5Lw8PgjwOrQ+7gW9XJpYABnzf8JsVmlhPLfoQEDKI6Ojd4+ETSqMxm27p1nAcI3J
X-Received: by 2002:a05:6a21:e0a6:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3daecffe61cmr4643073637.2.1789102626978;
        Thu, 10 Sep 2026 21:57:06 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a3casm2837953eec.12.2026.09.10.21.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 21:57:05 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 1/3] KVM: PPC: Book3S HV: Read EX_DSISR as a 32-bit field on guest exit
Date: Fri, 11 Sep 2026 10:26:45 +0530
Message-Id: <5433192a9121d1006c01c98ab56aca4b42519454.1789099725.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1789099725.git.ritesh.list@gmail.com>
References: <cover.1789099725.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvmhv_vcpu_entry_p9() recovers the guest fault state from the paca
exception save area with

	vcpu->arch.fault_dsisr = exsave[EX_DSISR/sizeof(u64)];

but EX_DSISR is not a doubleword. It is a 32-bit field at offset 48 that
shares a doubleword with EX_CCR at offset 52 and the exception entry in
exceptions-64s.S stores it accordingly. For e.g.

	stw	r10,IAREA+EX_DSISR(r13)

This issue was caught when running kvm selftests on big-endian, where
this read would land in the high half and the truncation yields EX_CCR
instead - KVM acts on the guest's condition register as if it were
HDSISR.

The result is that every HDSI on a big-endian host is evaluated against a
bogus fault status i.e. it fails with below error:

	KVM: Got radix HV page fault with DSISR=84004840

Let's fix this by reading this field at it's natural width.

Fixes: 89d35b239101 ("KVM: PPC: Book3S HV P9: Implement the rest of the P9 path in C")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 34bc0a8a1288..16aa8582b888 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -529,6 +529,15 @@ unsigned long kvmppc_msr_hard_disable_set_facilities(struct kvm_vcpu *vcpu, unsi
 }
 EXPORT_SYMBOL_GPL(kvmppc_msr_hard_disable_set_facilities);
 
+/*
+ * EX_DSISR is a 32-bit field that shares a doubleword with EX_CCR.
+ * Small helper for reading it back at its natural width.
+ */
+static u32 exsave_dsisr(u64 *exsave)
+{
+	return *(u32 *)((void *)exsave + EX_DSISR);
+}
+
 int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb)
 {
 	struct p9_host_os_sprs host_os_sprs;
@@ -770,7 +779,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	if (unlikely(trap == BOOK3S_INTERRUPT_MACHINE_CHECK)) {
 		vcpu->arch.fault_dar = exsave[EX_DAR/sizeof(u64)];
-		vcpu->arch.fault_dsisr = exsave[EX_DSISR/sizeof(u64)];
+		vcpu->arch.fault_dsisr = exsave_dsisr(exsave);
 		kvmppc_realmode_machine_check(vcpu);
 
 	} else if (unlikely(trap == BOOK3S_INTERRUPT_HMI)) {
@@ -781,7 +790,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	} else if (trap == BOOK3S_INTERRUPT_H_DATA_STORAGE) {
 		vcpu->arch.fault_dar = exsave[EX_DAR/sizeof(u64)];
-		vcpu->arch.fault_dsisr = exsave[EX_DSISR/sizeof(u64)];
+		vcpu->arch.fault_dsisr = exsave_dsisr(exsave);
 		vcpu->arch.fault_gpa = mfspr(SPRN_ASDR);
 
 	} else if (trap == BOOK3S_INTERRUPT_H_INST_STORAGE) {
-- 
2.39.5

