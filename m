Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CF84078D5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803105; cv=none; b=dNVtVtMuPfA953kNRyGdPS3rOEj9vCVSAgkDAY00ngYUA/4CGQlSU/eKfcnj1i8Jgomzy3O3G7RB03xjjYaXtwtMJ/40dqEqEebcSnbse62wf3HxDMHgVxuf/qpP0Z5mAQc2ozwCuuladZtDC0++4ryyEZdd24T5/i/ZqMONjfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803105; c=relaxed/simple;
	bh=qoCsvJE24Hd/Cyul4mXqe7HK8ciwOD7ryZCFZNrQ19c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BQkatrQ/bNB1lp9izqUrIpnzQU8oW04/RNfIgnZ5XVoQd+VPq4eivd60LVxtqUz1zYKUceo5FPoa6o697bEZAYFUMOUuEurz+8QNW90vDg1QzY+LQvgtnswIK89sFy0AMc3k9H7Zlx0w0YjnAOcN7R0d4elDhfhf0gDs6caj6YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a7de733fa9so3288788b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803103; x=1792407903;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ca9rC14ICCQYBqrXDQ2UpvfAubSEYe3dxAC1N3e3mG4=;
        b=ps7DJiBCOwBW/268VCSFTZJ/bzMkjrF8fH9+RUSXalChrOTCDyvCen5v7LSp2RtipC
         w6e4uuO0WBm4cdYWDjtuT4pm76EaGgTCkzZjlbMcmmgYAbiyFt8yV5LgVcizipCI6YHd
         xKceZtdyq1WScnYozMil2ksI+qlM8TdqffvKfRT3uivFK0qKvTfpDDJO9iI+FPQXh/0L
         vKH/yf8OGnN60WkZwwqYdy9mDj2bEVYS0iDp9+y+z3BOwEj3w5e7rQECQPq+jDxG5NsY
         qp91EpmN4e3G9SQ4phEWwWJNEXhlhxAcO16kRfqui4jzAB6N7+fzLiYT61C2EOPVDMEL
         PXBg==
X-Gm-Message-State: AFq9FYL0UjQFwY8B+Sd1HjdBkTrFF2wwacmbyXYiJn7zteFP0IgByAE0
	2XQvKQvzwh9FmqxsMv7/AqVmrtNxZLuH8+gw+s4q3VdMC3MAVWJzIrii+KUY96uZ4ErvoeP1RGc
	J3Yraidw5SnNZJJeBLhSjd1oIXf+7PDfizaeRrTiHtA9/bTqgifGOOXpnA9Y=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:19aa:b0:4f3:e98f:fa1d with SMTP id
 5614622812f47-50c41caa5c7mr10135201b6e.9.1791803103077; Mon, 12 Oct 2026
 04:05:03 -0700 (PDT)
Date: Mon, 12 Oct 2026 04:05:03 -0700
In-Reply-To: <CAEfrx+B9od6s+3ZrMKPM7crEihGvfNzXTxaR+BC99jXhNdNqZA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6accbedf.a150a118.27e199.0048.GAE@google.com>
Subject: Re: [syzbot] [kernel?] WARNING in __set_cpus_allowed_ptr_locked
From: syzbot <syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, spannme41@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

init/main.c:14:2: error: ASDF


Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=6835d5c11145e4f77057
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=162c6f15580000

