Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803616;
	b=uJtNQd5ENG16ZZXNnxVK4oyH1/7TzNcpLy4ELLzLJNSCqATgCToU7DlMEXQEgR/+kr4D
	 OZzAfRYdeVSGfwdHiFjMS4XD35+5wjB71XAAtDnGoLtQNkbyBVVQtu8MTnLkM7qBMZrLQ
	 1GWKCkFqZdXZyZk51LU+sRcL3U44bSJGxnrSQoUCdQDexLbZojszNR5L+QIkWNR/PKmnJ
	 0q5Rt7p7snGqSWdQ+T14jVc6a6TaJQOGtObX9t9iSOHmmB12YZKNE/EWl/MEZtYAraGBl
	 2XYRObFObsU3w/Cq4lN31ORoqi9YXFUGigxQhcL4sd4D+1BL2fvz18MH7DvMO9Qn5PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803616;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=2SWkMY6Morz5zWTeFku6KKcVFQ9yVAcTTQCwIrhHE9s=;
	b=yqSZOtpjBnKYfQKpYrlbc+O/PJtB4FFjh5wVTRrMrwsH+c/jzIAf34LQvK7s6hKw5zTO
	 p+6baNw8yUK6WmaXTzuRXSNlPSwoomap/ZVXrvkr0aeOWMtIraC/sNwPNTL6BWSy8GJH7
	 sD/C9MwzMMCZ9I4TNqKo/itdjJur7BTIL7TH7UtL+dfBBfMlOgWj8EmvwO5hSQxFLJXa5
	 Fz6ORxar8rSXN2STu1SmxyRmA6if3dfT7MuREiRrQqpQGiVw5jDUO0FdryYr9Nd+dCtXi
	 8F+cdIH+AiTJXjeicadZyWxwL64d3o9UkhfC/XqjoFy0VUCKiLzO4bmq3t3UxlLSTDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA6B606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AA6B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8626dd59f73so1226913a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794803615; x=1795408415;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2SWkMY6Morz5zWTeFku6KKcVFQ9yVAcTTQCwIrhHE9s=;
        b=lTKvdFdrjQy6vRfv1UlpVctijpAzpU3xjOeeBKKidz/Q+H2PmKEjM3ppEu4mOePgmp
         itPc7+GF2PwnjUAAWhaI7w+AFK5fxelO2G/ynQNxK4ntQU0JkWhdkoLskOa12FCF2/T3
         Ll0OlpkRXOYta/G3ftxfUPNfrDappuyTwOR5ivWTfVUZRwquXJ8YDlnm8tUvPvIlEoo4
         eGNNv/AK8er0TXWfyv2B0KuEvRnjmgwgfGIY7BHsCxuZnGNHKN+4N32Rz7Qb7qEaaE/Z
         fb9OthJYJ6n8EXr46H+cQMllUVUuJIyQ2jqtkPTGt1cKpSsi2c9KuJDD8JeFGjid6tdU
         64Mw==
X-Forwarded-Encrypted: i=1; AL+hErFwN+xvPj7t0S5LZRjamAP+lSdNdqzPXtIZakYJ0wzo2LdAtr9SgGHM+rzbawBniNgTBFTCOKtdwFSXjp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z93CGSS6rfRjesN338sanvi7pCisXlr6BT7hLsJKOC1bXHs6pjX
	1P/hWOfL6VRoZW4/j03FRZVnT5OWzMdHEgAcBU6wLufu26FRWc7YL159rDmv61CutQmTGMvpeEY
	k51Ji9gIEGTpOzQOexUP4yvLjzMfubZ1EM51bTNtBXhcqUF+Wq7ewIg/Divk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6b8e:b0:574:6f37:6721 with SMTP id
 5614622812f47-5746f382304mr1095716b6e.11.1794803615269; Sun, 15 Nov 2026
 20:33:35 -0800 (PST)
Date: Sun, 15 Nov 2026 20:33:35 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afa879f.920b2b3a.148c65.0062.GAE@google.com>
Subject: [syzbot] Monthly f2fs report (Nov 2026)
From: syzbot <syzbot+list6ddd297964bb51e043dd@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello f2fs maintainers/developers,

This is a 31-day syzbot report for the f2fs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/f2fs

During the period, 0 new issues were detected and 0 were fixed.
In total, 10 issues are still open and 84 have already been fixed.
There is also 1 low-priority issue.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 2628    Yes   kernel BUG in f2fs_evict_inode (4)
                  https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
<2> 1368    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<3> 305     Yes   INFO: task hung in f2fs_issue_checkpoint (2)
                  https://syzkaller.appspot.com/bug?extid=8a7eea50810efde15b0a

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
