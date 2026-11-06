Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948651;
	b=tuLJa8un7F/yJTVCbklsc4t5EsZKVcfK0yOWTTpNFBQrQ1xYCztKr50UN6/gBtgR529+
	 BYdhL9b6B91qTfp7ClvH/ShdHzTnRkxWOLe+o03Y+iAS+TKl8kujgnilWvfnJtgCFiUb6
	 +CVbFScpqenZ90FKoj3Bv91IIWzaNh2vPeY5RKwf6I0eYvMshhPRXRqD1qho7JGUz0QvT
	 o8WdswjU7Q9YZRWQxgLLTlnyPG0mIwKkTfUbRSUyzMJq9EpR3NZrNADzqSWFO6iatQBPh
	 /E4a3zSjzVaB5WmMijtiY+dKZR9LOTA80ot7I10LJcN+YXz83/wEQl4+JOvoxctqQQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Z8FMLs2dPMkAqt/fa4VkQyxWHnbdMIqVh4NcUaI4/40=;
	b=ZPhnUXZ/yR/Lzu7M0dwnw8wYqTQHvBuIo543S41ue8NpG8Q9NOQY2LCwl/QojjoXVVjP
	 mWWhpGmVWrumO/ut4QA0mhJkjvaA2S3oQdgNpzHpNkAe6RnJ2SXmgtddmufbc+Aw7db/y
	 jycrD7q2Sol9AGDGwEc81dEMUPCXm/X5tzINRf1UO1LFP6dtzcjpwCQF+OQA603ZaqZHP
	 t23tkQzcLJl06buHa1lL3N767vh9pKuEdnMjURYXgYq6vd/wv/hTmmoLJBVMEihiWPsbi
	 vOEyp8HjfDo4govJMfO3SYXQ/fcLPyTvMyh9GirCYFNmPiypDJN7gncLxMlnSIvXOIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WkRqJcVS;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CC6606A33E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9CC6606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WkRqJcVS
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d2a94abf7so240600eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948650; x=1794553450; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8FMLs2dPMkAqt/fa4VkQyxWHnbdMIqVh4NcUaI4/40=;
        b=WkRqJcVSkPQQyYzcK1NoskmYEch0tdGUkvhCFtWmpgy20nQk9YpZU19q4RDo0rJUH/
         fTNEBBw1Je83hAeQeNNg0JQ9a8hVMWc6/tU8PiI0Xn+ny/x+Bu7kVUF/Q2K9GOGfgH9N
         ZfPYIeCncGP8311KfFzzF/Fsk0enkYqE/NqS67cCP+qm7ecx5x85jmv5McSaFBdKImQs
         RY9jrbwpQa7q0ALpPo7b/B7/fKsXF7YN0q/VUCij6OlhLJ19oA+RC8jyBHpof1u+6orh
         SJUwWgAnmEtv8C07STg3yS6t1blXjpayxyzTMvrBSJvaqYHh3QY80fVfpkPgJv9x2hOt
         6pcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948650; x=1794553450;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8FMLs2dPMkAqt/fa4VkQyxWHnbdMIqVh4NcUaI4/40=;
        b=LA/HzTULAxmeKSA/60avf42S8y2Qdd5I+CAvk21QzziXBEdgy+8BwpVBX3H52U1cja
         1u5W1iA59/tn6yqVUg2y0zZGh0QDaFerAsNm2SbYaxRCKnBwBvULcU6BTLhUmGaG7kEp
         l+A+ms1N3Ovz1HX40WZrl8G6LN4IynprrDUqLpyHbPXL2cRIfY9cvhZUYVeqGsCs+p6U
         3//qYUlDcuadhzxgkuo4mcw/cOymlnwpaZaB0BOJWxZmt86REqoWUyUh1aiR1P6HJqQU
         39VQatPMFXEdGmF1skA27ZjHdNrH20xf1i04/c96VOLKCmTpTWq+f/OSIyf59xO6SqqY
         PH5g==
X-Forwarded-Encrypted: i=1; AKwUvBx9p0kJiyl7FO7EzCqb77Tx0B8pbwuztypWHyoCJMEErsHLma4w9eeuQv1n98r1A9iacOfguc6u2e9GUTg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CT21yMY9maVCT/jTB1fyb0KWLD3LQrXGv2UK3tDC5SGeTiKyK
	Z8yBsxqAxhyGvc4M7GBCrVenlXHFse5gLQFjNiWfU2UcsJsqAPYYCcZ5Lc8jcnKE0kkcdaRx9Zu
	gUxJMEGUGDQ==
X-Received: from dldz2-n2.prod.google.com ([2002:a05:701b:4182:20b0:1ac:2245:a27b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:260d:b0:1b2:459d:331f
 with SMTP id a92af1059eb24-1b24f4d01b2mr5780989c88.16.1793948649455; Thu, 05
 Nov 2026 23:04:09 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:33 -0800
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
Message-ID: <20261106070344.329897-10-irogers@google.com>
Subject: [PATCH v10 09/20] perf dsos: Ensure DSOs in auxtrace, machine, and
 symbol are in dsos
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Place the DSOs created in addr_filter__resolve_syms(),
machine__process_ksymbol_register(), and maps__split_kallsyms() into a
dsos collection so that all DSOs that may have data fds opened or be
referenced by maps belong to a dsos collection.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/auxtrace.c | 16 +++++++++++++---
 tools/perf/util/machine.c  |  4 ++++
 tools/perf/util/symbol.c   |  4 ++++
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 8bb491d389a2..1451de019df0 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -29,6 +29,7 @@
 #include "config.h"
 #include "evlist.h"
 #include "dso.h"
+#include "dsos.h"
 #include "map.h"
 #include "pmu.h"
 #include "evsel.h"
@@ -2684,7 +2685,7 @@ static int addr_filter__resolve_kernel_syms(struct addr_filter *filt)
 	return 0;
 }
 
-static struct dso *load_dso(const char *name)
+static struct dso *load_dso(const char *name, struct dsos *dsos)
 {
 	struct map *map;
 	struct dso *dso;
@@ -2693,6 +2694,11 @@ static struct dso *load_dso(const char *name)
 	if (!map)
 		return NULL;
 
+	if (dsos__add(dsos, map__dso(map))) {
+		map__put(map);
+		return NULL;
+	}
+
 	if (map__load(map) < 0)
 		pr_err("File '%s' not found or has no symbols.\n", name);
 
@@ -2794,6 +2800,7 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 {
 	u64 start, size;
 	struct dso *dso;
+	struct dsos dsos;
 	int err = 0;
 
 	if (!filt->sym_from && !filt->sym_to)
@@ -2802,9 +2809,11 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 	if (!filt->filename)
 		return addr_filter__resolve_kernel_syms(filt);
 
-	dso = load_dso(filt->filename);
+	dsos__init(&dsos);
+	dso = load_dso(filt->filename, &dsos);
 	if (!dso) {
 		pr_err("Failed to load symbols from: %s\n", filt->filename);
+		dsos__exit(&dsos);
 		return -EINVAL;
 	}
 
@@ -2831,13 +2840,14 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 
 		err = check_end_after_start(filt, start, size);
 		if (err)
-			return err;
+			goto put_dso;
 
 		filt->size = start + size - filt->addr;
 	}
 
 put_dso:
 	dso__put(dso);
+	dsos__exit(&dsos);
 
 	return err;
 }
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index b958c6935a56..0044ea046aca 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -775,6 +775,10 @@ static int machine__process_ksymbol_register(struct machine *machine,
 				dso__set_long_name(dso, "", false);
 		}
 
+		err = dsos__add(&machine->dsos, dso);
+		if (err)
+			goto out;
+
 		map__set_start(map, event->ksymbol.addr);
 		map__set_end(map, map__start(map) + event->ksymbol.len);
 		err = maps__fixup_overlap_and_insert(machine__kernel_maps(machine), map);
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index b61a574ce9a3..686fc48841c6 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -1090,6 +1090,10 @@ static int maps__split_kallsyms(struct maps *kmaps, struct dso *dso, u64 delta,
 				dso__set_symtab_type(ndso, DSO_BINARY_TYPE__KALLSYMS);
 			}
 			dso__set_loaded(ndso);
+			if (dsos__add(&machine->dsos, ndso)) {
+				dso__put(ndso);
+				return -1;
+			}
 
 			curr_map = map__new2(pos->start, ndso);
 			if (curr_map == NULL) {
-- 
2.56.0.455.g6c5a503b38-goog

