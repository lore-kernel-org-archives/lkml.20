Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695917;
	b=V0f/Q8yCHfehKp7wEQifDiEfpr6bmVTCS+VOmvmsq+4b+/UGOUNCH690jCsC6bG2JfQX
	 DYM2Pj5ZmumJpZykYgWRstBkaVeivtDjJxPr1X+DlDxAVIvRrUbgJUmfRgewQ2bz/6U91
	 Alv+mwNVPkxMCoififeknQFZh5anrQOpa9c/xBCDUW5JAx8gnE5HHjsgT3wyGlmAHn8B3
	 9RrOdi9I385TjFca9FsAT0zJ4MSSNV1z1xgxFpR3U+9HSmQYGIPlCCFSgQ0ycZkDMFWPQ
	 yYB/Sc/MbX+tKuFZptyV9FKmW9GBl1QmO8apB4brFTsIosCruEmAMcLdpoO51+qX5GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ks/2jbx2EqoCpwywdl6UCdhMLuk09QhCyfZBU/wLDXM=;
	b=lbVHCXps/W236E9/S5LYx78NRCcuPCpLELNGBHgqaJ7BKsHt37H0SzCXTVYhuTR/EMXn
	 OXqP4SSJ/yukRk6OwvdO/rjN1KvnjnLCMVD9WH53Q4yC0t/KssyAMwNOWYN8RNMnaYzkb
	 XZdGPPHfLJY/xyWSYD1JpCm+hUK3QEbNtl2oeLrr3pknazFJWPtl9jQr+XRHqzgf4Npcb
	 54Hjq34bmqVbP4Dj4QcZfPVsUEhzSRRZf1cfT5sprLm3l3y2tziazN+0GHnE4A19xQKNQ
	 AtyJXaArV3XAE7J7d6TruLsNFlccxRrH6S70TX1pPf80eftP6xxw4PaTzpR7mlqSGMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=QWZasyWx;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EEC606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87EEC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=QWZasyWx
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6de1ca1b05aso92061eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792695915; x=1793300715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ks/2jbx2EqoCpwywdl6UCdhMLuk09QhCyfZBU/wLDXM=;
        b=QWZasyWxw03j9geqHwnZh8c8OyKA2dQN8+V1v+x2FAykRAGMiVvUkbs/kAYLfZX/AH
         TCeXLgRm+IO3KJ4ty6I1BjrzB3s6aMW/PA4VKreUIPvme1FrxLkKrd+CEy5PMdLrpiov
         8RNc4DkkKKbvUG9sTQajt71jlDybGIuVw1NBJBrd/EIhZ3BwjeIJCb8OPaH/0VrekJ/c
         W4ozl6uaZtBs0hd2Fu14Ksf9slMD3wU4Ou3CS6btMk21JwIGYaItlUrtcb3YsxIrg7iu
         FMDZDkIHk5wu0vyB3uaHaFAuB0CwHfWFv2vedvIV4LZDxNPLSMvp/Vt+3dDqMIW1Dcuu
         A3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695915; x=1793300715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ks/2jbx2EqoCpwywdl6UCdhMLuk09QhCyfZBU/wLDXM=;
        b=CBhJnz6lQYQ27aitr4ZqasqDfqKu69deMCPJgkifuzwGWunq6ok2h8intiZHjtKV3E
         KiH/NcJHPy4l4gKfJgKwGuX8yEylaqmocBlQWLabiulRJONi9b3AXeV55wEwP+lyCKog
         0DIgwup/5kxKMR37ybmXMWNn5HYELRwFftTD728U0lpgpWHKRkbU6c0xlGwuqbR+KR7T
         cqpve3PD6zIB2tTW9smiy1n2B3eFJaHlnJ02CFRz53afLzCHk9vlO+0Ed5s2GknlO6nC
         aJ7HcamKAQxjJgpWgGyPy1hf9hNiD6gk5ES5cvpRegbVRJO3Eir7TJA6QIu3Yh27Ger7
         OOrA==
X-Forwarded-Encrypted: i=1; AKwUvBzGfF2cUaSKshTXIx+LxNauP4Vdy+pW+CkNmoSdW3pJKAAZZStT6CPZbBKHr2jaOFT/8xuuSDDlYfZ9IUo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1dF8mIWBJAOroHrY0NApEsyz2Gp3T5hrfR8KlpxiYnIu13Ig3
	FX73uDxhzea39BNWqgxCfzBGjMlb901KWFYFV/9DwHOhcxZyYGlglQUFzrl4IZfbUqw=
X-Gm-Gg: AYBFou0kiJ2SPll0WPuMshK6Dacmu8ZXC0gPYgnDWkq+WRbnU078KsLp7qP3CdtY5Cx
	AIB1Iu6oN2c8RL2xy/nnOGadqpi5dH8ENeSR64NWPPqbYEG8+N1zp/PYszBmxMjrYdAW5Uf+BTL
	/BFdHT2DmG5L7O2DbaXCvi1r4ERCKxI9dsLu0h9WP8AdgY2iOpRgFfTXZAyAVkM3eavT09Z8gcl
	SF8p30bQB0WbD5FIxicQz38dpr3n3TrbTm5QXsU/ULOqE3K2Q/Aa+DE0YsIll7v5byM8BFJ4zxQ
	gT9bkVDHeYyXtcZ/TBeMg8OkAzgrqHSTnPcHDBwfzdzVNkwyHs6Yia2kBkbbZlC7bXr0Us8ZjdB
	YUHzf0IN9QR4E4MtvZCU68XAPBHZu64t1f280D21oxu5peoK8nsL+dvDHzOuI3kNt5bq+HWz5tf
	BcMEQBuUEYAcj9+9pj841L/XzEg65t53zNoC2qFb3B0QnB4EKwZlLOoYUkCTCmDOOxr3LjnWAOV
	nWdBqbqTO8YFOn6GCeeZpZEWI2hSK72O6SM83ARu3ar09udx+lD1JLs
X-Received: by 2002:a05:6820:1693:b0:70b:1217:4a8e with SMTP id 006d021491bc7-70b885e1536mr310753eaf.0.1792695915497;
        Thu, 22 Oct 2026 12:05:15 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b89754d7esm80181eaf.7.2026.10.22.12.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 12:05:14 -0700 (PDT)
Message-ID: <638e0f29-1ec9-4a6a-8777-fecef1bff409@riscstar.com>
Date: Thu, 22 Oct 2026 14:05:12 -0500
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
Subject: Re: [PATCH 1/2] dt-bindings: reset: introduce
 toshiba,tc9564-reset.yaml
To: Conor Dooley <conor@kernel.org>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-2-elder@riscstar.com>
 <20261012-shale-rosy-805c49f6c404@spud>
 <492396bc-a0f4-4274-9a7c-21fd5fd886b5@riscstar.com>
 <20261012-numerous-flatworm-9e4cfa659541@spud>
 <325b8836-61a2-4e1c-98e3-92f0a5177f9d@riscstar.com>
 <20261013-stump-reactor-055d05dc5b3a@spud>
 <b904f4ea-e198-488e-a6dd-476d744593da@riscstar.com>
 <20261022-clench-drum-5907c17cb8d2@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261022-clench-drum-5907c17cb8d2@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 1:34 PM, Conor Dooley wrote:
> On Wed, Oct 21, 2026 at 02:50:41PM -0500, Alex Elder wrote:

. . .

>> OK.  Let's see if I understand what you're saying.
>>
>> This approach uses:
>> - A single top-level syscon driver (under drivers/mfd?) which
>>    probes based on a devicetree node compatible string ("toshiba,...")
> 
> I'm not sure if it needs to be under mfd (there's some in soc/foo too)
> but I guess so.

I'll look at both places and will choose the one that seems
most similar to what I end up with.

>> - That compatible string will require a (fairly simple) devicetree
>>    binding
>> - That driver initializes a regmap which will cover the space
>>    defined in its devicetree node (<0x0 0x2000>)
> 
> I don't think the driver has to even do this at all, e.g.
> sg2044-topsys.c doesn't. Whenever someone requests the regmap it will
> get created automatically since you're a syscon.

You're right.

>> - That driver has an array that uses MFD_CELL_NAME() to define
>>    cells for clock and reset
>> - That driver will call some form of mfd_add_devices() using the
>>    MFD cell array
>> - The stmmac driver can refer to this device node with a phandle
>>    property to specify the syscon that provides the regmap it needs
>>
>> And then, for the clock and reset devices:
>> - A clock platform driver (under drivers/clk) will match based
>>    on the driver name (matching what's supplied by MFD_CELL_NAME())
>> - A reset driver will be similar (under drivers/reset)
>> - As you mentioned, these drivers get at the regmap they need using
>>    device_node_to_regmap() (or dev_get_regmap() or something)
> 
> I think "regmap = device_node_to_regmap(pdev->dev.parent->of_node);" is
> the correct way to do it.

     regmap = device_node_to_regmap(dev_of_node(dev->parent));

>> - And despite these being separate drivers (from the syscon driver)
>>    they don't have devicetree nodes, and the syscon node itself
>>    defines the clock-controller and reset-controller properties.
>>
>> Does that sound right?  Am I missing anything?
> 
> Sounds about right.

This is awesome.  I went ahead with this plan and it's working
fine now.

This syscon driver and "sg2044-topsys.c" are awfully trivial,
and they seem like they could be wrapped in something along
the lines of "simple-mfd-i2c.c".

Thank you very much for your help on this Conor.

					-Alex

. . .
