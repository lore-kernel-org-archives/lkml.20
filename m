Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792729204;
	b=qMJsXTadrJplPcmHxSlscSVQMgPCfU86KaFIvK+PfMP3m4EPkOWT72PtzMzLPa6sT26c
	 Bzb293rtr5YFshWYG1bwS/lz8bH0zI+U4WKk5ieP/YrDflJ37ouxdq6B/X2WiKg0sdJCj
	 Fx4RepjnOqpcpzCehlTEMtW4oqQf+TK6zs+z5db0iQxAdyQQWcV1jF360q79LxK8itdP+
	 RLTPdWXS/lhnmbmgSHL7HlnOt40WBwkcH+9CWWXnBQbnVFvbH3I3MFkenXXZNMyFzHWqI
	 kIQSfCiAacvKvp38H6pAWIRvbUBEUyj+xFn8lGyvnWyO/u9Yg2qAvtpazSeFbaWaNHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792729204;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=em572WSOzHeArHqFlz8x1vJT9zsCcLHK5PpLJVvHPaQ=;
	b=0QLhbXH6ZmIHsHJdHzO0JlXCZnvQ2doU6AtKK0mn/eF8q2rKKGzPBTNozQPPg7J35nxk
	 6pq+yTjK+kTZlweZbATfEJ4myekw/ZnKxYVCWv1sevQg/bP0Povy9tEjnBRBuIpgF6ask
	 TrGugaQRgcvijY+S+Ae9+onCPSOauNB5gMdKdzFZ0b+uY2e6mwgkNcM40eHssC2UXBbDG
	 17S+IyCm/9IiNZfGyr5/uHs6RcQEQ6seliW36ZXfZ85X6pzDKWVbTI2KxIQadePEH+D15
	 pQT5Czrmzsms80LkUSxectfFJaXJZBT9UJcSuEVLCh9y1Kxjye6NCymBMwGJMNXWT4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75180606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75180606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-55bf11583d9so73810b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792729203; x=1793334003;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=em572WSOzHeArHqFlz8x1vJT9zsCcLHK5PpLJVvHPaQ=;
        b=25njv7E/YGlYHOzf6xzS1ULHPPbNDbkC5sOMlvMoqWJkFtE/LgfhEBuZfDdRvAieTA
         Zt5Tuw/GODR7CN9egS6o748HE7H32hek5Hc9m7lPezYkm9H+XbCwWoO1dIGml7qMOaGs
         cBAiEqP9BkcytteMCL3bS0qwYZCdOBnhYRbuRcVc9uM5OYZ5jAkkG2TtSrCEkfkPj9Pp
         zui0B2IFZv4aUB07O6hxEo4aXi3ZDTwe861qSJD28+0UA6Bkpf5pZrhLUZ9nUUOLDYNW
         QQTEbjX6BDW6rHw/ALf/ND5q/n5uJDRTFk4ug7wrXa56TktBfYRFkW9NndiOwZP7OmvI
         LuAw==
X-Forwarded-Encrypted: i=1; AKwUvBw0V97cDv/NiB9QwfggFbaFljK50PWBCVugrhV0PTAnEfFdw2QD+lSaM/bxQ/7NWPhnbKCkPHezCRWwCws=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVct/zzoZMTbL74Fu0ML+ekAmJ2fVsDw2YPopxyQjlGtXiTGZ+
	OaJzUn+XVRCaN042B9HfvzJKh6tEsOJr3OLXMNc469v16NNOPDbk19MAnMn3Bo+rqLX1QAd+rG/
	rSMnRwVDiPIk7xxyKyJF7AeHdKAH2XyUt7mOoGLY0XZNYA69z5DV+7KGU0nk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2e43:b0:4d6:9133:cfe4 with SMTP id
 5614622812f47-557ef21ed3fmr2642395b6e.41.1792729203484; Thu, 22 Oct 2026
 21:20:03 -0700 (PDT)
Date: Thu, 22 Oct 2026 21:20:03 -0700
In-Reply-To: <691591fd.a70a0220.3124cb.0020.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adae073.d1cee5ca.8df35.0001.GAE@google.com>
Subject: Re: [syzbot] [ext4?] possible deadlock in ext4_xattr_set_handle (7)
From: syzbot <syzbot+f0b58a1f5075a90dd9a5@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, jack@suse.cz, libaokun@linux.alibaba.com, 
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojaswin@linux.ibm.com, ritesh.list@gmail.com, syzkaller-bugs@googlegroups.com, 
	tytso@mit.edu, yi.zhang@huawei.com, yun.zhou@windriver.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 7461c60b9c6a839b13ad4c3490681a0cf5aa0637
Author: Yun Zhou <yun.zhou@windriver.com>
Date:   Tue Jun 23 06:19:02 2026 +0000

    ext4: skip extra isize expansion during mount to prevent deadlock

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=124e0a95580000
start commit:   61c03dfde854 Merge tag 'ntfs-for-7.2-rc3' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=98da55a882774dfe
dashboard link: https://syzkaller.appspot.com/bug?extid=f0b58a1f5075a90dd9a5
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=165aeb89580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10185432580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: ext4: skip extra isize expansion during mount to prevent deadlock

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
