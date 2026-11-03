Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695682;
	b=seCg2pMsbqKh12XHPK9CZg1aDglqFdCBOpTb7JrZOxJN6sEon5OBRFcsLZ+O539KeIgd
	 s5HTe3y6fivdVtBznlwrbF2Sztj0fnwHU2CsjnojMl4xbRsL5Bo4lRZf8mDGlcxyuDU6v
	 YFEBaOyhGK0xT8h1vRE1xGIDhvBD5xhj+wNRYsicIXsN/4VTKLTZepwgc7oeqHm9LWf9s
	 zx3lgR7Jd8ezmMIo/hcAYCrslfJ/3xAVEDbcLaTH15MXJl9JWF+BqD8DcpSdiLqiJcwAd
	 OUrB2bt+Xc1hoqDmMwltfUywUOeBCF/AyRGRk5gkKle3/VMt17i1//a6hX8UkSQZtag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695682;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=LILtBAwVcj97xJMILwTvJgE5xKsv2dUcrrcwrHY+Jy4=;
	b=bmpFGEoo2MrVKTalnhCZbbzQj/ugxUct/u03sXIGUOYzpsDWvVJ/sD2nQoidEahFhIXy
	 OBM9IsQG7oWxUEXlBLL/gM+iCnMPwx8BbJy9KlhqLaMl9ewhQJ1n/w8rEhQFhguSDEf2A
	 v5xqqjEiZFnVoNfe4HF0YpPU32y8+IiuFq80KDicrgwwYoRX1vOFAn0LD6aRBTUck8wd3
	 fjncebm7EPfAAtyV7TFDtSk/ywOgf+nkuajssFysu7BfRL8jaTbjyEiK0oqt61vwtwmTd
	 LA07VTzAyIvgtbWMdNX95IxtgQF7ItM7LxkTgzDd9d7YIQdN6mehac8WU1RJYxbhLnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6880E606A941
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6880E606A941
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-821de0b7baaso5692027a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:48:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695681; x=1794300481;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LILtBAwVcj97xJMILwTvJgE5xKsv2dUcrrcwrHY+Jy4=;
        b=D/y/I+UevL7c8QZmeuIcu7hJ7ogHzo2waTjvpZkeIcNJyvIvNAxTVHmH4wUu0K4kok
         /Zr5Xh+INRMmtMZhKYdcx53O5tY0NmJU5VP54kjre65cEG7mNgrj1FWu6fDWSe+M5BZz
         2+0KM/hBxCTpv1ezoWXRGgi6W9qh1P8Cc/LsbPGXyPCvJ6NkbjMmZr+/nGgayEzwfFB2
         WS0f3uTwV4pPwrTgl1tozNBJ+Z07o0DXJy3UcqniTp+bhq2TR57Y9jZcAtiGZ7voruzd
         QHBC5ocj/Kl65MoRTiRvyDQAbW28fMG7+66caPixOlrCZDG5pecG+Rzsaiwu/NCcYD34
         +zvw==
X-Forwarded-Encrypted: i=1; AKwUvBy37U1SHXI1MKlt8Y7zlgr5IZJ3unLmTxWRgTxnfFiSW2cM7SdfX8/hmsMR+Mj0lsS3+A2LqZ58exwyuro=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y45Emt//MNtoVdv7+WR2xN7wVbHV2J4MNMqogyHYDKKhvT8I4
	1MrebvKfmStjZlZ25vlJyxc6vLCyAaQwgPrNtTuQThyMkHL4rm9iuxr2gCA19587Xw0dnAHAz7G
	KXSIwUB/O6go+55sX4ujbOCZrctT2uAOUtFudhIEACwpKD0pXTfOaK71qRW4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2512:b0:4ea:18f:64b0 with SMTP id
 5614622812f47-5640decc459mr9269604b6e.67.1793695681516; Tue, 03 Nov 2026
 00:48:01 -0800 (PST)
Date: Tue, 03 Nov 2026 00:48:01 -0800
In-Reply-To: <20261103082327.3009593-1-fei.yu@intel.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae99fc1.39567162.178b6c.0001.GAE@google.com>
Subject: Re: [syzbot] [dri?] [mm?] WARNING in drm_syncobj_array_find
From: syzbot <syzbot+95416f957d84e858b377@syzkaller.appspotmail.com>
To: fei.yu@intel.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+95416f957d84e858b377@syzkaller.appspotmail.com
Tested-by: syzbot+95416f957d84e858b377@syzkaller.appspotmail.com

Tested on:

commit:         6628e7d4 Linux 7.4-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14d37055580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3ede181010f6e80b
dashboard link: https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14929795580000

Note: testing is done by a robot and is best-effort only.
