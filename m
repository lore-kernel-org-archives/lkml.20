Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6F2514775
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789058966; cv=none; b=geZWfNTx7Jou75QskxVQHCyzS1EDZf2rRTlO4kk5AvJVgy8fot6HXQB/cUjrXguohRSzFv92r6OtPvxCa5b9oLHD3eSJOwf9P8va5RHujm1FhCjKByUUaqAw7OTiTLAsrJ5Em5QYmo/57G7y7vmtXwy1KlBd5T28qAeULcMnqKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789058966; c=relaxed/simple;
	bh=et0IgSAi65WntaNByaMxMnNVQe6qfEdQwD5tqMZuHTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p9G4hQzIJPo7zN8uEMqKdS7DSMAOAFXgEBN7GfeGKd8Ch9DhAPKWbHbNP+RKzlB6FYsJODbV6MGmEKP5xVXJNxlJjpJTEvIfcXpohnFuUMg0lIXa/HWa65w7lXiht8dt8lycm2xOfxvCQ1j0vU5fv+JZ5GVfhXAvzsuXMRdtWOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net; spf=pass smtp.mailfrom=pardini.net; dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.b=SRnYUbHo; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.b="SRnYUbHo"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so19858a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1789058962; x=1789663762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trXMroz5mGRhnvsqxF0GR3hfGr2ispYPFG7I9RaBuY8=;
        b=SRnYUbHo7aDB9qNwRUFjDbMAwui3H40oD1onMYwI1gpayJaSnAfFuRDBzlF4gPvlFy
         jj2fbeha677dIuoVZcn3XP0oiO40vfM/V4YU1MuViYuGljApvrz602lvh/FbPyGl+zcD
         fUWe7ivp73W1vein78q8BJPCNDianX2pd4qUnxVKK7etnaxLKVeK78e5K3KZU8THhS/8
         ld8wyGx3PP3G8HTbBIhqKidnIk6IhCAqrG8ZrKtQhSVQmbmlfjW45F5PhXo/zrJ6QxzI
         UMSAnzEwimnT5ECaRZvTFeMuisW9rVDWFsHOjhvLFKBfNmO/rReYFJCBuwLmbyocJNNI
         Pdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789058962; x=1789663762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trXMroz5mGRhnvsqxF0GR3hfGr2ispYPFG7I9RaBuY8=;
        b=NWGxCU7iCZRPoYZylPlvqDjhRLt4wwj134MxGEeTiirfMsd2rFJPS+Opfu+8uh/6dx
         FCsPAbH3vTzEkwn/1z7/XjWPodm1LnYCN5xuoFn7c66TdG0sCOVquRfuyGMCcAdOE10H
         N/1d5Nz6Gzs1oH+pug6CfJtTfVFhfTH4tk7H2A2QiJ8F3BKXp2GStg3MATtmdkRy/UZQ
         3S4Ks3Y6Z5u3bE0IZ1cvPRMzzNbn1feLIK9gGyKzp7A7+Ca3mlK5uzCng4gmdEhuhV7v
         qKCrpvz/eMW4wtLFtL38f+TcsR92ETckg8kD39HBBvnh8v5EdJ+AIwlX1Zu7RWULg/uX
         nLOg==
X-Forwarded-Encrypted: i=1; AKwUvByibso7Crj+mlSfwqr9SpiIw8Z24zdxK87fuqyy4IX0V4yyn5nF/zXVVoXE8EA8ejyDY9jgti6u4v/PPkk=@vger.kernel.org
X-Gm-Message-State: AFuF++nr7RoDOgv5uQ0cDcEqUq8OXcetK/uJavWWlzBpgwOinKbHWvnj
	3duVBCMpvF/baqov1eMAXCEYxhpGQdC9YiVrb4QkY9+EuLOducLrh9s4+zmPgJtRPQ==
X-Gm-Gg: AYBFou0TZfIAT6OO8lANiGO4XVDF+9Z7rthiWp2uyip5JjclLBIWX3KIQ/r9yth2Op5
	uBU6HR0XTH68nSTfpIjQZsdcERdKEpSBoza9iTtCCcBryZKj2uyGQoYP/3eoKBwQZf0MuGU7eW7
	IZXgHWkXZ+qnaltDsvRVNpeX5kBf3M10Xhe06xvwxk35Le7jzalQk0fHripOkYsJ/RyjfqBthIl
	7zJ+8qRsI7vBbLuGH4qt06tJa5SW3RRzhANwaQlalGwY3qqyFa8qaSLB62cK/KEG9NmODOqA3NX
	6jINJ0Luo5HAKb5N54zLGCmor/S549GsUk1Xmk08HhwfuvF/re+fsYrvAsLD30tkFZ2uUp3FxyU
	RnNrH77tySiyMCDniL0wUQBFR40EYodtloWDQMigwcDKjvhkqxDbTQ6Hkw4jA3DI1TAxWxu0ch6
	EXfyX6AsKRKmHJrne/ib/ltAX0hkH2//WUsco0MtcaDh/k/voQx5lz2vvW8oRTq/rQNoemYGLQT
	Ed66eKsXf6WAk+WlMpEaOVEmnimu2gJPVb72fLNEpJQDhbraIMiVfeZktDrq8oVzydKst9wZJKw
	K5EJOVTyoC1EE0nROGc7203VjFcFPt5Bc3vvMc/yPDMzZfpmMGDVP5cd/w==
X-Received: by 2002:a05:6402:2b9b:b0:6a9:a3a4:797d with SMTP id 4fb4d7f45d1cf-6a9a3a47b3fmr2194091a12.10.1789058961506;
        Thu, 10 Sep 2026 09:49:21 -0700 (PDT)
Received: from ?IPV6:2a02:a466:4d7a:0:8888:6b72:e1ae:406a? (2a02-a466-4d7a-0-8888-6b72-e1ae-406a.fixed6.kpn.net. [2a02:a466:4d7a:0:8888:6b72:e1ae:406a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c294682fcfbsm143774066b.16.2026.09.10.09.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 09:49:20 -0700 (PDT)
Message-ID: <08011075-364c-4520-857e-cd1acf955b53@pardini.net>
Date: Thu, 10 Sep 2026 18:49:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] nvmem: Derive Rockchip MAC addresses from the OTP
 CPU ID
To: Alexey Charkov <alchark@flipper.net>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ricardo Pardini <ricardo@pardini.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2026 15:07, Alexey Charkov wrote:
> Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
> memory, and Rockchip bootloaders use it to give boards which have no
> dedicated storage for a MAC address a stable one anyway: they hash the CPU
> ID and patch the resulting addresses into the device tree they hand over.
> 
> Kernels started without that fixup, e.g. straight from the SPL in Falcon
> mode or by any other loader which does not implement Rockchip's derivation,
> fall back to random MAC addresses which change on every boot.
> 
> Formalize the derivation in the DT binding and add a Linux kernel driver
> implementing it, so that a Linux image can use the same stable addresses
> regardless of the boot flow.
> 
> Only RK3576 is wired up here, that being the SoC I can test on. Other
> Rockchip SoCs keep the same CPU ID at a different OTP offset - 0x7 rather
> than 0xa on RK3588, for instance - which makes supporting them a two-line
> addition to the driver's match table plus the layout node.
Hi Alexey,

I went off trying this on RK3588 and - exactly like you said - it 
translates perfectly there, just with a different offset. Thanks!

Not content, I went for RK356x as well - and that revealed what I think 
is a snag.

Both RK3576 and RK3588 currently describe their fixed cells as direct 
children of the OTP node -- turns out that is the "legacy" way, which 
works due to 'add_legacy_fixed_of_cells'.

But RK356x/3528/3562, done more recently [1], use a single 
'fixed-layout' with child cells; and there can only ever be one layout, 
so we wouldn't be able to use the new layout for those.

I imagine one way around it would be to allow such fixed cells also 
under the new layout, by delegating to 'nvmem_add_cells_from_dt()' and 
adding patternProperties with '$ref: fixed-cell.yaml' in the binding, 
similar to what fixed-layout.yaml does, but I'm unsure that would be a 
good idea?

Either way, thanks for this, it really helps with Falcon mode and edk2; 
I can also use it for the fixed-function RTL8125 PCIe NICs I started 
describing [2] (and will eventually send a v5).

[1] https://lore.kernel.org/all/20260312213019.13965-3-heiko@sntech.de/
[2] 
https://lore.kernel.org/linux-rockchip/20260617-rk3588-dts-rtl-eth-describe-dt-alias-v4-0-2bd38922d129@pardini.net/

mvg,
Ricardo

