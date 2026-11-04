Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825971;
	b=vuxKji4vkwHadOI0rO6UzUlSyJI0PdNADFzS8OMbKAjLnlLoqAXtHAWcTz56R1dDusJR
	 fWQSCBs0xsjhd3i/wcptpAcw8nQvFSWcwAF5RcEHiSFhXRUznepL30TxHMj2idjDszZKN
	 SapvdTHxHGysW4v9/nScXa7eBWPQVmzesfSoNTp2byKSWbpjw739ybU0cUC0Alg0P0fEk
	 xmEyX6oTUjcV+iYbvAHVjpJUPXYiGbZGiFOL4+mgPihdDJvqEfND7B9aLeslL3PReG7ZJ
	 1F6S1AaZFPCfWtGNqZFud1tHp1PoVhI/vbeUFjIQ6AjFKvRVlhW2viRdQM9xGkCi23w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dlGmy1iETR07VpwAF3gSNr7L3yDUEizC6SlTALxKZy0=;
	b=I2oTLljzDxq66hf8bQg4mTWfl7vflG+iVV8czM93I3tBF5ZXK2KGB23mNR43vPOfm4qC
	 ls4Gs27/5IfybeabNukbW6E5mhcoMFzxDJvZmo9iAwJqDDB0lQ7ctDyKB3fs/YfDV45Lm
	 YPx+v6ZCxp7se0edyDWXS7F7RGS2fOVHjpeRzmI4ono+s2D3SDo52BpuU0OiUB0iYTfqc
	 oAoXJxvMXEV+MSjQkrDJO+tCRSWIYeo2DP0I2Hr2BGpcnnEvf5xVP3uS91SGM/zz2yAd1
	 bBLWNdtLgoRwZJ/hTQVJbwTy6TOhuc5eKBY2fs1ph1QmkcgI2jlqFOsy3FTaFO2PluQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T3vMVKSd;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE68F609DCB5
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE68F609DCB5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T3vMVKSd
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so2043860eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825970; x=1794430770; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dlGmy1iETR07VpwAF3gSNr7L3yDUEizC6SlTALxKZy0=;
        b=T3vMVKSd5ZsM5hgIKPp8icPhHbFw++ZgYVxPBnXCxlyMRyNuij8osWSgeUrDlcJKOE
         kNbkXqhC8enTVdGV5IQjrtyUNC6IigNrxhGiwGtVySzFImZzrySYDLrcd2anm7VfAOjn
         6uiVDk6gzfiqdYpPUqsCn++c5iZxno3Clw0mq76OOnnLVKHLwvK0pSq0WH0EFh9DzRcf
         UzPbumOE5K38sS/5tIZT17+BjXnZtpUDyuJ5GamODLhC5+dQWMi/YB4YbaNKpzOTJ0D8
         mZ3eDS0IHSAEfeIybnik1e5fmV1yqu0oJgNikAzp0o3X5uPmsxdmr64sr2cIFMBJjtj4
         nDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825970; x=1794430770;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dlGmy1iETR07VpwAF3gSNr7L3yDUEizC6SlTALxKZy0=;
        b=Po0jfUC8FCICJpD9ZHVVtuTbtif0cuWky9Jbnt6VdQndfrBxinAoRAsvDMvzAi6kUl
         88gjp6Ht3qEMaC3xCnTwkziSFrVUUZzk+XBCGLmUnfqm4/cmLRlDMbnZKIst/YPzYYYb
         RrYCAF/KcpDf0zAjk+5AwmyjXbLd5suHh45UZraLZP2X47YsqS57sa/p8XJhhxCAw9Hy
         6Dz/fezgfIt8Ih5nOUgU15MUGM2DTnr5XY/4tb2kUMOFSvon5fqEVnABxGlTwP7b/tPt
         2cmGBdd4T3KfM/iGy0qkLaqBHJGaDiPLR9cMhVe1fUzpi7Ndf+zmTliNJvED02aVw6F+
         pcjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzXUx57FgLtCUjScQYWtjUQmRhSz8IqDOjl0L5VkiU+wEnqgcDijo4CGUwusG71hVc4DJcsmMq7aNaBrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FOSsFo8nq626nJ1c7/vxAV1PIdUG/AaQmvDGZG4f1vcT7gvpu
	8B1B94k2bAvm3MCjI+fTfzD3r8dJuoKle+h2xWHRbtILzsCmBHoZO00Xw7TGQZ+lWENMGu5hXXi
	BRWZmOXAktg==
X-Received: from dybml13.prod.google.com ([2002:a05:7301:150d:b0:35a:3045:15e9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:6381:20b0:36c:d1fe:84ce
 with SMTP id 5a478bee46e88-36cd1fe8f91mr4237665eec.33.1793825969426; Wed, 04
 Nov 2026 12:59:29 -0800 (PST)
Date: Wed,  4 Nov 2026 12:58:56 -0800
In-Reply-To: <20261104205909.2078411-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261104205909.2078411-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104205909.2078411-7-irogers@google.com>
Subject: [PATCH v9 06/19] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate strs, num_strs, and capacity in struct comm_strs with
__guarded_by(&lock) and __pt_guarded_by(&lock) so Clang verifies all
accesses hold comm_strs->lock.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/comm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
index 6343a3c9debe..9fc4e91a36e9 100644
--- a/tools/perf/util/comm.c
+++ b/tools/perf/util/comm.c
@@ -16,9 +16,9 @@ DECLARE_RC_STRUCT(comm_str) {
 
 static struct comm_strs {
 	struct rw_semaphore lock;
-	struct comm_str **strs;
-	int num_strs;
-	int capacity;
+	struct comm_str **strs __pt_guarded_by(&lock) __guarded_by(&lock);
+	int num_strs __guarded_by(&lock);
+	int capacity __guarded_by(&lock);
 } _comm_strs;
 
 static void comm_strs__remove_if_last(struct comm_str *cs);
-- 
2.56.0.455.g6c5a503b38-goog

