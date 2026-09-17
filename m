Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0D553B34D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663193; cv=none; b=BbxrehkTarKvRuCZRuZN++hHzFIu+7ZJCC11K7/qz2glORW+lk1LGLtkN2aCobdpkR48P3fklSP3Y8byxVBuMU5nYJjp1e9TR6UDzqw2B43GjXIpd1V26A84JKSvY6gdzbqB6HtN5lq24yLISs5/xdWCC8O3ZV+hY/W9U3Zoe0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663193; c=relaxed/simple;
	bh=bYT8WVcurMLOEfyNp8NqaepgaxFS5df3jeYD3CQhJBQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s7cIG0gLxgfyChWuGR9gFZ56g2d2J5EItMB8xMgzXa8Tb9xizzrWtxawGAIC4uod5XeSvoTVcEjbKjXVBykh9QjCUalodv2O/X2XhJMDg8foEmJny5q2G/OpAWiHWCtv1zaJTAkULJ51HHeBw3Hy1aX0qA8evoKeJkoSppK9EUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dYflWEeL; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dYflWEeL"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b8088202so1144818a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789663191; x=1790267991; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhdENFaJa2NETWrV9GF10gghTb/oZJa/1Sd4bZnoKoc=;
        b=dYflWEeLHocHmzlCyY9IigZLm2FHceet0+lh3G8PnSerwMhYEiCxMmogBILHPE7Nli
         RmT86Q+FCtNjiOOxqzc6V1ReLbzogyvfLAnI8XEWTA8BzZI87/Kp7FU9AMZKecqnI+k1
         Rv9PMQjuRCUY0MAECF+s+JHQ/SCyN/r3lUdw6trrU/cbUIqKTJfurO79fzL4+0ftI0aV
         qQi/I5kJFg3rbrV7/XClIuaModdvKqUZsyNLia4qyQiTIiVU3vMYoT8Gox2+gzcyiLFE
         hwxs8BedQyoDU+YA+CHcLdcwcd3Ckzk8dkyXM4nKlvWG3qCa61ub2aTKlZe0BwGDUpAK
         EkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663191; x=1790267991;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhdENFaJa2NETWrV9GF10gghTb/oZJa/1Sd4bZnoKoc=;
        b=cJIu+XozBeRQ7Ybu54DhAusbtmc+SmG7IVcRpGVVytLrAF3XnEsgT/dr55kkUUh0n7
         ZgVmHEEreh0GzJTm5GfJbSMpfvyjcFOEA7msCdmIIfntMEhe6RYeO9GBLOph1dKPUPWU
         /d1nYaEjsqBAWbvpq3g7Y190Hwp8DB1UE1x+IrcrydbTO4xXYpJLZRT7LYK11GGYB/zo
         bqzWuYXmOB3Ejb2oLYaKkShgPAMmG6fpeBH7Mc11hT13oaZyxL85vPRLW/NOtT81O1O2
         GFPeAsXisBCwHY64R8yguijC+iIovkafW+/jeFxFqBVGeoFSVoAxRuPe981QvD7bgIuB
         fhKQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/WAlLkjiamCmhfrDAgNapjLx63CuOEDL85KS6HUuIhVeNo0tzD2IyTi+KWXCGOEbQxYamhl3DtFhNUdM=@vger.kernel.org
X-Gm-Message-State: AFuF++mZEtBKcqWLMINZkRxmqwyd/CCp6XgmwICiG6OZ6wvRq8lzdq/p
	biFHwLOUbetqtStWaR+Exi63oocEeeHPIipa/0gd5a1oOrOujRIkeEumMmaps//erVi+WMmQy1h
	atjfkAg7DWg==
X-Received: from dlbtx10.prod.google.com ([2002:a05:7022:fc0a:b0:143:7c9b:184f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9090:b0:3d0:e034:a26f
 with SMTP id adf61e73a8af0-3dd5f5d8672mr19199628637.17.1789663191036; Thu, 17
 Sep 2026 09:39:51 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:39:01 -0700
In-Reply-To: <cover.1789662556.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789662556.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <f889a6e06cc80f612cf741e403ce2acd136f2fec.1789662556.git.irogers@google.com>
Subject: [PATCH v2 13/14] perf test trace_summary: Make non-exclusive
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

trace_summary.sh tests various summary modes of `perf trace`. It already
directs output to a unique temporary file without polluting the current
working directory.

Remove the (exclusive) tag so it can run concurrently in parallel test
runs.

Running perf trace in parallel is only safe now that the probe tests no
longer name their probes "vfs_getname...": perf trace opens everything
matching a hardcoded "probe:vfs_getname*" wildcard, which used to pin
those probes and make their cleanup fail with -EBUSY.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/trace_summary.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/trace_summary.sh b/tools/perf/tests/shell/trace_summary.sh
index f975176247b5..e2834bc4eee6 100755
--- a/tools/perf/tests/shell/trace_summary.sh
+++ b/tools/perf/tests/shell/trace_summary.sh
@@ -1,5 +1,5 @@
 #!/bin/bash
-# perf trace summary (exclusive)
+# perf trace summary
 # SPDX-License-Identifier: GPL-2.0
 
 # Check that perf trace works with various summary mode
-- 
2.55.0.1082.g2b9226bbc0-goog

