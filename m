Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760224;
	b=yUio5nXx0M/jDxYcNapehBLs1QwwS5IYcMjvg+XkBcpfgJz+aTLmQ0wzNRR2uz49KIpA
	 SwkDxUtbSIWhOF1y9yDpMmC64VbBa50NJ1Cjt4/CHDYpD5I2nJe4m6grhtmqxOWeiJf+Z
	 iwGcNWmcCpz+yUeCMurzP+KBukh8yDjEZUVSKaf8OGgHsS/lH4VnCU+SyIUTle3lha4+T
	 /OqeqR4feKwIUPSZdZzPXf7Nc4mduK4JcHM0n0zjyw88tSQPlFDgTPJb7CWEi0rgEvRjg
	 rU3zrEGo1qGXrqVK2hDO9sGfR+aWfGUcMkB9FLePm5/IfpxVGtfNmQpVJpf5fjIHCxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760224;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=fz+1skj7d+hP9vXTXZqqbbKhmbwuqSEHvfIbcWFLyMc=;
	b=1A789NJZObURiDo20jbUj6CXBGGIzcicBRYZjw3Jk2hsvDwPkgQ/mLiPScRcPA9ZhiEW
	 msnvXKZk9sTdB+Mf1qO+b2hTotoKokRlOdjx4tcEPxy7PUrBar6ePIxL4b88OWP/RafWC
	 uM00WtMJjiRUNIuY6ahKym0W9JfXEnVYHiqKUl/yoKQk4PK27pk20X5X6iH5vCuSYlJa0
	 IpaBrs7wJol7OdC8LgvmoO89XoEA46LnibXUg35LnvioThXwB74td50AYwNvjF+BOzF5v
	 VE/q7Pjfqb61YFO5ksAeKxmkS33SgP5oso9E3dIJ6gNZ+X5ATUQp84T/K9l4UN7Wg/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19F9606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F19F9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-54dbbf252cdso1320581b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760223; x=1793365023;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fz+1skj7d+hP9vXTXZqqbbKhmbwuqSEHvfIbcWFLyMc=;
        b=lKrfiTjkMGWNvmyaM/yzP1CFS5I0eAAy8S4VrruVWDRBSROUOuVtEVNOCwxCHGxcxa
         pF2zWWKsTSuH0UkDofr9qhdlXOyJ2XnlmjLZesJoaaDY74K4L3P5NxlzcqYsLEbG1dAH
         TxmdtXcY5pZRRbtMxtLiVvCQ6KqqesFOcRTzjdk+rLQzWhbO+NXTgQr7gxIQzPX6cNzJ
         qNcHnO8I6pDP35b1amtU6F2RRwFN+Jv9lpSWTNfdQ1O+RKPrqfJIQn8Z0GhWublnKNPI
         B5aCe5SnVEx3Y8e1PwZ0AiZGa31yd5cvvfb3PHXwhfAyzl1UwLkA4rQ8DK8StNfXckNC
         0JFg==
X-Gm-Message-State: AFq9FYKx1eHrbxN5p9c2iM3ncffpQ/+0USPvAitO8ztpf1M2K/Z3O1hr
	YTC+fRTQ6wvHmam1n7pucZQCvhpnVVAJ6cfR4QZRe3mUaFuzCylsC3H2UUQCcHOtB5MA+TgiyoB
	RXU372ZfEMbGoaNqU8qV7ro6sr6sqvZ+SMWHiPxo8m3V79HODJm866TWRYKA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f90:b0:4dd:18c7:5448 with SMTP id
 5614622812f47-55be87275e7mr1295031b6e.56.1792760222964; Fri, 23 Oct 2026
 05:57:02 -0700 (PDT)
Date: Fri, 23 Oct 2026 05:57:02 -0700
In-Reply-To: <CAO+rqLjx9RqNs4kjyeko4zYqWyH0VZhNtT4jFKmkjESv3v178Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adb599e.3f6e6ada.1e998b.0027.GAE@google.com>
Subject: Re: [syzbot] [netfilter?] WARNING in nf_flow_table_extend_ct_timeout
From: syzbot <syzbot+521f7e7e2b974abde99a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, mike.michalo@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+521f7e7e2b974abde99a@syzkaller.appspotmail.com
Tested-by: syzbot+521f7e7e2b974abde99a@syzkaller.appspotmail.com

Tested on:

commit:         734bef54 Merge tag 'net-next-7.4' of git://git.kernel...
git tree:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/netdev/net main
console output: https://syzkaller.appspot.com/x/log.txt?x=15c66d21580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=68bf488210f470aa
dashboard link: https://syzkaller.appspot.com/bug?extid=521f7e7e2b974abde99a
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11b2b93e580000

Note: testing is done by a robot and is best-effort only.
