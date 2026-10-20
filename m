Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792457091;
	b=XDQlg1QsPF7ckWmAN1JtpY2WlR3K7u/eTknxlSj1OMZ1ssEpdcua5XPo0AsnrXhHNj4h
	 PJEBwH3uBjJcMrrsd07HBrpRvHJuT4aIeGBTTgjW6A7WM4QkGFtDNUHwTMtoZ63dbFkSZ
	 +jVH3bbPyPwEJ016iG0L1KbhsMFMc9QzIyp2HUbkocb2PZud/2uSjNPT8OQF+7uqhaxYB
	 k7WboNhDQVcZOiBhU7dS4/WNtvhIO/rq010LZrLCOKwADGDou9x247CfzGAFihLFnMlrF
	 X3HMdPnA1Ls33K7KFMmAz8qA0e0Am2F85WxWwFRBQK1XmeplKEcoCjgeaIWTyatsGMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792457091;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=+JFWED1LbW8Q3dEA+59/6FN+gzD1OsT6twNfSqCT6CE=;
	b=pH1Dth7kMuvNoJ6pHu/pePz1lmrCA38VlYHArYGiJSw5C67b+eVkpO5e/0RpZKPVktCH
	 Ftk7/kB51GDSIuvl3lV5AtoW63sFe6Rt0oAF5uLqoMycH7qLqblhggfKXyrhXrApLmbvp
	 +CVai0lxTCMTvz6li5j5GHHMIT7ObWdB9Qu6izEogHc11LnoUICpO0S90ECL1kbllJ97E
	 mw1/xaLE3+fy97rS4ASgb2ytlVNMsI8f/gd5c+bWE9Cxn6DIQhcnofxovXNBFCapZniNv
	 cE9T6BXVd6GXHiV7OX27mGVCsjrWMMELLNPTnJGUGBhvC6famBUrVj5JOMzg5s0xRpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MDCOkUAX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9453606A319;
	Tue, 20 Oct 2026 00:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MDCOkUAX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5781F000C4;
	Tue, 20 Oct 2026 00:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792457090;
	bh=+JFWED1LbW8Q3dEA+59/6FN+gzD1OsT6twNfSqCT6CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MDCOkUAXWP3dPNsIjVjiDLU/ZAueZEkOLTks2pXixFrpxqWv6MHC11nFjvTOfnw/a
	 RyoFKXWZXuf3NjKjzo0Q0BHgBH8KZ2/OawRxlhwZr9VDxd+XqqjGpNpm8Dk259CZ2F
	 O5TVqMkSlgEwLAW0sFG2vrVFN0hFAIRZIlMdJYBP7lHKDS5FGt42/Id5TQYFY0Lvkv
	 woQzrWwC5yRdiS762vlYDgc3SN2AA37ftOjSEhY+LprKp3oFEoXWeZp3q0GFOxbk9f
	 +Ky0++YQKFfjJLqh+DL5a/WBdBHba03UmoLYJwVY3cq7tKIlxUO/FjXDZSqpsBbr26
	 oIMZiJOtUsvyA==
Date: Tue, 20 Oct 2026 00:44:47 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Scott Collyer <scollyer@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec: trigger kernel_restart on
 EC_HOST_EVENT_PANIC
Message-ID: <ata5f5ZmYkrcdt_I@google.com>
References: <20261008172208.1139281-1-scollyer@google.com>
 <as8slqeTjJYWOlaa@google.com>
 <CALUcz=3WE+SUx2j8LKFQQK-fMVXdk69rZJ9nKgBMQ_UwnWRPSA@mail.gmail.com>
 <atWFg7gm_jLBOwxu@google.com>
 <CALUcz=0TtozoU+EP97Pu5pPYc=_G97xM=yR3cZ9WH_kLgrxQoQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALUcz=0TtozoU+EP97Pu5pPYc=_G97xM=yR3cZ9WH_kLgrxQoQ@mail.gmail.com>

On Mon, Oct 19, 2026 at 03:12:37PM -0700, Scott Collyer wrote:
> On Sun, Oct 18, 2026 at 7:50 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>     We would like to drop kernel_restart() entirely and instead focus only on
>     surfacing the EC_HOST_EVENT_PANIC event so that userspace crash reporting
>     daemons can collect the panic dump and handle recovery policy.
> 
>     Specifically, for non-ACPI/LPC transports (e.g. MKBP host events
> over ISHTP/SPI),
>     we would:
>     1. Register a subscriber on ec_dev->event_notifier (e.g., in cros_ec_dev) to
>        listen for EC_HOST_EVENT_PANIC.
>     2. Trigger the existing ec_dev->panic_notifier chain so debugfs flushes any
>        pending console logs.
>     3. Emit a kobject_uevent (e.g. ERROR=PANIC) on the cros_ec device kobject to
>        notify userspace crash collectors.
> 
>     Does this separation of mechanism and policy align with what you'd like to
>     see upstream? If so, would you prefer the event notifier subscriber in
>     cros_ec_dev, or is there another location you'd recommend?

IIUC, this patch is specifically for ISHTP.  I'd expect cros_ec_ishtp.c
to register the event notifier and check if the incoming event is
EC_HOST_EVENT_PANIC.
