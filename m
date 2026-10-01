Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF624B049F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845927; cv=none; b=Aq3GMCzO+TQoDSH+8CkN1kUWgeWsbsZ7qm/mf3Za3IjmXLFZaJ+UQRL29xb+qCJ17U4sCZ8tOuuKZAFKIyIlfrFxIVl0zdx7Hl1wrfkYNWfvAy6FIWqjzW1ZZQcgas4D90dnGVvslx7skS4B+Q3Gt8gPm2EW2reg0/BOvcF4aQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845927; c=relaxed/simple;
	bh=rmhrbSnBSUxeKoLNvTbMYWoPlkRTthzk/Q5PK98L5P8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KUF+I9B6Xe6yVkH3jYmdNUaBMBe2lyTy1WTsPZNgMzHXlHXItQnbz+9S9J76y7XvYzQ9ZLPihqDwKcnx3xkNTW36THlrzsOz8Y66VX9oIBxvIW5B/Qe8CKyCj82QCY/i40Q4o/s0xpenMyCRRW5h5ipBwrasrp7hN2RE/slgwjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4dc57e2a3f2so9836755b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790845924; x=1791450724;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XgJiCdQR0Xmk7ph93rGrgxQB+oBi4FLN+0tyktySXJ0=;
        b=150BnJki+f9veAf+hcOhgFk8uFq20bqRWECQpfUGZpUz8fBBQPtBGPxRuSKGnC86Kt
         UEvOJeXB47/2KtShm80eZlHybvZwpbcGZ64jylmDvPYjz5KS3H95orY4zMoxxNdFl6x2
         fMO3pDa1GZ4h1y2RQCR03rvAoqKpVN3vECMEcO/4UOtZHMc0J2+Ch/1QjZifzbzBH9id
         QbYtyIEkVEg0UCZaGCFVzvT9zmTzBZT9W1VJL0L7OlFLNYc+fG30fj2LLxB07Vyk62kk
         uZ98qFAP+DqlKugyRaR5ftskEplSSTHNxdsdZoRvZ6iHD8xqbOBpb65xd/XhhLErKQyY
         Kf8Q==
X-Forwarded-Encrypted: i=1; AKwUvBy/YrTy++0KgDka5WJTwLErfBUhthDz0dXVoAt3NwsxPpPB5QIZ+BVBKbpy1J6kE6HAkOIE+2SHQKHcz54=@vger.kernel.org
X-Gm-Message-State: AFuF++kQz6za1csD0UnpHqczyB9pwgazQcfTH6inDmvZsX2SLid7FBFr
	KLdvUAvqmolU8nvTZiW0OVgDTMrJ008R7YLkyBu4R5s/wFAX7PbOZB4In33UPuu+5x5qz53lENe
	0TGXZ6RCoN9J5fy0qynjRPNF7rTTLJPcyZLncwBdQz+WUdjqFZ1SRhX0bjug=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5189:b0:4c5:bdb8:e582 with SMTP id
 5614622812f47-4f1b9c386f3mr4074104b6e.41.1790845924766; Thu, 01 Oct 2026
 02:12:04 -0700 (PDT)
Date: Thu, 01 Oct 2026 02:12:04 -0700
In-Reply-To: <CAJnrk1YFKdQfKC6YCsFF17ydjSP076r2K2PYPQiqkceJtn6Yew@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abe23e4.7503fbd6.2d3f6.0003.GAE@google.com>
Subject: Re: [syzbot] [fuse?] WARNING in fuse_iomap_writeback_range
From: syzbot <syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com>
To: fuse-devel@lists.linux.dev, joannelkoong@gmail.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	miklos@szeredi.hu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com
Tested-by: syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com

Tested on:

commit:         29b60c6c fuse: make fuse_backing_get() static
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10e893f5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ed58c7948fc7ee44
dashboard link: https://syzkaller.appspot.com/bug?extid=e8200299b0556976e13c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1199a6c9580000

Note: testing is done by a robot and is best-effort only.
