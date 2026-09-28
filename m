Received: from mail-oa2-f13.google.com (mail-oa2-f13.google.com [74.125.231.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3013D649C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623435; cv=none; b=PeAtPnkYWGXp8vlMvfzF796yEGyRpkpp+Yb5wk8VP0nPMLD3aaa8geD9xBLl/w76i9lbk1I5mwkvJmdVz9ScYPdYmGfnNIMn0doN+u370i+5yfwoDRvILG7bm0msTSJvF/e609dUqLm2FX1r8eY2sORDDX1AO40K95DPNY+QCY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623435; c=relaxed/simple;
	bh=fkznwRMTW7m+73J/coL8E6TveSuO7AR7NGB3WPh5Mi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rJihBLupD1vUdJ+yysG5aQCxOe/V2h2DyC8iu9xn5j0HwLkgKrFYA5jRjLBY6fSvLiN6+kAX5xR3HdeeoVPaNC7hcA3YpOS6tEg12FFKV0YxcqB+/rMiZntb9YjxDIG/6lPt/8HDQjQQIbt2C6ZNjiDYQyq2uH15H/VdAUC1M9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlfNl6ts; arc=none smtp.client-ip=74.125.231.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlfNl6ts"
Received: by mail-oa2-f13.google.com with SMTP id 586e51a60fabf-466ccdd7695so1367301fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790623431; x=1791228231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHveE+gpiQTTbGsR6xfcK57TMqcWcGFoeOvQiQqSmeo=;
        b=KlfNl6ts+goBdzADvIU+bMu7kADT6HQQgC+ll2ANJC3ls4eEiICSzrBiCrf0IU0hG2
         Q/wcJsCO05GZqyxtkszrdvdDh7HgU9mNMK2zzPHo6e7azlYSWBgqCT3nqH8RoIQS2DWg
         ZsM8+3iO7Gg7NfNC5iZ+mGSzWXWRGFGkBsvBAaBx8SXkGZym+gv06TDP3BHltrE1zEz5
         YjvOjGsI1nLJpijvyoMmj4UMRNGPUpq8VnKGFl5l0vJ5Rns3xP1ps1wIUCko85LIU5qb
         RQCEDAW/uIg2nXqWNCFlhkuyWXE5CfanmdQSCEri6791u2llv4dcG4k43MW37oGDdGza
         XXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790623431; x=1791228231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WHveE+gpiQTTbGsR6xfcK57TMqcWcGFoeOvQiQqSmeo=;
        b=oPVBiPg/M/tQxycjdpNNt33YnGLQEkCjp4DDdsBYdqq/o22XkctsbGPIKtFWMyExs0
         JuXaDwqJiX79YWGQA4HCEa0OmDwxjmuUxj/Hz/9OL27gFY/7kr9XkC5n3BQoE9IxX6RN
         MK93zYMCHBKspr/YyT1iS4AttP+iVnC55+/LIZn0NkxHXiYTUDEC/6HIysgV16I72pPL
         QOGgOqijC1xp9o2zqsTvkK93ClVeoF044EV4WI+fZP19k+7vjjVh8fiwR01S6nr3WImd
         SazI7EY0RIZqoVY3PVBehsyhiZuAtxWfGDhecjgcDvhuZ0YzUzVgph7APJwQ+2fVzUI8
         iw8w==
X-Forwarded-Encrypted: i=1; AKwUvBwSsG9+/RvkCv2//Aden6+/V4gogW+5gaeGFLhQGmhC3gUmKAWoI89hWe594MNRoF+KAHe3cZ9Qxk4M5oQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lzq/LYT8zrQUU33k4hJeOu90clt96hN8D9PoPTCANA9bJwKOQ0
	pTvVzzLPpjB4JJMEW5jwL0YNe4knnc0GH7+JnNUfe62jes8npjwwhafI
X-Gm-Gg: AYBFou3BqxlGki9zE+W7ebFwFVCgfN1Eaa5384YkU8ljhEtTJZDiq4f5OtD4jS08b3p
	TJKFV9ft+Q6tHbjHcPYm8ZmcGiCBccUPfMwa+9c9lZogfDgRPfTHLrzsdPGwlRc+vq2lLBpFDaq
	eb0i3HkF8o3VMVO8fG40UT6PUmbUNqM4DLMg1TetpgUt7EwGZpSeycxgWFwRogoLHa0r214OLcI
	p5Pfl8MwEjUzWp/piVS+pOymSFnHko4Ah+T7/c0DVUXbaD8V1rwV2HfZbZzDe342YUXZYt3e7M8
	puH0mCL8mzE9CWuLJ3NkW0l+3W3wW9D8aXwJrbjc1/L6+BsOojp5/QfoUIlwqikFVP5B8v81i5Q
	BmBXvOO3vQ8cRejKZQAN3vnUjAelT9PBdXZYkBgDtwkcx4WYIWdXvFXXENwLechOkOsonFPI+Z+
	dwokk3rNsIf3lp8iJNms0UeTpMmFa2taTWArf7ekByVWjd9ytmcGLI5cS7+x++OrPKJk///wOJY
	jEpUUjwv7aKrQHDXiKwvIlczE3Dww==
X-Received: by 2002:a05:6808:10d6:b0:4d6:9232:b3c0 with SMTP id 5614622812f47-4d72cd363ccmr16423959b6e.55.1790623431516;
        Mon, 28 Sep 2026 12:23:51 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4b::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ebbc7b7acesm2515978b6e.11.2026.09.28.12.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:23:51 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Maxime Ripard <mripard@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Oscar Salvador <osalvador@suse.de>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v6 RESEND 1/5] mm/memcontrol: flatten try_charge_memcg control flow
Date: Mon, 28 Sep 2026 12:23:44 -0700
Message-ID: <20260928192349.3432886-2-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928192349.3432886-1-joshua.hahnjy@gmail.com>
References: <20260928192349.3432886-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor try_charge_memcg by flattening the nested memsw/memory
page_counter operations to separate the logic between the two.

When page_counter_try_charge is made stock-aware, this flattening makes
the control flow easier to follow since each page counter now has its
own success/failure paths.

No functional changes intended.

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/memcontrol.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index aad0498a7bd65..edb2da5a326c5 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2721,18 +2721,21 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 		batch = nr_pages;
 
 	reclaim_options = MEMCG_RECLAIM_MAY_SWAP;
-	if (!do_memsw_account() ||
-	    page_counter_try_charge(&memcg->memsw, batch, &counter)) {
-		if (page_counter_try_charge(&memcg->memory, batch, &counter))
-			goto done_restock;
-		if (do_memsw_account())
-			page_counter_uncharge(&memcg->memsw, batch);
-		mem_over_limit = mem_cgroup_from_counter(counter, memory);
-	} else {
+	if (do_memsw_account() &&
+	    !page_counter_try_charge(&memcg->memsw, batch, &counter)) {
 		mem_over_limit = mem_cgroup_from_counter(counter, memsw);
 		reclaim_options &= ~MEMCG_RECLAIM_MAY_SWAP;
+		goto reclaim;
 	}
 
+	if (page_counter_try_charge(&memcg->memory, batch, &counter))
+		goto done_restock;
+
+	if (do_memsw_account())
+		page_counter_uncharge(&memcg->memsw, batch);
+	mem_over_limit = mem_cgroup_from_counter(counter, memory);
+
+reclaim:
 	if (batch > nr_pages) {
 		batch = nr_pages;
 		goto retry;
-- 
2.53.0-Meta

