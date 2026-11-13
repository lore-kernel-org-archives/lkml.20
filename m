Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588160;
	b=aYExCnvzRsR3ujysnDQXf0uhSDFgdDlP3CwMtEcrT6GLlVa8pWbj0CEm5X/MACEQYQ/G
	 cb2JiM1Eu34aLTcz2RqKfE9XYWsP591l8rOx5lG7mT981HahWr9lWw2In3HtOEclApnbu
	 7ZOSLhhubG252NPkcrZ95PCdrIPiLXwgodIHinExH9qoGmG1VwBu+gpRqZLVA4BYql/wr
	 wYLg3b17KaC3DjiL2dM/E+k9D2FG4xFMTfUlV7tJH3iXQSMLqwe5IgfehSMsL8rbEgLVl
	 UrDkV+oqYM9GrMBMbSgMYmmk+2IQ6DCqCQoyVCxRlopwpafK3PGnwXzT6eDlJCvxZlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=voTyupXwnYR5Hpq3PVrUMc5w4XO7UW4Vq4l6eMvf/fs=;
	b=VB5TXprLlEKQwtSYyQEcAblKHp69QAfE2iXQ/8hxtZH0QfkWvUS9Prdba0c8AKfvDwLs
	 z/WMOb5lCZbuXnJ83RuqgrBXpMUh/Ba48wbrPE86SKCw993uyLiNjUzXyzWFGaqqm6xJ2
	 OnvQZZOctwbxzK3+lqxzUBeJjFJ3uhVq/u8LT4Ktfl6+ueNeEcDTYf0NF3J7XFRHxEW9J
	 Uow74ly/NGlxszGOfLhO3Nx30EaETlqQImjMDrJP3WT4MEsKRcbttslFQafsGwqicUX4A
	 fNTgM0elvaXsXe6zz3P0KKgVicwAUs7GnjHaQCzLqW+KhvMAQSMR+i4nKFTGfceyqag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bGp30eVs;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D7E6074E2B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D7E6074E2B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bGp30eVs
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so1587772eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588159; x=1795192959; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voTyupXwnYR5Hpq3PVrUMc5w4XO7UW4Vq4l6eMvf/fs=;
        b=bGp30eVs0iSweJFwRi0SYrXy4qNz2rBBBv6MlYwvYII6zhWqXTK/lI0yoaMBrJUHDY
         /2QV999MKXV6C2EaRnMS5/K52Y2iIsQYLvzg5zPFCLU3K4p4kSQweQi64SDLzPFPkTOZ
         GOHgtxRxGOp+tVmBLyLxhumnMDyMA+IcmU7FTl7hVtXQGiANqUDd0kvD0zRMYVa4gVhZ
         tVVd7wk9b39C+AAZO3taqehEIxBqHwBYSNLXGDR6NVma61JVXcT1jo8qqzwbjFZUbKoa
         RSLghyPRw8nzaqld3+yVE2u9JVeTdXi3tImJdPB7jBaxhfcic354q6tn0dTi0y8t23cE
         x8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588159; x=1795192959;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voTyupXwnYR5Hpq3PVrUMc5w4XO7UW4Vq4l6eMvf/fs=;
        b=0l21tBNznI0s3j1nukyeKarfWwimOCaPWLhiIVkGbfLTu09b4sgt8iDoNbWs8oQdOM
         a2lDbQh4BetCXQfrkbFyU5Q1VIR0wEetyOsM57zBP+BGoP5xujS8qbDpHFy5z1GFmci7
         BFevP57mwwgjuaVlMW/Uat0Xc8naVzZw2sahm99K5FzVSdHZDwITe2suNPqRK1BZizbl
         NHzJ9AaulZe+MV5UmHK2bxnjMuSP67oNXB1XM2IPoTDJQ79S4fWtlAve3RrkkHVlb0qN
         OqRGlpZR0debr+PUfyuXkUMA6g3H6g5TMxTeZ6EQqUxivsjxF0xEpOtIL7brtPJv4ri6
         DVlA==
X-Forwarded-Encrypted: i=1; AL+hErEw3L7Y868ZGIyUEaNjpCLo8zUqHBv+rczRtSNzKdk62a+X5+/EE0iCJxqGJnreU2fz/HxuYY4RO3AiAlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bnO8fv4rkXB15gz7plEXpyMW+hr4rutAhl3Lm5m/TMu5boHVK
	b/CvryqDGjLCAe6RX0WmQGPKDgtY2RewuBES/z4+dHCB7KRSb5G7Nco5/dPvRBiUz/zV2Zp3LRk
	RWGi2rcYtjQ==
X-Received: from dybmi46.prod.google.com ([2002:a05:7301:fae:b0:36a:eec:f68c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7481:b0:36a:1f4f:3e9
 with SMTP id 5a478bee46e88-379677f25d5mr3766972eec.20.1794588158792; Fri, 13
 Nov 2026 08:42:38 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:50 -0800
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113164152.2095566-20-irogers@google.com>
Subject: [PATCH v13 19/21] perf maps: Fix lock inversion in maps__load_first()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In maps__load_first(), take a reference to the first map and drop
maps__lock(maps) before calling map__load() to avoid a read-to-write
self-deadlock when loading kernel maps inserts extra trampoline maps.

Fixes: e77b0236cd0c ("perf maps: Add maps__load_first()")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/maps.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index f808df2fe77b..7ca33e5218e7 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -1459,10 +1459,15 @@ int maps__merge_in(struct maps *kmaps, struct map *new_map)
 
 void maps__load_first(struct maps *maps)
 {
-	down_read(maps__lock(maps));
+	struct map *first = NULL;
 
+	down_read(maps__lock(maps));
 	if (maps__nr_maps(maps) > 0)
-		map__load(maps__maps_by_address(maps)[0]);
-
+		first = map__get(maps__maps_by_address(maps)[0]);
 	up_read(maps__lock(maps));
+
+	if (first) {
+		map__load(first);
+		map__put(first);
+	}
 }
-- 
2.56.1.703.gf848ed807c-goog

