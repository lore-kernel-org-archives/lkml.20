Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB73A3F5BE4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632791; cv=none; b=ue+ypsjjHBXQq0rFjBONJmgCs6weGDhSu51DXeX5Wv3Q4sijs450An+HK5wEfPp7z6bFpvCTReDzm62VzwAv+q5iDeNMZ9Eee/suI4gcuOT4YMqSdYnWKBw1+Mb/cMkdgmcrCqjRLV/05G0mHleLQhw1HVwZNGiR5+5aZbjT9a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632791; c=relaxed/simple;
	bh=Hs68hwnq6v6JB6u5yjPs1ot3/dTWyi3j667K22UbsPk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EXXEmdjbSgyuSzPpqsWiSyQgfGfjGoARiTRWLG0idaYlqfGTISODf7wPp48Id5BzGZeOA0/SZ9+l0lLAnhkrJbfsC3n7iM+rirVlTxCpTK0nHRAVSb7RzaGE40gCVzHQUvrF/6kVVWEvcoisu7YplBJwa0g/1ERmyViKfuVYrA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c307941971so811989b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632785; x=1790237585;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jLd9W0G+g0fEhC1pzO8g1eY0KUSU+n4SflMsM+Hy+ss=;
        b=XDhJrz+lYoDdFECTUcDr5I4qH/7qOg+j0Xs8e+GYZG2IezRbwdBHlquEC38bwbZaAk
         E96AR+yrlNpJ3/C2xenafEx6CT+M3sVNfVH2HGsByucLfwKgJ/fzPL7KPen76KgOPQxW
         Q/N6RE59MES97XeOPva5h4UPjGfD0QaQKUHntuls6HbkUwGq48K9+bf/ugrNOS0YIYwv
         kJ9dPe9NM/ZAJE33F6ROQ+uwhBR+/NonbYsqjszV+MmVoCvHdYDUswkEodg0Cmst6B2x
         C4zENlwLD7eF9TfiEzvu8RuqT1p5brRYYuPL2UQU52zkrKNjcZ8ku0JlJD0+2yH8I6cY
         dFOA==
X-Forwarded-Encrypted: i=1; AKwUvBws8unwQlgq3yUqkzgy37A0XFQbXIoLQVG+q5PQ5ZGjd/127swIh/jhyABTPWjCIPcTy1c9Ux75vDfVw30=@vger.kernel.org
X-Gm-Message-State: AFuF++m9ryzLxk2Y/3BP7zuXo/D0XBxrMuFd6bSfOUuqCHKjFW+eITSG
	A7XnJTybue5IF6+4EKfspSPHjVoDZmXbo82eIkNYdIiIsw+wraLhSImplIMdRcFpE7froNZm4X3
	eaJoLvtYXoi+M2pHUrvurDaT4HqoaxHC/9w/xtFvr/N++aVB8sftCKkskeq0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:470c:b0:4b9:a829:f016 with SMTP id
 5614622812f47-4ca4c6aaf9fmr5278837b6e.34.1789632785213; Thu, 17 Sep 2026
 01:13:05 -0700 (PDT)
Date: Thu, 17 Sep 2026 01:13:05 -0700
In-Reply-To: <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaba111.b398a7c9.1f86be.0013.GAE@google.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
From: syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	iam@thechris.in, joern@lazybastard.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, rafael@kernel.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com, vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com
Tested-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com

Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=165358c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=7cab6a19619f1b8efc00
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=117a3bf9580000

Note: testing is done by a robot and is best-effort only.
