Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959561;
	b=M347QZCRyVnn9ZMEOX6oHQfl9y41JncUyOw27xKtjWboM/wRAzKHNuumF9IaM0JcaAB+
	 SnfBThv17lxjExqfkAxHEmiJGBTnqQKWg2wot+sWuvxjXpGjXozE4ZQaljE7LZ1dAGBSk
	 UXGYMCl0dTOAJ0oSWoSLhrK05mZa2DGsnXPOautfwyybg8O6i4vcC866mwcd5Yxh/AVJu
	 xX7OoaW1+Msec65f2n5aO4fAbQK+iidLSf6C+6J7jQv42t2w1ViNy/F/gmPqEgSIG0bVE
	 K37A2ndlTajC/P5R8m44ye2oin+S6AIsPsAg3r+g4k0gsIXBfK9tdCOxWrUhCiPiKvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959561;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7FWvjRm5VHt/o3Fu51zLztgQLTfGfWw2bGFo45jXROo=;
	b=Ml4lg7NhUQMqeSIFVhDo9I69zFxOGArv37tiJUJXgzODdvbCn2/wTU+H5s8W0WtEqc1/
	 yNYXNz6bY4MFl8Lu9eqcJJ7zBPnl1XHvEnsYZp0tFUKGbeXgKmkxJPPBRGGdMgR6duorg
	 8U1PrGg4hJBMz/Z81iC0MwO1mrJ9IeDEH95rL0o77YjltEv1diM01huHfhRWg6FGudTt4
	 szx0zowcx0QpoQinrcIFRK8ob0ORMqIKCwsF9zGLbB9Ey4B/5iR++SVcWx9ZJ5ausjNQG
	 fX5t/9aVU9RLJgJW7LvuZwBpT4n3qnFPrcNsuZUyMdv71/N7fby7o4eaS3ShXjZlg2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pJrwF2pq;
	arc=none smtp.remote-ip=95.215.58.146
Received: from mta1.migadu.com (out-146.mta1.migadu.com [95.215.58.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D03606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D03606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pJrwF2pq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gmhp/zhGP3DAO+86b4RAlsAtIQ84L/beRI6uM3dmLu4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793959559; v=1; x=1794564359;
 b=pJrwF2pqbjdw01C/gZ2ueKzvCk+VjkI6WCrAjOe966atQmcFeQ5qTY83Ko/GNz69lvpZ1dZ9
 s/XbXa8Ooy0luIOXcSZ8j+KGPwSltxDFf0p++OS8HmXbnmmVmS7KC2PNmNKgvzxSiz7g2tkGP6t
 vuudGTR3+4arUemMHnTriZz8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a67021b1b9df2a3e;
	Fri, 06 Nov 2026 10:05:58 +0000
X-Mizu-Trace-ID: a67021b1b9df2a3e
X-Migadu-Flow: FLOW_OUT
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: Mani Tofigh <mt4022@columbia.edu>,
	Zi Yan <ziy@nvidia.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Frank van der Linden <fvdl@google.com>,
	Chris Down <chris@chrisdown.name>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [PATCH v3 1/4] mm/hugetlb_cma: fix incorrect hugetlb_cma_size assignment on malformed input
Date: Fri,  6 Nov 2026 18:05:18 +0800
Message-ID: <20261106100521.30099-2-kaitao.cheng@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106100521.30099-1-kaitao.cheng@linux.dev>
References: <20261106100521.30099-1-kaitao.cheng@linux.dev>
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
Acked-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 mm/hugetlb_cma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
index 80b2407e9f07..cd6a64986278 100644
--- a/mm/hugetlb_cma.c
+++ b/mm/hugetlb_cma.c
@@ -165,6 +165,9 @@ static int __init cmdline_parse_hugetlb_cma(char *p)
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

