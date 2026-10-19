Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433325;
	b=Fms0+wda0TL8Bd5jOa/HRzughhJQL+1NZlxYZPtL/wuTUQ1M4DGP2o4Ve4qMaPde/XA5
	 67q3CpKDFF7usa9Fy9Q/bIKl7EgytNUyt5u/95MCLZZR78tHxSoU/krqz9ieBhC1Nw5Jy
	 y9CcKhBXvWJYQcDGMpPZU4B0FlZHRc7GuZpsy9A8Ifo9/a4muyZ2Q2G/WjRSjLgFhsdEE
	 KpBOWe4xJmyTDOiEDGbPtGzXv2vZ1/1a11Zs8ERRwHQNbL3p9Zap4k+32tvdFNRtfJQWl
	 SN8u1+7YFZDWTekE+pmuYyd62zaymEo6jj46uu2CyKaiFLO6ZRCFkeHE1ZFPlecWyiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433325;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=VcXvIGPI53/tg0EQYuNzymEQva+C8AhvooOxwIZVIWc=;
	b=3f4pp+S6dGRAmARx5A1XQDs3IExcTNtZPQjina2q7LRvbjtPx1bU1maq21qQPlFkLNWo
	 UqqgOzjUjdUutvLHiq3U4JYZ8Y7JvnQILf/HIB5qVqhEFe3Ezq0Gb5qjBKyRusY/U3QVR
	 VpUXq8BqdSBeBvH1BBZDBvjSi6MiSIxIdqtoZObCAFKXAR749L64pZdNHd2O8VrpEEcFX
	 tB0FBHX/La1oHbE3d4qi6QlE19D/AhxRa+uEeKVaiLvK5QJQZWkLM1o/gflrRWvSxxkdb
	 JdVZfKVQ2f3SUVe2xizdlJKmoMiq0yXWNEY0bWJGzIKyFqQOTYeI+N/Z6lwCYLIIi9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75399606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75399606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b597558c4cso4413334b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792433324; x=1793038124;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VcXvIGPI53/tg0EQYuNzymEQva+C8AhvooOxwIZVIWc=;
        b=pPp1ZCf9QMryiO6vLvlkvfR42HouV4DQiMX3m3bBkVUtwmxNpd/rofouTZ/fagCXE4
         JzjmDEpk8Fcf6p92Ep3nsGhb94dZ8eujrBM7z+SoXYCVSy2KHDy4+HfLPXCaz8Pfs6T+
         9ko7A21eslQQFsclYNS+czAi0saIsnkmdGGHNTtv9RfdK2+lK0v3y/heDswL+4yjAzXb
         R1r08waiEhmKGzoaTaqO5ltuTPJJEByr0cJXmByeRbI08vm35oJFGR0AsAh9VgRvSINi
         xU7DSlv4v8MiWTe87GagOT9vOCSyav+wUyAKFoo3zUMtzJSrcVKPx7O/vWBKbCgf9bJ2
         io7g==
X-Gm-Message-State: AFq9FYLrw5dBV5+E3ujxzYifDrrSGEo1y40JuRMluNrLpBbRXu7nnkGj
	bTJCXTbeg4+f29KGfdVsYsz6DZ3Qkc6ZOYUJedbrhNvx577k2/ySJai4FR6PjANNfuOqZDoI4lZ
	xaGspf33XEogws4QNPkbWkgbWWNMQBQJcL8v6q2sTEjEMW1A6n3Mg3XqSNZs=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3197:b0:53a:88c6:96c8 with SMTP id
 5614622812f47-53cd40ba46dmr7583529b6e.55.1792433324523; Mon, 19 Oct 2026
 11:08:44 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:08:44 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad65cac.5a04d468.191e0a.001c.GAE@google.com>
Subject: [syzbot] kernel BUG in create_default_group...
From: syzbot <syzbot+4fae162886e497f72228@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    58161ead29e5 Merge tag 'drm-fixes-2026-10-17' of https://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=103272e1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4ccb65e03706547e
dashboard link: https://syzkaller.appspot.com/bug?extid=4fae162886e497f72228
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=173b8121580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4fae162886e497f72228@syzkaller.appspotmail.com

Warning: Permanently added '[localhost]:19552' (ED25519) to the list of known hosts.
[*] Starting reproducer for kernel BUG in create_default_group...
[+] mkdir /sys/kernel/config successful or directory already exists.
[+] configfs mounted or already mounted.
[+] mkdir /sys/kernel/debug successful or directory already exists.
[+] debugfs mounted or already mounted.
[+] Successfully wrote 'N
' to /sys/kernel/debug/failslab/ignore-gfp-wait
[+] Successfully wrote 'N
' to /sys/kernel/debug/failslab/cache-filter
[+] Successfully wrote '-1
' to /sys/kernel/debug/failslab/times
[+] Pre-clean of /sys/kernel/config/nvmet/ports/1 successful.
[+] Online CPU count: 1
[+] Started 6 background racing helper threads.
[*] Iterating fault injection points (fail-nth 1..80 with concurrent race)...
[*] Testing fail-nth = 1 (1 attempts)...
[*] Testing fail-nth = 2 (1 attempts)...
[*] Testing fail-nth = 3 (1 attempts)...
[*] Testing fail-nth = 4 (1 attempts)...
[*] Testing fail-nth = 5 (1 attempts)...
[*] Testing fail-nth = 6 (1 attempts)...
[*] Testing fail-nth = 7 (1 attempts)...
[*] Testing fail-nth = 8 (1 attempts)...
[*] Testing fail-nth = 9 (1 attempts)...
[*] Testing fail-nth = 10 (1 attempts)...
[*] Testing fail-nth = 11 (1 attempts)...
[*] Testing fail-nth = 12 (1 attempts)...
[*] Testing fail-nth = 13 (1 attempts)...
[*] Testing fail-nth = 14 (1 attempts)...
[*] Testing fail-nth = 15 (1 attempts)...
[*] Testing fail-nth = 16 (1 attempts)...
[*] Testing fail-nth = 17 (1 attempts)...
[*] Testing fail-nth = 18 (1 attempts)...
[*] Testing fail-nth = 19 (1 attempts)...
[*] Testing fail-nth = 20 (1 attempts)...
[*] Testing fail-nth = 21 (1 attempts)...
[*] Testing fail-nth = 22 (1 attempts)...
[*] Testing fail-nth = 23 (1 attempts)...
[*] Testing fail-nth = 24 (1 attempts)...
[*] Testing fail-nth = 25 (1 attempts)...
[*] Testing fail-nth = 26 (1 attempts)...
[*] Testing fail-nth = 27 (1 attempts)...
[*] Testing fail-nth = 28 (1 attempts)...
[*] Testing fail-nth = 29 (1 attempts)...
[*] Testing fail-nth = 30 (1 attempts)...
[*] Testing fail-nth = 31 (1 attempts)...
[*] Testing fail-nth = 32 (1 attempts)...
[*] Testing fail-nth = 33 (1 attempts)...
[*] Testing fail-nth = 34 (1 attempts)...


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
