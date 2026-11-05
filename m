Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896625;
	b=PGgMLqOWRP8TudEr0OuYUywJVNjPr8qpAP0EHQ8EZ5Cl7B8G017PQdwGfQtJGpDM4sYF
	 2Z7cpWjSCkHvYtV9jAiKNSPTFz9FKKgqsAypLwP2lGB7wY76LUiFGyUxqDwkXRs52XYgv
	 +mCdEpGde6w8A0M6pyMzR0fFhIdQ8ebkQpA0xc5Jgs0khundp49yFPoOZEq2uJVqlIi9O
	 MP1UUy3ZfXO2UHT2HhAT+OirN+Iq5gIOVvFTTPw5fKCEcvvv0PupukTbj5uS8K2rBJPc1
	 sW0JRHqk+7PoL1JGzu7au5iG0Wl7eBcGwiA0930UK3O8SlEa1b8Wcz247tBOEJzX1kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=EMTT2HHjSkY1uGJyH89VPeEJ36kiCXEDFii0T4E6Iac=;
	b=T0hveX8/7zjgoAQE8una7yQHVk+Ym48rOitXrptI6ATR8FAe+nIuMlz/tOU2GYBq0MK0
	 Hv45u+IYQgXyvVcV7X6Rb+vG6xTUyt5LNHx+0+vjlktdXd0UgKeIvkmLPITBSEd/frmVk
	 M30rSs1G0HiFYaQLhBOvtrT3gIRyVGxxucZXtVEKI9hLoi8Y8jhjqs3k7TDxAezIi3l8+
	 8OplnpasoQGa2/N3sAFL7XK+ahAgNkLCUqSXEPfD45c73znRP5068bDGiemFlwdBz4nyn
	 Wr1brhpnxCT3DVab9bK+ASFrOhwqji3AKPiDRWZ9NWAWKGz1oMo8OSpWggHvgf0AcDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h43CPja3;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969EB606B3DA
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 969EB606B3DA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h43CPja3
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdb684859cbso203432a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793896624; x=1794501424; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EMTT2HHjSkY1uGJyH89VPeEJ36kiCXEDFii0T4E6Iac=;
        b=h43CPja397Wxk7BuUAKdbooVEpDaqJLuGmG3AT5/791iKKS5eiAU6lh7u1JbE0Mq78
         +9oRSianhKPO/HA1gBL2vrU3w6lIR7qSraYBEdVYl2uPJ65ncsS1I9I2leOVuGrcv/bt
         sAy/aUnI4dnTLwPZC2bvNsTsU3icEgBMF6UpzeBqy/b0rCnmZGuF2bDQzCh8XbcZgzR7
         yKsxt1bp1lX5qfOUdhfexth16YT+tHLrRTx2oVdFuCI2YzD+TdredLDDH/ZKAC+4wHi7
         EB/KRd04cjwrwGzxsPxdGWxuJHdoqObrQeSF2bNgnOpZueQPe7OyekDD96xtrxdjvPtR
         59nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896624; x=1794501424;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EMTT2HHjSkY1uGJyH89VPeEJ36kiCXEDFii0T4E6Iac=;
        b=w2DrcDCWWLTra0dnlN9swEAbMfDXY9k0Ctv/r2n00ohbd36paEhBu2wlPTkDTD13RZ
         ECAgz0AvrhERhhE/8b4iG5Rtgij1dqz6RhtLVtRAmVZiD9udfeIkvPFTuc5+gY9MiPVX
         AIL8DE9eFDBekl8RdEVRJoTBsqnm36atI3/XoxZiqVKppU0IfMALFmTbEPIxbTzEbki4
         gSroIGhWE4bV62NSCV3I9rqRPoQlUMsdMhgxLwGM2o6uBZNOmzvHvmjFP+UI4PCBcfpm
         Cx0cKZGg977bqpxpDp7jNhKyAlcxpq3X8e2hZRI3J78bFoSnGjH5XomVtjnorDcXcoxD
         EGxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoO04FWIn4zKzA+HRoSpv68DCSjJXyFxA5WxtZN49xfkAjfvTyOOyfcgg9rycQb40ZFGhQYdFqz/Kki7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WVByBEDwNk0DkP21FsX3UwCrxt8CfFYHjCA1AzKYPHjFfgJt8
	9T9nYSGR1h1sQ0nFsm8AltrU17fVqfCRl0eqHxQy/OXD8KPZf2S1jKSA
X-Gm-Gg: AYBFou1hK5hcR5Vq5J3Q9h1rtQo7PTOuJ7E+/jmeqoPttGHAJ7FcjXeDXlYqwzy2rM0
	VdT7WK8WQ1eIDSvgu8BLsT1DAVciAVtDtz2jQbR3x4nisPTHrI0o+DfIAe/Wdk9qJF8ninlf5yl
	syPCD69Nbsr41+SB5YgWW+xlF7lQLJar2KWd7UP8TFxAemDN9spJZxQCt+uPQJO+FzzS3q7l7jh
	xzy411LvW1l8BlWKkAJhRI6n72DV/itmuAm6fFE9tu+mAcAeaTOwmDyUFRD5p/8UsZmD6YVKsbB
	UAJVc7UP2UhQp0C1XaPo17pSpdHMGvXPq6TFixK8RxJsqqVYmEbcaRRidxEyaAxYi5qv29o3Yje
	B9NEOy1nvqAeb0ud4U+yGXatp69DhnPzKbgTUmTpuLxRAB+G3x+7D2Lab/OGv6SHoZEatyTKyoT
	OGCNSSSZ2ZyYdK0X63JR1vmLCRELDlwYscn+5/t8KZJ33ni129zjbJQ+8AUFOj6wu3SadeO4FhQ
	FI4mkmDF8JdRWZsMDH/roI+tizmebY4GKtzhf1eDPumfX/2ASmVzjCTQs/mAP2vmV+MP3sxc7qa
	3j3tD8LKTuM+FD37y628cdi/v0nkxeG3sE4rJe5DnnYAvrAyNBaKqkbaLIg+ZmBgdVgq5wENDrq
	5jue8Y7f2Eb8ekPYloe1xoJ3vjW6rNz5Zng==
X-Received: by 2002:a17:90b:4d85:b0:3b0:a378:1cf with SMTP id 98e67ed59e1d1-3b0a378049cmr4183905a91.22.1793896623555;
        Thu, 05 Nov 2026 08:37:03 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3160634sm4692625a91.6.2026.11.05.08.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 08:37:02 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 16:37:02 +0000
Message-Id: <DMNFA3D0M816.2K02S8LB47QM4@gmail.com>
Cc: <eddyz87@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <pulehui@huawei.com>, <pjw@kernel.org>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <luke.r.nels@gmail.com>, <xi.wang@gmail.com>, <shuah@kernel.org>,
 <rgbi3307@gmail.com>, <guoren@kernel.org>, <bpf@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 bpf-next 3/3] selftests/bpf: Add a runtime test for
 private stack and stack arguments
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Chen Pei" <cp0613@linux.alibaba.com>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <memxor@gmail.com>, <bjorn@kernel.org>,
 <puranjay@kernel.org>
In-Reply-To: <20261104100411.997-4-cp0613@linux.alibaba.com>
References: <20261104100411.997-1-cp0613@linux.alibaba.com> <20261104100411.997-4-cp0613@linux.alibaba.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 04, 2026 at 02:04 AM Chen Pei <cp0613@linux.alibaba.com> wrote:
>  .../selftests/bpf/private_stack_runtime.h     |  12 ++
>  .../bpf/prog_tests/private_stack_runtime.c    |  84 +++++++++++
>  .../bpf/progs/private_stack_runtime.c         | 140 ++++++++++++++++++
>  3 files changed, 236 insertions(+)

bpf ci is right in the other email.

pw-bot: cr

Also, the test runs on riscv64 only. BPF CI runs arm64 and not riscv64.
arm64 has the same combination and no test for it.
The run time part has nothing specific to riscv64.
The __jited patterns pin the frame sizes that clang picks for C code.
zero_stack doesn't use the private stack.
It's the only reason for serial_.

Two asm progs in verifier_stack_arg.c are enough.
BPF_PROG_TEST_RUN runs a raw_tp prog. No need to attach it.
The test runs on x86-64, arm64 and riscv64.
On x86-64 both frames stay on the kernel stack.

Like (not even compile tested):

diff --git a/tools/testing/selftests/bpf/progs/verifier_stack_arg.c b/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
index abf319c..9423048 100644
--- a/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
+++ b/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
@@ -667,6 +667,53 @@ __naked void stack_arg_precision_fallback(void)
 	);
 }

+/* Writes both ends of its frame, then reads args 9, 10 and the frame of the caller. */
+__naked __noinline __used
+static long priv_stack_10args(long a, long b, long c, long d, long e, long f, long g, long h,
+			      long i, long *j)
+{
+	asm volatile (
+		"r1 = 0;"
+		"*(u64 *)(r10 - 8) = r1;"
+		"*(u64 *)(r10 - 64) = r1;"
+		"r0 = *(u64 *)(r11 + 32);"
+		"r1 = *(u64 *)(r11 + 40);"
+		"r1 = *(u64 *)(r1 + 0);"
+		"r0 += r1;"
+		"exit;"
+	);
+}
+
+/*
+ * A frame of 64 bytes in a raw_tp prog goes to the private stack.
+ * arm64 and riscv64 pass args 9 and 10 on the kernel stack.
+ */
+SEC("raw_tp")
+__description("stack_arg: private stack in the caller and in the callee")
+__success __retval(890)
+__naked void stack_arg_priv_stack(void)
+{
+	asm volatile (
+		"r1 = 800;"
+		"*(u64 *)(r10 - 64) = r1;"
+		"r1 = r10;"
+		"r1 += -64;"
+		"*(u64 *)(r11 - 40) = r1;"
+		"*(u64 *)(r11 - 32) = 90;"
+		"*(u64 *)(r11 - 24) = 8;"
+		"*(u64 *)(r11 - 16) = 7;"
+		"*(u64 *)(r11 - 8) = 6;"
+		"r1 = 1;"
+		"r2 = 2;"
+		"r3 = 3;"
+		"r4 = 4;"
+		"r5 = 5;"
+		"call priv_stack_10args;"
+		"exit;"
+		::: __clobber_all
+	);
+}
+
 #else

 SEC("socket")

