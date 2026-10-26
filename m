Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997471;
	b=I/6AdzfPdhtV5fjwzfCh6n5Mq55OFR32ZG+MA0AsFYVzrnTUah6QtdPZ8MA8LvirmzFt
	 Xez44l+w8NIZcaM/77Pyo6iP5KTfq+D2UB1+KlTgj9YOCgklIGSSCrbTEcLsqH02/hH+r
	 T9ayWw/ckCQM2zsR6NGhgivtoPfTosIpdYgZDgXErtQUuFL3gxBgQNAX9Nd+XApODGsx8
	 Csf1GRQpkwsuDMBlFDrj+kvco6/rcb3fL5eKegkKGB/sGJjyVhNTQi44VxpuqXis1TAAc
	 A8sUK2GP2VhRS/9nGuc0Sl+7p0DHmzzVglpr+xftJZEFSOMDfKrcAA4XMcoXQmoD1SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6c1yu8R84Uh/fs3ZooZsqGmwAQ1v3ZPKfyNO3gcjqXc=;
	b=I58+xIS8rJrdOQkvRlG7y2Vh2iQALZcsc5Xk0WhsAiOmNy5YHYBURHKuVk4w8EdD3AL2
	 NnwzZlVIURsyJxN7ahT4CLX9IyuDyr/EyxJElzNKwiNWxIOyCnCe2pf/OniBXcDMbCnQp
	 953jI3jOjALGasItnb/BGbUmXTaQObFUCGil3JINn0HPUKlJf8sM24Ej9VpJd07bwnLm8
	 Ff/YXet65QbtSpkAbmzfthxXIKkvilAE9BnARuvG3G9lxLGOH8a8su+lY77/d/M8hr6fc
	 ntIiBHDlH+AEX6WXO6PAlARVfyOm9JcV0uLNq629JgAe7XXrx2/OCUVZ2Sg1zJxpAyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=l7DYYyfP;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEC4606A334
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AEC4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=l7DYYyfP
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so2768853c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792997470; x=1793602270; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6c1yu8R84Uh/fs3ZooZsqGmwAQ1v3ZPKfyNO3gcjqXc=;
        b=l7DYYyfPinPzxtXW3WWw9Be28OUx7htOkozWRWqTda5nrXGpii/TR6m0p7JJVWAzkg
         mCLaUyjtWQXnrhp1aIMED3nxIRjBTIk9lgJm+gWOG0pHz299yzCXOB2VOtefKsGocl0i
         mATMit7uy2XkqQ5Y3a6PpQxgtWT2Tpdgz4fkaYdiOBps9q82ohKjr5/U1hCpgNZ7Wnnd
         TcKRwCRgb6GO1DB+0HbAkwHx7uIswHDS5u4a6W1J3uh/pf/l0shE+kYMTUIYTB2dqpRK
         N3QvkILMNTuWz+ZFg8ES22gZJY0rzA5Hehowxe1PHOHByxKn2p7CQmGoZ33stKa9Vhut
         QCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997470; x=1793602270;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6c1yu8R84Uh/fs3ZooZsqGmwAQ1v3ZPKfyNO3gcjqXc=;
        b=zH/Niyl7NJJiT7M8UONs0r7LvUm5SPTC7pqZpsMSHFlPMA0UouUAqHg3Mws+EMwlFt
         WiHHafeXzlPIZPwm4tFXc8KLpNdt1Q15b5M09L7iQq65fyo0ObtA6tDcoKxPE/zzQ06f
         6BZ8waxZPXdgIh816xLlsKSblVRyo8i7YL5YtkCtBHIs1Ngy/iwKnJS8qnTZo+oVG21L
         2ma27ZeARbLMDdvyU5P+TrW8PBquqqZ8jjYDs2Di1XMZUd/DsuyIe1Alp2DTlo0qVe+C
         CpjwZmLuYRSY6bvbhMBczU8888O9ERQVHhDg0noZp1KcVkFNF+uRAtFWjBGIafn2tXoV
         vx0w==
X-Forwarded-Encrypted: i=1; AKwUvBxOfWwqJGE8X6T/jNz5sTHCH70tPzdD+ctZemOtvy//i4FdSW1Lz7NhzxQjz9A2n01BSFjA6KN0JRI9YEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqaNdHJvwwY0XWdluYy01LPfGHK6NBu0mcnR48tQ1pvXw+hAng
	bxbkVKA6eQ84dhiI/XkWAGY6VXS0Fih6UIZPPz0ciY8Vr9dvHg2xP5OaJVUEiVrFeMRoE3I+wGR
	4dGqw33vS3g==
X-Received: from dybpl8.prod.google.com ([2002:a05:7301:4308:b0:359:72f9:2aa7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:e888:b0:187:efba:9ba2
 with SMTP id a92af1059eb24-1993a1e41acmr9779931c88.44.1792997469362; Sun, 25
 Oct 2026 23:51:09 -0700 (PDT)
Date: Sun, 25 Oct 2026 23:50:45 -0700
In-Reply-To: <cover.1792995775.git.irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1792995775.git.irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <efe1d231090ef4dc43fe1f002a12c7c65c8ceda2.1792995775.git.irogers@google.com>
Subject: [PATCH 3/3] perf hist: Do not delete cumulative caller entries before
 stat_acc decays
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alireza Haghdoost <haghdoost@uber.com>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alessio Podda <aleph.pi.gh@gmail.com>, Michael Liang <mliang@purestorage.com>, 
	Shimin Guo <shimin.guo@skydio.com>, Tanushree Shah <tshah@linux.ibm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When symbol_conf.cumulate_callchain is enabled (the default in
'perf top -g'), callchain parent/caller entries have he->stat.period == 0
and accumulate their period in he->stat_acc->period.

hists__decay_entry() decays both he->stat.period and he->stat_acc->period,
but only checks if he->stat.period == 0 as the return condition for
deleting the entry in hists__decay_entries(). As a result, every callchain
caller entry with 0 self-period is unconditionally deleted from the
histogram on the first decay pass, destroying its callchain tree while it
still has non-zero cumulative period.

Only mark an entry for deletion in hists__decay_entry() when both
he->stat.period == 0 and (when cumulate_callchain is active)
he->stat_acc->period == 0.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/hist.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
index 443694926f1a..e75a4fcce975 100644
--- a/tools/perf/util/hist.c
+++ b/tools/perf/util/hist.c
@@ -409,7 +409,8 @@ static bool hists__decay_entry(struct hists *hists, struct hist_entry *he)
 	u64 prev_period = he->stat.period;
 	u64 prev_latency = he->stat.latency;
 
-	if (prev_period == 0)
+	if (prev_period == 0 &&
+	    (!symbol_conf.cumulate_callchain || he->stat_acc->period == 0))
 		return true;
 
 	he_stat__decay(&he->stat);
@@ -442,7 +443,8 @@ static bool hists__decay_entry(struct hists *hists, struct hist_entry *he)
 		}
 	}
 
-	return he->stat.period == 0 && he->stat.latency == 0;
+	return he->stat.period == 0 && he->stat.latency == 0 &&
+	       (!symbol_conf.cumulate_callchain || he->stat_acc->period == 0);
 }
 
 static void hists__delete_entry(struct hists *hists, struct hist_entry *he)
-- 
2.56.0.307.g5fe7bd680c-goog

