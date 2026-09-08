Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4A048F013
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905252; cv=none; b=QXsnpB7e0enudtkKE+4iHK9VVegDy4xNbBEXwPZgCQU7fzM6uFohj3rssoePVbJO/lJ7N1WJiI57j3rKw0VjwuhfkTqwNFiuT88PwpVFafUSd17sNFyJ1YG7EOwryp2fxCV8vBc1S6T9YvXCsi6girkdOfh1Egkr4+YTsOU1/Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905252; c=relaxed/simple;
	bh=R6ddLj4qpQcWo28GoaB+VeJdr3ZHW4JbeaEBuc5D0WA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=ScNi9tBd6UsMifHU5ivOAmGtsBbYoITvLSw3POORJ7+G+CzfvFrhD4Cc1QLK0/i1WIwxUEZFlltfUo4eW2mBn/1huuho4zx1ci96eZTQzupP36PKWTLvIMKgjJqvJ82T0A9w+yKRshIxd9rP2pcUXY6CJ/ewO/KKxLJSzxlr3PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vUFjYXy8; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vUFjYXy8"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so73542565ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788905249; x=1789510049; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Wq4cyKKlw50Wq2YF/HlUbZTYcyRZ1QyW7Wojt21z254=;
        b=vUFjYXy8otLZxHMt0nsVoK7/DRFNrgich9JlxpHprdtqWZfBy6uMWyUCQtP/EZHnx5
         eYsO32TdqWdYY/r3CNcinreTBu9njDBUk/rNgUj8eAF3dGKhkF5qNfTpBdc+k67s/k61
         egxUAnyJVnfexDMyyebXaSu1b4PT1F6k9C1EoE1NEvRhuC8OHweM/zKDOK54G7xscmGw
         4gjx57lNWiPXCalCx8NnoSU2zLltmHZ032KlpY7AtJUiyv2F4ecv0/naBD7KyN0or06A
         sIJQsZEXwm0b3KXQmOeVBlBB500rBZiKmS4dthte5Q/1tW8oOKOiJndL9J9k5hnCGntK
         tAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788905249; x=1789510049;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wq4cyKKlw50Wq2YF/HlUbZTYcyRZ1QyW7Wojt21z254=;
        b=UQti5QjzAty2c718Tn3ssnAPiru1dq/56N8fCPYtFbyUcDUDLoLvRsEKhAN6hkBV4W
         B+LzVc3aHuYV5FX/s87SHspkBo2zDxVl8d4CKr5CekmPSPvitu5GdZDQ3chTkI2h3WNn
         L16TTX/hawYiv3xG78CtG7ePErnSEpCDrFVCOTgGBxYRSAh8tGaTtGT2QRraX1B1q8yH
         HDdvg4dXnt4KIXwax9CQvTmpuQflfRgmpzA2TPXb5iBJ9J7AJjSxsjMI8n29HQq1Aryy
         DaYk3kH8KVmejnN6AehgQM+T6ZCavXOsMoE05py1TR6I87taE3CTnryxYPEaHSC+g0oG
         WS6A==
X-Forwarded-Encrypted: i=1; AKwUvBwhQ2jT2kCaub8UliPOPlnxNEngx1Y4zYpfy/NTu2eK5T0YsELlpJD+AP/SXGa90j6MBz5NO35WMaMmdqw=@vger.kernel.org
X-Gm-Message-State: AFuF++miqsQEnRywxgQ5mna23xeZ4uZQ9V8SaozrYvAsbfKqE+KPVQCx
	XMB7kczRPy9SUYgo+kc6YMl5KSdRbDjStm/pEc5XgPxNsDoAdF1dnaXCOouuVqXXyQ0XLv0XTYS
	HxStb72RuLA==
X-Received: from dlbbq8.prod.google.com ([2002:a05:7022:6708:b0:142:efc7:61e3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:578c:b0:398:e6b6:acc2
 with SMTP id 98e67ed59e1d1-39b261e7649mr50141222a91.12.1788905248956; Tue, 08
 Sep 2026 15:07:28 -0700 (PDT)
Date: Tue,  8 Sep 2026 15:07:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908220720.564614-1-irogers@google.com>
Subject: [PATCH v1] perf stat: Avoid uninitialized memory read on error
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

If has_supported_counters fails then msg was passed to ui__error
regardless of whether an error was written into msg leading to reading
uninitialized memory. Avoid this by always terminating msg at
initialization.

Opportunistically reduce the scope of msg to make its use clearer.

Fixes: c9a8c343ef2f ("perf stat: When no events, don't report an error if there is none")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-stat.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
index c50cf230f16e..37752d6bfef4 100644
--- a/tools/perf/builtin-stat.c
+++ b/tools/perf/builtin-stat.c
@@ -777,7 +777,6 @@ static int __run_perf_stat(int argc, const char **argv, int run_idx)
 	int interval = stat_config.interval;
 	int times = stat_config.times;
 	int timeout = stat_config.timeout;
-	char msg[BUFSIZ];
 	unsigned long long t0, t1;
 	struct evsel *counter;
 	size_t l;
@@ -908,6 +907,9 @@ static int __run_perf_stat(int argc, const char **argv, int run_idx)
 		}
 	}
 	if (!has_supported_counters && !stat_config.null_run) {
+		char msg[BUFSIZ];
+
+		msg[0] = '\0';
 		if (open_err) {
 			evsel__open_strerror(evlist__first(evsel_list), &target, open_err,
 					     msg, sizeof(msg));
-- 
2.55.0.979.g7e5102b832-goog

