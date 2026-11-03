Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749591;
	b=bvUSst/gJJUxbWlSmNxiTX5laWujjX8MqAg7bmKlQuU7LNqlOXXSErW+lMb6g6zT58/8
	 5lGBgm61ByLXXi61h5PqxoyjHARg/OmZBalyMA/WJmkQBqnfkJylUUFesmLkaeYMTtjLa
	 MLDDBNcux974PA4SSWUmBcfBKnWYLMkJSPSerOI9sZ9nvYe3ReoeUJxQEfWzo1p7JOSuk
	 hMhE4eEZ1G1MxbtTvrRWWgLI8FaPTJGvr3lWszaIwVP0kT55E3EpyJ8lL4jQXAz6n4P/m
	 JqVGfyjFXWIjbL4PT3HzNwRLcrJzcEg4Q+KLBccIgwJV/eZvuu5oKqMfSdvNEaowLbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=TD6ocq78j6FmHwA4oAQWATAAfzTfiKTMVlIXUEJWlfE=;
	b=V2KUmRmO6yQsGHS7F8a2UJASIrhlNkbvF8sT1F1PQ7s3XFafaTgX4QxtGTs5zgXIIHZz
	 tEYRHQEM78JlEMOiZXzr6BIagaxAqMZvrnqAl0nDLRxdXUDE6rcROzTKZ4ccSjJL+2h1Y
	 NO8QqHT9ZeV5D5N5/3Oim3KJThfAEd1M2ePRKVwjQCyI3j2mls1zhVKUrH9pYNvz1l33H
	 MzYMu3X85nuzbzdnw9SkU+P/3OxtIz1m3Gy+KunnPFulnj07tyLWt5UzyY2IDDlDoj7q8
	 CV5IEGO6BMtSHKo7PAErkyRt1Obkgl+aEB3hh36VmPSH5gfrVNjLtvwz7f8hmFyQDOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="G/fmp7n/";
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD87B6083639
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD87B6083639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G/fmp7n/
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36c9e87d262so123975eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749590; x=1794354390; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TD6ocq78j6FmHwA4oAQWATAAfzTfiKTMVlIXUEJWlfE=;
        b=G/fmp7n/nqsY8lXwPJJumjISsxddGlk/b/On9TtTPC89WBLbXRGyvOXYJBcSbyKbaW
         nB8keX2fQDUjp/1acWkT4z2xekhG8H/UUD8k5v97ow5eONvKdS6lHwzLxfTJzjH3xFQl
         C0dFHKYTGV1KiLR5GqtFykAdsfVwQ+AxQnYwHzx6DdAjsj8rd8PJW38kunRI5OKMgdoQ
         ZRcoZfo4RtgH7DikwyF9r2HIsmYreEgrlMAD9IuFpYrhcE6NywwNYCErUT7P/ao58qhd
         oB6XwtI3f2Kv4l0ErzhrTiytWlPWPwOYSBtSEYhrD6xDIp44lstJkGF5BoEIAhKcSh+/
         ErWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749590; x=1794354390;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TD6ocq78j6FmHwA4oAQWATAAfzTfiKTMVlIXUEJWlfE=;
        b=O4geh1PnHnVE7n65NQBW5Md/FJ7HGtuBU52SJLCiwMypj4wZ3kKz+1fF9t1InljKEJ
         TcTZJu+ojacU1Z6sh1EiKHlnBL9I3xrQpKLWKQCh/WYPgRtmXiV2qNSwPQMjnvjafrNB
         1/QHqNFS7LaDhauqrNv6bwuG1r8yNH6WEodQPUfsruraFMkPR5FBR7jCyYCVPnHMpfvv
         NFnWqA502Hu8b54pQWb2V5A+4Ku9ApD0CbDs7yI4IBF0x0qeOzQgGftSBjzhTkXX38LV
         lgd19ubhzBlF3mIYHK5Fpj6mQJH7hNl0V18Jp4bDVX2B9OwVZ9qAZG8V3WKuXO9ILQN6
         dKhQ==
X-Gm-Message-State: APuU4Z/X5URbQfKl/SgOjfKT5qMeS80QbZqiNbWoS+OtUkAlbXC0RkM8
	KSZEQ2ftp6rB3QJiZ5K3P668GDxx1pYrOqHIAhalWggW+JC2IVSGUcWH5617no9hGtNCCe4aFy6
	XxKcnzYrW7w==
X-Received: from dybvv22.prod.google.com ([2002:a05:7300:f896:b0:358:2c8e:30e3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:20c3:10b0:36a:12c4:8bd6
 with SMTP id 5a478bee46e88-36a423ea9ccmr21916211eec.22.1793749589432; Tue, 03
 Nov 2026 15:46:29 -0800 (PST)
Date: Tue,  3 Nov 2026 15:44:47 -0800
In-Reply-To: <20261103234502.1008382-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103234502.1008382-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103234502.1008382-32-irogers@google.com>
Subject: [PATCH v1 31/41] perf pmu: Probe privilege exclusion modifiers
From: Ian Rogers <irogers@google.com>
To: linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Kan Liang <kan.liang@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, John Garry <john.garry@linux.dev>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@arm.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Sandipan Das <sandipan.das@amd.com>, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Extend perf_pmu__probe() with test_exclude_flag() to probe whether
exclude_user, exclude_kernel, exclude_hv, exclude_idle, exclude_host,
and exclude_guest are accepted by perf_event_open() on the PMU, storing
the results in struct perf_pmu::probed.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/pmu.c | 73 +++++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/pmu.h | 12 +++++++
 2 files changed, 85 insertions(+)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 1c55265be246..a1e27e678ccf 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -3118,6 +3118,65 @@ static bool try_open_attr_variants(struct perf_event_attr *attr,
 	return false;
 }
 
+enum probe_exclude_flag {
+	PROBE_EXCLUDE_USER,
+	PROBE_EXCLUDE_KERNEL,
+	PROBE_EXCLUDE_HV,
+	PROBE_EXCLUDE_IDLE,
+	PROBE_EXCLUDE_HOST,
+	PROBE_EXCLUDE_GUEST,
+};
+
+/* Test whether @which privilege exclusion modifier is accepted by perf_event_open(). */
+static bool test_exclude_flag(const struct perf_event_attr *base_attr,
+			      pid_t pid, int cpu, unsigned long flags,
+			      enum probe_exclude_flag which)
+{
+	struct perf_event_attr attr = *base_attr;
+	int fd;
+
+	switch (which) {
+	case PROBE_EXCLUDE_USER:
+		attr.exclude_user = 1;
+		break;
+	case PROBE_EXCLUDE_KERNEL:
+		attr.exclude_kernel = 1;
+		attr.exclude_user = 0;
+		break;
+	case PROBE_EXCLUDE_HV:
+		attr.exclude_hv = 1;
+		break;
+	case PROBE_EXCLUDE_IDLE:
+		attr.exclude_idle = 1;
+		break;
+	case PROBE_EXCLUDE_HOST:
+		attr.exclude_host = 1;
+		attr.exclude_guest = 0;
+		break;
+	case PROBE_EXCLUDE_GUEST:
+		attr.exclude_guest = 1;
+		attr.exclude_host = 0;
+		break;
+	default:
+		return false;
+	}
+
+	fd = sys_perf_event_open(&attr, pid, cpu, -1, flags);
+	if (fd >= 0) {
+		close(fd);
+		return true;
+	}
+	if (which == PROBE_EXCLUDE_USER && attr.exclude_kernel == 1) {
+		attr.exclude_kernel = 0;
+		fd = sys_perf_event_open(&attr, pid, cpu, -1, flags);
+		if (fd >= 0) {
+			close(fd);
+			return true;
+		}
+	}
+	return false;
+}
+
 /*
  * Probe which enum perf_event_sample_format flags are supported by @pmu,
  * testing a common bulk mask first before probing individual flags.
@@ -3503,6 +3562,20 @@ static void __perf_pmu__probe(struct perf_pmu *pmu, int pmu_cpu)
 		}
 	}
 
+	/* 4. Privilege / exclusion modifiers */
+	pmu->probed.exclude_user =
+		test_exclude_flag(&base_attr, pid, cpu, flags, PROBE_EXCLUDE_USER);
+	pmu->probed.exclude_kernel =
+		test_exclude_flag(&base_attr, pid, cpu, flags, PROBE_EXCLUDE_KERNEL);
+	pmu->probed.exclude_hv =
+		test_exclude_flag(&base_attr, pid, cpu, flags, PROBE_EXCLUDE_HV);
+	pmu->probed.exclude_idle =
+		test_exclude_flag(&base_attr, pid, cpu, flags, PROBE_EXCLUDE_IDLE);
+	pmu->probed.exclude_host =
+		test_exclude_flag(&base_attr, pid, cpu, flags, PROBE_EXCLUDE_HOST);
+	pmu->probed.exclude_guest =
+		test_exclude_flag(&base_attr, pid, cpu, flags, PROBE_EXCLUDE_GUEST);
+
 	if (keepalive_fd >= 0)
 		close(keepalive_fd);
 	pmu->probed.checked = true;
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index fea65e314547..a7d794d67bf2 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -234,6 +234,18 @@ struct perf_pmu {
 		bool can_data_src;
 		/** @probed.can_weight: Supports PERF_SAMPLE_WEIGHT. */
 		bool can_weight;
+		/** @probed.exclude_user: Supports perf_event_attr::exclude_user. */
+		bool exclude_user;
+		/** @probed.exclude_kernel: Supports perf_event_attr::exclude_kernel. */
+		bool exclude_kernel;
+		/** @probed.exclude_hv: Supports perf_event_attr::exclude_hv. */
+		bool exclude_hv;
+		/** @probed.exclude_idle: Supports perf_event_attr::exclude_idle. */
+		bool exclude_idle;
+		/** @probed.exclude_host: Supports perf_event_attr::exclude_host. */
+		bool exclude_host;
+		/** @probed.exclude_guest: Supports perf_event_attr::exclude_guest. */
+		bool exclude_guest;
 		/** @probed.probe_event: Name of the event used to probe the PMU. */
 		char *probe_event;
 		/** @probed.open_err: errno if open_supported is false. */
-- 
2.56.0.385.gac671c819a-goog

