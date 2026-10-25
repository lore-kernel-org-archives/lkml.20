Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792965891;
	b=ryScbTcsUXCKECHnuDBRDCmvgvvAoLiGyw3Azw2OG7H8NUQSomCmy+QQkLU+wbS8PT3B
	 ARUmffBKEnEFDoN/weyjgfSeOTnI3x5pQc1j0viNgnh39Su6uvLCjp0kOp9WflMkcNlYp
	 8o/UKTwjLxcgDpiFJGlUWZDFTl5tkcGDdnqKdX9CopUYlcK7c8GA5frL7MTmzNq+KwppM
	 xwECjv+LFlB+TPgsfhld+PR851PXiIVTkilKpfXL89wY3T64ZmdNUCzCSpKSr1ogx3GI+
	 b2Frk4l6n5vk8t7mt78/YCf5VQj1UGw0WAzPsvaZPYKymmgUeI1zYX6Izze2n7mQy1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:
	 Content-Type;
	bh=tl4JoUZ5KDYN7CQkr/t81Wpys8QU1n82R41inYKbgeI=;
	b=bSbDb9ldLNAtfJ5B7byx9LRO89QUDYTyn9kf/+DWIxBz7cLBTn/5PYtHesnN+9jTjpEW
	 Y/mZBhbmTyAGKs0tC4rzq0m1IedOkFcgCki+88kM0Gfv5w/YIfv5HJM4P97QhGxnYf2i+
	 NNqtgcA7DnS/Feh3Ls5NsFQs/b2U200QVje7/al4wdrCoinqe55+lvfR24ht40N0/6jNI
	 2k7VcXNhf9YloFZKrrg41g5SjBNI52Y2WUd5p/p50aXJOWVwQCbUPp6YCFcMymNuRRvv6
	 bmDN6vTnKrRlcv2fsoWtls4bPf/4Cy5wCx02XF6AjvKndqHL+bp2/+PJEPMPZNAmHvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=UyaMxvBU;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AECD606A332
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AECD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=UyaMxvBU
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso4801611eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792965891; x=1793570691; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tl4JoUZ5KDYN7CQkr/t81Wpys8QU1n82R41inYKbgeI=;
        b=UyaMxvBUJNhGg5Rr7hYmazOFO1Gi/qTimcPADFYX7goZl0pJ05EaxPZMXnCcsjtlHB
         mvHNfq2c1wrUwkof3IRDzhLLGYdGlID1r+h14uE6o6tAW8g+iP1AzKIpfoh1/7Gblape
         52D2TkV5IPXnVbHeQXub8jxyMYxcgSI6LKFMj9HNCeHNZ87Vin33W39ex8H3cH3fRk7f
         41VX5xI/46cuPhsQgCwunBYZ8J80S/DS4MJ/9LWHm2Rjt514NJeP+A3Tms3CaLJFJl9a
         ftUrgDwJsDogRujS+AVa9YBEQrVsFuW7G82/WBZAtO7ofVMfq9D6Bf+zwYcn0e3X+z3O
         5kcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792965891; x=1793570691;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tl4JoUZ5KDYN7CQkr/t81Wpys8QU1n82R41inYKbgeI=;
        b=UPamZlXDPR1rcOvPe/qKD05Alf8Go1MfP0xy+4OJ3EPTBzQ7TuVg8Q7rj94K7N/4Yq
         JxJ/FrWdRXzW93zLIIzGsFwlpOFyPOzjGob+KDDI8HU/Nj2UcAFZgGtKO88R+clC9+9y
         nOpra5rpo+x8y6lk06t9PNNolERpY3DD0GTcxADZfXRC6q+pal1qQB/YgeY2csaCJoeT
         Og2WfX97CA9i4yAnEmi4ORqpt3zOXkZxL6XkJXE+Cgm5xEaoG5phiO5nUKZ4lC0HOf35
         /XAxRkpHpJnLBTJ2DesGhN1/nLfk4SbF/gYezhvU1Efg9EN3j881rbzFoC5Spnba2IJ5
         utTg==
X-Forwarded-Encrypted: i=1; AKwUvBzfZepk5P2RUKITGRq28wMYRghBCdycN0j3aO63uhPTcKOUqnesbGID/rnSd571u/PCeC+wsE6x+ryiFtY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYIDiHlP85sfxLZiVFw6tpwdWkNpoW0RRrsIEYcyXY17e8zRWV
	0cR/rfWaH30a2O0rN+RdEDvxPDJMHxROlPTTPtGXwKHhHTaE5wC/afNwrEtEfliQodpngTAWUW/
	Zexe0zQbeYw==
X-Received: from dlan2-n2.prod.google.com ([2002:a05:7022:eb42:20b0:191:778b:369d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:42cd:10b0:190:af51:d56c
 with SMTP id a92af1059eb24-19936d40791mr7754325c88.31.1792965890319; Sun, 25
 Oct 2026 15:04:50 -0700 (PDT)
Date: Sun, 25 Oct 2026 15:03:46 -0700
In-Reply-To: <20261025220349.1244499-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261025220349.1244499-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261025220349.1244499-4-irogers@google.com>
Subject: [PATCH v1 4/7] perf maps: Check map__start_cmp() in __maps__insert()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Zhan Xusheng <zhanxusheng1024@gmail.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In __maps__insert(), maps_by_address_sorted is kept true if the previous
map's end is less than or equal to the new map's start. However, when a
map has an end of 0 (for example, an unmapped [0, 0) map or a map whose
end has not been set yet) and a [0, 0) map is inserted after it,
map__end(prev) <= map__start(new) evaluates to 0 <= 0 (true) even when
map__start_cmp(&prev, &new) > 0 (either because map__start(prev) > 0 or
because prev's pointer address is greater than new's pointer address).
This leaves maps_by_address_sorted set to true on an array that is not
ordered according to map__start_cmp(), causing bsearch() in
maps__by_address_index() to fail and return -1 during __maps__remove().

Also check map__start_cmp(&maps_by_address[nr_maps - 2], &new) <= 0 when
updating maps_by_address_sorted in __maps__insert().

Fixes: 659ad3492b91 ("perf maps: Switch from rbtree to lazily sorted array for addresses")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/maps.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index f808df2fe77b..675fe0223faa 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -519,7 +519,8 @@ static int __maps__insert(struct maps *maps, struct map *new)
 		/* Sorted if maps were already sorted and this map starts after the last one. */
 		maps__set_maps_by_address_sorted(maps,
 			maps__maps_by_address_sorted(maps) &&
-			map__end(maps_by_address[nr_maps - 2]) <= map__start(new));
+			map__end(maps_by_address[nr_maps - 2]) <= map__start(new) &&
+			map__start_cmp(&maps_by_address[nr_maps - 2], &new) <= 0);
 		maps__set_maps_by_name_sorted(maps, false);
 	}
 	if (map__end(new) < map__start(new))
-- 
2.56.0.307.g5fe7bd680c-goog

