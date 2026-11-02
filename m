Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622123;
	b=eXmSeKjckV3qjrbmvH9vCq4/4fFcspgWsrhdus/SR432mxtrUI353nYBEs4nJSkE9Na5
	 /gGvJ4k/sSM9IEbPAtcXZrAQlITJj1F+vKRr2K4paYiox5YNCFhpgIi+RwFGIvZEp86TJ
	 37ORnXcpzkii8YDDXamOktawkxZZrFMi2ihwnJkVLlFKPNamEvS/086KnUzyeBk5ULZ+t
	 Z+7TAXTMfy+AcImY6kFXlXUs+AVovm1A1OYAzXa+Est6DlimDwpYco/VkGi4+msvbWgHS
	 dzOiRi3ysvnRCL/wWuCSZ12e0AMNurL5F7TWBartWAXUcZ3v/ETHnXXqHYwEm2sxZOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622123;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=EhNWkq3/1xTqw1H6NxEJBiT/R0Gcvl3kzcf7c3ysdiQ=;
	b=3kAPeISH4uhKgrJrdKnuQrribpTCyxX5l2LYk6yOqXkR6S+XMJ+3iGq1iW/FI/mDzJhx
	 VGRsxzckZG4iLR6s+8FyFoLpG4TPJF8NQrUb7/3GrvhUQfeYbSat3BZidX49BJscayYJ5
	 es7P6+li+lY69b0R6KjgmJsStIynRFdDaB4uCrMOEm7AiQHIlWQQDXp/ZSDtdazEh5BoA
	 XazH7P5/Ybdo7PALMk1uxCug/2780Ev/e1O+Gicq85i476ytds6aKYw+7j+ZFhCsRviOj
	 Qn3YO/LIFA2ldEvlW+xw9n/emeuaGU/VpUzhvn0zUewXGl5NpZ1x3VkZKSQfcy3Df+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B37606AA0A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B37606AA0A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dab94dc3e7so4465033b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:22:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622122; x=1794226922;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EhNWkq3/1xTqw1H6NxEJBiT/R0Gcvl3kzcf7c3ysdiQ=;
        b=bCuMgpNojmK7mv4Ys7UfKzo5C+ggWLwqAm+4uZs8vRqjCk/vnVLnrUZDUbGShNY1R+
         z+qPzS4MW+v/c6GoBNyC3NTcuNwNljTvGLYD5LK9K1Ees8G8ytpWf/RYhLQ3xMk70CIx
         9aEWPrsZtyo+ZAnapqSQ1RGQ0qlArRm+4K44xApqNzGMNpWuyjgQejK9vpyIVpwH3zwX
         Gtlw3Xzh2fGFHlY9GszfG26n9RFexvo8md3sH6NBXEV3IiROvoSCV6Nwa47WfmS+uO9V
         SlCycBKSGfZ6AtDJEzGWS7J+FyBDAOFr0YGqFZs6iopSbF9GhlwPjcWJljMvNewBNLoZ
         kr3g==
X-Forwarded-Encrypted: i=1; AKwUvBwfObpaJShLI0/Hg1eDek2RQve0BewsPP1wEih0RCpaZNUh2nr2Qs53AocWjKQ07VIMLoNy+PtMGgwK6zM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLu8VYTUr7r/dUzh7QxW6zZnlc0DcQoY1ADncUFUIebt5mNbkxg
	b67pHWCHkt/TmD7N0Te+zZNGqz/7Em1F7aewez+bOwQz/l3NJangDCqkw4pkQPCOOFJ/y567wrE
	nb0QmTdYQFHx62BUWZyH37040L2lFW8iAS67DgSeiPtQWYyQg1LMlgIvl1gQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3383:b0:4b3:8d45:aa2b with SMTP id
 5614622812f47-5640ddb06c8mr6498928b6e.16.1793622122261; Mon, 02 Nov 2026
 04:22:02 -0800 (PST)
Date: Mon, 02 Nov 2026 04:22:02 -0800
In-Reply-To: <20261102120252.9880-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae8806a.64e51036.15cf6a.0026.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] KASAN: slab-use-after-free Read in dev_dbg_obj
From: syzbot <syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com
Tested-by: syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com

Tested on:

commit:         6628e7d4 Linux 7.4-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13303c8d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f4b0888d27d9a541
dashboard link: https://syzkaller.appspot.com/bug?extid=54648a6c1187a7ef46a6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13c9e2b1580000

Note: testing is done by a robot and is best-effort only.
