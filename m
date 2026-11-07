Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026506;
	b=DooN3VXGE8bZYuHff7UszDdZ/5cHK6WQM/OeiOQXAgG2Ch9etsgo2Cp56yMBMCJqugtd
	 dx/ZZcLLS9UpHzp3E3pqDmPlOFr+9XIxy+gwUZQysM51pGSKJlISYRoljSjZWKvGvPa97
	 IBnBG4iNqepVow5OWZitO7oCtP45lA18uPvOeljSHMygw7ics2TzQ+vqMfEhXzTjtLNry
	 CNk5f+Kp+xODGSAxC9WeTXHyZZnF09G7uEbz9p1Pc2/Jb0ZL/Wc24xRJoaHme8mrMpKqN
	 S2FaHSEUPoxQGbTUtf32DenCP16FIEWzoNI1hL71PVlCnHlwDUXjDz6wsruqpSiVyHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=utEKs64HogqSHT7MlF6NI0J2vc5vLHuILUplV9BarPc=;
	b=rKLeLJH94y6i+p1wjRzmLcjmyoox9h/JiEv/wY/I/Je28e0/R49/bjCX74yrVofFiMG/
	 VRo1Gk8PtOLSS/wuoAhszWdDOqOURDCTOa7SfuP3oqpCyLac2zNGIrprN5ZovpKnFWqBX
	 pDQCt2pd4DBLsr080hFAx4ua5KVQrNnDk65c+uGuNm2PtyKZSp+bbidc/ynwf9x/RIBll
	 4VHa/cRi9avY67DYJELsUjNSHwkRMnc5lisnOwBMNU2Cg9/9D7mZBlfJlaELqy92+s/vu
	 /se4SQ99ZmxrfNj1moPBYyXNgfXqSrElXJFGRkC5RQ03YD6ybLyCpNNyL4WotW76YAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mDOnEQY+;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3148E606EEA0
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3148E606EEA0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mDOnEQY+
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3700be873ebso382813eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026505; x=1794631305; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utEKs64HogqSHT7MlF6NI0J2vc5vLHuILUplV9BarPc=;
        b=mDOnEQY+RbLBeEkyYTengSXOnStPmjs71AMteeWC3Ey7JJC8MXEyulWvWpv85JW2eQ
         Gmsms9BGh8b3lNsH0j5b/672SX7wo1hf2MA1tOg5L9N/8OCDnd64JVjEvFl1cE9JANSk
         fMCgwgRjg0NiFy32Lg1A+f/eDxrICuOCCadPDbPKVUZMr/OdWJ4l+5tnU3+pay/YNGRb
         Y0v3P8f7+tGACXXsn2LpqmWjhMQCJ9R4gGMx9GYwsfNmTpNiW2iaoKw6W/yBwFrXgP0v
         5lPIaP55lFHYvGADSgDBnc1cs2fbuaM3IAY3xCS1X5kr7NgLJQq3a/4Twtn5YJbryMJX
         h4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026505; x=1794631305;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utEKs64HogqSHT7MlF6NI0J2vc5vLHuILUplV9BarPc=;
        b=MBGOg7/4tS1rDalaSrvNUvRrM3Eo9PQ8FLk3fcKi+3lqoG29gb0Uyip79SHuqs5khI
         5N8Mx/S2tqo70P0iwdwwJtLWYd00mKAWce+FMYwnby+gAZRgyPZBSIgIH2QlQ9ebqJwW
         dKe/C++z3+kx9gAS7boA7xVbokSmEo8d04oqRdY2HNn988rsi3orR7Cm79OmPjbIxOf4
         T0ITzzXLIvHq6dVcASCfS+IlZDhD+aYZHwyTWdSz3pbmGQtY1BPCj1tZSYhA6/ouqJXX
         gxEX3qewuJTPoKPI6s2horWNYaMWqthCdHq9UvIEEmmFq8MsWi7ifjDlqKVZgC2Fm3eF
         /k/w==
X-Forwarded-Encrypted: i=1; AL+hErFRj2V2kp8ANItPrWMREnF4K1l9PfRts7J9HwbO5CUJmjU2snBAyj61mSEhz8hdVp/XFzJN/oc6IN0mZKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q6ZufrEPTkJ2kmcnxOoM/ZRwrVO/pte2825mmoRRFJmnnvXYL
	GmGnc+PUXDyqRZqbKruZ1rgRnCwFG3x9uB17n6J8mRPOE0Xn+mNIzap0yaDyvsLmkWNlJ2kWDag
	igIjZToltBQ==
X-Received: from dybse2.prod.google.com ([2002:a05:7301:4902:b0:35d:1771:4816])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:83da:10b0:36f:5822:4bb2
 with SMTP id 5a478bee46e88-370f76a8a25mr1471146eec.19.1794026505162; Fri, 06
 Nov 2026 20:41:45 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:59 -0800
In-Reply-To: <20261107044102.1506626-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107044102.1506626-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261107044102.1506626-19-irogers@google.com>
Subject: [PATCH v11 18/20] perf maps: Fix lock inversion in maps__load_first()
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
2.56.0.455.g6c5a503b38-goog

