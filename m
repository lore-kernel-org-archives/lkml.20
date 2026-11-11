Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376841;
	b=ZZ0XdHLUX7vesO/aF8jJZ5Gvmr8yrvSruq58Lkj+YE7VBB/9ft1c/qFfkAsrf812Hhkp
	 t64WuiGCl639xMiu9mRPukFpxjEPMC1onzNuQlxaJ5YltsZdCDJtSkbE8J90OdJ5kCZP1
	 Db6k/gutgclaq0XdvIXSKEqOxrzN6qiRMi6uSv75xN51kKpSvSiqSHKRc+b57Wy0RAIzn
	 +/ai8ZXrOPuHX8fozHecfKJtaO2I2Vqaw+q+b6BXVkGAp6qfj+aSKZ1DypZ7T3GAHUXnG
	 ZrRS+TqYZDZaAabvWJqgioLhARfDeSpzHwt9YpsUNxC6yo8hscO8nrByhbDZHXDXocQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376841;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Xinb0q2RhrG3aZtWkosSNECDDlqXXXklCJemB2uKTO0=;
	b=OnYEJqxUr6KTcuhJ1xAcnSgEGLlmqdlD2X+3hierrzHTz51dA28ub9M5Up0CrEwavue5
	 GjXWcnJIQ4IDMaJfGv0zgCQwpRJuHKL0nEVl0gr1yoxTYpYDNWuM26U1LbCnjrUsCpZBc
	 zC4Tecq7s2VexgrDeOnayxOKKM6n7WK9xsxqqT+ySZa7bM8PIoVzYyfYKIFmpIXp1h0gf
	 tb7lDDXAZGPmoafUp+Umlj0+oJgJXOiPZKskN350fNxSUEZWwfL5TQdhexXa4oDXiagis
	 y277QVJckdwMOznPt/6r5dif3Lt4YW68LKxuzZBNdOjdBMfvraJYFKkhnfjdsLauQrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="GUjsh1/b";
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE2360A2625
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE2360A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GUjsh1/b
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso1911801a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:00:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376839; x=1794981639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xinb0q2RhrG3aZtWkosSNECDDlqXXXklCJemB2uKTO0=;
        b=xkZR3P34nEHOsAqZbA31PXx7snTtyToZD/SvM7aOwMJOxtDDHRDwnE3nJbqMHtJ3QD
         R29t7Eeq4noiyJlB4fxZve/sPL9byE91IHnVlgzmg9vW9TqMpL7fD4yWAMKCPU7br+C8
         q+wdfddrlP907KNyT8B7k8qrHi9bYl0VwVTWJXP52XD5EJL9QLq7zqRWXRMUx+nMCJkl
         ubE65K53ezk76wrJyR4m3Fzm4Vljp22NP515LE53nBDJRfb5EjDE76DcC6wHn3mXBbVY
         Ub4x2UkUphxA76qRTM6nZxt3Fnm8upUwZYsNxCGB9KzU9yupDbryOH/wRU47arYCCbeF
         PYUA==
X-Forwarded-Encrypted: i=1; AL+hErHoZ0CUNFCH/MtYJHfTCpSwcQRgYi6N89McebfZKdak+g3MSislToRNogmO7umxreL2gTcX5wjXJIo+EVU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8obqoXy8UbM5fC6DwgnyTMaOKFujeTLqxq4gSeklu+0aDIFoPY
	udZodvvhRGjmjqyl/7fgwUi27BqpfkQuwipi2xYBFo1HDEA2raEB8FkxHO59nVfJmSoBUhqR76Z
	q1KaaVwUF4kyjFkOpYTFN45CtLWQnvGYtk6q7bNF2BrSDA7SXvLaD/WuEjs23f0t5XK9haSHbxt
	jAwmI/75kgDT3t0z7TPfeiAdjOUyCwt7cPve+wbH0s/mI6CUfWKI5hzvJ+vZKnmEzQReoiybxPO
	M8uCSy2tW1mZ36n
X-Gm-Gg: AYBFou1fJ/eojUqMyOAYJA5LCs+sez4HMEkOOiKL6BRCNYKLBW6qwMO+7l3+0ni3H0r
	nE32NnhPox0M8TKQkT4wZqKH2IFprxG0XlivqtgDgWNmHoLvQG1qjUf3lGRdXSDaU4e42xGn7tL
	iGHhv/BqaqA9l821HaN3KDL2AAC7qZkojt5755E74rlP9sqMOU4CMRTuaC9YMTlMujCHbloPIrh
	QpIY8sYEZ5ZI/d/xKZ0oq7gWH8TPfn/4ilgIiCQSpDUqUbCTEeQXnPzGAZxxrWTCgaoxQtGSS8c
	D6OUuhrijXkc3YsKkVB1u1WEaMOw6wB9/o1ONVFgfHcpgLBf1YS1pPTa7xithVic0mGtFzGfNm+
	xqWfjiaoFRBSFue1/nQ9VtO7R3wKwHwbxCYOugUgAIWkmy4IPRNrv/fynJvtPon1YiJ4HRx4eRm
	t7D0Iq+++SF0GjhnODLCEstd5NCDfcYmhd
X-Received: by 2002:a17:90b:1d49:b0:3ad:eb4c:26fb with SMTP id 98e67ed59e1d1-3b182e94292mr1512575a91.23.1794376838881;
        Tue, 10 Nov 2026 22:00:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b17de30a7csm1360764a91.1.2026.11.10.22.00.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:00:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so346485685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794376836; x=1794981636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xinb0q2RhrG3aZtWkosSNECDDlqXXXklCJemB2uKTO0=;
        b=GUjsh1/boN+TNv+JdJn6SYMy/GEYhr5mx7Uq6nktzyzL0fc+6xLhetBMxRGCIktGZN
         tsRXxzyrOx8YLIVy8RyWxiu+FBQvGqtAKZoim0vDtnibihWCOnBtXsH1Hujb4mE1Ju2w
         1uxDTuQXT0CGyJ1eprbebGZg6+dEQeTc8sQ0U=
X-Forwarded-Encrypted: i=1; AL+hErEU1OtzAtaBsNZRhrYK31io6u+REyKaamQdIIP+HeXInq4sBPlLcsBLrrBk6wbYPv87NYHkKZzvBWNRRr8=@vger.kernel.org
X-Received: by 2002:a05:620a:1b94:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-947b00082bfmr202726585a.59.1794376836524;
        Tue, 10 Nov 2026 22:00:36 -0800 (PST)
X-Received: by 2002:a05:620a:1b94:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-947b00082bfmr202720285a.59.1794376836004;
        Tue, 10 Nov 2026 22:00:36 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm411506885a.37.2026.11.10.22.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:30 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org
Cc: Doug Covelli <doug.covelli@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Xin Li <xin@zytor.com>,
	Francesco Lavra <flavra@baylibre.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Liran Alon <liran.alon@oracle.com>,
	Arbel Moshe <arbel.moshe@oracle.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 08/12] KVM: selftests: Add helpers to run x86 guest code in user mode
Date: Wed, 11 Nov 2026 00:59:57 -0500
Message-ID: <e2a6f09d80b30aa2ab14f013f5b344156a7f89cb.1794374897.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794374897.git.zack.rusin@broadcom.com>
References: <cover.1794374897.git.zack.rusin@broadcom.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add vm_init_user_mode() and vcpu_enter_user_mode().  The former installs
flat 64-bit user code and data segments, makes the guest memory mapped
so far accessible to user mode, and gives the TSS a kernel stack and no
I/O permission bitmap; the latter switches a vCPU to CPL3.

The selftest infrastructure only sets up CPL0, but testing the VMware
backdoor requires guest code at CPL3, where the I/O permission checks
and CR4.PCE apply.  Provide the setup once instead of open coding it in
each test.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 .../selftests/kvm/include/x86/processor.h     |  7 ++
 .../testing/selftests/kvm/lib/x86/processor.c | 87 +++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 3e4351ccb359..f7fd4aafccae 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1310,6 +1310,13 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector,
 
 gva_t vm_alloc_stack(struct kvm_vm *vm, int nr_pages);
 
+/* Flat 64-bit code and data segments for user mode, see vm_init_user_mode(). */
+#define USER_CS_SELECTOR	0x28
+#define USER_DS_SELECTOR	0x30
+
+void vm_init_user_mode(struct kvm_vm *vm);
+void vcpu_enter_user_mode(struct kvm_vcpu *vcpu);
+
 /*
  * Exception fixup morphs #DE to an arbitrary magic vector so that '0' can be
  * used to signal "no expcetion".
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index ee8a1715d844..6099d386abe9 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -768,6 +768,93 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector,
 	handlers[vector] = (gva_t)handler;
 }
 
+struct tss64 {
+	u32 reserved0;
+	u64 rsp0;
+	u64 rsp1;
+	u64 rsp2;
+	u64 reserved1;
+	u64 ist[7];
+	u64 reserved2;
+	u16 reserved3;
+	u16 iomap_base;
+} __packed;
+
+static void kvm_seg_set_user_code_64bit(struct kvm_segment *segp)
+{
+	kvm_seg_set_kernel_code_64bit(segp);
+	segp->selector = USER_CS_SELECTOR | 3;
+	segp->dpl = 3;
+}
+
+static void kvm_seg_set_user_data_64bit(struct kvm_segment *segp)
+{
+	kvm_seg_set_kernel_data_64bit(segp);
+	segp->selector = USER_DS_SELECTOR | 3;
+	segp->dpl = 3;
+}
+
+static void virt_set_user_pte(struct kvm_vm *vm, gva_t gva)
+{
+	struct kvm_mmu *mmu = &vm->mmu;
+	u64 *pte = &mmu->pgd;
+	int level;
+
+	for (level = mmu->pgtable_levels; level >= PG_LEVEL_4K; level--) {
+		pte = virt_get_pte(vm, mmu, pte, gva, level);
+		TEST_ASSERT(is_present_pte(mmu, pte),
+			    "PTE not PRESENT at level %d for gva: 0x%lx",
+			    level, gva);
+		*pte |= PTE_USER_MASK(mmu);
+		if (is_huge_pte(mmu, pte))
+			break;
+	}
+}
+
+/*
+ * Prepare @vm for running guest code at CPL3: install flat user-mode code and
+ * data segments, make all memory that is currently mapped accessible to user
+ * mode, and give the TSS a kernel stack so that exceptions from user mode can
+ * be delivered.  The TSS has no I/O permission bitmap, i.e. user mode can't
+ * access I/O ports unless IOPL allows it.  Call this after allocating all
+ * memory, vCPUs included, that user mode needs.  All vCPUs share the kernel
+ * stack.
+ */
+void vm_init_user_mode(struct kvm_vm *vm)
+{
+	struct tss64 *tss = addr_gva2hva(vm, vm->arch.tss);
+	sparsebit_idx_t begin, end, page;
+	struct kvm_segment seg;
+
+	kvm_seg_set_user_code_64bit(&seg);
+	kvm_seg_fill_gdt_64bit(vm, &seg);
+	kvm_seg_set_user_data_64bit(&seg);
+	kvm_seg_fill_gdt_64bit(vm, &seg);
+
+	tss->rsp0 = vm_alloc_stack(vm, 1);
+	tss->iomap_base = sizeof(*tss);
+
+	sparsebit_for_each_set_range(vm->vpages_mapped, begin, end) {
+		for (page = begin; page <= end; page++)
+			virt_set_user_pte(vm, page << vm->page_shift);
+	}
+}
+
+/* Run @vcpu at CPL3 using the segments installed by vm_init_user_mode(). */
+void vcpu_enter_user_mode(struct kvm_vcpu *vcpu)
+{
+	struct kvm_sregs sregs;
+
+	vcpu_sregs_get(vcpu, &sregs);
+	kvm_seg_set_user_code_64bit(&sregs.cs);
+	kvm_seg_set_user_data_64bit(&sregs.ds);
+	sregs.es = sregs.ds;
+	sregs.fs = sregs.ds;
+	sregs.gs = sregs.ds;
+	sregs.ss = sregs.ds;
+	vcpu_sregs_set(vcpu, &sregs);
+}
+
 void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
 {
 	struct ucall uc;
-- 
2.53.0

