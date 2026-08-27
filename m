Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FDE3BCD38
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818027; cv=none; b=tbPchx4DKL7mQl7LsTaUsOgZNZqtr6bjbWm9eAjdOxIA18rtqFfq/u7Y6sIihy9rIuJ/QViLp+cueCnVnL78yQAIsEPulyn8eM3tJyaol8uGFCrUN1jFv1N+K1cbpy+5BV8r19ygXTETN8uv8hrkaED8hoc1v6XZuyUuFi2e9E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818027; c=relaxed/simple;
	bh=RpIrQhwVYOYU5j8do2R4yAkldRlNagVVhS4E9lEEacY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hJPkNeQtxTMsMPVFdU0YSgPmE3j3W7Tpl0eDBLbvm6rjjtwzCIRqQYMYdfQe6oQ2YPBv6BODzvpB6Ey59N/z6SDyQW4phVRJ0mG899+PebbKunB6EHVB7T5e9GYIAjp/44c9ZtKvsAgQpAqcxpypLLIbgqbrlSonKyZqaN4jur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=YSfrzoIv; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=YSfrzoIv; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="YSfrzoIv";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="YSfrzoIv"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iqJEGxzt/5Md+xChD1VBbpbC9+3Knut6ftXuGJ5kJuw=;
	b=YSfrzoIvlCPYebNJfeCnPgUuoNU29ch67w2ddM8IcF2HJXxbPV3FpyKWY1JOFtoEklHPMem6F
	onBgmKK1OzuZuC+MmyRSYmHSC9fM9H+iJ8xvfJ/s9lI0hWwSlwDbEWtB0zucyvIAEAP1FmDT8fx
	f90JjgwrAs1WnGgPQFYXdD0=
Received: from canpmsgout10.his.huawei.com (unknown [172.19.92.130])
	by szxga04-in.huawei.com (SkyGuard) with ESMTPS id 4hVvGc5dQ9z126M6W
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:06:00 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iqJEGxzt/5Md+xChD1VBbpbC9+3Knut6ftXuGJ5kJuw=;
	b=YSfrzoIvlCPYebNJfeCnPgUuoNU29ch67w2ddM8IcF2HJXxbPV3FpyKWY1JOFtoEklHPMem6F
	onBgmKK1OzuZuC+MmyRSYmHSC9fM9H+iJ8xvfJ/s9lI0hWwSlwDbEWtB0zucyvIAEAP1FmDT8fx
	f90JjgwrAs1WnGgPQFYXdD0=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hVv2z2mw3z1K9Ws;
	Thu, 27 Aug 2026 15:55:55 +0800 (CST)
Received: from kwepemk100014.china.huawei.com (unknown [7.202.194.62])
	by mail.maildlp.com (Postfix) with ESMTPS id BBF99402AB;
	Thu, 27 Aug 2026 16:06:41 +0800 (CST)
Received: from huawei.com (10.50.85.128) by kwepemk100014.china.huawei.com
 (7.202.194.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 16:06:41 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <akpm@linux-foundation.org>, <chrisl@kernel.org>, <kasong@tencent.com>,
	<shikemeng@huaweicloud.com>, <nphamcs@gmail.com>, <baoquan.he@linux.dev>,
	<baohua@kernel.org>, <youngjun.park@lge.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<yuehaibing@huawei.com>
Subject: [PATCH -next] mm/swap: Remove unused declaration swapcache_clear()
Date: Thu, 27 Aug 2026 16:27:22 +0800
Message-ID: <20260827082722.1809702-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk100014.china.huawei.com (7.202.194.62)

Commit c246d236b18b ("mm/shmem: never bypass the swap cache for
SWP_SYNCHRONOUS_IO") removed the implementations but leave this.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 mm/swap.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/swap.h b/mm/swap.h
index d077e5893a42..29060a305443 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -344,7 +344,6 @@ void __swap_cache_replace_folio(struct swap_cluster_info *ci,
 				struct folio *old, struct folio *new);
 
 void show_swap_cache_info(void);
-void swapcache_clear(struct swap_info_struct *si, swp_entry_t entry, int nr);
 struct folio *read_swap_cache_async(struct swap_io_ctx *ctx, swp_entry_t entry,
 		gfp_t gfp_mask, struct vm_area_struct *vma, unsigned long addr);
 struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t flag,
-- 
2.34.1

