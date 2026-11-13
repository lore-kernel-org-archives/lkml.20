Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599622;
	b=h8ctZdXNh5QJw1o4f54bi9mles5xyoTL2JQxsNUroS7Y7X0hVgvKnHb40n0RXs3oOZgF
	 McfoyCTQIqwzCsJratA1hE54c+1AcjgExvtYm45m2r1KN1OC4XV1nw/9xC8jY0G0UkjTx
	 nkwizJ0SsxDxQm9whmxfIXgOx54f/vCa8JC34sEbVcDIITxcRIv0/oCi+QZKmeh/ABPD9
	 2YKso+HsHkkFck4GTwf6/6tqHoNn8bfq3KGV2gF5Hc1FIfjCI3O5+/Jl5bH5QAeM9fF01
	 kf0AiE1v3lfyMsmY3b0VSE36fQd9rPFEq5gWgEfKCDW3hLmxC8sqtYmxYOq/p8DpJng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=oPLzA+hYqmF/KfV2iCsbm9KyjUtxSO2rBqPUOlKMfvo=;
	b=rV4OyQmeLI8m30JWD0VN5tVbx0Se9hn+UhcY1dpFWIXpcKwbmr/jOCwlS5S2g5c5Jc9R
	 7Cgzi+R6sEZlDtDZNILq/4bFVvgHIRFlayivA3uFRb+IAABHu6DlHdvxjppFOxHF4Arg5
	 OqNwUjHnwz3H428G+yv4vf61WdeAGY3eOXIYFmYQyFaJsQw87Cb/DdEbCEefFFUcoaTUC
	 aJ//Cuj58CLzOgNQxQUXP2NvV5AD2Ka6ZNt6X7WD+1q1PqbLUk7nhSL9OAF71vb1eIwSm
	 LcbBQsA6TwEZ16hBr8SrAEMSxhuLbQiAGVIZjV8kKYlgfCUUn+HQupKmJlN+1oqT7cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SQaZ7eTB;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13E2606A8A2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C13E2606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SQaZ7eTB
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37628596fc9so2650505eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794599621; x=1795204421; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPLzA+hYqmF/KfV2iCsbm9KyjUtxSO2rBqPUOlKMfvo=;
        b=SQaZ7eTBiMFHCCOJfgigNcT5n9PMGJTaNSogIAM8MhTcvngiI4sVJw70Ol+BSJ4wVM
         zF+UUlJYc1IondtxNZtaXmZ0c4rz62P+t9AWbDgZhNxDhR/uD/+Z2DXEP6ZT/A0zbPgA
         MYL+HjWdL9ET2Xryi8dHIU7Dk+dD+RsG9lMKCqQ5hUcpIBnLl6bFeAyRxzxIav34neNl
         pU7vJIoCvAfudR3hJT/GbUXpUTwLr29MRGNYFKpQT26ZZzg4sGYEVM9DPL9a0EbcODKX
         4ydPDCnaS0tGt1wXNXQvUF326qz0qzYt+RpKFS/5puZEqK+iV/rW2vtxcR7pOtdxLVt8
         Oibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599621; x=1795204421;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPLzA+hYqmF/KfV2iCsbm9KyjUtxSO2rBqPUOlKMfvo=;
        b=aHqXezHTKmYzMKjJQ2Gz+UYW8npaK8H+gWyoHpDndQTfDuACqKf6xsRNKgPPQe/WVu
         UWfwnJSFlgyR18yD2iiAfeFp2TISx6sf5sP/DGhQ6dSOy47dKI60BED+PDGdk++f04Aq
         OfuU2106j1kXzAmYHrqDx82Er0fNduxuryG3tuhUvDXxV/iGc+VbtzsB47cKStSXIJwZ
         XnLdQnQGMUZ2pq9FSd/i3c1gdJHG5jKUSI55nFQW8CBj65NfMK5L+HL4UqeB93bfdzNS
         CM/dOJeuSh/+G25LmwxKtbt/XH4y4cfyGWIZCBNSNaDkmcjljALxjtBPvVynBaNPn2cX
         0IhA==
X-Forwarded-Encrypted: i=1; AL+hErH91qgezMSLLUtmdRDITqHBHjLx/ZCs+o6d4GHiUNOOLTZnJyLP1rn+UPoDBxXMrEhkZWiO62Z/mE67LdM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mTjaM7YfcHNriDt1EcqcceKDswMKt+/LwiHa4fNMK5XWhkphg
	MUrOu2aoCBRwu3pWi98vRSInriC7Z2ZRyqnnHILhWmQFGD7b7q6xTA648dFu+hQYvJlFDJYfiDF
	PZtFGnNlJow==
X-Received: from dycpp20.prod.google.com ([2002:a05:7301:dd94:b0:35c:eb2a:8c31])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8096:b0:376:a6d7:8f51
 with SMTP id 5a478bee46e88-37965daa4c0mr3104509eec.12.1794599620499; Fri, 13
 Nov 2026 11:53:40 -0800 (PST)
Date: Fri, 13 Nov 2026 11:53:06 -0800
In-Reply-To: <20261113195335.2865725-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113195335.2865725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113195335.2865725-2-irogers@google.com>
Subject: [PATCH v2 01/30] perf pmus: Don't skip core PMUs as duplicates
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

perf_pmus__scan_skip_duplicates() skips a PMU whose name, without a
numeric suffix, matches the previous PMU's. This is intended for uncore
PMUs, such as uncore_cha_0 and uncore_cha_1, that have the same events.
The check was also applied to core PMUs, but core PMUs of heterogeneous
systems may differ only by such a suffix while having different events.
For example, ARM ACPI systems with two kinds of core name their PMUs
armv8_pmuv3_0 and armv8_pmuv3_1, and devicetree systems may name them
armv8_cortex_a53 and armv8_cortex_a57 where "a53" and "a57" are hex
suffixes. Only the first core PMU was listed by "perf list" and the
events of the other core PMUs were missing.

Before, on such a system, "perf list" and "perf list --unit=<pmu>" only
showed the events of the first core PMU, the scan having skipped the
others. After, the events of every core PMU are shown, as on Intel
hybrid systems with cpu_core and cpu_atom PMUs. Uncore PMU deduplication
is unchanged and pmu_deduped_name_len() already avoided removing the
suffix of core PMU names when printing events. Similarly avoid removing
the suffix of core PMU names in the raw event encodings that "perf list"
shows for each PMU, so that each core PMU's encoding is shown with its
own name.

Fixes: cd4e1efbbc40 ("perf pmus: Skip duplicate PMUs and don't print list suffix by default")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/pmus.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/pmus.c b/tools/perf/util/pmus.c
index 1355b317f3ed..4f4632f48e16 100644
--- a/tools/perf/util/pmus.c
+++ b/tools/perf/util/pmus.c
@@ -465,15 +465,14 @@ static struct perf_pmu *perf_pmus__scan_skip_duplicates(struct perf_pmu *pmu)
 		last_pmu_name_len = pmu_name_len_no_suffix(pmu->name ?: "");
 
 	if (use_core_pmus) {
-		list_for_each_entry_continue(pmu, &core_pmus, list) {
-			int pmu_name_len = pmu_name_len_no_suffix(pmu->name ?: "");
-
-			if (last_pmu_name_len == pmu_name_len &&
-			    !strncmp(last_pmu_name, pmu->name ?: "", pmu_name_len))
-				continue;
-
+		/*
+		 * Core PMUs, such as armv8_cortex_a53 and armv8_cortex_a57,
+		 * may differ only by a suffix but have different events, so
+		 * they are never duplicates.
+		 */
+		list_for_each_entry_continue(pmu, &core_pmus, list)
 			return pmu;
-		}
+
 		pmu = NULL;
 		pmu = list_prepare_entry(pmu, &other_pmus, list);
 	}
@@ -762,7 +761,9 @@ void perf_pmus__print_raw_pmu_events(const struct print_callbacks *print_cb, voi
 			.long_string = STRBUF_INIT,
 			.num_formats = 0,
 		};
-		int len = pmu_name_len_no_suffix(pmu->name);
+		/* Core PMUs aren't duplicates so keep their suffix. */
+		int len = pmu->is_core ? (int)strlen(pmu->name)
+				       : (int)pmu_name_len_no_suffix(pmu->name);
 		const char *desc = "(see 'man perf-list' or 'man perf-record' on how to encode it)";
 
 		if (!pmu->is_core)
-- 
2.56.1.703.gf848ed807c-goog

