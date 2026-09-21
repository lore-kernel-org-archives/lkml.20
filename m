Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DC14C6805;
	Mon, 21 Sep 2026 15:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005302; cv=none; b=QEl5Wf6eJUnJhOYYxUIlrM8jJoE9a8PZl5Q4QVF0pH09s1UPDtHis2LdLEB8XMsZ2s325KuCddxyra0zM465ArqcTf+qd2ErFouXNv+ApQUniISup6um2EKOAUFIPBl+mUvYqNqY8DBuRjqHU8v4Q6z63EJeEE387aVuioVEOEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005302; c=relaxed/simple;
	bh=Ic2Gw84krfr8c7OaYlaNtXNSDyS2HBWD7FYe8NgJc6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cPnyevniInYeSyG5fS4DLQ/GNzhU7cD1OWNzWDa/TjezHOfE9bUm3v+HxHOJfZDUmzKNUtiZnIPA+GCxKiycurbZPBjNGJMgOWyeQFRyn00cp/1o8uP8fQWRRFdHh3a2yictGbyW9xpRTsKCTiOs3UiwXTVFRaOfzm52/zo4k8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Qqanq/gI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Qqanq/gI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 441F4176C;
	Mon, 21 Sep 2026 08:41:35 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26F9D3F632;
	Mon, 21 Sep 2026 08:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790005298; bh=Ic2Gw84krfr8c7OaYlaNtXNSDyS2HBWD7FYe8NgJc6E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qqanq/gIdpOeMALookRJz4vD67sUMrtzWGffKczUef/dIagy2c/LYWFWyMCc3h1Ed
	 2p4sUCSs4EJ3vzM0AxfAJLIz6GvESQCA7xzNhkqb2edwnckVyugKDnwN8SGH5qiOOz
	 nTzfnMggNZmMuboRpCuuaJd/1ffKo+vYyMW4w9Ao=
Message-ID: <93d25b91-a361-45af-aa2e-82118179291a@arm.com>
Date: Mon, 21 Sep 2026 17:41:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] dt-bindings: arm: Add Live Firmware Activation
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
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-2-andre.przywara@arm.com>
 <20260921-nice-russet-caracal-6db6d3@sudeepholla>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260921-nice-russet-caracal-6db6d3@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/21/26 17:10, Sudeep Holla wrote:
> On Fri, Sep 18, 2026 at 04:11:04PM +0200, Andre Przywara wrote:
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
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>>   .../devicetree/bindings/arm/arm,lfa.yaml      | 50 +++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,lfa.yaml b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
>> new file mode 100644
>> index 0000000000000..179c542f383d4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
>> @@ -0,0 +1,50 @@
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
>> +  [1] https://developer.arm.com/documentation/den0147/latest/
>> +
>> +properties:
>> +  compatible:
>> +    const: arm,lfa
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description:
>> +      The notification interrupt for changed firmware image status. For
>> +      an out-of-band firmware update, some system entity would signal
>> +      the availability of a firmware update to the host OS via this interrupt.
>> +
>> +      This must be an edge-triggered IRQ.
>> +
>> +required:
>> +  - compatible
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    firmware {
>> +        firmware-update {
>> +            compatible = "arm,lfa";
>> +            interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> 
> Could the example use an edge-triggered interrupt type as it must be
> edge-triggered IRQ as per the above scheme ? As written, a device tree

Oops, sorry, of course, forgot to change that!

> copied from the example violates the binding's requirement.
> 
> Alternatively, is the binding incorrect and needs fixing ? I am not sure
> if there is any requirement on it from the specification. Where did you
> derive it from ?
Indeed the spec doesn't say that explicitly, but it's pretty mute on 
that front anyway.
The need for edge comes somewhat naturally: since the originator of the 
interrupt is unknown (the agent injecting something? Some BMC triggering 
a GPIO line? Some SPC triggering an on-chip IRQ line?), it's unclear 
whose responsibility it is the lower the IRQ line again. And even if the 
LFA agent could somehow arrange that - by having firmware component 
specific code to do that - it in unclear when exactly this lowering 
should happen: at LFA_PRIME? At LFA_ACTIVATE? Already at the first core 
calling ACTIAVTE, or only if the activation happened successfully? What 
about errors in between? What about if the admin decides to not update now?
As the spec doesn't say anything about that, and the ACPI notification 
is naturally edge, IIUC, I went with demanding an edge triggered IRQ.

Cheers,
Andre.

