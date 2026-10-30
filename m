Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348668;
	b=QUiVENM9KwVCwus2klYK977KNpUO/e2FrdndzBLtIb2YkmFlyzRbVAfdKW3h2hyL4kwJ
	 TtLTh7PHyzlZi7K2Lg2EZXI2xia8iddhp5onXTxZZ7iacKV+7wWtXtJeS9rsmORHwUofc
	 Mu8ieVs73xY9kEFJkH6kKV4V/1UU+Cel1M6o1NYV9/CKwpDVWewz7DyLLdOwD2nCrg8Z8
	 //vtriVLQN7JaQ9C8mtN4G+7+WnLp7aJwOgognyNvIqcoM9pc6ta6MwQmGQN82sJcHvlo
	 W6BIAlKrM+jjiwqf6Ozk/+Wn8bzMFvuZCubuWq/GSLWQ199/ItJvYdKT0sQJgqtFwsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LBx5ZpxvL51kA/xA9AXMyCE/PWXYo3//2APXf/k3LmM=;
	b=qJzw6phsk9aoz7MAiiz8fS7jLmr6lTfJDG9s5p/3m/LE7sm66HYWUyWIGUHE0tcPV+Ig
	 AntEo8YQwjHhfujoWsjPRVvj7E8XyN4rAN7GWF3zgeSUEwwGLoI23rh1EB4oP1V12LfzU
	 aH74SnyV8X3630J6kaXxIagrTAS4Z+4KvQEKgktHJ4BV1c5+NhgAJF4qJsYOSMuzPIJTz
	 tWnW8/+FNvi+ZWjmD75MdwPD0xp1Tj2I/ka+cS0fAKbSmWciss7UW6jvxlDe/b70e8+Tt
	 aAEzUhxfuhH4dL6zu8yfoPNM8h+OIy5ZlLxVSbeY1X1HlXlUCeTiZga4wWGkP5Ghizg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qnhldl3p;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0791606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0791606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qnhldl3p
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a49a022221so3140721fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348666; x=1793953466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LBx5ZpxvL51kA/xA9AXMyCE/PWXYo3//2APXf/k3LmM=;
        b=Qnhldl3p9NW3iHADSW8msA1b9r7I9A3ZWTYwWNh2+vPxtBjToQa8V+u/h0UuOTYMR1
         iy34OAFLI1LJoL8XSxOGaxmL2he5F/OP8othsJ/X2hC1ZzimNrrIOWsN7um/1hpK9xPK
         weDnwAWpwPgWa6e8gOvb2o0iDPPcfUEiqGxvjGbWr37CsXK+Pppv6L8Erd4ehdx2sVO/
         ZesiqnSpg89ov7D3YV8GeTWKrrkwjoR3cc9iKsD3ClKCaNE7BHWGS8nYnhQnQEakQy5G
         ExQpFAZ1cUqLq0JTKGyKRiojHMgdIV111CXiT70DotVihnqs1Rf3gRjMK4LDZtpmSndo
         AOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348666; x=1793953466;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LBx5ZpxvL51kA/xA9AXMyCE/PWXYo3//2APXf/k3LmM=;
        b=PQQAKpsw9yC5VghexZF84a3C+lbLmlcKEqfp1lABs6Uks+pGYgajquce0tNQPdvc2S
         zkjbzsXf7vX7BObZmGVZ4zG6LpaCe3p6Lc0hJb/wx5dZuGqormIZvJQ9InOXg/oqM/u4
         HMrgStYs5k+JxcCYGL5/qBAcq39G633jzIL/mPh7dZkuPkX8wh2OZnRs+8UBB0gMNwDp
         A4jmxIm547ZqhGNuTHri5R8pRrYbMuxzvjq3LJa5470X7+mIicmq4DwYFV91XkmJIDr2
         0s7l/w/2aUe/TOgIhO25IVD6WqXiPq1bMIyEqstt5FdV6QpBnGbYD4MNGj4aJUXnsLno
         gqAA==
X-Forwarded-Encrypted: i=1; AKwUvBzjdkpsn53iiFuign5NRF6PyhbtksKZC7i3R8Nbr2dL4kj2hI9ohKYwYkNAdRYkSiSGnb48ep4DQT1BXqs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBdzgO4No1XYO7KO1tK88p5g2esmn0rLfocc6e+vq5ULhTLhwk
	tmOTJeV8HpQWhcI4DHuS8wRPyBGhqWdTgu7PltEoxGlS2LmucJiTjRuT
X-Gm-Gg: AYBFou1fyOmaSQJSSUQzFBjJaj5cdcAi5wDcG8T5wBY+fb18SfKDT55MSWTYyBBiJr9
	2g/xGn9iZj0SlcWjoEewMpV/C4emp4tZOOgGXIiZ4EN0rd3qsMjciYMBD3id9nYo3r+lkPSJMou
	EY3D4PTL/HdrZeEsCzYSbgNw1LNV4A3HidWTeTMAle9fH9PRcZ80esBy4wkwZ1RV6vQ0Mez8RP6
	O8YydaukC1ALLlXmw5dKxqBrum+vWtv9HCAqXV3OMnebLPFPmMxrK6xn0QDJHwt5T4oCQX05+Om
	aTo6nzemq0tL1PdWP56tC06Bm5o9SXbi3efdj7CXllN6kkxIQRtB8n3HI2Zkb93KbnCXJnAyq1N
	b66r84fWsmxaqDDeysry5qX8gNX09onJX7zR1omeYCj6bWMEGM3b1D2GijkDLW9VOFBWCzwccZ5
	lWQ4nrNPXgNfUeUGoXguXvohspSOn3ketFgs+yO/bSUrW41ackqhhd+f6X5wuC1hprdls+ucX8k
	3c/udnGf/zH9qII2aii7Ic+FoFQBrQhgtfsFkgRrXcZR45zS72ChSyDU9VFIrRcqLIXw+YP2tTV
	N6A2ebVO+ymqsNlJmVmyrU9hUHqDc19g7eTjyA==
X-Received: by 2002:a05:651c:1a25:b0:3a9:a2fd:5932 with SMTP id 38308e7fff4ca-3acb7a651camr3189241fa.5.1793348665744;
        Fri, 30 Oct 2026 01:24:25 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf3f762sm1753921fa.39.2026.10.30.01.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:24:24 -0700 (PDT)
Message-ID: <a83ade5b-b119-44a7-a5b3-3a7ef2d4eb2c@gmail.com>
Date: Fri, 30 Oct 2026 10:24:23 +0200
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
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Andy Shevchenko <andy@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andreas Werner
 <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2026 09:11, Krzysztof Kozlowski wrote:
> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/mfd/ac100.c                   | 2 +-
>   drivers/mfd/axp20x.c                  | 4 ++--
>   drivers/mfd/cgbc-core.c               | 2 +-
>   drivers/mfd/cs5535-mfd.c              | 2 +-
>   drivers/mfd/intel_soc_pmic_bxtwc.c    | 2 +-
>   drivers/mfd/intel_soc_pmic_chtdc_ti.c | 2 +-
>   drivers/mfd/intel_soc_pmic_chtwc.c    | 2 +-
>   drivers/mfd/intel_soc_pmic_crc.c      | 6 +++---
>   drivers/mfd/max77705.c                | 2 +-
>   drivers/mfd/menf21bmc.c               | 2 +-
>   drivers/mfd/mxs-lradc.c               | 6 +++---
>   drivers/mfd/rohm-bd718x7.c            | 6 +++---

Thanks Krzysztof!

Took a look at the ROHM stuff. Looks great to me.

-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
