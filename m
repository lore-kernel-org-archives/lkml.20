Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360103A873D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620032; cv=none; b=jJ5l/QHhmNX4FAjgC27d206fFrSGYqOUtTH5O3YSsIXzTwIfJ2lzWZlTMu1VCTvBJDz/rSHL+CTPNpheF9F7Xl6ZaSHuXCmXeB/PvzJyVXLO2uEU99v2ilogS4bcucWPr27ozWgI+iTraOPiN0sDSZN5XxsXXK6yVXlXHdCRHNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620032; c=relaxed/simple;
	bh=eYlx9rY4xi33oBWxp+1MClz68XmNtr67rRY+CPdf6o4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TznBK2Z/RH+LN5NnQmZv0Kv6umG3oCFn3iWIL288X271g/BxIlW/7cSRPAse9qD9z41QsEj2cSvH+iDdL13CxxvXO7eenX1ZbY6jk57XRS7ujqiWBDtBEsLubZ+HJwoJXybtym28eJL7EN/5SxecIv+kO+EGsmTdxrNw7g0KQSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PBe99g09; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PBe99g09"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34318e88ba2so1663575eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790620027; x=1791224827; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqy/3L5XaLD88GGPmNwhprnBQL6pm4hmCQmXIrIfxXw=;
        b=PBe99g09OJcqdIyMby1KrcCb0+Lr6Y76KPMC3TTXAYrk3Z+JdOgWAdjzwccZRvkU/r
         yI30X6CBPia68UH0A4y59BPrBMGPSmpS7CX00VHEzNyANR/emya1zdx2C9gPUabWzJOs
         Lh15i0NkPaBJaGPszyjTP/vMh76h4kk1hJzj4TXd1QQzjeUZDhVx9M2/+A/dhwkbTDp/
         P7Z84eOCO1fv7Oc1MQZaDUtgjZIiVm8Xyksyevtql0NPpa1crqXXq3XjM+bTdkMCsXNm
         OXRDe5WsCy5rTcMIZZDdz6E6IoYD+UBXWtQKMVVuULD3/peogJaGYjsb3UQKFfiP1YuR
         Sg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790620027; x=1791224827;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqy/3L5XaLD88GGPmNwhprnBQL6pm4hmCQmXIrIfxXw=;
        b=qJyTCDjHzkrq57Q22ZCucmm415TgQ2h7khap4fdVQ+QLoCvY1r/XncF249qxMz9t2s
         gKYAUWuzLFwSSInWF3EcKOhZ9/64NzDgUylUhXXmKm/7nMe1NdUNwCUyiG4eeigCs3Xr
         SX13AakBfNXoXiO+gxL1hVPp3YfVlS3n7o/euzm7RcVfEMLQM18fD0t63aIXSKuETJcH
         lkSUrf6hdyrc8t5TYdAPE6CgTq4M2lJXVGlDJsnohPe6VYcy4GiUErWHaL4xGJMQYgUT
         LGejocYSNHt4nU/k89SWYRc9fiHF5K4iVFZ5p9lfe0/ez2pgsJtYbcaoKuNKlT26TRn9
         A7CA==
X-Forwarded-Encrypted: i=1; AKwUvBy1BOQDJlcqJKGPVW+bRtuSktfY01EXw5GVpYtGjVkqAj3u/lSj0GQZy0NwTVU+Gmh2Nk6Js71Q20VPfaI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMyAb9sOYEODBmDaVSTffkgEiGAaqbOpNXWBuxNwNXvv/ls3Np
	bcOyFRZWA7pRWOcOGE21SXCVO/i/zbQC2uX+Guh4jQiiKJ/Qdf4DXlw6mFBSLs1xB7fKxE20eSC
	4gU25xSrPHA==
X-Received: from dyoc24.prod.google.com ([2002:a05:7300:3598:b0:331:36f4:a343])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:fd8a:b0:33e:c164:b5d7
 with SMTP id 5a478bee46e88-3426f9c09a0mr10591858eec.3.1790620026229; Mon, 28
 Sep 2026 11:27:06 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:26:03 -0700
In-Reply-To: <20260928182605.3649015-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928182605.3649015-25-irogers@google.com>
Subject: [PATCH v6 24/26] perf test trace_btf_general: Drop --max-events=1 and
 make non-exclusive
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Howard Chu <howardchu95@gmail.com>, Jakub Brnak <jbrnak@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

With --max-events=1 an unrelated event can end perf trace before the
command's syscall is seen. Trace the whole command and grep for the
expected line, as trace_btf_enum.sh does, and remove the exclusive tag.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/trace_btf_general.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/shell/trace_btf_general.sh b/tools/perf/tests/shell/trace_btf_general.sh
index 06f4a704daf8..d1fa7c846478 100755
--- a/tools/perf/tests/shell/trace_btf_general.sh
+++ b/tools/perf/tests/shell/trace_btf_general.sh
@@ -1,5 +1,5 @@
 #!/bin/bash
-# perf trace BTF general tests (exclusive)
+# perf trace BTF general tests
 # SPDX-License-Identifier: GPL-2.0
 
 err=0
@@ -26,7 +26,7 @@ check_vmlinux() {
 
 trace_test_string() {
   echo "Testing perf trace's string augmentation"
-  output="$(perf trace --sort-events -e renameat* --max-events=1 -- mv ${file1} ${file2} 2>&1)"
+  output="$(perf trace --sort-events -e renameat* -- mv ${file1} ${file2} 2>&1)"
   if ! echo "$output" | grep -q -E "^mv/[0-9]+ renameat(2)?\(.*, \"${file1}\", .*, \"${file2}\", .*\) += +[0-9]+$"
   then
     printf "String augmentation test failed, output:\n$output\n"
@@ -37,7 +37,7 @@ trace_test_string() {
 trace_test_buffer() {
   echo "Testing perf trace's buffer augmentation"
   # echo will insert a newline (\10) at the end of the buffer
-  output="$(perf trace --sort-events -e write --max-events=1 -- echo "${buffer}" 2>&1)"
+  output="$(perf trace --sort-events -e write -- echo "${buffer}" 2>&1)"
   if ! echo "$output" | grep -q -E "^echo/[0-9]+ write\([0-9]+, ${buffer}.*, [0-9]+\) += +[0-9]+$"
   then
     printf "Buffer augmentation test failed, output:\n$output\n"
@@ -47,7 +47,7 @@ trace_test_buffer() {
 
 trace_test_struct_btf() {
   echo "Testing perf trace's struct augmentation"
-  output="$(perf trace --sort-events -e clock_nanosleep --force-btf --max-events=1 -- sleep 1 2>&1)"
+  output="$(perf trace --sort-events -e clock_nanosleep --force-btf -- sleep 1 2>&1)"
   if ! echo "$output" | grep -q -E "^sleep/[0-9]+ clock_nanosleep\(0, 0, \{1,.*\}, 0x[0-9a-f]+\) += +[0-9]+$"
   then
 	printf "BTF struct augmentation test failed, output:\n$output\n"
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

