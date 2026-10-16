Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E4245EF4E;
	Fri, 16 Oct 2026 18:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175706; cv=none; b=Vjz1L31Hk6gUSnxFwaXZ1EkQ9GYm8y9Y2X5wdlaRu9fdB7lbzEvRPLLiS1wJ33rPQM6k/d0C+zjlWkWjShbHWc/lsfZ8hm+0EIfRjykyk8PTY7lYeQ+E4itPhVzpt2EAuTeeyGD9+kdO2jGGhV2ml2LsZQZbPgpfWBPH1SVj4QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175706; c=relaxed/simple;
	bh=TCPs7Q0SBQpJG7xNxUhhLDp3yOSvi0sjiqAmnJ23vfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QS1aGTyzyh8mcrNLhOo8z9kDgQltDvW3TLxkQZ/C/YMmIHIpKnAZwNtywQkt+gdim6Q0y0PyWYuNjGIXGaznviS+pbi9qAowtV/3SUnP70r344ERV5z6lFT9mJFE0T7LKcIGT+pdLK/Yh5CsMik4qkt6lUGSJGg3nsSVf8hCxbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Hsh/0GqC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Hsh/0GqC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AC8114BF;
	Fri, 16 Oct 2026 11:35:01 -0700 (PDT)
Received: from [10.33.8.90] (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 381F13F7B4;
	Fri, 16 Oct 2026 11:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792175704; bh=TCPs7Q0SBQpJG7xNxUhhLDp3yOSvi0sjiqAmnJ23vfM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hsh/0GqCkAlqYTJU9xl7kQb9NsXeElnitnC2YjRO7T9EwLdr99K8MXIliaamEzXoB
	 dnTaROKxWPkpj+0foPQNAAP+50YLF4PsotSL6iEOZHrVjZAkgl1EcdRB0u2/6xMrHm
	 xeNS1jSSPMFFekE9SxLuAvFSx+ARfYvZX6R5jjBM=
Message-ID: <cb22948f-4e46-4b26-ba66-5b10054d6088@arm.com>
Date: Fri, 16 Oct 2026 19:35:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] firmware: smccc: lfa: add sysfs ABI documentation
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
 <20260918141112.2115555-9-andre.przywara@arm.com>
 <20260921-essential-inquisitive-spaniel-9801eb@sudeepholla>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260921-essential-inquisitive-spaniel-9801eb@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sudeep,

On 9/21/26 18:19, Sudeep Holla wrote:
> On Fri, Sep 18, 2026 at 04:11:11PM +0200, Andre Przywara wrote:
>> Document the sysfs attribute files as exported by the LFA driver.
>>
> 
> Looking at the sysfs output in 2/8 message log,
> activation_pending is missing from the documentation.

Ah, good point, added now.

> 
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   Documentation/ABI/testing/sysfs-firmware-lfa | 106 +++++++++++++++++++
>>   1 file changed, 106 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-firmware-lfa
>>
>> diff --git a/Documentation/ABI/testing/sysfs-firmware-lfa b/Documentation/ABI/testing/sysfs-firmware-lfa
>> new file mode 100644
>> index 0000000000000..afd349af9cf14
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-firmware-lfa
>> @@ -0,0 +1,106 @@
>> +What:		/sys/firmware/lfa
>> +Date:		May 2026
>> +Contact:	Andre Przywara <andre.przywara@arm.com>
>> +Description:
>> +		The Arm Live Firmware Activation (LFA) spec describes an
>> +		interface between platform firmware (an agent) and any user
>> +		on the non-secure side (like the Linux kernel) to activate
>> +		pending firmware updates at runtime. The actual firmware
>> +		update would be provided independently (out-of-band, or
>> +		via any existing explicit firmware update mechanisms), then,
>> +		if supported, can be activated immediately, without rebooting
>> +		the system.
>> +		This directory contains one directory for each of the LFA
>> +		capable firmware images supported by the agent, identified by
>> +		its GUID. Within each directory, the same set of sysfs files
>> +		provides access to the properties and actions for this
>> +		particular firmware image.
>> +
>> +What:		/sys/firmware/lfa/<GUID>/activate
>> +Date:		May 2026
>> +Contact:	Andre Przywara <andre.przywara@arm.com>
>> +Description:
>> +		(WO) Write a boolean 'true' value to trigger the
>> +		activation of that firmware component. An update must be
>> +		pending for this to be successful.
>> +
>> +What:		/sys/firmware/lfa/<GUID>/activation_capable
>> +Date:		May 2026
>> +Contact:	Andre Przywara <andre.przywara@arm.com>
>> +Description:
>> +		(RO) A boolean value to show whether this firmware image is
>> +		capable of being activated.
>> +
>> +What:		/sys/firmware/lfa/<GUID>/auto_activate
>> +Date:		May 2026
>> +Contact:	Andre Przywara <andre.przywara@arm.com>
>> +Description:
>> +		(RW) Write a boolean 'true' value to allow a firmware image
>> +		to be automatically activated once a new firmware update
>> +		becomes available ("pending"). This depends on a working
>> +		notification scheme, for instance via an ACPI notification
>> +		or an interrupt to notify the kernel.
>> +
>> +What:		/sys/firmware/lfa/<GUID>/cancel
>> +Date:		May 2026
>> +Contact:	Andre Przywara <andre.przywara@arm.com>
>> +Description:
>> +		(WO) Write a boolean 'true' value to cancel a recently
>> +		triggered activation, if that has not finished yet.
>> +
>> +What:		/sys/firmware/lfa/<GUID>/cpu_rendezvous
>> +Date:		May 2026
>> +Contact:	Andre Przywara <andre.przywara@arm.com>
>> +Description:
>> +		(RO) A boolean value to show whether this image requires
>> +		a CPU rendezvous in firmware to be activated. If true, this
>> +		means all CPUs will enter the firmware during the activation
>> +		process, so will not be able to execute kernel code or
>> +		handle interrupts for a brief moment.
> 
> What use does the userspace have with this 'activation_pending' and

activation_pending is probably the most useful of those attributes, 
since it tells the user that an update image has been deployed and is 
ready to be activated. For out-of-band updates this is the only 
information that we have, if we don't allow automatic updates. Userland 
could poll this file, or rather use some udev magic to be notified, as 
Nirmoy sketched up a while ago.

> 'may_reset_cpu' ? We should drop them unless you convince otherwise.

The consequence of may_reset_cpu is that a component cannot be updated 
at the moment. I think that's an important information to have.

Besides, the idea is to rather not filter too much here, but just expose 
the information that the firmware gives us. I am expecting some userland 
component (either a daemon or fwupd) to process this information, and 
let the kernel act more or less as a middle man to do the SMC calls.

Cheers,
Andre

