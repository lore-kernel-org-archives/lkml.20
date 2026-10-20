Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485891;
	b=GOgR3R3l2B8XQmaawjR4Li+p9rTrfYln0f6yrpFNj4jbjZJz8ovBHgOkj1J1KiS9FA3y
	 G/f3QWAkWKJ04vl8zLe2MK1lXUNpGOiz3FFvz81+GByNXWOeQY/yy6Qq5z9DR9GowENdI
	 ViLDl4m5CdsjOjXOmsTcspB5+zCMyM7JPsLADxWNWt9VQ5PIJIUo0+6XgrS2fCTi4eIFz
	 //ZdMMV7eFiRkoIXYG/2MlzMQ0yIBwkQf66PC8C9jVpxjJGjSR3TNapYX281IndNQJl6A
	 DYFY1QDRrZtSiuS4EKFZssg6P8Y/N8RwzWr3vTX2SJP4eQ7GXwcqli2JtlTx0O/SjTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485891;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=gw3i+wYguZPCy9Tsb2ibX1AYFlBG7kQvzpqyQvh0sCU=;
	b=z8/JCe4FJaE/W5f/Y3BugW61+PUcPEfSThF9yrNcPXNOPM3ztAWEBX1IPPArIamr5QGn
	 5pfcMJMLhxz5OrgJvzTgfeQvMzJ05/ydOxiLajpWJcYnVrCVVwf8r9zV+NM5OTPEuXmei
	 DUisCb7SJPzLU7ZdxwYal/sBUanbEfuQrUAEFB8ntC1yR7uB0ZhUqgPo8O28Vu+TA6m+n
	 6N7eYt8GhcviRLFHou2tQgElg6IuLqGIg5QnAZYQgyUyRbUP5dfix0YiDRE7WeOjdlx+e
	 zoox1iFKTGF4u9z9aNUtuZKeJo0znW2KoPI3oC4pYRSxDKCJ7AZefbbU92G/5lX/UVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iifMzH2P;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AB160A2600
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28AB160A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iifMzH2P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gw
	3i+wYguZPCy9Tsb2ibX1AYFlBG7kQvzpqyQvh0sCU=; b=iifMzH2PYCSlMplLg/
	A/wg+snz2/0z4FWFlzF3S+txh2i8Zha6KuYv9TQAmIssXvpYi4/WaOdsMqU6uneZ
	ardQLUlKf9ewzWzwHcZfA/TPAzNr+cbLkksJapqxQvJBX/hPvFA+zIgoDh8duXnx
	hx/zFKLWEX29dDpiS47CZEwHY=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3XyPnKddq1latBA--.56704S3;
	Tue, 20 Oct 2026 16:44:26 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 01/31] ntfs: propagate mapping-pairs update errors from inode writeback
Date: Tue, 20 Oct 2026 16:43:51 +0800
Message-ID: <20261020084421.2196486-2-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261020084421.2196486-1-liubaolin12138@163.com>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3XyPnKddq1latBA--.56704S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW3Aw4ruF48GFW3uF15Arb_yoWktrb_Ka
	4xXa1kKw15XwnYganrurn5Ars0vayvgr1UAr48tF1DJryUAws8ArZFyF43Xa1xWFWjqF95
	Ar1rKF13Jr4S9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8ZqXPUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QsV32rXKetJkwAA3N

From: Xuewen Wang <wangxuewen@kylinos.cn>

__ntfs_write_inode() overwrites a failed mapping-pairs update with the
result of syncing standard information. fsync() can then report success
while the mapping pairs remain dirty.

Check the update result after releasing the runlist lock and take the
existing error path. Preserve the errno and retry handling for ENOMEM.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Testing:
Fault injection reproduced successful fsync() returns for ENOMEM and
EIO before the fix. Both errors reach userspace afterward; disabling
injection allows fsync() to succeed, with size and data preserved across
remount.

 fs/ntfs/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 206db4e99ef1..52e22022b4e7 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2940,6 +2940,8 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 		if (!err)
 			NInoClearRunlistDirty(ni);
 		up_write(&ni->runlist.lock);
+		if (err)
+			goto unm_err_out;
 	}
 
 	err = ntfs_inode_sync_standard_information(vi, m);
-- 
2.51.0

