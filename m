Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A26A37DEAB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756767; cv=none; b=ZJSnkDCmsu92bPJePcvZhVRN8NA+RVHnH6O6v5zxHjvWdzlqU+937uXke6KXEM7PDR2AH+CkIYrRximIGVNc3Pq1xwbHVE4jvDzDSQzlgQGQcf7jtX9/yMa9qURpxoWf1thRXQDnSezXKBkhKrMIK1AOtB7ln68ZrN3sVysJzfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756767; c=relaxed/simple;
	bh=IflaxgY21z66DMaOOZlOWT+BhylVWMmRJyvAy9IC2jA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QSYXMstF0RMGv9N5YPVTrs6SN7QFXU5E2uUIu0D9z/zhenj1sAqaiFEWqGoKrPuMEddCCHFdJdzikGNjh3jsbHHF7/MhoajtCSTuMBLi5hnAi7PRnfEQAiSgWS6I9MAllGbNYla/ljeqzVfllwMEoSEAFhRrqiGII5/2jkJKusk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abHd90rA; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abHd90rA"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-39675172593so2451699a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756766; x=1789361566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKUvGXFfM1WSd/D5lDioUe9VV0OdsRUwt1UqjYJjYJI=;
        b=abHd90rAF3IlWFVEB7jrLxGffw01oAOFvKp5hc6KNHh4FgBxwdwLXsNDID0lKxi2+E
         bx1wDeu3DP0raHfsq+yA5Vg8+Ku2oHG2TDcTDk3BddTgR4eD9zgZ5t4R+kaWGQU8wIlk
         F4bgIc/U1Yb3bhbg3IzXkrLzFWvavX+MrvZewKs6KzV/w+XyDivxwPv1aqxlVk4aI+Cp
         YzkzXMwcMavR0QsFH50j4xJatGAIVJiijuFtsmbMr0sdB9MtknZ0uwm7onYcu7AqsfQg
         O/s3bNwYwtP+MmkF++GOcqpafdi5IN17CejEuLGp0GqDyJUDcPJxfz6IQWCFeCnVE3Eq
         ZXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756766; x=1789361566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKUvGXFfM1WSd/D5lDioUe9VV0OdsRUwt1UqjYJjYJI=;
        b=XpKtwUnqyvbAq3tuQJkCOCzW3aqAM51WUHdL5khN8vQhhT0+DlywrS7uqCEeQHGcaI
         IxZr5LJsThkFkTfrifQ4J5moRNb2S8d/sDapxIl5OajllDSEB4S5y8DxP5QBj4WBj7mO
         EtsBQSD7KNI7//wOFrXdxDvAaaMgTKvL9JgmfBl9h4QZgpfEuwXYOngLCSlflcSk4yvW
         tenh+uPoPdkN0sLDfFBFXS06yHLwr71Afqom6l8+Azh/tUvml/3UKCTk4utrMhgo0Cb9
         k8sq7m6QthdbPruZOkGcvWKVgPXoCCFii4PqyUgDQoAUavCE8NPyWNM4MqUFhtt8jQ09
         3lZg==
X-Forwarded-Encrypted: i=1; AKwUvBz6Jc9SGOMrjIbTvsblbJGu8aB5O0yUyVxt6/0XK14naMBy39s7MiE8d8a70c4wQVtj4jYKm2CtpASfSMw=@vger.kernel.org
X-Gm-Message-State: AFuF++kUmM1cCw8sFke5lCN9GMNKwSqD1u0MiY7gYQiMtej7cJU7+G+W
	tdNb/2YN4sjiN1VAcdc8t98m1QmvGeCahcYChT55oAggudeYRWc4MePS
X-Gm-Gg: AYBFou3ume4v+bhrqDM0K38UCQ5b/DeHDHauI1Z8yAe8xdjYuHUU3awJaZ4ZE4fzSfQ
	U6E0qVexhf2U+H+WX5n5LSXnFO/sDDr+8QeEcR0nGfTIVaTFgGJkX+OX1tZlSOjVMCKmhtrxBV6
	1pRPQRoux5zcUBy6rPFJJ8SHW3UB8xcHVkXpwG0UhYZAPWC+ioieoPzFG67H0RSP8cclkJncQac
	af3eNXFQxj+2h0iwTjr1ToifMg/09R+zRmBP+m8XGZxma3yE6rxeIhTR0R8026zJCDJmjDFZHDP
	1ZqeV5FTTGeYbm8JIQOI9Vsr/IBxvgLuyoGVKxCEfnb2CwQOZhVJvYjUA2t8TrtGsu7aZ93mET3
	eAwfh4U2RmUQdLMKSB5N8V0mXE9M8JUFGkPK8yF3jOQIAUezLhGpGI66PJRga7G3N9RLL6U16Me
	KGtPvnbJNEgrlZE3vJqKy8mQK74hCxW58p3I54m3hBDAetYs+FXidUiJdzzSVx1eTN7yOi6E7Sy
	IJH2WAswKHI5A==
X-Received: by 2002:a17:90a:1c81:b0:39b:2c00:c3f5 with SMTP id 98e67ed59e1d1-39b2c00ed40mr18971030a91.18.1788756765648;
        Sun, 06 Sep 2026 21:52:45 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm21979675c88.14.2026.09.06.21.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:52:45 -0700 (PDT)
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
Subject: [PATCH v2 7/7] selftests/bpf: fix repeated words in comments
Date: Mon,  7 Sep 2026 10:21:35 +0530
Message-ID: <20260907045135.13317-8-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045135.13317-1-hemanth.selam@gmail.com>
References: <20260907045135.13317-1-hemanth.selam@gmail.com>
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
index 5135d5c72a46..158d95c2520b 100644
--- a/tools/testing/selftests/bpf/libarena/src/asan.bpf.c
+++ b/tools/testing/selftests/bpf/libarena/src/asan.bpf.c
@@ -221,7 +221,7 @@ static __always_inline bool check_asan_args(s8 __arena *addr, size_t size,
 		goto confirmed_valid;
 
 	/*
-	 * Wraparound is possible for values close to the the edge of the
+	 * Wraparound is possible for values close to the edge of the
 	 * 4GiB boundary of the arena (last valid address is 1UL << 32 - 1).
 	 *
 	 *
diff --git a/tools/testing/selftests/bpf/progs/iters.c b/tools/testing/selftests/bpf/progs/iters.c
index 62d7df9e80be..340670e89ba9 100644
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
