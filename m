Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0953876A1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620003; cv=none; b=Z4CpFxPNUHeyhEbKRatFtKveuMrugm2x7qyDslySBEqziRRkr5jY1s+gryW0Sc/nsx+HgtFxhZSGMsfQZLQ8MiNOkzHPyANV0gDY+GbW5wemz9dCcV9JslP/iBqbWNYXcMJCf6EY3H+snHN9ZEWFpkJaePsYiyeB9dtq/LZNPKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620003; c=relaxed/simple;
	bh=d6Jia6shJnEsvn+7DkSCwlIUFX+yebRVtAYefE3LnLY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IKANlozu2YiDGkViVHb/2AgKMOIvoTSD9oGIrZvBMvR/3aBCcQJeghM8Ufjuw6C/aGoRlCzCgybs/bbh0A1+1bDF0tNMy083zxwKa8VL2wehY+Kzaf4w7S1rOaLiz2LPgE6y7XTL11l24pbFJWIDTRhAcYVajFuhuFBBp3hm/iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nn0xuH/R; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nn0xuH/R"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34318e88ba2so1662722eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790620001; x=1791224801; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nD+ns8qMM9tH+0/vUNsoPO2N/rVrE9EhlSJPzvMTrlA=;
        b=nn0xuH/RoGyEZi2C9Bheh/h8V5+lbq3SxhbNzc8WyFla158kEyUXGFGuCt+wnLY1Dx
         0eh1zg2V5aVNUXU+OyxEdhC35hhs/d+qg0AivyVp4w+PKG7WaTXBNzjCbbKNzsgE7kZ8
         YqD4EQj293ekkRQraAiIcVd8PR3NZEBnHZKpss856RpeeJn2k7is5ZnU++3Pi/eN8K9D
         t3nNpQa8B7Zzw56etF+qtL82+kR/JEhPEPUavM1cf7hQNXSgzdkmlCWtYSyKyQ79NbhU
         zMbagkvNi5O8geftfEWh8LoG156VCMbvm1wtHCPoCCg3jv0yvH6dYgyHNGOWDuChlyeQ
         rT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790620001; x=1791224801;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nD+ns8qMM9tH+0/vUNsoPO2N/rVrE9EhlSJPzvMTrlA=;
        b=SYK6EWnDgp9rDUZ1uSH5sSSrmoJdD/tU4yGt0ODd/akB7NDZV6Hip0x6hasML7p8IU
         Qj3xlBrqPdM2alrMFUscWu+Z98+dep/1G1tTyIUPokWXpURt1dgF2Oqan6pIUk1XEVTJ
         hOpdrJgo9OQen3BHA8LcCwbLXLoncOnI2Vq1LX/TYkvvMGiETk16YFOT79hKR1lT5Aj0
         iaPpojvui0Rro2Lgv7mx9d2SfpjHZ7BU0n6eCJHpBWlWfYhnd6mCjY/kXTtltUqnbYRH
         YXQpTJzKbQtweSv1SWTbwRjJQ84Exr+UsuJ37P8/44MYFNeaR/AQ4KpB3zSH5MNwYpVf
         9rfw==
X-Forwarded-Encrypted: i=1; AKwUvBxMBLQkg2wO/fApZSJhMmwuYbWwj6j98FTH3JEMgVXgNZQbrVlMlKYokARyVokIjhH/ZeY9AkDovKhldBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYDLkyuAtTdJfw0eJQzd7bZiR8rHX7ehSin94EFQDzh42seSIg
	yO58ni0UQoVR9KDFVEp20c82TVgGbywGVsfs4xrl0s+LRLK/UZPqA31hsMTiRWHNiiZuOD6EK8T
	k4CkxLOWg9Q==
X-Received: from dyw26.prod.google.com ([2002:a05:7300:881a:b0:33e:ce80:c3e7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:4301:b0:343:311a:372d
 with SMTP id 5a478bee46e88-343311a386amr10379142eec.28.1790620000444; Mon, 28
 Sep 2026 11:26:40 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:25:52 -0700
In-Reply-To: <20260928182605.3649015-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928182605.3649015-14-irogers@google.com>
Subject: [PATCH v6 13/26] perf trace: Destroy the BPF skeleton if it fails to load
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Howard Chu <howardchu95@gmail.com>, Jakub Brnak <jbrnak@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

If augmented_syscalls__prepare() fails to load the skeleton, perf trace
falls back to unaugmented tracing but leaves the skeleton in place.
augmented_syscalls__set_filter_pids() then writes to maps that were
never created and fails with -ENOENT, so a system wide session, or one
using --filter-pids, exits with "Not enough memory to run!".

Destroy the skeleton on failure and clear the pointer, so the setters
do nothing.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf_trace_augment.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/util/bpf_trace_augment.c b/tools/perf/util/bpf_trace_augment.c
index 7087849031e6..daa79a55c795 100644
--- a/tools/perf/util/bpf_trace_augment.c
+++ b/tools/perf/util/bpf_trace_augment.c
@@ -37,6 +37,7 @@ int augmented_syscalls__prepare(void)
 	if (err < 0) {
 		libbpf_strerror(err, buf, sizeof(buf));
 		pr_debug("Failed to load augmented syscalls BPF skeleton: %s\n", buf);
+		augmented_syscalls__cleanup();
 		return err;
 	}
 
@@ -146,4 +147,5 @@ struct bpf_program *augmented_syscalls__find_by_title(const char *name)
 void augmented_syscalls__cleanup(void)
 {
 	augmented_raw_syscalls_bpf__destroy(skel);
+	skel = NULL;
 }
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

