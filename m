Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22DC3EB80E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448737; cv=none; b=O1rb/yrDjdo0JhXycu53GiB+rmY9pAcmRM3JhrHC24Kg/I9Vqx1McYEubTg2VBDK1VxSWWNkqzr8UOrCS9ahv86cr5M+e9NJ/uX1vtJihcItd+RmOJsK7Ta6BwG5N5zqAefoxY5AucVwmSoQcCi7Vt/H4nVom7IBj+QNm3s5oz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448737; c=relaxed/simple;
	bh=4Zu74VhTWTa5hjc1yCr/RvLWmNzR5mCAH1GH6wNx1q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gl4FPUE+1HPAf5Sklj9EYBly/hh8skaL7UsslIPwBXR4N+TlT//J+42Z6Iy5YYW2st/u3Nn1aiwb1PTFTEqKrZP/N9nhORpzYfhymvyTIg9QdcEzEfAiiTXjBCr4UetnscSU6FYKItkZOeP+lS7vnfyVjH7TY0UOYuMtYFXOH/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g2X8SD6A; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g2X8SD6A"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c5358fc28so3072854f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791448734; x=1792053534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CuEDhaX34U8xOIhszihEIt8O7F9LQYHVFpCJreLp60=;
        b=g2X8SD6AX1OAuUWiowt0AUyYKVvzl7e8/lZDgKkjT1JYOrpcWiXbZkR3mOFq3A22YQ
         zUfCiJJh6/9g0eK3S9OdEjpiqOrQD01FphTAc/xQCXABC1xvpSujzdfaCBHMmo2sOBdW
         iXCN3TUaZazOhz7htlOMngwqrtqf2/+mvF4MznndgJONBJMpFP34nKiwsq9WgBjDOfqt
         shlvt6r4ay2zQZ6B1qDMrlxZrPClJ57YnHEDoMTZUXUO+p1/qYmx3Et0p23letKQAsBG
         ZBEWBWjZyj52AQlILOI+pJFEeMlbfOyJBNghp5RfGSdWJdyuRnXXThb2nFqaZY3oUyMa
         /xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448734; x=1792053534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CuEDhaX34U8xOIhszihEIt8O7F9LQYHVFpCJreLp60=;
        b=nEZoOGr/FpAChHDmLm9fM3py0vwSjiupdSaLslOFaqFRw1fVjihZyqc98HLU0g+Auf
         hyYiOXuy6aAgou9QD/HSw1xJ4ALUnepjRjsQDNpNNauxIvyx+KZOOM92e9ws62QDBA/P
         cWDduT04iIQnLS6PkxGxi7yvHnAbAOxJxJ/Ud94E/cxAzZFHAzb1LnLM26MuYQ/+/49D
         6TWPXKRGKMyIFEmJfhQMQFpap/41mH3E2/tpAm59wdEzZflQz9SWUTf86UkHm0nwLPBe
         CgnTRjP31x6sy5dztBuZ/E8g66z8SVseo8V/ROm0qzngCOj2rReUeKp/ocVjM3ltuXHD
         4SNQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4iDWeMwhYaxR6NZb1psZXF0K8BraTGIpiz54IAB2K4CkE4mFGSIHlE3wPLJqYT8Ute7bFVX8KYDiUrMU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIomq+saJ3WbOSP/iHvyuVW+m1kpG0NBRdrKODuie+ZW4mIGsv4
	IpiX8j5cwr1gqc7FIHzaFrFHbzQryYav47NUC/cfVFQOghEzGcfqhXaJdoCfq/ErL/vkkWCwQ0F
	2VEr57bE=
X-Gm-Gg: AYBFou2APW8xw6av9zm92zBxydATi3p9sy9TtUHye89GhNpG0nMgoOqk6gR1yy9CrMw
	8X9GTkHN0fwYvwQqMtaNrvxeXhnGrAZ6hWhk2I5to8p3relMN+4O1e/PtXXOJIHFybeBZ1b8e20
	pfxj1rf8drZpASQ+siMulQs3ywOrsdZkrOxkrguGXCspsjfkts+oW3MTV9IbqL30XpE31LYAF/I
	tZxcVXhxjcTRT2RKh60tsTeMha63E3mXUk9Ul7aEq63YxYZeO1eda1asw8ABwTB1AeJQ2OnToxi
	5PKIpHlrYFY4GXQvYbJeGxulscQDJ/yNPCvRabuI5tX14LOF6iPbmEGJ1MAYsC6BVeb05LRgVBc
	a1EaUgw5Yf2E9l2HAmTEfQ6/ZdY2kUZAuxBEI8TSsxSm4fSUuJG7G1anNYDD4hv09QZ10pEDHSh
	HwUrT9BHDsfGiPjs5SUt4NEj3x+RqnN4PmmngYhDIUD7drfgK85Sxmy3lOYsJyaXSiusOwlzle6
	7Q=
X-Received: by 2002:adf:f001:0:b0:48a:fbcf:6f43 with SMTP id ffacd0b85a97d-48c72897157mr6861745f8f.54.1791448734070;
        Thu, 08 Oct 2026 01:38:54 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d04c0fsm9919121f8f.10.2026.10.08.01.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 01:38:53 -0700 (PDT)
Message-ID: <ca62f18f-8fa6-4ba1-aae1-59c2db242ab0@linaro.org>
Date: Thu, 8 Oct 2026 09:38:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] coresight: etm4x: Report whether the PMU counts
 external output 1
To: Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261001063744.2143819-1-aaupov@fb.com>
 <20261007162406.GA26205@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261007162406.GA26205@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/10/2026 17:24, Leo Yan wrote:
> Hi Amir,
> 
> Thanks for the patch. I have a few initial comments below. We may have
> further feedback after our internal review.
> 
> On Wed, Sep 30, 2026 at 11:37:43PM -0700, Amir Ayupov wrote:
> 
> [...]
> 
>>   #define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
>>   #define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
>> +/* ETM external output 1 is countable by the PMU as TRCEXTOUT1 */
>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT1	0x0004
> 
> Do we need to tie this capability to TRCEXTOUT1? For example, Neoverse
> V2 exposes TRCEXTOUT0 through TRCEXTOUT3 as PMU events.
> 

Shouldn't we also use TRCEXTOUT0 instead of 1? Isn't 1 for devices that 
have two external outputs, but some devices might only have 1 output so 
only have TRCEXTOUT0?

>>   /* flags defining device instance matching - used in config match desc data. */
>>   #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
>> index e1a59b4345052..2847d2d7f7bed 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
>> @@ -174,9 +174,14 @@ static int etm4_cfg_load_feature(struct coresight_device *csdev,
>>   
>>   int etm4_cscfg_register(struct coresight_device *csdev)
>>   {
>> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>   	struct cscfg_csdev_feat_ops ops;
>> +	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
>>   
>>   	ops.load_feat = &etm4_cfg_load_feature;
>>   
>> -	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
>> +	if (drvdata->pmu_extout1)
>> +		match_flags |= CS_CFG_MATCH_CAP_PMU_EXTOUT1;
>> +
>> +	return cscfg_register_csdev(csdev, match_flags, &ops);
> 
> The current matching logic succeeds if a device and feature share any
> flag bit. If the feature sets both CS_CFG_MATCH_CLASS_SRC_ETM4 and
> CS_CFG_MATCH_CAP_PMU_EXTOUT1, it will still load on an ETM4 device that
> lacks the capability.
> 
> Could we check the capability separately when loading the feature,
> perhaps in cscfg_load_feat_csdev(), and skip it on unsupported devices?
> 
>> +static bool etm4_pmu_has_extout1(struct etmv4_drvdata *drvdata)
>> +{
>> +	int pmuver = read_pmuver();
>> +
>> +	if (!is_midr_in_range_list(etm4_pmu_extout1_cpus))
>> +		return false;
> 
> Based on specific CPU variant, we should already have identified
> TRCEXTOUT has supported.
> 
> So either we only base on MIDR list or we can figure out a reliable
> way to detect the feature dynamically.
> 

At least with ETE the ARM says:

  D4.6.12  External Outputs

  SRBKWBThe   TRCIDR0.NUMEVENT field shows how many ETEEvents are
              for the particular implementation

  0x4011, TRCEXTOUT1, Trace unit external output 1


  D14 PMU Event Descriptions

  The counter counts each event signaled by the trace unit on external
  event 1.

  It is IMPLEMENTATION DEFINED whether this event is available as an
  external input to the ETE.

  PMCEID0_EL0[49] reads as 1 if this event is implemented and 0
  otherwise.

The number of outputs and the PMU event are both discoverable. It 
specifically says that only the external input is implementation 
defined, implying that if it's available it's always connected as an output.

We could leave the MIDR list to only support errata when the external 
output isn't connected to the PMU event.



>> +
>> +	/* PMCEID0_EL0[63:32] describe events 0x4000-0x401f from PMUv3p1 */
>> +	if (!pmuv3_implemented(pmuver) || pmuver < ID_AA64DFR0_EL1_PMUVer_V3P1)
>> +		return false;
>> +	if (!(read_pmceid0() & BIT_ULL(32 + ARMV8_PMUV3_PERFCTR_TRCEXTOUT1 -
>> +				       ARMV8_PMUV3_EXT_COMMON_EVENT_BASE)))
>> +		return false;
>> +
>> +	/* nr_event is TRCIDR0.NUMEVENT, the number of events minus one */
>> +	return drvdata->nr_event >= 1;
>> +}
> 
> [...]
> 
>> @@ -1116,6 +1116,13 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
>>   
>>   		if (err)
>>   			cscfg_config_desc_put(config_desc);
>> +	} else {
>> +		/*
>> +		 * The configuration is active but was not loaded on this
>> +		 * device, for example because the device lacks a capability
>> +		 * its features require. Fail rather than trace without it.
>> +		 */
>> +		err = -EINVAL;
>>   	}
> 
> This fixes a pre-existing issue. It is worther to put it in a separate
> patch with fixes tag:
> 
> An early return would also avoid the normal enable path's indentation:
> 
> 	if (!config_csdev_active)
> 		return -EINVAL;
> 
> 	err = cscfg_csdev_enable_config(config_csdev_active, preset);
> 	...
> 
> Thanks,
> Leo

