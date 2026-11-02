Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610004;
	b=nFKaT+r07QlpxdiKYYaJKh11Hx1Id3/WITEHc1fyi3sH/i3OdDPqjcPGR//73S3WqFlz
	 Oa+YOX7AMx06dyBxBvSMrWsK6LJwtMhEjkGdhS/voFoVpc35mmv3h+hwLUbMVdBCdVQZi
	 U2KjS/yj88R/ThnvLY/YB6S55/BpRxYes1Kwaro46imoQRlicZ36aaH0aTi6dR/CVXsf/
	 wPyItKXukKS7WZuLTPs7EN4BjI8Q5Ab/1SzzbOQVWg6tGh6HxFDZpM5yaWlC+kbfyif2X
	 IuEvnGBHPoNRKbu572swJE0NuJg03lG2IKNvHJvwwgYVoOZPwv9EumouVo1p9c5Wp5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610004;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=ysRbBTxQOaG2zUnsnZ1b7UARhQcGu3+4XgtIfISHXi8=;
	b=nZxqqC6/PLamp78tfsCGh7Scfx7XqanOXhdtepso77IqqHiBh/mjyw9BoDPaYg+kfsTi
	 sTEnBUlujkAICHXfQAuzU/6YqAK5k3zIbQgeSpwgzv7cyzimU6sCo1ex6yUwArlOXj+eR
	 OZxE+zp2nQWxpwxy+DA48sIbUyjJHhIfU3kL08Zoj9qWDdtECqDkdYEFyjRPWX60VUwe4
	 /QxX71By30RmPVuUubRHEupC0B7g0wP9Nl8l8FDE8fNVxj+1PjZA+ZChfDjQUZ4LPmPQ/
	 B6GEzaeh99A4TsGUXRrH7SfNzrA3Sz50qjuIzB8qEgd4yCynx37/22Nr29niFk0gL2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC085606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC085606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c55ba309c2so4187662b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610003; x=1794214803;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ysRbBTxQOaG2zUnsnZ1b7UARhQcGu3+4XgtIfISHXi8=;
        b=GiQUZEhAy2Vi3adsbi81xhBMoq4H0UvrQ8XhU9lO/abpdlmRLOFd+Ewpe3HmVzwXUU
         Z4Ppk+EKt71BQq57vbGzhRQjLxwC6qQN2NPiHQc6okdG8zpaJ93dIyxGHuBeLwi1P/Jx
         v2l71iDu08RdH55UO64Y9I1FVsoJiUSs1eYikKxmf8Kr6sDi4clhpop4amthdf1cNhiT
         PR3aivJfjPt3+WHuhtpWGAo1q1O34jh8tBREaSkBCkgzoPPeNI0Zg/iQ6wh+rDAGOoNp
         b1X4bUoLypBFzCuxKA5H6pnMJkJ67Q5EazO2QxVbrk/9beOrI8iSLpMXYSpuwRQsKK9p
         lsoQ==
X-Forwarded-Encrypted: i=1; AKwUvByCyb6JNfW9506RTSvQCQg2O3qUMDZHOvz89FXXHMjY+A/z1wQ9HBCNCjHBacuKlxZxHszy2iZbm1JXzkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6FUqRRN0gMrMaw+fAAzdGW4mRRnfWQCUrmcb9/uWBkKOoYag0
	Ga/ztxFwcEcxTPatPhL6PO/Fk+9cIskC55gbsicXrqVVh6vH0IecnL9vV7eY0gJDzq6EfYzShVe
	QTt7rPFJdIuus4Bgy4G2wiMA7b7ZNSbl8iPVkE9qY7Q6DQpU3/3Qh7znSSso=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3206:b0:522:1ac7:a573 with SMTP id
 5614622812f47-5640dddbb38mr6565950b6e.43.1793610002907; Mon, 02 Nov 2026
 01:00:02 -0800 (PST)
Date: Mon, 02 Nov 2026 01:00:02 -0800
In-Reply-To: <1793607695.6AE8480E.001.4jJ4Rg0D6Dz3CNh@fangwg01>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae85112.6552420f.2a0efc.080e.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] general protection fault in saitek_event
From: syzbot <syzbot+eba2b3201bd25a97cddf@syzkaller.appspotmail.com>
To: dlzhangak@isoftstone.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+eba2b3201bd25a97cddf@syzkaller.appspotmail.com
Tested-by: syzbot+eba2b3201bd25a97cddf@syzkaller.appspotmail.com

Tested on:

commit:         6628e7d4 Linux 7.4-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10b7dc8d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=54057b894b08d3d4
dashboard link: https://syzkaller.appspot.com/bug?extid=eba2b3201bd25a97cddf
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=130bc8a1580000

Note: testing is done by a robot and is best-effort only.
