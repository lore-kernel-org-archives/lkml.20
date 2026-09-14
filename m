Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A933442B06
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385765; cv=none; b=CMjcBiZkHRn7LrbRr0ZhVJylgVwQaVDePEjIGQujBfVv7FXovnHPgJWsUwoZbCzZu3ZygCwTi3UD5VqM1Xy+Ddh1Vczl+RIhTQhGIECFPz349FTsW75AT0bO+lQbTASTiM3spnr4na41hc4lD7yfbmVZqONGA+sagm9zHOEUxf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385765; c=relaxed/simple;
	bh=Rph0Abjo/lt5YFlI4ADuF91JvEppjAM7d2toFKQooxQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YyUyCGanGwFmyAvY6JSV1OP5J9bIIvlMF8UKLLkKHAYuIb2cnflX+KMD8c/BrHJc49L/5H0i6gL6KUKiRXlnU8ZaO0Zj80CS+eRRCBglEhfgT5+xmAVKBqqaccNiZdTYf1kdOv+4h6d/bCvZokp5qO2sSwyWur1UE5piFweKiY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-80497c6ec88so4247275a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385763; x=1789990563;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NrNoxDVQMABFpJHxYtXjMjHDfoWBRmY6C9wXR7yxjho=;
        b=UdsE9t2DRPMIBSC/1SL0YdSVJBswGTtf0WMbfOLU3lr4td6IJjy7Q3IurIB9hhXlPp
         WXRYAH60w4iGhlAcAKX2hC48LuZ9cgCHFlph6QvB2JsUkBqsN6PsN35hdxEX76or7P/S
         jSNvfnXoFF607p8MN/WadTOyN73qcppc6CiX63jkEr256ALANGN3sy9TIBd2MywnEeo8
         +jPuMexdqr0a3Ib4sVwpy8Q5fo7EY7bnRMVrpGM1jit+sj+2RaOKED5FkkYoyGCWqXUI
         VqSAeWybqZrcm7v5JfcfaOJk6CZjGbV6VzolrkYhaN8EP1mIz0nQKF3ljYO2qdFei6h1
         /aOg==
X-Forwarded-Encrypted: i=1; AKwUvBziXZCp2rScLlw2cCVoPxFOCmidZ/UWJIeMTrrENvv6OUEviSYKH88PJWev8UHl/JmOAxX2UF1GdmpXZpQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mA37PRkVu+jVcQ/lgStHuaAcgIpLam94IBgxyISZcOVO2lZ7XA
	pQPXqWLHQ6++C3tRorpBRIdrrVpxBbFK2eDtUI4Cf5TGQPROVoifjifYM4lrKw8ow6zQQAlD+PH
	5ridW4z4DhbmLNDRiBYk4FxDDTsVlpD5ryaVTU5zvM88Z3NPA9vJrru80hns=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:159f:b0:4b9:a829:f016 with SMTP id
 5614622812f47-4c7b5c8e9b8mr1297547b6e.34.1789385762872; Mon, 14 Sep 2026
 04:36:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 04:36:02 -0700
In-Reply-To: <b85449ea-38a3-45e8-a05e-03e4b4f0a84f@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7dc22.a211d2ce.1a5198.028f.GAE@google.com>
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

commit:         704340f1 Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12042115580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=d632e93ffcd1452bc61e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10382115580000

Note: testing is done by a robot and is best-effort only.
