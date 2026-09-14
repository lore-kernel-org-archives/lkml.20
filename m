Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC20374A19
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789362005; cv=none; b=poxBrESdkcsocx6Kxi1n0XxjnDV/duMKkYRImb1u5kqWzjIVkfexuBooQVuVigeBNVCT6fYtAo8VrhyQCYFY1k5tWg1YNoPPf4zQc3c/h1NcKlTSqOesnFL0ia8OE26kxTBGdbdU0ZXb1G3oLn4jQ9aMwjd4GQce7icPSkcOob8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789362005; c=relaxed/simple;
	bh=+qGTfXQ72hDo8KqgYPLQqvXC3eoa9t6/GitKkY9mfdg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=F+4iCDZl5TeZ9E+Ff7eGDDBlmGxRYMfvHT1jHuk+BkJhmtO4WvtR6AbtrrKXc2vTg07lt0oqvoQ5Yz+MjBjdns63QmydPMjvL0QJyXQTzaK//Yovfi6/qmGs/i+3B7iWoiuWDd/kK66hw5ukqQXJSR1amD+5X+VqPM/2iyH/PKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1a3f01d2aso4153719eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789362003; x=1789966803;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uvyyp8aT5OPXZOMgHgLe47YDfIPubbSxWbK2VVUgQeQ=;
        b=nEz6cSFCN4ampY97xGHGGAS9c+OJAqPNZ85qVFtNmzYMRzVPNOTstNrtPAMbxia9FP
         zoXngPgs9JvrezJGeVtC3pAOFhRccvzXMTQhTc2ZtbahKTi3ZwiPe70YttWQkzN+bpmP
         wOJ7tPNmYcTBCHzaWtifvDYTUjnGvt1CLZ9abGxTK+Byz/yMK6QZmWEs4SCWxu8LVtib
         XQST6o4/rmdo1SxEcUiAXxCeWhQINt9le8i7Y06sxHhpSs1/zef+SU5ydX12XEdw01Ek
         PEhgBptYR4mJfUxjRLkcQbJ9DrIJyhWuTDym6Xcnm8mohakXdN/G5g4D7Mn+dUwXPfTB
         uAWA==
X-Forwarded-Encrypted: i=1; AKwUvBxnsaRiWfK6J3UALY1jpNEw0D6fFPWp0/dhJ+z8FgeOgopFp72D8rIuNLyCOkAlMXro1hxANx67iFyRdS8=@vger.kernel.org
X-Gm-Message-State: AFuF++nPUTMmQJEmtf8h2YvC0sTcb8KqoGIW3WqMf2m3h+htv0I1trN6
	DY5PivBs5ZyS7FNUHuWMx4T+rJyoJsLWE7rvzEyDAUEKly960T80QIoTGOzlem6uzaqVRm21y45
	Pn2rsA1m3JW4Ex5fzc5taZSy2obtdENJ7+kLnrOUPjQ/S17II54NmSgj2oWY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e847:0:b0:6be:19a6:fe60 with SMTP id
 006d021491bc7-6c54203f16amr445662eaf.41.1789362003142; Sun, 13 Sep 2026
 22:00:03 -0700 (PDT)
Date: Sun, 13 Sep 2026 22:00:03 -0700
In-Reply-To: <20260914042236.27687-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa77f53.f81106d8.2ab401.003b.GAE@google.com>
Subject: Re: [syzbot] [raid?] UBSAN: array-index-out-of-bounds in super_90_sync
From: syzbot <syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com
Tested-by: syzbot+9e3014263a35700ab49b@syzkaller.appspotmail.com

Tested on:

commit:         704340f1 Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=177e0df9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=9e3014263a35700ab49b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=154735f9580000

Note: testing is done by a robot and is best-effort only.
