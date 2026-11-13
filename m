Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599780;
	b=uURSKXa8w0cfXD19NCySVMq/00zNbXrs8bZ/QOWtIo95M6sF065y8R/YAbIn/yBDqopS
	 2DMo1tLC/6Mdtb77tpuEpU3QLWuwHAx261wL3flpt3cr6JvN25eoxNeooFRZI/oUMJFsj
	 wZBDaSXqvMAGa2/Jwf3x0x0JwLj3F/VYbP9c77QHSUq79nKy1A3AYalF7QeVhl5Xg/Civ
	 a6iOVVR17ZDE2MBq1YZbHJU/PaDoBW3IWrKnxOT5lm9cKdUVwTrgC7fwwrv6qE5/McHWG
	 IQgqbMbl/FECVrABmntVag72WniAlpjOb+g5pu2mceIRWVSgUU0B6WFcAFZWEtj4Drw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=xFeCjHce/j/R2Nf/AVGRzvQxGmU3GCDj7F7sqvOkGOk=;
	b=M5paEohP+hKzSfISaL+kGeOO+eJVzWvo6wOB3CyES1oCeodykPvuqd8zB/QxWl3C0Vk5
	 Kg82g09MJQmd20bJaBoHY53B4KoGTqQEg4VV4wp8kHHKOvTQcJ6FH/1zdHIFzOoJqHYxY
	 xre73bmYGzWJXuaQt9EJse+3xxmeykvJ65vwcaWxPVU7xXQhVRTTWwrGeD0U46Yym7rvh
	 czHx2eUpO5eLp2zLmON6jni/0lcjwUSphmpOcslPbr8uioUpzX738Hv7CNSBRqiWzQmCp
	 VheOFrKNNTFeRVAomkdVYnQ/mLFp13qmy7q8brX2K5u8oEu2gw0vEWm3wrELOTiib6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RA9TsXTx;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9067060A5BD7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9067060A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RA9TsXTx
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1731879eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794599780; x=1795204580; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFeCjHce/j/R2Nf/AVGRzvQxGmU3GCDj7F7sqvOkGOk=;
        b=RA9TsXTxXGr6fLdgs9QnRmXx/b+D56r1p+dvmufMbjgYlhqZFQNN+fOBzpcLySdl7W
         v9m5HZWE9B+jgJvWJ7STZnyM0riBQxzGXIQYMQINBOjHh9ecLM+kiAQbaUPLWHXmqqPw
         UHqGKz+ahPNkjJV3GEw0GLKgDNXYbQAPB53P2HwqdWMfTzF3ENh5sHcyHMfJFUZYjLLY
         d48ReUV48OJN8P1VE8zzsHf6DlcH0YjmaN9IPTt/3vQxva2SdK1y16qY+t1oVcUrjoJV
         3AepBD9HcGFUWoyXCVJYglb+Ec+RxxuGZe1a0ksK5qDaAY2iJptFsb0Snwt7ZgSDFThv
         xd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599780; x=1795204580;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFeCjHce/j/R2Nf/AVGRzvQxGmU3GCDj7F7sqvOkGOk=;
        b=xMaYLUC5LGLo3Pm8wLLKHa3FdGKk9/dvStkpFdxqV9zxeSQNEftQ979tzPEbo13d6G
         phc4W6YoxZAwRMi96uc84UaQ53xsHrWOh70dH7Z+ahHjHxnXbF/jLEfRfbVtl3nf/c0O
         TQtDb61MQ4tBXb6W5SLm9RHNl+NJFTD/FXYtQxjHm9jdDfd9M33C7n+RjslUrg3tZPK1
         IPKRS0n4q6qiBfqcF+pRqdalVPRjJFkAsc+mwbNES65bB5hbiwkkwWPgWSOeTe8PbUVf
         jGsOs8ZS7HCygje8tZUfSuzMBkAkHAT8C73BZl0xh90HR8tU2402KY+w9zg/gqup/0Cu
         hSqA==
X-Forwarded-Encrypted: i=1; AL+hErGClHPLMEtEuhCH3x4PAZmWStROGsJAos16gOvMYe/bubZcZvq9LDNcHc5iC0fyLZ1095DNwfrjT/DLyDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ausemxrs/G8mt3MUlNs/ylNunMoI/zQmnHE3LwlynDXDBTVw3
	O1eBqod/5I9BjIdMOCXFskQ/MKl2crGZvA0q0omAH1zYX8+J5VLqp6RAs9nCJJny3C4bjTdqBvL
	k5yvAF+CYvg==
X-Received: from dyclv15-n2.prod.google.com ([2002:a05:7301:618f:20b0:368:2c6d:de10])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:4146:20b0:36f:551:2bd5
 with SMTP id 5a478bee46e88-379e16d093cmr2184725eec.32.1794599779440; Fri, 13
 Nov 2026 11:56:19 -0800 (PST)
Date: Fri, 13 Nov 2026 11:55:51 -0800
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
Message-ID: <20261113195601.2872738-7-irogers@google.com>
Subject: [PATCH v2 06/16] perf pmu: Probe privilege exclusion modifiers
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
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
index 322d90695c4b..ab4265154990 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -3125,6 +3125,65 @@ static bool try_open_attr_variants(struct perf_event_attr *attr,
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
@@ -3535,6 +3594,20 @@ static void __perf_pmu__probe(struct perf_pmu *pmu, int pmu_cpu)
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
2.56.1.703.gf848ed807c-goog

