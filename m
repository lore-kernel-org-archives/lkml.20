Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794890015;
	b=oiNWnMc8c1mHOXXdSVch4kW+DVNnajuvPZr4fDlgAFG5yqLDr4pJ1mt05hOZymvLKs+i
	 hRNTSVAo83uO57nQsMkrfSIQ7C+o7IlS4GyPoK2ALUUN47JftjAC7CcjvogJq1443z14+
	 G47HymFaYh2lNRnlhbUWQsMzYvfUntiWg907jlOinzVXgL5vzh1qhWy9qF6kE4w2wqz/z
	 y/M0aUK3kP4uR25ab1E9zqXHnBlKrsO8dLrEnkOr4K7hm5tDiQOFSbzQ7B9uDdgrO6bXO
	 Kmjr4HeuStqSEn8Af1zHK44/AvMW3L/LrQTBnPKjkTRczd/G3UwZF90hGqi/bnnMQNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794890015;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=IIDj9/6TQbU1XFTPX19xQeVl5pX677A/6eYbiA/99p8=;
	b=Oasv2uu28cEeYzOF247fzMzM+l7xYrslEpWs9TFPJgMZHud0REZKKROyu6oBDqhhho3g
	 L8d4tnCqtef4zxkFVvGtnr4jeOOi0zSnEVqueM32arcpVyoZ7BfBMuwxdUucD+2RY8XPg
	 8A7YtFBgBizMo5TZX1y6aKEclb4M7GysHHEkC+Kshf+PqNVbB5HIi9a2Wy+Gw4a4/7tvP
	 d9N24YqcL2Eb0qr59oLM8lpLqabS3OpoKnxxbCKj1Bb8lK0b78tQ31XVldU3T/QuILeBd
	 re792NhIT5rVCuidXEbvhl9CQgPrIVd4EIelkFqu+eA9EJRSeWSqnTTkYMKbVlwRXyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2108A606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2108A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5713cd0fb42so684403b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890014; x=1795494814;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIDj9/6TQbU1XFTPX19xQeVl5pX677A/6eYbiA/99p8=;
        b=zP62aUPihk8Tp+Hzkf6XR0SZKoKwgpSMn+19ZC+NscG9RmUaRzh/WVU+9Ke0qa2V9s
         Iq9PG4K9/yTk1BcPfISgslYgVM6KwP98rkVm8tERt+K7bJdInwwz5bD+fZdPDjFIG3hw
         Mw5OLVCFq81GiD8dJon37fYrtfFcpA6ECVhDchDT751WH6VoEFvEfDhi8BVebQzuxe7X
         C2DHXoqkb0rF34jxb3FEtottQarV/BpyJwtj9SvYpbw4GhvsMdG/FYDdpimEEDmAN6jK
         W21sjsUTErV37Ce7dPbyKBIWzVdyk5CCGB0Ivw1ga0Mm8aJlTD3SthjCo9dkNV3TBb0g
         vMzg==
X-Forwarded-Encrypted: i=1; AL+hErFg/cAAozK2lg1IiuRw7uZxtSe3kTnfYLUyjNFbxK+/983MbWR62Zgvbb7Ba4wAKsKpf2p1cL+L4/g9w1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RtAp3vhLw/cUcVUbm5Mp8QeKJqDNZolj97RZ8lAuzptTiR804
	j5H25TGegLrC2eQMWzKLYdpxvnoK9/g/KaqqBXe412aDeU3VvOKc5AU0WPdHFy1VQnu8yFjZ8YM
	gCcyCFE+suKh1acRnHCZm97aWQrHq9wzo80o7Tz/2cFzTBF5es9hniwitNLc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10d3:b0:4ca:9850:4dd8 with SMTP id
 5614622812f47-575dd62825bmr1663844b6e.10.1794890014120; Mon, 16 Nov 2026
 20:33:34 -0800 (PST)
Date: Mon, 16 Nov 2026 20:33:34 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afbd91e.e6a8accb.234e85.000a.GAE@google.com>
Subject: [syzbot] Monthly jffs2 report (Nov 2026)
From: syzbot <syzbot+list0fc9d5eaedfb6713a2f9@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello jffs2 maintainers/developers,

This is a 31-day syzbot report for the jffs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/jffs2

During the period, 2 new issues were detected and 0 were fixed.
In total, 11 issues are still open and 1 has already been fixed.
There are also 2 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 44      Yes   KASAN: slab-use-after-free Read in jffs2_xattr_delete_inode
                  https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
<2> 9       Yes   KASAN: invalid-free in jffs2_free_inode
                  https://syzkaller.appspot.com/bug?extid=675e84fdf3dde67b4946
<3> 14017   Yes   kernel BUG in jffs2_del_ino_cache
                  https://syzkaller.appspot.com/bug?extid=44664704c1494ad5f7a0
<4> 8       Yes   possible deadlock in jffs2_xattr_delete_inode
                  https://syzkaller.appspot.com/bug?extid=fdfd8fdf716c90baef0f

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
