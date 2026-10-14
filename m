Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C77A309EEB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792018868; cv=none; b=AZNZ8tMH8dfGN8obs4Ij8yUERULU2fC4SBtKLpTy2OiP8t3xzWZpSu1Vtv2rRpXjwHqM1NOeIOidtp67oYRlvkJrrXGpaeu+/ZLs7vEqwsef9ZM3BBA3Xt25iRrk3/0FudXgGatqWzeDf0uW9zUSJIB9A+GIYwe1Xj8f44eDfqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792018868; c=relaxed/simple;
	bh=I4GFHV10ZfQ4RP/QimbsabicWK5zbNU845vlHx/Wae0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PE13YVkjy33EgTTJlBIjt/Xwx8BlDZKBje+szptAE9CSWU5Dxn27RNz3bh6I13tXSHlJwRM87Yz5HW622vwXrrgL/iTL+RB7to5SZ39KduLgrkPHfjFOSSGMd7cZnsBrxzZSP/55LxPPH31xU3hdFpcHjiZ+2UAaEYAxYc7WuvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a41f46d629so1661188b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792018862; x=1792623662;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Liog37CV1VfBGsCgr3rMQyJMQ5wc2teO47QA6ROkfe8=;
        b=VTgLM4RRaacItpA6ui9gEve3DY6NHXgCuGdUepoxWtg56kCPivmURtmR2yM+Hsk7So
         DOk4gjGkTHNFiO7dnv23ibeEU5BRRiDxNK3YHjPdwhIQtnyI296Z29np0ScALCzGiib4
         i2wDJSmcHLgt6uWJbpRzTXLQWCmP7q1lba4Rv6fbKOD5w497ZVpJKtm76T+FJhH7h/1a
         otT2lGGHj9/atfF2MBFLuwzx2LehSbJmU+/llSMOneB4ssKkGv2QhISyySS5UWws5iPg
         0TqN2HjLk5FR5fRk28Xpcw/85s8BWYHO3ZViCt9Cj98hYj+l/9a/jeQbyue56plufJvj
         docA==
X-Gm-Message-State: AFq9FYLy4VphscTj4+ZBE3gxoNE1by574AjYbBMgEuHwRgX87yqJDt07
	XYUS1vGaQ3etTdaZ3N94J7xyYr15LWOukyFQUM9rv6VOifWO4NstLCz8Sl3j5mq+BxE/awH7GzD
	vuy0jNkNpeEopUC13F+J7Hxsa+rGd+BsWgl2Oi9JTnjgf/PMdr3ES09xldPU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:13d5:b0:4ef:e154:41fb with SMTP id
 5614622812f47-50c45c67757mr16289808b6e.1.1792018862647; Wed, 14 Oct 2026
 16:01:02 -0700 (PDT)
Date: Wed, 14 Oct 2026 16:01:02 -0700
In-Reply-To: <CAFJkwZyYvooJO5gz0_16L8bFwxnHwHC0ZFbDJL-q_2KPPZ0_kA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad009ae.5f317f00.247b6.005b.GAE@google.com>
Subject: Re: [syzbot] [x25?] inconsistent lock state in x25_kill_by_neigh (2)
From: syzbot <syzbot+300375dfd44665f063a6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, neganhat@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

./include/linux/workqueue.h:303:9: error: expected identifier or '(' before 'do'
./include/linux/workqueue.h:307:11: error: expected identifier or '(' before 'while'


Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=129d675874dbf896
dashboard link: https://syzkaller.appspot.com/bug?extid=300375dfd44665f063a6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1592f3d1580000

