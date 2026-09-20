Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742E33264C2
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902083; cv=none; b=aHNUNFP/pImlP2sbk8eDK3a/CQyt2mI8wC8b/izCT4Yp8Uoo4gKo6JP6WJBULkQKUtFq0AuSxLn1mlr50HJ/MLRYubSUWIMOy6Sksd+fHnU9SbAS+HJrF35KyHIB0U12DqoGRendwmxC0L1EwfYMvjiUtKLwczx1wpoVmzQ2rJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902083; c=relaxed/simple;
	bh=b2irCKNRvwh6j5BtI0IN/7SVo/4GSS2OSXPunjhDdWA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tsIH4UDBrTwIb9kZq+LWxVscf21+GVGzMZnRf8zj2WP1Ce6qlT574p5UcaAMqHXewLDxHAB3v1ifZL8wzIXcGJ/ulTZoCRCLSnHPWoY081VfYqGWETEYbBmwpG4Q1rtjn/B5r0g4wdr70lY4PpSUdZGkn7GggCeB0gCpuQCC1KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b38ea4c6acso1897033b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789902081; x=1790506881;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xKyj3ZAdfpSZafyl+P4Qk/SsajEwWuQs7gqlaeL0nlI=;
        b=xBNr4+YdvxaJA4R0dT+3DWe0617ntwipKPuH/Gvmzd64WTx1JrV44R89zEZl0cT8lG
         hDlRqDaXnFTPuPuyXDrCksJdVtYFMorx25f07EKtIekGl4vGp7SZsVXL4qJX6gVijmQ+
         DOppyX/S8IHbCFAj7wEpybEDhtqU4/6EByCqDZ6I4eA4FH2xtvNPWUOOPlS8xrTtxrw8
         oWp6YlJwI0a+3kEw8xgCl1802ZlvCUK3izJmhYN1kH8aQS44VWamKWYqLj3B12mU54YW
         PaXkT95FI6ubyvFHBXujZtPOz2+d3T5Mmvf2m0p54pcsaLwsSvZmX4onIn/lo0AOVwLk
         g7zQ==
X-Gm-Message-State: AFuF++lGLEMjZloA8HJPchYleSXQRxVJZ25Lzg6oZlu0XnRqngol6gQY
	mhAQewhSe4BqsLYtzabqb/e5EfjrotsSJBO/1qs8PwXzMIPAztW7Ne9TCfbOCvVvOQ8SrJdAEWj
	VQ0FAoq9Ce8DtKhLCBrk6LLjj3z8+yzR+kcph/6dRSPKaGsJPHtNrK+il7MM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:162a:b0:6c7:bd8d:811f with SMTP id
 006d021491bc7-6ca9a74d671mr6747918eaf.23.1789902081351; Sun, 20 Sep 2026
 04:01:21 -0700 (PDT)
Date: Sun, 20 Sep 2026 04:01:21 -0700
In-Reply-To: <6aab8055.71f81b7d.278072.0016.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aafbd01.3179f8cd.1e36b2.000d.GAE@google.com>
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
