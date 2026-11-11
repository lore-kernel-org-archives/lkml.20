Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794368334;
	b=b6ZUungUO83SLoxOA3+PC28ByIoxxGDwzTdJZx1hVJMC088QjsYdBtjmkl3g7N0W6pz7
	 Q485+Hz0cixPv6XzPfLc4KKMFQkwA0PIwlSQ5SmN26cN0Lehe8O2e2u16ymHWKm10kZmb
	 8Sp2B5plXveUJ3RwNvnZ2j/VZeN9db8vTzd/SnZoEMPCAlz/hhftMiV5KG7HZETy4QZGK
	 WwLoXc/vatCr2MxUPgi+eT3iM0/zoIBFL9TU7evKIIL8mHOrz8E8oEHpExn2u7TxW9Uti
	 SLsTF7SPcy4b/amfrwrCtvDOmFDQgdbN9kue4z5no9iSg6BNfqxZWWK3lyElrSEPN/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z2ET6l1kFZ7646cHbCayQI5WEMFcXf1kwxAiWCRuN1g=;
	b=UCkkOl4UYvPfkP8aXivzyZIwLZnyGuvnc/GnUbFYtp3WoKVYmScSLPplYLZM1xCSXl7U
	 xrMG4lP8mozHApmqQ9kIg7aGXCuUlVtG4e1lU760fHbAQFU7YuLQppOs86o2PmYaWbEVZ
	 kNrFFoyz7btCvDN3PAF4O0aHzOHUNDgZizrnBUOu2m91Uv39A5kxGzkL/7cHbkjfmJbRV
	 bcvyVuu/CTK0LPtG5I2/CQ7L1ieby4mB3JPv6xOGY8Ok115MFQmA9LMjkJlGRSUkcY5y+
	 V7muauzSjcn2Qrrbs47OHfwS3SYu4dnuutNW4vRYBePtJzGjevC9FftskOdVGa4p6uQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q48DEDPK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8C7606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A8C7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q48DEDPK
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c445c95d553so372417166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:38:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794368333; cv=none;
        d=google.com; s=arc-20260327;
        b=At2FZxV9FwVKsScL2medOl2tN/lnow0I5Stno7tJcBWR9IPvrHL8tdosjk4eCZ5uYL
         CB02cs/S+Gi+KjoHRcI+2rAKQtPAx4Tz16+Lm6Vt1hM31W1QVMXnQBOPJH2F/nvP1PI0
         9dAnbu6ZpZNJTvuj6mR9/8RUq+L7rdO9ZYKp58eA3bnENg4uQxZ2u3nCChCFywItg9Rx
         E6PLoKZQIFAJdnHOppAhRY/WI48A/xy7JfmZ1EjWi1b3NS6QOe/skK3jkEFzMpcuYVVG
         JCqrtWnofTMm6ZDoo13Hy7Ii7d1e+GqBW+fc6oMz8NzpLsHI5jbzqQLMmJSHMupO9SZu
         rCWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z2ET6l1kFZ7646cHbCayQI5WEMFcXf1kwxAiWCRuN1g=;
        fh=EFxvdNx85LUwgUU5v1bXMDThNGQl3bQmWP2dHwe0koY=;
        b=L+53WM8nuWyrKc6nkqcZd/Z7jtjkUgre/SLuZNIol8S8jZL9c6Za7heijOYeWHjAdu
         EtjIcrJ8Z1tByFGUoZunhX++fNflsAuE1RgB/cGr1cuQf0E2F7w7e6imVj0wfAU7CYWP
         +3nhzFeZnku7St3S+WAm7C0EB/z0EQSEdAKTmf085yXoIef/T2btY9tB4o/iCf51apUN
         tOAgeVDqCrrQZ5pFReNX/FldlyQy0FqZz+mDaAn4ChTOPbqn93IA9q1q4LRcXmUBjRXL
         CTXV9L3cY+fuxATP1ULpucLv6cu8tYH9GtD6/8nDjOJ4V0ua68EQQbSWNMW4uaea/c1p
         Hy7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794368333; x=1794973133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z2ET6l1kFZ7646cHbCayQI5WEMFcXf1kwxAiWCRuN1g=;
        b=Q48DEDPK3Of2iJ2kM6UKtQiZRfJnMg7PyITt8bFmZHKKWWyFDhm1OJuxNnIOt/aTgT
         4bh8Y8ReU9hiLWFjht2jSVZITzhyJbDqR6fXNRhud4YAFKX3Uiw99skP5j1XYatYxLY3
         gDMzKgqAbw8BWKRZyGpJC09abkkh6f+MKiwXaa4NmlWXMjRWfZeE1b53DMUe4h3/v7NI
         D/oJCcbaLwyfi1rAwa0YEZoCngyaU9qmRWFrpK9AXsDauYUC3/MWazSQAIkOO5DvYhSi
         9AITZcX0gGxQSRfuIIwS7ZmCZzbja+jLDTMkekuCm1RM7Hfa1n3kB9ZE8K2qSyVmUSVO
         1qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368333; x=1794973133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2ET6l1kFZ7646cHbCayQI5WEMFcXf1kwxAiWCRuN1g=;
        b=N65LKMXX5O51Hd6DT+UM/2SA7HPQB+qexqrZhmqOhqb8f6Se1OjJOXljXllL8zoZTi
         SWEH/GV1oesb2q1guNms6XWr2wXHHYMUwq6OUcbbR/AVwmIRLMpblScp9GjbLFeY8vO/
         fUz2xceM1ohvpy1GKPwrKixgLITOS0+S3EZSaa6xCXOT97DTFN6dm924trImAFeN/cMu
         Ho4TDc4pD6RnRGlITjIH7399/PRfMm60DntJKnPlLgcG7hp1T0Ddh8hhwUQc06LMQAAJ
         tO2gZSMXIDFZiFogsuk4Q4Rf/R7ZmELFTHZLeRF4PNZb2GztFhta8PLJJ2svaD8C6yc0
         J1+A==
X-Forwarded-Encrypted: i=1; AL+hErEqFcjwbszNIwI3snGuo6dGNJnZLOn4bn+NB/kZEtnIHk+Xm4F7udRTe+5wZOaEx+whVRJnbkhz96SkqbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C9xgbqWbnvlMiGg66pCHlN0x42V0zTYUSZ53Th+uzyWR0htBl
	7dFG5vGDaHeQz5rUPmUTonH0bFuofWUzEcVsFH74Az0pg0D4p6z2EcOfg/WLQA8nhshthWk6+DR
	qxpVp7JaszgySj05OLyM9LB3UxNooxT4UXS0C/I46
X-Gm-Gg: AYBFou009XVBcQrZxaWu2+lUX4tnavLBNoGMvha2wm+9ZOHptqSwLM5nO61J5ghWekq
	q5RrMvpHTzDbvE9ExpZq+g67F/XOJyWHrC183d1YNwE+WMhpMa8B7m1d+5sXwm4N9fdu2zcYwiv
	NSmljca7NiAvfR24KIToFPnHQ3MjvhcNzwclRNNvEUtSo6i8dhIIRDxsFdVBO/ZVUNTDdCWb5C+
	QPspkD78tAkm7vurZBJt9zSsjbYp1QQcTD0zNjg72eDtLNL/wDkBK0anxQVvmEwXPJgT6CRziaE
	jQJY55J8d7g5+3OzpewmwIKhW6GbmsRjhvarqBjRt8g25EeZURxqjKkCH8XndHwaet4jD0LvwjF
	v1Dvydvzvf43rVlZpe1g5cvUxC0Ekm1yjXt7FPKwfJ4HYcKdCIE0OELAkkdngncemRbCVk+Ded/
	WauE+HJ29xvyFcTls=
X-Received: by 2002:a17:907:3e8f:b0:c31:c767:adfb with SMTP id
 a640c23a62f3a-c50662a8062mr90474166b.0.1794368332418; Tue, 10 Nov 2026
 19:38:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-pm-runtime-summary-v1-0-12ebf283db78@kernel.org>
In-Reply-To: <20261110-pm-runtime-summary-v1-0-12ebf283db78@kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 10 Nov 2026 19:38:39 -0800
X-Gm-Features: AclHuK8W422emwCtXaoFuChUjWHORL2ljfu7vHUC1vM8aNEtLmFd_5-AJv8NDRY
Message-ID: <CAG2KctpRRDMXR8wG40PeohsTyAdoNC=+4Nc9pHGQc1fmw9AXeQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] PM: runtime: add new runtime metrics and summary
To: Joshua Crofts <crofts@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 3:34=E2=80=AFAM Joshua Crofts <crofts@kernel.org> w=
rote:
>
> Add a new set additional PM runtime metrics to improve power management
> debugging and reporting (these metrics may be useful to userspace
> utilities such as Powertop).
>
> MOTIVATION:
> The current implementation only measures the duration a device spends in
> suspended or active mode, which is very limiting. We can't find out how
> many times a device changed state or what its shortest suspend cycle
> was (to detect a sort of power "thrashing" behaviour).
>
> NEW FEATURES:
> This series introduces the following new metrics:
> - resume_count : number of successful transitions to active
> - suspend_count: number of successful transitions to suspended
> - last_suspended_time: duration of the most recent sleep cycle (ns)
> - min_suspended_time / max_suspended_sleep: shortest and longest sleep
>   cycle durations to help detect power thrashing (ns)
>
> By reading the debugfs file /sys/kernel/debug/pm_runtime_summary, you
> get the following table describing the power stats of each device with
> runtime PM enabled:
>
> Device                           Status        Resumes Suspends   Active(=
ms)  Suspend(ms)   Last(ms)    Min(ms)    Max(ms)
> -------------------------------------------------------------------------=
-------------------------------------------------
> 0000:00:02.0                     active              1        0        45=
688            0          0          0          0
> 0000:00:1f.0                     active              1        0        45=
687            0          0          0          0
> 0000:00:1f.2                     active              1        0        45=
686            0          0          0          0
> 0000:00:1f.3                     suspended           1        1         1=
658        44028          0          0          0
> 00:03:0                          active             15       14        19=
627        25899         42          5      14811
> 00:03:0.0                        active             14       13        19=
626        25900         42          5      14811
>
> TESTING:
> Tested with an x86_64 defconfig kernel and QEMU.
>
> AI ASSISTANCE:
> Gemini was used to prepare this series.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
> Joshua Crofts (3):
>       PM: runtime: add additional suspend/resume metrics
>       PM: add sysfs attributes for additional suspend/resume metrics
>       PM: runtime: add debugfs entry for pm_runtime_summary
>
>  Documentation/ABI/testing/sysfs-devices-power |  36 ++++++
>  drivers/base/power/runtime.c                  | 156 ++++++++++++++++++++=
+++++-
>  drivers/base/power/sysfs.c                    |  81 +++++++++++++
>  include/linux/pm.h                            |  12 ++
>  4 files changed, 281 insertions(+), 4 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261110-pm-runtime-summary-8dd29a1383bc
>
> Best regards,
> --
> Joshua Crofts <crofts@kernel.org>

What is the vision for using these runtime PM stats once surfaced to
userspace? Runtime PM and suspend have disjoint portions, but I'm
curious if you see any non-obvious areas where these stats would be
insightful.

And is there a reason the stats need to be surfaced in both sysfs and debug=
fs?

Thanks!
Sam
