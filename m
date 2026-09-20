Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B953CA491
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789895473; cv=none; b=dn5OQDSSRG8+nCTi2pSZJUDwV0BHLnIr+RUaWJ9wq6viw09Xq38+v5FdEz7tHe2XXy655bwqKULwWWk7PBbOxhK+dM/vjUf/WT2ASYbCu/n2MtRGGhc/gdKvB4Nhj0FmJyjUIVQz+KATaZ+sW7tNkLcZ7tMWfcW3AsL7a9EURT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789895473; c=relaxed/simple;
	bh=8pQvA+mtpaktA+lGlFoC1zVdFG1a7lIN1G1qHK7Bs2A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=nF7NfLIXxzmLKyEC20l8lS7igRln5Ot++iJz2o9kjWGsrcMhN7FTbfKJphLuhMrRk/8cZCa5A5Os5f2fFrp++WxemtSllSkYmhoCKxA2fumafBFwQkxbRjWbrmY3wf4Jl575dubxTj3oTk1vPjsdNGRiaF22uoDcaWqQEf5+3zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-80139a2495aso3616391a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789895471; x=1790500271;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VgFbH+LjfciqWOTYfzhCn0j54sgcuNYu/8l5ERwzsoI=;
        b=XqQe4fMMaU61TtzNF5OawQJIb0XAvbHuBKMCNF/RbVhxhb267ML1uvNHvft7I9YiZb
         DrFnBTdnmG+t34MsmVWxet9FxlPwrVD1imR/hdDNCM42xYEKiBhVcGijH+tI75TJ9ZMH
         JoudR5lUwrxQQ2zNWw+SlnhkDL+Ar49GR0ytoTPh0ivY22DNr9bN1ZYCp2gYSJbrIzSw
         U7dC+XdE2kLKgW09dQ9OrSPCeqQ3lK1u6xKRN/lhnCKKfbk7Q2ubamdl9Am30bMhZQ9g
         b6K8ww5kD++b/AUOY+UuXx2r1D10sETSiTCI9l14Rs5wWw1uAJs/9ctcD/Pq1ID2fMR9
         ORdw==
X-Gm-Message-State: AFuF++mD+YYBVn/q1HUX0HmL6UUTaKRjP8MPiFDD/aiBwZTiSGyZ2Cni
	v6rWNFRbR9HA69q/fER9c5pa4v2fub1jGAzdfGJ8V9c/7ye6pGC5KKbE9MgMg/Z32HiF7tggAvY
	+VD8Y0kQres4kKF4O+gICTKcjmVmKJixR16SYWWfnVLUU3aF1JvqyxYJJ+Kg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4c85:b0:6c6:fd6b:f156 with SMTP id
 006d021491bc7-6ca9ca5a24bmr6577983eaf.56.1789895470949; Sun, 20 Sep 2026
 02:11:10 -0700 (PDT)
Date: Sun, 20 Sep 2026 02:11:10 -0700
In-Reply-To: <6aab8055.71f81b7d.278072.0016.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aafa32e.514bccd6.255447.0005.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
From: syzbot <syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
Author: adarshdas950@gmail.com

#syz test: 
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index bead01a953f3..5f833a75a829 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -7,6 +7,7 @@

  #include <linux/fiemap.h>
  #include <linux/fs.h>
+#include <linux/iomap.h>
  #include <linux/minmax.h>
  #include <linux/vmalloc.h>

@@ -1943,7 +1944,7 @@ int ni_read_folio_cmpr(struct ntfs_inode *ni, 
struct folio *folio)

  	if (vbo >= i_size_read(&ni->vfs_inode)) {
  		folio_zero_range(folio, 0, folio_size(folio));
-		folio_mark_uptodate(folio);
+		iomap_folio_mark_uptodate(folio);
  		err = 0;
  		goto out;
  	}
@@ -2521,7 +2522,8 @@ int ni_read_frame(struct ntfs_inode *ni, u64 
frame_vbo, struct page **pages,
  out:
  	for (i = 0; i < pages_per_frame; i++) {
  		pg = pages[i];
-		SetPageUptodate(pg);
+		if (pg)
+			iomap_folio_mark_uptodate(page_folio(pg));
  	}

  	return err;
