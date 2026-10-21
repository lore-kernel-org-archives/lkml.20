Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602739;
	b=gy0zvfiHJ79UpJcIOnYGmttB0thVhAfspfh7fx+qVKKCz38h+xAHvIfbe7ZzwfrxorM9
	 ClvrFyew8kCBxt/jbBMW3WNEPK2ed8y6Nf0Cfcs52rrBav2OBc1hwtUV6AOzARdEcb9ue
	 w1ZSQOl7NuHn/QXnYEkMUt9mYuZiSGIZ3icOSInN5hT1bEZfpwuDREnx3P5Cr2we7rIT+
	 2W0L5UwEc+lV92TFSallyIfYOIFGIqc361Y5gh+KhlYdU/1TsUel6RVGbIcnhxZldlU1+
	 JCwL0xfzcdjdwGKmZeSrLbMwt0+nJ/AgsYVkDcXIwshLFxjnQhb0GX26h0rS5/uiUhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=va0jPRyzS9qJUXCbRxN41MmkIP1NzQbKCEMrTZrHPo0=;
	b=qUnyaLLsjJa9dD2QvIBQR0piiILe5J5vb8B1MbX9u7+xf3dwCwXqnJdWFhLvD8sj6aMQ
	 3oqdHb6Txxru3xoXoVhBJebRyEsY16TCZU/LH/vYXoumV6JPjfO2JTFwmbIbyLWPuDFsQ
	 5XiT/ATyNdL6ex4zq42dRLpZLIpBboK8Sag6l7LQN0BLnpXaNUzh3+AbCzK+zwHRSCfDc
	 LiHLH4b/twnHmI/HP+gj7f4d/fAAUn/gP5PGnx6X8EcbjG+QYhtB7BHf6JPMOB9LLxBr3
	 R9cAJSD8WmUlQ95Z8Mn6lLJ2r4I1quPs45KDW2bks/0a98RgzdtiO+k0Z6lrOoDX48Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bGDOhXEd;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F47B60A2612
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F47B60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bGDOhXEd
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso1573564c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602738; x=1793207538; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=va0jPRyzS9qJUXCbRxN41MmkIP1NzQbKCEMrTZrHPo0=;
        b=bGDOhXEdaqPzP5cdnFiwy2WkgmwPpQoNggE6yuSKbh+c6tXCCJG1/xFsgJDQFHiIJR
         t1f60ZBSCuqyBwVJaAZsZUoRlggTP5vFbPCn9/zLP/dbhJCzJxIIwe9huJc0ud1eD+sV
         prfDGOIq0bw+RFhUFC954JTAbpoppeQUaLrcvlPnifo+js4X6LMBo8E6KrvTCtOi5WtB
         5e0ly9mFCUZcZsqEfKKPaY2eYngxnF6M2YxaqHrzxZZcLr6x1nY6KFakkdluBgn2atmK
         pVfd7B2eH4D3fpUUMu+anqTTTR0ncZKR4rCGSO8vMBnWDgS905rKj0qoVLO+lejUgkaW
         FYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602738; x=1793207538;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=va0jPRyzS9qJUXCbRxN41MmkIP1NzQbKCEMrTZrHPo0=;
        b=uRK8ngUaDrg7RTed5vEol2H8aGfYg8yNpysHlZcy3uEOWQjevVN0yBJnGDX1/Galri
         XaO0QvKJQRG2aYOYXv7IFeywZ+Ae42S7x91O4q3T5SkJqepVX1PHqbZMG35emrPhyHtA
         I9I3LZpTcAKJo4jGF4eHTcqqj2l9a5xfnd5VBe53QQX1kZP20+j2InCatMSSNKbSNY/L
         Ap903IqmaCZSl1qy0y65ZOmo9KUmgisRZu9NS7cvLEbdxHTIdejprvQYtknfHLZiLpOd
         pVr+whfeujRVhyaVC6Tjj8n5iU9Dkc5VN8ujQrmaXhtFcZ3nlv1sfU14ViBjxM4vfZGS
         ju7w==
X-Forwarded-Encrypted: i=1; AKwUvBw3GxbExp/f5FKEeUVkMI3ND2MbMwS50KtPowuuIPJU97bhOvjn9hld60dkxzwJoDOMfpKLtndtLjj3/O0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKWemt8e/Az8HpsdnnD5lZk31S/EMJ8Bsuq3J9c/+P+S2XpS14
	C4HKwJrKhrrUmlexb417EIdItfiTGODKAxnyH3fti4o1eoP7T/TfcztMiqL7s5E6w9TLz52xRNm
	hL4o8DChE/A==
X-Received: from dldyr16-n2.prod.google.com ([2002:a05:701b:4510:20b0:191:1e8e:83d3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea48:10b0:14d:ef19:246f
 with SMTP id a92af1059eb24-190a7756c63mr3346132c88.45.1792602737568; Wed, 21
 Oct 2026 10:12:17 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:42 -0700
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
Message-ID: <20261021171044.155240-17-irogers@google.com>
Subject: [PATCH v6 16/17] perf maps: Fix lock inversion in maps__load_first()
 and bounds check in __maps__remove()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In maps__load_first(), take a reference to the first map and drop
maps__lock(maps) before calling map__load() to avoid a read-to-write
self-deadlock when loading kernel maps inserts extra trampoline maps.

In __maps__remove(), check that the index returned by
maps__by_address_index() and maps__by_name_index() is within nr_maps
before indexing and removing the entry, in case a concurrent thread
already removed the map.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/maps.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index f808df2fe77b..acaf93c7c206 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <errno.h>
 #include <stdlib.h>
+#include <string.h>
 #include <linux/zalloc.h>
 #include "debug.h"
 #include "dso.h"
@@ -548,6 +549,8 @@ static void __maps__remove(struct maps *maps, struct map *map)
 
 	/* Slide later mappings over the one to remove */
 	address_idx = maps__by_address_index(maps, map);
+	if (address_idx >= nr_maps)
+		return;
 	map__put(maps_by_address[address_idx]);
 	memmove(&maps_by_address[address_idx],
 		&maps_by_address[address_idx + 1],
@@ -556,10 +559,14 @@ static void __maps__remove(struct maps *maps, struct map *map)
 	if (maps_by_name) {
 		unsigned int name_idx = maps__by_name_index(maps, map);
 
-		map__put(maps_by_name[name_idx]);
-		memmove(&maps_by_name[name_idx],
-			&maps_by_name[name_idx + 1],
-			(nr_maps - name_idx - 1) *  sizeof(*maps_by_name));
+		if (name_idx < nr_maps) {
+			map__put(maps_by_name[name_idx]);
+			memmove(&maps_by_name[name_idx],
+				&maps_by_name[name_idx + 1],
+				(nr_maps - name_idx - 1) * sizeof(*maps_by_name));
+		} else {
+			__maps__free_maps_by_name(maps);
+		}
 	}
 
 	--RC_CHK_ACCESS(maps)->nr_maps;
@@ -1459,10 +1466,15 @@ int maps__merge_in(struct maps *kmaps, struct map *new_map)
 
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
2.56.0.218.g1ec904b173-goog

