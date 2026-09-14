Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EE6433E7C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381548; cv=none; b=e4dkL/sNo/HVPRoQQfUl/AxgCIigb6a9l436AyfgRjCKOQGdccwouCxrGm4O41KWnabSO2chMyPcV0/R/+0mmmhLTxn4PeH8UBm1l6XjNAy6end+D6IFEnZDMaaAK7gPQJzmGL7aLb603OUM60+eSfAQRAd5g1JO183PSuWupAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381548; c=relaxed/simple;
	bh=REIrSaykx4LWkDbfveszVkDpVcalomJLt6NcRuiOo0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROlMAczFzkyo73eV2CANIZO9ItQc9IBzHxmI173RYMqlS3wXs9BvodCzSz//HZBbeBG8U136u2fvI46xMNIqd8srIiYCmgD+Ti2AZRcZ80kmo21KbkonROUOZOEWn/Ecl+TPqNhoOaj0ZZJI5Sx7iTGOW/qT8/Xdf+GuAQsJvUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=nfhqI8pD; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="nfhqI8pD"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso319801766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1789381544; x=1789986344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSR88sMEFJCoCvAI0LTYFAxIMu+azVship5IZj/cgaI=;
        b=nfhqI8pDwStp6fX6FUPVfTqrZNoQYVEVz/kT/NrDS7zhUFU92zRSSTNGv9myCcWIeU
         wj4C9Ga1/8jE9At9uwo4SRwgp1zA1QDJWXvBQYNMmWqsGTzAUglZ60IUt++2utZLssg3
         tAJ3OKrELBvKh45ak1IzxGo+EwDDUdogVLJe1l8yErkFkpRvWsLR3hyLWq2W1ECkZGJL
         sSnqy870lK0Du6F8ts4IdWpkaHIQ989tLY+TqPAgw8oLKfj/vR77amvBUYZduEXxlEqc
         1FlRXypxYkJhBgDvQFA/WLWfEAV7ZUBwxeS91ddu0MRVwizENVT5g/Ne7NpWHxbFYWB7
         nh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789381544; x=1789986344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSR88sMEFJCoCvAI0LTYFAxIMu+azVship5IZj/cgaI=;
        b=cz3WvC7McxWRrjpWEzJnoXvzUQc4XvmBWaF5nbt9LcScFPArzrLqlyYW/peuV/4exx
         jPNz4n3U0r4Ss5cb79O8sNjZLeBEfkkFamnQYCkKfQ/nPnGmyNS3a8A4Z6U4NEwXEoG8
         Tdb5BzYkWukC5YF6jSTA7vQ88U15xeyqaVDwBcp1cUjb10WmLSsERtcnlYkA47YXD3ij
         O+4tI3Og7XxLALEjlAzpIkqaGHloAccP5syzdzsdBUJIgSdzs2yo/Xn3vfPhQkQjLML/
         CFLn82hAoE3a1Wwj9Pf5SYtuDxVvpmi8k2fz8nhX5vRNTr8R5RywByhHCdf/KQ6/llbF
         cR7A==
X-Gm-Message-State: AFuF++kjWYITGGpWjljohghjGo5HcSKogZ4yvhJO1LDvCSAFOafbm8rQ
	2A/HHYb+fn4ywK+xLgl/3e5SaOglXYenRBzqMiE3W9omAKy2rHtrO1UPd3xPPbL3xA==
X-Gm-Gg: AYBFou2n6SVWimaPGY8gEJ7MA7LtgbICyM0J/z08K+UlRT8BlUabuFbAvVcsDAmWWdw
	hSsApI33n9QaCzurAqKCBbVOyePMi6/XbQIUZ6NMKMSSY53c9QxXhPSvHAxpc+1ab2hXpkMVrFx
	fjw2E+HkIKpevs14blD0Z7RsBZXnfEodeffST5v7BcB4Zolv0PKG+Sg3YAljIxbygeswSkFZcjx
	knww61+RgH5lqQL+mwfwvyE3cv/7+YNGr3sisWYGhAPnAhRo54tqGHP/erA337Nc4ECDTq1MbDy
	LAgt/R2mmy3yej0NBX25OxrpqhheN+1Ewp0O3TD0Tb90gjMuOfqAwmgRCHNan4WaGcXqMQnVzEd
	7a/kNF+8Ss7p5hJzD1gQ9ovdclPsd8SJpGB6of1pMFalIk/Kts4ddZwCgwElefaJM91t56T4aL6
	4CNZTHoRtFQqOenENH39AVX4XPY1XFuDvmnt3GXwPPmpPoSjuHGc9Y0NLYmLvX5UydWlZk5A9n6
	nH2IYRHWNbRMKGyWsS1t+ynh7MwEcDOeRyYb3m8LCWibo0=
X-Received: by 2002:a17:907:c13:b0:c26:1648:a06c with SMTP id a640c23a62f3a-c29b8770a38mr127537866b.39.1789381543301;
        Mon, 14 Sep 2026 03:25:43 -0700 (PDT)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966026fb1sm418149166b.11.2026.09.14.03.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:25:42 -0700 (PDT)
Message-ID: <853c3881-1532-4332-ad5d-2f3e909af552@monstr.eu>
Date: Mon, 14 Sep 2026 12:25:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] microblaze: KUnit support
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
References: <20260914-kunit-microblaze-v2-0-7d5756e858f8@weissschuh.net>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20260914-kunit-microblaze-v2-0-7d5756e858f8@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/14/26 01:50, Thomas Weißschuh wrote:
> Add the necessary prerequisites and configuration to run KUnit on
> microblaze.
> 
> Please note that various KUnit tests might fail depending on the
> kernel configuration as the memmove() implementation from
> arch/microblaze/lib/memmove.c seems to be broken.
> 
> gpu_buddy.gpu_test_buddy_alloc_exceeds_max_order is currently also
> broken.
> 
> Intended for the microblaze tree.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> Changes in v2:
> - Rebase on v7.3-rc1.
> - Pick up review tags.
> - Move do_kernel_power_off() after the message printing.
> - Little endian support.
> - Link to v1: https://patch.msgid.link/20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net
> 
> ---
> Thomas Weißschuh (5):
>        microblaze: uaccess: Zero out destination on failed get_user()
>        microblaze: Pass -m{big,little}-endian through KBUILD_CPPFLAGS
>        microblaze: reset: Call POWER_OFF handlers
>        microblaze: reset: Provide a power off handler through an unaligned PC
>        kunit: qemu_configs: Add microblaze configurations
> 
>   arch/microblaze/Kconfig                          |  9 ++++++++
>   arch/microblaze/Makefile                         |  6 ++---
>   arch/microblaze/include/asm/uaccess.h            |  3 ++-
>   arch/microblaze/kernel/reset.c                   | 22 +++++++++++++++++++
>   tools/testing/kunit/qemu_configs/microblazebe.py | 24 ++++++++++++++++++++
>   tools/testing/kunit/qemu_configs/microblazeel.py | 28 ++++++++++++++++++++++++
>   6 files changed, 87 insertions(+), 5 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260802-kunit-microblaze-7a3f6ac88b4d
> 
> Best regards,
> --
> Thomas Weißschuh <linux@weissschuh.net>
> 

Applied.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

