Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A2849480A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378138; cv=none; b=ZLP0x4ewWLK2DXfZE5g6QJcTfd/S8wKcxeEil7Wp5wKVTMYU64RYZGkoU9V9Px+Gr3szUPAM5r35jtxkVCq7LznChZPsdd5vEjTalv71PPWL1wObbZG+sSTrB+Vz2tlBpzZ9gHU4fOG0/j7dqY353tYRaEqkkRcGbzAH6A3TrCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378138; c=relaxed/simple;
	bh=EZ5/gT5NS263n6bnTPCUCWnWlWwXUq5llfncXBHtHvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3HbYayiVE2PupSfc8rCAdzyAEmQI1Q/5wXhR6GFU/rPsKznG1KOXDMX16fty9CEv3aAjPgzCZSTOTpTq6DFjN1Lb471/shQcb23UyIsCtIP2m7ovDTl9id/6LZXgSKjgt7cbB4zN9gIF+KR7cJ/esvcSP+OoG/Y4EhyEogEmHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MeK0V2ex; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MeK0V2ex"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so15313145e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791378130; x=1791982930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oh5rIR08i4TyY7lq8CLJGXNhWlRCuOT//IfseSCZrK0=;
        b=MeK0V2exHQs24zKBnJMEVqnbguT267QC2RCWXpEGu+6MwnrgFh0Bu6ogUaZF9A7Voo
         UKLtnW1HWWOCrBuZA3eUUZzTMWd2ZBs6GfIjlzcLg9uPcEheK3VhJzASyCLV8dNc+w2V
         +hZVhJElE2gfS7TAeYl2/qAPq63cN/w7tF5b+WBMBnRXluPes77Xza5/D1AtkZ+JWVyt
         Lkp/5PnESLB/R036L8MUFmBu5OD6OL05l2F+c2MI6WWuUbnTJ1gi+9U2XdkUkUNwm4GR
         Qm4BFKV8D+Z7AIiN9gZPeTtMoNo2/dXjd7vd4R0+Gm6o7W8tUa1qd1tA1MJSpSwvzbBD
         gxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791378130; x=1791982930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oh5rIR08i4TyY7lq8CLJGXNhWlRCuOT//IfseSCZrK0=;
        b=zerDRap7VCO+wvYZ5a/Auw4E6iXDaiKZgeJCKJGFzpXURZ9imQmX5j/ndohZ2xsPKz
         C2Yl1ld4m6tfIvSwaBLGnNVXWuj5VAw9D/wUvdK9boGok61Q3nofFn6uRErv6TTGMmSJ
         GxoD4M3YakvG3RV6WUf1d53Fwst5aCUeLuYdSWkjEKxfTCKCTRfMnk6JNHHkUf3bjvSz
         O69z6F5Ne0MgDRIyamkwG9QpcO5vwaRAPxXC8zvsS4FjU22vym408AL4UWIm8SQfjUu6
         icRMM+7Ii7BfzdnDeDIvJORilOmmyIL2IE6oaKzYCQRwWP376vZup2g+ZTltsCpIjGnc
         tfkg==
X-Forwarded-Encrypted: i=1; AKwUvBynC8TyVjNlzudxYXyX419WSASTEd4l7z98QZIv3F1kD1/3dBP8dv6Aa207jvszFzGRTB3S4L1r0x1ctWQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nOt3Od3+wZw6Vi9RpaH6grBq8cWm0n/GEeUyo+M/pcfaOst85W
	lXQjZsiQYmtpc6oINSiji7toGz08ORqLlgkuG2xmS1vge61RXy1gTYwZVHAkLoA/8jc=
X-Gm-Gg: AYBFou3KK45GGIMxbg8TQuM8w+cnc6Bg1UITXrCzEsuqMEzIPJikRhq2UeWGRrSs4Rs
	DURG9kpI4yfvTbh1L1nN2uPt9XBJvN0DKR5mjBHvIlBVzEUjNE0Ua5wxu7kITHRmmKkziLeh8HN
	wc88TvVJAEzddzjbMn7b6ij81EZZoLZPnoAfqTxYox1wt73VaJfW8LDMn7GXiKgcyVdhWRLW8Ya
	PqBJeXxGl+AIqa0XXYxpSpbibVT7aAxHqixjRFumJxip5gI2eh7vtcVi2cK0CCoullXsoi/RkBV
	UZUNqdxp4Gcmyb2+fbLD1YkFaj5mbZKwA5DJ3nyn2iiZCUZTGGtG9BxLNHwG4B3kDTHYIfqDMdu
	zIzBzYkUTigh6y6Fu1ZbEpxYg23F6f1/nErIsXO/HRblphw4bjmKgEJtQFPcnGaBdAEhOCuupTr
	4l3jl3rrbBlndpXl6t29otvRbp2CBWR6Bbee5SMAZrYB8TGVu1jIKRaaDZKI0AF4hlorTwLR/Pr
	zfMd6kN
X-Received: by 2002:a05:600c:3b0a:b0:4a0:276e:9efb with SMTP id 5b1f17b1804b1-4a1800ca1dcmr33410955e9.4.1791378129799;
        Wed, 07 Oct 2026 06:02:09 -0700 (PDT)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm248055555e9.11.2026.10.07.06.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 06:02:07 -0700 (PDT)
Message-ID: <867bf9d7-f69d-4538-8de7-3a772015b486@linaro.org>
Date: Wed, 7 Oct 2026 16:02:02 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: reduce stack usage in spi_nor_parse_sfdp()
To: Michael Walle <mwalle@kernel.org>,
 David Laight <david.laight.linux@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Takahiro Kuwano
 <takahiro.kuwano@infineon.com>, HyeongJun An <sammiee5311@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260915194203.3511147-1-arnd@kernel.org>
 <DLKU0CTP0OES.30VZXJXDXRLNW@kernel.org> <20260921095924.2f845215@pumpkin>
 <20260921114111.525a2257@pumpkin> <DLYMG0XY8T4Q.2B4KXOQ9QRM2F@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DLYMG0XY8T4Q.2B4KXOQ9QRM2F@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/7/26 3:57 PM, Michael Walle wrote:
> Hi Arnd,
> 
>>>> On Tue Sep 15, 2026 at 9:40 PM CEST, Arnd Bergmann wrote:  
>>>>> From: Arnd Bergmann <arnd@arndb.de>
>>>>>
>>>>> Two large spi_nor_flash_parameter structures on a function stack
>>>>> is really too much, and this can exceed an otherwise reasonable
>>>>> frame limit:
>>>>>
>>>>> drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
>>>>> drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> 
> Will you resend a v2 with Davids proposal? I'd like to get this
> fixed in this cycle. I could also take your patch and add Davids
> proposal on top.
> 

Hi, Michael,

Arnd is probably busy at lpc. If no answer from him you can always take
his patch, do the necessary amends and describe them in a [mw: blablah]
section above your S-o-b line.

Cheers,
ta
