Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816860;
	b=kY0ojA/ol9uP6r7AOoVf3MMAR5JVGXdFXFLcEFquRm3B5a9fRkaHCgnnQ+CvHAT6Ni/Q
	 +1n8SgD8hQCkaI1OuUcncMy6nzDHYL2Mj/r5bXZyupkGQ4anPwF9Ij3QdDJkf8XO0f/Tl
	 4wMUqIL5GB8Iedod3Y+O0DJoLIlSjIBY+hXSamuF0WsEFUmc9PhVrqjrHSbi9OP4bwTsh
	 SL1YsDCXAUv1BOEwx4cp4q8Ur1RofPoki40jpu4nerTJySwSaa55RfceaueGOLj1QiroT
	 VJu1KUBcoqXqTRbXjEsNtuC5+xwA492dIerbDDEGUqgUfaES/TgllmDDSCpUnCLJHDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rgVoS+4faU3bxp5jftE1mXkf/VtghCyzl7UmbElyWsY=;
	b=KFAD0CSQcL/4nz0eNf4vejzUXT4kneM7flFLXUEsT5q5YANf3lpi1AX9tu+0mQBnrWHa
	 vdjj3QvTZDbmsJKbMDLB3ALIsAgVmeBF+/L4kTgEKZ0nmvzJ4TkgzbaK/YsAhamdvt95j
	 tRpyyQD6fvgF03ShUaHqNhppOOn9PQGzuy7fKbtujqb7J4J1gxlewUOj9wVQzQLT1yO8C
	 8nQtC+FOmn9FKus23A8bRO4p4Ys9kgJUZVBOa2lZxcLxUajm8Nxi88YUS4RtvxTVy19ZX
	 zkvV49ym3HUWCvpmwglRlk0lrHh8EQ02tDl3WDxKIBI+ZRhFam5oDtf673EE9gcuB9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=CTJTJ2ek;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303BA606A8AE
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 303BA606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=CTJTJ2ek
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1416476f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794816858; x=1795421658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgVoS+4faU3bxp5jftE1mXkf/VtghCyzl7UmbElyWsY=;
        b=CTJTJ2ekl0YEb/6Z4dumwuhmbJOftlbsiG3oEW99VXkrBtp+wVph2NYJyy0ECmUE81
         dW2dTaR4FVJLIvDeXRBADvGy1KrMpFSuEh36KfzMnJ2vErpDGDAdfCJuvLc0AOZgq1Ra
         Z1t+akA+v3yKDfWiIVIAovQZXHHk7nMLrceDigUpfKm/hvfPuCqADshoPnvLnLf7R1wP
         EWZ8FqlOvA5eg72Npm2+acl70Y5w+8diZ46x3QqfA4tIZMa0XiWJSs8sSK1wIg0cYPfz
         u+SIu3/Gcpw9F7O5pjbogXdkn0KIK2Jo8o2Wis7DRyNzop+LKWdgtb8Iy3cwBvSGhock
         rMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816858; x=1795421658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgVoS+4faU3bxp5jftE1mXkf/VtghCyzl7UmbElyWsY=;
        b=xRikV2f6Fvs1iUFXmlRC434Ph741g/BdMLOq3sAwiS7ewlpeP8GtzybKER7ZLv/gx4
         MS/8P+GFQxJ/irMZryfwZwODJElqPUhClMZ/0CI/nUzUOclrwNDnUDQZuHi10s8oemdV
         oKMn5qzbAdGecTHIs2bNX51FBwCcCaUFPZkhhhN3YdKHHxxGx3C7q4Ug4zDzK2Umrwni
         MRq1NHwZAd6461RJn3zp/9FcwpB5mGJTmi1UdFHFYw94LSV9pOMGKJPvikmW5kJsZWoM
         AvpTwT3/Js3sQ8TP44rHy6IP1o7Ip1K88JCZiUMow6aP44gXWpz3eYskrv2uLRP0DCc7
         8rcA==
X-Forwarded-Encrypted: i=1; AL+hErHr3rkVqJXIk0cNUAqxZwsbQW7jENAC3RLPzmIQl5/p6koqB2zehCfOl8nR1E5KUfslB5c+kgZwbdV/9HE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m/6G5AzHMYrOb4KDpcs8U4CXRXeazJDklxTyoCNiav2o8Ewmq
	jnVcxlKjdP26s06C3k4MGUAcTrytb2wwTg9c7a0b5jLoE1fZtXIOnZFvValV0rfZ5Y8=
X-Gm-Gg: AYBFou1RnZXLjTt+/K2uZb7Z2JYknI5O/FWHD7ZUQ0HbufyK+OMHfKmBw5aMBTEVpH/
	Y5/B1LQIgoXBLbI4Jjaf1H/hs4lK1bzWfaeVjV7GL+EHeZT33WuP0HLfD+/z/+k3WdYysLlR9Ao
	VMnKoVeslKBCBoA4UGBoAX/ihP+sVIuV0SpURFN52AcrJvW8jqXfZt0p0Aq4nSXW1jFt7ROXQxx
	2hOZRzlHII13hfNipF+HWx5zphci9iUukpaegmXwjMkJ5Ku3iYMaAF9dlFiwrLZgHnbSk7flVhT
	WEHPh+9lp0LTpTz8ZD6f3gjwxhwyxbgZHoPHjpH7q+tNOfA8acqDjTUpU6cWRRG/w/XWHLvQHeC
	mLYjNMgwK2xgVCU6/2kXLxqZMacJIN7xqfOngKjs2+wa26eK0e/hz2jYkjI5NuikjqRMy9Aim7T
	h39Wwc4AY9P+sZxn7eaNRiZQAkD6FX4Ul9b2SNphcirmnJlpBXjDCL8eKbcqztDaScRyR/FPTqE
	d77TZiC/LoiVUhVnfdj0CNydnJa+Vcm8Tbsu5JZr7wD1vR8tJ9dIqiTDA1/HFtZ7b34GYjkh759
	G58TVy82S6e79XBlT9bmjpoOXJ7GiCe9UgaUQKuFQrQHM7SI5qXCIWtGkEVJa2ID9QI+lw9M9wH
	RL46GkuCB2glCf2cwDCnB6xW4c0Ic
X-Received: by 2002:a5d:64e4:0:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-49c7381b46cmr23102640f8f.25.1794816858364;
        Mon, 16 Nov 2026 00:14:18 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1797sm22902289f8f.11.2026.11.16.00.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:14:18 -0800 (PST)
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
Subject: [PATCH v3 4/5] mm/mglru: avoid redundant rotations of young memcgs
Date: Mon, 16 Nov 2026 09:14:02 +0100
Message-ID: <20261116081403.216452-5-max.kellermann@ionos.com>
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

Concurrent reclaimers can request promotion after another reclaimer
has already moved a memcg into the young generation.  Requeueing it
into a random bin again adds list mutations without advancing the
old-generation scan.

Therefore, skip `MEMCG_LRU_YOUNG` when the memcg is already in the
default segment of the current young generation.

In my micro benchmark, this increases the request rate by 36% and
reduces the average duration of each write request by 27%.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 mm/vmscan.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 7cfaeca9a605..6b7c9f118e18 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4472,7 +4472,6 @@ static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 	int seg;
 	int old, new;
 	unsigned long flags;
-	int bin = get_random_u32_below(MEMCG_NR_BINS);
 	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
 
 	spin_lock_irqsave(&pgdat->memcg_lru.lock, flags);
@@ -4490,11 +4489,19 @@ static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 	else
 		VM_WARN_ON_ONCE(true);
 
+	if (op == MEMCG_LRU_YOUNG && old == new && lruvec->lrugen.seg == seg)
+		/*
+		 * This memcg is already in the young generation and
+		 * reshuffling it again cannot help the scan of the
+		 * old generation.
+		 */
+		goto unlock;
+
 	WRITE_ONCE(lruvec->lrugen.seg, seg);
 	WRITE_ONCE(lruvec->lrugen.gen, new);
 
 	lru_gen_del_memcg(&pgdat->memcg_lru, &lruvec->lrugen, old);
-	lru_gen_add_memcg(&pgdat->memcg_lru, &lruvec->lrugen, new, bin);
+	lru_gen_add_memcg(&pgdat->memcg_lru, &lruvec->lrugen, new, get_random_u32_below(MEMCG_NR_BINS));
 
 	pgdat->memcg_lru.nr_memcgs[old]--;
 	pgdat->memcg_lru.nr_memcgs[new]++;
@@ -4502,6 +4509,7 @@ static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 	if (!pgdat->memcg_lru.nr_memcgs[old] && old == get_memcg_gen(pgdat->memcg_lru.seq))
 		WRITE_ONCE(pgdat->memcg_lru.seq, pgdat->memcg_lru.seq + 1);
 
+unlock:
 	spin_unlock_irqrestore(&pgdat->memcg_lru.lock, flags);
 }
 
-- 
2.53.0

