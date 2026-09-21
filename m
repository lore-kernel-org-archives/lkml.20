Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF64A35E1C5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789969511; cv=none; b=dfjgk2+Y/rZNFwgkx4ntD4C3/11Qos5iY87QW4rNuv7CSABJ697BSdpcCAc6wmW9eyUr/MNE+npYd1EXYib5nx5bkQsNKSbFAgDhNgXUvO+95SOWbHoYytixthVOCBRC2p5fjdrNV18pTBoZwp9l9ZTQGDRCk2eTVLqekhErwI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789969511; c=relaxed/simple;
	bh=kQje0gSTeZYNISALlrSWwQ4l7CnsfFMDhhKYnsi4/aI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPnoo1D9oF9SBKCTTVRURR4RzJfdEQg+O1sAXbNfj5TT+82+ZpWu3H8N0VDPQi8j1alojJCeZK4Mx8g/4RSLCYMvxbEvgWQ7/D1YnZWEyBthiWRif/zh3doseGz0KJrugmW9Y3BPF++AWhXZ1yhTneYXE2BWqvTPmlbFgXRGRHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFvC3n03; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFvC3n03"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E1A1F00893
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789969510;
	bh=hk23fiq0KZ1f/Xix9GdF5C6Z3buHI5adbp760BxRcJM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OFvC3n03q55ybfelNcS0Cg5OTbPNdnvaSEanmNE1DeZsP+jmrYTMKveGV/+5VC4Wq
	 3M8HIItE6MIibyPAbgljYIJAXQZ+WF/N8xBcsR3ZZoXUmuyHRKQBoDI1+iwxGhpsFz
	 QW6iF2uyg733ZgW9jR5a4z7N5T5Y2MrvrvSl+fqAgSlK9fucNvkOflCIhogk/YhGeZ
	 z/l2/1iZy2f//oz7ZHRHxaQ8FoAUUyMwImD/VSLIZyHZ62/iU942W8twP6GoFD2pNZ
	 1rSXORzJqqQ2FAlHdfyMWXkTYzr5hAum57/zWP5t/vch29IhF9ZswljJ+CAgzcTYvs
	 Z0GmfGTBaBTWQ==
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e518329so594339e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:45:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxWyF71XlMqFtCeTpVxnOJxYIYKuXQV0wT8YF1v8Aw+hRGOcfSX/0KmsV3WN3eD6LU2o8O4Lg0MrKuQXi4=@vger.kernel.org
X-Gm-Message-State: AFuF++lFOKj13toay85AlOxcsWJK+gv8Vr5MRMXdoZxvZMrL7WoRSJRR
	xPKvtmv9newgt5dcvslj2bbCnjFfVd72ir9TK4MiR2A2Ih/MfE7v8p1kFS3d94sEepNLkeeK37I
	JsyISSvy5KJuF+Y/Q8FSaNovyojfof3o=
X-Received: by 2002:a05:6102:424d:b0:798:24e8:23f4 with SMTP id
 ada2fe7eead31-7a55a328abcmr2528499137.7.1789969510003; Sun, 20 Sep 2026
 22:45:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6ab08265.71f81b7d.15fa6d.001d.GAE@google.com>
In-Reply-To: <6ab08265.71f81b7d.15fa6d.001d.GAE@google.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 21 Sep 2026 13:44:58 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xnM66UZ-n55AHW4UHn+PSCP7G-gGUHUfSt6MRZGeRnfw@mail.gmail.com>
X-Gm-Features: AcwNN1Vz2PUryz8nxvQr8pMX0aqG4s1oJiLjepSVJsplEgiB83boz4wgOvSfKMo
Message-ID: <CAGsJ_4xnM66UZ-n55AHW4UHn+PSCP7G-gGUHUfSt6MRZGeRnfw@mail.gmail.com>
Subject: Re: [syzbot] [mm?] KCSAN: data-race in copy_mm / lru_gen_del_mm (3)
To: syzbot <syzbot+c6e1b1b32ff2fc3b7d60@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, david@kernel.org, 
	hannes@cmpxchg.org, kasong@tencent.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ljs@kernel.org, mhocko@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, syzkaller-bugs@googlegroups.com, weixugc@google.com, 
	yuanchu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 9:03=E2=80=AFAM syzbot
<syzbot+c6e1b1b32ff2fc3b7d60@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    17e7b8eacf4c Merge tag 'cifs-fixes-7.3-rc4' of https://gi=
t..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D11d6c52558000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D8372e2cd52628=
d4f
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc6e1b1b32ff2fc3=
b7d60
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e25=
5-1~exp1~20260613092250.77), Debian LLD 22.1.8
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/60ea54622289/dis=
k-17e7b8ea.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/675e38c8bebf/vmlinu=
x-17e7b8ea.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/1006b8efd827/b=
zImage-17e7b8ea.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+c6e1b1b32ff2fc3b7d60@syzkaller.appspotmail.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KCSAN: data-race in copy_mm / lru_gen_del_mm
>
> write to 0xffff8881077eb088 of 8 bytes by task 7336 on cpu 0:
>  __list_del include/linux/list.h:241 [inline]
>  __list_del_entry include/linux/list.h:264 [inline]
>  list_del_init include/linux/list.h:333 [inline]
>  lru_gen_del_mm+0x299/0x3e0 mm/vmscan.c:2998
>  __mmput+0x17a/0x1c0 kernel/fork.c:1203
>  mmput+0x40/0x50 kernel/fork.c:1216
>  exit_mm+0x113/0x1a0 kernel/exit.c:617
>  do_exit+0x438/0x1510 kernel/exit.c:999
>  do_group_exit+0x138/0x140 kernel/exit.c:1154
>  __do_sys_exit_group kernel/exit.c:1165 [inline]
>  __se_sys_exit_group kernel/exit.c:1163 [inline]
>  __x64_sys_exit_group+0x1f/0x20 kernel/exit.c:1163
>  x64_sys_call+0x254f/0x2550 arch/x86/include/generated/asm/syscalls_64.h:=
232
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x112/0x360 arch/x86/entry/syscall_64.c:84
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> read to 0xffff8881077eaa00 of 1728 bytes by task 7337 on cpu 1:
>  dup_mm kernel/fork.c:1537 [inline]
>  copy_mm+0xd6/0x340 kernel/fork.c:1595

I guess all we need is:

diff --git a/kernel/fork.c b/kernel/fork.c
index 22283bf849e1..696021c459d9 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1532,7 +1532,7 @@ static struct mm_struct *dup_mm(struct task_struct *t=
sk,
        if (!mm)
                goto fail_nomem;

-       memcpy(mm, oldmm, sizeof(*mm));
+       data_race(memcpy(mm, oldmm, sizeof(*mm)));

        if (!mm_init(mm, tsk))
                goto fail_nomem;

As we don't really care about the data copied by `memcpy()`, since
`lru_gen_init_mm()` will reinitialize the lru_gen state in the new `mm`.

static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *=
p)
{
        ...
        lru_gen_init_mm(mm);
        return mm;
        ...
}

static inline void lru_gen_init_mm(struct mm_struct *mm)
{
        INIT_LIST_HEAD(&mm->lru_gen.list);
        mm->lru_gen.bitmap =3D 0;
#ifdef CONFIG_MEMCG
        mm->lru_gen.memcg =3D NULL;
#endif
}

>  copy_process+0x10ad/0x2340 kernel/fork.c:2310
>  kernel_clone+0x1c0/0x5f0 kernel/fork.c:2769
>  __do_sys_clone kernel/fork.c:2911 [inline]
>  __se_sys_clone kernel/fork.c:2895 [inline]
>  __x64_sys_clone+0x143/0x180 kernel/fork.c:2895
>  x64_sys_call+0x2479/0x2550 arch/x86/include/generated/asm/syscalls_64.h:=
57
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x112/0x360 arch/x86/entry/syscall_64.c:84
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 1 UID: 0 PID: 7337 Comm: dhcpcd-run-hook Not tainted syzkaller #0 PR=
EEMPT(lazy)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 07/24/2026
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Best Regards
Barry
