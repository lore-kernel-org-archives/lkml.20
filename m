Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC4F43CE7C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382445; cv=none; b=RiyPlIwRrIZyAqV6CbAEkSTHaj8ULrx1xHohu/EwEnZCZIjrZPIPb1i8MM1MjkpaupNOYAATAJxfQEIMKd3pLBx8RIVIhkLJe2jBdOCMwDl7PcXb0KepvS8MqmUTDlER6rIQvXekipymVPzPgTR+5y3UmDURHMN+MQFYvL4ufJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382445; c=relaxed/simple;
	bh=GoNTHpmWIseG1FgYRLB02Ui/Fmpaj1eRK8oQos1DfcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ia4ZuviSkkr1a4hZv7DzUADAjvReV+udsKRVLTSm4ZUL9UUbJ/WyQubppMN7NFwzo7B/hoifqj2chPndoQaVQu0NInHYY/Fl1h3oiyumftloY0jlKJhAKYvWtDPC4TO4NWRaVE9zU05e/iPFXaAANRcj1NstyZzpiodTYelyb6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDkgCcKY; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDkgCcKY"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8692be1cda4so2484907b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789382443; x=1789987243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ITP8YnoGoJGYNciFDsIfLG4MQrrfwApvPNq3/p06wBI=;
        b=ZDkgCcKYs1VUyzgmiCOjTl1/8zgJfzecGHV3H4HlNzAmiE6LQyodAo+ocFoLzap1DJ
         0YNfWAl9UNMsUJCrhAQDX21t3FsxINNdRGVT3F7uOhKopatHFkA9MlRZ7VWcjYHDcg43
         fPcbNNDa9DsTsO510qu9xnuSZi9OSt/WyqPD3a9Q+WAz8orhrNuLPfu1BClGx18Ol54y
         ClikhAmhOKsGebdLYfr36AlWCZGWbc6anjvVW2b78A4M59mee5PXDbjUb/7SmC8MamjD
         SYbYaOvelhIGAwjIqjrY3CYK1exue7LBLX2QCoXZ0hkQaSTOiwjfym9LXxFcK5HBu9/O
         2EEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382443; x=1789987243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITP8YnoGoJGYNciFDsIfLG4MQrrfwApvPNq3/p06wBI=;
        b=m8kh2voqMp4lfn4l3nFbiSwi9gQ+SexLcqHVu9EAmtZivosIUtdbSQY5kYHSLeJSdP
         o49HpqxRN0gCoGdHBsRbXBX2ww5DIthcqKY5g1j2JThNXirrWNQrTaFU79ADVZWP2wy4
         UxfBAQoHDh4ySqSYGcZGfKZwwm3yqmpkZw6DzBQc9CBn2nXt6YGxpgfaZh3qcIocKIto
         lGqW0CxTMNn85yqHgIqH+ywniyOLzc9j3WM0vlt/VybaNHLErrZN4C+mNQyFC7FA+EmJ
         S2R1a/hw1KY+IbYAhXL8kuhDPcyF8yBEb0WUJHd8ljMSyFV5z7cWBbLvx+3hUv8BUV0E
         /ftg==
X-Forwarded-Encrypted: i=1; AKwUvBxv59Xsjwb/cqR4s6RGVDhmNzUf5CLCF0BI7lsp8fzp8NONVVtiiRbL70VuO93/YSBInKG7UPBGrOeOhmg=@vger.kernel.org
X-Gm-Message-State: AFuF++ns6PTvp+uwtPdHj1l2JuPyjRTBkfI648mkGi3ey89uopW7aUSe
	orjkGa8M7P45tMpuUGfyCEiJow+BPcIVRQhqBB6ExJUDJcoTJCDW9lU=
X-Gm-Gg: AYBFou3qWtHZEVFUYvBoPbpnjQEVgVEy7VAkn1zWPx8MGD1JJcWiuPNIgRU6D7Xeqlp
	TD3Rsvgo7xYM61kg4pH9R9amEy2frcZ2TRTSj9KRSMsM3/bb+Lg7KVCVmaf7shHW4h3TgbyK+nt
	GRRqoFOR412kE8fdpYqI/8x2Gfa5Buz5x0IEn31rygCpvFIj+u/NWwG+GpagNbyFzHFWV0Ti52U
	czaolI9mJMeRZkUbZcex0Fp7pznwnVqg87XHTi3AuEz22zYlg2xz8xgoPaiXhGMv9JPDxxD0St3
	dfntOA/ZdoU873LrLopxTdfA8jUccA06Ej88X3OXH4N/T11l0BqB2ZqB/uGBcOB/IoOiVYwBVN3
	zt8ET4Dwx5kWLXAAJNq9iQ70dICJM6R4NBiKRHEYs916nh7l09MtABdb1+AUsY6pfZribYUj8OD
	Db3JO4QL+GskRf7pV5tUIH3lSCy3aiZ7COk4JyPNA5BmzC+hO8Bn1+wqQYNGqa1HFk3bwZ42546
	zFor5Iy6PLTeoCyybTV2GjK9xc=
X-Received: by 2002:a05:6a21:d83:b0:3cc:c7cf:5a44 with SMTP id adf61e73a8af0-3db4037ccfcmr4309572637.2.1789382443334;
        Mon, 14 Sep 2026 03:40:43 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:3b80:bc61:4619:5346])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c652aa9asm4632560a12.9.2026.09.14.03.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:40:42 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	zanussi@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com,
	stable@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: [PATCH] tracing: Unregister field variable histograms when the command fails
Date: Mon, 14 Sep 2026 19:40:36 +0900
Message-ID: <20260914104036.1768529-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An action that names a field on another event needs that field as a
variable, so create_field_var_hist() registers a second hist trigger on
that event to provide it, and records it in
target_hist_data->field_var_hists[].

If a later part of the same command fails, create_actions() returns an
error and event_hist_trigger_parse() jumps to out_free. The write fails
with -EINVAL and sched_switch gets no trigger, but:

  # echo 'hist:keys=pid:ts0=common_timestamp.usecs' >> \
      events/sched/sched_waking/trigger
  # echo 'my_synth u64 lat; int a; int b' >> synthetic_events
  # echo 'hist:keys=next_pid:wakeup_lat=common_timestamp.usecs-$ts0:\
      onmatch(sched.sched_waking).my_synth($wakeup_lat,prio,nosuchfld)'\
      >> events/sched/sched_switch/trigger
  # cat events/sched/sched_waking/trigger
  hist:keys=pid:vals=hitcount:ts0=common_timestamp.usecs:sort=hitcount:size=2048:clock=global [active]
  hist:keys=pid:vals=hitcount:synthetic_prio=prio:sort=hitcount:size=2048 [active]

The second histogram is the one created for 'prio'. It is still active and
still counting.

out_free reaches destroy_field_var_hists(), which frees the
field_var_hists[] entries, but never unregister_field_var_hists(), which is
what removes the triggers and runs only from event_hist_trigger_free(). The
entry is freed and the trigger is left with nothing tracking it.

Unregister the field variable histograms in out_free as well, and record
each one as soon as its trigger is registered rather than after the lookup
that follows it, so no exit can leave a registered trigger untracked. The
entry then belongs to field_var_hists[] and is released by
destroy_field_var_hists(), so freeing it on that exit would be a double
free.

Cc: stable@vger.kernel.org
Fixes: 02205a6752f2 ("tracing: Add support for 'field variables'")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/20260913204302.DB2551F000FF@smtp.kernel.org/
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5
---
Tested under QEMU on 704340f1cd0d, x86_64, KASAN + PROVE_LOCKING, 2 vCPU,
unfixed arm first.

  command                                      before     after
  valid onmatch on another event's field       works      works
  removing that trigger                        works      works
  onmatch with a trailing bad field            orphan     clean
  the same bad command, five more times        orphan     clean
  two field variables, then a bad field        2 orphans  clean
  '!hist' that matches nothing                 clean      clean

orphan = an extra [active] histogram left on the matched event.

ftracetest test.d/trigger: identical per-test verdicts on both arms.
trigger-synthetic-event-dynstring.tc fails on both because busybox execs
its ping applet as /proc/self/exe, so the test's grep cannot match.

The exit that reports a missing synthetic variable is not reachable
through onmatch, so no run covers it.

 kernel/trace/trace_events_hist.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 8af97fd4ee2d..90e6e3990c25 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -3134,20 +3134,18 @@ create_field_var_hist(struct hist_trigger_data *target_hist_data,
 
 	kfree(cmd);
 
+	n = target_hist_data->n_field_var_hists;
+	target_hist_data->field_var_hists[n] = var_hist;
+	target_hist_data->n_field_var_hists++;
+
 	/* If we can't find the variable, something went wrong */
 	event_var = find_synthetic_field_var(target_hist_data, subsys_name,
 					     event_name, field_name);
 	if (IS_ERR_OR_NULL(event_var)) {
-		kfree(var_hist->cmd);
-		kfree(var_hist);
 		hist_err(tr, HIST_ERR_SYNTH_VAR_NOT_FOUND, errpos(field_name));
 		return ERR_PTR(-EINVAL);
 	}
 
-	n = target_hist_data->n_field_var_hists;
-	target_hist_data->field_var_hists[n] = var_hist;
-	target_hist_data->n_field_var_hists++;
-
 	return event_var;
 }
 
@@ -6980,6 +6978,8 @@ static int event_hist_trigger_parse(struct event_command *cmd_ops,
 
 	trigger_data_free(trigger_data);
 
+	unregister_field_var_hists(hist_data);
+
 	destroy_hist_data(hist_data);
 	goto out;
 }
-- 
2.53.0

