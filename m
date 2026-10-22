Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664207;
	b=gprwfcWu1sCXCm+xEH5JzZMIx6/Gsnf/6ivDK6p1Kv/TjftPtLjSsTYqvk6XdTxxklmp
	 EJxN0L+O2pdA0BohSpGDn6sQ+M7+vO5TMkaRyU9732BC50tl4CD4QCmMNWfx0jo8rWIDo
	 /Xnt/u92rtVVO2Ir/N0kcFAim9WIupDiVZ3nFTgRPcCDrjrkyRomdEi2HiAOidkRs5mZ8
	 iHYtX1hWzJPIj7T6U0NfyIVqrg/LJBGWY7Zzs7a5F3zeHoX+vvaaZsjsXoA/DKBDp2r28
	 48o/xVOlRi6zhruCPcbbf/ILvjlu5D+sD9vhMM6mKVPNxvFj6Zt83Q0+oUyIU71EViQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664207;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Y/SfQ5pVkPKEdjBuE6Bzo3hgfS7WOGnrqmqcXbb+X+I=;
	b=MoeLVvbx63tXeDxhO51TP+5W4Jv1FBLFCtp5JfImtZMXFBSvanLqAt7WZsQRZsJtf+tP
	 xSkdYDC+raXFqFUWJT9x14JZpNUjsD/Pz5PX2P5Z0prin3tysvUe7c2ejbnr86NE5fsRI
	 1new6lSkjOpl8N6xwb6wLST+x52nJIhrv6x9SaDzaf7dcHknXlsDrP7QtK998+wosxMt0
	 gJXVgkki22gLNCfiaNKGUrxgxQU+iEXTpx6M373Hor/yuA67fQscuFvMq0Cmj4gUcoxWV
	 CcLJgZlccDggN20MMrru8XT9IGh30JlXRAW4o630YTuySskkHop+m6pLal+E/JmT8iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=xfVaeBuq;
	arc=none smtp.remote-ip=202.108.3.166
Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn [202.108.3.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76D8606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D76D8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=xfVaeBuq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792664205;
	bh=Y/SfQ5pVkPKEdjBuE6Bzo3hgfS7WOGnrqmqcXbb+X+I=;
	h=From:Subject:Date:Message-ID;
	b=xfVaeBuqpULe3dMqQ4Lunv/G9vEHENXK/H3g/ZMIzO2uJTsrMT8ggfaLJOT8uZyjT
	 Ty83uBvWKoMM3nAnuUXK/ffebfyu8riBqSG2BEl0SnqRSYcin4dmrNtfVV5INEvsI0
	 pWAud5XIWaRIMTqaFTAoo8y1nHVBpetzzw/OqDRw=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.31) with ESMTP
	id 6AD9E2810000425D; Thu, 22 Oct 2026 18:16:36 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7163166816020
X-SMAIL-UIID: 5A802CAAF81F4600B0298542E5D2DCF4-20261022-181636-1
From: Edward Adam Davis <eadavis@sina.com>
To: eadavis@sina.com
Cc: a.hindborg@kernel.org,
	leitao@debian.org,
	linux-kernel@vger.kernel.org,
	syzbot+4fae162886e497f72228@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v2] configfs: Add revalidate for cached dentry to ensure it's ready
Date: Thu, 22 Oct 2026 18:16:33 +0800
Message-ID: <20261022101633.107916-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021062535.55494-1-eadavis@sina.com>
References: <20261021062535.55494-1-eadavis@sina.com>
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

 fs/configfs/dir.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
index eda80c2a2d38..d8e74abe3485 100644
--- a/fs/configfs/dir.c
+++ b/fs/configfs/dir.c
@@ -65,8 +65,24 @@ static void configfs_d_iput(struct dentry * dentry,
 	iput(inode);
 }
 
+static int configfs_d_revalidate(struct inode *dir, const struct qstr *name,
+			 struct dentry *dentry, unsigned int flags)
+{
+	struct inode *inode = d_inode(dentry);
+	struct configfs_dirent * parent_sd = dentry->d_fsdata;
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

