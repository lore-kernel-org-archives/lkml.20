Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1DC43CEFE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788235064; cv=none; b=b01n2UPF7e5AfY2VdEzTFsa/n6PHzBI+hawOzHjO+Z7k+Y4aoV9rots1C7QtXnewye9VJj9UfhOrXUNvS+Wa8Eouasy2Tzj++dN+Ahq/2lTTn/fYwiIePNmjvgqvurjW7c7IQ+w40xnca74SPwrF1vjE7pfJv1qeaTyml8eMk5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788235064; c=relaxed/simple;
	bh=FIdRcsMOC/DZC1O8y6KtoskjQGfb9qysPZfXHsmxOnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cl2EAr+YLGiR7/Vkv0XbEgfDcZ2rHdFiajzcDLm9ewFAd+At4Hywi/kynXbl4XnvrOur+blDGvNXQxyim88bNaAnapCIZMjmxfFNw2wq4pHo9NTmp+pBl1E8Gq9kixsXyk2e/n0pqOdn+PsPe0EXZ90sSpqhmuhEIf8nTE9p2lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=kYAfHdRk; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="kYAfHdRk"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39675172593so3785914a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788235062; x=1788839862; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u6duqbr7qiU1/7HfGsJMzno+Gd8kl8JvVp30ChVEOm4=;
        b=kYAfHdRkPQsA1qn8mHz48fqqNEyY22sSelAOwc+Wz4FMt2bNVs3WGZ39sFejVfShbb
         RdyRcNwSAXR1FjwXn1necrZi2YNYZJfnyapN1CNJwZLvS65/UmNxkH/3fnhqugo7FPsK
         U9AJP1sF5g1tIlpu8Ek/h/aN29YMRurKpo0x9YN/q7f7brq8iXh8Lm9pYcR3YzgdgZeX
         GPlIQHfJDBls0g8c/ai+zDVGzdBOdXrMDE/p8ejj4YJpdp7U0vD5iayQ2+hpneFkp7yo
         EN0XhcTH3WbtbxyFUIE7iM1KkJ1RlDHOTp2nBY4TtxjgPr1TWSAyI9QuklUSYTW5p6cz
         +1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788235062; x=1788839862;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u6duqbr7qiU1/7HfGsJMzno+Gd8kl8JvVp30ChVEOm4=;
        b=lZx6eond53/HaO51vq9+O2Imx5Z0zMR4d1j4qSVRzu5sUIulMv1cJf3dkBk+Rdy49K
         HOeC21EC6xMWQVqgwFgov48HhP159No9gEcDdOZDo4q0MstKfW/SXsIaOjHcOdPY1iC0
         vS3BuVubUsvTiPmnyuH3KYXOrAWgLlG1J++0ZmPYzJST9n+IYWKP3hdGgZiATs5zHv0h
         ZbQNthSmjaLjGAoQewXMw9CccsJfDxz6yBDlk6zo2/Ju8jVIrCyzC9NYAzGcnNz/GGCW
         g8eldO3IOOvNhw+g69CUWzcPUcGAGMqfwZ5VQMNhaVBIq9kRCJnWpFVWebXXsbb8wu47
         NQDQ==
X-Forwarded-Encrypted: i=1; AKwUvByShb3YSwT8QlHrDs71jrV2xqCxiDI1hF2GVL8URnORJoQOusqSzuseuzM7e0thWarX+FkvMdfNd9DLcaA=@vger.kernel.org
X-Gm-Message-State: AFuF++nL8UBeffsitH3QzB+kJrleFQBZwdCqix3eWB7sruS5HbdPaQVv
	X7kErP1A5jAaQYcJBdV2A6QKOFP/k5T48kbaSEL1xcwipwKI9rUINgqGPmHo5CF8hfk=
X-Gm-Gg: AYBFou0DL1weVabmRACTEcjbh9bQq1fk/uPBnB6emA94MHNK26m7nrv3nIFwjBfcfi4
	ZHSyq+R29d6ZGMpnqJDrqiIF1vLpRBHLL8dKBTeENLZyK/pxgClTq0ALqrFIzHCtt1EQQmNOwWz
	2Drqe8s5IXnpgJ4wShpnbxeFSiwbax6+fe4Fput+0XTVX2xyQvEg4HKWALI83U3ygfN515fiL13
	EBJhbggxZ0kK74Wof+GssPn2daDA8jNsOGEZnMdJxu9bs1o4lpB2IlX7LgtBteIlOOhXiV+/Ivs
	YEsFACGzURCsSYtM82lUquRf8gC2jFhy/WsjyQTrT2FfOXUaOdZr+3V4MpiCGFY7jVYEXmeUS2Y
	PCRLi6aWAg7mCWHoJX5poKSym0YgG3uqaH5gLstH0WWIDM18HanUHgN+c+vlE/OglLzqhOGfUpg
	Ww16RG0AWnCSCOAbCR1UWzmpvF4i+wxdZ/EhjmdPXl2Vf7jMsmSpwB4c/M9C+sBL4pSJbrOLjva
	JLGcb/+
X-Received: by 2002:a17:90b:28cd:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-3989c003c08mr33472489a91.22.1788235062279;
        Mon, 31 Aug 2026 20:57:42 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1b38esm31120101c88.3.2026.08.31.20.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:57:41 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 31 Aug 2026 20:57:31 -0700
Subject: [PATCH] KVM: riscv: selftests: Dump sepc/scause/stval on
 vcpu_arch_dump()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-kvm_kselftest_dump-v1-1-55b022c6ef8e@sifive.com>
X-B4-Tracking: v=1; b=H4sIACpNlmoC/yXMSQqEMBBA0atIrTsQR8SrSCOaVLScSUURxLsbd
 fkW/5/AaAkZiuAEizsxLbNH+AtAdfXcoiDtDZGMMpnHoRj2qRoYR+OQXaW3aRWxyXWia5OqTII
 PV4uGjnda/j/z1vSo3HOC67oB1Ih2dXYAAAA=
X-Change-ID: 20260831-kvm_kselftest_dump-3f8d4daf5c60
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788235061; l=2028;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=FIdRcsMOC/DZC1O8y6KtoskjQGfb9qysPZfXHsmxOnA=;
 b=LoVteimfcmkAq7Y0uj1TCSBAJ+oQpFiT8+1EsF2q0xDVvaq1Q0lmJLNnHQzUXtKthWFDMufNp
 H3de3BgwRlvDU5dnQcAf6LZWzBwvT435/qp3cbsvBGQB5/sjYFkbpwA
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=

vcpu_arch_dump() omits trap-related CSRs, making it hard to diagnose
unexpected guest exceptions from the dump output alone.

Print sepc, scause, and stval alongside the existing register dump.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/kvm/lib/riscv/processor.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index ded5429f3448..bf355afa8486 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -235,6 +235,7 @@ void riscv_vcpu_mmu_setup(struct kvm_vcpu *vcpu)
 void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, u8 indent)
 {
 	struct kvm_riscv_core core;
+	struct kvm_riscv_csr general_csr;
 
 	core.mode = vcpu_get_reg(vcpu, RISCV_CORE_REG(mode));
 	core.regs.pc = vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.pc));
@@ -270,6 +271,10 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, u8 indent)
 	core.regs.t5 = vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.t5));
 	core.regs.t6 = vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.t6));
 
+	general_csr.sepc = vcpu_get_reg(vcpu, RISCV_GENERAL_CSR_REG(sepc));
+	general_csr.scause = vcpu_get_reg(vcpu, RISCV_GENERAL_CSR_REG(scause));
+	general_csr.stval = vcpu_get_reg(vcpu, RISCV_GENERAL_CSR_REG(stval));
+
 	fprintf(stream,
 		" MODE:  0x%lx\n", core.mode);
 	fprintf(stream,
@@ -296,6 +301,9 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, u8 indent)
 	fprintf(stream,
 		" T3: 0x%016lx   T4: 0x%016lx T5: 0x%016lx T6: 0x%016lx\n",
 		core.regs.t3, core.regs.t4, core.regs.t5, core.regs.t6);
+	fprintf(stream,
+		"SEPC: 0x%016lx SCAUSE: 0x%016lx STVAL: 0x%016lx\n",
+		general_csr.sepc, general_csr.scause, general_csr.stval);
 }
 
 static void __aligned(16) guest_unexp_trap(void)

---
base-commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650
change-id: 20260831-kvm_kselftest_dump-3f8d4daf5c60

