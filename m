Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2866377ABC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846606; cv=none; b=euMAGHU4qCqh99mB39YcCl3VRCSxQ3Z9L1+J5pdXssMvIbRF77E7ERfetdyY5D1bcf6xhdcoTqakapnEQVVqCM13If9qnXAIeZCYZMFBcYKnU1DY3s5aPToAFRFATWRBsxyqj45K/yG8LD12XOkiBbV1RwildgcO3Fzswh+fCSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846606; c=relaxed/simple;
	bh=kuRqLYU/bVAolAtuT0lNsNPBb3H44v+1z9+WGNYvrCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sVq1rszQfeKmPbPaM7NXCH3DkdxEjuFrNMfJ/zcKIbOJe6nUyDL/nMK2iXFoIwySYHs/tzJCrhPsuGgX7a8/UuyrN9e7Yj32uAtTioRQxrOLbVMBHOQ60ZlM+scgCo/XUf5T3l030wAKpiW9pJvnNre5UQhMshDxzglMPL3Rh74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwXXfTsY; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwXXfTsY"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so4235896a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846604; x=1789451404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSdhcylG8upaYgz/wmJd+JoSvai0ylGkPowyAHHfN0o=;
        b=XwXXfTsYF9cY8pkPapoKPfNcuODFHqV39MRPPaVSTVQ7sUfNQAzjiBC1pRVbrdsBbJ
         LUgj3Ryp9o/LvD1CQXZQfaz2zXpEgD/QlfEC0tat+2D+QTKwfG8//8Ch2zgXYbKfndYA
         Nmiq/pICe1U6XESPT4L8IXwFuWML+RCA/AINdeZ6+adJcUCVLvDKu3lusM6F8U/2392A
         QsRlMc0aPzKBsP9wWcjTUIH1tBrwdqXSVjKCVsB1GW5enT0YBlWzG+SWwsMhnf5VDuqQ
         vsUhak5j8tFnxVzKI1pIoutlfrDMEhCs8JE2iTZc+rbp1uZoNC00GF0r58DwVgf3dHvI
         NkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846604; x=1789451404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iSdhcylG8upaYgz/wmJd+JoSvai0ylGkPowyAHHfN0o=;
        b=n+U1mSEJ2o6/r9sjT/mupOj/57ViWgq96S13+WAO7swChVJJjvFzYhvwdHTZXpdTGc
         kdVAFFES9TIRIH/DFHol+ve6oU/6xs9ERH8XpcoXDTTTm8FLC7FDdkd3SpGykGzCKSRK
         WmxfGnbdmQ8IukuybuLCQQH8XJggMn88FbgfFP/ghurCCnhYgOzRIVLlgfMk2IVpyFF7
         HIdud8xkBQL3STAmBAtFjU/HL7VXqUFoudjC2ndBBr9HsKTHResNKegoZmckrBy/9fdN
         +tp4rgiL6UmA0hd0fMTazF2XH/tL1w0YDTLGnNuSt7DIvmMj8/Rv3Y7clYrgjUhNqdR3
         6wFA==
X-Forwarded-Encrypted: i=1; AKwUvBxj6fMU8Am1tfp3dHJgiNz7SU7h4O0v4eL5BWuq8++PC/XwPcH5Wds7yidj1n6TDxjMbpZ3oDEM7iuZCxY=@vger.kernel.org
X-Gm-Message-State: AFuF++nyRTtOyLWj4RAWjlgvznVgDzrGwLMfHTmGt9mSrEwgpJyt8Kul
	oAAidCBMALc8m0pLBJjNgyxJIVo3SaR/ffDNtZzjHa7AmHkB29Kf28wk
X-Gm-Gg: AYBFou3Al8NnYMEwTxal3LOQ9+p5JHkQRQdv7TGVNlc/xHkjk7n9t59hI63K6mHzzjh
	CDpI48m8P23NqkyqLq9aX99qbQoBxuhECVxxGMprt2j8sHdSdjaEUu9iL5OyzGXFPpbRl52HtE9
	Mpp2OL9uB6r8NwQoFWouH8RroHjIUx7vCDt5gWbfCZRh8z+GlKvWW9obTnBlVrO7v4w2T0J91i7
	uqdDv4MCdGsqf2gkW/7VQjfdhSO65AUmywgq/3nCzauarUdktPEMzMNQGcBTBNlC2z8LQIt+oMH
	xoXm3vs/hRay0FYRnnCKnEAROCqGpdNrF1hk2OLdKh4utD8EH1n4kDJ7jMts9E0TbtMbLtmv4Lr
	AnOLVJn8AdBnoner8EGbNT9DyJ5RtdoCBnJHyjiesVZunMox1+1LTSFdjBv9/RyJP7Chm8zOMiY
	A8AoKX9RB3Pp2k8rF+2nTm2amGhtxrgugrtUvKeZ6motkxv2SayI/PLHjPzGJPAqhWpi/VJ+WYk
	7eMFuqc93LrIcWpHx3uhF52
X-Received: by 2002:a05:6a21:7989:b0:3da:421e:40f3 with SMTP id adf61e73a8af0-3da421e4978mr36173588637.17.1788846604363;
        Mon, 07 Sep 2026 22:50:04 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-334fbd5e6f6sm25690109eec.23.2026.09.07.22.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:50:04 -0700 (PDT)
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
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH bpf-next v4 7/7] selftests/bpf: fix repeated words in comments
Date: Tue,  8 Sep 2026 11:18:53 +0530
Message-ID: <20260908054853.13820-8-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908054853.13820-1-hemanth.selam@gmail.com>
References: <20260908054853.13820-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop repeated words in comments, reported by scripts/checkpatch.pl.  Only
touches comments, no code changes.

The subject prefix changed since v1, from "selftests: bpf:" to
"selftests/bpf:", to match the rest of the history in this directory.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/bpf/libarena/src/asan.bpf.c | 2 +-
 tools/testing/selftests/bpf/progs/iters.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/libarena/src/asan.bpf.c b/tools/testing/selftests/bpf/libarena/src/asan.bpf.c
index de656b69d13a..fb50ee4ad097 100644
--- a/tools/testing/selftests/bpf/libarena/src/asan.bpf.c
+++ b/tools/testing/selftests/bpf/libarena/src/asan.bpf.c
@@ -204,7 +204,7 @@ static __always_inline bool check_asan_args(s8 __arena *addr, size_t size,
 		goto confirmed_valid;
 
 	/*
-	 * Wraparound is possible for values close to the the edge of the
+	 * Wraparound is possible for values close to the edge of the
 	 * 4GiB boundary of the arena (last valid address is 1UL << 32 - 1).
 	 *
 	 *
diff --git a/tools/testing/selftests/bpf/progs/iters.c b/tools/testing/selftests/bpf/progs/iters.c
index c6699159dacd..e44a979270ea 100644
--- a/tools/testing/selftests/bpf/progs/iters.c
+++ b/tools/testing/selftests/bpf/progs/iters.c
@@ -1511,7 +1511,7 @@ __naked int checkpoint_states_deletion(void)
 	 * would get equal to one of the explored states and thus loop
 	 * exploration would be finished (at-least for a specific path).
 	 * Verifier evicts explored states with high miss to hit ratio
-	 * to to avoid comparing current state with too many explored
+	 * to avoid comparing current state with too many explored
 	 * states per instruction.
 	 * This test is designed to "stress test" eviction policy defined using formula:
 	 *
-- 
2.48.1

