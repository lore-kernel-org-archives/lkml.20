Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A42313E03
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 11:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791114939; cv=none; b=XZDt3eFVrkNghVn6DDNS4b2wyXUfVKrCzMKDsj7XD4sx4Ad/MOCIk+E8vnMkkKO894Kt3llVoXQq67App/ORddSI0DROSd1RrFqLftEglw8jwm9IwbXrhQKUVNkDn/+E+VRQckS1BGlw59G6ue4BxkPWOmt71msbrFCVCzzGhAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791114939; c=relaxed/simple;
	bh=qBeuM++Z0v0iKefcXN4ZiWtW6nemKFlYypkltHa8WFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rEAxAaq/Y8Hqevor/wMQP13S6TPEdRDql25MQ2JLEM5gSlKfej8im3wupyq8bWT9sFqXC92QuokltVnTzo0XTo2YFLJJwbqlMniajyjx3z5Xx1Re+hwRW19xA1EsMwMSgyssXM/rrTRG9Bb4Flu7vmZjIAmz7VamanRSTSk1aFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=W4FhuXdC; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="W4FhuXdC"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hyLYr6kG0zMlSW;
	Sun, 04 Oct 2026 13:55:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1791114928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4uEEgHjUC4UeNu2znyv/7Oh9XcbelNVqaoaQd/mD030=;
	b=W4FhuXdCT2dhlonib0lC0D1/OpYzcKf+lm9oR5p/mnLVHFZC25tN0bhwOvh/uH1pbUOoqk
	h1bgY7FRQjZqIh7AdaTJ/U8K6+3iWugb2tXeab2Ey8DrEg4nwjpnGw35kkqkLYURbfRzy+
	bO72CJCVbZiNTVMTgRnomGZ059dcaenu7K0xYquJX8u5MeJDALz8/oZYTZjbzhE6fhIF9/
	yGwuO7TdEDDes+YtXAxEm3N2I2JDRPY2efZoZ71Jiby9UlSSSw40LVoRe1UI2fvMzOOgTo
	h58YwWRe54dJZnrdA5zKM+NNGA/t8PYwZPnl3mlFG4Vr/wOpV1qKfqhexFHsBg==
From: Alexander Warth <alexander.warth@mailbox.org>
To: NvD Ss <nvd210@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/tsc: Require a deviating refined calibration to be reproduced
Date: Sun,  4 Oct 2026 13:55:05 +0200
Message-ID: <20261004115505.3331547-1-alexander.warth@mailbox.org>
In-Reply-To: <CAKdy5es54GmBERrKEWw5Qf77fpi9KZp5aKoncW1naV45h_U6Zg@mail.gmail.com>
References: <20260922091740.344611-1-alexander.warth@mailbox.org> <CAKdy5es54GmBERrKEWw5Qf77fpi9KZp5aKoncW1naV45h_U6Zg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ae1ad7e01d86a5bc392
X-MBO-RS-META: 4xjfqi7t4ajut36rkzpf6t7i1i5ka7na

On Sun, 4 Oct 2026 01:37:23 +0330, NvD Ss wrote:
> I appear to be seeing essentially the same TSC issue on another Raven
> Ridge / ASUS A320 system.

Thanks for the report. Your mail is not linked to the patch thread and
dropped part of the Cc list, so I have restored both.

> tsc: Detected 3593.185 MHz processor
> clocksource: Switched to clocksource tsc-early
> tsc: Refined TSC clocksource calibration: 3596.250 MHz
> clocksource: Switched to clocksource tsc
> clocksource: Marking clocksource tsc unstable due to frequency skew
> clocksource: Watchdog                    hpet interval:        504269467ns
> clocksource: Clocksource                  tsc interval:        503848443ns

This is the same failure, and it is the case which the patch addresses.

The watchdog sees the TSC 421us short over 504ms, i.e. 835ppm. With
tsc_khz at 3596.250 MHz that puts the real TSC frequency in this
interval at 3593.247 MHz. Your cold boot refines to 3593.248 MHz. So
nothing happens to the TSC in the watchdog interval. The step fell into
the refinement window, the disturbed sample was installed, and the
watchdog rejects the TSC for a frequency error which the kernel
introduced itself.

Your acpi_pm boot agrees: 414us over 496ms is 835ppm again, which
corrects 3596.253 MHz to 3593.250 MHz.

Unpatched 7.2.5 did the same here: 3202.720 MHz via HPET and 3202.698
MHz via acpi_pm instead of 3199.995 MHz, i.e. +852ppm and +845ppm, and
the TSC was lost both times.

If your refinement window is about as long as mine, 1.04 to 1.06s, then
835ppm is a step of about 870 to 885us. Here it is 881 to 888us, on a
TSC which runs at 3200 instead of 3593 MHz. That would be the same step
in time, not in cycles.

The other case exists as well. On a slow debug kernel the step landed
in a watchdog interval here. The refinement was correct and the TSC
interval was 880us longer than the HPET one.

> tsc=reliable clocksource=tsc
[...]
> the normal clocksource validation. systemd-timesyncd initially reached
> the +500 ppm frequency correction limit during that test.

That fits. tsc=reliable disables the watchdog, but the refinement still
runs. That boot kept 3596.25 MHz, so the clock was 835ppm slow, and NTP
cannot correct more than 500ppm.

With the patch, 3596.250 MHz is 853ppm off the early calibration, which
is beyond the 2^-11 (488ppm) limit. The sample is not installed and the
measurement is repeated. The next window should give about 3593.25 MHz,
which matches the early calibration and is installed. The acpi_pm boot
is 732ppm off and takes the same path.

It would help a lot if you could test this:

 1. v7.2.8 plus the patch, a few warm reboots. arch/x86/kernel/tsc.c is
    identical in v7.2.6, which I tested, and v7.2.8, so the patch
    applies as is. It also applies to v6.18.52 with offsets, but I have
    not built or booted that.

    Expected: the "Refined TSC clocksource calibration" line shows up
    about one second later than without the patch, with about 3593.2
    MHz, and the clocksource stays tsc. If that is what you get, please
    answer with a "Tested-by: Name <address>" line.

    CachyOS kernels carry extra patches. A vanilla stable or mainline
    build is the more convincing test, but either helps.

    If the step lands in a watchdog interval instead, the TSC is still
    marked unstable, with a TSC interval which is longer than the
    watchdog one. The patch does not address that.

 2. Without the patch: one warm reboot with processor.max_cstate=1 on
    the kernel command line. That made the step go away here, as did
    keeping one CPU busy, one boot each. If it does the same on your
    machine, it is the same mechanism and not just the same symptom.

And three questions:

 - How many warm reboots have you looked at, and did all of them lose
   the TSC?

 - The watchdog messages which you quoted are in the 7.2 format. Does
   6.18.52 lose the TSC as well? The watchdog code is different there,
   so the dmesg lines of such a boot would be useful.

 - Did BIOS 5007 behave the same before the update? "remained present"
   reads like it. That would mean that the problem has been there since
   2019 firmware and is not specific to 6254.

Please leave the timestamps in the dmesg output, and please reply to
all in plain text, so that the list and the maintainers get it.

Thanks,

	Alexander
