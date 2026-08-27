Received: from mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94686439F9B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824015; cv=none; b=iRKkqBRowPFC+IWKgyOG2Zm6jl/GTsywxTd/XtHA+EYF/asfd8D3m7a6zoWEkib2snXMIzaGv6+F8DjdS88NL0Db4t+My0fq3dshPlmL79varPGwvwyzBUD2A9ZJfYjv8EuHXVyML0ROXxZslROKlzM/aVSMWidwMnZ2TfURC/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824015; c=relaxed/simple;
	bh=nydm1WiGGYkpZovjoCpxjlwCApq8bdWHLualY4nQAq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=cfstI47j3/3Osq21Dz12COiVHWG6W/lp4DSYD8yz50FKxnvklPYfO2DvO40Z1IwzjoLTq/mMkFgsACCe8Mk7EdYPZ4xGs6WIBjnPkzrchC3zn5SivbQltIkyTcz/pQmqypF7VHc+BuYgR34ZU4utzZOsm8ouEKf359hjshhygmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 5fce0ac242cbe7aa;
	Thu, 27 Aug 2026 09:46:49 +0000
X-Mizu-Trace-ID: 5fce0ac242cbe7aa
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH 15/16] mm, swap: require zswap for xswap devices
Date: Thu, 27 Aug 2026 17:45:05 +0800
Message-ID: <20260827094509.1016740-16-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

xswap has no backing storage: swapped-out pages live only in zswap.
Without zswap, swapout always bounces back, so the device would
consume swap entry space without ever freeing memory.  Refuse to
create a device when zswap is unavailable.

Runtime disabling of zswap after creation is safe: existing entries
stay loadable (zswap_load() gates on zswap_never_enabled(), not the
runtime zswap_enabled flag) and new swapouts merely bounce back to
memory without freeing it.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 451b46b747e3..ae0c549cc9aa 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -4349,6 +4349,10 @@ static int xswap_create(int percent)
 	if (percent < 1 || percent > 100)
 		return -EINVAL;
 
+	/* xswap has no backing store, it relies on zswap. */
+	if (!zswap_is_enabled())
+		return -EOPNOTSUPP;
+
 	si = alloc_swap_info();
 	if (IS_ERR(si))
 		return PTR_ERR(si);
-- 
2.54.0

