Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66A91AAE28
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788758481; cv=none; b=DpFhlk/qbJ+oaNXQHf+/ZVfLmxM1h8kJM1VE89Y0HWgK63kK+02osSXA6vVxom6YNeJ3+W5BfZbuldSxA5lIfZtpx2btC3VwzXNrhUVDBSevZtTV/Gi9iOznojXWyVrYwhlWJb9Sky9ZJa4RIizLIEtvIRbIsvwr6ijDxA7UvRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788758481; c=relaxed/simple;
	bh=fh8PztGUjZg6c0C+06deI5LFt174xeSTuIW2JZdN684=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dgyXukmHc0gJ6XT24TjfbJW9angOZAMckQP69S8yWbdi3803uijudu64YifDgsZf1NqeotYBnsxgZ6TizSSDEQ0g917Y//HZft90wpSGFFtlCi773NwMZHP1m7pVQBlNlmmAD+NbNH8oVTsAKLrlTBxQG7SLfEXn/oRx8zXJdto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+vVqGSP; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+vVqGSP"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398b3d66515so3012191a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 22:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788758479; x=1789363279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g/IoHQKVOt1DZYCcuXfN71+bBk3opjHV1VqUujIL3kM=;
        b=e+vVqGSPZZgK7EJgKSy2p/fJsdxIt8fUMAURhPBnSyw66FxpTflOyFmyKy6ozBpYCW
         BjkD2QadyCoCRoCYdGZik0Qid3irqo+BUv2XtveXqTj+vyq0wBcHFD7sFCquSrbOCZsS
         T31ASWnTEUE2EvkK2GNyQ+wnEARILCqw9JFyvS2pnx9mjuBzSfALbjF8ifLlxmPNb+24
         Z8/U725zMiDJ2FaCPD3eGokG4zlZUr+bHbK7KaiR2ApFeZkFqg85mWT53xSKjPIzLPE+
         lRsHVkq0K+k1op3rPnroUgUzInkYzC4xxDL+TIIXW6rGi2IPNEFobIAopTGJ0ZPWMho/
         8OVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788758479; x=1789363279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/IoHQKVOt1DZYCcuXfN71+bBk3opjHV1VqUujIL3kM=;
        b=DqezPChgOwo1u4NqPfEKvXbETWKiJLdvH3W1SBPc60PLbmlbvYGSYAuEQE3RTkH8+n
         IckU5eARho55Sm3MCrsmIvVPsZU29SDVfc36NBzl7vU5DuiIXQMw8wGBEtv8i/NvuG+F
         1hfjXxOE2UoQr3ZW17BySalq7ZJb6QbydfaH9VHDSgVqXLSoM5Vy0uCtMo6HamK51Miw
         FgPPWS858dRUqFFsH7Xd91UQv0NHWN5MhE+g/2YyxnfZdcBoqWpdYfpDg8fCoYp7CpWq
         Uexyqr+Ex3GFEAVhQoH0nnAXYUDa36o0AViG0TzLSv4M83U482z06X5L2v/MMZKzu/dZ
         OKcg==
X-Forwarded-Encrypted: i=1; AKwUvBz09dPNziQUVeJLbDqNA5bFrTHTGyNzGx0Bpd+OOVdCLxACudq5YlA3v4ryjZ0pirH/FjQ/CZNG0VQrAkY=@vger.kernel.org
X-Gm-Message-State: AFuF++lpX7RunYWpZL3a1tdTkMPkpPONPcHmBaUZQBZh3wg+LZr4/r7X
	uGtUIBw9vtYGN5FMoDZ38UQ4MbZzP5VZtUqAGaB8mFVbte4DPHBMY1s=
X-Gm-Gg: AYBFou0rYfWZn8HANXbmz/47NOZbvbtHBYP0PNjMx2zYIxVvy1rc2k2FJ6ZL4RAWhul
	aFL85WRvLUJwZSkc43pSsI2bwpASiOq4KVK3QIB5bRTXuyMxu/JIKGDppgqtJ65ZwUd6MpuuwV3
	vCoXHc6MlTNHDDL4mFsbUnmn41RC+oxK0hbtO6cJr1+V6ruJiOX6E+ngQRBF1d51LAAID6pAMqE
	RRMSaBFWS9rIhoIb32Kq6+1B2MO1Iyf/WLegF8thAeLnCKd2tcAQaO+qp6xYtWC64UiubU72kT3
	HIAHqtv9lwzXdNgy40Ah/lqWlW8jrb5e1U25ppMbbSFhx6oF52SNVwN7NC0bqEW20ZwDSGhVBXV
	OS9eWHC2DjOxKidSBYEEr+bs4kPeDkP8AGya6Ioe17t2FLnBe7J5km6leWB2lYwhVsW60d5fKOs
	uwjAszBx04qVj0jgOHrhUHBwShzT4s3fzw6+WYFKxM8nOeP66iQo5E8c74xNgXvsmymHyUSSFDw
	8Xp57Bq25UBnTpH
X-Received: by 2002:a17:90a:d644:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39b26245cfcmr32715392a91.20.1788758479088;
        Sun, 06 Sep 2026 22:21:19 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae60a8e61sm8933987a91.0.2026.09.06.22.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:21:18 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH] tracing: hist: let values keep the percent and graph modifiers
Date: Mon,  7 Sep 2026 14:21:13 +0900
Message-ID: <20260907052113.430818-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The .percent and .graph modifiers exist only for histogram values, but a
value carrying either of them has been rejected since v6.3. The example
in Documentation/trace/histogram.rst,

  # echo 'hist:keys=prev_comm:vals=hitcount.percent:nohitcount' > \
	 events/sched/sched_switch/trigger

returns -EINVAL.

parse_field() sets the two flags only when the field is neither a key nor
a variable, that is, only on a value:

	} else if (strncmp(modifier, "percent", 7) == 0) {
		if (*flags & (HIST_FIELD_FL_VAR | HIST_FIELD_FL_KEY))
			goto error;
		*flags |= HIST_FIELD_FL_PERCENT;

__create_val_field() then rejects a value for carrying them, so no field
can reach hist_trigger_print_val(), where both are implemented.

commit e0213434fe3e ("tracing: Do not let histogram values have some
modifiers") added the check after a value with .buckets oopsed in
hist_field_name(). That happens because .buckets and .log2 make
create_hist_field() build a nested field in operands[0] which
hist_field_name() then walks into. The percent and graph flags do not
create an operand and are not read by hist_field_name(); they are only
used when printing a value.

Stop rejecting the two flags on a value. The check for variables is left
alone, where they are unreachable anyway because parse_field() rejects a
variable carrying them first.

With the two flags removed, the trigger above installs and prints as
documented:

  { prev_comm: rcu_preempt  }  hitcount (%):   0.00
  { prev_comm: init         }  hitcount (%):  99.98
  Totals:
      Hits: 237896

Fixes: e0213434fe3e ("tracing: Do not let histogram values have some modifiers")
Cc: stable@vger.kernel.org
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Tested under QEMU x86_64 on 1fc5a74b108f. Before the change all three of

  vals=hitcount.percent
  vals=hitcount.graph
  vals=hitcount.percent:nohitcount

are rejected with -EINVAL; after it they install and print. A plain
'keys=prev_comm' trigger works on both, as a check that the test itself is
sound. tools/testing/selftests/ftrace trigger tests are unchanged, all 45
items identical before and after: 32 pass, 3 fail, 2 unresolved, 8
unsupported, with the failures also present on an unpatched kernel.

Nothing covers these two modifiers in selftests today, which is why the
regression stood since v6.3. I can follow up with a test case.

 kernel/trace/trace_events_hist.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 963e0d6b61fd..faaff7b315f6 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -4313,8 +4313,7 @@ static int __create_val_field(struct hist_trigger_data *hist_data,
 			goto err;
 	} else {
 		/* Value */
-		if (hist_field->flags & (HIST_FIELD_FL_GRAPH | HIST_FIELD_FL_PERCENT |
-					 HIST_FIELD_FL_BUCKET | HIST_FIELD_FL_LOG2 |
+		if (hist_field->flags & (HIST_FIELD_FL_BUCKET | HIST_FIELD_FL_LOG2 |
 					 HIST_FIELD_FL_SYM | HIST_FIELD_FL_SYM_OFFSET |
 					 HIST_FIELD_FL_SYSCALL | HIST_FIELD_FL_STACKTRACE))
 			goto err;
-- 
2.53.0

