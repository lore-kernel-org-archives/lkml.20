Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3063CEB98;
	Fri, 28 Aug 2026 06:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899719; cv=none; b=TIy3c518/K/LoU3+KBmifutr2gj7UhDCoQ+OeStn1eTAlnLS8DO/JqAu8g8Mk5QvAnLlGeOygXJfmtfWph3Sj39dOmAEAXz7NSvH3GJi+yPij80Od04QFJDqmztXjY/kVNshC4H11rbht40Nwlvh8YsaCxYqefwE9YA2+70Wk5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899719; c=relaxed/simple;
	bh=8oK5IjJ0WRZt5E4TjU90qnCehPKlALGMkL9fkOSD/eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/90wXrnpsJP4TRMkSx/BVoINajVwK/8R9P0sBHT9sYm6T6CrCbJxOoq0pKhqKCC63ZSeSssEikzyASB47HJirlwyvNdMIJMtuWau5e+lnH9qm/qYAiyh8JQ97DJ61MmLsSLvbh3YTBQl3jCR6DdgBKu46UERZBaT9Voz7unLlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3PiSX+k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3PiSX+k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C6D1F000E9;
	Fri, 28 Aug 2026 06:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787899717;
	bh=5d2KIGRv5APnY2rq2A3y5IG4+YdFkz3iDhVt1GhmWdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z3PiSX+k1bjhEx25iFZVt1+dSQFCVoUipXK7u9qs92iAXhWRSHXJGQuS0tz4EzO0h
	 6EL6jqwTJNM3mzzGHu5dhdAgPnYgOoqQ2ZYIpjejPm7aLHgjTr93B7E7ViNLujFW5V
	 tLkGk1nx1xisyn+ewpixa1HkpW9M0YGur/dX+WhfcoAn6Jot1+ZcNzdNXnGzcPcCXw
	 RBLU35FztMauVCN6DiDqvo+OUDhBRuGK187fh9q+NG80hm9PwkR5tzqG/gILRDgPXi
	 vRAzZ237KeID8ALFSw+PH4K7yNHadfF7bX1SmukmRHM4ZavZcx9+e8vZqqgQTEcAdq
	 +e8kgRVVeQezw==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wzqOA-000000038t8-3UP9;
	Fri, 28 Aug 2026 08:48:34 +0200
Date: Fri, 28 Aug 2026 08:48:34 +0200
From: Johan Hovold <johan@kernel.org>
To: syzbot <syzbot+2fd6aefc361af86911d5@syzkaller.appspotmail.com>
Cc: elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	Yang Zi <2959243019@qq.com>
Subject: Re: [syzbot] [greybus?] [usb?] KASAN: slab-out-of-bounds Write in
 gb_operation_message_alloc
Message-ID: <apEvQq8aBBlije3K@hovoldconsulting.com>
References: <6a908733.1d9ded08.62e62.00d8.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a908733.1d9ded08.62e62.00d8.GAE@google.com>

On Thu, Aug 27, 2026 at 11:51:31AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    45c13f3f9e3b Merge tag 'hwlock-v7.3' of git://git.kernel.o..
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=17ab5299580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=9b0fc292fc5639c
> dashboard link: https://syzkaller.appspot.com/bug?extid=2fd6aefc361af86911d5
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=137a3579580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=173ed625580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/ac6556827073/disk-45c13f3f.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/01ff014f18d2/vmlinux-45c13f3f.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/77e9c6302a14/bzImage-45c13f3f.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+2fd6aefc361af86911d5@syzkaller.appspotmail.com
> 
> usb 4-1: invalid cport id 160 received
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in gb_operation_message_init drivers/greybus/operation.c:341 [inline]
> BUG: KASAN: slab-out-of-bounds in gb_operation_message_alloc+0x26e/0x2c0 drivers/greybus/operation.c:385
> Write of size 2 at addr ffff888100b7e582 by task syz.3.17/3979
> 
> CPU: 1 UID: 0 PID: 3979 Comm: syz.3.17 Not tainted syzkaller #0 PREEMPT(lazy) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
> Call Trace:
>  <IRQ>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:378 [inline]
>  print_report+0x13d/0x4b0 mm/kasan/report.c:482
>  kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
>  gb_operation_message_init drivers/greybus/operation.c:341 [inline]
>  gb_operation_message_alloc+0x26e/0x2c0 drivers/greybus/operation.c:385
>  gb_operation_create_common+0x9f/0x710 drivers/greybus/operation.c:532
>  gb_operation_create_incoming drivers/greybus/operation.c:644 [inline]
>  gb_connection_recv_request drivers/greybus/operation.c:926 [inline]
>  gb_connection_recv+0x1dc/0x1050 drivers/greybus/operation.c:1063
>  greybus_data_rcvd+0x244/0x600 drivers/greybus/connection.c:89

This appears to be the same issue being fixed here:

	https://lore.kernel.org/all/tencent_4F423FBD3FCE6066A8538BB3CFBCB0C41E09@qq.com/

Hopefully, Yang will produce a non-corrupt patch soon.

Johan
