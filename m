Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309844;
	b=GySpmd938dVShz6fcXii4phFxqnAi1lB3fHoquI1HfsBsXJsHagF9Od1FtaBjlzx1sM6
	 Dzj3Mwc+5VnIjNvp4gRil1+ph12HWw1/LjW+V26hiMTQNQUdsAh8cym3oH5UneSMRLElh
	 8tOGili5Dgkx7aT4vmEF3DamTcnIeMtwtaQ6tgUfCrZ2gorJxR3aW9N5ZOMa/SB9vvga/
	 nVf2KSC1y6cj03Eq16dm9lCH3F1aPIfR4qALg3QeaEVmifeY0gNmkC8VG+bTwSHeB3Wkh
	 ZWBy/w/31eRnNkdIJWI6EMQVA8hLkUumpCOB0aCBOLBDetavy1j7kShusqh/S2jLkgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309844;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=28tgvZD6jDuSjDvNE7CeCXO7pTXXWKJeJ62pTJpKuAw=;
	b=VVc8XTGuMn1hlqYgR+qr+Bm67AiMBkNt41JpWBTxp/uijjXN0SgL+WrOM5VswlbRuntO
	 roCp0wz56B3Of+J4P/+c6EWw3kylBnMkhDvFV6wqwulQPZDYuauKaySTP3w23Kx9p3Tgi
	 GYbAzQrSFJpC6/g2oqlG0L2S+rqnNOOVBW6+CKVTpJ9hxTHLQ4O8gL+kN/BnCm49jcmkx
	 ZZuqiV7TjEKEOI4B167H8BeTcsCOiSnFVTWA75dz1C4k0zlk3v7QyDcW+JZ0VgF0AkAdu
	 T6FnMLPehKpw5v5IJlrklqwgUppyT5i2nZupltBgYm+kautAsy8Bm7OHmE6MNz1uiDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FDE606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04FDE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4f8281066c4so2250926b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309842; x=1794914642;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=28tgvZD6jDuSjDvNE7CeCXO7pTXXWKJeJ62pTJpKuAw=;
        b=z1NV63+6otTxlksqJuHVPB0dQn/W50rXMse6NAHvrX7HaNEOUxaedv8Jvf2/I2BzDk
         6PtH6RLvRSry3GMhqE0K3bH71rxAJx5pgEulS4prwvl+WDGrWSilR9oYsxak/mi3G5v/
         bHCy1ul/iDl4v9Kx4txjjCaH20lRHK7uE7bqHLV/4Y9F/gpdYnlk9oxoHB89WzVbRciG
         cqkJ0TjSbTlfY+B914zNrXOhcNTDA0Z5Q1OFnICR//8Jx+CsZJnjiFnSJtV0zIytdjuR
         0BXdhzCaxeshp6n/Z6x/76I58bbj1xbD2jNkUQjV8xwl4wT64KGkjawSnlv673tEVXsD
         Ez9Q==
X-Gm-Message-State: APuU4Z8EVsZtuamaiBHWMPzXQvD+KPPWd+ElcvNGcMlpVIamq8/GhCfP
	bCHaIXpt4hWZIAF7zckEwvhR/+hdhVbg7pIbrCIUkpPgL+N7la8XLa+Z0EvkCcMKqBIKNNSM+0W
	k7hFYKk3V32JhLqau8uWchBewQI1l2Axg3uer+LbeJiTxkQypjXobAqOKyC8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1307:b0:4f6:6041:f0a2 with SMTP id
 5614622812f47-5683cc18827mr1832149b6e.27.1794309842763; Tue, 10 Nov 2026
 03:24:02 -0800 (PST)
Date: Tue, 10 Nov 2026 03:24:02 -0800
In-Reply-To: <CAPVpPLsExzz8wh_b4WYpFqCHYhXq8w5OpvTSOssbF2UzuQpvtw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af2fed2.ba456586.26086c.0000.GAE@google.com>
Subject: Re: [syzbot] [driver-core?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	vrpcloudbughunter@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

owned.c:1: error: VRP_SYZBOT_CROSS_ACCOUNT_NFS_create-b


Tested on:

commit:         b8ee9ef9 add secondary-owned shared NFS marker with sa..
git tree:       https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-nfs-1110-b8ee9ef
kernel config:  https://syzkaller.appspot.com/x/.config?x=8bdeea7ee6735f91
dashboard link: https://syzkaller.appspot.com/bug?extid=c22bb42560ec86726aba
compiler:       

Note: no patches were applied.
