Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307694854F6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792389245; cv=none; b=O0jdSP0Dl4Z9WFrdAaLlPmFpZ9SZrxwrz0W+qlrgu2v/M8Ct5Bj5dJWw+KRSHGfN0vop26XzuUtVkKICN5q9cO5c51Ru5YxiO+/35z4p9w1K1OSuc7B4P/4SKcPFtkJAp7goMNGYr/KwpHbjgj9vhw2mxzDxhoRXqfAx1Av6coI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792389245; c=relaxed/simple;
	bh=Bm6qpBclFBDa/8ZaPp3Tnwrahg2lyZlMeJe2VTRWa3E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Wx6GrgxW/guLJ8CvWOdjAmJV+kxS4YtmbY5rTKUh4OaZZR9Q9x6vyNQAsR6Bwq9FkLUHyxOBorneYKAPpXkuhLn3HaJoM158JZYxyKvYba8SrX/Evu2BHLTIXex/0uiCSxRBEJwmOdHMLjmGK0KeaXQtxOY+5hIil6MRe8TaGug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-5384e381fbbso1759535b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792389242; x=1792994042;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1hWn9WlFALBXxXhElt5/Eo18vTu9PaxR/Ru42wA+dqw=;
        b=p4OSabaBeZRq1mZTF/7yDleWtDqPwO6q5g8cG7T6mUlY63o0Yk2jBnJlUHiTitSkIy
         odmw3MP1cnYU2CWwcUwhU+9lxbOsTdFi0PG+FgMRz3OXg3YAXkGfR9Sf1JvJs4Ck/7q6
         OnfaPJlNbc0jWAeO/CDzvdwX1Ho+afkMK8JUstE3Y/1dZHibcV7EOjITb07zCGmzlekV
         C5o6XwFmFF5qZfY6y5SJBjipk38OVsZZXPpJNJa+FJc8fdAZe+a5ji5Nc+t43fmgaBfh
         kIgM0QUbCobvN/kQetJRIFQez0oqnXYuyx+3WBViy4VUFyiQk5tFkwaq4vR23MYMp7aq
         /5RA==
X-Forwarded-Encrypted: i=1; AKwUvBym/0/4viGDsA7F/1Y0Z7XOxhXHpuOps8OFn3+2KCLbO1HpHXaMXqR+sTjQXneXCPKT2+VzrraD/ofxiOk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKS6qWXbJEuZu/CCMiOwr0Sy69m1YHfcm1UxWxiLd0SAbQ5CNS3
	2lkxYqsDsOJwaS6mJthYIdN23SdS2d9NdcWi8vIA4Rc5j7UzINSanzow29jVnIo7qsTdJgEl5bb
	jwFPe5R5/S/uStFDL2ya0qr/fvUR+CcrP+nQGd0QA1h68sbwC3MzUaxCn/l4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c2d8:b0:4d6:9232:b3bc with SMTP id
 5614622812f47-53cd0570542mr5676180b6e.51.1792389241864; Sun, 18 Oct 2026
 22:54:01 -0700 (PDT)
Date: Sun, 18 Oct 2026 22:54:01 -0700
In-Reply-To: <6a7bfdf7.ed659fcc.23056a.007f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad5b079.7f4e89eb.3d59aa.00bd.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] KASAN: slab-use-after-free Read in jffs2_xattr_delete_inode
From: syzbot <syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, luquijeffrey@gmail.com, 
	miquel.raynal@bootlin.com, richard@nod.at, sashiko-bot@kernel.org, 
	sashiko-reviews@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	troglobit@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 7b09acdcb944a9be6acc38ab1aa8a0ffd08871c1
Author: Joachim Wiberg <troglobit@gmail.com>
Date:   Sat Oct 9 06:09:55 2021 +0000

    mtd: block2mtd: add support for an optional custom MTD label

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14e7b13e580000
start commit:   32c52ec87d62 x86/insn-eval: Fix shadowed segment index in ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16e7b13e580000
console output: https://syzkaller.appspot.com/x/log.txt?x=12e7b13e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17684bc9580000

Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
Fixes: 7b09acdcb944 ("mtd: block2mtd: add support for an optional custom MTD label")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
