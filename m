Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA4F472522
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147700; cv=none; b=AEv/p1w5fGUSHl15uJXRf9Qk80uapMSaUqjEi+0QOHUDLetfEUM9niGVProioH/jQKF7/rEQJHzh5ux14BtLtdmFQHmHoUn3xCglH+hxdpRC2estcAbDhuL4H7QEzO8OqLfSszsIiuZUkhM31GfFUmcaSgrhhdcaDgzUfmppayU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147700; c=relaxed/simple;
	bh=UCqIOtZD2Jk+dE2LdYvz/qydnzUWZKhTuMhrInWOg2A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jY1IdzG3ia5mzKROTniuUwMjTOlweCatFoWGxoNQ10GiDV0BhT3hoB7PJgCuPsdB+upD9V9dXdrx9HiFK0FAwYLurciPUhiEN285havo2KUI7iQow7DuyFn4z7tdgPDqvUJbnCxvKq3T0LJKsLZK8qrlzKiCPbPXALWttgRLUBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n/XfQGo5; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n/XfQGo5"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so897947eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790147698; x=1790752498; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/S2yM1Svvahmk7vRSW6vJVb9Ri5nPE1b8txEEKj5AbM=;
        b=n/XfQGo5zd48p7KYb5lH6haQ1Qjg/kJP36NWOrMv7GDa0blITIHhpM9FfPWKoimo9P
         rsv2g6V8vefS4B3TkGySagt+dQdFLWH5ZK4MWcRRVa2/r84K+0VJQN2TQUdbt6s5u6Pf
         qEpx9CAiEhwlc/iybJoRSt+br/vMKtXwf3WZ9NB8Wcfh/n2keIuXBJ841tapZQlf1/lG
         i62Qct57ABYRM/QZh6QziLApMTCxbfO5QGL5AxD0AaXgWIoxhsGu5E8rrBdxIA7puE/m
         i84XBRL6aWFZMXt4iqqE4+dz5IHv3X2dPRvb4KVv/nUn/AygsO5Yet+2cLglFljjBUls
         ZpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790147698; x=1790752498;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/S2yM1Svvahmk7vRSW6vJVb9Ri5nPE1b8txEEKj5AbM=;
        b=GtreLBzYN4T1SNe+BF0r61O8BXrIhLSV6MdKGXI+NwOPO0gsf8HxbPMwHzhDoqJ9qZ
         lYqONx2EewwJv4GUyDPhLZNCt/SvShQHeZUS2x15F2jSvEe2sBvHo+yL2EHLvzlKjCbn
         i+zy7SgK4ORy3IyrFbhC4QEOs7bwe2V8DFmErfJv0zA6I7JtZySDug9ZC9R8fUG08uPk
         XKpByi9rll2j25J+JJ6yI/yeViFPZzl9rqT4aL2jqJNz9L9wfo1YcPSdYmfUCGUT1i+y
         r5rSWMbeF0cL3d+zDtV5VUA1Ww1pxSSr6iDH/qtbrtrvHlCvWBBbyPpx7yKbTuHz9Cj7
         4pkw==
X-Forwarded-Encrypted: i=1; AKwUvBybV5ppzdcfWqoe8Mh+SQljLOUy4dNnEFswSxA0hbD7HxzIq8V0gSvTOH4siwm3LY4CQB587eIZ/evJenw=@vger.kernel.org
X-Gm-Message-State: AFuF++k6KQE8Ha3pEneMPHx+OIJOvEFjJFVZ4TdOjtdsxgba8z1ejpx2
	XN5DiEQUMWE1AGfXdruggTbOGC2jgvax5zrH2icGxyXYhZAR4P+lmL7ZeMsNQIWYjo600Ir9/xp
	SRUmi+DNrFw==
X-Received: from dybut4.prod.google.com ([2002:a05:7301:e0c4:b0:33f:53bb:bb62])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:60d2:b0:33c:1f21:2337
 with SMTP id 5a478bee46e88-33e8d9cd47emr2040530eec.25.1790147697744; Wed, 23
 Sep 2026 00:14:57 -0700 (PDT)
Date: Wed, 23 Sep 2026 00:14:03 -0700
In-Reply-To: <cover.1790145937.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <0cb69731888e5d32afa9b517d3456d66a99dedb5.1790145937.git.irogers@google.com>
Subject: [PATCH v5 23/23] perf test uprobe_from_different_cu: Scope probe name
 to PID
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, howardchu95@gmail.com, 
	namhyung@kernel.org
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
2.56.0.rc1.315.gc6ed9934b7-goog

