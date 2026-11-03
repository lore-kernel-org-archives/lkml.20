Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705849;
	b=cxAx124q4OWSnu0zn5GjfOPtFe6hyoYSj9fzedVdXvwJuQoR3BLGd1pERJXllZKOhVL9
	 GRvetDHzRlukRSLbephHOEjcz/FxXTox6RrQgTVlx34qoSOCqDMuOjFd5hyV7B40S9GG+
	 hzAYRaco5wdoy1n9Bt+6gsouh2Uft8wXJgHlpUVChoFzQjaOrY5riUPDoT796GzJZ/PGS
	 6CzavogKMXQGoLNMIDzj/xQaa/BBP4dQC3GUmMZBTR40pssJcxX/UOuz7TuKKkKJiIn10
	 DNNRSLiPA767QgeXTgpvsZhx5lwERmlVHmi3AiteZzaipAgs0Yy5hDnDCZcNlFEhO8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SwDDfs8eS2UrIyJ875nz0ilkf79JUl413gKXLxgd0/A=;
	b=Iwe6BIgPj3R7eFi1jzpjzYD1Rb0eDcq2vRGAYT1Rx6XaGhfdIDfYHnwBvOrkRoBZhCfc
	 cjSjPKkdsh590VprFGu4HxQMurNLnpuy9L9S0jsmsqW2WOGT+LavszcDkauupOLA3mWVy
	 TZ4a31jho5FSOS8mqVzpPW5czDqd8BmhZMX74LXfP+AqkCVec0IZ+83DRFiraTSO+/SAA
	 VCTeFSjmXnh41rYci0QcufLtxLB7g24DQ8cYOMeEKovat9vgTQYhEJBoZHLOE2g4IjUKl
	 aHBq4mpTgiDOrCtBNJQ+Q04CEuqSjl6JOtNVogekH6ZqVyX1jB2mtoUmjmXv0y5BSNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=B5miBP30;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFA4608360D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BFA4608360D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=B5miBP30
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3193619f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1793705848; x=1794310648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwDDfs8eS2UrIyJ875nz0ilkf79JUl413gKXLxgd0/A=;
        b=B5miBP30hXqwh/4dXSrYtoEd0RPDsXOtTrsEQy8aifRuN2FNnv3lMB8ZA/voKyHE4L
         sHP3jM3uBIWs7dxmwwKmzJFGmP1c7OjAonmr11P3fAJazZnspPxssii2Toj6lb3GLLq3
         tHf/LLpWcHrgbhGG2fyCXHYUoRqEWiKqhK9YbMC0DuXekEVpbHJguDadjPvgXB2Qtedn
         JArOf5msr9t7pzgpQEcqFMTj4oELKBi3/+yX4tBska95hF8jHWJNq9hozStEQM54/ZzR
         nWnpuzFXWz5jk8k+s+iZ6JIekWQMAHj4SQ47HObmNuNsOOi7yINqB0V2YhN1hve/It34
         MYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705848; x=1794310648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SwDDfs8eS2UrIyJ875nz0ilkf79JUl413gKXLxgd0/A=;
        b=e6RmdlL5Eb0v/GzFVJyLbPEvYjSpO6DGHWya1Zc6KruB4srALSR6Ddlfhvw277SHV2
         u1DsTib1gd0wVO0MsrkUsXV+W/+LXLRCSCrWea+60SJd5AqH94LhTpyLPBgtwqnwWcLP
         RZ5mRFGqGk2+2QoojERMw+rS+6F4uRgfC08zvu/OLLd49cTMDdmlXgJf59pzYyVfmFUd
         NasCCqfSO1DGP5ywlhnR7uo43BmNCjVJY/HbpclGui0JYvQIdldmvPOrgy/H2fqDYxyY
         /YYnfTr5xd1c0HGHarRD2rj2S5CxO0hPZvES/tAZW4aRwMRTWT+z7mELdK6WBHA9RugG
         xU8A==
X-Forwarded-Encrypted: i=1; AKwUvBxJHHD4Sp4JY8l0rJokfJU3tHCuD6K9FEcCqjYP1eShnie32XcFNVniGNzZpMEx+wUave6mus9K5zB+paw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e3Vvs2/eZgrDhC8fOevW/6iwsrSfcI8o51ra5mjunj8r1j+kH
	WUmVoGee+ULGV1DCNSIXs174WvKzsjo2NC+iCDcLmKnYb4Qa43fKyO9sN4PXmsbsusQ=
X-Gm-Gg: AYBFou09+I1I8onoUoqxQZC3VOO0ElDDYfkh+bldzVNyw9QAwwLlGnbht1cLQ3ANLp+
	ces41p/k/vMXwHA26hMFcIAAH9EQXgmrbZYGFwfUv9PFxfrBoACHTXg5YAxXz4pRx/gxdu/CkUy
	SC9/+VvgOZiMtJOJzJrsZN7J5bwTQA6vw3LOf1w/XTTBPQu3lByD8fBUJEjRGZcZPbV86BUMREl
	SjXxGAQV7AZeM2en76rk/sikogOHSv8JVCVH+UkTspvAiGVmyqMyl0vdhBbBGxNiBn85xhqN11X
	CLhkKt0pK+/+9zHHgqIArVqVbJr2ulNEI6r7uNDczrGPeeFMzhh+JK6kWPk5T/9fZ8nGO8pjK9v
	eEezt8tpUvkNDV/gWi/m7frztnArYsz54ug6GMM6PkI+r6mttuMJx0ZwmcAzVtfRB0A8e/k3+TY
	bZ0Wj/ZKEZ3j+zFFmAY7xP0IKdNdAsa1nW7YV0TNXbBwx6tiUk4qJfFPcQ5Q8SRnto+AbRo+oOE
	YVWnsXW+8rKWnK0XmsXSLtHHp9YQRlhifDcYiPM1HvY/v8RIiylSOCb3lefiyuJfKuxxWBUID3v
	5zs/UeAvuy3NQY3xzLDFF1Cbu2nlHL+CoCwWc+CgFBZf/Vx0Ze4mIoxSv2JzecfgJJXvlZ0tYUk
	Xx5kq06P1oNSbjmfEaag39cawTNw+MA==
X-Received: by 2002:a05:6000:400a:b0:48e:4115:f3e8 with SMTP id ffacd0b85a97d-48e6e50096emr30315688f8f.27.1793705847639;
        Tue, 03 Nov 2026 03:37:27 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm23000997f8f.28.2026.11.03.03.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:37:26 -0800 (PST)
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
Subject: [PATCH v2 4/5] mm/mglru: avoid redundant rotations of young memcgs
Date: Tue,  3 Nov 2026 12:37:09 +0100
Message-ID: <20261103113711.1832834-5-max.kellermann@ionos.com>
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
 mm/vmscan.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 3075949bf641..899f756bd15b 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4620,6 +4620,14 @@ static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
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
 
@@ -4633,6 +4641,7 @@ static void lru_gen_rotate_memcg(struct lruvec *lruvec, int op)
 	if (!pgdat->memcg_lru.nr_memcgs[old] && old == get_memcg_gen(pgdat->memcg_lru.seq))
 		WRITE_ONCE(pgdat->memcg_lru.seq, pgdat->memcg_lru.seq + 1);
 
+unlock:
 	spin_unlock_irqrestore(&pgdat->memcg_lru.lock, flags);
 }
 
-- 
2.53.0

