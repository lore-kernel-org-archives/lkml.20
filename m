Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1318651EE04
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997712; cv=none; b=d2Sy0h1i6QDXeETwJTCxMubFevaLYcK5qivzCCXDH8gR5n6t7rRam/xIsLeATt/MAKU7+U7PO8xw/LaSZWMZknOIxeF3Mo0KwvP8Rm63A6U7G2Ts8AOkA/l/5sOrIOMEsRsZHwqI/OeQntzD7fP1Af3vSM9Q7e70EKx0Iiw2KKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997712; c=relaxed/simple;
	bh=A4+6fw0Hc9Z0q42kWQk0GUf4UVLOksq0fQyOCy1QXaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwHy5mfkASMUQy0EQTTDCQdeZSHffUlRxqtAxT58gHi100KDL/mud/ZAx5iav6yJiQDRvT0S6tW8sqh3u/b4R2uaLkxe2EyAaABkcMXCmhMIoUCVghjE0Jn6rcF6fSuVjNrDwI4W+MmGrpie39MoFlfKGPpJX26Ryt/9bX87S2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=lqhvhJhj; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=alRHfMmy; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="lqhvhJhj";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="alRHfMmy"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EGYPR33700151
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=qamj
	3Rybiddl1bXwe9wbuQOMEaZBgA53f7HcjTbkGoc=; b=lqhvhJhjucX+yxkQcsgI
	yM9jq+Cw0SVuPisusNMF97Dmt1iBvC4gyRVNqfPIcvpgzJcRLXbnzV13fL/dMaWo
	y4+TiWc3oHCHs13cZjSk7bxtkTjyXxZxsOFzvpwR27cUqpTNjGT7mugAD4Sb/47w
	WUQG4aCvSnNLle+CPRN2TUh8tmgkm+o+Wq9IpQZ/0fvZNUfFSfuRIRYHUB+RxmzY
	gAXCA/kD31EgpsfNrw+3B+X2QtCrJ1K238EHqEYQOY4SSgoUDfZuHpEtGWyiTWUp
	1CYNBhBVM2qfvo3+ZuHiNssSKd+XWEbeorWInKhMVjWtLt4eX5Bzpa8V7IoJFLyQ
	Uw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4ha9ctavjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:08:28 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so89720101cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791997708; x=1792602508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qamj3Rybiddl1bXwe9wbuQOMEaZBgA53f7HcjTbkGoc=;
        b=alRHfMmyLvk7OJ683kN2mBRQtVEirmDGTI2pDIh1kaDRySa6/sj//v6xdT3zyo5E+m
         0kjaCgdAjrwXY1VWc6Ik6W67776Wb/T4yQDk+2hmpWl79VLTyUskWunP/sdtEK+e0U1t
         zMvJ7Ovk6XS20GVyMu7wgKB9XpF9BQQWkkBSXXGLB/9hQr+DK5UCP7PfEZTilrILE385
         N5CrBBV4JXwN+IdhgZruu5JTPHSoLZJVWSWb2/ZgCRRSEIilDu4ljha766x33T7Q37gC
         NqTeni44pktJDrL9zwowfI92tumL2DOOmXGJFpMe98fmhXYAQjRBf0zY26Q+xaHgmomx
         bDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791997708; x=1792602508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qamj3Rybiddl1bXwe9wbuQOMEaZBgA53f7HcjTbkGoc=;
        b=zyMEAd/GSto+LlraQQxT1ogUmoiwDpFtp3ZvZxZHhTTddi96UC+r5NFNbirDtm4Xea
         1Ohjvm+jGn32y/nSSeTBjWyvlHibvAGHpsrzIqyzugW6+ll8ez2wKP4p0edR5e26C/pQ
         /sj+x7eethYYPYUxUiqzr5e/TdnHJOCHRXwYeaF7AXRSSNXoxRO6zommE6JSFDBVinev
         p9TP5hdnwOMbgYkXfRy2japK+io0np/bZhyQ/1W02LKokkrVJ7hIeJXmGF09n+wn93b1
         BnyTSjxqTd0WLDijlZ7WMTmEZ4gxhVKCjQxStdJzi/yrrVfs2xgW29U6tZ3gHejH0ZwV
         9Urg==
X-Forwarded-Encrypted: i=1; AKwUvBw1/7rjL8V3LOYmoTC8yHECQL8D3KppioFspkbXUW5cs5W6qJhqTc1t9PGkjFKxvxKN5uTRDbtyZYOC4/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAsQQmLFzsO5OUaHb1IUJa7KCkpZ+zU/E3dQHdDuK39tqG6wqc
	7To+UfMP/PRE6S1m0pdooEMAPZvmmDzn2iZqWr+01kGFHzM43bELZY49+AsHSdK+K20cxRrvQXy
	F4uneeCTxYthmprDrrPA+4zZM+mKXbQbuSHkdxDAwmQnNtIQWrZfYIzjRAsqu2w==
X-Gm-Gg: AYBFou0LGiU8grutuGR3Zu2zNDT7EgNn0PNd9WMB4SEMURIso3bYxXe+bZBdgfyn5lD
	6MOUfpXbbYdv5OGNMpj5dpQ7KQtoi2tDAO7JSt47zrBBF5ag74d8PCv2mwx2jCyY9VUUJgDqDjw
	aKTfQA4peTotZc7KdTDW4PSiOUKXhjuPtDmwq7NHD35olSMPaSsfWBiuN9O62e5t4cqhmAVuDha
	JbKbFRwt8uFXrspxcuR3D+6g3bwlPLCV9XG97a3UiXPB4rwMHCDCapP4l/T77lliqbAWnT5JLYe
	vSfIuJxV9TKXE0ojaACCZqaK+deIPY3USeWqpHE5rTXVO3bgUaFX6ucAWAKvpWl30q2xwobFNIl
	NqsJ8PLleKxMVWD4IbWjlSLteMe78QVvuHd7c+ulGdSSXQEA=
X-Received: by 2002:ac8:5743:0:b0:533:90df:fda3 with SMTP id d75a77b69052e-535fc8a0915mr55202231cf.50.1791997707707;
        Wed, 14 Oct 2026 10:08:27 -0700 (PDT)
X-Received: by 2002:ac8:5743:0:b0:533:90df:fda3 with SMTP id d75a77b69052e-535fc8a0915mr55201731cf.50.1791997707295;
        Wed, 14 Oct 2026 10:08:27 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-148.net.columbia.edu. [128.59.176.148])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b9bda8643sm49190116d6.25.2026.10.14.10.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:08:26 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 14 Oct 2026 13:08:20 -0400
Subject: [PATCH 1/2] mm: memcontrol: remove mod_memcg_page_state()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-memcg-unused-page-helpers-v1-1-240b37c53831@columbia.edu>
References: <20261014-memcg-unused-page-helpers-v1-0-240b37c53831@columbia.edu>
In-Reply-To: <20261014-memcg-unused-page-helpers-v1-0-240b37c53831@columbia.edu>
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791997705; l=1533;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=A4+6fw0Hc9Z0q42kWQk0GUf4UVLOksq0fQyOCy1QXaw=;
 b=H7zGDut/q/n0LxMAJS6A5fFSkWckFdgdxTvxrNY9XHYWKdppXxMb4q+0U6DLzGYTRwZnhIyEA
 QlnhUXg6FWoA+COdCszz4UMMX3KRNXyOvTJaLBa5QVIC7yStXh+ylHl
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: E8F0-LaAAA7nSV789MXDtB__pO6VvQTo
X-Authority-Analysis: v=2.4 cv=f4bdl+yM c=1 sm=1 tr=0 ts=6acfb70c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dxtdfZqDOO0kCslK4e47hQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=_9uCFvy-xzexSrfj3z4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX+X1BFm2ubM/T
 IHpKt8LPw8zXEinrFmiSLaskUZAx2zsQ66ZtBc+GlQTUSLVAeh8yNHuCI+SCHW6rTE4nEg5Svdm
 4ur2Q+xtLVhTF6htwniSzc0nEuczO2JExe/jd8mIMHyYBE+B0X/m
X-Proofpoint-ORIG-GUID: E8F0-LaAAA7nSV789MXDtB__pO6VvQTo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfXx2GH390IpzA8
 lzB0xfshHfPXz11rwYvO1qq4shnc0JVLgAQi4dBc+WgCmiV5S7GX/IVUk8B7FeUGmqZuNLxRCaV
 Dw+tGcRORGbUq1F526lb2aJh364GmKWSvmr9AjaGRzCvOr7Pz8e/m+kVrcqEKXS/pT3nWb9sNtx
 gYUCsngJ7i0xkXiwZ0wTq4rUWZkPRJxqZEgxyStxyamia9JccZYA381tb6AeaHfBU4fhoOKTqIE
 gELV8oXhoZiHjKuUWY6WNiq7yGCB2N6yE6XHJKfQeCaqfSjcBTLwmoHFCsESbwaRQai8N4IJ5VS
 rHa/F2dPqDYPXtfZ5cwpwZG+67Ke7PX+b16wzlgCWK1W28H6FiCM2W2PxXKgQrjEhOCWoF3Awo2
 1dOYr+7HjeXxKCWKZRzE7cDz5pqRaSj59XISHYww/B2RTIBWkuts7UfOZnrCV0/AgcINwicL/Us
 J8ElWOMNSuZMdlNfbZw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=10 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=10 suspectscore=0
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140068

The last caller was removed in commit c466412c73c3 ("mm: memcontrol:
switch to native NR_VMALLOC vmstat counter"). Remove it.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/memcontrol.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 74110a324f9e..b65a2d0fca3a 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -957,21 +957,6 @@ void mem_cgroup_print_oom_group(struct mem_cgroup *memcg);
 void mod_memcg_state(struct mem_cgroup *memcg,
 		     enum memcg_stat_item idx, int val);
 
-static inline void mod_memcg_page_state(const struct page *page,
-					enum memcg_stat_item idx, int val)
-{
-	struct mem_cgroup *memcg;
-
-	if (mem_cgroup_disabled())
-		return;
-
-	rcu_read_lock();
-	memcg = folio_memcg(page_folio(page));
-	if (memcg)
-		mod_memcg_state(memcg, idx, val);
-	rcu_read_unlock();
-}
-
 unsigned long memcg_events(const struct mem_cgroup *memcg, int event);
 unsigned long memcg_page_state(const struct mem_cgroup *memcg, int idx);
 unsigned long memcg_page_state_output(const struct mem_cgroup *memcg, int item);
@@ -1412,11 +1397,6 @@ static inline void mod_memcg_state(struct mem_cgroup *memcg,
 {
 }
 
-static inline void mod_memcg_page_state(const struct page *page,
-					enum memcg_stat_item idx, int val)
-{
-}
-
 static inline unsigned long memcg_page_state(const struct mem_cgroup *memcg, int idx)
 {
 	return 0;

-- 
2.39.5

