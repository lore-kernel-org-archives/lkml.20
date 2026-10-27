Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793121011;
	b=ugs6D0BXssjUyfAR2TLLlNOQuS7TQtoxFYwq773FX95jgcKTZhRybjogo9XePEt83Su2
	 UG9SCx4qjx5U5V5OerfDgV6GuPBf7FslZ1uBCJgTEoao4XHFRR1wEOCkZSU0PNNcvc5iU
	 4SzxhXI1KYcLYGOG7e8IJqLTUG5S8j0bsJwFQ3hK2mJafqNKMPibhdPd8kWEp/t6+hZhI
	 yUp1afDrE6xOC4yV2wmrFwxsB7kVLLwEU7VNumFHR3R5nf5EYrDXYWhsTCZD1dKM1Hr5K
	 HCxeHzbBQiIVKkL7Gei31+9JnanlyZsKGOjJI0M24NHKzx6dryVB/2skS6nWpmgazUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121011;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6z1Q2FnRPqUpv8sUMbKaLkx2bL6vjkoG2SyuClqSAmw=;
	b=YBTjL8B+S3oi2b+DCgM2d4t0QU/mPY+7IT4XkiXF0EyybwhI2Qn9X2zMG6ctMpgJIUd3
	 EFPm1XAYarB3Xe9c5zhdl/GV1Qiduyd9qpXuP90HXI9OVjQF3oqgPd1oq1ladA5J7RaPM
	 LEHQVZ6N9UizdI4LE4PCzvDcF9uhef2gzntH4NwlfzN4cFJTfkWr45SvbBkSM9HyVph/g
	 0MuzpdOkVKClmcayPwWmeOchlpLrcuhy93rqoK63iS7o9oDcIY1e1wEqp4co7pQhxpTcC
	 WKzhZsRITbiocf1FEElkQlp5kjH83zVHNpF9TtWy+CbHNREbjfm7NKpZAKbwOxtDDaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=HWK8m1XM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03FC606A31F;
	Tue, 27 Oct 2026 17:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=HWK8m1XM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89321F01829;
	Tue, 27 Oct 2026 17:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793121010;
	bh=6z1Q2FnRPqUpv8sUMbKaLkx2bL6vjkoG2SyuClqSAmw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HWK8m1XM89Z1t2ZqEzF0wRXMZCN9YZF/stXxZmx4P5l48J3KslfwBTpVL1ZkY5d3L
	 cFvF95td4+ABHcQ5gNSdxOOvGC2DaMLIdn9qCisjLWSWqYS2Hu0bLOOfjFyE4JONkm
	 3yjLt1FT3xNx6nJCxFHXlGgb9Rl8NYHV9oLjIDEg=
Date: Tue, 27 Oct 2026 10:10:09 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: syzbot <syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com>
Cc: cl@gentwo.org, hao.li@linux.dev, harry@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-usb@vger.kernel.org, rientjes@google.com, roman.gushchin@linux.dev,
 syzkaller-bugs@googlegroups.com, vbabka@kernel.org, mchehab@kernel.org,
 rohithmatham@gmail.com, hverkuil@kernel.org, duoming@zju.edu.cn,
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [syzbot] [mm?] [usb?] WARNING in corrupted (4)
Message-Id: <20261027101009.18e9136537144533915008e4@linux-foundation.org>
In-Reply-To: <6ae09458.f0fe5aea.79aa1.008e.GAE@google.com>
References: <6ae09458.f0fe5aea.79aa1.008e.GAE@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Oct 2026 05:08:56 -0700 syzbot <syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com> wrote:

> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    5b0764a53235 Merge tag 'drm-next-2026-10-21' of https://gi..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=13739fc9580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=fd1433abd362f255
> dashboard link: https://syzkaller.appspot.com/bug?extid=9fe09db3795456e0b442
> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
> userspace arch: i386
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11cb9b0d580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/05ac8658d211/disk-5b0764a5.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/9cfb73243216/vmlinux-5b0764a5.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/fc45c7faf785/bzImage-5b0764a5.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> !PageLargeKmalloc(page)
> WARNING: mm/slub.c:6855 at free_large_kmalloc+0x97/0x110 mm/slub.c:6855, CPU#0: kworker/0:1/10
> 

Thanks.

> This report is generated by a bot.

So is this report ;)

This looks like a double free in the Siano USB media driver, rather
than an MM bug.

The failure occurs during USB probe error recovery. The allocation
comes from smscore_register_device(), and the page-owner records show
that smscore_unregister_device() has already freed it. The USB core
can then attempt to free the same memory because smsusb_submit_urb()
sets URB_FREE_BUFFER on a buffer owned by the Siano core.

Rohith Matam posted a patch in June which removes URB_FREE_BUFFER
and fixes several related URB teardown races:

https://lore.kernel.org/r/20260601201639.63171-1-rohithmatham@gmail.com

I don't know why that patch hasn't resolved this problem, but it
would be worth revisiting before developing another fix.

This doesn't appear to need any MM changes.
