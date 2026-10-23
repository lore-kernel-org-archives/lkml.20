Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749440;
	b=fIevRwkdIc9vYCqxXklxcq6G0m3k0Ujw2uCTSdsbGJ1qxg2sJZ7jaZpMCk64fs26t8yY
	 1cXbrcY9Ful9cZ1qVBUSt523YmNSfBz8AijlVm7WDc9yijFJG7W3CQ2zKQA4R8UnwtvX1
	 S0VtPQRT1RXqa736NbIyseceapJn7TjcCXBWOIpEpNdT0MGsCYBxwmh+Zw7ekhHhdKxLN
	 LNlXxtavtUgZ6+81MO6/6F81LV0yp7V4FtJJsy3TOIl6CYiJTIGcrFARH5TIAauSiOKBE
	 6ZifFskbwYmSoriuCDEhLvSM5dP5Js2lnNf2EbOxNWjDPAfS07UoD93uyy2xX+2RjVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xvvqzujp+UcUXklzEphgGnO39VToizQWS1KqHHoKSVA=;
	b=m6asSbJqhWmJOaazQZpIq7xsLglatmsNnkHF0Zzp/VIx48HqjAYpFns8ICbprRIeTvR2
	 vf32QzI8qKklv4HuqGPsCxMIvRjKwsJeo9NNAtxU1rEejdHmkTD8jFsghTL5A7APFJYK1
	 y5ppG6exZPDMyKgC67Ab+9+xGdUlJlHk79/W/fZKa7wggh6fd57nzgfZ5vXe/ehDkBYsM
	 5fDtaVlzlyoWecdb/itMBmeQV/0lZrplzQwA5z02Pg+NCyipTGpHrG3g1g1rarl3ZH1QP
	 ywq/DzzqJuXLFWIL6HYmxe/TDIj1Et/ogqgi53vOdZA6CqHqgKF8eaIO6FjUaMG5BFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eZsyXKks;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DA2606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30DA2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eZsyXKks
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso7079375e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792749438; x=1793354238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xvvqzujp+UcUXklzEphgGnO39VToizQWS1KqHHoKSVA=;
        b=eZsyXKksxN8BCD/duKo2Y8veCkOWLcbAnxiyGv46/WB9VHF7IMqYt8OphXyMaeBwCv
         tv8PGwIyUUOpk1L7DfEnkqHP3mBYQo+Lfe87+4QaqX+63RMhy+wwjD85jxDZRaMYho0t
         rqzAbLNmne2l9ElHlEJjhA/Hete6uECRjPONA7S2F4JOdgAZLCymi/2Ryt3YKvUGocRJ
         2BUnBP9ShKBFOQHQGe04DTiCdgS2gvB65Jl0RX2pv8YhvnsfxqVRxWpGjhrUhdLSsDq8
         +iisK9BzcuuZPOIbgBAJYdtZ7teifs7at2VggpdCVhs8AvbF3PF4BnkpG4LHj+RSO1W4
         xvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749438; x=1793354238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvvqzujp+UcUXklzEphgGnO39VToizQWS1KqHHoKSVA=;
        b=J+s3kYnMM81mwapG1uXkcNA4iKwSG/dzrCLVqgqXK3kVItFyVzEAKDS4JDliCuuyVa
         quCAMZCF1i0aYAh3f7Hjw5biTcgfqfovZBVIixqKMGGqx3Y65QqQNFDdCve1cePs1uXF
         WZC5XnWo6z7MREOJxqEgBUvM2DYRg3EhCqh5SomdFk5ss4pPD2cOABrWDc26vjdz5R64
         M+QGZJiX5aEKN8ykek+pICi9klgvYqbWoDGzj6IJ8DIywRtDG1/ROUB9Y2gvV8VAIp3r
         phn82zCkVc55PPEZJJmyghPbCwss5WoKP8R28KClkwNFii1siTQj1xn+0uRI83aI/zF1
         gTPw==
X-Forwarded-Encrypted: i=1; AKwUvByrQXhhU6054LW3r1DhzJhf8annHuzCWs900pq70MrRfZc19GvAf6J58KgICMc3B7ygowmcr4wZgt8+K38=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5Ocz2y5u+kCbMqg2M/scCu5wHofYLNU0sPDRw5s0NjSmJ8Icv
	ndZDlt4b5eQQ1rFOxKi+tDiLiPYl/qx0akYxzMO4SmRsZ9qkEtep5ygxb8XrpWAsdKI=
X-Gm-Gg: AYBFou2x+iIswTrp7XTUL2gfLPg5OkjhoZYVWxdqSY392OFD1SqXntUz+mpNy5wTX/1
	EVv6/ap5u1mT4rs5MxWdM85NTsZCQ2RdZgBmLOKmKFQURBkhU8XpoAhEGhPL3sOgtiuWHnuF8xO
	WQxAMNXXweExkwaxdAvzCsD8yi/cD3q0yR50DW5bQlpYda96WfGmNTp6CFWXI0vnXgsrGO0JbPl
	81QBE91accG3BDUUL5enWsQTSanh1VsCQ/WM8e6slPYK7WHzaor8nxJBOgWzipWS73wUOMmWVcY
	XUino+ty7acf5O1Ydh0Jos+AYpcTZVWiQ5fDnWvCHM94ih061jeXWbFZIOmaR2ZtnjvHsFWUuet
	SshL4sjh4dVEdcnXRml0iY4UZl2GUKJ8z4mR+OmmN9LnfZccO5ZRkIu+/Y7yVmXjU4RwX3W0QUq
	ZGixgiE/UoPs02UrCu/eYEKTvdZaYWym9Zt2oK8JRW5fa/pykJPtDuNS4aSQUtVRT86TH4obKTn
	naWl5hp65HbEsZGaOLiqr0XFXIohICnGabrdnhrO9ppw+pVI5LRLY4Xn6gR
X-Received: by 2002:a05:600c:8b38:b0:49d:34:420d with SMTP id 5b1f17b1804b1-4a211cbaf90mr26505825e9.20.1792749438440;
        Fri, 23 Oct 2026 02:57:18 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2153c14c6sm21226225e9.1.2026.10.23.02.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:57:17 -0700 (PDT)
Message-ID: <8a8c036e-a78b-449d-9f02-8b9b4767dfe7@linaro.org>
Date: Fri, 23 Oct 2026 10:57:16 +0100
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
Subject: Re: [PATCH v2 3/4] coresight: etm4x: Report the external outputs the
 PMU counts
To: Amir Ayupov <aaupov@fb.com>, Leo Yan <leo.yan@arm.com>,
 Mike Leach <mike.leach@arm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-4-aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261012230527.750567-4-aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/10/2026 00:05, Amir Ayupov wrote:
> Some CPUs count the trace unit's external outputs as the PMU common
> events TRCEXTOUT0-3 (0x4010-0x4013), which lets a configuration drive a
> PMU event from trace unit events. Other CPUs, Neoverse N1 for example,
> have no such events, and a feature relying on them would silently do
> nothing there.
> 
> Detect at probe, on the trace unit's CPU, which outputs the PMU counts:
> the trace unit has an external output for each of its events
> (TRCIDR0.NUMEVENT), and from PMUv3p1, PMCEID0_EL0[63:32] reports which of
> the common events 0x4000-0x401f are implemented. Per the ETE
> specification, an implemented TRCEXTOUTn event counts external output n;
> only whether that output is also an external input is IMPLEMENTATION
> DEFINED.
> 
> Add a capability match flag for each output,
> CS_CFG_MATCH_CAP_PMU_EXTOUT(n), set it on ETMs whose PMU counts that
> output, and show it in the feature's configfs 'matches' attribute. With
> capabilities matched separately from the device class, a feature that
> requires one only loads on those ETMs.
> 
> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   .../hwtracing/coresight/coresight-config.h    |  4 +++
>   .../hwtracing/coresight/coresight-etm4x-cfg.c |  5 ++-
>   .../coresight/coresight-etm4x-core.c          | 32 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-etm4x.h |  3 ++
>   .../coresight/coresight-syscfg-configfs.c     |  7 ++++
>   5 files changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> index af6ef96b9ae01..10e95f5ecc8d9 100644
> --- a/drivers/hwtracing/coresight/coresight-config.h
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -35,6 +35,10 @@
>    * a device that matches one of its classes and has all of its capabilities.
>    */
>   #define CS_CFG_MATCH_CAP_MASK		0x0000ff00
> +/* trace unit external output n is countable by the PMU as TRCEXTOUTn */
> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT	8
> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_NR	4	/* TRCEXTOUT0-3 */
> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT(n)	BIT(CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT + (n))
>   
>   /* flags defining device instance matching - used in config match desc data. */
>   #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> index e1a59b4345052..09a7a6b86968c 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> @@ -174,9 +174,12 @@ static int etm4_cfg_load_feature(struct coresight_device *csdev,
>   
>   int etm4_cscfg_register(struct coresight_device *csdev)
>   {
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   	struct cscfg_csdev_feat_ops ops;
> +	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
>   
>   	ops.load_feat = &etm4_cfg_load_feature;
> +	match_flags |= (u32)drvdata->pmu_extout << CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT;
>   
> -	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
> +	return cscfg_register_csdev(csdev, match_flags, &ops);
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2247ad55d4442..1e78774025d13 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -30,6 +30,7 @@
>   #include <linux/uaccess.h>
>   #include <linux/perf_event.h>
>   #include <linux/perf/arm_pmu.h>
> +#include <linux/perf/arm_pmuv3.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/property.h>
> @@ -1368,6 +1369,35 @@ static void etm4_fixup_wrong_ccitmin(struct etmv4_drvdata *drvdata)
>   	}
>   }
>   
> +/*
> + * Find the external outputs of this trace unit that the PMU counts as the
> + * common events TRCEXTOUT0-3. The trace unit has an external output for each
> + * of its events, and PMCEID0_EL0[63:32] reports the common events
> + * 0x4000-0x401f from PMUv3p1.
> + *
> + * Must run on the CPU that owns the trace unit.
> + */
> +static u8 etm4_pmu_extout(struct etmv4_drvdata *drvdata)
> +{
> +	int pmuver = read_pmuver();
> +	u64 pmceid;
> +	u8 extout = 0;
> +	int n;
> +
> +	if (!pmuv3_implemented(pmuver) || pmuver < ID_AA64DFR0_EL1_PMUVer_V3P1)
> +		return 0;
> +
> +	pmceid = read_pmceid0() >> 32;
> +	/* nr_event is TRCIDR0.NUMEVENT, the number of events minus one */
> +	for (n = 0; n <= drvdata->nr_event; n++) {
> +		if (pmceid & BIT_ULL(ARMV8_PMUV3_PERFCTR_TRCEXTOUT0 + n -
> +				     ARMV8_PMUV3_EXT_COMMON_EVENT_BASE))
> +			extout |= BIT(n);
> +	}

Maybe an pmuv3_event_implemented() function in arm_pmuv3.c would be a 
better fit for this. It can do something like:

   if (event > ARMV8_PMUV3_EXT_COMMON_EVENT_BASE)
      return (event - ARMV8_PMUV3_EXT_COMMON_EVENT_BASE) & pmceid_IDhi;
   else
      return event & pmceid_IDlo;

etc.



> +
> +	return extout;
> +}
> +
>   static void etm4_init_arch_data(void *info)
>   {
>   	u32 etmidr0;
> @@ -1522,6 +1552,8 @@ static void etm4_init_arch_data(void *info)
>   	/* NUMCNTR, bits[30:28] number of counters available for tracing */
>   	drvdata->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
>   
> +	drvdata->pmu_extout = etm4_pmu_extout(drvdata);
> +
>   	coresight_clear_self_claim_tag_unlocked(csa);
>   	etm4_cs_lock(drvdata, csa);
>   	cpu_detect_trace_filtering(drvdata);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index df9e0748d71ec..11d95a4518b88 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -979,6 +979,8 @@ struct etmv4_save_state {
>    * @nrseqstate: The number of sequencer states that are implemented.
>    * @nr_seq_ctrls: The number of sequence state transition control registers.
>    * @nr_event:	Indicates how many events the trace unit support.
> + * @pmu_extout:	Bitmap of the external outputs n that the PMU counts as
> + *		TRCEXTOUTn.
>    * @nr_resource:The number of resource selection pairs available for tracing.
>    * @nr_ss_cmp:	Number of single-shot comparator controls that are available.
>    * @trcid:	value of the current ID for this component.
> @@ -1045,6 +1047,7 @@ struct etmv4_drvdata {
>   	u8				nrseqstate;
>   	u8				nr_seq_ctrls;
>   	u8				nr_event;
> +	u8				pmu_extout;
>   	u8				nr_resource;
>   	u8				nr_ss_cmp;
>   	u8				trcid;
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
> index 2b40e556be872..7893d40f2e9ea 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
> @@ -243,6 +243,7 @@ static ssize_t cscfg_feat_matches_show(struct config_item *item, char *page)
>   							struct cscfg_fs_feature, group);
>   	u32 match_flags = fs_feat->feat_desc->match_flags;
>   	int used = 0;
> +	int n;
>   
>   	if (match_flags & CS_CFG_MATCH_CLASS_SRC_ALL)
>   		used = scnprintf(page, PAGE_SIZE, "SRC_ALL ");
> @@ -250,6 +251,12 @@ static ssize_t cscfg_feat_matches_show(struct config_item *item, char *page)
>   	if (match_flags & CS_CFG_MATCH_CLASS_SRC_ETM4)
>   		used += scnprintf(page + used, PAGE_SIZE - used, "SRC_ETMV4 ");
>   
> +	for (n = 0; n < CS_CFG_MATCH_CAP_PMU_EXTOUT_NR; n++) {
> +		if (match_flags & CS_CFG_MATCH_CAP_PMU_EXTOUT(n))
> +			used += scnprintf(page + used, PAGE_SIZE - used,
> +					  "PMU_EXTOUT%d ", n);
> +	}
> +
>   	used += scnprintf(page + used, PAGE_SIZE - used, "\n");
>   	return used;
>   }

