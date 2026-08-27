Received: from mta1.migadu.com (out-94.mta1.migadu.com [95.215.58.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FC742587F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823926; cv=none; b=UC1p2+Np259hPJsrLSA+NeXHg/pqW2CkwNIC7jH4I/zpMiGWgenY8Ti+4dfq8QMVDDK9FMAGhtquxyqtprx/ZyowWptLQRnKLDgmHWZx+Qjbvi1frDRm0Q42GlSqXldMg1c4pAH8olZ9myxa6iFuOsGEcHp4ssX1Syp+7lUVIhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823926; c=relaxed/simple;
	bh=P/mBw4On7JK2yuXZ/gwD1zGEnHiKF73tBjarq2v9Neo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=iyAV1KJvRahNZhGFetQuPkYflrRmw/gmDmHwrAX6GhqqcttdrcGzOJvKH+yhqx+PFOI3KlSyGq71iI1IIL3+YEhQD2oIYtxKl8SxCzlzxPWBqWKGwmaE+zanT5OyNMJ3pMEMQI+XiSGPVMN+f4oo9J4nzX+VrqBEl0NkmZZu0e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 70fc1b369778f235;
	Thu, 27 Aug 2026 09:45:20 +0000
X-Mizu-Trace-ID: 70fc1b369778f235
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
Subject: [PATCH 01/16] mm: zswap: return -ENOENT when the swap device is gone
Date: Thu, 27 Aug 2026 17:44:51 +0800
Message-ID: <20260827094509.1016740-2-hebaoquan@kylinos.cn>
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

zswap_writeback_entry() returns -EEXIST when get_swap_device() finds no
device.  -EEXIST is the shrinker's "page already in swap cache" signal,
which makes zswap_shrinker_scan() stop shrinking entirely.  A NULL
get_swap_device() instead means the device is being swapped off, so the
entry is simply stale.

Return -ENOENT so the shrinker skips the stale entry and keeps scanning.
Independent of xswap; affects all swap devices.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/zswap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 37f34e406c8e..b9948d4657d2 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -998,7 +998,7 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 	/* try to allocate swap cache folio */
 	si = get_swap_device(swpentry);
 	if (!si)
-		return -EEXIST;
+		return -ENOENT;
 
 	mpol = get_task_policy(current);
 	folio = swap_cache_alloc_folio(swpentry, GFP_KERNEL, BIT(0), NULL, mpol,
-- 
2.54.0

