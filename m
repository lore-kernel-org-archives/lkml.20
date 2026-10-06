Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA9A3D9525
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282143; cv=none; b=E+m2SweT64sGPBu9xMm4fNwuN1+I2n+bkje78knuBg9cEcsHa6jKP+RXqqQJ2NH/aG0YzP+c3FI08IYcnI9Y+anYMvD55r7kkRj29cTv5FIUc3HcMnyRSjgWD+GJHyg2MV5xO19dy7jxUO7J5AD3ZWM0MDet0m/BOuqeacRSfvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282143; c=relaxed/simple;
	bh=NGfZhmeeQkA2/L2I3n1PItuYPI0fkx3kBIC6StcGCW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=se4cM3+vEqda9cgyF0XhK5IY/twRswiM+xR0NlfuzdMMNlfVyMunyPwQR2JF9VxK8AzoMGPwPqyUONHhdvc7NXpytLsHe70V0GcbB7cJ/qObyjJ1Ku2yv2+GvNOy4RoYYy7Vp7oIJcok7QPFejMhauxIBW28xqLIe9TsoMTybnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cInBsqLn; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cInBsqLn"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1206099a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791282141; x=1791886941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/hrvnn0z+2DlIg4l/OJm7mUefYyBjl4fij27fEnYo4=;
        b=cInBsqLn7ZsiOddalzdnIaw0x77kbuhW6TLiekzNtCCOYIS9GqD4Kt0TTh8mCOVIBO
         xiy1r4Ya5TAIYHY19HBnNfRRrvv9IRfw44en92o2/JsAhf2R7B+se6wm/UxEi8fA7AqL
         TMQCZaZW+NWXhNyzirtL9BnUgQNE5aADZnX4W4wOay64gAWrtAQ3N2HL71TjI/FWeFjP
         2irIOWSZhrPDgfhZoPLZdeUr96QwEh9PmGaRmK3cobUbbRR6C5z7ofm4KiXZ7fH2qRRa
         af42hvENHhuvhThQezszucMjxat9eRITbblx7QfCZ9nAYJvidbPeTHbBcIDcWcCuspHM
         bf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282141; x=1791886941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/hrvnn0z+2DlIg4l/OJm7mUefYyBjl4fij27fEnYo4=;
        b=ugne3IjV3Bj5kjM0WoTrULVCHppShSocPhGyUAczE761Qfe4+xoAsCYeeGN0LIKUtk
         UamkW4lEY6JcDmCVvxwiTJab/ZFujazPOud/nT529R/tCxZO4Uyu7pwVBMOBrm9yOsGr
         Lfhgq8ML6rknRGm5TAkmxPOLV3rLM6qnwF69vAn9yIJje28Ej+6fOSC7CSeME8svs9wL
         EBT/eRJkM/TRz2y4w2RL4Wcnyeigno/svC2cQBku+gePIPxEl0g41SQWQYoiMcq1IHvO
         fVUim0tnb/CzQ/wS4JcQyMKU2jvGKsy4jPZSj9Je6mJh+hOF7wS1O+ovoF+B/ES91w+B
         jQpw==
X-Forwarded-Encrypted: i=1; AKwUvBzzBk7d061TMZ6RNgF+5wWINSHzhP9NuiHqV03LW+5+8cmiK1KVbh+dHexIGrBZJXBjAp/PVEJH0aFXxng=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDclLgnJpgY1LtP/yWRALsRYkPD8q7nAKPG0YsGxEvjiB7AHfL
	WPpw3QvDLIrRMc/nQanxEgVxhTggQadzMkAtduAbSdSkvAgsKLxJ3SpI
X-Gm-Gg: AYBFou0qxJ9IAVmw6NCGUqKCfbn7+jZHZ4feT1mZrspNGbQ/mkNllAYLVzwfgfvCI3d
	Ixm3R8to4YNR7ps31az8N5B0xYaBiNu35CMoMujWAkzXy5/XhJ/a/LCcFEUhQa639Pify6AHLrI
	TFOANXx+QN5MammRgviQl7VyWQP3sWXXYo5ocPehRSdrxgEJNVu+RNchigpE6PxI1Hsn0wnzlgR
	wTPideYi2zSt4vYO/EvWshVEoJzFDbsVawPk1YzndNM34eoFSagUL8RTsbgiLaFtiGXIgTbiVxn
	vsnLR9ywD4QcxnZs6dZf4DDpvb9+4ikZvQQ6+PVyQbw4gxqdiWwFeSrZ8+3HzcST4dq9EZzpGRl
	H1OPjILeYSmIiEwDYGISSFU34tdpwzyVzWdvV9aBUQgL/n6AUueKYur7QP/VZP4u0JyIys17gSQ
	qci3hbXZ/MwzlXTi6Ftkva5pWT6nPSfB1JDdSI9H3ntwSaXiUq6FZ6r3NJ78T/WHjG2BK/1sl28
	ml08Q5QpEnOAsnxGukIhBcgJaoi5XT3fYamebQN4kp7fm6Z2rCJZdc=
X-Received: by 2002:a17:90b:4f:b0:3a0:deda:3d07 with SMTP id 98e67ed59e1d1-3a787181df6mr8026458a91.14.1791282141410;
        Tue, 06 Oct 2026 03:22:21 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85436fb54sm4153971a91.10.2026.10.06.03.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 03:22:21 -0700 (PDT)
Message-ID: <413f21b6-90ca-4102-9466-3cf7b9feddc3@gmail.com>
Date: Tue, 6 Oct 2026 18:22:17 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to dual-port
 with OTG support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-4-a0987203069@gmail.com> <asN29Gi71MIA-2fq@parshuram>
 <ab91b558-e7e6-4758-b4e3-66e5db75b790@gmail.com> <asSzYUA5W51Ngn4X@parshuram>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <asSzYUA5W51Ngn4X@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Vinod Koul 於 2026/10/6 下午 04:37 寫道:
> On 06-10-26, 09:37, Joey Lu wrote:
>> Vinod Koul 於 2026/10/5 下午 06:07 寫道:
>>>>     */
>>>>    #include <linux/bitfield.h>
>>>>    #include <linux/clk.h>
>>>>    #include <linux/delay.h>
>>>> -#include <linux/io.h>
>>> why is this dropped?
>> This driver never did direct MMIO access (no readl()/writel()/ioremap()/
>> __iomem), even before this series - all register access goes through
>> regmap via syscon_regmap_lookup_by_phandle(). So linux/io.h was an
>> unused include already, and it's dropped here as part of the broader
>> rewrite touching this include block. Happy to keep it if you'd prefer
>> not to bundle unrelated include cleanup into this series.
> Then it should be a different patch explaining this
Understood. I'll drop this change from the series. I'll leave the 
include unchanged.
Thanks for the feedback.
