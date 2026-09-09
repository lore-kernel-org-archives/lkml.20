Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76E61DA62E;
	Wed,  9 Sep 2026 15:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967242; cv=none; b=YvsQz+9lke4Id0jO3sNTY6F7a6FexfHLVybMcR5T4MxBF7WFiLNsuGxN8MLQPhN/6RrpX9wLZw9fUWZYc742gsouui0rvd6kjSUlZll1Y84rP1xpbGlcucUjmJr049L4UKMxluGHhsmpqEi0NM221Tirsky3HAyYY9hupeBMtkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967242; c=relaxed/simple;
	bh=L94IOKa3deB3aTZxOIU8OoQ9puLM7n+mopDxIIkqCrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c7d//x636ROauqq+VeHYk7gs4dwNDRnGxhP2kd8NPqJie9C8kGL6q0PDhCoP1gJbIzQaH4/AKLjsf5GxwNXy6KmfF+j6VKblHJlxtB5UFSBRDvqhoyDTr1ruApcxm/f6FrkcPLUEw3011kxp2WwS5LVjs8tP9sz9JQ5Xqf82Uxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQBA9e7M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQBA9e7M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B93E1F00A3F;
	Wed,  9 Sep 2026 15:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788967241;
	bh=kQJdynXsODCNzrfM0pBEb3urha8CodX3nldpSKp+/4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=TQBA9e7MvlZ7sOIrD1neyNl+pqrAZPH8LNG/btP6Yy5EMjt4Rn04aX8uRnkkFwQFA
	 cd1fdYK/VlagxXXrH5oxjCHkwHdG3cEMdRPBIxK52bW4646SK8ppb535qvJ2u6AJkq
	 a6S4yGbSvwRy24oQAuETgWB+Q2anqPEWz6B8d41Z5AJdp6jZbu5EaAG5hcIFG1o/oG
	 2qAlBAzqLNsWlfDsa+GzKoyoFCxRnqTuxYrJYIWrjO6VWaktvgj/yiynQcNJMId/hZ
	 +n5ODGbUsMIBecNWASJhuRIuOZhfxK/pULCQ/v2PX+AB43g/I2hhuqvnUo9iTCrYrt
	 6k6mo83j2+Kfg==
Message-ID: <33699664-6afb-4b46-99d1-98a0f5e57f39@kernel.org>
Date: Wed, 9 Sep 2026 17:20:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/22] thunderbolt: Add Apple Silicon support
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-19-1f80085f93fb@kernel.org>
 <20260908091844.GD106095@black.igk.intel.com>
 <22808191-5310-4d90-9fac-68d0d85b4c54@kernel.org>
 <20260909060615.GJ106095@black.igk.intel.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260909060615.GJ106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09.09.26 08:06, Mika Westerberg wrote:

[...]

> 
> If it is possible, I suggest to use the same way we do in ACPI side here:
> 
> https://learn.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#map-native-protocols-pcie-displayport-tunneled-through-usb4-to-usb4-host-routers
> 
> It was specifically designed so that it should support DT as well (that's
> why it uses the device properties _DSD).

Oh, nice, I didn't know those existed. Konrad already has a PR open to 
add these to dt-schema [1] and a PR that already makes use of these for 
dwc3 [2].
I can just write generic code similar to the ACPI one then to add the 
device links and split it off from this series, though I think that 
dt-schema PR must be merged before we're allowed to use that representation.
I'll adjust the dt-bindings here for v3 to just drop the representation 
as OF ports/endpoints as well.
For the PCIe/DP tunnel notifications I should be able to use the same 
representation, possibly with an additional usb4-adapter-index property 
or similar to differentiate between the two DP IN adapters, once I get 
to that then.


[1] https://github.com/devicetree-org/dt-schema/pull/196
[2] 
https://lore.kernel.org/linux-usb/20260901-topic-dwc3_tunneling_state-v3-0-22fdced8de55@oss.qualcomm.com/


Sven
