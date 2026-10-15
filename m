Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9224334AA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094346; cv=none; b=i0w+RscWpTURNaI74upZPygFSIlhexw9XUas5M7akl6F1KEYqWEdBHNfWswiM67guUksNrGXDPaEhJtRuXEix43BGpbWxWSqZ04kzkiRGyriflx0+5Vish9veMuFKKh+gXW+XWJ06le9t3t5i+QJ+29C5TZIkfmhBI3gLg5edZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094346; c=relaxed/simple;
	bh=zRl3M5+NZnWam32sifa4b8p4IXF4ZgP71+EKCiBjHJk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Xh7lnjR6bRJ/I2nCiZtFfWd/SebsxcPY+nm4NhNeZ8S1IROxGrfqY/MVRD+8nMBxoEYsWts2qRJmiE2jdcFPk7CYeRyGEU1rLaMV3sZUe6nN72jXJNMT3Nh3gmB3a1XZR0pVTNyFXlGgiO9JDACbUK8J2jMkR+200jLmwwUstbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4f652f9bso4949969b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094344; x=1792699144;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1DpsPenNOO4Sv1KfdrpXrKoQ6gMPJpWLHJ+7NF4IPzc=;
        b=vYx5rxbVJQHbR13qIrU6VD+pcMdoR+ZChOBNGYY7lzfiJrr1OTtpeaKh1Nqz+PPXYl
         fYguF+O0b3fwqPzWWT9wKKMe/eYvB3q5zG3eOUkXpScocQCp53/OfL+x6WATtbpeRUTM
         +noOxBCcjIfIAewSVskziVeSLla2D0nycU9BmfVLhZ+eJy+wyoGW9jZCKFYtPGCj0wxb
         lXrvT4M4rB76QLiMtUephVKRVuHqNXGibouIalP3aR4j/TX04eK3kA9h2tL5IL3Oy4og
         sLQzT9cRdlkvc9+qhdzZgmKZMiGSqVmNF/l2lBs69VRvVXXao96nMK6ahL/1VSXePcYz
         NudQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXniSHAzDEgM0QglA8boLCY5lAAwLt2edGTPSrl0NZfIdl4hz4JjxML1el1Ki0f55tWut5egNYHNvUXIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5BrKuJLUV02eItq5cKb4xaj3SO2bdpzh+Ps0um4at9s8Fzclz
	j7uULVYOggKcdejGKmADg8V5UXcNs/+/9hNGFmXo/yKK1XEOsOm28Mca/b1KklNHmDCc69J7OP5
	BtUxB/UtdKt15WYixv0UYwX5hWrkgBBW5RoND8WRq7DOX+bR0Ne/RBnpjaIo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a19:b0:4f5:1e05:c976 with SMTP id
 5614622812f47-50c50f31768mr17992861b6e.27.1792094343884; Thu, 15 Oct 2026
 12:59:03 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:59:03 -0700
In-Reply-To: <6a69447e.6bd615f2.c0aa.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad13087.7514cce4.1ece07.00c7.GAE@google.com>
Subject: Re: [syzbot] [fs?] WARNING: refcount bug in config_item_get
From: syzbot <syzbot+35790eb7861f8fc57382@syzkaller.appspotmail.com>
To: a.hindborg@kernel.org, jeffinphilip14@gmail.com, joshua.crofts1@gmail.com, 
	leitao@debian.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	vasilisalmpanis@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit f06c2d26d1999d37e93299db0ecead04ca7d0b9f
Author: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Date:   Thu Jul 30 09:30:25 2026 +0000

    configfs: unhash the dentry before dropping the item in rmdir

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13ad160d580000
start commit:   2f1baf1fc892 Merge tag 'trace-v7.2-rc7' of git://git.kerne..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=158601bb8cb292dd
dashboard link: https://syzkaller.appspot.com/bug?extid=35790eb7861f8fc57382
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10f75279580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12a7869e580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: configfs: unhash the dentry before dropping the item in rmdir

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
