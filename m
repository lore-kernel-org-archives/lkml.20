Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B426C2F12DA
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791625413; cv=none; b=RPqxdVkB8hi4eBBOqeRY93PU6Noc4SZrgmD6GNAewqxvwyeVUwrtD0RlFe+kBJUdxnBt8Af/Um1HzYoETppmu/2/O07kqIv82w5qVh6pyhE/ss+0TO3erOPL/zo9h4lo3yjvXcbGVqyWpJ2ip37aVXjSGeJXWJaNWjxGNMKpT+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791625413; c=relaxed/simple;
	bh=hMxHzYundgXCd4bUxx+rHFYt2+zPl7lY2u3LsSYrnO4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pq0OcHL21onMl8fvB7u75WoQT1L9PXxj1RmK4vWbDDC6GrLnhQVlWCY1M1ZB22VZ7qhiEFSWkuthPbOYz4QZSzhoSGpGapXxlasAtwqurqgqjXLwReh6J9vB0IF9xXbZJ4lOhvMNG+TX5VwnDeaCd3kg4wGmwLdHwzaik3pxAOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=SnX/ajqx; arc=none smtp.client-ip=211.125.139.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="SnX/ajqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1791625411; x=1823161411;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gY84DdlCXXCCtPKxy3gsbbnHG9YkyEpV7xHj0YNGUXc=;
  b=SnX/ajqxCvI7Kyuk53Ub4hNkiuKKk9Ln/zlMmu/+Rbq1NQ8hrI56tKBr
   at8eieTKs5xfRckyOL45H/w4yVneKpGza3v81abKZsL+usKnakzLSQeby
   8oGIzsaYgiX+oFHa/hAqqVzVoJoXbIDA5w65NJjCGroPak9ccJEeH9RpZ
   EqlwxOxu+wJG7pslniNMBvEvtVSUZWGmY/ev/Of7gTtq+rG7pplg0kHcM
   zsFiMWqqRoAIeUF0lgFixea9VaB2n56t2wxhb4vnS0jiJEC3eUu1MEuC9
   Ts92HfnUBYT+Uk6ZfhGdlmCux4dmUlgTxKsGDa/Qbe3+usDhs4X0kscX6
   Q==;
X-CSE-ConnectionGUID: KliJkNBBRwKOv6DQXzNnpQ==
X-CSE-MsgGUID: fEJzalppSQ+dm3QJUMhWbw==
Received: from unknown (HELO jpmta-ob01-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::6])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Oct 2026 18:43:23 +0900
X-CSE-ConnectionGUID: 5cs7UJUuTeKVEjejzsyScQ==
X-CSE-MsgGUID: 4VAO1LyrTgqIoadtMI4Fyw==
X-IronPort-AV: E=Sophos;i="6.27,150,1786978800"; 
   d="scan'208";a="71590581"
Received: from unknown (HELO cscsh-5109200313.ap.sony.com) ([43.82.111.223])
  by jpmta-ob01-os7.noc.sony.co.jp with ESMTP; 10 Oct 2026 18:43:22 +0900
From: Friendy Su <friendy.su@sony.com>
To: xiang@kernel.org,
	chao@kernel.org
Cc: linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Friendy Su <friendy.su@sony.com>,
	Yuezhang Mo <Yuezhang.Mo@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>
Subject: [PATCH v1] erofs: enable SB_I_ALLOW_HSM to support fanotify pre access event
Date: Sat, 10 Oct 2026 17:40:00 +0800
Message-Id: <20261010094000.2036805-1-friendy.su@sony.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch makes erofs support a use case below:

erofs file data are not available at local, but need be
filled at fanotify pre access event handler.

E.g. when format erofs to blob mode, meta data image
is store locally, blob image size is big so it is stored remotely.
At erofs mount, a loop device based on a sparse image file is
used as blob device. The sparse image file size is equal to blob
image size. Like:

$ sudo mount -o device=/dev/loop1 /dev/sdb1 /mnt/erofs/

Then at file access, need retrieve data from remote, then fill
into sparse image at FAN_PRE_ACCESS event handler.

Signed-off-by: Friendy Su <friendy.su@sony.com>
Reviewed-by: Yuezhang Mo <Yuezhang.Mo@sony.com>
Reviewed-by: Daniel Palmer <daniel.palmer@sony.com>
---
 fs/erofs/super.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 0967aace9f7f..b92d3353319d 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -659,6 +659,10 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 	sb->s_maxbytes = MAX_LFS_FILESIZE;
 	sb->s_op = &erofs_sops;
 
+	/*
+	 * Allow HSM to support fanotify pre access event
+	 */
+	sb->s_iflags |= SB_I_ALLOW_HSM;
 	if (!sbi->domain_id && test_opt(&sbi->opt, INODE_SHARE)) {
 		errorfc(fc, "domain_id is needed when inode_share is on");
 		return -EINVAL;
-- 
2.34.1

