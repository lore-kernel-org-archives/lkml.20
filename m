Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8159939792B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468325; cv=none; b=GdSM8bJN0iRn98mWo0Li24Wpmn2fs91Um4lWvBbPKNt8tx6Y76H8kEYxnX0rwEzs31XHiY8gMex9isqRxKVHyXn2Oilx1H21tRtMpN9Te01zBC7QN6BskLTddexQQAi1+s7gcmn/aY1y2oFRGID6cQnVtGEQJK17Rdc6bRpJQ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468325; c=relaxed/simple;
	bh=InP5K0w7SqvFxkohwbq6GIyjAQ5Zog7OqWJK1P9+TyA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oquPD5BWzrnC6l2jwN2Z7a5WN4Pd6sRCbGYKab0XjLypKqGq146o/qEENh2Mzk2o2Rd+Z/0Gm8GQe5wgTWCCWzVq/Cbp0Zt8lS8yMXhUhpJfx051wJ05kSVZtzAc9C59MVAe9B5a1M6nJhGXeFCV0hCCUwTRs0jlo8agcwz4na4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8048c813cceso6946042a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468322; x=1790073122;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IjIJhPRyxB0i2HJujn8wb/d87HXrOhFu1QkWw0RGKZE=;
        b=1zm3VUJ0xetAL2GKU9tPrB7Ge/KFe0lHslh3vswDGOhXrSvBaepdGZq070jeRPWQbb
         slpUV39PjzSTx1F2pCek4bo20d/m6s3TiLL92thLF5NPgIMlIcX9X/mDrZpkHjpZXtVc
         0HkPHhAyPA+K9tcyumTdfrRXESLYso8ycBOOVojYtiChCXb2flS3RoAvEItIsvaaPs6g
         EUP6cICe6i1fjsWNJC9pyj4j0dO5o7ecQgDW9TBHM9p/4wZX1L0ulmdX6z/BcKRTHXuH
         bji2/YD2GogePRHf6lwSyAt3xABOn53v2Gp7sWEuun+WqVgl/xE2/2DwtV37rsSc8uqF
         lBlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxZfVKgYhKetwRbqoLAD8+s5mIeJ5cX3XSBMISR8+/AVRL+IUKjDxNQDj52WSu2bmp1rR058zsYQzAqv8=@vger.kernel.org
X-Gm-Message-State: AFuF++lC26fkmLyr4EjlEvCZpJyb229+K9ymfVgkdxgY3b80IEAK/gFO
	co715rILiMERlLJeuQu+5tSZrSSOC1UtwkqWy9kW0Tqlu7P3bKVpcFJwyMb/0jdIZ4cOtZQ5QKz
	DQaMDwVnXxg6j5ni6FJ+q+RSXko0w4zYE9oQ77L3aAbKONlhrvWoAxdiCCWw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2d04:b0:6b7:2cab:be91 with SMTP id
 006d021491bc7-6c736f641cbmr138980eaf.10.1789468322374; Tue, 15 Sep 2026
 03:32:02 -0700 (PDT)
Date: Tue, 15 Sep 2026 03:32:02 -0700
In-Reply-To: <6aa8a1a0.d82c67ab.04c5.6afcSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa91ea2.4c28b7d0.c1bba.0036.GAE@google.com>
Subject: Re: [syzbot] [netfilter?] WARNING: suspicious RCU usage in expect_iter_name
From: syzbot <syzbot+4bd730aede2791e40bdf@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+4bd730aede2791e40bdf@syzkaller.appspotmail.com
Tested-by: syzbot+4bd730aede2791e40bdf@syzkaller.appspotmail.com

Tested on:

commit:         ee363e05 Merge branch 'bpf-arm64-fix-the-exception-cal..
git tree:       bpf
console output: https://syzkaller.appspot.com/x/log.txt?x=14666501580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=4bd730aede2791e40bdf
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=175f2115580000

Note: testing is done by a robot and is best-effort only.
