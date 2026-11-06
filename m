Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948643;
	b=Wp+oieh8Ohdspj1jvP5nkw+7fRKxH31+zFvf90LfRqi+iWNgtRIxbF/JfAGxGyOtn3E8
	 WVvCgeBmWsRd/2h5qpcJS7ikGHUU2eW1NGdcoZWq9LVYGZmjVrruV0CaH9TRDQ/HQRz/g
	 Fv1hDwH5C+ZFjpSIBLwyvcqayt0snqjDgdSvbLyVtqTJriU1N+bkyXB62C9l6Pwj8kuqI
	 3CcOl51iOHLQpAADPbQwF1vCaYxD5JAGNTGALmwaEZoATjY/y1qHpxLRrqpDD/FwJmYB/
	 2zzQblkHkTq3n2YjqQA/UumLdlLf7bTgwbzys2bgRouOayznTXE8qAsudZeKO1aHFPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
	b=fn/OuBAHYLIBjQ0FE8B1rvb7Fygi8/xGudlZgZNzyFxYvZV/3AKYjBwX9a+bUgtVcmm+
	 yAuGQfw8/tTBp8wEV1pp0rYUj6bQhZxoIFl2xMgp1+ns5Hv/1OPvlRyR2Fol1WU2GBc+S
	 qZoIg8+qk3D12mOqSAnO/UNfIJSBIhmszVW3+PcH8wixjlma75GerXFzaQMIS29LkPqCW
	 oXVPk8e47x9lLOM/vvcToVTit7LuLXiund6+wzl1+dn0JTPaTi1H7htwlIfri+LlLiUjA
	 s0IKJiZYWDmJOJ1APwN2sXLiHBaulxMiDharklwc6eWPCZk8O29J2lznAZ31T5ixO6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=itqTynsJ;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE4606D82F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACAE4606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=itqTynsJ
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso671684eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948642; x=1794553442; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
        b=itqTynsJMf/7ovamYmxG/ORkNw94Xlsou3Z/Qoo+w1H3f1gNG2p2xlWeWTbprkvnaY
         c8Dit+gqVQwbpy978adjbgfmfgp0E8eYmt/Pvbw0CdPJ5hjbCVZ4nc8fHoGGD/Oj61u/
         HHnF9Mod8tAsXDBMNx6/t6Dho8KLzz1EqMvaVA3lMtV3S38JxqtotXpPjOP33DhkvZJj
         00ZtfGKARNgL7GCcbxKKl0ytbZ4Kb3iREEQ524898o2YQQLnOlad6mkcR92NaOty+e1K
         ihaCpFrlxNVyo7/q/b3vNydx1PSdXxeBAscfu9355OXi7uc8cJRqzefPfN2AtBNYTVL7
         KPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948642; x=1794553442;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
        b=VYIxqpgZ2NUbvj6MT5bUocUxmeJWbGz7haBfW2AkuNzZPxj9eTt1FL0aZ7Cqkwwb6A
         +Ux58G40bMmIa07bsGCsmWeLYbgjPSAn1z6d6H7oKuJywwyV7px9g2j1r+uhEzur42X9
         Vzh8xATyRxfwt+SUafMwlU1CGzQhw6Thhikg6Z54DKnVpHNIdT5GfJK9DyqA5osiAODC
         F7ws48jjIMsbw3eLZpWGSEok2T/GoXIG9eRdjExACOPILF6xFodQPr7nZ1bONi7JSbRI
         6Qz81BOcSvK0Kz0Vtow1gJ/BFD7YTdviUqM+4ybRbfSjsKvm3HlRb7jIyE3mjdV45wPI
         RVJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrb6FVRzkv2sZ6AtXh0rmu+qKQMLVtx2MXef7YdMPdo5k5Hcde6DFla3K3rNfjIHJCO/w9jGE1vhod5mE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1jTg3SZYKNC5AJRvbdlIGuTrkEO39+PKZCf9RTotzm6TEXaSD
	cYWN3D7XUMEo+A2o+pWe9uoFEDzK0O1cGtlLoTm20OktOnu4OCJ4sRUdqBU9gkZ2i9qGwn1XC3t
	+9jdgWKgwcQ==
X-Received: from dlec17-n2.prod.google.com ([2002:a05:701b:4291:20b0:1ad:6e8:8d5b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3c12:b0:1a8:9857:2102
 with SMTP id a92af1059eb24-1b25d3445demr1741316c88.30.1793948641255; Thu, 05
 Nov 2026 23:04:01 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:29 -0800
In-Reply-To: <20261106070344.329897-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106070344.329897-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106070344.329897-6-irogers@google.com>
Subject: [PATCH v10 05/20] perf build: Enable additional Clang thread-safety flags
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

