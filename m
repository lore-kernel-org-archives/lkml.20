Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593BD4F96DD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892660; cv=none; b=QrJ4FHmiuXpZ74hpYZfdKGt++a3umKS2ac0NPApe6+pS/TyKBEaDJrBtq0ISWR5Gv6XyEtBIRPXyRNJHSErMqLklR1XfTvbZLhLxgHy0tZ8MCPHUnMeRlwXil0y58Nj+2N10JzuzjDhM8/tzbeqk9I9pKIJV2H3HiGfmzHQ/Yq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892660; c=relaxed/simple;
	bh=/ho59YYnhtLI6e5VsRQwIhm4teDXxGxiYcdym0iDxWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+Cb76sTKaHGpEMhqfA4BKwQisk/4x7oQWyfmScATHYPkXmIj2u9mPFn9n5EGp2NoO94obt5Id0vqbPDB0m7OgrVQn8xMHwKKg0bIMF6zh9bULMRAv3a2TDSLyy8HYhQayDD7dx3LNwaGfjbV46osdiPRZyif+d72KAnxWDvDTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jznze0AZ; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jznze0AZ"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-3ab86ae9b80so1105247a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892658; x=1792497458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4BPi7mc5/eRlUG4xDFRpSLX13PD0rb68uUkEag+4iI=;
        b=jznze0AZecrXCvL5gdFC+ST+9vFroTmhLNqfaPMV3vFXKzL7ecowwrRcTaBrrdZDUd
         L7XzRVcV4PLlNkNikkDrzy1kepdEhvaUAUrZaPfjOHK+JhN5g5rIsoE/3xFJcPIDHhFJ
         8WUWH2AVkGAwPMFIpAKCMlDcwxcKrMiFezzB8NxuQx+wJiJn8X1ORDEdof9hZXgzRsig
         HeDZgRcc04LZ1DMIppo7Fz1nrSWZ/Pu7n5wtCw74esM20IUj9zo6sDE38CRBLTS5vwvo
         4VaduQfMWDdnL/T1V7RepyJrOBrpfGAkv0rPrp1sQq26BbiCWi0BVfdWVXYC0BR35KPM
         URdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892658; x=1792497458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B4BPi7mc5/eRlUG4xDFRpSLX13PD0rb68uUkEag+4iI=;
        b=g09eYLaIjUHmMt3Xm2umHAAxEF0d5iRlQ7naT+f5R2rT4ddse11iqvIAb/d/Usz43S
         SVXp0inhopsB6sCL2mhBUmm0Xm+I0ktCxwSEPz+tyMJafZbHm9R/gNtL2nhWovkIM6Ma
         VoYR4F2mpFVUuoL10jZAwCNxvwmh+EycK0Rd3ACeg57B2W87l/kmkfArklDQ8P1ZH+wm
         atnqu9/K5+RNIvkrggDBCpz4SgjEkvZHe8KNMWejTeuDib9k51v6EJ+uKObv5cZosTn9
         JV6sbchD0UvVIZ0/JDMvL3QUTsNN2zt0mdgW4X5ekrKDuHpwMO3ZrOGgPZfTu+tmFdeF
         qdbw==
X-Forwarded-Encrypted: i=1; AKwUvBx+U7UqLOwO55XmHs8tYYdEjtAKyp0eTh9FyHVKgmw7mrlDifN3Z5MLTYL300wFJDRH14f1xya3nO6iHMk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcioGsUp6pb8rOwymDvzxVstnVfxlyk4ecCtmZu2SHPEchKoJR
	nVK2xbmxkzX4BI9D4HR6Fw/PrVOr1f9LV8FabeKCsWJSyJN+mf8P4oaQ
X-Gm-Gg: AYBFou0Sg5xqevlpf846sb1KcNQEdFXHKCPvKqxdYMuJp1HVEH3Q0UcyK7v2iICndnb
	inzvMHId4vJXEVQHd4lmL4SPauxkaYrkxmuxme6zBEjg8YJ1oAYh+YzIKZd9DK7393FDnkkxtkU
	jxrnwyXKLJfTV9wptg/HYpNZ5agivQ6YjmtvDyCZebP1L0jxuyZZh0Q0vHiMTda3jAyc26up00T
	h8TAfLriGRRNzhBwpyPLRq/rHO98dE1BbVv17Jy1iYh/lz91QrvSkLcEtQG4bMxWSobsHl+2/BQ
	y4IZoIzOTJXo+lMJj+S2KL9vC9WA9+bfCJtRLkKWcsmpZ7nP15/fn87afjBlJ7MDQeou1xU953V
	kxnM2VpyOtNYFHM6qu49HsGbz8ijMtJDQ1CiCaL1F9m4k+ObWSEPNvjU7Q0Wvk3hqflemWVENe/
	SKPVcl/BUWM61EHMsa88pPbWsgvrVc+zcjnU1hofHSOhy7UDSwcLQr6QNJ0c51yJ0gkLD7zZEQ6
	EalHh7XDBYhJH+xgnpzF/RJCZvkrO8oRdES
X-Received: by 2002:a17:90a:d006:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ab3a2901c2mr8466894a91.6.1791892657586;
        Tue, 13 Oct 2026 04:57:37 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm21248516a91.13.2026.10.13.04.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:57:35 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	kernel test robot <yi1.lai@intel.com>
Subject: [PATCH v4 14/18] f2fs: wait for folio writeback before ffs_detach_free
Date: Tue, 13 Oct 2026 19:56:17 +0800
Message-ID: <20261013115621.968742-15-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
References: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

truncate_inode_pages_range() can invalidate a large folio that is still
under writeback, which can result in the following use-after-free:

 CPU0 (writeback)             CPU1 (truncate)
 ----                         ----
f2fs_write_cache_folios()
folio_start_writeback(folio)
/* submit bios */

retry_out:
folio_unlock(folio)
/* all bios submitted; folio lock released */

                              truncate_inode_pages_range()
                              find_lock_entries() /* locks the folio */
                              truncate_cleanup_folio(folio)
                              folio_invalidate(folio, 0, folio_size(folio))
                              -> f2fs_invalidate_folio(folio, 0,
                                                        folio_size(folio))

f2fs_write_end_bio(bio)
ffs = folio->private          ffs_detach_free(folio)
                              folio_detach_private(folio)
                              kfree(ffs)
atomic_sub_and_test(nr_pages,
    &ffs->write_pages_pending) <-- use-after-free

Wait for folio writeback in invalidate_folio, then we can free the
folio state without any other remaining user.

Reported-by: kernel test robot <yi1.lai@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202610081027.b13dcf10-lkp@intel.com
Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 61fe4a0c5..433d8f2b0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -5427,6 +5427,14 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 	}
 
 	if (f2fs_folio_has_ffs(folio)) {
+		/*
+		 * The folio may still be under writeback with bios in
+		 * completion that need to access f2fs_folio_state.  Wait
+		 * for the writeback to complete before freeing the state,
+		 * otherwise it will result in use-after-free.
+		 */
+		folio_wait_writeback(folio);
+
 		f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
 							folio_size(folio));
 	} else if (folio_test_dirty(folio)) {
-- 
2.43.0

