Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5D3227BB9
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 15:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791126665; cv=none; b=CBNVEontynUgMQrzM2Ejdv3Ngm34ePk7YzuCaif/x2A/VBSXhr2fDjTZsf5PxT14/ABk+G+kG5aJCo6gRrApQG+vsJeg6R4/tVPCfasEymuS+qXzK2ZqCGwRvs32kkC7zkCeOnKXdF7xWA91csr1+je+xd8lZk10ZwJPRz76Cks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791126665; c=relaxed/simple;
	bh=6DdXbC3+qfxrisEZlCKQ3u8Ki9xqHGsz+F192Lx7YTQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OUVdOyYCn5PmjKFPywkuJa2KP9cBEduyXEhdcOKPqjqRquiv569pg6UeEadg+k2w32ZzKT/IcxE3zaRSWA0uFdKNtSdSFwJIZ5c5R9Kb/+598quA1woUlUvLM9zAC5YHUAW+G7un8lttmRtqnI/cP+yI1ENpGzQcnmp9K3wTyqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-44899f99756so1461641fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 08:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791126662; x=1791731462;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gzmJU5YRLR9f9wSqR+AGcwgzRnhcjxYZJmniZuM3sec=;
        b=kqeam3q6cmDHDU7J26zevaJCxxT7qQlByfrtylYAaDBpv8A49KID1UH5oRLAmH0HRV
         X4Fdb2ioDplcgEImxrbhPsNquNZb067/WAfPlPFD+syCzsivxxriyjSbX5Ra0ihUjltG
         NlcrwKUG6MHybJUKJLaGbLpxWUxrphbquODPJhDGkiUEeEj475Tld2Bth+bmTc1gF76T
         SdnKYhR7gQdMJ+vjJBiJqlWlNwkgpoeC/JgEoFsfo6xJ238SYHkBAqcIGbIU6oztYGrR
         8gJ6kgFaHhHbsrkGpv3AhZnt2qb7ta5f6rYKBiZyIQk/43rF4Wey5gI91JlDy/xJK0mt
         jIVg==
X-Gm-Message-State: AFuF++kGbPIw1U3WN8X5J1t+V7GRHwKE0wNzwi3P6H378DKALnggRrYa
	eEJ7mcaT5f24QVL3wxvppB27ShWWHARC66YwJZCIAnQiW3/VfOECqSyN33qkDUknwAZMFKt5yIW
	V0JGxitBsSLEOwueeTId9jeBfaesV913CECBwlozxXM0Ihs63kowCfz1RZf0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10d2:b0:4f3:68d6:f0dd with SMTP id
 5614622812f47-4f67ad2c723mr6028961b6e.38.1791126662448; Sun, 04 Oct 2026
 08:11:02 -0700 (PDT)
Date: Sun, 04 Oct 2026 08:11:02 -0700
In-Reply-To: <20261004144310.121494-1-ngocthang2710.1999@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac26c86.9ad129c8.3858c0.002e.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in usbdev_ioctl (8)
From: syzbot <syzbot+109061940215dd4b011e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, ngocthang2710.1999@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+109061940215dd4b011e@syzkaller.appspotmail.com
Tested-by: syzbot+109061940215dd4b011e@syzkaller.appspotmail.com

Tested on:

commit:         6addb4f3 Merge tag 'edac_urgent_for_v7.3_rc6' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1324d7f5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=929e4854a828f434
dashboard link: https://syzkaller.appspot.com/bug?extid=109061940215dd4b011e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12e8f725580000

Note: testing is done by a robot and is best-effort only.
