Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F48A3016E0
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 23:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788047045; cv=none; b=jow6GZukWfa7leTqmm5VsqlKCHyHz6x/zW7IpJQg9qV78N0P1Dv0fxceDXzOOINzStdiqfzbrY4dLRxeS7OTCs8FWSF1iYoCKkNY0Iv0hNjTRaK8slJUXgHLGj25KlMc2GX+7GPhHSVRmqzAm8pT74HbzNF6LkWnzxGoU3nDoGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788047045; c=relaxed/simple;
	bh=XyRzoIt9BKjeu+ZuM6OpvFtJ9CrPATeITWgkirouklA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZzOk5dHwaM/rQTsCWkPp2/FIZ/wKt5AMTvgffqeAZv4kMHqdU21GsqMsWFI0b+m8gWyj/I8itEntVaxkXIfAeg8xb6hCl4kMMw5K9hwPtnBlvFDj0zDthsfa2H71oaiy0rBhOSXroPFrBLSwyQrzDUCpEVnQqwPFD7kv6w8asCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab4ca7ce3fso2823685b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788047042; x=1788651842;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DQBWUg9lR1vGNw3aL5E0KsvI5tTpdhTutZWPXYdUw1M=;
        b=j/oOW0AcODi4fSQfnh9FZAmqTQXfKYtW8/x7+5GvtllE9/rORn5ahkU7UQkt3CVx2z
         HzE5dr03amdf4I4D6c0+5OjrsxOzHISe+6G9hDq9Edk6HYmzrtmcQewJQ59d18af1qvM
         kIUo6tZVq9RZ29vezz3nc5DHjdEtjLvQw6d2LESmrdekTc7gsha7aO8eLxUGUw5eUJ16
         Jqe2ISUHxesWhy40CjvVAAbjhaveFWnItbGaZ7fQCeqOnz739vWRvgRk4TV7iFkQyiRT
         S8RAor28GhP7R5zG0oGIoSOK5nFXW7XRu0v0dFAaUjT64pQ//oAJnECMwuov1Ug5IdzL
         gpmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6fib7Y6OHF2pqJGlwXvthecWw5AevZ7t6h/+2nFYKAhfWZYN7HOmuzOX5TaQRrlBy4QMD9yL6Haco4mg=@vger.kernel.org
X-Gm-Message-State: AFuF++lux1BfhrzG0AA4UEEvSEZBpQGP7abZGIHMXySuqFzVnUC5wfOc
	6gjXZhL9fSWXA3g3jgF5+2bA0eJ/Z0xDGwDz5hatkzjzSE0vTUiX2ry3ePoXnrVFbnm6pNZWCiF
	lReatlPpLa8AsxGUqOT4RSjTULxeIYh0bXIVHOqX2zm4aDyafDIig6Kb1wtg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:538e:b0:4b2:e9d9:f13f with SMTP id
 5614622812f47-4b3982ee646mr20396784b6e.17.1788047042590; Sat, 29 Aug 2026
 16:44:02 -0700 (PDT)
Date: Sat, 29 Aug 2026 16:44:02 -0700
In-Reply-To: <20260829145838.19351db0a28b30b7ccc1b295@linux-foundation.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a936ec2.4d659fcc.734b4.0032.GAE@google.com>
Subject: Re: [syzbot] [mm?] INFO: rcu detected stall in __mmap_complete
From: syzbot <syzbot+e4aa91d7f20c34417d4e@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, dvyukov@google.com, elver@google.com, 
	glider@google.com, jannh@google.com, junjie.cao@intel.com, 
	kasan-dev@googlegroups.com, liam.howlett@oracle.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	netdev@vger.kernel.org, pfalcato@suse.de, syzkaller-bugs@googlegroups.com, 
	vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e4aa91d7f20c34417d4e@syzkaller.appspotmail.com
Tested-by: syzbot+e4aa91d7f20c34417d4e@syzkaller.appspotmail.com

Tested on:

commit:         1b78070a Merge tag 'net-7.3-rc1' of git://git.kernel.o..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
console output: https://syzkaller.appspot.com/x/log.txt?x=14e12c15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=e4aa91d7f20c34417d4e
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11f37d49580000

Note: testing is done by a robot and is best-effort only.
