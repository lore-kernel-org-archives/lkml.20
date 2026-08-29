Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22D22E54B6
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787989336; cv=none; b=nHVj8ky3/GDD/UiDFKTWOhHYe9HjILgvPCDYjE/ne8U2TZcOJoAH/oG9qhi2wm6Kxd8xj3GEX8mWb3alUfPsZHRgQvQ5aaAblOQq2hiLuXae+GiKROm4GQlErv/7vhtGxurwkBDXIuPrq5sf9vPUUTaW2VmE+9kkDyucRiQS70M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787989336; c=relaxed/simple;
	bh=NTxYo9Ej/c8YW+EPb2/nm3nEJ5raymWy1rczZfm2QRU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EM92x+bs2LuW2bgFDvKjaybFIT+PClqXtnabr6opzeZacwNvfi+HkUCiZ85n06Xp+P7ew1wZQ0dN7blbZDtUdsozLrvYJqZSiHQa7JLarVUbQTy6Up+w0oKO2jP0auw2oW8Txpbv7wWZihw4K6yPH9kn9m/ZF9xEZJLed810HvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGnCJk1u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGnCJk1u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17B71F000E9;
	Sat, 29 Aug 2026 07:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787989335;
	bh=DUmBwzRISwqZ5Rg6ptgDhg+OBbGHowA1pcDsVBKPQN8=;
	h=From:To:Cc:Subject:Date;
	b=ZGnCJk1uq36JecqZEMc1G4T5znWg/8/9HBjU2rywXy9kz+ORqzwgI5JGijLFds+Ue
	 QK9bTTo33n3N6/iBWBhiXyHkg6WRZ3vqCDahxUgraUp9ieP+rIeXP8TtU3xr3BL9bq
	 VNAarmVH/a2v1yzOLZZ2295719l+n4xVHIIjnZgb7Aj/HQCJn9oxULymVxb80Pk94k
	 N1H8Szl2iX6q5u4eKAkdVLV+jE2vUw1feGhE0JNF2K03Q5ILB513+ep5nanDr9VwJp
	 ADP1KCNKF/Lg7CUPLfo1uIfbD4mUORCnYKSaxobnZbCk2PsiLtkDuDSsJDjVhZ4kwo
	 jZc8+rba/V09A==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [PATCH v2 0/2] mm/mglru: clean up isolate_folios for readability and clarity
Date: Sat, 29 Aug 2026 15:42:02 +0800
Message-Id: <20260829074204.45304-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Right now, `isolate_folios()` is quite difficult to follow:

1. It uses `for_each_evictable_type(i, swappiness)` to iterate over
   the types, but `i` is not actually used as the type within the
   loop body.

2. It retries the same type when folios were scanned but none could
   be isolated, but the retry is implemented in a rather subtle way
   that is difficult to understand.

This patchset makes both behaviors explicit and much easier to follow.

There are no functional changes for swappiness values from 1 to 200.
There is a slight functional change for 0 and 201: with the existing
code, there is no chance to retry for these values because
`for_each_evictable_type()` only iterates once. After this patch, 0 and
201 have behavior that is more consistent with the 1-200 range.

-v2:
* Rename patch 1, to address Baoquan's comments;
* Drop patches 2/3. Patch 2 seems to improve the zRAM case
  but negatively affect the SSD/NVMe case, according to Baolin
  and Kairui. Drop it to keep the patchset focused on readability.
* We received many tags from Baolin, Kairui, Ridong, and Lian.
  Since patch 1/3 and 3/3 were renamed and patches 2/3 were dropped,
  I did not carry the tags forward. Many thanks for the reviews,
  and hopefully you can re-review this version.
-v1:
  https://lore.kernel.org/linux-mm/20260820045603.68809-1-baohua@kernel.org/

Barry Song (Xiaomi) (1):
  mm/mglru: make retry logic explicit in isolate_folios()

Ridong Chen (1):
  mm/mglru: make type fallback logic explicit in isolate_folios()

 mm/vmscan.c | 56 ++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 20 deletions(-)

-- 
2.34.1

