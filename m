Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FBC51A132
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750583; cv=none; b=E+Ma25Vj+W3Tx8E+GdqHt5ZmNSkhW2jLMp5sx4gO/2gIjrbHg0S/v6Ob66B9MR4/BuBSdw6Rga7gdyfO5xzrBOeUHpvnF1ycKZ/LuCW5RE8Hy6ilIp5/joUC7CJZYE7VKW1tprGkCBhy8/RTmHwIJ4soqdVrRnNniIjYecsYRX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750583; c=relaxed/simple;
	bh=H+ukdmwXP+tMkaQEpJ23doFZ9tvP/S4l/tdO9wntvVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G7l2z//XpGS9tdMmyu5xIVxog18lHsb8ub2zbZtdmz7Otzdugw713awQNNjW6WxUk/TZ3XMlFbJj4EGxNjyUE52y6uYYLxAs6gG1IG/Q9b2+/lUFwDzzLkIjdQDVzWyueAgKsB5R9BWPw5SpGAieUUnk+iND1rergQKE17FOwJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=don+vCZz; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="don+vCZz"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db22383fe8so6714845ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750581; x=1790355381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZ4B6fQ0OaE27qFChHjfflbajHqzh3JOUdhhP8Vrl9E=;
        b=don+vCZzE4jWR0Cuyc8swx8r/1ZzCoKa2h3pQqwyut2J8K/74Lyj7Y5mHNqNwF8O3/
         E2yJjdTyKEMfbWukcSXwsMAYuk3zhHQI90EHwCcS7Xmp8pr2WQr9uuMjb4S1UwmXJDK/
         HY/ceq1fhT5FTqzEhP1B9YlqqGMNOmrRRrbsDUMkNA9yt5Ofw7Z1sXKhJLKa91mejKn6
         DxoAgp8bgdq4XLEqzPCR/DYXV4q0OJnM/VFdarKiY6dWs5tbZowRiiwkMNHWr9wpZD32
         3LcUbVEUwqU6nEIr2AUBKs5KO7BOIQapGv34UlZbTTgllgtdgOs8ZJdKD9GIYRsKDRbj
         JLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750581; x=1790355381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZ4B6fQ0OaE27qFChHjfflbajHqzh3JOUdhhP8Vrl9E=;
        b=SUGQyWzaY4YngXbOd/GXXQdW8rjvRSPn7EcITpl/jyIyZ9koVLRIarwQ/oPuiA37Ag
         2bfzSGxyv37o3tHBJti28sxEB7VwB8y4q50juI2/DdYpiFjHHlSRZUoRlIWAClkAgDNB
         Dz2rBg+qp/y5CCnHOTzIK3lgc6oOOGQ3wmgm6nyiErkBekWL24sxl0HRkNkAF8dT5hPC
         2jpZra1hDjU7f18bbsr2rBgXw2XX4vavSTkM/uEQSwat1iL+wJlmBJYrnH1sGxDNFFPB
         7hEFzpRaXyFI9VHHt580Vauc5Dnu1dMIHlv98jkkKrHFHGf6vEeYN9dPiXl/NYe7btyJ
         ME5A==
X-Forwarded-Encrypted: i=1; AKwUvBzgU5YO1tcMc47BbT2AfMNHP8o4+/7j9hc5D5VXOrviBFnJsYEWrh2dV43/KMaIWdYkur/sQLxQT8trixQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lkPzLb98PT3ETLYGdUhkfUQYz/DqFTL60AyANYJqTMgJvEs4+j
	hkwwmMfAp8OBtwjwZRKKmdlzJhW+/CLydizidWBerJivo9YS91B9AN8y
X-Gm-Gg: AYBFou0QYZ8CMpzLgnMDU635qlTksm37NTGBarw816m8p2Z6RnK1vnZeC8WwjvuFTiu
	8NT9nQajdm3HEBsQ/1IsUYqdFcZTiNv2BvyynMfsjGkjhrLOd6hXlqk++lqw8MUm4gfZvAd9sM3
	uB6xKdNLWoO7VlPB6/zZlAongy6lak2ZkPqXYnhu4EDsYP8cYLfNlP5H+vBoUQHv/+KZ1qPQbs6
	f6gXu5hpIfhfUozDxfR+6KkZ+mqZz1oS8Y+zigcZthkCN/6DaD0+Y3aSNtf2KTK9JN0TwTH6aYb
	GJeOxg4cSWmmDUbuYNK2NAN0A+IEynIb6weVMzW2jHQL1P6zF6Ta0UwBCRM3NdvG7cpO1AgCNCN
	zfp55R6vmi60PkN9QIBEPfDDalRJYMfbmIl9AT6m4twOPQqsWlstm1KjEHwxnrzIpZrBVSzxurZ
	DRRDyspxpXVjAsyB+kBFRIB1E0ZavID9wlBLi+Ec8diUv6tNdcAq77DvzTYzUpznePQlpy1op+Q
	MQ=
X-Received: by 2002:a17:902:d2cc:b0:2dd:ad73:c982 with SMTP id d9443c01a7336-2ddb1ba0faamr58779045ad.26.1789750580884;
        Fri, 18 Sep 2026 09:56:20 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb75bfe10sm11409685ad.64.2026.09.18.09.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:56:20 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <muchun.song@linux.dev>
Subject: [PATCH 2/2] memcg: remove unused mod_memcg_page_state()
Date: Sat, 19 Sep 2026 01:55:58 +0900
Message-ID: <20260918165601.1014666-3-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918165601.1014666-1-ekffu200098@gmail.com>
References: <20260918165601.1014666-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit c466412c73c3 ("mm: memcontrol: switch to native NR_VMALLOC
vmstat counter"), mod_memcg_page_state() has no callers.

So remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 include/linux/memcontrol.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index b57a74617b0b..c0557e1e3d21 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -949,21 +949,6 @@ void mem_cgroup_print_oom_group(struct mem_cgroup *memcg);
 void mod_memcg_state(struct mem_cgroup *memcg,
 		     enum memcg_stat_item idx, int val);
 
-static inline void mod_memcg_page_state(const struct page *page,
-					enum memcg_stat_item idx, int val)
-{
-	struct mem_cgroup *memcg;
-
-	if (mem_cgroup_disabled())
-		return;
-
-	rcu_read_lock();
-	memcg = folio_memcg(page_folio(page));
-	if (memcg)
-		mod_memcg_state(memcg, idx, val);
-	rcu_read_unlock();
-}
-
 unsigned long memcg_events(const struct mem_cgroup *memcg, int event);
 unsigned long memcg_page_state(const struct mem_cgroup *memcg, int idx);
 unsigned long memcg_page_state_output(const struct mem_cgroup *memcg, int item);
@@ -1396,11 +1381,6 @@ static inline void mod_memcg_state(struct mem_cgroup *memcg,
 {
 }
 
-static inline void mod_memcg_page_state(const struct page *page,
-					enum memcg_stat_item idx, int val)
-{
-}
-
 static inline unsigned long memcg_page_state(const struct mem_cgroup *memcg, int idx)
 {
 	return 0;
-- 
2.43.0

