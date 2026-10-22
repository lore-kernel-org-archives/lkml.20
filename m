Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673749;
	b=dYBv4nnPeB0QAHH78S3Z9d4MFCfYXpdS7j9e5SxSH06qDGsCYZK92WT0GyMgOuiAlnyO
	 yS77gIj5sSC3SXWc4tt2L1kI6VfSRQ4FsebFhwHbuRYlG4427/oQXOndRYPYUqwrddbLh
	 v17G8UeRJH+q8N5UiivpumC2D4OXIU0AbPNcaIY47zfhbYWHxBhG3E5Ti4mySO9tpzBWv
	 09YmeYW89Lk6dhi9Yl548DaAYftVG1Vkj1jYMPhDD8MkA1gY3Uo85G+7lEdYWcUpUKJGA
	 J17Pmz2cN4WH9VH5nUdDC7mp/7EMobC4T8Vh1Eo2cBmCcabR7WAKabVWhI2l+kXW+Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673749;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=Ie1pPvJMakPAm4rb89FtuuQgGo/VSL8u2Kf+jvYHoX8=;
	b=0YINOa+jStkVNi0W4xBpTl0kdUlgWnR837D39Zb6KR30R9Ix8ABkAMwWQMMR/sDaAhvi
	 RAgRBTKBz4fnJ76xDVDbq9ycJad/fIiOxL2PfZfFGNSPKwiFHi8qq0HuQ+pqj8lxVXrIG
	 1Indf2FKHgEdy1ovtqdh4nbQk7XQCLIRsXNazmByPoqbkyjDcB90qasCAO3j545oJmSX5
	 VjAv2QBzILLQA+JzRj1yPVE3c7rI3rFyKUf6gbyhyvvnOdG5T4NzD/getm4+TB6ZRSNTE
	 0F9XUwB+PxGpePZEizx4KV/hyiCBlsHm/iTChpZs5sg37L0WoGtwgFAzjlR5hquRJdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KwSQQtqo;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8736B606A319;
	Thu, 22 Oct 2026 12:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8736B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KwSQQtqo
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5C211074F8;
	Thu, 22 Oct 2026 14:55:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792673742;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Ie1pPvJMakPAm4rb89FtuuQgGo/VSL8u2Kf+jvYHoX8=;
	b=KwSQQtqo2qkosmaIZx0XCCW1gYlWle2x4UycqLi8YUXO4i/u/JlPHO0zU8J5Uol4eGyQfR
	2NguiXgOpK2PrZ6l4u6ahrMmbNPSKN9rl1y9+ifu8D50ltBWEiGS70p8RpwO03KjbqzH+x
	3LkcfpuVyRW+3b6PPYabuBPayoUL5bpYS0YKkre6BYFRHpneksCYgkOAfkLS7EnKpH+Xvo
	7nKhJ6QOwN0C+U89/ZrmH7S/NMOC0br5aXe4jLHz+DXdsR76a0Wvu5evE2urDi90vCLiON
	tpqZuLNWPXlZ9XkGC6HjdmOT8zLzPEvwjZ6WYHaQh7sxTto+yBfT9Fbs7nq4gA==
Message-ID: <944b492c-e88e-4069-93d5-84b0d3c0ea2a@nabladev.com>
Date: Thu, 22 Oct 2026 12:45:10 +0200
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
Subject: Re: [PATCH 2/2] ARM: dts: imx6ull-dhcor-maveo-box: Correct PCB number
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 kernel <kernel@dh-electronics.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <20261021134435.17350-2-cniedermaier@dh-electronics.com>
 <3ca82faf-dc5a-4ef7-ad8a-f6273b3e0388@nabladev.com>
 <75107c033de14aa19a21f3b2fc66ece1@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <75107c033de14aa19a21f3b2fc66ece1@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/22/26 10:59 AM, Christoph Niedermaier wrote:
> From: Marek Vasut <marex@nabladev.com>
> Sent: Wednesday, October 21, 2026 7:21 PM
>> On 10/21/26 3:44 PM, Christoph Niedermaier wrote:
>>> The PCB number of the maveo box isn't 525. Change the
>>> number to the correct number, 625.
>>>
>>> Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
>>> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
>>> ---
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>> Cc: Frank Li <Frank.Li@nxp.com>
>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>> Cc: Fabio Estevam <festevam@gmail.com>
>>> Cc: Marek Vasut <marex@nabladev.com>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: imx@lists.linux.dev
>>> Cc: kernel@dh-electronics.com
>>> Cc: linux-kernel@vger.kernel.org
>>> ---
>>>    arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>> index eb0b91040110..bb82d97f9d84 100644
>>> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>> @@ -6,7 +6,7 @@
>>>     * DHCOM iMX6ULL variant:
>>>     * DHCR-iMX6ULL-C080-R051-SPI-WBT-I-01LG
>>>     * DHCOR PCB number: 578-200 or newer
>>> - * maveo box PCB number: 525-200 or newer
>>> + * maveo box PCB number: 625-200 or newer
>> Is the rev.200 correct , or is the base board still rev.100 ?
> 
> Hardware rev.100 was a prototype that was never shipped and
> is not compatible with rev.200 or later.
OK
