Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606609;
	b=b26HPe2E9aR+aJ1Ad42AxnXkJp325arRdRBzuYzx1IHOGdvEFnFhoiNEJ4CNzvgIxGqh
	 /BK55pwTQTNvFNkBaHBuR6O0Rz0epTzS/gENhxKWqDPubq770EjY/T+Sq7LWrV4ZCIaG1
	 ecJiArH488exnHvi3wzLHbDFyBuUh16651hNlxEyyCXPbFSxKQ9H88eXiTRiCG7ybq1bA
	 C7VSLGz/nOJgVCCq3JRuZudcwIt8uzcY125xxKSofdwszCRdgixQ7IKO8xfjg8PESh8Ko
	 1XHOgUhfcIPhywb8QWtR5qClorlroPUac+CTxwQk3g0tbbBsohknzyhzqafAsjYbmfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=M7M6ChNDEA0jcvgLZz8uppZnHneIa4DE6GM95tvdqNA=;
	b=1nZxQZKL/HZpBNy9+fueyb4P28Tcg6Noi0CScabpTD0Tc62DjRqGZ8Od3y84/0BBE0BK
	 rnYi1HsPMCwJBTUBQJ9/gHU3/1kDz10Vtag2DKR2GLRbbXFrelRJULbYaj8v4FkVivOWt
	 R7z8I8rIyJnb446zatwKnpWUhXF1SbLWDXOMoNbURQfC19c2LOSnzT24WsFTW/RJK0+aV
	 3o0aJqGnB5DzAufdQhtdWIazL7Q1cJfLCHB3/x4JclRkzKpWul9wcQtd1g8Gtl/G1QWEM
	 lNde9QPwHl6mrQ7vhptf8XRkQh4kmVJWSq0kFgsy0tJgL1F65qznFv1XvpJI2JleNag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XrbI0yZR;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3A160A2634
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A3A160A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XrbI0yZR
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3a348a6dbso2636360c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794606607; x=1795211407; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7M6ChNDEA0jcvgLZz8uppZnHneIa4DE6GM95tvdqNA=;
        b=XrbI0yZRF4kyWXS5D4kXsAi+vemOdgh0xc8/jjvRnNOvohgfgjFRiDNU9N7JoytJVt
         imXLL5ncX9vPh2OCfo0j1QJG2hoIZJzDhrHusMfX1R64TjoM4IP8/JPa+vhLFHQuwl4r
         WDjvhdBMSx49mrTLpVIN0+h9qyG2FoP9yLGo2XNJD3cdYaxeMkAffvHLk0U4z33/6zzD
         0q8vJlipFXdtpAUImBwYz3GlbxFBrtbf7aDP1fbHM1skx9YY9OPP3nSnoENlA4YQTssz
         GEHpniWQZMVSYtg/+Q8yNXKSRorMjn0hbaEOFqo11kzGhZsXDraAGBUtbecKJ98n6rGl
         r2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606607; x=1795211407;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7M6ChNDEA0jcvgLZz8uppZnHneIa4DE6GM95tvdqNA=;
        b=e9WXMoQ4YxSCxCqwoVVlHT39w1HK/PM0m5LXnPiBj4wqBvNPcT8sOksFLh2Z9dBsqe
         Tuz6R/NmQ4YbIeZkGlTVB28QOvDPqAgbWDV/qf/kniD9eO2FYMBvez0z27CI6dVda8Xl
         ovIovK+rxFTo7uvvVsurp1fciX3bPU45uxpmBZOZMqV5ufg1g0J8d7bCGSUWIaGGc6V9
         asG/+32EttLtiXiflFs8pn6M7Fe0ItK+ix4lKU809uYxBc1cPjvMMFwh4TZjzt77vHC3
         myBlsTb0YlO4DqX/W2+Aj28WoLXb2g9EDiCrbjHV8oc/Q2IZ9O6A9y7aVMIbi8EhQrdW
         gYMw==
X-Forwarded-Encrypted: i=1; AL+hErGiSvn/bcm4a5+uIOiru17/SAv8WiBju4RhelgwYPABkWhB07Rp6kDyNR1MLMx48xVdbVRgW8y8jmx5l+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5OsfjzJdJr2SS4KnaU1y5TdtZJ93PnI+r0A+mjhfTyStPfx5D
	bgk4baJVPXrjRdXxgfGJvY2/cGVoFOhGVq4sS1AiVTSf+FCqtN5+kU0uXUh91dY32zL51lxkqSN
	YJAB0uNARqw==
X-Received: from dlai16.prod.google.com ([2002:a05:701b:2710:b0:1a3:c305:2584])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4248:10b0:1b3:b455:93db
 with SMTP id a92af1059eb24-1b503131b06mr3912773c88.24.1794606607179; Fri, 13
 Nov 2026 13:50:07 -0800 (PST)
Date: Fri, 13 Nov 2026 13:48:45 -0800
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
Message-ID: <20261113214850.3329699-22-irogers@google.com>
Subject: [PATCH v1 21/26] perf annotate: Use generic hashmap for browser type_hash
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Convert annotate_browser::type_hash and annotation_print_data::type_hash
in util/annotate.{c,h} and ui/browsers/annotate.c to
DECLARE_HASHMAP(type_hash_map, long, struct type_hash_entry *).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/ui/browsers/annotate.c | 18 +++++++++---------
 tools/perf/util/annotate.c        |  5 -----
 tools/perf/util/annotate.h        |  8 +++++++-
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/tools/perf/ui/browsers/annotate.c b/tools/perf/ui/browsers/annotate.c
index 8b0c933caf2e..7899c3e2b07a 100644
--- a/tools/perf/ui/browsers/annotate.c
+++ b/tools/perf/ui/browsers/annotate.c
@@ -39,7 +39,7 @@ struct annotate_browser {
 	struct hist_entry	   *he;
 	struct debuginfo	   *dbg;
 	struct evsel		   *evsel;
-	struct hashmap		   *type_hash;
+	struct type_hash_map	   *type_hash;
 	bool			    searching_backwards;
 	char			    search_bf[128];
 };
@@ -1131,8 +1131,8 @@ static int annotate_browser__run(struct annotate_browser *browser,
 			if (browser->dbg == NULL)
 				browser->dbg = dso__debuginfo(map__dso(ms->map));
 			if (browser->type_hash == NULL) {
-				browser->type_hash = hashmap__new(type_hash, type_equal,
-								  /*ctx=*/NULL);
+				browser->type_hash = type_hash_map__new(type_hash, type_equal,
+									/*ctx=*/NULL);
 			}
 			annotate_browser__show(browser, title, help);
 			annotate_browser__debuginfo_warning(browser);
@@ -1233,7 +1233,7 @@ int __hist_entry__tui_annotate(struct hist_entry *he, struct map_symbol *ms,
 
 	if (annotate_opts.code_with_type) {
 		browser.dbg = dso__debuginfo(dso);
-		browser.type_hash = hashmap__new(type_hash, type_equal, /*ctx=*/NULL);
+		browser.type_hash = type_hash_map__new(type_hash, type_equal, /*ctx=*/NULL);
 	}
 
 	browser.b.width = notes->src->widths.max_line_len +
@@ -1265,12 +1265,12 @@ int __hist_entry__tui_annotate(struct hist_entry *he, struct map_symbol *ms,
 	debuginfo__delete(browser.dbg);
 
 	if (browser.type_hash) {
-		struct hashmap_entry *cur;
-		size_t bkt;
+		long key;
+		struct type_hash_entry *val;
 
-		hashmap__for_each_entry(browser.type_hash, cur, bkt)
-			zfree(&cur->pvalue);
-		hashmap__free(browser.type_hash);
+		hashmap__for_each(browser.type_hash, key, val)
+			free(val);
+		type_hash_map__free(browser.type_hash);
 	}
 
 	if (not_annotated && !notes->src->tried_source)
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index c6325040452f..ee47dcdc1f18 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -2075,11 +2075,6 @@ int annotation_br_cntr_entry(char **str, int br_cntr_nr,
 	return -ENOMEM;
 }
 
-struct type_hash_entry {
-	struct annotated_data_type *type;
-	int offset;
-};
-
 static int disasm_line__snprint_type_info(struct disasm_line *dl,
 					  char *buf, int len,
 					  struct annotation_print_data *apd)
diff --git a/tools/perf/util/annotate.h b/tools/perf/util/annotate.h
index 495c8602864c..2757fb07d4ec 100644
--- a/tools/perf/util/annotate.h
+++ b/tools/perf/util/annotate.h
@@ -202,13 +202,19 @@ struct annotation_write_ops {
 	void (*write_graph)(void *obj, int graph);
 };
 
+struct type_hash_entry {
+	struct annotated_data_type *type;
+	int offset;
+};
+DECLARE_HASHMAP(type_hash_map, long, struct type_hash_entry *);
+
 struct annotation_print_data {
 	struct hist_entry *he;
 	struct evsel *evsel;
 	const struct arch *arch;
 	struct debuginfo *dbg;
 	/* save data type info keyed by al->offset */
-	struct hashmap *type_hash;
+	struct type_hash_map *type_hash;
 	/* It'll be set in hist_entry__annotate_printf() */
 	int addr_fmt_width;
 };
-- 
2.56.1.703.gf848ed807c-goog

