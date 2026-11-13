Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606558;
	b=Khd5qzBMsa0tpG8LmkP/v2E7pa1QXPevem1T4sGQ+aKez14gPLihZ++1O10V/lpgIyEI
	 wgH+b4ouwLdzpe3TqrhPEoTLe3nAMva6g0g0NzMcAeeAhAcQ4vQNctvm4iSmllLxhTy+R
	 io1IVm90Gm/BtzBR6+A4neuinoZgzSUeCdunvpEhUyULV23O3vUC4jmKQmg9x6ndTCnua
	 tDMkhnw2nV6MEmRR7Sgi5cZmscwy03fa++U2X6sklVQB13skarReKHlQ9aPc3PPS8Mg3U
	 xtVeklI7bgAfITtzBiRsguxnOQ6HzIwuN8pydLVla0c36yWyHJg/qXhVFQq8gOKIwTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ZKLb1qEzYpahK26h3xDx9a51GP88hkzTLPyeAyDMP8U=;
	b=tMAK+bQvfzCki/14p6W9dBl/6uy5PjiYg19P8QcLfKOZ/VqIEWde56rdYNW/4+h3Usov
	 sjGx4Chtrta4q3ck/dDFUTIQg1RvDkhtjKkFY4tkC7VZqkjT4GLEQfi0+FyWPE8fA1pta
	 hlIi+xSiDdw96lQFhcc/YTUctFbPeOyul1r9CWxo/dM5PA2/1CCtHs3DDP1c8uaUv1Z1J
	 yytALQj/KudJNKL+MLoVGNl+7J53It4wGViRmYyhxW52s8onKAkEaeQDSjNyx1TZUPyOc
	 XQfGusEW2cvOj0qh1D0Y/Kk31uth4FHKpQIxwIpilWe08VsgZgsdBTT/roFeXaYxcsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ajMngymd;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11616606A882
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11616606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ajMngymd
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3724667bc16so875952eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794606557; x=1795211357; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKLb1qEzYpahK26h3xDx9a51GP88hkzTLPyeAyDMP8U=;
        b=ajMngymd0xeiTDMc+5FjOWouV4K/hXo20PZUf0GBjlR3tZfs62jhbmkvJYOIC7immD
         pl0os11mXb73WtsfXc1sb9aIFFNNFtwFhPASHpS01SB/jZ8kQxT36OhT6RU/NvzJmiiM
         l0JXFgUTEzDnGAI5B5QW06nK9PrWx/Tq1TGxSjHB7J+tmYMHt2CMyRBTXsLZg88SCaRu
         Rmt4LIygTJBkQF7lVYWdqARlK2TdtWGwZ1C12iyWNJpl8bh45KhueuwXP0SK6xDSTVGD
         WNOkiIlTuJomcW/K3dH8X3DfIw31SYPGt5xYORmy18ZLZBY7DETn9CepEcYPZmc7eXB/
         xblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606557; x=1795211357;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKLb1qEzYpahK26h3xDx9a51GP88hkzTLPyeAyDMP8U=;
        b=r4MXgsBLqhb2miMVlISEagiSvpt/YO1Wg/SXmkNaGCX2gAQx1FyoURBwkbF+NGN/KU
         /zM45WCLeA7HyW3njKECtnJkJoC4xxalR2FSLlbdcvN+6Lp7JNvUbu9X24NlBjt65XrD
         k9aJ777rwXEwzmjK6VaLCtQp80FRhErYkP4w0qe6uTuTBJ6GJgLC1WWTRkwS0Uw16JHM
         B+Vk3JxDbHsUHcxh1XHopQATKxkaA1C8H8LuEW9LQKVEUYVwxRBP6nbixCEx6w9i2LOa
         +EV37Cs5Un6YE5nUU89amuW6ssD+cEIy0UQ5B796QzChjTJ2KPDS/T8gprbFkCM59lqt
         RpUw==
X-Forwarded-Encrypted: i=1; AL+hErFNZ4sGoQ6bJyBSV8yfndWwRQmB83gxKsg8B+8Y4hyQmR7etDgsxueF/qi2M3G5Ik64lOayBeSM/Cuiu9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fhvCLZIhOqR/7DMKfBKXWmXqrYQnKn5O1Ly63ahaAyMXk05+U
	lKEhOzUR/MOJZnJeIuoVKtWrMeSxQBHlRErY97P7SY+dhuJEzPWn0YaufwixLWmRUbkst26Xdf3
	wUTaG/gnadA==
X-Received: from dyaw18-n1.prod.google.com ([2002:a05:693c:4152:10b0:373:6c70:7c9c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:430b:b0:36c:dd3b:a3e4
 with SMTP id 5a478bee46e88-379658c791fmr2991727eec.3.1794606556845; Fri, 13
 Nov 2026 13:49:16 -0800 (PST)
Date: Fri, 13 Nov 2026 13:48:26 -0800
In-Reply-To: <20261113214850.3329699-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113214850.3329699-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113214850.3329699-3-irogers@google.com>
Subject: [PATCH v1 02/26] perf annotate: Fix sym_hist_entry memory leak when
 zeroing histograms
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

annotated_source__samples maps keys to heap-allocated struct
sym_hist_entry pointers, which annotated_source__delete() frees before
destroying the hashmap. However, symbol__annotate_zero_histograms()
called hashmap__clear(notes->src->samples) directly without freeing the
stored sym_hist_entry values, leaking every entry whenever histograms
are zeroed.

Iterate over notes->src->samples and free each entry before calling
hashmap__clear().

Fixes: d3e7cad6f36d ("perf annotate: Add a hashmap for symbol histogram")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/annotate.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 86a4beec6528..9af1d6b72da9 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -164,7 +164,14 @@ void symbol__annotate_zero_histograms(struct symbol *sym)
 	if (notes->src != NULL) {
 		memset(notes->src->histograms, 0,
 		       notes->src->nr_histograms * sizeof(*notes->src->histograms));
-		hashmap__clear(notes->src->samples);
+		if (notes->src->samples) {
+			struct hashmap_entry *cur;
+			size_t bkt;
+
+			hashmap__for_each_entry(notes->src->samples, cur, bkt)
+				zfree(&cur->pvalue);
+			hashmap__clear(notes->src->samples);
+		}
 	}
 	if (notes->branch && notes->branch->cycles_hist) {
 		memset(notes->branch->cycles_hist, 0,
-- 
2.56.1.703.gf848ed807c-goog

