Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705852;
	b=xUm+bGYQvbh+aYyuZyv/uUQvOP3ocGhQ1Il7fZj+Ueun6g240oorhuyUWatehQNZXshJ
	 6IUJbbJmm5MqukScLLenUHgkbuFRU4ggqCp0HYbbNKuIPPbjsaNQoB64WUALO4n5HmSaL
	 xoUmTvk183bR1VaDaEbGMEZCOwxN5xAR5FxmU4PehKzsLqL/NzLc87M700FR4lRL+lPMU
	 BaQLw31DtntvNWHPuP0/bW+oNaZJFWbGVsJKz6oboIC+yxRK58a8ghqorU2KQ2PgwgCLL
	 18rb4FUn/CQK76o1ziVetV7lfZCIhX7udmwMcFQPRoxa+NpsFudqkGdi2a8h4XXpZlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IsKP26C+4uK+emKCr1xcjNZltVUV41qm/vZF8BC5G1Y=;
	b=lQn7IMhzWvijRuXmNpNIdFz0wYMv0wTe7kpNYZRHPFksSgwbhOVDVLjHkIEcXM9+az/p
	 QmvxTAO27fHTzOHu9oILGJ4RxUe2nSYpkLN1roiCbxZVT0xR2H5gviCSDqI0Kk7edhad/
	 uk0UWtbESy36Ry6p/pZQg6zTra88BJC2+VUNqZQ8UO6iHExYvL7FYey7LoTADpTGyIpcV
	 tiNjVgIp/H3YmUjVVhynlCU0eGrh9hJeuFPosEj2ZMcN0ZAH3yovgNRg3kgaMsvO8drtk
	 /Egrj3dtGvy94G76vMyRZfQqBsUyQs2ObpzJaS23U0C67ubKGjEVkMAs67xe0fhoGIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=OqnZvdGr;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821F360A2614
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 821F360A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=OqnZvdGr
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2484000f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1793705850; x=1794310650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsKP26C+4uK+emKCr1xcjNZltVUV41qm/vZF8BC5G1Y=;
        b=OqnZvdGr7oKaBQXj79USnk3s8lZBQrS/KMUdL6ZQzFzA1UyHvDX8eY4wNAXYnlpsEh
         0S+U0Mqg+ENxsPh8s4nJZW80ztlQwl1zH79w49YP79ha1Gxe9QW8mLl0E1ZiUoKUuhgq
         NwptN/Ui3HcG3VTOjxYP7fdkw9NHTSJRpWtGPWNPTrRfDvEST/zI7+PYPYRubt/Y83lh
         /o7o4bp8VYv8jcEI5NUgO6DTMiLRcVUHS7bTX9pVIB33MHrXMEIEK76IeYERYstR86z/
         jRrmSqyhimPa5cPENpWuv/TtqB5upXBVtmtNZYb2CqVa/g+5dhgomvt6jK6MbroCPTL7
         Y/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705850; x=1794310650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IsKP26C+4uK+emKCr1xcjNZltVUV41qm/vZF8BC5G1Y=;
        b=eehcs9Sxfa+kBjwjRvL1CPooRsq8B3KQP/RzS48AgPAJ4ySBgs09wxctFLt7JzqgdK
         zVOk5DuJO33vzKrL7WfyQyaIIbbxgBdm5iAqchLtdob1MkhjO/SwAZmGvB0YKDCBA4eR
         VDkVEsY6bLuKCmZtJ++RwNHQjl0010QqgOwxYNqgbRlc05yWzvi77oHAimlPnDJ7m8lj
         XR0VbdZlE1q2Tx2CSn4XEHAL4YPXQWSod8QS066ZJuyYdvOZ6qhom8g31pjj3uxM50cy
         oE13a5kWFJPup+O8N2HrtW5+ClSWQQKTGnXchHazimpreWNL1MNJGOzx213tcLBpxaIO
         SiNw==
X-Forwarded-Encrypted: i=1; AKwUvBwMm30aK6B5tIf3QRX7iJczNtd3LSwpmQePe7ZcUkdk22/9ou7AwMxe3/Xu+AbvAueZP0XJVnbYqGLbKf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wd8T8wvfE5CJCBoxUjmMd8PZK7n2LLgtHXIz5ECwknNC9a29v
	zrbADcmh6gzK3wr+4tOgfdeha0oug2P7Vt/X0TIAVdhcSnOzuiV7eRExTiDLAkTWOQg=
X-Gm-Gg: AYBFou2efR26gcui8zPFG+hbgKENruIANQ9S+kL6Yerrq7GIlL6AJZXYvYyuFc3mlmu
	cTZYSd1hGg0wAiWFb6mlYawsjuSiLPZQTcUQ8WE4VxyKxCLizB0wdvGt0uRAJ96kkHZghNDORn2
	A4rUTlj7GW0e38vdabJgU0gwn1RvrmawIo3qpANUqT4bDdHOrKug9FO9mB3RhMgYQ4i49+LCeel
	1WwoA89IOPkFNJwCAb+wjYbj0y+o4E8cqwcOyqHameVhH/14WAGcrAIZCisLcpceCEIKAO3HiIE
	Dm1QcRuSAqGsoy3Mr1rpFY1eYwDyfHLTJuITUfwgNhspT/+nRUMaNs5ZZwJDtVvp9B65a6c0Ykv
	d71Pru/MPY3qubAC/XYvwa/E7kXfkHlb8tq1dC1fI1UPO+GIaJ4Gf7vggrMGMXaPg+J9EV7LFXr
	DWVf9p9DzBMhlRgNNGoALOYkNsdaNcaRTzJSV2ZkTT1P+V17o2N8Op1peeN1V5srisezsi6pqdq
	R19XJWWlV3dKlJadKFPc4LcC1hHSdkGUtft8XJ85OxzOUQfvAuegpWtcmfiNZfeMIy6HZlj/V/r
	GkKt5Gw9vExhpjKadr8U1ZTLI9zVtUS3M+ZNlCPN8jlWCjs16N1SYpp1/iazRs3hrqgqoa1v7F0
	D0F8RCLVsTtaN9xg4CDAgVQ0fOr7dhw==
X-Received: by 2002:a05:6000:240e:b0:48e:76ab:78f7 with SMTP id ffacd0b85a97d-48e76ab7f2bmr21607663f8f.20.1793705849795;
        Tue, 03 Nov 2026 03:37:29 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm23000997f8f.28.2026.11.03.03.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:37:28 -0800 (PST)
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
Subject: [PATCH v2 5/5] mm/mglru: reschedule between memcg reclaim attempts
Date: Tue,  3 Nov 2026 12:37:10 +0100
Message-ID: <20261103113711.1832834-6-max.kellermann@ionos.com>
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

shrink_one() can return immediately for empty or protected memcgs, and
try_to_shrink_lruvec() can break out before reaching its
cond_resched().  A scan through many memcgs can repeatedly rotate
entries without giving other runnable tasks a scheduling opportunity.

Call cond_resched_tasks_rcu_qs() (as the existing shrink_lruvec() loop
does) after shrink_one(), while the memcg reference still pins the
cursor and before reacquiring the RCU read lock.  Also call it between
bins and nulls-marker retries, covering scans that skip every entry.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 mm/vmscan.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 899f756bd15b..5dc5e698e243 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5395,6 +5395,9 @@ static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
 	gen = get_memcg_gen(READ_ONCE(pgdat->memcg_lru.seq));
 	bin = first_bin = get_random_u32_below(MEMCG_NR_BINS);
 restart:
+	/* Yield between bins/retries that contain only skipped entries. */
+	cond_resched_tasks_rcu_qs();
+
 	op = 0;
 	memcg = NULL;
 
@@ -5425,6 +5428,14 @@ static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
 
 		op = shrink_one(lruvec, sc);
 
+		/*
+		 * Empty or protected memcgs can bypass the
+		 * rescheduling points in page reclaim.  The memcg
+		 * reference pins our cursor while we yield outside
+		 * the RCU read-side critical section.
+		 */
+		cond_resched_tasks_rcu_qs();
+
 		rcu_read_lock();
 
 		if (should_abort_scan(lruvec, sc))
-- 
2.53.0

