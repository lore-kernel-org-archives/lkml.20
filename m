Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780865;
	b=JOVaVIhpPIyLwVBJYljGw7zlE2sXdTKi0WxS/ruSRJNTmO95Kg3VxFcIa+P5pcRxKCvV
	 0FBJvjHrsF9CDLojOr36JEIOnkijVf82ojadiYqTmlV75DWwdxBMgpiBwr+nV4RA28nig
	 NqZU1jkaRHav2FaF7pP8AY/+EvfskQCZL9biMrbX9X1TkT45cN91wVUY241/dm56vo761
	 vMEcNoz5Gy7lte6wspA1Qn9a1X2I1BXBHrjrgWRuYGu/VxIqp0jTU2+umy6/4T6xx4WrT
	 anE0fLBwtxYpWbmctbCJaOIx1dIh1kjCpIHZ7/2K68OgDum3nmN380MQxay2F6DIHfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780865;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=k9tAcHgucxjRPGnV+rTtZYrbnfzK1zdVFYrqtBoNa+c=;
	b=a6TTGKwKzIf+iZf0oXqSsNFhWcqcYa633aalIQu8/xgLXY7Jl4zpBQoiKD1UDIp7BiNe
	 bbEi0YqPX5KBi/kfKi0muUxqS8/Am63uqegbab3cD95xhDK1WWkT5CFMuRWpixc6tv2xR
	 ePvhgxBhuw8VlDXIx5e7zUPIZrgTAFXDNO1hNutZhhWPWvfLJvxMLZZVkPr3hpEeNedzN
	 4EI998rWOUw6HfPBBHt9u//+XEw8wRxs8rub0O9FiEldQlwIUPaYCpAYFDLvS0njrDd/n
	 DfzzkwiCJFPr4gdM/88QpSf7/trzTPMxCEMnJhN1inlFCwgVKR9BlXzwo0pfc7DXkTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678B7606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 678B7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4fb73e868aaso1807281b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780864; x=1793385664;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k9tAcHgucxjRPGnV+rTtZYrbnfzK1zdVFYrqtBoNa+c=;
        b=an8RNDxUSwRg6/i8iX9nZaEkX7vCxpbnSE2WzgS1C8fa3Lq5dZLXmiBhfSrsbF5NBA
         AQXUeQwf4iuylh2JRB/8LWjPfGBUtEIjvSqbfhkuvP4+ZvagJlamZEAVe3MCbjMa1TQX
         /z7bw9qmB40oK9kTFYZQmVLxAL3P1dzd+r7BduXPIcHzXrF+qvllg8AOAQw6DEq26J/C
         MG2nvUkLHV1/re4MrxSrmXC+K9qizUKhNZLpyIb/LTz2wZs/FLgmtloPSxrnDpPGGycG
         L2KjRFrNebeyppktDbOta96NXjyGRD+3xL1Nu8dIdJ8AyNOEYdsxAsjQTfqUiswjDB9c
         ONkA==
X-Forwarded-Encrypted: i=1; AKwUvBysjoblznOee/31GiBAElItwT/6nlgHocSqPVug/qOqweFEHofmU9bcgGz0gk3JRxnpV5g7Paz9GE0rhWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLE4TkZ4plKGuwzMXid88iGYSCi/kul3/VokInYR+Zk2pe8Cq49
	eRc2kiNvX12D0tgzi8AMgff8J/UxM37H2QzXEQ0TRGtdFy1VKLp4P84Tq1C2+nZtGhe3P+UztWP
	XhaTI0LIooaqWr9SuQbVhUW1E0XFkcpUUc2wiIVcdPdeJkDC7Gog7ONboOzc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:308a:b0:4d6:90d3:e18f with SMTP id
 5614622812f47-55c0026b6eemr56404b6e.46.1792780864428; Fri, 23 Oct 2026
 11:41:04 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:41:04 -0700
In-Reply-To: <67141631.050a0220.1e4b4d.002e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adbaa40.a6443767.132891.0000.GAE@google.com>
Subject: Re: [syzbot] [ext4?] possible deadlock in ext4_writepages (2)
From: syzbot <syzbot+eb5b4ef634a018917f3c@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, hdanton@sina.com, jack@suse.cz, 
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tytso@mit.edu, yun.zhou@windriver.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 2c3447a9c4fe17c713c014f79d2df485f3829c0e
Author: Yun Zhou <yun.zhou@windriver.com>
Date:   Fri Jul 24 10:02:55 2026 +0000

    ext4: validate EA inode i_nlink in ext4_xattr_inode_iget

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13436931580000
start commit:   f5bbbfec59b4 Merge tag 'probes-fixes-v7.2-rc7' of git://gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=158601bb8cb292dd
dashboard link: https://syzkaller.appspot.com/bug?extid=eb5b4ef634a018917f3c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14fe5079580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17e0d2c6580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: ext4: validate EA inode i_nlink in ext4_xattr_inode_iget

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
