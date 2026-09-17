Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436224446F5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627395; cv=none; b=SOueXu2nt1GtSbF0CAVLQ/wb9+my82OG4Btz3NYhkbwCfHVyg9djbXT/iitVGPOAoY5wsVuyVYLJyPO7W/BunGwvd9JCagk4jRJp6xuIUBq4vFryG0iVEF4pJYxu3jFjjJkZxS2GMMrm2x8Js3/fKrnAKUSryBGB0AFcy4MR3g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627395; c=relaxed/simple;
	bh=Ndq3XZzi/EfqSQhUKNfVgunzhKMGpjb6wAnuZVaabKw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bsieG9/K0gaVXwjmvPwuEq1bprmvFYMaRGob8KN/sjyV2yrliLiDCwGQ1LxuYDIPyq3wjh0Y0k3MfX7r6LjU/n5RAt3Os1GwfYMGZ2hG6xmhvXGu1/dtMVOdW1L/29x0PN45YYkzq0vXbKMHqGctOkll4XaMlTe8issO2kNRzbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VwvRS+AJ; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VwvRS+AJ"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so954150a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789627392; x=1790232192; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtkpF+2hXoqnckm+Z523eWfhpUjaBTRb2bRSM1mpO+k=;
        b=VwvRS+AJzgJ6yZowNbliN0GTMTsOS2d09TZjbuTKVMyyMZczGVmJt5A4GBc6x7xXkq
         26UGxKrchJWwt9k6HnMHaxIoL8J6llYBAgJudZqCpidY9KmHA0mLTFrX/nxxJENOZZtk
         nMbaAryqpMDe5fYYz1YhMpUFgs/O120KP92OTDqWUnAVJi+G3iOWMVUp4JPPFpZL8zae
         0FAlnWNC3g9oSsa50zq22FRnREuZi3GZaYgvs5ntUs+RCagClUVSSbj6f3FCn9OHGsLm
         jI780lUOvzZMN5rggoy+biO9nESk/XlwJUkicUVYzibP8etuqahD2jXXuekoebjDlF8u
         cBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627392; x=1790232192;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtkpF+2hXoqnckm+Z523eWfhpUjaBTRb2bRSM1mpO+k=;
        b=kNBf/pqZf723hBv1IDJ+ZEQpJbz6cfG2+fpTwVBRhRM5pWhlP8jdRmYdr56tgHCt0j
         A2PIJRNz4MSplKpmFKSnsxe2BdjTU9FPouuL7fs/j18pUnk53oF3WCEBLj6+TlOI0e40
         Jq8w6K225PnFpLeVbHgeYMtRgPGqo4uSdVVpMrCgWq2i6iQeFctKNfI2lQ9jHsyp8JaO
         jdLm181TIPdyaNx44jDy0HcI6Fm6yN99QayPA16Kes6Yfzbg36Qo3zIGeE/0O1eNkRpy
         LPetIL/4qZkKdT39cM0uzCrRBVvneGIHDJ4No9meaYMI2ynZBLsfTozo1Ku3x8wZzgOc
         rghQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmr4v0gYaY59RP0Lwlmx9ro1Q/jydPI28AvUvVAbeVNu4LK4DLQOOUHh46fq8JDrkTtR6FDmxTn3ea1XI=@vger.kernel.org
X-Gm-Message-State: AFuF++mjoYjuMwLR5OnxI4h4oQCpQ5CGdnKaUBBuc+TJ8z+M7EOm0VYQ
	7+FhCMTFMwY/mtUtMRhPUcS4TkZpQGj8BXEb2Uwbpgpe1AwNUsmnSIDZW16oV9dukAeris28nZQ
	ezKs/Rwah+g==
X-Received: from dlc21.prod.google.com ([2002:a05:7022:395:b0:144:bebe:a64])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1811:b0:39d:e54c:8658
 with SMTP id 98e67ed59e1d1-39e1e250230mr16608214a91.5.1789627392115; Wed, 16
 Sep 2026 23:43:12 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:42:35 -0700
In-Reply-To: <cover.1789626977.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789626977.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <80beb357d1eebd77f99982fbf4741e8b5fefbafe.1789626978.git.irogers@google.com>
Subject: [PATCH v1 13/13] perf test uprobe_from_different_cu: Scope probe name
 to PID
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The test builds a binary in a per-run temporary directory and probes
its foo function. The directory name is unique, but perf probe derives
the event name from the probed function and the group name from the
binary's basename, so every run registers the same probe_testfile:foo
event.

Running the test concurrently with itself, as 'perf test -r3' does,
therefore fails in all but one of the runs with:

  Error: event "foo" already exists.
   Hint: Remove existing event by 'perf probe -d'

and a losing run's cleanup goes on to delete the winning run's probe
out from under it.

Name the event after the pid, foo_$$, so that parallel runs no longer
collide. This lets the test stay in the parallel pass rather than
having to be marked (exclusive).

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../perf/tests/shell/test_uprobe_from_different_cu.sh | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/shell/test_uprobe_from_different_cu.sh b/tools/perf/tests/shell/test_uprobe_from_different_cu.sh
index 7adf9755d6de..47c99d93436b 100755
--- a/tools/perf/tests/shell/test_uprobe_from_different_cu.sh
+++ b/tools/perf/tests/shell/test_uprobe_from_different_cu.sh
@@ -18,12 +18,19 @@ fi
 
 temp_dir=$(mktemp -d /tmp/perf-uprobe-different-cu-sh.XXXXXXXXXX)
 
+# The name of the uprobe added and removed below. The probe is placed on
+# ${temp_dir}/testfile, but perf probe derives the event name from the probed
+# function and the group name from the binary's basename, so every run would
+# otherwise share one probe_testfile:foo event, and a concurrent run would
+# fail with 'event "foo" already exists'. Scope the event name to the pid.
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
@@ -84,6 +91,6 @@ gcc -g -Og -c ${temp_dir}/testfile-main.c -o ${temp_dir}/testfile-main.o
 gcc -g -Og -o ${temp_dir}/testfile ${temp_dir}/testfile-foo.o ${temp_dir}/testfile-main.o
 
 perf probe -x ${temp_dir}/testfile --funcs foo | grep "foo"
-perf probe -x ${temp_dir}/testfile foo
+perf probe -x ${temp_dir}/testfile ${probe_name}=foo
 
 cleanup
-- 
2.55.0.1082.g2b9226bbc0-goog

