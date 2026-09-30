Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEEA45D91B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764180; cv=none; b=QziNL0ZB8w/NaIRNrx42tSeO/tCETrgc70O1TdJdvL9bP8jD57qBFXln2AVT9RlT9Fdw6jsRd/+ALJsrod7NwrvhYw09IALOMIqoX4geDrqpzAoWAsnzuhYv8w10BxdXIcOeJoJrNhE23QTYNstxpcetyhAAaS1Rx9bmOT0wpi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764180; c=relaxed/simple;
	bh=354FuxQY+sQozxNR2AGes4Xx8/+Rf12j8Kz3IeEK6eU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eh16AAs3W7xmFzg4LJzWKB09cskuZaNTN4V2GmVGTI5EQ73IqNSDNqrK1R6C+qiYlgX1dN+aeHq8YTINVDNDmTpP2PrCMrU57fzP0E/cCpw4c4KhSA5qjbJfMX2NJjR24hWIq2BePP9ZOHBbCHI3fCOpyNwNmoYUObhCmt18Nng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=LDRnzcOT; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="LDRnzcOT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=2cSTnnYtXnI4f0/RxiMP0j8RqZugNSFCAZhfvF0LPeU=; b=LDRnzcOTu7sQkXXxx/hW/Rgdsl
	MB8t7ZeZwYpOBXW1ZNlD7sE/E57HSv6hJ+FiFEB+EBDwoO2slvsBLkeHMeODUMRBifvjI2o92O5hf
	HboYLErQKlUTsEIiYG4Hoa1pLqgJJzBcpTBlzWyQmr39NlZDmxrSWMGQ5/YYmeZ4ir12PqyqrC0Ug
	X3Cnan2BytuIQGCbwfp4FRHNA3p6wtgCL56FyrrNAGboZbdi7N74ob1+CB05Us6Pcdxu7fMgkDBSx
	frN0C71zzGRDG+JX27+44ZF74nE4DjLafWj+fDZgRkBFwTcWOOsIkNj2Tn2E43CfWxwtO0A4M2SIQ
	rVhDA0pg==;
Received: from [177.172.123.214] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xBrZ1-009Nib-Mz; Wed, 30 Sep 2026 12:29:27 +0200
Message-ID: <00227dc1-e01c-4de8-b3e3-3cd8de74cba9@igalia.com>
Date: Wed, 30 Sep 2026 07:29:22 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/1] arch: arm64: Implement unaligned atomic
 emulation
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Billy Laws
 <blaws05@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Mark Brown <broonie@kernel.org>, Ryan Houdek <sonicadvance1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20260930020138.2377090-1-andrealmeid@igalia.com>
 <20260930020138.2377090-2-andrealmeid@igalia.com>
 <ary-2rOs_b2IY6M1@willie-the-truck>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <ary-2rOs_b2IY6M1@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Will, thanks for the quickly reply,

Em 30/09/2026 04:48, Will Deacon escreveu:
> On Tue, Sep 29, 2026 at 11:01:38PM -0300, André Almeida wrote:
>> Implement support for emulating unaligned atomic operations on arm64.
>> User applications that wish to enable support for this should use the
>> pctrl() flag `PR_ARM64_UNALIGN_ATOMIC_EMULATE`.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>>   arch/arm64/Kconfig                   |   6 +
>>   arch/arm64/include/asm/exception.h   |   1 +
>>   arch/arm64/include/asm/processor.h   |   5 +
>>   arch/arm64/include/asm/rwonce.h      |  14 +-
>>   arch/arm64/include/asm/thread_info.h |   1 +
>>   arch/arm64/kernel/Makefile           |   3 +-
>>   arch/arm64/kernel/process.c          |  15 +
>>   arch/arm64/kernel/unaligned_atomic.c | 521 +++++++++++++++++++++++++++
>>   arch/arm64/mm/fault.c                |  10 +
>>   include/uapi/linux/prctl.h           |   5 +
>>   kernel/sys.c                         |   7 +-
>>   11 files changed, 579 insertions(+), 9 deletions(-)
>>   create mode 100644 arch/arm64/kernel/unaligned_atomic.c
> 
> No.
> 
> I already explained to you why this doesn't work:
> 
> https://lore.kernel.org/r/aV1YnOetDHhKe4hz@willie-the-truck

Indeed, last time you raised some points, and then Ryan replied them. Is 
there any specific point that doesn't work? I couldn't find a reply for 
Ryan's answers:

https://lore.kernel.org/all/CABnRqDf5EQUoXu=pJ6mj4-JfwAzEfcAE2cYrNzJANFycx7cMUA@mail.gmail.com/

> 
> Will

