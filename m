Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC593A4F2F;
	Mon, 12 Oct 2026 04:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780041; cv=none; b=AMW7xcCB/2IHwyZW2tdOkbFuFnbcFGuWZR48zuxIhhCPuSVJNhdYnYCNPEGf6dZXZR3WzZk6rejnEjgoZL90hVS7shrs6le2kGM67pR/EYPmckGq0kofK17nnYSKFtNdvDfX6e92HYJf3zNhrckAVWcBs05CwfuLhvPbg+u/TWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780041; c=relaxed/simple;
	bh=AYLUr7O2YDjGAXY+xte2hQSWrH8GRUTx37fIOJSk+Gw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WvDhrbvy/qFW1ME7iNfdLWrokj5N/PuHOJprQLQVWagVaulOZrwnDJSpTiS5hzSykxO3YRq9sJ6FwTsIPbG7J6QUlh/ItIHT5P6bRByf8MzkXDC3sD9TnYt8o+XUTB/6MfKLZYY/mUO9kpwT1jwj0ETG7UPgDdE7hKoUSZaOWxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b=SaGSDK95; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b="SaGSDK95"
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69C3AVkd3251527;
	Sun, 11 Oct 2026 21:40:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=NkB50UzYJCQh16dgTRv6tLMDdkIikj7Vi9Ra7
	q8PbBs=; b=SaGSDK95sViE3fbrO4S4uJM+rcVk67ClMOvHE7UT4XeBjDSs/0N3M
	eG90hLjpbQCjFaPt4c6yjOSux8HxJRejN7WkQ2TW1DM9rtG751d42dF9wpCnvSrv
	tJmEEpqhHlb0XqFCrI4uXwSFeyk4NXpDcjARVPlfri11wRQlpbhw2dF57ZGqu5+w
	Eknv/MoFHw2P3r912cg+n5Wz19/HKQnWzLxhvyX9P/jfOPJMdtfCENOMd6RcmfcA
	547r9KtfjXzdNXhGT3nzNhZVuvhlcfY4F4x9fQdD/Da17LHWEwvUNHtKyJc3pxqh
	Nx8JrlVYXLieNFuw3CNDxo7VwYCm6LK4w==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by m0089730.ppops.net (PPS) with ESMTPS id 4h7gunabxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 11 Oct 2026 21:40:17 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.49; Mon, 12 Oct
 2026 04:40:16 +0000
From: Amir Ayupov <aaupov@fb.com>
To: Leo Yan <leo.yan@arm.com>
CC: James Clark <james.clark@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah
 Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] coresight: etm4x: Report whether the PMU counts external output 1
Date: Sun, 11 Oct 2026 21:39:47 -0700
Message-ID: <20261012044012.1563168-1-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261007162406.GA26205@e132581.arm.com>
References:
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAxOCBTYWx0ZWRfXyUPfzkURkRhu
 zzt0Gu9QDo9MOSPL11c5qYTLxwoF0siaIMu+FUIrIGf2xpxyLCeuV0oCLMZMAcpUi60KmB5dJnb
 g4QtwtRgcaXjuHLJFw6DGkMR1umzux8=
X-Authority-Analysis: v=2.4 cv=AOHP7KQI c=1 sm=1 tr=0 ts=6acc64b1 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=855S8uPTkML1Oy45N9_h:22 a=NEAV23lmAAAA:8 a=7CQSdrXTAAAA:8
 a=Cti6sqq06muRrUYK3wwA:9 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 6VqFM9uOa62AnW96puqzb8JKtYfXxMID
X-Proofpoint-ORIG-GUID: 6VqFM9uOa62AnW96puqzb8JKtYfXxMID
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAxOCBTYWx0ZWRfXyg2riyfGUl3v
 v8VRJgBQDgrvY1wFqfJb/5fbCIrkX2Qh4mgFnth1FgxDmNRnIZZRa5qOP+0n5RUbB5wAph+JxDZ
 CtoPkHNeH/GzpClrU/npWGprYZKcVNDlB9qpMLHTOvok4OHcxrQWxJhl/GGM3iPnvP6Ak620Y7l
 DrQNmkmbpRrA44j2Hgeu/2ghbCcG/cSEumNntKmwhL1Xc90rL4oOxUobebMEwRBGTJ19HHifaxK
 Qo++DHzNRgRNeo6NO7DhvX6LPf+4bzQhCPkTNJEfF+oWojOf+ucIK7y5PDIOT1767ij1/T8nq/1
 vvMmzuAuu6e2Mtc3Y4qIQ7e675ZArjl7Fhe+VY0m5GOzKVahs/rIy3FlHSHNrnEr45tV8+UDk1C
 9CMcBIufPSs0o+GUH5qYVhgItc3rUu3YJbT3kmsXKsl5z3Ie2k47KAT2WjM6aijcODjF0upw7D1
 Ad5Y08VLlBu2Zz3tk8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_01,2026-10-09_01,2025-10-01_01

Hi Leo,

Thank you for the review. See responses inline:

On Wed, 7 Oct 2026 17:24:06 +0100 Leo Yan <leo.yan@arm.com> wrote:

> Hi Amir,
> 
> Thanks for the patch. I have a few initial comments below. We may have
> further feedback after our internal review.
> 
> On Wed, Sep 30, 2026 at 11:37:43PM -0700, Amir Ayupov wrote:
> 
> [...]
> 
> >  #define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
> >  #define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
> > +/* ETM external output 1 is countable by the PMU as TRCEXTOUT1 */
> > +#define CS_CFG_MATCH_CAP_PMU_EXTOUT1	0x0004
> 
> Do we need to tie this capability to TRCEXTOUT1? For example, Neoverse
> V2 exposes TRCEXTOUT0 through TRCEXTOUT3 as PMU events.
> 

No, don't need to tie to 1, can use any one from 1 to 3.

> >  /* flags defining device instance matching - used in config match desc data. */
> >  #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > index e1a59b4345052..2847d2d7f7bed 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > @@ -174,9 +174,14 @@ static int etm4_cfg_load_feature(struct coresight_device *csdev,
> >  
> >  int etm4_cscfg_register(struct coresight_device *csdev)
> >  {
> > +	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> >  	struct cscfg_csdev_feat_ops ops;
> > +	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
> >  
> >  	ops.load_feat = &etm4_cfg_load_feature;
> >  
> > -	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
> > +	if (drvdata->pmu_extout1)
> > +		match_flags |= CS_CFG_MATCH_CAP_PMU_EXTOUT1;
> > +
> > +	return cscfg_register_csdev(csdev, match_flags, &ops);
> 
> The current matching logic succeeds if a device and feature share any
> flag bit. If the feature sets both CS_CFG_MATCH_CLASS_SRC_ETM4 and
> CS_CFG_MATCH_CAP_PMU_EXTOUT1, it will still load on an ETM4 device that
> lacks the capability.
> 
> Could we check the capability separately when loading the feature,
> perhaps in cscfg_load_feat_csdev(), and skip it on unsupported devices?
> 

ack, will do in v2.

> > +static bool etm4_pmu_has_extout1(struct etmv4_drvdata *drvdata)
> > +{
> > +	int pmuver = read_pmuver();
> > +
> > +	if (!is_midr_in_range_list(etm4_pmu_extout1_cpus))
> > +		return false;
> 
> Based on specific CPU variant, we should already have identified
> TRCEXTOUT has supported.
> 
> So either we only base on MIDR list or we can figure out a reliable
> way to detect the feature dynamically.
> 

Agreed, fixed in v2.
> > +
> > +	/* PMCEID0_EL0[63:32] describe events 0x4000-0x401f from PMUv3p1 */
> > +	if (!pmuv3_implemented(pmuver) || pmuver < ID_AA64DFR0_EL1_PMUVer_V3P1)
> > +		return false;
> > +	if (!(read_pmceid0() & BIT_ULL(32 + ARMV8_PMUV3_PERFCTR_TRCEXTOUT1 -
> > +				       ARMV8_PMUV3_EXT_COMMON_EVENT_BASE)))
> > +		return false;
> > +
> > +	/* nr_event is TRCIDR0.NUMEVENT, the number of events minus one */
> > +	return drvdata->nr_event >= 1;
> > +}
> 
> [...]
> 
> > @@ -1116,6 +1116,13 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
> >  
> >  		if (err)
> >  			cscfg_config_desc_put(config_desc);
> > +	} else {
> > +		/*
> > +		 * The configuration is active but was not loaded on this
> > +		 * device, for example because the device lacks a capability
> > +		 * its features require. Fail rather than trace without it.
> > +		 */
> > +		err = -EINVAL;
> >  	}
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

Will split out in v2.

Sent using hkml (https://github.com/sjp38/hackermail)
