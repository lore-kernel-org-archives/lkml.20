Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31508233929
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619347; cv=none; b=uCn6c0a5d5LuHuXanghXMSRRNGhgiCt37Bp5KkkyElaObmciN7+YGVY5BT2dvkfwDq/ysf634QBGl8zt1mc6FYBtOWgYqbvloBSsE/lij/St6wt3NrPeaGDZGrTnAgO/HfaH3+ML1bYI8H10jimIvxtvOLCHQvocztTLGXRduWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619347; c=relaxed/simple;
	bh=svuZdf73uLkdu12QzcXW4dwsYQ1x5KRAOmtt4cdzkiU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JDD3MYxjxkXyeoJocp1aC3KYR5A7XROfxF3wA864uhhc4W4MJKp+KPr+1rXLZ4vJP2mXOQ7D1LUdUIT0224s9gVCQ2exiFXFWv562u+6izZmZgdxHX6PcXHErrizrR7BjEeyDNOLcuygcxxyrKXUImySjquz6LPmym5PXWkCrBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-482966c4f4fso634475fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619345; x=1790224145;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mlDwDOsfIGGNArG/DmxSt0MKRxJqqEJhOaRhvaMwgbU=;
        b=swIQrBBQPJKmY3HX4nOJsS0o+BeTXd83JNQZ/TZp9vmKKwyW90gN1lv3FIxPUEfPyj
         YiG4pWs2VJ0L7C4CdYEZpTHIuLmJNqagxfzR6MYeYXdYMdAc5nr2O9g+y/3EgEuaN6bY
         i1EoPreB1KBYvBYyB6CwlbWtOySQxRgqHgiLIkMsfRNteRMBvsz6Kq10XtnnKsMUBXOz
         16fEAJg/YcjC+uGWMiDsCVS/OOihsP+6LZscDq45ldJVyBjsmkHb/QZ8PmKxmC+LLMjq
         Kmi8Z4LNKmdaiKSiebDaF2LqomUBNmeJHmEkNO8wnfVUzYxbxdXVsXnNMQYa1u66AfW6
         0MQg==
X-Forwarded-Encrypted: i=1; AKwUvByJT0UxuAO1b/w7DL6Ej/SKAIrfaM701rwbbActqEzjzJKMzmvAZ2NwgnZgk7de+xJkvEB1xXYdf9Sg/J0=@vger.kernel.org
X-Gm-Message-State: AFuF++lfjVEdn+8eveBI2fFQHwrMYmMSSfuxLD5nF+COPovoodHsAmZe
	0iLITZvuDqqw/jL9QFKb3RiT1vhz/52YcR3u0OYl1uGBnbxGYjCL6zT7tw4cfhEADB769QNUFt9
	q0zpykOoJFCt54xUm2riqrmL4qCIfTBavv9lngXVDTqnWxNKyZ3phKZNwXUI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4dc7:b0:6be:dc4:13fc with SMTP id
 006d021491bc7-6c8fc5ca5bfmr1500401eaf.15.1789619345141; Wed, 16 Sep 2026
 21:29:05 -0700 (PDT)
Date: Wed, 16 Sep 2026 21:29:05 -0700
In-Reply-To: <6aab409f.393a8808.fd1d2.4646SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab6c91.71f81b7d.278072.0010.GAE@google.com>
Subject: Re: [syzbot] [kvm?] INFO: task hung in kvm_gmem_release (2)
From: syzbot <syzbot+ab6273c58262b9de56d9@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ab6273c58262b9de56d9@syzkaller.appspotmail.com
Tested-by: syzbot+ab6273c58262b9de56d9@syzkaller.appspotmail.com

Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=100853f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=ab6273c58262b9de56d9
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16a2b925580000

Note: testing is done by a robot and is best-effort only.
