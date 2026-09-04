Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A653B5847
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788492452; cv=none; b=TRuUihfhYXga3yKCMVcUCT7x+Rf1wm496rJEmx7s2ba3YBY85mxHbyrqaO/BLjM3AAQD0u+fDGFhWX76wC4Y0+HYfkC51syXwqslu1eD2mXraJCshj3HKkj8F5QPIGT/sydah4kgNT7WZ0EeYGT1fy2OuJ6olgkHEL+QtLDRv3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788492452; c=relaxed/simple;
	bh=m0sWhPWPmemLVNlSaBPqjCxpt64m5Tf7CRzVn3Wj6tw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Diy4ZlmDzdYfVuf+bIyvOrUnr8uP+NCWWAWWasn1GLafxI3Dod81z/iKy2Mx3MrJFArMVx5inv9vlwuMPqOcGd4/8RHTMnp0LyvM23AcXSLLE6QbCVOH8Yqj4e8kO9wo2tRhRRVHCViLlG6AlVdp2ID/SAK0IVxHthFybj7EdcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PWKxPBSZ; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PWKxPBSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=SO
	oH18aPhcOliPefTS06vZ36gO2APY+eDPFLZLny21o=; b=PWKxPBSZhqmsxL2IXW
	EWFH/evCRdFw0BLpT2oov9Pcv6r+/YdJ/fFkAHpWZdOej0sBdeZWG9Z9RZEyo5Yv
	BlkBFqdDwSdD/LlE0eGzRESfZOAA/TnDqpttwyWK1gTEqHvuD+EwkghgT4Uf5Xl9
	F62NsR8K7hv5n6zG9c1p/+GV0=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAXY956Oppq131AAg--.29039S2;
	Fri, 04 Sep 2026 11:26:51 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2] exfat: clear the volume dirty flag only when remounting read-only
Date: Fri,  4 Sep 2026 11:26:41 +0800
Message-ID: <20260904032641.435958-1-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXY956Oppq131AAg--.29039S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF48AF17Jw4DZry3Xr18Zrb_yoW8urWfpr
	Zaka1jgrWkJa1xursrCF4xXryFk34IkF43Jry8Zw15Xrn0vr9I9ryaqFy5ZF4DZ3s3Ka1F
	vr40kF98Xr17GaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnF4iUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2xvti2qaOnsFGQAA3L

From: Chi Zhiling <chizhiling@kylinos.cn>

exfat_reconfigure() does not hold s_lock while calling
sync_filesystem(). Therefore, the filesystem can become dirty again
between the sync and clearing the volume dirty flag, leaving a dirty
filesystem with a clean volume flag.

Holding s_lock across sync_filesystem() is not an option because it can
lead to a deadlock: writeback takes s_lock in exfat_write_inode().
Instead, clear the volume dirty flag only when remounting the filesystem
read-only, where no writer can modify the filesystem after the sync.

For a normal read-only remount, reconfigure_super() calls
sb_prepare_remount_readonly() before ->reconfigure(), which returns
-EBUSY if any writer is still active. Afterwards
sb_start_ro_state_change() sets sb->s_readonly_remount, so
mnt_get_write_access() fails with -EROFS and no new writer can start
until the reconfiguration finishes. Therefore no writer can race with
the sync and the clearing.

Forced remounts are different: with SB_FORCE, reconfigure_super() skips
sb_prepare_remount_readonly(), so the writers active at that moment are
not blocked and can still dirty the filesystem after the sync. Do not
clear the volume dirty flag in this case.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/super.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index a9ea36ba2693..84f599b37a45 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -775,9 +775,13 @@ static int exfat_reconfigure(struct fs_context *fc)
 	fc->sb_flags |= SB_NODIRATIME;
 
 	sync_filesystem(sb);
-	mutex_lock(&sbi->s_lock);
-	exfat_clear_volume_dirty(sb);
-	mutex_unlock(&sbi->s_lock);
+
+	if ((fc->sb_flags & (SB_FORCE | SB_RDONLY)) == SB_RDONLY &&
+	    !sb_rdonly(sb)) {
+		mutex_lock(&sbi->s_lock);
+		exfat_clear_volume_dirty(sb);
+		mutex_unlock(&sbi->s_lock);
+	}
 
 	if (new_opts->allow_utime == (unsigned short)-1)
 		new_opts->allow_utime = ~new_opts->fs_dmask & 0022;
-- 
2.53.0

