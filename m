Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900983;
	b=X59uZNGo6SiFzMtqC1+a6VKsU2SeW5NyjXcDgYHpRzBWQzupNI0TiYv451rmFQqg6y6j
	 aBEAg8szDi7M7tAd2pJGOwEJJjOtViCrsyMgyM7J3N+EnGuZE5aOSVs7G4RTdLGrEm9pk
	 5OxpfWgi+4ZWDNEnswxQge/tErh23dNZwNaxVmB9UJDGzopAuOdudbXhKQ6FvS+hNMmpp
	 +3i5onhuztUVRhYworF7wLdWVab+NYrXlVgj1UYmIywvzC8OR7rVPGWXA3z7JuCAZZ9SO
	 /C+rcMt5s1gCDlvsozvYeyPbdAmtWmKQ1FESVDxmUjnFlQUA1MF6zg1GQ6uh4WMx7Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900983;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zGdfdjP6a+TPueYJm2dCOUdQPj2v0w0t6X/7e4tc8d0=;
	b=L+L49v56scrgpMe6gDH+SaGAnp6fQxoCstLPZj7BBDUxgdqNkIBqfw4vmLTej7fO2t3M
	 OKanAzMD30EfClBWUPgr15TbvIz7UckBlVS0Br1BidJ6GfsqihvndCXpSYwVfL6zf+D3B
	 3Z3OWhnz4g/ZDWala4wwQ8TmUzWv+RPi28yAiVhhj7NOZdUP6nWAMtxfxA2snYw5NpXPC
	 2Nf75qBgZWKIbvV/3i0KS5aJSB+t9e7zkzCuIvR6NRAwgfJ/loPBRl3et9fSFqWsEMor1
	 BtYbp3j/aMjF1tr5FAaLoOLXYVtnuqjH3CK70yMJ/9VbtYc8n8roKt/CwOSeH8OeQMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k8R7zWoX;
	arc=none smtp.remote-ip=91.218.175.78
Received: from mta0.migadu.com (out-78.mta0.migadu.com [91.218.175.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD9F606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECD9F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k8R7zWoX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4mrAIQI+m0F1K1NEKjyN89vPwAwdMuNeKG+UaA+E+X0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793900981; v=1; x=1794505781;
 b=k8R7zWoX6JrA7XKmvK2yfHP/Gy1Yluu7AhZ6zqRMDrbEwmaOTudYZwTeHre51q+LP3NcAhTY
 Xng6ydkkbe1TFxnewNVFpc4Ohw097hom7d8ymLu64yRkOkp8bkSnjJ8HHNWa0lO98ZWeVSBsB2z
 dnRUbXz8kS8JyiD1DX5nPaoA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id c0c82de5273c4f68;
	Thu, 05 Nov 2026 17:49:41 +0000
X-Mizu-Trace-ID: c0c82de5273c4f68
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Nam Cao <namcao@linutronix.de>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH v8 01/14] rv: Force environment reset action on HA monitor start
Date: Fri,  6 Nov 2026 01:49:01 +0800
Message-Id: <a5dad02da683a6a5065c4e803198f6de7a21f018.1793900349.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793900349.git.wen.yang@linux.dev>
References: <cover.1793900349.git.wen.yang@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gabriele Monaco <gmonaco@redhat.com>

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
Tested-by: Wen Yang <wen.yang@linux.dev>
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
2.25.1

