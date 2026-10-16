Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D114B9213
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189135; cv=none; b=msTwbI48DB2icb7tmiCE+wdMBbM9RbzWPZxb9DEVtirRGSA8c2WomDqNONuUlS0CQCICiZU/7Ooz1p1oW3K9kmfMg+1prWSxtWwu5qO/pst6xfS/d/DhzTSS6+f5D0migwT486RNZ1oPvomgnApjQtjLqAdJ2TeYGD/UCfNmaSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189135; c=relaxed/simple;
	bh=X9NMUUN/PE8VFQes15e35IRr9fY8ZZsea9uEfdcgfJA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Je/fSWBJsu6Z8SF+82yUgnzCb5nwWBEGqH4wZzuEIUFWa+mzcKRLrjRN3L4fLonYi+DlDn9eYvLcBws0GmB8x+Icl4X/IFnsvYV2zOjibpdBsm/rWl7KJAAvPNdUVC9m+kDCQcK1CAwXHUQvLuwMPAqxpuuEId3BMVcJ0MJLm5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QqKNCCCm; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QqKNCCCm"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso398507eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792189132; x=1792793932; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hARxlh30ES9N4VBeaC7/4m4u2XE5g1KyZIf4o39eBbE=;
        b=QqKNCCCm9ZMxtp4FxhRoRxtuoFS1+BAYQYvJzjECGpUN67COn4xWTpRU6tkovfMuQ7
         4Tb23HhwSThIqKJCFoN8F47KRMxKSrIBfGkwtwRqUacP/znkv9Yq/56jy7biL2zOE6S0
         5BbXxutWNeghVwFk+WKzwyR9aYnVM4Zg75DxYHqhGP69MM4U63IXjGDjlSMBELyhFQnA
         w/g7RBCidBlH44eKP1Zd6Jvu+1GAQOgY+3yMzLZnDIn1lOsDkk6HxYJ8DGqTH/40fck4
         FHCA0DeTe0XQdgE3tusTJhzxdpKpBhhhY6bVZ9Ytz9qowwoa1pkDgy+CazDM768hIr3S
         U7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189132; x=1792793932;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hARxlh30ES9N4VBeaC7/4m4u2XE5g1KyZIf4o39eBbE=;
        b=uaNTepXSeK09JgarqH4ksDzWNY6MRC/Zm+XSQJ2wBZ5nrwF6uUFnAq7Bgr1g/3P+Wc
         oS3/othVRaLZ9E6gTHEoDuWeFtFEMCOH41nzn9staHPHRrtWVULsxLLblARa84OpkuTE
         bHLSNzcsldYtnPk7EVmxohzgRfL/i9QJFX5FHoOtN5daGxA65mL1ql4jv4S449SHiqSS
         +hU1KuBOP5yBadKkSGshrK5neDK1vkgkbuTQki5sM2DZj2JS5ajbcC9ayi0gX5bBbq+l
         8B1g/MQ7qSnhHS7WEReIEBofl1j/CTEK49mgzin12FLzokJCPu8UTkqFo1UxL6vvtJAn
         adVg==
X-Forwarded-Encrypted: i=1; AKwUvByh1XJi52+4XxPyfpHtsqKo47HRsbK0cq14tr39flqPFaBNkRp6gjqoYzDWLyIlgeeuJlS+9T529egl65Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7JyR9gwZPTHG2249jgXpUAAndBQiyib3oFt1+WoIFfaIbzEgJ
	K3MXChlZ8k1frIjqW6WOfP5kw9AHdgltIW/lyDWfDe1PPkDVD5VRS8QnEQhOIBswcf0AoNnTijZ
	s0NcoPmTaIA==
X-Received: from dybmd43.prod.google.com ([2002:a05:7301:182b:b0:359:261e:1706])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8092:b0:35d:8c3a:38a8
 with SMTP id 5a478bee46e88-361a2942646mr1432826eec.39.1792189132086; Fri, 16
 Oct 2026 15:18:52 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:16:59 -0700
In-Reply-To: <20261016221700.1282659-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016173106.679725-1-irogers@google.com> <20261016221700.1282659-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016221700.1282659-17-irogers@google.com>
Subject: [PATCH v4 16/17] perf maps: Fix lock inversion in maps__load_first()
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
2.56.0.212.g129ede20d9-goog

