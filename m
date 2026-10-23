Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788784;
	b=dLvz/gduRvmJS5lBjj0aTpZ6ZwADM6ELDh1pnWgVenvlJF2HLwi7nUURjZz9kU4enJjo
	 c4AAxQ5pvJn+MWli/IxfGOFlheRwqy9ntxuO2NcEfnWvvSvWoBl/g3lDNIvehse8vDOya
	 sh+Ik1H9jZHu8LAKdnz6z463NLaKdqbk6u72g9TeGWmcHQp/044WkHtALiq1yHA+cY1Ti
	 S4qtAPkfOBp0dKi+NyVYRDrxtXUl27zU/Gn7/UTmvkq7eXzGX2EHCldFMrbV4WM/oTvLN
	 rPneHNRq8J+qNe4W1I91vlp1E0bAuZxS01vzGyO8fQY/G29W/kkfnmDMcBvd+DjA9fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788784;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=DdB/BNmuYv7yIPAL+lYJsCtLy7gdJGesdYifv+hYFEc=;
	b=YsW8ZOIJSZAOQ/nseBUzLJ/gMzzG4kExx+NIbmODWzImS4yDKhR0dpV5X0ServNT5MJI
	 7kNUsKm+POmqjw7bWI+7Xlkft9qAcGy/8GgjFcAWSnaXHjbK7zK3l130k3kKr59CK8kD0
	 FYXFS36v9d3oIaJsb7MPCZpeYmBe8gne8o91BDbc8/KwPA+/CIR5YfygekXtLaQOwRMXG
	 pUew0VFYgzX9rx3Z/K2JFaY11CFB8eKORdXWoRUFEJensvtmIHtEEMagO26+xUUoT7BPb
	 T1nB5wQxZA0bnKCaKJ2EFPXM2o+lYQrEM7DR7wNzqqHxgAWvckC3hF4mRtaWvYowOMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD73606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AD73606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b28deb7ee3so2019835b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788783; x=1793393583;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DdB/BNmuYv7yIPAL+lYJsCtLy7gdJGesdYifv+hYFEc=;
        b=f0wYLrHs3PrDGB3CGyTAJe5qWEUtQ/YGdeY05u+7JgVmiPgRGp4+vLZOxerIXdmxV6
         4JJ7A9aK/T6ztVADahZwD19A3PTrf0laPDKAbiUgmrHjc1rBYLiA+LgzRI+WU35N0ek4
         feJy83fz6xGorgCqTaq5K948xqzAW9PmMfVa++zuYzNtTnroqsJMpRlUbtfHQLyBmh9Y
         otezojLVtrJIxsOrWUKOOqnf4Mnig6mq4TSkNKqApkZe4pq39TT7/2fGtdR9Q4tZuwB2
         ehSddlQxcwclyaAkq5/eFsgyzALx5bIK7tiTl3J7HvZw67lt9m/tXzPHs8lmOsLAU5ln
         faOw==
X-Forwarded-Encrypted: i=1; AKwUvBwXA8RYXCp6oeOJx9GR7nreSsKyBPRO66o/By/U72qyTQbcEuOnuxU80+9fGXX5lpEl/9Efdj7xaNADC9U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwn1tmU89sabyO5+1mBAH5V+R2QJJRmwlUu0kWp/n/iE0RvxJw
	OfTX9o8iJ6fsx3bVf9m+HmR3C5peuMU6ubWUC4iEZMz7f6jKxCqRNDiVV9sn2lsyXtzCxTqrj8z
	cyH0f/o96uh6D0rlNOxCrzEmyirS93OTujgv6ldqMljLnsrEcjSYlqhVTG/U=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1301:b0:540:5827:6d8a with SMTP id
 5614622812f47-55c0041bd25mr284540b6e.66.1792788783361; Fri, 23 Oct 2026
 13:53:03 -0700 (PDT)
Date: Fri, 23 Oct 2026 13:53:03 -0700
In-Reply-To: <20261023180441.7016-1-drifabdelmalekmohamedsaid@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adbc92f.6252420f.3b330a.0060.GAE@google.com>
Subject: Re: [syzbot] [fs?] KASAN: slab-use-after-free Write in config_item_put
From: syzbot <syzbot+63336d70e1af377d7388@syzkaller.appspotmail.com>
To: drifabdelmalekmohamedsaid@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+63336d70e1af377d7388@syzkaller.appspotmail.com
Tested-by: syzbot+63336d70e1af377d7388@syzkaller.appspotmail.com

Tested on:

commit:         7a78f7ba Merge tag 'slab-for-7.4' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=151b9fcd580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3fcda6efffd40725
dashboard link: https://syzkaller.appspot.com/bug?extid=63336d70e1af377d7388
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12fc3c3c580000

Note: testing is done by a robot and is best-effort only.
