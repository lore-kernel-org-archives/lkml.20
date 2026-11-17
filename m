Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.77.214
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884361;
	b=RO5mSF3xOYlVWJe+aGc6rgdHHdNkOCFKJ5M1PVfHMiX8imLENsci4iNYhha9w8ycjyLy
	 sikBKuCsdbkOBZrtAEHwP4cRMy+396ZvaP7BtcZHfqGFUoY5Aayd5mB3mdUkpN3XVNc29
	 +nhfDWu5jCNiQ3EPtBG0lZK2SsGd2h65TpvFLs4NeXNeGBhRf3UGsGCa6Ine0jaN/IFNu
	 chpFZpsCLelpi5VYCE9PcvpZ/agX+k8/ztfy/i5g1WxwfQ+X+0pFedQNIjm3wJoafKeHL
	 TTTb58wiH4iGbdbRHJxuUSPBU0vePNPkcMu2cxZkqTui+1h97RRslKjJwiLxcK6PYrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884361;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Info-Out:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-JNJ;
	bh=tpP/9ykze2yQgtX589hLaB/y2/t7gDNGvWd4Bq6PVDQ=;
	b=QlSMGaNAVlUWsIMcYEkbC8V4yKsmbqlX4wFGQbE1Gfj4LsyXPs0BwwRnZEEVXDEOW4WL
	 UOGKBfttii4ANn+wNVPXn9oWHqQBf07UqYpsoNDTtnbaTbqz2Lg2zlILRLuO1XBgn5Fk1
	 dyTHyh48LS9G97oynYeN7Uyqr1cOSUtRdtMXzd33R8SqZSt1GGGKMxdpplDZ8KGyljEon
	 xZcnSz4gXXJdIrl8r9HHEtDfXhU/+c3IRQ2f51C2davrG8X39JZD8a8w2HnKEzdVm9Si+
	 hm3szoXdNcCUWNlU8fciF4aSPSMBVhLSfbnQ6H6zvJeK9Wwl/V5zEnKS4eYoA2M+tyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=kttlQ8SJ;
	arc=none smtp.remote-ip=57.103.77.214
Received: from outbound.st.icloud.com (st-2003a-snip4-3.eps.apple.com [57.103.77.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB559606A8A1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB559606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=kttlQ8SJ
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-8 (Postfix) with ESMTPS id 107BC180012C;
	Tue, 17 Nov 2026 02:59:16 +0000 (UTC)
X-ICL-RepId: 01a1e771-cb79-750d-8e4d-6fc5792d1dc9
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1794884359; x=1826420359; bh=tpP/9ykze2yQgtX589hLaB/y2/t7gDNGvWd4Bq6PVDQ=; h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:x-icloud-hme; b=kttlQ8SJHdu/IFhU98cq+x2zZC/Fyw4BTxbPpDUnJBESkMESAtqWoHyapLfzofrrMzCv/mO0DNa3Hz/HgC8Aq38Z3vmrVSyLO6Wwe8z3LmXnrrTjq7nxH2HongMk/MUF5oRXSSLEf8pChHfEbJRHo7cfPFywG2WoJwQtDG4w2DuTjLqN0rYFkiTjvnck9bZ2T4qSZ+kWG+6cqROdh75AsP8igVxQbybQgOEF51W3AHnJs7cdj3gXI4aphHoqLCERGX3hK+9vWKHf0qwDupQYSy/NxdO84F74MuAezd6FzgcAiyTDX0A022KN4cfnPwj/OameZ68jbNuULzeSLyb4EA==
Received: from [100.126.217.91] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-8 (Postfix) with ESMTPSA id 69450180012A;
	Tue, 17 Nov 2026 02:59:11 +0000 (UTC)
From: Muhammad Haris Awan <m.harisawan@icloud.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH] mm/vmscan: respect can_reclaim_anon_pages() in MGLRU get_swappiness()
Date: Tue, 17 Nov 2026 07:59:02 +0500
Message-ID: <179488434239.3564555.16227252580122398690@icloud.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAxMSBTYWx0ZWRfX7SaBbDbCWNER
 0YkbbOlt7wBXFAcURAhC/DjrpRrS7Rf+Al32qeUpDpwdjTdsI8b2xwM7bWFqRc64sP8ktOrCllT
 gmEk80w727KGXD9+k/nvYYEOIOEB8pm8igFU1v0u03g9jMqt0gOehh4vbX64RRlLKT94sAYugeq
 5Zg5yvLTWFLJvCaGbgyQoF/yeLIgQKPEbThcpM1JYAuEPWGvrpPxtfdWqVyEFJwdyL+symKml0j
 9osHrYgiIQZS1V7URAYDfLGWaPVhMHzjoJAZaZMkycHqV9VNrtoo4nf/wiIJIc2hxVD1YjPdmkP
 uUsorlNXwbNO+r6u9h9d2b2ihDrzBGeH0hQhbPNuWLUs6e94SGsxYfFIOpEt/0=
X-Proofpoint-ORIG-GUID: 2kbiXhfF3ykzIRkWNzuzrHRwTotlbSw4
X-Authority-Info-Out: v=2.4 cv=C4Z8WgP+ c=1 sm=1 tr=0 ts=6afbc306
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=x7bEGLp0ZPQA:10 a=2kFROKt5_e8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EYaFdmsEC1CjpenOt5ir:22 a=ieB-HjlS9-5fP-wcyLUk:22 a=v3ZZPjhaAAAA:8
 a=pGK3NKez1_T4NQe4MgUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAxMSBTYWx0ZWRfXyRYQk7FP5Cxg
 laGk+FIvKC0JA5D01fX9z09T2OSBLUbkBp23WNpr1bwDz7MMRe/qZfZdvnt3dOwX336MYkUweHB
 PBJK2pgQv5pv3Gx0oP7LuDq6RUZZwgg=
X-Proofpoint-GUID: 2kbiXhfF3ykzIRkWNzuzrHRwTotlbSw4
X-JNJ: AAAAAAABKX7+l7z00Xgf6XDZJJmtdf1hXyiTKcPoZ6Pb1Ih72AiU8hINMGwHN8jiSm1SX4
 VMB08z17KH6WVTM7E9Gq/SzNyph/yLn2hXBseGs9ZiqE05qfyI/1k2XWXdkCezxgD6vSAw
 SqkASoQH5G6gyu65J0GMzN8N93OhhclyrincYok3b46CPSgLAJ2CetS2jja2gVt90HtTUg
 gGowHO6yWTQc+1gtwZHcd008AG/tcRLdIZnX869YCDDOvGdIs7P29qASGdsEgCXGyyVxeP
 XT4JCfQ1RpuRv1Oln58mf2uz8yIIMTH1sbwl7IKieJu7Qum3nbwMvWtLRaUxc/q7Z04Y7e
 I9+14HxtksNNkDwyEm0V0dTGIDBpuxIjIbYRtZdo3FJms1z01mExV0uZJdchhcF3j/R7Le
 FSkK1XU0rbt6Cm6NuaqKuppY57cIf/QddYkEaUlS0I2oMaZbp3JNGPJy0r81vPGw/YLwuu
 srGA2Mk0PfDp/pmaKDoQIPyZ/mxMUWdVjsm0U1pr/V6BadgEbaAn4E898zYc5LkuUAbvre
 rhblZn7k2GQFMwtUUsHpHvzhx7+bPnIJpBk6fB9p+jTkgm3/Bkc6MyPoSSZDgW4seawUz6
 wj2OsHqe+LE5sWzNd6hOwQxdzEcE1Z5ooK0Vz4oS3F1SJOqVEbzRtsPTk1MyJeZ4lILCDJ
 Hgg3heczHnc0gs5KfL7QoqkhrlP6zasA2PaPLVEsXuqrX1dyM/3uWdAqqxebauXoxT3DGu
 pGAzqwAX1NXL+2W6XWkYGbnmyXje5Nfo2JYHxpe3qNooRnzQIfY4fsFeiK8/nQzHR4/olK
 sRS15vH51xs2szAihEOIuWHj08bM+ZvaplrSXYsg0FCsq6FYW6z9nMNX7FJ70TPEYVlcRE
 NSXRNbWFTnRC4Xz06vx+81BNH01iqMnayxR0IEusXYxTArekSLgPigTYHbfWvyK2cAELt5
 k/o+JfdX3WCry0A1N8a8USHWFV5E++C5yT3HgVx5Np7/UIBt52Hd+9bmq7PZAhljH/s1Z3
 uBG8fD7okrsCEJ6R0ZtpxWHG/kYuVZA228hHq9v2jsiq6fChAMuazevJJJQPHxNVJ6otsz
 yw0+DFmve9ea6EHPP/tpCXRywjz7aPjnX17KWeMCPJmS0RaWoffnOW8WdnLjZJn8ZaPlb7
 Lc8D+Ko9IodS+dzvvDZRpj4vP2fLMi/GJOflYFpMcFUUfoKFda2d3o+VRE3EEWdGYocFvt
 tnBg5292fv/S5n+6482JP/p1fea8C1NSq6wBkfQgD+mjtsreGQyIcxvdq09jweQIBf+m0R
 rwcu5k/PyBkxPcwjZNjOfcSnNCqVMcBh9d7F1d3u8uke/+OAnqDd1GPxh37k59xzlEPPMl
 XjzqmG2LpVDUp5H3O4nQFrAt+AY80TG9dWAywIJWhjlERrssE8WFSUELQd5YGsslPu0T7C
 btnmsmiFvSwzk=

Under GFP_NOIO reclaim, reclaimers cannot add anonymous folios to the
swapcache and can only reclaim anon folios that are already in the
swapcache (or demotable). Traditional LRU avoids scanning anon when
swapcache < (anon_pages >> 6) via reclaimable_anon_is_low(), but MGLRU
explicitly skipped this check because get_swappiness() did not consult
can_reclaim_anon_pages().

Call can_reclaim_anon_pages() from get_swappiness() and remove the
lru_gen_enabled() bypass from reclaimable_anon_is_low(). When anon
pages are not reclaimable (e.g., GFP_NOIO with low swapcache and no
demotion target), get_swappiness() now returns 0, restricting MGLRU
eviction, aging, and fallback isolation to LRU_GEN_FILE only.

Signed-off-by: Muhammad Haris Awan <m.harisawan@icloud.com>
---
 mm/vmscan.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6a1af9b92..f5fa67985 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -379,13 +379,6 @@ static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
 	if (!sc || (sc->gfp_mask & __GFP_IO))
 		return false;
 
-	/*
-	 * FIXME: MGLRU doesn't fully respect can_reclaim_anon_pages() for the
-	 * scanning type, so only apply this to the traditional LRU for now.
-	 */
-	if (lru_gen_enabled())
-		return false;
-
 	if (memcg) {
 		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
 
@@ -2893,6 +2886,9 @@ static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc)
 	if (!sc->may_swap)
 		return 0;
 
+	if (!can_reclaim_anon_pages(memcg, pgdat->node_id, sc))
+		return 0;
+
 	if (!can_demote(pgdat->node_id, sc, memcg) &&
 	    mem_cgroup_get_nr_swap_pages(memcg) < MIN_LRU_BATCH)
 		return 0;
-- 
2.56.0

