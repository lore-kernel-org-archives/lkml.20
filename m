Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91A1491595
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789713184; cv=none; b=SBs4aVdrr/tyDfR6bku8vt1bP2OumePZWby9Hc3iB/kpGq9flV4bapPRoHKlVaqxXKH27RmRs8UZbj9+jS4+JAMcHjJbrN7xVOup7k+UMdMBwe56ZGz9dzWRFgBS+q60IHNZvBRtw/c3bKzW470bTuP27nBNak/wG5TGerwxAcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789713184; c=relaxed/simple;
	bh=MwAv9TGcBfBkIFh2Lg53bIiDPZFHBPI3huLnLmnG88E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CleKAsELyn+ghuELQYGuBPHG0qdYWfHe1Ml0180OfGOtC5vlZKVITpnPmMqj0iOVzXq/6nGErvZUjeOxfPI9aOxaIqip/EWB3WPPxxZxSSI6gn5HRxgVYiDEphnhUcA6bQy0hJ63lTzE4hRdDQF/vqIlKeAn0FJ/07VrWYxXq+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iAtkAufC; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iAtkAufC"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deda201bcso918750a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789713182; x=1790317982; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbX4sDK3DBzXsbYTT8liO4dVTVuIt9yGIC0SXD7xm8w=;
        b=iAtkAufCj01/P2sSI6kLnfrYqP9IFjLpGJwPM3lWPTzXvrtepBN59yScnDiP+vif9R
         Tej7HJO43AtpQxprZWpleq9QY8/AbwE5ITbThFXmlZW/UODyA77j9Q98y/vZMsKGTO2o
         Hv94wABhsbQNVnBuI2zo8k2r7vL2sQv33AYJHzbYm/MnNPzF1v0SHa1ZQeozTL4UOHCU
         dogTxSvBHv9HpilWZatqDRbHXGJ3vYqwIfjkges+fKzisaPgltwE7PRAI7Fx1pdeKRzd
         RAnE6r8nLxKdUQfvNS2yphrol2y/shTP64IamCkOXSMzqx8lWhiEodFW8OkQiMPFfDgh
         9RSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789713182; x=1790317982;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbX4sDK3DBzXsbYTT8liO4dVTVuIt9yGIC0SXD7xm8w=;
        b=LFEw343Lu/iKSA1aOzCbWXjFQnW833JLNCRTxdJQrXYn0q3ZpEz3NPbD/ZJ6KY2vO4
         RVoK924DAO0z4tgJeNb+RYuJ+H+upf7/HAH5870F2/ePVzJeMfv/4b6y5QmWvVuUMkPP
         zDHQkXqd+j1xT1yq/wEW8AWL351oqPa3Q3pcwtyrU/YDeqvC1niU67OP0z5+kk6ktZ+9
         sK0LhTjTk4OHKUd94RCtoaz4XcbmgTaSNcJb8ziOzj+T5MAtO5iViMvm9k0l/tHr9wfX
         Vi+lETvS75Mh1n6pRQA/3qsLWKwSwlUWHDOs5HGuzjntm5arowUKRluMgGDTn0AiRB0i
         6d7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzkBAPEnR638KUFdD7ODw4Ja7EtzNh9k+7Qz4ktp0Z18CXcgqmlIdffkiejp4NzILzZsbGHI0B7B02MDRc=@vger.kernel.org
X-Gm-Message-State: AFuF++mjbKZOiXcRXzg9/AOcCwFimKcmkIpePkAmH82Bk3pQJiGGiBcd
	snhgXm9oRmB/y3s2tllovoflC7bSWgQBltJRbC6hRQwU9xThML1rsRbZuRx9HgcqB9O8S+HePgK
	QtKj6gkCrKw==
X-Received: from dybgl36.prod.google.com ([2002:a05:7300:e024:b0:338:9523:cc97])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d410:b0:39d:f024:c7e2
 with SMTP id 98e67ed59e1d1-39e54cb099bmr3457757a91.4.1789713181901; Thu, 17
 Sep 2026 23:33:01 -0700 (PDT)
Date: Thu, 17 Sep 2026 23:32:49 -0700
In-Reply-To: <20260918063249.2172589-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918063249.2172589-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918063249.2172589-6-irogers@google.com>
Subject: [PATCH v1 5/5] perf thread: Free the comm read from procfs
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

procfs__read_str() allocates the buffer it hands back and
thread__set_comm() only stores an interned copy of the string, so the
caller owns the buffer. thread__set_comm_from_proc() freed it when the
read came back empty but not once it had been used, leaking it on
every successful call.

Free it on both paths. The empty read still returns -1, err being
untouched in that case.

Found with leak sanitizer while running 'perf trace':

  Direct leak of 7 byte(s) in 1 object(s) allocated from:
      #1 io__getdelim fs/../io.h:179
      #2 filename__read_str fs/fs.c:365
      #3 procfs__read_str fs/fs.c:402
      #4 thread__set_comm_from_proc util/thread.c:297
      #5 syscall_arg__scnprintf_pid trace/beauty/pid.c:15

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/thread.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/thread.c b/tools/perf/util/thread.c
index f0d3773d87db..fcf7c78ab767 100644
--- a/tools/perf/util/thread.c
+++ b/tools/perf/util/thread.c
@@ -296,12 +296,12 @@ int thread__set_comm_from_proc(struct thread *thread)
 		       thread__pid(thread), thread__tid(thread)) >= (int)sizeof(path)) &&
 	    procfs__read_str(path, &comm, &sz) == 0) {
 		/* sz==0: read got nothing, e.g. race during exit teardown */
-		if (sz == 0) {
-			free(comm);
-			return -1;
+		if (sz > 0) {
+			comm[sz - 1] = '\0';
+			err = thread__set_comm(thread, comm, 0);
 		}
-		comm[sz - 1] = '\0';
-		err = thread__set_comm(thread, comm, 0);
+		/* thread__set_comm() copies the string, so release the buffer. */
+		free(comm);
 	}
 
 	return err;
-- 
2.55.0.1082.g2b9226bbc0-goog

