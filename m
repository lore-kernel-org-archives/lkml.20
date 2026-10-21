Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602689;
	b=1c/4GCIgBUO7K2xCzznES9Ir+oZv9eirFpoOgeLjCy4gAtV/UCKuLlXFqKDFhiUCNLTU
	 vK3wkB9oxwS4e2MBKe/CqH8G+/pL+eXZ6bc8DdRfNHrGAW2FUg7ejNZ4i1dSREJs1ZMRS
	 C4yQOD/kXNgcNaRhcD9vwoiNIv+xZBFxtzdjkQGq6C7HGUoUYGxOw2inbHQeNqhkcikZR
	 fWOn9owqVWdLyVCVE50lMyXZ0dX+942iSHoGbKP8wzVIoi0CggGv5himjDAInVKcFrdHb
	 Cm4puwr6Qcuw0HnaezwHNvgz+qsDVtG8phWwHj1u3kK2VVyBHbf6k6/8u8RRjdgwjTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BGtpnjqbgsSI0YGAfALssqGviHqvt2+cOYL3HWLbbPs=;
	b=OPGNCPogA92yWtkyzMAjEHSw5wtxPVgJLE2p+Zrm1HvljBayGvZncbNe2y9hzQxcBKN+
	 6HauVt01fTqv/HWzMO81Fba5YiE3jKHEdeXlPzhaFZ/CwLNAifFE1eNeg8UhZWEvZyRk6
	 /az4YI5TKEc5UYMM2zry+YvmpdQ4YOTpA8CYXt5sH1hzKdmey/J+bc44LQX+3Ou/dQF8f
	 MlSdRH8tbKZ3z2FsIpPuqgOyaAwxh01EmTgxEtH/X7RyAmroNuPF0AmdzHy3hwFaJJETg
	 Bq9dGJjWUcd9UcD6tSBadHZFZscek6pCTy8TiQQrL0g+sG/i5nhqit2tWGl/MGURFwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=IkFzbnFS;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37803606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37803606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=IkFzbnFS
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1627724eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602688; x=1793207488; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGtpnjqbgsSI0YGAfALssqGviHqvt2+cOYL3HWLbbPs=;
        b=IkFzbnFSKkeWqasRjc2/8jpsHs6JtPJCDzosVxASVCgQsrdtWQa9MXhtWkRKIzJFVv
         mmbAg8HjYrRG2DPz7QZivK09iF0d9BdE6NXbHfUhCb+5DGqCnO68Ds6c//LuE6jTRJfI
         Me6b6upFGjTEraJUC4AVjke2cIASr55xqijxV2Jvzl3iuzumwTItjrFtlKox5Jhe7Q8i
         1gMI9AKwuTfRyZ2rFIrOS4i4Yf9Dy9Dpp9tvjD+1IkbnJ7DbLe8HCDTTomZAK7b5RsBa
         Q3SUvFyFo1CFi6TC6nvF7TPdFDWoDs441Vry3qS2MPbbxobfPupEpK0oX/0tpEIWHv1Z
         RP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602688; x=1793207488;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGtpnjqbgsSI0YGAfALssqGviHqvt2+cOYL3HWLbbPs=;
        b=y+Bfo/V00y/EcaRVuBmBm7wRlBALDuerCnzCSelrIooEah4om/HI0EHJwiKg7F/+jN
         EAM5Ktgv3TaYTEVcebtiSuPIKmS+MEdLqZNP5GUe/emzs/7aRTKTPshPtmRDuj+CW6yk
         +EFlctiTYQkTasU/Wo/YVR7W0pxo4TkM7Zi9eUXbqxG2iFEQYinAbUp3BK53dWwa+Wkp
         Sb+Sz92r441n9+g3cpPYXStmFSGIv/ZFA+0wfuUQA8mwNtMmoaiMArS6iJtjWGIqBBLB
         aiRNJ81igs85S1irP3ilcvxTtHgYTcjCSrgoRGvI3Z0weqDktLDAPseStKMaojqMCUUZ
         4FIg==
X-Forwarded-Encrypted: i=1; AKwUvBxqM7ZO84AxQmdrPuf2jFTT3fP0pQc18p7djEO33JciQrRcxCSE6UrRlTShU75kFSjQ+fhmUR1UEiOvmGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1/uJFHG0VhyiazUsQ80kj3kLhU5fd3D+wBYEzD8Q+U8n1Wwou
	oxu6NRQSRhoBhDnNl5JtcGRg7TJ+OcYsDjPeTzMk8gmjPYIv4a0ffVrZ5PNrdtjNSAtkx3OxP/4
	+I/43lXYqyg==
X-Received: from dlea17-n1.prod.google.com ([2002:a05:701b:4211:10b0:191:592e:bf3b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:ca01:b0:151:8280:2c1a
 with SMTP id a92af1059eb24-190a6dbd524mr3636882c88.42.1792602687882; Wed, 21
 Oct 2026 10:11:27 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:32 -0700
In-Reply-To: <20261021171044.155240-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020163640.746159-1-irogers@google.com> <20261021171044.155240-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021171044.155240-7-irogers@google.com>
Subject: [PATCH v6 06/17] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
2.56.0.218.g1ec904b173-goog

