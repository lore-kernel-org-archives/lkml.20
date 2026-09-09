Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7355A582B93
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969883; cv=pass; b=Fp6n3Vqit9VKhHxseY3S9qVQfniWHofw8Y27s3BWbcbnTerY7Q6uiIZsx0ecBXnLzz3fMwOv5BbFtjDD1VIBihFUUZ5IOBOLtJh5sKiam3mxvIvoTs0wqKPuEBhDw6vyv+Prr4Uun6BdJMOPLp3dOapoazTHnYRjK964AnTfBNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969883; c=relaxed/simple;
	bh=nGn7Z3t4ZbhWTD8r/y6YkwRq4GQunXuzolHgLynNEiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIqD6iaBf+XO8f3ssBWVvrKSdnsdNeQbap2iNkL/JOOwwH7+uA59uWY6h2JdOUqTCQDEkHtct8VXZwTQN8YT+seZ7mkI3CtjbGBHbS1X6NQmkjvDDqOBM0YUkOGpUz3TE56a0pYhJS1I6l7/i0DxWSd3/rvHfTcoZg4JUu/Yyn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jpu+riMh; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jpu+riMh"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7fccba9c675so11719a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:04:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788969877; cv=none;
        d=google.com; s=arc-20260327;
        b=sTMGOG5tlZHSu2ldPrs+FkVTu4fA7Ggph5BECZklMn9pV6HQVGi1mjodDsbWtbvLmx
         PI8ShiNxKhoi0vB2k1AZnpefC0hPD0JDhe7iMhBx3EGKBmg5W3hgpWQ6RSc/Hp6gTfG8
         wDbUuqLKeLX2wS87Ay8zIKqfeQigE5ELA6a7Zi700dREkDutQexLF6sgZlLGgpWAYiQ5
         UIvjyb2kdguxocLrRd67lCDlF5zOqXs+nbhZeizV0buks6rwrRWXmIwcqyT3mx4Iacrh
         67ka/P5y5I6HNhhYScbcdYTffuoNlS+R/CV688+Zet3WFaeO2Nr15G3n8fmFXdFgTV4h
         ah+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pn35Zv80suBYT8EilnQ7EI/ZY6LMkIOpiVZoLSb4gFE=;
        fh=qDsQqceFf80AhbTozhSs+VUeZ7oqmVKOxB2Pb8x7nZA=;
        b=Ht9XaCJxPRD6sHstP1rV6k6CMxBVgQCk9cQMxl6/dCKm8SSterfgZF0lnuxqUVeMlP
         4pdIItwwHKN6E3wouEtI30ClRfv5XW+CGWkw9c9N7TJ882C0DBbsAjrbn9QfASwquLQj
         5cg7Cz5e3IXOFoZCqTHqnTw2hFmW495WNh4buD4I+QgHro3NaW1vNsygvUQ/Q8SPbF9K
         03eaQactses32kJTx24BQxTl8rmjOpV3PJVYCS5/veX/GodWx73HotPgK/uqM8FyEhzk
         2g2ka4VJHLHMUUgLyxJ24q+YjTkNf8s3rRJ+gBtWI++tgD82hOAzzGBupvtZQq6Rb2Qi
         m24w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788969877; x=1789574677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pn35Zv80suBYT8EilnQ7EI/ZY6LMkIOpiVZoLSb4gFE=;
        b=jpu+riMh+I1XmvA+rNXwomsIc0lAtPUHtQwp0O8x9dbgJ2zErtxMJzJKW3GliZy6GL
         HhmAcliEX51stxrZB7HuNSCP94ZYi/GOppEI5rmTPXRNFn45Btaxwaxd3BYaYPYl8BSb
         N6UBg/EZ5MJNN6GQAKj/LDZnxukeucfHm5NYuFANKEvnhFVITWrQ9EpvaTY2q1WUbP2J
         oV8S2Aiu7bgHYjw+W/rL66Nvtme0er5xWNAV73a+bJr3Up9aliUmkjfe2zRRx9XBNL88
         x80iqBTziJaIXl4I8CftQc5K+RlgtZHAwJHteZsi6utTZDf3NkLBqNAG9xoHqCcQy3BM
         LhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788969877; x=1789574677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pn35Zv80suBYT8EilnQ7EI/ZY6LMkIOpiVZoLSb4gFE=;
        b=A9qJN2tYEe+PoPo7n9YC99MfxuIrUZj83Dm6R9mOEBxGHD/8tPDfxUL9VjC2ybKQcu
         K8UnVTXB+6BWlFwojRQ3mezMRlV68lIFAX2EtTMpixkkGI/ZuqXywKDvQmNjoI3T+94L
         aIl2kMWuB+sx4AytrsfnfYr9tLG0B3EW++4gSVr2ZoNhCYdD8KzA3YaLNdgTNz5+n8si
         ABDuW/jNa7ghrzalru+ht7ZCpBpb2IItB7VBgnAx/FG8uu/RHpZICXxIkMHydCMqnDLE
         FRyIq4HdEaSyyeHCR9BOTRsbYtjKl+iEC9A4/BlEGNJ+0/abB+t+wmxsfPtebrjrAy+v
         QmzQ==
X-Gm-Message-State: AFuF++nIedt29ATV5o4QskgZjv5XXIXRhYesjtHq+SyvT4daUevp8tjR
	bHWDwY8Qd9KdtByb4HbFfetnilo1u8aMPbZof6XkkYbv5v0M0oiOfzi5FS37bVSzxUp+3a2v6aq
	gyXIjUjeJI7ue8mZKPS4d08XS//BU/BZvZPwQMLr+
X-Gm-Gg: AYBFou0gIxR7U+at246NPF2vY8JEjvWcrodyTH+z0cUUNWGmCaI3Pv28YFSThCxF5i/
	cW8Qkn7Ma17Ga4Yc02KP8Bb9IVNCcS/s+JBGeOfU569anvR+IuzoIaV09g4TE+b3PDapIE5Jfdq
	GDFD90IkeyLAaZYGKy+Q3VtskejmKm6nOWwj/CFUBKZ4eAH43WunVpYBw4ObsbBjFlzIzS55y4t
	nX0wWppBwl5BduJUsoZufXuRhfF/kBYOuT1Ug6xu5j5I2ikIVPTR+GtHUcvKTKgC2ie1/6laBLg
	RKCW4xIAsebayYrCy3pQI0Ej/+BLN3VT2CsQjPKLL7Jsd9R0YiZHK47a/PVUIBXl2MxHG+sjKWq
	fv2XPsQhWLZBqJUU+ZTqTOvEobk4kblSNa1xFFgtQ4FRGKzyqc6tkghyr1WH6r7YMPaJBjimbez
	rQAvpp+/loUFCTwYpuMuw=
X-Received: by 2002:a05:6830:1303:b0:7f9:5a3:c243 with SMTP id
 46e09a7af769-7f905a3c495mr12608437a34.26.1788969875996; Wed, 09 Sep 2026
 09:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a73bd79.6851e1c7.236b5a.0003.GAE@google.com>
In-Reply-To: <6a73bd79.6851e1c7.236b5a.0003.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 9 Sep 2026 18:04:24 +0200
X-Gm-Features: AcwNN1WEL9mmmb28wbdDNKmhZqM-XxgrA8b0qFly8A6ocEiOqFliEfjU9BYITWo
Message-ID: <CANp29Y5x0qQVcw8TaZ=xCL-=kXoghCuXk9WxqjArVM4goNjWAQ@mail.gmail.com>
Subject: Re: [syzbot] [ath10k?] WARNING in ath10k_pci_probe
To: syzbot <syzbot+5c061dd050f2b84b2e1b@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz invalid

See the discussion at
https://lore.kernel.org/all/6a88012e.dbb3a75c.13dd47.0007.GAE@google.com/T/

On Thu, Aug 6, 2026 at 12:47=E2=80=AFAM syzbot
<syzbot+5c061dd050f2b84b2e1b@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.=
k..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=3D16cd13b958000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dcb17729fb04b1=
e3a
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D5c061dd050f2b84=
b2e1b
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e25=
5-1~exp1~20260613092250.77), Debian LLD 22.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D15b24bb9580=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1061acc658000=
0
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/375d27e96ecb/dis=
k-848acc8f.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/4ba19a656b9d/vmlinu=
x-848acc8f.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/7c2a17aaee7c/b=
zImage-848acc8f.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+5c061dd050f2b84b2e1b@syzkaller.appspotmail.com
>
> ------------[ cut here ]------------
> 1
> WARNING: drivers/net/wireless/ath/ath10k/pci.c:3597 at ath10k_pci_probe+0=
x6e2/0x1c60 drivers/net/wireless/ath/ath10k/pci.c:3597, CPU#0: kworker/0:2/=
198
> Modules linked in:
> CPU: 0 UID: 0 PID: 198 Comm: kworker/0:2 Not tainted syzkaller #0 PREEMPT=
_{RT,(full)}
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 07/24/2026
> Workqueue: sync_wq local_pci_probe_callback
> RIP: 0010:ath10k_pci_probe+0x6e2/0x1c60 drivers/net/wireless/ath/ath10k/p=
ci.c:3597
> Code: 35 fb 45 85 ff 74 50 e8 dc 12 35 fb 48 8b 7c 24 18 48 c7 c6 80 2d 0=
7 8c 31 d2 44 89 f9 e8 26 a7 9c fa eb 7f e8 bf 12 35 fb 90 <0f> 0b 90 41 bf=
 a1 ff ff ff e9 7b 01 00 00 e8 ab 12 35 fb 4c 89 ef
> RSP: 0018:ffffc90003aa7980 EFLAGS: 00010293
> RAX: ffffffff8690c681 RBX: 00000000ffffffff RCX: ffff88802039dd00
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffc90003aa7ab0 R08: ffff88802039dd00 R09: 0000000000000009
> R10: 0000000000000100 R11: 00000000000011ac R12: ffffffff8bcd1d44
> R13: ffffc90003aa7a40 R14: 1ffffffff179a3a8 R15: ffff888021ad8000
> FS:  0000000000000000(0000) GS:ffff888125c3e000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000200000000000 CR3: 000000003b198000 CR4: 00000000003526f0
> Call Trace:
>  <TASK>
>  local_pci_probe drivers/pci/pci-driver.c:332 [inline]
>  local_pci_probe_callback+0x120/0x1e0 drivers/pci/pci-driver.c:361
>  process_one_work kernel/workqueue.c:3322 [inline]
>  process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
>  worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
>  kthread+0x388/0x470 kernel/kthread.c:436
>  ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/6a73bd79.6851e1c7.236b5a.0003.GAE%40google.com.
