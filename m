Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606577;
	b=437zLFCXauZbsuH+WwNV128GZuy5qLyUQGOAPi/rPiEdfF0kSDIxi+4PWZa9BBPuK+t5
	 hmCCJFlZWrPlVAC0Q63jFsQYg2BByhoZYCHG24qn9mPxhceZRZ/UcWi5GfoaNyT/QEN1C
	 UAeqpAjci/86Pt2XyD0TOkbxbuLMwYnUSSjjcA/UQVFTMjUeP2ksUMZDez5gqmVaA5JPJ
	 S7BwxhwuY4sQO4UViiwoUBlGvdMaql4SsVlgp2726YtloAgqf4bGq0EiZcjgLQi47P3fi
	 qSnyxSbHde9mw5RaGxiI4o4B5V7skcq81chHbTuArnqM7hWx8PveuSrp7p/a2cC008g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=J6FCJSX/pFQyzHxlmw9wr3kwImFzupV0wPE3xeESIIQ=;
	b=4cL1wUjA/Ju3o88QwjqZLRIWbtczfsLKMiRgi//qneHPH1vV/JkjWdmmpuVOkOzaThNd
	 Z2Eg5Jzoa9KwcbQJaDJMZm3dkhC0iTRy5UjANskvmzQh5R4wW2b+kdj3mxM6GxyLEu4pg
	 vymKHNIpg2yszb99UWxqu6rVDMJ4XrEfc15Ww7nxLS7YngHMYKT8uTsQyXr8nUS1Y8x9S
	 YCFvFpvf4P9tB4AtoChJ1o1Gu8fPT3zsqBxl0lWM+R5n9i+x6lRenW+MhdcDTGdU32B0u
	 S0/SizGmDFukkjpGv3xaOVFB8ZpgC4u7UrdFsFhEtmxDXtWJff+kmDVcqAVpNz7gx4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IAZ8rsVF;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1A560A263F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E1A560A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IAZ8rsVF
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so1458273eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794606575; x=1795211375; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6FCJSX/pFQyzHxlmw9wr3kwImFzupV0wPE3xeESIIQ=;
        b=IAZ8rsVFSiSpoxWJV54g1/gn3ncNNSt8Y3Xia6if7/Tx0gphCFprrLHNRP87XXUiVf
         flxA58njeobFxGBM8oRZHgacoKLRWf5AV6qB/rWainqV3hBkko1Pqlpe/ixcDOYwFZBh
         wKF0i660DkgdBgLAVrCAoC6yZJxb9EjGe9uF3DRnCII9XnPY9svkvMcvtjtSgqFXUxK8
         oLmX891rqlV0VSRsrvjLpxXgC7CwDR/3QMxne+h3p6SJ9TcC/NspF6pKV3D/T7dvmPbc
         2PQxBqRM7Wk60qoWVjEMKMJT6qKyaHn4aK9ocGGe84p6OSmRoaXNHUT9mUf9uSmVFPx8
         nHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606575; x=1795211375;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6FCJSX/pFQyzHxlmw9wr3kwImFzupV0wPE3xeESIIQ=;
        b=Mv4l2TzHOQ1nId0kBGe58qT2cMGMTifjKIg8Hf19EJtd7FRv0haTYW6dJMcziA3zH2
         fl+R6kzwGDHo+nS3E6HOUJ0FCO9FkWtCrQwAyKOi9hOjRDb39RFP4W63ne6a8FWh+kbb
         qt5MRQWtXPYhOX/AGHIuMdpLM33ZVSShK0IRdjKhbHBkbPJSBjQ1T8xZwFJaoU0DK6Rw
         Ru2xM3ZPxAyDdvazeCw8US9yaQa6FuAwl7ePaqW5DRMA8oGG1Osco9vAqdgO3eyxLVgt
         mutdmAQPUC+y9DdqeUg5dt/iOpm/jr61fDLWjRI7Wyx6t+qqS5M1laumLO2/DZQ7m4A7
         s+mA==
X-Forwarded-Encrypted: i=1; AL+hErHZlAfg83DcEZOiKBC/GTftD+3fM4pnMQDv8XgsYYg7W+kPzUtylxc67uuSrV9gErTh/zU0IUAj0udg2Ec=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fzecBF0caWb7Jw/RkwYgF+Jw6NrIDTt+p7qrwr68GjEWyl7If
	k4pPU5Eaj67k1s5t69RQbRAq6w45Ts+6k8jj7xw41pcb0f36oWt2xoc4Ot6vsaeNB0TjxiQ0RWR
	WC1Y6vFrEkw==
X-Received: from dycpq7.prod.google.com ([2002:a05:7301:fd07:b0:36c:9ca8:5abe])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:e9cd:10b0:351:7e5d:2de9
 with SMTP id 5a478bee46e88-379636603f6mr4068457eec.1.1794606575176; Fri, 13
 Nov 2026 13:49:35 -0800 (PST)
Date: Fri, 13 Nov 2026 13:48:33 -0800
In-Reply-To: <20261113214850.3329699-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113214850.3329699-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113214850.3329699-10-irogers@google.com>
Subject: [PATCH v1 09/26] perf fncache: Use generic hashmap for fncache
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Convert fncache in tools/perf/util/fncache.c to
DECLARE_HASHMAP(fncache_map, char *, bool) and use the type-checked
hashmap__* wrappers, eliminating the manual long temporary conversion on
bool lookups.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/fncache.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/tools/perf/util/fncache.c b/tools/perf/util/fncache.c
index 04ea150bc7cd..f00367b5f265 100644
--- a/tools/perf/util/fncache.c
+++ b/tools/perf/util/fncache.c
@@ -8,7 +8,9 @@
 #include "fncache.h"
 #include "hashmap.h"
 
-static struct hashmap *fncache;
+DECLARE_HASHMAP(fncache_map, char *, bool);
+
+static struct fncache_map *fncache;
 
 static size_t fncache__hash(long key, void *ctx __maybe_unused)
 {
@@ -22,10 +24,10 @@ static bool fncache__equal(long key1, long key2, void *ctx __maybe_unused)
 
 static void fncache__init(void)
 {
-	fncache = hashmap__new(fncache__hash, fncache__equal, /*ctx=*/NULL);
+	fncache = fncache_map__new(fncache__hash, fncache__equal, /*ctx=*/NULL);
 }
 
-static struct hashmap *fncache__get(void)
+static struct fncache_map *fncache__get(void)
 {
 	static pthread_once_t fncache_once = PTHREAD_ONCE_INIT;
 
@@ -36,23 +38,18 @@ static struct hashmap *fncache__get(void)
 
 static bool lookup_fncache(const char *name, bool *res)
 {
-	struct hashmap *map = fncache__get();
-	long val;
-
-	if (!map || !hashmap__find(map, name, &val))
-		return false;
+	struct fncache_map *map = fncache__get();
 
-	*res = (val != 0);
-	return true;
+	return map && hashmap__find(map, name, res);
 }
 
 static void update_fncache(const char *name, bool res)
 {
-	struct hashmap *map = fncache__get();
+	struct fncache_map *map = fncache__get();
 	char *old_key = NULL, *key = strdup(name);
 
 	if (map && key) {
-		hashmap__set(map, key, res, &old_key, /*old_value*/NULL);
+		hashmap__set(map, key, res, &old_key, /*old_value=*/NULL);
 		free(old_key);
 	} else {
 		free(key);
-- 
2.56.1.703.gf848ed807c-goog

