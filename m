Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514252;
	b=U61qQ5+sQm/Hbrqq2SU5CZ0SrNj8kdxP3KjlSz4YPettmMu4NDKrAVMOhImh+NEgut8q
	 4f0xRXmPrPlSl6ZHxzHwPhbcp3cX8Nl0j16wawJlgTlS/rzKgU7E/z0Y38qeqQBSJKCIq
	 0bFZ1sS77w/83lKnmzifEoBP2ER/OquDFMnTWkuo+mmyrGhv+dBJXNrCNM1E9P5VcztnH
	 7qj3OZSyBcmSVmt5O68aGmnHIQRQV0FTNYTo40BKVRYt0um/XAH/EGg8BvxyeeoeBcWny
	 feB2Z++YuXaZGb2B6OH8Q5pYE3Wwxn3GMouylKO7ZgxCjgCi1r853/MEJkwbAyNdhiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=hARxlh30ES9N4VBeaC7/4m4u2XE5g1KyZIf4o39eBbE=;
	b=ovJvauz5BH8lVZ7JIZneXlarZ/1DEfC0Joh0RLISRzZc76sypDIobhwF7afn6KP1HIvr
	 ebliTQ9gE9PimV/+vzfAaPLA6138jeaeWOEQ9vgn1FobE1Tzgyyrf+UdVUGnEh6ig799/
	 CVC6wq9Da8mCag7dUiTeI+GpeeP8wMU/sgqiQoB7rStHZXECDg/s+BO79dbjnK8568CeB
	 9SLsDlAOxkz6qrr3TmQsZyyXKLQkvrfBDmVOy2O43Oa4x1acHRkdQhI81CIDzHCIX8C0y
	 iX1oeF6iHUIY2TaF13qVo4g6YZSxhvl6IJdaLCY2J1U3NFzcGhVmgrIOyclFnsjTBpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Ql7+R7Sg;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239D460A5BFD
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 239D460A5BFD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Ql7+R7Sg
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89f84753b43so2372721b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792514251; x=1793119051; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hARxlh30ES9N4VBeaC7/4m4u2XE5g1KyZIf4o39eBbE=;
        b=Ql7+R7SgHfGNWLQv7+BZuEZA8CIIaQtqr4CUnv2/9kVM5mKhqRk8NmrFX81PELjQV2
         lMKXgkCa+O1C4AmgSihF/usNHyE+PEOIuuFrUaEpXjU41ay+jp5lXteJdNDHGI+gpcKg
         xrBpIKHWKnfLad4gebJm7nk3iFW/5fNJ1StYeDMH+B32UpuyO5ThXMvegzNIQNGLp8xC
         0q2+cETx8QI4dI5enfC/635fNzNPmDh6z0MI5tIXwdw+7ytolchvXndjQMZ/dWvUIfoX
         E+pPjvPU9kyxC4CIBC2r82y+lYmiFljbTgQgypQoMLC3Ckm9yyfTh2wNzjZU8cpL3LRy
         HUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514251; x=1793119051;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hARxlh30ES9N4VBeaC7/4m4u2XE5g1KyZIf4o39eBbE=;
        b=QxPuiwZySO2Vzxac2X9Srrb8RA6Vk0HZiOjFehipBHz6ZjaBVNhpCsd9AS1c1+8iVW
         upzeMhyIabHz78n1KJLgLwPpDvZX8syWfWq+zkeON4vrg9e/npaZ0gz66S++lqPzOWao
         tduQv6eQctVx7FMobk6vBh68xQqhySofuH5paMh6ekBf1wiASU5+2xeEsScVACkWljPy
         UOOXNrUxNUUNAqmZ0vkEDsJKrmIToVgyAug9SMyc51aihzbLU6W6uRe1eHePegSzaH8/
         eTlTOJUHiprOuUEZNYVYQaoOAt9YwmyXO4iyNgt0wdZxcJMlv3p1shgTzr3bvWH2JbKv
         aEbg==
X-Forwarded-Encrypted: i=1; AKwUvBxswYPD9Sp40j6nCL/l8XRwhua5mU6U/5t+ZodH45HM+YWEZgtLansCAuI6PMM93cFKKzUR9fB81puDpQM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKKs16N5noK6YKTl1RjaQe5SW9GBhe738xigX996KUvIYArmkd
	jCZto9cq+MDj2IkMS51ObGCC1lkq3pVmFA7nqk8+7UCoSpYKhf9+KkpI1rjsYZOMbzNV25C8kz9
	SEL+bIr7byw==
X-Received: from pfbij10.prod.google.com ([2002:a05:6a00:8cca:b0:89f:a557:42ae])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:8893:0:b0:882:6d80:e5ad
 with SMTP id d2e1a72fcca58-8a04b711535mr8300262b3a.9.1792514251065; Tue, 20
 Oct 2026 09:37:31 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:36:39 -0700
In-Reply-To: <20261020163640.746159-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261016221700.1282659-1-irogers@google.com> <20261020163640.746159-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020163640.746159-17-irogers@google.com>
Subject: [PATCH v5 16/17] perf maps: Fix lock inversion in maps__load_first()
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

