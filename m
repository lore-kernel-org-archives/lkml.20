Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA664BA9FA;
	Mon,  5 Oct 2026 16:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219050; cv=none; b=fCuoTsRROv/uuv7RgysH7Gafps40aTDuLbYuo4tfABZKZGh58hrzZAeR1uLnUmwCXOqkJ6DqOcGcSccjjXJgv9bfa/J2htwL5CQCOViuG7NZcFn4064H75lIRHAYr7gta4BlgQzdsroKxcftYzxgoxOBP2jaDPVzytE4RbHTy/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219050; c=relaxed/simple;
	bh=eZ95W4xKUXkyNc3f85B1Ri/EJjGKUeuIgWk0mMUbycU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8DySNRhITfOE9jtCEIfqSsQYQdqI/SpqGSnJ/f9pHoSr01o48k6bUmGRRiMZH99iVs2ZtUpdNuKknPvg/QL4UqGdfjfxPR3HBy2BaVfP484eudb131VoO+MZ0mIVAXv2Hjg/JP1NuH+Tk1Mf0QCQe4eHdlSV6uKyumuFuvNHdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=x7OBPfO9; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="x7OBPfO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791219037; bh=ULzXOTNGZsl8i2FLpcSokhpQ3RMxibrvq655plx5ZCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=x7OBPfO9JJEpW2akVBCoN15RsWSE4268h6ygySivBpFaCP7ky7RQrHnkr5oKvjb+K
	 xGT3H+SnTDtJjDyHEYVRCudnaiikNr05FT3giJI0FXpYNpmw0wzJNhv8HVF4Wo7BEk
	 0IpNQhhlvksHNoOlDneXKXurFk57ADJXs4sPNUME=
Received: from [198.18.0.1] ([112.43.117.189])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id CA2AAA64; Tue, 06 Oct 2026 00:50:34 +0800
X-QQ-mid: xmsmtpt1791219034tau95ipbk
Message-ID: <tencent_914955849500DD870ACC806531A5C590050A@qq.com>
X-QQ-XMAILINFO: NI6TJc3opC6FnwBB3JyN5aL8szNLbrC3r3O/o187PhPGZ8qmUlb1VVzwccvVkm
	 VcfM+uhFE2ChuvowuTHPmpPW591cRGH56ItSZfD8Ce2SHhzlMIzmxHGNasQWsLz/MDVm2lQV8J9a
	 if3wuxWsRpN6JNrKZa9B/ZjgnyypR1fztgT0csOGUfawd4raWhN47ku2XLmJ5HUCr4npaCSCM2XK
	 bjKOQBlLa0Ocd6jY1Kr/06kDKjfetsn7LOBcPB7KkR2izW6WutafF18Bb5o1D3EWlQlAXvlwFyEb
	 pDrC4jjTzJt8ulcEDqejWDs0jTVgDNrQnR71pEk3eSByODbtVWZfdwIqbyN962rjbPqqGSLYn+Lg
	 TpoLSCoyE962STOaos8IYr9/aD/KA0ruwAOsmQ4eQ9pLaYGge4PMrZec+q1vmNB4XU3GsNjIxknY
	 lTEIjZyxxKK8lwHDVDIzvCz40eAnyDoxeJsIAeukxF5tQBzL71NJ6XB42GPin1YXg1jzx21N9z0J
	 wscTlYdqQYgQ0FZh5VRz3rRkBlgKfv6LYxyZH0LVuT/mBxIWGkXxlDFjbjSqFUwxND+/vd0u7A83
	 RiKuhAp6SLiVer6pN6IjuVaUqbq84h5364Rs4AfRNgjgxZd1hEbbIwyndwIYtjOy+ASmrVaDxVAZ
	 QPiL8jj8eY5NOiqMWDqoekul//3TwKRyDY+JptTYL92cT97uOtFS96x1jIPEZLX0wCoiytixr43D
	 dMTAaHfK/JSRHoB9yIfB1n0Y8si/GpedwaBE8ISaU7PdI396J5THMZOaTMJbCtrlus79Az35uiWF
	 U+H2wjJqZMA7dYJ3J83PFMmi/+sTlhPo05Ie7HZukprx6QwiQHqRhEzCZ8hlOztTcXNBzYpCoMpB
	 7DX8R9zW7zj+w9POOxhwn1SAL3SO7LHabWoFLvslQozGgi2mV4UHJrHhR7cEBIkYG6V6SG1LTj6f
	 z1efEBPHmpYykbBm1n+UCfc6f/tE/dGGOQzOk3bY5ukIFRn919eWnkkfnI/FGhQomzv9fBhtTMBa
	 hlpDcVl2xWyO7P1JigwuyYNV4y3u0tAyfTEz2j3AYjnx1AWUB5
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-OQ-MSGID: <aa9d52bb-5501-46dd-b90e-739dbbe53487@qq.com>
Date: Tue, 6 Oct 2026 00:50:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: zynqmp: Add support for EBDEE EdgeBoard FZ3A
To: Andrew Lunn <andrew@lunn.ch>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <tencent_E9086080313181C5F806E5543C9638DC270A@qq.com>
 <f1e7750f-7057-4430-9783-83dc8a8a2e23@lunn.ch>
Content-Language: en-US
From: Pufan Jin <2254650260@qq.com>
In-Reply-To: <f1e7750f-7057-4430-9783-83dc8a8a2e23@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2026/10/5 05:29, Andrew Lunn wrote:
> On Sun, Oct 04, 2026 at 03:46:22AM +0800, Pufan Jin wrote:
>> The EBDEE EdgeBoard FZ3A is a development board built around the MYIR
>> MYS-CZU3EG SoM, based on the Xilinx Zynq UltraScale+ XCZU3EG.
> What exactly are you describing here. The SoM or the carrier board?
>
> Generally, there is a dtsi for the SoM, and a dts for the carrier
> board which includes the SoM .dtsi file.
>
>        Andrew
Hi Andrew,

Apologies for the confusion in the v1 commit message.

The EdgeBoard FZ3A is actually a monolithic single-board computer
designed and manufactured by ALINX. All components—the Zynq UltraScale+
XCZU3EG SoC, 2GB DDR4, 8GB eMMC, 32MB QSPI NOR flash, KSZ9031 Ethernet
PHY, and all external I/O connectors—are directly soldered onto a single
PCB. There is no separate System-on-Module or board-to-board connector.

The reference to "MYIR MYS-CZU3EG SoM" in my v1 commit message was an
erroneous assumption on my part during initial research.

Because it is a single-board computer, everything belongs in a single
zynqmp-alinx-edgeboard-fz3a.dts without a separate SoM .dtsi. I have
corrected the commit message and cover letter in v2 to describe it
accurately as an integrated SBC.

Best regards,
Pufan Jin

