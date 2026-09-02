Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656C6371D14
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334408; cv=none; b=Y67pGvwC3uOM507Gq3nHopGw9gREKxUKv883Fvn9qh87IdtYPGwdLga3IbCiMd63rkM4Fym8jHw1GGLVbHNegaFCdcPmUmNVwhAhbSG9fVjtBMNQKD8/hm98CSNSFuZIkj8AWBZMR5zMISO+KvCAtHe19J+W08y35xVb3kue8nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334408; c=relaxed/simple;
	bh=Gq+kS/IQTqF5hQAeFUSbaTyZ26KoG3T8FNFwWn3hdGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SwGMMLzm6cDw+rOTla2Nl5HmnLs+KAXS8Vt+wGPtvSNHp7jB6XR89XDpOMOKq9CIN8RMMrV187cxAYKPKZGXcjp4uyO6lS4lqQATkPwgjChZIFSZziBh8Q0a+KIrtRNsceaChcN3idw3v3/7wB5esgEDv2ORVAPqMSc4DI5EbdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bXI+wBxt; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bXI+wBxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5V
	pK4RRd1yItUMS0ZejPjqOEMzZU1GrXtSIw6bvOSH4=; b=bXI+wBxt8gFc46meXU
	Zopz5xNzzjQDGqogvrmLURrDYWcV2Tjhx/OscAD5MWGMsZHFSjLMboDjOdn00u8u
	S/zfyncAwQ2S/ZYkFy2po9KJPgzkf+LfrrnRUVPIeOwCL4cy4ylnZxRRq8+2R63B
	YwyCadmqPgaLAXseLbVtnbsb4=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3x_0k0ZdqF_ZSAA--.18706S2;
	Wed, 02 Sep 2026 15:32:54 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH 0/5] ntfs: fix incorrect error codes returned to callers
Date: Wed,  2 Sep 2026 15:32:44 +0800
Message-ID: <20260902073249.3035977-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3x_0k0ZdqF_ZSAA--.18706S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF1DXF1UWw4rWw4DGr1xZrb_yoW8Wr4DpF
	9xCrn7tF4Dt342kFWvkw1UJ3WfZFs3J3y7tr1Fgw1Iya45Wr1xJr18K3W09FsakrWxXw1j
	qr40ga93CF9rZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jn-B_UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gb9yGqX0Sa6fAAA3V

From: Baolin Liu <liubaolin@kylinos.cn>

Five places in fs/ntfs/ return the wrong error code: a real errno is
replaced by -1 or by a hardcoded substitute, so callers and userspace see
something unrelated to what actually went wrong. The fixes are
independent of each other.

Patch 1 is different from the rest: there the error is not just
mislabelled, it is not seen as an error at all. -1 is what a normal
comparison returns for "collates before", so ntfs_ie_lookup() acts on it
as a tree-descent hint, and a malformed entry in $Reparse/$R or $ObjId/$O
is silently treated as a lookup miss instead of being reported.

Patches 2 and 3 fix -1 returns in inode.c that reach userspace as EPERM.
Patch 3 loses ENOSPC among others, so a full volume misreports create(),
mkdir() and link().

Patches 4 and 5 restore errors that are already available as an ERR_PTR.
Both collapse -ENOMEM into something else, so an allocation failure is
misreported.

No control flow is changed; every callee already returned these codes.

Based on ntfs-next (0fecc393f206).

Baolin Liu (5):
  ntfs: return -EINVAL from ntfs_collate_ntofs_ulongs() on bad length
  ntfs: return -ENOMEM from ntfs_inode_attach_all_extents()
  ntfs: preserve the truncate error in ntfs_enlarge_attribute()
  ntfs: propagate the map_mft_record() error in
    ntfs_attrlist_entry_add()
  ntfs: propagate the ntfs_attr_iget() error in update_reparse_data()

 fs/ntfs/attrlist.c | 4 ++--
 fs/ntfs/collate.c  | 2 +-
 fs/ntfs/inode.c    | 7 ++++---
 fs/ntfs/reparse.c  | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.51.0

