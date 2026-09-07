Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B58C44A404
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772463; cv=none; b=FKqb9L5rd80S5+Nta/S8NZmVaaRdZROTJwmIhQTAfZSHilYqh7IqxcgwOGXODqkGReI+ITGgEzzWJ8XcDGmFfhSxWfsNcfxFeidThMGMCf81F9qr60b49+rJpStHvCuzGhbYEppnZTNOH+z0CDOXd5yzckjAODc7xsN2eLFOiZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772463; c=relaxed/simple;
	bh=61gavAb+bNjBQjmGBMHXBoJ8xLmqWgRO9jK0W5nwO2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QSdjPa0UYze5E0dfmkzDEgbNM/tcpwBdw+URAbeSQ/MsbfhSyQIxNp1SGvlChgsRhCeP68/dXNldIouYr3o0za0EUgnjT8o8C0PljXca6GpqyQ/yn2gSxSJdYPk5UEIZxp9R9UD9nHIZEqr4PGmB33DruTTb/KH1fgfHyj+T90E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZNkmjr8; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZNkmjr8"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2959688a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788772461; x=1789377261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ouVF9IIg80xCvpdvVIuKRM26PH9Y1EbfH42UFcbYLts=;
        b=hZNkmjr8klcaBtEQtEP0iNP2asvyNFwLtUld+Mgl+aao+pGu8MLNr/NyBj5QXKdWF/
         b8WohH9ftbO0b5IjeztPCOjvUfuhRTdgF2zgovxQcZ5z6iCNNoZdXv+mGmVfgUHnHT27
         j981HOTf+w4318w6UU9kWhkhmBC3Ak7sNCf1pymFy0eAaEtXrGWf4mirAZwDneKm1/7R
         NLOlcajor/z4BX1CsbpVdFtrZj9DdLKrOrddGI+PDrRu4/dyAZpsywSUsr7wyJj9y5WD
         y7PF+S6u4+qQvGreL/OfoQdRtL3kRHun5o/km0R57bGWIvk0jBCACEUOiBOYIgnnLpAg
         +3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772461; x=1789377261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ouVF9IIg80xCvpdvVIuKRM26PH9Y1EbfH42UFcbYLts=;
        b=PluL6X9KubRhJrFEtqugFaXmHsAWxZnY3YssCgwtZRfwNWX/ZWULqHTE/QcXqhanhC
         bzA4aM3gVRT+DH/SNzbh9og05wBEQQi+002yVQnpRYTVDxssyPKN6hCI/lzAT5ZkZsvm
         NuGgzG8MedoZFGsmO0qPQHeAFMmBXAyyK3XNikBZpJTxWGq9eE0VIf+qbYw8IabjkAA5
         yLZOvLvBlCuKSz93glNoFyxh6yHxxVDiT6CVXm5OF2YKAwwtO86+Ih1c0F/5AaGSTk43
         8kNC3wi5/Dhoud5JfvANRzMLI5kH38HhzctPjWNXphzm3KVSdBXGuLAa+DJUvvAXBkzr
         yPwA==
X-Forwarded-Encrypted: i=1; AKwUvBzi9yo1akyqVYcReNxdK3OCPysfHlhi+mRwVWXS21gHjivaAijOs15O3jV6DoMDOVUJa8cMUTjYKdlVYf8=@vger.kernel.org
X-Gm-Message-State: AFuF++m8MPNYn1/RDx6VdunZXtP3x4BPm7IR+vv98zX5BUYLcv4kAGYi
	PW99BA1z1iwCrlarHMX0QwYHzFGCVt6tdAXvg3CBYHP8iMJaGEesUQw=
X-Gm-Gg: AYBFou1ubNmDVfWlkzfPGrO8G+nBNHhUpEEZad4/t275rzaW2hMqqo5A9zkTVHzzIyd
	KUg/WaKNv1a/2LL40/UFOxrl0CgtJkj+mAoofVQ8iKMcQ6GtKVw6MQ3DMAZhMNywU2EPCLvt3Qf
	UFLnloG8cmSJSSOgIRurFJWDEixikfgU9v0LEpi67snvD6/bWy4VV9Ys20Gt/JS22uXHJCNyCJl
	ztbQqjEvfQV3CfrJWd0g8R4kAxg3/OOjDXXNSqNzrnXw9H2xCLdZr4g+IUXbq2umGmpV+vzAmeB
	R4H4qjA6R7IfJgvn9EKIms6RBNWtdmJf0zYo8K475RIEpDfGwcFG3wymeBL2jgpSeTesVNR6RAW
	365b6npA3yhVdDhPWrbsRwX8/1lzb/3Zw7jZFKUaOABNJhfdGRnKCSfAXRe3BYZWXlpc4fZqbJu
	1GPC1eL0dDcwCske3tBCZPg9OcwBgri3vJ1RkFqj5b0vPhrKJ6b9GXoJdZAINIOJJW9ci+0lSsd
	IQjmt0Wqx6QSCMw
X-Received: by 2002:a17:90b:584f:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39b27c8b9e4mr16888502a91.8.1788772460729;
        Mon, 07 Sep 2026 02:14:20 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f88475sm19450233a91.1.2026.09.07.02.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:14:20 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH] tracing: hist: set the trace clock before registering the trigger
Date: Mon,  7 Sep 2026 18:14:15 +0900
Message-ID: <20260907091415.554535-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hist_register_trigger() puts the trigger on the global named_triggers
list in cmd_ops->init(), and only then sets the trace clock:

	if (data->cmd_ops->init) {
		ret = data->cmd_ops->init(data);
		if (ret < 0)
			goto out;
	}

	if (hist_data->enable_timestamps) {
		ret = tracing_set_clock(file->tr, hist_data->attrs->clock);
		if (ret) {
			hist_err(tr, HIST_ERR_SET_CLOCK_FAIL, errpos(clock));
			goto out;
		}

The clock string is not checked anywhere before that call, so a named
trigger using common_timestamp with an unknown clock fails after it has
already become findable. event_hist_trigger_parse() then frees it
without taking it off the list, and the next lookup by name reads the
freed object:

 ~# cd /sys/kernel/tracing/events/sched/sched_switch
 ~# echo 'hist:name=foo:keys=common_pid:ts=common_timestamp:clock=bogus' > trigger
 bash: echo: write error: Invalid argument
 ~# echo 'hist:name=foo:keys=common_pid' > trigger

  BUG: KASAN: slab-use-after-free in find_named_trigger+0xac/0xc0
  Read of size 8 at addr ffff88800915d760 by task init/1
   find_named_trigger+0xac/0xc0
   hist_register_trigger+0xc1/0x900
   event_hist_trigger_parse+0x3146/0x6af0
   event_trigger_write+0xce/0x160
  Freed by task 63:
   kfree+0x154/0x420
   trigger_kthread_fn+0xfd/0x160

Set the clock before the trigger is registered, so that nothing which
can fail runs after it is published, the way commit 6f86bdeab633
("tracing: Fix bad hist from corrupting named_triggers list") moved the
registration below the rest of the setup.

tracing_set_filter_buffering() is reference counted, so the init failure
path has to drop the reference that the clock block now takes first.

Fixes: a4072fe85ba3 ("tracing: Add a clock attribute for hist triggers")
Cc: stable@vger.kernel.org
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Reproduced on x86_64 under KASAN_INLINE on v7.3-rc2, with an initramfs
that does the two writes above from init and then waits for the deferred
free. Without the patch the second write reports the slab-use-after-free
quoted above; with it there is no report, and each rejected clock leaves
its own entry in tracing/error_log instead of only the first attempt
getting that far.

Same kernel and initramfs, selftests/ftrace test.d/trigger before and
after: 45 results, identical item by item (32 passed, 3 failed, 2
unresolved, 8 unsupported). The failures and the unresolved results are
there without the patch as well.

 kernel/trace/trace_events_hist.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 963e0d6b61fd..6c628415468a 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -6643,12 +6643,6 @@ static int hist_register_trigger(char *glob,
 		data->cmd_ops = cmd_ops;
 	}
 
-	if (data->cmd_ops->init) {
-		ret = data->cmd_ops->init(data);
-		if (ret < 0)
-			goto out;
-	}
-
 	if (hist_data->enable_timestamps) {
 		char *clock = hist_data->attrs->clock;
 
@@ -6661,6 +6655,15 @@ static int hist_register_trigger(char *glob,
 		tracing_set_filter_buffering(file->tr, true);
 	}
 
+	if (data->cmd_ops->init) {
+		ret = data->cmd_ops->init(data);
+		if (ret < 0) {
+			if (hist_data->enable_timestamps)
+				tracing_set_filter_buffering(file->tr, false);
+			goto out;
+		}
+	}
+
 	if (named_data) {
 		remove_hist_vars(hist_data);
 		destroy_hist_data(hist_data);

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.53.0

