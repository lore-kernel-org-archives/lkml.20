Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011944;
	b=gvxFYmRdidczqeBwOBsde8TFMQyXp7fWdjU5zkhSv10PFnAXTWZbOkT5RmcbW4bSZi3y
	 RAl6VknbQGpiJqkGgQS8R1nub/N9Y511LgztWJudlCPFhbeU0YihFUbG0Jqd2m3cWH37w
	 ks4M2r/KUdnoYrcQw0H7mxSyk9xEY6zXAIczg/a5h3FPzp3D9sz9ciAkskBPbP2Ces5ZY
	 dmtmZOfSjBN5NOCfrdn+RPIJGiGz1m8fG5jYvMCSueCPgNT0rVsD7JeUkfFPcnZHD0T5Y
	 PEWrRgJbvIG8lsUQWDUxEfY4nFrNE/PgUkVXbyKwZnIv53c+uZyGvfALmOkftegMYFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011944;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=XmDY8jXtrZerT3jaIPQ+zcGTnit1QSugddbd2m/UzSI=;
	b=c7RDKU+AiAAIP+SqAobSR8xs5QcDnbMNJ4TQQGqZ7dwB6NexNZsROx/QgGF7/asGOUcB
	 TJ7Wc21c22qM7C/a81ZZmW5fRA3eq6jTjBn8At8oGKWB6p5KJHt65LB9vJJvmkf6JO6TI
	 yv2Rd51rm7SpAxxSJBhuj+1J4jJMPXWympEfZtx1LVKtIOjB0nXTj44w4QnIDJ2jkBkR+
	 u2LnGA175IwvVQxjcM9Z9hMvrKv2DdxqYpSemjq7ciYJLleVtjWzHDuS45/ddD2auT4R9
	 sa6hW6j5/glVrEflUSBfRaQY+gj25px1L8xHV7fm8IWcvYlVNjhRq/oHTJLKRpCAszg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB9F606B753
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB9F606B753
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-54dbbf252cdso1711659b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011943; x=1794616743;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XmDY8jXtrZerT3jaIPQ+zcGTnit1QSugddbd2m/UzSI=;
        b=rHe0rn/7xLNbODSB28ceHV79/iLb3bygqje4PqQ5rs3kyAGN8wXaKl4P7+wv+p1TGH
         u4ei8Hr5lwfUGeCqOvcdYYpg4Fsi/fzaBmqgBiYLY2GhYZcfHVyPighWo6VkctlVnzPu
         A1Q+j3u5f6HchXB/2gL8B27YAtKQckWZ7lwpTV7mldmGbMCtsaR3J4PdsRwnSWwJy2Ao
         pCV8JGlQdv3j0bp9xoBYFKBAsHOL7t/LCZOAuhtW39LYRXU91Qw94DIzeFbE7J5DEEzB
         9uY4/1M5rapABjFzCvwZu5yywIzzbA64UhzvarwknFgNkNPMP8oBkf71NTh2aYHBKSCe
         eabQ==
X-Forwarded-Encrypted: i=1; AKwUvBzH/9aYqlCpGQCilA99CO+GYNjoTZnTBJfejgylKwJh2fegWyFUPD6abj3BhYF7S1VdIr9Za1TBDjh/CE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5gtAAWXlBEtWMNI0WAYOr0ZRr2xk1rM5aq+DP1LN8kCb6DvPF
	RnN/bZszRFhMaQ3JjBYPxtZEn+eQHbpZovL4QJ4vUfzbs2F4Jf7xEaQZ5ZIS4eb9S3bIsNgeomm
	N5KE6Z1GqJ/EOgjEiXA1+2vF9b77NIJ24Tdpxy/KYTvagh2naL3l7NojhmzI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2224:b0:4f4:9a44:73c0 with SMTP id
 5614622812f47-567e0f40fe3mr3282611b6e.6.1794011942886; Fri, 06 Nov 2026
 16:39:02 -0800 (PST)
Date: Fri, 06 Nov 2026 16:39:02 -0800
In-Reply-To: <20261106204154.255-1-drifabdelmalekmohamedsaid@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aee7326.49d0a7c9.b7ee5.0002.GAE@google.com>
Subject: Re: [syzbot] [dm?] divide error in cache_ctr
From: syzbot <syzbot+3e16980543e238b95bd1@syzkaller.appspotmail.com>
To: drifabdelmalekmohamedsaid@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+3e16980543e238b95bd1@syzkaller.appspotmail.com
Tested-by: syzbot+3e16980543e238b95bd1@syzkaller.appspotmail.com

Tested on:

commit:         ddfe51b0 Add linux-next specific files for 20261105
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10e7f6a1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3dffa811bfeed6b4
dashboard link: https://syzkaller.appspot.com/bug?extid=3e16980543e238b95bd1
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=123de369580000

Note: testing is done by a robot and is best-effort only.
