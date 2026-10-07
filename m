Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902644908C8
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373810; cv=none; b=uDij4Nsgd5p1lFzuljSkSLe5kUGjZjxGgY5EPANvNmDiftqghbCRLMmN2X7aUH4F/DT8scbMaDOF1+kn/3g9/1/eCOlZEaYHdI4pcEZjIdQKMHnyODstWUIQHssM+5lpqF+UwlrRxInNrzEFw47yNg3/vARll5qdyYU4oelE73U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373810; c=relaxed/simple;
	bh=9vcaOsQQgJuYHu3cZYSZzN2ZjTyZbqWxjKDaTZAa+0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kx0FN3Gd7YuTMrXjr0aTgYQgNSfkofMXRFORRcDsHvtCGVaMMKTdyFq68/VyqD+8TeKgTMqN04PsgmzXbqNN753U1PPlOuCj2u/D0f7MiEs/o2sCrsKOSzgreUWb+sEqpCK/2iGWxLqaEEhiTL0ttdew+UvmPSjyVzt6DvHbU6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khbUe/oS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khbUe/oS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 003611F0089B;
	Wed,  7 Oct 2026 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373796;
	bh=bULYUWQ1NflAN68ceyoD84z7KO4KdRDvgO9RXJEJf1o=;
	h=From:To:Cc:Subject:Date;
	b=khbUe/oSxxDxyT41pv2h7VTYY/HcEPBZbY2Kh5tXn32E9dcECOjLHyk5kZGIN7Rap
	 Tjfn8iekn3G23vgisa6pMbrepsHxYilASGXSq2bbDotwLHHz21CVPFhd24r29uFm6l
	 nGK1jeh1Pcb53fIPxw+zrPh6zTAJu1GH9ExqEPYWG4RD6Mln/wfr7ox1uBZKJcZdEM
	 SQfUVjH8GoHVmgCF1IuqWc58OPzNn+PmAhgegap0DrKW2jLc5BaVz/sJJLl9le7d7U
	 4pdLDG/L7T7845T0QNuSNgYqzr28Zj56k6EKQL1YWf+XXleLvLd8Kg1+VMunX04Zrw
	 EIHsfKLDF6IuQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 1/5] f2fs: cache: introduce metadata_cache sysfs node
Date: Wed,  7 Oct 2026 11:49:45 +0000
Message-ID: <20261007114949.2428048-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

This patch exposes a new sysfs node 'metadata_cache' under
/sys/fs/f2fs/features/ to indicate runtime support for the in-kernel
metadata cache infrastructure.

Userspace can check this feature entry to determine support before
configuring metadata cache knobs (e.g., cache_wb_interval) or parsing
per-cache memory statistics in debugfs.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 2 +-
 fs/f2fs/sysfs.c                         | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index c4746c416ac2..5b196806b3bc 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -271,7 +271,7 @@ Description:	Shows all enabled kernel features.
 		inode_crtime, lost_found, verity, sb_checksum,
 		casefold, readonly, compression, test_dummy_encryption_v2,
 		atomic_write, pin_file, encrypted_casefold, linear_lookup,
-		fserror.
+		fserror, metadata_cache.
 
 What:		/sys/fs/f2fs/<disk>/inject_rate
 Date:		May 2016
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 9749da70089a..afce74744d4d 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1421,6 +1421,7 @@ F2FS_FEATURE_RO_ATTR(linear_lookup);
 #endif
 F2FS_FEATURE_RO_ATTR(packed_ssa);
 F2FS_FEATURE_RO_ATTR(fserror);
+F2FS_FEATURE_RO_ATTR(metadata_cache);
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
@@ -1592,6 +1593,7 @@ static struct attribute *f2fs_feat_attrs[] = {
 #endif
 	BASE_ATTR_LIST(packed_ssa),
 	BASE_ATTR_LIST(fserror),
+	BASE_ATTR_LIST(metadata_cache),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_feat);
-- 
2.49.0

