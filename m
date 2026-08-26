Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C453C3B8D5C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787787188; cv=none; b=QzmZzsmkdehToRyaIXSTEBRjk2ZxXntiwwd2IW+9ny80q7scgadAdcsh/O0PCuIu0U9kMl++p0hfcDm/+9+1p9xSiDizyUXXi9BYjibut8ZE8ZEdp5s0FXEOYBVWFO7zzzVt9Y4bILHA9gIbeu673vDyhSn9iFQ9n+annTLZaaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787787188; c=relaxed/simple;
	bh=VSmnmLd5O7V43s3JDQpDcjcoB0RJoN2y0GkjK/z+ULw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=L4NhsofJG5RiUwWsAlW33Fz9L78gqpXe0GSYA+GLCqsbKom2XNVj3MHfViV7kEKMbA8QzkYOz7Z+jcQG0VLQfp1XA2YyYPE9Ae2W0wUK2dwl6126wee5fuZBJdBUFwRCnbSYXWiuElqB6qnW0/8XpjfbS29R4d9tbmvBb6kWy2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a41f46d629so3423419b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787787186; x=1788391986;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=enoyTgXWSEVpgM6MpWVTXRbUCjMYKL4w/pi7pJcpPgE=;
        b=nDx0AHTI5oSWfXX6h8ysFy5z+5Gsm4ZAT+8ELqF8yz/m4TatemC/uOVCgsCz4498ke
         HMNj9z9axcJ28iG4f9veY2RrHq9yuTXcSUgQcLi8pNKHcFl8VJ2PG8qB1W7KknJFjTbX
         iD5Eg6eYQgMcPQl2raUW/DZOzA2foinilketosIcHjR+9t9fIhkh2Zpci1YWtmP4C/Dd
         BhQRUzSTsfA6ticQV5XfeX8BaXV+4QwYKPFYhKXcekc26BXdv31wcD0r2oE1tse1WMRJ
         7X/okeClB+B81amAgucBZQsgmx/VI6LmrR1ROCuYgK2hBFlN1rLFZCE5MGixv2qOASjl
         kViA==
X-Forwarded-Encrypted: i=1; AHgh+RqZ1383/nSXbcpXVHxk3OO+HxLzd0C6xJ+mDitOH69BRuJpy7IY7RHPre6DmLFISFfZcRtJY5S6c6QPgu0=@vger.kernel.org
X-Gm-Message-State: AFuF++nckRj2hKui8EfPHbavAJON1OYHat1iVCT5F8CyufqvYnjcILMd
	OJ2QfNQvpvteIVK0J5X/y5dRhDoq2JEq+fYQPnvMVluzdB8rbpSagsGOzAc+dXpLq7PoT2vOxvk
	1HAO8rKV4aE7rbxaRNyc61/PdeVAF/bS2ExrlyxtBhPMbH9HrX3Rjd95oKwM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c297:b0:4b2:e95f:380d with SMTP id
 5614622812f47-4b36698e87fmr13595571b6e.6.1787787185841; Wed, 26 Aug 2026
 16:33:05 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:33:05 -0700
In-Reply-To: <20260826233245.1621-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f77b1.50659fcc.60cd.0009.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in stub_rx_loop
From: syzbot <syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com>
To: hdanton@sina.com
Cc: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

>> Date: Wed, 26 Aug 2026 09:49:36 -0700	[thread overview]
>> syzbot has found a reproducer for the following issue on:
>> 
>> HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> console output: https://syzkaller.appspot.com/x/log.txt?x=151ce979580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
>> dashboard link: https://syzkaller.appspot.com/bug?extid=06fa667a0931a3430026
>> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13a28d49580000
>
> #syz test

"" does not look like a valid git branch or commit.

>
> --- x/drivers/usb/usbip/stub_rx.c
> +++ y/drivers/usb/usbip/stub_rx.c
> @@ -606,7 +606,8 @@ static void stub_recv_cmd_submit(struct
>  		return;
>  
>  	/* urb is now ready to submit */
> -	for (i = 0; i < priv->num_urbs; i++) {
> +	num_urbs = priv->num_urbs;
> +	for (i = 0; i < num_urbs; i++) {
>  		if (!is_tweaked) {
>  			ret = usb_submit_urb(priv->urbs[i], GFP_KERNEL);
>  
> --
