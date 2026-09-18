Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB4F4EB859;
	Fri, 18 Sep 2026 16:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748505; cv=none; b=Zr2btw2ZTPpbIbNUAuEPQgbNJYR167DCK/bTh849Rtbilat5oO9sd5a/qXD8LVgVbpk1TxRVElfmAinBgcbaYdyZvtUyi4rYwR5V+qL+VD7NGZC8EHj96hirtOcGvN5mDE7e/RDavts7zytyDa99CyTab/J3wiTUZCfHxQ8GcFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748505; c=relaxed/simple;
	bh=/OybNd89mEkvshGFEDppqY+8tuTPGqXqbXHfup9KH90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNpkuJFJvgvp6ujZT7frT06BbTGpDTwlUcWZnllBt57HvD1/GrkHu0iqTQTREZS+EyGr2GXprKQqY/xoQpzkoMhgfirJkeTzxUffx4OqzPi+mZQRzQFHAdc+0uycOwc1D5/4AHVoU16U81OhDKPl/XTl0OfMO4005iC7UDLyNU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fJwZQlJs; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fJwZQlJs"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B4C3168F;
	Fri, 18 Sep 2026 09:21:35 -0700 (PDT)
Received: from [100.72.146.165] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 128D83F86C;
	Fri, 18 Sep 2026 09:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789748499; bh=/OybNd89mEkvshGFEDppqY+8tuTPGqXqbXHfup9KH90=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fJwZQlJsnMiSfZIlOizxrilzkBZz7exxuPyeBUE+ppFFDfzYKFNi6vcVdg+lyNtDa
	 KmdZYJm5DOOZgCpSlpQZrgeFfKD+1C4gfdJFiZiSRhVNwLNf0ci9EguPOdEhr3PaSb
	 nbk7+IZRhRJYbwXBiBuQS9kJ/054i+iRniIaE4AE=
Message-ID: <efa6f286-ea5d-4a94-9fb8-65ece584532c@arm.com>
Date: Fri, 18 Sep 2026 18:21:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] firmware: smccc: Add support for Live Firmware
 Activation (LFA)
To: Mark Rutland <mark.rutland@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Salman Nabi
 <salman.nabi@arm.com>, Vedashree Vidwans <vvidwans@nvidia.com>,
 Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
 Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
 Varun Wadekar <vwadekar@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20260706134455.132091-1-andre.przywara@arm.com>
 <20260706134455.132091-3-andre.przywara@arm.com>
 <20260717-bipedal-courageous-alpaca-4fb54d@sudeepholla>
 <84f0862c-5333-4d53-b882-79b8e4c362ed@arm.com> <aq1KjzpIGuSpsPWx@J2N7QTR9R3>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <aq1KjzpIGuSpsPWx@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mark,

On 9/18/26 16:28, Mark Rutland wrote:
> On Fri, Sep 18, 2026 at 11:13:19AM +0200, Andre Przywara wrote:
>> On 7/17/26 11:03, Sudeep Holla wrote:
>>> On Mon, Jul 06, 2026 at 03:44:42PM +0200, Andre Przywara wrote:
> 
>>>> +/* A list of known GUIDs, to be shown in the "name" sysfs file. */
>>>> +static const struct fw_image_uuid {
>>>> +	const char *name;
>>>> +	const char *uuid;
>>>> +} fw_images_uuids[] = {
>>>> +	{
>>>> +		.name = "TF-A BL31 runtime",
>>>
>>> This doesn't make any sense to me. Why do you want kernel to assign
>>> some random name base on UUID. Userspace is well place to deal with
>>> UUID and give it any fancy name it wants.
>>
>> Well, the whole interface is quite usable without any accompanying user
>> space tools, so just from the shell, but then identifying  firmware
>> components by their GUID becomes a major pain and leaves users completely
>> clueless.
>> And while we indeed will never be able to fully catch up with all the
>> firmwares out there, especially not with vendor specific ones, there are
>> some standard firmware components that I think warrant some name.
>> TF-A BL31 above (and TF-RMM) are good examples: these GUID is already in the
>> mainline repository, and since BL31 is also an LFA agent, it's quite likely
>> we encounter this component. Even when vendors typically use downstream TF-A
>> ports, those GUIDs would stay the same.
>> So yes, it's more opportunistic than complete, but I think it would help to
>> identify at least those well-known firmwares. Anything not named then would
>> use the GUID, and can indeed be resolved by (a yet-to-be-written) userspace
>> component.
> 
> Sudeep is right; this is not a good idea.
> 
> Remove the table and just expose the UUID of the image. Users can map
> that to a string in userspace if they need/want, and that'll work
> regardless of the vintage of kernel they're using.
> 
> I appreciate it might seem helpful to expose a name where we know it,
> but overall it creates more problems, including (but not limited to)
> compatibility issues, needless busywork to add entries (and arguments
> about what is approriate to add), political issues when some project
> naming changes, etc.

Fair enough, and honestly I was expecting something like this. I just 
wanted to offer some compensation for the spec forcing me to put GUIDs 
on you.
By now I can remember that the TF-RMM GUID starts with "6c", I guess 
that needs to suffice now ;-)

Cheers,
Andre

> I am not going to Ack this with the name present, and I suspect neither
> will Sudeep.
> 
> Mark.

