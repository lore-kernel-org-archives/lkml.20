Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692461;
	b=nb20udMEtTzkfchwW3YXFOon6OahEbEiu8TKpNQworygxmaVkji3vD+zVr4vjFhrsTx9
	 cGShCPkWGiZuEt0V+TEF1mdAsJqYHQYSttnmao9dH8PpeYupStsHAJ08K2f8aQRr5cnyo
	 eanm0+v0uYPg884MS1/7IW3zwM2FGCX4fZGwpPugMoViIhrew2D8EeLR++pYQ1vw2qByB
	 3ZoES2KBXwo/4zHsc3D6W/eE/79ORRyBWUCTQQszllDo1reAtZFp7m7SgN04YtnJXLsGo
	 UW+5UrovSdAIabx74uGgF3uRrzKYUSEJkXjXfinrPes9A9I2t3UuW1Qa52ie2AHeSvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692461;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=SSKe6YFblVjuOlewl86JzUttzs9TwvUcFTxoEjaaYZQ=;
	b=huK+NCXmdOM6JMKHiAlb3cmzfZl0eXclJ7JZ7hFA0ZN2hDl9RSl1URhwEac6/5TxvnQO
	 7kzitQOcdntMBenm0QSqVAuhWzsMUEGixTiidW/IDVoA529FupOhOoSCiZNaRp6W9ZE5i
	 gAp3/e3hYZLnvrUIYnE8+IfaA/n2BKuVx+WVMnaUWhu0kT81uLmBb24E0DXYLEMjxtbRn
	 0e3uDHK+q1O3lgK1qJU1so1Wl5MB8tTDWFrTHQuTqd7xqemHfWFvulP9z0jW91ZKumKsN
	 M6OjokVCYP4zvrNNp+ktQ/vdtUVcHFTp5ah6hwolUu/VS2+tFBkZ1sap68YE80NKfbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M4PBYugT;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAC2606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BAC2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M4PBYugT
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so1834596a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793692460; x=1794297260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SSKe6YFblVjuOlewl86JzUttzs9TwvUcFTxoEjaaYZQ=;
        b=UIKfcd9BJjHs0Unim4eJr0LDXbwLeVjzXNCPt26fr9xtRTOvgLwfMUAe5H++2pO0Jn
         OImZZpGiOJToi3xYFvkwB7LR+sMBaEMhRfqiDIXVh4P/SOx69hS8lUshn+HhEIaayW39
         WvFbhztPdn7mLQCF1P601LEiE16I4tlwKzX6j1Tejr9kn5CFDYK+BQimzcyFp6n8oMYu
         UyetyFbiQifHTRYHqqgiqfOk2HJz5n+7GYjvf6K69WfGnutSvEwIkSYOx3XSJTlJgXE8
         5CFDQ3wcN7fAT/QFoDys3tM7Y74HdYuCG0b23LVTRfr/GKEbIlfIID19ayl2sgG5IQOq
         O8ew==
X-Forwarded-Encrypted: i=1; AKwUvBwlpgUzX3lI5uqBcZRLjEudET8bTnY8IMhwIzVYsgTxwFgAwp9OtslU49ao4TRW5+sLXoSfaV+LhqkhYHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z83mE+wA7W7PoKtSXUidUSTj4elFr2rz8qmHGwGzSDVQTjs1OQE
	jaxIOrfKw5G2djl0IOgT1Ijz/WHQZRwgMdhjEek3zLGYrOFkTmnw7hU8T7efek0LVeIpmD2QawC
	9hXcIiY/m8mmLOihXZsZTSDJ9evzBF4U9/vjU+AnKOsZjG+c/9N8GbpYoIyQgdP0r/RIpKJYQ3d
	PxV2P7thK7CMCssO1VlVE3PuFjsZN3VlT+Gg8BHQU/zm+QZ8lxLOVie9J32LBqDkpxEAnlDkpmL
	DWPliLcXhpdi0XM
X-Gm-Gg: AYBFou27PpFhKz/qcn48h6klpz5l1YRpQedM7JACodrGmncTBhgxaU2LgijIJZjeBoC
	DOQTEHbxiG5KfRtLTmgHXiBeOkH/66JtE2IiGOpGXVaPmRA2hh4IiV2VtuSmE5mtHRn9ngXs0kM
	VfBKc6fJfBy/xezd55/guw6OOnI6frxqgtUrHTaE6gN+1FrVLWjJwKV89R3PnY7jlJlq4rihmuR
	FbIV5EiwbpdxDxOTtmE/D5SIhbL3w7R0fSB2zKr9WP/bhFA9TQi84VfUPYlQUJxw93wa9mhbS9l
	5N167sT3CcvF7/Z4RPHLykWho0ZOTBoO0WrX3mZOCN347TX2H1blR7tAL3a09pxQotU5bzo8PWw
	PNIBORZFodHhjs1cd7d8qrH2Am+UvqMEdyET/nIBdPKIBNG12HrIiaR1CMD1L2G0C4+tZJIsUwT
	AYd1aZbPU09m4O0YXjLnVO4IeNhZs28Ctf
X-Received: by 2002:a17:90a:ec8e:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3ae897d5fc0mr8612472a91.34.1793692460468;
        Mon, 02 Nov 2026 23:54:20 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae88072814sm3879983a91.3.2026.11.02.23.54.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:54:20 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so7584230eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793692458; x=1794297258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSKe6YFblVjuOlewl86JzUttzs9TwvUcFTxoEjaaYZQ=;
        b=M4PBYugTex5HSJJ4bzK8q6Zii6YQ+aPREdmlBodiwaLEDNGNKddWAK5FQptrYcKY4k
         wBxHnEFkeJVSNvmEcGTrUoAF1ONIzH1OxmsHTohsQJ3tp1PGipfEaUnyJ0gV6P7EYQMF
         tZItFL5ZiY292yvV+cwx1O1bKmwO7sMg543PI=
X-Forwarded-Encrypted: i=1; AKwUvBy0P4CigFQA4ov7XNa+obeQ/oCyqJwcN2l1YEIw+bh5o7vQbbYmqZhS+zb6xm7w24QNy0dxrtPwx2zRJ3M=@vger.kernel.org
X-Received: by 2002:a05:693c:41d4:10b0:35c:99e1:c755 with SMTP id 5a478bee46e88-36a4242c0e1mr18340261eec.38.1793692457456;
        Mon, 02 Nov 2026 23:54:17 -0800 (PST)
X-Received: by 2002:a05:693c:41d4:10b0:35c:99e1:c755 with SMTP id 5a478bee46e88-36a4242c0e1mr18340217eec.38.1793692456621;
        Mon, 02 Nov 2026 23:54:16 -0800 (PST)
Received: from vertex.localdomain ([192.19.218.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm50287635eec.11.2026.11.02.23.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:54:15 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Alex James <alex.james@broadcom.com>,
	Michael Kelley <mhkelley58@gmail.com>,
	linux-coco@lists.linux.dev,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/vmware: Map vTPM as private in encrypted VMs
Date: Tue,  3 Nov 2026 02:54:08 -0500
Message-ID: <e0e5389688fe4102b639c42295305e08f306a092.1793692366.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
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

From: Alex James <alex.james@broadcom.com>

Encrypted VMware guests can use a virtual Trusted Platform Module
(vTPM) implemented by a paravisor, trusted code running alongside Linux
inside the protected VM. Its register page needs a private mapping so
accesses reach the paravisor instead of host device emulation.

The default ioremap() path maps device registers as shared. Without a
VMware private-MMIO override, this also applies to the vTPM registers,
preventing the guest from communicating with the paravisor's TPM.

Install is_private_mmio() for the vTPM's single register page when guest
memory encryption is active and firmware supplies a TPM event log. This
lets ioremap() select a private mapping for the device. Hyper-V already
does the same for its paravisor vTPM in hv_is_private_mmio(), added by
commit 812b0597fb40 ("x86/hyperv: Change vTOM handling to use standard
coco mechanisms").

[ zack: Moved the include and explained the private-mapping requirement ]

Signed-off-by: Alex James <alex.james@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/kernel/cpu/vmware.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 34b73573b108..afb40036ff49 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -26,6 +26,7 @@
 #include <linux/export.h>
 #include <linux/clocksource.h>
 #include <linux/cpu.h>
+#include <linux/tpm_ptp.h>
 #include <linux/efi.h>
 #include <linux/reboot.h>
 #include <linux/static_call.h>
@@ -374,6 +375,17 @@ static void __init vmware_paravirt_ops_setup(void)
 #define vmware_paravirt_ops_setup() do {} while (0)
 #endif
 
+/*
+ * VMware hypervisors use a paravisor to provide a secure vTPM device to
+ * encrypted VMs. The vTPM MMIO region must be mapped as private to ensure
+ * that it is handled by the paravisor.
+ */
+static bool vmware_is_private_mmio(u64 addr)
+{
+	return addr >= TIS_MEM_X86_LPC_BASE &&
+	       addr < TIS_MEM_X86_LPC_BASE + PAGE_SIZE;
+}
+
 /*
  * VMware hypervisor takes care of exporting a reliable TSC to the guest.
  * Still, due to timing difference when running on virtual cpus, the TSC can
@@ -442,6 +454,12 @@ static void __init vmware_platform_setup(void)
 #endif
 
 	vmware_set_capabilities();
+
+	if (IS_ENABLED(CONFIG_X86_MEM_ENCRYPT) &&
+	    cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
+	    efi.tpm_log != EFI_INVALID_TABLE_ADDR) {
+		x86_platform.hyper.is_private_mmio = vmware_is_private_mmio;
+	}
 }
 
 static u8 __init vmware_select_hypercall(void)

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
