Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740264;
	b=P/GBc1mt9wZKie2pHcq5/8RE9Vil4OT/aS86VK1G60i7NfYlacI1mLhV6XthAm5ATAOh
	 yOlja9E23BQDAN3nIfgzHwSOl0z+oXTrn3he+wb3jC2TLHmqioOH2svyd3BU2YOqd6nH/
	 s8O7ZNNjt1zepfD2fSyPBdLedpmJiM0zhj4+Y/UUO3U59YE6zeimW7eMb7pSe6dz3J8cU
	 8JUOq7CPX0m67NDyOjSPHEQ13v0YyOO6oOf8h2W/z3ZrBAOLDSIYAw7tMex4cQ69uvkNu
	 a6kGwgr9+zgquvIIBg+eumELvBUlj9u+lxEt0cFwSITgTcFhj3HWcDvGGVl+0/u0KAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740264;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=xnV12IxUz4dJInZWrg+o/jN+e4dyX6PmEVOQ4HDpnIA=;
	b=mL0Rwq8cmuH/UPSm++NG6RiNOXJ9sBKxbfvt9j/gn1SufEO7qQlrIGCAbXZM67UonLcZ
	 ja2ysdpTJTDCh85U2nq7exr+wjLu/7sLE2/RLLFBBGUDw3uWv1bMMLBvlTnw6wwRGL7pG
	 xb+aS/a/qAdG8wXnKG7w+kPQxDgcj9TTLNWd30gAq40JvEmkGk3YUxq7Cw6PQS6Z56G0q
	 fJYajIqd7ZrwmVz7IV9dLmWpNnNzdd+slUAO1TjUPwke8zJMUJwZ1QtFxVhNsi4HXF89I
	 +aMJzxetVRJ5Jq261I8yjoYk1emCutIhR5ZZA7bw3/iaQUQH0TcVzTu1lj1ZTQypGUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45109606D81B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45109606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-547ae874949so55717b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:11:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740263; x=1794345063;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xnV12IxUz4dJInZWrg+o/jN+e4dyX6PmEVOQ4HDpnIA=;
        b=NcMjS1r0/R6a9REv2KJvxLOCVZ9TcGBTmvutexYIiOGyuc8FxUKYJCaAXfTu3lZMCf
         gphEAm8u20GuEtKpElNXi0hQZQaZ+Ec3dh5ykWvg9SgyEPjbKd6sanAJQoR182QznSfj
         0P8VVqKp6SupyKrIIBd5ThqlvZ5GPutUP6gjiaCoV3V7t8ez4bSRJK8OMtw/Pw5ypkB2
         tCr3D133ztviOvhG+bVmjT5l54qigxwcKWqivUKBp996e9b8ia+2FCKGtzuZfBLbdQwU
         OOLl0ROxqaUXW3rQoMcRKJSonhZn0l1k5eamL4QJG1OjBRIGQyb1nuPHqyBDQnVneGcM
         CPqg==
X-Forwarded-Encrypted: i=1; AKwUvByvNcVERu9QSxmFQoJXJJHkfYmuUixmDcPvRzow1wGb3Unn7CTMsvZXvTtEw6yKTPjpsjmyVUEo6HWwK6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KjUQu0WXF3MVOIXs4KxLUDH0+jEiKyOIV3URA55kNv4boW+fB
	7Bv6lerIJszlbVgn4FtxvdYkvZFU7iq1esuPMu2Vx6I4u6A/s5SFZmI5nUiH39wO7g6tiJvhu7m
	+5ftUlzL5apjci8MvxKvORkaa9u/1GxQkO8CZXcayN/eKnGv4iXcIa+n7WdA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2218:b0:53c:2a2e:8650 with SMTP id
 5614622812f47-5640df72f37mr9644450b6e.34.1793740263256; Tue, 03 Nov 2026
 13:11:03 -0800 (PST)
Date: Tue, 03 Nov 2026 13:11:03 -0800
In-Reply-To: <20261103091833.26594-1-diasyzhang@tencent.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aea4de7.35baff64.2c72b9.0009.GAE@google.com>
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

commit:         6628e7d4 Linux 7.4-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16f8be69580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=441b6cc593d83cc4
dashboard link: https://syzkaller.appspot.com/bug?extid=fe84fc6a684e0beb86e2
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17cc3c8d580000

Note: testing is done by a robot and is best-effort only.
