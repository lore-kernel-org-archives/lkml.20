Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026479;
	b=XhuIyfeczR5+8fsTpzMCOqb4aj3gh8COE9bnmzzfwaVlVu9b7ylVp5dRZY5ojAB37Swq
	 5hHxaS7NPs/Y+at6C2eAGci7ouT0my0d7uM/XlikiKN45FkxccUo0wRW8XhA7IKqldUvv
	 x48kEliF0FZZ62+Tf6brDBwKKfDCwyJBzKXZcsaUOZwSDtU8AKNCHBy922MVSgUTnpSGJ
	 5PGhMxmWHTZIEZZ32Ml1xveDV2cVibUTyF38Gu58i6nyKfRtQ7qsBvWdiPozQ2D4CfFBN
	 55WrxvRPFywNrTlSU0ZSd/KQsRDA77tuqu8kdSPKp0mxA2VDKM2Fhqup9MiJ9BAmziQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
	b=Bh4PET+a+hSFvVqozu2Uxg560+jEh88LSP8F0zV9dwGJnhJEsEwV3TQYatCGr6RxocQ2
	 1n9aeC2EXw/rz6F9c1Bp7iTVQoDz27BgjRGPwLOq8EyY0REudjp+dx8tBpHH21sx6tgZO
	 G/8u1XTLZaZjLYpYBEKwRljrhnnj4x0r49MBb76Jokx+jQj+17UQs/qfB7eYVeVEmvLiE
	 yR75ExZmzIODPcE0eIl1W3XCFbRbsOL50u/RWxSg+ROgE71kI1+R5TUG/cAK5oZMEQ6jZ
	 dHGjd1vOHqxjDbDaCCY18t5rm7nCLLA6VRyqQ7UKgpc1ZGcgbxHrhQd3Eqxpiw3beOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J18GOLkx;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31E0606A335
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A31E0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J18GOLkx
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-844bc76180bso1634092a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026478; x=1794631278; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
        b=J18GOLkxlvm6dGUCxmB5aJeeDRuc4CaGp24n09+zcORqZKGvhLc/VsrFhZeV/305b3
         t3Dj1aK52Gwtr3Uu4OHJatzjlTkrYyZxf28HVPpaYWIw2/kd1uCJMQsOAyyrvr9YCi39
         mb/lOEA53MWVLvHAM2wPWORrdx2bSoK5tmXy1cFxTWTm53UxMaVOjl+SWKUDJWSzfoN1
         02sIz3cVZj7UatNdN1/vEr7U2WIYX7uLVTs8GGMiT+cXzU6Tbk8VjqhNjoFbv7akPLxm
         NMHs/jyqjLYcDanb4uwZBKbTh2EfpcW9XpyRBJ39v1JJzcwqiXhWQLJRATSThI0wT626
         96yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026478; x=1794631278;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
        b=nSN+Fu6c/DOj81icCgqI2N8lY1W2PQ2/oJAxcqvc26ej//PSZAxYEOzUG5NPuNg+h0
         JLKEpmC/KGJrZj8lJlDYbPtCEUOYJHL46CBA8psPTgGZ9+4kRmVIbm6ZXyZw4VoTSSby
         wLzR8P01S5GXfqRHJaXWbyxVdNLrnGl4ljMRl4lHSp6rxu6rm985b5sBPR+2eiDhUb14
         M4jXMTKiE+Q82NNMsrY0sgcmuIboQtsxR+bFDStvU5oTgGWcdQuB0n2qsYu1XFpQrp9u
         VG4/PfJuKUboO+3teUupcfCr2t04xcChN0yOMXRENrRrbfJIzvyvVj9eRBFcUYEbMWll
         KHYw==
X-Forwarded-Encrypted: i=1; AKwUvByOojWu2NG+0QgXUWkwqUmWyJx1cqySkx3K673E6u7FkoG4m4aHx7y4DhHdgg5r7jMfBi6XnFbkczpQePU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5MJB3HqILwGWqR4DcqOHHhEl2carxe8dAd0eRflyVB918U1qX
	nadsq4Sq8YW9oFP7JhAm5cHfvmVsGYDIpaUbdsfhqdsS0dapDXJ6pnAPaQkdomGUbDR5z9s0rKZ
	5cbkheXlzyw==
X-Received: from oatp23-n1.prod.google.com ([2002:a05:687c:4597:10b0:4a2:ac48:4d59])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:b20:b0:4ad:8c55:4087
 with SMTP id 586e51a60fabf-4ad986619e5mr3163066fac.4.1794026477335; Fri, 06
 Nov 2026 20:41:17 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:46 -0800
In-Reply-To: <20261107044102.1506626-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107044102.1506626-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261107044102.1506626-6-irogers@google.com>
Subject: [PATCH v11 05/20] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Align tools/perf's Clang thread-safety flags with the kernel's
scripts/Makefile.context-analysis by adding -Wthread-safety-pointer,
-Wthread-safety-beta, and (when supported by the compiler)
-fexperimental-late-parse-attributes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 3eb8d095cda0..b50702bac53c 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -64,7 +64,13 @@ ifeq ($(CC_NO_CLANG), 0)
   endif
 
   # Enabled Wthread-safety analysis for clang builds.
-  CFLAGS += -Wthread-safety -DWARN_CONTEXT_ANALYSIS
+  CFLAGS += -DWARN_CONTEXT_ANALYSIS -Wthread-safety
+  ifeq ($(shell $(CC) -Werror -Wthread-safety-pointer -Wthread-safety-beta -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -Wthread-safety-pointer -Wthread-safety-beta
+  endif
+  ifeq ($(shell $(CC) -Werror -fexperimental-late-parse-attributes -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -fexperimental-late-parse-attributes
+  endif
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch
-- 
2.56.0.455.g6c5a503b38-goog

