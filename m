Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F224A64D9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362728; cv=none; b=nKOsgasr8B+8U9ezCPXk/LK+INknvnP+lpTwuqzPJFSEayaMZrSAKrP9UQW6CTMmgGuvTibedmlMfz3fHvEYZ9+wwqmF6WEJ2YDnu7d/lRLs/XBA/XAKplBkM7YG5lp8H+s54gA/bwh15+jQY87xvIrv0Cf3wzYsYF+L5g+2Gqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362728; c=relaxed/simple;
	bh=aMg4PXn5HEM8ak8x0Key+79Q1orD1vUyBFVwxuKOuGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RParCGvzEGgHKBgo3O+W85WO/oI4/eq/mGoap3O2tJR/hBLjQ66Afv+TjK0o/Hd63ib+Ya930BJVEOTaYSHTU9FnmPZklFvsK3N3OWYy8BZD8kNBJs+OT9H1e+AVjnpHU/g70+cqTkzVxfAGtrIMIukwNr1gyZ3VZNvtEQVIqos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKKCq+fQ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKKCq+fQ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398e9698a70so1171527a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788362726; x=1788967526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5RQxJa362c562lFaD0IiEpuR9Ozz62fsCp9txC6PprM=;
        b=DKKCq+fQF25nFAxuxjNuaY8uw5BsIVeK5AcGK93OLTvgVKetaNsbNO7rOEc2osP2KG
         HmD22w3bPdEAsoXarN4k96YQyVgTdAV2+rY80dydjJRVhnF5FN7awofhSAHl8Q8ZpJhD
         /rqEpp91ERyVvTYoaYO/q/fXCqg31THvwEKjflXUK/5ksUZt42M9lYbdzlN0r5XfC/WH
         Q55kvHZt6tvW3ZCGk8uOf6XyzH+Gu9KPI7t/MCgIg6m5iTMaiXx9sT0KJUDKEQ5Pivtf
         rFvnpxC0qtgx7MerKHYTvM9ladOsT03ThJOmXMQXeQ0IotfdI5ttn91Fj/5Hq5hGDY7Y
         6qBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362726; x=1788967526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5RQxJa362c562lFaD0IiEpuR9Ozz62fsCp9txC6PprM=;
        b=FaaTNtOOSMvxRcRvDHhz4M39F9ZXdyfcYObvV+sD7XieYmZz2cCoI5ykGp4v2HFDKC
         ag2eYbk/F72tFJwsjPMm4A/dove5M+0PlO1rSE3Ww42GLQfH21ZSpMI0uQlkb9SBwhZf
         8V9ENNFmqDBvqmq1M6s2RtIalA8dZNiivE23Tu88hXe+mzlalHP3QvwjCHbvVYGm1XtQ
         qL0g+NI6JdVtva/h31Wc1zkCI+aBEPV1lgYINOZwkWOOW1RqOlyj/L5DpuZ+7VWbsT3r
         MMpaDhQGmfO7piyK/xQaGfkCtheawYS+o/YqabznaqVURpt/ziCWx6Ap60V3RUGXzW/M
         m21A==
X-Forwarded-Encrypted: i=1; AKwUvByJvO6dKDwOkvzjFWK7tU3ZS2CFPcprckOcgfwjddW0XvWgDDBM/9aLkcT35nikUDOfAWdEp4hsljfpTSA=@vger.kernel.org
X-Gm-Message-State: AFuF++lFLZpFcgr3ydXAWIddAxDlqTnlvn1lnij/fwAAzyviH7k2o9Vq
	Y8TNBJGyg10Dl5mEVx2JhHDueWDL/NxZqmbOjVuQh4Zk7Mu7y8sXCJ6u
X-Gm-Gg: AYBFou1ISRWZGOegpVlwBehkAt9VP5YeBsZFjUvOxMp++fXoQ22Hukca9SCJKfHOyfM
	56Mxkkfk46BDtpXQCyqqC0oVeLcH7K6xn1nVDlcyQG3937AwgADBroW8Pa/1VuLRHO33SSVCqfS
	9G2d7k7L1kUgC0Yloh3HCWuWg1Zy8KLVfsfBLDH69Rh+DJV6nsA4ge5zHT3U5LLVwyGH4/12Jyo
	RP7hGKJz5+hU2w+HEGg3m5fkEuY7UurvmkuezLk3lAiO3JXBL3aA0zORDDMcCbTydH49O5nWrn+
	fcbfBuQUGSO+SlVatdu4o8MjPpnqs8xXNp2/dnCIPPWZ2c26WqTEoDrrH9Z7eubPUWk5j5rdw1o
	keRJ7tL0/YiED2/w+jH+cMbHQe7tuuYT/Kiv0psQT0zaOQ+TTt/H91PMzJQtHCg/QKr7vTokmti
	mltZv/sv69sgxcGxGQQjiy1EYaXqks75t2mjd4ScUJrqyuWeyJuYY/NuspIXJvry2So3UDI6O3u
	g==
X-Received: by 2002:a17:90a:ec85:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39aedc3b980mr8823059a91.0.1788362725765;
        Wed, 02 Sep 2026 08:25:25 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd21e9dsm12359242a91.4.2026.09.02.08.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:25:24 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v3 0/3] exfat: speed up file creation in large directories
Date: Wed,  2 Sep 2026 23:24:52 +0800
Message-Id: <20260902152455.1273557-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Negative name lookups and empty-entry allocation can repeatedly scan a
directory from the beginning. Bulk creation in a large directory therefore
approaches O(N^2).

This series separates the optimization into three independently reviewable
steps. Patch 1 adds the Bloom filter used to reject definite name misses.
Patch 2 retains and correctly invalidates the next-empty-entry hint. Patch 3
adds the LRU and shrinker used to reclaim filters under memory pressure.

Test environment:
  QEMU TCG multi-thread, 4 vCPUs, 6 GiB RAM
  4 GiB exFAT image, 32 KiB clusters

Creating 20,000 empty files improved from 589.48 seconds to 5.33 seconds,
which is a 110.6-fold speedup.

Changes in v3:
- Split the change into Bloom filter, empty-entry hint, and shrinker patches.
- Accept filenames containing exactly 255 UTF-16 code units while building
  the Bloom filter.
- Invalidate the empty-entry hint in every path that can free directory
  entries, preventing stale hints from skipping earlier holes.

Changes in v2:
- Move exfat_name_filter_free() to exfat_evict_inode() because
  ->free_inode() may run from an RCU callback in softirq context.

Yang Wen (3):
  exfat: add a Bloom filter for negative name lookups
  exfat: retain the next empty directory entry hint
  exfat: reclaim name filters under memory pressure

 fs/exfat/dir.c      | 279 ++++++++++++++++++++++++++++++++++++++++++++
 fs/exfat/exfat_fs.h |  23 ++++
 fs/exfat/inode.c    |   1 +
 fs/exfat/namei.c    |  58 ++++++++-
 fs/exfat/super.c    |   9 ++
 5 files changed, 369 insertions(+), 1 deletion(-)

-- 
2.34.1
