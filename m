Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FD54E4C55
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608823; cv=none; b=EmsB1pfj4m3WivN6aLGqFXaeNZ+Cw9l5bRrzgKc4ZKaTSp+ehv3vedzDiQ6P1jvzHKvjs3BWvop+sfpx/eqkJ2MMvRk/p+ysjKp0TpSBobO3MxUEiudEl3skJW13D/a8qt4i/aR0oBtdTwp0IYtCX1PmmqhOx0jNhuyXx8Qisrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608823; c=relaxed/simple;
	bh=Frm43ufNh8qqB/Bw6xfF1sMT8C8/aL6tF6RXXphvCaI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lDVj3AeOue3Sh7VjAHqUZceH4Sqxa1JKKXfPKDbjsIiYP9kC2cQ7JSq8/ewgUZhZqdH/d624/FQzFP9f1UgtGlTCY41jyeV6kPZjO3W/yxr0++ashvshrTe7gPVy165sam9TIKBqnU8mHTjUTgHjt7kC0auy1+dIPVVJ+1H5ybY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c734afb8deso5740784b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608821; x=1791213621;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Frm43ufNh8qqB/Bw6xfF1sMT8C8/aL6tF6RXXphvCaI=;
        b=gdN3j2M1lh1y32rgHcV+tJfqN67apH41QnUtMgtfSktQziQcwfGuAF3beTpt0KHdPF
         nLC2FTYKcm1LcJEHZAGee2ZqaqL/gKIDsnneF+P38hRx2fvyHGh6Xm6W17DlE8Gd17rO
         ItjPwQ/Zun8Mgd9wscq/WQok9rq0/HZWFdF40628ITO/kEPu+xcn6L1zz+l6GcIOTvfc
         gbrWMBouFkRqIwx6QoJW3YfJLeXAn4/VPltQreQdHPI8Ru2+ufQwMPgPh8e+qVfbWmlP
         TB2CAj41kz8txzA37i3XNa3cs3iUVAILrKc3ns7UIbizF61vasJd89NZqOWU7fcGoyQn
         phHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxA68koXWjYkifLrk1kgu4bzWcWbbHT93Sq/ks9x0Ct6E0CN5EAf/54e7DBXvlUcg5MXBX4XMcGYmqySdc=@vger.kernel.org
X-Gm-Message-State: AFuF++nzJmdyKI9NFODRrVOKcEq0H+8WK/XoGmpN91EufOPC1x9Egdv/
	vd7caC/NUtZG4H06GqKzPV+jDnOGdkl4ZNCXf44KCOYrkeqri1btQ4noPCBFu9qhufsgNfv96tf
	aIqO6A/wPw896klG3/htDGhfDnMrAY6PJYWZjcrD3CdV2Eq1BDLZ3bnY2ln8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f6c:b0:4e5:79ec:5bf8 with SMTP id
 5614622812f47-4e579ec5e82mr5696827b6e.67.1790608821153; Mon, 28 Sep 2026
 08:20:21 -0700 (PDT)
Date: Mon, 28 Sep 2026 08:20:21 -0700
In-Reply-To: <00000000000034ae0f05e9f94c79@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aba85b5.94408439.88f0.0000.GAE@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in jfs_lazycommit
From: syzbot <syzbot+885a4f3281b8d99c48d8@syzkaller.appspotmail.com>
To: dave.kleikamp@oracle.com, jfs-discussion@lists.sourceforge.net, 
	kapoorarnav43@gmail.com, linux-kernel@vger.kernel.org, qianqiang.liu@163.com, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com, tristmd@gmail.com
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
From 7e1a0b91e9efa8bec40fc5397ba6c4e683d72df0 Mon Sep 17 00:00:00 2001

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=885a4f3281b8d99c48d8

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 11 trees can be found at
https://syzkaller.appspot.com/upstream/repos
