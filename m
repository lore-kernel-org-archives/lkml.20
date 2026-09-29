Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6294EE846
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686167; cv=none; b=RYe7LOghh1HDi/XvIm7N95eFerSkSEf098McGRRj07LLcQEekdDZSpWeGWbL9MJMJUx34kObgLPrOembfrE9Mb76THOD5jBDID2/ro+DfWsFz4wnTqBBmdQDACfz1nyxG5AT/OQyH+gjw1MPXcgvY/VWKQjPNjY/YSRyR0n/8Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686167; c=relaxed/simple;
	bh=r/ZfoBgyD1vF3LJTDWvszBll3ysJFWimztxHWCJKJhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EbSaVpVlixXUNwYK8CR6xQdwcSGe5bAmPKUWG/fM3Ai5veuzwshU+KNV2Jl8I7i4oqlwW0X346dYGHgz2p4dIkgbpt4jLtvvCfgbU6tBLnyrM5hNr4xMivNJxZrM9kFDRTx61DzQsUn95rmLrT+7y+zr65iPE2FWFtTBh3o6ulk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ae5swBwD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ae5swBwD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790686164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0FB2c+czFRObJnbuclViunwJsY8tUzCrXNtZGJ1dA4w=;
	b=ae5swBwDWzZdoKaCK2Df8ILcq52yFU3wgV/ayBuu7n+73xQA6zfVw7a98tK+/goqg690en
	OCvYx6/BeLdM07acx+xPTz++2deavvI1lF8HFVwfCSskOXlBPMFKP60xHYzs0fWoDx9jhP
	l/ga+MVX9EzPwt0KMGL6vL3tAchDGBs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-265-AHPC_yQkM3awmVcwWbF0FQ-1; Tue,
 29 Sep 2026 08:49:23 -0400
X-MC-Unique: AHPC_yQkM3awmVcwWbF0FQ-1
X-Mimecast-MFC-AGG-ID: AHPC_yQkM3awmVcwWbF0FQ_1790686162
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09C411954B04;
	Tue, 29 Sep 2026 12:49:22 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5CB851956095;
	Tue, 29 Sep 2026 12:49:19 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Nam Cao <namcao@linutronix.de>,
	Wen Yang <wen.yang@linux.dev>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 01/10] rv: Force environment reset action on HA monitor start
Date: Tue, 29 Sep 2026 14:48:59 +0200
Message-ID: <20260929124908.177676-2-gmonaco@redhat.com>
In-Reply-To: <20260929124908.177676-1-gmonaco@redhat.com>
References: <20260929124908.177676-1-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Currently the monitor variables with a storage (e.g. clocks) are
initialised as invalid, then the first explicit reset() sets them as
valid for constraint. This only adds extra complexity to handle the
invalid case in constraints check.

Apply a reset() by default when starting monitors instead of resetting
to an invalid state. If monitors have no stored variable (hence no reset
function) add a macro HA_NO_RESET to stub it, this is all transparently
handled by rvgen.

The reset() action on ns-granularity clocks needs the (possibly cached)
current time, read it directly there. This might cause a double call to
ktime_get_ns() within the same da_handle_start_run_event() but will
occur only the first time and is harmless.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 include/rv/ha_monitor.h                 | 8 +++++++-
 kernel/trace/rv/monitors/opid/opid.h    | 1 +
 tools/verification/rvgen/rvgen/dot2c.py | 2 ++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/rv/ha_monitor.h b/include/rv/ha_monitor.h
index 6e1c7fe5449a..93ac99ff7f1d 100644
--- a/include/rv/ha_monitor.h
+++ b/include/rv/ha_monitor.h
@@ -159,19 +159,25 @@ static void ha_monitor_destroy(void)
 
 /* Should be supplied by the monitor */
 static u64 ha_get_env(struct ha_monitor *ha_mon, enum envs env, u64 time_ns);
+static void ha_reset_env(struct ha_monitor *ha_mon, enum envs env, u64 time_ns);
 static bool ha_verify_constraint(struct ha_monitor *ha_mon,
 				 enum states curr_state,
 				 enum events event,
 				 enum states next_state,
 				 u64 time_ns);
+#ifdef HA_NO_RESET
+static void ha_reset_env(struct ha_monitor *ha_mon, enum envs env, u64 time_ns) { }
+#endif
 
 /*
  * ha_monitor_reset_all_stored - reset all environment variables in the monitor
  */
 static inline void ha_monitor_reset_all_stored(struct ha_monitor *ha_mon)
 {
+	u64 time_ns = ha_get_ns();
+
 	for (int i = 0; i < ENV_MAX_STORED; i++)
-		WRITE_ONCE(ha_mon->env_store[i], ENV_INVALID_VALUE);
+		ha_reset_env(ha_mon, i, time_ns);
 }
 
 /*
diff --git a/kernel/trace/rv/monitors/opid/opid.h b/kernel/trace/rv/monitors/opid/opid.h
index fb0aa4c28aa6..f85b1959c2fb 100644
--- a/kernel/trace/rv/monitors/opid/opid.h
+++ b/kernel/trace/rv/monitors/opid/opid.h
@@ -28,6 +28,7 @@ enum envs_opid {
 };
 
 _Static_assert(env_max_stored_opid <= MAX_HA_ENV_LEN, "Not enough slots");
+#define HA_NO_RESET
 
 struct automaton_opid {
 	char *state_names[state_max_opid];
diff --git a/tools/verification/rvgen/rvgen/dot2c.py b/tools/verification/rvgen/rvgen/dot2c.py
index 22938ce1bf6c..1532e6b6e199 100644
--- a/tools/verification/rvgen/rvgen/dot2c.py
+++ b/tools/verification/rvgen/rvgen/dot2c.py
@@ -90,6 +90,8 @@ class Dot2c(Automata):
                         ' "Not enough slots");')
             if {"ns", "us", "ms", "s"}.intersection(self.env_types.values()):
                 buff.append("#define HA_CLK_NS")
+            if len(self.env_stored) == 0:
+                buff.append("#define HA_NO_RESET")
             buff.append("")
         return buff
 
-- 
2.55.0

