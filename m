Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606598;
	b=Arn40gCOmAzpbT3iTa3hvETY0onfkgdiDRQ+HTk6HQ7NxbICrfxTNKJHWtVcQ4/prx2C
	 mRanGJ8Q947UgDKNqTwG29lLZTl7QGcSpJt+CgVQmWhcmAcyXGbldmDMXkhhM8rWjZnKJ
	 E7+rl1sHgCOEXxeEG9EV4kT9ysACy7cb6qTJ0eVGVJ+GOOzKaPr74NilWkZqyQN7qc+6x
	 mpXTfIehHtKow5oGfF+49d4bFiy7Y3lCijKgjBHeNGA7zfP+wiO793OtPD1qa3WOXvtVt
	 pbADScUyf902dOzbChpcTllY0N01s8kzxQLWQxrOC+/fysjuMqDcXAXrTcN8zWcOynA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pA1qyfllAf+v5Ejm5ZH1kCG25GG0E8C1nb+645hahNw=;
	b=VzKajwEgN/+Us9aR6x5kZRRWP8QzXB6R8l333rJG2d4VuI+MmW4hi1Qem7n+SFo720lM
	 I+gLA2MQbyU/PPpUCG0AbmQN+9RVYnDuuSK1ZcEg300aF2OsuL3JGWj2vHFj9Uq5ummx8
	 jkUnnVTkq3g16sMeaa91KiIqo+HvG1ADzhpzcxf1n3D3ZpHgwnMyFQT9Jbv3PtbpJZFOo
	 Oj0OXUnU75P3LHW++vc0I7cV/eVVrP2D97M+jc8f1S3eqARv/tB7ijAvg2cnUPzG+RV9L
	 LSxxFwO/gCRM0oqmqI+SXuPPC7A5MBsjaloDhEsMxDnqTXifjFGeCwsMESCMiICSo8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e8UcjoJf;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DAC606C980
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3DAC606C980
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e8UcjoJf
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so235215c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794606597; x=1795211397; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pA1qyfllAf+v5Ejm5ZH1kCG25GG0E8C1nb+645hahNw=;
        b=e8UcjoJfaoBS2Y1Rk5uigCUaiMmJ/91+zQ/nWxxJDRnYzOj7+ncOaTTPzXqoAWhOFJ
         w4E057TaRgnwC32m4eVeN3Mu79e+a0BGIQeXmwktZBfy2pV929E9uysSB/2kZ3Kb5Of0
         R1eSe9DOLPTlW8wLymVXC4Uuv0z4IlIT6EHinNerZGhAMsgnSu4qG/HLOnwII1dWkZGN
         HrE2a7+qutkPGQntR2vDKzyCn8zDOnndDhAOaDwjqmEjGcAjJed4YBCPDP/GNYOlIPZV
         e7rECcKf1n6ix8nMzLHorJMajHN8HIaQZF+VFHhKrITlS14Tau5uOJLwfu2zltCMdS35
         aSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606597; x=1795211397;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pA1qyfllAf+v5Ejm5ZH1kCG25GG0E8C1nb+645hahNw=;
        b=1FQ7dFzpLuZOnCd4j2adpkFTk4ofol30lN3nnKL23nHPRs8KYBf/i867ygGpzeYxSv
         amxbSL/3L4Z19rpw/kUBrtZOG2dlIw38brMab3+fh4cmI5dmk6jSOuAcD5/XKcn6QQPi
         3wExuLyT4lvy/WUPxOyWjR4s0Raf54kHQETr8kw4l1QM7V8f5NiQCiEcuD9P1ThVomZy
         Zr/m4rMnjc0Q672b9mtEJEhqOqa2lnh42OqVkWGV+JvnwgCHLS5IgpPsYCwhJdWjyq81
         3wTHJgyCq3wCv4nqe6gTI/llWPIprFwZEqJUQgdX2XvOBXdj/g7X63UN1EdGgZo1jKz5
         eJoA==
X-Forwarded-Encrypted: i=1; AL+hErE7yXGuU+MFtlEJKXBYU4eZqyZ+QOPY5iigE6+B5fjlVFOcpjKVRsCkpy7zWB0ZnAl7Id2rCvP3T9HLPU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b0WmNPVxB9GcmXxpFmuQzdp2lXgvIWeH7LqsCf0Iw2ThbnnOH
	YbO1sCmB1Pgb2NU1Neo+u4cFYsCT8FOER7sWLs/6L+Fo5w5BULqAAPztJ1WGsFWl8y8TJ4bKAMK
	FGQx5m/iBiA==
X-Received: from dlef5.prod.google.com ([2002:a05:7022:b0c5:b0:1b2:3e9d:97df])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea56:10b0:1b3:aceb:b8dd
 with SMTP id a92af1059eb24-1b50317aa00mr3754089c88.38.1794606596491; Fri, 13
 Nov 2026 13:49:56 -0800 (PST)
Date: Fri, 13 Nov 2026 13:48:41 -0800
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
Message-ID: <20261113214850.3329699-18-irogers@google.com>
Subject: [PATCH v1 17/26] perf hwmon_pmu: Use generic hashmap for hwmon events
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Convert hwmon_pmu::events in util/hwmon_pmu.c to
DECLARE_HASHMAP(hwmon_pmu_events_map, long, struct hwmon_pmu_event_value *)
and use hashmap__for_each{,_safe}().

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/hwmon_pmu.c | 57 +++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 31 deletions(-)

diff --git a/tools/perf/util/hwmon_pmu.c b/tools/perf/util/hwmon_pmu.c
index c150fc0d7bd3..95049f5fead3 100644
--- a/tools/perf/util/hwmon_pmu.c
+++ b/tools/perf/util/hwmon_pmu.c
@@ -101,9 +101,12 @@ static const char *const hwmon_units[HWMON_TYPE_MAX] = {
 	"'C",  /* temp */
 };
 
+struct hwmon_pmu_event_value;
+DECLARE_HASHMAP(hwmon_pmu_events_map, long, struct hwmon_pmu_event_value *);
+
 struct hwmon_pmu {
 	struct perf_pmu pmu;
-	struct hashmap events;
+	struct hwmon_pmu_events_map events;
 	char *hwmon_dir;
 };
 
@@ -237,8 +240,8 @@ static void fix_name(char *p)
 static int hwmon_pmu__read_events(struct hwmon_pmu *pmu)
 {
 	int err = 0;
-	struct hashmap_entry *cur, *tmp;
-	size_t bkt;
+	long key_val;
+	struct hwmon_pmu_event_value *value;
 	struct io_dirent64 *ent;
 	struct io_dir dir;
 
@@ -257,7 +260,6 @@ static int hwmon_pmu__read_events(struct hwmon_pmu *pmu)
 		enum hwmon_item item;
 		bool alarm;
 		union hwmon_pmu_event_key key = { .type_and_num = 0 };
-		struct hwmon_pmu_event_value *value;
 
 		if (ent->d_type != DT_REG)
 			continue;
@@ -324,16 +326,15 @@ static int hwmon_pmu__read_events(struct hwmon_pmu *pmu)
 	if (hashmap__size(&pmu->events) == 0)
 		pr_debug2("hwmon_pmu: %s has no events\n", pmu->pmu.name);
 
-	hashmap__for_each_entry_safe((&pmu->events), cur, tmp, bkt) {
+	hashmap__for_each_safe(&pmu->events, key_val, value) {
 		union hwmon_pmu_event_key key = {
-			.type_and_num = cur->key,
+			.type_and_num = key_val,
 		};
-		struct hwmon_pmu_event_value *value = cur->pvalue;
 
 		if (!test_bit(HWMON_ITEM_INPUT, value->items)) {
 			pr_debug("hwmon_pmu: %s removing event '%s%d' that has no input file\n",
 				pmu->pmu.name, hwmon_type_strs[key.type], key.num);
-			hashmap__delete(&pmu->events, key.type_and_num, &key, &value);
+			hashmap__delete(&pmu->events, key_val, NULL, NULL);
 			zfree(&value->label);
 			zfree(&value->name);
 			free(value);
@@ -397,12 +398,10 @@ struct perf_pmu *hwmon_pmu__new(struct list_head *pmus, const char *hwmon_dir,
 void hwmon_pmu__exit(struct perf_pmu *pmu)
 {
 	struct hwmon_pmu *hwm = container_of(pmu, struct hwmon_pmu, pmu);
-	struct hashmap_entry *cur, *tmp;
-	size_t bkt;
-
-	hashmap__for_each_entry_safe((&hwm->events), cur, tmp, bkt) {
-		struct hwmon_pmu_event_value *value = cur->pvalue;
+	long key;
+	struct hwmon_pmu_event_value *value;
 
+	hashmap__for_each_safe(&hwm->events, key, value) {
 		zfree(&value->label);
 		zfree(&value->name);
 		free(value);
@@ -463,13 +462,13 @@ static size_t hwmon_pmu__describe_items(struct hwmon_pmu *hwm, char *out_buf, si
 int hwmon_pmu__for_each_event(struct perf_pmu *pmu, void *state, pmu_event_callback cb)
 {
 	struct hwmon_pmu *hwm = container_of(pmu, struct hwmon_pmu, pmu);
-	struct hashmap_entry *cur;
-	size_t bkt;
+	long key_val;
+	struct hwmon_pmu_event_value *value;
 
 	if (hwmon_pmu__read_events(hwm))
 		return false;
 
-	hashmap__for_each_entry((&hwm->events), cur, bkt) {
+	hashmap__for_each(&hwm->events, key_val, value) {
 		static const char *const hwmon_scale_units[HWMON_TYPE_MAX] = {
 			NULL,
 			"0.001V", /* cpu */
@@ -500,9 +499,8 @@ int hwmon_pmu__for_each_event(struct perf_pmu *pmu, void *state, pmu_event_callb
 		char desc_buf[256];
 		char encoding_buf[128];
 		union hwmon_pmu_event_key key = {
-			.type_and_num = cur->key,
+			.type_and_num = key_val,
 		};
-		struct hwmon_pmu_event_value *value = cur->pvalue;
 		struct pmu_event_info info = {
 			.pmu = pmu,
 			.name = value->name,
@@ -537,7 +535,7 @@ int hwmon_pmu__for_each_event(struct perf_pmu *pmu, void *state, pmu_event_callb
 						key, value->alarm_items, /*is_alarm=*/true);
 
 		snprintf(encoding_buf, sizeof(encoding_buf), "%s/config=0x%lx/",
-			 pmu->name, cur->key);
+			 pmu->name, key_val);
 
 		ret = cb(state, &info);
 		if (ret)
@@ -560,8 +558,8 @@ bool hwmon_pmu__have_event(struct perf_pmu *pmu, const char *name)
 	enum hwmon_type type;
 	int number;
 	union hwmon_pmu_event_key key = { .type_and_num = 0 };
-	struct hashmap_entry *cur;
-	size_t bkt;
+	long key_val;
+	struct hwmon_pmu_event_value *value;
 
 	if (!parse_hwmon_filename(name, &type, &number, /*item=*/NULL, /*is_alarm=*/NULL))
 		return false;
@@ -571,15 +569,13 @@ bool hwmon_pmu__have_event(struct perf_pmu *pmu, const char *name)
 
 	key.type = type;
 	key.num = number;
-	if (hashmap__find(&hwm->events, key.type_and_num, /*value=*/NULL))
+	if (hashmap__find(&hwm->events, key.type_and_num, /*value_ptr=*/NULL))
 		return true;
 	if (key.num != -1)
 		return false;
 	/* Item is of form <type>_ which means we should match <type>_<label>. */
-	hashmap__for_each_entry((&hwm->events), cur, bkt) {
-		struct hwmon_pmu_event_value *value = cur->pvalue;
-
-		key.type_and_num = cur->key;
+	hashmap__for_each(&hwm->events, key_val, value) {
+		key.type_and_num = key_val;
 		if (key.type == type && value->name && !strcasecmp(name, value->name))
 			return true;
 	}
@@ -602,15 +598,14 @@ static int hwmon_pmu__config_term(const struct hwmon_pmu *hwm,
 				 * Item is of form <type>_ which means we should
 				 * match <type>_<label>.
 				 */
-				struct hashmap_entry *cur;
-				size_t bkt;
+				long key_val;
+				struct hwmon_pmu_event_value *value;
 
 				attr->config = 0;
-				hashmap__for_each_entry((&hwm->events), cur, bkt) {
+				hashmap__for_each(&hwm->events, key_val, value) {
 					union hwmon_pmu_event_key key = {
-						.type_and_num = cur->key,
+						.type_and_num = key_val,
 					};
-					struct hwmon_pmu_event_value *value = cur->pvalue;
 
 					if (key.type == type && value->name &&
 					    !strcasecmp(term->config, value->name)) {
-- 
2.56.1.703.gf848ed807c-goog

