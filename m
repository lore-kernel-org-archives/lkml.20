Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63855505F3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954966; cv=none; b=gcWSe6i+TF0InW6U4bD1GqeFseGvRY9VIxjZkhEeyLY3W7czAhtnPOuOBMxHCrcDJ8WXsibI4sDTQBmVsxj4opkGdvyfZTaujndkNQnP2DuuQ9x1BqWg8+UDqEHYgcpFYo0D7c9mZT85l5eZkNmIm1qO7jx6d2iP1H0RHMQWt10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954966; c=relaxed/simple;
	bh=+LEjRxDKBzzhHyokBjaINBX4C5I8qUusFGu3tU+npng=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=W0Y2LfYCYRdPOg1sh4SUp7vWhskX4CmZKjtDXymLr9HM9pu/Q6kNbklQIk3lleZeRgxQUnXNjnQzp1TrjeCtIORqxOp6WDL843HiF0fsiRTDRI9LXiYgjhiVxfsbvuM2G6IOuCPBZhvHE/Su5xUH5hMjJiNYdtgxpzXarVfPFQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1281dd14aso5569307eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954963; x=1789559763;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2R1hsQrSk9jwwfP5p8QXcvxJvDhdt31BNYDAo7xoJh4=;
        b=b60/bb1giQdBP+ciE+rIcGhlsB4QZ4pumuOxjSDiu32ETyt/yEpoNzYbJzGBgt/t18
         bRMBvsKQWQY5uu/PHzHS/MzezuqCLd1jF5E450utXLbWs7dAkWKVII0Xa+h5LNhFvW6e
         yhlg2lranZl4S0nnGNLNfJRax099zGeJyS1f+IPMDRXiEIh7ZfEHxfRzleQBBh5+Y/bS
         yw+KsbZ0IwsIxDvojSPt53tv13RdO/ruXYo09vJOiD1CdWf0FFjIERE0I28QVUBvA9mn
         FNBwzkFLZAJSuxdih90BpbWR+2QAg4VzGDls0wghlM2doiVbwJ5Qbu+oZt7WwAzWCkW3
         moKw==
X-Gm-Message-State: AFuF++n7Pi8Mzms+31d8lDaj+QENhHDyl5PqW9ekqYKFYyBKE5VFQY3q
	4EfI1iu4N/p2+LLRQr2PNVkycAwfjMqFI34qUk58K7AfwU8kAdaTj826Y5WrSGAbYahWu6cArRl
	YNR7TE0bsAFqHh5AvXBa80QB8ayhaFikA0Jo7ivi6nP0vVB6aHXNpcmiWvF0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f034:b0:6b7:46fc:1ce with SMTP id
 006d021491bc7-6b746fc039amr17201226eaf.45.1788954963730; Wed, 09 Sep 2026
 04:56:03 -0700 (PDT)
Date: Wed, 09 Sep 2026 04:56:03 -0700
In-Reply-To: <20260909113541.8544-1-syedtayyabfarooq08@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa14953.6e6c5f9e.28f11f.0025.GAE@google.com>
Subject: Re: [syzbot] [serial?] KASAN: slab-use-after-free Write in tty_init_dev
From: syzbot <syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syedtayyabfarooq08@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/usb/gadget/function/u_serial.c:743:26: error: expected ';' before '}' token


Tested on:

commit:         893e1178 Merge tag 'x86_urgent_for_7.3-rc3' of git://g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=fe63e4d633540f230624
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12abaa15580000

