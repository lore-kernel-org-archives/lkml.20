Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705845;
	b=N4KfPSUT2roGTMbJAxU6cm8X4aDxeyYMFA1AD+7tJ5MBlUHjKzQIYYHgYe5yMA3IN0/l
	 DjjHDx/AwacSLpuMCxZ+ob/rO1SH8sI21hh/p2T3MPzBL0sX+AItfeQiRJDDFWHcx0nDd
	 24bdNFH0OlkXQcc4pg6b1/MfIW6hZo3DKrle7nZGV4WCYVfVHwkGRPsosBdJ0RVaIPYdo
	 7+oW6XdxLqaO8Py/mnw2dBQkA40Z19sJO934zINZONyn/7RslZYAxmV1MhEugyC2xCkTC
	 wbIwwUMmWPbXUUf9l8GLoNeOtlO73TTUhcwNgjbJr3Bkvi8j2D82tIsI66rF61IdgNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZHfL2fUcvaXyzQYSxt8K4LaojAdVAqjS++SzJlHZY3U=;
	b=qBF4GTFqmtsikQ5sUh1yEsxx9Tm3LDoS7vm9VgzA5l+KkdQ87SEFVWnEKszcrgnGInhP
	 rAMUFLVKD7NUiuJxWiGYu0WAbVWLKAGylPXdDjsLrg/jwWiocPViDAWIqVg0g67F2O5c1
	 EUBeI2a4VuEjK4/ejhUm990IWVrOhAqGSSI5Dai855koxCBZoVT09tGyvsiHTnE2NM8Hu
	 NwSVYbVvoMlK1RXOxSB8AnCigUYTgsQ0MNFaOpjS7H0x4DSL86epOgdbLqJUuTE7CWepo
	 dUqA0bQ1o6VwfrY39ElGw+qu5Ws25hEffccT8ViOjZTH+/DroHI17PceIE6Zcpy6q3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=XUa0czEG;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437F46082BD5
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 437F46082BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=XUa0czEG
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so383097f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1793705844; x=1794310644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZHfL2fUcvaXyzQYSxt8K4LaojAdVAqjS++SzJlHZY3U=;
        b=XUa0czEGmvB7bB/pIM9MPwojihqqZFMYLJSiHfM5PkFK25MyqPZXDfrjT1/905+xyp
         1/dH3MZiFuYXgBqF8B1ZtuSFl1GPT0ZBj3hubrNnvUHeIoEzlb9OW6TdzArShuBEf9j2
         NWIZSP/In/VhxTrNcZqmXEh/doKDCSLd4nd/FBbRUPy6nss9XQBLW7eAyb2kcT7OrHSR
         KdcbGV69pcQfE667+V7EtrQcKA0Jv2qPc/jmwm/ylgBlT4CDbyLAsO7BDboEHFgEUnEp
         h5SmKXrLFyWLok8jZ+n0SEYTEUxK+Bxmr1tvto34Pbf0CXLz3km39MVQt5si3KbY1b+K
         misA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705844; x=1794310644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZHfL2fUcvaXyzQYSxt8K4LaojAdVAqjS++SzJlHZY3U=;
        b=WcBxpxPNaQ3mhVYGFfWHdSuQIGLeScXE3yBTTtXZe3Q9VmG88YeX2bPZLXIv4Del6E
         AqJYkDlG6n50B9/Nh2W/F4hV8pcneKUpKJjj+r87RQqgqvB63/boK+75LqD4KvmU+CzI
         nwDqW9HxJH2A8ZXKxdw2eBsbydy/Zxxke/4lM84LYQwnGSVIxTzi7P5la1GFFoOV17++
         pJzpURqhwJ87I4HdYwhuz5FDQVACJGdlBUX4OOSzrDsPqRykz0VEU2C4RrI9DHWuJBSz
         6NJNv6zuIYSAoT3oFVZMDY79pBiwo2hXuUF1pp2SKntii6bzGpcexiIH4P7ypoLp0n8k
         30OQ==
X-Forwarded-Encrypted: i=1; AKwUvBzl9PoT0/M7DDGywE4rITiRJ2vmSGXiTL09pylzQYtNG29vI9V/TlrPwUIegxYPiPeIJFdH/JnHiZFfLCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KO7JhgICiQBE8axCDDZcQVJS93IdWY0+KUDmwKq0aYh1PugE9
	QEJPUVKQ7yA29mT1RWSi9F0bf9lfERPC9oYLUauwM9ynNNV4iz6b9SrzFqLNyRcNj3I=
X-Gm-Gg: AYBFou3xtp/Vq6ZhDNIwzCpqkeN/T24OoySAIdTVPZxfbaX/rz+hGQdlXgupyW6tj0y
	kF1ASwbuO0nqiDFvjgAu1oOxI3LW/jgYMP10zsMzvK3BAEg1xGAjKtGtZ5MX4Nx+iMeWjlBRONr
	Q4ExfIumw6tbW+mmph11kz1t0XuAfZmhJmCbtP+oKNaX1s82VIvIMC1kD/Z/TqtEfCSAVTZqfHg
	2skQADK1rt9XJ+vv7+JMv6tM0z+zomahe2zTIEmfpiFnVXXF6+9yTLYKQcTI8VvQnEu0ewiszfl
	q5qSIZ30c1CaxsRtJJl1Bv9M21yxBlv6yN6k0WMDhROZaN2q41mf14oQGwJS77/Gn1Ndz8fvN0k
	hefex+J7Lui6TUc0aof/u5pRKacorvPwyB9MAifSz/HtI98KrSEPhyNoVfdDzetvE9AgwUTbqwK
	fOH6TQU36oSqtF9COFpdIb2G8HngCsvSuRDlk+MKe5dEbbYkYTGN+DIdwssSY5jOIyEGKDh5fqE
	PMJ3IUVZHasW3bNQZ3ETwSz2n9u2af/pmBXGcy/7xQvC6WTyZsCHpdSk7zZjUupHOQA3lqK0m8g
	pbryK2wMqIGRx7VytTgjywkyXK42uVbSzhSy0HSQYuw9ZTEu1dDjFumU6UGAX9ezJP4oCqlGr58
	gVKP6XR+3NgASGTL8OvE8G1z07ILq8g==
X-Received: by 2002:adf:e011:0:10b0:48e:6c3f:f7b2 with SMTP id ffacd0b85a97d-48e6c3ff7d7mr24868143f8f.23.1793705843573;
        Tue, 03 Nov 2026 03:37:23 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm23000997f8f.28.2026.11.03.03.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:37:23 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	hannes@cmpxchg.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v2 2/5] mm/vmscan: move code to lru_gen_{add,del}_memcg()
Date: Tue,  3 Nov 2026 12:37:07 +0100
Message-ID: <20261103113711.1832834-3-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103113711.1832834-1-max.kellermann@ionos.com>
References: <20261103113711.1832834-1-max.kellermann@ionos.com>
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

Preparation for the following patch that adds tail caching.

For simplicity, hlist_nulls_del_init_rcu() is now always used, which
is also valid during rotation, because the entry is immediately
reinserted under `memcg_lru.lock`.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 mm/vmscan.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 9959ca158ce8..aed56d452881 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4556,6 +4556,29 @@ enum {
 	MEMCG_LRU_YOUNG,
 };
 
+static void lru_gen_add_memcg(struct lru_gen_memcg *memcg_lru,
+			      struct lru_gen_folio *lrugen,
+			      int gen, int bin, bool at_head)
+{
+	struct hlist_nulls_head *head = &memcg_lru->fifo[gen][bin];
+
+	lockdep_assert_held(&memcg_lru->lock);
+
+	if (at_head)
+		hlist_nulls_add_head_rcu(&lrugen->list, head);
+	else
+		hlist_nulls_add_tail_rcu(&lrugen->list, head);
+}
+
+static void lru_gen_del_memcg(struct lru_gen_memcg *memcg_lru,
+			      struct lru_gen_folio *lrugen,
+			      int gen)
+{
+	lockdep_assert_held(&memcg_lru->lock);
+
+	hlist_nulls_del_init_rcu(&lrugen->list);
+}
+
 static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 {
 	int seg;
@@ -4584,12 +4607,9 @@ static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 	WRITE_ONCE(lruvec->lrugen.seg, seg);
 	WRITE_ONCE(lruvec->lrugen.gen, new);
 
-	hlist_nulls_del_rcu(&lruvec->lrugen.list);
-
-	if (op == MEMCG_LRU_OLD)
-		hlist_nulls_add_head_rcu(&lruvec->lrugen.list, &pgdat->memcg_lru.fifo[new][bin]);
-	else
-		hlist_nulls_add_tail_rcu(&lruvec->lrugen.list, &pgdat->memcg_lru.fifo[new][bin]);
+	lru_gen_del_memcg(&pgdat->memcg_lru, &lruvec->lrugen, old);
+	lru_gen_add_memcg(&pgdat->memcg_lru, &lruvec->lrugen, new, bin,
+			  op == MEMCG_LRU_OLD);
 
 	pgdat->memcg_lru.nr_memcgs[old]--;
 	pgdat->memcg_lru.nr_memcgs[new]++;
@@ -4620,7 +4640,7 @@ void lru_gen_online_memcg(struct mem_cgroup *memcg)
 
 		lruvec->lrugen.gen = gen;
 
-		hlist_nulls_add_tail_rcu(&lruvec->lrugen.list, &pgdat->memcg_lru.fifo[gen][bin]);
+		lru_gen_add_memcg(&pgdat->memcg_lru, &lruvec->lrugen, gen, bin, false);
 		pgdat->memcg_lru.nr_memcgs[gen]++;
 
 		spin_unlock_irq(&pgdat->memcg_lru.lock);
@@ -4654,7 +4674,7 @@ void lru_gen_release_memcg(struct mem_cgroup *memcg)
 
 		gen = lruvec->lrugen.gen;
 
-		hlist_nulls_del_init_rcu(&lruvec->lrugen.list);
+		lru_gen_del_memcg(&pgdat->memcg_lru, &lruvec->lrugen, gen);
 		pgdat->memcg_lru.nr_memcgs[gen]--;
 
 		if (!pgdat->memcg_lru.nr_memcgs[gen] && gen == get_memcg_gen(pgdat->memcg_lru.seq))
-- 
2.53.0

