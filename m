Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794033424;
	b=qVhfpK98XtWaIOk8uqfIA8EcltLIJZ/VLujB0jVijFkwLCTebremgWUo63DZ712/k66d
	 EjCrft3T3QLTG1j5MABQKCH0oYpb3oPUFf1oCHFRPnyV6NM6QEAxgp1uFajFo1mSt1X5Y
	 8/m0GJFTf+4z1yYS9OJPDzedh5Tzp53Y45eDmlQTYiTZ8KSIEllJzXpYJvvbAOww2i905
	 WDQDE9kM5kdCo54hpBVM+ikgyFrb4KRsqRWc0kAz9YQUcGkgHRqTSbvNFCKerECMG97YD
	 mnm1mhcpe4dDc+msv0hBcZVS8Vgf+sJPnr2g7gRtR4ZMFuyDMba5ZALllyXyKGR1NVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794033424;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=xE7DnkGC0wLRL3dPvVdwFsZD7wae4SMEaNrFMqYv/Qs=;
	b=fHLH8klyLJZ/V24k3+CpVm5W+xC6c1eBDma/BsLj3WLVWSDMUIgTVTYY+p2EqYmQLCjv
	 Td9vz6e5KsNpC3pwJwr5zU2+RvD6k4iPQuI8RkgYL+jGqu1ki+hVuvefkJ7H9ijf947Rm
	 EHIGK5NIf81/1cqbULJsqtjYj+5uP4dWZgg9bmO4sHyeOboLgnO2JIS0VhisinOIYV4Wi
	 nMD8fa2FT9LzcVBpjtwNf2QmB+Lm3bvvtDjC7tur9QSteRwnAmjfVIskrLY/WsDeJ87Dp
	 5ZRpT3TZZjiiIaFH0hqyn7rU64JiosO09NQvVemucmgwBs5RUXWlfPc3a7Wq4Q2+BTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BBC606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7BBC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4fb73e868aaso2086108b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794033422; x=1794638222;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xE7DnkGC0wLRL3dPvVdwFsZD7wae4SMEaNrFMqYv/Qs=;
        b=ynKzR8OGDTrzUDscsu8YCM6shsx5p1aYzY7cMc3IZujpKQRBc40iwkw+2IcPB06cIz
         9YciRBCuOJbgbsSRTuL4ux28wWrTemW4B95AaQT7b95A6wi/G0g7sbn5p1kqSwDivyOO
         zJp9WpoLzs1haLj0UCmiFOTW7IaPm2qdDlUQASXYfiERxEhSQ1lPvlL5btwjYC/7yQ9S
         USxI9ilG8T6rchPGa+eVjVd1OcZxGe+P5j3eM93srQq0H9VSvkATiQJZnkorH+OTa0tL
         cBfudPEe4H79Y2jBxHaihP44Jl7Em/h23l5pEYaHq0G1LA0B6ABBjtmbHMbaieXZRL3s
         efsw==
X-Forwarded-Encrypted: i=1; AKwUvBx9k8RERChAEHDg9D2ZJ+AP2yqN6twVPXkpDoIu2UKxxdoBm4aA1IaVPYyZ8PTYjNZ+bbNPKGafZ5C3smo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l/qb35B6vkOrFHouHg5RsGjGsw5FJqvHCqpo7S2o4pqH7cquI
	Ykk+T7PHVSZQ6Mce4wSuHc1Ha/06OO6sC5VIsIE5sCBzhW90FtBkBg/vou0CGEBrtXQAjnkNbFf
	h3t+f8atHICko6TtzWVtPon+qipoqxfGbxq9ITTaZD57suZkfQBGa90QHfkU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10d3:b0:4f5:d873:aaaf with SMTP id
 5614622812f47-567e1440dfbmr4198447b6e.14.1794033422668; Fri, 06 Nov 2026
 22:37:02 -0800 (PST)
Date: Fri, 06 Nov 2026 22:37:02 -0800
In-Reply-To: <20261107062125.452010-1-diasyzhangqing@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aeec70e.5a668245.1aceb6.0002.GAE@google.com>
Subject: Re: [syzbot] [iommu?] memory leak in iommu_fwspec_init
From: syzbot <syzbot+fe84fc6a684e0beb86e2@syzkaller.appspotmail.com>
To: diasyzhang@tencent.com, diasyzhangqing@gmail.com, 
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+fe84fc6a684e0beb86e2@syzkaller.appspotmail.com
Tested-by: syzbot+fe84fc6a684e0beb86e2@syzkaller.appspotmail.com

Tested on:

commit:         d4872371 Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15cb87a5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4361b1bb937ae1c4
dashboard link: https://syzkaller.appspot.com/bug?extid=fe84fc6a684e0beb86e2
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=167be369580000

Note: testing is done by a robot and is best-effort only.
