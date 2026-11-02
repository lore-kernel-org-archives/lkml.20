Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587785;
	b=358955Kam74yton+T4zUdsEm9/7jnaayGaVzpvZoMfCTImga/0ts+wdrcJcv0pWN+ybe
	 lfYGkHC7Nd1XUQkYvCvStSXnVGOmZNgijuyxynOnPUra1HlYbY/vlNgMwyBxy8hBDVJr0
	 2EhvQoePiIw+EfWbp4lleBBgV/jHk5SSVLn/nr4fo7z7FP+/oPHW10q/P6/v44oGjqDe+
	 hPMp/AthlCOKwZrgYQWp5krZaTchL7bNSut/2XCq7FXNd+zrxHFOO2kz1inHSjL2OkJWd
	 4RLSGKQ8+16UkhThpVxLCl+CWYNgmieU0viSDEmRMdsF+tq7B/3gi1Gd72USzl4ntDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587785;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HYPCOH7nyOgzPYBliYS/2JtpB4PHhc5GiSJqiBbOPVw=;
	b=MnQiyIbBpYSQLei1akQoRwVh3RLwFTVSq9kdJCyswTaHz4qwAvZLEI4+gt37mUsCjSDo
	 zZhgMoDL9hFUAr6EZDpuqCdLFUel9VKzQJ4QCHbAPPVypaHg5t0XF00sbydlVWQGL19Hi
	 /L6SVPlLOrPTjxiiK6USnNcPR1gvsQog02jtIYic53tbCtyOcwU9TCU938ZaPMhNEsGtp
	 KsQ5VSdfGZEDDDp0qqqWsjKg1PZh6M+S3KfU0PVvPDnwklFZzaXStDSRh+4bU5lMRCcQY
	 EC1eAyA357iTmByhBSDFOiIBw5/W/18HLJFdWEtUNBEY4v7kIZF+sDk9bqEoVjvubHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VfnYXBQ0;
	arc=none smtp.remote-ip=91.218.175.36
Received: from mta0.migadu.com (out-36.mta0.migadu.com [91.218.175.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2206606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2206606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VfnYXBQ0
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Hqb5dpR6SO9lse5taSFwdMkdZpYAQoi2qmmKSFxQn94=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793587782; v=1; x=1794192582;
 b=VfnYXBQ01a7sVa5ydFtRlIT6q84NfQa+KhReIULOUdKEiLrSUyvWmlp74enHW7qFBqOqwGaJ
 yTma99ZcqhiRfCKJzznyBF6L5LDKR2ynY9tN5wju7SdJnBeTgbn8Tl8cVG5646Vtl/T/lEX91jF
 gzNhkk0Edft2a3OqqqvlWVrM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8fe3ad59e5aaa9ab;
	Mon, 02 Nov 2026 02:49:42 +0000
X-Mizu-Trace-ID: 8fe3ad59e5aaa9ab
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
Subject: [PATCH v2 1/3] mm/hugetlb_cma: fix incorrect hugetlb_cma_size assignment on malformed input
Date: Mon,  2 Nov 2026 10:49:08 +0800
Message-ID: <20261102024910.31486-2-kaitao.cheng@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102024910.31486-1-kaitao.cheng@linux.dev>
References: <20261102024910.31486-1-kaitao.cheng@linux.dev>
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
2.54.0 (Apple Git-157)

