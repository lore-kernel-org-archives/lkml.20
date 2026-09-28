Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E17C399D00
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620010; cv=none; b=csgMlWJjAQDgk6OqZgWJ0oXFClSaV7FxVhCC0BibCvm7pKdzxzSGQsvWxg6ZaW7GK8A0iud1gTnjgjQejtEV9LKLlKy5oHYs1fMPcrBew2SAvP3wNI8JAH1uqWT6vKlkgPzDTVFYscUL6dB5tnJGVmcTA85L7goy0b1j6VyD1cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620010; c=relaxed/simple;
	bh=stDGIRV3yP7UdnHBd91hd7iMzaRmovCfg0lN/hm+d1o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NJwU0lRQaAyZDjAmdVvIztXBdG2Fgbuo9BhdbTFQPW03mxGbpjLx9J+k4WfnyTW9/PUKMmECfDxUcLo73SR9xq28wAS9z16/yhiRKc4eQ3gzv55BafDZXEZXsmlMOyT8iPh5D5cSLUZegvPsKQyknFljdwcGkG4/8Nap6ZSU7Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p0P5/qu+; arc=none smtp.client-ip=74.125.82.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p0P5/qu+"
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-142f4306744so9203692c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790620008; x=1791224808; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ps0C/R3sEFiSzvb3Yj5BZSk3NqGRn5rOIsit9hxlM0=;
        b=p0P5/qu+gMjawWWVwcnEdcmZsXAIKHSXneDb1+dXKpNCou7VHKsX+GkfiTqLitBA6t
         MvKMzGMQyp3n9skLSMn+ei4yQqAS6yshqjJYweLM5fu0c+6B7dn8ixVtOwmN0xbAMhLH
         lRTwcDPWVvSx1gHfTQ3quU8paK/GXqo9uIgcEzJ5hLTHmhd+0I5gRRZm/mZGOxA2uh0p
         +0KodFI2YgnZdaQkWN2dsje1OnBw0ka4jRq/QPLHXxm3S6fSIfUNulcHhOCo+CP0IKbW
         qt8TOFmyZxU25CLDruBgXg1Bg55ALEHTGYAjXXGxw5reu00an1RYHO0K7uRe+ZPMJXuW
         xnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790620008; x=1791224808;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ps0C/R3sEFiSzvb3Yj5BZSk3NqGRn5rOIsit9hxlM0=;
        b=jJY5BApZ2kag8Usz4jRwzODILk7a8Vv/t01hKd11+873m2RLrLu5DoBE4DtCmPjnzL
         OA1dIZveYY6vqpemzLTVW2YMTGF6XpQg1Lbty2IFfDC11WhzcnZwb5Bv8M/HkyvBAzCp
         N7gvTSkJZBmk9hk8d45Y1Z7bcJ16GMDTNiUbtdIuaJ/oB5exTfbhD2AK3Y6m9qIIROfp
         Fkt4fWNvwWEttgFwXDZiudcO+cHM9XvIucQqwYy0iSxKaSBvTfGgDEUjRQIDIfH7zFrr
         AgrnfAdCnEypztFrHNZCnkwYyGeEuiQEE3qq/UKsZYbSe0zZjMCcXi3uUYzAcj6qNVLu
         offw==
X-Forwarded-Encrypted: i=1; AKwUvByYtbxGOfNDpVGEzlcCwlzG5oOycNQ6EGPifMyddfOVHOIGEuB50WUkOuE+2zcVBkzN6iBgkC2eF7NDjk8=@vger.kernel.org
X-Gm-Message-State: AFuF++nCYh9u3oj5LnHjyFues8JV3zxKuL8PreN0UybTpppaRAJQ/po2
	7EyPKDeJZoZjQxVR0fWd1wCnL6cAANxAvifSy+uwKv8s5RYXcWqFp+zXognz4kFkRDhrBvH15mc
	mDuokRq7b1A==
X-Received: from dybdx31.prod.google.com ([2002:a05:7300:b19f:b0:34a:f2c6:9e54])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b0d4:b0:143:3fa1:ed02
 with SMTP id a92af1059eb24-146ce67fc6dmr11361226c88.9.1790620008261; Mon, 28
 Sep 2026 11:26:48 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:25:55 -0700
In-Reply-To: <20260928182605.3649015-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928182605.3649015-17-irogers@google.com>
Subject: [PATCH v6 16/26] perf trace: Open the BPF output event on every CPU
 for task targets
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Howard Chu <howardchu95@gmail.com>, Jakub Brnak <jbrnak@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The bpf-output event is opened per task without inherit, and
__augmented_syscalls__ holds each CPU's event for the first thread in
the thread map. bpf_perf_event_output() only writes to an event active
on the current CPU, so the target's other threads and its children
aren't augmented.

As BPF now picks the target's tasks, open the event system wide. A CPU
event isn't enabled by exec, so for a workload enable it when opened,
BPF waiting for the exec instead.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index 81d660bc87b9..ee844210e281 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -4784,6 +4784,15 @@ static int trace__run(struct trace *trace, int argc, const char **argv)
 	if (trace->cgroup)
 		evlist__set_default_cgroup(trace->evlist, trace->cgroup);
 
+	/* BPF picks the target's tasks, so take their output on every CPU. */
+	if (trace->syscalls.events.bpf_output && !target__has_cpu(&trace->opts.target)) {
+		struct evsel *bpf_output = trace->syscalls.events.bpf_output;
+
+		bpf_output->core.system_wide = true;
+		/* Exec doesn't enable a CPU event, BPF waits for the exec instead. */
+		bpf_output->immediate = target__enable_on_exec(&trace->opts.target);
+	}
+
 create_maps:
 	err = evlist__create_maps(evlist, &trace->opts.target);
 	if (err < 0) {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

