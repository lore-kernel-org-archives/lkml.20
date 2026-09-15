Received: from mta0.migadu.com (out-52.mta0.migadu.com [91.218.175.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091ED439F98
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499336; cv=none; b=OcOOXArbJmJ1T/eGwWdR79CDfN9B8c/dP0m6nXrqaZh9gZ7O8+2T2tv6G9v5P4iU6i5dd6vD3LpXKLO4zEeViRmGMW+XaUEJP0Uzpg5YIfgwGd+jmXmpF2EkPNUD68qYWyFbBV5ScsBJSXzklutTqNIFXrdq3lfQgoQlsC++aXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499336; c=relaxed/simple;
	bh=VQQ+E7fwYAhs6gRE7dYaQzVwEKGiE/fSgj1srDgmMNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XburxSbz+jJBkYTWMCr0M8LHByetmi8mkx6eVouBmHt6urECIvbtK/IjxKj4msqRlcB94k8twu4X/BCJwgSgpFDV2N3c4AeR9o6ydj4GHkB6PVdiNyOLJVFOIni5f9xobGJHsJZKFvEIVqAt+g7TzMKH5atyR0mYR44NgkQ7zpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uDCeocEo; arc=none smtp.client-ip=91.218.175.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uDCeocEo"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VQQ+E7fwYAhs6gRE7dYaQzVwEKGiE/fSgj1srDgmMNs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789499333; v=1; x=1790104133;
 b=uDCeocEoM3X7f4bx5GbMkErpIZZcWNTiALHwK3gxYdtG5SQbKwoN2HvC7gQP0einLH7x+vPA
 28asMCIMr8IsCf2BH/ulWt9J0dcm+by2QpCjodBQrcDGDze/a51BrasWNHKl0Xw36cPSLvYK/jn
 AKbHs4ECIxXAwRRk6RscYiu0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 15aa06455678b3d5;
	Tue, 15 Sep 2026 19:08:53 +0000
X-Mizu-Trace-ID: 15aa06455678b3d5
X-Migadu-Flow: FLOW_OUT
Message-ID: <6e00e449-6525-4200-bcac-ffb696204208@linux.dev>
Date: Tue, 15 Sep 2026 20:31:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soundwire: allow drivers to check whether the
 peripheral is present
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com,
 linux-sound@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 tiwai@suse.de
References: <20260915131327.1783551-1-yung-chuan.liao@linux.intel.com>
 <20260915131327.1783551-2-yung-chuan.liao@linux.intel.com>
 <f1f14def-8b2f-4b55-89fd-65f1e35d48a8@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <f1f14def-8b2f-4b55-89fd-65f1e35d48a8@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/26 19:32, Cezary Rojewski wrote:
> On 9/15/2026 3:13 PM, Bard Liao wrote:
>> A ghost peripheral may be listed in the ACPI table and we want to skip
>> it. Add enumeration_complete and is_present in struct sdw_bus{} allow
>> the driver to wait and check whether a peripheral is present.
>>
>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>> ---
>>  drivers/soundwire/bus.c       | 7 +++++++
>>  include/linux/soundwire/sdw.h | 5 +++++
>>  2 files changed, 12 insertions(+)
>>
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index aeaae5a57c89..b49864ca683a 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -161,7 +161,13 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
>>  	bus->params.curr_dr_freq = bus->params.max_dr_freq;
>>  	bus->params.curr_bank = SDW_BANK0;
>>  	bus->params.next_bank = SDW_BANK1;
>> +	/*
>> +	 * Set is_present = true by default. It will be set to false when no peripherals
>> +	 * are attached on the bus.
>> +	 */
>> +	bus->is_present = true;
> 
> Does the approach permit existence of non-ghost, SDW master instance
> with no codecs attached?

Also wondering how the 'mockup' codecs would be handled? That's very
useful to test a manager with no actual codecs attached.
> 
>> +	init_completion(&bus->enumeration_complete);
>>  	return 0;
>>  }

