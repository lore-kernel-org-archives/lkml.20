Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEAF371876
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791604324; cv=none; b=sYWeaz34rf9bCsZcpJt1tPQOmusgRd+MNZqOxDRwNXOzLZWydAtUtkOKcw87PGWcpf6vFw2AqYeUR4f/3SdQBbOY4SwpwcmSYC2+PC12d1HHe9BF157nKrA3usMKS1ZE22odDUdj5/V0GhZv9GxWjoBd9U6m5uIIIOOvOEdy3Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791604324; c=relaxed/simple;
	bh=NScn6/KJqEF7AHjGWF7Pqt9yk2nithy44AhzvM0226M=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NlcrTI+flaZ1mdD7n5IpeqOjhiN8LL2J40mmsUfzNVE/po8L3fh/+kck4Sc9XhU5CagiAWUdcpPcVvsYm/0mxJIhapGk20Hgcfbgn05GCmpMmLEfvbj51GkUwAOl4wPXvywo/WctiFbXeukLVFOWaOpR73PMpcssXJkWRxcXYmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4f9b643ae53so417475b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 20:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791604322; x=1792209122;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rvripPbBDJMIDKf9S+AxfsGZauAc4IENqTKVR2/12WU=;
        b=JvaAPm9Pfj33sJZWHu3K9b9rF+Gxi+a66IZriFQELav1P5q5xtG1QRDjqd14Ns0ket
         bJoy2dVgeuOw0iF3efPPOkNfHd6oEB0pPHbwWPdJW8XbQzS76tz7CafJ2m8jrUpoTTmr
         IDIH8RrSf7yx4HEv622b/rHaIXU/HOcTclXVnrQ9XMvkso6zereoWzqztoUUQWlRKG0q
         MOlW71D4iZK+mya/Dqly3IETbwl4dkdicnx0kpSnEFVfxi/l8C5W+o3FbCD395aXvMSF
         pnN07xV83LX2IklRT77B8rjUMmyDN7DsnjestX2AatAe61ln/0oyzuGFSKRO7dyPO23h
         CmIw==
X-Forwarded-Encrypted: i=1; AKwUvBxyp5Z80yY3iUTuoonrQiPyksezie6bx6JaqrpDGvXdSomGxnmjxuFFzhBA7pPI5t1WB1seA3sgsgCF0bM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUcVB3dyVgR7cM1vmGQM4lRgHroGr3w9c/RXvjYOIsMerLnYAX
	kiPyLIvUwwdVL7RiHGjsDzOM9xYBR/wpvEeKsUPvOhjgVYazjeyIx0WwscpPZR0vPA8v8f4Xem9
	J5mGzSMfrhmpP8Wxr78Cbr9OrgaY+cJ41gC7rUjcXl3vcbrBuhlCQ3LhlSdQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:509f:b0:4c3:db9b:3ead with SMTP id
 5614622812f47-50c435bfb72mr4394861b6e.3.1791604321841; Fri, 09 Oct 2026
 20:52:01 -0700 (PDT)
Date: Fri, 09 Oct 2026 20:52:01 -0700
In-Reply-To: <6a6a9634.57649fcc.360844.0009.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac9b661.bbc4c7f9.15faa7.004c.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: invalid-free in f_uac2_opts_p_srate_store
From: syzbot <syzbot+38bab69d2760cc99cfbe@syzkaller.appspotmail.com>
To: a0yami@mailbox.org, bolewara@gmail.com, devnull@kernel.org, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 844d83d5964b87919b958ff48405188c6ddae9cc
Author: Qing Ming <a0yami@mailbox.org>
Date:   Tue May 19 14:33:19 2026 +0000

    usb: gadget: uac: validate rate list length before storing

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1080e1d1580000
start commit:   3d6d817622b0 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=158601bb8cb292dd
dashboard link: https://syzkaller.appspot.com/bug?extid=38bab69d2760cc99cfbe
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10f82c79580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13068ac6580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: usb: gadget: uac: validate rate list length before storing

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
