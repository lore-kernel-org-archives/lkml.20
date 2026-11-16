Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829408;
	b=uMNi1n/5z0bwswoZi7/EbE6fWw2LBj/NByPXZc27OfY28Av7JbWydxFXDghZ/LA9KeYq
	 f9OmT9VzwvLI0UEOjJonortFq5Kr8k0QtTUZwbDIBBPlqmdheqfZvJN5GoGsyy+lE/BSL
	 Rfz4GiteFqI2J0Mpz1h8KEW+yqu94ZcAb725bVv4VgzITOHn9MB2A6xHcN7ueSqK+Z4aH
	 scJ1FXYVX7BCtDwlIlt/utHqjtw3PFEA6M2XlgKZEY2RcoKaEzxeHcciV+nUzNBYrdgDH
	 1Pn1p4htiPeu13MsrWOWV7yaTgjdjJiu9BnwEq6TtRBbSweW6jf23DM14nWILrYswbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829408;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UNxB/MAdt+gBiYZi9+h90GfQPjbz1uTEcNanTmhdqdE=;
	b=1hfJC0I0b9nUlkmSpSGHYzoQdcV8A6ZT9eExk1AcE1dXgnKdiuA8W/Cgh2OwgRO97UCK
	 b5TcCm+rTvTIhLPFJse4t9DUdNRqJg70keIGG8EucWAkz+uUqal5OcBsS/j7XoGFgDZ1S
	 QWvCMkZwAZunrNrCGYTo71wJcJWCCkLFhkfzFBvjdL2pnpTQvxGkDLNkqQz6Re6JOBzou
	 xsG6nT0U17T02BjS6r+gupmtqtFSwM5FxT9JCVF/BLLG2dnk+ndPf/QkQeLfBgdc7Rgvv
	 gP/MZhbausURDDFZJY3GQhKO8GYBc+TDml7S1MI4q4iX0aBys3veEMfHVvt5idPgvtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=m84TdWAv;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2478606A31C;
	Mon, 16 Nov 2026 11:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2478606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=m84TdWAv
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06E321713;
	Mon, 16 Nov 2026 03:43:24 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19B573F632;
	Mon, 16 Nov 2026 03:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794829407; bh=2dyLKEkAWPNPtKzCqr1huVrQGEVlKrXOa1GPJW7iyfg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m84TdWAvepZygknD58SVmSIjo9SB9pJmQGTt8FEz7wVT920JL2MMhtA+0GXuDWJ0V
	 lmOmfsbH9OFahhY8mUlFV7TuCeDEIRUsA5KLAxVub01U89PBCmp9PDPJ+rAOlANWCh
	 0HbYRTNYuoy8kSyzsZVmB5kMk252B2SN/+eebnPI=
Message-ID: <e621c3a7-5633-4d03-9494-a6fa45daea02@arm.com>
Date: Mon, 16 Nov 2026 11:43:23 +0000
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
Subject: Re: [PATCH v18 5/8] qcom-tgu: Add TGU decode support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
 konrad.dybcio@oss.qualcomm.com, james.clark@arm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 songchai@qti.qualcomm.com, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
 <20261116074118.822731-6-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261116074118.822731-6-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/11/2026 07:41, Songwei Chai wrote:
> Decoding is when all the potential pieces for creating a trigger
> are brought together for a given step. Example - there may be a
> counter keeping track of some occurrences and a priority-group that
> is being used to detect a pattern on the sense inputs. These 2
> inputs to condition_decode must be programmed, for a given step,
> to establish the condition for the trigger, or movement to another
> steps.
> 
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>   drivers/hwtracing/qcom/tgu.c                  | 200 +++++++++++++++---
>   drivers/hwtracing/qcom/tgu.h                  |  35 ++-
>   3 files changed, 214 insertions(+), 28 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 3be0b912c937..c7e6f13da83d 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -14,3 +14,10 @@ KernelVersion:	7.5
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the sensed signal with specific step and priority for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
> +Date:		November 2026
> +KernelVersion:	7.5
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the decode mode with specific step for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 917d506cddf9..1809cca4a94f 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -18,8 +18,8 @@
>   
>   struct tgu_attribute {
>   	struct device_attribute attr;
> +	enum operation_index operation_index;
>   	u8 step_index;
> -	u8 priority;
>   	u8 reg_num;
>   };
>   
> @@ -27,11 +27,36 @@ struct tgu_attribute {
>    * drvdata->priority is a flat [priority][step][reg] array.
>    */
>   static int calculate_array_location(struct tgu_drvdata *drvdata,
> -				    int step_index, int priority,
> +				    int step_index, int operation_index,
>   				    int reg_index)
>   {
> -	return priority * (drvdata->num_step) * (drvdata->num_reg) +
> -		step_index * (drvdata->num_reg) + reg_index;
> +	switch (operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		return operation_index * (drvdata->num_step) *
> +			(drvdata->num_reg) +
> +			step_index * (drvdata->num_reg) + reg_index;
> +	case TGU_CONDITION_DECODE:
> +		return step_index * (drvdata->num_condition_decode) +
> +			reg_index;
> +	default:
> +		break;
> +	}

 > +
 > +	if (result == -EINVAL)
 > +		dev_err(drvdata->dev, "check array location - Fail\n");

see more below

> +
> +	return -EINVAL;
> +}
> +
> +static int check_array_location(struct tgu_drvdata *drvdata, int step,
> +				int ops, int reg)
> +{
> +	int result = calculate_array_location(drvdata, step, ops, reg);
> +
> +	if (result == -EINVAL)
> +		dev_err(drvdata->dev, "check array location - Fail\n");
> +
> +	return result;

Could we not fold this check in to calculate_array_location as shown
above ?



...


> index d769379b8421..7d88ad8e730f 100644
> --- a/drivers/hwtracing/qcom/tgu.h
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -16,7 +16,8 @@
>   	((int)FIELD_GET(GENMASK(17, 10), devid_val))
>   #define TGU_DEVID_STEPS(devid_val) \
>   	((int)FIELD_GET(GENMASK(6, 3), devid_val))
> -
> +#define TGU_DEVID_CONDITIONS(devid_val) \
> +	((int)FIELD_GET(GENMASK(2, 0), devid_val))
>   #define TGU_BITS_PER_SIGNAL	4
>   #define LENGTH_REGISTER		32
>   
> @@ -44,6 +45,7 @@
>    */
>   #define STEP_SIZE		0x1D8
>   #define PRIORITY0_OFFSET	0x0074
> +#define CONDITION_DECODE_OFFSET	0x0050

nit: s/CONDITION_DECODE_BASE	0x50

>   #define PRIORITY_STRIDE		0x0060
>   #define REG_SIZE		0x4
>   
> @@ -54,6 +56,7 @@
>    *
>    *   TGU_MAX_STEPS         matches the static step0..step7 sysfs tables.
>    *   TGU_MAX_PRIORITY_REGS matches the static reg0..reg23 sysfs tables.
> + *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
>    *
>    * Each priority level's block spans a full PRIORITY_STRIDE (0x60 bytes),
>    * i.e. PRIORITY_STRIDE / REG_SIZE = 24 registers, all of them implemented.
> @@ -61,15 +64,40 @@
>   
>   #define TGU_MAX_STEPS                  8
>   #define TGU_MAX_PRIORITY_REGS          24
> +#define TGU_MAX_CONDITION_DECODE       4
>   
>   /* Maximum priority that TGU supports */
>   #define MAX_PRIORITY                   4
>   
> +/*
> + * Values for struct tgu_attribute.operation_index: TGU_PRIORITY0..
> + * TGU_PRIORITY3 select a priority level, TGU_CONDITION_DECODE selects the
> + * condition decode registers instead.
> + */
> +enum operation_index {
> +	TGU_PRIORITY0,
> +	TGU_PRIORITY1,
> +	TGU_PRIORITY2,
> +	TGU_PRIORITY3,
> +	TGU_CONDITION_DECODE,
> +};
> +
>   /* Calculate compare step addresses */
>   #define PRIORITY_REG_STEP(step, priority, reg)\
>   	(PRIORITY0_OFFSET + PRIORITY_STRIDE * priority +\
>   	 REG_SIZE * reg + STEP_SIZE * step)
>   
> +#define CONDITION_DECODE_STEP(step, decode) \
> +	(CONDITION_DECODE_OFFSET + REG_SIZE * decode + STEP_SIZE * step)

Please

#define CONDITION_DECODE_OFFSET(step, reg)		\
	(STEP_OFFSET(step) + CONDITIION_DECODE_BASE + REG_SIZE * reg)


> +
> +/*
> + * Neutral ('NOT') value for the condition decode registers. This is the
> + * driver's default so that, before userspace programs a real decode, an
> + * enabled step does not spuriously match. Used both when seeding the shadow
> + * table at probe and when clearing it via reset_tgu.
> + */
> +#define TGU_CONDITION_DECODE_NOT 0x1000000

minor nit: TGU_CONDITION_DECODE_DEFAULT 0x1000000 ?



> +
>   /**
>    * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
>    * @base: Memory-mapped base address of the TGU device
> @@ -79,8 +107,11 @@
>    * @enabled: Flag indicating whether the TGU device is enabled
>    * @priority: Per-step, per-priority-level, per-register values staged by
>    *            sysfs writes and flushed to hardware by tgu_enable()
> + * @condition_decode: Per-step, per-register decode values staged by sysfs
> + *                     writes and flushed to hardware by tgu_enable()


>    * @num_reg: Number of priority registers implemented per priority level

This now looks awkwardly generic with other registers coming in. Should
we name it num_prio_regs from the beginning ?

Suzuki

>    * @num_step: Number of steps implemented
> + * @num_condition_decode: Maximum number of condition_decode
>    *
>    * This structure defines the data associated with a TGU device,
>    * including its base address, device pointer, the lock serialising
> @@ -92,8 +123,10 @@ struct tgu_drvdata {
>   	struct mutex lock;
>   	bool enabled;
>   	unsigned int priority[TGU_MAX_STEPS * MAX_PRIORITY * TGU_MAX_PRIORITY_REGS];
> +	unsigned int condition_decode[TGU_MAX_STEPS * TGU_MAX_CONDITION_DECODE];
>   	int num_reg;
>   	int num_step;
> +	int num_condition_decode;
>   };
>   
>   #endif

