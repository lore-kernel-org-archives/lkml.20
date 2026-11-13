Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588131;
	b=knmt28LZ6nPtVdwNVQ1+qCTihFK9HQHTh1dZLeVbz38BGDyzwnKG3xK9+zC+t700BlLp
	 FwZSzI9slBJ3NBvWSp4aL3hNxQQn9w2k+t9E1U2iS5rq2FJ/L6Ep1Qz1mqTBSUCzbbP3P
	 xR4meBv5NIOkZIgC86l1LwBfW4Ds/soxf2NCE0ta9Jg7NO21kYl9rJFmpUOrwiNfxZXBw
	 4tfP0H677B3MqNNTUewV2AddOuvFBm3Y1XPYamImNF8hMoOcx7DMU72A/XB3AeLf8XiPA
	 i0xRrRVEh7Seq/WozWmIrtVu3ngAVbXpDErrZKX9vksE7jmJv4bTSPMkrm9gJCgS1vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Ii0aUK5E1zvYVTunvoPhURf2Mo009cDWRrRFT15CshY=;
	b=H2+GEFLQVqT4CPrhYnZ2SJMjMzR+aFoqzisofp1hQ9Wu7xT8qNn32NPWQAxLw43yL3at
	 edhAF3x32M2rsKSZCqKcej0VAFpa1bLfqVB0Z60mORIGkdIOqIOmgAK+k8vLbW89AZRfE
	 oIG3L2hjBLQk9gg6mSeUVy9xwd9bsIUtlH50sEyHQu+NoLGe3vKsPmsdrQQfLqnfHvFRq
	 fW6YsMgacQEaou9Bh8pDDxKcC5xcOGC3HxaXU+IcKrIreGwARXZFzeo6nshwH+xdAr7uc
	 ElvHeSlz9zvF1gWZzbyIIN94BK36q0YgfkTVmOMn3aseexBLFl9DW7j1nR1TvpfTv+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S+Vbsdob;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F11606BC99
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9F11606BC99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S+Vbsdob
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37549877380so1475293eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588130; x=1795192930; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ii0aUK5E1zvYVTunvoPhURf2Mo009cDWRrRFT15CshY=;
        b=S+VbsdobVqN8bC2yjTuK3s+U9k772tMoJasWVxBshs+F1Q3XtxMepaMuUie8m3y2iN
         llom2Ljuy0YaUVRurLiQMhBMZENkrncdsi4xc4xXEcVRp5aOuo+0N9Cijrf8jvqyhWxr
         gtBjIRnobGuvTx7PPACVCZXUOfepN9UopnQ4NKmKFuTZ+8Y7M5xFp9PZClwXNChH6XEk
         tT7R/Vp8wDXyi5VM7Ji4mlhfmOSqa6TUnzSLGvXwPBdTjmskiUcVKfxUa3xz4IrXCFde
         cYmpF8mFGJdii1+m9xDb7fmc8T9vGM0aH2y8FhPbypYrMzROqEIIWgCztcJh33bbsK6/
         ud8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588130; x=1795192930;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ii0aUK5E1zvYVTunvoPhURf2Mo009cDWRrRFT15CshY=;
        b=w8gXYjgm2V7ezVV8W1la6TD9AWJZDJMYQ/OmSVEBJ+OKy8Nx5EEgwmxVw+ST1HomZQ
         E81Qfb6OdivSpc6jRonOXZa+3fG9DTjjG1mRICCeOISAIMVLHaUaiOXCSDUAWVi5SQr4
         I2EvVFLi8swaNlOAy19pS0piX5RvlI4/xUd2ur0y0qq93lJX5kE9pVSNjSXNsfkQx5v1
         px6KDP3iNGACdTB5Am1Cp/wNqMn8LWhEnvOC0hUIMvqAye7z1wsEkUdGvHql3/Q5A23A
         ks9V8S4N6f9AfkETiUWKWgOYrRVb0S/OirLDmD8YLk/f9wT2ZSUDUlyjmAhfeZbt1xQ7
         TZew==
X-Forwarded-Encrypted: i=1; AL+hErEn+ZQ10jR+Svwo+h9fQdfO1Fqxyr5NnMdkGx0+zvUUP7jmcp3btnMLJxykKFbbXWk8eqLxMy5ur4wDQxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LqYVJK1lgCRzAcsqgTaEDxrSx44GYHEjDH9U3OMOYeDKmKHkW
	iyucsFfCqJXqhggs60QqXE87aPVf4QG/G9VrlEcBz00EObPctUk9iCMBqAhynz4NeiVGu7QZ29s
	w294+Z7rZQg==
X-Received: from dycc6.prod.google.com ([2002:a05:693c:60c6:b0:33e:5767:2163])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:6407:b0:36d:d7ec:5e3d
 with SMTP id 5a478bee46e88-37967cdd4e1mr2786204eec.21.1794588129561; Fri, 13
 Nov 2026 08:42:09 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:36 -0800
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113164152.2095566-6-irogers@google.com>
Subject: [PATCH v13 05/21] perf build: Enable additional Clang thread-safety flags
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
2.56.1.703.gf848ed807c-goog

