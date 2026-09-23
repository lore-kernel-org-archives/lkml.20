Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DC2383983
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135150; cv=none; b=buG/UORrx6KjGscbUsBgKSE4pGo8+ydsYaRFcp8/hODk7YQLIm/2Xp1xEWPWBSbSOq9vMQimZ1q3jzbpVpnHwRg/T0NzU6/L2E9xAVmf8FH/qQh2A+FuGzyX5HGaUMNBMexvrVMAvzjZCflGVy6oCtE0pX3wEMJn82/R/5P7Byo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135150; c=relaxed/simple;
	bh=VV1daVIrklm8NAgbxgWTs5E3t9FJPZkllrfVvHSGNKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMQFsYEYZppHl8mNragai2LmF7t4nt6oI8N8QKSsza1Zt/XJ4lVWhS2yuTmQpksITpP7+FiAD9pP3/4FVY/YniCgvCN6VzmhLSPuvzakgSZRkZRNIi73aJbBJIHR4j4qrt4q+hdpJv9Rhf/rryq/MndUuAANJBy2SwU1+MngKhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Zt/OGiWx; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Zt/OGiWx"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109fafd7so43718485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790135146; x=1790739946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZoBrlOKKae5h9YawjwIgBVWbvwNAnx3gQiwI9yKP0ug=;
        b=Zt/OGiWx7g8a52pa3BBPdNAIO3+0rszNi2trrvmvOe7cHSYjdF0fz0fQfT5r0avt07
         nq8cg7ODvqcLfdAPk/YHg9azI/kUw8IOqKn1dV299dlnHschpGz65crsDNzu4YxpoxPw
         NtHaD0MZgVYh7mlxMEqxrK4IBTL95n8vcod3yhuLfFQVP6+xVp+q2ZIV1t/kjXsCchzi
         Prgwy14wQi5ziOJMDYxHkW8oBMqlkeuC1wZu4/cyQQo9Eo2InPZ5YSFX5g4HXEOvtLsA
         D4DiuUv4ZIHZBmP8IQX86irI9/U9D505Yqb5Cg32OviDvJ3ddpyyrXlZn6QYlPRXAKAD
         8F3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790135146; x=1790739946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZoBrlOKKae5h9YawjwIgBVWbvwNAnx3gQiwI9yKP0ug=;
        b=pfMXta1MGJiOqlzGubhp7rC/Y7iCerbljCRkZthY4bhM2xC32qRUm2sbzcpAp4JtBF
         3XY+54wp4oe38dIqV7dxVlPqXZ+tYg0DDXGGm93GkzyBEC6kzX4r3VsDsks7iNypgFYl
         AFCl5SP6a55LOlNNzJJhp8rgSubjyzDicfktXSPFtYd3YiUde2hHUnNIZt4PY5D778UR
         bTm4ukBAI9I8ZQXijXUa3vPmLVMnsAZnHiUsEO+D3zqu4s4gZwMDYJH3DYuDYZ1Zowit
         d68FGruci4V70OqDy7/4lzyz61g/wnfca5mvk7YWU0OBgpdmqnbAUc8qLSnANOWK9XiN
         IYXg==
X-Forwarded-Encrypted: i=1; AKwUvBw9UZKvKYcTJghn8rOfMDL4a4gRm9MxPUiUMBX8xuaO5pOHxUqBnQph8C5w3xJhwzlUh1QKk68zZnMj0oM=@vger.kernel.org
X-Gm-Message-State: AFuF++mE2TIcHmNkeYaY5w8NohLQCNE5vNKk0+sHSWBBvZfhxrsrODBs
	uf/SSe3PMd99U227cbrdezxNST8IgoFHgqFPj221477YqSzfDG4T5o/Qg8jzqgdw3bk=
X-Gm-Gg: AYBFou09Jalpn7gZi5IgzLvmeji01pNti8NXFCpYDcYFIoEl9UYygHMFdWhSgKrj5/F
	y2nGE2o+H3dwhPrbXruvZGtSN1p1S0SVvA7cgn9MqFL02m5d/s/QP2PcOxosQuCVI0yMdXuvNwx
	qwJqTT+v3NxhVqXbZ3IsKgDlmWiZIuQf3UpkIlYaJD+u7A5CT4n+C9+zyT2vs6xugdivInL/sns
	t8Kgcz/PucnJO8PWKcJbRZGMg3uIFhKr7gTyGCsZP3vpU4RUeLPFRhTTObUIohJ1EhtVDO3ALQp
	GXeouuyxktmmmZ2vNC5lYtIb2+NC8C9+FrEM/sGm45wjnG6qPtMRWletYU4FUHH5fsHFJ62jkTY
	1Bgs0jkFQdYJnnycrNwUERGK6am7ptOpzei0pDveW9UATlGM099rWmKBf4Bs2kHIbVUNjzzDFJi
	0/87HVYq58nMsYDZhYrznWfDpjZdCPmndfzMhMIQzHccYx+GKW9TnzRNhQeMG7yT0i33nFwXlz1
	qr8SbYyzgkHYaxYb6YFJGd3pJvqH+vj1AnFCg2BizlpeUqe/OUNSfU=
X-Received: by 2002:a05:620a:6f04:b0:93b:d79e:18f6 with SMTP id af79cd13be357-93c2521bb42mr221267385a.57.1790135146524;
        Tue, 22 Sep 2026 20:45:46 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248a1481sm136441685a.35.2026.09.22.20.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:45:46 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:45:44 -0400
From: Gregory Price <gourry@gourry.net>
To: Qinyun Tan <qinyuntan@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Usama Arif <usama.arif@linux.dev>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Xunlei Pang <xlpang@linux.alibaba.com>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] mm: memcontrol: drop kmemcg_id and use the memcg
 ID for list_lru indexing
Message-ID: <arNK64PxTXbVEhis@gourry-fedora-PF4VCD3F>
References: <20260907110111.2286932-1-qinyuntan@linux.alibaba.com>
 <20260907110111.2286932-2-qinyuntan@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907110111.2286932-2-qinyuntan@linux.alibaba.com>

On Mon, Sep 07, 2026 at 07:01:08PM +0800, Qinyun Tan wrote:
> kmemcg_id is a copy of the memcg ID assigned in memcg_online_kmem(),
> and is only used as the list_lru xarray index.  With
> cgroup.memory=nokmem the assignment never happens, so every memcg
> resolves to the per-node lists.  The next patch needs the index to
> work under nokmem as well, so drop the copy and use the memcg ID.
> 
> The ID works just as well as the copy did: root and NULL still
> return -1 and use the per-node lists, and the ID is only released
> after the list_lru reparenting, so a stale or recycled ID can never
> reach a live list_lru entry.
> 
> The early return of memcg_offline_kmem() under nokmem is dropped as
> well, so the reparenting also covers lrus that stay memcg aware
> without kmem accounting.
> 
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>

This breaks an assert in memcg_struct_check - i think you want to drop
this line as well

---

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 5d7a26c91610..fcba9eb55659 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5886,8 +5886,6 @@ static void __init memcg_struct_check(void)
 				      private_id_objcg);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct mem_cgroup, memcg_read_mostly,
 				      private_id);
-	CACHELINE_ASSERT_GROUP_MEMBER(struct mem_cgroup, memcg_read_mostly,
-				      kmemcg_id);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct mem_cgroup, memcg_read_mostly,
 				      oom_group);
 
