Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E7543D4E9
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627384; cv=none; b=VoUweisQx0Z4i4Wkcx+UDvB4KCQo2iCxHX4wZ1vsznp2fjxqtLGjlHTvEuIs3U2DQTUJdI8EfKDL01JfLNEcNqvS7nQJM2AohUeDANKWeF12j/D3UyatKx+hDiVyaRbwpCr2hGsrz+C0DHG5Pqewl/7yk0kevtVhkcjivf0wTZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627384; c=relaxed/simple;
	bh=Efwg6Lp4URje4K6ap1NY7WHw9tf5g4FaF0Uk7IwjA5I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CGyBq4BhjAViyX5IXbexrKXGzl/MQM/zGZFdSxD4H7BUWmGyChNECV3Gy1xc4FiXaY0Fq6eL/R9RkD+hc4Ggq2XNlqqxtXgOKCSM27S5qq3FaaTNU5zlOnj0faVWHGcVvoYAF1MRWqnM5NqL1HG5S957nwLs/mflZwJ721rhf/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KPcz8wpy; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KPcz8wpy"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so647976a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789627381; x=1790232181; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aji62SWFx1lY4aZnTGM78az2i6brsVbPSUcmX+4ftqQ=;
        b=KPcz8wpy8e+zWZnq1guMIyqtclqam5iDNFqK67z0LTFx9Zlu+jjWkXe3Gu1W30hGO6
         sqBV4UUMrLH5xmbyh3h4vxMHXtDZBfsENCpBkljnlOnfVMHWSXoWlMEU41Q0TXk9nMqz
         s0POZy52AXVTYgElOs90tGCxneWPPblJkHmgKiqRDWSuZ55biWfuvoUX4dbtYU/s0wfV
         Y0j20UcIiBe4P5fs+g7ZSiGfSPr5gLBWswrl51u+LTGimAwcXJ1N1AdC1VmDcMFoubhs
         q65rUQXdd08K49ItKD6N7N3j//gwibf0W+ChFi3IcmcnrDoK9Xrp9h0eL/z/lmOLv3Ts
         LWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627381; x=1790232181;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aji62SWFx1lY4aZnTGM78az2i6brsVbPSUcmX+4ftqQ=;
        b=EJzGcS+SRewmxvWNpHy4VQC0i0sNzjlfzUw5TW8npgAiqnvBuFGZ8gnodPi6ia9FUA
         3yzIMWwuVTyGbsaJ+hLD64Zy3qkKajdF9Q3pXjzDKN85zTr7Gro8ev58JCEaCH1Ya2ss
         BIHgohYJd4N+rgVCKXRoJj/Xb49heROrQyekfezoWse271weVLM4ry+rpEZ1ppT+8ui9
         HAer1VuklSRbaac+OFbRotHqF6VPuQfz2hUe/c/J2eUIFQtKJ924KhxJtnpw3k8dniRI
         OxxpMd7BQzVr5mp3dfwT7N5UepfPEfOPmUdosh6wfoMtKJIC34jGJH86/aM+lDAjzZqM
         JBgQ==
X-Forwarded-Encrypted: i=1; AKwUvByIAHMkbXkSvYQEKJYJ8ZHJgr06BVY+JmOg1mfd7tZxa8Bk6Etr2w0vL0E2LkkZzMglRB9S/x6RMtU4GiY=@vger.kernel.org
X-Gm-Message-State: AFuF++n7VceoxGRY+tZ8bKXLdGL8OfQyXylvk5NqbvSCgfOlTCAlZAcs
	XCI8iRP3WbYtJ1dSWhPbdcO8cYb2197yRxivua2rgy0Lae0Yq5b2FTYnfygeqsDna/REkX8IK0b
	VXopAI/vI5Q==
X-Received: from dldyq26-n2.prod.google.com ([2002:a05:701b:455a:20b0:144:58aa:2e86])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3885:b0:39d:f253:ed66
 with SMTP id 98e67ed59e1d1-39e1e51d828mr12013395a91.22.1789627381072; Wed, 16
 Sep 2026 23:43:01 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:42:29 -0700
In-Reply-To: <cover.1789626977.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789626977.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <390cfc25923c5be2636ee0bd59a0b33d29ba0e71.1789626978.git.irogers@google.com>
Subject: [PATCH v1 07/13] perf test common: Do not globally disable tracing
 events in clear_all_probes
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

`echo 0 > /sys/kernel/debug/tracing/events/enable` disables tracepoint
events system-wide. When running tests in parallel, this kills active
tracing and recording sessions in concurrent tests (such as perf trace
and perf record).

Remove the global event disable from clear_all_probes().

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/common/init.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/perf/tests/shell/common/init.sh b/tools/perf/tests/shell/common/init.sh
index cbfc78bec974..d2c7a31e2c6f 100644
--- a/tools/perf/tests/shell/common/init.sh
+++ b/tools/perf/tests/shell/common/init.sh
@@ -132,7 +132,6 @@ check_uprobes_available()
 
 clear_all_probes()
 {
-	echo 0 > /sys/kernel/debug/tracing/events/enable
 	check_kprobes_available && echo > /sys/kernel/debug/tracing/kprobe_events
 	check_uprobes_available && echo > /sys/kernel/debug/tracing/uprobe_events
 }
-- 
2.55.0.1082.g2b9226bbc0-goog

