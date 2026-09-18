Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8822449AA20
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789766420; cv=none; b=O1QMR63pdpYCl9JFD+b1XXoGNDer1cxZ1RKZ4ZkhM/6xSNL+lSDYGklekfsFZFGceoUtARYiYeeM7Ie77QL2+05Td1o1lubnP27lW+AD/oRCjtT4YyAsK0JkvApDkdK7JkPJUJghEsvTIfAeQ4n48zpEMdjDWtLf39skjEzA2W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789766420; c=relaxed/simple;
	bh=3qyDKSUHoAXJBVvMweoPwov6DmzqcY9odxEwkd1kTIY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ni6QmV5Ah+UK6fXG508D0YnFcbuSnjTXmLoGDPIeusYY4btlC4ZYrIQLaO9n/xv/R5Kdn0jl8xh2YExUOu+sBShWhIyz46l5qoSQcOcB3Nn0kWXoOLsbhOnVdVXBysRsipMewHA6JKSeOnJxRzV5va9bNx4I/6REiwYizUrgMd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bQXifnMc; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bQXifnMc"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so2001934a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789766418; x=1790371218; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdvT9XF5drvxnf/MfPum/Gi0QBj0faFgeFxRBLMV2Co=;
        b=bQXifnMcVTAEg4DOIqCxQNrZpSDmEZP2aWgIJ45KhcN3/GwCxBvBpH0BsYcxVHFyXu
         Iv00W+S5UHB0a8Pn9r8yHDYg2CnD2kyGjNjud2KHgDWfLKTMEOwReiFZxu8626Kx6Zkb
         5kx+1FPy/xDXNUqGuBmUj9mRwci9oCu1ejwW1rfZTOq8v16ezLYcS2YJuVlZtFjTL2OM
         5YWTPt+UcvzZjtbeVuiLT7Qc3IZrWKcOb7Z4Y3+jfKmgffaADwFgeYKLJUz5kl/kQrfA
         4D3ZBoOd0FWp5mb352rlylDF3U00jGRSndzreqvGC7Za7xph+EVEQDzE/PtrFJcjyobF
         f3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789766418; x=1790371218;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdvT9XF5drvxnf/MfPum/Gi0QBj0faFgeFxRBLMV2Co=;
        b=L+VIEAt1M2q87usfPDypVpwu1S7Clo9LaC4LX7SJsfTWbwGE9DMZv+4Grvf22o34so
         8xMVyiAekwIPAMxKukcaJ3ACl1zSSwHMNbxtKxJcfAbYMDJzFlk82xTaLIXYNQ2baL51
         OSPDJFpnD6NrvrY7rCL5OwNA3l2+8kJVCMLWG4ocSMBIzPDS/Nvnlbb7hoUdXSDW8+KH
         OiYYObFMwms/JWlVbJpSeje+yipCHGLH9q6lbP0yqu9iRJboa/C/gwvXkqtH8LEiwVIc
         9J74xFZxum4BTdOVKvQilJ8GlC/RBfVfwFILEulrPyepFs9uO2l6CPfFDT8VKnS3xz1c
         y1kQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXT75IuoBL51YOKE3jKF69jFZRAYbL4wJH7FF+nYI/JVhaAgBR7jZ4IWP8twzNUnSm+IVuGmqdo0Ib04c=@vger.kernel.org
X-Gm-Message-State: AFuF++kCBs7OcLbDp92wrGk1QPiwHB7wTUEJcGmHieL4VCKS2eIH+Gwt
	0z2EQrdzjqqB6BnoS1sJVr218jlBTNEOSgmHf/B7yDkb8DYHKwSAG5z2ABUVLFTcN/Gc0gUnQIJ
	vgSuPbY2Tsw==
X-Received: from dlec1-n1.prod.google.com ([2002:a05:701b:4281:10b0:144:cfa3:9a66])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c03:b0:39e:4c80:44ba
 with SMTP id 98e67ed59e1d1-39e54dcc3ccmr7595486a91.29.1789766417734; Fri, 18
 Sep 2026 14:20:17 -0700 (PDT)
Date: Fri, 18 Sep 2026 14:19:26 -0700
In-Reply-To: <20260918211932.2966061-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918140659.2501976-1-irogers@google.com> <20260918211932.2966061-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918211932.2966061-13-irogers@google.com>
Subject: [PATCH v4 12/18] perf test common: Only disable probes in clear_all_probes
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org, 
	Howard Chu <howardchu95@gmail.com>
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
2.55.0.1082.g2b9226bbc0-goog

