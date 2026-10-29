Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793317847;
	b=xiqSGEiwBYfUZ/VYX+hzmND9NpxcqEg74OF05HLVeVIxVilIev8DXXWol/b7ZruhVhzl
	 BWhvTcHFtxwPdzJkUGiGZI0p2lEhDTOkztil+mrQuItb5quV+2rviUwVGXSRfDX+b20v1
	 6TOVET8VUvOICTpqmVsIE46l629fc5LTdZS9/p+veEaHTzH6XukoGjMzI9dOHsw3rOZxr
	 wxuY4q4/9Z5k+qzu7gvjy0RhaDsvyFT5do6o/5z4UOvECuQLrXjN4ywVxBVwk0Q2is9KV
	 6VNqXTB7ogeIPkJRoN+COYqDZ0PmA+3LP7Pr9BEBBd75jHkidH4wDKfnMXaIcJcQU/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793317847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7emnZQPruQD3bCi62a8Jg+jSwhOmw8TI3bWaMqwE/HU=;
	b=f5cQlqmfVDKu+5rCY7m0nPaoobYRrP5DP61g1VbSuplbq0M2qNl9pLNyXWzyKFw4tz6G
	 5DR/qzYcTa76f6D5EpL6i5lWWPU8BG+w3B6HiPVG0Lmu9gbFHZtJiVq7MKAlMLoGQ/P4f
	 H1aYcIn+AtHR+BH2sud8WOxk7AjSSpgxLvUzotn9lVKODELu0WI57XyHRw6Z8rRk1BPSy
	 E1ayz/F4FI11zZX4COUzhI1/9ADFZJg9UcqUuFiYMbJ2D0sya96Zlhc8x9DWXGw2/Lqma
	 1PGuldpxkOIViTxo4M8pO2u5xQiRdqOt+V6ZqOWVoXd9ooY06jYDu6a1F6pphVzVfmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZlxMmUW;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B81606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B81606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZlxMmUW
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8b20a899fso1144365ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793317847; x=1793922647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7emnZQPruQD3bCi62a8Jg+jSwhOmw8TI3bWaMqwE/HU=;
        b=IZlxMmUWdYcy7ERhlT3Z14UvSpdnQ+jTXPPXHMUX2Y3c18QPQZuUn0ulJFClPv5Z8K
         s4B5kfys8FPWT+BuruXDvY3whl815gJo50GnUwml/KNJZqxlHmF/x8JYkUyp+pDBswxC
         pDCOLf8OXPo1DZRZnuS20JKwT3nsLiw643PzADUUupxs1GDEFXebfCak7zGo7dhEgju0
         93Jy3azKAJ6HT6+p7Iw9cynWGLpELyuW8ilefOHU+gw83b2SGWajVvLjaIW8rF8Zjd4O
         3AWpXud8GVczcc4JKAHGXk3i9LSCtwamFxja/ocdkrhfw5mwcRnjcCCzkdRQcN6t1BJK
         MVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793317847; x=1793922647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7emnZQPruQD3bCi62a8Jg+jSwhOmw8TI3bWaMqwE/HU=;
        b=yTc6ymUAIO6i54VbKzjkfa55+jqDS1SDId2QftGKXpy28mcBiQKyTEylaJTy7nK0QF
         pbb1qUMQggTptSEvjeFXq6UQNXPs9sRddKTqoz+YqLdzLYMvdstiEN3PV9VmZMkt9Res
         g2CJYiejHu6PZbhwKTm60EABGq9xdyjnydhUV6bfi2UwhSp6NGXFHkFRSblRv1R2Slgx
         7a0f8+D47s7eZeO7mBDm3bXqDVMecAWcAEU+GAGW+ff4Ke6yYJGvNujoUbSZs/FiPPLP
         Imd4Ai/SKb7RqbuRkj1HJOHHSHh8B8KfwAZdB4bNyfZnbZqZLbxF5wAW9YeRBE4uySAw
         OsPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvARljg4atPkh8rzNrGIZZyo1MJIimJmLgYGPjfleEfcY35UPVNDfr9LqmLykeavmV21IaKX4khG8bqcE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTCVQw+BMDDk3MRuOug3k5tLYSkiM5ZU83kqBTiDPFPQQSGohS
	ZgOjBRmOltcQS6+zRjpCgmuw8oVgeATJjcO7UA81u2+Eylz0450YWZ83
X-Gm-Gg: AYBFou034Dk8gDdKBRUHBE2KhFQiTfSroPmmvQH/xlyRRBhKGB68J7BmD5tERBvev//
	0sVZYuH1XTmsOYuRmJSytJHiLIhts57jsDYoY/CunCwOtJyHgf77278iD5yupp9wCN0Bz33RZZl
	+oEJca1t5hJvMPtOtFEZ+ikSBXNFKHU/Pyo3pFDz2dmuajt3KbIQVkcrylB3gFulhAKFqvG7+06
	vG4AdU7tOzsUFti3JVZFf4LCFHzElDDkVnkobJkw8YGhKq1GXzR+v79n56g0Bkvl2BssJmGzTPP
	Nl3kvy075/MkmpehjtlP2NnCAX/srkitt2yxm7rFKksAAonhy18fBvWkOf1E5GNcpotU1vZ+PNJ
	PLYH8L7VqWtgnyNrGI+t+IUzLytFSzcupQTjpOg1liN+DdEIND04In+F6mWlTQmx74ye9YZ6cuG
	aYVgohh/xVGDAGj9QkD9QwEU0EWGstBIugy8HndaN2acFU5pNvFl6NKp0ewBBXkUraiW/lZjouE
	cpZCkl4lL5Fd294EMrKx7ds+JB47J321Ifc8wDrVk83Vb9JTl0McL9Y/D9bkAmCMjRbT+ZWorfM
	R3ewM6QV0M7dXohtws7PNzpUmSrjy5RBpFX0hTuchywN4Z4AbulFnSjbjzNURwZHRFlRGxjXdy2
	Sp84uek80DQ==
X-Received: by 2002:a17:903:1b0e:b0:2e9:6790:212c with SMTP id d9443c01a7336-2eb3649f446mr8766755ad.30.1793317846670;
        Thu, 29 Oct 2026 16:50:46 -0700 (PDT)
Received: from monk.. ([2604:3d08:8e80:f800:3c86:745c:97f1:5486])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39266f42sm384225ad.40.2026.10.29.16.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:50:46 -0700 (PDT)
From: ma.mandourr@gmail.com
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH 2/2] KVM: selftests: Verify that L2's LMSW leaves L1-owned CR0 bits alone
Date: Thu, 29 Oct 2026 16:50:40 -0700
Message-ID: <20261029235040.12013-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029235040.12013-1-ma.mandourr@gmail.com>
References: <20261029235040.12013-1-ma.mandourr@gmail.com>
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

From: Mahmoud Abumandour <ma.mandourr@gmail.com>

Verify that an LMSW in L2 that exits to L0 only leaves an L1-owned CR0.TS
set, and that L2 reads an L1-owned CR0.NE from the read shadow.

Assisted-by: LLM
Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>
---
 .../kvm/x86/nested_exceptions_test.c          | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
index f47432526e..7113018ee6 100644
--- a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
@@ -109,6 +109,40 @@ static void l1_svm_code(struct svm_test_data *svm)
 	GUEST_DONE();
 }
 
+static u64 l2_cr0;
+
+static void l2_lmsw_test(void)
+{
+	/* Toggle CR0.MP, which KVM intercepts and L1 doesn't. */
+	asm volatile("lmsw %w0" : : "r" (get_cr0() ^ X86_CR0_MP));
+	l2_cr0 = get_cr0();
+	asm volatile("fnop");
+	GUEST_FAIL("L2's FNOP didn't take #NM");
+}
+
+/*
+ * L1 owns CR0.TS (set) and CR0.NE, both with a read shadow of 0.  L2's LMSW
+ * must leave both alone: FNOP takes #NM and L2 reads NE as 0.
+ */
+static void vmx_run_l2_lmsw(void)
+{
+	u64 cr0 = vmread(GUEST_CR0);
+
+	vmwrite(CR0_GUEST_HOST_MASK, X86_CR0_TS | X86_CR0_NE);
+	vmwrite(CR0_READ_SHADOW, cr0 & ~(X86_CR0_TS | X86_CR0_NE));
+	vmwrite(GUEST_CR0, cr0 | X86_CR0_TS);
+	vmwrite(EXCEPTION_BITMAP, BIT(NM_VECTOR));
+	vmwrite(GUEST_RIP, (u64)l2_lmsw_test);
+	vmresume();
+
+	GUEST_ASSERT_EQ(vmread(VM_EXIT_REASON), EXIT_REASON_EXCEPTION_NMI);
+	GUEST_ASSERT_EQ(vmread(VM_EXIT_INTR_INFO) & 0xff, NM_VECTOR);
+	GUEST_ASSERT(!(l2_cr0 & X86_CR0_NE));
+
+	vmwrite(CR0_GUEST_HOST_MASK, 0);
+	vmwrite(GUEST_CR0, cr0);
+}
+
 static void vmx_run_l2(void *l2_code, int vector, u32 error_code)
 {
 	vmwrite(GUEST_RIP, (u64)l2_code);
@@ -149,6 +183,8 @@ static void l1_vmx_code(struct vmx_pages *vmx)
 	vmwrite(EXCEPTION_BITMAP, INTERCEPT_SS_DF);
 	vmx_run_l2(l2_ss_injected_df_test, DF_VECTOR, DF_ERROR_CODE);
 
+	vmx_run_l2_lmsw();
+
 	vmwrite(EXCEPTION_BITMAP, INTERCEPT_SS);
 	vmx_run_l2(l2_ss_injected_tf_test, FAKE_TRIPLE_FAULT_VECTOR, 0);
 	GUEST_ASSERT_EQ(vmread(VM_EXIT_REASON), EXIT_REASON_TRIPLE_FAULT);
-- 
2.25.1

