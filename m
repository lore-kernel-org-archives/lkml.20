Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9652F1C8604
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896505; cv=none; b=oQtsmkQQ9mv5C7Va05UnqFZKQnL4xL3zzjoaTSgo2fH+viK03d6KtFzypcq/14fVjBMvmcTOuDNhVXYTI2XdMek108XcNfnf9eR1l+/xAmrzy4tA65zinPNtgNYYspDGx8NGf31tZwuzwRSYEP0uzutpJt4q+u0/juFIhiNY5FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896505; c=relaxed/simple;
	bh=6uIS438IgCmKJpuw+BfOiRPv/TfQv4mUb8H6jmXbYyA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=riSmkumP8PkL2YLOHUhEhcWoPtjBrY60kPPz1d9ol57xgquMB00vMWRqh1uURP3NzQcxZWdrne6pk4z6fGEM1JTscSU1SiZ4paOR+4jGqF7M7AA6Qkjfhwla50u0fs2qR/dRp85I1drRuGFyMy2q0IRq9oWra3vouReDeIjk7tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a313ec13ceso3740337eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896502; x=1790501302;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3LEirGodP23m3O7ITRgEdygwybna6EsxfMt0ijJiELk=;
        b=z8f4mM6y/3Q9ghu184vx6iTB8vsjlTaqmXWZ7V5vBAg+id308RoBKwbi7ha8VJ06Wv
         phmEe2fgIRq7esLjeYCFPZnGDWqhRsmnDCuh/Vo1CuCK9eEIBiHcSqYeWOGLtcbkCmVp
         s+OxmJbJSOcaPQS9AJDxY42B7Bu8YAj3xGIn1Wl8YhzA5TyWe4nBfvlHQo2+JSVC5/W5
         /pbPLMNY2bC1FeUdXvLBwHjH0SjQTis7BRTT4heoYSzaP7EKnScW11LN1rRDWZ+HgCXm
         bvDYIgezwTLPOTB3SPbFsEbVGXehDw1p47RtNrAEnX7FD+S91gHMhfsO5vonpScqUExb
         9CZw==
X-Gm-Message-State: AFuF++kc57wSZQqb14zaMkjwFoO5vZW9wmCxFocYxwSeuCe5Ko9KHYC6
	ZzZ5/MdDpeb01zA40Zw/FqrqlX+++wZOuQ3lhGSxniiXe6eP1X8bV0+iKngdscPdwdNOw4rlzFD
	dLadLe2uTKrxtSe74751cRfVkzDrg7p7EUziHpESJCDdfYi4a0rDKST7L13s=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1c82:b0:6c3:68bb:ec5d with SMTP id
 006d021491bc7-6ca9bf49e90mr5847044eaf.33.1789896502398; Sun, 20 Sep 2026
 02:28:22 -0700 (PDT)
Date: Sun, 20 Sep 2026 02:28:22 -0700
In-Reply-To: <6aab8055.71f81b7d.278072.0016.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aafa736.a6af0033.177e91.000b.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
From: syzbot <syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
Author: adarshdas950@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

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
 
@@ -1943,7 +1944,7 @@ int ni_read_folio_cmpr(struct ntfs_inode *ni, struct folio *folio)
 
 	if (vbo >= i_size_read(&ni->vfs_inode)) {
 		folio_zero_range(folio, 0, folio_size(folio));
-		folio_mark_uptodate(folio);
+		iomap_folio_mark_uptodate(folio);
 		err = 0;
 		goto out;
 	}
@@ -2521,7 +2522,8 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
 out:
 	for (i = 0; i < pages_per_frame; i++) {
 		pg = pages[i];
-		SetPageUptodate(pg);
+		if (pg)
+			iomap_folio_mark_uptodate(page_folio(pg));
 	}
 
 	return err;
