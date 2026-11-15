Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794756178;
	b=gBojoV+IbHfrr1x4H0tJ3xzV1d6GG/YFGKfnQZdatjHn7aAi8ydUWzbGWZTTvuj/LwFV
	 AgcN2EYBc5Gvydx1siWodp6PaFCPVqh5TxreWp+ZkNZkb15aObk6jEme4VAbcfOGJxCay
	 LU7bB0tMy8CSeq3mvSNao81wYDxpdEtdcaq5LZkb2zUTSZtLC/rwsGdh4iV+QrM2B2U8q
	 X2HoGvoCXbXEv6WkEdtocVqrX5pOeGCeRsh7ksrv5ghmRolNopL/wZxVfAZPuIf6eJm96
	 jE1fsYyGABM5Du+uQJ/xAlmCrRN7Q6dAVOajKWtB7LPPnl407lUxEDdwJG3pAY5R00A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794756178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1+dak9kPwaAumNGN0W2R+Ndio112G9N2RJ9c0aEovgA=;
	b=W9w1Bv8O4pT0+Ll40u9U04uNSROTmiPojM42uBJ+DU+h/jYsOK7qvZju1J6KItN70G07
	 nMJF4xVoWrbhxT7z2wu+ppg9cqkPQpqkIfuLh4eUEvW6K06rPD7khk6Pjwfzr/2F4TASF
	 PdwkjxGzv/fGGbLzUyhDRu9IQgGGBhfyM/3AIaI/AywK7+c+E8C/UFplUi8KU84tRekXO
	 TR+ZqhqZXc3yEfn81to/xhuCOWLSGx5XLZmZyE3wjdQmjkcrqexggZCOQl+b4h6RL011n
	 Z9EULR1eKygEPEVAJu5FJnm4+9T7hSbWm6VPhNHynYweHSBZZeg1z06lkYwdd+F12qQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iEEUK2A2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8013606A331
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8013606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iEEUK2A2
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-862b090e41eso431349a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:22:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794756176; cv=none;
        d=google.com; s=arc-20260327;
        b=PkIzuKyRk9qELF0k4KlRqkzBGCCOMCUkoA/BhYOWtoxrFXBDk1SXgZ4masHoTocxa9
         OGZ3kJ3E+2WKQiU9S/8a35PrbF+vHuxRjv9UD9InWgVESKMpSYSsFSsEZax45MIHPBWN
         37NPkWubyqk4Lq14ypAvpYxQLmLulTRnYsG1qkeIbta6EcYmMxlVlipz/BD5IhjKpZcp
         3aiy1Z/hhCKW6GLakobgTIWlQzzIWTQqitzG0tRQZkqWbIhriW+BMN9LEhNNgMHeODev
         IEYfc8suKZWh1M3RqkPC2CxGpgJsTjDSimosabRq0OHqDbvoAaexAcWV+S+a9+K5Bjwv
         jpsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1+dak9kPwaAumNGN0W2R+Ndio112G9N2RJ9c0aEovgA=;
        fh=fmW7ckPbT5kZI1CL3oQ5gsuo35Iw1+qsqTzPjFN4/ps=;
        b=VslcvSuxKtoVPRgkf0o79HHOL+jlhEYh7uLJWVumOpMqtuWfyk7e46rK/wj5uvGyt7
         oFTZ+Aqhrb9gLwElFwAd/ZmTVfbMSYOs0GeCQ3OH26qj6qz8saLC8BOupEFVI+t5k99H
         7d98NDsTAxtpBDXfV2G9hyef/vFecgUxSDmy9wRfchePFo5gyHlQXMSb+xiIwPtITjqj
         KaFSpxmGPt6GtiMkHbqRXARnVvpwq/YmnUGNXy7nE7peSKAReVJqqqvlyI6m70/kNVtU
         nBZaMetZH6PjlQBtrkU/AR8GfcMcQkgAstA5rcDrvzRKJn9B85vVr6Ivg3q4DRpe7vPc
         iEwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794756176; x=1795360976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1+dak9kPwaAumNGN0W2R+Ndio112G9N2RJ9c0aEovgA=;
        b=iEEUK2A2DP8JgUIrEes5OSUV0XlfawBqRVdOSzK0iTGPiXJnNd3GFNvnJ1pZOqkHSD
         41xk/9EgTFiBfuJbdBMyR4tn9V1Pvg7jKO7q05g0HbVBW+JJiIdeCXGfnQ2Ji4Skptjd
         kuT9U14HGDDoObVU38pqIbBvBpblx2lmvz2bxnNAv/nwUcPCWFvBeBgdGIJKP49Qalm+
         2o9XzH+F2B8sN4Ahax3wYC9Aj+70+6TBuroUEu7rf/5+CKlg3YZFpSCtawbxfGt05IJl
         jqzxC/g0L4JIMaswvOAQlFw1viOWLsahiAm0EttfCToIlDZ7gwXBCIbT88Vnyy5Gk1G7
         eY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794756176; x=1795360976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+dak9kPwaAumNGN0W2R+Ndio112G9N2RJ9c0aEovgA=;
        b=j6paT8IiC+4wEMzcIcOldV4c1ErSV0IalbUNEHzjdcJL/rWEqA9e/qKcIxvbnsCn2k
         cdhKWjnyuuRs4WRKOMPwDQc3YY4Uunk+e9IJ2CYOav7F9RrKhG1eWtUZ/If1+7yPt2lP
         LRkXnTI8+XDmNMJ4UaoruHKLFZtf1MD3LbyUxdEZn9g/YSiUZrPhH2buRyrUmOOmlV69
         xa2Oykaez0V7GzXEq+InoKsIvWEL9yEcbaOvVJWxO7QgOQS2SxaJdEotNrbHnPoicjIE
         N6MYrnhjUb7Ck9oVSwEbujf4zr615XGBXlY4OfLbcN8FiQVK7jw3eusqsbSVB05gd0Ew
         12zw==
X-Forwarded-Encrypted: i=1; AL+hErGnZ+TN3DCDt5i9tmS16Md9T/06ju1Q323zjK4g+Qtttj/Oqk07INCiWlVvzXImz1QEPAM3q36G23q+v1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fexmXStovp7RiBoOMP9SkY8PEwuXDDTgzh1Z3PRHGhuk4+DIt
	EB6FM9C9OBCcf88B3/aVMWUpZFNUtUrWiFOw1PhDLT8wrbdDU97P6tePSdDLBEP7YJnPvuNHiwv
	zbyBCbW8H/VgijMZ+69IRsipkoPwjcqs=
X-Gm-Gg: AYBFou2G/66K/zGVztnBstwBTY+z+38JVRrcVIvYkpf62p1+jrXZUZwtZ25f88skC//
	doL5yh6qORuXDuZQdOmT3+nh8h7c4EB5FpjTyfvEzLw9+mMkGd0ZWGllBl93a6/vLcuIuRAwzbR
	vCuX3h3cstJz/arfUTvG9+sNHsmU+1UeR7yPnaqZcq1iJg4dFFA/eeAcP7oGoYK3wOgq6KwTZ2U
	zvhaAjpPiXzDVLYpA+PN2BuQ8K3W14WTfxQa6QEvWrNnTUcM7twNwXhecc/wz5VddtFnXQksKX4
	vHGVJr+We4JOXxzs2XLMazqaqkh7LKaWESrTnhV5ddhIbLvHLFT7C7esL/ocmf6mY/eF80y8qh5
	Xq0WaRHBLSOPL6A8mDPA5WnikzxMo+oYLbW074mSPx/NndpMyn6VrgaAqFKQ2JA3NtXdMpuamZX
	dM04m6qy3AEFu/Q5Xpj6nyoR3aGr4Vv3q4tcUP
X-Received: by 2002:a05:6830:2e07:b0:862:c089:d895 with SMTP id
 46e09a7af769-862c089dbf0mr1013904a34.0.1794756176420; Sun, 15 Nov 2026
 07:22:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6a1694a9.17ccd394.1fa6b8.0001.GAE@google.com>
In-Reply-To: <6a1694a9.17ccd394.1fa6b8.0001.GAE@google.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Sun, 15 Nov 2026 09:22:44 -0600
X-Gm-Features: AclHuK8-pxaRjyDkZdkJ2W897yja8qZPqsmqLZiMLov3D_UVzwagRhySVd9PH_k
Message-ID: <CACVXFVOMfnBahRrUEMU=3O6onJWAQiEfPdEzFhUrFQ48MRspxw@mail.gmail.com>
Subject: Re: [syzbot] [io-uring?] WARNING in io_wq_put_and_exit (2)
To: syzbot <syzbot+b0d54b9e81de55179e47@syzkaller.appspotmail.com>
Cc: axboe@kernel.dk, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 1:53=E2=80=AFAM syzbot
<syzbot+b0d54b9e81de55179e47@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    6a97c4d5262d Merge tag 'for-linus' of git://git.kernel.or=
g..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D17a41ea658000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3De327ee9a867dd=
6b9
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Db0d54b9e81de551=
79e47
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D=
ebian) 2.44
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/5cc8b6debcbd/dis=
k-6a97c4d5.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/649698f0231f/vmlinu=
x-6a97c4d5.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/b297958f355b/b=
zImage-6a97c4d5.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+b0d54b9e81de55179e47@syzkaller.appspotmail.com
>
> ------------[ cut here ]------------
> time_after(jiffies, warn_timeout)
> WARNING: io_uring/io-wq.c:1370 at io_wq_exit_workers io_uring/io-wq.c:137=
0 [inline], CPU#1: syz.1.3756/22484
> WARNING: io_uring/io-wq.c:1370 at io_wq_put_and_exit+0x36c/0x9d0 io_uring=
/io-wq.c:1399, CPU#1: syz.1.3756/22484
> Modules linked in:
> CPU: 1 UID: 0 PID: 22484 Comm: syz.1.3756 Tainted: G             L      s=
yzkaller #0 PREEMPT(full)
> Tainted: [L]=3DSOFTLOCKUP
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 04/18/2026
> RIP: 0010:io_wq_exit_workers io_uring/io-wq.c:1370 [inline]
> RIP: 0010:io_wq_put_and_exit+0x36c/0x9d0 io_uring/io-wq.c:1399
> Code: 00 00 0f 85 7d 05 00 00 48 8b 15 9f 3c 4c 09 4d 89 e7 31 ff 49 29 d=
7 4c 89 fe e8 cf f6 13 fd 4d 85 ff 79 aa e8 e5 fb 13 fd 90 <0f> 0b 90 eb 9f=
 e8 da fb 13 fd 4c 8d 63 08 48 b8 00 00 00 00 00 fc
> RSP: 0018:ffffc900077af8c0 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: ffff888033fdb000 RCX: ffffffff84f4b5f1
> RDX: ffff888030d4ca00 RSI: ffffffff84f4b5fb RDI: ffff888030d4ca00
> RBP: fffffbfff1c81e50 R08: 0000000000000007 R09: 0000000000000000
> R10: ffffffffffffe7c3 R11: 0000000000000000 R12: 0000000100027def
> R13: 0000000000001b58 R14: ffff888033fdb018 R15: ffffffffffffe7c3
> FS:  00007ff97ac796c0(0000) GS:ffff88812446a000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f4b79c90b9b CR3: 0000000037235000 CR4: 00000000003526f0
> Call Trace:
>  <TASK>
>  io_uring_clean_tctx+0x114/0x180 io_uring/tctx.c:248
>  io_uring_cancel_generic+0x7b9/0x810 io_uring/cancel.c:657
>  io_uring_files_cancel include/linux/io_uring.h:20 [inline]
>  do_exit+0x344/0x2af0 kernel/exit.c:916
>  do_group_exit+0xd5/0x2a0 kernel/exit.c:1119
>  get_signal+0x20ff/0x2210 kernel/signal.c:3037
>  arch_do_signal_or_restart+0x91/0x7e0 arch/x86/kernel/signal.c:337
>  __exit_to_user_mode_loop kernel/entry/common.c:64 [inline]
>  exit_to_user_mode_loop+0x8b/0x4f0 kernel/entry/common.c:98
>  __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline=
]
>  syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [=
inline]
>  syscall_exit_to_user_mode include/linux/entry-common.h:318 [inline]
>  do_syscall_64+0x706/0x860 arch/x86/entry/syscall_64.c:100
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7ff979d9ce59
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ff97ac79028 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> RAX: 0000000000018ff8 RBX: 00007ff97a015fa0 RCX: 00007ff979d9ce59
> RDX: 0000000000018ff8 RSI: 0000200000009b80 RDI: 0000000000000003
> RBP: 00007ff979e32d6f R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007ff97a016038 R14: 00007ff97a015fa0 R15: 00007ffc1552e588
>  </TASK>

It should be fixed by the following patch:

https://lore.kernel.org/linux-block/20260930042335.16199-1-zcgao@amazon.com=
/





Thanks,
Ming Lei
