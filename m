Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281AA3914E9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620034; cv=none; b=BviS+nEJsSu8yet98hIiyPjjr/P2ez9pYrOCPRDwiTsTHOm6wft5C3t7xbEZ16Ha1sUCQ4uBDAu9+Lq3u/porq780MD9G/7L6eTe4ZuErJX9v36f77BRMbj8SlLzm5tVzBPAI5BNA7/kIGvxBSAeImDJFTC4WC1mu8bIRWaLphs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620034; c=relaxed/simple;
	bh=PI/j/yj9qHF2Z+Ytn13c7SIHR6WctmiBbL2upSsY/xw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Fa8T9zrRBA1Dk6sEIOcMDeRNfQMb8P3/SnwrdEt/I42+hGRm59dEwKH56T8U9c6o4FV2utUuCgZ0I3evELdB9gaA8BwkW4kPl80RjdyIUeb9AzSDEmZ4leZiWhHBhp1K+a/PUGXlItdTo8W1rZgy1M2vuyGWWaMgKdxq4yO7EOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rM4jGmid; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rM4jGmid"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1466ab2bc8dso3356577c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790620031; x=1791224831; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctpKLdPcvE2rYSGOL9e2LFMyTzgCZSjxqpbnDuaYYEk=;
        b=rM4jGmidQWPfQa/q/lixFfOC1Ky38qPT+z2BZbDL7rHm7f7OZrzN3ZisPt7qujheQP
         QpHpUCEY1fx/xbnHl02JdcRC7Zhv/UBiWACVRReXS9kFBxHxhucWVrFSm7gHEVsGX6/7
         ruo+2B9hIZWPeOIvYjAg0PboYS05ypMsfIJ+bTy3IqmM0Ufiyzimw5F/iqYnZJQfnyQJ
         fT4ORvKAX+OZ7wcy/zSdeuNqAzHmK7iU6X8lBZYaxwhTot/UhAZOLjHfAjLJHP2tdn9S
         l3V20ufjBg0HMvUZtHkBpQNNDY9TKLL3BFN9fx/QQgLqyaR+waQ0rNM0UZwDkVwnz1pD
         t3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790620031; x=1791224831;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ctpKLdPcvE2rYSGOL9e2LFMyTzgCZSjxqpbnDuaYYEk=;
        b=jOZZRJMoIS2b7pY5EpfaWq/K8MZjgJObQLh1xgypKMYu09kV1TgOqZ2Ij0eU50djet
         eKpGt+LpPZZtSSWVoe7nR8lINz5p34WFz5BqSipnwOnlDpLcT7Aq3UTbQrhA4iww9WCC
         do8czLV76TPEhztGZa4uXD3he0eewvJKQKwvityKLpggQmSL7TkcwhFCnqar1CRlQuo5
         5ayxLQAtMXTfqSa1GEZjVeKcuGD98J7nXtlrZB4b2xjnGGIncL+84Z+wjOb7BT7vDkkC
         xkPRER09wroc/Z2R4FCghsKHAt5jRYBSGceV5sYObZvBXsJTvxqwPxvvZF9vrlusNN+O
         G1PA==
X-Forwarded-Encrypted: i=1; AKwUvByLLC3FmEVD7dy2oP0O0BvsRdYbWeuBentqMsB/8hLZRXCud3X/YQo/++n8y3EDxMtWLa+roKDe6rrOei4=@vger.kernel.org
X-Gm-Message-State: AFuF++lMqxYDteNFFuflXuOj0iUSYDutpkVcFW9kjZ8qJCSdPFDZjteO
	0dgkhm+9mXH6MLq6WCKlxDJLbbVwVlBy+c2cduUozioVADWyf+8iTHWHrSNwnG6X2n+PZOODxDD
	ndTJN0QTjSg==
X-Received: from dlbsw8.prod.google.com ([2002:a05:7022:3a88:b0:144:c32a:6a84])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2906:b0:144:eaa7:2917
 with SMTP id a92af1059eb24-146ce67f240mr8997537c88.10.1790620030109; Mon, 28
 Sep 2026 11:27:10 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:26:05 -0700
In-Reply-To: <20260928182605.3649015-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928182605.3649015-27-irogers@google.com>
Subject: [PATCH v6 26/26] perf test uprobe_from_different_cu: Scope probe name
 to PID
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Howard Chu <howardchu95@gmail.com>, Jakub Brnak <jbrnak@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

perf probe names the event after the function and binary, so concurrent
runs, as with 'perf test -r3', all add probe_testfile:foo and all but one
fail with 'event "foo" already exists'. Name the event foo_$$.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/test_uprobe_from_different_cu.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/shell/test_uprobe_from_different_cu.sh b/tools/perf/tests/shell/test_uprobe_from_different_cu.sh
index 83505093257d..33bf36c4037e 100755
--- a/tools/perf/tests/shell/test_uprobe_from_different_cu.sh
+++ b/tools/perf/tests/shell/test_uprobe_from_different_cu.sh
@@ -17,12 +17,15 @@ fi
 
 temp_dir=$(mktemp -d /tmp/perf-uprobe-different-cu-sh.XXXXXXXXXX)
 
+# Scope to the pid, otherwise every run adds the same probe_testfile:foo.
+probe_name="foo_$$"
+
 cleanup()
 {
 	trap - EXIT TERM INT
 	if [[ "${temp_dir}" =~ ^/tmp/perf-uprobe-different-cu-sh.*$ ]]; then
 		echo "--- Cleaning up ---"
-		perf probe -x ${temp_dir}/testfile -d foo || true
+		perf probe -x ${temp_dir}/testfile -d ${probe_name} || true
 		rm -f "${temp_dir}/"*
 		rmdir "${temp_dir}"
 	fi
@@ -83,6 +86,6 @@ gcc -g -Og -c ${temp_dir}/testfile-main.c -o ${temp_dir}/testfile-main.o
 gcc -g -Og -o ${temp_dir}/testfile ${temp_dir}/testfile-foo.o ${temp_dir}/testfile-main.o
 
 perf probe -x ${temp_dir}/testfile --funcs foo | grep "foo"
-perf probe -x ${temp_dir}/testfile foo
+perf probe -x ${temp_dir}/testfile ${probe_name}=foo
 
 cleanup
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

