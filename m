Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792941663;
	b=2N0QUH7RrM5SKRGJ5XmBqqrEy+RnzbBwbxxkwAmvkYQRplo0vlzpqj5+Xq4/UL6Af5mT
	 tkjSLcYQrymI9NHV85Jc4Z/ygPiY9OGr5DyDtU7YmXc/dRDUkhSPcd1OZH5dtauxBNMqq
	 /97pwP2TsUalFxRgP6IxhBH7e557mR9mbgC0kJ6HHi0jOHq8mdsH9zevv2yH9XtPl/7cH
	 TK+Y5ItQfsYQqPBmYn1N5CkEY+6saiiC4hV8Wg07y3FbZVvnY4gHGNO7+/wIIqnlDtmqZ
	 D5kGXWuUgSXqNucqqZaFuXDUcshHoccD866bP3698YUSCA55XkiuQJfqYWQ53F/fvRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792941663;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=m8ZWIa7M+p2n3dzL05DerEYidrwGqmOmSYbzKZgE3kU=;
	b=BbrgT/ozbPBZ87kX+oGRpZBm8fUIlHYjk/C4ZwxUEtCmhBTn23IugGEl7+SI//KEToFu
	 iYL34fzyJjhRGgUEAtmYBS/6Z6DBUScRyEt0Tdz13YshIc3OxI8NU59KPA4q519Fo80UR
	 pJCQv1T4p0nHjynTWHvSNkuC5WlKIQqcjyKk7P4bQZDmpcTmT9niwCJgMVevm3K6nUmDS
	 HYfuO/3BuR/p3wustCB4uPdIXro5j2T3I6sOEVFvGhmRhPJp5wHayHHmpAm7rsntfMjM5
	 xzMDcfNRbnEnwmJ5i84VjC2Gvg3nkOYFbkRAPdZc8AC5FI+6olkNbJOJfWEpFxTcV5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2947606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2947606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8486941f252so3416819a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792941661; x=1793546461;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m8ZWIa7M+p2n3dzL05DerEYidrwGqmOmSYbzKZgE3kU=;
        b=RRbZ6teJwUHJJ5skpkJX1Ol/6cQWKWR5ys5P89+86/QHQFBz3DSl2wZcrqnrFcySy4
         dC5MNV1nnm/8IcaS7YEO78dIrOSjuNx53k/yNOJSwgCo/RLgipN9JoHQ08f2pTcyJEFh
         gPSbYCaJL+vxlLNDDSKO1W9jpBye6r9ZxvFDsNzAWLmB/OyPRIVjrC6yZqCkYNZvyjCn
         /P2+qJgnkVo1PQ4Ti8CWg5LbVbqVKubapNjO2avhmQ8QYjfJLGdkcb+L++F8LztAXJsH
         NRrlyYrhE63e3ieVpyT0uYuknYLp/6mbo5ckDosK4WDPDvGJkp+ZA4COj0i8mxxPTByM
         UCRg==
X-Forwarded-Encrypted: i=1; AKwUvBwYrzMJAeYz8nozl1l8Wa5JlQQGDyWtdp7bFACVIx064Cyfnp7uzlTQCcit0vxiwbgvObXel2vdpA/I0Kw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkJPmUN5HDLQzeX8IQVWChwP7cPL+FaW0tBgXKsQ1k4zCe8Om2
	CZp0eJrO7KKsy39nQ90MgrCspV4h+eSohlnDpntJWboa2IYUGo3xx3csmJWQB3VgstJdrapZsA0
	63PRVaS1+4bo0bWu1F6TovvQQ8pyTU7waUdjhXyMU4/XxCCtYiwX/am00n7g=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:244d:b0:4f8:4ec9:b170 with SMTP id
 5614622812f47-55bfff9736fmr2477582b6e.2.1792941661644; Sun, 25 Oct 2026
 08:21:01 -0700 (PDT)
Date: Sun, 25 Oct 2026 08:21:01 -0700
In-Reply-To: <CA+xk8n-TJsj3pTnyPXk462EqTwUVnZQECrDtcKS-YXoQsTU3cQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ade1e5d.6314cce4.30c5fd.05b8.GAE@google.com>
Subject: Re: [syzbot] [fs?] KASAN: slab-use-after-free Write in config_item_put
From: syzbot <syzbot+63336d70e1af377d7388@syzkaller.appspotmail.com>
To: drifabdelmalekmohamedsaid@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 6



Tested on:

commit:         21a7f44f Merge tag 'devicetree-for-7.4' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=63336d70e1af377d7388
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15633469580000

