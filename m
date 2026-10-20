Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508804;
	b=Po9b7p4tAVIPSqPikj1jKUELsScyjIU+fKF/WB+nEXhkOLHmkwpxX91Rmh6Dq0Fc/ElI
	 omKzSs+DKATO82oeFpeJGdpmooEcsup+g2JlFXsU4jju7KzhTN7vq1aPgz9W/yIwjokVd
	 ZISgVi5vULKGb6Km5bEFVNKaWu6IdaP3z+cbA++k0/4qujjpkdFrtypsx7oYXSoZV6G+2
	 x9xOTZxhAF4ifYtSpE5e6Vv8AhqWeNJcz6ipYw/vC1kY0hc8pqoG4WTv30A6dMFdz1b1a
	 klTuw1imAdcCwk4kXstImsNquHuLloboGSxAso/nf4NAofDumpz4VKAolGqWMI7k60w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508804;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WXgcLtnH3/QRdebM6qjvxXL49LbuzPHYRKIwgxv2DlU=;
	b=pjoOET8XQk9Pnd5MbvNnYWQGyjizg5Fykmw68GLj521GNbPHiKVXc5T/m3MUxaCZco0p
	 Ihq5iW6IW2Nb8gLj8WqeMruE+hQKml6v00KlULNn0a1uB+GXsNPczOQxPb36eY9sxSPM/
	 AYDw/RbczSLgpNU6c2cQHjAYPJ/6+CUHqYww7qi4QY80Slc4OZ7XRXfNaUr3bmZajrUzU
	 u6rwVwH4LprKgixwL3TBE+sizNt228HdBlxIk+Mx9HhnIo9QXu4m8J1DRrITLwD0xV+aA
	 qP25IvSeeJ0y+jnpgJfizy/MKpcj7Sn5JtPTy39e6RGnouPw7DNzU5QRUGdkjo+LVHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=GYx71Hnm;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=B7rHR9ik;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F5B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0F5B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=GYx71Hnm;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=B7rHR9ik
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792508786; bh=WXgcLtnH3/QRdebM6qjvxXL
	49LbuzPHYRKIwgxv2DlU=; b=GYx71HnmRD7Pg7uRioGytqBeBIcf1ruNCfZHBy7bdizGsCbyvn
	Al+80ugt+Mum0ZVdiavTB/Yo/hryxMB5RSdYmJt826xMtG0K6996dmQpp3g+JQ/z9RDzKtUyWSr
	nS6kfyy0iGQ+ZJ/Lq6UhQYkMHekOFa1LgpaAFVZ9MuI0WtEdY2NRIL69G6yJ4aDteFv63DggzW6
	/q4EUQwZOKBiId6aPia35wszHXzRJtPCufbNyy1p9vxuHSFIYJFAFsbqE4sGkGA3dY/r+2vai3h
	4U5TC1VCbFMkU189nA9ngb7zEv9o58zl1IDRkNA4mja0tdbbRjjQcGkTZ1rbA5jqDnQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792508786; bh=WXgcLtnH3/QRdebM6qjvxXL
	49LbuzPHYRKIwgxv2DlU=; b=B7rHR9ikhwlNQm5vYZzXn726Rj+YlAbylbHDsJ3tLhN+XWEKxi
	JES/PHom12UVThjlwi3vq2wh/Is4TrvG1bBQ==;
Date: Tue, 20 Oct 2026 16:06:27 +0100
From: Bradley Morgan <brads@mainlining.org>
To: eadavis@sina.com
CC: kernelfans@gmail.com, linux-kernel@vger.kernel.org,
 syzbot+1f0fbc2561b3e5d51b91@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, akpm@linux-foundation.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_kernel/reboot=3A_Avoid_po?=
 =?US-ASCII?Q?tential_deadlocks_during_suspension?=
In-Reply-To: <20261020010559.23031-1-eadavis@sina.com>
Message-ID: <082E174D-618D-4DAF-9CA6-FD953D9194B9@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 20 October 2026 02:05:59 BST, Edward Adam Davis <eadavis@sina.com>
wrote:
>Invoking reboot with LINUX_REBOOT_CMD_SW_SUSPEND causes kernel/reboot.c
>to acquire system_transition_mutex and invoke hibernate(). hibernate()
>calls lock_system_sleep(), which sets PF_NOFREEZE on current and attempts
>to acquire system_transition_mutex again, potentially hitting:
>
>WARNING: possible recursive locking detected
>--------------------------------------------
>syz.3.5755/5950 is trying to acquire lock:
>ffffffff8fc04760 (system_transition_mutex){+.+.}-{4:4}, at:
>lock_system_sleep+0x49/0x70 kernel/power/main.c:71
>
>but task is already holding lock:
>ffffffff8fc04760 (system_transition_mutex){+.+.}-{4:4}, at:
>__do_sys_reboot kernel/reboot.c:774 [inline]
>ffffffff8fc04760 (system_transition_mutex){+.+.}-{4:4}, at:
>__se_sys_reboot+0x223/0x460 kernel/reboot.c:738
>
>other info that might help us debug this:
> Possible unsafe locking scenario:
>
>       CPU0
>       ----
>  lock(system_transition_mutex);
>  lock(system_transition_mutex);
>
> *** DEADLOCK ***
>
> May be due to missing lock nesting notation
>
>locks held by syz.3.5755/5950: 1, last CPU#0:
> #0: ffffffff8fc04760 (system_transition_mutex){+.+.}-{4:4}, at:
> __do_sys_reboot kernel/reboot.c:774 [inline]
> #0: ffffffff8fc04760 (system_transition_mutex){+.+.}-{4:4}, at:
> __se_sys_reboot+0x223/0x460 kernel/reboot.c:738
>
>Call Trace:
> lock_system_sleep+0x49/0x70 kernel/power/main.c:71
> hibernate+0x162/0x680 kernel/power/hibernate.c:784
> __do_sys_reboot kernel/reboot.c:816 [inline]
>
>Move the suspension operation outside the scope protected by lock
>system_transition_mutex.
>
>Fixes: 55f2503c3b69 ("PM / reboot: Eliminate race between reboot and suspend")
>Reported-by: syzbot+1f0fbc2561b3e5d51b91@syzkaller.appspotmail.com
>Closes: https://syzkaller.appspot.com/bug?extid=1f0fbc2561b3e5d51b91

CC akpm:

>Signed-off-by: Edward Adam Davis <eadavis@sina.com>
>---
> kernel/reboot.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/kernel/reboot.c b/kernel/reboot.c
>index 5b9691f45f5f..bc2716677a6c 100644
>--- a/kernel/reboot.c
>+++ b/kernel/reboot.c
>@@ -813,8 +813,8 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
> 
> #ifdef CONFIG_HIBERNATION
> 	case LINUX_REBOOT_CMD_SW_SUSPEND:
>-		ret = hibernate();
>-		break;
>+		mutex_unlock(&system_transition_mutex);
>+		return hibernate();

Well, this fixes the issue in hand, 

Reviewed-by: Bradley Morgan <brads@mainlining.org>


> #endif
> 
> 	default:
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
