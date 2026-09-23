Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A543446AF1B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147690; cv=none; b=myrz4/RnsRwR4iIaOf6pmivCTXtVGtccC54SbywJ0IgqiBQ690oe/x5b2MuBjDlygdrUpxlP5iVjd6XBfuEp2J6+inJcdfhbzvAGCx7SFZObQSG4ro77z8Xd4PJOXnfwa9G5+rYytNLaNw0trADosxBB08wwB4kGIclrfxKfO84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147690; c=relaxed/simple;
	bh=BwFqoUR08sVPCAz8nNT2kUsBLmhuj0nCuycamDAIf9A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ebj0n1o8lF7aQyZVRV4bvu/gbtZlwPr284+Ow305u6apv8jNKerOk0eLEwLMiC86LjZbPUP1QzUz3tbQ51qTwO21kFsNbhaT3wSZ3nahQ5orlJNp7oi9zx7iM56YNdPxjhiMMpEUNEz0T03L/zxdtstjYL0YdEUQKCCtnS9+7EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q8iOISXN; arc=none smtp.client-ip=74.125.82.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q8iOISXN"
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1438fef603cso894008c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790147687; x=1790752487; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ppc4dThPLC0xYtcVyncsGQzpEFgp4LgZmFvaWqdw6Ts=;
        b=Q8iOISXN7mvHWD0Vp+KCipTG03OQUDzES+ghXuok2dJyMm81ixHdiOBbEe2SuDdFZH
         8cZwmTS9VIRIbOLzxhBqrKOO7zrs8W0DiVAmPj4oHjz7IlhK2zq/PHX6rEKm4VgCLiAX
         LQiPJLxlzKMqFqd6YKRi7vkbfqTgeVsUO19qA8N9xIS2yyzZk6Ia7+pqeyHYdEkMXqPD
         UYjVQAYgvdi5Ek2I4HnlJ9HCj6Yor1+m6lskaOLtUuMgTU1EjZqM1Lkj1DSIDW5Yg+yH
         f0StlqV+6gYjGu1Nz/oY6hrMehMohlP2mGB1Ffe+L6g2qxf820igU/S8mvObKufq5oK2
         P8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790147687; x=1790752487;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppc4dThPLC0xYtcVyncsGQzpEFgp4LgZmFvaWqdw6Ts=;
        b=pNjI0AjTEDonyFc7fWfPK4vh4Hv5TNGaRcFYKM5Wmz0sO/ihK/52Lk8urJo6GbZuX1
         c3amOj8nzCQDX7Ua5PeseFG+UZIKCNSesc/XyQw9YKBIT0psqAFu/8sbYIjCbGY1sqoA
         NYiUXLIMcE7Be4nCVYGN4e4j8BNku/7+q2Qcc42/08DiUmy6rmx98NWuD5gmqjHpBdZX
         YlP+At9Aa43sexPfFDKww3wYw57T6NdvvADLDNoOJ4gNuMi3/NZLnO+rZ3Uiaa0/cW4S
         7ZSH7MaXgTO6QlYN6OI94eQ7CBK9UgUFNc+oBsWXovL7gblDK7ZGX5JsjcEKBX1a02GQ
         O2UQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrFtSTovOXTrlLtXoE0dH0G90blgtB1eTS+ns821+yHOmTvQdfzGT3gAsHMCZ3et/oxYLrHu2P+7wtygo=@vger.kernel.org
X-Gm-Message-State: AFuF++nyTCRqyz8QqtZ224GYKNH6rlAh0/fs/gT9sjP/Qwdi5LZ+sWNI
	p/I3MSGnnsini/wE1HkEMb6a+oOrqqfPzVohstUyJyswYX7s2ESSshYTFsTSAFg5XdAPRRW83o+
	CjDvj1eI+ng==
X-Received: from dleb20-n2.prod.google.com ([2002:a05:701b:4254:20b0:144:d76d:635b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b042:20b0:144:fedf:5789
 with SMTP id a92af1059eb24-144fedf57ddmr311692c88.15.1790147686498; Wed, 23
 Sep 2026 00:14:46 -0700 (PDT)
Date: Wed, 23 Sep 2026 00:13:57 -0700
In-Reply-To: <cover.1790145937.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <2b33d9a499901d59d15cad2ed84f5ed181cb7e2a.1790145937.git.irogers@google.com>
Subject: [PATCH v5 17/23] perf test common: Only disable probes in clear_all_probes
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, howardchu95@gmail.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

clear_all_probes() began by writing 0 to
/sys/kernel/debug/tracing/events/enable, which disables every tracepoint
on the system rather than just the probes the probe tests created. When
tests run in parallel that also silences the events of any concurrent
perf record, perf trace or ftrace session, so unrelated tests lose the
events they are waiting for and fail.

The write cannot simply be dropped. Clearing kprobe_events or
uprobe_events is all or nothing: dyn_events_release_all() walks every
probe of that type first and returns -EBUSY without removing any of them
if it finds one that is still enabled, where enabled means TP_FLAG_TRACE
from tracefs or TP_FLAG_PROFILE from a perf session. A probe left enabled
through tracefs would therefore block the whole clear and leave stale
probes behind to collide with the next run.

Disable the probes and only the probes. The set to disable is taken from
the kprobe_events and uprobe_events listings rather than from a guess at
which groups perf uses, so it matches what dyn_events_release_all() is
going to inspect: a probe an unrelated session left enabled in, say, the
kprobes group would otherwise still abort the clear.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/common/init.sh | 33 ++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/common/init.sh b/tools/perf/tests/shell/common/init.sh
index cbfc78bec974..7c2ca74298ca 100644
--- a/tools/perf/tests/shell/common/init.sh
+++ b/tools/perf/tests/shell/common/init.sh
@@ -130,9 +130,40 @@ check_uprobes_available()
 	test -e /sys/kernel/debug/tracing/uprobe_events
 }
 
+# Disable every kprobe and uprobe event. The listings name each probe as
+# "TYPE:GROUP/EVENT ARGS...", for instance "p:probe/vfs_read vfs_read", and
+# events/GROUP/EVENT/enable is the switch for it.
+disable_all_probes()
+{
+	PROBE_SPECS=`cat /sys/kernel/debug/tracing/kprobe_events \
+		/sys/kernel/debug/tracing/uprobe_events 2> /dev/null |
+		cut -d ' ' -f 1`
+	for PROBE_SPEC in $PROBE_SPECS
+	do
+		case "$PROBE_SPEC" in
+			*:*/*) ;;
+			*) continue ;;
+		esac
+		PROBE_ENABLE="/sys/kernel/debug/tracing/events/${PROBE_SPEC#*:}/enable"
+		test -e "$PROBE_ENABLE" && echo 0 > "$PROBE_ENABLE"
+	done
+}
+
 clear_all_probes()
 {
-	echo 0 > /sys/kernel/debug/tracing/events/enable
+	# Disable the probes before removing them. Writing to kprobe_events or
+	# uprobe_events is all or nothing: dyn_events_release_all() walks every
+	# probe of that type first and returns -EBUSY without removing any of
+	# them if it finds one that is still enabled, which would leave stale
+	# probes behind to collide with the next run. That covers probes this
+	# test suite never created, so disable all of them and not just the
+	# ones in the groups perf uses.
+	#
+	# Only probes are disabled. Writing to events/enable would also silence
+	# the tracepoints of any perf record, perf trace or ftrace session
+	# sharing the machine, which breaks those tests when they run in
+	# parallel with this one.
+	disable_all_probes
 	check_kprobes_available && echo > /sys/kernel/debug/tracing/kprobe_events
 	check_uprobes_available && echo > /sys/kernel/debug/tracing/uprobe_events
 }
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

