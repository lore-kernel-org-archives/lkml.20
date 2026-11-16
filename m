Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816856;
	b=Q3OPgqhBxjeRA2Vtvh1jqgFJBhMUD9FF9IG9asUQRhULj2Y1ROBzQkZnXhMki/I3VeEo
	 6pqajQm6ilQHOelygQ3+bCDjuKExmi3Js1UThd4EAf4pNeBUj0DU1L/zVY0Z6VXRWb8Ii
	 XoB+lNeIMUtWzD2PBgGv66EWf5Ds3GMie3Z53Dw8jwKdMSvcrJKbeXx3tDHyKqgpPmsuT
	 w1QkPxqbSM3a+x5IhCHFzfNAxIlFZbUBtmj4iXWgkerzw6R/j4nO0ls12ZVZOue/vlwGm
	 hWS4zj9xpPEgxRcTcEmv64MeRJE8DBqtyI89It4bbFXJVfHJAfEZWNeUAxQ3k0uQ6HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hykglC9qjGoSXJNJVYRVj2488doF0rYVIjiEwYqGfzk=;
	b=0V/UYUtsNT+1CbbJc7ZHkqAzxbiN1EUDCjlzWWUw+m066XuSOhLF/AhnpLU+jp12uzyZ
	 bVLtjh7mJ8TmWN6s48mfTCY/zevXNiz9C6LFyiGMHJovBVn9K9gZrEK8HKNq/UJSHsnk4
	 Lcr12s8cYRpdF9cI5MDBLLyYNb4Z2JQpByh5ZpFr7qxNZeIx5esG/guPsb2GR/mgjqeyB
	 maIMot9T5ycId36ZBh6swmb9bpsD4BV3fcevw7GT5Inslz2+NwsmSqmCSycd2bAogSRY+
	 9rYfGX9VksaevsC0vb45CyfgP+UaMSJ/HJjue0ROog7i8YddWXhFnQJ/j6fv0rT1Kjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=i11vAehu;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1243B606A882
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1243B606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=i11vAehu
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so7106735e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794816854; x=1795421654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hykglC9qjGoSXJNJVYRVj2488doF0rYVIjiEwYqGfzk=;
        b=i11vAehuAmJvnq3dB1Hf5yiLPYPhqTOudoUHaTJGDCa8M7BZNUFCh6/eXKtRkSKe4N
         2300R2n156bNElRB7xQ3CjXdaWl5nUtrjjpz6l0HQOPviqOJjs0WHeveeHJFl+GHdcIo
         d1VeeF3SMLfngzlGVO7N9VZj0pNFoWrdJAe5XZoyqb9Tk3OnmIEsrQWzF7lT2h+vDN0K
         izhJRJkYkyPzGEnWXHEvTSMqDAST1Oo09rb89VRXCOmwvxdtZwQRtZDt5OVeG6GgPolv
         bS29zy+0TK+fsNBTRCHmoXuKLdm/XqE8D5JAt+PhcveSBApVj55VtRTsecPIHCghijrp
         QlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816854; x=1795421654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hykglC9qjGoSXJNJVYRVj2488doF0rYVIjiEwYqGfzk=;
        b=SSUF2JlJG5axkNXO8GVRCnLDkv67/fH3RtX8l5L6vne9G9qFVaVYXH2WEg/icJ5TaF
         M/CIJGRQ91wY3BQd2UPuqYAtlAQ4TKZRnLa2QiSH0HtHpIYfPkIf/L4omh7KPEXl3+GQ
         5hRo2i/xINmTFxNygT2M7tLkLm/vgP2Rx1m+NAGaIio4wGU6EGliQD8v6MgI9KufJ8M3
         EqOIo6XAivApI9rfMm6+ZNKFyyyR4bLrki7/WgBOT3fn+JVTpRg3oQs6CUCayCnXo805
         cKkFR+9Zk1g4hjW5oA4joZlzyBy3GD3g2q+vCtNwtVJKa+XnbGmb/xm/+4Ru898EE0b1
         frUg==
X-Forwarded-Encrypted: i=1; AL+hErGuJDAr+HIej+ZTRewQXX82rXMwC0cJVfOXyPTRuYiIYzXnsPb3X+GthHNyiU8haOVroqeNmH1V0cDdfd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/etf5+xS7+3wUyVDhUcQnHL3NR+zOEwbnTAs87GRhQcc1yhTAf
	2TvWFKKP61dZnN5ooAr5x8UPPN8XSbm7qXXQTxL79aJUelX30Llwc0uX5Ong5BUnuVQ=
X-Gm-Gg: AYBFou05lbTrYD0z6E1kOeGYykosCb8jOX2GFFzwGpLNNIGPukuZBETE2YkG3JG661I
	Kcg3rB0ux/YibumA3va1Vlwj/EK5mLGA4wpIm6Hp4t1IhxLFU8nZMgEuMA951zIj2h6hN94lQr1
	gOBzIlX7TTbRKQb1tCtY0V1h8i9aIEcQvGftywW1uwfjXImkZMCgqMZMsnpxtpEVWHW0tg8ixhs
	2VnJCAhsI9Wl/aZnKmDFWQCPV+bm50aVXtsf7If3zhnzIhqZoLc1sbeYrRedSNQTEyvHp3u3UZu
	Cw1rGcauI+P5xEGOXo6CTUU9/MSa6+dg3468DjsU70CnbhHBQpJttalY0h69LIkwafYwFYfjOBc
	j8oTdgoalpkl+XQgrfmuCpZIjBej8Q8HnVyqI4g15lBiWhWhmcK5EE+RE8/RI77rJVcfhpsx/5r
	xPbXUOfPLksTPFG98hPnfCnmmIc5qK00i0+7LFPTmR2DHBRhHk6fpPEPoeFIOdTIlsZrvhgPWtz
	sZq/8TaMVuoC1DAEMS79kpfhH1lFcrgbyo5WuW+oJD1y9p0cTPgMwK1ec6gmXA8WgGXzXCEIYuB
	pjJhFvL2pcOXV4BDvzJkp7An9j//mRMGUEdAw/4mAAA+cMWw4Cpd/7eKkgDyKdoygKeITUw2Xz4
	u1fHVYYoPZ6X+7HeP2kqsr06R/s4A
X-Received: by 2002:a05:600c:3487:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb55a4f1b4mr208646975e9.13.1794816854509;
        Mon, 16 Nov 2026 00:14:14 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1797sm22902289f8f.11.2026.11.16.00.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:14:14 -0800 (PST)
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
Subject: [PATCH v3 1/5] include/linux/rculist_nulls: add hlist_nulls_add_behind_rcu()
Date: Mon, 16 Nov 2026 09:13:59 +0100
Message-ID: <20261116081403.216452-2-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116081403.216452-1-max.kellermann@ionos.com>
References: <20261116081403.216452-1-max.kellermann@ionos.com>
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

Move some code from hlist_nulls_add_tail_rcu() to the new function
hlist_nulls_add_behind_rcu() for callers that already know the last
node of an `hlist_nulls` list, to allow constant-time appends.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 include/linux/rculist_nulls.h | 36 +++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/include/linux/rculist_nulls.h b/include/linux/rculist_nulls.h
index a97c3bcb1656..ffbf5ed4ff19 100644
--- a/include/linux/rculist_nulls.h
+++ b/include/linux/rculist_nulls.h
@@ -115,6 +115,33 @@ static inline void hlist_nulls_add_head_rcu(struct hlist_nulls_node *n,
 		WRITE_ONCE(first->pprev, &n->next);
 }
 
+/**
+ * hlist_nulls_add_behind_last_rcu - append after the last list entry
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
+static inline void hlist_nulls_add_behind_last_rcu(struct hlist_nulls_node *n,
+						   struct hlist_nulls_node *last)
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
+		hlist_nulls_add_behind_last_rcu(n, last);
+	else
 		hlist_nulls_add_head_rcu(n, h);
-	}
 }
 
 /* after that hlist_nulls_del will work */
-- 
2.53.0

