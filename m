Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE004DAF91
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789584458; cv=none; b=A/xk2+gk//2oDIofQpa+RDmd1X3Iokf8TowIj+od9lJkXYqwxZ9pYoXE0k1uEgW/szlyYGLjTlYVmem4dammbrNgDWWg6tSlBXy0Ml+hnghszYRajT7De1s2rtn0lQlEyLnZTUGbTuwOk0P2gteneCzixrz99umv34tcbVtqBhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789584458; c=relaxed/simple;
	bh=Dl2mOkWxuEJmH6efH0xuQ0K5VoLefb/xYo6CedeIICc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qwo/dJOwOQRQk5Ea4JF6FSg5n+Oo7vuDRGwDk1Pqy3/0jsC+gUo5pn52hEXg4VPbOUJglvknEkmKUMbzmo4csmaLyHJHuSegKp9KXpyQieebMuQWN49DfnzueIfqi2RcQ8H+FAZyJFKQis+Bhi2/fDx8p2TQOyn4HuJtadgyqMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3Onb8w/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3Onb8w/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so367545e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789584437; x=1790189237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kIpgcpjulhrzjmnC5wF0dcase85PBIaYQH7p3PkSuY4=;
        b=E3Onb8w/Nm72mNKr5Cvk0URbzhfIWgJCzBuhgrTz3b40gWj6O3ejHpK5fX2P8Q6Q4J
         hsinOPf6uvyd64HCN+Qfjg1hffKvG6MjkhWt7jkMDZzlKCSQKeFiY9VW39soLCvhNXVT
         rj/lbWvhgzQ1/maDsSPoX16EzQuZlqM2AC86BMQ3/qabSJ7LW29zQ2aKmQ3i4cMFmgpF
         GeMyyxtlsOhUjZXQVxBnTaK4iJSS7P21pXHKSbXR0rpriLu5OUmZBYEffAsdlMt6YRQ+
         Zz5Rtr9xbFFbK5l/fAhN6QHLoN0bgkl4gf22JEg1WYzj3qIhBF/fbbSa+BcBFDUK6P/e
         12sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789584437; x=1790189237;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIpgcpjulhrzjmnC5wF0dcase85PBIaYQH7p3PkSuY4=;
        b=Gtg//IZVjCOCjJllx2IAGPgI+SwoZC4RpWd7wXxawIDuis2OdpZMuEKnLzVfHTm2d6
         yZkBVVZ6Jnl2WEc5a0CcHWxU/OqiOWE5vjQ4RmX7UmqMkuaoky5yW0aoPcK3dfasbnfk
         VDWi87lc+TKOIDTABcWveSUcbiT/7lHf73zfDGQMsgrCJYK1efgqNjzOZ4IU1jSKq85/
         kgxZ4gavcXrLEk+GSbEKUnGzIWbEvMVMNYjzTinbGRO3KMMKqqxQetMsB1YT0p0uQjB6
         OQuoBhulqCdm78F/m2nfuXwWXwFM/jcZssLuJiodzCd0sb3AzOHtZO0veGAGF4Kj18Sr
         tflA==
X-Forwarded-Encrypted: i=1; AKwUvByaPiBtW5FLa46xr6K5ZLKNzA7JYdZvAzD6AHfTOYFH7jfXHUSPNTeb6O/DMrRcR0Fgq4Q0pwZXlb+F4Ew=@vger.kernel.org
X-Gm-Message-State: AFuF++mqrQPBY8GEOVMaBGm8fiX3IZkpgvqxbd0gQ3WjpFWqU11supH0
	a0TaYnZHk4J2sN2B31mnYRUq01fbGKyYHRxj8KtaBEvdnwoV5RbMcbi8
X-Gm-Gg: AYBFou0PdQ19UH1Zl9UCH9D2d+jePeA47p28QSI3L9QEW7/Nbiay3kyHmJfczKNcM+q
	EObZ+faiOBlLIltW9GfNEbPWd3XaTA3RyyaYHEzNZdv0hKi4eVU+WXK9ceLzuyL9io1FQesBWrb
	JfVJ0pKBsIvmI7aLggOdCX3Q72MrP4lb/QnyGHQdVlZHTgM9XmWG7pAowD4VJ34+tGctvjjspx9
	2deu/9FBHNu8jgGIqk1x5s8V8q+/rf3EQE5JA42bdh6f+ESGt/WJLaZPZeoeogBbEqRAbzH5bUj
	NJR3TKPl4VBFyoHD1aiVNhxfEtuXVm9fSMgcJpTQ5tVWpr0jONRmmfYb0HrrMw6klgh0suKzW28
	jP/xE3LY0So/FIV9bEv5f3apN9/EE1rnaMGI5fQrZa8nF9gNMbvjPBuatrVkamU0brCHh+plOVj
	pAqrkRxb6QiEbigue6P9SF0i/KHk5RcPRPoBfEsrmo2yCGgYnjVj+LegdWJD850hIKktimiH4Hc
	Cnr2WyjDcWXVKjrRYU78Q==
X-Received: by 2002:a05:600c:350d:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-49eb73253ebmr43138425e9.20.1789584437531;
        Wed, 16 Sep 2026 11:47:17 -0700 (PDT)
Received: from foxbook (bfh234.neoplus.adsl.tpnet.pl. [83.28.45.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbda77d6fsm316845e9.0.2026.09.16.11.47.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 16 Sep 2026 11:47:17 -0700 (PDT)
Date: Wed, 16 Sep 2026 20:47:13 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: djraszit <djraszit@gmail.com>
Cc: Oliver Neukum <oliver@neukum.org>, Alan Stern
 <stern@rowland.harvard.edu>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] uas: JMS578 returns reproducibly incorrect data after
 host reboot
Message-ID: <20260916204713.22c4f575.michal.pecio@gmail.com>
In-Reply-To: <CAFKhL9fL++S1xh+aUCuYbk6EkLQnfUn95y7TBoWaGnPAVP1gYA@mail.gmail.com>
References: <CAFKhL9eUM91rtywaz_7Mz+4mJH2b2csmOmc3+86ii3a0Ka3Q6g@mail.gmail.com>
	<c335085d-a824-4632-ad3a-c06715258c81@suse.com>
	<CAFKhL9f6aLZgerw_7bohbQWvzMxSfd-m-LFcuNP1_p1vWkN4=Q@mail.gmail.com>
	<1320caa3-85b5-47dc-aa2d-56d3b003c6ef@neukum.org>
	<CAFKhL9eTD7DxtxMSMuUVP9cDG7Nq4jvrkTCjYfwr9puZfuC4Gg@mail.gmail.com>
	<20260915233818.5881ad97.michal.pecio@gmail.com>
	<CAFKhL9fL++S1xh+aUCuYbk6EkLQnfUn95y7TBoWaGnPAVP1gYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 19:56:25 +0200, djraszit wrote:
> First, I tested the original enclosure (0080:a001, apparently JMS578)
> connected to a USB 2.0 port of the Raspberry Pi 4.
> 
> Interestingly, it still uses UAS

Yes, UAS can run on USB 2.0. It uses a custom protocol to multiplex
requests over ordinary bulk pipes, without USB 3.0 "streams".

So it's yet another different protocol and a different speed.

> RPi4 + USB3/SuperSpeed + UAS  -> BAD after reboot
> RPi4 + USB3/SuperSpeed + BOT  -> GOOD
> RPi4 + USB2/480M       + UAS  -> GOOD

> As a control test, while the original enclosure was in a known-good
> state I manually disconnected its USB cable for approximately three
> seconds and reconnected it. This did NOT trigger the bad state.

> enclosure in GOOD state
> -> shutdown Raspberry Pi 4
> -> remove Raspberry Pi power completely
> -> wait several seconds
> -> apply Raspberry Pi power
> -> wait for complete boot
> -> test data  
> 
> The enclosure remained powered and physically connected to the
> Raspberry Pi during this test.
> 
> The result was BAD.

> enclosure in GOOD state
> -> disconnect USB
> -> reboot Raspberry Pi 4
> -> wait until the Pi has completely booted
> -> reconnect USB  
> 
> The result was GOOD.

Looks like JMS578 doesn't like being connected to a booting Pi 4.

Or maybe it's shutdown? What happens if you:

- disconnect, shutdown, connect, boot
- shutdown, disconnect, boot, connect

If the problem is boot (second case works, first case fails), then
I wonder if it's the firmware or the kernel. Maybe you could plug
the disk after the kernel beigns booting, but before xhci_hcd loads?
You could blacklist it if it's a module, or bind pci-stub to VL805
to prevent automatic xhci_hcd activation and widen the time window.

> With the original enclosure, after the bad state had been triggered by
> a Raspberry Pi 4 reboot, I disconnected its USB cable and connected it
> to another Linux computer without power-cycling the enclosure. The
> device could still be accessed there, but it returned the same
> incorrect data.
> 
> For both JMicron devices there is also an interesting recovery behaviour.
> 
> Simply disconnecting and reconnecting USB does not recover them.
> 
> Switching the enclosure/dock off and on while the USB cable remains
> connected does not recover them either.
> 
> Recovery requires both

Clearly the persistent breakage occurs inside JMS578. Looks like
either external PSU or VBUS suffices to maintain this state.

So the chip is somewhat dodgy and the only hope is that maybe we
could avoid triggering this failure.

And it seems to be the chip, not the disk, because only USB 3.0
UAS is broken. Though no harm in trying other HDD to be sure.

> Finally, I also tested the original enclosure on a Raspberry Pi 5. I
> performed several reboots with it connected and could not reproduce
> the corruption.

That was USB 3.0? What's the USB controller on this board?

Regards,
Michal
