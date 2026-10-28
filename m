Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187218;
	b=Yykg6XT8FUxbpT9niBXgAUFo9CxaRxr1axvXHc/0cetqd6bYj72wvRDZJTRZ5NXKbwe5
	 2vtrDdjrHvZ8RJanxwMPij3FShQ0Mil35rYNVVsE292QKZm9a2Zgibr7h5Ws69neofyD2
	 eXA42SaE+vzvgS1MTDgz+KJLZ+9I+QCJb+RRoCuSWHx8LSQTVvCkvkU3VtexWsrFld2pF
	 Ovz9f3r7if3045fsOy4d1S7ycBXxb2jpun23+M8KO1jkfYA/wCgEEyujN6+Sqoll2m53O
	 cn9V90RH48J+aGIf1q0IGAyDdQfU6kjG1b81wnL9YS7OERpy3glr+yR5o1tqfyzAZRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187218;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DYyWO7IFZ8NnMGxqJk1c136n4piizJJ+e+oNjZmZUYM=;
	b=AvuzeV52mZlHghOlpQTXG6CIqLqxzzzT5TBLY9xJdr6I1qElOAtIWDKT7DoIqqDQonbk
	 pS2eg+6kGTfLDL0DW4Y3D8SDO77YbR4zFFdRqTk24RXV5xmZTzIoQFrGv87/PrANzL1pD
	 Vt8agtI4xORspnD7AkBHC+XufZl/HLZpUO4txTkdmqxFoPCnP9Crwl/YiifOMfr8fFnuL
	 J6bTbDpnWTFyOaLzEydAhBMOQ5989CxO5Im6F9MUk2Qv3Tw1hgmDLFzq9g3fu90n7RX4Q
	 sVEbpyTjMiAWtIm/EVglKBrMlwvBp4s1G/zdCEyH4S2/5pzgDczasnDStFKVfYUVLLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QgDHCjFr;
	arc=none smtp.remote-ip=91.218.175.39
Received: from mta0.migadu.com (out-39.mta0.migadu.com [91.218.175.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95594606A327
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95594606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QgDHCjFr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MsFjm2rc5UIeYKXjIXqxPFWcyN0aWeNxJ6c8Yz/3Cjg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793187215; v=1; x=1793792015;
 b=QgDHCjFrIxFsL9bpcPCU43RgNEfGTTyMJrC4qYryNHZsTsg3j/VBMyczw9H3xNCT12Kbi8ym
 7UWLI0/wSshcrWD4Dx+EK8wR8AxhR0ICil8EpBDaO5hJ4RLbyl0Jg3ekPkdfa4rDZJESOv02jrB
 F5O0VLEPFUjdmYGA86IJ/Fm0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1b8b82fa4a673740;
	Wed, 28 Oct 2026 11:33:35 +0000
X-Mizu-Trace-ID: 1b8b82fa4a673740
X-Migadu-Flow: FLOW_OUT
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Frank van der Linden <fvdl@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Chris Down <chris@chrisdown.name>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [PATCH 1/3] mm/hugetlb_cma: fix incorrect hugetlb_cma_size assignment on malformed input
Date: Wed, 28 Oct 2026 19:33:17 +0800
Message-ID: <20261028113319.38544-2-kaitao.cheng@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028113319.38544-1-kaitao.cheng@linux.dev>
References: <20261028113319.38544-1-kaitao.cheng@linux.dev>
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

From: Kaitao Cheng <chengkaitao@kylinos.cn>

When hugetlb_cma contains a global size after node-specific entries,
cmdline_parse_hugetlb_cma() enters the global branch and reparses the
original parameter string. For hugetlb_cma=1:2G,4G, this interprets the
initial node ID as a one-byte global size and clears the 2 GiB reservation
recorded for node 1.

Global and node-specific formats cannot be mixed. Return -EINVAL when a
global entry follows a node-specific entry, before updating any settings.
This preserves the valid prefix, so the example retains node 1's 2 GiB
reservation and reports the malformed option.

Fixes: 38e719ab2673 ("hugetlb: support node specified when using cma for gigantic hugepages")
Closes: https://sashiko.dev/#/bug/linux-10f40d3e-3feb-4622-9da8-1fedecb2d0e2
Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 mm/hugetlb_cma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
index 95fd2d190f0d..8e6b20341fc4 100644
--- a/mm/hugetlb_cma.c
+++ b/mm/hugetlb_cma.c
@@ -167,6 +167,9 @@ static int __init cmdline_parse_hugetlb_cma(char *p)
 		} else {
 			char *next;
 
+			if (s != p)
+				return -EINVAL;
+
 			tmp = memparse(p, &next);
 			if (*next == '%') {
 				if (tmp > 100) {
-- 
2.53.0

