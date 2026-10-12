Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F718421249
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791838509; cv=none; b=E3REriLa8Q2JHrEhahhjnTFZfuDI0YckAyfIcMK2fTxKltI3Ir9twZ2bhVYECAeV9iFyicNku+LSJz6ushieTvnHgsH9d1KP8Zgs2HlPRuv8Hbj9a+Q1iRLCDcdb6eWk6xVajbgGtwZ8owti+UzIv8gqfKL/cxw0ooaeG7XioYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791838509; c=relaxed/simple;
	bh=CciK8lvZmWf5lp69k80//3LtnHj+NJqLm52ZmNUBerg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1bBGVHhLBy/CdMl1ySxmHjLZD8cGA1uGHrNG6YqK/VAlWdMZa69wsJKzZhYe6vIy6ehr0ybH4PKvC9I5ILBUE7zXd/WIUluKjdpHUlQYyKB1mRptA1N7WzSvG4FE5scZIDb5AYo/0fg0N3OKh0NxebsL9zk2jf3HTaBstuptxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Lh9ykIcD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Lh9ykIcD"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48af27fe287so1967147f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1791838507; x=1792443307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Wqv1pEc3eUHWVa1vlKnSnpZ/TcSKODci0Njc/4Uwzs=;
        b=Lh9ykIcDWWJb+vdyzf/DIZJ6moMobGiab8pmbAtZ0wBDHV24O2F9ZOnKie3pFNAJSB
         sFpiyUjMn547mdg2kGmQbNrPGvD0Ps5oB5Bd49lhGbnDrn9GVyb9b4X87ZxzhMiuF+s3
         7i1AfaW9fSSzuza/eZk1hlNKa/9HV64N273Z5y0qqFZu46wYmibESEqNk2dCroUcGEMS
         kKOnr6TRtZORaMZe11ak9ibUcdqg83v6EDpBRNxJ1RreESVb0Zu8t7TsUVr4s/wE9hlS
         Tn4RwcYmLKvMQEtW9T7b26+N9Pupj5bPQyxSZfqdQ0TDeAKXsqKOZfo2phNCMlWylaQs
         Ob0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791838507; x=1792443307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Wqv1pEc3eUHWVa1vlKnSnpZ/TcSKODci0Njc/4Uwzs=;
        b=ijKRJTkVeQ8nsuA7R3gUdZmIBtQyUlZsNd/x5VDH/AFKtH8wGhpLQDMYylPO5QKOiJ
         UzdZbgg/ibeEp0qI3mancjhAyNafF4nHmMmKDLWHLJM9v7QCMJUjeRXHs963c1wsyNmn
         cgFed14Bsz83grbWOoiSwW6SfoN7+aItlIWxYlRzZIKY8khv0oRgtueYFFI8gDUPtVhg
         tT1+2sGtWKxN0GMSc6Ui787JgQGfTDRadjcUFciCHhRl1E8hbkn4EexV3SMj0LzpwGVG
         CtMqLfJj3e7EMDjVM4/FjQskoNOqgdTYq/eH6Rp1wJ6SMaJXc6p5gnS8uB7R7mF+seZ0
         8u1w==
X-Forwarded-Encrypted: i=1; AKwUvByHR5JPiKmZCZPPPXZigZsUzmIuSjtu78uVx20V9Xesn36AG42nEZe3IJFF1HV8yhVXWgsO+6bBagEuZbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzEuvdKQTLmJbU02Uy7k4d/DvcZzWGqbj/na77ygYVioMnIzX7
	BQrc8p3DeN9P55tz4dGWFfZ3pZVP/d5Vk9fxSJf7sWpyqGYcd1XvpGRBBwbWn28o9s4=
X-Gm-Gg: AYBFou2dzkUES7SEFIYr/MHk4fVYkNTPR1FzWcim4hq/CVjpL2+TtdvhJYMKxXe9nCX
	aix4T+aHlVRjMIVHsFGxDCOQ3/KNlPPrmB1JDhwHiTpxNRDMf2iAsq0iCcxRghc7LgWWO4D/cxg
	ReGeosZjn3GrRsDC7Ssphcm9SwSd1u5iixlnQhiqunbWGx5njMXG+03DCsdn+TYXk0X6jg8m4hF
	yd5xOGagCt3QJ5+ncO+ZHiaCS0Nn5k8XjJkKll/jl2qpz06IqnhH2+5ZLjgLSPQFjm47y0c5FSj
	dJQsosob/zytvScCgdoHMdC+lvobi3F/6S4X8ay2xvuiQBgm14sl/FtCYS14RMfgtWhsp+5pDP5
	N9ejKu35t9qPylR48GuslL55392IGosAznguHxwjgF2bh5kvTgYU8VTsqXVvqh8jPWwBhvX83i1
	24CBeIJ7fbmXiDKLlKJMCA0HJSx4XRKvlkvCoOopuPROcBaUDvYdksOYDtXalLxwp/Bs1a5i6f8
	x8lG4h+KttFiOzAMi8wKqLYduCnnDgHVXV5Ecyiq9uN8JGE5fjAXWMQELZpGQARneZi0dLo2Zg=
X-Received: by 2002:a05:6000:2505:b0:487:27f9:840 with SMTP id ffacd0b85a97d-48dbace65bcmr20779470f8f.53.1791838506637;
        Mon, 12 Oct 2026 13:55:06 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0514ab1sm1895744f8f.0.2026.10.12.13.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 13:55:06 -0700 (PDT)
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
Subject: [PATCH 1/5] include/linux/rculist_nulls: add hlist_nulls_add_behind_rcu()
Date: Mon, 12 Oct 2026 22:54:43 +0200
Message-ID: <20261012205447.2717801-2-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012205447.2717801-1-max.kellermann@ionos.com>
References: <20261012205447.2717801-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move some code from hlist_nulls_add_tail_rcu() to the new function
hlist_nulls_add_behind_rcu() for callers that already know the last
node of an `hlist_nulls` list, to allow constant-time appends.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 include/linux/rculist_nulls.h | 36 +++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/include/linux/rculist_nulls.h b/include/linux/rculist_nulls.h
index a97c3bcb1656..054e477dd093 100644
--- a/include/linux/rculist_nulls.h
+++ b/include/linux/rculist_nulls.h
@@ -115,6 +115,33 @@ static inline void hlist_nulls_add_head_rcu(struct hlist_nulls_node *n,
 		WRITE_ONCE(first->pprev, &n->next);
 }
 
+/**
+ * hlist_nulls_add_behind_rcu - append after the last list entry
+ * @n: the new element to add to the hash list.
+ * @last: the last element in the list.
+ *
+ * Adds the specified element after @last while permitting racing RCU
+ * traversals.  @last must be the last list entry, with its next
+ * pointer holding the terminating nulls marker.
+ *
+ * The caller must take whatever precautions are necessary
+ * (such as holding appropriate locks) to avoid racing
+ * with another list-mutation primitive, such as hlist_nulls_add_head_rcu()
+ * or hlist_nulls_del_rcu(), running on this same list.
+ * However, it is perfectly legal to run concurrently with
+ * the _rcu list-traversal primitives, such as
+ * hlist_nulls_for_each_entry_rcu(), used to prevent memory-consistency
+ * problems on Alpha CPUs.  Regardless of the type of CPU, the
+ * list-traversal primitive must be guarded by rcu_read_lock().
+ */
+static inline void hlist_nulls_add_behind_rcu(struct hlist_nulls_node *n,
+					      struct hlist_nulls_node *last)
+{
+	WRITE_ONCE(n->next, last->next);
+	WRITE_ONCE(n->pprev, &last->next);
+	rcu_assign_pointer(hlist_nulls_next_rcu(last), n);
+}
+
 /**
  * hlist_nulls_add_tail_rcu
  * @n: the element to add to the hash list.
@@ -143,13 +170,10 @@ static inline void hlist_nulls_add_tail_rcu(struct hlist_nulls_node *n,
 	for (i = h->first; !is_a_nulls(i); i = i->next)
 		last = i;
 
-	if (last) {
-		WRITE_ONCE(n->next, last->next);
-		WRITE_ONCE(n->pprev, &last->next);
-		rcu_assign_pointer(hlist_nulls_next_rcu(last), n);
-	} else {
+	if (last)
+		hlist_nulls_add_behind_rcu(n, last);
+	else
 		hlist_nulls_add_head_rcu(n, h);
-	}
 }
 
 /* after that hlist_nulls_del will work */
-- 
2.47.3

