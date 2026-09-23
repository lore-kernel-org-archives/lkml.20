Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D90D3ACF1E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135946; cv=none; b=Nhp890PzvZupCUrFKd9FJBU1MoZOmycb11OrvYCuxOUOR2G2ooxsrFpWkNzY5nqpP+YozysQcluoQ7Oz2qAE1yKc9wysBIoMbDQEO6s4KUKh1m+LATBlYk6AM9ffLNpa8FuC+mhlL4TkQROkkoe0aeOQGt9g1qe3iqDDO/G1U98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135946; c=relaxed/simple;
	bh=8ikpCyh1oOzpaoREBR291N47Tp4GL13JOFEh2uvFuUU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mb5Sy5qlh8/y8cxgGjdfLgP5yh/lI+wC6tytusXY+wL6eh7VfHUL+nSe37wMj4+doqCW5Vz8sFD9BAG9q+GbAB3oNB7RGZ+6vZd+ZjoOmzAYKgwn+ZTNUucFdsDpzEcMmYP9do9VySNJZbCJ4HZQtXmziSbAbt2W8Zxh4J0yjGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1b8b593a4so493021eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790135944; x=1790740744;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WWB/ZOF8IAJbdZnwZI/h62sqzzczm5YGFzpOcHsfpPs=;
        b=iU5fjKSSHk7hhi6biTyq6hmT5pnrYRx0ExQLjDtrIBMKJjn9JSeBdbj2YLidY+qwZu
         atCfwoxGQxdAWXbET5lRaR6MeVdvCjmypL7JzSE5x1gEjP4rh8SZmrrIIqKe/rL2Srs0
         /BLQC5RxjcNKbi0OR2a6GKWBeSGKk4P1r8WHl+EYbOdXPr3oBzMpKXkYO4uQ/dA/T0Ho
         ZBpD1ezEKJFAH4VvCAjCAO8nHPtJLDp9OL3eHVxfjw/eGPbopNJanX+DIoLfbYdp79mL
         fbiKsJOE+Eph0+2zKQ+oOmZCAntvpv8pLgf7R7xpX8j2yaPyR4JU/4NFMmpsdg/xs8c0
         bfOw==
X-Forwarded-Encrypted: i=1; AKwUvBzHWfUbhY+/m26UKL2Bi8KhGghhW6nY0iMUzQI7jr2MGT2erAl6hskMs7tBPNa3ssCTXYJ5L0fgFPYPbPo=@vger.kernel.org
X-Gm-Message-State: AFuF++kg5MifpsGJBtjcmAa175YJ+4leUkj92Xj+G438Qd1mgh6UXZ2j
	+2/uMVHUEBMAPplYJw6Ph0QAbbWH4SQRx6aGJgAx0BofO4Y2Ge8Y0VyKZPpGrWHb+kqvT+CslDA
	j4GyulZ2r0F+XrtLvTPH4MSx9bCYfOKfqsv9leY8lqga1ykI9MYL/fuKmE18=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e911:0:b0:6b4:5cfd:f381 with SMTP id
 006d021491bc7-6d2d0836a4cmr1309042eaf.25.1790135943964; Tue, 22 Sep 2026
 20:59:03 -0700 (PDT)
Date: Tue, 22 Sep 2026 20:59:03 -0700
In-Reply-To: <20260923033813.23609-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab34e87.71f81b7d.15fa6d.0047.GAE@google.com>
Subject: Re: [syzbot] [net?] [afs?] kernel BUG in rxrpc_purge_client_connections
From: syzbot <syzbot+e2f5927fc701355ef101@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e2f5927fc701355ef101@syzkaller.appspotmail.com
Tested-by: syzbot+e2f5927fc701355ef101@syzkaller.appspotmail.com

Tested on:

commit:         f0100363 Merge tag 'xfs-fixes-7.3-rc5' of gitolite.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=166f0d25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=e2f5927fc701355ef101
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13570d25580000

Note: testing is done by a robot and is best-effort only.
