Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867861;
	b=Kd4DS0YzvD3rUFNBrRCmQ4coXaORKlG5+yGWldlKHV29joqDAHBpMsv+2fyjYmFOvBpI
	 xfdrT4GQlyMnxXd84rQj2Gw1tQDtBptzdFNZnq8WJYB/d3WQjBHBRuiTDx5c5ckNl8GUH
	 lDD7Bs8aC45wjbYAb4Bf2y6/2mSqLDckzca9MaErs4miGukSW+wqlUBn6tTTuCwl7uNA4
	 0ZL+mKhFNixIyYU4armDimWqmdk4KdYj3QKvz2SnsrDCXW6xlxndUSe4yGhrUKhJmCm/O
	 SIou0Rx/pMG69RaiUbOWY5UUgBEux/89XN8nwqlcNF7LSzAD9iVLCPjt/Mxeu1cjx4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ln1EVdAGOFluUL+4qX0wySLdavyI3EeHq5qaZG2vFtM=;
	b=eXdQyYjkSXDnsqKV311wE3XM3KMswgFxE3XBQXVGuxxSSxymNKdmyWr1gjR0av5EiaKV
	 Sesk2PzVEoahh2AwdgqFdhvPu8/IKh79UulMsQJdJBiGfAFRFzaVeZlSibRWNnZymOcYD
	 /wfpP1VUbwfxsbI9rxUeQ0VbcYFpm8EX9WsOMI/dG++6Dxrfst+dxxRIIIHkrOUIp7JI/
	 XHWw2xzac3sOmSUJIbv4VnTKL7cxBrs2Ck0g1gqlyCSzD9Hwk0Ah3e92T34i8g1UYL7PI
	 1b4pJSIItWCWBXD0FX+iT83u8RHlEBSZemz3dCVfTpNj1x0V6cijS+8lGu3017NF06Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q1s6mids;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEA4606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FEA4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q1s6mids
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so14789075e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794867859; x=1795472659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ln1EVdAGOFluUL+4qX0wySLdavyI3EeHq5qaZG2vFtM=;
        b=Q1s6midsB7ZFJORzCZaZh3TxN39wkIbhmHp6yuaENENa8omgWUE+8KGUkKgKRaDEtv
         ryiYQqlAHbHlsrSZhQRNmwzpD0EsRJROmgZESb3ZesTR2fSqcTeC7O4Tb4RvzQtoYoKb
         hCzqE9qv7+lAcUwrgd/aywp39omeKHhusrKSDHf9VEtOClJVuolTG+3DIKtlH29C6Nm6
         gdTGSkBz4HmfneHJe0H5E9Csrxs4U89QNtf4CHB32pAcpUzpD9MLuCL7/1ZNjyHoMdiL
         8E/eFU5NPkUgLELB01/AqlhH5MCZhuOscN1HjOlFSswTHH+GaswPdKeYY2M9LZCGcbHY
         cz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867859; x=1795472659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ln1EVdAGOFluUL+4qX0wySLdavyI3EeHq5qaZG2vFtM=;
        b=utaYJ5OZEUpuPqiP26+AoIBi8on1Ql9/xapYhsM4yqIM5FzkJ2V3q1F0CMv9sgpfFD
         i0A6S13PpdPWatehO9l3oienlxu1MizeyfQGE6NTqZP3Mn/TY+vmczar2wy2UsScjNGV
         cSDLWStAjp/CVMEhPheqYMLKeBoZRqGq/9v7vhAYPbou+uTyzkMWxIw6GR88fLJk8j2k
         A+ll750CKIg8IWKdcF97qNp2JMqOTageE+S61uXLW95KuD/XTm0gmjWyvCXVZ6iftep1
         es6Bwy5iL5f9UIiE1WlRawQCr1BmCfPcYg0X4/cagMNF7fkj2r9e52OcIdt7HVKZqiES
         y7yA==
X-Forwarded-Encrypted: i=1; AL+hErEp16WGjei+nbpTcOR65ViIo2k1zmZPbq7kv2w6tr/23Uz4nOxOsVO3vOuAkTcNZjjMLFOeqgWjuxK5JyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6u34OUnSpX3DFxIovYHM9U4dH4w7YY9jgU1dz18G/BUdg1dNl
	vAAHFWh+UXzv8BhZjUENmDuM/ADzVF7ZeP8ylMlMaN3XEsbmgKn3iX+MH+lrfXoSlBk=
X-Gm-Gg: AYBFou3e8rscE+E56JHW7ZCXCE25dT/J9l0KzhdwwSl5pclXbBCBf5h1aGo0fNSKNnE
	XMLUJJK1ee6VU/eRvv1hsd0szqDgggLiNA/dId1oeTno983eKbHfEg1aNQH7EEc4ad/OuWc2kv5
	02niCMeJHH55PK2n0GuVAje9kwIhqUa9cC/x28fYcBWprg2iLYwNCfolIH6ia5Ag5OdP4BOlela
	ZIOuJNUrc7yzD4sFTBoA2x1AhJASwEqaKvuttF2idH7oqc62lRPtnmA1XksCrH4edHYxVuphkHN
	ILXa60dNTI2q9dQZzQEmDahnqPKecpDgQtWwGiKVqrAlU4Q5F4Yvur0wmwgC2EI8rYanp7Fmb9G
	qnw9sDSIN78mtXNThuK+M2JhB9u8NAF4ghVJt0ZriTqZmWLe4mkXecaS54JJnhxwQnUKrbNlM4m
	kHfSIp4tZfWfkfJcyfKZ4pVjXFSz+Zn/HxOlUwHpYW4++2Q+iFK1++hn1tDE/Vts8nGy9qibaRi
	JCnT9enycmF7Dw6xJdPiTdILGjO7/1SCn16xknDDYtul88g8l91tyVwbJfxmA8ZeYFrP5DviYhX
	XPZgLIlOldHipaEn6C5GzeBZTSdW3axcHSTj/gbz8MLVvFBidoV0gQ==
X-Received: by 2002:a05:600c:4e43:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4bb559f24ffmr251632055e9.1.1794867858617;
        Mon, 16 Nov 2026 14:24:18 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb784231basm18143055e9.11.2026.11.16.14.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:24:18 -0800 (PST)
Message-ID: <71ede0e6-7f8f-4594-ae56-5be10f9159a3@baylibre.com>
Date: Mon, 16 Nov 2026 23:24:16 +0100
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
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com>
 <CAFBinCC+-N8LvoXZwMhoxjOzXgoYUfDKCcvmD7Uuph5=hTSg7g@mail.gmail.com>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCC+-N8LvoXZwMhoxjOzXgoYUfDKCcvmD7Uuph5=hTSg7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin

 >> +properties:
 >> +  compatible:
 >> +    oneOf:
 >> +      - const: amlogic,gxbb-audin
 >> +      - items:
 >> +          - const: amlogic,gxl-audin
 >> +          - const: amlogic,gxbb-audin
 >  From what I can tell it's even amlogic,meson8-audin compatible.
 > Although I didn't have the time to test in on hardware yet.
 >

Thanks for catching it!
Any testing is more than welcome. I don't have that board at home and, 
based on my quick search, it seems not super easy to find one these days.

 > [...]
 >> +    audio-controller@a000 {
 >> +      compatible = "amlogic,gxbb-audin";
 >> +      reg = <0xa000 0x148>;
 > I believe the audin registers are 0x300 wide.
 > Both, GXL datasheet [0] page 43 and GXM datasheet [1] page 48 claim
 > that the register area is 0x100 wide.
 > The last documented register with AUDIN_ prefix is AUDIN_FIFO2_PIO_RDH
 > = 0xb8. The datasheet [0] (page 395) lists register numbers divided by
 > 4, so to get the actual address in the memory map we need to multiply
 > it by 4, which gives 0x2e0.
 > The 32-bit SoC vendor kernel [2] has a header that states: #define
 > AUDIN_ADDR_END 0x28bf (same as in datasheet, we need to multiply this
 > by 4).

I know that the register layout in these SoC is a bit messy, so let me 
explain how I got to the 0x148 that I wrote above.

When working at this driver I used the S095 and S905X manuals that I 
found online, but based on the link you shared for the S912, I would say 
it's the same when it comes to AUDIN.

Using [0] as reference, the highest register being mentioned in the 
AUDIN chapter is AUD_RESAMPLE_STATUS whose offset is 0x304 (i.e. 0xc1 * 
4). However I noticed that before that there are a lot of registers 
whose name doesn't start with AUDIN_, but rather with AUDOUT_, PCMOUT_, 
PCMIN_.
The first contiguous block of AUDIN_ stops at AUDIN_FIFO_INT which is 
0x148 (= 0x52 * 4). The other AUDIN_ block you mentioned is between 
AUDIN_FIFO0_PIO_STS (at 0x2c0) and AUDIN_FIFO2_PIO_RDH (at 0x2e0).

 > I'm bringing this up because dt-bindings are supposed to be complete.
 > So even if the driver doesn't use a resource yet we're supposed to
 > still describe it.

I perfectly agree with this, but at the same time I thought that 
including registers which potentially do not belong to AUDIN was 
dangerous in the other direction, i.e. we cover a too large area that 
will be hard to use in the future if/when we want to use it and we 
realize it's really not part of AUDIN.

 > I don't see any additional resources that we'd need to describe and
 > #sound-dai-cells allows adding the additional SPDIF input later.

That's exactly why I cut the range at 0x148: that seems to be enough to 
implement what we need for I2S/SPDIF audio input.

Honestly I don't understand what the second range 0x2c0-0x2e0 stands for 
as it's not described in the manual. For sake of curiosity I just tried 
looking into the Hardkernel kernel for Odroid C2 [0] but I didn't find 
any usage of AUDIN_FIFO0_PIO_xxx registers.
So my question is: are we sure we really need them?

[0] https://github.com/hardkernel/linux.git - branch 'odroidc2-3.14.y'

 >  From what I saw in the registers there's also the possibility to send
 > the input signal to AUDIN but I couldn't find any additional resources
 > we'd need to describe in the dt-bindings for this.
 >
 >
 >
 > [0] 
https://dl.khadas.com/products/vim1/datasheet/s905x-datasheet-v0.3.pdf
 > [1] https://dl.khadas.com/products/vim2/datasheet/s912-datasheet.pdf
 > [2] 
https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da69fc61a7cb04b6/arch/arm/mach-meson8/include/mach/register.h#L2274

Best regards,

-- 
Valerio

