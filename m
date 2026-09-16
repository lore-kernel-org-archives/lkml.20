Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4144FECE5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566446; cv=none; b=qR0sBREr/q/NN0XjUX5j+6U/JWUYZdCXotAoorHcQPQRBq9E0Wg65z2MWaJdnqzpGcNCifo74mYYcaK0zWQrLIan1rCvHjjZvFiNvjNQI1Jgv8LHu0O0uvS1ihkJhQ8mtXMnUsXYgN9mUmy4zsOJc9g1RROMfl7gGsqvNgPzeAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566446; c=relaxed/simple;
	bh=tH2TyRyrHUfYivxY9vkK6rsqtkiNGwOuf34YFqaNWdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXPdwPwGfCHYc5+lhppmhFweIWReB8sPcUS+ivCnfnUp5hFW79YsGIeO8dMBhCQwJcPG7idhdZEUwzZvrtI4hKCUHLK+xC33g76jQUuchqm4OBTJ1pVy3RZIapuj2AI2S7vSbKcXVNCdlClIrpcsDZnw2ST0obEu2trh/UKlM+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bY+Ya2I2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bY+Ya2I2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD421F00898;
	Wed, 16 Sep 2026 13:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789566442;
	bh=q7xO4hFi2UtZfonLXP+mL7IxnXY+Fr9azw/0sP29fPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bY+Ya2I2Hqz72MS3hfKFQW2c7SFMItvABWch7KKERuFr2NVo7N06tg7g5QKhbRkCC
	 L1fmjBauqaCZsNk9tdJWiYyRtf9IbKhbVqAFwptGsxPOOg1tUpoJqHSa1UZY0Ai+sl
	 /hCjgCMEeqIFjMUY6I4Lb+odENTb9dMnwiAWzo7wg3TYN6tPDxUpJP9Ww4qFmoPg1a
	 cHG/xVPu8H3ZRiJDVcP1vp3WsSQjZMYNXlSCLqHzhBTOyeEX/1fC76gRB1v5l7dEOj
	 Y0tMumskOFjm+bBN2rJhLcMCU+h1A5KwPDidHXXTyEYy4smume/x2Gy7C8g5ZGcvOw
	 BNVfyLa2V6nlw==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1x6pyp-00000006DD0-3XB9;
	Wed, 16 Sep 2026 15:47:19 +0200
Date: Wed, 16 Sep 2026 15:47:19 +0200
From: Johan Hovold <johan@kernel.org>
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [BUG] general protection fault in upd78f0730_tiocmset
Message-ID: <aqqd55r5Nl00FBFt@hovoldconsulting.com>
References: <CA+0ovChXjGWuRQuKHHWkSiLbdt-WEWv=M0mGOB2eKcJjFiEY=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+0ovChXjGWuRQuKHHWkSiLbdt-WEWv=M0mGOB2eKcJjFiEY=A@mail.gmail.com>

On Fri, Sep 11, 2026 at 01:16:11PM -0700, Farhad Alemi wrote:

> We are reporting the following crash (reproducer attached):
> Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
> Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)
> 
> [   44.256596][ T9490] Oops: general protection fault, probably for
> non-canonical address 0xdffffc00000000ba: 0000 [#1] SMP KASAN NOPTI
> [   44.258408][ T9490] KASAN: null-ptr-deref in range
> [0x00000000000005d0-0x00000000000005d7]
> [   44.259206][ T9490] CPU: 0 UID: 0 PID: 9490 Comm: repro Not tainted
> 7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
> [   44.260235][ T9490] Hardware name: QEMU Standard PC (Q35 + ICH9,
> 2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
> [   44.261396][ T9490] RIP: 0010:upd78f0730_tiocmset+0x86/0x4b0

> [   44.270495][ T9490] Call Trace:
> [   44.270882][ T9490]  <TASK>
> [   44.271160][ T9490]  ? __pfx_upd78f0730_tiocmset+0x10/0x10
> [   44.271694][ T9490]  ? __pfx_serial_port_dtr_rts+0x10/0x10
> [   44.272208][ T9490]  tty_port_shutdown+0x165/0x220
> [   44.272672][ T9490]  tty_port_hangup+0xee/0x170
> [   44.273101][ T9490]  ? __pfx_serial_hangup+0x10/0x10
> [   44.273600][ T9490]  __tty_hangup+0x5a7/0x650
> [   44.274074][ T9490]  tty_ioctl+0x757/0xde0

Another symptom of this issue was reported by syzbot a couple of weeks
ago and I posted a fix for the tty layer last week:

	https://lore.kernel.org/lkml/20260910125114.640880-1-johan@kernel.org/

Johan
