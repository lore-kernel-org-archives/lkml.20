Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3649430ACE3
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301206; cv=none; b=uRyxR2DbRbHEqFKx3rH93HhjJESeDSviFAjHR1yoxsAcTH5842cLJb6xEPLqIkK5X7vnBWqV/gLWAo37cDSK84yWE2PST84uhoGKDgKPWdHSmCOjVfVcDs5R3RcUdGe4drLUgJlfnCuzukRCzl9/CdD84/qd5cdQPCOlBSBFB/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301206; c=relaxed/simple;
	bh=r2AL6wjk3RwgrKLo6judA9PLvSprPDm35T5iWmiEjhQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BfJaz0z74ngjKRQ78hKgp8emeiyjzZaIQyFFSUpDl8bfxfjkH5XKg/4dB5MM8z82cH448hjWArTJ6kDjpF1fcM1d6dG+DnC0p8Ki3y6/XEg/M9IvbzmwVaKfMUnfXPztgZpI4ZgpKMdJFJFYbBqBL5Wze4eLvL21h0+eVoIlVQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6df64724e48so1984705eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301203; x=1791906003;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GPNJ9FOaWXVJFCFEMBWWao3of9jOMjQwFlM3DIqtHEU=;
        b=gnh6hWdaixwxijqckSl48zOApOzND2j+7wMy5xFyw+shBWe2vOOjchL5lq8hX6gfPz
         4Oc2cl45U7y83CE8mr/YSlBZhLaiPlT8PMdhywA/zMIqUpZ0gGduWxclmeuzAF5xrbCz
         KNvTYMwjqe0cAlKjc25a5mJ1XnyDeWr/SR1lFzXWriCEUksc5gLWvidHjmuvEfA1DuaK
         pHeNneUai5zqd/BWCg/MJeLjw/PcBXUxRQqRyba+6ugJxEPF+3C4hZhyOEHb11M74t1I
         ZjE0QoblZigbYKH37fykVxr3U4PXQ3xT//2pEpFGM789QShwe7pei6voHrfiYFag0Nvf
         Pj1w==
X-Forwarded-Encrypted: i=1; AKwUvBw5c+p8DpAWOh2OgJUVoQ00RbEO6VqEHBWHY6jwRo31Xi0MEU3X6sNhmp+4pEAU8fikCOhL4qCU5ZP9AXM=@vger.kernel.org
X-Gm-Message-State: AFuF++kgvGvt2d2vCu1DKUfJ2fr8FaXyRUnce2UGk39iwNs8Gn0wZ6MZ
	Obb4hQ7ds0z+caMGgg7YNqKB88RW4nQYWfUUXQWcONA/hhKgt2uUH6qxq/JttPKQhojNEVlvq5e
	tRtBgXlZyHQyt4yBcHs6cF6pEOLfh70TuydGfghiby4w83xNSrOVXIVmy4Po=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:60b:b0:6e2:a665:4eaa with SMTP id
 006d021491bc7-6e55356a271mr1461067eaf.27.1791301202967; Tue, 06 Oct 2026
 08:40:02 -0700 (PDT)
Date: Tue, 06 Oct 2026 08:40:02 -0700
In-Reply-To: <20261006103451.5210-2-jakovnovak30@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac51652.9ad129c8.3ce5b3.0003.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] WARNING in smsusb_term_device (2)
From: syzbot <syzbot+d627b1495de0e851be32@syzkaller.appspotmail.com>
To: jakovnovak30@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d627b1495de0e851be32@syzkaller.appspotmail.com
Tested-by: syzbot+d627b1495de0e851be32@syzkaller.appspotmail.com

Tested on:

commit:         22430ae5 Merge tag 'printk-for-7.3-rc7' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1080eff5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=341a98f91c13ec9
dashboard link: https://syzkaller.appspot.com/bug?extid=d627b1495de0e851be32
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10b36f25580000

Note: testing is done by a robot and is best-effort only.
