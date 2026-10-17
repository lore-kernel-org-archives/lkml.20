Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E560258EE9
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 18:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792263296; cv=none; b=jZ7y5EuKcSrOrBtQaOLek7EvFbdpltVLhQyJj6J8BPhE9YEGOW14unsaqZ9dGc7P3FoIni/Jf8er3Gv0ekeE7VttNAnyataPbCWKOji2yTz/IDVszeLsFaxyPmWwc3wjziUvFldaO/f9XZQvNi+5twa7vJt26gdK2VDw0QgNtEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792263296; c=relaxed/simple;
	bh=FtxOYhwfegkAWcwsWBkisGyTmJZq3wZEhZfE6lZEqH4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TQ5uNT+L4VvdVH6786McQVKXOJ/1zVO7G2fJo01iR0Mxj8PGdukwbBAIL+U3RPGmzZ0ORBxgsXYDZDNu1a4IX1Uz3OJxcFap9zZnSnUqKUsXeeR9YcKmCeRtNzoH3owdfglfxMJGxppF9q+VP/El4vZe9b32KF7mJiyvu6bPqwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YT04iux2; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YT04iux2"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so534533eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792263293; x=1792868093; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+8mpyEx8Bj4gf3c0mTRwsejfaqbHbW/M22Bk0FXWaQ=;
        b=YT04iux2LH8XhwFnKcJFsUEyRAY1kKb3S2BwNp+QilZu30k2MrZDEfWlQk72q/BhjL
         fLs/9oEqn4l2FaCQcGZLgI1OatQwgC8wmKlxPlKfhrAMSG+CZq7Jxraty6GARcbKWsst
         blrGnRuVeulsJZdqLCeGvYO1a4t6coapzLDER2jFnJ7FI7Mic9Bjde0l12RZWYydta2Y
         FN9QLQ6erAN+IkT8CK5iDJyij+JJeKThYMbrBIEXtqvj3a6p6hRX8u1Z6wklg4sAV/vn
         Q9TFG85lwphmqXBOFG4E6iMtiWddoNuaWc1Cnx7Z8Rd9lpcp7o0bSjb/Pa3xYQfx/A2o
         AsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792263293; x=1792868093;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+8mpyEx8Bj4gf3c0mTRwsejfaqbHbW/M22Bk0FXWaQ=;
        b=uuHggd9c3dwq33GiUefJ9bzuuh1IOwSQz+NUIed+0Rc4EmpXjUzURhehW+kVpzPxNQ
         j6JLDz7T3NWKJ3nPTkZfZOqB8niWdJe2HbLm7/pdVhudNppKeu0ZF39TmSIoPrhCrJ4r
         STAFptJXEu/B0fYhvsfig1MpoTJ7SH/7ehIVPNirpdTHNIiRvo4j0HeqTW13PAaIEz+U
         1TxNNKzEDRaX1FoEDJfwWuKttE1a8+m/QsAR9ZexseWvNBH94q7yKrlGTEjl6HqQvhnn
         cicDYBU62p79LIGQ7sOcS4KhNZE5Y9X8x7Q1uk6/wznhhIrIrdkmDjoPZC3d2r+gNDnh
         M5uA==
X-Forwarded-Encrypted: i=1; AKwUvBylYKndTYK3yoJXN+OLqb4bNBo3gsjvpgtngTg9j1V1FqMRjehJMme1E0Gx4sgIjRBbOde1s5VBHCscBXs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLs4wuB5d5r67/rMEIoRZ/13QVatvVT4knwZ5lmTcrBGF84LFrQ
	N+RrzU0v2ltXWBZhltcfm3xUcKUqiKppK0cyPgvpgpNNI3oUKw4HyQJbEQQY3HgCwI3GhqCE6RK
	5O7l7H3a38g==
X-Received: from dlep5-n2.prod.google.com ([2002:a05:701b:4585:20b0:182:f49e:1d74])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4354:b0:16c:4eef:a526
 with SMTP id a92af1059eb24-1851238bde2mr4856695c88.15.1792263293221; Sat, 17
 Oct 2026 11:54:53 -0700 (PDT)
Date: Sat, 17 Oct 2026 11:54:34 -0700
In-Reply-To: <20261017185442.2137623-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016213258.945737-1-irogers@google.com> <20261017185442.2137623-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261017185442.2137623-2-irogers@google.com>
Subject: [RFC PATCH v2 1/9] perf pmu: Add from_env parameter to perf_pmu__init()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, eranian@google.com, james.clark@linaro.org, 
	jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Add a boolean from_env field to struct perf_pmu initialized via
perf_pmu__init() to distinguish PMUs reconstructed from perf_env
headers from live host PMUs. Guard tp_pmu, hwmon_pmu, and drm_pmu
callbacks on !pmu->from_env so perf.data-derived PMUs do not access
host tracepoints or cast plain struct perf_pmu allocations via
container_of().

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/pmu-events.c |  4 ++--
 tools/perf/util/drm_pmu.c     |  2 +-
 tools/perf/util/hwmon_pmu.c   |  2 +-
 tools/perf/util/pmu.c         | 33 ++++++++++++++++++---------------
 tools/perf/util/pmu.h         |  4 +++-
 tools/perf/util/tool_pmu.c    |  2 +-
 6 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/tools/perf/tests/pmu-events.c b/tools/perf/tests/pmu-events.c
index f507ce39439a..cbcc01227a76 100644
--- a/tools/perf/tests/pmu-events.c
+++ b/tools/perf/tests/pmu-events.c
@@ -514,7 +514,7 @@ static int __test_core_pmu_event_aliases(const char *pmu_name, int *count)
 	if (!pmu)
 		return -1;
 
-	if (perf_pmu__init(pmu, PERF_PMU_TYPE_FAKE, pmu_name) != 0) {
+	if (perf_pmu__init(pmu, PERF_PMU_TYPE_FAKE, pmu_name, /*from_env=*/false) != 0) {
 		perf_pmu__delete(pmu);
 		return -1;
 	}
@@ -566,7 +566,7 @@ static int __test_uncore_pmu_event_aliases(struct perf_pmu_test_pmu *test_pmu)
 	if (!pmu)
 		return -1;
 
-	if (perf_pmu__init(pmu, PERF_PMU_TYPE_FAKE, test_pmu->pmu_name) != 0) {
+	if (perf_pmu__init(pmu, PERF_PMU_TYPE_FAKE, test_pmu->pmu_name, /*from_env=*/false) != 0) {
 		perf_pmu__delete(pmu);
 		return -1;
 	}
diff --git a/tools/perf/util/drm_pmu.c b/tools/perf/util/drm_pmu.c
index b8badae7015c..03764efb3342 100644
--- a/tools/perf/util/drm_pmu.c
+++ b/tools/perf/util/drm_pmu.c
@@ -116,7 +116,7 @@ static struct drm_pmu *add_drm_pmu(struct list_head *pmus, char *line, size_t li
 	if (!drm)
 		return NULL;
 
-	if (perf_pmu__init(&drm->pmu, type, name) != 0) {
+	if (perf_pmu__init(&drm->pmu, type, name, /*from_env=*/false) != 0) {
 		perf_pmu__delete(&drm->pmu);
 		return NULL;
 	}
diff --git a/tools/perf/util/hwmon_pmu.c b/tools/perf/util/hwmon_pmu.c
index 96aeb379e169..d9e41eb88b6d 100644
--- a/tools/perf/util/hwmon_pmu.c
+++ b/tools/perf/util/hwmon_pmu.c
@@ -365,7 +365,7 @@ struct perf_pmu *hwmon_pmu__new(struct list_head *pmus, const char *hwmon_dir,
 	if (!hwm)
 		return NULL;
 
-	if (perf_pmu__init(&hwm->pmu, type, buf) != 0) {
+	if (perf_pmu__init(&hwm->pmu, type, buf, /*from_env=*/false) != 0) {
 		perf_pmu__delete(&hwm->pmu);
 		return NULL;
 	}
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 01753d5c69d1..bb2e79802def 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1188,9 +1188,10 @@ static bool aliases__equal(long key1, long key2, void *ctx __maybe_unused)
 	return strcasecmp((const char *)key1, (const char *)key2) == 0;
 }
 
-int perf_pmu__init(struct perf_pmu *pmu, __u32 type, const char *name)
+int perf_pmu__init(struct perf_pmu *pmu, __u32 type, const char *name, bool from_env)
 {
 	pmu->type = type;
+	pmu->from_env = from_env;
 	INIT_LIST_HEAD(&pmu->format);
 	INIT_LIST_HEAD(&pmu->caps);
 
@@ -1240,7 +1241,7 @@ struct perf_pmu *perf_pmu__lookup(struct list_head *pmus, int dirfd, const char
 	if (!pmu)
 		return NULL;
 
-	if (perf_pmu__init(pmu, PERF_PMU_TYPE_FAKE, name) != 0) {
+	if (perf_pmu__init(pmu, PERF_PMU_TYPE_FAKE, name, /*from_env=*/false) != 0) {
 		perf_pmu__delete(pmu);
 		return NULL;
 	}
@@ -2118,11 +2119,11 @@ bool perf_pmu__have_event(struct perf_pmu *pmu, const char *name)
 	if (perf_pmu__is_tool(pmu) && tool_pmu__skip_event(name))
 		return false;
 	if (perf_pmu__is_tracepoint(pmu))
-		return tp_pmu__have_event(pmu, name);
+		return pmu->from_env ? false : tp_pmu__have_event(pmu, name);
 	if (perf_pmu__is_hwmon(pmu))
-		return hwmon_pmu__have_event(pmu, name);
+		return pmu->from_env ? false : hwmon_pmu__have_event(pmu, name);
 	if (perf_pmu__is_drm(pmu))
-		return drm_pmu__have_event(pmu, name);
+		return pmu->from_env ? false : drm_pmu__have_event(pmu, name);
 	if (perf_pmu__find_alias(pmu, name, /*load=*/ true) != NULL)
 		return true;
 	if (pmu->cpu_aliases_added || (!pmu->events_table && !pmu->is_core))
@@ -2139,11 +2140,11 @@ size_t perf_pmu__num_events(struct perf_pmu *pmu)
 	size_t nr;
 
 	if (perf_pmu__is_tracepoint(pmu))
-		return tp_pmu__num_events(pmu);
+		return pmu->from_env ? 0 : tp_pmu__num_events(pmu);
 	if (perf_pmu__is_hwmon(pmu))
-		return hwmon_pmu__num_events(pmu);
+		return pmu->from_env ? 0 : hwmon_pmu__num_events(pmu);
 	if (perf_pmu__is_drm(pmu))
-		return drm_pmu__num_events(pmu);
+		return pmu->from_env ? 0 : drm_pmu__num_events(pmu);
 
 	pmu_aliases_parse(pmu);
 	nr = pmu->sysfs_aliases + pmu->sys_json_aliases;
@@ -2275,11 +2276,11 @@ int perf_pmu__for_each_event(struct perf_pmu *pmu, bool skip_duplicate_pmus,
 	size_t size_rem;
 
 	if (perf_pmu__is_tracepoint(pmu))
-		return tp_pmu__for_each_event(pmu, state, cb);
+		return pmu->from_env ? 0 : tp_pmu__for_each_event(pmu, state, cb);
 	if (perf_pmu__is_hwmon(pmu))
-		return hwmon_pmu__for_each_event(pmu, state, cb);
+		return pmu->from_env ? 0 : hwmon_pmu__for_each_event(pmu, state, cb);
 	if (perf_pmu__is_drm(pmu))
-		return drm_pmu__for_each_event(pmu, state, cb);
+		return pmu->from_env ? 0 : drm_pmu__for_each_event(pmu, state, cb);
 
 	pmu_aliases_parse(pmu);
 	pmu_add_cpu_aliases(pmu);
@@ -2784,10 +2785,12 @@ void perf_pmu__delete(struct perf_pmu *pmu)
 	if (!pmu)
 		return;
 
-	if (perf_pmu__is_hwmon(pmu))
-		hwmon_pmu__exit(pmu);
-	else if (perf_pmu__is_drm(pmu))
-		drm_pmu__exit(pmu);
+	if (!pmu->from_env) {
+		if (perf_pmu__is_hwmon(pmu))
+			hwmon_pmu__exit(pmu);
+		else if (perf_pmu__is_drm(pmu))
+			drm_pmu__exit(pmu);
+	}
 
 	perf_pmu__del_formats(&pmu->format);
 	perf_pmu__del_aliases(pmu);
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 2c8916ad073e..44212f6361c7 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -161,6 +161,8 @@ struct perf_pmu {
 	uint32_t cpu_common_json_aliases;
 	/** @sysfs_aliases_loaded: Are sysfs aliases loaded from disk? */
 	bool sysfs_aliases_loaded;
+	/** @from_env: Was the PMU reconstructed from a perf_env header? */
+	bool from_env;
 	/**
 	 * @cpu_aliases_added: Have all json events table entries for the PMU
 	 * been added?
@@ -345,7 +347,7 @@ int perf_pmu__pathname_scnprintf(char *buf, size_t size,
 int perf_pmu__event_source_devices_fd(void);
 int perf_pmu__pathname_fd(int dirfd, const char *pmu_name, const char *filename, int flags);
 
-int perf_pmu__init(struct perf_pmu *pmu, __u32 type, const char *name);
+int perf_pmu__init(struct perf_pmu *pmu, __u32 type, const char *name, bool from_env);
 struct perf_pmu *perf_pmu__lookup(struct list_head *pmus, int dirfd, const char *lookup_name,
 				  bool eager_load);
 struct perf_pmu *perf_pmu__create_placeholder_core_pmu(struct list_head *core_pmus);
diff --git a/tools/perf/util/tool_pmu.c b/tools/perf/util/tool_pmu.c
index d2f7591747d9..6054d5d5aece 100644
--- a/tools/perf/util/tool_pmu.c
+++ b/tools/perf/util/tool_pmu.c
@@ -714,7 +714,7 @@ struct perf_pmu *tool_pmu__new(void)
 	if (!tool)
 		return NULL;
 
-	if (perf_pmu__init(tool, PERF_PMU_TYPE_TOOL, "tool") != 0) {
+	if (perf_pmu__init(tool, PERF_PMU_TYPE_TOOL, "tool", /*from_env=*/false) != 0) {
 		perf_pmu__delete(tool);
 		return NULL;
 	}
-- 
2.56.0.212.g129ede20d9-goog

