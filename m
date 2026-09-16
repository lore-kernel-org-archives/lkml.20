Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3604B1CF4;
	Wed, 16 Sep 2026 18:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789584958; cv=none; b=nIC/Ko0kLk4zJlClcwmUP6OehDK5AAo6iOGQ+oT30e28TtfPg9FVbhdBPhe1odZg1PiS1f6OMzci97Bxh0SN2KZe7UxiuL3WJVDLZUJGh9T0fowsA3yXCev+fia1CPkpdhtLglcNQR0y8mu3zK8lol0/AJicVKxWy2+eOKUW4xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789584958; c=relaxed/simple;
	bh=iDDh9rOtsGUyyxFYcXXJCya+hH8rezrq4Xqy4y1T9gQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=EYGRAW/BRjYkINLrTCSmVpOa4qWSqf40xypiKbOkEfD7dxEj6jdWK11Alzfykbgk6yT3BuS9NRr/SMwZrZpMwD5N+umWePd1R31EGgg8OR0OXY5fPOP/0C4JyY5XMrhK6eBuAp9zM6N8BRZVosp7Uj6omWzYE95knJ47PseIKjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=h3TVpbqN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hyeGyjos; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="h3TVpbqN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hyeGyjos"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CF4731400144;
	Wed, 16 Sep 2026 14:55:37 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 16 Sep 2026 14:55:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789584937;
	 x=1789671337; bh=/BtudbvHRu5vzJceqkauvYyu2NJJyTRMpY980kdmrh4=; b=
	h3TVpbqNxLPGNU1L/6m+55titLaTBtzYGupf2TwfcXj9AKi07zR3NgEAVqClFoUG
	ecv/bJgRDndO73dqqKu/t6B6a2Q9KxPBoGPOtYZvVazCRUibALhs3r4d++r036wT
	LtpPkJYS0OYGM6iyrhTv3fWS2AwHoKCTFdqffyTn5un3efpeGh9egItVJaRU8FWI
	L0BeXz5tXX1iE8F3wJl4itOXdqPgMqdukfbL2MrTgV6ECDkhg3JHwsAcWs8jBFIl
	l0ekRb2Pw99ECsVap8TzArQC9necHSesFg/xu6qcUalZauh7egeBXIvZicqoMix9
	lWuhvmgGqSZA+kPv8L54Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789584937; x=
	1789671337; bh=/BtudbvHRu5vzJceqkauvYyu2NJJyTRMpY980kdmrh4=; b=h
	yeGyjosr6lxSE48xI5z6OcG2VaQhK53GM03k8CUYk4h1+Wwtzx0xxpXBASO7Rela
	ikDV+gjP89yVMtuaeapt68cgV+bC3aC1bO9aC7Lpl7BYwirpa8Le859syZhwhbfe
	ZkwoSokVpsEtYGj1ilgeINo4sGyjZ1GnoAyYS7KSUneiO+WSQd3JwllMAW23eZyD
	orR0JkNs2t7paWxabqrH0X/ZOhhod+lWZr95UT5UB+XnRf+sLWLMnqK9eDVZv+w1
	33VA4jJKMFCOQztM3p0EFzn7cPbxGMhjjprhV4iH+DAFqZyebKsBzza4LKsH8lqs
	OyWVvHWsnjJQ1Mk450Rcw==
X-ME-Sender: <xms:JeaqaiQIn7mIlX0FWPQ6R6kdYxGjhb-x4tRDw61RFO0BVrR74Xi3wg>
    <xme:JeaqaimjxX6lLO1LV5kN1zyrdYiz2ukkMAk1hCJxT-Z5LAZZNygF-zWlP1qiAH_u9
    SSot_MR8pNcsjsd3Lrt4s8qPQ_82akOd0NoAbtI-Fey-VDHGkmtQzQ>
X-ME-Proxy-Cause: dmFkZTGLyYyUm4JuU/6sohsGxDvYfjBOjcM4ZhfP5vW5Hs9fiAnR0fUKrvHE4IeNGmSPIJ
    txTc8icooyBZYlby2hI0ys+xENm/ATr0gEPXcrvU/DZ47QA6AnGZxY9AQ/8/wp9yh2HRz3
    eCJkQ/zjsBaRSOIyB3o1fL+lShjmU7VpINXZNyXbiXazCmJYQezX7kWBUe9apXKb0qpu5f
    ZZbLJBOi+s/ANO3Be9B1E4PdGS3f8RgbGk6RFpNwHzaa8B+1+YOOISRbMUD0s1IL1Kwp4j
    JsrkLnlr7RiGyH3brYTkY+CrN2pQoC0EK1/3UimY/IreWhOW+FhhFVay6+q68oLdVyr2jR
    xVAcvn/ykTRis6p2J868NVQu8PyVoOJ32NxEzNbpaZKcZzaLSubeNIYAS6pUw2l0AoVTDa
    0d43qKx0CcMhksPmWh7eJe+/JxjNUlqiT9pok4kjww27HVTv8WwErfv77Fgx5z/S95Iu60
    PTwW+qD93Ug+sRlEvtFx3cnWr7EdDOkylLTwsEAcJm1NdiFZjhn8DQflzHNTjLVJSPpYYe
    PDYxtNjKLATS8TuFV0lTmtz1nes+bE5HTZgrkDkANzIPmNfuqTkw18CdRj2GQers/qvs7X
    nwjRpXWvC5aEy4wSRDEhAHXBySZRpn+PrHNJBDGvG6I0uWpq/wm7S4XzJyPw
X-ME-Proxy: <xmx:J-aqatQxnHI1qyMs6Zmpj0Rv7nfCPRYjUXUF5eEA7BDJeMlib52b3Q>
    <xmx:J-aqaiytbcnhtYLvEEVdeUDGN5JymtZC2iQRa9VoiKIcz0N_1p4udw>
    <xmx:J-aqalCUm5xK0prz_pPrtBsySLzZr4V4RgepK6ddllKFIuYqDKL52Q>
    <xmx:J-aqamHm8cHvnjs-_7epixrtSgfpARnEfdeDR93042MD-2RDOhLcEg>
    <xmx:KeaqatFn6gsOA3yWNTNvJVgI5dqBUBacHFxZbd0lABS8tuBTleNHTZ6s>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D987332A0084; Wed, 16 Sep 2026 14:55:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AeUjof3PiXZ3
Date: Wed, 16 Sep 2026 20:55:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Daniel Scally" <dan.scally@ideasonboard.com>,
 "Jacopo Mondi" <jacopo.mondi@ideasonboard.com>,
 "Hans Verkuil" <hverkuil+cisco@kernel.org>,
 "Linus Walleij" <linusw@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <3052a817-3188-47b2-a95d-ec26aaa0d24d@app.fastmail.com>
In-Reply-To: <335cf0a8-4c0e-4c07-8d81-c076ac73d329@arm.com>
References: <20260915202458.3673504-1-arnd@kernel.org>
 <335cf0a8-4c0e-4c07-8d81-c076ac73d329@arm.com>
Subject: Re: [PATCH] media: mali-c55: add padding to mali_c55_params_ccm structure
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Sep 16, 2026, at 17:43, Vincenzo Frascino wrote:
>> diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
>> index 84d8f3901405..9c922290e035 100644
>> --- a/include/uapi/linux/media/arm/mali-c55-config.h
>> +++ b/include/uapi/linux/media/arm/mali-c55-config.h
>> @@ -804,6 +804,7 @@ struct mali_c55_params_ccm {
>>  	__u16 coeffs[3][3];
>>  	__u16 gains[3];
>>  	__u16 offs[3];
>> +	__u16 __pad;
>
> Does this field need to be explicitly zeroed/validated anywhere the structure is
> populated? Turning implicit padding into a named member fixes the layout
> warning, but by itself does not seem to prevent leaking uninitialized data if
> this structure is ever copied from the kernel to userspace. It might also be
> worth documenting that __pad is reserved and must be zero.

It depends on how the structure is initialized. Depending on the compiler
version and optimization level, a local variable declared as

   struct mali_c55_params_ccm v = {};

may end up with uninitialized stack data in unnamed padding, but if you
do a memset(), that should always be safe. If the fields are set individually,
then you also have to set the __pad field, but that's not how you do it here.

> I think you already checked that changing the explicit structure layout/size is
> safe for existing userspace :)

On all architectures other than m68k, the position of the struct members
and the struct size are unchanged by my patch. On m68k. there is no
implied padding at the end of this structure, so this is theoretically
an ABI change, but nobody has a mali device on m68k, so we know that it
is safe.

      Arnd
