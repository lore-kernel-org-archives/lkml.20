Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599630;
	b=gwwvXxlpkfYeecnirUFhtcoT5u6PeltsDPylEi7X/8bZka+mXFRpuzO/XJqIIzSCgj8m
	 bft3ZXenfeD7+JZZZRz6M22OaH7ln0TMOfn77DsiBEsxbMCOnAXWGmOwMQjbrPfrpwzFC
	 SYGiylQG2bTSpy9xn+g1wwspDmZYlK7Sw69OgCoReWNnsBAI5b0FtzGC32gkPDzuAGs+s
	 K/B6RKibQBFkMFfAle0BrK7LuLcJ4hwrSysB7p/lqIUO3Z+U87ILdFF14tHF7cC0/ObEI
	 rX9LaOL1dHw/wkxx4N+xV7wju8rdBghdR5YGDFjx5ZsnPyhV+9bM1Ak/Rfz5Rp6aPuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6O38ETLEbj32ufhG7MyecNbPniPzbxOSw7ptiJplfvA=;
	b=QeAhy7jfI1VVv0ZRJcKCaYUqrdnKEz3zN41RSb3l5CMoL5dyzvVmoaj2Wqa7+XRXNYFe
	 18Sgxr+0ugRBKYXr2MYcBA9N9tE9cRld7s6/dE+EcLs02DbThh3tTLlLfl549S5VVDaFt
	 JdapJbBUtSK0Njyvqa2uW+30/1kBudReNLhRszgT6OxMG3QYse4r/BpOVpsZIIxTtOryd
	 HJitXVbAzOB0qt7sFonUIxoV9TeR4Cw+GSuM8kvEu95ViHSHDtX24pOo4fEWmFgvIqxhk
	 cts52jm1gVgmd2zKb3vhNWWiMyg51gjrummGwLdi+qX70WuiI2VjBmnV7TjvX5llInQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UIc+KZIn;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983AF60A260B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 983AF60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UIc+KZIn
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso5988399eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794599629; x=1795204429; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6O38ETLEbj32ufhG7MyecNbPniPzbxOSw7ptiJplfvA=;
        b=UIc+KZInkfeSJgsOHmWiulrirJAbIp9dI6rhRqKPFFI2NOCiuIYN0u8I6Z8K4CBD32
         vl9EbQ3PS+mddtf6yYgnlOaZCBKaE07O+K8kPnG8SAI4c/mYVeTpcNFk4nKvuxABLGLz
         bifS/FD57HYhJkEjnI/1yxtfgCCsH7/EW+qA1W46eKV1ineweol54mlUF7F7Un6QaHsU
         1DUGr7ixIzDXK1St6DBfy6cUJNp9cbk5+2/vH87h/1y6L5YKAnEuESzRp9U7asUJJQgn
         itTQHcaI5eFZwIOzqUzcZDM51hfhAsjSoLKXvDm+qCc/GXTN6YPKk/RDheuhtSm45UkT
         dZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599629; x=1795204429;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6O38ETLEbj32ufhG7MyecNbPniPzbxOSw7ptiJplfvA=;
        b=S5ZIvCMIMUeV3yaGC2cIUUnFTREraZaAoMB+lrOPuc6MA2uM2luZFKamVpLe5H3DLA
         0UlOKB6j+1WZ52O5KDXU8GfzBZi0UL5Fumy5/o/YZsAkOw7vyLZXpGaEUEmdtsY47pVB
         +nbGRKZbflvWamdWS6Al+i7KDdbpP9nJaAvIb4YIT6m/1Zjmc0Mw9JuncxDawV2DgB2X
         13W3csT/eQ8/liMK5UPThOgvpZTtrpTzBTyFFeoxKpcG1UFXsRLWgVohGvxONFuLCXvh
         feogsyq5wEQjXqcdA+Q5uoQwi0C50Uto4f7ycN/Dku+rqWaRDMuINwX12bRGwuTrszRf
         J+IA==
X-Forwarded-Encrypted: i=1; AL+hErHAU7KbgGDyHj2jSiU6wWmfjYVLlzeALMuDc5oQplir1rDpiuGAfS2FxjutG6A+0pspKfQ/niFRqfdMmUc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IxMPEQEbPF8byIOY35HKJ0pYJRq42mMkuXxOK5rKAAZFw5W4y
	+DC6Z5DcNStPT64srzGOoHE7881aqY8MueAg7GGkLj4n0w0+v3+XaaMQe1L46vuQ3Ib62NW4TEk
	kRf4jyPzWIA==
X-Received: from dyhb22.prod.google.com ([2002:a05:7300:1496:b0:36a:ead:4dcc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:fd09:b0:36d:4570:a32d
 with SMTP id 5a478bee46e88-37963953f0amr2866228eec.2.1794599628447; Fri, 13
 Nov 2026 11:53:48 -0800 (PST)
Date: Fri, 13 Nov 2026 11:53:09 -0800
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
Message-ID: <20261113195335.2865725-5-irogers@google.com>
Subject: [PATCH v2 04/30] perf metricgroup: Don't prefer tool events for
 displaying a metric
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

pick_display_evsel() selects the event of a metric that perf stat shows
the metric alongside, preferring an event that isn't a tool event, such
as duration_time, and that is used by the fewest metrics. A tool event
used by fewer metrics replaced a non-tool event, so whether the metric
was displayed with a tool event depended on the order of the metric's
events. For example, CPUs_utilized could be shown alongside the
duration_time tool event rather than cpu-clock, and cpu-clock not shown.

Only compare the number of uses of events that are both, or both not,
tool events.

Fixes: c8035a496141 ("perf metricgroup: Add care to picking the evsel for displaying a metric")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/metricgroup.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index 779fe56fe8d0..98f3ba8f9533 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -1388,8 +1388,10 @@ static struct evsel *pick_display_evsel(struct list_head *metric_list,
 		struct evsel *candidate = metric_events[i];
 		size_t candidate_uses = count_uses(metric_list, candidate);
 
-		if ((selected_is_tool && !evsel__is_tool(candidate)) ||
-		    (candidate_uses < selected_uses)) {
+		bool candidate_is_tool = evsel__is_tool(candidate);
+
+		if ((selected_is_tool && !candidate_is_tool) ||
+		    (selected_is_tool == candidate_is_tool && candidate_uses < selected_uses)) {
 			selected = candidate;
 			selected_uses = candidate_uses;
 			selected_is_tool = evsel__is_tool(selected);
-- 
2.56.1.703.gf848ed807c-goog

