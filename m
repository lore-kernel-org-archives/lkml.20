Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439649;
	b=OlksFHyMcN/V6L2Ttvv0ldoMTWbgr/+7S4j5cOrbWvdgmZjF0EG7gvS4RpwHj4B2p+Nw
	 IDbfqjf4F5wtZoI85sAZmDn8E1SQc2xpCwfkZcv6UHYzWL/U0JhSsf8MlAAXmF7lJ+h5y
	 3VTe5lyKx1AFOOmqx777TeGss8Hq+j86jw62MUY1eO3oCSEC5IUlT8vCXAT+6mER4nfQH
	 Ceo3p2dJivoAeGYCZds1n86j/YMcdOCMci1lojitLiaf93w2KV8Q64miglnbC0rVGdeJB
	 fFD2Ap1yJxRuBz1PY0Qrz6Cn99smw3Yfr1Ue1e+znF7+iU2srcK5SFyHIbcZp67T8nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439649;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=JZBM3NrWmK4G15j5a9/krNPcLaE3+tRd4nj2PVM6AVE=;
	b=1d/NcmITXet5cs8qVBBqNxzfdA5QSQrOJ4etphNqFBRCQGQIQ5LjI6HkgpRuBrsiXZiO
	 zO3pdrdHQDugYQzKjzlbL47KRyBYXPAs8pRrukQNQfNyC2a1uyrtGsyngVDSRR4dNfxcc
	 Jc1aWh53RSEWeal+t5YTbfN0gg/UvlGaAGGA2dTGpPDniQ4WBuzWG4xqOmfuaFg+PpaC0
	 fksRKxWPcyTiFhJixArM2oC2PeeaFEYmeZdZsknqykdEB2apUwSWoWRrs20eq33fUQ90L
	 iCpsaLmqAduaJXtIPfpFrpfEOpx/E3LPbuDMPJkP37/UzJzTCXsw+WJgDBbjDncSrfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hqp0ILCS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2983B606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hqp0ILCS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BB31F00A05;
	Wed, 11 Nov 2026 23:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794439649;
	bh=JZBM3NrWmK4G15j5a9/krNPcLaE3+tRd4nj2PVM6AVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hqp0ILCSkA7e2MjVT0OZ12JkedO+01e//c3P/ZYTuS0g33GKczArv2nJjPHtod4Ze
	 WgHQMch5y21GKkJYaNuX+1v23u3KHmwD8R9sGQjBTQXl26M3XGvi2x+apqKGt+KV1V
	 wusgMtJM8sy/tAhu4u+ec+vBai2TY7K8sfoSUBbbF+KFzJ85G/PDSYry2L8Bo2x5pm
	 /v5hOzXCtgMfpkY/r8MRYaW1SWQQhcCgFQwaprGP4RWM/E6bcYqUPhP3c95hlv06Le
	 wW1ESXSeyvuAhYgbZKLK5EuHMf35ZpAPB6iO439oxFxpvoijKSDeH9rSzuIIYafap6
	 REL55T8E3jBvQ==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	hannes@cmpxchg.org,
	hui.zhu@linux.dev,
	kasong@tencent.com,
	kunwu.chan@gmail.com,
	liam@infradead.org,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	liuxiang.277@bytedance.com,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	ridong.chen@linux.dev,
	rppt@kernel.org,
	ryncsn@gmail.com,
	shakeel.butt@linux.dev,
	surenb@google.com,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	zhuhui@kylinos.cn,
	sidchintamaneni@gmail.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [PATCH v7 15/16] mm/mglru: Make swappiness=1 file reclaim more aggressive
Date: Thu, 12 Nov 2026 07:26:02 +0800
Message-Id: <20261111232603.9934-16-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261111232603.9934-1-baohua@kernel.org>
References: <20261111232603.9934-1-baohua@kernel.org>
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

In MGLRU, swappiness=200 favors anon reclaim, while swappiness=1
favors file reclaim. Swappiness=0 allows only file reclaim, while
swappiness=201 allows only anon reclaim. Thus, swappiness=1 and
swappiness=200 are counterparts for file and anon reclaim,
respectively.

Before this patchset, get_type_to_scan() always returned
LRU_GEN_ANON for swappiness=200 and LRU_GEN_FILE for swappiness=1.

For swappiness=200, file_factor is set to 0 at higher reclaim
priorities. Similarly, anon_factor is set to 0 for swappiness=1
at higher reclaim priorities, making the two settings behave
similarly, although the thresholds are slightly different.

This allows file pages to be reclaimed more aggressively and
benefits workloads that prioritize file reclaim by using
swappiness=1.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 3872305bac2a..d51303a5cb67 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4945,7 +4945,11 @@ static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_control *sc,
 	anon_weight = nr[LRU_GEN_ANON] + nr[LRU_GEN_FILE] / size_bias;
 	file_weight = nr[LRU_GEN_FILE] + nr[LRU_GEN_ANON] / size_bias;
 
-	anon_factor = (u64)swappiness * refault_rate[LRU_GEN_FILE] * anon_weight;
+	if (swappiness == MIN_SWAPPINESS + 1)
+		anon_factor = sc->priority <= DEF_PRIORITY / 2 ?
+			      refault_rate[LRU_GEN_FILE] * anon_weight : 0;
+	else
+		anon_factor = (u64)swappiness * refault_rate[LRU_GEN_FILE] * anon_weight;
 	if (swappiness == MAX_SWAPPINESS)
 		file_factor = sc->priority < DEF_PRIORITY / 2 ?
 			      refault_rate[LRU_GEN_ANON] * file_weight : 0;
-- 
2.34.1

