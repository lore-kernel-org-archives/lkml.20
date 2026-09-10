Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909BD146D5A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789009439; cv=none; b=MuCFe7poMPss69m/4TKyktZXv9/qu9YNS5JmhDq/cccTv2GobjN+QnIlvTj8005lZZG/eZnTCkz4opCOkYpK/gRxr6sFotzrPR4uPTJn3Yvu3CjsVNIdkrOOAks1umN1kcfqX2SfJ6S5+f2/EZL7BwB8ZV2mEw8i+zjUIA05a+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789009439; c=relaxed/simple;
	bh=9FUSfXPHv0G516zqMc8b8rqo8LU93/SrQ5t3129+9nA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=huxQLhadC9SwkULmI4+k3Q0Vj54MQkZ+jmZr6o4DLZSgQdL0pa2R0TmHZ4TnlOyBBeQA7WRKQlfdqaVqC2FHsWhKHJTU5w/jCU1vDSqyeBXi3WW4fBV+yOuDMXAewspZfeAWfWUaZOgBV+OptT0SpRP7hn1X7hASdw7jFJVTuSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; dkim=pass (2048-bit key) header.d=unisoc.com header.i=@unisoc.com header.b=EjBVNOgM; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unisoc.com header.i=@unisoc.com header.b="EjBVNOgM"
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
	by SHSQR01.spreadtrum.com with ESMTP id 68A33reG069334
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:03:53 +0800 (+08)
	(envelope-from Zhiguo.Niu@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTPS id 68A335qt061859
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 10 Sep 2026 11:03:05 +0800 (+08)
	(envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX02.spreadtrum.com [10.0.64.8])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4hgMr13GT5z2M2Pkd;
	Thu, 10 Sep 2026 11:00:49 +0800 (CST)
Received: from bj08434pcu10.spreadtrum.com (10.0.70.50) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Thu, 10 Sep 2026 11:03:03 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
CC: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
        <niuzhiguo84@gmail.com>, <zhiguo.niu@unisoc.com>, <ke.wang@unisoc.com>
Subject: [PATCH] f2fs: fix to record both APPEND and UPDATE ino entries
Date: Thu, 10 Sep 2026 11:02:43 +0800
Message-ID: <20260910030243.3005578-1-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL:SHSQR01.spreadtrum.com 68A335qt061859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
	s=default; t=1789009399;
	bh=1CUB4dEzXN6Gea91X3OtNb4FA0wYGteZsp4Cdi9SamU=;
	h=From:To:CC:Subject:Date;
	b=EjBVNOgMCzuFx54NqGzvSFLZM63VogNIS3hqkg5vdH59MlX5CuLxbAwsK5S5SOBGk
	 rhjB6aPUs7qwoiPNYxpETxcpgO+Ns4B5AzSV8a3yUJMcgsdD4kqHsfpdFzOGStm+E4
	 iSr9ToD4r2xOnRf85tQdDjFG9bJ/K0SZDeIz62MNwwMMGQaXUeXHNJN480Lcffnx0g
	 z5ctyAc8oidUx0MUxn0LHRgKHlOYCFkD+NDjW1SHkjOJOZBEpl9/jnZzyROcnbGdVy
	 0C8YBjMKLu8yS30r1hIoEEF26NUWz6WtX11VUWDtmt9FaWiWrtLw/k6Ft4bibnqI/b
	 zBXSlbsny7urQ==

In f2fs_post_evict_inode(), record_bits is assigned with BIT(APPEND_INO)
and BIT(UPDATE_INO) respectively, so the second assignment overwrites
the first one: when both FI_APPEND_WRITE and FI_UPDATE_WRITE are set,
only the UPDATE_INO entry is recorded.

The two flags are not mutually exclusive.Once the APPEND_INO entry is
lost after the inode eviction, the shortcut in f2fs_do_sync_file() can
take the flush_out path in the next fsync(), skipping f2fs_fsync_node_pages().
As a result, the dnodes holding the newly allocated blocks are not
fsync-marked, and after a sudden power loss, the data appended before the
eviction is silently lost.

This restores the previous behavior where the two ino entries were
added independently.

Fixes: 314c9e476ffc ("f2fs: call __add_ino_entry out of the eviction path")
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/inode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 82ebcb338b0c..c20fcd8c2b97 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -1058,9 +1058,9 @@ static void f2fs_post_evict_inode(struct inode *inode)
 		goto skip_record;
 
 	if (is_inode_flag_set(inode, FI_APPEND_WRITE))
-		record_bits = BIT(APPEND_INO);
+		record_bits |= BIT(APPEND_INO);
 	if (is_inode_flag_set(inode, FI_UPDATE_WRITE))
-		record_bits = BIT(UPDATE_INO);
+		record_bits |= BIT(UPDATE_INO);
 
 	if (!record_bits)
 		goto skip_record;
-- 
2.43.0

