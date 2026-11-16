Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821032;
	b=Uz3ZoAkNwkjPmZLozOyuiyOPomslVE8H0Enp5GQnj8MGwzAqwxLP90YtslIfBJWBgBjg
	 5YQ5DzAtqnnd+F1pSLU0TCDFJ0aWDfP+80aSC30EHxldzxCaMuPnwnF4151NkNHZGG44U
	 eYGdBaMYCJiBdDYAQeE3Aba2Oj3LKgvytoZD7X6AraVJheMBKpm3fimrIYUIgWrOvY5GY
	 7x/6bXz48BD96KcYVJratueyzJv4fUQ55NFrt5S4D8dy0+B4SFvBnReG2D5WcuI7iylDR
	 UXf2xzMfKzTJLUOBe4NwxtRsB+vqSij/tQdriVdYMd5Vggb8UdRRByBHJqiyNbmD6aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821032;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-MBO-RS-ID:X-MBO-RS-META;
	bh=6JF4UOJMPZGFw1tD8cF7gQzIg19LtWWgj1ffpuYUt0g=;
	b=aOjJ4ocYanzasH/8RzqDk1ZUu3YmI26OBwhzViROsRPouwd66/nGSSRr7hjFqHG6l3SW
	 f1WH+Gc9uHN6cjeTUn+ObeaUstNUEUIYvxgb2/+eX0DFdC0WgL2riCmC754RFHOCBisRM
	 +yJCEirJ03vXRdljm3bH3ws3iumUXZln9qZFvjr4veDZgzeCFcf2qLG6AQI2ysK45jov5
	 tCid6CeVzQCqUl5FYA33gH8jmMPTokF0QTYkUCe/vc+GbWKFPcR9nppm0VZbjEWb8NK/e
	 v9HQqSucIxb9qgzMfCcjGMzbYeMMOitNBnEGrkElCjLhSgBfVYKXGwpkqtRPzGKglOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=vOONwTR4;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F29606A32A;
	Mon, 16 Nov 2026 09:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14F29606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=vOONwTR4
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jSj8z4Zx4zKnCY;
	Mon, 16 Nov 2026 10:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794821027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6JF4UOJMPZGFw1tD8cF7gQzIg19LtWWgj1ffpuYUt0g=;
	b=vOONwTR4nIilD3gyoBNXuBYvhgcVSk6snE3qR5waIgJhzzVyXNfkaCafrdPgJPNLKOpKwW
	/rL1iIjuGpUjiLpgEWgZC7t8mnWS9bo2N3VEGzdsHnQ9pa3QbWvN8NPefMp3pwQ7opcETe
	NNd1SIjDED5zI4wH/C1BUQ1O7if4EJCyIYwuxXIdwp8uKMoOfdCTsvk194rgOq6mM9QTvb
	5Ifg79w8qEBEZGodjy6wAbVo0dX6RLqKJFlQ9L8jajuTccZTQU9mpuFKuRAvVHT6tRSknC
	5NWDIwr62L0Db+559SbuRKb/Pyx75FiivpJ/A2AbMyGXKMk58mVtG3vQCKBWow==
Message-ID: <5032c246-d0e4-4c2f-a2b4-17b28c76c1f6@mailbox.org>
Date: Mon, 16 Nov 2026 10:23:45 +0100
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
Subject: Re: [PATCH v7 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
From: Marek Vasut <marek.vasut@mailbox.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Thanh Quan <thanh.quan.xn@renesas.com>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20260903213031.314473-1-marek.vasut+renesas@mailbox.org>
 <20260903213031.314473-2-marek.vasut+renesas@mailbox.org>
 <aptP39nVZPFLgekY@vbox> <be205518-ba8d-486f-b603-1d52321edc1a@mailbox.org>
Content-Language: en-US
In-Reply-To: <be205518-ba8d-486f-b603-1d52321edc1a@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8ff5d6a3bc2bc829ece
X-MBO-RS-META: ixp6qbz454jy3jzq3hkohwp3wz98nfm4

On 10/26/26 1:21 AM, Marek Vasut wrote:
> On 9/5/26 1:10 AM, Thinh Nguyen wrote:
>> On Thu, Sep 03, 2026, Marek Vasut wrote:
>>> From: Thanh Quan <thanh.quan.xn@renesas.com>
>>>
>>> The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
>>> controller with glue logic wrapper around them. Extend the generic
>>> DWC3 platform driver with Renesas R-Car Gen5 glue logic specifics.
>>>
>>> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
>>> Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> [...]
> 
>>>   static const struct of_device_id dwc3_generic_of_match[] = {
>>>       { .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
>>>       { .compatible = "spacemit,k3-dwc3", },
>>>       { .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>>>       { .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
>>> +    { .compatible = "renesas,rcar-gen5-dwc3", &renesas_rcar_gen5_dwc3},
>>>       { .compatible = "starfive,jhb100-dwc3", },
>>>       { /* sentinel */ }
>>>   };
>>> -- 
>>> 2.53.0
>>>
>>
>> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Hello everyone,
> 
> could these two patches possibly be picked up ? They should have all the 
> necessary RB tags for about a month now.
> 
> Thank you !
> 
> (yes, I know everyone is flooded by emails recently, I apologize for 
> making this worse for you)

Shall I maybe resubmit these patches ?

Thank you for your help !
