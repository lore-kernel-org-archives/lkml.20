Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D91AC8D9;
	Mon, 12 Oct 2026 05:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791782658; cv=none; b=m5w8wIwO07SU+EzsQuusl0iDbe7+h3x+cwHBzI1AGAU+gMjiSTgoW6gpE75Qm2wCew7D4msWyFKz9SsC3MRVzq9xJojLGxGDfE99q7tk61dbdkkUxaRbuQtpSsisQVsVs6WLgkA5zS4uyHeuyxs+QHBT2WXIQoUpb6awCt1nqqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791782658; c=relaxed/simple;
	bh=zclrrB2E+CJXUbauVBs42oJjw1b3RDlUdNdF39aRi/k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fEpuGhx0wTuKYyH2mX0jMMnflLHl4+7fOC9r2lClQn0fX8WGHIQLD7TckuEM5fH1tVCmS426l1c9/19aGEqbeOqFYvLkPzl2NeAGvHcr9y7fU+ohNsdr7z4MYtrDabpLeuvIG+QmqQ6lHBzCBHwEYKHdn85ydG88UW04/2WxjE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b=u1kNGwI1; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b="u1kNGwI1"
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C54hdF586820;
	Sun, 11 Oct 2026 22:24:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=YiKpNYtN3q4y2NpClkVHM2Gp5Ly28ENYO2fOj
	9ddmVo=; b=u1kNGwI1ABZi5iDec+oE1QzQgqINV78BiaxRNMh5S2dLJKP/Gn12/
	qS6zXmxNUIDkx/dIh1znnkDQMoSFFZTdS2ejoOZGyS9AdcVwFVI70/B5MrT+rox5
	BT/PXzbZaHVYclsvtmmvmMV1rQxEhgyhbXblWlNQ+EWOfocOlbTAfdl+uqKkYy3G
	+fOUJt23okdNtebOeglxYk2quT9LXiqtjsNiJDsrHiuke7ckFmErURoMC0BdPExn
	dE0Nlw7UAuWtrjzVuzQ/oOgAO1rRpAOpme9bUGFW30j6iJ09aZ9R2TFmz4Uemm16
	QywvNwTSrOs8P+M7ufC5dMuFlN+3waSHQ==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4h7k3chwcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 11 Oct 2026 22:23:59 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:fe::f072) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.49; Mon, 12 Oct
 2026 05:23:59 +0000
From: Amir Ayupov <aaupov@fb.com>
To: James Clark <james.clark@linaro.org>
CC: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike
 Leach <mike.leach@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah
 Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] coresight: etm4x: Report whether the PMU counts external output 1
Date: Sun, 11 Oct 2026 22:23:36 -0700
Message-ID: <20261012052353.3071404-1-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <ca62f18f-8fa6-4ba1-aae1-59c2db242ab0@linaro.org>
References:
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyMSBTYWx0ZWRfX2p496gn2iHED
 9AjIqS+8Xvz0DLZzDjM6qCdEfFNZ8bZK5/qKRJUjZYik+XjBtvR6e2nPwX/v8CUJqQWIBj5N1p4
 nBdwDs86JQBZBGw++7x0b/tGQCh/CKZ7fW2Z5Xgy9x3NgvYLO7ZO8iicIhMjMMCRRL/t48uTHQf
 sYkeT9+3TOK9TyqqWxLEebk0TrxXeLhqiqimZoalu5BxNd6mW7o200pzlNBx/HM4nPiRxRH9OQO
 A8WFbuAY6+cgy3mGuZRwKYFRBCUyvLQh/Qb66+oc5Vy8Skvq5Gj2SYDgaZ2C1II8T86tKzkxYW0
 /h/+HvF5JiWcRj13wdvstH67EAbra9/UxlncoSVDJurWiEz3P2xz5EosBfnRdCTcSKAYo5AlYYW
 o2j10pVcgWQlYusbGxHSSpE2ofPCRYiYfO41+cjb/yj/fo22iCdZlz//A6P6exJ936VJbBe2lvs
 7LzzrsVQOMa0gENft9Q==
X-Proofpoint-GUID: y-fQXgSeMPHpEK_FzXDUsk6HJPoggu-g
X-Proofpoint-ORIG-GUID: y-fQXgSeMPHpEK_FzXDUsk6HJPoggu-g
X-Authority-Analysis: v=2.4 cv=Vom2kO2n c=1 sm=1 tr=0 ts=6acc6eef cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22 a=NEAV23lmAAAA:8
 a=KKAkSRfTAAAA:8 a=3ApLgukL6kD-7lwlGNAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyMSBTYWx0ZWRfX13TlHVK96Dgk
 a7bE6bshGp/PAA0EibnWer4EDSrjiOb3tQ4/8stC8mBB/WLWBnYeZOu4W8nUOhyG6wqLklsvHpj
 WdDxWBJ6W7lhb+tunzzoXDFwH2aae2o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01

On Thu, 8 Oct 2026 09:38:52 +0100 James Clark <james.clark@linaro.org> wrote:

Hi James,

Please see answers inline:

> 
> 
> On 07/10/2026 17:24, Leo Yan wrote:
> > Hi Amir,
> > 
> > Thanks for the patch. I have a few initial comments below. We may have
> > further feedback after our internal review.
> > 
> > On Wed, Sep 30, 2026 at 11:37:43PM -0700, Amir Ayupov wrote:
> > 
> > [...]
> > 
> >>   #define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
> >>   #define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
> >> +/* ETM external output 1 is countable by the PMU as TRCEXTOUT1 */
> >> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT1	0x0004
> > 
> > Do we need to tie this capability to TRCEXTOUT1? For example, Neoverse
> > V2 exposes TRCEXTOUT0 through TRCEXTOUT3 as PMU events.
> > 
> 
> Shouldn't we also use TRCEXTOUT0 instead of 1? Isn't 1 for devices that 
> have two external outputs, but some devices might only have 1 output so 
> only have TRCEXTOUT0?
> 

IIUC we can't because output 0 is driven by event 0, which stops tracing:
CoreSight Base System Architecture, RMHKBV (second bullet)

> For at least one of the events implemented in the trace unit, when this event occurs, any trace buffer which
> captures trace from this trace unit must be able to detect the event has occurred, and must be able to use this
> event to stop trace capture. One of the following mechanisms must be used:
> • Use of the trigger trace source ID value 0x7D as defined in [12], and use of the ATB Trigger Enable
> function in the trace unit.
> • Use of a dedicated mechanism when Event 0 occurs in the trace unit.


> >>   /* flags defining device instance matching - used in config match desc data. */
> >>   #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
> >> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> >> index e1a59b4345052..2847d2d7f7bed 100644
> >> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> >> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> >> @@ -174,9 +174,14 @@ static int etm4_cfg_load_feature(struct coresight_device *csdev,
> >>   
> >>   int etm4_cscfg_register(struct coresight_device *csdev)
> >>   {
> >> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> >>   	struct cscfg_csdev_feat_ops ops;
> >> +	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
> >>   
> >>   	ops.load_feat = &etm4_cfg_load_feature;
> >>   
> >> -	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
> >> +	if (drvdata->pmu_extout1)
> >> +		match_flags |= CS_CFG_MATCH_CAP_PMU_EXTOUT1;
> >> +
> >> +	return cscfg_register_csdev(csdev, match_flags, &ops);
> > 
> > The current matching logic succeeds if a device and feature share any
> > flag bit. If the feature sets both CS_CFG_MATCH_CLASS_SRC_ETM4 and
> > CS_CFG_MATCH_CAP_PMU_EXTOUT1, it will still load on an ETM4 device that
> > lacks the capability.
> > 
> > Could we check the capability separately when loading the feature,
> > perhaps in cscfg_load_feat_csdev(), and skip it on unsupported devices?
> > 
> >> +static bool etm4_pmu_has_extout1(struct etmv4_drvdata *drvdata)
> >> +{
> >> +	int pmuver = read_pmuver();
> >> +
> >> +	if (!is_midr_in_range_list(etm4_pmu_extout1_cpus))
> >> +		return false;
> > 
> > Based on specific CPU variant, we should already have identified
> > TRCEXTOUT has supported.
> > 
> > So either we only base on MIDR list or we can figure out a reliable
> > way to detect the feature dynamically.
> > 
> 
> At least with ETE the ARM says:
> 
>   D4.6.12  External Outputs
> 
>   SRBKWBThe   TRCIDR0.NUMEVENT field shows how many ETEEvents are
>               for the particular implementation
> 
>   0x4011, TRCEXTOUT1, Trace unit external output 1
> 
> 
>   D14 PMU Event Descriptions
> 
>   The counter counts each event signaled by the trace unit on external
>   event 1.
> 
>   It is IMPLEMENTATION DEFINED whether this event is available as an
>   external input to the ETE.
> 
>   PMCEID0_EL0[49] reads as 1 if this event is implemented and 0
>   otherwise.
> 
> The number of outputs and the PMU event are both discoverable. It 
> specifically says that only the external input is implementation 
> defined, implying that if it's available it's always connected as an output.
> 
> We could leave the MIDR list to only support errata when the external 
> output isn't connected to the PMU event.
> 
> 
> 
I searched for TRCEXTOUT in errata notices and couldn't find any, so I'm
dropping the list in v2. Feel free to add it in the future.

> >> +
> >> +	/* PMCEID0_EL0[63:32] describe events 0x4000-0x401f from PMUv3p1 */
> >> +	if (!pmuv3_implemented(pmuver) || pmuver < ID_AA64DFR0_EL1_PMUVer_V3P1)
> >> +		return false;
> >> +	if (!(read_pmceid0() & BIT_ULL(32 + ARMV8_PMUV3_PERFCTR_TRCEXTOUT1 -
> >> +				       ARMV8_PMUV3_EXT_COMMON_EVENT_BASE)))
> >> +		return false;
> >> +
> >> +	/* nr_event is TRCIDR0.NUMEVENT, the number of events minus one */
> >> +	return drvdata->nr_event >= 1;
> >> +}
> > 
> > [...]
> > 
> >> @@ -1116,6 +1116,13 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> >>   
> >>   		if (err)
> >>   			cscfg_config_desc_put(config_desc);
> >> +	} else {
> >> +		/*
> >> +		 * The configuration is active but was not loaded on this
> >> +		 * device, for example because the device lacks a capability
> >> +		 * its features require. Fail rather than trace without it.
> >> +		 */
> >> +		err = -EINVAL;
> >>   	}
> > 
> > This fixes a pre-existing issue. It is worther to put it in a separate
> > patch with fixes tag:
> > 
> > An early return would also avoid the normal enable path's indentation:
> > 
> > 	if (!config_csdev_active)
> > 		return -EINVAL;
> > 
> > 	err = cscfg_csdev_enable_config(config_csdev_active, preset);
> > 	...
> > 
> > Thanks,
> > Leo

Sent using hkml (https://github.com/sjp38/hackermail)
