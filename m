Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684443;
	b=eL8ppy9hbZnUj9qVChgG7r/ea1CUS38Dgapw2SyTxzNO43eTGcEW2MuZ99rC3B0yemmv
	 Qt2WFVZISYeM/ivf2FPFUTgsVhfUFS1bJsnT5C5j8aIUclrQISaY1wvVh8umExz4PsAsT
	 7ymKBgSqO2u+qva2HXrWWtBQNDZWzR2hyVkjN4PPdd/JsDOBI5SfYfLFYOCN3R0nkfnqi
	 2sVqnyRAOarRNbX5bBjHgs/YhlORxBNsugIinHp7Mnh7fsooJIOlJTAjZBk6PoT1CpJfW
	 zxH3KOaCeHQuSistqJSbVV4yyszCm1ish2j5907PTx3AA4LOq90YhmGwqquBICqxZ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=bhzXyoxDbbkvUX4fUf4elAX1quvgndNZVw3F+zs7Wq8=;
	b=CJeP0utFuIp4Vsnj3DxZ4SqaTb5ztYd3G03AkIeAdXszIr9lJ6ubKBicT7Fbp61Hwc+9
	 Pxkc6Zmj0OSH3JfRxN/kWXwV2dak3MMd1xpfT64NOhLFvFHd7hssLnMYDOlifYS+CLmKD
	 sBfD3RQJ+kIboXeCOCQtGNJstJ+MGcAH744r4AAPb/VtnmvK5KQZcfiL6sjabcOh4cX+S
	 K6ScOPSYzFIjWfIYCzHno5OWe6+v+uaxTJF8w1P57JGgxZ8qVxyeXvL7Y5Q/NcRIdUJ+z
	 d2hMzL4nf9Ui4xTGDdqCrEkbFopsNgEPk5/+gkooygnbv2e+RGYGoC5k07m3quzEF+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ba1R8H5x;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DEF606A337
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1DEF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ba1R8H5x
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so17214205ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792684442; x=1793289242; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bhzXyoxDbbkvUX4fUf4elAX1quvgndNZVw3F+zs7Wq8=;
        b=ba1R8H5xLCpQdMpHQKNQKnlGebz7EZ848jC7sjMO6dOkHudfCbranhVy9E0ZKBc/sv
         czMf1CVMS6LJm8axDzBmwunC/ciZJEgZXYeQJl9g9S9cB6dr9cmtrHjaausFSP75SjjR
         2fXKvPtxvjj14l1DflcwRxrfHn9OBNoQegSeQmnd8x7J4YSGz7eatTCZs4o0PlLRuiWO
         z6yHn3NrqqYm5hM8/ScyS/0cMS12YK778aO2OJUZjtmjz+ax169Ke+2Y7IaY8cYAtJus
         vokk9k+V9EQv2HCayrnzLC3PIB5fZ3fIy5CjfXvSFbGekKkPuYIpQplQelydcQlLJ5OW
         Jr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684442; x=1793289242;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhzXyoxDbbkvUX4fUf4elAX1quvgndNZVw3F+zs7Wq8=;
        b=XMExNcPaEhj4OiHqlAXZvUbbSHUUKOrCj1BgInPoy57rM12O2iXLZ2iLZFVN15deCY
         nn7W8klnVtBqLBp/q6rp3M44gWj1VnjBH2Mefs8XhWQGESf/6e1JniGEshd1wj+RSV4T
         2ehGUhx+Fri4HkuOev7GTXwLnHqoeggqDgKrhE6FoUg9ixD6UoX2DjDJEdBhzVegPeHV
         UnuePK+8c2KPwlQWDH1DoiB/S5q7so8WBbblf28EjVQWA5941Z38PKocqPIUinC6XE/V
         dcMr0Jt8+8+ErPbrhmWSO7NQh4sJA98Pt0XlBAI4wA+G6ewuzLBWRfmUpT5nG1Qsh7G2
         OmEw==
X-Forwarded-Encrypted: i=1; AKwUvBzXwQrTSq8N8SLdIA5o1PHkX+0iZTT0s9YsEAe4r2dPhUAhBbMTmmJKfGCBZGl/IPJBXU3H79TMmjUWKFA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIY0r2L/R6Twz78dS9obgkLDWpObwAANghOEh82RKOMTejCYXL3
	l1iADXeI4wC5PmMZ44bLiZy2IWoTtcf2bbZfCiQrpL/7VJb2TJQNumFYSC0/O61gZJKaaSXoO6T
	yhUq+tE4E9w==
X-Received: from plic14.prod.google.com ([2002:a17:903:370e:b0:2e9:3aa0:9be9])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f543:b0:2e2:d834:a40f
 with SMTP id d9443c01a7336-2ea439a1af3mr42816765ad.9.1792684441651; Thu, 22
 Oct 2026 08:54:01 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:53:36 +0000
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
Message-ID: <20261022155352.1293020-4-wfelipe@google.com>
Subject: [PATCH 3/3] tools/workqueue: report queued items and retired stats in wq_monitor.py
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wilson Felipe Pereira <wfelipe@google.com>, 
	Shuhao Tan <tanshuhao@google.com>
Content-Type: text/plain; charset="UTF-8"

Update wq_monitor.py to include wq->retired_stats[] when available so
cumulative counters do not drop when unbound pwqs are released. Also sum
pwq->total_in_flight (falling back to pwq->nr_in_flight[] on older
kernels) and add a 'queued' column next to 'infl' to show work items
waiting to execute.

Update Documentation/core-api/workqueue.rst to cover
/sys/kernel/debug/workqueue/stats and the new 'queued' column in
wq_monitor.py.

Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
---
 Documentation/core-api/workqueue.rst | 47 +++++++++++++++++-----------
 tools/workqueue/wq_monitor.py        | 24 ++++++++++++--
 2 files changed, 50 insertions(+), 21 deletions(-)

diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
index bb770f556568..a4e08231580c 100644
--- a/Documentation/core-api/workqueue.rst
+++ b/Documentation/core-api/workqueue.rst
@@ -701,28 +701,39 @@ See the command's help message for more info.
 Monitoring
 ==========
 
-Use tools/workqueue/wq_monitor.py to monitor workqueue operations: ::
+When ``CONFIG_DEBUG_FS`` is enabled, per-workqueue stats can be read
+directly from ``/sys/kernel/debug/workqueue/stats``: ::
+
+  $ cat /sys/kernel/debug/workqueue/stats
+  workqueue                type     queued active running    started  completed  cpu_time_us cpu_itsv  cm_wkup    repat   mayday  rescued
+  events                   percpu        0      0       0      18545      18545      6100000        0        5        0        0        0
+  events_highpri           percpu        0      0       0          8          8            0        0        0        0        0        0
+  events_long              percpu        0      0       0          3          3            0        0        0        0        0        0
+  events_unbound           unbound       0      0       0      38306      38306       100000        0        0        7        0        0
+
+Alternatively, use tools/workqueue/wq_monitor.py to continuously monitor
+workqueue operations via ``drgn``: ::
 
   $ tools/workqueue/wq_monitor.py events
-                              total  infl  CPUtime  CPUhog CMW/RPR  mayday rescued
-  events                      18545     0      6.1       0       5       -       -
-  events_highpri                  8     0      0.0       0       0       -       -
-  events_long                     3     0      0.0       0       0       -       -
-  events_unbound              38306     0      0.1       -       7       -       -
-  events_freezable                0     0      0.0       0       0       -       -
-  events_power_efficient      29598     0      0.2       0       0       -       -
-  events_freezable_pwr_ef        10     0      0.0       0       0       -       -
+                               total queued  infl  CPUtime CPUitsv CMW/RPR  mayday rescued
+  events                      18545      0     0      6.1       0       5       -       -
+  events_highpri                  8      0     0      0.0       0       0       -       -
+  events_long                     3      0     0      0.0       0       0       -       -
+  events_unbound              38306      0     0      0.1       -       7       -       -
+  events_freezable                0      0     0      0.0       0       0       -       -
+  events_power_efficient      29598      0     0      0.2       0       0       -       -
+  events_freezable_pwr_ef        10      0     0      0.0       0       0       -       -
   sock_diag_events                0     0      0.0       0       0       -       -
 
-                              total  infl  CPUtime  CPUhog CMW/RPR  mayday rescued
-  events                      18548     0      6.1       0       5       -       -
-  events_highpri                  8     0      0.0       0       0       -       -
-  events_long                     3     0      0.0       0       0       -       -
-  events_unbound              38322     0      0.1       -       7       -       -
-  events_freezable                0     0      0.0       0       0       -       -
-  events_power_efficient      29603     0      0.2       0       0       -       -
-  events_freezable_pwr_ef        10     0      0.0       0       0       -       -
-  sock_diag_events                0     0      0.0       0       0       -       -
+                               total queued  infl  CPUtime CPUitsv CMW/RPR  mayday rescued
+  events                      18548      0     0      6.1       0       5       -       -
+  events_highpri                  8      0     0      0.0       0       0       -       -
+  events_long                     3      0     0      0.0       0       0       -       -
+  events_unbound              38322      0     0      0.1       -       7       -       -
+  events_freezable                0      0     0      0.0       0       0       -       -
+  events_power_efficient      29603      0     0      0.2       0       0       -       -
+  events_freezable_pwr_ef        10      0     0      0.0       0       0       -       -
+  sock_diag_events                0      0     0      0.0       0       0       -       -
 
   ...
 
diff --git a/tools/workqueue/wq_monitor.py b/tools/workqueue/wq_monitor.py
index 7f47fa398e3c..2f4176df2a36 100644
--- a/tools/workqueue/wq_monitor.py
+++ b/tools/workqueue/wq_monitor.py
@@ -9,7 +9,9 @@ https://github.com/osandov/drgn.
 
   total    Total number of work items executed by the workqueue.
 
-  infl     The number of currently in-flight work items.
+  queued   The number of work items currently queued and waiting to execute.
+
+  infl     The number of currently executing (in-flight) work items.
 
   CPUtime  Total CPU time consumed by the workqueue in seconds. This is
            sampled from scheduler ticks and only provides ballpark
@@ -55,6 +57,7 @@ workqueues              = prog['workqueues']
 
 WQ_UNBOUND              = prog['WQ_UNBOUND']
 WQ_MEM_RECLAIM          = prog['WQ_MEM_RECLAIM']
+WORK_NR_COLORS          = prog['WORK_NR_COLORS']
 
 PWQ_STAT_STARTED        = prog['PWQ_STAT_STARTED']      # work items started execution
 PWQ_STAT_COMPLETED      = prog['PWQ_STAT_COMPLETED']	# work items completed execution
@@ -72,15 +75,29 @@ class WqStats:
         self.unbound = wq.flags & WQ_UNBOUND != 0
         self.mem_reclaim = wq.flags & WQ_MEM_RECLAIM != 0
         self.stats = [0] * PWQ_NR_STATS
+        self.in_flight = 0
+        try:
+            for i in range(PWQ_NR_STATS):
+                self.stats[i] += int(wq.retired_stats[i])
+        except AttributeError:
+            pass
         for pwq in list_for_each_entry('struct pool_workqueue', wq.pwqs.address_of_(), 'pwqs_node'):
             for i in range(PWQ_NR_STATS):
                 self.stats[i] += int(pwq.stats[i])
+            try:
+                self.in_flight += int(pwq.total_in_flight)
+            except AttributeError:
+                for c in range(WORK_NR_COLORS):
+                    self.in_flight += int(pwq.nr_in_flight[c])
+        self.running = max(self.stats[PWQ_STAT_STARTED] - self.stats[PWQ_STAT_COMPLETED], 0)
+        self.queued = max(self.in_flight - self.running, 0)
 
     def dict(self, now):
         return { 'timestamp'            : now,
                  'name'                 : self.name,
                  'unbound'              : self.unbound,
                  'mem_reclaim'          : self.mem_reclaim,
+                 'queued'               : self.queued,
                  'started'              : self.stats[PWQ_STAT_STARTED],
                  'completed'            : self.stats[PWQ_STAT_COMPLETED],
                  'cpu_time'             : self.stats[PWQ_STAT_CPU_TIME],
@@ -91,7 +108,7 @@ class WqStats:
                  'rescued'              : self.stats[PWQ_STAT_RESCUED], }
 
     def table_header_str():
-        return f'{"":>24} {"total":>8} {"infl":>5} {"CPUtime":>8} '\
+        return f'{"":>24} {"total":>8} {"queued":>6} {"infl":>5} {"CPUtime":>8} '\
             f'{"CPUitsv":>7} {"CMW/RPR":>7} {"mayday":>7} {"rescued":>7}'
 
     def table_row_str(self):
@@ -112,7 +129,8 @@ class WqStats:
 
         out = f'{self.name[-24:]:24} ' \
               f'{self.stats[PWQ_STAT_STARTED]:8} ' \
-              f'{max(self.stats[PWQ_STAT_STARTED] - self.stats[PWQ_STAT_COMPLETED], 0):5} ' \
+              f'{self.queued:6} ' \
+              f'{self.running:5} ' \
               f'{self.stats[PWQ_STAT_CPU_TIME] / 1000000:8.1f} ' \
               f'{cpu_intensive:>7} ' \
               f'{cmw_rpr:>7} ' \
-- 
2.56.0.218.g1ec904b173-goog

