Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ED537FF48
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833288; cv=none; b=r5PiHX51O2TSbOEjOoD81Jh5IYaz0HU0Qax9LGkmSnvqR/zZ2bqbs0aCplT/XspsEBWkChKaFjzwE+wCQIq2oaEf2Z8kTatAJaJ0irytF0UmTlsmGIFYgMK5cZcvKYcJ886XapxpvRXn4UKQFyuFwuKizhfyDWfkjL0xytjQh9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833288; c=relaxed/simple;
	bh=WjVNvpnW39Z9FSSf9jIfV74czDToG+2Ow/s4nWQO0w0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bYDCye7PZ+Z4kXsUPA8OuMaL+JBGvcSzmCwySO09kCZw+vNIlSFAFKTx72PE71LukCrlYDIdP6l0riLEVkOoWC9Vk1WZTwiwHVdpM+bexJp8Dj+G6Av7/RBYHphi+W36M+0XOooWWqoqM/aIr+qXAfNX8PXg7mG8DUFAQ830B1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BH8BJJHK; arc=none smtp.client-ip=74.125.82.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BH8BJJHK"
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14a62326b51so3872676c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790833286; x=1791438086; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyQ27rFL4XdC03AH/K2HB/r6yvJwFctKIKLZb0YVYgo=;
        b=BH8BJJHKewDFsjAUM181971gji6iWNOEWZXsHIVAq99KYLO6+S4rI0a7cs72Wq+FFK
         WGd5aNB5gj98AwDxBGfzv/233Tjh66s3yc7nYiyg/LH9JwPQiuuiDh/aXIZ7gJHb9qEe
         zxGkNDdDrq3SqyhQuEuWm/9KwAUp+WsbpwK05NKi+qKwG1cnESnuqHmRJUaxTSCw/w8/
         MwYAgNT1oxvbKJ66T3FdFy7qDtVzeRVKp0bp4rz7528zS/c4gVJQCd8Vr3BOBLOYCgjz
         Ll9l57cInAyp2TXAckKRP62AkovRD06FlJYaaLhCF8etSBF2DtJGT95KXLOVuSACMmp6
         hXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790833286; x=1791438086;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyQ27rFL4XdC03AH/K2HB/r6yvJwFctKIKLZb0YVYgo=;
        b=F/Ln0WtIBNPBogSMHdrYGsyAlaPkfXrDWHAaiszaRCFmqivcH3Y72/HmAK7fUp5WzA
         q4y/AQkXmqG5vlPZJbZgfw+Yv87UC7LueJwOJhQ2saYhHiUUqF10nIwnQR3sAAajwUFB
         KaNiCjcWaUpheBsK//7XUj+7RbaQzobS87gT8Kg9dC6kHq8lSiht+n1DhMvKyCGMZCHp
         UvKEH17+z9XeyRv4x763SRlp6b2PxDeZyz0d8wY/10Lv8bqcb3jFAWwxLiUd/Z9MpF39
         9sLNasSwDRM5j2ZL1Xy/IQl9qHG5d11HXPL5C407emdH9MRvPyntU2TvnkLqBgm9DZyc
         PO8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxQIwsZkRvHUeWLm0aVU2lZSdjLUoW78h55M76gpxVgL1I6LPLJvZhUItYxEkH7yhxTCG50AGHjDGxG70M=@vger.kernel.org
X-Gm-Message-State: AFuF++krV3p5xwMUWD78U/aQE8niW+oZUw05Vt6ZAurQcOUWmlshnwJC
	/38+wbcUoXB9Gr041iq6hXwP3cbU2Ag6ZhTW7F2D9YqzMVRZxVECxaeVWhdEXFeJclLxp3HrXo+
	qfxi/I/0vEA==
X-Received: from dlbqs3.prod.google.com ([2002:a05:7023:d03:b0:144:e316:2636])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3a04:b0:14e:6b46:6494
 with SMTP id a92af1059eb24-14e6b4667c2mr554777c88.4.1790833285583; Wed, 30
 Sep 2026 22:41:25 -0700 (PDT)
Date: Wed, 30 Sep 2026 22:41:16 -0700
In-Reply-To: <20261001023423.1225713-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001023423.1225713-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001054120.1570943-1-irogers@google.com>
Subject: [PATCH v2 0/4] perf build: Linter parallelism and clean/install
 dependency fixes
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, leo.yan@arm.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
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

v2: In patch 4, exclude 'install-build-deps' from 'install_goals' in
    tools/perf/Makefile so it is not ordered after 'all', and explicitly
    order non-'clean' targets after 'install-build-deps' when present.

Ian Rogers (4):
  perf test: Update attr.py to use argparse
  perf build: Run shellcheck, mypy, and remaining pylint checks in
    parallel
  perf build: Clear GTK4 instead of setting unused NO_GTK4 when gtk4 is
    missing
  perf build: Fix clean and install target dependencies

 tools/perf/Build                           |  8 ++-
 tools/perf/Documentation/build-docdep.perl |  2 +-
 tools/perf/Makefile                        | 16 ++++-
 tools/perf/Makefile.config                 |  2 +-
 tools/perf/Makefile.perf                   | 75 ++++++++++++++++++----
 tools/perf/pmu-events/Build                | 66 ++++++++++---------
 tools/perf/tests/Build                     |  8 ++-
 tools/perf/tests/shell/lib/attr.py         | 37 ++++-------
 tools/perf/util/Build                      |  8 ++-
 9 files changed, 145 insertions(+), 77 deletions(-)

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

