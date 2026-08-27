Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9077F286D5D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805962; cv=none; b=RmjNsvw5wydtdHYuYZxTl+vsn4ZSIeHAH0SIriwIj/ltVZG/zFc4uyvY5s30FaCePyrlUHS/gu8nyaPwGFC39yuVIa5L4996ogmjH+Tj6RHAnMY059VIZLlBJnTRfVBcMtSdH3ptSyJnjcw76fh0Z7Imrkavgb3x+lvAhX5AsOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805962; c=relaxed/simple;
	bh=7nneyVx7k7xrEDZv0nl9gc2vrg8v2b/keKLgPkrNOU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJXnTis+uzVhm7ydvOcPlDkOm6ph84rGx8ULOn2MtF/wWLH/lH7bXbZj86XpBllU/u3Qq5UXaTEkGg4pqgbHeQw/5Iw3mgyHbeFoKnPxkNGjTf70G6RoFlXiva55Ofusp9OLLv0Yhw3czKp172ZdMzUts9/9xblS6XA6ww+L72s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l05uRgsm; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l05uRgsm"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d049069377so21451935ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787805961; x=1788410761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEzr0jYee/fARbmWPhLxuBfGYBmn4khYyL4pUGs2CjQ=;
        b=l05uRgsmde9ziZiAkR6xFPVmo4ark2OKWExizHJnevSQOVY2ICmzWawhuGbPRqc1yd
         WHjxRTs/y7LMZessUhYFfzwIph9RNVbwhG/mG0+nPQQhW9939gtWxDMi7ZnnwmIjmgGa
         99jzK5dESXfDDVCFOreehCxYLsBV+NYJFG8s79kKDkegL0BYixLoBiExyT1CEKjY+lcK
         bXYH6cBkt+q88cXbQF94F0WVkk7BFyc3mgX1EYrQ33QqdP5m/RhZgbx//DZ8qpDHHl8i
         Lm45d5Bv3MkKC1awjRxzYrogY8av99bOlkBcRuGD24nNU6XUtEGvfowlaEiAQnaIF+TD
         uQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805961; x=1788410761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sEzr0jYee/fARbmWPhLxuBfGYBmn4khYyL4pUGs2CjQ=;
        b=T05hEIVeQu/DaozPdkeV1SZwfq2KeZejQXpRGLol6yTXYaqLSLAxkQu1FqpkQwrCui
         xwzhBKwj0Tae9bUM+UAxB2MXf/j7tczAq0f5yzkgBg9mde6OT+mQQzZHjvYPD+D9xrkv
         LY/8zTvgSu1rI+yUxAJaGsdLTYpfle5AduVvQFsNzw6i9lRTdKSCrD+SXyTKV6ihCN0e
         nih+viE+Ppsh8qApxg0R/3GjhvtWwncjo0D05YpqaiQJuE9lZfwHtSFxFzS2U0Y1r9wV
         A6svmX/np1DHgKDnr6BTK+zwKhFgg78hWwGF3yjEoqz1KDCuvKhG7WvWjbep96xgWeST
         /YLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPUlhx/PzUazhbb7S3twWUDWS4NkDP8Yr6Kb4pG73aG0LOpFzHD/W1N29zUm/I7skF7Vr/EyMNixZfrCY=@vger.kernel.org
X-Gm-Message-State: AFuF++kSUKr+8RDttyRG47rkFgVF799piq7N/K4fB9kYUNK/zH7xouf5
	9U8WuQOS9NxlEm/wSt3+bch+SSlTQnXDEAQz5b0X2PPbJQAedBH96eED
X-Gm-Gg: AR+sD11y8i+03ubLtzakmTjSwrD5mTB9RaV19ryRnGmFaARqE7NWvW7oQkXMdBSTkuF
	HUZlRBh1kQxFp3Zdw6QiQxz0HkS1RO7qpPcXHvUnUuTYfVxeGgmjT2nCLVq4V0ngGLLOzftlJy0
	m9mUKGbzVJPxrSAY+awZDFswL8AJEwaWqThM0ya2ChHZQnzbeC5azea4SiiI3AACkNClbnjCZ8C
	pdjIbFh+bH3nbKBuMfN0o6Um3/kuLPsHFv6VqojjwA6ucXlAIieSr0Y6U1+FMK2UeZNRydwKa8R
	yJ+K87AkVsZqfT1mOVcb7QDRRWWYd8jXQ9huJa/DFQSSROQMDWckpkq5IvjHUi7+sb6FWldEz4i
	5NDak0mkgSxer833uLLAYe4GC6Q5KmBFR9k3MM1RDPWPH0ZEjBEw2ULPKhATRaSkSl5O9NDkWFE
	DZGGIKqxAEMSPJcB0kfPlROMwNvSmV4Hmyd65Z2zlWCkZl0XqXRpSDRzYj7Vm28DLX2KVn/APpF
	HmK5bu+rHU=
X-Received: by 2002:a17:903:320e:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d707beaf8fmr248904825ad.12.1787805960656;
        Wed, 26 Aug 2026 21:46:00 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3285a5f96efsm2270583eec.11.2026.08.26.21.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:46:00 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] KVM: selftests: Add a helper to read a vCPU's APIC ID
Date: Thu, 27 Aug 2026 10:15:33 +0530
Message-ID: <20260827044534.2900285-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260827044534.2900285-1-hemanth.selam@gmail.com>
References: <20260827044534.2900285-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reading a vCPU's APIC ID from the host means open coding KVM_GET_LAPIC and
picking the field out of the register block, which several tests already
do.  Add a helper next to the other APIC definitions so that a test that
needs to target a vCPU, e.g. to send it an IPI, can just ask for its ID.

Handle both APIC modes, since where KVM reports the ID depends on the mode
and, for x2APIC, on whether userspace enabled KVM_X2APIC_API_USE_32BIT_IDS:
read APIC_ID for xAPIC, where the guest can rename itself, and use the vCPU
ID for x2APIC, which KVM keeps equal to it.

Assisted-by: Cursor:claude-opus-5

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 .../testing/selftests/kvm/include/x86/apic.h  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86/apic.h b/tools/testing/selftests/kvm/include/x86/apic.h
index 31887bdc3d6c..df8815bd57af 100644
--- a/tools/testing/selftests/kvm/include/x86/apic.h
+++ b/tools/testing/selftests/kvm/include/x86/apic.h
@@ -79,6 +79,26 @@ void apic_disable(void);
 void xapic_enable(void);
 void x2apic_enable(void);
 
+/*
+ * Reads the APIC ID of a vCPU from the host, e.g. to target an IPI at it.
+ *
+ * In xAPIC mode the guest can change its own ID, so read it back from KVM,
+ * where it lives in bits 31:24 of APIC_ID.  In x2APIC mode KVM ties the ID to
+ * the vCPU ID, and reports it in APIC_ID either as-is or shifted left by 24
+ * depending on KVM_X2APIC_API_USE_32BIT_IDS, so use the vCPU ID instead of
+ * having to know which format the VM opted into.
+ */
+static inline u32 vcpu_get_apic_id(struct kvm_vcpu *vcpu)
+{
+	struct kvm_lapic_state lapic;
+
+	if (vcpu_get_msr(vcpu, MSR_IA32_APICBASE) & MSR_IA32_APICBASE_EXTD)
+		return vcpu->id;
+
+	vcpu_ioctl(vcpu, KVM_GET_LAPIC, &lapic);
+	return GET_APIC_ID_FIELD(*(u32 *)&lapic.regs[APIC_ID]);
+}
+
 static inline u32 get_bsp_flag(void)
 {
 	return rdmsr(MSR_IA32_APICBASE) & MSR_IA32_APICBASE_BSP;
-- 
2.43.7

