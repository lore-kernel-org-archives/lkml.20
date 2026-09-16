Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CB2470112
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545751; cv=none; b=LXplNOOAYLpvIe51iYMJ2UI/ybVdn56N7BIsO3rci9OL7eTvxw1NBtBFgsgwQRx9dudF3ISCjX+4F9xX84YAPMJFlOC6STn0irGJfxQOLbQhlNZ5gpH0XbhiRjnw7bM3Tgc3tpRkSrWqCyXLMxudZqKLbhzuqUbNCH/wCXYPlnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545751; c=relaxed/simple;
	bh=jItZ7yDEuGBrz8p6Be0WfkHp3JvUH5fqrP2TJvre0xM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=P2tWd6+oHSKLzp4lc5AqlE2GpTdNO3P1UDbTn+kJi9N8RobLzoiKS4usmykXXidIDCAPVmLfZ6lsYf+iX0BY6ks2dFSwX2nVWeB6tLKolIsfPKY/4NMajNlXyRXT/mKOxTnhC2Wvgx3gXOit/1UOyK8o6CbZqaSfcS9HgUyYaXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c277929a4aso3056568eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545722; x=1790150522;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/A6l8z4pc3tG8u/rgATTML1snAFnrAgz9hNmm3n8pgo=;
        b=zpjr4wMaAaoyAcq3oIq5ggwvGSSYZw09yRH9QGm5QgPv8jkNYE1BzgaGbQ/qai0bEi
         3BQdpFQ75VF6hs3l2AtfLQcmpu2Y6Xtr2ZiKzfRTHQlC69jN/6m6hBKgMU/0KW84NwSy
         55Nh+LGrudg1vAHMWpU35jyXwAnWWq/QWq+NwqPw5nloY744yao91n3DOgJNG/ng1HN6
         yz+xG9S0IBhjQ/ukZcrjAiTTpR1JWyqen5NpI/xcxk2az2putmP+7++Y0goG/rgTjI0X
         7gprxtDBRXRvms5E2D950PD1kiSab1H0LPnG4MKVfyAldlS15Mv0JYniNEMppvVow3SG
         4yCg==
X-Forwarded-Encrypted: i=1; AKwUvBzYS8EoWbhOjTJtjKbXRmrpW6oKwyEhv+X6szZLoILPJp2Tnp1gD/0YwSibVnBhAlYbNcH3afSmKKrKx3w=@vger.kernel.org
X-Gm-Message-State: AFuF++kS57tdBWlMs3Q0J5yJ4n+Vbb8XhWigEbvgeNjwQooIyIIJme8l
	NQytNtacHT0hdoC4xqpOy/4PysmLQESFgy/0QH8NCsfeN2ZqzrbWrcY584OggxY1/iwWQNLeER3
	NdZ9PltsuPvb+ViIPOnyF3/9/xVdXkMV5hain76xpm5DPLKiRx6UYJMkuxGI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:160c:b0:6b3:5c73:2188 with SMTP id
 006d021491bc7-6c7d11d9604mr1853283eaf.5.1789545721854; Wed, 16 Sep 2026
 01:02:01 -0700 (PDT)
Date: Wed, 16 Sep 2026 01:02:01 -0700
In-Reply-To: <4a90cc5e-326e-4c15-adc3-008476dbdc37@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaa4cf9.f81106d8.2ab401.0077.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in roccat_open
From: syzbot <syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com
Tested-by: syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com

Tested on:

commit:         9b87fdc9 Merge tag 'sched_ext-for-7.3-rc3-fixes' of gi..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=123bd925580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=d632e93ffcd1452bc61e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=138b03f9580000

Note: testing is done by a robot and is best-effort only.
