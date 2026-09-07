Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF14309F08
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764174; cv=none; b=SnvYfAe7Ic7OLyLfdnLYBvDydfmQuBUyascZY+2CM3nhNuSn7Y6bZAWQXPgk+P8XZc5q5l7NjcVaAixizDR0Eehpx62SR8KJ2YsD/Ad1mWKyldk6QjHRUXhIHJMbRFdmtQpAWbbawAeF5UZfWPr9do4MYDoE1jQ83OybNRGIDcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764174; c=relaxed/simple;
	bh=NhpmIIeSpHxOh5isXBwUScoeaVEik8jNta2lhSfppSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GofsbDt1m3PTejNKPOQXlyg8ih8C6x/LM/4DALkPlxoz5nbaVxEIwaSRditiPhkceYeei53oAGI/cI2p+UhYv8E5dNDe4n8hD+dYcuQ1uAkcjKE2aM7ze8EhL3UTU7p/twaqKdiu8KKJzqIlW/UH5lQwrSPbzvfcXDLusUomr+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOFMWWUM; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOFMWWUM"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso3428220a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764173; x=1789368973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mC7T3ph+JEOY8FMTTcX05SQsuupJCdCJ8BZxUfDf5oM=;
        b=eOFMWWUMzw+CfzNZP6L6skcE4+/Efkjt7RfqpsEU0/ndigMoso9Xqwt6QE6umHwDCU
         JkKbnJi9mY0iF5wNKMx5yltL2RMwvQBCnVw7GdgkdWRRDTVvSm4WrTETtoUm5SzcWkTg
         pqFp2W0gjc78QNOTm5c5ezPuOXrNo4Tre1dZxlIp+Upm2NfjTv3y7ZFryh36Z+6ykN6Z
         LuAY+yNj05UxEx+f1ismHJvQJVTcvkg24vd4AYGztBCwr7RYXV14Q23M10WmiokB6dHP
         514sNqrm22SfC/UhIb+djMokznh7kqcigzK7c2NHqod8bFCoeGGQQrul+v6gE9INA/fJ
         FV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764173; x=1789368973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mC7T3ph+JEOY8FMTTcX05SQsuupJCdCJ8BZxUfDf5oM=;
        b=Sx2/TsYGJIZJhN4BEROQci2KGk3DDVr9f0sBga5w696OEUAmW6XwBbgsuA2V8ekYlg
         384PRBpAfik8vwZx3A3H8HB2j+fvsD1sMwwJtbAo9tgmyK/L/SV6R+CUs/rLS5ydJIOz
         1rb3OcmIVk7zjRsMyGe3FVmD8lAi3woHF+fvkY0NRlOsLXtlMCuwwaO6S14jLHnXn6Bp
         W7G6sHh4wtWwHStKl6KVoRfcrcgeN5IjfOHb1HIfmAmHTyZWfUsUqtti7OJpkNROX6Ai
         /Wbi6a8AOGN7uCTITaCnrzbiwkpgYc/4R65sJgBaO+zzTXySrwUhGoJ8j2GBUdGYnMJL
         t9vw==
X-Gm-Message-State: AFuF++mOYm9h1sHmgFDDYRmu8DTlZdlzL/wJACXaDbHTZFyzpRhiuMTM
	JjErW0ah53hXSwLchQlyXO39TByFQpVvBvtgrqb2JltzVhKto5loW8Hx
X-Gm-Gg: AYBFou0HHpynTwe26fkWg9At9XFHm3KWwWdxacw5DZ0NAdaXd9lCdoGNQjWmKmhcZd0
	4mWC9UALdkhwfnpCNfevQRIot6CEN+Rcg3vy7/AcWh9tBJllWOnnwQkH/PVA9SKLdwJVZZEj9UK
	dH4YTwyPfIT0Ndlvi/v2NOpRKiaoY9+7+stW3xo8tPIArgA9LzKlczJRJMq1IAIVlmVjaUSAMWT
	jq5yS8jQ8QoSeOzaJfmcz2ylutQD3MS5xKj9xsgRjFgEVU9+sY+fxNl95Yz7kB9nIEFX1LKWTul
	3kAssOntMHcITPAXwk+JwipnUBzHreLEGPde8fJEnB9G7g9B8k1IN/8R/WSZAI4RokkQapjC00y
	UNrFZz5JZrmkRNzkYXSmYTueCYP7X7ZZXL/Iz9EMBuReq3H24AS5EP+d/O0HGKgisHDYsEpaFmw
	F8dVDqsiv+6ZwlVy4oZoVsL2snrCms0pdpOZKfXs7iDJkJ7DIM2FXDvdCFF6Ax5Kw8uBECO2X+w
	XTZvlY29I4iGQ==
X-Received: by 2002:a17:90a:d44b:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39b26252edamr34497069a91.24.1788764172958;
        Sun, 06 Sep 2026 23:56:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14344a86512sm2067445c88.10.2026.09.06.23.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:56:12 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH 08/14] tracing: fix typo "preceeded" in comment
Date: Mon,  7 Sep 2026 12:26:07 +0530
Message-ID: <20260907065607.36615-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "preceeded" to "Preceded", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/trace/events/timer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/trace/events/timer.h b/include/trace/events/timer.h
index ca82fd62dc30..3aa0608c6361 100644
--- a/include/trace/events/timer.h
+++ b/include/trace/events/timer.h
@@ -302,7 +302,7 @@ DECLARE_EVENT_CLASS(hrtimer_class,
  * hrtimer_start_expired - Invoked when a expired timer was started
  * @hrtimer:	pointer to struct hrtimer
  *
- * Preceeded by a hrtimer_start tracepoint.
+ * Preceded by a hrtimer_start tracepoint.
  */
 DEFINE_EVENT(hrtimer_class, hrtimer_start_expired,
 
