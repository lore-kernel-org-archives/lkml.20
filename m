Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792910121;
	b=cUOkmDtwosEP62AuO/eX2eMsrUjc2BbEt/VA7PhJ1SUOolm0YPuyEGbO/tJe/+PcQob7
	 FRbfP0FujFEZ05pgIWyczuoj/1EXJ+93xtTvb+aUugWEIO2rMFVT04/ObynSYui3QrOD7
	 22ZHRiH7w7Ojt7kECTWPiczBuDo9io4r0DiJs54y5YJEGpKhbiBhV/ecoqrADgXkjdqrK
	 eUsWm5d3HYpjxyQKhWrwyYEpDIJ9AbfNVfri4ne7/kppISUuy6pUMoeoqwuklDJpvi8PA
	 i7FsJ6QnU7R9eIYywNZerlv7cA2mC2AeRC0KBBVZ7k4lhNnSYpBar3fHcy+ZuBvbm5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792910121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=WRhvncARDTj8kFDSfn3K/bKO8p4B/cF6NkQVk0rQ7Gs=;
	b=sN44gaxoltJQPkLVZk1H5Mw4BoaFfa3B+4iitTa/67wZdYD+XkIbvj5979o6jwDvCPRu
	 JmTJ4JoE5o4UY2YmmzOINGg9JvmX/7f/rtL20Xp+v/N/Cr3tIjTntNxvgnB0jz/nwk4oR
	 QK1vSoPoOy8ysJw+KyAfgaucayJJWzjF48Qc7dGm7cvz5xyqnq8rM8mtzY1+2POpm2BTR
	 7n8TMWaYKxiM4s6b+rjzh71MZIzSiFYO348UPwWf8/rhDeHs6Kg4SAde9GS/BaAS7uOIv
	 J7qWn9p617OsPQrYaB8PC4GocRyYvCPARZnVKzETzrHkUGR4eHS4QW8vS1nm8fVFF1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fb.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="pkYc/FUr";
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FA5606A31A;
	Sun, 25 Oct 2026 06:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9FA5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=pkYc/FUr
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P6H8WR644315;
	Sat, 24 Oct 2026 23:34:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=WRhvncARDTj8kFDSfn3K/bKO8p4B/cF6NkQVk
	0rQ7Gs=; b=pkYc/FUrd3qZIIQl1NxgLZvDwn3advLtmrxx3qnFi3vNwymnKNPZh
	8igzUPK/jvYidAdm/3oyTUjXp+QpFEip2/PAKNqpj/seRxAn3ubXp1pE6RxaauP7
	gipPSkrdXy6Mu1260DSVjbhcyV6CZuf7iqgFCCEaMLczs0NhC8BBm+6n1FB7eVPl
	cKe88wpsIzXcC9mt64SM+uurtu1JKvBiOoh+emUB7F2Lnw1xjBMTjvbue5VizYFl
	/JhUxn7uCTJljAekjRQ9SjscCRHZ6Wd2kcRomGaZv3OebXXFy21A1g7snz20cRg+
	WNse9QdepX/b90SNVS7DtTs9i02nJIyhg==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hgss73f8g-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Oct 2026 23:34:48 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Sun, 25 Oct
 2026 06:34:47 +0000
From: Amir Ayupov <aaupov@fb.com>
To: Leo Yan <leo.yan@arm.com>
CC: James Clark <james.clark@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy
 Dunlap <rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] coresight: etm4x: Report the external outputs the PMU counts
Date: Sat, 24 Oct 2026 23:34:43 -0700
Message-ID: <20261025063445.3010494-1-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261021164332.GI26205@e132581.arm.com>
References:
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: r50rzh5dbjl1g1PIYsg_8GpFiz6Dimyf
X-Proofpoint-GUID: r50rzh5dbjl1g1PIYsg_8GpFiz6Dimyf
X-Authority-Analysis: v=2.4 cv=BsYIUoX5 c=1 sm=1 tr=0 ts=6adda308 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=03ozwUkBphtHgyqjj1sw:22 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=7CQSdrXTAAAA:8
 a=br9zJRzJzol7aKDkuGsA:9 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAyNSBTYWx0ZWRfX1koD3MuyM39N
 V1IMvGjMbMQD7FJlwGqkzrouuBq87UELoTbUQKIzG4BwH4dc6Gidq5MxgbfzX2COZhd34gt6YvK
 MY7KJdzxOCPa/rsNUrzoDX3ynnpdzR6YIrH6Mn3XhqGZKuJG2gCAbQIZNd9ee5C74WbIdyidsdr
 1d6gfG4UWb9zYKFLnPExLJ3lCh6xHNiIHBdWppvS2hppgIX1KWfhGopel7+W2tt38xmbAPDfOkq
 DHleGBbCr49iI7nUMngxG9+EB2PBYDZq18RtU4C8gvVgiX0PTMCawQPNyYD5+d7mQ1cTZ3nUrsc
 jtWiKeQHfJyVH1gOqc4QEVdrv9kj1O7PfOXt4Y1Feni8OTFDAXxfbG5/ADfpNgakvks0HP6FXgx
 n/Pdgsi3wu5c24g9GEYnBGZx3EH1Ucdl4dr1krlJLunkLryNZ2cIJgiHGrY8Sb3fbHQ5xNEc5dk
 JPkJkZpZHr+FEuwnq1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAyNSBTYWx0ZWRfXygwC0F5MTR70
 CMCmKgSSFKpHnhhdeMn7hhWcpXzonloktr6MXueWXjwULI43uZKmXPiWu7nbIkPk1cTqwtOoTDp
 2KJ8jPhuk7e3RYVL1i05b1CHTZCpjQ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01

On Wed, 21 Oct 2026 17:43:32 +0100 Leo Yan <leo.yan@arm.com> wrote:

> On Mon, Oct 12, 2026 at 04:05:22PM -0700, Amir Ayupov wrote:
> 
> [...]
> 
> > --- a/drivers/hwtracing/coresight/coresight-config.h
> > +++ b/drivers/hwtracing/coresight/coresight-config.h
> > @@ -35,6 +35,10 @@
> >   * a device that matches one of its classes and has all of its capabilities.
> >   */
> >  #define CS_CFG_MATCH_CAP_MASK		0x0000ff00
> > +/* trace unit external output n is countable by the PMU as TRCEXTOUTn */
> > +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT	8
> > +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_NR	4	/* TRCEXTOUT0-3 */
> > +#define CS_CFG_MATCH_CAP_PMU_EXTOUT(n)	BIT(CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT + (n))
> 
> We can just use a single capacity for all output singals. It would be
> good to follow the naming convention in the Arm ARM:
> 
>   #define CS_CFG_MATCH_CAP_TRCEXTOUT            BIT(8)
> 

Yes, single bit works.

> >  int etm4_cscfg_register(struct coresight_device *csdev)
> >  {
> > +	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> >  	struct cscfg_csdev_feat_ops ops;
> > +	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
> >  
> >  	ops.load_feat = &etm4_cfg_load_feature;
> > +	match_flags |= (u32)drvdata->pmu_extout << CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT;
> >  
> > -	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
> > +	return cscfg_register_csdev(csdev, match_flags, &ops);
> 
> I would suggest to enable the capability bit base on drvdata->caps:
> 
>   if (etm4x_is_ete(drvdata) && drvdata->caps.nr_events)
> 	match_flags |= CS_CFG_MATCH_CAP_TRCEXTOUT;
> 
> For now, we can enable TRCEXTOUT for ETE only, as this should be
> sufficient to detect the feature safely. I'd like to leave this to
> James and Mike as I got suggestions from them.

I'll keep an extra condition that PMU must also implement TRCEXTOUT for
each of the nr_events outputs. Otherwise it'll start but the pause event
would never fire. I'll also use pmuv3_event_implemented helper suggested
by James but let me know if I should just check is_ete && nr_events.

> 
> Please also rebase onto the latest CoreSight next branch [1], which
> moves the capability fields into drvdata->caps. I found an issue in the
> decoding of caps.nr_event; the attached patch fixes it and makes the
> field hold the actual event count.

Rebased in v3.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git branch: next
> 
> ---8<---
> 
> From 95307fa0574b1e0b3922ffa23fe98144b2688496 Mon Sep 17 00:00:00 2001
> From: Leo Yan <leo.yan@arm.com>
> Date: Wed, 21 Oct 2026 17:05:18 +0100
> Subject: [PATCH] coresight: etm4x: Fix event count decoding
> 
> TRCIDR0.NUMEVENT normally encodes the number of events minus one.
> From ETMv4.3 onwards, including ETE, a zero TRCIDR4.NUMRSPAIR instead
> means that no events are implemented and NUMEVENT is zero. The sysfs
> event controls currently interpret this combination as one event and
> allow writes to unsupported event fields.
> 
> Decode NUMEVENT after NUMRSPAIR and store the actual number of events
> in nr_event. Use the decoded resource count so that older ETM versions,
> where a zero NUMRSPAIR represents one resource pair, still report at
> least one event. Update both sysfs event controls to use the actual
> count and clear their event fields when no events are implemented.
> 
> Also correct the instruction event enable mask for the single-event
> case to use INSTEN[0]. The existing mask uses INSTEN[1], preventing
> event 0 from being enabled.
> 
> This change depends on the recent driver refactoring. With no reported
> failures, it is not intended for stable backporting.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  .../coresight/coresight-etm4x-core.c          | 13 +++++++--
>  .../coresight/coresight-etm4x-sysfs.c         | 29 ++++++++++---------
>  2 files changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e21be6468e954..af017bd8a5477 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1451,8 +1451,6 @@ static void etm4_init_arch_data(void *info)
>  	caps->trccci = !!(etmidr0 & TRCIDR0_TRCCCI);
>  	/* RETSTACK, bit[9] Return stack bit */
>  	caps->retstack = !!(etmidr0 & TRCIDR0_RETSTACK);
> -	/* NUMEVENT, bits[11:10] Number of events field */
> -	caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0);
>  	/* QSUPP, bits[16:15] Q element support field */
>  	caps->q_support = FIELD_GET(TRCIDR0_QSUPP_MASK, etmidr0);
>  	if (caps->q_support)
> @@ -1519,6 +1517,17 @@ static void etm4_init_arch_data(void *info)
>  	caps->nr_resource = FIELD_GET(TRCIDR4_NUMRSPAIR_MASK, etmidr4);
>  	if ((drvdata->arch < ETM_ARCH_V4_3) || (caps->nr_resource > 0))
>  		caps->nr_resource += 1;
> +
> +	/*
> +	 * NUMEVENT encodes the number of events minus one. From ETMv4.3,
> +	 * including ETE, NUMRSPAIR == 0 means no events are implemented.
> +	 * nr_resource already accounts for the pre-ETMv4.3 encoding.
> +	 */
> +	if (caps->nr_resource)
> +		caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0) + 1;
> +	else
> +		caps->nr_event = 0;
> +
>  	/*
>  	 * NUMSSCC, bits[23:20] the number of single-shot
>  	 * comparator control for tracing. Read any status regs as these
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index db9e603f97ba8..fb38f0102290a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -513,19 +513,22 @@ static ssize_t event_store(struct device *dev,
>  
>  	raw_spin_lock(&drvdata->spinlock);
>  	switch (caps->nr_event) {
> -	case 0x0:
> +	case 0:
> +		sysfs_config->eventctrl0 = 0;
> +		break;
> +	case 1:
>  		/* EVENT0, bits[7:0] */
>  		sysfs_config->eventctrl0 = val & 0xFF;
>  		break;
> -	case 0x1:
> -		 /* EVENT1, bits[15:8] */
> +	case 2:
> +		/* EVENT1, bits[15:8] */
>  		sysfs_config->eventctrl0 = val & 0xFFFF;
>  		break;
> -	case 0x2:
> +	case 3:
>  		/* EVENT2, bits[23:16] */
>  		sysfs_config->eventctrl0 = val & 0xFFFFFF;
>  		break;
> -	case 0x3:
> +	case 4:
>  		/* EVENT3, bits[31:24] */
>  		sysfs_config->eventctrl0 = val;
>  		break;
> @@ -565,22 +568,22 @@ static ssize_t event_instren_store(struct device *dev,
>  	/* start by clearing all instruction event enable bits */
>  	sysfs_config->eventctrl1 &= ~TRCEVENTCTL1R_INSTEN_MASK;
>  	switch (caps->nr_event) {
> -	case 0x0:
> -		/* generate Event element for event 1 */
> -		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_1;
> +	case 1:
> +		/* generate Event element for event 0 */
> +		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_0;
>  		break;
> -	case 0x1:
> -		/* generate Event element for event 1 and 2 */
> +	case 2:
> +		/* generate Event element for events 0 and 1 */
>  		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>  						   TRCEVENTCTL1R_INSTEN_1);
>  		break;
> -	case 0x2:
> -		/* generate Event element for event 1, 2 and 3 */
> +	case 3:
> +		/* generate Event element for events 0, 1 and 2 */
>  		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>  					     TRCEVENTCTL1R_INSTEN_1 |
>  					     TRCEVENTCTL1R_INSTEN_2);
>  		break;
> -	case 0x3:
> +	case 4:
>  		/* generate Event element for all 4 events */
>  		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
>  					     TRCEVENTCTL1R_INSTEN_1 |
> -- 
> 2.34.1

Sent using hkml (https://github.com/sjp38/hackermail)
