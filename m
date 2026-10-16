Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1890470111
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147687; cv=none; b=rNTl8ecsPRruxEUo0QsVpDDRCaQKZjzaIXIe1btWKpHxhuggKJVQfLSsDRnBrelU39n/c10Nrv3E2WCN0zFIIvGaojjIm6uF1U6DnLkm5U4YlhbXqDta9zMAN1TQE8RyDzH0xRkzlggutdz0AYJWLi3ZQE3vOBF+7D/KicSDnvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147687; c=relaxed/simple;
	bh=ReY10u/u+A9tgmHFBvA01uKFwH1PoVhczr8HtphZkbs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sMkCoOoH/x0AcF38qGWeqWrD1ggaYa+w4nBetZ95ndBgLe4Q/l2Wa+rINYcTfu4N+tkjNioKAktFHOxekioewbRpF8SLqKenpjCzYSvYP9l4XQQ2pe5ArJ2FVHveeiXHzXjUPy7asXiCFzsZIf98G2oxWx5oZtgoX1/vHKp8rOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c307941971so9238148b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147683; x=1792752483;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H4/LG2eYwBi5U/V8c8t5WoWrlsGdHaXywL/Lk4jqIf4=;
        b=pYnDDNleYNb4Yglf5R+9PUaEptQ5KdRRpG8uROvTTgjfJpY9Jbadwka6Vp+J9ZZXg9
         eqdpfh5o800wUip2wZmHG3VOQiOsr870GLoVIuFTipkqJdCPKTLMZ5U3PsfNNADBdlav
         xsmijX/i+VQ6wbA4Sj5Al151z1KXD+kGW1sQljAcbWQk+WVj+U3d7oGqAXmn2yz5NaSM
         JhiPoxST0wAQz/HVs+dTHiNqqRhZ27gky0z49QoEtOjTlk5h6XE6abL674j2TSGyV4md
         I4x2rM35BXgoK+pd8kPkDmmOxLA25+7LFpVUz3DAnyXysobSgtAFo8JU+2yUDg51qymI
         SULQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxJrCeLlzG/rHfMGOPXu8DkqKl6N+nLGApgIHWLFIzMV01mESTGHdsYySayvk8p3yfBjA/5q5nAN0RTRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYfmo5F4pav9LiQSvc6ICj9sq4eruaUGEKIKgroCUXYLqG8IBm
	7tWuMPS9/+FX+dl/iYAKyOej1Yup2cRebriLHDVNCzSsz+Ay6mnPhP7GrAmHp7iWGVEWAWcBVIX
	RJM1xTxt4/RMBPoPyPJtMRvhBLrD5wHFTMjOE7pxEtCx3GzSPuZDyeRixhjE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:64af:b0:4f6:1336:cdf9 with SMTP id
 5614622812f47-524891847dbmr9419850b6e.35.1792147683748; Fri, 16 Oct 2026
 03:48:03 -0700 (PDT)
Date: Fri, 16 Oct 2026 03:48:03 -0700
In-Reply-To: <5de8ceec-06bd-4463-8de7-972dac1faabc@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad200e3.7052420f.14cc67.011d.GAE@google.com>
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

commit:         b0a42af4 HID: roccat: fix device access in roccat_rele..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-7.4/roccat
console output: https://syzkaller.appspot.com/x/log.txt?x=17b79da9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=d632e93ffcd1452bc61e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15fc0031580000

Note: testing is done by a robot and is best-effort only.
