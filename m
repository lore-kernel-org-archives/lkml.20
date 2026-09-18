Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF8952CCFE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789766435; cv=none; b=UBBMR1TZt/t+LfG6vpfOdV6gFdItC6F7J+266VXFMFd9mlHrjWjejwWGR4HrxMAuaU3S4wm5OO+xktOB9jZ+r8uF2K8kvJCvF3XyI/U1zMPiIDu/fgqQXxvbF4/IuvggzULHwPlWp/7zCpNgooGROh6/8MiWeMMQZcD8VxBzBfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789766435; c=relaxed/simple;
	bh=Ndq3XZzi/EfqSQhUKNfVgunzhKMGpjb6wAnuZVaabKw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mjMmOx4zYuGp5NMpmZgTZ8IIdJei6pXaOmv+vKe6F1CngDcOtqTqFHYixcJ2WdaHmrm0mdNA/64SVsslS60A29tr7Z4+LgfNK8wA1seUsqi6Et0AXFO4tUMc1rdKU7RvrlqwiZLH6StAYe9H2OrYROz7pmzKfd6pkQeV7WF5UxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V3/PeDJJ; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V3/PeDJJ"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so1598032a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789766433; x=1790371233; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtkpF+2hXoqnckm+Z523eWfhpUjaBTRb2bRSM1mpO+k=;
        b=V3/PeDJJ91tsY35rw+sKxI4ouBGGSmUpP+pNI8zvlnDgidq4g/xEaFKdZ7e3RJa5r1
         rKaZGFLPRhTNQFzkBeW53yGluVhLl6eqUHC70k/roITRIuz5pudkYE1XXwfnDXehdJhw
         w9zqnEn/EuXhVxIzpQd7vCbvaXN+nybEj3J348NJgrZuR/X2xSxmzDSmb6bs/dh0xl9z
         z7k1CpqnsG2n3tDRezdXnpSwydMRONIMEwXKmvC/DrMbaHt4cmfAREOFC+cJzIQ705mr
         d0Nr+dcOpGMItDIJsrVUfBvORoxUoWzDwcNBnxhTC6WD0Gcxu5pj6kELU82RhYcUkJcX
         Cdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789766433; x=1790371233;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtkpF+2hXoqnckm+Z523eWfhpUjaBTRb2bRSM1mpO+k=;
        b=wUduyBsfmX+goI7HKARRuQflP8yHb4yBTNZ9Io5dsQTUlnkA2dN8vtAW8zJQrk/Oi6
         ZGrRdDsjnGWMNys5HD9d2xo4rtpdB+w5HRQAqiiV1lPtYi2tDEHUx0Dfb3wIx7QCgMdA
         pzXA1cQIGFUvGAmJ6RjxtZ6vOFNbnVzSFThjOl55RtboaHOnrE6chcVEuhR9kf5J80cM
         flJpllQx4rPRMCeAKQtoDl9TGIjJ1IYfIIsf9hiEZSsUaRy75c/DAxu9x51N1wPBastr
         kkJdy//gyg7xgPQbDqLzkzW/A8IjJo3yMadRKT9TH0k/AJb8ElY1VpwoVOYaiQ2K+BuG
         ixig==
X-Forwarded-Encrypted: i=1; AKwUvByxomU3+kNkM1JKlxDs7hAmeWnQF73nCzNxMJCdmUmIicHBbjXazZO8ChvYxKfWgMEwLJM16v5l/S3Iu2U=@vger.kernel.org
X-Gm-Message-State: AFuF++mH3cAZMQYrweLd/xMIS6OLLyz3jDFeJGwFeuXBWcic6VYyJStr
	5Vg6hzny9Yrkm/CB9MlGydwytYkQNGcrP88igzyAKW2PdqcSSUJVxhMN5MHWxjzMUKOEnDpvBpb
	wmBXxnrwLXQ==
X-Received: from dlec1-n1.prod.google.com ([2002:a05:701b:4281:10b0:144:cfa3:9a66])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:140a:b0:3dd:a197:cf32
 with SMTP id adf61e73a8af0-3dda197d889mr1022801637.86.1789766433437; Fri, 18
 Sep 2026 14:20:33 -0700 (PDT)
Date: Fri, 18 Sep 2026 14:19:32 -0700
In-Reply-To: <20260918211932.2966061-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918140659.2501976-1-irogers@google.com> <20260918211932.2966061-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918211932.2966061-19-irogers@google.com>
Subject: [PATCH v4 18/18] perf test uprobe_from_different_cu: Scope probe name
 to PID
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org, 
	Howard Chu <howardchu95@gmail.com>
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
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

