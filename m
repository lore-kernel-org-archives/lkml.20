Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547794;
	b=TEFr/22kHAeQ5r/70lMBBMrKH/f2bfU3RT25cxTMrfXPGCHNr96tMz4i5+D/WrM8rg/u
	 UjqOLoYh79eJYAdXVPg9EN8A9nWm6Y3Dz27BPPnYMY/Tr0WneOj/Emz0GgTHL54wFAW24
	 RSOdC+4OPJ+mFEzhxjKpmRTWrBZoKsYzCR3LJCJDZBQNgwBYoRH0Ng8dTf9ygiiDPhwvS
	 Vx8IK8xhnAYtDcUnphhJtShHgPEH2nav8L5ith4eM6c1lTMQdE/p1CU83M9z4R0dzsfrH
	 ocFHgRhyaszcUhUWjkZc7cwkY0EIISXsXjyT1at1S+QzfgoTSoz/5Q9NX6xpKlRBuJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mlE9let+1WH34apTkg1oO0ao602xCJxSBtyBTlH+r18=;
	b=M3Cn7CCzN/cVKOtNCsZkvheTuNNM/xuhxrHtKAUW2Ti+nifZKFMWZWu3svjHyjD1f3CN
	 60nZtFpuzBhNbbmc1iZ+oiPWh40od0rumaHhmjsLAkwWvxtzSI7kXpZq3bjod7LYj3Xto
	 XljOUa/ZsYJuncgwigzw3aC/XhdKdFAhO238xpjKuTdHUy/K28Bd/wcPjASHj7I6yKeI5
	 +R1uX4lKqLyR9GrpADng/gsr8+aeQdPtkAKxJw7eWwit0KuxjkdzMnjBtkczqCIqjynX1
	 zsESIWho6Twaq5//kpncMw0FRP34U/BS1a45gfbScKVJrXT2Slqeou7vfywqVmN+XVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PTTr5Bwh;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFAD606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BFAD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PTTr5Bwh
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37600b0db49so1479221eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794547792; x=1795152592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mlE9let+1WH34apTkg1oO0ao602xCJxSBtyBTlH+r18=;
        b=PTTr5BwhmRs2/AFfoHlX1JH2aGlF6UyCg8JCt4429REj5J56HKY0blS17xm0FUl1Fn
         Yjlcc1SkPzH7ARelj2G0DI6MEaQiquUAg476OW579h8IdNP2BHGN8ZpfvUHAavRK6OmE
         nssTGjFiXu+d2qaQVA7sVgnDE0j6AEkl33pUaT9Jy6QnYETF201nnpsOegB26yZXyAQZ
         VAoSGPJdtRPcsBH5VjvpIW8ZKtdNbP4xRtRyukIpadR870cjko8ayzjSZKdU3aLK+Z4g
         3oE5Uxlw5JeDzh7ului9/65e424iwZuQvjFBvJX8hUzROTjucYDhTSHURrOtBUMs2dP1
         eGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547792; x=1795152592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mlE9let+1WH34apTkg1oO0ao602xCJxSBtyBTlH+r18=;
        b=jRTKQmWp9sdo70279U06g6XjjC2XOnxPAZF7dI9plzzglkH5bwp5z+j8YxAoyQqjYm
         HEfOM9sN2EpwwAwX9Zhe1gX4GMhmHO2OBrng6ea5FIPJy+ZntI4JmMRTnL4RYXaMoGx5
         UQ9vk8xtjBtyAmuuMxigQa1C/ibJIWqm59QsZ2/XLuFUKDFi5JbN5c7RtHOym27VgDQA
         JmoOiHGGJmYOYP87LjiHBu8fyQ0rQSkSgacrGViF0GqMK4/MwbiLxX54l56PuICkJLy1
         xiVUOymzQGqKclgc61rDvcR5h1Ee7KQY1oaqMTLtSSchyvIkH/Oi7HtNsnYSsX8N0ImN
         gKzA==
X-Forwarded-Encrypted: i=1; AL+hErGvfosztUWXNKmk8DYk/MenFi3BMAJwlUXy4JsiJKN5DhnP2zE7N+Isq3BijMxfrfZDdUSzGf3pJIPYBHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8trIatmYuAXS2RpVKP7v0sMRveBCC+pZqhEh6vaSHHrgjmzymZ
	NJqGo8IjVZ2F1zwwBxbs8q2W846PdDrcgMnuEVV0BrwS9BHBjX6TJdTj
X-Gm-Gg: AYBFou2NI5gaGKrxXHNXdYQQaOdw5bKPo7xCLJUpU+tjRku1/tGSCUqberKmiGGZXn8
	tn2fA2iENhBNNaBTGHXeR0ZJ9iwyfQb5Zmw4+V3B//zQF7sD8sUZW1Rc9EYWei3aukVlB9B6iuH
	AUS8We63zc4BHyghs18PWInqOuTq2oK6mhfxIKqo3quBu7WfirusRqdRWFkr3PE5/VFZKqRQYL/
	7ut7l3YmlyRoPOwVAuhcBWrmhE48PtWRRah+PC0aOwW+ICpQnYqGiRqDzBQhK6SON+OV4cAorxv
	0rz7A8jfw2Aw8Qe3eCibqMWAleRD1sJCpaogZNFrsUpCZIxf2iqMgESrlXRDso5DNbFZASjfTkr
	6SVNvjj8HzX1b9iRmWGkphbgG9KkF9I7tPXXyKIS2lEiRuxV0YNfkD/eDtORAo7OabhFU31RjKB
	2DuR2Kpi7x6Xpbzi+XqC5VWAHuRV0SMvpHQWHUph7K35gOY9s5/1ecSw1v3fZXyOa0ftV8/Rgyb
	LC76ZIEZNhdmhqolf0RemwJF2+2Oa3xfg197ZIDCo1hKII+h5m2xbBJE5u0pivPwUJG11AaIMAt
	ZgGM1Lfc+8AO5gKe2/XOmSH+OWZEpHJX9ZSWM+cFgzJGYWF8tUPBZw08Tb9pRhcV8pfU01Uyomm
	FJuXUdNMuqQMRocVeaGtlM4H762pU0rLLxEd8pXSE9vm1YMnPWZceN749S+fhRWyhh9eoJh7zOw
	yi8Q==
X-Received: by 2002:a05:7301:2783:b0:379:2c7e:7dff with SMTP id 5a478bee46e88-3792c7e7f16mr1623959eec.26.1794547791950;
        Thu, 12 Nov 2026 21:29:51 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378c2fesm3832840eec.1.2026.11.12.21.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:29:50 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH v3] uprobes: Use flexible array for xol_area bitmap
Date: Thu, 12 Nov 2026 21:29:48 -0800
Message-ID: <20261113052948.2668076-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The XOL slot bitmap has the same lifetime as struct xol_area, but it
is currently allocated separately.  That adds another allocation
failure path and a matching cleanup branch without buying any extra
flexibility.

Store the bitmap as a regular array and allocate it together
with the xol_area. The bitmap remains zero-initialized, while the
allocation and error handling become simpler.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 v3: use normal array
 v2: add Acked-by. remove Assisted-by
 kernel/events/uprobes.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index caf444762a27..c5c90b53d4cc 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -108,7 +108,6 @@ static LIST_HEAD(delayed_uprobe_list);
  */
 struct xol_area {
 	wait_queue_head_t		wq;		/* if all slots are busy */
-	unsigned long			*bitmap;	/* 0 = free slot */
 
 	struct page			*page;
 	/*
@@ -117,6 +116,7 @@ struct xol_area {
 	 * the vma go away, and we must handle that reasonably gracefully.
 	 */
 	unsigned long			vaddr;		/* Page(s) of instruction slots */
+	unsigned long			bitmap[BITS_TO_LONGS(UINSNS_PER_PAGE)];	/* 0 = free slot */
 };
 
 static void uprobe_warn(struct task_struct *t, const char *msg)
@@ -1762,14 +1762,9 @@ static struct xol_area *__create_xol_area(unsigned long vaddr)
 	if (unlikely(!area))
 		goto out;
 
-	area->bitmap = kcalloc(BITS_TO_LONGS(UINSNS_PER_PAGE), sizeof(long),
-			       GFP_KERNEL);
-	if (!area->bitmap)
-		goto free_area;
-
 	area->page = alloc_page(GFP_HIGHUSER | __GFP_ZERO);
 	if (!area->page)
-		goto free_bitmap;
+		goto free_area;
 
 	area->vaddr = vaddr;
 	init_waitqueue_head(&area->wq);
@@ -1782,8 +1777,6 @@ static struct xol_area *__create_xol_area(unsigned long vaddr)
 		return area;
 
 	__free_page(area->page);
- free_bitmap:
-	kfree(area->bitmap);
  free_area:
 	kfree(area);
  out:
@@ -1824,7 +1817,6 @@ void uprobe_clear_state(struct mm_struct *mm)
 		return;
 
 	put_page(area->page);
-	kfree(area->bitmap);
 	kfree(area);
 }
 
-- 
2.56.1

