Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046357;
	b=kCwmjaYaTVY9vLYjNMa+MIz7Q5FZK6g1eq1YFMm4x66hbu/WIV8RY1JvRau90uDgOcAi
	 O7Um2COS62NR9t9jzzbZjoqGncIJzNmTz025CINZYHWXE/VbIa/h7c3+6hywBgmanZxal
	 ZBdvPIfrgXHRFqv4Kx5zBghZqVR20HrafkEdDJwLFJtSNuuKl4HO6XmYYFtZ6ENiWfCMv
	 UYzCav/BAJzO+RzzGMctCR+eUjmBhce92xxxcccTwcreKfqmKRSIosKZjZmA4QA/zcyCS
	 jMskC2VB5j0hB18a9gSriKBPwKox6dvciRCcn4Cz6fEgufL/3T/SSy+4X6mgXqXv4VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zYHw9i1ZC99ijVtSzd1tMuXGmwLLIqBi0BtOpLZ+XZ8=;
	b=kCZvJ3W379lSUDYCkte/SGQFcp6hBppih4pmS3OBbW9f+aQC/ihXIUhvjt1CrqQRReF5
	 M5h4kifbY9XRXu/Fg9EnJFvEltcB0nzrbboURDLMvDfEbmOnM3RyiREr3abMPBWjkD/TN
	 /WqcGQaGE30PtqGuJoJ28kYw2ZT1dlNs6/uaV4KDttu2bEeu5CaI/jP8SzNMN/YhyzYNo
	 XN3mJ48jc9Te+xBuyI6TxF2sEYs3SaaCk8ePt6gTg663tRwlVLbZwTMpOniSZ+HnbTDjj
	 2hnEtJOHoKCt3xG+wOlz1tEgEP+S71ZmPvXiKmVqYzEKJDKkIyBohRzvyRNiTRb1ABQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ucYlb/Gi";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1AD606A33B
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE1AD606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucYlb/Gi
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so10346715e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046355; x=1794651155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zYHw9i1ZC99ijVtSzd1tMuXGmwLLIqBi0BtOpLZ+XZ8=;
        b=ucYlb/GiDfxsWgg9M/Iz4Q+U/thZllsvDF7Z2ByNB3WxUi+ecuFDfrXCf9XpYZRCIO
         gbBRiBGqxjSlT+fGQJZlOnszjgl229YjhCllryN5bm19UqZhLKqY1EmyogvbzhGA6xPI
         85tT+rMqC2jPdYXMZJC/cs0PsrdyFHyQyCtVLpnDAtn1BmKGCUNrq+H9D4j4MF02M4ko
         4tgh40wFRA9D4AdMQudpkuJF8e8QlEElefGu+Dg+Ov/Ar6df0JBcMvotWUN21ZxfJSAz
         dYsCsOewknBbupnSrxrUD/nQAwgDDor9t29imyxnLqvil1kfUBNxFQVRDwIyHaRw+oXC
         uoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046355; x=1794651155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYHw9i1ZC99ijVtSzd1tMuXGmwLLIqBi0BtOpLZ+XZ8=;
        b=mUpLMMskrcGaSywo5jS1mVJm/HT9BcP+33IbICzD9uaxmbcaqKGifVFiLczRGwKIJk
         u1YQyEX28oSFEC93m4DRY9sktr+A5+PerB7p9P3gv3BTYeVGMaCiQBEc3b1y2dmXsLV5
         SljNz5iy3A2Vqan55id7FUw8jcdhttYEz85VsDfpxmV/kaq9MQkRLjFxiScSFDLOuLK1
         qvEBGc87ixPnDR57rnUPh5jsxLdLj5S6DaqxGecpqgDZdGwodZJOLHhL2Z4Yf5HXyZdP
         WQxxgi/dss9lVY5q2calgK0X0lK9DReNPzAAHgMxz+/QUSJLoX+DwDsAJGzzs8xHwpeL
         mB5g==
X-Forwarded-Encrypted: i=1; AKwUvBytB2fCLA6qNzWjY5r2A39FRShwYItztn/n6mpj69EBL9BbnIqe2YBuYjSMc/PCx7s118EIPn9vyA6IGNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QH6RX80NSI9GMGO/5hPkWPrvAF740+QVyXJKFGo/aJSlRpYlr
	zuNGE1OSPG98OUxUX0wSgXKYomFDZdTZWT0D2Zjf/4qAwZIKWk8zCIu1
X-Gm-Gg: AYBFou2rxlGtL5k1mKhczWP9axxiBQidMmAvHkYuXyQkC3nbZ2JzQfUT8yvVjUNPwFI
	oQzcMjHX+7QdyguEx5MURez0/V/E1LsbXzD/24LwPJ8Or7iufccIWYLNAkrX6Na6LkGB4mu0vfh
	rhDRoRB0i7/3wUI4Qo3XRdujxVbnnW46uYpWgTNY7HgIfG+sAmNXwO7F+ONNJ6+oKQ+CpEWxnIh
	ifGCLwQyyyqT0zZa6VE2FTtDqYy5Je3YPlUY/5dXrKJ7U/S7amvxnud7cKp+m8ovsQmtJdklfoA
	xIYzSJHWA0TY3Uwk6Y30Rgf7KT/cRtPW6Lun25v//ScfR8Md3MahJRHAg4jNVXIyE2hRVNCtooV
	vYzKwJyCVyl5kNhkFr5U1uF4QtA4xpe9ojqhDrGW9kDPojBy1L8Y6vz4MrOY239qHnly8I/sWw/
	CRxEvf9IlGsmpj7xl0BXT4cNDOvIhQcWNj/eQIqtyNgmPF/1jQwmUASGHlIvPDrD6fBbp6CG5eI
	6GX8W/KdGPvp7s56f/eWq5z2HuXdd51DsdVQCkLrCNxSdk6RjFQJfeIGD+DZ0Q3emBE0QeWFZUz
	mA1mt0RxLmmQho0uTuAFP5VtRdSueH8bgu+jCfKUR0645uq8Q6fdGrvHM6lhIFV8Ib7ARmcmrG+
	jiMqJsgoFIaqazQ==
X-Received: by 2002:a05:600c:4fc9:b0:4a1:fcfa:2a07 with SMTP id 5b1f17b1804b1-4b6e007beefmr92278545e9.30.1794046354653;
        Sat, 07 Nov 2026 02:12:34 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3283ec3sm51270025e9.12.2026.11.07.02.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:12:34 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] tracing/eprobe: Install the trigger for every instance that enables the eprobe
Date: Sat,  7 Nov 2026 10:12:32 +0000
Message-ID: <20261107101233.151434-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The eprobe trigger lives in the instance of the enabling file, but it is
only added when the eprobe is first enabled and only removed when the
last file goes away. A second instance then records nothing, and the
first instance's trigger is left behind once the eprobe is disabled
there, so the eprobe can be deleted while that trigger still uses it.

Add and remove the trigger for each file. The file is never NULL here,
so warn if it is and drop the dead perf paths.

Fixes: 7491e2c44278 ("tracing: Add a probe that attaches to trace events")
Cc: stable@vger.kernel.org

Signed-off-by: David Carlier <devnexen@gmail.com>
---
Changes in v2:
- WARN and return -EINVAL on a NULL file, drop the dead !file paths (Masami)
- v1: https://lore.kernel.org/linux-trace-kernel/20261031203915.491866-1-devnexen@gmail.com/

 kernel/trace/trace_eprobe.c | 56 ++++++++++++-------------------------
 1 file changed, 18 insertions(+), 38 deletions(-)

diff --git a/kernel/trace/trace_eprobe.c b/kernel/trace/trace_eprobe.c
index 998e6390937a..474be2f5ccd9 100644
--- a/kernel/trace/trace_eprobe.c
+++ b/kernel/trace/trace_eprobe.c
@@ -644,37 +644,32 @@ static int enable_trace_eprobe(struct trace_event_call *call,
 {
 	struct trace_probe *tp;
 	struct trace_eprobe *ep;
-	bool enabled;
 	int ret = 0;
 	int cnt = 0;
 
+	if (WARN_ON_ONCE(!file))
+		return -EINVAL;
+
 	tp = trace_probe_primary_from_call(call);
 	if (WARN_ON_ONCE(!tp))
 		return -ENODEV;
-	enabled = trace_probe_is_enabled(tp);
 
 	/* This also changes "enabled" state */
-	if (file) {
-		ret = trace_probe_add_file(tp, file);
-		if (ret)
-			return ret;
-	} else
-		trace_probe_set_flag(tp, TP_FLAG_PROFILE);
-
-	if (enabled)
-		return 0;
+	ret = trace_probe_add_file(tp, file);
+	if (ret)
+		return ret;
 
+	/* The trigger lives in the instance of the file, add it for each file */
 	for_each_trace_eprobe_tp(ep, tp) {
 		ret = enable_eprobe(ep, file);
 		if (ret)
 			break;
-		enabled = true;
 		cnt++;
 	}
 
 	if (ret) {
 		/* Failed to enable one of them. Roll back all */
-		if (enabled) {
+		if (cnt) {
 			/*
 			 * It's a bug if one failed for something other than memory
 			 * not being available but another eprobe succeeded.
@@ -687,10 +682,7 @@ static int enable_trace_eprobe(struct trace_event_call *call,
 					break;
 			}
 		}
-		if (file)
-			trace_probe_remove_file(tp, file);
-		else
-			trace_probe_clear_flag(tp, TP_FLAG_PROFILE);
+		trace_probe_remove_file(tp, file);
 	}
 
 	return ret;
@@ -702,33 +694,21 @@ static int disable_trace_eprobe(struct trace_event_call *call,
 	struct trace_probe *tp;
 	struct trace_eprobe *ep;
 
+	if (WARN_ON_ONCE(!file))
+		return -EINVAL;
+
 	tp = trace_probe_primary_from_call(call);
 	if (WARN_ON_ONCE(!tp))
 		return -ENODEV;
 
-	if (file) {
-		if (!trace_probe_get_file_link(tp, file))
-			return -ENOENT;
-		if (!trace_probe_has_single_file(tp))
-			goto out;
-		trace_probe_clear_flag(tp, TP_FLAG_TRACE);
-	} else
-		trace_probe_clear_flag(tp, TP_FLAG_PROFILE);
+	if (!trace_probe_get_file_link(tp, file))
+		return -ENOENT;
 
-	if (!trace_probe_is_enabled(tp)) {
-		for_each_trace_eprobe_tp(ep, tp)
-			disable_eprobe(ep, file->tr);
-	}
+	for_each_trace_eprobe_tp(ep, tp)
+		disable_eprobe(ep, file->tr);
 
- out:
-	if (file)
-		/*
-		 * Synchronization is done in below function. For perf event,
-		 * file == NULL and perf_trace_event_unreg() calls
-		 * tracepoint_synchronize_unregister() to ensure synchronize
-		 * event. We don't need to care about it.
-		 */
-		trace_probe_remove_file(tp, file);
+	/* Synchronization is done in below function. */
+	trace_probe_remove_file(tp, file);
 
 	return 0;
 }
-- 
2.55.0

