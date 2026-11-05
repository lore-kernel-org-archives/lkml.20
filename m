Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890404;
	b=Vf7MnbLTZo50nYxbHIkyMqWx6wh57D9nzpI24h5xaV/7ISbOP5utwpkdguZ0WRzeUGzv
	 SKu5bz82h3PbPnIEP03HorvNg/rd3O7sKL54VbQcbsbINag7cqAXSiBFlFM8qV7ZPMyOa
	 Ovr0pIxCUmewdYI3kRTlmLIWvvGbFgKeskx8JfrOrQbYI12K+M8WyUJFwhbbA7/f95XL7
	 jq55qecI8BjeWunloJ24ymBN6g2v8VXl7Bie2d+LcACeQ3LeYbS+C+ZkcxT/QNmGsH5wS
	 TiLpcbA4vxTZqAaDgzX5H/IGhwjcJmkVee0t7xIfAmlb3ShgpU4ZUZRCZoUHBxm2IPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890404;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fGSRYjsDRIPHde1RyCd2bqv9F6MK6hgC71FGb/Xh81E=;
	b=FK+93pJ+ycFQlP2l5/uPqjA0O1m8VtfMWhKWWlO8CEPzRSKV2x+qV7SyGzIewtjY0jXG
	 X5kdiQFdrLwWmlV+oZLP4v6nL2qCWHsl2hPyibkYJcEe0pQJoYGyCyZ1HuCClNac01HLK
	 JtfK/E55BOHvat2JqPcHaAUc4B9tj0Ew9xfjCOabHmH5EcYyFjKKC/oBoIPMH3pS3pQWI
	 ab42mRQWv8v+RF1iYagaq0jnO3YusPqbZXoIGJcCbzvrzCR7BCl/5Zq1N7wJ9HJ0tz0mi
	 vYCmz/xc/gLnh6TV/QgqYCxi8Is/hbNmZ2vsKq3OsAqPOj51fiGOnbi9+nwmBBNVcHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HBFO+UzD;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D94606A328;
	Thu,  5 Nov 2026 14:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81D94606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HBFO+UzD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CED98168F;
	Thu,  5 Nov 2026 06:53:19 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0996E3F673;
	Thu,  5 Nov 2026 06:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793890402; bh=0pp+iOkW01SlRmFBGgUsE3T2F2TU+P0ZCidd5+2nbNs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HBFO+UzD9u6FDVPqNq8nvE48ssjNEXul3ct0YSAw1XXlSXk5pL6TFy5aYawFRuJuZ
	 C7eu/6ecS7T7bhepEEZZUPs7mCBaW+pHdpK/j7WUbqwx7ETJswQe+Ys+RlZuCvRZ8S
	 OWod7O+v/hFP1ivwbsgM4JfWcXKMwJ+Q8qjdz36U=
Message-ID: <d4ee8d56-9ae9-4fb3-ab70-2deaba3a5d0c@arm.com>
Date: Thu, 5 Nov 2026 14:53:19 +0000
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
Subject: Re: [PATCH v16 7/7] qcom-tgu: Add reset node to initialize
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
 konrad.dybcio@oss.qualcomm.com, james.clark@arm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 Jie Gan <jie.gan@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-8-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260730080704.2903540-8-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/07/2026 09:07, Songwei Chai wrote:
> Add reset node to initialize the value of
> priority/condition_decode/condition_select/timer/counter nodes.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
>   drivers/hwtracing/qcom/tgu.c                  | 84 +++++++++++++++++++
>   2 files changed, 91 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index a0cad2f16310..5c928a5fa033 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -51,3 +51,10 @@ KernelVersion:	7.2
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the counter value with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
> +Date:		August 2026
> +KernelVersion:	7.2
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(Write) Write 1 to reset the dataset for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index ea83273a628c..d65a68faa741 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -228,6 +228,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   	int i, j, k, index = 0;
>   
>   	TGU_UNLOCK(drvdata->base);
> +
> +	/*
> +	 * Quiesce the detection engine before mutating any comparison input.
> +	 * This function is also reached from reset_tgu_store() while the TGU is
> +	 * already running (TGU_CONTROL == 1); rewriting the priority/condition/
> +	 * timer/counter registers register-by-register on a live engine could
> +	 * feed a transient, half-updated match into CTI/interrupt consumers.
> +	 * Programming with CONTROL == 0 and only re-enabling at the end keeps the
> +	 * program-then-enable ordering for every caller.
> +	 */
> +	writel(0, drvdata->base + TGU_CONTROL);
> +
>   	for (i = 0; i < drvdata->num_step; i++) {
>   		for (j = 0; j < MAX_PRIORITY; j++) {
>   			for (k = 0; k < drvdata->num_reg; k++) {
> @@ -459,8 +471,80 @@ static ssize_t enable_tgu_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(enable_tgu);
>   
> +static ssize_t reset_tgu_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t size)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct value_table *vt = drvdata->value_table;
> +	unsigned long value;
> +	int i, j, ret;
> +
> +	if (kstrtoul(buf, 0, &value) || value != 1)
> +		return -EINVAL;
> +
> +	/*
> +	 * Hold the mutex across the whole sequence so it cannot race with
> +	 * enable_tgu_store()/tgu_dataset_store(): the enabled check and the
> +	 * hardware access stay consistent. No PM reference is taken or dropped
> +	 * here - the shadow tables are plain memory, and the hardware is only
> +	 * touched when the device is already resumed via the enable reference.
> +	 */
> +	guard(mutex)(&drvdata->lock);
> +
> +	if (vt->priority) {
> +		size_t bytes = MAX_PRIORITY * drvdata->num_step *
> +				drvdata->num_reg * sizeof(unsigned int);

Please could you add a macro to compute "number" of each array ? 
Something like :

#define TGU_PRIORITY_SIZE(drvdata)	
	(MAX_PRIORITY * (drvdata)->num_step * (drvdata)->num_reg)

So that we use the same size calculation for allocation and reset ?
You may scale it by sizeof(*vt->priority)



> +		memset(vt->priority, 0, bytes);
> +	}
> +
> +	if (vt->condition_decode) {
> +		size_t bytes = drvdata->num_condition_decode *
> +			       drvdata->num_step * sizeof(unsigned int);

Same as above

> +		memset(vt->condition_decode, 0, bytes);
> +
> +		/* Initialize all condition decode registers to NOT (0x1000000) */

then why do the memset above ?

> +		for (i = 0; i < drvdata->num_step; i++)
> +			for (j = 0; j < drvdata->num_condition_decode; j++)
> +				vt->condition_decode[calculate_array_location(
> +					drvdata, i, TGU_CONDITION_DECODE, j)] =
> +					TGU_CONDITION_DECODE_NOT;

Then, we could simplify the above to:

	for (i = 0; i < TGU_CONDITION_DECODE(drvdata); i++)
		vt->condition_decode[i] = TGU_CONDITION_DECODE_NOT;

Same for everything below.

Suzuki

> +	}
> +
> +	if (vt->condition_select) {
> +		size_t bytes = drvdata->num_condition_select *
> +			       drvdata->num_step * sizeof(unsigned int);
> +		memset(vt->condition_select, 0, bytes);
> +	}
> +
> +	if (vt->timer) {
> +		size_t bytes = drvdata->num_step * drvdata->num_timer *
> +				sizeof(unsigned int);
> +		memset(vt->timer, 0, bytes);
> +	}
> +
> +	if (vt->counter) {
> +		size_t bytes = drvdata->num_step * drvdata->num_counter *
> +			       sizeof(unsigned int);
> +		memset(vt->counter, 0, bytes);
> +	}
> +
> +	/* If the TGU is running, apply the cleared configuration immediately. */
> +	if (drvdata->enabled) {
> +		ret = tgu_write_all_hw_regs(drvdata);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
> +
> +	return size;
> +}
> +static DEVICE_ATTR_WO(reset_tgu);
> +
>   static struct attribute *tgu_common_attrs[] = {
>   	&dev_attr_enable_tgu.attr,
> +	&dev_attr_reset_tgu.attr,
>   	NULL,
>   };
>   

