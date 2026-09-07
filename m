Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7731149DF1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 01:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788746339; cv=none; b=ADqZTlsRnzOcKBh9zdJhDdBcNFJbRpGFjpD6sHpfeITTjUpeUXY2WJliXNaENWjDQBq9y1/SYPS9gcwmQPKOpe0VCvO8K35dBSV2UJ1kBckNc8Z3hnH9XrJ8/bNOD77WGaR6c+yJRKG1puKC34w92evEUlbrTBPYaFp/8YBic+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788746339; c=relaxed/simple;
	bh=m47pdD/jdfD1JCmnykwdzvXGBShTh80dYYEGMlvWIYk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=N4yQIaOwV50qC+8bDf/c4zRqd4VX9r6xjztnaaW+ssY0s9PArZ7T7hcb0y5lR4G4LlMwRS4QIYm5UNi7fKg612S63xTUxQW05WoY/0/db3lQq0JE9+ZXfPr1vkh3bABMN3VgTahNNobnNQqDmMJ8cfKBXLtcfkDzX4KD5PXlG3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45952ce9ee0so4799677fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788746337; x=1789351137;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m47pdD/jdfD1JCmnykwdzvXGBShTh80dYYEGMlvWIYk=;
        b=Lvz10Cmb337O9kJjhTcNoaDrGF7EPimjZGz1NJKbPJ//hGDMkVjIwTHdlTj4o6xiOO
         d7eLaQ0kIcRgbw4wkT9rAXzjjjkuHDln5rTIATKVNAAZt7Tx713sLsoCiUJomgSgHWVY
         BlWxESzK6J6REBUwn5QTudoMSW+aButAKd+K+9wIYF5jKjpIkfJjICcDL60IPaRAka9s
         kHjo4VW9IvfnIoRQFrxlaMJGoO/p6A/o+HKdBRJPmIV9I8jiUowqtjeMeiMJJWhKliR8
         i3RLpUKyL+MhGvvA6bBuze6Wl9DduFsOh6xuiVSW8Z/UFcEDjLp5HZYqb5uBfK7cewm5
         FGKQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3yDtlxtKraAfCZq0V9oyHSj5+UjACGSSHb2/vWWdfxtmlaNDH2ebpFIqASgYqCT9KvqX7ULTWaYWQl8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kXuOwZqJsWYUU9E75XAcd7U+D+e2dA+YHdLv2hWDTO3cLGMfG9
	h1KLrRE5+wHIdyUkk/RezoVoeR3Zo6aV9+lUHsV60E4Ia+PMh760tk+dEjBAAFinFu96N24aBuc
	M8490d4hv5brZAcB8GwAHtByWm2KSsRaBK23XGHx2eLNQCf7En6UsJCAaLVY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:220d:b0:6b1:4061:4193 with SMTP id
 006d021491bc7-6b6f7988a8dmr12379965eaf.0.1788746336841; Sun, 06 Sep 2026
 18:58:56 -0700 (PDT)
Date: Sun, 06 Sep 2026 18:58:56 -0700
In-Reply-To: <OSZPR01MB93135CBA0C129FF40C4ACFB9B2B22@OSZPR01MB9313.jpnprd01.prod.outlook.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9e1a60.a6639fcc.23b8b0.000e.GAE@google.com>
Subject: Re: [syzbot test] WARNING in __fsg_is_set
From: syzbot <syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com>
To: tkdkei@outlook.jp
Cc: syzkaller-bugs@googlegroups.com, tkdkei@outlook.jp, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Hello,
>
> Please test whether this issue still reproduces on the current USB testing branch.
>
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing

This crash does not have a reproducer. I cannot test it.

>
> Thanks,
> Keisuke Tsukuda
