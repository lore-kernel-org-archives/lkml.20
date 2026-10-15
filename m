Received: from mta1.migadu.com (out-53.mta1.migadu.com [95.215.58.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDC619644B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792108408; cv=none; b=oNj2tPJznzfHknNn6ehj/SmgPiUDzNA6mkBgeDg1HG8wyRIY1sQoWlN33+nlBLI1juNWGFqQkvN8ZB1PTNX8c18I5Y0ywOF3EXL7iJMz6CGh/VEAYsxhTNvav6+zoo6G3oI+pAv7XuxLdeCspVgSsFCe37KsPidGQAlwVIpg5N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792108408; c=relaxed/simple;
	bh=FUpPXYfowSCUWW1Ifzz/TsytpfqsjiAGpIISXAFBqd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ihvb8s05vc/AClU4LcWuwtU51q5qynUVoP+Dz3oM5llM25yg2Rbifynt79G/0nDKJaboL1gZjGQaTR8lNMDAQvmf2H2CdBLT8a4gjI6dQFEh+GW+PRmPO6KHRXcDfnxRxWa5kIn/pY5gQVuDCTYZgaDlXDTrQ/YYSdsNXKELIL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AQQXNutf; arc=none smtp.client-ip=95.215.58.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AQQXNutf"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FUpPXYfowSCUWW1Ifzz/TsytpfqsjiAGpIISXAFBqd8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792108405; v=1; x=1792713205;
 b=AQQXNutfkRkIXiAz2kaY/Dh/VVSJtlpQ7ZXCg4PeYmoCAZjDgCDVmjcx5Z2MrmsrqJCVLGtr
 Zu+pgb4L0xXWqybaN2eUM78GLNVJxbmkGlhCM+vm7nh6j5LR1kYVQtr+iS/T9oyBp7fstCR8eYR
 ZC1c1sqIWlnIgX1RWjDkfp6Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ba4637d7c08d0e1a;
	Thu, 15 Oct 2026 23:53:24 +0000
X-Mizu-Trace-ID: ba4637d7c08d0e1a
X-Migadu-Flow: FLOW_OUT
Message-ID: <7033a6bb-333f-4734-a3be-42b3f943d31a@linux.dev>
Date: Fri, 16 Oct 2026 07:53:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
To: Inochi Amaoto <inochiama@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
 <fa4253c7-3b17-4b20-97b9-eb37f218a4c8@linux.dev>
 <atCV8NsJc5Oatoo0@inochi.infowork>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <atCV8NsJc5Oatoo0@inochi.infowork>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/15/2026 5:03 PM, Inochi Amaoto wrote:
> On Thu, Oct 15, 2026 at 02:43:40PM +0800, Chen Wang wrote:
>> Hello,
>>
>> On 10/14/2026 3:45 PM, Inochi Amaoto wrote:
>>> Sophgo SoCs such as SG2044 contain eFuses used to store
>>> factory-programmed data.
>>>
>>> As for SG2044, HW automatically loads the eFuse content
>>> into shadow registers which are organized as 32bit values
>>> exposed as MMIO.
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
>>> ---
>>>    drivers/nvmem/Kconfig        |  12 +++
>>>    drivers/nvmem/Makefile       |   2 +
>>>    drivers/nvmem/sophgo-efuse.c | 176 +++++++++++++++++++++++++++++++++++
>>>    3 files changed, 190 insertions(+)
>>>    create mode 100644 drivers/nvmem/sophgo-efuse.c
>>>
>>> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
>>> index c36c2a4c2a0b..a7936dd65bdd 100644
>>> --- a/drivers/nvmem/Kconfig
>>> +++ b/drivers/nvmem/Kconfig
>>> @@ -465,6 +465,18 @@ config NVMEM_SNVS_LPGPR
>>>    	  This driver can also be built as a module. If so, the module
>>>    	  will be called nvmem-snvs-lpgpr.
>>> +config NVMEM_SOPHGO_EFUSE
>>> +	tristate "Sophgo eFuse support"
>>> +	depends on ARCH_SOPHGO || COMPILE_TEST
>>> +	default ARCH_SOPHGO
>>> +	help
>>> +	  Say y here to enable support for reading eFuses on Sophgo SoCs
>>> +	  such as the CV1800B. These are e.g. used to store factory programmed
>> Why is "CV1800B"?
>>
> This is an old mistake, this patch follows Jishengs's patch in the first
> design. But then almost everything changed and only thing for SG2044 left.
> This is the thing that is left to change.
>
> I am not sure whether it should keep this generic name as I see it should
> be compatible for most sophgo SoCs (at least it should be for CV1800X,
> by just change offset). Feel free to give if you have some suggestion for
> a better name

I raise this point because the subject of your patch indicates it is 
intended for the SG2044.

If you are simply using it as an example （"such as ..."）, then 
specifying "SG2044" is sufficient, even though, based on your current 
explanation, it would also apply to other Sophgo chips, such as the CV1800X.

>
> Regards,
> Inochi
