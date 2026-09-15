Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FF1368D62
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471328; cv=none; b=bpadoIJXGxICCHvE1vo7JnRNPg309M0D3RTaw/wjvbYOhi3fWywVKcB84E4Wu7DuIFyPWOHpvo2e9E5NcfoeenFOgfASBWE+FxB0s2EMGyBuh+kAcX4CagNH5xSNMTI29/YijUSafZxl+s3OQVGGyw5SuBTpcICzdGNIFxzBZXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471328; c=relaxed/simple;
	bh=381ok+l81XivmTTFKuE8BNGsJN5NhxN6OKOq3iieWFw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tDZKn+4/wELHd5ct6GMBekDf/qRpLhLtCZkbKb9ra16g5SXM1Eq//SIlnG05s/Fu2oM+7RZtBILrl0Lhsap+EsSozxl0SrOTLeZ6bvdDbHfboB6jjmhz+HMIN7kmZU0mUmLBVHh/x8X+P5Iw3/PW+jWZWOIai9Q6KSvMikPv8i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab260600easo1066832b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471323; x=1790076123;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CLoGtts65MsNtPlGLtclFpTZIS3SJNCHIFsNmJQ/tE8=;
        b=luWIbdVTb03QIQSHLDEpxMtBD/U2RsnoXRyIoLbKP9VJx3su6wGL7FWsxvzK3QLTvG
         KCYKFVHMUfaZM7hSfvqv15Iw7Oxy1Kbz6SXgMH1DhC0rWjpiAkRxGUGr9lYtZ8nwb2+H
         tKkM/rMT7HnWSwClNG/B1Od0FV1nqLBM4tfqPAQZDr90t62JkrhqFbvUt3lblDKlXm4U
         YC+dcd/vCzWKBTmZKcS4TTrpdSAV8lDJy4M23zyXJ/8nch5G/BAqKL7NR9C9NOxWo7m3
         N/G65edCSvCmkiDKXcLWZbRlWT9xLC+I+erXtlgmiOJH/7mE+LY0k2wsiR6TK5r9mGWV
         vFXA==
X-Forwarded-Encrypted: i=1; AKwUvBz7Y+kngl4nriCHOU+SgoiHPwpPo/hksCe+Ge0wzyq72oUwVKG0y2D2qYpy6bEnaRK6UJ53BXkDmuqaqJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mp6MUg6KDyZmSw+3Yu2yNU/fJooo2fZuhVtrffIm3a9T+tMf7p
	HPcGTtlNFA1zxeGTX/koQJf4RbPw0jy+2mBS/szc6SXzpCvUjuZecB70F8JdWMr7aTEMFlYtaph
	8c1ei0uRs5e+bNkqIBmrWCtoyO4fdwQEk9aKSmS2HQjFSR4bfiVWL0/XSt1Y=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1990:b0:6aa:1bc8:ae0d with SMTP id
 006d021491bc7-6c636f2b022mr1652881eaf.4.1789471322894; Tue, 15 Sep 2026
 04:22:02 -0700 (PDT)
Date: Tue, 15 Sep 2026 04:22:02 -0700
In-Reply-To: <20260915110030.918688-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa92a5a.4c28b7d0.c1bba.0038.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: global-out-of-bounds Read in bus_uevent_store
From: syzbot <syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
Tested-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com

Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1030fdf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=9a321aea9d851b299486
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13c07905580000

Note: testing is done by a robot and is best-effort only.
