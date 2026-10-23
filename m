Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.125.139.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792721984;
	b=CAAm94Utyzaqli4tEy8npVNnBSREwgVpKDRWhA6amqCrwRBfLjy+jDNfO5HqG8+Nb3KG
	 BTJlddEUz6zBEmt4NfwLR8Dl4OviinY/88DQbOlMjwrkQDiMnEnIBg4vqxnx/OhNsmPAC
	 wBpThvR63GEIM2wALBXAOloQ3RcX19cprFszrej6BekDjku9pWzx8dqbo82wo27km278p
	 G19C/Zb+bC18PsorkwQVJUqR18KDBL9KbIQ4ItO9B8FGxfH9Xv3yAyQXCFrDrYaOZ7xxH
	 or8HEKBpvvneZ+EeSrPH7Ut4rypf5dgcbTC4nbEblnePTaM+wq10e/v3OiVfRAsajKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792721984;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aAWFseEF0M/Hl3cR2tptx6HrylBbJWi8q1fxT2EXnXM=;
	b=jou18HMVgVrOK3la+hTOy862K4MUv/z9sj66jUhta/aObsC+IuwI/I6pUJm8OKzVj0bg
	 jCXPTWEHxdBm1BGc/qqyNJaHYfdGKfOsh4e9GE4Zxc97comwSUALTHiseV2uLZY/TyCY1
	 dV387o2cUmXWkQ2H+HZnelbHR609tJaNAQqauzivJu8UslSUh+3X4LTnaXz2BKygqbzpc
	 4PhDirJEBZxdURMXDVEnX2ZgfFj2PHYFR/xQInkZZbR4Si3nDCjBkNbJ6uaBbJOHHvNQf
	 LbSHTU4lZtlaZhKvMjEjSIhaNybqQOhqFMHdx/FYJGf3msqwUQLAhHrBvlNdv58AfDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sony.com;
	spf=fail smtp.mailfrom=sony.com;
	dkim=pass header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=s1jp header.b=pRZI8+J3;
	arc=none smtp.remote-ip=211.125.139.72
Received: from jpms-ob02-os7.noc.sony.co.jp (jpms-ob02-os7.noc.sony.co.jp [211.125.139.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEFC606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEEFC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=s1jp header.b=pRZI8+J3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1792721982; x=1824257982;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aAWFseEF0M/Hl3cR2tptx6HrylBbJWi8q1fxT2EXnXM=;
  b=pRZI8+J3KgtEOcjXwc8wD0MbLbN43xODcCd22DYJgQtmImx+ukt6ZEkz
   mt5dh6ZbsAcQCpj4tqEyH1melVjGmtmD/1NFvok5up09ce+b5Mko3BQ0S
   FzuHNenlegDOigZNTgnpdGeb8587sNcSpjZlLDS7VFg8G2lVZU35F1cYQ
   145hZzVg7qF3oYsEsxpngAEdBukxR+iI3BIJvQUfNzKfnWuEDgWhvgOex
   EfK2Ll5m8hh6gsWYvLiSAPIwg+n542rKJj9/TY/RAmV9H1+j9bBNRh674
   fE6/VRJSa5w9SfUUjGQ4WmVCw4oGD+0PZmR85X+NFCQSyNLyhEgoeCBKb
   A==;
X-CSE-ConnectionGUID: Dg3W5LlDSP29MEt4cWmLSA==
X-CSE-MsgGUID: YClQXKsJTJSjICXj/+AndA==
Received: from unknown (HELO jpmta-ob01-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::6])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Oct 2026 11:19:34 +0900
X-CSE-ConnectionGUID: +Ou05pHdSdeiUz+aDjpD5Q==
X-CSE-MsgGUID: 031jg9LFS6upltFkcIgM9g==
X-IronPort-AV: E=Sophos;i="6.27,166,1786978800"; 
   d="scan'208";a="75838793"
Received: from unknown (HELO cscsh-5109200313.ap.sony.com) ([43.82.111.223])
  by jpmta-ob01-os7.noc.sony.co.jp with ESMTP; 23 Oct 2026 11:19:33 +0900
From: Friendy Su <friendy.su@sony.com>
To: xiang@kernel.org,
	chao@kernel.org,
	jack@suse.cz,
	amir73il@gmail.com
Cc: linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Friendy Su <friendy.su@sony.com>,
	Yuezhang Mo <Yuezhang.Mo@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>
Subject: [PATCH v2] erofs: set SB_I_ALLOW_HSM for bdev-based mounts
Date: Fri, 23 Oct 2026 10:16:35 +0800
Message-Id: <20261023021635.2852395-1-friendy.su@sony.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SB_I_ALLOW_HSM makes erofs support fanotify FAN_PRE_ACCESS event
for bdev-based mounts. file-backed mounts do not support this.

This is for use case that erofs file data is not available on
local block device at mount, but need to be filled at fanotify
FAN_PRE_ACCESS event handler.

E.g. format erofs to blob mode, meta data on /dev/pmem0, file data
on blob device /dev/pmem1. The file content in blob device is dummy.

mount as below:

$ sudo mount -o dax,device=/dev/pmem1 /dev/pmem0 /mnt/erofs/

In FAN_PRE_ACCESS handler, actual file content is fetched from remote
then filled into the DAX mounted block device /dev/pmem1.

Signed-off-by: Friendy Su <friendy.su@sony.com>
Reviewed-by: Yuezhang Mo <Yuezhang.Mo@sony.com>
Reviewed-by: Daniel Palmer <daniel.palmer@sony.com>
---
 fs/erofs/super.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 0967aace9f7f..be8728b8d116 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -667,6 +667,15 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 		errorfc(fc, "FSDAX is not allowed when inode_share is on");
 		return -EINVAL;
 	}
+	if (!erofs_is_fileio_mode(sbi)) {
+		/*
+		 * Only enable HSM to support fanotify FAN_PRE_ACCESS event
+		 * under block device backed mounts.
+		 * For file-backed mounts, do not enable since erofs-utils
+		 * has already supported FAN_PRE_ACCESS event on backend image.
+		 */
+		sb->s_iflags |= SB_I_ALLOW_HSM;
+	}
 
 	sbi->blkszbits = PAGE_SHIFT;
 	if (erofs_is_fileio_mode(sbi)) {
-- 
2.34.1

