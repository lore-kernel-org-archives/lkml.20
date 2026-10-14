Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E53655D86C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997032; cv=none; b=kzCeYx62dKf5MqN8TrVN8urDOZOdU9xoFok13hoFu2pRVfo9XKf6bO99WLu/TBb/UPDRLtdEGH9MEPDZkpn91zc7CRmlDfior8I9Cc1xfs9Ip1tuytRvUTt+1k4SduIXVf1PXcBGnFt47y/9WxhxEHi9v/W2aFtuCxA8N9h8jiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997032; c=relaxed/simple;
	bh=nRmxIe3nekvo3LsmeCDFBt3HhYTvzYYTtP4ISLeLSHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0AM62NYDZhl5EFTmvTrhLigOXp3sJfgbVKviNMD3Dom/0W12sTYWt5VThRpJZhwfwOqVzocC/CaBGaAwZvj5erB48iTpQTu5PeZypKeLtONqqUCHboQrtxK6WkD+CJKv82U0sHkMpyxyy27oiPra5rW8m1yU9DqQcrfez/mKSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=oAxiewNt; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="oAxiewNt"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91ba8fcc684so14638796d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791997030; x=1792601830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqICNawrxpnV+J/cqg3H34juTALn0ZUgodfLDyK948I=;
        b=oAxiewNtYa9j7vGWiahciu8kcCFNknM3vBEqyW7YvMIHH/w2QkpbpwY06UriCKhbvR
         1XJ1Qxu3pHMK0quF++Ut+FKhXJz9KF9spQ8Dyfqjeu7tpgjCA+/VoFwDEOnkVrXRHPDI
         uz2d9saI6C2umBKOA6UyIveItBMT91kcz/bCkLJ3esTHyqwU+VfJhrAOBd+b1sKq/eTa
         A5H0qsCqJNUnsddGc4UmrlWm3I+d5jKUiwWIoY1jqVoUXgJdQD8pbmD3eqsEMvKeNSD9
         LdAOlRppmM/KGnHnN7/VzLmtwqkvS2ZMZPoGvdTJWNf34ayIGeQHsVeRDYGTmLeQkJGo
         tMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791997030; x=1792601830;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqICNawrxpnV+J/cqg3H34juTALn0ZUgodfLDyK948I=;
        b=YN/OeH6PUwKfcZpixhc8m20SoRvtLnnOQ1PIvEoVi1FfDw6y3nDq/o+dNIGNCosxMf
         YWhx32vxL1QVIfEUyufiCcGDFcVdJS7FnhZ7Wc3F8O+sTjw1KcrGJWXtxLMONbjUMLiX
         Y5Bw1j69mhhWkm0j7D5+aLsIXRVd2P03igXnwIvjqhAvxXUm3c6Jmmv+DEre7pQXo2Rh
         xH37gP82tWyLIbgPEkNOiphCNT2KNZ9bBcBkxDXbgfLnNCcLW0fyV/OPtdmcXFZCmB1F
         pNBcCLcA1cgCsJawbqzwVwNElCRUsd3/hH4xhkraVewDOizoHKJb1z5tR7KtED6w0EHd
         qR+A==
X-Forwarded-Encrypted: i=1; AKwUvBzHTJuyH+nSqOe4BEeMijEXYXdM4BQUKjX95wcD7D7bsqMYVuRTPssBHj3LhV8jJZ5L2scn2j6yucD9xx8=@vger.kernel.org
X-Gm-Message-State: AFq9FYItuEPdG/chut4Cgj3rQCERptlumb+Sr5OXxuYeKB4HpJ1UP5WN
	CWm2gVJyeebku12NFhr0Lzy6FIHVcJYd/uZSalR6c4QP6YQnz6t4+XzHVL49l9bRjnI=
X-Gm-Gg: AYBFou00H5U/lQctOEPIuJXWMl4bfkeXDR+ILwfJxaJhTOV03CwqbdiIt1XWuEQRKcG
	RX2Nrw3FI47fyezf60Lm9nPFc3lCqwSO6/Vtrlp8kU1q+VGmiPTQ0/f6ugBIcbE4VOb0mICXNhb
	rxy+gcU6nrQDzSHduhZg6/2AwXRXj70Hrh1LKlCiTglXBWIsWJkk/KM7CGm1pG04Ilf5HmuC3t/
	ZQyPQPKj79yiMFc1wkM3EpJmPB+KEgIVG3lFjrDKD774Tz2xRlDxIt4ESwFTk5g5a0LFZa3NIzb
	yscZHtiBnpmuRsyJgFGbmyuCWZv78e057ptDZtfZe+A4U26cWj7oJmIRn13U/J/e7hgo8izBHf7
	484y94H4zLbElGlFJNFVUNmz9s/HL4H4ge7an59yDrPZEwQPnp6d5QgNHQXdSjE2h/w6C/sfWyo
	3TZ2TWeanDwChuINFS4FHq308fo7zQZwC62iQ/+UKHV6TBZ+a36pAX+9+zov8Jp3iUDT/3cxCzu
	GOQ8MgLbQ==
X-Received: by 2002:a05:6214:c4b:b0:919:51e9:8f16 with SMTP id 6a1803df08f44-91b55806079mr321358506d6.32.1791997030041;
        Wed, 14 Oct 2026 09:57:10 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b35e23sm57382956d6.17.2026.10.14.09.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:57:09 -0700 (PDT)
Message-ID: <af5ce6ac-244c-4fc4-bbc1-8875eec8508a@riscstar.com>
Date: Wed, 14 Oct 2026 11:57:08 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: introduce
 toshiba,tc9564-msigen.yaml
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, tglx@kernel.org, radu@rendec.net,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>
References: <20261012190245.3988619-1-elder@riscstar.com>
 <20261012190245.3988619-2-elder@riscstar.com>
 <20261013-coexist-sixtyfold-cc6614086d3a@spud>
 <20261014-eminent-normal-lynx-3ebba3@quoll>
 <c5af1a40-e498-4855-8797-2663db83b9e6@kernel.org>
 <b8a8ca4f-c575-448a-baea-4b9f82f15e39@riscstar.com>
 <20261014-getting-bronze-d8ab7598d9ee@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261014-getting-bronze-d8ab7598d9ee@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 11:41 AM, Conor Dooley wrote:
> On Wed, Oct 14, 2026 at 09:55:03AM -0500, Alex Elder wrote:
>> On 10/14/26 5:22 AM, Krzysztof Kozlowski wrote:
>>>> I still do not understand why do we need to describe the inner wirings
>>>> of the tc9564 device. So far I found no posting of DTS showing proper
>>>> usage of it on the host. Without proper usage, what is the point exactly
>>>> to describe the inner specifics of tc9564?
>>> And as shown here:
>>> https://lore.kernel.org/all/20261012152408.3729237-5-elder@riscstar.com/
>>>
>>> there is no single user of any of this (this=reset, clock, irqchip
>>> probably and more) in upstreamed patches.
>>>
>>> I am getting tired to keep discussing it, so next time instead of words,
>>> please post CODE which is the argument - who uses any of these devices
>>> you keep adding.
>>
>> I'll take a break from my in-order responses to messages, and will
>> respond to this first.
> 
> Not really replying to any of this, but figured it was worth
> mentioning that I am reviewing with the assumption that it's similar
> to the microchip lan9xxx devices that can either be a standalone SoC
> or connected as PCI endpoint.

Yes, that was one of two things that this was modeled upon.

The other is the Raspberry Pi RP1, which is probably a more
similar example.

> You keep calling it an SoC, which I took to mean that this had
> linux-capable CPU cores on it. Is that not actually the case?

Well it is an SoC, in that it has numerous interacting
components that are aggregated into a single chip.

It does, in fact, have an embedded CPU that uses SRAM, but
it's just an Arm Cortex M3 and is not Linux capable.

So no, it is not a Linux-capable SoC the way the LAN966x is.

					-Alex

>> Our ultimate goal is to support the two DWMAC interfaces attached
>> to PCIe functions within the TC9564.  This is a complex SoC which
>> interfaces with the host via an upstream PCIe switch port, and
>> incorporates an embedded PCIe endpoint with two functions.
>>
>> Based on your request, I will plan to send *all* of the code that's
>> required for DWMAC support for review later today and tomorrow.  I
>> have been pacing myself (in part not to inundate the lists with
>> patches).
>>
>>
>> A block diagram representing the TC9564 SoC is included in this
>> devicetree binding:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/commit/?h=char-misc-next&id=ed0a1c1eaa376e11cf8c97d898f2811b8ded322f
>>
>> That explains (and attempts to show) that devices (including clock
>> and reset functionality) use PCI endpoint BARs for access to their
>> registers.  Other IP blocks shown are an address translation unit,
>> a block of SRAM, two XGMAC interfaces, and an MSI generator for
>> each of the two embedded PCI functions.
>>
>>
>> To show the final DTS file, I have squashed the working code I have
>> and refer you here, starting at line 994:
>>
>> https://github.com/riscstar/linux/blob/18d7146c807a6264388c919391b77a795612e342/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts#L994
>>
>>
>> Note that this exposes many internal details of the SoC, which
>> Krzysztof objected to here:
>> https://lore.kernel.org/lkml/fbeac5ba-a28d-4d34-8d23-4946aef515ea@kernel.org/
>>
>> I responded, explaining some history on this code and asking
>> for clarification on criteria for when it's acceptable to
>> describe chip internals in devicetree, but received no answer.
>>
>>
>> The PCI endpoint bus enables a PCI endpoint to be treated as
>> a *bus* that provides access to multiple peripherals, rather
>> than as a simple single-peripheral device.  This goes well
>> beyond the capability of the PCI enumeration process to
>> discover the nature of the hardware, leveraging devicetree as
>> a hardware description language to describe the organization
>> within a complex chip.
>>
>> I understand the desire to consider the PCI endpoint (function)
>> as the boundary for devicetree descriptions.  But I also see
>> great benefit from viewing the SoC as a subsystem in itself,
>> whose IP blocks and connections between them are described
>> using devicetree.

