Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868252;
	b=hMhoZi3PkRjneyMh1h7mM2TrPLxmYW09d6aCr0QHfbBTNhvkGWNer1beydnnBITWTsCN
	 bxaduvhXKs+eGZEaIIuimUVPVN6Rmq8+lBrcqBEltrTSv8v+6xq/q9IBusi4QKsLxOGvX
	 sLR6JeaZ3BVgf7bYqtWak+fRhG5xlzqM6MJN+ObAq3c6BjcB6WLlfCjyYbl1P+ztVnvOZ
	 bRozgAvICXeiZStR/mwd4KD3LsVvwa9J8qf3EymStqkHp8jBkabRCkiWGyNnOU4bz5pOn
	 iMbyhuXlqPUxrR2xFxKXBrp99adpre6qqZ5KnsehAYipoLVb9cpjD3rh2CcVVq9XKPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5atNcJoBdEtptme6+SR91pcU1M0d4t/oMezPf2d482w=;
	b=B3lqW8DUPRJ0EP/cFSv1/JbT/FlMXNX/o1d0ZI9gyO+zoyJQpIFK04JRF27tvn+Czurr
	 m7MeVZC4RkFpxPabJef7TSJChcotQs+gQlmKEpzkPUBfhUeHKd2hzD2j7hKzc7DLxRiZ7
	 bIWJhelc2kZJRs/gqgxYJaCcvnYrtj19YtxyqS00GlpX3us528ZuKImT8Y/9xHHfDcc7Y
	 4irHexAEs7bkKq51lVRmguMpIAQFbWWMs/KpCqKPiRYyijpQWgFsSK720un949PhFgcoC
	 sUBb135iy1u8Utzwra7K7GHiLYxd+wCZYvxmqX8Uonu7ZAYG6xNZkzFP+p9oZz5nx/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="r/IJKTnJ";
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E807606A8A3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E807606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r/IJKTnJ
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso456901a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794868241; x=1795473041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5atNcJoBdEtptme6+SR91pcU1M0d4t/oMezPf2d482w=;
        b=r/IJKTnJGlY99qpX6VddAxkL5v4GeQ1yIpdA9HfLMjKMsL094Rvfx5OXB8Dtjkh5Yx
         sfX84FtrkYmcY9vDcpic83FrjRXw69vCiSjlFsbAbowH2WMVU2KwcqYTeEX3Nm733Op9
         NKK6MaCUD9hl0KLTXdLRF9ZM9cu8g8jBciU/4f9j2960V+3hHf01M3u5Ux3tYrVKB0tT
         52JMRj6xuKZ7eg2N4qXT7/Gydb4w6PIX2rSBIiZT4UywNScb3CZW7qTQDw02q5qCal8S
         TyStT+uYqIkV80iV/YYl+7+BzM+zL1jPzItU9zBWJATfjuk+YzXVjeXzG21V3iImpnDR
         X7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868241; x=1795473041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5atNcJoBdEtptme6+SR91pcU1M0d4t/oMezPf2d482w=;
        b=ghhU9P25G598FFgYCH5VwX/nP0GoJXWWB8H2Zui4EVWmJg/MeZb/+pYoD3ALughYVt
         NgtSfBNIWAwBphJYgQkx6SU/xiJiE6gUw+gvD15QoPLFBnu4ysDcqt5bMhQYyhWTPyV3
         V6/5PvRolYNDNW7V2Kv5YrVjlweIQ61G3UEA3dLQCI2bA71O43MlwlXNAGoMUUuknNr5
         olAWlSlG1bLmIOs3TxrgwcRgjWtgbB3RzYJ/OUE8Zlb+uomqRhKhpBNwcc+RzAPuuv0Q
         Bs5Ud/65vFdNwnyJBISgKquYD+F9hT2jqzOJav7S32fsiwHnO/GHRlxlcGsDlyagy12c
         F+Sg==
X-Forwarded-Encrypted: i=1; AL+hErGeEEaDVVBK8iZ8t66vte+gp2oAHaBfHNsK396FmDFb5DxakSXGsqNzza7Yi0MxkrqI59SwJQCw3rDFHdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kpbfNrnhgRxIJPAWp/FA8tCSMeq9qFEYlFXV9gze+PK5Z4up/
	sZsdRbaNgxuPteUFQFxTerYPCksT/cNrvjD4c34qBVlGCBzD/m7ZtE5D
X-Gm-Gg: AZFdTZcsaUdlslEIic+SVC63rtYrq12LxSmuG8hyxEOQDmquQzL0YjRFIedeO6dXo6L
	tjSTgWBNrbC8JDlQhFNtOazP35dyKYGZVq4aiyvXIdISsScA0Ms1rE1poeK1mIav/prVMw+yOVf
	qllblnpUpUoXoDy3KsVA/uB/o0xsr9McwexadoBgNQOZCR1tOzODc3uuRYrx1p3vkvogTYiSvpN
	VQCUPw2zktcbj7MdVAQjUGUNWoHVDAwIqNLZI6hOaVSli3DP/WNR/OVXanPI73A6ZrUnYjdSE0v
	F4k+GXZ8bQ/z8dKr1NqWSC5Xp5BLYXsN+QxVKtHKc9iOOy0pt+71t6ngCN87w2cvzNYVdW4/yM+
	wz/Prp+ibs5uawvqoihpl2C3JuYQce/UaqIlKyzEyqZQtB/hBUWsWV7AXnCYs2yNYG625LE1IO6
	wV4OO6qatx7Gf3d0RyE3IqqJm5h2e4nMcWg2AD6dwKJnI4rjlRUXKV0EDp3o7Mn5dXgBB2P+15y
	EenJVH1UuQXi1QyeisiyqjiSG4M/mGIwGMSQ7dnqcy+0jenLecrvyyYvgdxMQ1m5aUO6ld0KaTb
	pLCVrEaoU0rIMnn2lZansSSi6PE90Zr/70pWwN9sT844g/4zwUZFXgrLSQ6/44ZttpwIcz8Yy+q
	gUmBIrHK+lOgbLAZ73Eax1AQw0eR34B+AlmLKd9LEBrTHBUg/h1v38HXS7DMKL1lv2fUmC5A=
X-Received: by 2002:a17:90b:5546:b0:3b0:9e2c:9b61 with SMTP id 98e67ed59e1d1-3b1b0a46d3emr10963616a91.35.1794868240317;
        Mon, 16 Nov 2026 14:30:40 -0800 (PST)
Received: from cs-arch-srv04.cmpt.sfu.ca (cs-arch-srv04.cmpt.sfu.ca. [142.58.10.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm944375a91.5.2026.11.16.14.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:30:39 -0800 (PST)
From: Mahmoud Abumandour <ma.mandourr@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH v3 3/3] KVM: selftests: Verify nested VM-Exits while vectoring INT3 and INTn
Date: Mon, 16 Nov 2026 14:30:33 -0800
Message-Id: <20261116223033.3866283-4-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116223033.3866283-1-ma.mandourr@gmail.com>
References: <20261116223033.3866283-1-ma.mandourr@gmail.com>
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

Verify that a VM-Exit while L2 is vectoring INT3 or INTn through the
empty IDT reports the event and its instruction length, and leaves the
VM-Entry instruction length alone. Only VMX is tested, as both lengths
are VMX fields.

Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>
---
 .../kvm/x86/nested_exceptions_test.c          | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
index e83c1f4170..26dbd8cdbf 100644
--- a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
@@ -40,12 +40,25 @@
 #define GP_ERROR_CODE_INTEL ((SS_VECTOR * 8) | ERROR_CODE_IDT_FLAG | ERROR_CODE_EXT_FLAG)
 #define GP_ERROR_CODE_ZHAOXIN ((SS_VECTOR * 8) | ERROR_CODE_IDT_FLAG)
 
+/* No "External event" flag, as INT3 and INTn are software events. */
+#define GP_ERROR_CODE_SOFT_INT(vector) (((vector) * 8) | ERROR_CODE_IDT_FLAG)
+
 /*
  * Intel and AMD both shove '0' into the error code on #DF, regardless of what
  * led to the double fault.
  */
 #define DF_ERROR_CODE 0
 
+/* Arbitrary, any vector #GPs with the empty IDT. */
+#define INTN_VECTOR		0x40
+
+#define INTR_INFO_VALID_MASK		BIT(31)
+#define INTR_TYPE_SOFT_INTR		(4 << 8)
+#define INTR_TYPE_SOFT_EXCEPTION	(6 << 8)
+
+/* Arbitrary, but not the length of INT3 or INTn. */
+#define VM_ENTRY_INSN_LEN	7
+
 #define INTERCEPT_SS		(BIT_ULL(SS_VECTOR))
 #define INTERCEPT_SS_DF		(INTERCEPT_SS | BIT_ULL(DF_VECTOR))
 #define INTERCEPT_SS_GP_DF	(INTERCEPT_SS_DF | BIT_ULL(GP_VECTOR))
@@ -70,6 +83,16 @@ static void l2_ss_injected_tf_test(void)
 	GUEST_SYNC(FAKE_TRIPLE_FAULT_VECTOR);
 }
 
+static void l2_int3_test(void)
+{
+	asm volatile("int3");
+}
+
+static void l2_intn_test(void)
+{
+	asm volatile("int $" __stringify(INTN_VECTOR));
+}
+
 static void svm_run_l2(struct svm_test_data *svm, void *l2_code, int vector,
 		       u32 error_code)
 {
@@ -172,6 +195,18 @@ static void vmx_run_l2(void *l2_code, int vector, u32 error_code)
 	GUEST_ASSERT(!vmread(GUEST_INTERRUPTIBILITY_INFO));
 }
 
+static void vmx_run_l2_soft_int(void *l2_code, u32 type, int vector,
+				u32 insn_len)
+{
+	vmwrite(VM_ENTRY_INSTRUCTION_LEN, VM_ENTRY_INSN_LEN);
+	vmx_run_l2(l2_code, GP_VECTOR, GP_ERROR_CODE_SOFT_INT(vector));
+
+	GUEST_ASSERT_EQ(vmread(IDT_VECTORING_INFO_FIELD),
+			INTR_INFO_VALID_MASK | type | vector);
+	GUEST_ASSERT_EQ(vmread(VM_EXIT_INSTRUCTION_LEN), insn_len);
+	GUEST_ASSERT_EQ(vmread(VM_ENTRY_INSTRUCTION_LEN), VM_ENTRY_INSN_LEN);
+}
+
 static void l1_vmx_code(struct vmx_pages *vmx)
 {
 	unsigned long cr0;
@@ -193,6 +228,10 @@ static void l1_vmx_code(struct vmx_pages *vmx)
 	vmx_run_l2(l2_ss_injected_gp_test, GP_VECTOR,
 		   host_cpu_is_zhaoxin ? GP_ERROR_CODE_ZHAOXIN : GP_ERROR_CODE_INTEL);
 
+	/* INT3 and INTn also #GP, due to the empty IDT. */
+	vmx_run_l2_soft_int(l2_int3_test, INTR_TYPE_SOFT_EXCEPTION, BP_VECTOR, 1);
+	vmx_run_l2_soft_int(l2_intn_test, INTR_TYPE_SOFT_INTR, INTN_VECTOR, 2);
+
 	vmwrite(EXCEPTION_BITMAP, INTERCEPT_SS_DF);
 	vmx_run_l2(l2_ss_injected_df_test, DF_VECTOR, DF_ERROR_CODE);
 
-- 
2.25.1

