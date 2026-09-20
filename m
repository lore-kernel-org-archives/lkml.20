Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF0D3603E0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789900501; cv=none; b=TKjT91z6c1cNegoTnoQj1LSIcEWJ2LmjisrrA6n3hP+T5qd3fannsBwZ7UDraSTzedskXB95inYq6aY+mUPaJiV/I8Tnm3MFY9M4Qn7jaz/zAIvsZW/b6BSWA75Q9PEJMltn93CBlBTfXMxtfqGT0orzbz/vD48UAPiz0yuH8gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789900501; c=relaxed/simple;
	bh=L71dHL2BqDOpygVJBIcr4IaScMuTL009jrgRnNcr5UQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=GozBmq5VAWmQFKORO5VjMDfpS4n/gEllYOSRBBXzZj7PO24w+ET0X0w8q6R/Dt1X7r2EJyPPtNCbeybhB8mc/69S76Bwmukk1njXTB04mT4XjhbvqGxCpOQ7V0notx6x48jck0qqOHCZHCM+GWgnTc6pdeC9egWDceF3SCjcZHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab4dd46ddeso1838050b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789900499; x=1790505299;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VH+E6K0oDODO1Q8lCyzqTS2iXBz3MMg1s3u7BNAGF5s=;
        b=PGmGPWpN023s64ZDioNA8zjVTX1yW7brloYt54kWRuQGbaGJQkmj8HJk3lI7qlY0A9
         tMeKci1CiZYaUKsEFIsbB2uJ9m4RdhKhMwfdcWbZo86uOrUXrk1vhM3S8BCJ2LNtnYI/
         jze+QlWPxMBiZfWnRURGK0FMdjkqs73EBotRD+98kxjv3LZ4onKA3Jl5o9Nsyln7E1c9
         pgHO/+2x0nzV7E9RSnUPzNsRdHyi3kj+E03WO/32AyCMjnJuPsm9upkK1ATS4rRJwJck
         Rma2+ckT7y9Ck90oc0wMWXN4mhVnJKThdXK7t3zNL4WG5nXuiSkywIHcUBAHS3FdVcrN
         lWnw==
X-Gm-Message-State: AFuF++k30RmlP0qFgwwnba0WLt70VJyu0jUbuOdEwjK8u6PEWcBP0nzM
	rKqXq2idZKnwO19kYm2yQK/r3YpY3N7IUt0hma3Kiv4QdoINjazIjRr2TOS1lBgY8kD9baJiVf3
	TomVG2kT8cYCz7rjKeQWz7609y5dSqae8WCLZoflAgBLR+htWhZdjaqS2aco=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:818a:b0:6b7:8396:f3d6 with SMTP id
 006d021491bc7-6ca9ce4cfcdmr7629727eaf.56.1789900499104; Sun, 20 Sep 2026
 03:34:59 -0700 (PDT)
Date: Sun, 20 Sep 2026 03:34:59 -0700
In-Reply-To: <6aab8055.71f81b7d.278072.0016.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aafb6d3.3179f8cd.1e36b2.000b.GAE@google.com>
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
