Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F96E3AC0FD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164040; cv=none; b=XYVbl3YgAObFxLKys60u8dPRTFFTZQY8esTrqYNyLcGu/Brc4pmdj4UYCQQZIgNibXPj3RQ7uKHYFmLn9zAr7Xc/hr7vQp606pcdPvDzTSLDKgyhwY2pR6p6c26nBG8fjX+oQP8VDS+S2JHPJuztEB3Ad2nG0bbajFLhEbr6nu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164040; c=relaxed/simple;
	bh=nSpW9BfmTHNhgEttguu8dKSf2X+UrvTImngFQ4Y2OMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKWYRnyesNxpHPfsQG3AAjfi93h7L+kJElqxLsG8Hw85agwWnDZd/z3b9+xMeolt2Z04XKRi+r7hoJ6l4bv4o/wzE+8M9+9bxctmgfYXhxW7CLyDyGW9ejzDRPg1QfTCkv9vATiDab1iIIsft0ATW/RvjRM/xqLvth/DT15QR0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=Y8yj9esm; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="Y8yj9esm"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c252c7270faso546470966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1788164035; x=1788768835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrTpW37S+1M6EBPYov19PswiAAuwlv9L2hIKGUyEp3o=;
        b=Y8yj9esmg14+XCwE4Z6zym+S/kB132EGaStAj+lF9Q/SOACFyJwKZE4ZC3i5oxnfyx
         oXIvrYrO1T0H6ygmakW8qt2m+iIVSwtRIGmdxc+aI1FRFm68zopjsvYpMzp7NA4oD9Ks
         WbOUkZiEJpBJ5fqGLqZaUzEZUbYCVdhGSL85o0gsaU67+ppTBM9b1eYPjW8N+1a/mnxw
         z0yDwusD5TJ3XMpnIQWXT8tg4qJm0uX/d5/3b+vzlZoxWfKXKVrArDnXh9EkxH8uqbfV
         Eq4CfqPKbBXQnyWYb3irEVvXInmNf6vL7k33GcoobMxahb6mHej21q3AWul0BrHIh8SV
         GsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164035; x=1788768835;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrTpW37S+1M6EBPYov19PswiAAuwlv9L2hIKGUyEp3o=;
        b=OmjXHx+j0g1DdswvdKf1wrDPfgRXX/TjhbHxJQTiAMfBjGnpZ9Vzg7yeGSISjGKzKS
         SEk7nrAN73jatlL/OBDH6eW18EzeYrgcOr2L0exudhyA9X2ETsuELddNpX27Z2tIbJUY
         xa5cai7Bn/phTmX2owwmkJw+4qjkK8ZgK2qGedusXv6q4x3RPCFT7ZzGuc6Vs19c7iDr
         KNXJyJMI2NbQQ4c7iSAKAdbfvZIq9scnSzBQt7X6bETBlielhYUat1PriSlnSJVZAwSE
         6NhHxWL3lGNs3Jjww27056THQJ+msu5o86m/a/ip1KVDz1jBZRPI84o/yzAJVoa4/3sP
         /VOQ==
X-Gm-Message-State: AFuF++nSMvV+bikuhZ782bR7cTqQZ28e4fIOTnKGL8h4KCvP3+bR1UmE
	3+pvE1dqa2I5qhud3mOcMqaUA6UaaqIWIHJGCs4x77QOZ8OxCecscVEoGR4PEwEWYw==
X-Gm-Gg: AR+sD13P2lSDrbCA6S8sMLIklDe4nntwrvhWlng3gehqKXxZ1Hd3q1ax6bxI/tCr6DG
	GGlk9Y88L1yPg2SguVLOL0vBJCyFgkQW+fUSCkNYkBlGskTVEKD6KCFlPuCXRZCZCr7N9BMaBO9
	7xRhgzsyT0AWdaDiuHdfCU2e5NnFJrnhf9mhFS37WJGdX12o4NDJazaKWRp7vabwJxDjiv8/UzU
	wHELKxa9qlninGGGbxPiIUuKDHdrTayswftodIwuqF3AsOJbdIs1pJST6bOJzJAtMGOOTVb0Oa2
	U7epnzUW3KB0OtjvcJ3XcMdKI0EopZZQznztmjtKf9XfKJcDBVGNVrA2Lc8KpPdb0LDwcJClvu4
	GabG97Q2zYpSCl4qRIPQl6Po5k3PmaDag6q5BJ6F4xHGO1ooyAk5xwUeBbvTiyvZG9f2Df2sKoP
	g/WODszZrSb0IifkmQxF89Go4FlmGMX9DzzWalik7fICZ+JKNCTtiz3jAMiIyG/S5WNIf+W0OS3
	PS9sfaRKDH+JIcIUhbzCKfkEEF4OkqUFBgM
X-Received: by 2002:a17:907:d006:b0:c20:56e8:5457 with SMTP id a640c23a62f3a-c25ab2f4743mr117117466b.6.1788164035012;
        Mon, 31 Aug 2026 01:13:55 -0700 (PDT)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09c68sm390058166b.7.2026.08.31.01.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 01:13:54 -0700 (PDT)
Message-ID: <0b5cbed3-ce1e-4f8c-9a24-422eb8a55806@monstr.eu>
Date: Mon, 31 Aug 2026 10:13:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] microblaze: reset: Call POWER_OFF handlers
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
 <20260804-kunit-microblaze-v1-2-6dcdfe12eb40@weissschuh.net>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20260804-kunit-microblaze-v1-2-6dcdfe12eb40@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/4/26 07:32, Thomas Weißschuh wrote:
> System power off might be implemented through sys_off handlers.
> 
> Currently these are not respected on microblaze.
> 
> On power_off call into the generic power off function which will execute
> all regustered handlers.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>   arch/microblaze/kernel/reset.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/microblaze/kernel/reset.c b/arch/microblaze/kernel/reset.c
> index 2f66c7963084..3612a20ca16d 100644
> --- a/arch/microblaze/kernel/reset.c
> +++ b/arch/microblaze/kernel/reset.c
> @@ -27,6 +27,7 @@ void machine_halt(void)
>   
>   void machine_power_off(void)
>   {
> +	do_kernel_power_off();
>   	pr_notice("Machine power off...\n");

Likely it should be here. Or you will never see this notice.


>   	while (1)
>   		;
> 

M

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

