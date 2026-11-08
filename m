Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162119;
	b=wqrakq4ItGjM8axXvxZcgsuee/LwARLFRjvqtIuQeRdJgAoBMYkqt8YxDuP8Obgc0WJA
	 MyhRwP4SPG4bnUA6C+T1dsJeb/Hw96AuQhlocfaRfhyfuvuJ3OiLT0H4AReoYxGbBXVO1
	 RmQrShwbpXaw9gDmj+mlkojwHfNh/+j0ck0gxKWvgvsaJWEfrMNr72RQIxamTT9DIsfUD
	 NpiOXEIOWidKdL2BE6LRxuaaxhN2CHeusge83RifJ1cWwAnBizEdXuq55Id0C5o/rJ0kT
	 1b2+/TZsm2XoLrD7rRURmWQEYyeXAnAEKLGO9+zahbB1zzLGZ91FEK2u70nqiuaNZvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162119;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To;
	bh=IEc9ZGuUWt0IoGuerT4chM8IoSWASGRdad0LdA8y7vY=;
	b=yaTZhgVsiFZxkCA7tLgPrVLuOl45Z5r46Cnfb+TepOddLoo0oD5Twmg0d9XWalKDTTaY
	 MOaciA+JfqDyXQHVYYLaLrOVSFEOr1/ePx30ygZHOQaaiHy8Abi2YyPj9912SW45InyqU
	 TPO6eN2H7TZYza/i0Lr5Y1t4QFH/ifpBfM4Mril1i+MZNJrbWD76N1oF3nz4tOJr9eNZe
	 J1fuEbIe/LjFqmtUvfm6DVkHRaY3mFs5bxeiByMMMHT3me7E9Bb4aGd26ywSHWU+cPgMN
	 1gBviyrCeMSsZgCCHRzt3IxpRbgYPFloDhkZZ/vqvjlBJR8QM94Lhm6J1l9M5LqP2Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=vnZPO7K9;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B940606A31C;
	Sun,  8 Nov 2026 18:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B940606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=vnZPO7K9
Received: by chaosmail.tech (Postfix) id E1BB61C9627;
	Sun, 08 Nov 2026 18:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794162114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IEc9ZGuUWt0IoGuerT4chM8IoSWASGRdad0LdA8y7vY=;
	b=vnZPO7K9kRlz8SghCkQLzjjKHdtO6/FrK0I3NE0t7dobQRFY0AGulEeGu+0+k+wsOIpnY6
	qSaYI9iUJw+tZXBFSZURadW3JlutQhW+cSOU4h61BeF5wu9CwxGXKi72lJ/hSjkZjdcp8P
	oKPKITy4nEc80X+NqPAXOBiAfaWvBhA=
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] phy: apple: atc: Add initial M3 series support
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <4a6ae329-0d73-4ab7-bd87-7acafcb8778b@kernel.org>
Date: Sun, 8 Nov 2026 19:21:43 +0100
Cc: Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <F39FDF3A-E5DB-44F8-A31C-7856F7FA41F9@chaosmail.tech>
References: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
 <20261108-t8122-phy-v1-3-c2783b2a53a8@chaosmail.tech>
 <4a6ae329-0d73-4ab7-bd87-7acafcb8778b@kernel.org>
To: Sven Peter <sven@kernel.org>

On Nov 8, 2026, at 19:17, Sven Peter <sven@kernel.org> wrote:
> 
>>  /**
>>   * struct apple_atcphy - Apple Type-C PHY device struct
>>   * @np: Device node pointer
>> @@ -599,9 +647,10 @@ struct apple_atcphy {
>>   struct apple_tunable *lane_usb4[2];
>>   } tunables;
>>  + const struct atcphy_hw *hw;
>>   enum atcphy_mode mode;
>> - bool swap_lanes;
>>   int dp_link_rate;
>> + bool swap_lanes;
> 
> ugh.. somehow dropped this comment from the email i just sent..
> is there any reason you move swap_lanes around here?

It saves 3 bytes of alignment padding. Yes, it makes no sense on
machines of that performance class, but I could not resist. Can drop it
in v2.

