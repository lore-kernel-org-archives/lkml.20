Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC893470121
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147695; cv=none; b=OoA2Oz3MOniRWg+LnyFMxy+fyRT9syUayIfa6QQBfxufib7uuM4PksJwULnZBPc8bFkKpXKkihcHJ6VLEoH91rhvvQtd6lgBtgiaDG5YocpB88JUPQz5rAIfjm1sbreX/mgnOe24uoz+6t9Umr5q5GccJmbbskp6ngtr6PLk9X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147695; c=relaxed/simple;
	bh=KGH4cgsh9c82rZCy3EbUZ1Nz6yfT4Ky/9/p1lniOs14=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pQZwKXpL/LfpC60UQQR72+F8oHR6c3RjpyyqpWm001Xg4CjQ6wAf1/gnEf6dyiPYxLN+lR2sSGe38IeeLt4+bAC+Tu2Zno4ULI3YxDr8aTI+o46zUd+QTSQU3mAZSCS8BqpdnHg/h7D0UTcCms9caYX0GltX6/NEqrrqROD4XDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q7nP1fY+; arc=none smtp.client-ip=74.125.82.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q7nP1fY+"
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-143580417b3so2225192c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790147693; x=1790752493; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBEeTTvqxnVeietl/aALNcp5Orw3ILkwnjTixQhwTwA=;
        b=q7nP1fY+EcRkEITFhknXCmHLg8IET0ESHRLQmYv11JBSeVNCF69IbONIlcIonQNCof
         xgOUjv5L2m2cPPIexgVTywDRYgDYeT1/DECON6a5+Z6cVvEJPgfKylhwsW5R6IOANTze
         giZ3x9ZywAuWAAJvkGZYKmTBpU21A7BbE5vs4zOYxZsitJL4iGr4agYsYeqQkHQNmgAp
         7v1gnUNp8RnF5fs+/c3RWdPwjd2izih+SbZ4Dme/uSYJN7S47xVvzoWhIkR1v6zcCD50
         uO3m/moB1ztzOuOzPs8YMZRYWe0W+CMr5mHxONPYDPxvDTWyJijR1km4YSOECOXonxYn
         3+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790147693; x=1790752493;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBEeTTvqxnVeietl/aALNcp5Orw3ILkwnjTixQhwTwA=;
        b=kGrr2bcIR0cx88lrwcy8TueXS0JEiNgHziGOjZuaiiCFsLMOrPM/LrNG9JKGYos6CS
         641GOuEjGhoGBP93aPIQTkbJE4xfSr8lSe+n1/6qO3r4WZfIZ9eUDZDh6G41DeCNZeJu
         VL0YeugMgliZBUO0qS1We/NNFx9cozA9RWA5eQHYozw3cU+FuVDyypbFaDo9dzdE7AYQ
         NBHNeBG02h5VS/H3UmJerrjSsD5vPpl1s3C6JuPcbNBy7O7+FtDeFXwlwtfb3HA9E0RD
         9x7eXunz4OX6P+TfNL+Rrz3w7O82ft3FiXPTBMqQmX8mN6etK+s2V9+Dh9Ik7iIp9HHu
         NsqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTnM0n4htTlyGnGl6Ppw3nHg4pnyHMzrEHVmS4xlhFWd0wISqmEnDa7lespuZjI5szkXZlwNKre2mKHFE=@vger.kernel.org
X-Gm-Message-State: AFuF++lPv06Odj5f8MvhwEHbMz0t01ubkma8VYvkMGrqENe1ttIH7REg
	P5yHBXoKfH/uS9UNDB5G7z9AG87OBOLrZOpvrIxfUB2oy15IPj3KUpHfdtDjUhKhCTXLSK0x2/C
	ua24IE8ROoA==
X-Received: from dleg6-n2.prod.google.com ([2002:a05:701b:4306:20b0:143:749c:77f6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:230c:b0:143:342a:3d3a
 with SMTP id a92af1059eb24-144f9062a9fmr2012442c88.0.1790147692357; Wed, 23
 Sep 2026 00:14:52 -0700 (PDT)
Date: Wed, 23 Sep 2026 00:14:00 -0700
In-Reply-To: <cover.1790145937.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <db0864b553cee9cb053cc92473dce9788ac4e14b.1790145937.git.irogers@google.com>
Subject: [PATCH v5 20/23] perf test trace_summary: Improve error diagnostics
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, howardchu95@gmail.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

When pattern matching fails in test_perf_trace(), print the command
that failed along with the actual match count, the matching lines
found, and the last 20 lines of output to aid debugging.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/trace_summary.sh | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/shell/trace_summary.sh b/tools/perf/tests/shell/trace_summary.sh
index b80dea77cec6..4589b4581419 100755
--- a/tools/perf/tests/shell/trace_summary.sh
+++ b/tools/perf/tests/shell/trace_summary.sh
@@ -28,10 +28,16 @@ test_perf_trace() {
 
     count=$(grep -E -c -m 3 "${search}" ${OUTPUT})
     if [ "${count}" != "3" ]; then
-	echo "Error: cannot find enough pattern ${search} in the output"
-	cat ${OUTPUT}
-	rm -f ${OUTPUT}
-	exit 1
+        echo "Error: cannot find enough pattern ${search} (count=${count}) in output of:"
+        echo "Error:   perf trace ${args} -- ${workload}"
+        echo "Error: matched lines:"
+        grep -E "${search}" ${OUTPUT} || echo "none"
+        echo "Error: last 20 lines of output:"
+        # The summary is printed after any trace output, so show the end of
+        # the file: with -S the head of it is the trace, not what is matched.
+        tail -n 20 ${OUTPUT}
+        rm -f ${OUTPUT}
+        exit 1
     fi
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

