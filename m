Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623049;
	b=nmSbdVj3iI6BEby9/6GdBf0Lq0CRKXsO8J0YlwxwsBmOyWL6zlVXaBMUye/7wvsrApDh
	 QkNjUvvPZzR7ZxI5UQmQ2uY3bGf/KhbSGhHlQ9hspGA6gT/wqyUqdkOV4lNy+RrdXX9jd
	 E0J5PbzGyEbqLZxruGPOBFZezYlCZdRkFOOF+y4gF15RR8h+L+UcEUSaS8GrlnVYLTGae
	 Vlwx0U0VCfF66aNENrqlu90v39UZWbt/tI0bo3VIF+8yKHniRvbFnXfoPttxSbKaqiQVp
	 fuHXiNhJTYYpX5Z/gurt3kfyr+8SBFDiXjvx/wwwyeSVAvyNk4UBhVBNRC1kzbVgr5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/vslpHUHQt4zv0LMPIebRm/wLQOZFs5cvdXDbCFaR+E=;
	b=GV4KxvhBDE6ggauF5GMXRsGijiJgCI1SdOuOyBi7cnsJ1bV6/JKTUslEEX7bIXgPYAmX
	 aRnEZSxNclA1Dq1gOqC2laGmImcweaXRrdnPbUUmDbwWuhpkDsP8NaMf56vKeIdnCpmf+
	 9zhZxgVEDlQUxU74wq8PdwOe56SM5xK+QqS44mViejfvQctfjK3TBIk++KYRR+awEjYdg
	 ZuWEYEyCbhMsLUjLv0p1/ZMxE5E5esKCiYDlEF664j7V4zBRSrA3akD7JkfTnRpP9HY2Z
	 piaDuFTtTHc9YpqUlBLTxgdUOQ7IjZRR5otBLyDJBc1tckLZwgWTdaT93UmHtFiQPYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=btSZZLME;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BFF606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94BFF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=btSZZLME
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a315ed211so3598429eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623049; x=1794227849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vslpHUHQt4zv0LMPIebRm/wLQOZFs5cvdXDbCFaR+E=;
        b=btSZZLME4NXKTBXQYwPzJB4oGl+56WB0aw+k0g8i/7pgJNTpaYVm3SoJKV4jwKkoDm
         9Pn7LlFO7+TmcfOKxY5Ww6qhXB/tpCS2xpmuJk9rjGn4ebRZhynfPjh069AG0ANRS5P9
         PT54Z9cYPMEBD/C6Ay41YorqxfnKcDt0v1J9+amowN/k/Ibd5IW+MS36fTnR1hOMLIIv
         llob5TH6glydf/uFszEhkP4dTL0E9cwz+QLpYoKbFmXBN2/Gk293EYrjMwy7EEWDbEU3
         vYOMCrmLkkHiLDqtw0x3OYAELTE6JeD7Q7bsBBdErWkbiP1RC6TxTuLr7+IhCzVtDJs5
         Jk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623049; x=1794227849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vslpHUHQt4zv0LMPIebRm/wLQOZFs5cvdXDbCFaR+E=;
        b=qDZlzJT4WAFJnX5BP2xIie07QkO25PJg/QZ6Y4ubu0+Lp8/VMVU/5uVALQQpXrCa3x
         vIOuJw9iPFywTD2A/NIyjhPC9KncSO4RUbwh/7+uH9uZABmB0y+bFcSIGwxZoAiKj+s7
         9tHZiwFzxyhrcAjx0eiqQkC8MkdMty3wvR5nDrsX9yv+APTyUasGOWnJYuAGwmhM76ru
         A2AYFpegnP7Q95yoghQ9LIypwYfc7QmGu4YxYUy2QRHzFr/VNt/CuKO9Mzy1TFQs7uu7
         gMAbYzYnkBplGhoYf8aCiUfbsRILfKSomZNDxx3NKW/FSagq+AaIENIEroJbMq/Fx1xp
         IsZw==
X-Forwarded-Encrypted: i=1; AKwUvBzk1ct4GQAO5BCfBRDJtvCSQO5mYqVNCUeVWE34p5fsID4GYvIeZgBtyp0go4X82K6OBZY/SYhmhRmqWno=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbJAwvUNPuDOAz3whn8zkrlvLwTKEePIKMwIIRjTYVSECLx8Qh
	qTA2MizzBmoTPAJf2PC7BXr3Ijk4soGJIPgYRjvJYGaLuEoTIqxNzQQh
X-Gm-Gg: AYBFou3/w/f4a0LbueKpR7ClHzqgZTu4G87hs1m9MjTSk1llPb6BOAFlEqlsp/odonW
	fWmq4eUBiFXa4ykhJpuMqDzIOxTz9UKKxytNkxpEoRFpE0LSJZNiUjdqlrqaGxR4RdR2p0Z989K
	x8LqodRvKgZJ+rdCgt6kZ7aSPJzZAJHIYMa/LszhzRK3cVNz9r5kPnQ13QMTWZ15OJyKBroiPt4
	KpDhH16JXXgqmMkJ2stAelth4e89HtNJZhMqUQtZqKQ1we+OsVky+gEovPfkIRyHJm8eNJQWxn+
	nlCD20Voe3EIc4PHldLZN3Yf29pgNXyy3mL02G35BsltL8P3dI17/2+bGe3xKUDRDo1BP0ZFOJO
	b3W6wgJwvwoTdWvs/UqKcAzJ83w096TokEqWRdt9oyUKCEfFMu0Ys+hFHpJzCiBuNvSY0CKdRCt
	CxU+/wllnH3gY0HO3YDEza/7gnCNF3nHRApen4Dh+vm6MhUYHToqZwiFK0uBaDYsCDHASgzY/7s
	ENfaZ1i6c1ysOHTwp/+7dEXPu4kzchhn3RsOqp/AlxbSyVZ56QLnQLIBXPqh8amXbMe2eYYhWqx
	69NmQARg/Nbq9M3tN7NRYDdIv7NmQPg/IqFGXrxYmHl96Q==
X-Received: by 2002:a05:693c:4088:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-36a30009ecemr21223699eec.6.1793623048591;
        Mon, 02 Nov 2026 04:37:28 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm36326095eec.6.2026.11.02.04.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:37:28 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 02 Nov 2026 07:37:04 -0500
Subject: [PATCH bpf-next 4/5] selftests/bpf: Cover a nospec jump that
 becomes a nop
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
Message-Id: <20261102-bpf-blind-nops-fixes-v1-4-844300e42cdb@gmail.com>
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

A conditional jump that is unsafe on a mispredicted path gets a barrier,
even when it later becomes a 'goto' over dead code only.

No test has such a jump, so nothing checks that bpf_opt_remove_nops()
keeps it with its barrier.

Compare a pointer on the mispredicted path at a jump that always goes
over dead code, and check that the barrier and the jump stay for a prog
loaded without CAP_PERFMON.

Reported-by: Alexei Starovoitov <ast@kernel.org>
Closes: https://lore.kernel.org/bpf/DMKHZS5B5CNO.186F6YH1T6YU4@gmail.com/
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 .../testing/selftests/bpf/progs/verifier_unpriv.c  | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_unpriv.c b/tools/testing/selftests/bpf/progs/verifier_unpriv.c
index a54b5a58b945b..b9d96366e656d 100644
--- a/tools/testing/selftests/bpf/progs/verifier_unpriv.c
+++ b/tools/testing/selftests/bpf/progs/verifier_unpriv.c
@@ -1072,4 +1072,39 @@ __naked void nospec_backward_call(void)
 "	::: __clobber_all);
 }
 
+/*
+ * Compare a pointer at l0 on the mispredicted path, so that the jump gets a
+ * barrier. On the real path r1 is 0, and the jump only goes over dead code and
+ * becomes a nop. Keep it with its barrier.
+ */
+SEC("socket")
+__description("unpriv: nospec on a jump that becomes a nop")
+__success __success_unpriv
+__caps_unpriv(CAP_BPF)
+__retval(0)
+#ifdef SPEC_V1
+__xlated_unpriv("r1 = 0")
+__xlated_unpriv("nospec")
+__xlated_unpriv("goto pc+0")
+__xlated_unpriv("r0 = 0")
+__xlated_unpriv("exit")
+#endif
+__naked void nospec_jump_becomes_nop(void)
+{
+	asm volatile ("					\
+	call %[bpf_get_prandom_u32];			\
+	r0 &= 0xff;					\
+	r1 = 0;						\
+	if r0 < 0x100 goto l0_%=;			\
+	/* executed only speculatively */		\
+	r1 = r10;					\
+l0_%=:	if r1 == 0 goto l1_%=;				\
+	r0 = 1;						\
+l1_%=:	r0 = 0;						\
+	exit;						\
+"	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
 char _license[] SEC("license") = "GPL";

-- 
2.43.0

