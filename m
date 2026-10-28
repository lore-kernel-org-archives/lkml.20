Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182475;
	b=oRZv46VCWnfqTRf7+WetLhJMAobzrxMmP5AuhqnSUP4hgX0sTY4JOdDAH+rdSoGWZUSA
	 QbKqGfh4pPDUC0+w4kFwl76osxs8u4/lWoFE3sJHJagpPEHYBhaCdDwtWtJcHztUaTDV8
	 hDgXFPkxYm/OtTVRfhx49a0dZ4D3KPugB1Exmwt+4Rd4KI2CqGM5ib08upOp19ajSC5du
	 oDhNacTxRdOA3aqJZZL7UAQkX1Zkm0yPR7OpJyuKireaHwDRbgxL+ulRpnengGiqjhNUJ
	 BifR+SaQdyEepYjNnafMYuEq/i8xBr6i6KWjOhEDm4sQsTPYkfQESLq5T5L0l2ChRzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182475;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=NXqfJx/4sDzowXeGWOnLU0gI6PbiTuWJ4AyhpQ8TWvw=;
	b=3O/Wrtn43+c0JCQ3X1KmfFmgk2PQm+UJhlilLOb/ZPD9JfHrxSuqXDipmH76bC3XZFXs
	 oscIM1BjM8lNO7C0hgmBh+s8PpU8K+lkRFmAlSzXYb9fZj//WFES0FUv3NNFrCEsBWIdp
	 B8C2RJ+JEsnuWhGICZXINUiJuRg7uhC/2i/qfe5Qmt9KXQn0Y+NQZxNyxbICjl+T2gmkX
	 GtcsStIz9oZGYreHxIKFQ7MOg4G8qZxSAxlbPcir3uvqzaohjT0aexjY7pQQIi/AgXlHc
	 WgM1sRkJYxcRsL53yDaR+N4Zkf0agA3B/3KWqgmISiHWn4ECX+kR8dgy3yXjtbsTRWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N5F2WDpm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70135606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70135606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N5F2WDpm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EE102E9D;
	Wed, 28 Oct 2026 03:14:30 -0700 (PDT)
Received: from [10.57.16.117] (unknown [10.57.16.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD77E3F7B4;
	Wed, 28 Oct 2026 03:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793182473; bh=uezKJlNlNwhvOmrpbfGGH+riPupzeBfdHtfumoMYw3c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N5F2WDpm2rFVKi8/R0XyvsPlnYo2jzO7/gXd7IhSq7i/gpaa/vgYGgzDKyzHNmodj
	 Ut2V8X1tsuDUuD/BeO/Uq2Mebd9ZKW6cwfyeXBoZCLpe08DZhJDMCFkvGnTmf9kCO/
	 bH8fucxMB5hxHEfAui6ZvtMHBkbwH+kpB32QnJw8=
Message-ID: <3eda6e99-291f-40b1-9fd8-13ca193b5fa4@arm.com>
Date: Wed, 28 Oct 2026 10:14:30 +0000
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
Subject: Re: [PATCH v4 01/10] coresight: configfs: Don't assume active until
 cscfg_mgr is set
Content-Language: en-GB
To: James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>, Suyash Mahar <smahar@meta.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
 <20261016-james-cs-multiple-per-threads-v4-1-dedf961aca0e@linaro.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-james-cs-multiple-per-threads-v4-1-dedf961aca0e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 11:46, James Clark wrote:
> Perf's etm_setup_aux() calls cscfg_activate_config() and dereferences
> cscfg_mgr, which can be done after coresight_init() has initialized the
> Perf PMU but before cscfg_init() has finished while the driver is still
> loading.
> 
> Fix it by only assuming cscfg is initialized if cscfg_mgr is set.
> 

Is this possible though ? The component drivers are dependent on the
coresight-core being loaded and this is not complete until the coresight
module has been initialised.

Or the other way to fix this is delay the etm_perf init after the cscfg
init, which clearly is the order of dependencies ?

Cheers
Suzuki


> Fixes: a0114b4740dd ("coresight: etm-perf: Update to activate selected configuration")
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-syscfg.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index 2bfdd7b45e49..7e3c9844bc00 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -26,6 +26,11 @@ static DEFINE_MUTEX(cscfg_mutex);
>   /* only one of these */
>   static struct cscfg_manager *cscfg_mgr;
>   
> +static enum cscfg_load_ops cscfg_get_state(void)
> +{
> +	return cscfg_mgr ? cscfg_mgr->load_state : CSCFG_UNLOAD;
> +}
> +
>   /* load features and configuations into the lists */
>   
>   /* get name feature instance from a coresight device list of features */
> @@ -581,7 +586,7 @@ int cscfg_load_config_sets(struct cscfg_config_desc **config_descs,
>   	int err = 0;
>   
>   	mutex_lock(&cscfg_mutex);
> -	if (cscfg_mgr->load_state != CSCFG_NONE) {
> +	if (cscfg_get_state() != CSCFG_NONE) {
>   		mutex_unlock(&cscfg_mutex);
>   		return -EBUSY;
>   	}
> @@ -662,7 +667,7 @@ int cscfg_unload_config_sets(struct cscfg_load_owner_info *owner_info)
>   	struct cscfg_load_owner_info *load_list_item = NULL;
>   
>   	mutex_lock(&cscfg_mutex);
> -	if (cscfg_mgr->load_state != CSCFG_NONE) {
> +	if (cscfg_get_state() != CSCFG_NONE) {
>   		mutex_unlock(&cscfg_mutex);
>   		return -EBUSY;
>   	}
> @@ -902,7 +907,7 @@ static int _cscfg_activate_config(unsigned long cfg_hash)
>   	struct cscfg_config_desc *config_desc;
>   	int err = -EINVAL;
>   
> -	if (cscfg_mgr->load_state == CSCFG_UNLOAD)
> +	if (cscfg_get_state() == CSCFG_UNLOAD)
>   		return -EBUSY;
>   
>   	list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item) {
> 

