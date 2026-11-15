Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753354;
	b=snS4OE5aH7fvCmYuAS7YI18sSuipmmPkDiZmtr6IT15eDt08rL1b4DClGsJY+vaAMBzL
	 fMcHR5+o+6eHmcdKM+hDsjJjnn4/W8VlMlahAa/CVRRdioyIZDZgGk3GuG0b2k73WKW83
	 iGhkoFLAeh+mn/kty83kx8JR5YtMknZcLpTCrCmdwnD8LDNAU/6vnLpzSr4be9aUAxKg9
	 ykYs1hrB7l4tT4Mv9ZtZLYYNRpUu5yS1na3Q/Z78YrlgQwXkeROr9n9c61aeANOvGG/2v
	 c5IPmwgu2vYk1o4QCn9x6nHN8EQobGwZOX8b4uCRpKkRdm/YIZBUkg5OPAxrwWOktVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q25AUv/nmZnCtJRHkg8euYpXtkTU5reDQI8K/4xuZBI=;
	b=RfzlGrOZYz5pGBAsU47XT8bPG1LDXtUIwi4OMJ0sCB5e7O1oxnzKsVGahz2+jfwUezL2
	 dsXFB27ROoj21NBPuYzGdkJqzZsDG6N1I2E45M2U4S5l2IxoaMJZHaVhQx0ujwkItBa2g
	 /GBF1yyaCK/NRAypArZWTf/J7NUwQHYqSN3HP+RjoXTBl9IWaW7NP0VlKLIO5BYcBXJRf
	 n6Bt3AG5cfX8148yk5wGJZUxZl3+6sruVG0MykWSNMCoXs/cDg1JbEl53gES1dC+V151i
	 HDoCTYjKSMzHG9xgLuthodlsHHCniaEsdeyoi821E/l0xqrgRM9XSvojJa13kIgSNnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=NJvpdGf0;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EDA606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24EDA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=NJvpdGf0
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2898689f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1794753351; x=1795358151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q25AUv/nmZnCtJRHkg8euYpXtkTU5reDQI8K/4xuZBI=;
        b=NJvpdGf0UljWwfUO9d+YyB8mADHGzofjIzmwLCya/rTM8Bc9ALk2m6nDoj0t6EhwSG
         0PeRu0vK4OLX+5DuPPZRGfktsuzvxCKLMLjsXw+kPYsPHWBZ9pGI2Udfs+97w+qVfS9F
         WBWgEHFIItS5MLUuIej3LZxdmUaXUETIx8T6Fsx6NpBPCj8hTqqsZhGtoQooz9vqIiSd
         cb7F/57SoXjzWtu7Vo+aT2HordLafTWl/rDTIG162mILcWEy9qps9Xoe9HgrfpO+qB+F
         t+P7BFo5JzbQWrJiFRZeCw3yA3NNSrFnuX+q7r5eO7VV43kjy2NV3XKODJLSHfQP5lK1
         t+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753351; x=1795358151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q25AUv/nmZnCtJRHkg8euYpXtkTU5reDQI8K/4xuZBI=;
        b=wCmd/wWn38KB353FqwMLvx71e9Z0ZAPSczVcPju0VMq1aYNE+MVpNB8hE0hiDJRUWK
         AqZLMHWeY//K4XCKOfjOsV8qcBbVfpYAou0OJMZv5FRmJyb43vr6rrhC66qatv3R8SSY
         LJlGbXG+7oBofaeo+2Vb/v4viDmEIEAZ1gLuNkmEFMDP1DiFX9RtWeGepGkNAEtvNvYa
         euXP9i5h/Ji7y/je8PA8Fetk5NBxB0WLig0nRdFsmPhj9kglUdaf9EbmTYbaniaQDAlj
         Wl211TNK4TytH6FaQKY2zx69sYNPIKTqaO/5cZgSD6onIq2JYO5Yy5wcbWpxTo+7W/lB
         gxzg==
X-Forwarded-Encrypted: i=1; AL+hErFPDDApfNPUzZouhwprqa8dv6OZH8uLifH59Z+4ugacGMhbTC+/7n79y3qpgwaSi/sdKeWH6nQShk4kOT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/5Fnr1iseISpbwYbGKhGtaf9Mr0HNuEZVRjRajqQqsoJmMNDi
	QQ9BDwSzLgvhcbtpftt8xOA+HbYRKv/gZBkPrqFmveSx+RlUFKU7rpBZJnOjgKhS+e4=
X-Gm-Gg: AYBFou1QsfqA4IS4htU36dyUkfU3qQZg8zqpMsDcdUj7cODsBwnZZvB4UHTHOr30cII
	8qXi9Y/byIt7LD0mzZe/J+lW6K59A2sMmXabzV98XfNzuMCT+67VfJbk56HKWCHJ/wpQKyO+IfC
	yUclMUTIDWzml/U1Sc2BiaINAnyVsIeouDsSLLQIAW+/ey961zbMN4BWjKHWkgFbTygDMcbwjmZ
	vvXhvtzhEGESKsTIwW0FlQQEs9UYCfrXQS2N+oV7jE23ZrX7vzz9O+AV4S8bB2Ut/kWb+7jG5AV
	N1XGNJhv2Htz/eJIO5GJ0WRvRLvaxW35fmxjmYOl/rG9i/osc0hLcEXA22MS2coN7R7N8tC3OZz
	sjheJLBDsWDkB3gaFJlNsSv6CnNrooW/7/MqI0wHBg8c4xrB07lrgcarv8IfJFiLjsYJRVduKRL
	bVG+ebSsXT+Nxygbn+cDoBVSMpH5E6D7IbXP2RRYHyVCLVlI/YmrSRfOu/Buu00RJcI2BvrApZt
	Ea6TrBCblpqvtO7eMXYmVf0OIaggAJ8oGU/NZl5kYNp6XB3uaxQrS4gdvissMloqkI4/2NIL7hE
	DqnLHLueWLM1VmDE2yqKA4ycx9Ch4GYtKoSIXg==
X-Received: by 2002:a05:6000:1614:b0:48e:7b12:aca5 with SMTP id ffacd0b85a97d-49c72e85eadmr12207691f8f.46.1794753350909;
        Sun, 15 Nov 2026 06:35:50 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18730077f8f.1.2026.11.15.06.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 06:35:49 -0800 (PST)
Message-ID: <0ab96156-9c28-48bf-9c91-d1c9ecf90d5d@tuxon.dev>
Date: Sun, 15 Nov 2026 16:35:47 +0200
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
Subject: Re: [PATCH v4 14/16] ARM: dts: microchip: sam9x60: Add OTPC node
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-15-ada@thorsis.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261105110715.2486432-15-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Alexander,

On 11/5/26 13:06, Alexander Dahl wrote:
> The One-Time Programmable (OTP) Memory Controller (OTPC) is the secure
> interface between the system and the OTP memory.  It also features the
> Unique Product ID (UID) registers containing a unique serial number.
> 
> See datasheet (DS60001579G) sections "7. Memories" and "23. OTP Memory
> Controller (OTPC)" for reference.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v4:
>      - Dropped new microchip,sam9x60-otpc compatible,
>        use microchip,sama7g5-otpc instead
>      
>      v3:
>      - Removed needless header include
>      - Removed clock-names, not part of bindings anymore, and not used by driver
>      
>      v2:
>      - squashed with patch adding the clock properties
> 
>   arch/arm/boot/dts/microchip/sam9x60.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> index 4b777c61c1e09..996b13300ca06 100644
> --- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> @@ -155,6 +155,14 @@ sdmmc1: sdio-host@90000000 {
>   			status = "disabled";
>   		};
>   
> +		otpc: efuse@eff00000 {
> +			compatible = "microchip,sama7g5-otpc", "syscon";
> +			reg = <0xeff00000 0xec>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;

#address-cells, #size-cells are not needed as of now.

Thank you,
Claudiu
