Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627A83F1643
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790516344; cv=none; b=CkZOp1uUleqo7N1vwWl+4QA/E9bxebtNuzOWYlWCNSulX5CSztbsVs4eA312/DFlcNHp+65wuSeZouBPsqZoyDxFhlq3AxpX/Ep7A1zqlCrTe4Qv8Y9s4la2sLiBEGXl8uKUKDIa/kSiH+RwJ9ysDrQSIMaUlrTp4yjVEAil6Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790516344; c=relaxed/simple;
	bh=7PjMk4yHlng1qfnTVrH+lxB+6CalEQSKUZTyyQPk01Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jJXLNB8Y63+flS2B2+tO8tgYF4OFh+Xu2yI9hJrdaWNl8bwi4k8TaTvwZ1Ds2qHKY8EsZ3skCayjwl4bLv5rxckgizMW/Z5u8ndKYlUGHm2xnTO4p8sE2TzSLX2hP/F/kv+h3qnVqowoxiLWhWCWiDHDenZcjWCVaK+/3Kzrhfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cb254da90eso4205223b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 06:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790516342; x=1791121142;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BerrRpPiRFUxkHRn1qSbCgBk3nlrLtLRWQYkpRFRu20=;
        b=ZN+pc6jzQCMy2MpPQZTNoMpN8IvUN5v6kmIR0d6sgEQ5gTw6x74m+hLiHHNWAdf7/w
         1SfHXOGO26v7RhsB1u98F7XcWAyX+SGqdBN2Tru4r2VXC21rZvmd+gj/3u3WirnHm5Eo
         aDIyKE58ykuwhe6xyRpcPWEGYWypmcA6d/NJpNst/03JCqzaKFbcWA3uTJ+0iuW9JhRO
         zd8sjJkWnYtoM7Bdesnr9pv3nJMMaUtWZT5VQlchvuwtPHYI/9Lh9I2BFcSR52urtfEB
         0NReE3oLGn+usbMbQiQtj+m0NlhNRrZzYjO4w93WVuRegsrwOB3F9o2+t+6cxkkBB/os
         AV2Q==
X-Gm-Message-State: AFuF++lh7nggxHFp2njM+p6V9Wd/gVjTZYIduEf2RwUY3QEFu/SqxpLv
	/QvK7PBoAtD5v+bt6aSkKWBfmrJNBiMs+Sy0hH/ul4y7Ps2uMCLqE7eqWc/uGb+qtKymXZXyFIy
	ysjcGIRKT432a3020gjdlz+nBqXlwx+G7dq9z+OBBjOXBnkZDH2NdiWrcNb0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1825:b0:4d6:93e2:5bc3 with SMTP id
 5614622812f47-4d72f4452b2mr11177041b6e.68.1790516342358; Sun, 27 Sep 2026
 06:39:02 -0700 (PDT)
Date: Sun, 27 Sep 2026 06:39:02 -0700
In-Reply-To: <20260927130722.2065-1-nsvatoslav515@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab91c76.dc2998a4.2261f5.006a.GAE@google.com>
Subject: Re: [syzbot] [raid?] WARNING in free_conf
From: syzbot <syzbot+6a132745caefcf42cb0d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nsvatoslav515@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/md/raid5.c:2448:2: error: call to undeclared function 'shrink_stripes'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/md/raid5.c:2716:13: error: conflicting types for 'shrink_stripes'


Tested on:

commit:         6812ce4e Merge tag 'drm-fixes-2026-09-26' of https://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d4242cb1c54cdf7
dashboard link: https://syzkaller.appspot.com/bug?extid=6a132745caefcf42cb0d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=159bfd25580000

