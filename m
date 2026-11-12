Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502029;
	b=0JtVRk/yjE1AQs70lzH6qmFv9Q0MlsWz8oYB32x2Vuz6PGP838g10RpV3aPJqnyGB4HQ
	 POZ+Oha1Msb4FkY2mcYhbXQ4c8FhQjCrmAbGBtNWVWwCLAFOEycBd2TL0CxwRIloocha7
	 0lypvTeBzrrzzgfbK3jMr6PX0xPu/1lG2YVr3CAsCdZT/dBGUV9H8A3bEpoMMDauo7Hp8
	 zn4vXx3dEGak78ZXIisRZDhNvxXIj2OXVw3+5IMAi8kjczUSwFAdCtwatzm04NlTN0vze
	 xdzZg46PjH/680N7oxdst5UMph7FPiY9B5MIsusV/hk5zi8EFtD+ghSoZGfotOQP54w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502029;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=EI+/gOi3YcwXHjbf8KM4BWSUOlp+RtEEWptAHvG91Jc=;
	b=rmQr7sq2GYXOvvlw1vWw6PI/dQsPR7VB/a7OKC4M83W8tJgBAp61n6fN7ATHyDhv1h11
	 vCYUhTPgvcikQmo8SJI9uDMtGJGlvFE3qbYi/VIJX7Y6Ch8mFBbUIoX9EPSJeUVTlL/JB
	 aqG2AnmTulr7ynr4e7iz19wB4Z5wqa526fpMU80CpzAa35dZswvn+7NbUFvHzDsPbnjvF
	 8h8j9hI1lLf7G3NrxLr9QL/C/HU4qYKEVuftPdqNNXZCaHXieFn1pKuGDbkuzdVWtqfrc
	 mpHFCX+poK5u+ipgy/pHWy+FTrjYI1fizTKVBTA6B4LeflvB4JsWnjQH9GQdktCrvsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QcHFZz+C;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC20606A8A1;
	Thu, 12 Nov 2026 16:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAC20606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QcHFZz+C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794502029; x=1826038029;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gb+ertXw9oZUZYFRwrzAW9mTO6w0J+Qo9JE40Aj9z54=;
  b=QcHFZz+CWnRNbdm0e2RdF7NEXZvxEQmXf+ZXQ4Jtk/LGBdihs4kSITuc
   YzYj1G1k19zhXMx/hGTYw13oshhZ3V9bIyqQkPhN7UsVMLRitdCiZKbtW
   wyk7mO9/NYJ/n73DPmpCu8w5+MlUniG6Tz/iKWcZ8tKnFUaUUaxUweOLa
   k+x/H5RggKqQpe0L7A1GyyUl8xu/gdKeJ5TMuLqke1rSHb9mQBACe9tDZ
   DI/Xx2+7w1nnuOpsdM4zdLNoGO5LaLJYPop5tcqMXKErTmTFoYhUnmzbp
   g5PnAsuwiu4I5/q4Rv6LEu5oSKJ7RdLCaTMGckqCU/a2e1dQTMpjx6Eh/
   Q==;
X-CSE-ConnectionGUID: QJ8lzQAOQTmiClHRo503WQ==
X-CSE-MsgGUID: xl9paxarR4y1a2YBaBpZ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3176592"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3176592"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 08:47:06 -0800
X-CSE-ConnectionGUID: lzK5vqr6QuuygsvCO9xHyw==
X-CSE-MsgGUID: fvngpodqSqOyq1wRmPy0EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8699912"
Received: from dawidgla-mobl.ger.corp.intel.com (HELO [10.246.19.71]) ([10.246.19.71])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 08:47:03 -0800
Message-ID: <d246fbef-d923-475c-8e1f-bbeca20847e7@linux.intel.com>
Date: Thu, 12 Nov 2026 17:47:00 +0100
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
Subject: Re: [PATCH v5 2/3] ARM: dts: aspeed: Add Intel AVCRP BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 maciej.lawniczak@intel.com, Andrew Lunn <andrew@lunn.ch>
References: <cover.1794242015.git.dawid.glazik@linux.intel.com>
 <ee6958ba4b93cde4719fbac89c4027964c2236bc.1794242015.git.dawid.glazik@linux.intel.com>
 <fff90721f7892c0285f4fed7fed460c7c1e183cb.camel@codeconstruct.com.au>
 <599f1b31-f175-47df-b074-1915688eb390@linux.intel.com>
 <a92395610d27fc0f97af3b27b150de61583c2197.camel@codeconstruct.com.au>
Content-Language: en-US
From: Dawid Glazik <dawid.glazik@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <a92395610d27fc0f97af3b27b150de61583c2197.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2026 2:49 AM, Andrew Jeffery wrote:
> On Tue, 2026-11-10 at 17:42 +0100, Dawid Glazik wrote:
>> On 11/10/2026 6:53 AM, Andrew Jeffery wrote:
>>> On Mon, 2026-11-09 at 18:41 +0100, Dawid Glazik wrote:
>>>> AVCRP is an Intel x86 server platform equipped with an ASPEED
>>>> AST2600 BMC. The BMC is used for out-of-band management, platform
>>>> monitoring, and system control.
>>>
>>> It's probably my fault to some degree for not providing a better
>>> explanation of what I was after on v4, and for merging changes from
>>> others in the past that were pretty lax on the description, but what I
>>> was hoping for was something more like e.g:
>>>
>>> - f28674fab34f ("ARM: dts: aspeed: Add NVIDIA MSX4 HPM"), or
>>> - bc83b7353d2b ("ARM: dts: aspeed: Add Facebook Anacapa platform")
>>>
>>> Are there more details you can provide? If there are, I'm fine if you
>>> reply here with them, and if there are no further concerns I can update
>>> the commit message while applying the patches.
>>>
>>> This also applies to the JNCRP patch that follows.
>>>
>>> Andrew
>>
>> Hi Andrew,
>>
>> Thanks, that helps. I also found one more issue in v5 (uart-routing
>> issue), so I'll send a v6 with the fuller descriptions below
>> instead of having you edit them. Please hold off applying v5.
>>
>> AVCRP is an Intel x86 server platform. The BMC is an ASPEED
>> AST2600-based RunBMC module on the platform's DC-SCM. It supports the
>> platform's out-of-band management and exposes board management I/O such
>> as the system UARTs, status LEDs and control buttons, while integrating
>> with the host's telemetry and management infrastructure.
> 
> Can you talk more about the division of duties around RunBMC vs DC-SCM?
> Can you describe how components of each spec are used in the design?
> 
> What's the motivation for designing this module vs using another? Are
> there any specific target platforms intended for it? If there are, then
> some further details about those would be nice. If not, no problem.

AVCRP is an Intel x86 server platform based on Granite Rapids
processors. Its BMC is an AST2600-based RunBMC module on the
platform's DC-SCM. The DC-SCM provides the board management features,
such as USB, system UART over USB, status LEDs and the power and ID
buttons. RunBMC was chosen to enable a broader BMC ecosystem and
implementation flexibility.

The BMC provides the platform's out-of-band management. It exposes the
system UARTs, USB, network, KCS, MCTP over I3C and LPC POST code
snooping, and it handles the status and ID LEDs, the power and reset
controls and the host fault signals.

> 
>>
>> JNCRP is an Intel x86 server platform managed by an ASPEED AST2600 BMC.
>> The BMC is the platform management controller for the host system and
>> supports platform power and reset control, while participating in
>> out-of-band monitoring and reporting for host faults during bring-up and
>> normal operation.
> 
> You don't mention RunBMC/DC-SCM here, so I assume the BMC is integrated
> into the platform? Can you describe the purpose of the platform itself
> (beyond the purpose of the BMC, which tends to be the same for most
> platforms)?

No, JNCRP also uses a DC-SCM.

JNCRP is an Intel x86 server platform with Intel Xeon host processors.
Its BMC is an AST2600-based platform management controller on the
platform's DC-SCM, providing out-of-band management of the host
through KCS, network and MCTP over I3C.

The BMC controls platform power and reset, and monitors CPU and memory
thermal and fault signals as well as host processor module (HPM)
presence, FRU and fault signals. It also captures POST codes.

I'll fold these into the commit messages in v6, together with the
uart-routing fix, so there's no need to edit them when applying.

Regards,
Dawid
