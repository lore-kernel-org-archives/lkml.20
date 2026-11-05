Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889134;
	b=fzMq5XpdjOpTKqvSFspZDdlbOIHGv0dd6dGwd1a64x+jxbr4dPTJHF06ICeOD3s9Vvc6
	 6YN8bBlkWBrh+DEAzXwZ8JM32tCC63PdymAjaC9bBAD3uoXRzTWuX5SmgJrLWQNMIVyEH
	 9nMf2uB4VKocbWv4yqdRO+fcVb3datIIqTKvB3I6pPkArD0Glwe1IfFKEUoT9h8gAIwyD
	 KlAp3Gx9GfXf5lYx3AdXoN4RzPGCe2iofggI0TCjSQFpgPd7QRc4vKL5cAGQPmolkzYnF
	 qkaznv7nd37yLDDq7DmTJQI89alOB+GKti7CVfDXVBnLGQUX7D1opwIVLcQcYzjYf6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889134;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aMbPFbhM0NGfaTpsyfc09N2QKzH+fJPg2tPLJvKIlQs=;
	b=02R85S3QXurR+/97sBwovucnabyEC6SmUZJG7Mpry8PzWpSXYQqaLiwoUOxi4MwsQvQD
	 3/pba8HPS+IQ9miVOH6o75TY1l9v59gXeUDKvnH8Y5c7tGW8uCL+qWRTD6g4Ho57k0d8a
	 NWaB7g2Lv8g029Kx97ZsLLQkV8HTO8rySfF/EpEk2u5M0hqPShl5zG/j+cu1M9u43OGgJ
	 StNzpb1qSXRPmHNXhf5P8zP+X3MElTKprZ9tT3Ril7guJtW9NlQ0gNiA5BX+x/dnpkpr1
	 vyNBU3lOxo1Uj9qvx33ig1gy9oxKGvXw9g1Xs0Cf/UxtYtKSDM/QozxhXCsxyg0OH+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZPTH2rmt;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75490606A329;
	Thu,  5 Nov 2026 14:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75490606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZPTH2rmt
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB9AC168F;
	Thu,  5 Nov 2026 06:32:08 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95D4C3F673;
	Thu,  5 Nov 2026 06:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793889131; bh=57jqKN7YeDWabQXBzWNtR7fWKF/1HqcWUWZ6tAgNGJ0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ZPTH2rmtS6mwvYND5oNgIMjrGKwroFa6A+v6YjEVh6dYgT3QgjDjgLwb/GuPUp+5b
	 LOn13CSfGE7jXgGZmsAFeqSSeMlcAY9Ksfla1O9LsdUGnQWlvXXbZ1TFpQ3H0fAZl2
	 6P2+yN97IwrXsSv2XlBwlFh5pVFcwbgaccK5ARo8=
Message-ID: <75364e56-62d3-4d3f-bf79-03ddeaee1121@arm.com>
Date: Thu, 5 Nov 2026 14:32:07 +0000
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
Subject: Re: [PATCH v16 3/7] qcom-tgu: Add signal priority support
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
 konrad.dybcio@oss.qualcomm.com, james.clark@arm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 Jie Gan <jie.gan@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-4-songwei.chai@oss.qualcomm.com>
 <9d450f18-2300-4ead-981b-94bd9eea9126@arm.com>
 <f1e4f462-2aba-470d-84e4-87a12c2a13d3@arm.com>
Content-Language: en-US
In-Reply-To: <f1e4f462-2aba-470d-84e4-87a12c2a13d3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/11/2026 14:14, Suzuki K Poulose wrote:
> 
> On 05/11/2026 13:01, Suzuki K Poulose wrote:
>> On 30/07/2026 09:07, Songwei Chai wrote:
>>> Like circuit of a Logic analyzer, in TGU, the requirement could be
>>> configured in each step and the trigger will be created once the
>>> requirements are met. Add priority functionality here to sort the
>>> signals into different priorities. The signal which is wanted could
>>> be configured in each step's priority node, the larger number means
>>> the higher priority and the signal with higher priority will be sensed
>>> more preferentially.
>>>
>>> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>>> ---
>>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>>>   drivers/hwtracing/qcom/tgu.c                  | 189 +++++++++++++++++-
>>>   drivers/hwtracing/qcom/tgu.h                  | 133 ++++++++++++
>>>   3 files changed, 328 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/ 
>>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>> index 36ab64f1e301..7dd24314592d 100644
>>> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>> @@ -7,3 +7,10 @@ Description:
>>>           Accepts only one of the 2 values -  0 or 1.
>>>           0 : disable TGU.
>>>           1 : enable TGU.
>>> +
>>> +What:        /sys/bus/amba/devices/<tgu-name>/ 
>>> step[0:7]_priority[0:3]/reg[0:17]
>>> +Date:        August 2026
>>> +KernelVersion:    7.2
>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>>> <songwei.chai@oss.qualcomm.com>
>>> +Description:
>>> +        (RW) Set/Get the sensed signal with specific step and 
>>> priority for TGU.
>>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>>> index 9c7dd4a09f02..0e88b437f191 100644
>>> --- a/drivers/hwtracing/qcom/tgu.c
>>> +++ b/drivers/hwtracing/qcom/tgu.c
>>> @@ -15,14 +15,144 @@
>>>   #include "tgu.h"
>>> +static int calculate_array_location(struct tgu_drvdata *drvdata,
>>> +                    int step_index, int operation_index,
>>> +                    int reg_index)
>>> +{

>>> +    return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
>>> +        step_index * (drvdata->num_reg) + reg_index;

I am confused by this, probably amplified by the bad naming of num_step,
num_reg ?

I perceive num_step => numbe of steps in the hardware

num_reg => number of registers (or controls) in a given priority field ?

If that is the case, shouldn't the index be :

step_index *  (drvdata->num_step) * (drvdata->num_reg) +
op_index * (drvdata->num_reg) + reg_index ?

...

>>> +
>>> +struct value_table {
>>> +    unsigned int *priority;
>>> +};
>>>   static inline void TGU_LOCK(void __iomem *addr)
>>>   {
>>> @@ -36,6 +163,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>>>    * @lock: Mutex serialising enable/disable and the associated PM 
>>> runtime
>>>    *        reference counting against concurrent sysfs access
>>>    * @enabled: Flag indicating whether the TGU device is enabled
>>> + * @value_table: Store given value based on relevant parameters
>>> + * @num_reg: Maximum number of registers

Where ? in a priority ? in a step ? Why is this maximum ? Isn't it the
number of "registers implemented on this hardware"

>>> + * @num_step: Maximum step size

Number of steps ? not step size ?

Suzuki
>>>    *
>>>    * This structure defines the data associated with a TGU device,
>>>    * including its base address, device pointer, the lock serialising
>>> @@ -46,6 +176,9 @@ struct tgu_drvdata {
>>>       struct device *dev;
>>>       struct mutex lock;
>>>       bool enabled;
>>> +    struct value_table *value_table;
>>
>> Why this ? why not
>>
>>      struct value_table value_table ?
>>
>> Surely, we seem to be dynamically allocating the priorities etc from 
>> there. But do we need dynamic allocation for value_table field as
>> such ?
>>
>> Suzuki
>>
>>> +    int num_reg;
>>> +    int num_step;
>>>   };
>>>   #endif
>>
> 

