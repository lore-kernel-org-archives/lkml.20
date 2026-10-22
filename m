Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673758;
	b=1VXI8piE44er0/0t9QzEcOEdNvVtmYE9MUoy6ehari39ihx9rqU363I5BmF76cIPhzmp
	 msY0SuF+a1Zl/pyX4DMhy814u6gy9eg/bQ5ilZbADcdHT5jJPufXPo6hoJ/ELrdALIwOj
	 yGkCINhJ4Pexxx6Xw5qR4PQYHSuFtBSBU+FuRzBULKZVK1jnNetLrRl2VI319OITDAm2t
	 zmkTaHrStedRdihTv3Qsx+mWwSdGUxHMr6xPyOnYTNV0LKbOOs7/JYefXsTj51CZTcNpZ
	 LKbqFixqgqrbGVUsRutoRqSxk1nrdRkNDan/Ytz8MjkpQvDvnQen8Yqo3ZVhJ46oH7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673758;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=drmG8Nei2eFEJ87SKq5m/aoRCFf+pZY8Bds28IJxne4=;
	b=lnplnAiP9WRSvFSXOmae1gn+c1I+eVt2GK2Np65/nHUJ3UatZz5gXg/PwudDHPceLSAe
	 hTnIwSDRA/bIqXlfD7D9pqNxZZfZK8HkvlZ+HYCl7qYB3B7V2OHQ4P0xIat5H/k3Pj2KU
	 uh132P/uXyiFpCYu8nJFtpbelQiLNFuR/+2yRWEIpNFI9Jg3sAhxdHz71B8u7BN3I/3k7
	 Id2P2HseRH+8oZL5eqeuOn1R77u6yI5MGOEfYlCXJOlcqAi5Di8q9UMDxu29VRm2XVScF
	 fAHlzbuwoDySVqwDZBf0hf0i/e4GpbZkihk4iOzPTh98hD39LzxJGARFXZnrXKBugiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=M5BMlIdT;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE1B606A320;
	Thu, 22 Oct 2026 12:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE1B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=M5BMlIdT
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 106A710AB2C;
	Thu, 22 Oct 2026 14:55:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792673751;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=drmG8Nei2eFEJ87SKq5m/aoRCFf+pZY8Bds28IJxne4=;
	b=M5BMlIdTRHNvNeZk/cfo4PdmWuE5r6IkremRUT+EYDRjPd0zBjn2ePQNEbTByN4XTAr1JA
	pSNnJIdahnZ0GHLptr5mUVHekmlmAQy3pdc+WlgFWaLfZVYkCfi5Zw0m3T5xAaHkITkmLK
	7xBlEjwqLp8vZ6wEuofKnrkDW4NkWGlK1poYoGVosi4jJAJS4YVryjfmoNwChlyN0XHGVg
	WNz5i6FparAqD25lgf8MzKw6lCNtiuwfpkjSxosN+S1kBc5j2fl8BVaZr6752l2zz2Er6G
	O4/HwhmMgopdQ8FXcfdr1Da025S8nQ2h85m8AwhEgtKikxPuVWWBxhkGRBa4HQ==
Message-ID: <948d901e-ee1c-45f3-9946-30cea28a6128@nabladev.com>
Date: Thu, 22 Oct 2026 13:34:24 +0200
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
Subject: Re: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI
 device
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 kernel <kernel@dh-electronics.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>
 <20261021183704.GA1116319@francesco-nb>
 <d4b9c444-a848-4b4f-9273-1c832db45fc8@nabladev.com>
 <71d725ee47804205826bdda322fdfdb6@dh-electronics.com>
 <20261022092536.GA232648@francesco-nb>
 <794745ff1c484257bef4f17917f3cf0e@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <794745ff1c484257bef4f17917f3cf0e@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/22/26 12:58 PM, Christoph Niedermaier wrote:

Hello Christoph,

>>>>>>> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>>>>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>>>>>> @@ -60,14 +60,6 @@ &ecspi4 {
>>>>>>>      pinctrl-0 = <&pinctrl_ecspi4>;
>>>>>>>      pinctrl-names = "default";
>>>>>>>      status = "okay";
>>>>>>
>>>>>> Drop "status = "okay"" too , since this controller will be unused ?
>>>>>
>>>>> you can instantiate a new device on the SPI bus from userspace. up to
>>>>> you, but if I was a user I would appreciate to have it enabled.
>>>> Good point -- Christoph, is this the (use)case here , can the user do that?
>>>
>>> I don't think that's the case, since there isn't currently an SPI device
>>> connected to this interface. Nevertheless, I'd be interested to know how
>>> to instantiate a new device from user space.
>>
>> Documentation/spi/instantiating-devices.rst
> 
> This is a relatively new document, I haven't seen it yet. Thank you very much.
> 
> I'm now leaning toward leaving the interface set to “okay” so that the existing
> SPI pins on X10 connector can easily accessed in the future.

If you connect anything more complex than a simple device, you would 
anyway need a DT overlay for this.

> @Marek: If you insist, I can also remove the status line.
Either way is fine by me, but consider the above.
