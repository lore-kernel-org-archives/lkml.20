Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622406;
	b=TJo6JBj8pQkYoKCSxFV8oLFM854L/Kb3Led8OgUKBYEtOQTKV6BENOopqe+I94ph2QDw
	 7eZWBMZBeJf/vndwD0LSXM4fskd46S5o8tjVpaVhZMWUCwAs6NXVNFswmVbKBfRy8YF6v
	 /1nVWT5/CqPdIHTZcCX4rcN8m+1RlTfq9UF2D4YK5zVQ2lh+W8obrh4E8AIn20mCWjgO4
	 dZzfKaxtyx0UMTR6DsTvv6bfITuwboj0YwtcO2mqD2ifyc7MwGlGl6tT5mIlrcBlqYvEY
	 +aZH8onGQ+W315RvaxxzaQKc2lP4PnU4A+7w+V1SoZ1j0UzTZifY4FET6hvi0aW3WUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=4N6lG/9faT9ECF/bBopwnnQUqKUgvyQE1Rye5tZt4hw=;
	b=DGwnLZPspQ9+6fcDhYmvTDzU/TU7Ex4K+YE4loYiUulUyE3a7Zu5cx8tAXsriixpuGo8
	 ZWZlZmin5m2oRs98vqiAIBQWDhtHzokEXizoeqUDfWi+1/3lCS0ADewvZFux7Nd/qtGcV
	 8dAOEeoT3ux69vqvYfgDEcSbTi9XtQAHVPuxshQa3vTFEj8jJanEay4P0DDoxzBRSZtvN
	 nn7glcuGNitYbmqWzEkeuobfN7OF1KblrfMGEI8B+hXzZ6FZ8oxNRwBCVA9eV0Y7qYRiO
	 FT2lereR52mrwZ/Zky+GM6C5+chovqXeFzG/TEjXMdxupObMmEmsXKME8GgIuItOAqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=mDAi6naM;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041EE606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 041EE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=mDAi6naM
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-18b5ee75447so4599001c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622404; x=1793227204; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4N6lG/9faT9ECF/bBopwnnQUqKUgvyQE1Rye5tZt4hw=;
        b=mDAi6naMWf/YDg+OgEI121OjdBsSj+jPDyqanERchN17bho8pzqg+0li3AJwK4tB7+
         AR/tEfDyMQ8F5ivDqA8AgRQNLlT5UOB3XpaqJ1yxLwC27A9axZxA9Kei5V7k3XRClXaw
         Yr98aPRXpbctl3lfihjqOFar8rsXX6XqzPmjjHLieNgC1T6hVO/Vkqj8butY7nt/VoZj
         72ZL8uaUk/8CNQDm3JIbUvBy6Qy3LkMPZBQ/knvPsHwBbc+QU2UW9tYl/TjmFW/Wn+Rx
         d3KKkDQRCQmxqqLcAfKaSPg9UnI49AZrYzbbtLkGlt3lEBtC3coDd6CrRQwFgM1i5ycP
         VN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622404; x=1793227204;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4N6lG/9faT9ECF/bBopwnnQUqKUgvyQE1Rye5tZt4hw=;
        b=Hcv9a8pzOO6Sp7wkvF3IOrhQPmahbl+Jf38U5jaIYKGjOD1wEdeumyqUKwjmJnFwVU
         rCvyGg3Fi4BLlBVJ2w0wlTFmEZqPddPHoMdvjnGBsclvgj7YK/ULbZbWw42QXgcSVFzi
         SKvOkSMZHD3H4gbN4gmcKI7/qTN0zNwaWK4xNpDsLJ+yZXxTDIzIvytIsyJ9Fc++EkYV
         yM9B5N1GB42b3bS+V/WRQDpM3WrN7CJD4egl1An5+/M3XTdWbDE6Zzktt1/DbLCIlcAa
         Hu4WQJiv20WanVOGFRBSBAmc2IkXvZT1EEnD8M6qnQha/2MjelaH+LqrHtBD+Zr5dC+u
         sAIA==
X-Forwarded-Encrypted: i=1; AKwUvBz/N28V16wCJXTogy1lTgn9Fp9TtgS0xeGZTXiAhbQO7y/Uzrrpk9oUl7c7NcqqhYLg1z8eUVy+kWkrZik=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/3gd8sEcjX19ftpkXWYZEiy/cW2K9DpLcdMlYUf9rZ4qV+C3d
	VO600yxC/Ca6Qx8lqkkpV+J4Y4zrAbRTJOTFWyxYIzzEKx87u/OMAMjnOK2K/v6Wpk4JpSMtyJa
	nlvttVSfBGg==
X-Received: from dlbsn13.prod.google.com ([2002:a05:7022:b90d:b0:14f:4204:735e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:5f08:b0:177:9a5b:a89
 with SMTP id a92af1059eb24-190a67fe0d1mr3720865c88.29.1792622403745; Wed, 21
 Oct 2026 15:40:03 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:39:04 -0700
In-Reply-To: <20261021223905.715051-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021171044.155240-1-irogers@google.com> <20261021223905.715051-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021223905.715051-17-irogers@google.com>
Subject: [PATCH v7 16/17] perf maps: Fix lock inversion in maps__load_first()
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
before indexing and removing the entry, and remove from maps_by_name
before calling map__put(maps_by_address[address_idx]) so that callers
such as maps__remove_maps() that pass maps_by_address[i] as map do not
use a freed handle in maps__by_name_index() under REFCNT_CHECKING.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/maps.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index f808df2fe77b..e947506c60a5 100644
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
@@ -548,20 +549,27 @@ static void __maps__remove(struct maps *maps, struct map *map)
 
 	/* Slide later mappings over the one to remove */
 	address_idx = maps__by_address_index(maps, map);
-	map__put(maps_by_address[address_idx]);
-	memmove(&maps_by_address[address_idx],
-		&maps_by_address[address_idx + 1],
-		(nr_maps - address_idx - 1) * sizeof(*maps_by_address));
+	if (address_idx >= nr_maps)
+		return;
 
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
 
+	map__put(maps_by_address[address_idx]);
+	memmove(&maps_by_address[address_idx],
+		&maps_by_address[address_idx + 1],
+		(nr_maps - address_idx - 1) * sizeof(*maps_by_address));
+
 	--RC_CHK_ACCESS(maps)->nr_maps;
 }
 
@@ -1459,10 +1467,15 @@ int maps__merge_in(struct maps *kmaps, struct map *new_map)
 
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

