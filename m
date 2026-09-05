Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79B41E98EF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 23:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788651544; cv=none; b=bXahvfc7Tq2ZQ0+dZNnqdd+i2g2bTJT1R3Zj6zGI7Vaczp7oQALHDVxFvh9umiDgaH7bHxyUgUdejeO8dA4EABaPIb1reD9TCdTZKvsTDhk/T4JJZj3QfXJWkW1+RY4SHJudWcu4rWmMuAHayRxzWJ/jG4z7sZNkTSswcWybhA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788651544; c=relaxed/simple;
	bh=w6esUUNPu8BpPol/KRZXiWuoZ2jzAQ93b3hbqEc5MEk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hzS3npyTPNs4EM4rKht5yEI/fGS3XNxsKhjAr5DQFdBtMSN3chF/0Bq/56LNjhgrNsNeF5z5NikH1IMQ0bpVPjkOfRm4sCq8fc+oz28mtBpDkR8HY/DUk2MWz+Rcfx7SxKyZqgumlxYZRfJSA3/45tdtyM7rcPbni77hwfta9N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4ca7ce3fso2687699b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 16:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788651541; x=1789256341;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OKXoibRSw/wOsrV5a7d8BhV7hWNdQ7b1sUhe44l++gQ=;
        b=bApcI8Rg8gt2fDcBPlrs2A+tajASXtCY/lD925KVlLN0NqN3S7Tb1efbKT1LKXsmrk
         rkMd4V2Ladvy1VOdspDbYUjGANHuFcxzmE9G1XFF0EmZYtZQX/oV2EtiwI/lJrqSybIi
         0ELrv1xg8WrQR5XJGoZ0KNnb+YWCa/z4qeCsB8FVjoOrG1sNaSRhMWvwtFOzWYtFjxa7
         jdi7DnsvvUgElAg/hpKiLvHT6t7z1gH8EiRd3HVRby7TA9Qfj6DVP/xP+SEoXJ9aoa+B
         HlW6glS2zBc8yWObPxErdVdBaV70BbVEsGpYc/X9nWD/0c/78wf4t2fclayAA166FsJl
         WPDg==
X-Forwarded-Encrypted: i=1; AKwUvBwFzbNONC5eaS32JNg9+fvqmHolH0r6BGamXuDYzW28IAnQS/qgpXwVCqZCbu/WB1RBGUUx/a3i6kE6g9I=@vger.kernel.org
X-Gm-Message-State: AFuF++nWdN2xmpsSwGHOdO6leoCRW2FEwbVM8U7/zKgIo7kWknGnA5mx
	KUmvHPrXjMp7wJg1qwBc19JV9c2o0HIHHEQg7o0eDp3BEOYP7xy8FBZ6i9LNH4RDVBrstUtnfqQ
	H8UpfIVC5HMPTyTvPTuB2J3cJeV9QNnYOCCOVL/uk+TLWTGEca94YQnKtWFA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:201b:b0:6b7:46fc:1d0 with SMTP id
 006d021491bc7-6b746fc0280mr8338537eaf.47.1788651541499; Sat, 05 Sep 2026
 16:39:01 -0700 (PDT)
Date: Sat, 05 Sep 2026 16:39:01 -0700
In-Reply-To: <6a42cfca.9dc7bc9d.3393b4.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9ca815.2e659fcc.61e1a.0009.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_readdir
From: syzbot <syzbot+cfc6e8106bec1c524f7d@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, gality369@gmail.com, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit d62cf685d12e95cc0a4122c43cd9f0eb8bba0b4c
Author: ZhengYuan Huang <gality369@gmail.com>
Date:   Mon Apr 27 07:26:50 2026 +0000

    fs/ntfs3: hold ni_lock across readdir metadata walk

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1376eb49580000
start commit:   02dc699f83d0 Merge tag 'kbuild-fixes-7.2-1' of git://git.k..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10f6eb49580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1776eb49580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=cfc6e8106bec1c524f7d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=107a8db9580000

Reported-by: syzbot+cfc6e8106bec1c524f7d@syzkaller.appspotmail.com
Fixes: d62cf685d12e ("fs/ntfs3: hold ni_lock across readdir metadata walk")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
