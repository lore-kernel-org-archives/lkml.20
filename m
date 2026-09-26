Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA503A6F1C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790415664; cv=none; b=f8EhDsH3wQ6YiuQLR2YAlT4EEo+11VAqLotB/+IqVXy/tvrJEhRoeNDY4O6dZ47o2ccuaDLs4CnbjD5Z/2ngpQiY7XBy7WgJKru2JEP0FCHIoQqkHaZTuxTfdSWyLoW6JbCjTBCRULUXb3Hs4K3MtMx8hrN7Uoj9NTiGUhuxlsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790415664; c=relaxed/simple;
	bh=tUOlnlMI2He7morlnrHTQI/8yIo4HBNrPze+rbbLgsY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QR4mLtwhyLClbylAYGuKKprspoUlvuGePBs47/dnLbee/bewm7qXsa6swWAEXook9RxTGIqD/KTdexFgy6aQ1GjHvbPrIz/pPA2EX/LeVDIwPYVU6dOubk6p5tZ9zFiJBvCYngIESY4oIJapqwGNvNMGp+i3LQ9TiELVlxrJ7R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cbff1bc700so1273360b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790415661; x=1791020461;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FT1nYSN27nTGF9etg229beGzaCODWjM8tOJhAZlbINs=;
        b=bhfAc+FTtsX6lNgifvVB7Vet+4eaPIJYbs6/f7w4K0vB1YL60wi9yvgbYZO6h0JX+k
         2L/H08UXhSmNy8FtyTYTztlrb7Z3e1OYEN5iyEKr3FMo1wbWVGILCoIScbjM8LSkekCp
         p8hW+9QWUvrYFvyLoxhHkipDw8U8FIKS79Z3v9OzNduH2fVY756vSeoXcuaQ+LUL03JG
         PnPBOotw53uylbsaPpozFtfFditq7yoTAzT30jIB3Wh4STxgym9wg1DEPg3OABwL7UIi
         RzLYeVvS8SrDAemSfiyDB3H/qGvncbUE8+rBSptirRc29mr+I7u01qrcGjZDEJX15C3k
         LXRA==
X-Forwarded-Encrypted: i=1; AKwUvBzaHztWNEkF53pDC5zD45Bg5JeMp1/jr4XdsQLoPOCrxfJwiwfmVFquZJCHAHzXDRrF1c6hn4ccKog+Q9k=@vger.kernel.org
X-Gm-Message-State: AFuF++kwC7yS8Iddix8Zc31+P1CAIPpLPD1etOocxiQlUeMeu0eT8aES
	2cyyExDP2wPuVu9elwVt3XTinuiilmQelUlCivF5jVZ8hF/YWGrhJlZtd6oqNCWAHfiftGyQ8sk
	eiNHKBXy1kvnzwFUgpd8MBQxuCplUFJaIvrBjdrT7KtSY4y+KRRta59Gsun0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f21:b0:4b9:e5fa:8a11 with SMTP id
 5614622812f47-4dc5b41c2abmr4786998b6e.22.1790415661786; Sat, 26 Sep 2026
 02:41:01 -0700 (PDT)
Date: Sat, 26 Sep 2026 02:41:01 -0700
In-Reply-To: <20260925221553.3294-1-drifabdelmalekmohamedsaid@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab7932d.dc2998a4.2261f5.0052.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Read in
 raw_process_ep_io (2)
From: syzbot <syzbot+596b59aea1a9deaaab67@syzkaller.appspotmail.com>
To: drifabdelmalekmohamedsaid@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+596b59aea1a9deaaab67@syzkaller.appspotmail.com
Tested-by: syzbot+596b59aea1a9deaaab67@syzkaller.appspotmail.com

Tested on:

commit:         6812ce4e Merge tag 'drm-fixes-2026-09-26' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11755d25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fac807e4ec1c33e1
dashboard link: https://syzkaller.appspot.com/bug?extid=596b59aea1a9deaaab67
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1593fc5e580000

Note: testing is done by a robot and is best-effort only.
