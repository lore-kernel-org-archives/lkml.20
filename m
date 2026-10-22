Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792688552;
	b=neSNSii1wGjduzWqYWfJvhN4yB219sxSpTMwaK+lv0K0DGzNl0SWzfj1ON/Vg/IHnKd0
	 xBKmpCt64QRdSEHuBlQOUHgIAKCCKHIy/oayfcmOVjDr4ox7X/PBo8ihqz7kHMMnrDsik
	 rE31/4yqNbiL3e4jLv89jW9eZSyV6LAGIaBVoPd92RWshclvjry5RZLnqDk97aRem1vKt
	 qB7dShqh4lSGKik1SK7q71yo6qRmU/sToWPpOpCGLYzB8OV2W6ibrHsiNTC8fK5K9lFgW
	 +65W1lmYx2njjg3McTQylTuw18kdPcqe7bsWGzg3ZsYF+fmg+tvBNj695gOwEVvZ0oQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kSWxRjaE/IbCSPMaNuU9AixW3+O1lzhb2zsYAgN97Mw=;
	b=yhUkLznH91/aGLIer8SORBiAKPB/Oc3g/RMrMCnc28TqNoklgF3M1GOQWEibA4gI9IT2
	 xrW0UkI1VDl0afhul90sNmhjkk7L1xH/OfygSN0k+wZIX0bf9XdORb3rkZKrWK6GBTVWN
	 G+eEPTUJOgMOaPG5LNY1hKIferOVMpbzDFsdiPIObZKpL9IFziXcKvrk+fZEOJ5/77vOE
	 bz/Rqyy686pW9d+Aqh/84qnDN7O8UM8tnHtRIyatiL3o9UzAeXSmvx3FWvxh6ZWEe2G6x
	 LiNSHjycrCcKkemJBurxxWNVbKalluTJTa+5V8L3eC0Ws0bSJmU9Pw6kxqb9jXM3F+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bL2KxbVP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC00B606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC00B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bL2KxbVP
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eafb65e163so55866e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792688551; cv=none;
        d=google.com; s=arc-20260327;
        b=fIIkqjnsrN5S5Qlxy215OBPX3xiSFcO20xh/Qu//KqPrdD3aLdoF2XmGvOP0doifrJ
         HYZVs5wm9/WlGSinZT9YVUsePzNgdR5XoW56ADsdCVhcWBXQssTm2efHUY7rplYIAAPF
         pchKYTlCTBOV/vzjZLiYjEQqb2s9Mu79Ji5JtpMCiUW7BAuKgyFX1JVjaScP/IrbUlus
         TpmCi3JaVze4k4IrxPeXxwVBlAkdOglpRe6Gzx46CJUoEiwcLErjeoOChwuDjFiPrkAd
         aEM4F6bk6JZYdeqH3Pt8D8Q11Pd5L0px7jejPw6fZblUhbKncqZSIKCwSJkwEQkr3cEP
         lHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kSWxRjaE/IbCSPMaNuU9AixW3+O1lzhb2zsYAgN97Mw=;
        fh=hbR59LJnCAyMLTwBZv1caXRtu1LLT1nDC4GzCULMEEw=;
        b=ihdM3Bw/vKmgF8uLHQQxHnjhWEVBQ6350aSnDFYiRVV/ve6f2rI47kvJ6H83oQorXb
         6U6GkEAPFF3sRNR1RhxTZ+yevRdhUxcZz9CpkCR7wZFeiMzF3WFwAN9IUlJbUFj4bnt9
         LSNQV4GcBLu/GG7cd78WGuaSlfVHi/0XMCri5iiAtc+ETjnYqFAZi5ayIpL144chCuPP
         XwY0pZyTe3FaLceeaqgyNxVsEyHEb2RVX5YeHG8MORNUjOyOEQnzoYrtFcVhM1q7wPHz
         T+VuviI5ohqQkUi0H2iuJkCdsOgx6MZSIhRbFKRoRLfKMaDN7mUQDBizcYDe+kdA0wiB
         d/rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792688551; x=1793293351; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSWxRjaE/IbCSPMaNuU9AixW3+O1lzhb2zsYAgN97Mw=;
        b=bL2KxbVP9vJXHCaLh07m4xx/lCLFALTPsNyJ2XYD8QvTEBVm+8P8ssFZj3w0RKWQE8
         gxTxQ6OqJYdkrO8jB9C0p3oyjqyWGfFuV0I8D4EG3DxE+e/9MbTWn5JvjowPqYMzlyBG
         J3QmLYIwFbmohWkRIEX1dVxFy0RJlgXctETERcOfbImA2sz1EpNjy6plK+tLpjm1+2D/
         d3NK9es0sgtr/2QleNIMSh2s0AaL53i6Z0ARxkxKOfl8VmNOBqwteUDGzls8INyddhHv
         d0aMT0xVBKLoidLyyzmufwhIkIZBo1MezEgYkxHxy0fEYuppLbB/qM4AMy/iP8u14ClB
         qyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688551; x=1793293351;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kSWxRjaE/IbCSPMaNuU9AixW3+O1lzhb2zsYAgN97Mw=;
        b=KX9ovJZRTiDGu1Iw4QUr4svm7Qg1NHsJbngDFufecEoD0Pl2u73GxHJR+zY8udnu8B
         tyMqX/ZjLHKDGZxBJTxDbUp7vtRg0xIBAT0hi1l7GpJNBZ/Y00SiSN6W9QN4CNEBX4iw
         urZT0U8291DFPfcEqEgjh3EdaLK7rvxU4cQVDlzQn7vcoWTayo20qgQ4anh+SxuHIgWs
         WuqKP/rRt0m7olZRTDhcf0xQeINYkX+146NEyIicfSRG4MrkXpgCvs6eAdDni7PVfnwx
         CdtXdzcrywerZKr201m1u8i5zMg8GDjIPHpwBc9R2AcOfnQN7pV2low90yPd+GdMk9t6
         HW7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxOtQu3GXn/X1UXCT5tWatRdTPT/UcVykfZk4ldnaqVCvG3EIbf8W+FM2uZ5lyG5GV8T6MTSxbsLiG2s00=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvqY2WqkebSIuKUKn+0JXnXy8zCmsvAL7S2cCol2xww8YZ4Vv/
	MkSAd9KXJmI0TEfJEKteavrMDtlfp0AnxyYEAsOCFN1mKjQwh0Scw7S07kuNBE9VtgA9CBhUPxS
	qjD5jOjS26hOf5A4sK5UpytBglXIy3zu8zwCn6KY6mQ==
X-Gm-Gg: AYBFou1VsGh0RCoeaW7Z/Lyh72JJ/3A5WGK8ANbsyW70V0eQJVj5FSnuQrynNc8urUa
	CZINQ3d9rwd7iY0PWW6rVAIWdg9oya2YxHztKQ0GGW8Y+EGXXJyuTUR8W4Ckx+MGruqgF2Id7RE
	gknyTh8ryIYM2z2SGgGf6hx1w0kH/JPl3PsDMeHHqAohvXepOx3U8DSJRrh8iZsZ2Z2uqpfbzAJ
	mmXkLHBkcr/p4rNeTpGcb5e6IQxpJKipHki/x4nCLcZ98VRdNF3KofznPYHtBMfJVE9UYJOZv9d
	AnINnMqRsyApTYJZ1xRDJVaBHho20H9jiw2je7QLSHUozt5V0I9v+9EMJzdRw07hHBAkbQfvvmw
	ZWNkzNqjdqJpnPV/VOs0U0fvtwq3ridLBhJzasRhTQQYzIT12RCoDAd2PHvH9g7YyMN6Xdg==
X-Received: by 2002:a05:6122:1b8e:b0:5ea:9a2c:27a8 with SMTP id
 71dfb90a1353d-5eaebe4278cmr2430756e0c.14.1792688550608; Thu, 22 Oct 2026
 10:02:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6aa9c7f8.a211d2ce.1a5198.02b5.GAE@google.com> <6ada3d82.d1c214cc.659fa.00db.GAE@google.com>
In-Reply-To: <6ada3d82.d1c214cc.659fa.00db.GAE@google.com>
From: mixalhs <mike.michalo@gmail.com>
Date: Thu, 22 Oct 2026 19:02:18 +0200
X-Gm-Features: AclHuK8O7NwRbWIfFzmBEJxz6JrwfkQQtk4I4dUTZ1jjiRYQl1sxYC0LmHe1Uj0
Message-ID: <CAO+rqLgLRszT2U_x49hYVULuJ6Lm-80EdokzQUyNO_mECKEvKA@mail.gmail.com>
Subject: Re: [syzbot] [netfilter?] WARNING in nf_flow_table_extend_ct_timeout
To: syzbot <syzbot+521f7e7e2b974abde99a@syzkaller.appspotmail.com>
Cc: coreteam@netfilter.org, davem@davemloft.net, edumazet@google.com, 
	edumazet@kernel.org, fw@strlen.de, horms@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, pabeni@redhat.com, pablo@netfilter.org, 
	phil@nwl.cc, stable@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: multipart/mixed; boundary="00000000000040a347065e70d4ec"

--00000000000040a347065e70d4ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git mai=
n

On Thu, Oct 22, 2026 at 6:44=E2=80=AFPM syzbot
<syzbot+521f7e7e2b974abde99a@syzkaller.appspotmail.com> wrote:
>
> syzbot has found a reproducer for the following issue on:
>
> HEAD commit:    abeacca61eea Merge branch 'net-mlx5-hws-fix-modify-header=
-..
> git tree:       net
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=3D111f4d0d58000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dc4b098695335c=
89f
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D521f7e7e2b974ab=
de99a
> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.=
8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1491e029580=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D157d410d58000=
0
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/22930d0e9391/dis=
k-abeacca6.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/d2e18d51f288/vmlinu=
x-abeacca6.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/69879bb16225/b=
zImage-abeacca6.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+521f7e7e2b974abde99a@syzkaller.appspotmail.com
>
> ------------[ cut here ]------------
> 1
> WARNING: net/netfilter/nf_flow_table_core.c:553 at nf_flow_table_extend_c=
t_timeout+0x1ee/0x2f0 net/netfilter/nf_flow_table_core.c:553, CPU#1: kworke=
r/1:2/123
> Modules linked in:
> CPU: 1 UID: 0 PID: 123 Comm: kworker/1:2 Not tainted syzkaller #0 PREEMPT=
(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 10/07/2026
> Workqueue: events_power_efficient nf_flow_offload_work_gc
> RIP: 0010:nf_flow_table_extend_ct_timeout+0x1ee/0x2f0 net/netfilter/nf_fl=
ow_table_core.c:553
> Code: 00 00 00 41 83 ff 06 0f 84 9a 00 00 00 41 83 ff 05 0f 85 b0 00 00 0=
0 e8 e0 10 a9 f7 41 bf 30 75 00 00 eb 0f e8 d3 10 a9 f7 90 <0f> 0b 90 41 bf=
 01 00 00 00 48 c7 c0 80 f2 a0 8f 48 c1 e8 03 42 80
> RSP: 0018:ffffc90002dcf930 EFLAGS: 00010293
> RAX: ffffffff8a1effad RBX: ffff888027a52900 RCX: ffff88801ffa1f40
> RDX: 0000000000000000 RSI: ffffffff912fa640 RDI: 000000000000002f
> RBP: 0000000000000737 R08: ffff88801ffa1f40 R09: 0000000000000002
> R10: 0000000000000011 R11: 0000000000000000 R12: dffffc0000000000
> R13: 1ffff11004f4a538 R14: ffff888027a52948 R15: 000000000000002f
> FS:  0000000000000000(0000) GS:ffff888123bbd000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f926bd5bd3c CR3: 000000000fb48000 CR4: 00000000003526f0
> Call Trace:
>  <TASK>
>  nf_flow_offload_gc_step+0x5aa/0x840 net/netfilter/nf_flow_table_core.c:5=
93
>  nf_flow_table_iterate+0x13c/0x1f0 net/netfilter/nf_flow_table_core.c:459
>  nf_flow_table_gc_run net/netfilter/nf_flow_table_core.c:616 [inline]
>  nf_flow_offload_work_gc+0x22/0x70 net/netfilter/nf_flow_table_core.c:624
>  process_one_work kernel/workqueue.c:3396 [inline]
>  process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
>  worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
>  kthread+0x38b/0x480 kernel/kthread.c:436
>  ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
>
>
> ---
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.

--00000000000040a347065e70d4ec
Content-Type: application/octet-stream; 
	name="0001-netfilter-flowtable-extend-ct-timeout-of-offloaded-G.patch"
Content-Disposition: attachment; 
	filename="0001-netfilter-flowtable-extend-ct-timeout-of-offloaded-G.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvjsgn1g0>
X-Attachment-Id: f_mvjsgn1g0

RnJvbTogTWljaGFpbCBBbmRyZWFzIE1pY2hhbG9wb3Vsb3MgPG1pa2UubWljaGFsb0BnbWFpbC5j
b20+ClN1YmplY3Q6IFtQQVRDSCBuZl0gbmV0ZmlsdGVyOiBmbG93dGFibGU6IGV4dGVuZCBjdCB0
aW1lb3V0IG9mIG9mZmxvYWRlZCBHUkUgZmxvd3MKClNpbmNlIGNvbW1pdCAwMzQyOGNhNWNlZTkg
KCJuZXRmaWx0ZXI6IGNvbm50cmFjazogcmV3b3JrIG9mZmxvYWQgbmZfY29ubgp0aW1lb3V0IGV4
dGVuc2lvbiBsb2dpYyIpLCB0aGUgZmxvd3RhYmxlIGdjIHdvcmtlciBleHRlbmRzIHRoZSB0aW1l
b3V0Cm9mIGFuIG9mZmxvYWRlZCBjb25udHJhY2sgZW50cnkgZnJvbSBuZl9mbG93X3RhYmxlX2V4
dGVuZF9jdF90aW1lb3V0KCkKb25jZSBpdCBmYWxscyBiZWxvdyA1IG1pbnV0ZXMuIFRoYXQgZnVu
Y3Rpb24gb25seSBrbm93cyBhYm91dCBUQ1AgYW5kClVEUCBhbmQgaGl0cyBXQVJOX09OX09OQ0Uo
KSBmb3IgYW55IG90aGVyIGxheWVyIDQgcHJvdG9jb2wuIEhvd2V2ZXIsCkdSRSBmbG93cyBjYW4g
YmUgb2ZmbG9hZGVkIHRvbywgYm90aCB2aWEgbmZ0X2Zsb3dfb2ZmbG9hZCBhbmQgYWN0X2N0LApz
aW5jZSBjb21taXQgNGU4ZDk1ODRkMTU0ICgibmV0ZmlsdGVyOiBmbG93dGFibGU6IFN1cHBvcnQg
R1JFIikuCgpUaGUgdGltZW91dCBvZiBhbiBvZmZsb2FkZWQgR1JFIGVudHJ5IGRyb3BzIGJlbG93
IHRoYXQgdGhyZXNob2xkIGFzIHNvb24KYXMgYSBwYWNrZXQgb2YgdGhlIGZsb3cgc3RpbGwgZ29l
cyB0aHJvdWdoIGNvbm50cmFjay4gV2l0aCBpcDZncmUKdHVubmVscyB1c2luZyB0aGUgZGVmYXVs
dCBlbmNhcHN1bGF0aW9uIGxpbWl0IHRoaXMgaXMgb3JkaW5hcnkgdHJhZmZpYzoKdGhlIGZsb3d0
YWJsZSBkb2VzIG5vdCBwYXJzZSB0aGUgRGVzdGluYXRpb24gT3B0aW9ucyBoZWFkZXIgaW4gZnJv
bnQgb2YKR1JFLCBzbyBldmVyeSBwYWNrZXQgb2YgdGhlIGZsb3cgdGFrZXMgdGhlIGNsYXNzaWMg
Zm9yd2FyZGluZyBwYXRoLiBJdAphbHNvIGhhcHBlbnMgZm9yIGEgcGFja2V0IHdpdGggdHRsIDw9
IDEsIHdoaWNoIHRoZSBmbG93dGFibGUgZmFzdCBwYXRoCnBhc3NlcyB1cCB0byB0aGUgY2xhc3Np
YyBmb3J3YXJkaW5nIHBhdGguIG5mX2Nvbm50cmFja19ncmVfcGFja2V0KCkgdGhlbgpyZWZyZXNo
ZXMgY3QtPnRpbWVvdXQgdG8gdGhlIEdSRSBzdHJlYW0gdGltZW91dCAoMTgwIHNlY29uZHMgYnkg
ZGVmYXVsdCksCmFuZCB0aGUgbmV4dCBnYyBydW4gdHJpZ2dlcnMsIGFzIHJlcG9ydGVkIGJ5IHN5
emJvdDoKCiAgV0FSTklORzogbmV0L25ldGZpbHRlci9uZl9mbG93X3RhYmxlX2NvcmUuYzo1NTMg
YXQgbmZfZmxvd190YWJsZV9leHRlbmRfY3RfdGltZW91dCsweDFlZS8weDJmMAogIFdvcmtxdWV1
ZTogZXZlbnRzX3Bvd2VyX2VmZmljaWVudCBuZl9mbG93X29mZmxvYWRfd29ya19nYwogIENhbGwg
VHJhY2U6CiAgIG5mX2Zsb3dfb2ZmbG9hZF9nY19zdGVwKzB4NTQ1LzB4N2IwCiAgIG5mX2Zsb3df
dGFibGVfaXRlcmF0ZSsweDEzYy8weDFmMAogICBuZl9mbG93X29mZmxvYWRfd29ya19nYysweDIy
LzB4NzAKICAgcHJvY2Vzc19zY2hlZHVsZWRfd29ya3MrMHhjM2QvMHgxNjMwCiAgIHdvcmtlcl90
aHJlYWQrMHhhNDcvMHhmYjAKICAga3RocmVhZCsweDM4Yi8weDQ4MAoKQmVzaWRlcyB0aGUgc3Bs
YXQsIHdoaWNoIHBhbmljcyB0aGUgbWFjaGluZSB3aXRoIHBhbmljX29uX3dhcm4sIHRoZQpkZWZh
dWx0IGJyYW5jaCBzZXRzIHRoZSBuZXcgdGltZW91dCB0byAxIGppZmZ5LCBzbyB0aGUgY29ubnRy
YWNrIGVudHJ5CmV4cGlyZXMgcmlnaHQgYXdheSBhbmQgdGhlIG9mZmxvYWRlZCBmbG93IGlzIHRv
cm4gZG93bi4KCkhhbmRsZSBHUkUgbGlrZSBVRFAgYW5kIGV4dGVuZCB0aGUgdGltZW91dCB0byBO
Rl9DVF9EQVkuIEdSRSBjb25udHJhY2sKaGFzIG5vIHByb3RvY29sIHN0YXRlIHRvIHRha2UgaW50
byBhY2NvdW50LCBhbmQgTkZfQ1RfREFZIGlzIGFsc28gd2hhdApmbG93X29mZmxvYWRfYWRkKCkg
YWxyZWFkeSBzZXRzIGZvciBldmVyeSBvZmZsb2FkZWQgZW50cnksIEdSRSBpbmNsdWRlZC4KVGhp
cyBhbHNvIHJlc3RvcmVzIHRoZSBiZWhhdmlvdXIgZnJvbSBiZWZvcmUgY29tbWl0IDAzNDI4Y2E1
Y2VlOSwgd2hlbgp0aGUgY29ubnRyYWNrIGdjIHdvcmtlciBleHRlbmRlZCBvZmZsb2FkZWQgZW50
cmllcyBvZiBhbnkgcHJvdG9jb2wgdG8KTkZfQ1RfREFZLgoKRml4ZXM6IDAzNDI4Y2E1Y2VlOSAo
Im5ldGZpbHRlcjogY29ubnRyYWNrOiByZXdvcmsgb2ZmbG9hZCBuZl9jb25uIHRpbWVvdXQgZXh0
ZW5zaW9uIGxvZ2ljIikKUmVwb3J0ZWQtYnk6IHN5emJvdCs1MjFmN2U3ZTJiOTc0YWJkZTk5YUBz
eXprYWxsZXIuYXBwc3BvdG1haWwuY29tCkNsb3NlczogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3Bv
dC5jb20vYnVnP2V4dGlkPTUyMWY3ZTdlMmI5NzRhYmRlOTlhCkNjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnCkFzc2lzdGVkLWJ5OiBMTE0KU2lnbmVkLW9mZi1ieTogTWljaGFpbCBBbmRyZWFzIE1p
Y2hhbG9wb3Vsb3MgPG1pa2UubWljaGFsb0BnbWFpbC5jb20+Ci0tLQogbmV0L25ldGZpbHRlci9u
Zl9mbG93X3RhYmxlX2NvcmUuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpkaWZmIC0tZ2l0IGEvbmV0L25ldGZpbHRlci9uZl9mbG93X3RhYmxlX2NvcmUuYyBiL25ldC9u
ZXRmaWx0ZXIvbmZfZmxvd190YWJsZV9jb3JlLmMKaW5kZXggMzZiYmM3YmUyZi4uOTQ1MDJjOTdi
YSAxMDA2NDQKLS0tIGEvbmV0L25ldGZpbHRlci9uZl9mbG93X3RhYmxlX2NvcmUuYworKysgYi9u
ZXQvbmV0ZmlsdGVyL25mX2Zsb3dfdGFibGVfY29yZS5jCkBAIC01NDQsNiArNTQ0LDcgQEAgc3Rh
dGljIHZvaWQgbmZfZmxvd190YWJsZV9leHRlbmRfY3RfdGltZW91dChzdHJ1Y3QgbmZfY29ubiAq
Y3QpCiAKIAkJc3dpdGNoIChsNHByb3RvKSB7CiAJCWNhc2UgSVBQUk9UT19VRFA6CisJCWNhc2Ug
SVBQUk9UT19HUkU6CiAJCQluZXdfdGltZW91dCA9IE5GX0NUX0RBWTsKIAkJCWJyZWFrOwogCQlj
YXNlIElQUFJPVE9fVENQOgotLSAKMi40My4wCg==
--00000000000040a347065e70d4ec--
