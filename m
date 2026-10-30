Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330999;
	b=JLIZRNn2lS+P6aGxQ3Wm+wJFKUpuUlvUyWTUW6JHx5kLSBCcChlmFniVdojsVGQTvNL0
	 VD+OpL6q2ywGkM8CdIY/+v0MrcfsyUGQN4AMRwQIak0qip5g3uPOeubO2xla2zq5FCo70
	 JhAuveF1Uz32YFIhbYLlfB67z+fpuHrQ6/9YqmZJsAUfUGtugEPhOssk/6Z7MOjbhJcy1
	 w738HR8B8srKKJHVXQqoNzwX60bIMH+cBJngWlC2dT46kgDhgrxZh1J65jlFdCeRhsjSP
	 llEEdBayYiIg3krx+r9iie1L40mPaRtmAEruCzC1sWFCaCgVMzJlvus9ByGgy79ra5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KlleBVM3i1uLVt+wBeFSTUPaEiDOxCnK0ld617cCPMg=;
	b=3Iwyss+RHcWsPhTb3N1+s80QD25kO/OADRpWHyqmqKEb/nJSfItEOovvAtPvneL8FO4n
	 cH9FJcBhDOrkiCyeLGdltrYmJOV6JfQJEI1SpG0VSmkKPlzwWctG2nQinkSS1xjnp3cx7
	 dkXaztWPFnchiTrV0wxmZVb/3wCFNuUmMQNKWG8HSgl8HCxGZQYRaHgp7GuED9SYwNfx2
	 kURDsI2MON9HptU75DBI0ZtiUN0yjuIGI5MUv0S3FjjqvPkucd8/xa4Ezm8zW1DbOXU2K
	 2qnszzTHRi78FPn9pkjWhbeUbwv0D9TUkiG7b/W+tiJi3w0A66WQCAVLKXy3zRbmxHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YklNh9K3;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8431F606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8431F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YklNh9K3
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a06210b29fso61242b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793330994; x=1793935794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KlleBVM3i1uLVt+wBeFSTUPaEiDOxCnK0ld617cCPMg=;
        b=YklNh9K3MNu4Vqr2OGSUyszMcNshYyCz+G4TnKQ583DrOxN09+x+RB20wf41XXl7v5
         AT+hhJGPZtMQQYR8hGbDqZzZmKnQ9YH5RWY1ez44ZBV4tLQZzugxpslI0YNEP0TUeVPA
         6S2aytsLc0XFTZw7+9Ea7eYhjadLfrrMU9WcYVSsQM0Ixi6pcJvZF9WiHGDTb9tctyQo
         Aj1skvWVWD0KPpFVFFCSQWGhhAN5VqO+HorNghoGkyjCG6DCEKVoaFcOAlFGk77Oi57P
         zgL87C5KlyDPRd/ye4xHc5YWFuIs67PsCf+HVH15zlnq6NPtkgXZQya7chtOSpfi0jgO
         k/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330994; x=1793935794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KlleBVM3i1uLVt+wBeFSTUPaEiDOxCnK0ld617cCPMg=;
        b=hQzVzGZTjrDCksl/LyZkJ8r3H5weBLbNsXluZVwPlfbEv3TKGdoFjM+FXCSzEPCM5I
         aZ0u09PXYX9ZZsP5HPDlR5WsmkaPJNUmdCu4V8l6WGor0YRrDX+FoaC+iK6ve/zzn3Q6
         Zcpco44LgcKyQ9+z8I1fWjbIqri/XCqeXxcJnEAzjb8ss5unBnBPcpl/jnojs7F3MclX
         ojcdiKiyeN4rglDuwwr7+8AnyH52eh+99rGdhLAm/ePlDhM3MNRR1FeDOQaLsNnKkB0x
         RWnVHW7iL2GOkf+5Rbf4k3CUolfLb9+LFn2lsnbLMA+egPFfCBRvgYPvn003upr0mZPr
         GZfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyZNvaoW6WS5oO6v9qMGWqUyNS9A0g66fGXWhrlSimUVTxikfj64FDla4jxaecad4NGTN584m079gwU8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLruHh3eJ5m6+qYgeVNDGYSnBfU1GrI/pJx2lkk8G7pacJDMbri
	JAGrLVYqMOxnFsw+GAdk2Q/WoMrfX1wpTNrlNb+EtK29Gcdw6SZBiNrbTDSd3w==
X-Gm-Gg: AYBFou1/6zAcyvZCV/2qw7kXOb5zNMMKkZpbApAT/YLrQSej6GL5neY6fvfPQL6d8MN
	iqRnbdNwf5B2tubDD+R5uWHMaPyK4L1tzrVo+ykNviocrPbKHk8NfoJymRu8+dlAZZSL506cM8/
	L2E+YezEVV95WCFqXa8pTy3VXh300fnP8FnKMNXuYbY8jSEvre5eRQ+8IW/o+am+R67pPH4ceJ3
	v87Dri3shZde0IO8w6TiOvuaGxzRk5R8OBdJZQCsUmVgoq5+EUfGsdSEtZZsKBgb7YMqXfHOxUF
	36vRxms14cHR8x/PdTV7TYru621RgcWhW6SB9S5nR6H4w8k6oYVdNcn5g9dkT4OyPDaezTrpMlU
	t7xpSEJXlKoqSxOO+KvkAWY87ztCUeZ2QsGsZErqW3AzMNBSEGKkWDmcrTxBWrXpavNqwbl2AGc
	6gTaSCYZsQNC09yJqPbJmTRYuHhLa5if6tXGWMt5XqZuKZoyuAvQlOKjLGgsjhDwDwp37x3HRPK
	MLU7eHfpZbEmwmJhsvJZHWyNn2FMcIRDnbSAwi7VanNEmax3Znq/S4FlgMe3xUxytRyhQXqS0W3
	XesAAZN9UUOdJ+GawKoPEYWE75f35IINHD299yy2d+Hr7iwDfQ4PaKNZ2UxcbGzeLJ1yX/e5jtd
	wtBremzHzJL+ygRU7d+OH9MtcdT6OfthLjEdGr2HvymL4gXQdQRJKJuE5Xf4GTtiwN0itwhsY
X-Received: by 2002:a05:6a20:b096:b0:3e2:9dee:42cd with SMTP id adf61e73a8af0-3e928d22422mr943709637.36.1793330993793;
        Thu, 29 Oct 2026 20:29:53 -0700 (PDT)
Received: from localhost.localdomain (S0106e0dbd1c8af8c.vc.shawcable.net. [24.85.96.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb0981c5desm111713a12.27.2026.10.29.20.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:29:53 -0700 (PDT)
From: Mahmoud Abumandour <ma.mandourr@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH v2 2/2] KVM: selftests: Verify that L2's LMSW leaves L1-owned
 CR0 bits alone
Date: Thu, 29 Oct 2026 20:29:37 -0700
Message-Id: <20261030032937.2813-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.40.1.windows.1
In-Reply-To: <20261030032937.2813-1-ma.mandourr@gmail.com>
References: <20261030032937.2813-1-ma.mandourr@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Verify that an LMSW in L2 that exits to L0 only leaves an L1-owned CR0.TS=0D
set, and that L2 reads an L1-owned CR0.NE from the read shadow.=0D
=0D
Assisted-by: LLM=0D
Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>=0D
---=0D
 .../kvm/x86/nested_exceptions_test.c          | 36 +++++++++++++++++++=0D
 1 file changed, 36 insertions(+)=0D
=0D
diff --git a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c b/too=
ls/testing/selftests/kvm/x86/nested_exceptions_test.c=0D
index f47432526e..e33d2e0db0 100644=0D
--- a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c=0D
+++ b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c=0D
@@ -109,6 +109,40 @@ static void l1_svm_code(struct svm_test_data *svm)=0D
 	GUEST_DONE();=0D
 }=0D
 =0D
+static u64 l2_cr0;=0D
+=0D
+static void l2_lmsw_test(void)=0D
+{=0D
+	/* Toggle CR0.MP, which KVM intercepts and L1 doesn't. */=0D
+	asm volatile("lmsw %w0" : : "r" (get_cr0() ^ X86_CR0_MP));=0D
+	l2_cr0 =3D get_cr0();=0D
+	asm volatile("fnop" ::: "memory");=0D
+	GUEST_FAIL("L2's FNOP didn't take #NM");=0D
+}=0D
+=0D
+/*=0D
+ * L1 owns CR0.TS (set) and CR0.NE, both with a read shadow of 0.  L2's LM=
SW=0D
+ * must leave both alone: FNOP takes #NM and L2 reads both as 0.=0D
+ */=0D
+static void vmx_run_l2_lmsw(void)=0D
+{=0D
+	u64 cr0 =3D vmread(GUEST_CR0);=0D
+=0D
+	vmwrite(CR0_GUEST_HOST_MASK, X86_CR0_TS | X86_CR0_NE);=0D
+	vmwrite(CR0_READ_SHADOW, cr0 & ~(X86_CR0_TS | X86_CR0_NE));=0D
+	vmwrite(GUEST_CR0, cr0 | X86_CR0_TS);=0D
+	vmwrite(EXCEPTION_BITMAP, BIT(NM_VECTOR));=0D
+	vmwrite(GUEST_RIP, (u64)l2_lmsw_test);=0D
+	vmresume();=0D
+=0D
+	GUEST_ASSERT_EQ(vmread(VM_EXIT_REASON), EXIT_REASON_EXCEPTION_NMI);=0D
+	GUEST_ASSERT_EQ(vmread(VM_EXIT_INTR_INFO) & 0xff, NM_VECTOR);=0D
+	GUEST_ASSERT_EQ(l2_cr0, (cr0 & ~(X86_CR0_TS | X86_CR0_NE)) ^ X86_CR0_MP);=
=0D
+=0D
+	vmwrite(CR0_GUEST_HOST_MASK, 0);=0D
+	vmwrite(GUEST_CR0, cr0);=0D
+}=0D
+=0D
 static void vmx_run_l2(void *l2_code, int vector, u32 error_code)=0D
 {=0D
 	vmwrite(GUEST_RIP, (u64)l2_code);=0D
@@ -149,6 +183,8 @@ static void l1_vmx_code(struct vmx_pages *vmx)=0D
 	vmwrite(EXCEPTION_BITMAP, INTERCEPT_SS_DF);=0D
 	vmx_run_l2(l2_ss_injected_df_test, DF_VECTOR, DF_ERROR_CODE);=0D
 =0D
+	vmx_run_l2_lmsw();=0D
+=0D
 	vmwrite(EXCEPTION_BITMAP, INTERCEPT_SS);=0D
 	vmx_run_l2(l2_ss_injected_tf_test, FAKE_TRIPLE_FAULT_VECTOR, 0);=0D
 	GUEST_ASSERT_EQ(vmread(VM_EXIT_REASON), EXIT_REASON_TRIPLE_FAULT);=0D
-- =0D
2.25.1=0D
=0D
