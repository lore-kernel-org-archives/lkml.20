Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4FF47F3C5;
	Fri,  2 Oct 2026 13:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949434; cv=none; b=MjyqH4RY9/0E/q9YvNuf7O6WoAXc71oXzlDJAyIoxZF9b+HvIPtt+kQsu/daKM3hTPDaqgqYZufyoso78g2U6523H/vuc1RJtZZanpXtJenCoHnMSnUwfHa9Nzz0jf8UP/BwgT1zLiPj5VnUj1nYXDmnskKPDLIvRK7qovc1AxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949434; c=relaxed/simple;
	bh=L+fVfiRoU5Rocj6JDsGYZYQi34BP/ycGEUuQn0k/teY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t6Ng7l2jZfUPZ4P8I/cQXrAYiEAN+Ji4y1AsuZyEx/X3aevbPw5+4oF8ikPvaz3eNUK/Ol4bg2cK6FFvVO69O5XnJk54f4obp3BerEQBdLe15h503lwbc0Qn0rvL91vbqTUWHawmDkDvsvH2yNyCZ8540h1Y2EhslvkrEuv6Jro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YYTZ88Nh; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YYTZ88Nh"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F325D497;
	Fri,  2 Oct 2026 06:57:08 -0700 (PDT)
Received: from [10.57.55.104] (unknown [10.57.55.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 454853F85F;
	Fri,  2 Oct 2026 06:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790949432; bh=L+fVfiRoU5Rocj6JDsGYZYQi34BP/ycGEUuQn0k/teY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YYTZ88Nh2VPrS5piRUfDbQ9WCTE6LlF7Ec3UTDLDWKAxgBLEHfsR8U2TsUnPzN4J7
	 MYUGn+ihgD7m5jjEEGjlDFP3YlN2TDOZn3aNATjeRP9GyhFuWJcqstFuE9x9dp1myP
	 bsVeveRSoBVURvZ/PdSFdJqoeEdYgn6H6d7bZGTI=
Message-ID: <d7561b18-23ff-42c8-9df7-3947b473f7ae@arm.com>
Date: Fri, 2 Oct 2026 15:57:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] firmware: smccc: lfa: Add timeout and trigger
 watchdog
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
 <20260918141112.2115555-4-andre.przywara@arm.com>
 <20260921-elastic-impartial-pig-ea6b58@sudeepholla>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260921-elastic-impartial-pig-ea6b58@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sudeep,

On 9/21/26 17:36, Sudeep Holla wrote:
> On Fri, Sep 18, 2026 at 04:11:06PM +0200, Andre Przywara wrote:
>> From: Vedashree Vidwans <vvidwans@nvidia.com>
>>
>> Enhance PRIME/ACTIVATION functions to touch watchdog and implement
>> timeout mechanism. This update ensures that any potential hangs are
>> detected promptly and that the LFA process is allocated sufficient
>> execution time before the watchdog timer expires. These changes improve
>> overall system reliability by reducing the risk of undetected process
>> stalls and unexpected watchdog resets.
>>
> 
> I assume this change is separate from 2/8 for authorship purposes.
> Otherwise it should ideally be part of the original driver. It is prone
> to firmware bugs without these changes.

Yes, I was quite torn over this. She genuinely wrote that code, so I 
wanted to give her credit, but I see how it's odd to kind of fix up the 
original patch in the same series.
I am now leaning towards merging this patch into 2/8, and also the SMC 
access lock (7/8), since it's not really safe without them.
But then still keep Vedashree's ACPI patch (4/8) separate, as well as 
the DT patch, and the auto-activate, since they are somewhat optional.

If you have better ideas, I am all ears.

Cheers,
Andre



