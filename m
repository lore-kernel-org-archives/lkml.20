Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171E937F8BA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789625597; cv=none; b=Cse9/oKXhCuWo8aUxSSRlid985Dfqt5NhzzMfpcALDM96HdCkHI9pdf4ZaA+PdvxYB+7h6OvZpeKlMEL0B0s27VhuCau/TMbe1N1hOC5hF19y/YGK75PFaMhYbXUXgK1vZKu8JQvTO2BBLNHgkDtJ7hmlFhpSVm4a+ITbtbVuMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789625597; c=relaxed/simple;
	bh=ijT4boAwnzJnfq+SCNqL6tC+vol3nqZ/S1x+Pf6e67g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=aqP7hAoMb4qI2+4FZ3J/BfGPolp1X3kB+qnw3Ct7TGryzjfbBg3oQ8C9Sb+QFx728bevbytneb4gYM7IN4D9oaZ/UPenoeMu7d7AvyqY6oN9o8yZv/KHc4R63Wlj5O5OD2dPIU+wtjde5dV62o+zf3ZtenHoAd0HJ8s1LRftR28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LuFNZg+6; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LuFNZg+6"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso718559a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789625595; x=1790230395; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nqhdqQO4kyM++89l5qEyG3TcG5/Vl/XXQ79cpkINaJQ=;
        b=LuFNZg+6PC93+ttNk6P51RTS/uN2hp7mPUq0qsragimJ9OMhrEaEUlXLsIVHiCJG6L
         /43HM0O5IoA5UzZnY/T6segiL8cQliAitIl3O9rlvAO3g4k2IomI6/gS2+zAVap49VeW
         msrKPYC8WuCKJa+PtCc7RSxThnqtg8PwWen+9AV4FaBKqq2L60jh4zMRFajUi6GCJRRN
         C+rQUtz2UPAZltSLFrUZeJ7aSd6nuROhhevbu5KAL9jmG4M+C6peQscJivqbpdQg+x7E
         lR3HtfH7C/z7Gydu4XNqySZiC5/DmuvPYI/QQC4B7KMDfTsrP1LGwF6f5/2HXSchfbCT
         VgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789625595; x=1790230395;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nqhdqQO4kyM++89l5qEyG3TcG5/Vl/XXQ79cpkINaJQ=;
        b=TniLTzGWrBdJSc4Ld8N/iMYdhPDjiS+g6xPM9C92DorM+ksmnVYuYPnZAmfcTdISFA
         yyIH9YI7Oip/6aGpsxIprZot79pgyhApU0HJXr6+X25nOWzqpfux/cCqCAx+J5WPJmPQ
         HM9xTfhgh5WVi1yJi8xg5mdFYLWkfFBnk60uB5sLMLMBVtoSnBffzdeZw//qvWy31vIg
         z4+tOJb3qb6LR0YJVqWb8jKqoz1/iyvaZXOQ2j9iJp6CwfvN0Zufm/z4ZfHqy7kA/wjk
         DxjAf8pAEFljP5utb2AfXpoz0HR/ZD8PkOA1YrxU6ScuRUKtkhBkGG0x5uARQJBwj7iV
         cSZg==
X-Forwarded-Encrypted: i=1; AKwUvBzitSi8nGN/WKzQb12wVuecgCgeM1z32jK4ZAk8HaqZ3Ldofdwo6RpjIQURqVXNR9JsbOWXNNjQCw8p8WI=@vger.kernel.org
X-Gm-Message-State: AFuF++mpkeSJsPg1yguDuDULi2Uos94cnNEPycRGwV45Ioo4wZdtgdq5
	sT+AJ2L4SCOU1P6Q37dZHmt19VN24RPy7JMlzBrVDDblHiF1YuF9//64CJDsUMhWERMp5SdhRWG
	ElsOJ0Hj/tw==
X-Received: from dlbsj14.prod.google.com ([2002:a05:7022:f90e:b0:143:74ec:e888])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5624:b0:39e:b7:cbef
 with SMTP id 98e67ed59e1d1-39e1e5612d3mr19386637a91.25.1789625595255; Wed, 16
 Sep 2026 23:13:15 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:13:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917061312.820074-1-irogers@google.com>
Subject: [PATCH v1] perf test: stat metrics cgroup strip possible slash from
 cgroup name
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The grep to match cgroup name in metric output assumes no leading / on
the cgroup name, however, cgroups in /proc/self/cgroup may have a
leading /. Strip the / if it exists to avoid failures to match the
cgroup name in the perf stat output.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/stat_metrics_cgrp.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/perf/tests/shell/stat_metrics_cgrp.sh b/tools/perf/tests/shell/stat_metrics_cgrp.sh
index d4226ee0ae98..0728f48f21fa 100755
--- a/tools/perf/tests/shell/stat_metrics_cgrp.sh
+++ b/tools/perf/tests/shell/stat_metrics_cgrp.sh
@@ -86,6 +86,13 @@ check_metric_reported()
 
 	for cgrp in "${cgrps[@]}"; do
 		# Find metric lines for this cgroup
+		case "$cgrp" in
+			/)  # The root cgroup, leave unchanged.
+			  ;;
+			/*) # Strip any starting slashes.
+			  cgrp="${cgrp#/}"
+			  ;;
+		esac
 		# We use exact cgroup match with surrounding commas
 		local cgrp_lines
 		cgrp_lines=$(echo "${output}" | grep -F ",${cgrp}," | grep "insn_per_cycle" || true)
-- 
2.55.0.1082.g2b9226bbc0-goog

