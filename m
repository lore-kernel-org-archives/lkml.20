Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB89233126
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 23:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791157444; cv=none; b=h3EIZMN6Mn4MHHTm8b4K5oQ76SW1VvgNDPY0tiFR0SXUy0Cj29M8OAge8slIPM/Vourc+pf/I1rtMT5bX8O1brBJuCHFsMqc/Z/fDx1VgqkwWszMeN31pKPOKaPEvR+ocO3ZTIDPBze5JupY0I7lJDLdnPpOxV6b0qsmfRhVPhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791157444; c=relaxed/simple;
	bh=bw3VCdv/9ZLDquClFN5mdJzB34DVYPoFdLhpEz+vvfs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rr59GRjQkyYntf7oQ0d4XbJwtPrkTbQwCFxHfQtgZ1kwpcyF6n1+AuToJdQWgOHfKyDwVXQI4kLgaVgdkAOJQNbWlulRyGNnO9Ns46kqKSpWa/3dAPO+d+bXuwwKIk2+rzJpdqV42YB/ei5tR36RzBqdB+K02e+Ykv5TGSqxeMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a41f46d629so2453112b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 16:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791157442; x=1791762242;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dPgcBNnjGwLxL3Xe7jaem6iDVM6H5b19KgS7Ea3Nc3Y=;
        b=gIhUVw3gyGTccU9BpcuckyHlWtDUYvhhJj+H4QuPZlAS0H8B8pYQ9jZKMIecuFoAX6
         7Uxr3j1CTlYTzTRWo/nfvdSbaP9SCJiSSzmtbIm3WHVbJHz+uxs7K9rU8pnhyJIzipRe
         FDmav7L9fDE8h2Ghfng7+whVkCKRkZKP1HS/zJ1BMLDlmsHx1mF/DbZjnBMLarsM9KjY
         YKBH/YkQyoV7+jqqWMJ4Vx0w8eVJXzV1RvwC7REkEpxugUBn9a9Ug85pKWx18aux5Xf/
         pNjzji4VlA6EpsCJumziYYpkbVQPUKTGLYtfTJNIlKKXLmPLYvenZoYIW3+hOZYVfbE6
         79NA==
X-Forwarded-Encrypted: i=1; AKwUvBzWdIV7SowaZ8mWO7XIbiY2FziNLHCu/FEWmeS0jEczs/wujGdDDZNt7FGW/1AQnzYzvp1gBF7/nxY/8Fk=@vger.kernel.org
X-Gm-Message-State: AFuF++lRrDuOAb+MvODnG2AUh4gr/9agttK73aJkTxmRhGNLEWIZKDog
	0+5DmkMHbUJHOt1iJu02OaDHT6BgeIIyEQyf6fl6Ir0zF4lJEwIbNrIft32MIY+/+tISH0+uMQk
	QiLW3GPdqHpxz6RzrFR9uGnsH8bKw921aCeJp296EcxkngGWVekVWEBjHIBs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f88:b0:4b2:8ee8:8a38 with SMTP id
 5614622812f47-4f673da74d7mr5677515b6e.0.1791157442242; Sun, 04 Oct 2026
 16:44:02 -0700 (PDT)
Date: Sun, 04 Oct 2026 16:44:02 -0700
In-Reply-To: <20261004230133.83303-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac2e4c2.9ad129c8.3858c0.0039.GAE@google.com>
Subject: Re: [syzbot] [ext4?] KASAN: slab-use-after-free Write in do_split
From: syzbot <syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com>
To: adrianox@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com
Tested-by: syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com

Tested on:

commit:         72d3fcf8 Linux 7.3-rc5
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11c0a835580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=718e346eb0b8f38
dashboard link: https://syzkaller.appspot.com/bug?extid=09bec78ee77613a3efdd
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16b527f5580000

Note: testing is done by a robot and is best-effort only.
