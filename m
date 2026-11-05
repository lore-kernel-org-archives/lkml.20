Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888069;
	b=ihUTbc2Q+smFWBAQLmzinZt80aL7j3XsKh/NcggjP/6BenFX2C640aCq5plcBos1132D
	 Em8QkQNbcZiGRPd5rSJevvOY0WJuHEpma+M7T/vbkR6XwGCiKwypC8xrbpiUyIMEcM86R
	 n1q1TGTN3g6EoY0/zePQ+2KKZ8dXupVEgOQfbqPLPd0Xy5qbmt759SqvhpXw4Jqd0NBBH
	 CGj5cObaxSmINIWLyRjl8fV1OkWtoC5w1a7OmO9MekyXBAdKS1u3Z5pCFjmQqOwkvSxGH
	 U5aLfG0oi0wFogK/O7+yfNbuskg2yy/pJWqAEJ2BU1iNwCxZ2ddUjVTaj0FIHxBPTWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888069;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xXF1a356s2mczuWccKK+ZPLNm36CrJi3MNYwHIzA888=;
	b=k18dpQ/VHzNs0NU/in8IxsEFrs80oipqen50ehoiBGvmSK+5JwQjWkAkR9MVT1lQljjn
	 40oPZpuuRq71gO69JSIoe7fAHiq1obdHHdWjaH27TW9/8O1/VK0XARn6Le7wCxreLck2l
	 R3x/wx940bv6KKh0eA90nzI9mZZd3kQYqp6ZwSqNksrHX2EktFesXdQDixRtXgALkE8Q6
	 Wd79BpNCelPV3Mbh1lvj+ivA6bsNDZBIDmx7zCS9ca6v9gMmaI5L+dBVHap2YSBdxYqxx
	 9/3QZKMo4AZfk0JtwYeHgUvBndM0L4CTM24gNSjqlF92THsfrB5RBcJTugZdgxr/XXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=H7NAy7X7;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFAE606EE9D;
	Thu,  5 Nov 2026 14:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFFAE606EE9D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=H7NAy7X7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B6061650;
	Thu,  5 Nov 2026 06:14:24 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FC203F673;
	Thu,  5 Nov 2026 06:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793888067; bh=I072fTH3aGOeajKhzi0eRve0Ii/x3XIIO1m6k9/TAKk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=H7NAy7X7xLqCGNIkvO3eaclt4DmT38VwvgTr2lBRwKRG3SUg1+91N7iOjDd7Vcfqo
	 HDqezuvHVOSDFDj7mmAoB8gJTJ8+2MNToczc2zb7PDGI0mXn7B+et9UqJJtpsf8ADh
	 wNk7T9srDEIPIp02boLysgfF8+BH8Aamc1+u+e2Y=
Message-ID: <f1e4f462-2aba-470d-84e4-87a12c2a13d3@arm.com>
Date: Thu, 5 Nov 2026 14:14:23 +0000
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
Content-Language: en-US
In-Reply-To: <9d450f18-2300-4ead-981b-94bd9eea9126@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 05/11/2026 13:01, Suzuki K Poulose wrote:
> On 30/07/2026 09:07, Songwei Chai wrote:
>> Like circuit of a Logic analyzer, in TGU, the requirement could be
>> configured in each step and the trigger will be created once the
>> requirements are met. Add priority functionality here to sort the
>> signals into different priorities. The signal which is wanted could
>> be configured in each step's priority node, the larger number means
>> the higher priority and the signal with higher priority will be sensed
>> more preferentially.
>>
>> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>>   drivers/hwtracing/qcom/tgu.c                  | 189 +++++++++++++++++-
>>   drivers/hwtracing/qcom/tgu.h                  | 133 ++++++++++++
>>   3 files changed, 328 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/ 
>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> index 36ab64f1e301..7dd24314592d 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -7,3 +7,10 @@ Description:
>>           Accepts only one of the 2 values -  0 or 1.
>>           0 : disable TGU.
>>           1 : enable TGU.
>> +
>> +What:        /sys/bus/amba/devices/<tgu-name>/ 
>> step[0:7]_priority[0:3]/reg[0:17]
>> +Date:        August 2026
>> +KernelVersion:    7.2
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/Get the sensed signal with specific step and 
>> priority for TGU.
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index 9c7dd4a09f02..0e88b437f191 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -15,14 +15,144 @@
>>   #include "tgu.h"
>> +static int calculate_array_location(struct tgu_drvdata *drvdata,
>> +                    int step_index, int operation_index,
>> +                    int reg_index)
>> +{
>> +    return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
>> +        step_index * (drvdata->num_reg) + reg_index;
>> +}
>> +
>> +static ssize_t tgu_dataset_show(struct device *dev,
>> +                struct device_attribute *attr, char *buf)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    struct tgu_attribute *tgu_attr =
>> +            container_of(attr, struct tgu_attribute, attr);
>> +    int index;
>> +
>> +    index = calculate_array_location(drvdata, tgu_attr->step_index,
>> +                     tgu_attr->operation_index,
>> +                     tgu_attr->reg_num);
>> +
>> +    /*
>> +     * Serialise against tgu_dataset_store() and tgu_enable(), which 
>> read
>> +     * and write the same priority array, so the value is not observed
>> +     * while being updated concurrently.
>> +     */
>> +    guard(mutex)(&drvdata->lock);
>> +
>> +    return sysfs_emit(buf, "0x%x\n",
>> +              drvdata->value_table->priority[index]);
>> +}
>> +
>> +static ssize_t tgu_dataset_store(struct device *dev,
>> +                 struct device_attribute *attr,
>> +                 const char *buf, size_t size)
>> +{
>> +    struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
>> +    struct tgu_attribute *tgu_attr =
>> +        container_of(attr, struct tgu_attribute, attr);
>> +    unsigned long val;
>> +    int index;
>> +    int ret;
>> +
>> +    ret = kstrtoul(buf, 0, &val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    guard(mutex)(&tgu_drvdata->lock);
>> +    index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
>> +                     tgu_attr->operation_index,
>> +                     tgu_attr->reg_num);
>> +
>> +    tgu_drvdata->value_table->priority[index] = val;
>> +
>> +    return size;
>> +}
>> +
>> +static umode_t tgu_node_visible(struct kobject *kobject,
>> +                struct attribute *attr,
>> +                int n)
>> +{
>> +    struct device *dev = kobj_to_dev(kobject);
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    struct device_attribute *dev_attr =
>> +        container_of(attr, struct device_attribute, attr);
>> +    struct tgu_attribute *tgu_attr =
>> +        container_of(dev_attr, struct tgu_attribute, attr);
>> +
>> +    if (tgu_attr->step_index >= drvdata->num_step)
>> +        return SYSFS_GROUP_INVISIBLE;
>> +
>> +    if (tgu_attr->reg_num >= drvdata->num_reg)
>> +        return 0;
>> +
>> +    return attr->mode;
>> +}
>> +
>>   static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>>   {
>> +    int i, j, k, index;
>> +
>>       TGU_UNLOCK(drvdata->base);
>> +    for (i = 0; i < drvdata->num_step; i++) {
>> +        for (j = 0; j < MAX_PRIORITY; j++) {
>> +            for (k = 0; k < drvdata->num_reg; k++) {
>> +                index = calculate_array_location(
>> +                            drvdata, i, j, k);
>> +
>> +                writel(drvdata->value_table->priority[index],
>> +                    drvdata->base +
>> +                    PRIORITY_REG_STEP(i, j, k));
>> +            }
>> +        }
>> +    }
>>       /* Enable TGU to program the triggers */
>>       writel(1, drvdata->base + TGU_CONTROL);
>>       TGU_LOCK(drvdata->base);
>>   }
>> +static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
>> +{
>> +    int num_sense_input;
>> +    int num_reg;
>> +    u32 devid;
>> +
>> +    devid = readl(drvdata->base + TGU_DEVID);
>> +
>> +    num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
>> +    num_reg = (num_sense_input * TGU_BITS_PER_SIGNAL) / LENGTH_REGISTER;
>> +
>> +    if ((num_sense_input * TGU_BITS_PER_SIGNAL) % LENGTH_REGISTER)
>> +        num_reg++;
>> +
>> +    if (num_reg > TGU_MAX_PRIORITY_REGS) {
>> +        dev_warn(drvdata->dev,
>> +            "DEVID reports %d priority regs, clamping to %d\n",
>> +            num_reg, TGU_MAX_PRIORITY_REGS);
>> +        num_reg = TGU_MAX_PRIORITY_REGS;
>> +    }
>> +
>> +    drvdata->num_reg = num_reg;
>> +}
>> +
>> +static void tgu_set_steps(struct tgu_drvdata *drvdata)
>> +{
>> +    u32 devid;
>> +
>> +    devid = readl(drvdata->base + TGU_DEVID);
>> +
>> +    drvdata->num_step = TGU_DEVID_STEPS(devid);
>> +
>> +    if (drvdata->num_step > TGU_MAX_STEPS) {
>> +        dev_warn(drvdata->dev,
>> +            "DEVID reports %d steps, clamping to %d\n",
>> +            drvdata->num_step, TGU_MAX_STEPS);
>> +        drvdata->num_step = TGU_MAX_STEPS;
>> +    }
>> +}
> 
> Why not combine setting the num_step and num_regs in one go ? You are 
> reading the DEVID anyways, and such macro level functional split is
> useless.
> 
> 
>> +
>>   static void tgu_enable(struct tgu_drvdata *drvdata)
>>   {
>>       tgu_write_all_hw_regs(drvdata);
>> @@ -104,6 +234,38 @@ static const struct attribute_group 
>> tgu_common_grp = {
>>   static const struct attribute_group *tgu_attr_groups[] = {
>>       &tgu_common_grp,
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
>>       NULL,
>>   };
>> @@ -111,6 +273,8 @@ static int tgu_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>   {
>>       struct device *dev = &adev->dev;
>>       struct tgu_drvdata *drvdata;
>> +    unsigned int *priority;
>> +    size_t priority_size;
>>       int ret;
>>       drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> @@ -128,8 +292,31 @@ static int tgu_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>       if (ret)
>>           return ret;
>> -    drvdata->enabled = false;
> 
>> +    tgu_set_reg_number(drvdata);
>> +    tgu_set_steps(drvdata);
> 
> As mentioned above, combine both ?
> 
>> +
>> +    drvdata->value_table =
>> +        devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
> 
> Could we not embed this in the drvdata without dynamic allocation ?
>> +    if (!drvdata->value_table)
>> +        return -ENOMEM;
>> +    priority_size = MAX_PRIORITY * drvdata->num_reg * drvdata->num_step;
>> +
>> +    priority = devm_kcalloc(dev, priority_size,
>> +                sizeof(*drvdata->value_table->priority),
>> +                GFP_KERNEL);
>> +    if (!priority)
>> +        return -ENOMEM;
>> +
>> +    drvdata->value_table->priority = priority;
>> +
>> +    drvdata->enabled = false;
>> +    /*
>> +     * Create the sysfs groups only after the backing storage is fully
>> +     * allocated, otherwise userspace could open a priority attribute 
>> and
>> +     * have tgu_dataset_show() dereference an uninitialised value_table.
>> +     * This also keeps the error paths above free of sysfs teardown.
>> +     */
>>       ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>>       if (ret) {
>>           dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
>> index ebba49402a20..7a3e1161c4cf 100644
>> --- a/drivers/hwtracing/qcom/tgu.h
>> +++ b/drivers/hwtracing/qcom/tgu.h
>> @@ -6,10 +6,137 @@
>>   #ifndef _QCOM_TGU_H
>>   #define _QCOM_TGU_H
>> +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +
>>   /* Register addresses */
>>   #define TGU_CONTROL        0x0000
>>   #define TGU_LAR        0xfb0
>>   #define TGU_UNLOCK_OFFSET    0xc5acce55
>> +#define TGU_DEVID        0xfc8
>> +
>> +#define TGU_DEVID_SENSE_INPUT(devid_val) \
>> +    ((int)FIELD_GET(GENMASK(17, 10), devid_val))
>> +#define TGU_DEVID_STEPS(devid_val) \
>> +    ((int)FIELD_GET(GENMASK(6, 3), devid_val))
>> +#define TGU_BITS_PER_SIGNAL 4
>> +#define LENGTH_REGISTER 32
>> +
>> +/*
>> + *  TGU configuration space                              Step 
>> configuration
>> + *  offset table                                         space layout
>> + * x-------------------------x$                          
>> x-------------x$
>> + * |                         |$                          | 
>>              |$
>> + * |                         |                           |   
>> reserve   |$
>> + * |                         |                           | 
>>              |$
>> + * |coresight management     |                           
>> |-------------|base+n*0x1D8+0x1F4$
>> + * |     registers           |                     |---> | 
>> priority[3]  |$
>> + * |                         |                     |     
>> |-------------|base+n*0x1D8+0x194$
>> + * |                         |                     |     | 
>> priority[2]  |$
>> + * |-------------------------|                     |     
>> |-------------|base+n*0x1D8+0x134$
>> + * |                         |                     |     | 
>> priority[1]  |$
>> + * |         step[7]         |                     |     
>> |-------------|base+n*0x1D8+0xD4$
>> + * |-------------------------|->base+0x40+7*0x1D8  |     | 
>> priority[0]  |$
>> + * |                         |                     |     
>> |-------------|base+n*0x1D8+0x74$
>> + * |         ...             |                     |     |  
>> condition  |$
>> + * |                         |                     |     |   
>> select    |$
>> + * |-------------------------|->base+0x40+1*0x1D8  |     
>> |-------------|base+n*0x1D8+0x60$
> 
> minor nit:                       ^^^
> s/base+0x40+1*0x1D8/step[0] + 0x1D8 and so on, for the above
> 
>> + * |                         |                     |     |  
>> condition  |$
>> + * |         step[0]         |-------------------->      |   
>> decode    |$
>> + * |-------------------------|-> base+0x40               
>> |-------------|base+n*0x1D8+0x50$
>> + * |                         |                           | 
>>              |$
>> + * | Control and status space|                           |Timer/ 
>> Counter|$
>> + * |        space            |                           | 
>>              |$
>> + * x-------------------------x->base                     
>> x-------------x base+n*0x1D8+0x40$
> 
> Also for each frame, you don't have to describe "base+n*..." that makes
> it unnecessarily crowded and complicated to read.
> 
>> + *
>> + */
>> +#define STEP_OFFSET 0x1D8

Looking back at the patch 4, this is not really an offset, but size of a 
STEP. This is true for all the _OFFSETs below.

>> +#define PRIORITY_START_OFFSET 0x0074
>> +#define PRIORITY_OFFSET 0x60
> 
>  From the diagram, it is CONDITION_SELECT ? Having two offsets named 
> after PRIORITY is confusing.
> 
> 
>> +#define REG_OFFSET 0x4

this one is more wierd, this rather, size of a REG not OFFSET of a REG.

Please could you rename them as such ?


Cheers
Suzuki


>> +
>> +/*
>> + * Upper bounds on the DEVID/DEVID2-derived per-region counts. The 
>> TGU register
>> + * layout is fixed by the offset macros above and mirrored by the 
>> static sysfs
>> + * attribute tables in tgu.c, so these are the largest counts the 
>> driver can
>> + * both address within the mapped window and expose to userspace:
>> + *
>> + *   TGU_MAX_STEPS            static tables define step0..step7
>> + *   TGU_MAX_PRIORITY_REGS    STEP_PRIORITY_LIST defines reg0..reg17
> 
> What are these ? PRIORITY regs is 0-3 ? Do you mean each priority has 
> 0-17 registers ? (See, the description using base+n*.. for the "step" 
> frame is making this worse). You may move it down as a separate figure.
> 
>  From my maths:
> For pritority[0] -> 0xD4-0x74 = 0x60 => 0x18 => 24 registers! not 18!
> 
> What am I missing ?
> 
> 
>> + *
>> + * A device whose DEVID reports counts above these bounds is clamped, 
>> so writes
>> + * never fall outside the ioremap()'d window or spill into an 
>> adjacent region.
>> + */
>> +
>> +#define TGU_MAX_STEPS                  8
>> +#define TGU_MAX_PRIORITY_REGS          18
>> +
>> +/* Calculate compare step addresses */
>> +#define PRIORITY_REG_STEP(step, priority, reg)\
>> +    (PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
>> +     REG_OFFSET * reg + STEP_OFFSET * step)
>> +
>> +#define tgu_dataset_rw(name, step_index, type, 
>> reg_num)                  \
>> +    (&((struct tgu_attribute[]){ {                                   \
>> +        __ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
>> +        step_index,                                              \
>> +        type,                                                    \
>> +        reg_num,                                                 \
>> +    } })[0].attr.attr)
>> +
>> +#define STEP_PRIORITY(step_index, reg_num, 
>> priority)                     \
>> +    tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
>> +            reg_num)
>> +
>> +#define STEP_PRIORITY_LIST(step_index, priority) \
>> +    {STEP_PRIORITY(step_index, 0, priority), \
>> +     STEP_PRIORITY(step_index, 1, priority),  \
>> +     STEP_PRIORITY(step_index, 2, priority),     \
>> +     STEP_PRIORITY(step_index, 3, priority),  \
>> +     STEP_PRIORITY(step_index, 4, priority),  \
>> +     STEP_PRIORITY(step_index, 5, priority),  \
>> +     STEP_PRIORITY(step_index, 6, priority),  \
>> +     STEP_PRIORITY(step_index, 7, priority),  \
>> +     STEP_PRIORITY(step_index, 8, priority),  \
>> +     STEP_PRIORITY(step_index, 9, priority),  \
>> +     STEP_PRIORITY(step_index, 10, priority), \
>> +     STEP_PRIORITY(step_index, 11, priority), \
>> +     STEP_PRIORITY(step_index, 12, priority), \
>> +     STEP_PRIORITY(step_index, 13, priority), \
>> +     STEP_PRIORITY(step_index, 14, priority), \
>> +     STEP_PRIORITY(step_index, 15, priority), \
>> +     STEP_PRIORITY(step_index, 16, priority), \
>> +     STEP_PRIORITY(step_index, 17, priority), \
>> +     NULL                   \
>> +    }
>> +
>> +#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>> +    (&(const struct attribute_group){\
>> +        .attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, 
>> priority),\
>> +        .is_visible = tgu_node_visible,\
>> +        .name = "step" #step "_priority" #priority \
>> +    })
> 
> Please could you move these macro magic to the .c file ?
> 1. Nobody else reuses them ?
> 2. It is really difficult to go back and forth to check what each macro 
> means, given how complex it is.
> 
>> +
>> +enum operation_index {
> 
> why are we calling it operation_index ?
> 
>> +    TGU_PRIORITY0,
>> +    TGU_PRIORITY1,
>> +    TGU_PRIORITY2,
>> +    TGU_PRIORITY3,
>> +};
>> +
>> +/* Maximum priority that TGU supports */
>> +#define MAX_PRIORITY 4
>> +
>> +struct tgu_attribute {
>> +    struct device_attribute attr;
>> +    u32 step_index;
>> +    enum operation_index operation_index;
> 
> u8 priority ?
> 
>> +    u32 reg_num;
> 
> u8 reg_num ?
> 
>> +};
>> +
>> +struct value_table {
>> +    unsigned int *priority;
>> +};
>>   static inline void TGU_LOCK(void __iomem *addr)
>>   {
>> @@ -36,6 +163,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>>    * @lock: Mutex serialising enable/disable and the associated PM 
>> runtime
>>    *        reference counting against concurrent sysfs access
>>    * @enabled: Flag indicating whether the TGU device is enabled
>> + * @value_table: Store given value based on relevant parameters
>> + * @num_reg: Maximum number of registers
>> + * @num_step: Maximum step size
>>    *
>>    * This structure defines the data associated with a TGU device,
>>    * including its base address, device pointer, the lock serialising
>> @@ -46,6 +176,9 @@ struct tgu_drvdata {
>>       struct device *dev;
>>       struct mutex lock;
>>       bool enabled;
>> +    struct value_table *value_table;
> 
> Why this ? why not
> 
>      struct value_table value_table ?
> 
> Surely, we seem to be dynamically allocating the priorities etc from 
> there. But do we need dynamic allocation for value_table field as
> such ?
> 
> Suzuki
> 
>> +    int num_reg;
>> +    int num_step;
>>   };
>>   #endif
> 

