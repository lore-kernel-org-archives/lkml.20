Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547173B19BF
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213774; cv=none; b=odeSIvAGTImAKatwyl57iur6gJGkyy2/vGrjcgWmiogt2slDhw1c+7cth7Jr0VtRkAoQ71tm50Mxpir3Z+I+gkNHRu9gV22hr73FjwNKcKg04XROjJco/a4H5kl+RcmlYZyawob23+20Xc2H6pb5ecXKsE5NuMLFqAspMeAJVOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213774; c=relaxed/simple;
	bh=GtwgCIcdUhmCTpOZjA9h2ouHNvm1jXvZOqzlD3teHsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJ9hnO76RhHExGACR8SVnbllgdqyMo8McqDVf4ZRSFCmVE0j8BTkW5Sh26+791esiUBzfnx3i6DcNXbnjlrTBsFIMheeMdyeJH+4sBG7BsQzdEqn/ZGggVxP4fY7gcCxV4Kz/9P71U0N9uEmgSg7p6QMXp8ZQuZlF8Jh9vR4qSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gt5nales; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gt5nales"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so122607b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792213771; x=1792818571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ltltwVBtHl3kghO+WSesRQLC/X/BP4EIFkAkNpxFFq0=;
        b=Gt5nalesXLQ21y3xL7yOJRshONEbrE9EKiuGXeTG348zaTuoivWIvqTE5/8DAC1tU3
         ynyJ5yAxNtQgkPapiE3B8Zy/SDbuM4pk1zcvTHUWgi5wYgVZQGXNFrpMoWt/HMGRuLg9
         yemDEUVB5lxGdHUifXIlWn3TPR9iz7K9MZnKkb5ht3Gld3EJ3Ua1rpi5S2/InIagL9be
         py/WS2tbhQrE+YIY5aUIb7J/1M+ZHZHv8XahCTF37jXPC2tVBlX69Sp82keBrjx+YVw5
         66BUMUAC7ltUBeGxyPigLlRYOU7VzYXAGXY3iUYWNpLRdieWFczk+FYsJ5iA1IqUrb6m
         nEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213771; x=1792818571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ltltwVBtHl3kghO+WSesRQLC/X/BP4EIFkAkNpxFFq0=;
        b=BniNmhKgkgw0PpAUuDCGytmvPYrpRQ93CWiHnihuoJL/iDUBGxw22vV6jBdFYpTJ63
         yA+dZ9Nz23UWq1QwU/OQ5q0eB7aRVdN5m8iwsG7DKOanD8L8y5PfK+IwgbofxpP/porF
         +Kw2WOtlWIku2hckr9+dr36o2Wabc7yGP3bYfgNLfvRiHJ85x7HXKcVAVe5Zwso7S3oi
         qsn+U0w1ZCzE7RxZ3dTU40YJYhYjAp9hWOZNNvRMjsg+fXy4DUvrmgBnbA7bJ6PHImLL
         yzPa/PkaXHi/vYpK0z3Nr85Y0GmfjFBIt18VrpPttTxNlNgLsIJxTLvyfeDB1eaj8T6G
         LsTA==
X-Forwarded-Encrypted: i=1; AKwUvBxD5G3SAufNO6lSS15z8W7bT/wRP72nIWKZgptdiFajDKQJHJm7yxtWcDzOpiW13t8maengC2XOXLoEtCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYILdYJfZwInqvuaNTQPkiolQSYtrv+xnl0sR0UwlwCS6Wj3Xg7S
	+/pShPUOwYZGPADshhlM7xHew47uMuVzdhbjZK0SQul8PJla/QAoxMEo
X-Gm-Gg: AYBFou3qZ3HINqc70t2n0FlDmq8ThnMeJItRpV3bs5PL3dkIz+hD+5t+OIHgT0RSqUf
	BYe+zM4kBZJDqt99JomLSLYb5TzFZ5311Ugj3pp1ufDpe/WDCfFU0fY/P1fJA3uL0BzRuWBj34U
	40d9CDyIl1ysaE9pgaPKjw9AslkBpuc/mmccTZTyGHSCzbr5WK84AcIqvI9gaqU2bI1ynGrXQ7H
	hJ/DM5hr6L44bxS/lGTm6q3Z5bikc69W0R1Chx//KCLMzQF2Tjb/gOg7ILXEG+eniXxC0IrqNOD
	EcRyjyTpe71hhh0xqfltw2h98aqf/7yjhLNipW9G0gEmSkdt12dZgGdh0ME+5efab1CLMEoTJMb
	xwcjOIA/kKAJRV5DDHxK6Om2j++8tLx8Ajm9yYxg/0jv1W4C1wjX95iKQh7kxyY/wZKjCizLpn+
	lhAKjghCKj9tV5NGDoCHkXf1171H0ykhdgM9AtuPHC1QwhaGhx3WmbkuTcV6vKpU0T9rt/h+w6p
	W61JlEGpamcSjrKTibv/N67p2RABl2MVdOEkH1Hp/7tISdQM6ZRhrWE/X0ihTAysqD1SdoTpMbq
	h5lYro8eMrU5CJUC9pUgl6rhFE/eKJBJ++a3PZM/r8GqlQ2y/5QznTQRBNtkrBd4yuOYAOkMXxC
	jv+gLc2VBZQ==
X-Received: by 2002:a05:6a20:d48d:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3e225fe541amr1150821637.17.1792213771457;
        Fri, 16 Oct 2026 22:09:31 -0700 (PDT)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89febdc2209sm1446036b3a.33.2026.10.16.22.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:09:31 -0700 (PDT)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: akpm@linux-foundation.org,
	hannes@cmpxchg.org
Cc: david@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	ljs@kernel.org,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yuzhao@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	apais@microsoft.com,
	rlmenge@gmail.com,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	stable@vger.kernel.org,
	Hardik Garg <hargar@linux.microsoft.com>
Subject: [PATCH v2 2/2] mm: multi-gen LRU: fix NULL lruvec->pgdat deref in get_lruvec()
Date: Sat, 17 Oct 2026 05:09:28 +0000
Message-ID: <20261017050928.128582-2-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017050928.128582-1-sidchintamaneni@gmail.com>
References: <20261017050928.128582-1-sidchintamaneni@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andrew Morton reported that get_lruvec() has the same problem as
lru_gen_shrink_node(): when memcg is disabled on the command line
(cgroup_disable=memory), it returns &pgdat->__lruvec directly and so
bypasses the initialization of lruvec->pgdat. The MGLRU debugfs
interface calls get_lruvec(), then dereferences the pgdat pointer in
lru_gen_seq_show() and other paths, so these can hit the same NULL
dereference.

Fixes: ec1c86b25f4b ("mm: multi-gen LRU: groundwork")
Cc: stable@vger.kernel.org # 6.2+
Assisted-by: LLM
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
---
 mm/vmscan.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 0c57e4f1eb15..99e9f07fa2e1 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2745,20 +2745,9 @@ static struct lruvec *get_lruvec(struct mem_cgroup *memcg, int nid)
 {
 	struct pglist_data *pgdat = NODE_DATA(nid);
 
-#ifdef CONFIG_MEMCG
-	if (memcg) {
-		struct lruvec *lruvec = &memcg->nodeinfo[nid]->lruvec;
-
-		/* see the comment in mem_cgroup_lruvec() */
-		if (!lruvec->pgdat)
-			lruvec->pgdat = pgdat;
-
-		return lruvec;
-	}
-#endif
-	VM_WARN_ON_ONCE(!mem_cgroup_disabled());
+	VM_WARN_ON_ONCE(!memcg && !mem_cgroup_disabled());
 
-	return &pgdat->__lruvec;
+	return mem_cgroup_lruvec(memcg, pgdat);
 }
 
 static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc)
-- 
2.45.4

