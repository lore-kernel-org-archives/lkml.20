Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826002;
	b=f1qQD3Fm25NosT/TdihNpziV098mpm76TE5xVRevE/jNKb09NeAsSN5kd/cfmIzp3DEK
	 mJZY0YPQdUHhQKctcToZFVW0qLYfXB1+PbxfrttE+ophw0ayCSCIKxBOZPLGD4VVOVCvf
	 3wU9cAQFg+YnSHClSG87YAbKKqRPvO9EQ4MXh3NyBm2H9oDr9+k0kXuU+lhOq0kfaz4ce
	 CsWYwyDl2FbwZRoyantQ+hkPhh2e17Pp6UT2sUR4F4KFczM9j7dT/BAI8bQEItxokGDe2
	 i93sISSh6yJazKzYCMR3cntGdJ+iZkLAOG8OfApy/Kc6GVdB4eQYshloZn7tsovfFuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=rt/D2V0pPqFKKFuRewSMDlrES2za5EAC5J3ia35lEA4=;
	b=YVliOYcMLCGLNvM/FiN8vH2gNwC6NWVp1WpTSX1gY+4AXveG0FUmr3S3oqwI9acD2EwY
	 RxGz8n/PrRdlCSoM4yMoZ8SwyO6A7/hsdvg+M69iR0NTaRvCUx4Q4qwOakHW8Ib+CWsT5
	 3P45AF//wgO5amHlp08Z238OkhUexBWyvNxofX6WYx+1rCC1NXApcgYEJmgfed5xJ0FvX
	 dXUhdvSfZzG2SIdazusHiQb0FTXDubV6+nV8OlsQX/RwvjIIb6wX8iZ2hGB2OImqoJyTQ
	 /R1yaeENVtoGT7w5Q4bGpOKYfWSButEgnjRAyI+o1vDGKZaoSzzuJIn3ijw5Qu4ys0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hTYsfX6s;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43C0609504E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A43C0609504E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hTYsfX6s
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36cec75d8caso25758eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793826001; x=1794430801; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rt/D2V0pPqFKKFuRewSMDlrES2za5EAC5J3ia35lEA4=;
        b=hTYsfX6sMT+vbRbCxP1AWIdEU7DHmtlHys2mJZE4YcK2GxLM8823NQrs9HE5vPfCI8
         LwQUFKRiDk0dipm5PnbTbpPmIGQ1Mbk494KR7mLWzYtfyCATE6KNPOPL8BCUmtpqii1c
         19BPbjxmz3b3r1L6AkrjKy4BaowOCPADaEjKiGoIIFePjJoja3mCOO6DA+IG9aBmWLMQ
         On4R8R9yj4SLoiFR/jopZxVpVikIspqFwL4w9TrrxVgJg97oSqr5RIKc8kqusLdaFFgw
         Jj2s8MyXDCw7IoVxYi5I06Lp+Q0Kxg+GD1QZu+KPNta5B36q94AwaIQ6UToxTTpAFNay
         5Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826001; x=1794430801;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rt/D2V0pPqFKKFuRewSMDlrES2za5EAC5J3ia35lEA4=;
        b=YBbygkai/IccYH69yYVwQuwSbVo/ptkQpof88FGkKSNQ7AvO9ouZoj5E8YXxrB/h6d
         JQ70lCQbbIHqwpJkQ5WBIcbjmaNEAiF28znd7gSarjSQKUNbKpEkuQLFJ79hipxSMdlI
         Anwz3tQHzSiMH+L/VZ9Y8VrCCwz0ww0DjXuZAbihtPHsATnUD8W8uBM4wMynlatldKU5
         vliNTU4wjENEeQMmEuYrdN3SDoNfClEj+xQtdZez0ZoN/9XIbEO7h55uw2AyJf0YMOjl
         7CtJKsPD7L2R3hDapUV0UEJrGY797WTqPJebeCtTBP2AnslO+aNTY20PDmLWcZo4ZTSm
         j/gQ==
X-Forwarded-Encrypted: i=1; AKwUvBywJjm3Gfozvm8X2YMwmOpyTQJN1K7XwsdwAjJQlR/lFfj+t+E89a6yJfxyFVej1mmPpEFtORYJTTfVpf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+scHPsb1KxqrEKe3DysH4glYnzmhJAF+ckyyj3mCIraL8gyqj
	YY+XAboWwVvQKKUJEFSJE5jDg/nEFwWVxd7PDVd9Me1eT4vwL1ZiwYgX4J5Wbx2TFMfj6fksFBu
	/Eai6KHTu3Q==
X-Received: from dyay26.prod.google.com ([2002:a05:693c:62da:b0:34d:46b2:7513])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:51c3:b0:36a:37:1404
 with SMTP id 5a478bee46e88-36de576a94fmr767686eec.13.1793826000418; Wed, 04
 Nov 2026 13:00:00 -0800 (PST)
Date: Wed,  4 Nov 2026 12:59:08 -0800
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
Message-ID: <20261104205909.2078411-19-irogers@google.com>
Subject: [PATCH v9 18/19] perf maps: Fix lock inversion in maps__load_first()
 and bounds check in __maps__remove()
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
2.56.0.455.g6c5a503b38-goog

