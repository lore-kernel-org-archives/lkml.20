Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827795;
	b=O6q6ocFbHbXiylD67WyTmFAwPpfnTHKQCP3ZlAMOm8usqzub5rXd7GcFSVFK50eCY5Xu
	 nmKa7j4oExU0zgHrq6Q/8goKOAuW5G0RwSIVtpUsYuZraUIgXMMW1DAV9MOFcSEJ86Lx3
	 ipz7qPiakanKmrvUM3fFtjwCBw+VcQcZtkF6ohQfij3XyN9JJ9+nFUC8StfqAjzybGPDm
	 WwkiWdwjNGXCnlkFPcKsP3g3nHZ1VCHB592Mv9osFmlHfDzKaotRrsJcghecpUmeyTUjP
	 MeBPUd5Rb8W1P//f7OGv0cFNbJjBjMHe6IO6MKbRrbDCMw7iD92LyM+G6GiMwlOqqyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827795;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wXCBBROtn7390wH5D6ZI88F3XsQOPnnztbdYE3zfQRI=;
	b=VeXoE7Yd0zKjOWSaT85yCRmgZfVVJuSOS4AEzwX5tE3fPFSm80LGpCcSxgl7N6yNnFKh
	 yyyCkxP0JFIpS+ZqxEaWp7Fq+PKsGvGo8b+8+zZ0KZMi2Gi0pb207HMPWSlGsrK7GLXLM
	 fnmDRvOG1XM4RabjjFhtSFDVp188+R+6dDqox0wVn4rUIVFilEzE9jK7aT/lun6WcJNBG
	 jSGUp07QzqZbwZmk1Qm/Wb1WVL6G2iMryx3VIwnDg7rUFUqgjA3icGty0uzFtYXlj6S6i
	 J8R8BTICpZQMKZIazwFUIIIYNmHJDTiX80NSciBC4ACGGT+nKhLsM49fB7TPyaN+YUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XUAVP+EB;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D189606D7A8;
	Mon, 16 Nov 2026 11:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D189606D7A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XUAVP+EB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E2211713;
	Mon, 16 Nov 2026 03:16:31 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 938903F632;
	Mon, 16 Nov 2026 03:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794827794; bh=gZUZ2fzzrTxigo9eQtmXEhp55bn/WqiEVfv9etdFWzA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XUAVP+EBK40JZlSjg7sAzbuLsCXfYycK0PGriX5FjPnK0zmGNm/JgrxWmF+sMhSSR
	 Uo2alS9qpdwKJqQg3vYNovR8M0lyb4y+/9jhM/grl5Ibh4ZZzsQ77E5ijrrf4tw41O
	 c0Rzw8KeQ3nfaa+nKU0r9ngIj5jInXBLVbrl6ONI=
Message-ID: <c23c116b-063a-4658-a6da-b79146226d4a@arm.com>
Date: Mon, 16 Nov 2026 11:16:31 +0000
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
Subject: Re: [PATCH v18 4/8] qcom-tgu: Add signal priority support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
 konrad.dybcio@oss.qualcomm.com, james.clark@arm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 songchai@qti.qualcomm.com, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
 <20261116074118.822731-5-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261116074118.822731-5-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/11/2026 07:41, Songwei Chai wrote:
> Like circuit of a Logic analyzer, in TGU, the requirement could be
> configured in each step and the trigger will be created once the
> requirements are met. Add priority functionality here to sort the
> signals into different priorities. The signal which is wanted could
> be configured in each step's priority node, the larger number means
> the higher priority and the signal with higher priority will be sensed
> more preferentially.
> 
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>   drivers/hwtracing/qcom/tgu.c                  | 211 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  |  68 ++++++
>   3 files changed, 286 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 798a0e51e27a..3be0b912c937 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -7,3 +7,10 @@ Description:
>   		Accepts only one of the 2 values -  0 or 1.
>   		0 : disable TGU.
>   		1 : enable TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:23]
> +Date:		November 2026
> +KernelVersion:	7.5
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the sensed signal with specific step and priority for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 5bae46db4f8c..917d506cddf9 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -16,14 +16,145 @@
>   
>   #include "tgu.h"
>   
> +struct tgu_attribute {
> +	struct device_attribute attr;
> +	u8 step_index;
> +	u8 priority;
> +	u8 reg_num;
> +};
> +
> +/*
> + * drvdata->priority is a flat [priority][step][reg] array.
> + */
> +static int calculate_array_location(struct tgu_drvdata *drvdata,
> +				    int step_index, int priority,
> +				    int reg_index)
> +{
> +	return priority * (drvdata->num_step) * (drvdata->num_reg) +
> +		step_index * (drvdata->num_reg) + reg_index;
> +}
> +
> +static ssize_t tgu_dataset_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct tgu_attribute *tgu_attr =
> +			container_of(attr, struct tgu_attribute, attr);
> +	int index;
> +
> +	index = calculate_array_location(drvdata, tgu_attr->step_index,
> +					 tgu_attr->priority,
> +					 tgu_attr->reg_num);
> +
> +	/*
> +	 * Serialise against tgu_dataset_store() and tgu_enable(), which read
> +	 * and write the same priority array, so the value is not observed
> +	 * while being updated concurrently.
> +	 */
> +	guard(mutex)(&drvdata->lock);
> +
> +	return sysfs_emit(buf, "0x%x\n", drvdata->priority[index]);
> +}
> +
> +static ssize_t tgu_dataset_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t size)
> +{
> +	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
> +	struct tgu_attribute *tgu_attr =
> +		container_of(attr, struct tgu_attribute, attr);
> +	unsigned long val;
> +	int index;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&tgu_drvdata->lock);
> +	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
> +					 tgu_attr->priority,
> +					 tgu_attr->reg_num);
> +
> +	tgu_drvdata->priority[index] = val;
> +
> +	return size;
> +}
> +
> +static umode_t tgu_node_visible(struct kobject *kobject,
> +				struct attribute *attr,
> +				int n)
> +{
> +	struct device *dev = kobj_to_dev(kobject);
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct device_attribute *dev_attr =
> +		container_of(attr, struct device_attribute, attr);
> +	struct tgu_attribute *tgu_attr =
> +		container_of(dev_attr, struct tgu_attribute, attr);
> +
> +	if (tgu_attr->step_index >= drvdata->num_step)
> +		return SYSFS_GROUP_INVISIBLE;
> +
> +	if (tgu_attr->reg_num >= drvdata->num_reg)
> +		return 0;
> +
> +	return attr->mode;
> +}
> +
>   static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   {
> +	int i, j, k, index;
> +
>   	CS_UNLOCK(drvdata->base);
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < MAX_PRIORITY; j++) {
> +			for (k = 0; k < drvdata->num_reg; k++) {
> +				index = calculate_array_location(
> +							drvdata, i, j, k);
> +
> +				writel(drvdata->priority[index],
> +					drvdata->base +
> +					PRIORITY_REG_STEP(i, j, k));
> +			}
> +		}
> +	}
>   	/* Enable TGU to program the triggers */
>   	writel(1, drvdata->base + TGU_CONTROL);
>   	CS_LOCK(drvdata->base);
>   }
>   
> +static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
> +{
> +	int num_sense_input, num_reg, num_step;
> +	u32 devid;
> +
> +	devid = readl(drvdata->base + CORESIGHT_DEVID);
> +
> +	num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
> +	num_reg = (num_sense_input * TGU_BITS_PER_SIGNAL) / LENGTH_REGISTER;
> +
> +	if ((num_sense_input * TGU_BITS_PER_SIGNAL) % LENGTH_REGISTER)
> +		num_reg++;
> +
> +	if (num_reg > TGU_MAX_PRIORITY_REGS) {
> +		dev_warn(drvdata->dev,
> +			"DEVID reports %d priority regs, clamping to %d\n",
> +			num_reg, TGU_MAX_PRIORITY_REGS);
> +		num_reg = TGU_MAX_PRIORITY_REGS;
> +	}
> +	drvdata->num_reg = num_reg;
> +
> +	num_step = TGU_DEVID_STEPS(devid);
> +
> +	if (num_step > TGU_MAX_STEPS) {
> +		dev_warn(drvdata->dev,
> +			"DEVID reports %d steps, clamping to %d\n",
> +			num_step, TGU_MAX_STEPS);
> +		num_step = TGU_MAX_STEPS;
> +	}
> +	drvdata->num_step = num_step;
> +}
> +
>   static void tgu_enable(struct tgu_drvdata *drvdata)
>   {
>   	tgu_write_all_hw_regs(drvdata);
> @@ -103,8 +234,86 @@ static const struct attribute_group tgu_common_grp = {
>   	.attrs = tgu_common_attrs,
>   };
>   
> +#define tgu_dataset_rw(name, step_index, priority, reg_num)              \
> +	(&((struct tgu_attribute[]){ {                                   \
> +		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
> +		step_index,                                              \
> +		priority,                                                \
> +		reg_num,                                                 \
> +	} })[0].attr.attr)
> +
> +#define STEP_PRIORITY(step_index, reg_num, priority)              \
> +	tgu_dataset_rw(reg##reg_num, step_index, priority, reg_num)
> +
> +#define STEP_PRIORITY_LIST(step_index, priority) \
> +	{STEP_PRIORITY(step_index, 0, priority), \
> +	 STEP_PRIORITY(step_index, 1, priority),  \
> +	 STEP_PRIORITY(step_index, 2, priority),	 \
> +	 STEP_PRIORITY(step_index, 3, priority),  \
> +	 STEP_PRIORITY(step_index, 4, priority),  \
> +	 STEP_PRIORITY(step_index, 5, priority),  \
> +	 STEP_PRIORITY(step_index, 6, priority),  \
> +	 STEP_PRIORITY(step_index, 7, priority),  \
> +	 STEP_PRIORITY(step_index, 8, priority),  \
> +	 STEP_PRIORITY(step_index, 9, priority),  \
> +	 STEP_PRIORITY(step_index, 10, priority), \
> +	 STEP_PRIORITY(step_index, 11, priority), \
> +	 STEP_PRIORITY(step_index, 12, priority), \
> +	 STEP_PRIORITY(step_index, 13, priority), \
> +	 STEP_PRIORITY(step_index, 14, priority), \
> +	 STEP_PRIORITY(step_index, 15, priority), \
> +	 STEP_PRIORITY(step_index, 16, priority), \
> +	 STEP_PRIORITY(step_index, 17, priority), \
> +	 STEP_PRIORITY(step_index, 18, priority), \
> +	 STEP_PRIORITY(step_index, 19, priority), \
> +	 STEP_PRIORITY(step_index, 20, priority), \
> +	 STEP_PRIORITY(step_index, 21, priority), \
> +	 STEP_PRIORITY(step_index, 22, priority), \
> +	 STEP_PRIORITY(step_index, 23, priority), \
> +	 NULL                   \
> +	}
> +
> +#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
> +	(&(const struct attribute_group){\
> +		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
> +		.is_visible = tgu_node_visible,\
> +		.name = "step" #step "_priority" #priority \
> +	})
> +
>   static const struct attribute_group *tgu_attr_groups[] = {
>   	&tgu_common_grp,
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
>   	NULL,
>   };
>   
> @@ -129,6 +338,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   	if (ret)
>   		return ret;
>   
> +	tgu_set_dev_caps(drvdata);
> +
>   	drvdata->enabled = false;
>   
>   	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> index c6426b4e3617..d769379b8421 100644
> --- a/drivers/hwtracing/qcom/tgu.h
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -6,9 +6,70 @@
>   #ifndef _QCOM_TGU_H
>   #define _QCOM_TGU_H
>   
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +
>   /* Register addresses */
>   #define TGU_CONTROL		0x0000
>   
> +#define TGU_DEVID_SENSE_INPUT(devid_val) \
> +	((int)FIELD_GET(GENMASK(17, 10), devid_val))
> +#define TGU_DEVID_STEPS(devid_val) \
> +	((int)FIELD_GET(GENMASK(6, 3), devid_val))
> +
> +#define TGU_BITS_PER_SIGNAL	4
> +#define LENGTH_REGISTER		32
> +
> +/*
> + * TGU configuration space                                 Per-step register layout.
> + * (one step occupies STEP_SIZE bytes)                     Offsets below are relative to
> + *                                                         the start of that step's block.
> + * x-------------------------x                             x-----------------x
> + * |   coresight management  |                             |     reserved    |
> + * |        registers        |                             |-----------------| +0x1F4
> + * |                         |                       --->  |   priority[3]   |
> + * |-------------------------|                       |     |-----------------| +0x194
> + * |         step[7]         |                       |     |   priority[2]   |
> + * |-------------------------| step[0] + 7*STEP_SIZE |     |-----------------| +0x134
> + * |           ...           |                       |     |   priority[1]   |
> + * |-------------------------| step[0] + 1*STEP_SIZE |     |-----------------| +0xD4
> + * |         step[0]         |-----------------------|     |   priority[0]   |
> + * |-------------------------| step[0] (base+0x40)         |-----------------| +0x74
> + * |    Control and status   |                             | condition select|
> + * |          space          |                             |-----------------| +0x60
> + * x-------------------------x base                        | condition decode|
> + *                                                         |-----------------| +0x50
> + *                                                         |  Timer/Counter  |
> + *                                                         x-----------------x +0x40
> + */
> +#define STEP_SIZE		0x1D8

Something is really weird. STEP_SIZE is 0x1D8, but the diagram above
shows the "reserved" is at 0x1F4 ? is it because you have added 0x40
(of the Control and Status space) to the offsets for the step0 ?

Please could we simply define the fields for a step with offset 0 as
the base for each step ?

i.e., Timer/Counter -> 0x0
       Priority[0]-> 0x34


Also, please could you keep the naming consistent.
STEP_SIZE vs PRIORITY_STRIDE ? I prefer SIZE


#define STEP0_BASE		0x40
#define STEP_SIZE		0x1D8

#define PRIORITY0_BASE		0x34
#define PRIORITY_SIZE		0x60


and

#define STEP_OFFSET(s)		(STEP0_BASE + STEP_SIZE * (s))
#define PRIORITY_OFFSET(p)	(PRIORITY0_BASE + PRIORITY_SIZE *(p))

with that we could replace

 > +/* Calculate compare step addresses */
 > +#define PRIORITY_REG_STEP(step, priority, reg)\
 > +	(PRIORITY0_OFFSET + PRIORITY_STRIDE * priority +\
 > +	 REG_SIZE * reg + STEP_SIZE * step)

with :

#define PRIORITY_REG_OFFSET(step, prio, reg)		\
	(STEP_OFFSET(step) + PRIORITY_OFFSET(prio) + (reg) * REG_SIZE)




> +#define PRIORITY0_OFFSET	0x0074
> +#define PRIORITY_STRIDE		0x0060
> +#define REG_SIZE		0x4
> +
> +/*
> + * Upper bounds on the DEVID-derived per-region counts, used to clamp
> + * whatever the hardware reports so writes never fall outside the
> + * ioremap()'d window or spill into an adjacent region.
> + *
> + *   TGU_MAX_STEPS         matches the static step0..step7 sysfs tables.
> + *   TGU_MAX_PRIORITY_REGS matches the static reg0..reg23 sysfs tables.
> + *
> + * Each priority level's block spans a full PRIORITY_STRIDE (0x60 bytes),
> + * i.e. PRIORITY_STRIDE / REG_SIZE = 24 registers, all of them implemented.
> + */
> +
> +#define TGU_MAX_STEPS                  8
> +#define TGU_MAX_PRIORITY_REGS          24
> +
> +/* Maximum priority that TGU supports */
> +#define MAX_PRIORITY                   4

nit: TGU_MAX_PRIORITY for consistency
> +

> +
>   /**
>    * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
>    * @base: Memory-mapped base address of the TGU device
> @@ -16,6 +77,10 @@
>    * @lock: Mutex serialising enable/disable and the associated PM runtime
>    *        reference counting against concurrent sysfs access
>    * @enabled: Flag indicating whether the TGU device is enabled
> + * @priority: Per-step, per-priority-level, per-register values staged by
> + *            sysfs writes and flushed to hardware by tgu_enable()
> + * @num_reg: Number of priority registers implemented per priority level
> + * @num_step: Number of steps implemented
>    *
>    * This structure defines the data associated with a TGU device,
>    * including its base address, device pointer, the lock serialising
> @@ -26,6 +91,9 @@ struct tgu_drvdata {
>   	struct device *dev;
>   	struct mutex lock;
>   	bool enabled;
> +	unsigned int priority[TGU_MAX_STEPS * MAX_PRIORITY * TGU_MAX_PRIORITY_REGS];

Please add a symbol for this

#define TGU_MAX_PRIORITY_REG_SIZE
	(TGU_MAX_STEPS * TGU_MAX_PRIORITY * TGU_MAX_PRIORITY_REGS)

Suzuki

