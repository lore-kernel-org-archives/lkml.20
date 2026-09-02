Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175DF3CBE86
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332874; cv=none; b=DU19UcDvCu+85E/vkeVZc6WK2wn3sglSCZmM3lJf+ltTClCp6zxLVbxFo1B5VnneQygCprG/UH+ZDLRGlK1dUqEAQbRjFRbGQzFc7TGq5SAzUyugO4+WNexELfmsws71+1Z32wn7zxpu88b0Q4GHnVXDhSCCV8ivp3AZ/BwKAM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332874; c=relaxed/simple;
	bh=9X6dzoz0gufvGfDdL8yiPtKZ2y0zu/PY1AlP1BteYb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TujU/DEpGqtod5mfFxZgebI5X6sAe+kP8CqXRZ1UJBMq1/d6AJG1FjTwGj94tSOieV5uLuemAON4la5k9nyMib9aeCRZh10F7xCf6+vJ9kbsKjd1Nd4x6onx2wq/rogAoscLa/FfR0soZ0zPihmq0CDlkMLgLpGPpDQYPJcRKlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AP/C12UR; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AP/C12UR"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-85c9a79590aso863129b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788332871; x=1788937671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqvESrdu/9YfjO79/sFoUA4cGKOp555BY5zNyUvnMY4=;
        b=AP/C12UR9t1diZy+7YRrRRPzVpXLd7LphRr824cMJG1QP6jgUskFvYqlpICB7+wKcu
         v5VUp4KBqTBa3Pc59kL13mM5sjNmr76NCpVfTeaodwlKnBLrD5xpa+xZUU6azo7Ex5f/
         krxm5Xf4UWl2jGuQAdOTAgcasid1ER2TWg0QbnRe7ia3qWNSneuV5IcaokvsZ8PuRODH
         J5t39IAI6ca6SreQRYKVMTZqqWzj7oc+/626oysMYP5/56/ijjGP7YXm1YWiB9LhasZ8
         oLnrmurHckb238JH4iCxWrPVqy3BHZZAYYLpF/b7JA4iJNgRt+o0qeovAwwC+oFlp/sm
         w0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788332871; x=1788937671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PqvESrdu/9YfjO79/sFoUA4cGKOp555BY5zNyUvnMY4=;
        b=U9bPHERSBEemcAHaYSx0dREUxtMWYTW2cBbAAEQkVoq9VI9g5MOcoKFc/oSxQUkvUT
         R61KQBkxhiX14IaLVqLRg4elIjtBcddCMj8Xj4IZCercqEcb7KD90QzvkeKIz86a4pXG
         xSeSmp7rqOpvK4V9nZiJCscYLEstgggWkUlUaQ6S8tLZT3RRHNdmMw7xCka/SDeDetal
         0GY3bThGRm6FLvIxk38/IPkE/tv8qBJCoTFDKwJV7kNnIYOb85cOqPP8lfo39Jd02/ip
         nZuVZDYZHc3fyTvL408ytmUePRGNJuddGRnjBr0lsE7ijXrwZGdPJQAs5l9mhQkRL8FP
         lV+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqFxqqmRzSTaRkuuxIMZdXItwvUe6Z2OLMunmQ6/hh/P4/Rn9B3iHWyMIDwqJa2hw/wUsOVjrDO7jeONkY=@vger.kernel.org
X-Gm-Message-State: AFuF++nHxfCj4cPdI7d3K6+aYcFrsyK7Lr3uzjUZKuGUyTCDMG15lZ7Q
	uHjC2zw1ShSE+myVkI+9WrIGlx4p+RlYSnqatVAJIz+ybOqJo3i42NYR
X-Gm-Gg: AR+sD10Rng9WnoqIjch/rBS4qhUuBZ43pgiCnf7KHSy/spGllr/bHF1S5Tr86BNCv2w
	ygHgo6z2Joi2k0qSuI08+bk543i4WTJd7FGPWbB3A6ef+Lze5KciyoRd6HSZhEIL2r5eIE18aKu
	3WlScESh8TVW9qtCmcNIESRIbxisGordg6RsFkQ5leLU59DeXJZJVkpGKMeGQnWoXUniBx1pgzX
	zd0meVry+V1ItQA+2tNCZgTHk3en+5knhF46HPJoMYsuLNBqIKdQE+4HqMydrVmn4i/S2L9jYDq
	wXSEaJa57pcHm9xRSui3V7Kob5lMNcaSlqYCCk+eBXNZVE6Etp8AeEEeAibuUVxvjxk/4VNOkUg
	UcFBkgQha5rhy6UY5G+sqxinbLfRgcUcCyZX0yxODDvE0ACv9lsAe6lKmm0feD6Ad419GtJsp/R
	4pIldmibmgmeWTH3e1sMhd/rMxsJhulthy/NCTrQaV8vATzNnvu/s6I3fNgjdkFV5SHijz0W3Eh
	g==
X-Received: by 2002:a05:6a21:33a8:b0:3d0:6c90:5a33 with SMTP id adf61e73a8af0-3d9ad9a2a0bmr4564485637.4.1788332871373;
        Wed, 02 Sep 2026 00:07:51 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079c33f4sm4173256eec.1.2026.09.02.00.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:07:51 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	lixianglai@loongson.cn,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH v2 1/2] LoongArch: KVM: Add unregister helpers for the KVM interrupt devices
Date: Wed,  2 Sep 2026 07:07:22 +0000
Message-ID: <20260902070724.3459457-2-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902070724.3459457-1-nagachaithanya9911@gmail.com>
References: <20260817115847.2705791-1-nagachaithanya9911@gmail.com>
 <20260902070724.3459457-1-nagachaithanya9911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IPI/EIOINTC/PCH-PIC/DMSINTC KVM devices each have a helper that
registers their kvm_device_ops, but there is no counterpart to remove
them again, so a caller that needs to undo a registration has to
open-code kvm_unregister_device_ops() with the matching device type.

Add kvm_loongarch_unregister_{ipi,eiointc,pch_pic,dmsintc}_device()
next to the existing register helpers. kvm_unregister_device_ops() is a
no-op when the corresponding device type is not currently registered.

No functional change, as there are no callers yet.

Suggested-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 arch/loongarch/include/asm/kvm_dmsintc.h | 1 +
 arch/loongarch/include/asm/kvm_eiointc.h | 1 +
 arch/loongarch/include/asm/kvm_ipi.h     | 1 +
 arch/loongarch/include/asm/kvm_pch_pic.h | 1 +
 arch/loongarch/kvm/intc/dmsintc.c        | 5 +++++
 arch/loongarch/kvm/intc/eiointc.c        | 5 +++++
 arch/loongarch/kvm/intc/ipi.c            | 5 +++++
 arch/loongarch/kvm/intc/pch_pic.c        | 5 +++++
 8 files changed, 24 insertions(+)

diff --git a/arch/loongarch/include/asm/kvm_dmsintc.h b/arch/loongarch/include/asm/kvm_dmsintc.h
index 5a71b9ccbe78..7c0158764d84 100644
--- a/arch/loongarch/include/asm/kvm_dmsintc.h
+++ b/arch/loongarch/include/asm/kvm_dmsintc.h
@@ -20,6 +20,7 @@ struct dmsintc_state {
 };
 
 int kvm_loongarch_register_dmsintc_device(void);
+void kvm_loongarch_unregister_dmsintc_device(void);
 void dmsintc_inject_irq(struct kvm_vcpu *vcpu);
 int dmsintc_set_irq(struct kvm *kvm, u64 addr, int data, int level);
 int dmsintc_deliver_msi_to_vcpu(struct kvm *kvm, struct kvm_vcpu *vcpu, u32 vector, int level);
diff --git a/arch/loongarch/include/asm/kvm_eiointc.h b/arch/loongarch/include/asm/kvm_eiointc.h
index 8b7a2fa3f7f8..9633fbfc066d 100644
--- a/arch/loongarch/include/asm/kvm_eiointc.h
+++ b/arch/loongarch/include/asm/kvm_eiointc.h
@@ -79,6 +79,7 @@ struct loongarch_eiointc {
 };
 
 int kvm_loongarch_register_eiointc_device(void);
+void kvm_loongarch_unregister_eiointc_device(void);
 void eiointc_set_irq(struct loongarch_eiointc *s, int irq, int level);
 
 #endif /* __ASM_KVM_EIOINTC_H */
diff --git a/arch/loongarch/include/asm/kvm_ipi.h b/arch/loongarch/include/asm/kvm_ipi.h
index 060163dfb4a3..d1d72d4bb8d1 100644
--- a/arch/loongarch/include/asm/kvm_ipi.h
+++ b/arch/loongarch/include/asm/kvm_ipi.h
@@ -41,5 +41,6 @@ struct ipi_state {
 #define IOCSR_ANY_SEND		0x158
 
 int kvm_loongarch_register_ipi_device(void);
+void kvm_loongarch_unregister_ipi_device(void);
 
 #endif
diff --git a/arch/loongarch/include/asm/kvm_pch_pic.h b/arch/loongarch/include/asm/kvm_pch_pic.h
index e74b3b742634..887b0431fd20 100644
--- a/arch/loongarch/include/asm/kvm_pch_pic.h
+++ b/arch/loongarch/include/asm/kvm_pch_pic.h
@@ -70,6 +70,7 @@ struct loongarch_pch_pic {
 
 struct kvm_kernel_irq_routing_entry;
 int kvm_loongarch_register_pch_pic_device(void);
+void kvm_loongarch_unregister_pch_pic_device(void);
 void pch_pic_set_irq(struct loongarch_pch_pic *s, int irq, int level);
 int pch_msi_set_irq(struct kvm *kvm, struct kvm_kernel_irq_routing_entry *e, int level);
 
diff --git a/arch/loongarch/kvm/intc/dmsintc.c b/arch/loongarch/kvm/intc/dmsintc.c
index bb7285c49df3..c7d8841df96f 100644
--- a/arch/loongarch/kvm/intc/dmsintc.c
+++ b/arch/loongarch/kvm/intc/dmsintc.c
@@ -180,3 +180,8 @@ int kvm_loongarch_register_dmsintc_device(void)
 {
 	return kvm_register_device_ops(&kvm_dmsintc_dev_ops, KVM_DEV_TYPE_LOONGARCH_DMSINTC);
 }
+
+void kvm_loongarch_unregister_dmsintc_device(void)
+{
+	kvm_unregister_device_ops(KVM_DEV_TYPE_LOONGARCH_DMSINTC);
+}
diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
index 84d84bd432d7..80f78e07c74a 100644
--- a/arch/loongarch/kvm/intc/eiointc.c
+++ b/arch/loongarch/kvm/intc/eiointc.c
@@ -695,3 +695,8 @@ int kvm_loongarch_register_eiointc_device(void)
 {
 	return kvm_register_device_ops(&kvm_eiointc_dev_ops, KVM_DEV_TYPE_LOONGARCH_EIOINTC);
 }
+
+void kvm_loongarch_unregister_eiointc_device(void)
+{
+	kvm_unregister_device_ops(KVM_DEV_TYPE_LOONGARCH_EIOINTC);
+}
diff --git a/arch/loongarch/kvm/intc/ipi.c b/arch/loongarch/kvm/intc/ipi.c
index fcfaf1a66790..7b333a4a0430 100644
--- a/arch/loongarch/kvm/intc/ipi.c
+++ b/arch/loongarch/kvm/intc/ipi.c
@@ -463,3 +463,8 @@ int kvm_loongarch_register_ipi_device(void)
 {
 	return kvm_register_device_ops(&kvm_ipi_dev_ops, KVM_DEV_TYPE_LOONGARCH_IPI);
 }
+
+void kvm_loongarch_unregister_ipi_device(void)
+{
+	kvm_unregister_device_ops(KVM_DEV_TYPE_LOONGARCH_IPI);
+}
diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
index e7b77705c516..83fa2386cf81 100644
--- a/arch/loongarch/kvm/intc/pch_pic.c
+++ b/arch/loongarch/kvm/intc/pch_pic.c
@@ -500,3 +500,8 @@ int kvm_loongarch_register_pch_pic_device(void)
 {
 	return kvm_register_device_ops(&kvm_pch_pic_dev_ops, KVM_DEV_TYPE_LOONGARCH_PCHPIC);
 }
+
+void kvm_loongarch_unregister_pch_pic_device(void)
+{
+	kvm_unregister_device_ops(KVM_DEV_TYPE_LOONGARCH_PCHPIC);
+}
-- 
2.43.0

