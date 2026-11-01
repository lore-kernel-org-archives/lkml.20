Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793538665;
	b=h75hRckL98K58iFCOfKzsmmZA+NPw3nI3wTVOiZ+Vlm7gGiHTG4WPw0mg7t3xKPl564W
	 jVdtvR2SfTzwxcUNVhSpJHwnNLN8ox+TXByhZeUxNHEEVqMYUkoUo/0YojVBQOMFFCMTb
	 8W8lYy9tp/Oe/+LDK+pdxMSbLc6cIdmze0GDTSnxdw7C0ifPLhRR+jIsbb+2kDMIkRgno
	 0FkUAWLUN6KtlzPQg74Ja5CbdUTJVJ63BIoNLPk9aqkZ+4a8A+vh+2j8bAlfStab/va7S
	 Rv79i91fHpHH5VWvGsTcTWv+00LHlrMmp42ju3jk42gFDbkVNBnh0jPraObTHjGLcRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793538665;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=v9GG1UltpEVCL0tCP8P47hLRx6tWwHeWF4cwWLvEFbg=;
	b=I9CRe/BCF2+Zu0P4uheDBrlqYiDPwuJlZEkI69tnjm/QxIso8SGjTRlVlkzfrEIGhAsu
	 bRJriDSbE63emy2zM3qmwuhWirtwZ/73yEtNxV79aP7J0x1xqU+JYACAiAF3T7MJ5nqox
	 YvPtdTYQEoB1IwuuTZQrYkMUzbMJxjskAGirl5UgjT4/uKUF6YG/HzdZj+5NmB92eQLup
	 0SeBeRPDuy3VMqCjdg6BI/JgUzgDKn0QgCVY2NoBRkEotbr0abpxwpARA0h02s1QJ6JLP
	 eMNT2A9Q6ZWRsiklfCozRLd7elc7JFifm3YAkSvZd7I9htuDvotK/ZciAoWA2S8pjYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268BF606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 268BF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b37620eb73so3841796b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 05:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793538664; x=1794143464;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v9GG1UltpEVCL0tCP8P47hLRx6tWwHeWF4cwWLvEFbg=;
        b=v2CfdeHMTc0Dwqbwd83yg2qhH7kMVC+5njXhVUF0Ld5fx9uG/QfxPRR7nIlvoLvhub
         YjF7vg+ux81WX6rygRh33POt05BwntR2+ZAwzVAV8Nmdnd4W/8z4RivGL4da/8jPWqdT
         OQXL7BStAAKoMuMG1oxJ2CBL4RYsy5UEQSFGNlfVyuAn0ek+kAkCSQzCvcAlbAROLbAK
         t1xUuF8HFfrtd7Z+dgD5wQ6emovJ6vFzH0zB/snBR2hNBwJqXXXXDK+TmDU0dN5bAhYn
         clMNGu3yvI3ZMVbti7IOEe5fjfLjF02ZtIChlkvHZKV9e4/zH5cdZdnEaTFcmVld43Wl
         abtg==
X-Gm-Message-State: AFq9FYKnUqR2q811zgU5ETcUVLT+mexqJR3C4HVrbIPzaMDOFgT6Up16
	ZBorEpEmSo9qtJU1YQ5v82YVoHCf+gQSlIR2QJYEGNg7a7h+l7MAKiC1J1xET1X+lXFqb3WmgXz
	z/1V83zveohQFFLDJ+vdAAAsyyuFKwlUEvoBytILGmdgCQ6dUtWT/bryyVQk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b24:b0:4d6:9355:7547 with SMTP id
 5614622812f47-5640decc9e0mr4609223b6e.66.1793538664156; Sun, 01 Nov 2026
 05:11:04 -0800 (PST)
Date: Sun, 01 Nov 2026 05:11:04 -0800
In-Reply-To: <CAGUpAY=NEkwcyUQ_BK=6WoxeELVF7grjHTfS8wRfy1+v9Mqs2A@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae73a68.64e51036.15cf6a.000b.GAE@google.com>
Subject: Re: [syzbot] [driver-core?] [fs?] kernel BUG in sysfs_break_active_protection
From: syzbot <syzbot+dcad997ed2b5bd95cc5e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, sajal2005gupta@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+dcad997ed2b5bd95cc5e@syzkaller.appspotmail.com
Tested-by: syzbot+dcad997ed2b5bd95cc5e@syzkaller.appspotmail.com

Tested on:

commit:         7649ba73 Add linux-next specific files for 20261030
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=118aa28d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=82467d52d846ff27
dashboard link: https://syzkaller.appspot.com/bug?extid=dcad997ed2b5bd95cc5e
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13dccbe0580000

Note: testing is done by a robot and is best-effort only.
