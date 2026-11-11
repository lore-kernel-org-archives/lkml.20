Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377226;
	b=HbNSlHVkfOI7V24n3DTLxAtLpU+hAmYNKMbG1U6vBd+JOd307RzgIwZ9wnr9veBYHrk4
	 Zcvdxqa634JfDXOCtgZinBijA9oxVvLGVcjeHReKfiNWFW5ngxot4APkCGd618Q0CRG3V
	 qMmUf35bsqZMkt0NDlIy2qdO1xHT9UB3yWXB2CpgvuypeAl8f5u+DEAgRjAxFLcoZxkOP
	 3TNbni0DQeeiaoMnmySVgGX1KU3dLR3hgVG2b0q48Q9AlGUOWfqiD+1pcqNRfT5jRkrCm
	 8iYojk37lWYBBvilk0zMSqsEYdlQbvlLLXVnlWIAwfp/MHFHr4381LCcyRzu5asIh6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377226;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=B1ce/0HX8S5HEpDkr1kWRGR30QWdYXAqQvY9XUkGSaI=;
	b=1ySmiW5XHxonrmYq0AgXfhGQAqMmZfBXCzICUqPMUh8++choM5jg78dRUSkhwAv6tkgl
	 xDLvQtGy+OWR8JQygdKZlL0WPiPXZ9JBKZdNzQHI68ZMc+2xgfJ08wMHUsUYqCEPrqWK3
	 rwhgU00Z986wJcwzW+zHeR6j0FPGQP2ifs5Tq7tXcq+Iz597+wprNvnD1N8ja7qxpoB0n
	 iWSakjeAaWnb0OPjB+6nLdiwjEvcS9DELSxjkEB+Db9GaT3UboEU/fA3Ox+UmWSjDPS/K
	 8CXQy3xm3/qrKT2n9rJS7ZaruTmNs6HevNMHqDBf/hjuJMgMBNFKymiaUciYXCHMXJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AZhTk3UF;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD3D606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BD3D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AZhTk3UF
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1554887a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:07:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377225; x=1794982025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1ce/0HX8S5HEpDkr1kWRGR30QWdYXAqQvY9XUkGSaI=;
        b=wMGUsiu9Np8JXZLrG05tAn/VH5mGXdYrCLI3A7LANQb/t3tUry5L6i9RwaXLc3cqQa
         M8MqFbnGW8NTfcSBbMQFMM1sgkg4rmCIwI+XOsj0S7A5Bu9IkiwtDAZktpFRP5H3KFN+
         1a+YMxKehFlAwsxwoRtusmaikiJSroRahIwuIw9RZ5ppbt4tkGr/iwAz7DneTOi9d22q
         RaCb5TFxtzISYYRDCNgy4zlrlvQNZz1ydpweLgcFFF3xiFdDknTub1UhzEJhhsR/hqxm
         9+xYP10HWrvnEk5evUOnD3YawMGAREK6+jDCws4A24XtfIFERklPWwkRmqKlmArXuY8m
         Gy7A==
X-Forwarded-Encrypted: i=1; AL+hErG2rlW/nRkVBVL0sX4ptkLfx+ze8gCOYMDzehtG3t4JoHdsxUJ9DVjTbeCh+mb/edn3y/dHzQYU5/uiEwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4JUpTPFF3edC7Gmr6178q0Qnxlbu/QfkxHN/dNvHNoHGOoX+F
	SqgymuC29YIb6z2vo2opd9MCDPHL9JR7zFY9ZCosaS7pOVc0KgoORliHMB70e928Zs+htiROVnK
	cfrSLwvbCjAnJXXI0jAfmPCHFCwuYXCWFBUaJsSDwXqIMBVZ8I1G6BQWdF7+WIZoQM09RYqaeNE
	lhjcoVcjYCt/POH0QpUJlEMBn+Bjhm++hNN+m1BtPGMH/Nd4W2L4mAarJTsJsOghbftai9t5g+x
	Ao/Abprip/M/smJ
X-Gm-Gg: AYBFou1PtltS06seeB1vXdYXBPR32ORrtQ/VQtuYq8CV+vGAOBHdJkX7AgAN2jJvhhz
	g9ZzLTMTF2oiFj8T10lvt6JZhzsezeA2C89E5IY9FQXAaIJtLIEK0JFs2ORQ7csYnOVQzwAFScT
	7vkp7yCFK2Dn41QqjOnHEV2xUFz+hbxlJ9sj4ckYbL2Vs8YwgmXWWtr+rosKpMxfVBxt8WoBoDF
	toKg84M+bTscSz6OIc1X8Mrnm+HnNGQGgV04GqUDSxA3ZFqDRobyVrVVfPnKBk5aiAkH8P6vLAh
	CA4yc6yCXQWQJVnJRMgBZq2vqNA5rWJ0mf+OEfzB+lkyE94s6Bc57Ypv0Po418a+3SJFnvxbeci
	UFDn+87u4+MZNMpEmq3eDab87QPBokr6R97FSUNpdiTWzakK6eC0f/7DecBm2ezX1Rg7fvE5kcu
	Jb0StocQP3Ay0BcYL5lwo6ma0sYv8qzQSw
X-Received: by 2002:a17:90b:3c45:b0:3b0:abb7:3fdc with SMTP id 98e67ed59e1d1-3b182f62223mr1464946a91.60.1794377225420;
        Tue, 10 Nov 2026 22:07:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b182def9f9sm415220a91.4.2026.11.10.22.07.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:07:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91eaad6eaeaso53253296d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794377223; x=1794982023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B1ce/0HX8S5HEpDkr1kWRGR30QWdYXAqQvY9XUkGSaI=;
        b=AZhTk3UFl1ieAfLwug7BbdPVMMHpEeMOPdDIdzWsKaG28G1EnMGQ6AZ8k2AHJ+z/OI
         Sp+TikDA2LKtRgumqZn1XOteZdGVCC+ErCtsVpTbAsNa38nwPnUjWYCxluv04SJeZCAo
         rbq/1R521bTD0Z9qyLDS4y83qoy0+nBjmKUO4=
X-Forwarded-Encrypted: i=1; AL+hErEnIM+SkPtf2WM0vbZWBoYCz+kd1OuTJcHFU6AjLb/yoJEiQu/EmNSRL8D68mWzyftVi7tIepk5xNVXvXw=@vger.kernel.org
X-Received: by 2002:a05:620a:3955:b0:93b:d7a2:83cc with SMTP id af79cd13be357-947b001b12amr197202685a.59.1794376819155;
        Tue, 10 Nov 2026 22:00:19 -0800 (PST)
X-Received: by 2002:a05:620a:3955:b0:93b:d7a2:83cc with SMTP id af79cd13be357-947b001b12amr197197385a.59.1794376818670;
        Tue, 10 Nov 2026 22:00:18 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm411506885a.37.2026.11.10.22.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:14 -0800 (PST)
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
Subject: [PATCH v3 04/12] KVM: x86: Add CONFIG_KVM_VMWARE
Date: Wed, 11 Nov 2026 00:59:53 -0500
Message-ID: <f58eca0b702b6e57d87ca367a7693793e619d3d1.1794374897.git.zack.rusin@broadcom.com>
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

Add CONFIG_KVM_VMWARE, defaulting to "y", to control whether KVM's
VMware emulation is built.  When it is disabled, vmware.o isn't built,
the VMware predicates are compile-time false, and the
enable_vmware_backdoor module parameter doesn't exist: a
kvm.enable_vmware_backdoor setting is ignored, and modprobe warns about
an unknown parameter.

VMware emulation is only useful to VMware-aware guests and to VMMs that
offer VMware compatibility.  Let kernels that don't need it, e.g. to
reduce the attack surface exposed to guests, leave it out, as they can
already do for Hyper-V and Xen emulation.  Default to "y" so that
existing configurations keep the backdoor and its module parameter.

Provide __always_inline stubs for the predicates that gate VMware
behavior, so that callers need no #ifdefs and the compiler drops the
dead branches.  Leave the operations behind the predicates declared but
undefined when the option is disabled: a call that isn't guarded by a
predicate then fails to link instead of silently doing nothing.

Suggested-by: Sean Christopherson <seanjc@google.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Link: https://lore.kernel.org/r/Zy0__5YB9F5d0eZn@google.com
Link: https://lore.kernel.org/r/e3f943a7-a40a-45cb-b0d9-e3ed58344d8b@redhat.com
Link: https://lore.kernel.org/r/aIEmawm9gLflg8zt@google.com
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/kvm/Kconfig  | 12 ++++++++++++
 arch/x86/kvm/Makefile |  4 ++--
 arch/x86/kvm/vmware.h | 31 +++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 1719059570fb..b34d6d0e30c9 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -212,6 +212,18 @@ config KVM_HYPERV
 
 	  If unsure, say "Y".
 
+config KVM_VMWARE
+	bool "VMware guest support"
+	depends on KVM_X86
+	default y
+	help
+	  Provides KVM support for emulating VMware interfaces. VMware-aware
+	  guests use these interfaces to communicate with the hypervisor.
+	  Userspace hypervisors can also use them to provide VMware
+	  compatibility to their guests.
+
+	  If unsure, say "Y".
+
 config KVM_XEN
 	bool "Support for Xen hypercall interface"
 	depends on KVM_X86
diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index 0cb47cfc1162..794c847ccecc 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -6,13 +6,13 @@ ccflags-$(CONFIG_KVM_WERROR) += -Werror
 include $(srctree)/virt/kvm/Makefile.kvm
 
 kvm-y			+= x86.o emulate.o irq.o lapic.o cpuid.o msrs.o pmu.o regs.o \
-			   mtrr.o debugfs.o mmu/mmu.o mmu/page_track.o mmu/spte.o \
-			   vmware.o
+			   mtrr.o debugfs.o mmu/mmu.o mmu/page_track.o mmu/spte.o
 
 kvm-$(CONFIG_X86_64) += mmu/tdp_iter.o mmu/tdp_mmu.o
 kvm-$(CONFIG_KVM_IOAPIC) += i8259.o i8254.o ioapic.o
 kvm-$(CONFIG_KVM_HYPERV) += hyperv.o
 kvm-$(CONFIG_KVM_XEN)	+= xen.o
+kvm-$(CONFIG_KVM_VMWARE) += vmware.o
 kvm-$(CONFIG_KVM_SMM)	+= smm.o
 
 kvm-intel-y		+= vmx/vmx.o vmx/vmenter.o vmx/pmu_intel.o vmx/vmcs12.o \
diff --git a/arch/x86/kvm/vmware.h b/arch/x86/kvm/vmware.h
index bf250cc6e232..5951e419e1a7 100644
--- a/arch/x86/kvm/vmware.h
+++ b/arch/x86/kvm/vmware.h
@@ -4,10 +4,41 @@
 
 #include <linux/kvm_host.h>
 
+#ifdef CONFIG_KVM_VMWARE
+
 bool kvm_is_vmware_backdoor_enabled(struct kvm_vcpu *vcpu);
 bool kvm_is_vmware_io_port(struct kvm_vcpu *vcpu, u16 port);
 bool kvm_is_vmware_backdoor_pmc(struct kvm_vcpu *vcpu, u32 pmc_idx);
 bool kvm_is_vmware_backdoor_opcode(u8 opcode_len, u8 opcode);
+
+#else /* !CONFIG_KVM_VMWARE */
+
+static __always_inline bool
+kvm_is_vmware_backdoor_enabled(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+
+static __always_inline bool
+kvm_is_vmware_io_port(struct kvm_vcpu *vcpu, u16 port)
+{
+	return false;
+}
+
+static __always_inline bool
+kvm_is_vmware_backdoor_pmc(struct kvm_vcpu *vcpu, u32 pmc_idx)
+{
+	return false;
+}
+
+static __always_inline bool
+kvm_is_vmware_backdoor_opcode(u8 opcode_len, u8 opcode)
+{
+	return false;
+}
+
+#endif /* CONFIG_KVM_VMWARE */
+
 int kvm_vmware_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned int idx, u64 *data);
 
 #endif /* __KVM_X86_VMWARE_H */
-- 
2.53.0

