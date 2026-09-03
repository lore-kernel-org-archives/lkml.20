Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A37B1E1DF0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408186; cv=none; b=S+j4L5ksT4Lbf1RWGimfZpLJY0RnGQkECUSzJzsBFQJCCtsomE5963Sp024lLdCSyXfRs3lgSAu9Dkl3TxxR7TC9e/zhfh9SrQ7N/KhTOpkm2MJbeUMpHjN9t9hZFqtVW0sqxvCEwVVk7hHAvku7Pbh0AwvWJ+M/Xb3qqIFTS1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408186; c=relaxed/simple;
	bh=Fwrt5ORySpdxjVnYA0aMY2za1DxOj92uIl4Lre00X14=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MTwXdZhIhlM7deafiA3ZQUntHJ4anfkTELpwoto9FpNeaXT16actKwJ4oPUxmdwj0rhjbu+Xiod3SDjIw6DCOJs0w4xF/52AuihAmBDfUX1h8+j/oJxFPjYz8mL0V/o+cZIhi7Jdk1Cuc+I/DIcYL7UXORXs2lV6MLB2vRjSfyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4eb9e05a8so2045406a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 21:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788408184; x=1789012984;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CU67Dn2lex35hSK8KKh9wv5SAtrXgOVQpI4eBCQSW3c=;
        b=GJQuyjlRxZwY7yOckJZ5DHYC22zK5arq0iGZgOto6Jz3/aR1ZdgPDmwXQ0UEmGxCFR
         wLqbRBL0t2ULPbIm9TgX7zpJSQReuoDNHuBn29yXJBKXjxfCBp5VGhqqh6Akrev3xGTN
         2MWv1ydl760tbGHs3pCB4U++IUThal+YBPQXUozzmbgrAJhL0qiEUM1ZzCo0t9sHPKQK
         mri/ciaW9fPQWfm7mEoQUdDROUx67F8T/o+T4CvaLFTgpx1MWLU1EVOSoIkBiGXQhNoN
         Jm5Yl8MIma1ySf8ulSziT+iCsmm2xBk9VrTubOau92vagUe7ezSJlqhmMTkhumqKPVwP
         yaEw==
X-Forwarded-Encrypted: i=1; AKwUvBwbSsD9/V4kl7FdIeSkry1n47kn8+ajrvmge4a7sr0yTqwKV7Ydjb+Fk/EOzVrQqMWg0HKjEp2cjcq668I=@vger.kernel.org
X-Gm-Message-State: AFuF++k8SGVW1CuoKiTnyEjzeN8Stz/8J4yCpgYLLsguA3bcvPGxKl4J
	G183ZBu5ESo+WEFrcVYh7RuVFJ6uJCG8cJWr+JAXlg38oA5nzSWOtKEDVYLSYDz5kx/31M13KMv
	QTxA5VuHSZLk4wQ361kjf3nZokch7rBwgSyaNbsaKY2mddICkX5LKVrDSbG8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1997:b0:6aa:d97f:453b with SMTP id
 006d021491bc7-6b481437811mr8382424eaf.28.1788408183963; Wed, 02 Sep 2026
 21:03:03 -0700 (PDT)
Date: Wed, 02 Sep 2026 21:03:03 -0700
In-Reply-To: <20260903034152.122978-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a98f177.9266084e.bf0d7.0016.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in keyspan_break_ctl
From: syzbot <syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com>
To: adrianox@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com
Tested-by: syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com

Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1373bc15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=473d7477c523b41d4046
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17ad90f9580000

Note: testing is done by a robot and is best-effort only.
