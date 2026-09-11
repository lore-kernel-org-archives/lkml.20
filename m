Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C9346C4CF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116245; cv=none; b=Q3ROcf8BGeZIDgjIwvtIaFSyZVwGRr2kL21GAak6OKHtdpYhneTE9Ph7vfIVZig2NGY04YMv+u801FFCs6IVtEh4AsU3sDbY6KCRN5RDc3mGmQinByV1Yca0o2bhkKs4qRQzxZoM5S+AiL03Wn0qxRWFkPdI9pBC+yki0dCGDyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116245; c=relaxed/simple;
	bh=3gunliPgVW4soc1/AUllZCNwihvHpaPxE5s4LoZ/+iI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mOl4O2PIO78MtKEMRLu/tMC7Zs+c+rZ5BP+8+GO8D6+teNoQ7g3osXo31yZ/RT/1I5w7xGi2SbUNl8TC09MOgoS3JkDNYyhxvN7tMFgzPI5JjjvtC4O42g8nYOKrsG5vs5umJ6rTTdTsk5NFdoUTKlVBGyXgNsm+dXY2pO4ciVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b85fefb1eeso602475eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116243; x=1789721043;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HhDoaaAx+Kfg1nwDSSnWMu9c2b6obWvtvHloptvoSko=;
        b=nm8nI9BUClHOAni+gvfRH02v4kZvpzGyCJxlAsehU+y7jLpPbC0mSqUMsdnMyUOAp2
         1/nKBUQGHXw2cVraUM9dFZ575HRLsE4vQDqh0BODz4Cr3m4uQBHHHwLDwoWn3CM/Q+db
         Rwnj1Zh2Av3CmoJmF/cqT+PkWxg9VwPOaOb+SyxQGOQ7ngKLCNIdZa7/uMZ1kH+BoKsl
         XWTHHY1HCYbshuJfFb3quozi8V7e1eDi0wDyPIpV9OjVYjdqr3etxsdeYu+d+0VsNFS4
         6YU/JxgMvLCo/R6N6OKehlFAwjDKwXs8jnJ7pK0SwWP/tRw3XGrQo+KucZmnis/EXumY
         yuCw==
X-Forwarded-Encrypted: i=1; AKwUvBxzhjKduMYIJZjCAJmkQ0WqVT36x/Ra9if0VQ0vz+6BhPNiZn5ethI9pZ4CH0wKdyrFuwvB18O4Wkt3Kfg=@vger.kernel.org
X-Gm-Message-State: AFuF++nS/jRB4p6xa/6pNkM7v1D03MYA4uqKQbkov+r53cYzb02TnSSq
	9pdVosr5box2hSKAvNVy+rH0nJmoVrATvmjSsiS6squzlEEBqNm7Wh4YHGv35TPsleRwlrUvheb
	c/a6bLasAl5MkR+6jwgVUZ9UkAihdWu944SBgeHtZw9VXAHWo3wScnd/s20I=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c309:b0:6b1:2f12:6c0c with SMTP id
 006d021491bc7-6c0be3483b3mr2754360eaf.34.1789116243292; Fri, 11 Sep 2026
 01:44:03 -0700 (PDT)
Date: Fri, 11 Sep 2026 01:44:03 -0700
In-Reply-To: <6aa3b8a3.df8406c6.e4681.4ae6SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa3bf53.6e6c5f9e.28f11f.0042.GAE@google.com>
Subject: Re: [syzbot] [fs?] KASAN: slab-use-after-free Write in config_item_get
From: syzbot <syzbot+6b16e3d085833cbf3e25@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6b16e3d085833cbf3e25@syzkaller.appspotmail.com
Tested-by: syzbot+6b16e3d085833cbf3e25@syzkaller.appspotmail.com

Tested on:

commit:         a7c1290e configfs: pin the symlink target's dirent ins..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=140d21f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6d794b10c2a1184e
dashboard link: https://syzkaller.appspot.com/bug?extid=6b16e3d085833cbf3e25
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10782601580000

Note: testing is done by a robot and is best-effort only.
