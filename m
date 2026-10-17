Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A612EACF2
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792273639; cv=none; b=gjDROr5nYgu89nOe2qViknc71UVOWdLTY3/enDGqXYJ2sTmeVN8q6nuACRlGy59WgSNs2tZiWc8t3ru71InfKGDUPtRkUjBZtRJhWthg4XV+Kc2vdxJvFU18QFiVQe9rCy3mw/1SKlzU4cmTO9A2Lif44tkk2RDzEogKnyDEJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792273639; c=relaxed/simple;
	bh=LBiNyMQaU+Lz8qtwm1wDvcMmGVUcj0TquZ11KFl1f08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7wAUPLWpfNAtV+zkC7nR8FJ/VGF0N6vMaA5sVbTxmd8OxGubWZs0Umj1iaP4RzqwB3IKHsrssKU9hhBQaUah8lLOZmr0ofeXXnl49O+z47pKg+geM2iTQ6y/l7JuFilLqE9okje/TM7fJdNz0WEchg2RkBlf+DuchZA1JtS71o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nilk.net; spf=none smtp.mailfrom=nilk.net; dkim=pass (1024-bit key) header.d=nilk.net header.i=@nilk.net header.b=EQgRe/lp; arc=none smtp.client-ip=74.125.231.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nilk.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nilk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nilk.net header.i=@nilk.net header.b="EQgRe/lp"
Received: by mail-oo2-f6.google.com with SMTP id 46e09a7af769-8216bf5eb5eso440585a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nilk.net; s=nilk; t=1792273637; x=1792878437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gr7QzmsxuF1G07OcSwQ0zxYW4hq1ADbK4n2bkyk1L1M=;
        b=EQgRe/lpCg8SIPzTTm3+JpiCFHVy2eO3vhgMd3p4JHGaGJnROYRo+e5gJ5U0YDCVvh
         NEY1RhLo7TLWvpjQs6+jF8mxUBSMrzMSWV5wE4VvvOSB5+9w17Rjj1LWIV5mJoXz/4fa
         n5AgMyVMfpvrZybl069z+i8DhZE5qUUV2pvsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792273637; x=1792878437;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gr7QzmsxuF1G07OcSwQ0zxYW4hq1ADbK4n2bkyk1L1M=;
        b=ZFCfApX/P9Xkffwdv3DG65/SRSWfZBEW32seXj5nry+gGnALoHsf4aEenUnx4YMohO
         wMoGeCm067OjeQ+V6607hoAN+2uc4yqCME2Bu3JKycb03CdL9sHLjxhsGFNpXv9HlLgp
         /fz3yGcJDjQhFyny2wLPeuGGy3uz31ysKGh8Zaq7yyY77chPwqVZYmJdV9BoSkw3fETD
         bYNrO74D0OrLvq/BNKxp+04iSIKyitOmrENrBhWPIVzigZCfreRT2rWpFkaZ9wQN+nKL
         1apDWVbfsA7mrnBB0hEyt/Fr5PvsKdtAEPncUKvs4mrUpzLcCXhC4a4p6GFas1aRrabk
         /T+w==
X-Forwarded-Encrypted: i=1; AKwUvBxomroPllMYI7nRC1/Wx1BmipdVzPB9RalwYhWAXlMZZEsfMuoO4PYvM8AFXSdjDKLszqCXilTz9GD+o8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDMduX9qmj7bJpbETG3DB+/CfEZapknJ0I9zLMBaqrxZw424CR
	gETTebrou8jz5a+YgFs9q7cqM27jXMQbMB/itx7w8IVeNXDFAizhlwqTCz02b0s4IA==
X-Gm-Gg: AYBFou0XvlVjK66jsPpBSlV0Ojs4KABnLhBYUELVzkR0lwNtvqEJVP0xGheoCUruso3
	C2muLQ62he0SyRMBwhaLr/TZDB8BRguNMpmLykkQ8+0OuUz/et+BOWD8mIMyLguGNuejaje7sHC
	jhmMz+b6Cl1nnm3HK6krfm5ksxxZwTDr76e9G0h1Du+8s8KE2dzn/RvMqhYapfX/14dg+1K7xiR
	Gd6Dvo3u//+98Vgw/9pIb7sF+mbjfpop8PqueqaTl+KLCoKVRm9VVn+v9fAs0t1pbUBQVnDRNwz
	I4S8GazNTsCpKHmisYYZu82A0/XcuKpog2fTwS6ZnIUFyQAO0H1mBVxgKb5RwEwPxgo6jEeCN1n
	6AnWb2Ykzp7TqsGnhVpk//w5DNvOZKZ03I7kdcDMWCy3/Ot5EHJAfPljSDcL+FX5wtpbHekRPMa
	12ODPqRxXfMYbuBS19Hpq6A8luj7h7gEvnBqMh8oMWKm5h+PMygNM4sgXYPfGaQxuej7F6zLycL
	nS0L4y5i8xgGt5sGwRMVQD4tK6/Hx8I+OH2nbX6YeEVa037zrwZwksDaWdbvTlidoN6CF9jbY+1
	Mc5y38VjVQ9HiAamHRz9hcEN2KaSE/nd0IJP+KPgLro/raKJJP5YKEPmf30fwilsrMCp1B3loga
	Ud7ppLeobdybnimEKcfz+ed5Lq0v9RGGpk/MiQoK3EwW2DUnJ2g==
X-Received: by 2002:a05:6820:f023:b0:6d7:fea2:526f with SMTP id 006d021491bc7-70355d88ab4mr2411588eaf.30.1792273636699;
        Sat, 17 Oct 2026 14:47:16 -0700 (PDT)
Received: from [192.168.0.114] ([187.14.252.51])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a53dac8dsm5527535a34.12.2026.10.17.14.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 14:47:16 -0700 (PDT)
Message-ID: <eee2988c-5ab6-40c3-ad3d-e4e0aeb977be@nilk.net>
Date: Sat, 17 Oct 2026 15:47:14 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] media: i2c: dw9719: Add DW9800W support
To: Danila Tikhonov <danila@mainlining.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>,
 Vasiliy Doylov <neko@altlinux.org>, Achill Gilgenast <achill@achill.org>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
 <20260801-dw9800w-clean-v1-2-38978de67963@mainlining.org>
Content-Language: en-US
From: Chris Simpson <chris@nilk.net>
In-Reply-To: <20260801-dw9800w-clean-v1-2-38978de67963@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Danila,

On Sat, 01 Aug 2026 21:04:15 +0300, Danila Tikhonov wrote:
> The DW9800W uses the same chip ID and register layout as the DW9800K,
> but requires different default VCM frequency value.

A data point for v2. The Microsoft Surface Pro 9 has a DW9800W on its
OV13858 rear camera module, at 0x0c on the sensor's I2C bus. INFO reads
0xF2 and register 7 powers up as 0x60, both matching the values in this
patch. The module is enumerated through ACPI, so ipu-bridge creates
the I2C client, not DT.

I ran this patch as posted, plus the one dw9719_id_table line
suggested below (without it the driver can't get the DW9800W model on
ACPI), on a 7.2.11 distro kernel with the linux-surface patches. My
ipu-bridge change, still to be posted, creates the "dw9800w" client
from the Surface's SSDB. The driver binds to that client, INFO reads
0xF2, so it goes through the DW9800_ID case, and the sensor gets its
ancillary link to the lens. With the camera streaming, register
readback shows CONTROL 0x02, MODE 0x40 and register 7 0x60, and
V4L2_CID_FOCUS_ABSOLUTE values 640, 1023 and 512 reach VCM_CURRENT. An
equivalent change has also run through runtime and system suspend on
the same tablet.

[...]

>  	{ .compatible = "dongwoon,dw9800k", .data = (const void *)DW9800K },
> +	{ .compatible = "dongwoon,dw9800w", .data = (const void *)DW9800W },

ACPI users need the I2C id as well. As posted, an ACPI-instantiated
client can't get the DW9800W model:

- Named "dw9800w" with CONFIG_OF=n (Fedora's x86 config), it matches
  nothing.
- Named "dw9800w" with CONFIG_OF=y, it binds through the i2c core's
  compatible-name fallback. i2c_get_match_data() then returns NULL, so
  the model is DW9718S and the INFO check is skipped.
- Named "dw9719", it gets model DW9719, and the DW9800_ID case returns
  -ENODEV.

Could v2 add this to dw9719_id_table?

	{ .name = "dw9800w", .driver_data = (kernel_ulong_t)DW9800W },

Also, that -ENODEV return leaves the regulator enabled, like the paths
Myeonghun Pak's patch fixes [1]. It would be worth routing it through
the same power-down path.

I understand v2 is waiting for the DW9800K rework. I'll test it on the
Pro 9 when it comes and send a Tested-by then. The ipu-bridge patch
for the Surface's VCM type would follow on top of it.

Thanks,
Chris

Made with AI assistance. Written by Claude Opus 5.5 (drafting), with
review by Claude Fable 5.1 and testing by Claude Opus 5.5, under the
direction of Chris Simpson <chris@nilk.net>, who reviewed and approved
it.

[1] https://lore.kernel.org/all/20260913041828.28430-1-mhun512@gmail.com/
