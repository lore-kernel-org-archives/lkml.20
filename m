Received: from smtp153-166.sina.com.cn (smtp153-166.sina.com.cn [61.135.153.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE25245020
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787814204; cv=none; b=n6qAbcNTQKBKVe1GLUT189LL43X//gWiHJYloSu7WWLa3XARZPPdmSIyP80XYsSAg30P08fzqq5F2SScyjZ8ongjtvk2rNpjDyXi2M6HS6C8As+g9HfIq541QHUlfzOu4orex5v59MOiyItuHmr7FbuCCC6mj0CxHVor0CAItwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787814204; c=relaxed/simple;
	bh=zCxqknddMvcgsgom6GT2+ECN2aU0N91pByKfr2k1sGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kva90NYSy6EtJoxR23I1e4gHLts/GB25UtYBDdqxm8XUIhpVKgIo5m8h9gcplFv+9BRgZ98k68EQPNz2LWXs1gTvdim+BjpREP1aCDg1twBAzZFX8GBg8pwgM9UCTrBWBcMpo94bcW+SfRM7Wf0eonBK1JSdknVrJhGae+Jf53U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=g83ZjPjD; arc=none smtp.client-ip=61.135.153.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="g83ZjPjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787814197;
	bh=DlOMSZznuuscliLfd/RAGQk3CGjO/bQm/TaKlkT+KiI=;
	h=From:Subject:Date:Message-ID;
	b=g83ZjPjDitxYRxw+9c4wFIpzfEuPhzUQAi1orWoxyPMwFjpCeWmq3Qawp2AgsUlMf
	 oJpiqi4gwY9fgOOo5tQANEbtSCW1SmdgXEZ1AhbK5KwORCrsfnP5zsRf475s8J9tdp
	 G+g3UEvH96v18xmIqzVL8ZHeNGRhjAqLHP3cCZk4=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6A8FE1290000106C; Thu, 27 Aug 2026 15:03:11 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 2942576685197
X-SMAIL-UIID: 369133F3A91A4A20B5CFA70CDB902C8C-20260827-150311-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in stub_rx_loop
Date: Thu, 27 Aug 2026 15:03:05 +0800
Message-ID: <20260827070305.162124-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a8fcbe6.4d659fcc.734b4.000a.GAE@google.com>
References: <6a8fcbe6.4d659fcc.734b4.000a.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream 502d45774af0

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 97c04ab2763a..cea5d86a5591 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -1701,6 +1701,7 @@ struct ntfs_inode *ntfs_new_inode(struct ntfs_sb_info *sbi, CLST rno,
 
 	ni = ntfs_i(inode);
 
+	ni->base = ni;
 	err = mi_format_new(&ni->mi, sbi, rno, flag, false);
 	if (err)
 		goto out;
@@ -1711,8 +1712,6 @@ struct ntfs_inode *ntfs_new_inode(struct ntfs_sb_info *sbi, CLST rno,
 		goto out;
 	}
 
-	ni->base = ni;
-
 out:
 	if (err) {
 		make_bad_inode(inode);
