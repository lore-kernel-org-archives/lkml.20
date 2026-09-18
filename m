Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B0D414435;
	Fri, 18 Sep 2026 08:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720476; cv=none; b=WEZSMMnieHqlOYlilEfxA20hg8GcUGNGnw0GC/qmF3oy+rNpDrJFXGT7JcpuNVZGrYdkB4xcmf6wBK47Uz6gWxw0C4p2B3v3TOU/KmXaZdmQsm0aOulb6JTMLcWexIPwCXmwZMeMFdda6sBxKjKC9szLVvPZyfICUzLrLR6dcBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720476; c=relaxed/simple;
	bh=1EvbTukYKzP9XG0mXC34VrrPp3kxiBJZWjbS6a/dIvI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mNKi/uYLC/O1LjubYnbg1inhvF2bpysJujXMfVRu0qG8+TnTFZEO8te6ITQBtisp5a135tJj+aTHE+Wr7IohCz51AVI8/qyqZMaQ5j/lKXYyIawIL/PrP4YczYnZBrAXScc04wkml5o6rxPyl4ybWgiBUn0ji8bPkJuEdIsGuWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tXd1e4tG; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tXd1e4tG"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22E6A168F;
	Fri, 18 Sep 2026 01:34:26 -0700 (PDT)
Received: from [10.41.4.144] (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2C1A3F86F;
	Fri, 18 Sep 2026 01:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789720469; bh=1EvbTukYKzP9XG0mXC34VrrPp3kxiBJZWjbS6a/dIvI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=tXd1e4tG8dljKhT5C2z8O5XWqawCvCHaDwubg1WNyr76TtpUGOxTX8nH8qiuk/YOh
	 b/9J5Af920gYnEgJ90ON8n8844bDBVgmTA2n3kYslOa9euNETUWBeDWgS4ZW+3xjte
	 w8fEVJoT9RJ7TGdjCW0Gtz+jah7jOqJKV97IRomc=
Message-ID: <f00c9173-ce5c-435e-a982-7240b71bef42@arm.com>
Date: Fri, 18 Sep 2026 10:34:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: arm: Add Live Firmware Activation
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Salman Nabi
 <salman.nabi@arm.com>, Vedashree Vidwans <vvidwans@nvidia.com>,
 Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
 Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
 Varun Wadekar <vwadekar@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20260706134455.132091-1-andre.przywara@arm.com>
 <20260706134455.132091-2-andre.przywara@arm.com>
 <20260717-lucky-gerbil-of-courtesy-162f0e@sudeepholla>
Content-Language: en-GB
In-Reply-To: <20260717-lucky-gerbil-of-courtesy-162f0e@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

sorry, just figured that I never replied to this - was stuck in my Draft 
folder ...

On 7/17/26 10:38, Sudeep Holla wrote:
> On Mon, Jul 06, 2026 at 03:44:41PM +0200, Andre Przywara wrote:
>> The Arm Live Firmware Activation spec [1] describes updating firmware
>> images during runtime, without requiring a reboot. Update images might
>> be deployed out-of-band, for instance via a BMC, in this case the OS
>> needs to be notified about the availability of a new image.
>>
>> Describe an interrupt that could be triggered by the platform, to notify
>> about any changes.
>>
>> [1] https://developer.arm.com/documentation/den0147/latest/
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   .../devicetree/bindings/arm/arm,lfa.yaml      | 45 +++++++++++++++++++
>>   1 file changed, 45 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,lfa.yaml b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
>> new file mode 100644
>> index 000000000000..ef8e250f2da7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
>> @@ -0,0 +1,45 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/arm,lfa.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Arm Live Firmware Activation (LFA)
>> +
>> +maintainers:
>> +  - Andre Przywara <andre.przywara@arm.com>
>> +  - Sudeep Holla <sudeep.holla@arm.com>
>> +
>> +description:
>> +  The Arm Live Firmware Activation (LFA) specification [1] describes a
>> +  firmware interface to activate an updated firmware at runtime, without
>> +  requiring a reboot. Updates might be supplied out-of-band, for instance
>> +  via a BMC, in which case the platform needs to notify an OS about pending
>> +  image updates.
> 
> What does the below described "interrupts" cover or doesn't cover? Both
> in case of in-band and out-of-band. It is not very clear for me.

DEN0147 says (at the very end of the document):
"As of this version of the specification, the expected scope would be 
notification to the Operating System to indicate new LFA updates are 
available."
In-band updates are work in progress, spec-wise, and we would cover this 
when it has arrived. So for now this if for out-of-band updates, so that 
a BMC for instance can signal the arrival of an updated image to the OS.
I clarified the wording in the description of the interrupt property. I 
also added that it must be an edge triggered IRQ, as there is no easy 
way to signal completion, and the ACPI notification has the same semantics.

Cheers,
Andre.
