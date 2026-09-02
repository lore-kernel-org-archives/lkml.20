Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C173921D8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377324; cv=none; b=UIPysZ099YgGKY0HmkYw6eTd8xjVUZL0pHnprM1KEPepN7xCRS8Cf5ryYyta4gSTcpliTdH23nEMiMj0ills7tGjg8S/KYDa64UqanlpDvZAruEs1K2zRqXkvNzwoOop83rbCwfT4VtaPoBVtpmHuN3KlRNODUJ2kE9eETsbjic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377324; c=relaxed/simple;
	bh=wC5jQEJdvXNDOvELuZJOYHxO0UgTX5KCQayPHi7yS98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ANm8bFiN21EWIBtTIUPHppzVQtCQAWnCzWTrsmJUJOonrScV0z3IXp/7RGxrMGBvT9uEH9p7y+/Tl/4ZyE0zYFms9IOcpEZivUYznCQlqmHSFXsBjyBZCL2mTSdWoeR8PTwQZvO4ZO9OuOaJSrVqbpudZpi7qD1vHTZ2r1ZlEmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Q/m498FH; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=V2FX1ZGl; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Q/m498FH";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="V2FX1ZGl"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682J6l7u805185
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:28:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=ek2V
	Vn7iLRLT1FSUmgwG4l23Zd373ek/nG0bZLHscu0=; b=Q/m498FHzhHCYykvxZ4l
	v21h3KKPs5xyCNbckieb5WDouZ3XbqBGjLJTiWts0FcYyBmiTndo97Loj3VabsHC
	Tm9WObX3qSXHySDlyDAkC3BLbbfJYWu9kD92+zldreloEy2rlIVY6jhWX+Vbz6Ro
	SCbotox1nmHlZz22+tpevgw8MQUqt+B7GYLXRZ9WQwFC5YZg/jc9lAL20e9kyfa+
	r1j3rf1w+I2uCPlOew/9fUMuGdsSjwAqw/HXjWm+ZhJgnGVaneHfkV0fsyBJQeKf
	DcQ5o+2WA1o5DqJY/7x9E5m9SnXsxVP0HNBppg1A9zkmLdiDaS/eifkWpNy5Iz0L
	Bw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gesp0g554-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:28:29 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e7db8d191so27014566d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788377309; x=1788982109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ek2VVn7iLRLT1FSUmgwG4l23Zd373ek/nG0bZLHscu0=;
        b=V2FX1ZGlxIXcH/zoZRzWhv1M5C9sJjZJ5DWTuReWN08DAG6UfVLmADvpxj2DzCbsNc
         sIrgFPiJmSHRUPaGKq8kyAdr9k6JXIA0Pz1RTL6JbVAeawPfejQ7epFdoUyVT5GI2Of9
         WjJbiTIatYWLMlUf8borWdZcslpm+r3MhDij9IO8ojq6CHmlRn9J14lm7wQxRWZJSZ13
         NGW9yUZoVJbvlqXYJpa57NRvHtJSetDFSsfUk+88Zh5G5Hyo4zlHzq7QyBGk/zHBE+56
         yrh+7nFgj8FLuaeZRwk4+7nN1Od9eeF5LF6vgul/iVK0rsKMwYiNCplNjsquZDIJQaSx
         Bl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377309; x=1788982109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ek2VVn7iLRLT1FSUmgwG4l23Zd373ek/nG0bZLHscu0=;
        b=Kmvb7uGBPnHnNnwHoJWzdqDMh8J/zZqbOziZXg9eazZbL6FxQdTTcaFamzaPvJ66jZ
         bvFPNqmyU9GHdkiLbk9ZInlItghIBxSx71rLgutT/hNHbQnFb93pXCb2y+gktLttoIJH
         6OmXjNo/iDGkotkf0WYtLQ87aOO1mTzi84ISmNEC/UrPAX2/K86mp3b0azH3nVIkNrF3
         olbAmMz+6yUZ8H0ju4AB831IVTOQU1HJBmZYasy6Ca6FeyGI1kkPe2CHZw6TBQNLL894
         /IxyKHRRtXbskFXLhYKRLfsOI6uFVQElmv9qQoQNmyMnCnlmt8zhJObQpm4bhmC914Av
         npVQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/8Fpke/hbkWek/hPaJJi0jrOVBvS3SYdVqky3eaMmboIIuheObWsJsfAyeLF5pfMvKNnls4EndGhoBJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kUP4362SeHfmOAnk5+vps1YqTTpGRovwH7eQLqZ1E8IosiFe1W
	BMiBFMnzN7zGN6DB9Dut1gwNsBDGe+kg3pcYWMHtS+fZq51iJRSFmKWQ9GXTOHn+x+0BGqGB0DL
	SNk3KGIFdxDjYWValpxlC3CGghHaY9eZ1mmPN1uje1SAHVki/DA+o3O1qE++C+w==
X-Gm-Gg: AYBFou2hBB501C/7yyLi0+zWoQMmB+Uf5KQbUCSbK85AM650JhKxJRPCvLxBYmK8WP/
	RewuOQV64q0APgPa+UZi1uzPkVDBZ1JhkbiKy50p7Qv4SOA/2mTXgY+LdE2jQwyrsc4SrQG+RB+
	0Hyt6HAYDafwSvTgDU9YGje5Yuqz361xU6pKI+A9yXUNuRJ6UTQx0gNXps5FhcchOozRrxg2XiB
	beT8CL7CcryAp0T96g4hrWD4J/woBHtq4CktBCkk1jqldOyN6v0ubYxW7ksdChltNVz0ES9i+eb
	J0nFWXe0VC4g4GmcHFG4OkyeRz9f/j3zpIpQZpIMJ5+4hLBiGePyHaUNTiTxpkLtW9tuvk9IesG
	hp+BFn6rQY6gvcxzwKreYjkQJileRRsXXT0n5xu+3/2jqw7AKZuc9/w==
X-Received: by 2002:a05:6214:2466:b0:8f0:afa3:594e with SMTP id 6a1803df08f44-90eca358387mr93200216d6.8.1788377308915;
        Wed, 02 Sep 2026 12:28:28 -0700 (PDT)
X-Received: by 2002:a05:6214:2466:b0:8f0:afa3:594e with SMTP id 6a1803df08f44-90eca358387mr93199426d6.8.1788377308183;
        Wed, 02 Sep 2026 12:28:28 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec85a0sm25420936d6.29.2026.09.02.12.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:28:27 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 15:27:54 -0400
Subject: [PATCH 08/11] mm: memcontrol: constify the memcg and lruvec stat
 readers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-folio_memcg-const-v1-8-e2c1da22246d@columbia.edu>
References: <20260902-folio_memcg-const-v1-0-e2c1da22246d@columbia.edu>
In-Reply-To: <20260902-folio_memcg-const-v1-0-e2c1da22246d@columbia.edu>
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Qi Zheng <qi.zheng@linux.dev>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788377294; l=5368;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=wC5jQEJdvXNDOvELuZJOYHxO0UgTX5KCQayPHi7yS98=;
 b=29lTNNsiv989SgHNrVYYq1ulj9KInk5RyRFJF1EeMhjajtR8sVabNMOFw3PWq2CkX9nOTKWI0
 K4q2P2wcva3DUoxcEdjh1/PTJK6MBR4o6aEDcXIu8XArbq+1DYS5biP
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: _KQ2QJd8LylnHrWQRcWy1JKW0epGFFP9
X-Authority-Analysis: v=2.4 cv=PqejqQM3 c=1 sm=1 tr=0 ts=6a9878dd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=ndtaMpzIUFG_VZog7AQA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfX5yqbYNicS6yL
 b774shnuHGEIpQHKgHJjc4zMrV32FDZOZ7QzK4vhfow+/IJYWy6cYo7HqN78dgLT/unKi15gfUk
 pB1Ni5o3B27Ls0PX+Srvmdd7SdTqR1pUE5cRkQsljbT+RPj+c1RT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfXzXmFpcw/KAbP
 Rcyx+hKSqJuEBjZYwV/S7OhV4/xDboCwVVLX2zOkK0fJ/WzUG8IIB2n/6cbwNKH2dWONO9FOW43
 XsEBAu1Vqvkt3DW5B8Pf1WKwTq8tISRTi3TqOr9t2+1icREbShxm9wUmADSffowjxX0Vnt0AwFp
 ziKBy+oFMN9hp/u4k8CfHbJYZk6LWsWzYnz+a5ImS7S/m8hOZDVkKcGjUWI+Fv5SXJsbRiFfzXB
 XBe4qg+r3eQqPZFpvyeVvtwfj8m1ncc/PSByEWc/gekNMuCaW79gLEiv6kbrJdxmpTqwsvMflr7
 nk+tMlNCAtV7ki7jwLWElFzO7wSvdVeJ5saYv3TYyKMwFCpBRHhNSplnVDhfUTjADidaaRGNnbw
 Z4wZRyiMsniVY/Opl/h5RDY6y8TsdhxLX7Qi3GgVxUVLT8vMXpcWKcm6G3kMu0orzHLTMAKjoGx
 aV8mrYIOpBkLetMXPyw==
X-Proofpoint-ORIG-GUID: _KQ2QJd8LylnHrWQRcWy1JKW0epGFFP9
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=10 priorityscore=1501 malwarescore=0
 lowpriorityscore=10 bulkscore=10 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020172

memcg_page_state(), memcg_events(), and the lruvec_page_state() family
only read counters. Constify them.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 23 ++++++++++++-----------
 mm/memcontrol.c            | 12 ++++++------
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index bd82628d0d72..10a197886f31 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -932,15 +932,16 @@ static inline void mod_memcg_page_state(const struct page *page,
 	rcu_read_unlock();
 }
 
-unsigned long memcg_events(struct mem_cgroup *memcg, int event);
-unsigned long memcg_page_state(struct mem_cgroup *memcg, int idx);
-unsigned long memcg_page_state_output(struct mem_cgroup *memcg, int item);
+unsigned long memcg_events(const struct mem_cgroup *memcg, int event);
+unsigned long memcg_page_state(const struct mem_cgroup *memcg, int idx);
+unsigned long memcg_page_state_output(const struct mem_cgroup *memcg, int item);
 bool memcg_stat_item_valid(int idx);
 bool memcg_vm_event_item_valid(enum vm_event_item idx);
-unsigned long lruvec_page_state(struct lruvec *lruvec, enum node_stat_item idx);
-unsigned long lruvec_page_state_monotonic(struct lruvec *lruvec,
+unsigned long lruvec_page_state(const struct lruvec *lruvec,
+				enum node_stat_item idx);
+unsigned long lruvec_page_state_monotonic(const struct lruvec *lruvec,
 					  enum node_stat_item idx);
-unsigned long lruvec_page_state_local(struct lruvec *lruvec,
+unsigned long lruvec_page_state_local(const struct lruvec *lruvec,
 				      enum node_stat_item idx);
 
 void mem_cgroup_flush_stats(struct mem_cgroup *memcg);
@@ -1372,12 +1373,12 @@ static inline void mod_memcg_page_state(const struct page *page,
 {
 }
 
-static inline unsigned long memcg_page_state(struct mem_cgroup *memcg, int idx)
+static inline unsigned long memcg_page_state(const struct mem_cgroup *memcg, int idx)
 {
 	return 0;
 }
 
-static inline unsigned long memcg_page_state_output(struct mem_cgroup *memcg, int item)
+static inline unsigned long memcg_page_state_output(const struct mem_cgroup *memcg, int item)
 {
 	return 0;
 }
@@ -1392,19 +1393,19 @@ static inline bool memcg_vm_event_item_valid(enum vm_event_item idx)
 	return false;
 }
 
-static inline unsigned long lruvec_page_state(struct lruvec *lruvec,
+static inline unsigned long lruvec_page_state(const struct lruvec *lruvec,
 					      enum node_stat_item idx)
 {
 	return node_page_state(lruvec_pgdat(lruvec), idx);
 }
 
-static inline unsigned long lruvec_page_state_monotonic(struct lruvec *lruvec,
+static inline unsigned long lruvec_page_state_monotonic(const struct lruvec *lruvec,
 							enum node_stat_item idx)
 {
 	return node_page_state_monotonic(lruvec_pgdat(lruvec), idx);
 }
 
-static inline unsigned long lruvec_page_state_local(struct lruvec *lruvec,
+static inline unsigned long lruvec_page_state_local(const struct lruvec *lruvec,
 						    enum node_stat_item idx)
 {
 	return node_page_state(lruvec_pgdat(lruvec), idx);
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 35f924c9f2a3..3d3eadddc130 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -489,7 +489,7 @@ struct lruvec_stats {
 	long state_pending[NR_MEMCG_NODE_STAT_ITEMS];
 };
 
-unsigned long lruvec_page_state(struct lruvec *lruvec, enum node_stat_item idx)
+unsigned long lruvec_page_state(const struct lruvec *lruvec, enum node_stat_item idx)
 {
 	struct mem_cgroup_per_node *pn;
 	long x;
@@ -530,7 +530,7 @@ unsigned long lruvec_page_state(struct lruvec *lruvec, enum node_stat_item idx)
  * monotonically-incremented event counters are stored in
  * enum node_stat_item.
  */
-unsigned long lruvec_page_state_monotonic(struct lruvec *lruvec,
+unsigned long lruvec_page_state_monotonic(const struct lruvec *lruvec,
 					  enum node_stat_item idx)
 {
 	struct mem_cgroup_per_node *pn;
@@ -547,7 +547,7 @@ unsigned long lruvec_page_state_monotonic(struct lruvec *lruvec,
 	return (unsigned long)READ_ONCE(pn->lruvec_stats->state[i]);
 }
 
-unsigned long lruvec_page_state_local(struct lruvec *lruvec,
+unsigned long lruvec_page_state_local(const struct lruvec *lruvec,
 				      enum node_stat_item idx)
 {
 	struct mem_cgroup_per_node *pn;
@@ -799,7 +799,7 @@ static void flush_memcg_stats_dwork(struct work_struct *w)
 	queue_delayed_work(system_dfl_wq, &stats_flush_dwork, FLUSH_TIME);
 }
 
-unsigned long memcg_page_state(struct mem_cgroup *memcg, int idx)
+unsigned long memcg_page_state(const struct mem_cgroup *memcg, int idx)
 {
 	long x;
 	int i = memcg_stats_index(idx);
@@ -1091,7 +1091,7 @@ void count_memcg_events(struct mem_cgroup *memcg, enum vm_event_item idx,
 	put_cpu();
 }
 
-unsigned long memcg_events(struct mem_cgroup *memcg, int event)
+unsigned long memcg_events(const struct mem_cgroup *memcg, int event)
 {
 	int i = memcg_events_index(event);
 
@@ -1709,7 +1709,7 @@ static int memcg_page_state_output_unit(int item)
 	}
 }
 
-unsigned long memcg_page_state_output(struct mem_cgroup *memcg, int item)
+unsigned long memcg_page_state_output(const struct mem_cgroup *memcg, int item)
 {
 	return memcg_page_state(memcg, item) *
 		memcg_page_state_output_unit(item);

-- 
2.39.5

