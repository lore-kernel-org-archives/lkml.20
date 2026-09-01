Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AD44A2610
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294065; cv=none; b=LA7ll4dzSpIYyGurII2Rm2sGKt3dJJOtbF5QlEOf+qr4AaQhICCybiXsRLwBjmHF0n+ap+9FojSRbmEFelAv+DguWgSTRNYOS72uIGVmqwSAZLB26s1obxvOBBwHPUzdeUbrWquSRbX+LdKUoCbRPk1zp7gPh6AJSdn/NhcTzxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294065; c=relaxed/simple;
	bh=PHnSx1aHLwEJdoxDJ0HVqK0IkiIHE20Fcj9c93l5ATg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BdPJox8YfOwzlTZ+m2E4MGKfI+AwoaIvrj30eALlFri068Ag5NyiyeaIJKDfJgxw41Fg3Cw/PNQOlvnU3U9AJ73kzrewF3gvLKXxip1oSVpyVmg7DX4Z49ph7dzboLB5ROmH9DyfDjLL1aw6c/FDSG33QCG6CHsSjGEm0dSv2yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4ca7ce3fso325760b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788294062; x=1788898862;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EvX0uzqpxGZhTbnSL8QSkWNdoMdmB4z8Wib+nRSYeHA=;
        b=a5bQ/BB0bsTG/a2eA9C6zpE/jUAEWb+tps2pAQpojhlrXiIQla1/oMpIXYw+9l8fft
         DnJ9viNZ0KANzAEW2lL0gs0XgdWhU7GIXmTKBSwTI9D300NHBzW5sC3NUStBh38g41vF
         kdlNa0KYils8MDH8WmSsaf1/y9JP49bhVxwEIZW+0Pl43fm3U6Hbd2NieU/XTU/8EMp1
         pcN3c4cJeO2h2+WJFNZztOuv9PBsa7P/QA566etM/ll86nMtKU96K3YCbSjbuxS1nVzY
         K/8j4gq/yJiJqmCnO2iTeFkyaY3m7AdDMBfjoZO/DpS5rVN13FF3ivMENqCRl66re3Q0
         TnUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJ1ja22J8C0RUlKz+rO4uvCKfg3QxUR9PYZ6A/5Aiahm9duNe/K3LRmnhOOfR70rW4iR/guinjRXnQcgc=@vger.kernel.org
X-Gm-Message-State: AFuF++m0TxPCmvL4JUAgZLccNDu5WmQZdtRpF+sjwnkwerAM/xiepd8r
	IUimWr1qFhoPlBViTV/OizyQLbsiGCIHUGVh1kOF58Wvv0sdXy/3juQX/pKL/3UGlTsJNZpXy8J
	Rz4jNzfpiAkNI0NllmHqBXmHQtE5HfOkZhps9t+2/ehOF2444G7wSlUJcj14=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f03:b0:4b2:8e51:aac2 with SMTP id
 5614622812f47-4b692ae5ee5mr1016705b6e.8.1788294062463; Tue, 01 Sep 2026
 13:21:02 -0700 (PDT)
Date: Tue, 01 Sep 2026 13:21:02 -0700
In-Reply-To: <20260901164329.53227-1-godanaemiru@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9733ae.9266084e.bf0d7.0000.GAE@google.com>
Subject: Re: [syzbot] [media?] memory leak in vidtv_psi_pat_program_init
From: syzbot <syzbot+597f53f8e81b2f87620c@syzkaller.appspotmail.com>
To: godanaemiru@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+597f53f8e81b2f87620c@syzkaller.appspotmail.com
Tested-by: syzbot+597f53f8e81b2f87620c@syzkaller.appspotmail.com

Tested on:

commit:         786262be Merge tag 'edac_updates_for_v7.3_rc2' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10cce779580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=65c7e35cb51b5fb4
dashboard link: https://syzkaller.appspot.com/bug?extid=597f53f8e81b2f87620c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=101d7349580000

Note: testing is done by a robot and is best-effort only.
