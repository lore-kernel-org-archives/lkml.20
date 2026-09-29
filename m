Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A1F39936D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666826; cv=none; b=TOM41rzBg/7fWzY5zU+AIvKF/ibEpwox5X6y4M1w9EDoJ8HXcpfuefXbG/YGAbeC5+xi1/Hfqz8zzV7jlsr8/JZFMg7qP28m8E05fNCzkFRgMiBDbyeGhGI4u/kasmJKl+kxJSJoEzX4HEGI0NT/NgEN1vheYP+zUBpJ/vhTf7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666826; c=relaxed/simple;
	bh=d8j+SKP/yP416YdfUrZly9fT5gJs22gexR3edQb9s/Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=A9weF418MACS3MpYtEqvO73RJ0P1XaimJ+aRX2HcslLHRS4/r5p+Fz6EnbAbyxrve86HF79q1vUKwfpNDzE8Si0m67wSiUHQlmsgD/vn5BwxAIZr9tpXk+Sf3Zusd5cMxC+2racgqy+M5OYoA+8r3u6cnWuL4vQ4rtvSE014BHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4eb0b989f0eso1047654b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666823; x=1791271623;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dq10CN6a1uFmMuvUhj+eS9sGbQomvvPJ6CogtFIlUtw=;
        b=JAZ6BfPKW5ZyQOzMMgDFTLid/I8LDa4YvupZM9EDDVZGQANhFEPIWPElo4RHPhnFyv
         eVf3cEXxmY9/aGx+UZWRi9XFap5NIWhvd+zKZS4ZxofI4osePAfp6TbS1oZjSzqAO735
         h6/YuHHbp0qcfZpqIbSSodQxqsqx0UwbFRCUJ67FswDLz9GH2mnOtkJ1ac7Vq+myidbZ
         L/wQYNdpYc/d+kdAOGYW73dR/dxBtgaKF71Jorg5eGSAXLbfCixkD+YlV/XEZ/vjm79o
         +hM20NY7TgOjpk/g8KR59AxJib7KYk709As9oLqDK80gGW/magcgqFFZYtRpYuQpZD3i
         ZWaw==
X-Forwarded-Encrypted: i=1; AKwUvBzKljRrmDlW++wajx8YglnF66RYLZnM3HgSIbPp/sYDfdJfdY4TYtBfpX0aEMp8j8rcmspcJ34bVWItJa0=@vger.kernel.org
X-Gm-Message-State: AFuF++mCtbvBRH2PBzhN/G5uxNKvPMVXE0s//hag0QHihVB/rINt55MS
	oZ+9Dj6kCY59W5Sf7/hY9YtGCax2Tj8uE+hjV1Ieuv21Y3++eywRPZWLUPdRzyQ4A4SFWs6aseQ
	OcriJNBbKJPArjxyCuYZBAqeiSa2Rc/8m9IPkLSbuTldwylIov1VtpCpOS/k=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fcd:b0:4d6:9133:cfe1 with SMTP id
 5614622812f47-4eddc8e6732mr1303438b6e.38.1790666823342; Tue, 29 Sep 2026
 00:27:03 -0700 (PDT)
Date: Tue, 29 Sep 2026 00:27:03 -0700
In-Reply-To: <f6e562bd-7ae1-4b68-afa1-e0ac0efebfae@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abb6847.c6a7fab7.e5ea7.045c.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in roccat_disconnect
From: syzbot <syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com
Tested-by: syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com

Tested on:

commit:         72d3fcf8 Linux 7.3-rc5
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=123eb7d5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=718e346eb0b8f38
dashboard link: https://syzkaller.appspot.com/bug?extid=c492a9e154f81127551f
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11d30e05580000

Note: testing is done by a robot and is best-effort only.
