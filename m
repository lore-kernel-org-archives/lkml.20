Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372663;
	b=zIEayphMCbvyEdCP6kTZlZjMYGldE+K7mXVrXxqKXQON6Kv4YacW/VVxF8T00ZX6e4SC
	 43UcLS4h+YM/yMztxnyoZWPH1kgj3aU6Zz/0FO4DJMrXe1waR4WF2INkDOUt6Gc4SVIXA
	 VRjnA/VsGXQx95C89edaWv1lJZ1kskkW08uWedrHd2dtWnGoBUasIMd6XXC3qm6Jr5oT4
	 v6EG9XjVGON/qpEejTM/OYBEjtP66Q8kUEgJIoEe8LvLhexN6ovFssyf5xoy+l0wyggJ6
	 hI4+aqi1F//++7l6F7kxJrH7VQ60VIAKtL9L3PwoYiZIn4bJ73K5/w59t66bqGZAbrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372663;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=/F39+d5jm7TvFntDuZ/rqZMu1N7lCVM5pP/2Xlm8kik=;
	b=j8LZQId7qjkGGMCC4ahg6I9lZNGIrN6i6+1xF+EADHsL57PLT2OBRTKCDEi90g1Z+62m
	 rD14PAX2UYFHmnDgD9xU+M8bdYuyam3XUFF1srvkSTTvW8fY9QUOZaNOXXFwyYF1eyL1a
	 LYDnkJSc9icuTwH2SuKSZKs5B1CfD1/M0HfyRNOU/xqTl/+wogdSsRA13WvHDRwAB1B3N
	 7C9xl8YZv8sg+tPUfXqxML5UKSdFqe7zlDXXgToQY7/fxXNBafgQtDySMPvvTcGMmb1v0
	 FhMNh6gJeIQK3Ca1SR4HUY9Zp/au9tKObJKjycTkwlk3o/SuODPiUNnCkuxlJaW3XEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B9A606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B9A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a7de733fa9so3285248b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:51:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794372662; x=1794977462;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/F39+d5jm7TvFntDuZ/rqZMu1N7lCVM5pP/2Xlm8kik=;
        b=VJlNgEk7ZibSHusStgTe6L0gDbKQ6nG22XNWRzvdbjrFc9sSdHciaJLgowlt74quHi
         BsKP6n/DQe41iLRpgU9g46z743kl/BuEO4aGF2p3iRx2imJmCDYfty0g5hTtTud0+TCR
         HZjvzs3XjsHIGwUIibsJHQICGWbJ5B+lNUyZ1NH32UtavoGrljnBYCXBexmMxg0df3B4
         Kefd3vv13Hx5CaSLahdeG82jlu42ip7VjUiyz2UnhX5xrm1u9giuIpTNsIV+CmXlk+hE
         YhdW0UOzhyqDxXXe+9yZnm4ayZo8K3BcWyzhl6RIP/UV1eg0veKFGpuE1gN3sA0EZuya
         xWZA==
X-Gm-Message-State: APuU4Z89XGFn1Yvk59UtYNMSgMLktYMsuhzz9PrQhqKqBxlnohcCUEoa
	dmgyutrLJCUgfWyuvwf3PjgXb9tsxn9ii8o5WTSXxMfztEhp4Y8FHJNfEzaNwPr1t8GDfmt6es2
	r++oyqBpz2W/ZrlXE5PMi8MmHgCFfrtj2NorxWHspwQFCnFKeiG57V7ge1uE=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:13c1:b0:53a:2f73:29ff with SMTP id
 5614622812f47-56b9325050bmr1121814b6e.6.1794372661873; Tue, 10 Nov 2026
 20:51:01 -0800 (PST)
Date: Tue, 10 Nov 2026 20:51:01 -0800
In-Reply-To: <CAO7_G+xSmFavmMUAKYcLVBFaDt4okxAFx0XZT5t-3v=hULmO5w@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af3f435.926a6ce0.263fd.019a.GAE@google.com>
Subject: Re: [syzbot] [block?] BUG: unable to handle kernel paging request in blk_mq_complete_request_remote
From: syzbot <syzbot+2e3bf0bd49acd9b21d4b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nenkov2004@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: unable to handle kernel paging request in tomoyo_realpath_from_path

Unable to handle kernel paging request at virtual address dfff80000000000c
KASAN: null-ptr-deref in range [0x0000000000000060-0x0000000000000067]
Mem abort info:
  ESR = 0x0000000096000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0
[dfff80000000000c] address between user and kernel address ranges
Internal error: Oops: 0000000096000005 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 5306 Comm: syz-executor Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : tomoyo_realpath_from_path+0x1a0/0x4dc security/tomoyo/realpath.c:265
lr : tomoyo_realpath_from_path+0x140/0x4dc security/tomoyo/realpath.c:257
sp : ffff800093a67510
x29: ffff800093a67540 x28: ffff0000c39b8fff x27: dfff800000000000
x26: 0000000000000fff x25: 0000000000000060 x24: 0000000000001000
x23: 1fffe0001e436caf x22: ffff0000d3d16090 x21: ffff0000c39b8000
x20: ffff0000f21b64e0 x19: ffff0000d3d16050 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000001
x14: 00000000ffff8000 x13: 00000000ac727a19 x12: ffff800080021608
x11: ffff800080021608 x10: 0000000000000003 x9 : 0000000000000000
x8 : 000000000000000c x7 : 0000000000000000 x6 : 000000000000003f
x5 : 00000000ffffffff x4 : 0000000000000c40 x3 : 0000000000002000
x2 : 0000000000001000 x1 : ffff0000c8e2bb00 x0 : 0000000000000000
Call trace:
 tomoyo_realpath_from_path+0x1a0/0x4dc security/tomoyo/realpath.c:265 (P)
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_check_open_permission+0x1c4/0x394 security/tomoyo/file.c:776
 tomoyo_file_open+0x78/0xcc security/tomoyo/tomoyo.c:334
 security_file_open+0xbc/0x258 security/security.c:2760
 do_dentry_open+0x2a0/0xfb4 fs/open.c:977
 vfs_open_consume+0x54/0x2ec fs/open.c:1131
 do_open fs/namei.c:4851 [inline]
 path_openat+0x1098/0x1910 fs/namei.c:5016
 do_file_open+0x1c8/0x2e8 fs/namei.c:5045
 do_sys_openat2+0x114/0x1ec fs/open.c:1442
 do_sys_open+0xb0/0xe0 fs/open.c:1448
 __do_sys_openat fs/open.c:1464 [inline]
 __se_sys_openat fs/open.c:1459 [inline]
 __arm64_sys_openat+0xa8/0xc4 fs/open.c:1459
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:816
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
Code: 97d64865 f9400328 91018119 d343ff28 (387b6908) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	97d64865 	bl	0xffffffffff592194
   4:	f9400328 	ldr	x8, [x25]
   8:	91018119 	add	x25, x8, #0x60
   c:	d343ff28 	lsr	x8, x25, #3
* 10:	387b6908 	ldrb	w8, [x8, x27] <-- trapping instruction


Tested on:

commit:         58c1eb84 arm64: sdei: Preserve the interrupted context..
git tree:       https://github.com/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=141d05a1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a58b6b4d667e7a61
dashboard link: https://syzkaller.appspot.com/bug?extid=2e3bf0bd49acd9b21d4b
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1141b4c3580000

