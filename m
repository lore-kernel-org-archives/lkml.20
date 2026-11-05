Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891785;
	b=U2QkwAqxpJjy0zIwG3lFqFq0r8pmRNGoo8+TthquxIF5VLWGCeQyS3cYD1wOCflGuqYn
	 PcMPvpgzV5qqPkfP/53MfWXCuHv9W310eEZ2C2ZTVgZsoPjFtLxMZDntmRprLjgWXIn15
	 g+jI782MXuktKz/+mMHm2E/KZ5yWIQRU33ggFuUnfrifCwr3JiS7xRopOZZ0yNR4Z8ahC
	 RBC4W+CZsaWuijWElafNt2GIFpm1bjKAb0NPHXvn4UmffaSPY/ntHatA2AlqZOVRI37YE
	 tIiFS5DLdtaiXOViDJ6lpQPoOtqIIB/wwvf6DMQV528LEgIsbdC0S0FI1GR+xP1XqTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891785;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zsBqpe6S/ZkqCcF6i0frDsc+AJ/VaC3zdslr4QclpdA=;
	b=z/XUMjTUuKNv2fht9y29EQI+Gej1U3YC2VnHqFWA3PrCoIRUxxuYUXf0FnyADInBI0LG
	 f3wxmq0B/wYBrtYl5/55PuXG3W/i+IPyTMvJP4rl/MmN9KtETf0VyJSuFrAlAaSEFv2cI
	 9QOe+6JUeNLfcB/O0ORp2nWG4JQ+D1t+ANenzlGg7N2fMzcAvFttl0mFQwJWBxAzswUBC
	 K3LczQb8qlm0fpIFUPDsspFa0+yULu4ok+MjSTcvwatCtFA7uXG3iUGVND0KLO2mpotiF
	 /cZg3b29+TbPkaCiMSc5CaCBRCekIjG2/6uVProKLcNx7f4afJPDlAlHtJgCpEImH4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="TBWyM//v";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D81606A33D;
	Thu,  5 Nov 2026 15:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D81606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TBWyM//v
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AC75168F;
	Thu,  5 Nov 2026 07:16:21 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 256C13F628;
	Thu,  5 Nov 2026 07:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793891784; bh=9HOBjsTmCAwUaZne9J9i5gK8hMaEBYL3MEcc7QR+Wuw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TBWyM//vhCfqP8ccms1yA/a+sZ9ChHT3E0dRqUGVobuWMExk+33pdHn4A8HZMGqwq
	 H2zbI0mHRz4oOR7ZMOoM+EnV0GZ3pi+OmJZY+duWUrZFcC3p13xw+rNm9vRSHB3oWX
	 j6gfCY3yvM4k5E11TpgG+PaJQ1yIPlTAkuep9RWk=
Message-ID: <45299636-7bd8-4157-aa3f-8d498e81c7d0@arm.com>
Date: Thu, 5 Nov 2026 15:16:20 +0000
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
Subject: Re: [PATCH v16 4/7] qcom-tgu: Add TGU decode support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
 konrad.dybcio@oss.qualcomm.com, james.clark@arm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: Songwei Chai <songchai@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-5-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260730080704.2903540-5-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/07/2026 09:07, Songwei Chai wrote:
> From: Songwei Chai <songchai@qti.qualcomm.com>
> 
> Decoding is when all the potential pieces for creating a trigger
> are brought together for a given step. Example - there may be a
> counter keeping track of some occurrences and a priority-group that
> is being used to detect a pattern on the sense inputs. These 2
> inputs to condition_decode must be programmed, for a given step,
> to establish the condition for the trigger, or movement to another
> steps.
> 
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Songwei Chai <songchai@qti.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>   drivers/hwtracing/qcom/tgu.c                  | 182 ++++++++++++++++--
>   drivers/hwtracing/qcom/tgu.h                  |  37 ++++
>   3 files changed, 206 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 7dd24314592d..705e75c776d4 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -14,3 +14,10 @@ KernelVersion:	7.2
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the sensed signal with specific step and priority for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
> +Date:		August 2026
> +KernelVersion:	7.2

7.5 for the next version , everywhere, please.


> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the decode mode with specific step for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 0e88b437f191..e83295217e7a 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -19,8 +19,33 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
>   				    int step_index, int operation_index,
>   				    int reg_index)
>   {
> -	return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
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
>   }
>   
>   static ssize_t tgu_dataset_show(struct device *dev,
> @@ -31,9 +56,11 @@ static ssize_t tgu_dataset_show(struct device *dev,
>   			container_of(attr, struct tgu_attribute, attr);
>   	int index;
>   
> -	index = calculate_array_location(drvdata, tgu_attr->step_index,
> -					 tgu_attr->operation_index,
> -					 tgu_attr->reg_num);
> +	index = check_array_location(drvdata, tgu_attr->step_index,
> +			tgu_attr->operation_index, tgu_attr->reg_num);
> +
> +	if (index == -EINVAL)
> +		return index;
>   
>   	/*
>   	 * Serialise against tgu_dataset_store() and tgu_enable(), which read
> @@ -42,8 +69,20 @@ static ssize_t tgu_dataset_show(struct device *dev,
>   	 */
>   	guard(mutex)(&drvdata->lock);
>   
> -	return sysfs_emit(buf, "0x%x\n",
> -			  drvdata->value_table->priority[index]);
> +	switch (tgu_attr->operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		return sysfs_emit(buf, "0x%x\n",
> +				drvdata->value_table->priority[index]);
> +	case TGU_CONDITION_DECODE:
> +		return sysfs_emit(buf, "0x%x\n",
> +				drvdata->value_table->condition_decode[index]);
> +	default:
> +		break;
> +	}
> +	return -EINVAL;
>   }
>   
>   static ssize_t tgu_dataset_store(struct device *dev,
> @@ -66,9 +105,27 @@ static ssize_t tgu_dataset_store(struct device *dev,
>   					 tgu_attr->operation_index,
>   					 tgu_attr->reg_num);
>   
> -	tgu_drvdata->value_table->priority[index] = val;
> +	if (index == -EINVAL)
> +		return index;
> +
> +	switch (tgu_attr->operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		tgu_drvdata->value_table->priority[index] = val;
> +		ret = size;
> +		break;
> +	case TGU_CONDITION_DECODE:
> +		tgu_drvdata->value_table->condition_decode[index] = val;
> +		ret = size;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
>   
> -	return size;
> +	return ret;
>   }
>   
>   static umode_t tgu_node_visible(struct kobject *kobject,
> @@ -85,22 +142,41 @@ static umode_t tgu_node_visible(struct kobject *kobject,
>   	if (tgu_attr->step_index >= drvdata->num_step)
>   		return SYSFS_GROUP_INVISIBLE;
>   
> -	if (tgu_attr->reg_num >= drvdata->num_reg)
> -		return 0;
> +	switch (tgu_attr->operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		if (!drvdata->num_reg)
> +			return SYSFS_GROUP_INVISIBLE;
> +		if (tgu_attr->reg_num < drvdata->num_reg)
> +			return attr->mode;
> +		break;
> +	case TGU_CONDITION_DECODE:
> +		if (!drvdata->num_condition_decode)
> +			return SYSFS_GROUP_INVISIBLE;
> +		if (tgu_attr->reg_num < drvdata->num_condition_decode)
> +			return attr->mode;
> +		break;
> +	default:
> +		break;
> +	}
>   
> -	return attr->mode;
> +	return 0;
>   }
>   
> -static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
> +static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   {
> -	int i, j, k, index;
> +	int i, j, k, index = 0;
>   
>   	TGU_UNLOCK(drvdata->base);
>   	for (i = 0; i < drvdata->num_step; i++) {
>   		for (j = 0; j < MAX_PRIORITY; j++) {
>   			for (k = 0; k < drvdata->num_reg; k++) {
> -				index = calculate_array_location(
> +				index = check_array_location(
>   							drvdata, i, j, k);
> +				if (index == -EINVAL)
> +					goto exit;
>   
>   				writel(drvdata->value_table->priority[index],
>   					drvdata->base +
> @@ -108,9 +184,23 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   			}
>   		}
>   	}
> +
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_condition_decode; j++) {
> +			index = check_array_location(drvdata, i,
> +						TGU_CONDITION_DECODE, j);
> +			if (index == -EINVAL)
> +				goto exit;
> +
> +			writel(drvdata->value_table->condition_decode[index],
> +				drvdata->base + CONDITION_DECODE_STEP(i, j));
> +		}
> +	}
>   	/* Enable TGU to program the triggers */
>   	writel(1, drvdata->base + TGU_CONTROL);
> +exit:
>   	TGU_LOCK(drvdata->base);
> +	return index >= 0 ? 0 : -EINVAL;
>   }
>   
>   static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
> @@ -153,10 +243,31 @@ static void tgu_set_steps(struct tgu_drvdata *drvdata)
>   	}
>   }
>   
> -static void tgu_enable(struct tgu_drvdata *drvdata)
> +static int tgu_enable(struct tgu_drvdata *drvdata)
>   {
> -	tgu_write_all_hw_regs(drvdata);
> +	int ret;
> +
> +	ret = tgu_write_all_hw_regs(drvdata);
> +	if (ret)
> +		return ret;
> +
>   	drvdata->enabled = true;
> +	return 0;
> +}
> +
> +static void tgu_set_conditions(struct tgu_drvdata *drvdata)
> +{
> +	u32 devid;
> +
> +	devid = readl(drvdata->base + TGU_DEVID);
> +	drvdata->num_condition_decode = TGU_DEVID_CONDITIONS(devid);
> +
> +	if (drvdata->num_condition_decode > TGU_MAX_CONDITION_DECODE) {
> +		dev_warn(drvdata->dev,
> +			"DEVID reports %d condition decode regs, clamping to %d\n",
> +			drvdata->num_condition_decode, TGU_MAX_CONDITION_DECODE);
> +		drvdata->num_condition_decode = TGU_MAX_CONDITION_DECODE;
> +	}
>   }
>   
>   static void tgu_disable(struct tgu_drvdata *drvdata)
> @@ -210,7 +321,11 @@ static ssize_t enable_tgu_store(struct device *dev,
>   		if (ret)
>   			return ret;
>   
> -		tgu_enable(drvdata);
> +		ret = tgu_enable(drvdata);
> +		if (ret) {
> +			pm_runtime_put(dev);
> +			return ret;
> +		}
>   	} else {
>   		if (!drvdata->enabled)
>   			return -EINVAL;
> @@ -266,6 +381,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
>   	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
>   	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
>   	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(0),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(1),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(2),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(3),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(4),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
>   	NULL,
>   };
>   
> @@ -273,8 +396,9 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   {
>   	struct device *dev = &adev->dev;
>   	struct tgu_drvdata *drvdata;
> -	unsigned int *priority;
> -	size_t priority_size;
> +	unsigned int *priority, *condition;
> +	size_t priority_size, condition_size;
> +	int i, j;
>   	int ret;
>   
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -294,6 +418,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	tgu_set_reg_number(drvdata);
>   	tgu_set_steps(drvdata);
> +	tgu_set_conditions(drvdata);
>   
>   	drvdata->value_table =
>   		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
> @@ -310,6 +435,23 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	drvdata->value_table->priority = priority;
>   
> +	condition_size = drvdata->num_condition_decode * drvdata->num_step;
> +
> +	condition = devm_kcalloc(dev, condition_size,
> +				sizeof(*(drvdata->value_table->condition_decode)),
> +				GFP_KERNEL);
> +	if (!condition)
> +		return -ENOMEM;
> +
> +	drvdata->value_table->condition_decode = condition;
> +
> +	/* Initialize all condition decode registers to NOT */
> +	for (i = 0; i < drvdata->num_step; i++)
> +		for (j = 0; j < drvdata->num_condition_decode; j++)
> +			condition[calculate_array_location(
> +				drvdata, i, TGU_CONDITION_DECODE, j)] =
> +				TGU_CONDITION_DECODE_NOT;
> +
>   	drvdata->enabled = false;
>   	/*
>   	 * Create the sysfs groups only after the backing storage is fully
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> index 7a3e1161c4cf..8b6a46995a5f 100644
> --- a/drivers/hwtracing/qcom/tgu.h
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -19,6 +19,8 @@
>   	((int)FIELD_GET(GENMASK(17, 10), devid_val))
>   #define TGU_DEVID_STEPS(devid_val) \
>   	((int)FIELD_GET(GENMASK(6, 3), devid_val))
> +#define TGU_DEVID_CONDITIONS(devid_val) \
> +	((int)FIELD_GET(GENMASK(2, 0), devid_val))
>   #define TGU_BITS_PER_SIGNAL 4
>   #define LENGTH_REGISTER 32
>   
> @@ -52,6 +54,7 @@
>    */
>   #define STEP_OFFSET 0x1D8
>   #define PRIORITY_START_OFFSET 0x0074
> +#define CONDITION_DECODE_OFFSET 0x0050
>   #define PRIORITY_OFFSET 0x60
>   #define REG_OFFSET 0x4
>   
> @@ -63,6 +66,7 @@
>    *
>    *   TGU_MAX_STEPS            static tables define step0..step7
>    *   TGU_MAX_PRIORITY_REGS    STEP_PRIORITY_LIST defines reg0..reg17
> + *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
>    *
>    * A device whose DEVID reports counts above these bounds is clamped, so writes
>    * never fall outside the ioremap()'d window or spill into an adjacent region.
> @@ -70,12 +74,16 @@
>   
>   #define TGU_MAX_STEPS                  8
>   #define TGU_MAX_PRIORITY_REGS          18
> +#define TGU_MAX_CONDITION_DECODE       4
>   
>   /* Calculate compare step addresses */
>   #define PRIORITY_REG_STEP(step, priority, reg)\
>   	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
>   	 REG_OFFSET * reg + STEP_OFFSET * step)
>   
> +#define CONDITION_DECODE_STEP(step, decode) \
> +	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
> +
>   #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
>   	(&((struct tgu_attribute[]){ {                                   \
>   		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
> @@ -87,6 +95,8 @@
>   #define STEP_PRIORITY(step_index, reg_num, priority)                     \
>   	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
>   			reg_num)
> +#define STEP_DECODE(step_index, reg_num) \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
>   
>   #define STEP_PRIORITY_LIST(step_index, priority) \
>   	{STEP_PRIORITY(step_index, 0, priority), \
> @@ -110,6 +120,14 @@
>   	 NULL                   \
>   	}
>   
> +#define STEP_DECODE_LIST(n) \
> +	{STEP_DECODE(n, 0), \

Please use a new line for all such defintions.


> +	 STEP_DECODE(n, 1), \
> +	 STEP_DECODE(n, 2), \
> +	 STEP_DECODE(n, 3), \
> +	 NULL               \
> +	}
> +
>   #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>   	(&(const struct attribute_group){\
>   		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
> @@ -117,16 +135,32 @@
>   		.name = "step" #step "_priority" #priority \
>   	})
>   
> +#define CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(step)\
> +	(&(const struct attribute_group){\
> +		.attrs = (struct attribute*[])STEP_DECODE_LIST(step),\
> +		.is_visible = tgu_node_visible,\
> +		.name = "step" #step "_condition_decode" \
> +	})
> +
>   enum operation_index {
>   	TGU_PRIORITY0,
>   	TGU_PRIORITY1,
>   	TGU_PRIORITY2,
>   	TGU_PRIORITY3,
> +	TGU_CONDITION_DECODE,

>   };
>   
>   /* Maximum priority that TGU supports */
>   #define MAX_PRIORITY 4
>   
> +/*
> + * Neutral ('NOT') value for the condition decode registers. This is the
> + * driver's default so that, before userspace programs a real decode, an
> + * enabled step does not spuriously match. Used both when seeding the shadow
> + * table at probe and when clearing it via reset_tgu.
> + */
> +#define TGU_CONDITION_DECODE_NOT 0x1000000
> +
>   struct tgu_attribute {
>   	struct device_attribute attr;
>   	u32 step_index;
> @@ -136,6 +170,7 @@ struct tgu_attribute {
>   
>   struct value_table {
>   	unsigned int *priority;
> +	unsigned int *condition_decode;
>   };
>   
>   static inline void TGU_LOCK(void __iomem *addr)
> @@ -166,6 +201,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>    * @value_table: Store given value based on relevant parameters
>    * @num_reg: Maximum number of registers
>    * @num_step: Maximum step size
> + * @num_condition_decode: Maximum number of condition_decode
>    *
>    * This structure defines the data associated with a TGU device,
>    * including its base address, device pointer, the lock serialising
> @@ -179,6 +215,7 @@ struct tgu_drvdata {
>   	struct value_table *value_table;
>   	int num_reg;
>   	int num_step;
> +	int num_condition_decode;
>   };
>   
>   #endif

