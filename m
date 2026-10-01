Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3352FE56F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790822071; cv=none; b=kwvJIQClfeA3Ps/Ed9hDXyi2XVhu8p/tJKcDmyyiwIBYHCUIOaxuyUpJ067yuroruOI1qILf+Z1ckkkehzEf2CGgM4UgZMH7uJ8EJgfByL/nWWeiMFINIBG8ynjW7Lm8/j/TNBBk4fnaBvCGcw2ZgcyC2cpfi+GzAOG3q/4GtR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790822071; c=relaxed/simple;
	bh=tJLSBp+kNBBrje5fIBKYtbV2LB4PHDOtdNFnpagtoI8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=ulxC3C+m/BsH4umdUxsMmCnBrcc2LxU88NSKFABECqnMpWNttstKyHH7MRFw5EH89p7r2TfknoTyUUigGqA6N8/tB6sCnolDtuWQ+sGgluN/DgDlInOMIJE0lygaznnzDrXdpUQiQ85oUWmptq8HlKRSi+rB3aDTyRX0TcqxbtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OYSo1Hek; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OYSo1Hek"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d49d8dee1so1340424eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790822069; x=1791426869; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZsT3C+uRh/Y1Rc7z9nbR/I76xB1e1WP5VpKrJhiPQsc=;
        b=OYSo1Hek0SlakenuXgpd+v3gZ0WRYrxDx7jKpUPtqCV2Ksm0c8yVDDMaYBlanyFqT1
         RQkcs+/Z7LQcrwAhP4udFwAWCkVjOIY+Psq2O00BH5fMQ0y+6lowUDqQ9McPRKozlVrs
         8Dce8crseO5ecigumwy54N98kUjXSdx/D9vCn8BWkIRrvnrc+zRQBkYd8V2lCOQk2lLF
         KZplq4oMxnXP1fTakVCkhlLK94j/oFBGbIqnjzB/R8gZg2PUEGGnjslvz3MU3DHYQxmE
         Y+UwCCcPbuIVQ8TbzFY6EYTdJwcjcSKSYYqJKyWgM/ljWsnDCBY3BpO4/LwHyNE8MIb7
         f9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790822069; x=1791426869;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsT3C+uRh/Y1Rc7z9nbR/I76xB1e1WP5VpKrJhiPQsc=;
        b=kX03G6Z7mZOcR5qSRNxDZf+tJIr6s2rNqau6mZjw92P8JclnfmzbOo16xNmpH4bvc9
         UUq1Fuv/oq3+y0DwsPSyGJN0JtzMarFwISqCB0olHT14isrO+7LsEPSp0ihKENEe+IWY
         MyqLzH8l5E6cWs6/72ZBmqMqB7ij+8sweHUxDbvrq/N70jqfvEST8CPcUsoGu9Yc3aJS
         ZQ/xAQ/JArCb/DDEUP+JIn+mQznEceyL+xVIP6m4udkzkuq1fgIZESZIVAczbF8ueBlx
         xuSVKDSVPGD8R2Lv1AaNNaF2iFy0zSGztNoZPsgMSJFfHlqdAPwe6hZ/ZD//GZZuJvra
         rwiA==
X-Forwarded-Encrypted: i=1; AKwUvBwgTqY4AM759G4o1Bt4T2Swl2Q6jkCUGJQN8DZbtykYLfbgC6NcKzs/Uwe/lQpr9SNYooxpOXOIgMgEAnw=@vger.kernel.org
X-Gm-Message-State: AFuF++kjcIy1tOo6BsR3Ka6vXPZePTjDkVGfbU+PR4/0tp9AE4ICuOWw
	CkvivYOwinO6DU1hy4xwT+T/KOf7SVaSGnXsvekNgOkaz6sZ8gAmzK8n41pg1/ByaIqLWFgJf67
	4TcmQUsVWhQ==
X-Received: from dlbui24.prod.google.com ([2002:a05:7022:3d18:b0:148:9dc:8414])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:c971:b0:14c:1f57:3ea9
 with SMTP id a92af1059eb24-14d32ec4886mr4253224c88.26.1790822068732; Wed, 30
 Sep 2026 19:34:28 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:34:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001023423.1225713-1-irogers@google.com>
Subject: [PATCH 0/4] perf build: Linter parallelism and clean/install
 dependency fixes
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series includes a small Python test cleanup alongside build system
improvements for linter parallelism and clean/install target
dependencies:

1. Update tools/perf/tests/shell/lib/attr.py to use argparse instead of
   the deprecated optparse module, avoiding a pylint deprecated-module
   warning.

2. Building on Leo Yan's recent change to run pylint checks on
   standalone scripts and tests in parallel with linking perf, move the
   remaining shellcheck, mypy, and pylint rules (in tools/perf/Build,
   tools/perf/tests/Build, tools/perf/util/Build, and
   tools/perf/pmu-events/Build) into top-level phony targets in
   Makefile.perf so they no longer serialize archive creation, jevents
   generation, or final linking, nor wait on $(LANG_BINDINGS).

3. Clear GTK4 via 'override GTK4 :=' in Makefile.config when the gtk4
   feature check fails instead of setting the unused 'NO_GTK4 := 1'
   variable left over from commit 4751bddd3f98 ("perf tools: Make GTK2
   support opt-in").

4. Fix missing dependencies and target ordering for clean and install
   targets across Makefile, Makefile.perf, and
   Documentation/build-docdep.perl.

Ian Rogers (4):
  perf test: Update attr.py to use argparse
  perf build: Run shellcheck, mypy, and remaining pylint checks in
    parallel
  perf build: Clear GTK4 instead of setting unused NO_GTK4 when gtk4 is
    missing
  perf build: Fix clean and install target dependencies

 tools/perf/Build                           |  8 ++-
 tools/perf/Documentation/build-docdep.perl |  2 +-
 tools/perf/Makefile                        |  9 ++-
 tools/perf/Makefile.config                 |  2 +-
 tools/perf/Makefile.perf                   | 75 ++++++++++++++++++----
 tools/perf/pmu-events/Build                | 66 ++++++++++---------
 tools/perf/tests/Build                     |  8 ++-
 tools/perf/tests/shell/lib/attr.py         | 37 ++++-------
 tools/perf/util/Build                      |  8 ++-
 9 files changed, 138 insertions(+), 77 deletions(-)

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

