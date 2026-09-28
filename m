Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859D7396561
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620001; cv=none; b=MUdZ306Njfu1TBZGXJmYcSUpnHUjFyifioHWoT0s9gVKNOT4J7OA+z+o6mYEXbaUixmfAIUehSyPFYfGBHiuftMmZMh+d21PQrmziUTyyPHN9poCWAWhkJ7qROWiJETizVNYtw39drrZKYpHhFRxx88Nt/s5gfIDiY8YyRN1QBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620001; c=relaxed/simple;
	bh=+a05Q2428FCe7YhJZh9qZPE9IPSwYKKZt+pGEcJC4Ac=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DDR17+O/VOVOw7cyxaPotAGRJe2OHNu8JJqcWcyh5r1onFffnAXcWoIhJ5kvvUIzddBC9WI1ddc06oM4yW/C0SfIxS9qTmDovdjMR3Bl6QLF3gmUFhRnqz9qE/orpU2lVUNK1is4dcG095YBm8SJHiMFa+eZmaUCewOdn6t2OuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nIL4B4YX; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nIL4B4YX"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30f1b904861so4840067eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790619999; x=1791224799; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4hFD82Af3GD/0O4jphB7A4i7F+gxI+oJkaQQHxtJQk=;
        b=nIL4B4YXcyLC52PRAzS+8dHXuMq95BMPD/XXr8wg0aXwpDZo6eBbdjhYkRSjBtKwUO
         /5E1NAYeHzUKx7nYH9PoXm3lkVOH5zX9N30ZvoO43DzomJFr5gzj1anWJzKnX/7C2YH1
         eiVgCNNOqcuL3blQs31RIebD6ebns9a8G2c2esuC/vPMJN3Jn5waH02AVC31vslZro9O
         JpOxlHy/fvMd4rwDE1hYZGGc4EL7WIgIVpA56XiTHk0Q/a6qfsGna50CFPysey85to8Q
         xz39pmsx09wnKutDTc8x8oZMuKD/gZUTdqUTOflh1SpzdGlFOrg4+hnD0nop8/eL8XAn
         +wpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619999; x=1791224799;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4hFD82Af3GD/0O4jphB7A4i7F+gxI+oJkaQQHxtJQk=;
        b=wXqy9c16cTYR4XyaEk3LWMxctmgOURVW6B8HEbrexaJIieWCYHHKB9hXESgOJa93LQ
         cYNLmcvmgqMWscpQe3DhBAJBKsVRz+BK3DLtdQQBP6LbPrzSlTTx3EISOtqjoOhL+G3i
         Nn/yca4g2WYsoP6COHirwtRSdO69CHTQPDZTuzODshKhlZEJwhkoUuKNXrLhiAqsA+d8
         OXDeQzp7hw/P6EusFlXvPIXYKAdwg1JyiIF4oKLrUdAbSEab0LCs+4UaJsQ/+Aut54oj
         rzkAwKdalX3tfSw53l+tbL+trU9QQNZRKge/6+ijn3PWQ6qTzZ/jwBHbSDhoZ+NkzhFt
         cKnQ==
X-Forwarded-Encrypted: i=1; AKwUvByEomKzfx+MvP1aHZNjQdoKA0wnF4zUCTsmztOfzVByMRXMWAkuxJnYmIjRrNcZal8C831K7shk/H8Vp7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l2SKkc9neNAhahq4JXzdpIH/Ou/qQNDujNnKWRMVnlhlaowRJQ
	nuASjNzprVZLwmug8UpbU1meEmWzaOrf99t5xsIajXWvcEO4sHXu1C79F30EgaqR21St47EX9kK
	MA7zrtmssHA==
X-Received: from dlbsi8.prod.google.com ([2002:a05:7022:b888:b0:144:bbd4:62e0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f0b:b0:14a:a6dc:9ca6
 with SMTP id a92af1059eb24-14aa6dc9eafmr1619767c88.3.1790619998252; Mon, 28
 Sep 2026 11:26:38 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:25:51 -0700
In-Reply-To: <20260928182605.3649015-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928182605.3649015-13-irogers@google.com>
Subject: [PATCH v6 12/26] perf trace: Use the CPU map index for the BPF output
 event's fds
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Howard Chu <howardchu95@gmail.com>, Jakub Brnak <jbrnak@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

augmented_syscalls__setup_bpf_output() looks up the bpf-output event's
file descriptor using the CPU number, but the fd xyarray is indexed by
position in the CPU map. With -C, or with offline CPUs, the two differ
and the lookup finds another CPU's fd or NULL, leaving those CPUs
unaugmented.

Use the CPU map index.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf_trace_augment.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/perf/util/bpf_trace_augment.c b/tools/perf/util/bpf_trace_augment.c
index 0f510554ad9f..7087849031e6 100644
--- a/tools/perf/util/bpf_trace_augment.c
+++ b/tools/perf/util/bpf_trace_augment.c
@@ -76,8 +76,7 @@ void augmented_syscalls__setup_bpf_output(void)
 
 		bpf_map__update_elem(skel->maps.__augmented_syscalls__,
 				     &mycpu, sizeof(mycpu),
-				     xyarray__entry(bpf_output->core.fd,
-						    mycpu, 0),
+				     xyarray__entry(bpf_output->core.fd, i, 0),
 				     sizeof(__u32), BPF_ANY);
 	}
 }
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

