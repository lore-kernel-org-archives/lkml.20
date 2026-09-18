Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AFE48D890
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789713178; cv=none; b=h28PH9qSnpqFNllGrWBCCWQ16XO82XsyR9Gv0RscRWB2vAo4+rppLFFVX9+2ch0NbpchUOhlo0/UcTBCaCo55DoaeaFeycbzMyZjCMBTbpttWhBMg1G4SRWoTIG2eJouzXoLYGYVbR0yMQaWwJegfHUtZTPEf7ZqEz5ty2V1AKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789713178; c=relaxed/simple;
	bh=QmcWkstS/VbcAPK9L4G/fLdvRUQbvBjPfNeBDPtpFz4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZmqcwIls6/LDoG2FrouwRO6UqmtKOMaL8piKxa5eHMAlq/6ZCwrC/S5RhT+behpOd9rw/M2H/PrwojGoYmDgOJ/RBHbbUKX1aNkake3ohivsy9fGK2Vv9gIuWBng79KS7y2jesIDsXG/aTR24A4v1MhSidcp6oEJV2wbJcK3ibc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Spz/pbu8; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Spz/pbu8"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6fb956002so6728465ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789713176; x=1790317976; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C7OaLonc0zyBcjmW5hXHqgzNGrY6TsdzALumXRwiAzU=;
        b=Spz/pbu8GT59okuMvd1xGBox/t1YxDxshpS4v8DzqgxILc8dPqYX1vB/FbvlxkaOdG
         3LimXWY2pQzZHolRZHpxuemojuq3ztY74napXw/NYWxL/ekKI4vgmRzN0ut4uAvq6MId
         7JkspH3LqlUKpTEhY4O2t3qIvEvc3W/ZpbI9dgm3wh/HAVDorT/8ZtxWvMy4YVTsQsPB
         LKfOXNXG00zi345NnKelmEvnb9YBJRX6L1i4yl6DXnQ/3VT+q/RLkZiUVRC3X+fYnbUE
         YducRHxvjtXTB71KrK8RkNcOAfkRN4tAEsN17kfK+gtgVu2k59lBy/3GGowmIzxobVmh
         cQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789713176; x=1790317976;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7OaLonc0zyBcjmW5hXHqgzNGrY6TsdzALumXRwiAzU=;
        b=2PMupJtdXDb/+ZMSoXM7/jvYarK2y2ZuvJYIeWxlt1MnvqDDzLMUCv3GemChC12x0p
         3/9u3x4Z5x8KMmcWHcEa+e3ZiMXIuQHG/tOpzhR9rKs1YKZ+MvoBnpWW6cQF/rIvvc9y
         ypcKxEri8XQOTFuS5XCLGAqHKA4XoUQ3G+HCWjIAWd3OB1DqwAomxt0JY+dbRJf1I/0C
         5HSv+N13xJlgz5R5sqxtKwVtlbMefeMzQy4cXYXnhq2MpwH5pmLjfTSMp3XNgXFldf+3
         BrjZbhc0R2u4b94akr+fsuJiHhfvn/NZ9xnz4Qh4O/ewtBU8b/suxV9/7gKmKpxD8PFX
         H5Jw==
X-Forwarded-Encrypted: i=1; AKwUvBynHd/t+5E7D+Gpg3wuKfnlGGvBW/qXnUFE+2wcCsrA8vOEn/oSdbax5DJrPimeGRgkH2K/oUhAvVWaCT0=@vger.kernel.org
X-Gm-Message-State: AFuF++maQrecLPmRbZOuqn+N3yA8wOLNCmwF+9G7pqZNKYLW4QKh9zvG
	50t+9z1/8W4Ke9qRkajdDqhp2E6lCjNP04mKgXXI3OKtxPG0GwmE5fT7UvegY8UOBLUPX2JwFza
	I3eqS0OFUzQ==
X-Received: from dldyr17-n2.prod.google.com ([2002:a05:701b:4511:20b0:144:c590:e885])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d8e:b0:39e:2065:5f60
 with SMTP id 98e67ed59e1d1-39e54f9d37bmr3632270a91.18.1789713176440; Thu, 17
 Sep 2026 23:32:56 -0700 (PDT)
Date: Thu, 17 Sep 2026 23:32:46 -0700
In-Reply-To: <20260918063249.2172589-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918063249.2172589-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918063249.2172589-3-irogers@google.com>
Subject: [PATCH v1 2/5] perf trace-event: Reuse an already parsed tracepoint format
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

tp_format() read and parsed the format file on every call. Each parse
registers another tep_event with the global tep handle, and
libtraceevent has no way to free an individual event, only the whole
handle, so a repeated lookup of the same tracepoint both redoes the
work of reading and parsing the file and leaves a duplicate behind for
the rest of the session.

Ask the handle for the event first with tep_find_event_by_name() and
only fall back to reading the format file when it has not been parsed
yet. The handle holds formats for the running kernel alone, so a name
that is found is the same format that would have been read.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/trace-event.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/trace-event.c b/tools/perf/util/trace-event.c
index 10a7652f0305..826f75464171 100644
--- a/tools/perf/util/trace-event.c
+++ b/tools/perf/util/trace-event.c
@@ -81,14 +81,25 @@ void trace_event__cleanup(struct trace_event *t)
 static struct tep_event*
 tp_format(const char *sys, const char *name)
 {
-	char *tp_dir = get_events_file(sys);
 	struct tep_handle *pevent = tevent.pevent;
-	struct tep_event *event = NULL;
+	struct tep_event *event;
+	char *tp_dir;
 	char path[PATH_MAX];
 	size_t size;
 	char *data;
 	int err;
 
+	/*
+	 * Each parse adds an event to the tep handle that can only be freed
+	 * by freeing the whole handle, so re-reading a format file both
+	 * repeats the work and grows the handle with a duplicate. Reuse the
+	 * event if it was already parsed.
+	 */
+	event = tep_find_event_by_name(pevent, sys, name);
+	if (event)
+		return event;
+
+	tp_dir = get_events_file(sys);
 	if (!tp_dir) {
 		errno = ENOMEM;
 		return NULL;
@@ -103,6 +114,7 @@ tp_format(const char *sys, const char *name)
 		return NULL;
 	}
 
+	event = NULL;
 	err = tep_parse_format(pevent, &event, data, size, sys);
 
 	free(data);
-- 
2.55.0.1082.g2b9226bbc0-goog

