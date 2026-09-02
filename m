Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9621F4A35
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788318784; cv=none; b=URxztMqqG1RJtZDK34xO5YmPgkrDqXluBmc1pFihsr61wFb4mxMUqDln1jBxnmwNK3GD8sRzqijTUod4g/YdBYBwvf+7f2FTiXp5tRno/nu75RJlb38Wfpz5GM9v2Dsg/rwBcjtq17fFyhMnGVcjdV6Y+4HbFSC/T02qwT5ph0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788318784; c=relaxed/simple;
	bh=LIm+O1zUS/wmOM5Qn1gaWKNjxKLHlR5iVHstPsk82fk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GkOyDnP2dxd5Oy6KW5hTCsKy7RDVd0m+uHoYMOdvk1Sgdymgayew9H7fQumF2A1gwawkJ892q60fCTXaHYxLun+Xbg6dWThnW42kDFsuYfY0Iyyt6TpFahnrHtB8H0Ejj+Dh785O0TKOjQciOL7IBoWEPjB4VaRbLTT+H+61adg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=fOAoDWvY; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="fOAoDWvY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788318774;
	bh=h6/5EmycLIcO6NT2x9QwzeRmtzgDcLFqGj/52XEIcm4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=fOAoDWvYsWUjXwijiZvanQTQjP2UNfFIiy+0XwiJ4g0XUGvvjslCukkYZ6eHnR4Am
	 jjnvD5XHOaOdvVWbnagBKRu0nrAs1/YXJaC6aXOX6Rhz3rMQLPfCK4xIa1viN29fgs
	 dzp1ehse3egNFaRDOdQN5dQR7Maam+15jYNQ3mXs=
X-QQ-mid: zesmtpsz8t1788318769t04f7107f
X-QQ-Originating-IP: Tp3c8ceN3I4tfWZkFDr/C9B0wsT3VLd0pwwTgHq9rYY=
Received: from zzz-PC ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 02 Sep 2026 11:12:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16383390424684535128
EX-QQ-RecipientCnt: 13
From: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org,
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Subject: [PATCH v2] mm/migrate_device: fix function name in kernel-doc
Date: Wed,  2 Sep 2026 11:12:29 +0800
Message-ID: <13768B0F4A5FC1F5+20260902031229.1821112-1-zhaozhengzhuo@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NV9lfpPr0ybc/uwrO8Ga94jitoM95KF/T3zMzFBVlFjlyp5RhCvVJ2qU
	ES2OhEA2zHu6lVnn+3Sau1wXUSu5qWgxR6DZw4KNx5sD5/mVTDynmm6w6RyFhHBIPT0yio2
	QcnWibrgGAjf9DnLksgixurBjLFkwHdXV/ztixkEaiRkp26xvp9CpGUL5UrkitmOtv5X+40
	wJdzi9qjyONIIdjsataM3qJuZ97EGx3CPFPbwfC5D3oWfdCfBWi3EpvyYrPU1dkHtZJ3Ekc
	6axAaZ4uHtrZTrVX9UF/zjIcUuuHGsq7Wfy665i7n7RqQawWDt5HzjZJlIivMff4M3GItvv
	aGHPQHPycYQNQjxzeN/i/KIR0LvmNT5Q9RcUS4h4pce5e3N9OEX4zH/q6MqTnmgnhMi+cjg
	qwNS8IOBC4N1Xk1Xp1iHzqWeJ8yy86dXZZFlzOa01M/lf5/870765eTSA59HfbJU2ONzsrJ
	IFYXUxt+D7VESAICuT8Egp3EUfpuatj/E1UiIu1fcjpNUTb/vQGVOOEnkfrWkcmfDGvhUER
	pxWFtQ7nCFDAf+CHc9P0Pr4xzRnHdGAFRgcnk7swgZDVI+y0No6hJT0cz9SMg90LaKmcbgX
	+dqJYGliDz/m5MPdWWjWdtwuo1Sy0hSFPOPkNecz6qwCxCDMDZz9N8F79l0S8fHqLNkMo+r
	hjo9lKVn+VoYuzGFCMpbxrv67sy0Sa0+53KFn1yuG4E87WviAqK+c5KhDwZod03sCp+lLop
	U6DLtdI/qh39fOzqOHSLW69v71rV/aqPIJjMbpklHcEHl3jkfE5Tpw5rw2gP1IOQXpxmrFz
	BVPuzvZYS/S6qiqJ2aHiY17hFrVr5B5brTMwyPUgZUufOgNpfernDpn+KpewpSFL80/d7S7
	PuQ73ewIt8EyPujlhBb1LbaMQP+mfVpjA+71E7IvkxTW0cU6CE4g1O6t16HyTRiGtxokiTw
	GFMz4VrTNTuaEAATRdwxyp9azveNJAxm5er2FUH1IdapSaAE0EYBoQHSAkEOukvw07twEGM
	V5v8YrH0K/Ofx1nSHTAeEeGhlBTjzmP2FwKrIv4I4VfV2kfQk2yOS3WM8WW77V3k9vqDRHH
	HU3lsiOLOYMgGObnUsa3EMqHJsNDrr77dZvxY50k7iO+zI26atW+ks=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

The kernel-doc for migrate_device_range() says that migrate_vma_setup()
is similar to itself.  Refer to migrate_device_range() as the subject of
the comparison, making the distinction between virtual-address-based and
device-PFN-based migration clear.

Fixes: e778406b40db ("mm/migrate_device.c: add migrate_device_range()")
Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
---
Changes in v2:
- Drop the redundant second "instead", as suggested by Zi Yan.

Link to v1: https://lore.kernel.org/7D206FC95BDCAA0F+20260901065131.1759298-1-zhaozhengzhuo@uniontech.com/

 mm/migrate_device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 009bfa8b212d..0c437004329d 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -1398,9 +1398,9 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
  * @start: starting pfn in the range to migrate.
  * @npages: number of pages to migrate.
  *
- * migrate_vma_setup() is similar in concept to migrate_vma_setup() except that
- * instead of looking up pages based on virtual address mappings a range of
- * device pfns that should be migrated to system memory is used instead.
+ * migrate_device_range() is similar in concept to migrate_vma_setup(), except
+ * that instead of looking up pages based on virtual address mappings, a range
+ * of device pfns that should be migrated to system memory is used.
  *
  * This is useful when a driver needs to free device memory but doesn't know the
  * virtual mappings of every page that may be in device memory. For example this
-- 
2.50.1
