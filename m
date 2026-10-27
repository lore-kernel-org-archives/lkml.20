Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793120681;
	b=SuzlrEmUStmpZPUyB5oowiRo6+hVERPuoKcdJczwZpjXk4TMgm4iftoYvLdWZeFqo1c7
	 kDbwoqDivSylh/cnLDqKcBjKC3wEWtG+f7vXRCMT+kme1e4o2cNr4E5s6j59panCP4oml
	 4HHiLgowhYg6IojtpJwAhADnVEyFflKw+PfU8FHghpuqTc+5W4jpMTUXKX37VNiMkyqig
	 +9MUgK/tajjY8UV9+XeakWMXM5AMGpq73r7BJVldY9FAb6JDnFN4yy7xVJZnAl3U6L/n+
	 HBtpScy0jZF5eZTaILB1Cz2A6UkkUCXoxOO+IVw2nX7u8OcfnYcdQBUZKDcbJE1rUVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:
	 Content-Type;
	bh=KuPv9dNAeKsP3lHQ5az7k6lXOC/G0/2eCGVI05AUWhM=;
	b=SehmqYasJytzL9DV5FjEEDw5t/4pRczeC7D+lXxZgLolaC36MYcFHeSmZNXhGnryf9qQ
	 uuUXd02lfMl4Y00KyRVCAAXdZeGWaVYz7f1lh6gx0VyS4K8dwaX5CFK4ZSeSf1ofuNCdT
	 Jvl34B6Yok+9QcypxcMCgT+5ceW2D+6TgLHSfSIQQFbWrNWadoavNcVC6dPTuRDJZH4HX
	 R1ooSAHIno9k546iQ1l2Pcyu4Kd11YaBe1jx3M3vT+SemuUjEQMr8WVPktDEOxup4poXw
	 q48B2P4HXovSHVV0GHUrm3SO7CEiCwlz8ctaRkzIZFq2nE5vtPTFKf39pAi+rgvit4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AuSlGwyL;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5D1606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB5D1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AuSlGwyL
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36637676140so82233eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793120680; x=1793725480; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KuPv9dNAeKsP3lHQ5az7k6lXOC/G0/2eCGVI05AUWhM=;
        b=AuSlGwyLvMj50I5lH0VPZECM8TmzzAGBpCmgjTh4rDhbxpMDv1bOwguASPJWiLGL1U
         Y0/rSeY1sHWQpREbVUVHGpKpDZIQDEia9akUS0u7ABwagcB+fKSjO+oZrRqk11Vp5wud
         rTZxx9kVJS2laXDQWQkJk/vdiHDKAdAXeUyX9as0QcPBB04nibVHkBolUHP3WvIgKxzU
         a3qD/xJuYvAhFfZJaSvuFD5VJrHw/TCQa1L9n3nP3e5jJ20iKvimCZWjQk+xoTEi58QJ
         rTGF8RvkYsvoDVcCh3IxuCtBILia/ynU23tejEsZ90QgTr/zQersfIHdK2z+NWgsq7QC
         Z8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793120680; x=1793725480;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuPv9dNAeKsP3lHQ5az7k6lXOC/G0/2eCGVI05AUWhM=;
        b=09FQfeNmZzZDdSqy7iDK7eIzcfdttAddybT/SKFi+7t2UxMJ2BOjhVXz5DV8lJonV5
         A6Ih04efkT3a5Q82d0LtVnjsmVvgx08tcNrDK/ufyc83XLkyoz7WdfURakk3c/0NyOqV
         gO+nq80InKbsFILh34urDKGqPfCIhoe7FwXkHzAY1NLMqRAoJ6wUr7W6MhuxLONA+LGR
         P3YcORJteqBKLmnoxzrHaMA6foDaXVXcBwvgVtG16Qjcrr3xQ6LEznHz9WMnm0rYTFz1
         k69pmZG+JzSxJov0/DPEokaryim5UOg/5EtpZQLN87xK5BnVLtS3imo6lnEyqrTqxCny
         OhTA==
X-Forwarded-Encrypted: i=1; AKwUvBxv2LY9JCAI26CGEffT2cbwyeKPlQmhXQP8QUe+rRK+X7OLXeRbzkP8xnQyhoPQepvQ44A9kI/1heoAf44=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9/lH63iCsPJ7BJ6001brP0tBzOLUa09qWRuQGz2fukL+OSKkQ
	5Y8obsLzdQM/7TbK871/17q6qAAlkG+GmKRjCZFVe4Fsau8j1QPyEdrZSqsLHMb2iBQVaOoZ43R
	lKVQLbFQKxQ==
X-Received: from dlev28.prod.google.com ([2002:a05:701b:465c:b0:181:c416:735b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:110e:b0:149:1feb:6da4
 with SMTP id a92af1059eb24-199361b5994mr13527117c88.32.1793120679092; Tue, 27
 Oct 2026 10:04:39 -0700 (PDT)
Date: Tue, 27 Oct 2026 10:04:13 -0700
In-Reply-To: <20261027170415.2815859-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027170415.2815859-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027170415.2815859-2-irogers@google.com>
Subject: [PATCH v1 2/4] perf off-cpu: Write the sample ID for PERF_SAMPLE_ID
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

OFFCPU_SAMPLE_TYPES allows PERF_SAMPLE_ID, and the sample ID is
computed, but off_cpu_write() only wrote it for PERF_SAMPLE_IDENTIFIER.
When PERF_SAMPLE_ID was set the synthesized samples were one u64 short,
so the remaining fields were misparsed. Write the ID after the time as
the sample format requires.

Fixes: edc41a1099c2 ("perf record: Enable off-cpu analysis with BPF")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf_off_cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/util/bpf_off_cpu.c b/tools/perf/util/bpf_off_cpu.c
index ff8935688b43..16948761cc45 100644
--- a/tools/perf/util/bpf_off_cpu.c
+++ b/tools/perf/util/bpf_off_cpu.c
@@ -373,6 +373,8 @@ int off_cpu_write(struct perf_session *session)
 			data.array[n++] = 0;
 		if (sample_type & PERF_SAMPLE_TIME)
 			data.array[n++] = tstamp;
+		if (sample_type & PERF_SAMPLE_ID)
+			data.array[n++] = sid;
 		if (sample_type & PERF_SAMPLE_CPU)
 			data.array[n++] = 0;
 		if (sample_type & PERF_SAMPLE_PERIOD)
-- 
2.56.0.313.g2479322e68-goog

