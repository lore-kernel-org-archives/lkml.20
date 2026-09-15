Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2FB4E3EF3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514450; cv=none; b=hZZFy78mpawhjuQ4nxB82iEI4TF2n8wzhyaQdg24G2mJvP/b8uIhkJLtjCQH0c9X3RiEUk8zGjEqhDVsLKBp2y9J3lXIqIbNZG8f9gIkI7I3fpLQ6NK25BeZLc69PxGhdFz2bajpuC5kYyJRVMuv7sHTAlucqfG8VNp4/3HpITs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514450; c=relaxed/simple;
	bh=gfXjN3rS0S5wCNAreZHf2pNt2WW5g1ntWcz0DrURYW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKrTPDyeIbLDoSXf53QjhzvYuSLU0nKoV3cVuW2PyDGMpWg3Cdt0RF9WEJy4TwXBE+QAB248+wybl3lj/H1iz46ucLaSc82LjmSrmZqs8ZkhBOlW/Pa1XoQG2UYE9P93O6g50FA1tbr4LfccCklZhONPHJGp9By6+6wVPNHcgSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=G3xvhvKA; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=szBaoADf; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="G3xvhvKA";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="szBaoADf"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FMbUAC2571543
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=iohs
	tel+U4w+qu+f/b24Nbqr30/JwqG/BmuqFbjm+rg=; b=G3xvhvKAasRnOUA3QkA7
	O2B5Z0uiInOE5axuO7zjxdNfV1nMjxqGzRKfdHZwtNs2v9I2fhaAU7pVLB8HUXuf
	cKtVAxN2asgbRT4r6Wpi2IBwWrRh9eFjrQ5WOWL2kb1U+4zKRW9Y/+7o7PfyFM4/
	DVaAmcDH0BxcI11Au0LNcgLdDlOs7Keee1puvS7aMma0BOSR+srHsynPKksRBr+o
	3PZhy3uWAN4MzQkWSq7F468MzGFeVeFJ2ylwfqNEnOXVv5+/ERAZbGzEQsZ8ZjoL
	rLTMjcFh7/EcT1HlVmFRhF7QZk8BlETzaj46KlNU/L5UhjBxVbIQ97Y5ALCt37OL
	3g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gqbwd9t1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:20:44 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1b824e84so599679485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789514443; x=1790119243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iohstel+U4w+qu+f/b24Nbqr30/JwqG/BmuqFbjm+rg=;
        b=szBaoADfXnZAssFEiXlHHQMp4E4hOxrapfcw20dRAjZlksx4CLSzgRTHQwW1+XHi7A
         adx1jUjKSnLO0VWirGiMsbZ0NBkiHcfCtwkLlL3OqziUiydwzqTYvpGF0zBHq+UCG4Sx
         wEdAvp3C4GPZAGm1onv0ljyYJsy3fBsxDgKcOieNUhHvl57QI/iaR6neiKg4Ac9l1gqy
         HLjR4cNOubk1DOTeqUVqhEapOjzos7aXBfwGMws+pS9hdAMaHqI/zDxAgKzcqaycePUr
         tQGB76aiczO7nP4UsMUf+vq7/KYUNCDwHFIOH3ASdjq1L0oObPMYH8EmVKgAX7kyPeGA
         tDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789514443; x=1790119243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iohstel+U4w+qu+f/b24Nbqr30/JwqG/BmuqFbjm+rg=;
        b=BPm5C1QCHYLv9I4MeAuw+StcOXZ+oBGmqkth1LB8vGqGFG56VkDfPP0oVtyt8/FJCL
         2yeM80vBQu6A12uIRqu4wVnV16RxHpBiKs0HeKy2ydp6PvWkBAB9RBhOI+SguEq6UOEz
         m/RYjtIGQvpqBlgyF1yr0Ezxi9nBUsbgqiRlXxHPnprspB0ecWysrrK2cnSv2OTg8IBN
         tN4SzxB4zcvhYZ0mU6jBkQjPXmgQSkqrFDbdM3Qd7WW+BmAkJjokVnkKgJGKc64X7k0j
         yQYekSWn9hr0QkpAi4OIAKX06xHj38BWK36uIl2n5q8IljaDX53SROLaO1shJAZXUyyR
         Mozg==
X-Forwarded-Encrypted: i=1; AKwUvBz/e9OiUS59gnupvMgSEAa/9IZ4Ct3aCs2RseN1EAdUAbotU23SEQvZFBRYfYb7XwC3V0Jwxoe0uNz8lAE=@vger.kernel.org
X-Gm-Message-State: AFuF++l0Sik0R5CwTjZRCZR/MkiiS6+GCDQ0ZvTwzOfi7NO0LnQ7aHS1
	knsr2EUGAw96X+MSA5S4bCQWKDOZp3DiwtYlSpm7Mm4ZY9lWc9JrgtgdlEpALgE6Ko8bwh+SEH6
	gVDrI/q822pwRXsEHYrESdk+AwaBkLm8bckzQcW7r0Dtv0dJfsbOuEJimEPNXTQ==
X-Gm-Gg: AYBFou3tjKQSzJpkJ8eYoOnCKbeNRsu0FBW3dlAbdQ9oQaJpsSlhE9SmkJt4to/kMpC
	ISX5C+/F6VT19Lz92qry8EfGBvCSQTl07RlN3ZzPf6u5K6KFjPAMVNboLN4q7ExWj7FD1TrRuNE
	ZQJwc/rWrvnskItCQ6ma4ggvZeeiwno+40TjtRLJZtQQIdE81o56M6vXzvNDa/c5HH2NOlnyyks
	wJ4JvQzID0UHIc4YM+IUtRKFhgWE7JMMZ8S9SXxKbTnml0jsCNlS9gFKT59szIZs/OlonuNNpWq
	Xv3JC/htlcGBEKGJDEV0b5n7KD+CM6W+ekrSwhSWJPUNZXurTsIb3GpPknrBsIhl0ELWSesVbUw
	ONL1uevP4ur5nZe8XMc37hdHom0GF3xSuAiJvfGEAQxh8cNw/
X-Received: by 2002:a05:620a:25c7:b0:93a:2e8:5afa with SMTP id af79cd13be357-93bb78f8162mr56612585a.30.1789514443481;
        Tue, 15 Sep 2026 16:20:43 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:93a:2e8:5afa with SMTP id af79cd13be357-93bb78f8162mr56608185a.30.1789514443031;
        Tue, 15 Sep 2026 16:20:43 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-204.net.columbia.edu. [128.59.179.204])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b781dfde3sm77151085a.12.2026.09.15.16.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:20:41 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 15 Sep 2026 19:20:15 -0400
Subject: [PATCH v3 11/11] mm: memcontrol: constify the zswap and socket
 pressure helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-folio_memcg-const-v3-11-c239a6010b58@columbia.edu>
References: <20260915-folio_memcg-const-v3-0-c239a6010b58@columbia.edu>
In-Reply-To: <20260915-folio_memcg-const-v3-0-c239a6010b58@columbia.edu>
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
        Barry Song <baohua@kernel.org>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        Baoquan He <baoquan.he@linux.dev>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>,
        Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789514423; l=2733;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=gfXjN3rS0S5wCNAreZHf2pNt2WW5g1ntWcz0DrURYW0=;
 b=emYpUpxeMYySXBIAaFOu0+xjuyPwfYFvwTaSgzFVe1rapWKm637OoQF7dwjdaMdFk0pkiDQN0
 2iGK6p4657BAVZ8kUeMyipu+wfuTYfdoQtzBPFfXoE1Jh+I6JIxr+tP
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=JeEpPkKV c=1 sm=1 tr=0 ts=6aa9d2cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=hXAsoc/zAxyCEdIRhrpmVw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=JrvLMZgmaQ4VKr8cMrEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: VJiWg2sbq3-Q2xaCBd19fLscvYi5TDdc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfXxIIIGJA6vDQN
 iLzYbp1Q0BdB2pasXVkFhXchC7SLwfZfw2a84hgbu8P6W1K4fo+Lj/vAufep1o/R6wrgwGmjjy9
 /jUnp8FJXJIDNmG2jUis28MoJm11moTsphGzWasJnCzQm7hK2h9zvnV6kZjigp5hKRxq8LwNDS+
 L6fLR3uw56HhwqwDYFmDH6+y4DSmSqQk0YiTM25kbdr6o7tcG0RbWKbuwKUpmIZZFQOAssilIY5
 busUInv73iGnrMlq1Y5/1YTsChmqZDVINagvc2ekizFur662pri+NWCAz1BrOWnPIYu1nCi6whG
 wMzTazHOq+BarBH/miDj1z54lQHcDJDRmrV6Hsn/uhKT2crN5ovxCzgi5F3/Lx98owfuKsoMY8X
 SnpLI6pyf7DVEuQbBtYcsOVx3dJleE0jcUJiVbJ9jB9EAJtX2TnqJjhFkuAUC+5cezLlp+dco5y
 V+8TEIfm6IDlPEC/6CQ==
X-Proofpoint-GUID: VJiWg2sbq3-Q2xaCBd19fLscvYi5TDdc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX4axzMos4unKH
 DaCx7rtz5t2KULuS+NO/5LxAzq60W40ErijLAjkrJlBbYJVJL87FXvywMrTErtRE1srd15oxy4M
 x95nMc57hDJthF4HjUwvXkCJxiezoUxV1f4KHVpyzhktgYWNysM+
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11906
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=10 adultscore=0
 impostorscore=10 malwarescore=0 bulkscore=10 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150341

mem_cgroup_zswap_writeback_enabled() only reads the zswap_writeback
flags, and mem_cgroup_get_socket_pressure() only reads the socket
pressure timestamp. Constify them.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 8 ++++----
 mm/memcontrol.c            | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index f11899085473..64c183be8cbf 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -1684,7 +1684,7 @@ static inline void mem_cgroup_set_socket_pressure(struct mem_cgroup *memcg)
 	write_sequnlock_irqrestore(&memcg->socket_pressure_seqlock, flags);
 }
 
-static inline u64 mem_cgroup_get_socket_pressure(struct mem_cgroup *memcg)
+static inline u64 mem_cgroup_get_socket_pressure(const struct mem_cgroup *memcg)
 {
 	unsigned int seq;
 	u64 val;
@@ -1702,7 +1702,7 @@ static inline void mem_cgroup_set_socket_pressure(struct mem_cgroup *memcg)
 	WRITE_ONCE(memcg->socket_pressure, jiffies + HZ);
 }
 
-static inline u64 mem_cgroup_get_socket_pressure(struct mem_cgroup *memcg)
+static inline u64 mem_cgroup_get_socket_pressure(const struct mem_cgroup *memcg)
 {
 	return READ_ONCE(memcg->socket_pressure);
 }
@@ -1937,7 +1937,7 @@ static inline void mem_cgroup_calculate_protection_path(struct mem_cgroup *root,
 bool obj_cgroup_may_zswap(struct obj_cgroup *objcg);
 void obj_cgroup_charge_zswap(struct obj_cgroup *objcg, size_t size);
 void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg, size_t size);
-bool mem_cgroup_zswap_writeback_enabled(struct mem_cgroup *memcg);
+bool mem_cgroup_zswap_writeback_enabled(const struct mem_cgroup *memcg);
 #else
 static inline bool obj_cgroup_may_zswap(struct obj_cgroup *objcg)
 {
@@ -1951,7 +1951,7 @@ static inline void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg,
 					     size_t size)
 {
 }
-static inline bool mem_cgroup_zswap_writeback_enabled(struct mem_cgroup *memcg)
+static inline bool mem_cgroup_zswap_writeback_enabled(const struct mem_cgroup *memcg)
 {
 	/* if zswap is disabled, do not block pages going to the swapping device */
 	return true;
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 6e3731b97690..d0f1b8782009 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -6304,7 +6304,7 @@ void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg, size_t size)
 	rcu_read_unlock();
 }
 
-bool mem_cgroup_zswap_writeback_enabled(struct mem_cgroup *memcg)
+bool mem_cgroup_zswap_writeback_enabled(const struct mem_cgroup *memcg)
 {
 	/* if zswap is disabled, do not block pages going to the swapping device */
 	if (!zswap_is_enabled())

-- 
2.39.5

