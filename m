Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747267;
	b=43ZowwZ/0UA5bWF9iaQeBhZGXydor54W2u6djUZMJuRGNN4ZPTydJ8OvZFi/51QTdHUL
	 WDgafAUHe4Z4p2H6Mg8NczsleuYL0XS20h+VU0w1zRwk/o+276IXUhBQ/KT3nl9JJfHaP
	 eM+TbyvN1htm/bnNF9YoSEOzGgjB2ELKEX2JuHBUbu8SSbhZ/ZyTFtdOzTEaSOq3tqPI1
	 9/BJZdMz1JloHGWSF5CAIdyKHTBTv9Y/N2I5qYu50LGDLPmIGCrcMZ4PDw0d+IgjESjDh
	 wnNWajbAmtvR0UQSmuh3ArHE+Tzwnm17PEuy7fYvbayqmuaPUBO2g9suQleornk4MDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747267;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LtgqnPwkSNepb5rhVYGZGg+M7ky5lb2Mgj+7aMYIu38=;
	b=hRnt0gQp0bspYl/jHzTwaYOrf0JzBXvDi1fnkNTEdN1lDgGuF4qFlTn/ovVTeFyLkFr9
	 Hr87gujX+D+X4du7FewhTWt8K+TDA+yezWaIJtSl3Yw1XjCJH2gODg56g/bTPb9JJC74z
	 BsexHD4tUT0+milmsh+mbIfoze19RCpm/qaunRpGSqyiucd8fUIVGK2kQtU9RNeyKr2mR
	 GprGOVnxQGKbm0OqcO/SQyMSmEzuMV1WCNMqgVVDr5EVWDUGP621hzYYDvP3Lzm9oUJlY
	 RGCjiVKW1VfjTT+z/7FVHB9VG6A6a7CUG0Rh8DhYTs9Sto77DiLE+y1QdlH+OfYLJ8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=letUj2Ob;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECC0606A31A;
	Fri, 23 Oct 2026 09:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ECC0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=letUj2Ob
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792747268; x=1824283268;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HvQu/rXlxvjhOw72+0RA9ZUcddXB/44XYkRs0LAsZco=;
  b=letUj2ObfTCYD8nreCHNTHNYijQonfNK39GvO41+uEYg/oR6elvrzNhL
   ytHS94iKruquht3zwe3GQnbC+O4V7R+3e0P/zBmvkf0/efgiMWM3rUcse
   +yUPwOivR68zeqtFZzWDN6gKIoEzIRw7rxv+X5wc0XFBwmr1+Qvt3cBtC
   RZDs7e3sQo+v2pS4ebd1kk+uwwTLqtVH5OaNDGkaVZJ/7HxAg2uNggWsD
   LHuNcIKK25P7XAVLbwOCknIWw4yRQfJPBHgBGCAcIkSb8ap8QC/Wl6fSb
   DD9BqXMpd1R+KFUHV2aRm91NgeA8fH+Fb6tG2cZmiGe9/LzxkVMe/hJtU
   g==;
X-CSE-ConnectionGUID: H76XIvMvTWGKSmyiSauqHA==
X-CSE-MsgGUID: 71bZY6CmSGKq9aTF2URtfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1400723"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1400723"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 02:21:07 -0700
X-CSE-ConnectionGUID: JilZZk58SwmSD3MCGwSnXQ==
X-CSE-MsgGUID: PLKmsBB+RuW6zcBP54Mbsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3707489"
Received: from unknown (HELO [10.102.88.154]) ([10.102.88.154])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 02:21:05 -0700
Message-ID: <9561c180-ff8d-489d-9ad1-8d9a7afb592c@linux.intel.com>
Date: Fri, 23 Oct 2026 11:20:45 +0200
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
Subject: Re: [PATCH v3 0/3] arm: dts: aspeed: add Intel AVCRP and JNCRP BMC
 platforms
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 maciej.lawniczak@intel.com
References: <cover.1792613583.git.dawid.glazik@linux.intel.com>
 <fb048449033e125df93c2925d6dccafbd4114685.camel@codeconstruct.com.au>
Content-Language: en-US
From: Dawid Glazik <dawid.glazik@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <fb048449033e125df93c2925d6dccafbd4114685.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 10/23/2026 6:17 AM, Andrew Jeffery wrote:
> Hi Dawid,
> 
> On Wed, 2026-10-21 at 22:26 +0200, Dawid Glazik wrote:
>> This series adds initial upstream support for the Intel AVCRP and JNCRP
>> BMC platforms based on the ASPEED AST2600.
>>
>> The first patch adds the board compatibles to the ASPEED binding. The
>> remaining two patches add the board DTS files and register them in the
>> ASPEED DTB build list.
>>
>> Dawid Glazik (3):
>>    dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
>>    ARM: dts: aspeed: add Intel AVCRP BMC
>>    ARM: dts: aspeed: add Intel JNCRP BMC
>>
>>   .../bindings/arm/aspeed/aspeed.yaml           |   2 +
>>   arch/arm/boot/dts/aspeed/Makefile             |   2 +
>>   .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 322 ++++++++++++++++++
>>   .../dts/aspeed/aspeed-bmc-intel-jncrp.dts     | 276 +++++++++++++++
>>   4 files changed, 602 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
>>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts
>>
>>
>> base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
> 
> Can you please discuss why you based this series on v7.1-rc5? v7.3 has
> been released, v7.1-rc5 is a long time ago.
> 
> In the future please base changes for the AST2600 on the latest -rc1,
> or the aspeed/arm/dt branch of bmc/linux.git on git.kernel.org.
> 

That's my mistake. I'll rebase onto aspeed/arm/dt of bmc/linux.git and 
send v4. For future AST2600 changes I'll use that branch as the base.
>> prerequisite-patch-id: 23091b539ec7723a865d82da7703bf70c6ed0222
> 
> Can you please rebase this patch to send it to Lee on its own. The
> AST2600-based platforms currently generate a warning without it. I had
> hoped Lee would apply it in the same cycle.

Sure, I will reach out to him.

Regards,
Dawid
