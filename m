Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876991;
	b=tz8mmAswyTKgbVu+agGKu2rmKjZt+flLIZNTgRma50gCTI8xse4pgpntTTezZZ7Z0Umn
	 iSHVzLuo+hmvtVamXFsetbuht5C3BqGEcHcVMOQKbJW6/+crOuGad9eo0J1/ynZwf/mUK
	 N/8VMCYzGWfPUpncRwvnYX32lYZZoxo+ctKCekHMuwzPVxG0vR0+kdqzONURcfm/eMSyT
	 M+P7NJRzzFWcIFyQgGNV0LfhWvsyjb7TnnougRjbBjlyOy7B7hdKlLE+jmnNIVPrCLScI
	 dIlCm1DOPrarqXthcAg8l/2qoxTG4cUzBBRxHhiMCYE68DMUr/pQGSGWy89Ac8G7r4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876991;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=2mzSncyLiCCpBuVh9cHsNjJYP8RhSnLPc15EH0wBTgQ=;
	b=ykZ1Y78wUem4xfxn1u3up0VYbOEBhi5oPz//E5bANo/USfulv6H8qwzZBQ1zUxjA3uLq
	 zutdRAIbW98glKgZ3ZK6SQFCS4jsz/KxtMOXVd8LrzZ/JWtEr59m1onmbBgBmkTcgiO8t
	 ezhYTo4/p8hggVEyv5lzaj2Q29J+FfwIvzIB1ijdIyh3Qz0d5C5fPkjVDUzgqDmN+XCAB
	 dEq4iVAca/Llduj2ShQtHhBac2HWZyb3hECXu6fYiVOP51Fk4UsjBzmBhxn0NhFVovUDW
	 I0y+ZFTOFWUYrBT1GA+ac8oYpWs2udWV/MfmN0+G1F/L3/znatChUurX4e7HJGMSWFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.161.71
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB63606A33F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB63606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6f538c3453fso629799eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876990; x=1794481790;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2mzSncyLiCCpBuVh9cHsNjJYP8RhSnLPc15EH0wBTgQ=;
        b=ZyxLHxKo/m5WJ2inT1YcRu/wKSISxAG1H1gKz3d+Y+aP854GXzHPB6V3xq24F40gvz
         Z4L/qbn2ZJCNaqhc5oB0+hW9TvvfB+TE69Q+6+K8YcKyo7L/va/+NDzahZ9OVQ+iCZeW
         cxWciu4t93htcvZf62N4aDWnvyoEmxGTNo4ArN1TFPiUaLv60mD8pmx89Oj5wXYQRJ9m
         8YrLmueWWbg6TSCg2SFCdfqZmIWeTjj3Vz1JUaPR3rD9dNlYf4XYCbUtCw9bf1tr/5ue
         VNq/7OjPsXgWYcuFKxLRIDFblYACUkrhnRekbPQ3rHZpPaPyCwXqjWYFpRAdlnrgBcWZ
         Tprw==
X-Gm-Message-State: APuU4Z963CYC6rMqUekALAeITyMaMtOGKJ5AjPF7VJp1rjm4hTE26BH3
	fGlEnz38T6yEhco7R5oIgISLoANnB30UJRDCbrkuQqOS1BXgyDf2KM+FdAz3jvnpqwK0P6Pboh1
	6uhAXgjDmu+222Ovor40DmDnW39iVejxUsk/f+BLzXZ5/T1LY64wn5X7+FJU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2d0c:b0:713:d536:1d33 with SMTP id
 006d021491bc7-716d221fc3amr1108775eaf.46.1793876989893; Thu, 05 Nov 2026
 03:09:49 -0800 (PST)
Date: Thu, 05 Nov 2026 03:09:49 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aec63fd.5f5735a5.290c1c.0003.GAE@google.com>
Subject: [syzbot] BUG: spinlock already unlocked in corrupted
From: syzbot <syzbot+b29ed72382b0e218323a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    03897066069f tipc: raise the minimum bearer MTU to fit tun..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10c2fca1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d30e1495ee3ac817
dashboard link: https://syzkaller.appspot.com/bug?extid=b29ed72382b0e218323a
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17f95969580000

AI-generated root cause summary:
In drivers/block/nbd.c, nbd_add_socket() retrieves a user-supplied socket fd via
nbd_get_socket() and invokes nbd_reclassify_socket(sock) to assign NBD-specific
lockdep classes to the socket. When CONFIG_DEBUG_LOCK_ALLOC is enabled,
nbd_reclassify_socket() performs an unsynchronized check
sock_allow_reclassification(sk) and calls sock_lock_init_class_and_name(sk,
...), which is an initialization macro that not only sets lockdep keys but also
resets sk->sk_lock.owned to 0, reinitializes sk->sk_lock.wq, and calls
spin_lock_init(&sk->sk_lock.slock). Because userspace retains the socket fd,
concurrent socket operations (such as inet_shutdown() calling lock_sock() or
release_sock()) can acquire sk->sk_lock.slock immediately after the check;
spin_lock_init() then reinitializes the active lock to the unlocked state,
causing debug_spin_unlock() to trigger a "BUG: spinlock already unlocked" kernel
panic.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=b29ed72382b0e218323a

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b29ed72382b0e218323a@syzkaller.appspotmail.com

Warning: Permanently added '10.128.0.74' (ED25519) to the list of known hosts.
[*] Starting reproducer for BUG: spinlock already unlocked in inet_shutdown...
[+] Detected 2 online CPUs.
[+] open /dev/nbd0 successful (fd=3).
[+] open /dev/nbd1 successful (fd=3).
[+] open /dev/nbd2 successful (fd=3).
[+] open /dev/nbd3 successful (fd=3).
[+] open /dev/nbd4 successful (fd=3).
[+] open /dev/nbd5 successful (fd=3).
[+] open /dev/nbd6 successful (fd=3).
[+] open /dev/nbd7 successful (fd=3).
[+] open /dev/nbd8 successful (fd=3).
[+] open /dev/nbd9 successful (fd=3).
[+] open /dev/nbd10 successful (fd=3).
[+] All 11 NBD devices initialized and verified.
[+] Server socket created.
[+] setsockopt(SO_REUSEADDR) successful.
[+] Server socket bound to 127.0.0.1.
[+] getsockname successful (port=43427).
[+] Server socket listening.
[+] Client socket created.
[+] Client socket connected.
[+] Accepted client connection on server.
[+] Server listening socket closed.
[+] Accepted peer socket closed (peer EOF).
[+] setsockopt(SOL_TCP, TCP_REPAIR, TCP_REPAIR_ON) successful.
[+] Shared TCP socket ready (fd=4).
[+] Started 5 reclassifier threads on devices 0..4.
[+] Started 6 runner threads on devices 5..10.
[+] Started disconnector thread.
[*] Racing NBD_SET_SOCK against NBD_DO_IT (recv_work) and inet_shutdown...


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
