Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B98B67E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756708; cv=none; b=gcNwneLFQm6u/mWckK7VNt3V+uoVGEJzP73nH5Sk/a5HVys3bHuvcsW3t21fBhD2RiAECeGxnhqA58+w3Sp2wvNDkQ80zJ5ED0M3oqUH/8p6+E6Zuvgq76faCLLSLhq0I1L3oMC1gOALJrNVBZlVDg/RFQrtRlY/j+glUlXL6Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756708; c=relaxed/simple;
	bh=GYLGPTz7B4DR+c4lAIA8hn1QEzqtbEK6fanc+u3joVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=niVBLRPkYkDRWmxRxDyDlUvR7cAh5/D9CB2OFKjld7gZa+3UBXHoew6dMPdocbBftirxni+Q/TtPVsasWLILP4guk2auxvCQd5NgmfcxBvNGhykdvi2GyPzH4VbBZnw/H/jW3CBaKWMtJL245CD9WAGckvBCX1nThJny8Aks9xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnRN3Zzx; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnRN3Zzx"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc149372c14so1435998a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756706; x=1789361506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSkZ75+revt0e4KyfnrpcrTujkH4yPeuqSBvDGGLspk=;
        b=fnRN3Zzx+m/zlZ8cev3X69P2unCU/hKmk9KjTIB3yjMi8U152ulGdkf7hT/RomEYNI
         XuYqllVVPpP67DyqhwAO5tpBTEatOmP/7k5ybHQErlPeSHslie07gjN+XwRst7xjKrtt
         8YFQNXz4EqT0gN7d289pFJ0/TyownBzAv1nJKSsshKAVbPUSed1KJsb/dgFRzqDaSPPL
         OSWkArHfoZK/XeqQnBvR4j8olsKFu9t528W0R/d0+ahTHcfwTqkNVWjamdJ7cMmkLpVz
         q9R4iQ5uYJoAyPcXs58eKuia1X4/81NoH1Kg9HTUOXRa7j21BfB6Phi9wJ1dfFatS0Kp
         N2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756706; x=1789361506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSkZ75+revt0e4KyfnrpcrTujkH4yPeuqSBvDGGLspk=;
        b=b79BnE3IUP5bSqRqx8BFPMR6YFXiYZyTF92Pxpn97k+PfTRm+Tb17bUBexDC1sPFxH
         zJVLdNBKsAZD9zln8UXUcJ4ntP2zC0Y8ikVATu1+4eTm960ehlr/yoEtxOn6orvM810a
         dtCu8GmBUK5EmeB6iEx4XRRyF13mCfC2mqt9zESQrAVThKO48deTHLlMAx4+7xmxwG40
         hSavJaoKYFNYVxcY0rbx42sdFcHHoMG1BHnFmcJwV/rx0I8ty8E+RUKA7WFXEbUCdW9i
         BVQBF7eGN3i51FjQ23Znr/fMNidYCbdBouNgOjxrlKzf/8n0AuQeYRycA4xwSxYUjh4V
         /9hQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgnPLArDYmaxy/IWNyEux++YmHZKfpubh9GfOrseirkofBhEsXgk8kkuCd9+JBlZJ28k8o7IRVOFhvqhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mbLM5fQg0xyuW5/kCU0h/sGUPrjYc2x3Zfty2Z8kvDkx/3p8QX
	QUPUiSrvGziCpnlvPO4ofKb/OYeGQxIUZsWu0KpwbwtkwMp4pug/IOCg
X-Gm-Gg: AYBFou3g63LnnHwelXWHs/EuxomehLPIkqpbcNzCJlYc+AKTFACi7njWU4lwWF0OWxC
	YUcg1KEeGQPe0RV6t5z6J2YJP7YNiucY5B1viB4rHHkGM9qmbAa0WmHQGaDTw2UPIGjUC0BNpBZ
	FhQgpgzvk+/l2xLWKENQEQPQItH5NBuCCIksWJTJRIW7aKBj73HmTk8NtLEWXgJxX+zptNgvSYN
	FI0Nbb4GNkO+Nb8px4hoqKbc400OJbN4W8mfqoRKpwsjM1moC1RxPg2itwvgafmTNEGlBhsr2qp
	nF05/LbhqNvLhF4BK9e+c8U+EwZK1yi3GeuN5O8c2JEh5ItBOMQladgR6JmO2umHH6qAfseTZJG
	VuPnV4FT/wbaUzu+dWtIFXInB1f3xJFI1mGqDZmvgZWpEc2ev/ADdBfzAPl58FhLJ6XEFJoJL2d
	avU3TlUqMVCIKvdHk0reYvES3Zh7mJM+urueCxpCWlwtwKcEaCbYKQBLeG3T+I6EdJclH6g27xR
	DXCHPTq9RFyMQ==
X-Received: by 2002:a17:90b:1643:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39b26272f04mr30192034a91.14.1788756706071;
        Sun, 06 Sep 2026 21:51:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm21979675c88.14.2026.09.06.21.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:51:45 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
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
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 0/7] bpf: fix typos and repeated words in comments
Date: Mon,  7 Sep 2026 10:21:28 +0530
Message-ID: <20260907045135.13317-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the spelling fixes for this tree.

Changes since v1:
Subject prefixes corrected: 'selftests: bpf:' becomes 'selftests/bpf:'
and the tools/lib patch becomes 'libbpf:', as the CI bot suggested.

Only comments change; no code is touched.

 arch/arm/net/bpf_jit_32.c                                    | 2 +-
 arch/powerpc/net/bpf_jit_comp32.c                            | 2 +-
 arch/powerpc/net/bpf_jit_comp64.c                            | 4 ++--
 arch/sparc/net/bpf_jit_asm_32.S                              | 2 +-
 include/linux/filter.h                                       | 4 ++--
 kernel/bpf/reuseport_array.c                                 | 2 +-
 kernel/bpf/stream.c                                          | 2 +-
 tools/lib/bpf/btf.c                                          | 4 ++--
 tools/lib/bpf/usdt.c                                         | 2 +-
 tools/testing/selftests/bpf/libarena/src/asan.bpf.c          | 2 +-
 tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c       | 2 +-
 tools/testing/selftests/bpf/prog_tests/task_local_data.h     | 2 +-
 tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c | 2 +-
 tools/testing/selftests/bpf/progs/iters.c                    | 2 +-
 tools/testing/selftests/bpf/progs/verifier_var_off.c         | 2 +-
 15 files changed, 18 insertions(+), 18 deletions(-)

