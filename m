Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793548612;
	b=dMmZhnPa5mr6Fl5eI/gO0f3SqU7eeFbd8QZi7rF80ay4TgFdwYlu3SYg5el6qpJb2Txb
	 rtFIUzBhfXRiKnrIyxiAHbM4+82/Nhz/+6IqwIXHr0Vqm8nsJLWie2miVBu7hNOXmOh20
	 PzmZHH/MlPrDSSAcKdFss8oQWurg1l3loxVygJAlOxJ5io4pR3GYirFzQjnu39gzRvMdu
	 XUccCUjvUIh3qWE6+FrsSd1SjpZUsaYdB4hd5voZJBUBzOiCtHTckSY+qT8KJhZwVrUan
	 c75ZtaG8b46d3LscHBMToGRj6pbvs1R+IROQct43iA3r8hZgMfqxFlyhYfW+NDj1DMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548612;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1eTk+AxF8gR9yJeyBclpg52pC/Kq/TESGuxTnyoZwEU=;
	b=CWoJL1jD2Bgh1InR/Tq5iPPtoeDdFcmuSsIAMKYKXS+0/nzk4eQKOSlX57cbQ2zYbCwW
	 SOQoTn9DReQ9o0D7zJd4mTOpcadyUIm24xJTDr/zQsuOghlxjGmqAvdmhlce7R4Qc8rGb
	 bbwsrUfD6KnnEdZmQX5H0WhG8iuJK8XjxukJkTrdIDVO6jeey37zXIHBonmQvCX87+geV
	 aWWzV+2r9s7Ub2hOjgQwucvX9ZXk/PqjaqRVqkz5sFvdudodbQtOr/s3rbaOVkrofaw37
	 DdzzeUdBO4QfKZeDxbEqDQmZyudjTm02UdgYbeCkt3jq6xtgNcrlpZzUgJTQ/xWk+oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Mvz0UK1a;
	arc=none smtp.remote-ip=95.215.58.157
Received: from mta1.migadu.com (out-157.mta1.migadu.com [95.215.58.157])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153CD606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 153CD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Mvz0UK1a
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QtttvxebuzdFVNbe3iPgJUj4NsRr4oSQ0skIQRPGwXY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793548610; v=1; x=1794153410;
 b=Mvz0UK1a1KPoObA3FvPeVCgFte8qTnI5O9xt0M0r+4komGoJ4iF2GbiW5JGBzTonY9Zl2xr5
 oXI098AqyG7eU09XR7jOUX/RrRVsHE46EYQRviOg5yEgT32HBmO/JKzDr8d/nIatArC9VKiArBX
 d02iG5zTJxlakX6NzqTdqJtg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b30b6dceb92c4687;
	Sun, 01 Nov 2026 15:56:49 +0000
X-Mizu-Trace-ID: b30b6dceb92c4687
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Alan Maguire <alan.maguire@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 2/2] selftests/bpf: Add test for btf__raw_data() after btf__relocate()
Date: Sun,  1 Nov 2026 23:56:07 +0800
Message-ID: <20261101155615.324501-2-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101155615.324501-1-jiayuan.chen@linux.dev>
References: <20261101155615.324501-1-jiayuan.chen@linux.dev>
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

Populate the raw data cache, relocate split BTF to a base where the
referenced type has a different id, and check the serialized BTF
carries the new id.

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 .../selftests/bpf/prog_tests/btf_distill.c    | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/btf_distill.c b/tools/testing/selftests/bpf/prog_tests/btf_distill.c
index f0900b47fd48..7f62a747a0ae 100644
--- a/tools/testing/selftests/bpf/prog_tests/btf_distill.c
+++ b/tools/testing/selftests/bpf/prog_tests/btf_distill.c
@@ -601,6 +601,68 @@ static void test_distilled_endianness(void)
 	btf__free(base);
 }
 
+/*
+ * Raw data cached by btf__raw_data() before btf__relocate() must not be
+ * returned afterwards; serialized split BTF should carry relocated ids.
+ */
+static void test_distilled_relocate_raw_data(void)
+{
+	struct btf *btf1 = NULL, *btf2 = NULL, *btf3 = NULL, *btf4 = NULL;
+	const void *raw_data;
+	__u32 size;
+
+	btf1 = btf__new_empty();
+	if (!ASSERT_OK_PTR(btf1, "empty_main_btf"))
+		return;
+	btf__add_int(btf1, "int", 4, BTF_INT_SIGNED);	/* [1] int */
+	btf2 = btf__new_empty_split(btf1);
+	if (!ASSERT_OK_PTR(btf2, "empty_split_btf"))
+		goto cleanup;
+	btf__add_ptr(btf2, 1);				/* [2] ptr to int */
+	VALIDATE_RAW_BTF(
+		btf2,
+		"[1] INT 'int' size=4 bits_offset=0 nr_bits=32 encoding=SIGNED",
+		"[2] PTR '(anon)' type_id=1");
+
+	/* populate raw data cache before relocation */
+	raw_data = btf__raw_data(btf2, &size);
+	if (!ASSERT_OK_PTR(raw_data, "btf__raw_data #1"))
+		goto cleanup;
+
+	/* new base where int has a different type id */
+	btf3 = btf__new_empty();
+	if (!ASSERT_OK_PTR(btf3, "empty_new_base_btf"))
+		goto cleanup;
+	btf__add_int(btf3, "padding", 4, BTF_INT_SIGNED);	/* [1] padding */
+	btf__add_int(btf3, "int", 4, BTF_INT_SIGNED);		/* [2] int */
+
+	if (!ASSERT_EQ(btf__relocate(btf2, btf3), 0, "relocate_split"))
+		goto cleanup;
+	VALIDATE_RAW_BTF(
+		btf2,
+		"[1] INT 'padding' size=4 bits_offset=0 nr_bits=32 encoding=SIGNED",
+		"[2] INT 'int' size=4 bits_offset=0 nr_bits=32 encoding=SIGNED",
+		"[3] PTR '(anon)' type_id=2");
+
+	/* serialized split BTF must match relocated in-memory BTF */
+	raw_data = btf__raw_data(btf2, &size);
+	if (!ASSERT_OK_PTR(raw_data, "btf__raw_data #2"))
+		goto cleanup;
+	btf4 = btf__new_split(raw_data, size, btf3);
+	if (!ASSERT_OK_PTR(btf4, "btf__new_split"))
+		goto cleanup;
+	VALIDATE_RAW_BTF(
+		btf4,
+		"[1] INT 'padding' size=4 bits_offset=0 nr_bits=32 encoding=SIGNED",
+		"[2] INT 'int' size=4 bits_offset=0 nr_bits=32 encoding=SIGNED",
+		"[3] PTR '(anon)' type_id=2");
+cleanup:
+	btf__free(btf4);
+	btf__free(btf3);
+	btf__free(btf2);
+	btf__free(btf1);
+}
+
 /* If a needed composite type, which is the member of composite type
  * in the split BTF, has a different size in the base BTF we wish to
  * relocate with, btf__relocate() should error out.
@@ -793,6 +855,8 @@ void test_btf_distill(void)
 		test_distilled_base_vmlinux();
 	if (test__start_subtest("distilled_endianness"))
 		test_distilled_endianness();
+	if (test__start_subtest("distilled_relocate_raw_data"))
+		test_distilled_relocate_raw_data();
 	if (test__start_subtest("distilled_loc"))
 		test_distilled_loc();
 }
-- 
2.43.0

