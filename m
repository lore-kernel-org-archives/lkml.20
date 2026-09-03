Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D29D19F121
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441400; cv=none; b=TLLj0hdj3EAKJ3VVEsZsAFmmEt+PBQu0Rd30rIhMF21+iEQJpzAZ15PsonvUjvbAp+1H3iSUNrlZu/a21HCFKB3OzejuDrf1cpkY0a0eehCXzU8NhMFMSOBZ5u9ELYVQI92wzi/j0eBFxooSag6lZfvKt358gmMPgBUxuUSGEh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441400; c=relaxed/simple;
	bh=XfAY/dZHTsqXVY4mLyR6AY5GGRW5FNCmoCd9yLOCUwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RiZYGWCvE+7kHJUfc+pLNSv4/SHH23MxDob8UEnIfpnynhst4k+IxyU6nxEdt39699PVlHPnlniQ2puqz6wCjreVjbhpE5/K2UzOZYACOXXQoSaZXU67IjAafBlcNL1iFFnLd1GkmGMokdSPXlC94CTKFdC59hSswxBM8ls07TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ksB9jG1K; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ksB9jG1K"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45AD11596;
	Thu,  3 Sep 2026 06:16:18 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B178B3F7D8;
	Thu,  3 Sep 2026 06:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788441382; bh=XfAY/dZHTsqXVY4mLyR6AY5GGRW5FNCmoCd9yLOCUwU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ksB9jG1K5Igbwua9Lq+7o89W3WiRuaXHMA7h/OT0RgqaHy/eYY9L9iOAJDlelPh0K
	 vlsA9J+tdjeSwerzPHWoU/wMImxZqn9Euy9NDNnwS8Rk9UUzzDWr3r7gBDMjb1yeO5
	 YBOB7zbvUkNThtcfEh5o0VDAiOg/fITDdeAJIyRE=
Message-ID: <03055fbc-281f-4ed9-9282-4853d560e17f@arm.com>
Date: Thu, 3 Sep 2026 14:16:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/resctrl/mpam_devices.c:1860:35-38: WARNING: Suspicious
 code. resource_size is maybe missing with msc_res
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 kernel test robot <lkp@intel.com>, James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 Zeng Heng <zengheng4@huawei.com>, Shaopeng Tan
 <tan.shaopeng@jp.fujitsu.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>, Gavin Shan <gshan@redhat.com>
References: <202609030809.ObirDhR3-lkp@intel.com>
 <555e6b9d-cff8-ef10-42e9-5e469550292b@linux.intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <555e6b9d-cff8-ef10-42e9-5e469550292b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On 03/09/2026 12:02, Ilpo Järvinen wrote:
> On Thu, 3 Sep 2026, kernel test robot wrote:
> 
>> Hi Ben,
>>
>> First bad commit (maybe != root cause):
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   89a312991dc6e638a36adc43ccb91dbc25504c04
>> commit: c544f00a473239835d22e7109b403314d8b85974 arm64: mpam: Drop the CONFIG_EXPERT restriction
>> date:   5 months ago
>> config: arm64-randconfig-r051-20260902 (https://download.01.org/0day-ci/archive/20260903/202609030809.ObirDhR3-lkp@intel.com/config)
>> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2c2cffa015e9549aafba9e514384b08204c7cc4b)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Fixes: c544f00a4732 ("arm64: mpam: Drop the CONFIG_EXPERT restriction")
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
>>
>> cocci warnings: (new ones prefixed by >>)
>>>> drivers/resctrl/mpam_devices.c:1860:35-38: WARNING: Suspicious code. resource_size is maybe missing with msc_res
>>
>> vim +1860 drivers/resctrl/mpam_devices.c
>>
>> f04046f2577a5c James Morse 2025-11-19 @1860  		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
> 
>> :::::: The code at line 1860 was first introduced by commit
>> :::::: f04046f2577a5c76167333ca99d3903ee5331ba0 arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate
>>
>> :::::: TO: James Morse <james.morse@arm.com>
>> :::::: CC: Catalin Marinas <catalin.marinas@arm.com>
> 
> Hi all,
> 
> This report has some validity but the code doesn't look buggy as is, just 
> off-by-one errors correcting each other. The variable is called "..._sz" 
> (~ size), but the resource size calculation is off-by-one because trying Arm A-profile Architecture Hi 
> to do it by hand instead of using the resource_size() helper.
> 
> The mapped_hwpage_sz value is only used for register write offset 
> sanity checks, which use > countering the off-by-one error.

Ah, yes, thanks for pointing this out. mapped_hwpage_sz is a misleading name as it really indicates
the last byte mapped and so it is functionally correct when used with >.

> 
> IMO, it would be better to use resource_size() and change those sanity 
> checks to use >= instead of > but this doesn't look a major problem by 
> any means.

Agreed. Looking back I fixed the functional bug in v6 (changed >= to >) of the original mpam driver
posting but left it in a confusing state.

Thanks,

Ben

> 

