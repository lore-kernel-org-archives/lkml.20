Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDD4314D1A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789176317; cv=none; b=JIXLBMKrxRLEhWz+lnGmYk4pti7sVQMrW5UjnJz6yfoTYM4xFFV5+kHy5grSSbEa6dDwL5OWkKmRewrFQyNv2uVA9EDNot0dhktvr9vCARabemNHQ4sSed9CCIcNvanHF8FqPMUtySQAdN4t4qUaxIcxT8vEgBojHHnxAg+Q+KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789176317; c=relaxed/simple;
	bh=E5j5gOU2DOcGlpKKZHK6XuNWPR0ZbN1uuzxP7vqH0pU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Tay6Ymd1M4IC5VMykvfkfL7nOqn6L4LbwGs1f0AAqpO335FBO0V3ImqK1eITzTNkN6pTengIH084ayqeqfLgB6dhtx+1LIBQf2ldSXj1qzdAeVySFckXJJ458VNIl2nxGfIPh1qOzP6ehdCHE2S0opC3S/1cGE2oVM5luk3ZYUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-47cfa971c9eso2694274fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789176302; x=1789781102;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qeAKGsDfD2iRvwIc7lQmRAqy+w+Ii5XPpavD8heHiAs=;
        b=ehhTZqXW2gRVBjexIcAQ/bschXeCnekKBcR6ejGDNiD4b1DFiZX7HzjME3/AmR4tV7
         QHkUDX1ntGutLuHumTj+DAtylUbfRqMdWeLmUZydTx7Y1bniU4xuRkBrjvPp8pbZBdyL
         hv43v90fJvakw6JM+A+7PvKuJ7nqkevGFFbuFHtWo5HI98q1U5rjUTxQZqSP3868jVlO
         LYUFeZFGYVAt3nUUnZJQSoOUuwWaZEOwn7CcDb5X/XIwQZ82VXXRTCW3lLZSOoQNK/kd
         etJRKPiXHbvJdSIB7V1pQDyF2OAgic4Ufykj/3gS4ddvLAX4BYJdjSXYQ+TqDAOjP0Iq
         Qv0A==
X-Forwarded-Encrypted: i=1; AKwUvBzhgZ7P7xI8Vbfk+C5JMnkPgxLWIySSGITD/swoQQHat7BYMurir0JjP6yjJTKgSHQI7+rmBcm+l+0MsE4=@vger.kernel.org
X-Gm-Message-State: AFuF++mE8ka2ptNe3UvJJyKZHPfJqsGSrZl8d4c7hnS8C3j0fQvDPzKu
	KpYFpf/7h0i9QWoUanES3fbKwR8hscnAeLHAmW2rBdYzadGEZ2HcCC2CjLBw7VAkbW4xfLV9b3d
	3XWke/7cqnRNpBmSLIY5l4u03M2hCqglBPNYLeTFF/6Fyzre5+ZKVVtbfILY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:55d1:10b0:6b8:ce67:77d3 with SMTP id
 006d021491bc7-6bf43d7ad0fmr4692675eaf.7.1789176302415; Fri, 11 Sep 2026
 18:25:02 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:25:02 -0700
In-Reply-To: <20260912010327.11049-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa4a9ee.6e6c5f9e.28f11f.004c.GAE@google.com>
Subject: Re: [syzbot] [media?] KASAN: slab-use-after-free Read in v4l2_release (3)
From: syzbot <syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com
Tested-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com

Tested on:

commit:         5225b8ee mailmap: update entry for Jens Axboe
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=154d25f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=34957180b0ed2581edaf
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=130d25f9580000

Note: testing is done by a robot and is best-effort only.
