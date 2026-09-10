Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852C44718C1
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076358; cv=none; b=s7VeAMBZzmO3MmYrvJ93Ss2x/my9tiP8mpF6/7eUwOWTCiA7EKKMKWCY01izdbxmlVYHduEqmQgCsyD4RVTShgvQ/isqIfDPeC4PlakTCo4Gx5SOHbjQohW285M8PAWFfiiKkqJwI4UsaOQW+gPu5f4TkLe8OkHmdf2d0G1dFww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076358; c=relaxed/simple;
	bh=VZ7i9g/d+H47coYO3Xc9M1wiqaAKR5dvjmJyK4FiQPk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=Mc4fseOFrFJqosE4V0wOdHdfFfSILrm0ZKl2LjyluADaDonAeCXKNrh2GapXeq7OvmAdF0JGiRDx7Q0VIZgdg11yM/QvqvwA+Hz99TNkqiqVf8yzAxvIAy4OV70IGocJMu/QUotxFivaRQN4/2XExyBhGly/SNcYzCYTFjAKOJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=psf1nRm8; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="psf1nRm8"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso345205a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789076355; x=1789681155; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6fbf9eOsE32d1ZOxCGBZBdmKD77pEwD9k19mpGO+TR8=;
        b=psf1nRm8pyZ5OcEswNdDl0zaYmyEuhYApnmTgbLffPHub5TfTThZtLyvuUMbDc9zIk
         FAIkxnHKlYQLbdGs/BXNcqHoFEVScS9yR3RMzEOPoRizKNHogmGoMlwNph6h8N+r6BS2
         3UxXIddPQPrwadzGSTHcR3jwTlbH7sXcka+pr9lOq/sn5hI4sDP6ffVLs7fjZF1KT9jV
         5kOXasWCt11pEOPr2uuX5DUwRl5Pli4v2VSsBuPYhikNafzeTV0iGbxjxmhLeXyAcSzT
         tmjEewAe+MYR7MOhZnrJ6Pg2Bb/T69PEFH+07Ccx2M5v0otGVlPMdqXyv+GPRatjmnRs
         VWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789076355; x=1789681155;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fbf9eOsE32d1ZOxCGBZBdmKD77pEwD9k19mpGO+TR8=;
        b=HFxoGTyRobB1cVh9dyOT+TiOqwp7WnPhiIRFHMRJw19rjGNefj5Ft3f0HxOtJRltzj
         PyebnrZr3ftvIJAnYS3oy5j8qIh8fbGB4gLJ4TLQ1V9e4/tgHEB3iuHfR0Nc4VdibDQI
         34UO9cepqkgrzOldOZpVRZqd0bBwN5p8JAPxhs1cDc6z/M/XlHl93KfnV2AVkRZiWnze
         YJ+LuID+aeaUP2+DYMBOYhaUy1a9P9A1mTkv3c6ulRB2y5LdkKe3+mlbxnGZ87lTuM/T
         tISkkDdTIJ7BwKwI7QtVvwFYoYMgGa/Lojxp0g7pvxXUG2dyFnCYx8ajhk/jNnQLfLmC
         w1LA==
X-Forwarded-Encrypted: i=1; AKwUvBzY8poEzIE+PUrVmBUpTTGC69DtmNlIFnBrWwRb0Ky5x45naS7eGMl4AfgW8/M+uVb4kfXZ1mL7rVUprEo=@vger.kernel.org
X-Gm-Message-State: AFuF++nVtXRfLbavB2NGt/byGmEAdPVlbZw7ZpEP/I98HWIZBiofIWwc
	uoS/BuKNO2LVsFwqNoYWzdk3wQ4VZaVUKceAZA4dWHkdaLOJiITrT2BdG2DT9gLBNJplnLALKkW
	dDcocWQ92hw==
X-Received: from dlbbq8.prod.google.com ([2002:a05:7022:6708:b0:143:65eb:f1ec])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c8b:b0:398:9c00:29ee
 with SMTP id 98e67ed59e1d1-39d9c38fa48mr1037351a91.22.1789076355117; Thu, 10
 Sep 2026 14:39:15 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:39:07 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910213907.3206529-1-irogers@google.com>
Subject: [PATCH v1] tools build: Fix timerfd feature detection with clang
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Clang's uninitialized-const-pointer warning causes a feature test to
fail when building perf with clang. This disables support for 'perf
kvm stat live'. Add default initialization to new_value as a
workaround.

  test-timerfd.c:15:30: error: variable 'new_value' is uninitialized when passed
			       as a const pointer argument here
			       [-Werror,-Wuninitialized-const-pointer]
     15 |         if (timerfd_settime(fd, 0, &new_value, NULL) != 0)
        |                                     ^~~~~~~~~
  1 error generated.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/feature/test-timerfd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/build/feature/test-timerfd.c b/tools/build/feature/test-timerfd.c
index 9c72c697a9df..f88e8cc63ef3 100644
--- a/tools/build/feature/test-timerfd.c
+++ b/tools/build/feature/test-timerfd.c
@@ -6,7 +6,7 @@
 
 int main(void)
 {
-	struct itimerspec new_value;
+	struct itimerspec new_value = {};
 
 	int fd = timerfd_create(CLOCK_MONOTONIC, TFD_NONBLOCK);
 	if (fd < 0)
-- 
2.55.0.1007.g17ff1f9808-goog

