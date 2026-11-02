Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623054;
	b=l0zqCCOPnQRK+J8uUJN5ApgECJcf8DFUmfvuCVT1lMYkXhTP2T0xys7w4DdrDgIql8VV
	 HZCQvDfrh5U+HHhRLpPbMnZnFBhbeZb3hfHpeqT3sR0eeWy3shMWVx0NN+9uMM65o4tCa
	 DfnCYwfLvISsB0bJjgKdicnYXRWR3UUAnaMJABe5tSqRrfY8GZ8MDJNXNGY5OaXaMCz0t
	 tHFvugfENCyGGnmS0zNG3TyxYym1uM+zDWk3bQtcq4AnlVYT4vVlp8edy+tNABt//hwnS
	 SJgrxgNZaCncNdfilkAd57IccuNMQEyYHFU/lS0yPCQvG/a0GEP+WxTjma4W2lhJIRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UJnsc6rPzhRrohHVm6N1G/brkkNL5aN56fn34HSgfWU=;
	b=hQ4NJGweSiefJNV9Mw21aE4w0Z1Zv5n8Ra/eX7yEuLA8c7cxclIUZPZM9eYe24MojkII
	 Z2UZW+buqA285ggL2ajsKY3UkegslaqKDeIaFO6aM9jxhMRR2uyyRlQS44HTuonzkea2E
	 7AtTfYqfwmeI4dBpOYSYDGRKi/n6Q3DF6++Rq51uBrM/DAWffZHX+n3XeZ2ET6NA3IIaS
	 JPKdciTraoer1tEDVw0FC7mGUBHh6X6qwwG+B/6Nde9MbVUdWBo138nzE/jWJhRlFtSBU
	 fPg6Q+w3HErmIiDOWKvIt57sAZ9ScXjY0nMUYZ5E4AyjFU+/M71yGGnBMzKAGGWUURA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I+iB/xDh";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B9060A2608
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B9060A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+iB/xDh
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-353804b591eso5202834eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623054; x=1794227854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJnsc6rPzhRrohHVm6N1G/brkkNL5aN56fn34HSgfWU=;
        b=I+iB/xDhOLEUFnfAxghqnoWsj2cnfBUPzJ4P/6rflkIGlsnJiibyRWCx5skLYgX2ai
         0tCVXdwrHAVqMmbqTSs1YMv2aLQIBmPIzxAGvnlftxsTGBo6SXHDI+PZ3PgKW96D6YgX
         Q/ZpsHH0SXYQd7gODeYqLgPcRH03uO/DA3G+ew7XpMshOGjQohxzjbBuQj6lUTyx/qYf
         eSKUJ/Mh9VIxzIZb0SliQzlYzB1DhM9M1D/qLSHlCDc0nzc9vDgLc/EvpvDzxXKcSx01
         I39ZhHIQQZISagWDZhnAPMAQ5FLTiSVIhuM6mbO+I+eZJK12ThlMlVyy6KQPKL/9cHU0
         Q6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623054; x=1794227854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJnsc6rPzhRrohHVm6N1G/brkkNL5aN56fn34HSgfWU=;
        b=A7pJpTZ0rL71EpB1E9/RH5/lQFRZD9JxE/qwegc2h5Iy5PASyZtk0aLTJI5UJ1bS7c
         IOVgpfgr+VDBmC78xVBPWIPyrw3fNQKATAohDlTl756hjDETOWJTNATuSKhXi9BfTYVo
         ulkbA+GyL4ZvPGL32PuX60zGr3jNtlD9GuHeF39smHAfIcE5U54PbvWUE62DLy1P2AB/
         Gyu3WkZ0xkiLrIlf2jFwHDgXYcipyAZ9It3hKrsvGF1Qoqsd5rMR2c42CQUQha631MAn
         jLhaurPYiEeb4Y06sUEsGoi8WePq5uMulwDXTl1oJOkcPgHD4zVBGQ7sd3B5qVwYEDii
         a8Sw==
X-Forwarded-Encrypted: i=1; AKwUvBw0TR8hfDS/nZtP3MzUhMQn5FP88LkphvNBEXAAYeVEGUeRUYQUQwW/i1H8X13JhF0EeijU8SszBrT0qE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GnrGeLhGBg6gmUkIqdmzSc5Kdfyc2I8z/4b1s/6HETkqjhGmC
	QGrolxyKgHVuhOe/v8lBXA2cYkC52LMr7FHqlPhPKInvSSQEQw2UIPWp/9l+2Dn9z4E=
X-Gm-Gg: AYBFou0lO19f3XnSIfvMENcWncS2Khf0fhc/86WmrlrdZyIRZCCaqWQVgVia2viystA
	TlQzXc6gxMxnbUsBeiXIXXuOqn4DmLv2JJ+qOSqebH8yQkbEfr41k8glh669vxya1vxvT9dKHg5
	c5EPLpWyTo26uwXq6cncbdPgpPjdEjExoEcRRdakk61w7TvqI7XKiNNuvkB4iTNrCCXrIS80A05
	bFMNLE4W6MmBh1yEBt+lxr3+FGRI6SMfdYGcBl+hqbQcgRNs8uNlU0+6hVYWmCOZAFlfTkKdDgo
	C2W9u09wbJeWuuuedWpTVQfPPVCTSniVAuABHahcvMZ37ifdcEufSEhtb+Npw4eUqiW1fxf5tfS
	nStTftEGqsRnMoRQ7XakJQbfRi3ZSLHA5OJymN3iST1XVgW2ZUmUODXxmTOT4wNa3LFKb9Jey7u
	nZB+jZxp9va1UDDHo3OR87E6T5CgzvWDre5tsE/dn85crQxFEvn7c2foypFpwfnAuN8Z2hogQhT
	yrOYP5H7qaS8hqIquyvvLUrQmAtEB1EdmLepaGhwmwXYI/Y0ANpVRGMvWE24yvfw8tyeekexSV7
	4Bgj/ZdFpvzW09t+hlMG9nf/
X-Received: by 2002:a05:693c:83dc:10b0:365:d42a:f415 with SMTP id 5a478bee46e88-36a423454b2mr17231783eec.12.1793623053582;
        Mon, 02 Nov 2026 04:37:33 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm36326095eec.6.2026.11.02.04.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:37:33 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 02 Nov 2026 07:37:05 -0500
Subject: [PATCH bpf-next 5/5] selftests/bpf: Test log_true_size with an
 error from blinding
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-bpf-blind-nops-fixes-v1-5-844300e42cdb@gmail.com>
References: <20261102-bpf-blind-nops-fixes-v1-0-844300e42cdb@gmail.com>
In-Reply-To: <20261102-bpf-blind-nops-fixes-v1-0-844300e42cdb@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Luis Gerhorst <luis.gerhorst@fau.de>, 
 Henriette Herzog <henriette.herzog@rub.de>, 
 Anton Protopopov <a.s.protopopov@gmail.com>, 
 Xu Kuohai <xukuohai@huawei.com>, Hengqi Chen <hengqi.chen@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

A prog of one function gets its constants blinded when its runtime is
selected, which can log an error.

No test checks that log_true_size counts such an error.

Load a prog whose jump goes over 11000 constants with bpf_jit_harden=2.
Blinding pushes the jump out of its 16-bit range, and the message must
be in the log and in log_true_size.

Reported-by: Alexei Starovoitov <ast@kernel.org>
Closes: https://lore.kernel.org/bpf/DMKHZS5B5CNO.186F6YH1T6YU4@gmail.com/
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 .../selftests/bpf/prog_tests/blinding_log.c        | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/blinding_log.c b/tools/testing/selftests/bpf/prog_tests/blinding_log.c
new file mode 100644
index 0000000000000..658a8494dae5b
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/blinding_log.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+/* The verifier log of a prog whose constants are blinded */
+
+#include <test_progs.h>
+#include <linux/filter.h>
+#include "sysctl_helpers.h"
+
+#define NR_CONSTS 11000
+#define LOG_SIZE 65536
+
+/*
+ * A prog of one function gets its constants blinded when its runtime is
+ * selected. Each 'r0 += 1' becomes 3 insns, which pushes the jump over them
+ * out of its 16-bit range. Serial, because it sets bpf_jit_harden.
+ */
+void serial_test_blinding_log(void)
+{
+	const char *harden = "/proc/sys/net/core/bpf_jit_harden";
+	LIBBPF_OPTS(bpf_prog_load_opts, opts);
+	struct bpf_insn *insns;
+	char old[16] = {}, *log;
+	int i, cnt = 0, fd;
+
+	if (!is_jit_enabled()) {
+		printf("%s:SKIP:JIT is disabled\n", __func__);
+		test__skip();
+		return;
+	}
+
+	insns = calloc(NR_CONSTS + 3, sizeof(*insns));
+	log = calloc(1, LOG_SIZE);
+	if (!ASSERT_OK_PTR(insns, "insns") || !ASSERT_OK_PTR(log, "log"))
+		goto out;
+
+	insns[cnt++] = BPF_EMIT_CALL(BPF_FUNC_get_prandom_u32);
+	insns[cnt++] = BPF_JMP_IMM(BPF_JEQ, BPF_REG_0, 0, NR_CONSTS);
+	for (i = 0; i < NR_CONSTS; i++)
+		insns[cnt++] = BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, 1);
+	insns[cnt++] = BPF_EXIT_INSN();
+
+	opts.log_buf = log;
+	opts.log_size = LOG_SIZE;
+	/* log stats only: level 1 logs each insn, which wraps the buffer */
+	opts.log_level = 4;
+	if (sysctl_set_or_fail(harden, old, "2"))
+		goto out;
+	fd = bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, NULL, "GPL", insns, cnt, &opts);
+	sysctl_set_or_fail(harden, NULL, old);
+	/* don't mind whether the interpreter takes the prog or the load fails */
+	if (fd >= 0)
+		close(fd);
+
+	/* expect the message about the jump in the log and in log_true_size */
+	ASSERT_HAS_SUBSTR(log, "cannot be patched due to 16-bit range", "log");
+	ASSERT_EQ(opts.log_true_size, strlen(log) + 1, "log_true_size");
+out:
+	free(insns);
+	free(log);
+}

-- 
2.43.0

