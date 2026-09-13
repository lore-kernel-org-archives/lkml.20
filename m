Received: from mta0.migadu.com (out-152.mta0.migadu.com [91.218.175.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EF87E0E4
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789285878; cv=none; b=frTxDRXJ5Fq2GVZvRTUiQDoApdxAXWCRfYVa+q2LOy0oW/2q27I7auHO30ByPu364kb0mEAl0pPYGBpgKFOIYXR2hV7MldixQsW6ZdFBJCIKoFPr8Ymj6fqmPXdC4dSspTDugrjP6Bn+uDy2rXxA0CzCugDV1OYQjvGe9Ga15ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789285878; c=relaxed/simple;
	bh=3L52fWkgGdddNo2ewF7UMTlpFe/vsOHFsRA/a0S+UbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=U6AaEcneHGjCzlc23DvgjyZodMUH/HrdkS2Vf8SLbooqlRY2mfCfR3oI27PeF975zPH2miXCphqzxdH46VqFkYB6OvSCrE7f7Vcxv4chxVJtyUX89GXp3Cw0x71dSLoGL0bHgeITKS1UVyNy7YATUR91/4ju1sIkZeZlzX75em8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id bd2b349e2fca1da0;
	Sun, 13 Sep 2026 07:51:14 +0000
X-Mizu-Trace-ID: bd2b349e2fca1da0
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
Subject: [PATCH v2 11/12] mm, swap: require zswap for xswap devices
Date: Sun, 13 Sep 2026 15:50:13 +0800
Message-ID: <20260913075014.1732524-12-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260913075014.1732524-1-hebaoquan@kylinos.cn>
References: <20260913075014.1732524-1-hebaoquan@kylinos.cn>
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
consume swap entry space without ever freeing memory. Refuse to
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
index 0321b6b0da56..c2ca0a9ac625 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -4305,6 +4305,10 @@ static int xswap_create(int prio)
 	if (prio != DEF_SWAP_PRIO && (prio < 0 || prio > SWAP_FLAG_PRIO_MASK))
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

