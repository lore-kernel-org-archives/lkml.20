Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599770;
	b=hfcPgR9LOBlh1yIAgKwSRBO5WRxCgusixiloneSXrDX5SVVVBylCcb+TIHAR+8nctonJ
	 saoyJRrv4dgFdm+ruQVoTqmpGlk86Hv2CrIVO872P+mdKq7lv5Szc60qzYeFFhhNDgBM9
	 qDXHVZtU7VTC5huv2++MvnUJec0FANH3c69I9qEhIDybXkG16DjNUZijsLOc9kVjR/Ujx
	 vxc1miyu/4KgEmiLDUZHnZy6Q/DrldDaUCpIFShEsscy3Z1KL1tqXKZqbOt50J0hL6ZA5
	 CNuZS8RW6BPOtMguATVlgB+Yk2tWx8oUERtoNHFH0ojMUG3S6Wcd0yClrxYevGC3gxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0Al38revx94Zg4mkCOYZPsMpA/f/gH87lJ3C9EuAwzk=;
	b=PIu5gUEHHL5YbRMmJXMZTSGnD2vOHjLm2Ob/ClnRyE/PlWrcCEPvUDiBalJL2VpHxK+m
	 rs6XgilFTvAyVr1ewLVy65H2wMYBtqnwLXyb5k3R+1INdG2TG41/u7GRGM2qBeh+8GAfY
	 CeL/qFFyyz9JWsI51qnwENyEsxF+HF+28z12B7pH3lxYKkUsSJV9orqNMAEQa1tZJvOg9
	 uWZI9yN7EeqBe9xFXjCt6lHOmxDkU3enTBL1EJuYOLle/2O0V3wMm8hWteanQwojJgk30
	 fM3sygaXsqXLkfMtGzhpcbZ4sNqN3EIQ7G8s91mdsVPJVF7fb7cazyzjyQfXh+XyijQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="T2jrca/e";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7C7606F342
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B7C7606F342
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T2jrca/e
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1731704eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794599769; x=1795204569; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Al38revx94Zg4mkCOYZPsMpA/f/gH87lJ3C9EuAwzk=;
        b=T2jrca/ejmD9DlGXm3Jl2D1Qp+MxEYFxae2ILWuLQn5Q4Jn4sMZcIiwsngdgMemR3R
         pdgxDEBPcWp/Lz/OzhC5uYRyc7lwmqn6cTqlY10EL/pyzVjOASX66ffKoD1sR++LVxnP
         djB931rEUC+r831StMd1O8Pu4uqUuzv+wDAKDO7wmg0scjaijXaXJHp6kVjxUmnRZLC+
         c9GhohhawiL+svbXR276R4YCZy39mdetjEycEhjbX/DDRpSjBDfM/JusTMJuWzg6Z5gY
         toTHpllWlon0WwAjw8FxHmIe+290zNnYjjM56z7r1dJqK5H+rBmNRlXhUlGdMeQIDWfH
         r1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599769; x=1795204569;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Al38revx94Zg4mkCOYZPsMpA/f/gH87lJ3C9EuAwzk=;
        b=L/mOXLktgy7+UaUAEFRmoCrsYcBQfsrgeIsyehQDgIfdN7K6Pi2ieYeIqzOYigwU+R
         pRJ82yJJVOHZ3APa6Bz9S9JCk83BlxnjJhs/An8oBKZvOwduPPOjLYzTd3VJ0yckltZ3
         wmxrgQkCMDqLS1Vv5Rh2Zhz29yqKMpY26xzTEYEMwutVHTy5omEB2qNDgsc7hhh+C+42
         +aX/JijMzXgV9o1hp6NWeamtxhWM6oTCfm5EP0bEAF4nI2citdU+xwjFsYdNfqNkxjWf
         zmEWDMpGtAfFXRsjI37hOVDHVJ1L5f8o2aXdAcuk5/Zj7EPtvd94csjEMSY7TKDDRNlW
         EU2A==
X-Forwarded-Encrypted: i=1; AL+hErHEfHcxXFacEqUprvJQwEXSJndjv9dXEG6hFhtbhz+rOqJQctrYaP86bTKExlGdvnHmtTxhbYtxmJZ+Mxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9boNXNSerhGEKxNq6lrQV6ui1bDkQqxXv+Yso0sLXem5YFge0F
	WPCfrCWOw20PgIcYD8KAU3ahcff5/NIfO0FFCyusRybrby6crHzjskLkLatQmSb/zmfOLkJuLOK
	mvNK+XZE7GA==
X-Received: from dybrt9.prod.google.com ([2002:a05:7301:4709:b0:369:f2bd:5ab6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:4003:b0:369:9af5:7bc9
 with SMTP id 5a478bee46e88-3796696128emr2979778eec.23.1794599768789; Fri, 13
 Nov 2026 11:56:08 -0800 (PST)
Date: Fri, 13 Nov 2026 11:55:47 -0800
In-Reply-To: <20261113195601.2872738-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113195601.2872738-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113195601.2872738-3-irogers@google.com>
Subject: [PATCH v2 02/16] perf mem-events: Expose PMU init and name formatting helpers
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Export perf_pmu__mem_events_init_pmu() and perf_pmu__mem_events_name()
so callers can initialize and format per-PMU memory profiling events.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/mem-events.c | 12 ++++++------
 tools/perf/util/mem-events.h | 20 ++++++++++++++++++++
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
index 62543df0dca1..932efcfd82f7 100644
--- a/tools/perf/util/mem-events.c
+++ b/tools/perf/util/mem-events.c
@@ -82,12 +82,12 @@ int perf_pmu__mem_events_num_mem_pmus(struct perf_pmu *pmu)
 	return num;
 }
 
-static const char *perf_pmu__mem_events_name(struct perf_pmu *pmu, int i,
-					     char *buf, size_t buf_size)
+const char *perf_pmu__mem_events_name(struct perf_pmu *pmu, int i,
+				      char *buf, size_t buf_size)
 {
 	struct perf_mem_event *e;
 
-	if (i >= PERF_MEM_EVENTS__MAX || !pmu)
+	if (i >= PERF_MEM_EVENTS__MAX || !pmu || !pmu->mem_events)
 		return NULL;
 
 	e = &pmu->mem_events[i];
@@ -196,13 +196,13 @@ static bool perf_pmu__mem_events_supported(const char *mnt, struct perf_pmu *pmu
 	return !stat(path, &st);
 }
 
-static int __perf_pmu__mem_events_init(struct perf_pmu *pmu)
+int perf_pmu__mem_events_init_pmu(struct perf_pmu *pmu)
 {
 	const char *mnt = sysfs__mount();
 	bool found = false;
 	int j;
 
-	if (!mnt)
+	if (!mnt || !pmu || pmu->from_env || !pmu->mem_events)
 		return -ENOENT;
 
 	for (j = 0; j < PERF_MEM_EVENTS__MAX; j++) {
@@ -228,7 +228,7 @@ int perf_pmu__mem_events_init(void)
 	struct perf_pmu *pmu = NULL;
 
 	while ((pmu = perf_pmus__scan_mem(pmu)) != NULL) {
-		if (__perf_pmu__mem_events_init(pmu))
+		if (perf_pmu__mem_events_init_pmu(pmu))
 			return -ENOENT;
 	}
 
diff --git a/tools/perf/util/mem-events.h b/tools/perf/util/mem-events.h
index 38b14c03392c..f2e622a048c8 100644
--- a/tools/perf/util/mem-events.h
+++ b/tools/perf/util/mem-events.h
@@ -31,8 +31,28 @@ extern struct perf_mem_event perf_mem_events[PERF_MEM_EVENTS__MAX];
 extern bool perf_mem_record[PERF_MEM_EVENTS__MAX];
 
 int perf_pmu__mem_events_parse(struct perf_pmu *pmu, const char *str);
+
+/**
+ * perf_pmu__mem_events_init_pmu() - Initialize memory event table for @pmu.
+ * @pmu: The PMU to check for memory event support.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int perf_pmu__mem_events_init_pmu(struct perf_pmu *pmu);
 int perf_pmu__mem_events_init(void);
 
+/**
+ * perf_pmu__mem_events_name() - Format the event string for a memory event.
+ * @pmu: The PMU providing the memory event.
+ * @i: Memory event index (PERF_MEM_EVENTS__LOAD, etc.).
+ * @buf: Output buffer to format the event string into.
+ * @buf_size: Size of @buf in bytes.
+ *
+ * Return: Pointer to @buf on success, or NULL if invalid/unsupported.
+ */
+const char *perf_pmu__mem_events_name(struct perf_pmu *pmu, int i,
+				      char *buf, size_t buf_size);
+
 struct perf_mem_event *perf_pmu__mem_events_ptr(struct perf_pmu *pmu, int i);
 struct perf_pmu *perf_mem_events_find_pmu(void);
 int perf_pmu__mem_events_num_mem_pmus(struct perf_pmu *pmu);
-- 
2.56.1.703.gf848ed807c-goog

