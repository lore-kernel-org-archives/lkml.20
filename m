Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06121432E6F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789908793; cv=none; b=C23FJ31OZcVxnA9UKxFbHAQxc7dwH5GC+ESeo8aigWGimelepAJhWTR1WCbL4O1rYTjFfcmpotAiqo7sZuW7IXdUw5x7+AXW+b0lcyzisFLQyfo4Vil7HjtXPqtcDwFLCEM6YmIyLYP3jzKkS7DZI+Ilx0UbIepLYBGNE185Wtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789908793; c=relaxed/simple;
	bh=b2irCKNRvwh6j5BtI0IN/7SVo/4GSS2OSXPunjhDdWA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mla/I9Ba8gIbDlJyFMQa0HIdCuQIbX2t+pieBZab9gZj0bjkCKbLLdf4y2DV7Gs56Zph52MyqFD9Pqkvth7XbgyGDNVaTslVw+Mrem2k/LdXAqoVV8POGDKAMpOW2om6U5iX7BzJA9YeDZH/98nlx8D4QFG/HExGW/WOufYOZjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2d1eb484aso3654510b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789908778; x=1790513578;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xKyj3ZAdfpSZafyl+P4Qk/SsajEwWuQs7gqlaeL0nlI=;
        b=cfNEk2nc32ikveT3gbAI91w2YYNTmAxE834PmUM8rnaepvoxNxnNdcjgb8oe1l1QsZ
         QREvpWvNJxo+9dZ691iLyNC2kPjfqM70cfvneQtPycF/8KaKuGFFdqTNQYNAARPlwBCg
         NqWCvowMcGrIL8OQAJXiSHUFB5HHPk7cU/zY3aXFwcuRzKALjllTQw005azCszF5wM2j
         rQcT+j8BUQMT1Y52y/04LXNDkSHDRAWW+AMn3qsYOUWB70zTJrCHgvwU06hDhYHgGTqC
         zz4Mb6IbbbJ2pO1VA8+kYeDOBi1qMgL6Io0LLugvxm6Hsn1+BX8mi9vTsMdh6WLZURuu
         XsOw==
X-Gm-Message-State: AFuF++kVBRx97ztfMlAad/jPintFEqXIYfDmPOIAOR6zkEMkxnfLeiTI
	J3lb3Yg6qmuMXORKCCp7KTTmVrlLzWN8aEkyyXJBEb8Gw8hTjZNSC+Mv/uVMvcOYvE/GRxpufoi
	xpYg/ByYrBoaMbIdLuMUX83fvd4amtWN2EXtxFkpZK53PkWVEejvC3j9oTvg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:ee12:0:b0:6cd:3ffc:e32e with SMTP id
 006d021491bc7-6cd3ffcea26mr4369380eaf.76.1789908777864; Sun, 20 Sep 2026
 05:52:57 -0700 (PDT)
Date: Sun, 20 Sep 2026 05:52:57 -0700
In-Reply-To: <6aab8055.71f81b7d.278072.0016.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aafd729.514bccd6.255447.0007.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
From: syzbot <syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
Author: adarshdas950@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 518e5b794c06

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 56b4f6469a28..a9b4e288ca20 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -842,7 +842,7 @@ static int ntfs_read_folio(struct file *file, struct folio *folio)
 
 	if (ni->i_valid <= vbo) {
 		folio_zero_range(folio, 0, folio_size(folio));
-		folio_mark_uptodate(folio);
+		iomap_folio_mark_uptodate(folio);
 		folio_unlock(folio);
 		return 0;
 	}
