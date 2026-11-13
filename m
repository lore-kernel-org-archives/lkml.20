Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599673;
	b=ABvONr6Z5IfDNwYgxSe0OtFakbHxNePeWlWxX8UaQ41wrqAfET+JgscvcafUDcQbhBXf
	 umjJXq84iSk25Vbhh1ZEAAf4pO2VK7PUdhV0vzsfTdb3ezvUUauMLcCNyR1Jq4hFQcHqZ
	 qJeaNzK7ZpYfH6zX1N7IMEnsLyE7xqn+ZI4hmj9A33h+htmmNujnG6WJRu4Z5yyCDiErb
	 eq2JYezFge2t93TiXye57BFrEMvru8sFSB6ZxYKPEzaHBlKrSMQr5Hzvf8sakaEpPir+z
	 tUNZv6Jon297YZUQ307eL0cM3UQ4xbyWv7XzXE/TE+JVhJzIzlGmQW/Au+G6HfaSk4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=q6K6qbv5w9n/vylWvvJqwRCndKz60wsHaPohkqjPYFo=;
	b=IipV7xMman4YZkOLQfapKmcGTAgvQl9mgKnS9urxPLDwI20VbT/qWEuKoUxQ90YBWESB
	 Ucj33mICHi73ubXsTjc3N4QKkTd5rEf+R324AEty5r61CBpgSnjPkjJMy3kU4E/sBNQq4
	 sxSs7xPjChRHNk2uVR6d6Ch1tNt1XyNhnMZXpZjbWP/Vyp7rz4nhM/auO+OJdBC5Xg+/m
	 vuyiXAel8NaNoHVK2xjpBJm8UAjHlBzmxK9tOhNMEWD+wlQUUjC3XEcbnI8qecDI7B1Qp
	 +CLx83cwlOztdjlskuu6H4fp0aSsURVoLTwafq7DLGmVfTuGkzu+KfpD6wgib1yq6wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bWmgHtdy;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48E8606F35A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C48E8606F35A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bWmgHtdy
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1729572eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794599672; x=1795204472; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q6K6qbv5w9n/vylWvvJqwRCndKz60wsHaPohkqjPYFo=;
        b=bWmgHtdy8Wdp6DbeQ6XGoQL7OdwmDwIMGUK+xj861dEzAuKt605s8ND/3l7at/orRl
         JzXFMIwJE0g7GMhUYsKWtlfPdfdnpjbnw5Xj0OBYLNaxSq/nonunD8i2pcMfpGlU0ACZ
         vZGqH+g3peKSUJjxNgm9dT5O2zbHPmgi7qCovOD2APwWT9zEcuWPy9W7kTJzxx4bksnX
         7QtDBEngQkDrNw6iyREn1S1THwvoXpSuXr6OkYcx+BY/FdeKzaXTZDTfSfekh2z239Fy
         5yayE+ysI1mvxPYR5HlqixgDNE3dvXrp604BKjzlZNd2QotfzOsGMX5q4TKOOxNDmMW0
         jrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599672; x=1795204472;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q6K6qbv5w9n/vylWvvJqwRCndKz60wsHaPohkqjPYFo=;
        b=mN0nzmV3bK9IApgB12O0yR5JqZ+p2GI4Wq3WNzPpwx0HuOFPkuTgqkDPK16Dznijwe
         CCau5hZaY+DSLSx/eSTKIo2M7TboFUS+jyz3LgDL32slBsMcKIRSH+tcHKzC4hhzd4YT
         HWhuXclV+BqEokakTx/VyKRY8PhdH4p+oKubGB4aOEXD6YPVXcRjQTSHCTjQmcr50Ca3
         xFXLMX/D23/wUNmMEF68zdvHFkpztSgHErfXGpOzlMhaI/+6hnBp9oByCWm4K3VEi6m9
         x1jev9dk791pyVql4zmGKI8PciTsTo2NYtpYFwuUmHRmR9BYYuSm3lte6qpIYhAeTfOT
         3bwA==
X-Forwarded-Encrypted: i=1; AL+hErFB3qr0HLyn2w7bO26/MWfVBmEVQqNhgQ6XDnDGBX5yA3/+Qpymep/7zyZ+UpZbbAjm0wE1N55X+DSSYrM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uHazkTOXE/7tmU5AMNTy5oAHKAkzj16N7qKfZ1WcLBjBcxLe7
	YSzFHGPgiOxY3gy65POfmsljFQ3e6smQCe0Sy1p3vJjmPmONSZHdt2GdRE2vizj+w/oBbwDnHZ5
	TVHBaXAW8RQ==
X-Received: from dycmp23.prod.google.com ([2002:a05:7301:717:b0:359:198a:8046])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:40c3:b0:370:1e50:a485
 with SMTP id 5a478bee46e88-379679df0a1mr3560113eec.37.1794599671646; Fri, 13
 Nov 2026 11:54:31 -0800 (PST)
Date: Fri, 13 Nov 2026 11:53:25 -0800
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
Message-ID: <20261113195335.2865725-21-irogers@google.com>
Subject: [PATCH v2 20/30] perf parse-events: Decode metric-id terms when
 adding events
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Metric events are parsed from an event string where the identifier from
the metric expression is passed as a metric-id term. As characters such
as '@' and ',' can't appear in a term value the metricgroup code encodes
them and, after parsing, walked the parsed evlist replacing each evsel's
metric_id with its decoded version.

Move the encoding and decoding to parse-events.c, adding
parse_events__encode_metric_id() for the metricgroup code, and store the
decoded metric-id on the evsel when it is created in __add_event(). This
avoids rewriting the metric_id of evsels after parsing, leaving
metricgroup with only the replacement of the evsel names of metric
events by friendlier versions of the metric-id. While moving the
decoding, fix the out of bounds check on the encoded character index
and return -EINVAL for a bad encoding.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/metricgroup.c  | 110 ++++++++-------------------------
 tools/perf/util/parse-events.c |  82 +++++++++++++++++++++++-
 tools/perf/util/parse-events.h |   1 +
 3 files changed, 108 insertions(+), 85 deletions(-)

diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index 9922445a6d15..08679392bf6d 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -610,57 +610,13 @@ int metricgroup__add_matching_metrics(struct evlist *evlist, bool system_wide)
 					    find_matching_metrics_cb, &args);
 }
 
-static const char *code_characters = ",-=@";
-
-static int encode_metric_id(struct strbuf *sb, const char *x)
-{
-	int ret = 0;
-
-	for (; *x; x++) {
-		const char *c = strchr(code_characters, *x);
-		if (c) {
-			ret = strbuf_addch(sb, '!');
-			if (ret)
-				break;
-
-			ret = strbuf_addch(sb, '0' + (c - code_characters));
-			if (ret)
-				break;
-		} else {
-			ret = strbuf_addch(sb, *x);
-			if (ret)
-				break;
-		}
-	}
-	return ret;
-}
-
-static int decode_metric_id(struct strbuf *sb, const char *x)
-{
-	const char *orig = x;
-	size_t i;
-	char c;
-	int ret;
-
-	for (; *x; x++) {
-		c = *x;
-		if (*x == '!') {
-			x++;
-			i = *x - '0';
-			if (i > strlen(code_characters)) {
-				pr_err("Bad metric-id encoding in: '%s'", orig);
-				return -1;
-			}
-			c = code_characters[i];
-		}
-		ret = strbuf_addch(sb, c);
-		if (ret)
-			return ret;
-	}
-	return 0;
-}
-
-static int decode_all_metric_ids(struct evlist *perf_evlist, const char *modifier)
+/*
+ * The metric events are parsed with a metric-id holding the identifier used in
+ * the metric expression. If the evsel name is just the parsed event, which
+ * contains the encoded metric-id, use the metric-id to give a more friendly
+ * display version.
+ */
+static int set_metric_event_names(struct evlist *perf_evlist, const char *modifier)
 {
 	struct evsel *ev;
 	struct strbuf sb = STRBUF_INIT;
@@ -668,51 +624,39 @@ static int decode_all_metric_ids(struct evlist *perf_evlist, const char *modifie
 	int ret = 0;
 
 	evlist__for_each_entry(perf_evlist, ev) {
-		if (!ev->metric_id)
+		bool has_slash = false;
+
+		if (!ev->metric_id || !strstr(ev->name, "metric-id="))
 			continue;
 
 		ret = strbuf_setlen(&sb, 0);
 		if (ret)
 			break;
 
-		ret = decode_metric_id(&sb, ev->metric_id);
+		ret = strbuf_addstr(&sb, ev->metric_id);
 		if (ret)
 			break;
 
-		free((char *)ev->metric_id);
-		ev->metric_id = strdup(sb.buf);
-		if (!ev->metric_id) {
-			ret = -ENOMEM;
-			break;
+		zfree(&ev->name);
+		for (cur = strchr(sb.buf, '@') ; cur; cur = strchr(++cur, '@')) {
+			*cur = '/';
+			has_slash = true;
 		}
-		/*
-		 * If the name is just the parsed event, use the metric-id to
-		 * give a more friendly display version.
-		 */
-		if (strstr(ev->name, "metric-id=")) {
-			bool has_slash = false;
-
-			zfree(&ev->name);
-			for (cur = strchr(sb.buf, '@') ; cur; cur = strchr(++cur, '@')) {
-				*cur = '/';
-				has_slash = true;
-			}
 
-			if (modifier) {
-				if (!has_slash && !strchr(sb.buf, ':')) {
-					ret = strbuf_addch(&sb, ':');
-					if (ret)
-						break;
-				}
-				ret = strbuf_addstr(&sb, modifier);
+		if (modifier) {
+			if (!has_slash && !strchr(sb.buf, ':')) {
+				ret = strbuf_addch(&sb, ':');
 				if (ret)
 					break;
 			}
-			ev->name = strdup(sb.buf);
-			if (!ev->name) {
-				ret = -ENOMEM;
+			ret = strbuf_addstr(&sb, modifier);
+			if (ret)
 				break;
-			}
+		}
+		ev->name = strdup(sb.buf);
+		if (!ev->name) {
+			ret = -ENOMEM;
+			break;
 		}
 	}
 	strbuf_release(&sb);
@@ -787,7 +731,7 @@ static int metricgroup__build_event_string(struct strbuf *events,
 			ret = strbuf_addstr(events, "/metric-id=");
 			RETURN_IF_NON_ZERO(ret);
 		}
-		ret = encode_metric_id(events, id);
+		ret = parse_events__encode_metric_id(events, id);
 		RETURN_IF_NON_ZERO(ret);
 		ret = strbuf_addstr(events, "/");
 		RETURN_IF_NON_ZERO(ret);
@@ -1514,7 +1458,7 @@ static int parse_ids(bool metric_no_merge, bool fake_pmu,
 		parse_events_error__print(&parse_error, events.buf);
 		goto err_out;
 	}
-	ret = decode_all_metric_ids(parsed_evlist, modifier);
+	ret = set_metric_event_names(parsed_evlist, modifier);
 	if (ret)
 		goto err_out;
 
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 159d847f44ce..a640344afcc8 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -171,6 +171,73 @@ static void fix_raw(struct parse_events_terms *config_terms, struct perf_pmu *pm
 	}
 }
 
+/*
+ * Characters that can't appear in a metric-id term value are encoded as '!'
+ * followed by the character's index in this string.
+ */
+static const char *metric_id_code_characters = ",-=@";
+
+/**
+ * parse_events__encode_metric_id - Encode a metric identifier as a metric-id
+ *                                  term value.
+ * @sb: The buffer the encoded identifier is appended to.
+ * @x: The metric identifier to encode.
+ *
+ * Return: 0 on success or the strbuf error.
+ */
+int parse_events__encode_metric_id(struct strbuf *sb, const char *x)
+{
+	int ret = 0;
+
+	for (; *x; x++) {
+		const char *c = strchr(metric_id_code_characters, *x);
+
+		if (c) {
+			ret = strbuf_addch(sb, '!');
+			if (ret)
+				break;
+
+			ret = strbuf_addch(sb, '0' + (c - metric_id_code_characters));
+			if (ret)
+				break;
+		} else {
+			ret = strbuf_addch(sb, *x);
+			if (ret)
+				break;
+		}
+	}
+	return ret;
+}
+
+/*
+ * Decode a metric-id term value encoded by parse_events__encode_metric_id()
+ * into @sb.
+ */
+static int parse_events__decode_metric_id(struct strbuf *sb, const char *x)
+{
+	const char *orig = x;
+	size_t i;
+	char c;
+	int ret;
+
+	for (; *x; x++) {
+		c = *x;
+		if (*x == '!') {
+			x++;
+			i = *x - '0';
+			if (i >= strlen(metric_id_code_characters)) {
+				pr_err("Bad metric-id encoding in: '%s'", orig);
+				return -EINVAL;
+			}
+			c = metric_id_code_characters[i];
+		}
+		ret = strbuf_addch(sb, c);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 static struct evsel *
 __add_event(struct list_head *list, int *idx,
 	    struct perf_event_attr *attr,
@@ -261,7 +328,12 @@ __add_event(struct list_head *list, int *idx,
 	}
 
 	if (metric_id) {
-		evsel->metric_id = strdup(metric_id);
+		struct strbuf sb = STRBUF_INIT;
+		int ret = parse_events__decode_metric_id(&sb, metric_id);
+
+		if (!ret)
+			evsel->metric_id = strdup(sb.buf);
+		strbuf_release(&sb);
 		if (!evsel->metric_id)
 			goto out_err;
 	}
@@ -645,6 +717,7 @@ int parse_events_add_breakpoint(struct parse_events_state *parse_state,
 	struct perf_event_attr attr;
 	LIST_HEAD(config_terms);
 	const char *name;
+	int ret;
 
 	memset(&attr, 0, sizeof(attr));
 	attr.bp_addr = addr;
@@ -675,8 +748,11 @@ int parse_events_add_breakpoint(struct parse_events_state *parse_state,
 
 	name = get_config_name(head_config);
 
-	return add_event(list, parse_state, &attr, name, /*mertic_id=*/NULL,
+	ret = add_event(list, parse_state, &attr, name, /*mertic_id=*/NULL,
 			&config_terms, /*alternate_hw_config=*/PERF_COUNT_HW_MAX);
+	/* Free the config terms if they weren't moved to an evsel. */
+	free_config_terms(&config_terms);
+	return ret;
 }
 
 static int check_type_val(struct parse_events_term *term,
@@ -1601,6 +1677,8 @@ static int parse_events_add_pmu(struct parse_events_state *parse_state,
 			    &config_terms, first_wildcard_match, term_cpu, alternate_hw_config);
 	perf_cpu_map__put(term_cpu);
 	if (!evsel) {
+		/* The config terms weren't moved to an evsel. */
+		free_config_terms(&config_terms);
 		parse_events_terms__exit(&parsed_terms);
 		return -ENOMEM;
 	}
diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
index 57eabdb97890..bec75c2d7b32 100644
--- a/tools/perf/util/parse-events.h
+++ b/tools/perf/util/parse-events.h
@@ -245,6 +245,7 @@ int parse_events_add_breakpoint(struct parse_events_state *parse_state,
 struct evsel *parse_events__add_event(int idx, struct perf_event_attr *attr,
 				      const char *name, const char *metric_id,
 				      struct perf_pmu *pmu);
+int parse_events__encode_metric_id(struct strbuf *sb, const char *x);
 
 int parse_events_multi_pmu_add(struct parse_events_state *parse_state,
 			       const char *event_name,
-- 
2.56.1.703.gf848ed807c-goog

