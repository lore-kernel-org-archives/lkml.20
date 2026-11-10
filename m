Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328957;
	b=3Oojm7BOGSEDRFOLagDS5dl4nJAbTLBOGo3mGWEfQB8LZkcPwgk/7KQMsJC91DjRhPGM
	 Sx6LCZls//pzUPp7pO0pa9CjkZOVdNHorRK1OHCkcFfktHN/r9S/AMUiSeXbU9fcKFlNn
	 N4FjjTHERM/RnnPk3eO9XcHcJmU2bZv2jmaaH1H3sz58LHB4F8SxCkQTdds9jtwZnG0ge
	 nDqjD3DJVtZsn6rYao8OugA2GLUyRRlNX0XE+L1Z7PL+x0ItvdSZv80E0OQf+XMdZMvoh
	 MYiyJf8Ijr5ewQSr68oh2V+Mfz1QrrPeMDRKhHgWON7q6XUihaLP0XnTIHCCFbzFbRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328957;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cwTPehP0J/3J+Lb62G7yQ4FlvXwx6KiiQuir6lkIwb4=;
	b=uygUgqsDVCbCk3lk0vpp0vW1W6dg/wBuT4MFlQFhWWapyqErr/iar6GCJUorkDcaYQOC
	 1BSy4xhyy7CgcrSKGIWel5jlR2ghqSOwJeaRStSiIEIw2O9w2u2ND3w3sjkwfJ2O6S4qZ
	 QZlPn3N5Jqx3foUt9g5P+IaXjmgjZoqgQFFxQ3EpfXDmUMl9cYZ5P3E0TiBPAUSXd86eG
	 UDY6yjucvUuoxNlQim0705hOVODT1PhwW1N80FxZErmffhA46VUp8QWkFwdzCYhUJvjAh
	 FND+hzy0gHYzRQbe/RBELVxI9OUKxR2bBc2+5ICnyifpTtUieSWlWcbyjSCNz60NAqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NUTjlzop;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F08606A216;
	Tue, 10 Nov 2026 16:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5F08606A216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NUTjlzop
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794328957; x=1825864957;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ri0LQs7oxDDyfXBO67wcYZxb4TvsJ82811I+HyQ0eUA=;
  b=NUTjlzopsHdtNjm9sL5HKIVYcbxSRG1hO8j1sIxad2vRk4BXewi+vNmE
   06tzCqaz8UholZVX0gSdVTErw2F9Bwx8vMliS5kGhvwyJc1FPUMbH+j3a
   9l0z+wVqg9iuphOudJBJ1bNQt91Fa3htEL9dNbSUoqmrSk1izLanVqxZ3
   k8JGF6hcWauesJJA7iOjome2qMTd7TVZeup+8AmX0vzYefVy1lAoP8Gcr
   eeYMNDLKt9K1BLhMuXnSzb2e8EdFTrVeGTvGavLVe0WWu26PPsh5R6Dr/
   ECjCBEy3oFvW2s9cGckHfQGtx29+QrE8pFYilqxuNR0KG3+QycDTa30Zl
   A==;
X-CSE-ConnectionGUID: P2JA/Qy7R+athBxf69+lnA==
X-CSE-MsgGUID: 9DrN5n1+QsOIyVTj78G6pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2960355"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2960355"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:42:36 -0800
X-CSE-ConnectionGUID: uZASnqyqToWTIzEAEQatrA==
X-CSE-MsgGUID: 0bpe4HZuSYm/ys1Z1/CWyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="10068575"
Received: from dawidgla-mobl.ger.corp.intel.com (HELO [10.246.17.60]) ([10.246.17.60])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:42:33 -0800
Message-ID: <599f1b31-f175-47df-b074-1915688eb390@linux.intel.com>
Date: Tue, 10 Nov 2026 17:42:25 +0100
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
Content-Language: en-US
From: Dawid Glazik <dawid.glazik@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <fff90721f7892c0285f4fed7fed460c7c1e183cb.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2026 6:53 AM, Andrew Jeffery wrote:
> On Mon, 2026-11-09 at 18:41 +0100, Dawid Glazik wrote:
>> AVCRP is an Intel x86 server platform equipped with an ASPEED
>> AST2600 BMC. The BMC is used for out-of-band management, platform
>> monitoring, and system control.
> 
> It's probably my fault to some degree for not providing a better
> explanation of what I was after on v4, and for merging changes from
> others in the past that were pretty lax on the description, but what I
> was hoping for was something more like e.g:
> 
> - f28674fab34f ("ARM: dts: aspeed: Add NVIDIA MSX4 HPM"), or
> - bc83b7353d2b ("ARM: dts: aspeed: Add Facebook Anacapa platform")
> 
> Are there more details you can provide? If there are, I'm fine if you
> reply here with them, and if there are no further concerns I can update
> the commit message while applying the patches.
> 
> This also applies to the JNCRP patch that follows.
> 
> Andrew

Hi Andrew,

Thanks, that helps. I also found one more issue in v5 (uart-routing 
issue), so I'll send a v6 with the fuller descriptions below
instead of having you edit them. Please hold off applying v5.

AVCRP is an Intel x86 server platform. The BMC is an ASPEED 
AST2600-based RunBMC module on the platform's DC-SCM. It supports the 
platform's out-of-band management and exposes board management I/O such 
as the system UARTs, status LEDs and control buttons, while integrating 
with the host's telemetry and management infrastructure.

JNCRP is an Intel x86 server platform managed by an ASPEED AST2600 BMC.
The BMC is the platform management controller for the host system and 
supports platform power and reset control, while participating in 
out-of-band monitoring and reporting for host faults during bring-up and 
normal operation.

Does this shape work for you?

Best regards,
Dawid
