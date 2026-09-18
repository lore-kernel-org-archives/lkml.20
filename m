Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC45E48F02F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789713182; cv=none; b=s24hi1o+NYGkYuR5+gzYiJ7GAnNNIx8RBcMmbryh0MdLoATugPoTAfFvzVjwFzrxF0hn3c3Nd5K08kcg/KhYtofE2JArnEWKudfaIPvnPvMFpT2G2CyXY82ZVBP5VK7o6r9ioavLKCjyYaRF/JuetbPOhB8zi567oANpNBjrylw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789713182; c=relaxed/simple;
	bh=TopP8I0l5bgoJ7wE/9/c2Q2h1c69lwUM5/uLGyU1urw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tIS6rV17cQy7/j78lzSa/n65Y40/Rku+nBpW7VY0dSTjx7Up//QD/qcKos9GhXEPGgezcPTaj8jWuyLwWeAdCu/rm2Tk4C7zzQIuENEwhW5k3ud68iYdWVahzTq0ngdhpXW19NM86xmLbkub4mNdXCife7dcMb9WfTQnG95/Ifs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nbOGpy6u; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nbOGpy6u"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so715672a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789713180; x=1790317980; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YrrBnDof9dzk7iz3soaxRSgz7WHkwxWpYdufXgugnk4=;
        b=nbOGpy6uW8myzgPmuO/23ZW/xZBhgOpybuuxZY9xeJ7GmGYL5/MZkRuFSGkB4+8IO7
         5v8/5wjuD/jRdWSzbn4INmeIW3rz8rKZdmcDu4+mpdKPNtzitoYObLuVk1SpjYzH6T3D
         UyBAHht2Mb+YjqUHsf/xLzrAnL2mPSp6slui06JbQtceYaXZWLlQNHaCm/As73dNdX3P
         ylQwTbytlfyPjMoZTw9o1VVnYKhYaY32cvuhW1GXk8Uzz1gbjxoMDr8v2LXxIwrbkQs6
         iuIjK78YmuNCGI5YzZXO8qrabm25PWooFR6t+bkkpUq8Fe0BSWSaFOx8Nxp9uBU4ojxu
         wZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789713180; x=1790317980;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YrrBnDof9dzk7iz3soaxRSgz7WHkwxWpYdufXgugnk4=;
        b=w5k9PSbcjgvFSklP+NapxOcmaEi10VIGIyKMCJnQURXNPS04jdyrqg09cvFKfspA2R
         +mmpjW4uBBCYZZgIigwdU/KHYFG8wRdm6enyXQd7tEmVJ7xsdaxfxBq2lJ3oGN/Z4tWa
         6ey610hil6yvilQxMMgjfW490azwLunVbyK6IZOACN5ryQks+w7V4uVBoPOZ03+SnsEH
         ImQUKnAdSJGZCkx2pSJ3udtAyuc9VtbjcO55YFBFXwq92VKWpgB8MBAzkLj8U5E56PH9
         60KunY3QkDp+D5e3VOrUmge7YyiPBWbPHB+c2t1Ac3Oa6miaQgnGd9IkSQDBaQ7dyQjW
         rAtA==
X-Forwarded-Encrypted: i=1; AKwUvByLNxiGP27rruUYn8DE67WGdw3z5oaJgPolr5kpES9kfxeSO/cBILHiB7gucu+6OQlekUu1snmi+Q1oKv4=@vger.kernel.org
X-Gm-Message-State: AFuF++kqzmM9MplETn36PVSYwD5Xlh362teB9/qGUziJCkUcxZv7bpuw
	DI0C76QON9C7HJMEHU6QQQVwbUuWQdrZ41GGIotTJDA1JJlqmNj6718SZMi8+i2LQAf6rOxEDtt
	kd/sDFQx4vg==
X-Received: from dlbpv7.prod.google.com ([2002:a05:7023:907:b0:144:bbd4:62e0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:224c:b0:39d:f317:44cd
 with SMTP id 98e67ed59e1d1-39e54eab3dbmr5464906a91.14.1789713180035; Thu, 17
 Sep 2026 23:33:00 -0700 (PDT)
Date: Thu, 17 Sep 2026 23:32:48 -0700
In-Reply-To: <20260918063249.2172589-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918063249.2172589-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918063249.2172589-5-irogers@google.com>
Subject: [PATCH v1 4/5] perf trace: Free the host machine allocation
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

trace__symbols_init() creates the host machine with machine__new_host(),
which allocates a struct machine, but trace__symbols__exit() released it
with machine__exit(). That tears down the contents of the machine and
leaves the allocation itself behind, so use machine__delete(), which
does both. The replay path points trace->host at the machine embedded in
the session and never reaches here, so nothing else is affected.

The leak was hidden from leak sanitizer because trace__symbols_init()
passes the machine to trace_event__register_resolver(), which stores it
as the private pointer of the global tep handle. The handle kept the
machine reachable for as long as the process lived, so it was only once
the handle started being freed that this was reported:

  Direct leak of 1256 byte(s) in 1 object(s) allocated from:
      #1 __machine__new_host util/machine.c:135
      #2 machine__new_host util/machine.c:155
      #3 trace__symbols_init builtin-trace.c:2105
      #4 trace__run builtin-trace.c:4759
      #5 cmd_trace builtin-trace.c:6091

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index 5bd62b61287e..e1a4abf44673 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -2132,7 +2132,7 @@ static int trace__symbols_init(struct trace *trace, int argc, const char **argv,
 
 static void trace__symbols__exit(struct trace *trace)
 {
-	machine__exit(trace->host);
+	machine__delete(trace->host);
 	trace->host = NULL;
 
 	perf_env__exit(&trace->host_env);
-- 
2.55.0.1082.g2b9226bbc0-goog

