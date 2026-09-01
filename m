Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31B63502A5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245542; cv=none; b=lEDm83L6TvK1gZE+3c3ldCIyF3s8VvA0Hx8hk0iiV4/8MB0ChofU95pXynXeckMrf/vENVcpZof4k5VJDnZ3G15SqkhWFNtO5ifrBZ0cJMqMz5p3ompCjRCz/jrt0VypSqF7faX2/cp9CcRWKkbm2TPvO73n3cNUIZQTGIp+Zz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245542; c=relaxed/simple;
	bh=8fj8tFt4bbIKJ6tPyUvoPrONCAfGG5IXVzwE5U827tY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eLFa58oB6LlVtKxh84YlylWtf2BOlwSIoZuDRK0SV4CLXNmBMkQqPUqN31mRS7wVqdlQRS/gVC99MkE90xnkhJDrOecWW4fw4Y9fDEg2de6muRI7gWm0Gb2arWYawf/OJwxGlZJBt9k+bQ0X/7KfxYAgKbTE2ETPdOe1pPgFZHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=SnXCjkTK; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="SnXCjkTK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788245524;
	bh=FKNpdY0y49xeNECExSigP6VaPuOeny46D+aFWqWtap0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SnXCjkTK2VXc8XuzO9EwkeDia8Iw+VHLv+4Q2cQSO4NcUlObds+ryE7tx8fxXrbsE
	 i2GAshjIBWEyIuBOvZx1KthaRbF2gjTtVmy1EhKuLTD2IQm1jQAfjOUw1ux2vomf9b
	 MUzwX8SjEpDzI7OhtRUO+TG6SevxvQ/Tl+b8MIxo=
X-QQ-mid: zesmtpsz9t1788245519t6bfe178e
X-QQ-Originating-IP: GTVdNpFJNH4oufvYI/kV5iPVNhwkBzEpbgcvoMUGl6g=
Received: from zzz-PC ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 01 Sep 2026 14:51:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15009900098412866890
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
Subject: [PATCH] mm/migrate_device: fix function name in kernel-doc
Date: Tue,  1 Sep 2026 14:51:31 +0800
Message-ID: <7D206FC95BDCAA0F+20260901065131.1759298-1-zhaozhengzhuo@uniontech.com>
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
X-QQ-XMAILINFO: MVTMmqHQ8RYUOg2zdKT37S7I/e/9EjGy6P/Cc8biWUTJQ9r456CZKUGC
	EDR3wzBKHLohZjPpCBse8son0FFsK9T427zMr99TX/W97MDU4y+43mL0apJ31C0zHTs1kfL
	mwIWKMM6hQcrsudFXD4salDWY+0tgD2ka8r12lxA2OaY8aDcOLHLfcCeUnFQcoqBRzTVLBP
	tumaBarMk8nv/mGVZE1JIY9H53/E7GdeksnLZ0qcbgsMLCGyt+DiuEIoTZB9B13HJiaXylC
	B/F+cSJRvHT2Rt+TZfJ0q+w8ReHap9JIDKNWSpMnK6sgbMPuZ+T/8iiWjr/WD4xDvkAkhF3
	Km1cmJVxnq/Z5azGSHICRXy8G9u2c0h1ZxHHeMJiMpjzCyP5sPyilO9obS9d477MIxQjdxQ
	yCrUI2kmYLJCwac/jaTvmeybX4XvKVoUlj0Gu0qtYdGkZY8sc5c5L0OxytAnxSJ02qF3aeK
	0MkHVdQA3aQwF/jphig67Ke1g4fcUQz4OZYYgxTXdzMo/T53UhEibHUMl7I/OoNsuqmUcMG
	lR/DNgM7MwdHYX1OA5iti8sC8lVgXojZ8R2R74D5U1GxBBRFbI5VcDsa5rv9Jvp77D0Bd4Z
	5XovGTvNwkj7ujqQ9JEIzJY7P8DitE72rfmS6cGSHL+Li5yH2yhB4E21ZR0P0HWLbDgmt0c
	NImCVFW1U6ilT+0svthzrG72YYxjIKstFSMWWX9vzzULoHgXeOykLzrRsDe35vWJbvQdMud
	tg/v+/hIqZ50toaMiBlFu5o/8OvQBl7lizBfGRUP2LJOpNVbgQewJwGbMR3XKRzIPDMNcse
	UclJcLiY/PVnm+02rrXs+brLuV7BpttIBU1Qv8xZznzkEf+f1hyrrRy2hnuNxaWiixzwCMv
	Mc9FsNJ/JZ9Mb92rdduLN42CsLkI5k0KXw0AWfJlpjC8G8xV7HMfsJVdAnSUXqMPzFs5V59
	Oz/QxayehUE4E9TxjUX2sNy8SNW/H50Ysf+CdDn2W/GZ/eZiRnEVazgjfFFWAMbEqjOc2+9
	ql5OAPaUdw+xPJIuyYHVl8rN8ono4NpPCbgaI/Mw==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

The kernel-doc for migrate_device_range() says that migrate_vma_setup()
is similar to itself.  Refer to migrate_device_range() as the subject of
the comparison, making the distinction between virtual-address-based and
device-PFN-based migration clear.

Fixes: e778406b40db ("mm/migrate_device.c: add migrate_device_range()")
Signed-off-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
---
 mm/migrate_device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 009bfa8b212d..4a614a3488ed 100644
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
+ * that instead of looking up pages based on virtual address mappings a range
+ * of device pfns that should be migrated to system memory is used instead.
  *
  * This is useful when a driver needs to free device memory but doesn't know the
  * virtual mappings of every page that may be in device memory. For example this
-- 
2.50.1

