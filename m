Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1592E29B200
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 01:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788917838; cv=none; b=BUQVMH76XF0IiFMoy/RHQELoWtK6CwTv+8M5cdI5NcfpxtzFyxsUM1qhj4iA/zrbUq+jgocbyEYDtWJO/BpEDSl5u2sRm/+mtVQtK0rMEqtFIiB4Wp9sga1mKbWjNaC4rBEEjRenIhUI7yhMFvv5GXc4l0/r3vBnLYu1Li/4Usk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788917838; c=relaxed/simple;
	bh=LGvzuxtUpqL+xrw+eACBogpbkxIn9Mu/G54L55A7tZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PcHN7jIYdatmm/UzyfTQ0oD/U/GlCed4nprL5f2tcJdpGxu6z4El/SSpCkt+cUnKrM8OHXu9Dm6Xoggp8X9otEp7vZhnzdZjom/nUdXUZ2zn+ROQY+kqogdKr7k30uuD9+poEhE8s5nDdSY0b0R7jz7Sdsn4hlS6W9X8EOgRFJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn; spf=pass smtp.mailfrom=kylinsec.com.cn; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: esmtpsz20t1788917764t4a6fb1d7
X-QQ-Originating-IP: D9Pl05dbGeaKOS7tx1oJRhLZXmdBd6e6KWmYLCa6ZJU=
Received: from [10.200.8.55] ( [175.0.204.93])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 09:35:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3883402434485805313
EX-QQ-RecipientCnt: 12
Message-ID: <ACA6A9E0ED9B6395+1c28050a-b7f5-419e-be5d-e88010592ed7@kylinsec.com.cn>
Date: Wed, 9 Sep 2026 09:34:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: syscfg: fix deadlock on device registration
 failure
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Miaoqian Lin <linmq006@gmail.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 qinyungao@kylinsec.com.cn, yingchao <dengyingchao@kylinsec.com.cn>
References: <604ED754D4669F40+20260825014717.2346-1-dengyingchao@kylinsec.com.cn>
 <20260908161614.GA200420@e132581.arm.com>
From: yingchao deng <dengyingchao@kylinsec.com.cn>
In-Reply-To: <20260908161614.GA200420@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MecPBsrNGoUEqtQxndwWIrCHJr851SeiRegRd9wbP5p6klNI3VEkpIRg
	/0fuhLTSXv2/bp3hwDgpEul32lbQcCdvXAqmmDYmeQWBV7lKFRJfoAGNtG4OVCYoYnQUG2E
	aOTSF+2n8trFv/zv3vvib99wgBPSZTS4Z3RTXTlLuGnd33ndDyFM/5tXnKDkIdjW379mFVG
	1taP5u6H1D5ZSHQmAH66+BoTuazY4s4DwLozkPw6Y0X/JqD2Kaz6soUByJUYPbm+aYhWvvj
	y6gp19asx13477UuiaLWjcuGFh7RkMaNUMB6ZroNdnU/BkvurLSaEjjW6R/oN1vxpNzeMo5
	XC/71EQ+Hp2bCQEQ0qv/Cl4ufSykkpXn1VuZKB8SU4M9+aD1nU/8KMsEXK9oeSSrJ+LiV8i
	XO5yvrd/iQDlge/iVZCxCrzffheNp9+QW6Ag4mhYVfNXiYaTTbpXMGpYwmkFRSdp6942N8/
	Sq4IqYXhoc5Fi/fKhguBidrq00j9IdC9FxV2WAdCHF3dWe0WXoDRXEWT4WGyvpZ6gfZ40cQ
	jNCBSiCoR1eWcGfqLAIr56DUD7jLp9zenDI6kBOkNR3ueHS4jlQIxZKod4DSy2PtqAGuWjd
	Ko6MBT2QwlhIXpa4cjmF/XyQC0Xvkm+nvgFAwt7ShD898IW8HJagVgbusBY0qtL2wtEeiV0
	YZ5zrOkjBVks7unsCAgi43KmgAOEyik6Nmsw93s8/WDT99HdvjVET/lp6f7aLWIAaO/8RhF
	V0f4sWhwx5vHB3XNEb0UtyE3vBWGbS77RkIJNcO81bcYdhLEJ4oWKFdTyFSa64vrYG9f8/6
	d/UXsJUjmOAXwmvRf0edfrBhXbWsB29Y/bwdQsJc89TsGkY1gX/5LVHLQ5tJrSIXCavl3O7
	oZ0EyafuCru4HnAz7UR/sbfNOY189tL98Kky0NMfgoE7VFfV5IiRbTGWkCMnyG7cjzi56Rk
	wv1jAoqpzveEcYjjlhecODkR+7yhqALn27M2zK7m4gzcVelzh2x4G/h7rLBo2iH/WQJrhxf
	PprxUwW7EPVHLGdcDiRgSXzrb0SuL5NTFwMNM3uxrLZRM7Vne3DFpvaKRQfmOMVmeHsojfl
	uDbcc+go8x4AG3twE5CmIk0PBL7Mb3emw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0


On 09/09/2026 00:16, Leo Yan wrote:
> On Tue, Aug 25, 2026 at 09:47:17AM +0800, yingchao wrote:
>
>> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
>> index 2bfdd7b45e49..d0e7e4720e46 100644
>> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
>> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
>> @@ -1210,8 +1210,14 @@ static int cscfg_create_device(void)
>>   	dev->init_name = "cs_system_cfg";
>>   
>>   	err = device_register(dev);
>> -	if (err)
>> +	if (err) {
>> +		/* put_device() triggers cscfg_dev_release() which takes
>> +		 * cscfg_mutex, so drop the lock first to avoid deadlocking.
>> +		 */
>> +		mutex_unlock(&cscfg_mutex);
>>   		put_device(dev);
>> +		return err;
>> +	}
> As module init and exit are serialized by the kernel, I don't think we
> need the mutex to protect the allocation and freeing of cscfg_mgr.
>
> The mutex should only be used for exclusively access cscfg_mgr.
> So how about the change below?
>
> ---8<---
>
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index 2bfdd7b45e49..2dd0b29f44e4 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -1173,27 +1173,21 @@ struct device *cscfg_device(void)
>   /* Must have a release function or the kernel will complain on module unload */
>   static void cscfg_dev_release(struct device *dev)
>   {
> -	mutex_lock(&cscfg_mutex);
>   	kfree(cscfg_mgr);
>   	cscfg_mgr = NULL;
> -	mutex_unlock(&cscfg_mutex);
>   }
>   
>   /* a device is needed to "own" some kernel elements such as sysfs entries.  */
>   static int cscfg_create_device(void)
>   {
>   	struct device *dev;
> -	int err = -ENOMEM;
> -
> -	mutex_lock(&cscfg_mutex);
> -	if (cscfg_mgr) {
> -		err = -EINVAL;
> -		goto create_dev_exit_unlock;
> -	}
> +	int err;
>   
>   	cscfg_mgr = kzalloc_obj(struct cscfg_manager);
>   	if (!cscfg_mgr)
> -		goto create_dev_exit_unlock;
> +		return -ENOMEM;
> +
> +	mutex_lock(&cscfg_mutex);
>   
>   	/* initialise the cscfg_mgr structure */
>   	INIT_LIST_HEAD(&cscfg_mgr->csdev_desc_list);
> @@ -1204,6 +1198,8 @@ static int cscfg_create_device(void)
>   	cscfg_mgr->load_state = CSCFG_NONE;
>   	raw_spin_lock_init(&cscfg_mgr->sysfs_store_lock);
>   
> +	mutex_unlock(&cscfg_mutex);
> +
>   	/* setup the device */
>   	dev = cscfg_device();
>   	dev->release = cscfg_dev_release;
> @@ -1213,8 +1209,6 @@ static int cscfg_create_device(void)
>   	if (err)
>   		put_device(dev);
>   
> -create_dev_exit_unlock:
> -	mutex_unlock(&cscfg_mutex);
>   	return err;
>   }
Agreed — module init/exit are serialized, so the mutex around cscfg_mgr 
alloc/free is unnecessary. Removing it from cscfg_dev_release() is the 
cleaner fix and also resolves
the deadlock. I'll send v2 with your suggested change.
