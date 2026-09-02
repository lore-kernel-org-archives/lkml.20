Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7AE3783A0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333852; cv=none; b=VWwFrlZh5HGgbSreRxHJUg2BtHX5xsVlf92Y2B0TplhINJKEbAg1yHwTJ+1dMHQvYBhYZpnYZkQQ79jlP96oQJe3k24yCeVXUM2mr9WZ3mtMJjCKb1Vl8y/3UskGNY8ryYXTWeTTkdJ5KwRgL0HYYfohlDu/iXdpUoqbDF7rqM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333852; c=relaxed/simple;
	bh=LQUeEXAW/NAny3agYHkHUsruOk6DHulsZRnb4F2w2J4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pUlzm/PTx6GF5l2GnDXRDc0HCzJREBifoJimiToyFYSN+prj3xyljGljH56qmvsWAvBMobPnDVXiofGKniHxHbgm+WcSEr80FhPaYJXHdR+mfqS1fsxsUkjnbEwAGEw1/qHLdGhqGepJ8SUBTY8OTW2dWaENOJdicTqFxp6X5o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1ac969b92so690136eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788333850; x=1788938650;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LQUeEXAW/NAny3agYHkHUsruOk6DHulsZRnb4F2w2J4=;
        b=rB1RwA9NzyZeZXJvzNwkwIrkGakcLW+7mlvFnq+dZ1xXZ4/S6nosL1wPZhAfF4XjML
         VgN093eA+KjKqVLngg1bGIe9PqaFXBx4a9USvcWMUsSNfrafVb95BIOPQoXwXQbyMgp/
         xRpumFcLgqC8WvKCaeNKE7cqcR9zP2wuh8fuTuYgM2Oe/eCS/oh/uEa1xpk2b4By0oK0
         Ma6oyX6nlZsuTUeml+NKZm1XHTJtXVz9LADCm/q8hU98/SmerBCp4NDnKTb+9nQOKv1s
         k+zgbNi6Q0QnoRDdZqTbwTvrZmIxBy4IN1pqlvgu43AGs5v9iqjGLMQqPgS4CfTKViXd
         Oszw==
X-Gm-Message-State: AFuF++lTUhCCgghoW/isQYwfjztqEl+ZYXrUF8hWvEW6ajvji913tvCA
	3BppPiEHZ8oMa8wFtey2EBPvVbDMo+xp6OYD4xkMGwWmmpk59eHPrm6pa7fdOuLvjew/csrCYrt
	YGjXdyCWtCl0Uu8ZxK/4C8pZuc2wsaWWYRet7cY9RgmrHkWXOh2g7vwgyHpE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81c5:b0:6b3:6cc2:2e2a with SMTP id
 006d021491bc7-6b47efe3a12mr2210808eaf.27.1788333850181; Wed, 02 Sep 2026
 00:24:10 -0700 (PDT)
Date: Wed, 02 Sep 2026 00:24:10 -0700
In-Reply-To: <6a8fd9c8.50659fcc.60cd.000e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a97cf1a.9266084e.bf0d7.0005.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 89a312991dc6e638a36adc43ccb91dbc25504c04
From: syzbot <syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 89a312991dc6e638a36adc43ccb91dbc25504c04
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 89a312991dc6e638a36adc43ccb91dbc25504c04
