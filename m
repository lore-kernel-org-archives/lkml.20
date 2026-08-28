Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CBD2D8DD0;
	Fri, 28 Aug 2026 18:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942866; cv=none; b=JAMLC8+yozK26cwf7r6PnrfnQZljVaFNrGQkQjUKjFZujGczUVv7Bn3sKzOnpdUajbHkDbHlXObubjC60FbE7QEB8gEKTyXF9HQzxJQFJpKQ7aNnp5nds4r4S+7ym0lzA9pLinTl1XnRiddaG8dKyPHuxr9RGZ1ib1RwbTAMpA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942866; c=relaxed/simple;
	bh=oP4ScKiNLf57xHxpWiyLbcHuHYS0fOpfCUYauok6Y9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aMWYLSN53E4/a/1AMSJReOr/iTFaAiBtWrUMOJcztl2dqMjYujrl7+pFc06mnTEPZq0fsFcBe3hNOcpa5U2ih2+g6qS3i21EcHDL1O4PVuAAMLiYG1UOGbmGt8agMhn4VmFw6g1+3zZpyhvfHL5vbxR9LaEKsbLjd7U2968IhEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Nm16mUVm; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Nm16mUVm"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF8B910A240;
	Fri, 28 Aug 2026 20:47:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787942858;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=w5uLOuQaPiHt9dSpbY0OeGfbDrrRTGfvqoBro2SNT4c=;
	b=Nm16mUVmjNmz0GCwKa4mmE/uA73TtkYVHgOyLgdzS80wm1YrRt/tqBeGVjq5slt50ZwLxz
	MW3Tw2H1O3JsVah0SckroXyQtLw7JACjWCAchyxgwUMYcTbWdrLvVTvI9OzB8hGNEF41C0
	srAOyoU3D69C4gYGx7nLx8EDLdio5rvKW7XXk1b6CPoElplaXQnaGlb0gCkQ6VI8RFkuqR
	IHQT8aVqqG8bK/YryQ8ECf3LG8UrQWje5AnEVtPQOqAz79vAnK8lS8CdIZdlMLfxcjKDuv
	eQV6+PH6gLTGxEf5hi6RqN3yCp6eFYATs03bmq3Jfhd8xUelztos3wlELeXMvQ==
Message-ID: <7f6f7df9-55c7-4393-a4bb-42c6cc170df1@nabladev.com>
Date: Fri, 28 Aug 2026 18:33:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: usb: Document ST UCPD
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260819163410.119755-1-marex@nabladev.com>
 <db62c29a-7260-4e19-9279-e38323353c30@foss.st.com>
 <225f1704-399d-47d0-8bca-73a27a59bbd4@nabladev.com>
 <42bb4c3c-1dbd-4902-9765-01687b74cb39@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <42bb4c3c-1dbd-4902-9765-01687b74cb39@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/26/26 3:24 PM, Fabrice Gasnier wrote:

Hello Fabrice,

>>> I've sent a series for the complete case. Please check and review here:
>>> https://lore.kernel.org/linux-usb/20260821-ucpd-host-fusb340-v7-2-rfc-
>>> v1-0-c5e27cbc0795@foss.st.com/
>>
>> What is the difference between this driver and the ^ driver ?
>>
> 
> Hello Marek,
> 
> That includes the TCCP I2C driver (and an example on ST boards).
> 
>> Why is this driver not covering "the complete case" , what is missing
>> here and not missing there ?
> 
> I intended to show a complete case, e.g. UCPD controller driver and
> external TCPP I2C protection chip driver. The TCPP is a companion,
> complementary, e.g. provider/consumer relationship.
> 
> You've pointed some "horribleness" there. I guess you talk about the
> straight forward approach e.g. EXPORT_SYMBOL() macros. That's an
> on-going work, a prototype. I could have sent as an RFC.

Yes please.

> I wanted to be transparent, so the correct level of APIs gets used.
> 
> You propose to turn the TCPP into a GPIO chip ?

I think yes, it is after all four flip switches on I2C.

> That seems smart, at least for the CC lines switches.
> What about Vbus and Vconn, it could also fit regulator API ?

It would, but, aren't those also flip switches ?

It seems to me, that TCPP02/03 can enable/disable Vconn on CC1/CC2 (that 
sound like two GPIOs), enable/disable gate driver (GPIO?) and 
enable/disable gate source (GPIO?) .

> There are various functions, the bindings should be extensible enough
> for later use of additional functions. I'm thinking of:
> - Over-current events for Vbus & Vconn
>    Could be represented as interrupt controller ?
>    Or could benefit from a regulator notifier (if used) ?
> - Vbus sensing

Could extcon cover those ?

> My point is that, that can impact the dt-bindings or functionality.
> Sending UCPD driver only, without the TCCP binding & driver, I find it
> is a bit hard to review or test at my end without having a more complete
> view.
> 
> I'm not sure which way you'd like to proceed ?
I am wondering whether maybe we should slow down a bit, get USB sorted 
out and upstream first, and focus on UCPD/TCPP as the second step (not 
in parallel to USB) ?
