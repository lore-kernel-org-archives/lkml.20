Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A8750255B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740460; cv=none; b=RZ4YIeTsPO0RFwFn0nt96p8ZtrH5JnvAcvWVsGu5JX0OqW1ivH83QGa98zGDD8yirENoq796AG4yeHHS/gb1l6YNnUaKme1L1kxjQK5PGkGEMF3EZHHihzS2TTBa+hSwfW3zjaMYyW9hm2OR8yZw+msD9CyBTSTQIbIerAs/HZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740460; c=relaxed/simple;
	bh=cUOLtOGC1sSr8NqERNj02XhiosC+nBk1W+33Ik/UsHw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VScoGdk8IohWzbCuN2L3pcTOJteDex+kAd+lDT1qKJwehErvzMzTQDP2nMUrtDCFtTkCWsc9wNOB+liaaT91h7lix3CukAjfgpBR20+YOLotuKg3kuOGUWFO24Z5wCPptP4JP2Euz69VlRRR3uy60V1z4+43s5RHdKYgyeq+d5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mvm1jm8W; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mvm1jm8W"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso1559930a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789740458; x=1790345258; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1WBF+lhdsNyuuMsRQ/q34du1kWAD6BuZOicdGwPzPk=;
        b=mvm1jm8Wt/spPluT38kpO8IhrpiMJ/An1PYxdyUnItUpnEj/3yamQ3cgYeMEjAyD2G
         kA5Rjqbewlow4rlTCaq9eNIZNt6/a6a0Dxbs3pD51YyOYj0GbMIINX4jvZ+eo3yXi92B
         WHyuhEJDnkUXxjwEeHVSWbgbhlhoUOVQPw7tqPp28jYzi6GJpLYZhbYHmdCAugiP5Zhc
         Qf4cGHOpV9PXtQV/MufxGbIz2ItDUySP6Hwc+wJNQKWPyQj++ErG+Cz/1G8VTHowmwnP
         zmPv2qQoRXOIScOPGGyZW6OKKXskHbbBxAcqqfd9lNGiILN9jm/RBxCGeioESzuuV9BJ
         QTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740458; x=1790345258;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1WBF+lhdsNyuuMsRQ/q34du1kWAD6BuZOicdGwPzPk=;
        b=RtnB14PDRPYKWlehzNFSZDP7m4W4/BotTPLnEdUEITwOpRAUn7nj8tci7nZSylmHbv
         P8l6PQMrS1lgMkz6QN3RMTn/XCS1eAdZU9zPZMkC/cEGqDfJDNtdDLpX2dMmanS45+I0
         xyKyavmWiaAtZqll5ZvbkEMvinSAOBvOe8vhnM/i/cuBpxiHkUgyFkJ6hbSDRZ7ve7fu
         V5YsmRv8QWE1BVeYroOMgndZmye1Tt11KZGxGsxwXCiPfp9dOUIQwzP9vHeBuwa/2FXK
         iut9bcxJG0A69QP845/dyUt8YBN/b//nsjGGIama20L7NmBVdC0FGo7dYQbNe3avYg8G
         FOgA==
X-Forwarded-Encrypted: i=1; AKwUvBydHMzfwMc4gMgxBlqOShEVAd/WvV6V2oVv1/SxG+RQQBt4AFegMMnOuE0GFRBwHhPc82EpvOezdqlJfpo=@vger.kernel.org
X-Gm-Message-State: AFuF++lR2WMafXrNG44v8zDNEPqerRKvlRgU+CTHbxbryQWIj8mzJ8y7
	Uvd6y+XNU8egS4DWa4gtmq63hf+qpSc6g51netTjN/dwQzHdHNYExLMhx9Xodz/kZBJXa8hPlRu
	HeKFuyiczMw==
X-Received: from dlzz18.prod.google.com ([2002:a05:7022:492:b0:144:c0e8:a153])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d0b:b0:39e:4c7e:f044
 with SMTP id 98e67ed59e1d1-39e54fd5f69mr6217390a91.33.1789740458080; Fri, 18
 Sep 2026 07:07:38 -0700 (PDT)
Date: Fri, 18 Sep 2026 07:06:58 -0700
In-Reply-To: <20260918140659.2501976-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789662556.git.irogers@google.com> <20260918140659.2501976-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918140659.2501976-16-irogers@google.com>
Subject: [PATCH v3 15/16] perf test trace_summary: Make non-exclusive
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

trace_summary.sh tests various summary modes of `perf trace`. It already
directs output to a unique temporary file without polluting the current
working directory.

Remove the (exclusive) tag so it can run concurrently in parallel test
runs.

Running perf trace in parallel is only safe now that the probe tests no
longer name their probes "vfs_getname...": perf trace opens everything
matching a hardcoded "probe:vfs_getname*" wildcard, which used to pin
those probes and make their cleanup fail with -EBUSY.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/trace_summary.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/trace_summary.sh b/tools/perf/tests/shell/trace_summary.sh
index 4589b4581419..d0196351243d 100755
--- a/tools/perf/tests/shell/trace_summary.sh
+++ b/tools/perf/tests/shell/trace_summary.sh
@@ -1,5 +1,5 @@
 #!/bin/bash
-# perf trace summary (exclusive)
+# perf trace summary
 # SPDX-License-Identifier: GPL-2.0
 
 # Check that perf trace works with various summary mode
-- 
2.55.0.1082.g2b9226bbc0-goog

