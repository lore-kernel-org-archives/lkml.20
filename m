Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E262634E777
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421804; cv=none; b=QvNm0E9yXVk3ne3oJgwReBCsQFBBGd8dTHZZGhne9/VMTV75N1K5txI0Zh6iXoFWCg8ZZMJn3fYDhdJzNcSnPgWTIyzAd5QY00EVfjRHwsWyFzKSldOdRYY3r5GOY0b5aEXpBSQJmz8GGeDCqCKlwDc/ICwwThnmGWS7deZJfTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421804; c=relaxed/simple;
	bh=Y0eAQE2i71W6wekM3y5w0S3oloVw81IuoD3gaaJTExA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aeWOoKDh8oP6Y0Aw0b4e0jilonxg5ePHo6bx+Fiyaq6KF9Vne57GhslHCN3yfBJLlVfz5h2FjeFbcFVerJAla+bWeDMTHt110p3xKf6SQz8goHmIZy0hULsmK47kYQD09WCkRHgABBi0V6hMI+1axfgzw4ayE9e2dUU/soxJzTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f4eb9e05a8so2261792a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421802; x=1789026602;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IEJdEIKAhbInR3b7cohgh61ipNOwgELnXhZIuVGKh+c=;
        b=IBCLITtN23GU3yuoqW6i5Le+FxPUhMGKjLe3m9xtIQkDl1erhlSsrI54T1XUKKPuSH
         RvxJlG7poHcG9Ujal+Rr1Q/fD/CoIoaGd84I9jvtknC+H7dUQMeHozrzYcby3lCyE1B0
         H+410Q1AVGEZRpPtGQFqPBkI5+4VXVcCxXml0xEVbf0hhgBf6goPH9TtBBC0REwaclny
         2zlmBBg9mvkXT/6iVeqD+h8dAz27Zj0OufcBVeAO218Z9jD4zFSFRsTTeVJZw5TxMhr7
         TQ1kvpPz9zWAo2Ln0B4R9pHZTbDVZTIxW6MnB4uVBXG32F3ZzTx08M6xaIqcFCJhEPjf
         usTw==
X-Forwarded-Encrypted: i=1; AKwUvBz+UFKBKAZs4dxI3ompkPJxnMqCvnfib6Jaq/4d5SYyAgTwml4rWCKl/t5ZXg76XOVwmsfrUnTttiS/3g0=@vger.kernel.org
X-Gm-Message-State: AFuF++kzrfiqv/cTypFnadIC2qffeIAfB33pk7i0qDPSreZ+cm9bndbS
	o8PwEwX2iIUn7fcTz595CmLYHcn0gFzjYRAy+0DNvmjjBvi30I9UZm17AiOcgM3cohnn+DvgrTw
	z1UZcPkx1g8EtsONWqc72lxziuUF1bZotRDH8prSJNwDLU8JUlb+/ixMveu8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b0f:b0:6b1:51fa:3562 with SMTP id
 006d021491bc7-6b481d355e0mr9126704eaf.34.1788421801892; Thu, 03 Sep 2026
 00:50:01 -0700 (PDT)
Date: Thu, 03 Sep 2026 00:50:01 -0700
In-Reply-To: <20260903032132.511309-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9926a9.e7659fcc.146146.0006.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in usb_free_urb
From: syzbot <syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
Tested-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com

Tested on:

commit:         786262be Merge tag 'edac_updates_for_v7.3_rc2' of git:..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=150850f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=179bb0f9580000

Note: testing is done by a robot and is best-effort only.
