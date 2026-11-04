Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793766630;
	b=p8cElR/MOcOUH5skBlGMSNIxmpOkDRXM8u3iRNeVeOq5cCCB4Pe809KuldeaySSy6gyE
	 0gWl5A0BinhLctmM7XbSc61fja0kgxLFnLI86hEaDiv/KdtQ5+S1jcNfc5AjUR6XU1hg/
	 vh8IhY2iN1xar+3RNmNgFuuzmDWi6v6BdyKEhVdbG4KuU4BLTa1OQ7UquMcTpHyCn+qWH
	 kwZ0oQuLFnn3UEsGPhbqQHa1LvSI/OgbnRjD445/uF8oibudkeCe5Yz3TSMwnfX+JSb0P
	 9+Y/Bo0v9nZ6MVif2jGAyoNM1JYoYySp/XdCECsSYv4U77K/igweYHiTk1cAmbhpn5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=R5o2Iu/yXeZ9yHPfDZ7BM2KCdl6HYBb6HRzd5rwljxg=;
	b=ryb1AeObK150dSZitU+/t5X/xWUbaTu70dQ9eXDQ1L8UVxJTL7DocyGAxfcGqyXW7HTf
	 bVSjoIQPqgvN/m9onMLPRG5QdkdRPewLeabwfQT3dTt2q0buL2lKQH3MhL4oojktw/A/m
	 BugNhrVkAlTn1GxIUvtcccsZPZnS/S5iR0KJCMEr/nTxD7oH8CBnkE4ycyTrOgomQ9Bwp
	 8UIcfj8msuHmZh0KrIOKdZJ0x2paH9aT8wkAbLEGLK0SqRfuDGdfMBMfVOJXWcyXa8rZc
	 HQKMacZlwtj74q0PjDfP2RkNuUfUf9jKY9tvVFUzCLlL4lmpzuvsX/8TtFBIVLhSN8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pcsCcJhB;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238B9606A334
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 238B9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pcsCcJhB
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso759848c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793766629; x=1794371429; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5o2Iu/yXeZ9yHPfDZ7BM2KCdl6HYBb6HRzd5rwljxg=;
        b=pcsCcJhBlyEVAlZIjz24DMsOqMTLI+S6yqIyeHhH/ox7IE8tNDJXktryoAzWfDY4pz
         ok+BMCsqxm/4pSyyypPHPDChfclKFCVOKGNj/Z7W+I00U4zDusHLzWJpj2CtQnot+bIx
         mBZ9WjO6VbPFARe+SC6DbI3ywJsSFnB0M3z+Quxvb7BdqD00wndXpjbPUv7Sl+ViyhYa
         tgWWRmS58PYLa5U/US3ZUR4syBkmNwA5LvgMxCax/vupI2/Gr55X2aPl+eEO7U8xzoDt
         DGYhTFdi0Xb7LZzElpC0kWM3YMyiAkSCZLVQaibyFBlGTz04Fgha6Br3VV3cXE0FBTgz
         Y3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793766629; x=1794371429;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5o2Iu/yXeZ9yHPfDZ7BM2KCdl6HYBb6HRzd5rwljxg=;
        b=pfJ7JWcecrZ3jwzUnmiJ7de5crd85rMWwqSj0erYmlhdUmJQo52M5yoz54RqlBJmbt
         eMMfj8iyKH1qLRaDQEj3XP6Q2QrjYMWJ/atrpGRtEjgo2jB+lE9DnZSYMJyTBmpFcLry
         N1G9ZL+RsqdNwvU/r3vMKC6IOj516GmEUGzVJPo0CwxRThg7WGKk9Ivtt2jprWuHYqVh
         I3egH0jszg95hPeRqY9j8zsggUdorXsHz0LwVZXnD/wikBKgaqDXHq2YKOq2WBxgB6ET
         9qJK0p5h0g7ooJIREEDYVIQV0C/NbQdq5ruF/j3GYYLx6xgVkV3S7mMVrDdMV08Srjf7
         FKwQ==
X-Forwarded-Encrypted: i=1; AKwUvByYampGrvzEJLQyjps9Y/v2fhU1hKBo7QPqrVgZF+kyt0ShepIpNQDGazY22WZkED5lmhgh66LJn9xrSCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wSj45dWqkco0VSSg2dfia6fXXhPWfbiiVyTShS8TlEHl+Wjie
	rGshbKh9skHMx0ByaWIwDKGTzaByUBckqvpnN4sbB7+v+dnD4psdfELUWYCyj9G56A2CPbS8Mpq
	TrFKpVxSuYQ==
X-Received: from dlai3.prod.google.com ([2002:a05:701b:2703:b0:1a7:6a69:e56b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2097:b0:1a0:b650:5c93
 with SMTP id a92af1059eb24-1ac5e8e1e16mr21701234c88.41.1793766628690; Tue, 03
 Nov 2026 20:30:28 -0800 (PST)
Date: Tue,  3 Nov 2026 20:30:06 -0800
In-Reply-To: <20261104043006.1199857-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261104043006.1199857-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261104043006.1199857-5-irogers@google.com>
Subject: [PATCH v3 4/4] objtool: Add explicitly sequenced -lzstd to libopcodes fallback
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Quentin Monnet <qmo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, James Clark <james.clark@linaro.org>, 
	Leo Yan <leo.yan@arm.com>, linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Distributions like Fedora ship a statically compiled binutils libbfd (an
intrinsic dependency of libopcodes) that uses zstd to decompress
sections.

Because objtool resolves host dependencies sequentially via a manual
HOSTCC shell loop, linking against static binutils fails with undefined
references to 'ZSTD_decompress' unless the loop probes for -lzstd.

Add the '-lopcodes -lbfd -liberty -lz -lzstd' combination to the
LIBOPCODES_LIBS fallback chain.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/objtool/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index db99c4759b2c..238da6fd277f 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -81,14 +81,15 @@ HOST_OVERRIDES := CC="$(HOSTCC)" LD="$(HOSTLD)" AR="$(HOSTAR)"
 #
 # When using shared libraries, -lopcodes is sufficient as dependencies are
 # resolved automatically. With static libraries, we must explicitly link
-# against libopcodes' dependencies: libbfd, libiberty, and sometimes libz.
-# Try each combination and use the first one that succeeds.
+# against libopcodes' dependencies: libbfd, libiberty, and sometimes libz
+# and libzstd. Try each combination and use the first one that succeeds.
 #
 LIBOPCODES_LIBS := $(shell \
 	for libs in "-lopcodes" \
 		    "-lopcodes -lbfd" \
 		    "-lopcodes -lbfd -liberty" \
-		    "-lopcodes -lbfd -liberty -lz"; do \
+		    "-lopcodes -lbfd -liberty -lz" \
+		    "-lopcodes -lbfd -liberty -lz -lzstd"; do \
 		printf '%s\n' \
 		       '$(pound)include <bfd.h>' \
 		       '$(pound)include <dis-asm.h>' \
-- 
2.56.0.385.gac671c819a-goog

