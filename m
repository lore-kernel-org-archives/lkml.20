Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208828;
	b=N/7d8naCwgfjqc8tF1r6TnWPVfEl5MsYV1BYN1CEyXUlwtLfkGv7B8jSr4aGwPXAhnIv
	 S+vCQhXcoNgw84+RFdYQkdr9J6lhm8pb1Nw1ScAT5yO2Anpy6nH8r3I8ECyz1TgPT6G5D
	 YzM506ArHO3AZuKkCVyfgQ7Jj0UaLrjP3nm1r1I7B/vxy45NCKac8/5gbUshhfIUA4StK
	 d6MpxCs0GnmerAa/ZCRhlSLS70X6My9H9ObAjm4LGGrxIAeh22K23vITKsknlM8l2mHRX
	 gAizjLcjkCwHcLqAiEgKbbg6D/gBZTr/KHG2L7JRVQntODvajA5TdDuleQFdMO1l1Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=S4dtTenJXleltLZYycO2fIiw6+tZG5tzNUtyBvNjc9Q=;
	b=GcXRo/v7CNSmO7CXNab/NewFL3aA0L7GS3oY3ttUVzxM/4Ec/9YuiBRLvEWwFoJeDvJg
	 NeIpox31OQHc3LIcneQqJOY3oLs1BMWKA9AbSuSsXBY+fVlBycvLqGDLkMNbyFz1+oh77
	 q7XtmntnqmMMA16q95vZms/JP11/4zb9asNBoubYdTChoiONhlMDVtcyn6OXgI12S2M/u
	 4DK3q696qVFF1/1EGAfTikgfNIAZw2tHzu774iio/0xcNZPol+PJPJq8iC73HzQiNMhkB
	 43IkE0Om9r8N6faWmVpDY65PUB7B1HF36RYcwYS+zsvKUf5NmlA1QBydumUqXclS/bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grNwYsgE;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250BE606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 250BE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grNwYsgE
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso308118e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208826; x=1794813626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4dtTenJXleltLZYycO2fIiw6+tZG5tzNUtyBvNjc9Q=;
        b=grNwYsgEl9HzLWn1gn44MnjYOjcM2AMsGDKQbrGRoYdIKerLUtBBT2mRVlDK6RNyHN
         2H6LkTRz5ws1JHGoJmPnLs+DR8YxK+qagXLZhsRv3CckKrTqBL7gIGZ9d8THkY8ankQQ
         RAiskOXsV7iV+Ogw9BFclS5f/EO7KWtS1Vu4sorrnRAtrPWDtJfiMeAlX6LUR9X7cfx9
         JLICJKmqrYJRmpFEAnhBMYVbdYbbVx/ImzTmQzSUyIyDdkVs75Hpxe0O1a+kOPcP+ym/
         D78wCEJbI/oS9D5nPVlfRiHgPlqez9PBsGa6UydXisLEbjmmlpm9vxqvwYnmA6fHuNZn
         xtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208826; x=1794813626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4dtTenJXleltLZYycO2fIiw6+tZG5tzNUtyBvNjc9Q=;
        b=wJGnrCT4ww1xNqjFwF2QG4u0zEdM8cGKtfF/LoLfey3JpMsFVQNDwe6AiGEd+1xlhQ
         et8YYFyuHshNvnyhDyVo3PCOZTDps7C5sBsVjsOVFfwH0JJkeYpqKNPfac1PNOTVm+qx
         XvLIw/Iy0tVpz2VuUen+5OQmJxq1npgHuykvtw7FIDN8bLAxIXjwjVyaDPMLtuLDJdkK
         XbjF4ZSn84b3cXvRmSdWSf3Y+HlDackf5a1sgXhyZ8i8rcBAzrFfzGckB098tp7aK157
         lcKWgD9XFGr00Cop0D6IpHamOQsKhPvU0r6yTq11UQJp7cafWv7yJUFUGcikvcX5zPCG
         PU9A==
X-Forwarded-Encrypted: i=1; AL+hErG58ekHDRcFnayCNFJMLC3cnAyOCl/tLeVOpR1aSNsvQ/B7J8BZx75WChE3aLc1TRq3fyzKCU4ESysI834=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oAB2GMJrb/q/Czy4kogIEzPXsIZYC+cYru2m9HiMTqXUWQqdM
	Vs1ZzQc7SQRgbJgwo7blsGnFwJCRxANt/Vo9MYYEOENiZ1E7r9DYlEd4
X-Gm-Gg: AYBFou1NzF5x1/WA7M7/mHc6n2ODvjzeqYi5tnwfxaQyEizlLkz9ab71/ZMmNOfbwfY
	knU4KN4/OLg0AI/o85JSJIKDx34aKJFjxaEQ9vZ6KsaGRA8KYDUlcEh/gFsrP7hasXH+IW9r8q/
	daz27iNZTsar0pKknZqNcLGyIn7pqTldQpvzv/G4+T8nw0bYWz2K1oaXqujf1vf74m7bSX2BXSW
	+bRI+zoyi6yuWw4yoTeKXHU+kFMZxR6JMMQ7QqI77j3C6tfI0u9U4RmiSIV1LCoGJP23PQLhjzp
	GWq/7ICUJNAdwVePyYX/zepRt+QjnYPFQJrXO7VYeIHjmfLaNnJWnNwkyEAicBuQR6IHGgu1p3k
	2aamo7gd8JSVffzX0lF+z+9F5WRvd2RmT/Hput8c8rSCh575l9kOuKGxeJCYfH9ltf48ZUqak33
	aq9aGg8vzSkINKFLtm7PUc9dleNITCuGL2bn9vtP1N4QtzzuY4xFBNUnVAKXIK4v0RJlepM3Pie
	PwsN3WcclNG94YO+ZwFzWTQWltW/TVVRV/k5ESQozhQUPYeN528DNmt3lV9Mcp045f+/q+FkfVo
	qhohJKKSExzofaN/yU8pD7gVgJlLrLGJGNbp
X-Received: by 2002:a05:6512:838d:b0:5c1:4c83:ce65 with SMTP id 2adb3069b0e04-5c14c83ced1mr504370e87.19.1794208826052;
        Sun, 08 Nov 2026 23:20:26 -0800 (PST)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b8197c3sm704213e87.57.2026.11.08.23.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 23:20:24 -0800 (PST)
Message-ID: <b7a634b8-b837-4e3a-968a-8389db89b642@gmail.com>
Date: Mon, 9 Nov 2026 09:20:23 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] reboot: fail run_cmd() before init so hw protection can
 force the action
To: Zak Brighton Knight <zakbrightonknight@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20261107143129.875202-1-zakbrightonknight@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261107143129.875202-1-zakbrightonknight@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2026 16:31, Zak Brighton Knight wrote:
> __hw_protection_trigger() asks userspace to power off through
> orderly_poweroff(). It only forces the power-off when running
> poweroff_cmd fails. run_cmd() waits for the exec only (UMH_WAIT_EXEC)
> so a successful exec counts as a started shutdown.
> 
> Before init has started that exec can succeed and do nothing. Usermode
> helpers are enabled at rootfs_initcall and wait for the initramfs to
> be unpacked. So a built-in driver that triggers during device
> initcalls runs the initramfs copy of /sbin/poweroff. On a
> dracut/systemd initramfs that is systemctl. It finds /proc not mounted
> and decides it is in a chroot. It logs "Running in chroot, ignoring
> request." and exits 0. Nobody sees the message because a usermode
> helper starts with no stdout or stderr. The default
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0 arms no backup timer. The
> one-shot latch in __hw_protection_trigger() then makes the kernel
> ignore every later request. The machine runs without its critical
> temperature protection until the next boot.
> 
> I hit this on a ThinkPad T520 running Fedora's 7.2.15 kernel, booted
> while still hot from a long memtest run. The ACPI zone read 101 C
> against a 100 C _CRT 0.29 s into boot. The kernel logged "HARDWARE
> PROTECTION shutdown (Temperature too high)" and the machine kept
> running for 90 minutes.
> 
> It reproduces in QEMU with Fedora's 7.2.13 kernel and with current
> tip. The test uses an SSDT thermal zone whose _TMP is above its _CRT
> and an initramfs with Fedora's systemctl as /sbin/poweroff.
> hw_protection=reboot fails the same way. Setting
> sysctl.kernel.poweroff_cmd on the command line does not help either
> because do_sysctl_args() runs after the initcalls.
> 
> Make run_cmd() fail with -EBUSY until system_state reaches
> SYSTEM_RUNNING. Both callers then take the fallback they already have.
> __orderly_poweroff(true) syncs and powers off. __orderly_reboot()
> syncs and restarts.
> 
> Firmware that reports a bogus critical temperature only during early
> boot used to get away with it. Such a machine will now power off at
> boot, as it already does when the same reading comes after init has
> started.
> 
> A short window remains between SYSTEM_RUNNING and init being ready to
> handle the request. A non-zero CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS
> still covers that.
> 
> An AI coding assistant (Claude by Anthropic) helped find the cause,
> build the reproducer and draft this patch.
> 
> Fixes: 10a0a8d4e3f6 ("Add common orderly_poweroff()")
> Signed-off-by: Zak Brighton Knight <zakbrightonknight@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>


Yours,
	-- Matti


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
