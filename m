Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418979;
	b=RZxZ1PCDEEyJSBCXBR+ojJ9Xr0xqKGR/8QDO0Fjzi+BVkbCKETe7/DuQQsDf3KZZLS8N
	 35c+/vF2hRJNpb2zfICQZh2EsPWnTTCtuJkGnfG0EbFMawQ1Jx1rNcrDpGd6CQ8KhPS+3
	 kAd4PMZiAxqfo8M3WawPJta8X7qvIRCa8CRBHTYE0DfkNUUM1V3WB+NOhWTmAdjlDkSPQ
	 y0tkO6/4KlFy5DCTfXg/2UT40+NbD8PPoviTag7T4N+Zkeq4l4lOGnkMtqsgVTbxLt+Gj
	 Q6UwgAR1TKEpg3qjtkwjfOXx0+wbbBSPsWEQpTz1q5eF+P1D9A2aUC4Na+Buoy3Kfew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=CJCV5FAjldeZZ8pPMlGSAH37gvDySd6J3mbbMVPyJm4=;
	b=5TcQ8PaLvj0GiT3lf/8A2AD2X2SgZFVj5qCfOy53OM424PEYVu3iA+EOmSY4Sidu+jk3
	 USI218BAxOat5r/iHEMByGAAAA+qXUnv+bPQOEFYXXkaxWuyMau9S7Sik1CNb0SmU371J
	 zAGf9xaN4LTnTXZMgeV8oNkOBmcw2JRhS432+KQcwXQLBVFMjvvmMBR6nth/HgddGX0+X
	 AdIh5XfzRcZXdWdtfompt6bqdpbvWs1gB/RQUS4LMIaEYvO5hUC7eoKl6NGRS4eh23m/e
	 vxfDnuzQYiRy3NnZeefU0veHAyilUEuSnnFs1X5aR+IgbO14aA/FjttUDKK8KUXVF7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IwHlCo1d;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498D6606B4E3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 498D6606B4E3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IwHlCo1d
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so2235230a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418979; x=1795023779; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJCV5FAjldeZZ8pPMlGSAH37gvDySd6J3mbbMVPyJm4=;
        b=IwHlCo1dK3LIm2bCl6NYADeKbRO7Krvb7ofWVI5TGkNuvDugf6v98x5BP6lypSRMKC
         KBvOyTEG0xYK5lFqf1oFGtWybMk6rbC2MSJFS6gJy27bWx733V4JmwTGb2DCRjLS4L1s
         koQ/4++o6RjF2KA2evLmeuckhe69nrf0lg32ZEFYf0r1aS8j/xpDotamd9VC9jqSjtW+
         xW162S5lQBX0QTh/4LUxX2aeS9a/dXaywhOZFEUyfT1CwZib4aWfuZCynVvevopqYNSh
         Oqbk26t4dt7hAG9aCDXps6Bwtq0+bbeiwehI7pfSMhOP5Uh8UUVoEZ1tG8xGYgp8gcbp
         WtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418979; x=1795023779;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJCV5FAjldeZZ8pPMlGSAH37gvDySd6J3mbbMVPyJm4=;
        b=a5/ql/T8rxhvA36iLl1g45IqlNgXnz00OyQX8okgRieXnH1uRC5vkcUZSLxRolUogS
         HDJEGhQn9FM/vyPEUbm3JPLTiM4L8Pa1eorN3msC1CbaN2KJPtvFBkqf0GCUJoD0j6GJ
         rqGsGnIsN3Qf+Kqd5pSMNdk4jph3y1YrHQuwVzn1A1yv0N4YFB/Z8uSzlFngzaIpC71L
         ZbbUgGJe2T6z5p7AufX4nTAYiEOZQvLBjPUPRB4+C/N2HS9WUXWpakQ9HYk+It83VsoA
         K8c9MH7AIvZ7Hw5M1+4LJ3oFs4FXMK+SQJ+W1AeqSc8I/N0iD9zR32LM+4RFJjGU/BB/
         Hjrg==
X-Forwarded-Encrypted: i=1; AL+hErF0qFKpETAIKCLm81d463SfDGUexDjNYB9/k1PUPra07Ce8gitzKSUIHXCp/YAr0PK8s3KAnKYP0h+QXro=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GU32d8+8OsqFW/p8z5zXbphDK85mhbfv7wYiFIGiwwOYtg+Hn
	VOSuvNPreZwZC8f22q6Z0mio2FLLa+p86TI7T5W7iBCWYXRzqNtvHowcG4IpX4OJCyZGzmaalvP
	ZHhOOK+dyJg==
X-Received: from pjzp24.prod.google.com ([2002:a17:90b:118:b0:3b1:15d2:6bd3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e710:b0:3a4:967c:6947
 with SMTP id 98e67ed59e1d1-3b182eac808mr2863948a91.21.1794418978458; Wed, 11
 Nov 2026 09:42:58 -0800 (PST)
Date: Wed, 11 Nov 2026 09:42:10 -0800
In-Reply-To: <20261111174213.3526604-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111174213.3526604-19-irogers@google.com>
Subject: [PATCH v12 18/20] perf maps: Fix lock inversion in maps__load_first()
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
2.56.0.542.g3ef89b7020-goog

