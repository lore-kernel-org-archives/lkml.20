Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB6A58494E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891601; cv=none; b=ZLYVOOTAXHIu8R7SPZJk7r5WxEwdPE1/V++Keh5N0pSbh9Z/DM5oB462xjnBplg2QkJ1NKfs2x/z2xJfNOC9cp+yikctpaXV3rRXsIFlxF74htIhLcgDpcqhYInItE+2MAKdCy/E+whaLGKtLx/kKgJfe7+rgTLuWGSH0M8WV8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891601; c=relaxed/simple;
	bh=qiDv62Xva9oTEOsugrQNk034VmUQViPUM+ER9vte+0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xo5ufdHqLK3IoXk3oGDaUMPMF6BhKwF6d+vd1ofBE/jlUZb3a8ZsW1pM8EWo7Vv/nHQwSprWwNq1VuS5r7InXhNYasRh/w1OM0FP7naMbh5ERuqm7n3r4TzLBf5eyHtyrSWmaNjKRF2U91krdvwPkZDeg68/IEQY/Wd60MrirpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=MBC+6B7S; arc=none smtp.client-ip=209.85.210.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="MBC+6B7S"
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-86309e1a213so1140044b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788891599; x=1789496399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sL+3R8dC0d/UZInnr5kKfu/nnPuO6yeb+usfGZ1iKxk=;
        b=MBC+6B7SJE2MTZmfhk9bEWf4QBxPSOF6/qNJq2g2akOwSrN48PCRVzCOaXe9oZF3+s
         VhRWC8L4NCa0bBMC37F11G9iKTfHnz8/t2Pk8bOa6f++hhIFbuYYAT3Xi7Tck/fCZ2Pd
         4YZy5GtV4tWLuFFa6B17LZM+6U2Jady0Hkpk4VNorRfHAp1fW0rQEm31cihC2ZhYNYsz
         50AIQbaKJM/2HbGl+6pPIWLA/7CqhnEcn0xADVG6M5fUBYIA4lBTHEeM9EUVeTP2Aj8c
         IvWFXfdyASPes+4ghgC9m3lLLfiGP3PgoHLPgHsYb+zYsdirApEeSCk0XXQi0BDe/A+3
         h3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788891599; x=1789496399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sL+3R8dC0d/UZInnr5kKfu/nnPuO6yeb+usfGZ1iKxk=;
        b=iG4usRXNMtgHEvxxAGfO2mJ3o2pYxAD2h5IxBXjXWOVWIdaXb5DKxK4IdETFvzZmKT
         oRMZyK5wgAzQh8ZJ/uDFJhEJT79Dod9eBXXjRMt+7EEL7rf/KJztXvJXsbnce3vFJYzE
         Jl7aKOJZtSlI6oViPyTcR8vcZrpQgOIQmgHfFjEIejl6kzjRsFPt+duO9jcsRbOgAqiq
         wNhyKqO9/KL0NKApMQdNXn5PqqO08BwFPBdl5+AkVCsyNHa/HdV/F4nGrvKrNIunogAI
         QM/8ctlS65PBEmByqBIhhkXQtpY25d3xBnMvB9AXalapa/o6GVijgS+VAbNHtgRW4i+l
         zFFg==
X-Forwarded-Encrypted: i=1; AKwUvBwGQB25X9cDMiJox8L8bySa3wmt/178v5+KrflqvGfgvdvNKcuwl6Oh17RVbgX9kCuqUEAbshstiFignVg=@vger.kernel.org
X-Gm-Message-State: AFuF++lthdgXcmoqz4GUP1KWdboLr2RVApwaTnb2Mszemoyj1Oe4zLXP
	I3hvRa/eXdLEbNkypzXckFg8s+kmbYRn22BpyOP3SNdlmrhdW3JsmEccMC1phjy90WHx78hd/hz
	EgPl3x/NTA/URQvh4T7yO7ZVf6z+Hlk9s4ZKX
X-Gm-Gg: AYBFou0Og/X9PilZWsHm6lu3I77DAqb18JBKQg+ilw5EQMW4u30bGhJ+A31B9iLCzM8
	Jtq9422TVb/WAmpWY6n63JQVY4yGeGCbGhmFIzDO0/CMMwxz0wLbU+bsouPT0B2rnGRCd5gZLUQ
	aksdDO8Kw8SuC5sK+clyNlUMLohb0YI1ryB9mFi09wCkQevsHx9o8RHds0INKOPjzRahQIZ3cYZ
	DNQ1GZGr+i1rEVNWiU10KxUDebygycXoEvWds1TS270m3i3clVbJqzMtlRMnBDlE5dWHy+pe6/a
	K3Gzoeaw9GAjSWYMgQVHDyEOxoDc9X/iNNL5zJkbqD1nyOOAtuZNNFvymmrL4g2Y6OEn7YmqUBT
	bajtLRm2N57Pdn6tnwoYDsmXSIHQD1Hue+0AlzA==
X-Received: by 2002:a05:6a00:9286:b0:84f:77cc:63cd with SMTP id d2e1a72fcca58-8616a06be4amr42617120b3a.17.1788891598814;
        Tue, 08 Sep 2026 11:19:58 -0700 (PDT)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.128])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc45542b998sm2714294a12.8.2026.09.08.11.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:19:58 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id A822234041D;
	Tue,  8 Sep 2026 11:19:27 -0700 (PDT)
From: tmenninger@purestorage.com
To: Chuck Lever <cel@kernel.org>
Cc: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Badger <ebadger@everpuredata.com>,
	Jon Curley <jcurley@everpuredata.com>
Subject: Re: [PATCH RFC 6/8] SUNRPC: Reduce rpciod workqueue contention
Date: Tue,  8 Sep 2026 18:19:27 +0000
Message-Id: <20260908181927.783442-1-tmenninger@purestorage.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <425864a2-3276-4c16-a861-32defe5e04e2@slotpi15m67>
References: <425864a2-3276-4c16-a861-32defe5e04e2@slotpi15m67>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I reran the matrix. I'm at a loss for why, but I can no longer reproduce
the "bad" throughput with cache_shard. I saw that a few times last week.
Furthermore, the "bad" throughput is now a 10% degradation rather than 50%.
Nevertheless, it's still reliably reproducible when CQs all stack on NUMA 0
and using smt affinity_scope.

Patches 1-2 alone do not reproduce it across 5 trials where 3 of them fell
32/0 and 2 fell 17/15 on NUMA 0/1. All had full, unchanged throughput.

Patches 3-8 do reproduce it (as well as the full 1-8): throughput dips by
10% when all CQs fall on NUMA 0. Another behavior that I'm seeing again is,
within the same run, toggling affinity_scope to cache_shard fully restores
throughput, then back to smt and the throughput falls again.

The mpstat results, CPU idle times:

                        All NUMA 0          17/15 Split
    aggregate           20%                 70%
    CPU 0-23,48-71      0-2%                60-80%
    CPU 24-47,72-95     40-46%              70-90%

This shape is generally consistent among all three patch subsets: patches
1-2, patches 3-8, and patches 1-8. All of these are without modifying
affinity_scope for the respective defaults.

For patches 3-8 I reran the same experiment but captured mpstat on each
segment of smt -> cache_shard -> smt, on a run where all CQs were on NUMA
0, all idle times again:

                        smt         cache_shard     smt
    aggregate           15%         32%             19%
    CPU 0-23,48-71      0-1%        6-9%            0-2%
    CPU 24-47,72-95     28-32%      55-61%          35-40%

I've also seen all CQs land on NUMA 1, which seems less common than NUMA 0,
but the same behavior appears there with the node roles reversed.

Would there be a downside to using WQ_AFFN_CACHE_SHARD here instead of
WQ_AFFN_SMT?
