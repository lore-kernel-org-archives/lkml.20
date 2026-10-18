Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6971E1E16
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792288987; cv=none; b=AUOi9zUPzJo3KwQfvbdufIv1iFY1QhDA8uqI06HiS/wODuUurKPAmT2t4pRPVeD/9YuNxzIquekFYI9DYAuW8S6uK3GDtfTj6Xl5MjjhGFYC6FuxCNCGjCsuW4bpyxyaT+iVHvaothdezTxSBuMGx8UZrmzFyM9jYgWofIwqxyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792288987; c=relaxed/simple;
	bh=hlAV9gW1FVJqe9cFk04OUY8wFSNtL5Tjs0e9i3h2AG0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eQ9bNoz2KsJRbPD3mNpRuUvVWgbrhIVj9LhdXmVmNfTrX6GEJZCxnDMceIPxtM1GTKc24ndDEwkcr865A47zqCVhWUzkmpKssdhEla5VhOJn9lqGkUbTI42FRvbUuiOlumrqmaEIH/WXCaEevlfXcS6Toe8qVb65FUaHQGM1bd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4dab94dc3e7so1977577b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792288984; x=1792893784;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vi8fswt2Jo/Boflxld40m81NS+lLjZAEKtMELvHf7PI=;
        b=fs8k9F4o1tnw4xPEWkYjpfGODMJqci0LxFKxlYzS3LX6BruL1EX6NoJDvkEJnY5EzE
         yE1rUQEYW9ICQ6izXcjHUIqYkUO7x8UUviY+BaVHduaPWUfUKuJ50DuW1Go5IR1825ni
         wN9g5IAFXYCfsvm+iyqvM/MEzmGPH3aBXP1NqLzUZBQqjJT2/25qanEEeEKP3a7p5h2g
         6zC5k3OQBXKGIByWJrR1Ww+k9RW49oyZ3rQlGrkDsPVcEWyvk6h0J0XmdtwtRmqmAJ0d
         +VtlYZyRWxbk8J/nrT1qIqNP9zFZ+mapuKqDboC8fH+n65REttLlw2aCFobwLOfW6Xtq
         3Wsg==
X-Forwarded-Encrypted: i=1; AKwUvBwZwvZVrzymh0fuCeWR5EFrr6oNkFnktAFrxbnrWi2TTUYvHq3SzjZI5Tn+S+WFQL0rNQzSBMW50A0hLaE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiVkd5hbAQujZBaLUtZv1DoIYnD3Q8wYYv9pZUP+r5kFea15ph
	BsUxPs2gkh9g24m0AvRVfLTREW4lqat84ILKxnJR6N54kc5bN5YzTQb68a1LLs3mz1L5eqpOtlL
	YH2Bz8af6A43BWp+vxLuTEncjhDnXH9OTnVpswJecOhgp/VySVKvYZPjb7E4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c115:b0:538:d44:aaaa with SMTP id
 5614622812f47-53cd93a41d0mr2933431b6e.63.1792288984630; Sat, 17 Oct 2026
 19:03:04 -0700 (PDT)
Date: Sat, 17 Oct 2026 19:03:04 -0700
In-Reply-To: <20261018011905.671-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad428d8.7f4e89eb.3d59aa.00a6.GAE@google.com>
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
From: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com
Tested-by: syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com

Tested on:

commit:         58161ead Merge tag 'drm-fixes-2026-10-17' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1760560d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=c98b21427617af7f547a
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10ad8121580000

Note: testing is done by a robot and is best-effort only.
