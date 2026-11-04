Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791148;
	b=oGUp+d2tTXaNmBGb8lW+FBqGm4I5a/d2TW6xt+qPYMwTt3KsOLshLOtrBtW8Pijmieod
	 KKQD0m2Kui+HOyH5bIgt049/ztufxESNHSBtiSs/jp3T4P7kAwBUrZWXbDbpV6WPQBk1C
	 TzZHkvTjAM9mJ2fAcNUV7b8tH+z267yd2ai+EPk5vd1R19Qw+lFhYSc6hlRAvpFiLDebc
	 aaL2FiNE8v54R7mBNQmcroqHkQyFv1ljo29KmLKK0bYznNSJ+9sRKWZP1y77zgdpTgg6O
	 4ok2aA4sYzJIAGXNkB9aJ3M95avQRTsTf/TzZCjYFwF5Kba8QamRC7bEiX2OmQyvoLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791148;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=XZJjulc9eC2Fef615j91pRgqzgY9in4xbBQCdTQZsjs=;
	b=Nmpte9S/S2WvcBoMk8GIJFAvyFQdLdZ3a2XCSdkSJ9rvIA/f8PpLibFlY5xdtqfTnLrR
	 9HdpxN6GUyGTzGl3hQLU9vKeFdaG0bLwphw+7+ZTRP63m+Gvxi+V1Bla4e/sG/YFnu75L
	 zbt17EWQ9zu+5qUOkMSp/BVnAW3NcskCwOiZ+fpe82LlzZngrddXYBvHTvUOgyhoOokuQ
	 af2bb+1gb3d55ECcaFzGIhs6e4mkK7MqE0PrBS4FAH9iwHAOes2hK57PKmlmO19lnedfq
	 3Eai1cZmFOn4I2tWKNoO62aDkCjyNrKvYBFvx0BCLwJ33eTQTR+9WtP4oWcJEpWufEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FmETS+WD;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6D5606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A6D5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FmETS+WD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C362B1576;
	Wed,  4 Nov 2026 03:19:03 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE4FE3F632;
	Wed,  4 Nov 2026 03:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793791146; bh=+Gg1IlVsuPqoi6TzyejboQL7M1kxWf7eEKSdkYy3a5s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FmETS+WDer/mEeQGarSpt9aR/XDxHyIfvyFacEqy3082LqIMho+elaQYjK8R593Cz
	 vOpawPRQjb5wVQRnlV2ln2h8xIONCSwXdJCiBIXOF1tMYtEej+58eMz8h/UhCO7kOE
	 IYIdz81lAl6tw1nsIzkZyG6iyBKSI6TlRNukN06U=
Message-ID: <33d55cde-9dc1-4d61-8053-f1c1a2e95179@arm.com>
Date: Wed, 4 Nov 2026 11:19:04 +0000
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
Subject: Re: [PATCH] arm64: cacheinfo: Simplify init_cache_level()
To: Thorsten Blum <blum@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261104083632.65715-2-blum@kernel.org>
 <0534c6f4-3bb8-4249-816c-502cf8ccb287@arm.com> <ausSAhn0qRagNcrz@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <ausSAhn0qRagNcrz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thorsten,

On 04/11/2026 11:07, Thorsten Blum wrote:
> Hi Ben,
> 
> On Wed, Nov 04, 2026 at 10:32:58AM +0000, Ben Horgan wrote:
>> Hi Thorsten,
>>
>> On 04/11/2026 08:36, Thorsten Blum wrote:
>>> acpi_get_cache_info() already sets fw_level to 0 on failure, so drop the
>>> redundant check and the manual assignment.
>>
>> This doesn't seem to be the case when CONFIG_ACPI_PPTT is not defined. Can the dummy implementation
>> in include/linux/cacheinfo.h be called from init_cache_level()? For the implementation in
> 
> On arm64, ACPI_PPTT is selected when ACPI is enabled. When ACPI is
> disabled, acpi_disabled = 1 and init_cache_level() won't call the stub.

Ok, that's true.

> 
>> drivers/acpi/pptt.c levels is documented as "Number of levels if success." and so would be good to
>> mention what happens in the error case if it needs to be relied on.
> 
> Below the parameter descriptions, it already says:
> 
>   "Errors caused by lack of a PPTT table, or otherwise, return 0
>    indicating we didn't find any cache levels."

Ah yes, I should have read on.

Thanks,

Ben

> 
> Thanks,
> Thorsten

