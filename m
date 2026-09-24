Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A26A2EEE73
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254985; cv=none; b=u9ZPke1RreH9LCumDH0aQ2/ziWS8ESmkxvaIrNM8LdpDvcCCcFvsK7gYOG8MoVvrsyKqUkHF9SVNftwk+6hFAojJ0WKXiB5BUCt+rk6UgRfPzXFQ/F1em6jSjvDvRr8eAjD8vbZOBMuDjPAL0DeMfwwSs0pgok6ZKELsvVGfjvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254985; c=relaxed/simple;
	bh=RMQC+8a4xsIjfQw/e5f60kDmuKCY933dkgtv/Lf1nUI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cahJdAjkFTJdTkKG3TzOHLbAMvEmYHUSeD11ReRCCfvCDoyN0tsSjXVDnXEu6TH89Z70d77pHsbXeqGz8oZnnTnootWta1+iE2S03L0m4PWQa6vhtU788PxZZz9wk7s8LzoJOW6vxP4uhjtHmiTE+RWoXx0GQvdrBPGaE9ZFj5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4f0a1f4f2so3286396a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790254983; x=1790859783;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m9WcNmyw1aeySJ5u4ZgwH0UAyROZ6Yu3Avo1jn+Y7f0=;
        b=sW98sHy9uQG6d2TOT/s8vFN4g+Up0rImj/o0DLsXnKgOAg4FYjQPNR/RDgbX7mui/8
         ESvEHKz9DB570nZLfAIqnlzcJe/NzGKDsnltmCDsBilW5ZkVb+cjIzhGR3DZDTGBZu/K
         6bRCbh0H5eLIWYxE6T3RnRmzRkL5T+zBpBRGKVjOA0kj4lUb/MzW80IsAK7o3RWHY91m
         8HpD/K0meR2s4XXmsy5e0vqQCJ8fqzD6ZPOzXLs95wyat9xb+tDYG/Hi9zHppc+Gm6IH
         p7JDJz56fs4nBfgenRnlV/J7Kvw21dhl00tO1cGU9fY7WY57PIlcZsyxfFBhEjsr0L6Z
         mWSw==
X-Gm-Message-State: AFuF++koM2BG5rlPb4Dce3Trm/YpdgAtNVZ8Qa7TGlyZXSrIxx88sEVE
	WItmxJRJt77J4SJrH/nIWb3T3kY5dnsD2xOOaFF/XhXWQiQEByMMLKZ3CoFGAbqsiprRXFNcpDt
	2V63Q6BvU1FiQpPYOH5D5habrsJEzJakLuWlt2iU39P2e+8ZpdqplZne+na0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2228:b0:4d6:9293:9b57 with SMTP id
 5614622812f47-4d72f150704mr2405855b6e.63.1790254982894; Thu, 24 Sep 2026
 06:03:02 -0700 (PDT)
Date: Thu, 24 Sep 2026 06:03:02 -0700
In-Reply-To: <20260924122205.8270-1-nsvatoslav515@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab51f86.e9f5c185.9abc8.0009.GAE@google.com>
Subject: Re: [syzbot] [f2fs?] UBSAN: shift-out-of-bounds in __f2fs_commit_super
From: syzbot <syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nsvatoslav515@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com
Tested-by: syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com

Tested on:

commit:         3d778354 Add linux-next specific files for 20260923
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=156d9c05580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6993cf63b5648f57
dashboard link: https://syzkaller.appspot.com/bug?extid=dfcbc1741488709db4b2
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11938205580000

Note: testing is done by a robot and is best-effort only.
