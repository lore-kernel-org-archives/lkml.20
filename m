Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598DF19D07E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789361224; cv=none; b=BpwgMvBb5iWKZeUF6QbNgh63B+3rYlsSKiKpdW9hiV2y4j6QDA650SVoeTox9dxq2SjDw/MI64kaG6BEQUemOitM5eFbBAxDtWcQlYAwXRwWiGmc8V2v41X+zDB1aL6IYB8DzXiFH08nY7Yc+SrA24NN6tIs5jXvRRFLH6qPBZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789361224; c=relaxed/simple;
	bh=74GYr/Fd2pHSv9bdISAwQAOrI2Da2FTmtVOflMroN8k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZOTBSgCx8d8g8AoeAyz1CZ9ybZXqjNsHMyNUCpmVcKxkn74clXghKvOidZQTpODdMNXLnXYwArtTnBudVtUEZsBn6lQSqddOCx32fgFJ2uSTnvb/4HWTW2VMuFs5jG1l2Nw9J8VjrTghqEEVu3z010MGWv1FZUgJrCyYD/RmY9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1ac969b92so3440333eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789361222; x=1789966022;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mHEpFXch7ARTA9y9YTmtDjlSVDf7SkkwYCca8egmIE8=;
        b=LZPwU5/w4KNQ0pDQqAkzI4nTHO5nw49nDwahyX4mH77sbzTxFhBw1Do+olM2MNb5Jc
         JdfBTgya6+RG0SrD3KfIOmKIa0Ux3+UymuwYPP1G3rjlt2JkOowf5VkS6MooYyE9+cq4
         uwRiSlIFaO8vr3GkURsIVuBPBFCGu7zvCQA+Ui+zBdfakSlDOIUque8EK8mILPb0O2ri
         ZaEnwUBI5apScSE3nzzwagvgBmYVT0KRKBP25yzjaUbXVceK10w5O9cI+ohGRND2EfER
         21ZyGMShYAOsBSDo3S6k3zLi4XSdN2zUOOTqLObGWmF4BZPGLaKlq8CXr8VleaXBXzk6
         O+bA==
X-Forwarded-Encrypted: i=1; AKwUvBxss52ZwfuiPbbONKYUWTzp1vUHX7Z3zPJP/eh9OTA2OFf/w2vcAuFO2kwyPl9yGX9MxBNiXrKFrzR4hCo=@vger.kernel.org
X-Gm-Message-State: AFuF++k4p1e8O2UhSBqITc2yLwA3AUNo+FEbby26oGypgUhrbv9LuHsi
	4Bum6JQ0I7KLr5pPP6dIX2Kp0Hu1qFBnhn82iUeYXR0TO61LIfsFJvZoYINKYEC6OsLUtrd/89p
	2xNsQSvCZpDzL4SIH2YL3CfP17aNkOzQsvnhptoNGXqssbdH5O2x2BPpJ77I=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:190b:b0:6b7:8415:d78f with SMTP id
 006d021491bc7-6c542831d37mr412665eaf.58.1789361222328; Sun, 13 Sep 2026
 21:47:02 -0700 (PDT)
Date: Sun, 13 Sep 2026 21:47:02 -0700
In-Reply-To: <6aa7763f.8ff42d3a.a6660.e668SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa77c46.3aa11909.1a03b8.005b.GAE@google.com>
Subject: Re: [syzbot] [block?] UBSAN: shift-out-of-bounds in null_process_zoned_cmd
From: syzbot <syzbot+abd6a8dca0f2b7726060@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+abd6a8dca0f2b7726060@syzkaller.appspotmail.com
Tested-by: syzbot+abd6a8dca0f2b7726060@syzkaller.appspotmail.com

Tested on:

commit:         069f4aad Merge tag 'md-7.3-20260809' of https://git.ke..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=144b1901580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=acc0a882b963ae23
dashboard link: https://syzkaller.appspot.com/bug?extid=abd6a8dca0f2b7726060
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
