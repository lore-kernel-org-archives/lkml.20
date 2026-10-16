Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CE542255C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156264; cv=none; b=Xid88EmAltda2bMR/And1TnBLAu4v52FtoDSNZnW9IjZIxZ5xr5VRPGCFx/SGXzukSfj19x71x4aOYfAlegF/HcI7e9bTWRJoRVdB+lR/AH0hcjtj9NsbtVQ+Zs1emq5HMLvz0DTRuDCIO8gPWVolC9INucandRaog9YntMevCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156264; c=relaxed/simple;
	bh=gIw5P0GfnxePuFCkKlRrGsOKJZ4pQjFMrtgtrp/MNZU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BSMz/KBHEFEZ55qas//4le9DfJgbn2LF3EGeamsmz07Je4ETgsaWmvhFwxjbnCveAb8NQ3WN5R1NfBsV00Nb7AzqdpYZNY2CoD0U7fSv6RWK79Bouskhe+r1dxZqoatuY2LRT5XMFY+SbdXCF8KoMGsUjqsvoOpzRztFhOyCpt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c307941971so9412896b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156262; x=1792761062;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Df8SnbvBNaPsZqX3Q1kfA2N/DVnwY4RzcGXRPX1g8RI=;
        b=ShS8Yt4CieVVIR4HhS2j6OmTyKXlSZ/rk/NtZmXNMaa+RktSlitc8RqcbvH6ybGcB0
         oKYK7aUYx1+E3k4p+DiHdm4u6WhuFkWKah379DkR0FAIJYuQP/r525F5aZnjdowl5OUe
         FU1Zjw8tMyZZURqvkZW87tVONt9ZYjG9j7fQXN4yHt6X24swOVN6vwho6hIrYN84Cc4b
         ReF76gienI5oaB6/IS3V83rdyWdYNxbhdDxphXXJbE3newiotVf7McwzZJzoBM0Lyv8Y
         HEu97+eu2nON4uYVdNAScHZ16czuEVqKJXo4lEeTT+NgNwFQvuOQB8wb3lCSfxEQFiAr
         9cMA==
X-Gm-Message-State: AFq9FYKG2uLmFm87I/nsMCbK9t7AkRH/+pnJGCL+IdcF6IdEYRtoVnuE
	ssCdcop81FmKPUz5oExDX+2nILJuJVgm9IPMV5ZAaO2ZVIygW2RsH0qNDFbO2to0PpZr0DoN/Rt
	mwY/m8CFpz+98TwUPKPInRGPKjPL5kfuXHhEL3cDvoHQ0x5HgazifwF1KwOM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2211:b0:4f6:5279:5c6e with SMTP id
 5614622812f47-50c42170b8amr19014824b6e.8.1792156262173; Fri, 16 Oct 2026
 06:11:02 -0700 (PDT)
Date: Fri, 16 Oct 2026 06:11:02 -0700
In-Reply-To: <CABKbRoKcyARgA15t7c6-itGkAPTEYZkWjku1ooihbJD_uLK52w@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad22266.7514cce4.1ece07.0152.GAE@google.com>
Subject: Re: [syzbot] [net?] KASAN: slab-use-after-free Read in llc_conn_ac_send_sabme_cmd_p_set_x
From: syzbot <syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, miguelgarciaroman8@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com
Tested-by: syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com

Tested on:

commit:         2f2f7eee Merge tag 'soc-fixes-7.3-3' of git://git.kern..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15da0031580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=929e4854a828f434
dashboard link: https://syzkaller.appspot.com/bug?extid=44efda9647c52be29d9c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=164f269c580000

Note: testing is done by a robot and is best-effort only.
