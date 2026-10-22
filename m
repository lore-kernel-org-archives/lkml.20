Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667502;
	b=e125MQL8FUsP0TPEs92xpZ6YsYkrlGj943SZuryC6upDpHW/MoEPJm4enINaKJbTcXgi
	 aYXkv8cMvX7ccV9FB0sAGX1njf3gZUospKKZMVPjrF+NB1c+u/FnXuWGZg3+DZ90gxg+1
	 R7n2ugDoL/JlD6Fjv2jmeWQecwKCNvnjZOV/royytGtT8AOvevxWXt857TZNWTiMn5SoG
	 m4lD2FCXvt+OvQpQ9YidbUwK3+sWE2CbT8ppsfu++VEUmkv4EXcGpVrLWGnxnjhrUgX8S
	 6xzzg7x64WCufdluE4OMqQ3B4RiOKoazZnVnkphdMq7gNNaF8HngdMrBZlkMcmzfYGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667502;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=aO379ub4wI8TldG1ke1B+w7i+dmhFEPvESN45/WAwuE=;
	b=qMrFFGTIMpmiF9loONDKcnlyED19JZccFkor4h00ukZvJeUalAx0cs0teuS3edkT6TIa
	 IRiU8aObV7mRcqjBWWj2lqebz3wFqLQHt+lZemH0/Y6MKUoLmoaWc9xONSMkUn6L8enNY
	 SYiZsNPkVhuRTCbNmZpygIPhsO/WiOMyCtUq4tzJzj1ogNPIisgR8+t75ge4Psvs1irn7
	 KXrneDUpnNLroFEYsZXuObnQME6RSsHOCwWdlyDg9I6XJdWT2xF68+oScRb0eAydSsMsg
	 LKl6GSx8YJ1ooj9qurtgaQDVxxp4KMcwER76rhPEnlwSfOKC/Ot5c2uSaHIn/6tojIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=yIEjJKu7;
	arc=none smtp.remote-ip=202.108.3.165
Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn [202.108.3.165])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807C6606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 807C6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=yIEjJKu7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792667499;
	bh=aO379ub4wI8TldG1ke1B+w7i+dmhFEPvESN45/WAwuE=;
	h=From:Subject:Date:Message-ID;
	b=yIEjJKu78VIE1YF8sngxjIunPgIZbWwUW4h2ma8xusJVG45wdbw3PLCw1L9vD/UfI
	 +SiIt2yL/Z2J1GV2exX38DiREbJw+hH3QDOX9SfQoG95FsTYThE4XROLHWEdDOtecl
	 MXaLCp/xFMM05KtBy76CkEydlx4mJi0MMmL71KpU=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6AD9EF5F00002C32; Thu, 22 Oct 2026 19:11:29 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7405596685236
X-SMAIL-UIID: 3AE3FB2CDA4A4D868BE1169E6A8F908D-20261022-191129-1
From: Edward Adam Davis <eadavis@sina.com>
To: eadavis@sina.com
Cc: a.hindborg@kernel.org,
	leitao@debian.org,
	linux-kernel@vger.kernel.org,
	syzbot+4fae162886e497f72228@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v3] configfs: Add revalidate for cached dentry to ensure it's ready
Date: Thu, 22 Oct 2026 19:11:26 +0800
Message-ID: <20261022111126.112181-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022101633.107916-1-eadavis@sina.com>
References: <20261022101633.107916-1-eadavis@sina.com>
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

mkdir() triggers:
  configfs_mkdir() ->
   configfs_attach_group() ->
    populate_groups() ->
     create_default_group("ana_groups") ->
      configfs_attach_group() ->
       populate_groups() ->
	create_default_group("1")

The creation of an inode for the subdentry 1 under ana_groups failed
due to fault injection. [1]

Because helper threads are racing open() on ana_groups, ana_groups has
dentry refcount > 1. d_delete() skips dentry_unlink_inode(), leaving
d_inode non-NULL. create_default_group() hits BUG_ON(d_inode(child)) at
fs/configfs/dir.c:734! [2]

[1]
FAULT_INJECTION: forcing a failure.
name failslab, interval 1, probability 0, space 0, times -1
Call Trace:
 should_failslab+0xa8/0x100
 kmem_cache_alloc_noprof+0xa1/0x600
 security_inode_alloc+0x39/0x310
 inode_init_always_gfp+0x97e/0xd30
 alloc_inode+0x82/0x1b0
 new_inode+0x1f/0x170
 configfs_new_inode+0x27/0x410
 configfs_create+0xb5/0x270
 configfs_attach_item+0x25f/0xd60
 configfs_attach_group+0x2a/0x370
 create_default_group+0x87/0x180
 configfs_attach_group+0x169/0x370
 configfs_mkdir+0x6f0/0x9e0
 vfs_mkdir+0x40c/0x620

[2]
 kernel BUG at fs/configfs/dir.c:734!
 Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
 RIP: 0010:create_default_group+0x17c/0x180
 Call Trace:
  configfs_attach_group+0x169/0x370
  configfs_mkdir+0x6f0/0x9e0
  vfs_mkdir+0x40c/0x620

The root cause is a race condition between open and mkdir. Add a revalidate
for cached dentries to prevent open from accessing directories that are not
yet ready.

Fixes: 7063fbf22611 ("[PATCH] configfs: User-driven configuration filesystem")
Reported-by: syzbot+4fae162886e497f72228@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4fae162886e497f72228
Tested-by: syzbot+4fae162886e497f72228@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
v1 -> v2: using revalidate to make it's ready
v2 -> v3: add LOOKUP_RCU check

 fs/configfs/dir.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
index eda80c2a2d38..76f453ed4adb 100644
--- a/fs/configfs/dir.c
+++ b/fs/configfs/dir.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/err.h>
+#include <linux/namei.h>
 
 #include <linux/configfs.h>
 #include "configfs_internal.h"
@@ -65,8 +66,27 @@ static void configfs_d_iput(struct dentry * dentry,
 	iput(inode);
 }
 
+static int configfs_d_revalidate(struct inode *dir, const struct qstr *name,
+			 struct dentry *dentry, unsigned int flags)
+{
+	struct inode *inode = d_inode(dentry);
+	struct configfs_dirent * parent_sd = dentry->d_fsdata;
+
+	if (flags & LOOKUP_RCU)
+		return -ECHILD;
+
+	if (!inode)
+		return -ECHILD;
+
+	if (!configfs_dirent_is_ready(parent_sd))
+		return -ECHILD;
+
+	return 1;
+}
+
 const struct dentry_operations configfs_dentry_ops = {
 	.d_iput		= configfs_d_iput,
+	.d_revalidate   = configfs_d_revalidate,
 };
 
 #ifdef CONFIG_LOCKDEP
-- 
2.43.0

