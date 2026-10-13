Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564C34AF9C5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872584; cv=none; b=QS6eGCtQBp3L/OlE1Qqh4jxL7WZ8c/AIIZt6GoNrgYxgiPiefAaISP6g9A6ACSuqqEgB9cHigCIpqi7pLyBL5tDvH9S7yp3zl+HSC8oICfBMEPrs/VU3B+NI6lzT+X3ddHKeVLUtSVQCQxeS6kim+4MNEV2/TznfMRF2k8nymns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872584; c=relaxed/simple;
	bh=Msi8iQuh7aqP3QaqRPE5s4sNnL+X/c5Nvnh76lk6zlU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ssfH3cuIqgOeL9dFsj4HiID/loDszy5v0w4JZvOBIVxfSaed63k7dKpHx3wA0NFa16FcrvB/L95g7BVe00/ZYTkY9GhDc5YBpvzWQCpuQvTR5y5NG5SfU8GvHiemJvkdaSLs+cdzWoTkVLuEhSF9pj9wh+8Z1GeEHumh3G3m0t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4f8281066c4so4593091b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791872582; x=1792477382;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1TL9hKKQXNbiZtQId+/EL5khR5gMHNTwDz1p6GsfGso=;
        b=W2KhabzkUc0yf/sqbElOCjYJYk8RQct8RkelJrnnQULL5KqRB4occfEq+K43e7JTUJ
         Yo3Ujs6PecS4EqgnpTMv7BHG4VJxWVeJ1m+sZygw/0/WtmVYJhjbIQ/QFnnyGEfeEjcD
         MKscqXBU4N8r0SwQCsH3lpaqPsP2MaItSsGUaRT7el+lK6qvb4xQNJwMy+0kw3e+Yxpf
         ljD8isGaaZEn/wrA5bS6Gt6rsmIUzS/4swTL+Zf+h+42zeF0GDL2FMS3ClUymIYaiUW8
         z6nJDg+StT+SJxA7UiqEB/DegYbLy7un6wfXUbt9VpioS/wPcy9lWCOET7cqk3SAGbO0
         rnVw==
X-Forwarded-Encrypted: i=1; AKwUvBz2PC4x2kuVrdotxRt4HqrRk16QVRgc4xuh/YOa1QPuyaW4Cgw6ubp3u/v59W7qCy3qh0qpBiagRSgmbHc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxmnOMzFMSPpNt7ETJ0B8wrAERGuLG5nVhynl8Tkrho7W8dHrN
	am79rQA9wHNE16N+JUJTzj/BkXn4PR+TNMEyvMmwmGMtKJwzEWCuJJef4LbvPI9QomcBCUrj91V
	aqiXJo7Mt2BRzy9NeXGevIUNsTQkmma0VxcW7ybAodU3ztcqESFHtbJ2SsfQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:670d:b0:4d6:90f3:74a2 with SMTP id
 5614622812f47-50c582326damr9608434b6e.45.1791872582224; Mon, 12 Oct 2026
 23:23:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 23:23:02 -0700
In-Reply-To: <as3JnatMRsNYq4bR@elm>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acdce46.a150a118.27e199.0056.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
From: syzbot <syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com>
To: code@tyhicks.com, ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com
Tested-by: syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com

Tested on:

commit:         5b00bf0f fs/ecryptfs: fix slab-out-of-bounds read in e..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git next
console output: https://syzkaller.appspot.com/x/log.txt?x=11c599a9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b0a4310419d2cd7c
dashboard link: https://syzkaller.appspot.com/bug?extid=b9529ebe6a9394ddf825
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
