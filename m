Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100125;
	b=q0pfdoroAYEh5jrfGupkABLRoM/MUFxU/aUynw2SM0AiPDefPNybCVwG8A2lP8LQpnfb
	 wgrviQVWNMw2/JpytgsF7iiwgmVIislJTC21QDeSZ/s3gzFaFn/7ajfPTEbVUXj+uA6Eo
	 m9yVP99TbMFtExdFsXLdn2SEVgekO1pe79oMhwsMm8z76Ds/EgYpLN7L1jqOWVtOhRIAa
	 Q5vMorNkcthQcGuMW79BhzhLJ9MXFTINl5WR48hJ3l8YolpOKsFF5NQ4ct0FOU3w0gwHP
	 ytJjN3gBx3lu86H79b3/tMwSPIhFt0fn6gF0dBRuLgTqDCIcA50LNB8kXFKysT3Rxug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100125;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jfyUDsKhlOqT9ZVuYcSgjElm7tsdbAKRMFhtvXe6L9A=;
	b=jjIyNnJoIZ/AD8BKpBbqHVPqEanlqYjF0w4DF87Zx1phAxPGxOpqYZMBOc8c5EI240uV
	 bds33U9a9Qed+UNyOq5X5sCZQS30V4G7zr4aqv/LTcVfgy11+9IbD+slRIMxMa5qSNHmT
	 2JqBcTaZDFyWHBiKkRd6kdyGYfqH8zL7HylFbcc/HzIzg2N5WRMMRg7741zHTJWXzRT7D
	 hwh7pjV9b9Pmmoa/joW4afaPoqtQEGwaBEmxdLtBLGDm5daxN4iweRF3lGfrxwQrfx5FN
	 90BrGU/u9fe+BDWp2XApFMi6DQ4FyeTVzQgYpoHvn50M8x6RNH8Ul8CVgOeFsznaYNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ddLT2Zf5;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE90606A323;
	Tue, 27 Oct 2026 11:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDE90606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ddLT2Zf5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C580D15A1;
	Tue, 27 Oct 2026 04:21:59 -0700 (PDT)
Received: from [10.57.10.231] (unknown [10.57.10.231])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3740A3F59E;
	Tue, 27 Oct 2026 04:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793100122; bh=838wFtDFsF0HokI538R5ofd77JbIMlhOLC16rwoHK7s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ddLT2Zf5YQBgKygXg943E7oErBMT3tunlYUxi1c2QV3J7lV97pOhC5X6oYoLTnzyx
	 kcEHAurLuaud35aWmyo7L/LpN4baP1jt+0SlVLTZMdMxxdk43dhKxBNPhg/Pf23EbK
	 fI47paTsb38KgDdHi4IVmMZQYK3vU+ixcdKUBAaE=
Message-ID: <82adee03-a169-4106-99f2-7624a4926037@arm.com>
Date: Tue, 27 Oct 2026 11:21:59 +0000
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
Subject: Re: [PATCH v2 2/4] coresight: syscfg: Match feature capabilities
 separately from device class
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>
Cc: James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-3-aaupov@fb.com>
 <20261021143958.GH26205@e132581.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261021143958.GH26205@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/10/2026 15:39, Leo Yan wrote:
> On Mon, Oct 12, 2026 at 04:05:21PM -0700, Amir Ayupov wrote:
> 
> [...]
> 
>> --- a/drivers/hwtracing/coresight/coresight-config.h
>> +++ b/drivers/hwtracing/coresight/coresight-config.h
>> @@ -30,6 +30,12 @@
>>   #define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
>>   #define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
> 
> It is good to introduce a marco:
> 
>    #define CS_CFG_MATCH_CLASS_MASK       GENMASK_U32(7, 0)
> 
>> +/*
>> + * flags defining device capabilities a feature can require. A feature loads on
>> + * a device that matches one of its classes and has all of its capabilities.
>> + */
>> +#define CS_CFG_MATCH_CAP_MASK		0x0000ff00
> 
> To make the mask explicitly 32-bit unsigned:
> 
>    #define CS_CFG_MATCH_CAP_MASK		GENMASK_U32(15, 8)
> 
>> +
>>   /* flags defining device instance matching - used in config match desc data. */
>>   #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
> 
> Not an issue with this patch, but CS_CFG_MATCH_INST_ANY appears to be
> unused and could be removed in a separate cleanup patch.
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
>> index a816c22c87bc8..1545d64afec01 100644
>> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
>> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
>> @@ -172,7 +172,21 @@ cscfg_alloc_csdev_feat(struct coresight_device *csdev, struct cscfg_feature_desc
>>   }
>>   
>>   /* load one feature into one coresight device */
>> +/*
>> + * A feature matches a device that shares one of its class flags and has all of
>> + * the capability flags it requires.
>> + */
>> +static bool cscfg_match_feat_csdev(u32 feat_flags, u32 csdev_flags)
>> +{
>> +	u32 caps = feat_flags & CS_CFG_MATCH_CAP_MASK;
>> +
>> +	return (feat_flags & csdev_flags & ~CS_CFG_MATCH_CAP_MASK) &&
>> +	       (csdev_flags & caps) == caps;
> 
> For clearer comparison conditions:
> 
>         /* Class type must be matches */
>         if ((feat_flags & CS_CFG_MATCH_CLASS_MASK) !=
>             (csdev_flags & CS_CFG_MATCH_CLASS_MASK)
>             return false;

Why not use FIELD_GET() to compare to make it more explicit ?

> 
>         /* No required capabilities miss from the device */
>         if (feat_flags & ~csdev_flags & CS_CFG_MATCH_CAP_MASK)
>             return false;

Same here.

Suzuki>
>         return true;
> 
> Thanks,
> Leo

