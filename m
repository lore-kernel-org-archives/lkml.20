Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747118;
	b=HrP2YBpwGFk9fDNlViJB1Zn6rMaeerqLG9HxjJyhovmxQeRwDGnSyIUI0/B0dRyjjIrd
	 1A0DcDOfQQ9+D5FXxSDP4i3DlCGSAYTc+ls3Y5b32iv57WTSMxUZBypE470JKv77XwprE
	 dtfUULz5wsE+7ahPb/YYCR3g/i4FY9GAdhdOpwfrb4XXTJUJWr86nlPA6M/GzuwYrJd9P
	 CL5ThFfeCoi3rGoo0hxoQpuevIzxetd6O11ZW14saeF3yIOt80sO8w4VzRbE5pgvq5qVG
	 vDH38Z9+Z4fsVv8kd4I4Rtfw2GWZJoVUqi/uyvpNAKmn8IC8DdjOA1j/TGEJZ0hUWfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747118;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Eh2IGzLS7S13dZL1pAn6iZIYCBBFETaRW/Z/BD+wZNo=;
	b=poiZgstILbWekfdPBCco/NOqgoG3TqUiTYJGQMzzPIPRCsptCAkBDbZk4+urEoN96i8+
	 +WllmFAQ0VbJu1qfF+sn27s1O8Lt6IahNGCBP0KVVZQJBQMg4u9DCEkheZ46Cosb2g/Rw
	 +LQn23K1j8sP/HNwdwwa7XFj9purBWTEsCOtL8WveiksAgtmoGtvF/cyZc+HQvSqe0e4q
	 45MCQ23ZWH/A+Opdl7bMW504bpgj8mY4tFT/j9lrB2yb+S9gT58J/YwfksKHpZk31i3pF
	 /FkFaHoAi4ZW8bT2+yiiKnLW+MLSv69zYOj1nUh61UlHGbhPNdE67tBmy+nt+5CQ/1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=zF9PSm7f;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B17606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16B17606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=zF9PSm7f
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Eh2IGzLS7S13dZL1pAn6iZIYCBBFETaRW/Z/BD+wZNo=;
	b=zF9PSm7fR7V2DjaOCPTj7L36qefndh2baWsWb/qTKBJqCJbg/PdXw+opK85Q6IRcid2HTcNAn
	jctOxM7ePOlMleyPRXT8tC6FnoMV52anxVi6w2Ix6IqioLoun1c+8SO5fjxnmd30xbxUuPU74JT
	f0UkUwr10oj3E7jUxMh9vvU=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4j9y9r55QFzLlSV;
	Fri, 23 Oct 2026 17:18:24 +0800 (CST)
Received: from dggpemr200001.china.huawei.com (unknown [7.185.36.96])
	by mail.maildlp.com (Postfix) with ESMTPS id F1D194057C;
	Fri, 23 Oct 2026 17:18:27 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr200001.china.huawei.com
 (7.185.36.96) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 17:18:27 +0800
From: Ran Hongyun <ranhongyun1@huawei.com>
To: <leitao@debian.org>, <viro@zeniv.linux.org.uk>
CC: <linux-kernel@vger.kernel.org>, <ranhongyun1@huawei.com>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH] configfs: fix use-after-free in configfs_symlink() racing with rmdir()
Date: Fri, 23 Oct 2026 17:11:01 +0800
Message-ID: <20261023091102.1848219-1-ranhongyun1@huawei.com>
X-Mailer: git-send-email 2.52.0
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemr200001.china.huawei.com (7.185.36.96)

configfs_symlink() drops the parent directory's inode lock before
resolving the link target, because resolving may need to lock other
directories in the same tree and holding the parent lock would deadlock.
While the lock is dropped, rmdir() on the parent can proceed all the way
to freeing it:

    configfs_symlink                    configfs_rmdir
    ----------------------------------  ------------------------------
    inode_unlock(dir)
    get_target()
                                        detach_groups() -> kfree()
    inode_lock(dir)
    allow_link(parent_item, target)
        <---- use-after-free

configfs_symlink() takes a reference on parent_item, but that only pins
the config_item itself.  When parent_item is a default group embedded in
a larger object, the reference cannot keep the containing object alive.
For example:

    symlink("subsys1", "port1/subsystems/subsys1")
    rmdir("port1")

Here parent_item is port->subsys_group.cg_item, embedded in nvmet_port.
Pinning it does not prevent rmdir() from freeing the whole nvmet_port,
leaving parent_item dangling when allow_link() runs.

configfs_rmdir() marks the parent as CONFIGFS_USET_DROPPING in
detach_prep(), before any teardown starts.  Re-check this flag after
re-acquiring the inode lock.  If it is set, the parent is already being
removed and allow_link() must not run; return -ENOENT.  If it is clear,
rmdir() has not reached detach_prep() yet and is waiting on the inode
lock, so allow_link() can proceed safely.

Fixes: 351e5d869e5a ("configfs: fix a deadlock in configfs_symlink()")
Signed-off-by: Ran Hongyun <ranhongyun1@huawei.com>
---
 fs/configfs/symlink.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/configfs/symlink.c b/fs/configfs/symlink.c
index 89178f5d371a..56064bb42909 100644
--- a/fs/configfs/symlink.c
+++ b/fs/configfs/symlink.c
@@ -201,6 +201,16 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 	inode_lock(dir);
 	if (ret)
 		goto out_put;
+	/*
+	 * A racing rmdir() may have freed parent_item while we had
+	 * the inode unlocked.  detach_prep() sets CONFIGFS_USET_DROPPING
+	 * before any teardown, so check it to avoid dereferencing freed
+	 * memory in allow_link().
+	 */
+	if (sd->s_type & CONFIGFS_USET_DROPPING) {
+		ret = -ENOENT;
+		goto out_put;
+	}
 
 	if (dentry->d_inode || d_unhashed(dentry))
 		ret = -EEXIST;
-- 
2.52.0

