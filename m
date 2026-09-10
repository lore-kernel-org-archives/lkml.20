Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1163C457D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033267; cv=pass; b=JMQtXtj0L7OMyb17C15XEZSFBi02opY837vMs0Vi1NbVClrPu7nZqZGrXngnxXm9M8oqs20PkLBexZR6FKkSW4NW+iEvv8Rz1er3FaXSlkMOcVuwckaWw1dC7X4qIlWOEKHSVV1spyqql+L8PCC9SRq1NM2tv3LP8tgzHuJs4GI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033267; c=relaxed/simple;
	bh=0ZHrtRL7bAqsF8X6KNfVbc5fsMeLdeVmsFhcXJx3bTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dn94/l0kb/nqxGZDtFr1WQWQesrws4PpP6s76h1IPpMXltxUDaUWEbY6NoZ30uurK/RG9zFDNeFh89HZXEqZVbQz0LSMc13YKQiskFy+m6xcAqM4GuyFeg6WjKgyMjcJMc5MmMEc5pHEMG0G5CwkDhDojW+VH0NNmMiV/5JLHNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kJ5c6sfr; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kJ5c6sfr"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-495c49f8eccso6224783b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789033264; cv=none;
        d=google.com; s=arc-20260327;
        b=rlFFPJh3tPKFSdm7NXEZzpUv4nlri7M0ltaOuKC6gS8hEU409t7di0wDKdg7JgtEVC
         m7ygIbI5KH9mBw1t6G5VHbasZevtcdqazI0dQe7FAh6K2H2EuLFanXd6k5OH08adFnYH
         bJ34EnhEgtU4t3RV8a2hvx9j/TK4MgsjmfBY0NypWKDiUo1++0L8UaDhYGU9pe6p5Ud7
         yMqzQLZYpbZFGp4BEgqmUcE8fpQtnyHy5WJU1cIHrbexxWKdNz+Ytqv3FEBkVeccy2fD
         tUzaaiC3ks1Iu8gQDrFPCXuubw7geOHIfV914g95BnxAcdYRJtJV7ZAuKrRGWIe8UnJ5
         Kugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RY35ZWPwW1bPsR1CMQEBBclXXIBNd/EaLdOjMo9JA90=;
        fh=0xGX9MtNUDRQ3Pm7RaNCt5H7OM6hSc0lYgtvrf1BJBs=;
        b=C7PP1yCtvLUgxJ01VGZY5W5cKdKxy1Zz4C+X5Ytr/697xjsLkTR9KHyt+dX4SnNmKv
         EQWCbJlZmXU9OF4lL2bJvaEzozxnDrjKjUyd2OgO0EnoJKLtRwezKkCxUT8M2RfjDa5Z
         OYnFuz2ORFSv+KmkpT7CzjEen7m+8/wr36vDkFOLvgxZ6+v6jfuOi0EsabpwyzgJSNcW
         PwwOKgi2fxb2wE6YV85SFAl6lnydrDs/7gMEhTaHa0RhAQqB4SV0HsYUw8NbA31wsjdp
         Y6hNr3ACzVV1p6kfIBni8A3LaTqy6Js5tfJ80aMto2850o8sYNq0zy4k8rOdGm+F5MZ8
         azyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789033264; x=1789638064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RY35ZWPwW1bPsR1CMQEBBclXXIBNd/EaLdOjMo9JA90=;
        b=kJ5c6sfr0y60pC5D86EAK2caU8hDmma5FVZhKAxm5vrYOazDtwwjDjr8GJaV91Uy4o
         WnbN1Nx83XXKMNEvi4qxNsyVeBzZzBJ4Md94LLA9MA48ZWg9h4Ul5vBKPiG9PYqHadDj
         ee5nNqH+6SI1GlBa08hATr9EYHoCw9zFkup2UF27wrWOn8CFsMCshJhPcMkI4F75Gx03
         nCRCRLbUm6BvmMbXGRvh2MlddD9aYWRyn/QaTBw4QssjsGeNA7F9l9KgEIdZFXIrYF19
         92AYGqfqSttfLAU4cwicEjnYmLQpl10kUvymoCDNgmmNOnqCzE9sC6w8D633/uzn4XdM
         b/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033264; x=1789638064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RY35ZWPwW1bPsR1CMQEBBclXXIBNd/EaLdOjMo9JA90=;
        b=aQ6NL0Vzcm5wHe+ATtrwcPdiWDAeDHw9oJXRE7Cnld8zskr6ycAoHz0zCUEHpVsuCA
         4WbFb8VQNPf7lb3ArmD7nyt2h8jXTWHFnfTgEwpeZrFuULCpxt5KWhKYNh3imC0In2Hv
         zU9A6LIFwg8TvddyyFZpNeixXPdij44j2kaRD8NRcyIlUxDIJ6XmGUETrDvhpuEz1nAO
         ZUaB0uomuUBgNtBiWiRAhGyKOce4tPBAw1Y3IhJ4hGF4IO6vCAac6yzmaPbw1j2DE+Ob
         FvZA1y8tqNvTWH1rZlAkjz/b+R66/k92MoodMSIyTAJbcXTisOmydhX53DaTTnB9aHtY
         Owvw==
X-Gm-Message-State: AFuF++lFqfav1C1Fca0YM6/VL3XjVADojPMFkDAE7KtuZQhTbl6djcmL
	YTPJxXb64VLnmMkvn07fue7v2GT5YkIheU7Z5SD9X1XCxn95HCjUDP9kbBKJ2adi370citPCFcn
	T3w9Wgf7/cxCK9IccANwVO6zf9Zh0OTZ/V0pJj9sT
X-Gm-Gg: AYBFou2rdZfAJVeNI0zolcbfckF5aeDk7JZ6l5I6ahJAf7pE6UreuWCNujwDeXoiVP1
	jwLHQdZ9nf/A5j2200b/k2QoMLcT0Y4vc8MurNmXgZ30+5RyTA4RGkyh8GxjQbbHYyZx9Df55cj
	DcePH5p3EDH511+nIjDPZHb+aStqiWUfZHhE/grLkW+CJDdGnMgdBKjpE1grp5SmpdTXOuiwSoh
	GxKOV9z0e/gYrKwUfA0OurhfsmDn6EQjMrABOwIVDA8Y4FRgKjs0pc8QrkdohK0Pmft3/TWAN8o
	v3lGTWQyKj6w4Q6sYZOvPofOba6YLmq5XNL+OyjM2HDYhhyAlTYsNaPOBllgF+6d2SEhUJBnV6E
	Z8XwMaRg2jHC1Z1f7t2eLz+7+fNPCJIGGw20VUXchU+QNtwvW4NtNbckc6mp/Cleh2eN3cvq3QB
	zTL23G2UUGj73+XjqAi0H+kro=
X-Received: by 2002:a05:6809:24d:10b0:4c0:12f3:6007 with SMTP id
 5614622812f47-4c012f36474mr5831640b6e.4.1789033263935; Thu, 10 Sep 2026
 02:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a73ceda.5aeeccc9.207e63.0008.GAE@google.com>
In-Reply-To: <6a73ceda.5aeeccc9.207e63.0008.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 10 Sep 2026 11:40:52 +0200
X-Gm-Features: AcwNN1V08JJmkHsRxxFOMDjkNrrQxwFVsXGUuQRj2Mfd5Wa4kPqkcdGupiMn18w
Message-ID: <CANp29Y4DDpr7-aoKH+nQ82jea4vVDsCtx6C2YYcEasbtF1E4sQ@mail.gmail.com>
Subject: Re: [syzbot] [usb?] BUG: unable to handle kernel paging request in nhi_probe
To: syzbot <syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz invalid

See the discussion at
https://lore.kernel.org/all/6a88012e.dbb3a75c.13dd47.0007.GAE@google.com/T/

On Thu, Aug 6, 2026 at 2:01=E2=80=AFAM syzbot
<syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    7235a3e71949 Merge branch 'for-next/core' into for-kernel=
ci
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux=
.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D11edb64958000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dccf4bea59f670=
07
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D901ca72278dfd89=
daf58
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e25=
5-1~exp1~20260613092250.77), Debian LLD 22.1.8
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D10678bb9580=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1564acc658000=
0
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/fd45635beaae/dis=
k-7235a3e7.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/d7d2e6507223/vmlinu=
x-7235a3e7.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/b5b5d8de4cea/I=
mage-7235a3e7.gz.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com
>
> EXT4-fs (nvme0n1p2): shut down requested (2)
> Aborting journal on device nvme0n1p2-8.
> Unable to handle kernel paging request at
> Unable to handle kernel paging request at virtual address ffff800092aad64=
0
> KASAN: probably user-memory-access in range [0x000000049556b200-0x0000000=
49556b207]
> Mem abort info:
>   ESR =3D 0x0000000096000007
>   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>   SET =3D 0, FnV =3D 0
>   EA =3D 0, S1PTW =3D 0
>   FSC =3D 0x07: level 3 translation fault
> Data abort info:
>   ISV =3D 0, ISS =3D 0x00000007, ISS2 =3D 0x00000000
>   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
>   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0
> swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D000000021b01f000
> [ffff800092aad640] pgd=3D0000000000000000, p4d=3D10000002212fc003, pud=3D=
10000002212fd003, pmd=3D1000000105275403, pte=3D0000000000000000
> Internal error: Oops: 0000000096000007 [#1]  SMP
> Modules linked in:
> CPU: 0 UID: 0 PID: 4950 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 07/02/2026
> pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=3D--)
> pc : __raw_readl arch/arm64/include/asm/io.h:84 [inline]
> pc : readl include/asm-generic/io.h:231 [inline]
> pc : ioread32 include/asm-generic/io.h:906 [inline]
> pc : nhi_probe+0xc0/0x730 drivers/thunderbolt/nhi.c:1198
> lr : nhi_probe+0x34/0x730 drivers/thunderbolt/nhi.c:1187
> sp : ffff8000982375b0
> x29: ffff8000982375c0 x28: 1fffe0001a3c399a x27: ffff0000d1e1ccd0
> x26: 1fffe0001a3c3998 x25: ffff0000c2f4a0d0 x24: 1fffe0001a3c3999
> x23: dfff800000000000 x22: 1fffe0001a3c39a7 x21: ffff0000d1e1cd38
> x20: ffff0000d1e1cc80 x19: ffff0000d1e1ccc8 x18: 1fffe00035bc9e28
> x17: 0000000000000003 x16: ffff800088b07000 x15: 0000000000000000
> x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000000
> x11: ffff80008a590e28 x10: 0000000000000001 x9 : 0000000000000000
> x8 : ffff800092aad640 x7 : 0000000000000000 x6 : 0000000000000000
> x5 : 0000000000000001 x4 : 0000000000000008 x3 : ffff8000801571a8
> x2 : 0000000000000006 x1 : ffff0000c6899d40 x0 : 0000000000000000
> Call trace:
>  __raw_readl arch/arm64/include/asm/io.h:84 [inline] (P)
>  readl include/asm-generic/io.h:231 [inline] (P)
>  ioread32 include/asm-generic/io.h:906 [inline] (P)
>  nhi_probe+0xc0/0x730 drivers/thunderbolt/nhi.c:1198 (P)
>  nhi_pci_probe+0x418/0x4e4 drivers/thunderbolt/pci.c:479
>  local_pci_probe+0xc8/0x158 drivers/pci/pci-driver.c:332
>  pci_call_probe drivers/pci/pci-driver.c:394 [inline]
>  __pci_device_probe drivers/pci/pci-driver.c:455 [inline]
>  pci_device_probe+0x460/0x8d4 drivers/pci/pci-driver.c:489
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x29c/0x800 drivers/base/dd.c:706
>  __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
>  device_driver_attach+0x58/0xac drivers/base/dd.c:1203
>  bind_store+0xf4/0x14c drivers/base/bus.c:267
>  drv_attr_store+0x80/0xa4 drivers/base/bus.c:125
>  sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:145
>  kernfs_fop_write_iter+0x260/0x3b8 fs/kernfs/file.c:345
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x51c/0xa0c fs/read_write.c:687
>  ksys_write+0x12c/0x228 fs/read_write.c:739
>  __do_sys_write fs/read_write.c:750 [inline]
>  __se_sys_write fs/read_write.c:747 [inline]
>  __arm64_sys_write+0x84/0x98 fs/read_write.c:747
>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>  invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
>  el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
>  do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
>  el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
>  el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594
> Code: d343feb6 9140e508 91190108 d503201f (b9400109)
> ---[ end trace 0000000000000000 ]---
> ----------------
> Code disassembly (best guess):
>    0:   d343feb6        lsr     x22, x21, #3
>    4:   9140e508        add     x8, x8, #0x39, lsl #12
>    8:   91190108        add     x8, x8, #0x640
>    c:   d503201f        nop
> * 10:   b9400109        ldr     w9, [x8] <-- trapping instruction
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
-bugs/6a73ceda.5aeeccc9.207e63.0008.GAE%40google.com.
