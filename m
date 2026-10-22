Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684442;
	b=k1npyDJZ0jMrG+wdlnk/3ySllMwCscsoObH9oiUjhmHw+9JbBbXp46PVci/XfX1OBqJj
	 K6vDE+ta8g4695egc+j3nXIETkFkypcLWK+5oQyZBxdttpmSRmkYOjvAqeSZ/wjSW76ap
	 +UiIKLm4Pjd6/OafyWQ7d2qoHJ28NWGpfMs9SO35/ivDCvgWi0DdEPHm3kUl3wNPHzXGy
	 aKW3cKqY2AwpZ7KokRq2e/Wu4L6yShRI27VO26SI9Svs3pPsfm1yfPUO8v1wvUTgtaJPt
	 PZjFeGAuAP4ju9Lhl1nfPsUMfQ+vwXXm6Rwlr+uZMowzhPqYrz2g3nL3A4SmZLa5lfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NOVFqRoJVl+99BXQP29VcDH+8XuP2HNelyqlJcXESXA=;
	b=awqOOiq1Nz9qUNJ1m6yPYHwNltzr/LEpjzmyJyvprGfMCdhxcPXyqRFOJ3X3gL57IZ/E
	 B34NLUMcv1hJ+jmV7706s18TR9/oqHxzx/sTtJeZ2PWW94q45K1irtFNqJqKnBIBM5X4H
	 YUvwbkv5rQ8BhWW/I+W5Q+bLWYNCbAw9oDugnSb9OIVSeCL+qhm3ygDd5YNXIY8lUKO6J
	 pOXuA4/VPX3nXKzsMVOy5Gc6Syat6USkqVVEF5wHmpUcLFC2Y3KU75wkfyq5nXoz+tjrt
	 cO6orGHGVn76YdkGJJp2akPSxl2NZisLsvr9Nej03L+3HdvP/uGTVBKgWGUuTM13t/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Yj14Lzka;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3BD606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA3BD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Yj14Lzka
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd66551e02cso2131522a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792684441; x=1793289241; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NOVFqRoJVl+99BXQP29VcDH+8XuP2HNelyqlJcXESXA=;
        b=Yj14LzkaZvL1Tx8Vnnqx3s5rek4uEk7lAv5Yy8I0B/ebgxg/VluUBqyWRZQ0GWL8hF
         oyZD4tETC17GAecwk2aBUOOEZRhBLI1bWPpY9LZOTWn5VtNtxjBTdw51qOB2zQe+YQP7
         wSv6+qlkU+7baju97Rnfqkh7VY1801EvYFpX2xNzxFJTobHKy0VpkTAfoajK1GGGq8RB
         bqx+8BjAKWe3f8bbGVZO7DpPXyZ5tEAgCEDohPKiyxvLAQLd9H6Qfh9xXYNePV3HC5Hg
         bSR+Pe5mGnKkw9XeFfEcRGLBhEQ4f4Kpo1TD1+660JEClzRmnUFp0lD6cSgoSNNj5Zlz
         Vrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684441; x=1793289241;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NOVFqRoJVl+99BXQP29VcDH+8XuP2HNelyqlJcXESXA=;
        b=dJ8uiecNsgtJWIF8z8g1ARvawpgDgy/Zg5y8nILpI8Wtuba4l0l3Bso2Hhl0I9eZd+
         DB3MQkaHfjE8aSTLJVlUMPAvAjzsmObHb0akZ8UcIjZ9GoJ9eXkhWrm75ITCYC/JFMMO
         oq+4x2qCBzxa8UYAiDxaQcaivJK+ImGFh1IJ3VKrg2iLeiGAWYKj2L9sIMhMmgVQz7q0
         LBiJrQ5mNe4+uXR7sg8xSEzjkJd2PwbmalM0amAf+JAsqUuU1Ukz255qcqy/nqFyeDvL
         XzYrgbQCicaZFIOue35B59cJS+15+WoQCjN1nGIy/r1+zf6aPw9B+cJ5eefhDZ5I1WKZ
         Jzcg==
X-Forwarded-Encrypted: i=1; AKwUvBxnd2kj6XMtI9b0X70nzrDlIW4w5mlbZhVD0nN4DzGWUv6yHAUHPLKzdWoKUMS9KWXYazmqIWxVqgJe4tY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb5sikI4V7zNRDpqmY6u0O5JTYCmePIY2KZwtgCUWY+/CSWr5a
	F7cY+URV6U+QzBlNiWNWBgDWlMpUpYwalp5Ox0fG4S669EjukZe+8WkgPG1hN2eBWrTtilo++pc
	DXJPrHKlZ0A==
X-Received: from pglk24-n2.prod.google.com ([2002:a05:6a02:6b98:20b0:cca:d82:9104])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9e4a:b0:3dd:a196:69e4
 with SMTP id adf61e73a8af0-3e287f3a472mr5611553637.63.1792684440865; Thu, 22
 Oct 2026 08:54:00 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:53:35 +0000
In-Reply-To: <20261022155352.1293020-1-wfelipe@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022155352.1293020-1-wfelipe@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022155352.1293020-3-wfelipe@google.com>
Subject: [PATCH 2/3] workqueue: expose per-workqueue stats in debugfs
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wilson Felipe Pereira <wfelipe@google.com>, 
	Shuhao Tan <tanshuhao@google.com>
Content-Type: text/plain; charset="UTF-8"

struct pool_workqueue tracks runtime counters in pwq->stats[],
pwq->total_in_flight, and pwq->nr_active, but reading them currently
requires tools/workqueue/wq_monitor.py with drgn and kernel DWARF
debuginfo. This makes it impractical to inspect workqueue stats on
systems without drgn or debug symbols.

Add /sys/kernel/debug/workqueue/stats to expose per-workqueue stats
directly from the kernel. Iterate over the workqueues list under RCU and
sum wq->retired_stats[] with each pwq's stats[], total_in_flight, and
nr_active to report queued, active, and running work items alongside the
cumulative pwq->stats[] counters.

Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
---
 kernel/workqueue.c | 99 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 88c8cc2b38d8..ed0f0be6494a 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -57,6 +57,8 @@
 #include <linux/delay.h>
 #include <linux/irq_work.h>
 #include <linux/math64.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
 
 #include "workqueue_internal.h"
 
@@ -7990,6 +7992,103 @@ static void workqueue_sysfs_unregister(struct workqueue_struct *wq)
 static void workqueue_sysfs_unregister(struct workqueue_struct *wq)	{ }
 #endif	/* CONFIG_SYSFS */
 
+#ifdef CONFIG_DEBUG_FS
+
+static const char *wq_type_str(struct workqueue_struct *wq)
+{
+	if (wq->flags & WQ_BH)
+		return "bh";
+	if (wq->flags & WQ_UNBOUND) {
+		if (wq->flags & __WQ_ORDERED)
+			return "ordered";
+		return "unbound";
+	}
+	return "percpu";
+}
+
+static void *wq_stats_start(struct seq_file *m, loff_t *pos)
+	__acquires(rcu)
+{
+	rcu_read_lock();
+	return seq_list_start_head_rcu(&workqueues, *pos);
+}
+
+static void *wq_stats_next(struct seq_file *m, void *v, loff_t *pos)
+{
+	return seq_list_next_rcu(v, &workqueues, pos);
+}
+
+static void wq_stats_stop(struct seq_file *m, void *v)
+	__releases(rcu)
+{
+	rcu_read_unlock();
+}
+
+static int wq_stats_show(struct seq_file *m, void *v)
+{
+	struct workqueue_struct *wq;
+	struct pool_workqueue *pwq;
+	u64 stats[PWQ_NR_STATS];
+	long in_flight = 0, active = 0;
+	long running, queued;
+	int i;
+
+	if (v == &workqueues) {
+		seq_printf(m, "%-24s %-8s %6s %6s %7s %10s %10s %12s %8s %8s %8s %8s %8s\n",
+			   "workqueue", "type", "queued", "active", "running",
+			   "started", "completed", "cpu_time_us",
+			   "cpu_itsv", "cm_wkup", "repat", "mayday", "rescued");
+		return 0;
+	}
+
+	wq = list_entry(v, struct workqueue_struct, list);
+
+	/* Advisory stats read without wq->mutex or pool->lock. */
+	for (i = 0; i < PWQ_NR_STATS; i++)
+		stats[i] = data_race(wq->retired_stats[i]);
+
+	for_each_pwq(pwq, wq) {
+		for (i = 0; i < PWQ_NR_STATS; i++)
+			stats[i] += data_race(pwq->stats[i]);
+		in_flight += data_race(pwq->total_in_flight);
+		active += data_race(pwq->nr_active);
+	}
+
+	running = max_t(long, stats[PWQ_STAT_STARTED] -
+			      stats[PWQ_STAT_COMPLETED], 0);
+	queued = max_t(long, in_flight - running, 0);
+	active = max_t(long, active, 0);
+
+	seq_printf(m, "%-24s %-8s %6ld %6ld %7ld %10llu %10llu %12llu %8llu %8llu %8llu %8llu %8llu\n",
+		   wq->name, wq_type_str(wq), queued, active, running,
+		   stats[PWQ_STAT_STARTED], stats[PWQ_STAT_COMPLETED],
+		   stats[PWQ_STAT_CPU_TIME], stats[PWQ_STAT_CPU_INTENSIVE],
+		   stats[PWQ_STAT_CM_WAKEUP], stats[PWQ_STAT_REPATRIATED],
+		   stats[PWQ_STAT_MAYDAY], stats[PWQ_STAT_RESCUED]);
+
+	return 0;
+}
+
+static const struct seq_operations wq_stats_sops = {
+	.start	= wq_stats_start,
+	.next	= wq_stats_next,
+	.stop	= wq_stats_stop,
+	.show	= wq_stats_show,
+};
+DEFINE_SEQ_ATTRIBUTE(wq_stats);
+
+static int __init wq_debugfs_init(void)
+{
+	struct dentry *dir;
+
+	dir = debugfs_create_dir("workqueue", NULL);
+	debugfs_create_file("stats", 0444, dir, NULL, &wq_stats_fops);
+	return 0;
+}
+late_initcall(wq_debugfs_init);
+
+#endif	/* CONFIG_DEBUG_FS */
+
 /*
  * Workqueue watchdog.
  *
-- 
2.56.0.218.g1ec904b173-goog

