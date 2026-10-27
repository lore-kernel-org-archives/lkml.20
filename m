Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105223;
	b=pccAtSxeOD/Vji/fWGyfMrFto/S7WkzYiQobuqHrhkAvfjqv/U6EtQLx9G1UYrJWDQVP
	 8I4QhtpSjRJVj2cCjFOZaaBJhpU1BBFZvdBAF/BjCUmuZOLk1WY3KCCnBfNOAbIro2Er7
	 Q9B/xwLX1fIxgMsvjGqJO3x0z0ADqX8tIoit/YDU/02/l72ZvVPct/lHeXjeZv5iCtJXD
	 Bnf2FFBP2PYfM/jfoJn+2FLJ2/ytdzhhRq3oQjz1vOxZntEt0PjRHnLv9vs0GYqt9skb6
	 KSk2k5IsPe9qEX/SwDV6sAfyIqx/O1AdQwdiq4gQJ7AOcpRhx+T3FqEhGI6X4ZlBufw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105223;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=4oatTXMsciMaV01MgWRGz51vE3ilcbjFp2nhhAdcZ0Q=;
	b=OgbD9KWWSlrCAbGhy6Rz6eA+xG7xxMO6TVcOipzOK7YLjKHcHYWOzOJ3DD43O708rJGL
	 yH/28NVJrb2GFsawEwBHV308Nmup7aYqfvNfNIJmpsyjRY22hFMfqwpoFp/yxNJ2kljQt
	 bSjIaVKCNL+hX/HV0NEJPyX01iTeuedqyqJgL/Y1b6C8YYGCxC7f3tBTSu5vL6+IJtukJ
	 vXZE3TyLyMJqkSOC5SIGTNMB9Lrcs92/XzonZrq6nC/x0uTvlBQvEGO7sfSKHAGKn2NB9
	 zOyFEbISH1AlNFfoEDAMsPyUkKwoNm87AnIwFdHregJPNj/resgW37RpDH6mB8RpXRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDB2606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FDB2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f2040e10d8so3734882b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105222; x=1793710022;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4oatTXMsciMaV01MgWRGz51vE3ilcbjFp2nhhAdcZ0Q=;
        b=fXAoIRcrR17AcsbBCDJ7gzUX/lJphpCbad5So7v9B3HKpJM6cDlIjL7Sx5VBBjTK41
         UdyAoM51wQ9sa/ZDK6hd4+I18QIHSq8BaOZqv2Pv3VeYjjeTHPKoFHUKB3RCl7Npt9bl
         NvIBTFrkm1xzGAjyHLZPbz9zWoXDRgWkEo3p6f2csc1pJCFk1owDXfwkpvhGh6GwCj+Z
         aCU+gBEqRIRMZQ1LmXG0ywt3eGFwfgtq7MFqxxHHbtfvz/WgbPOhC7EP7wW9WuEd1ycf
         REzVJ0E9RLTa1W+qKjqp1Ob6TlrroKkAPBZlIgBoCF6LqYrXNuViy0HaDzY8tn+GIYio
         ePew==
X-Forwarded-Encrypted: i=1; AKwUvByGLH0NsHWtzzUZHtK64qKPcPcG0Vid6xU785hJv8iDVTvLUVVLE/3/NL5ptZWPdIPbu7R1GA9RX9rfMeI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7eo9c0SLbHiax6vBfeVhmk5U1xQhx74STvelJaIDtS143kfQJ
	vdrr7Vb7W7sBEhdjzreQV8Deowe1+aO7FBYXM5UuRtnoTKKVk6CTJohZZHfDRM4UpSCOY8Ak4BS
	a+JpludzcabBfEZqQLAJoOH7PoqpPboc3f3EcsLj4hxbCQsSkQIK/3NFGOSY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3082:b0:4e4:86b1:f7a0 with SMTP id
 5614622812f47-55c003d655dmr8926540b6e.53.1793105222110; Tue, 27 Oct 2026
 05:47:02 -0700 (PDT)
Date: Tue, 27 Oct 2026 05:47:02 -0700
In-Reply-To: <20261027122202.279516-1-diasyzhang@tencent.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae09d46.f0fe5aea.79aa1.0093.GAE@google.com>
Subject: Re: [syzbot] [dm?] KASAN: slab-use-after-free Read in pool_ctr
From: syzbot <syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com>
To: diasyzhang@tencent.com, diasyzhangqing@gmail.com, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com
Tested-by: syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com

Tested on:

commit:         d135ab45 Merge tag 'backlight-next-7.4' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10349d31580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c899018ccfbe890a
dashboard link: https://syzkaller.appspot.com/bug?extid=83827f9a59abe148bff4
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=168ad53e580000

Note: testing is done by a robot and is best-effort only.
