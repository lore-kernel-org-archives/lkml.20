Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3862C263F44;
	Fri, 18 Sep 2026 14:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741749; cv=fail; b=KCaIcrkG1ymzDsjWe4gEYNm2NWyL6R75QHC8ss/oiWHDZ14tNmNUp21rvsRnbN/cR7xEWmQl2f7RUt1iDV2RtcUHXt64HCcMzIAAHQ1sxpwjVgsZnp1pG4Em69fEd179vuVLfhJxEVt0EmGAlj1ldUpBvESOzd0B99Rcpba0Fig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741749; c=relaxed/simple;
	bh=eHZ9Pas2waL1R5kV3L4wjcNtGIclg+KLs+Xyszo986c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xb64YaxNdeUeFihxa6fHoRavl1Bg2EVNVHnHRnYlj75gmb1JIfGct4M3mixBuvxR2LXusUIQG+YqBn/llH/PF7NpMVtKYvqnjjgx9ueN7H8ZE8V+kyDNZjLJ04hmTVQAHi9n4GYiY+mLWILZiWUU59eKI+5tiUKDPClMtNRkbWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O0za0CQj; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mMQPwx9I; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O0za0CQj";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mMQPwx9I"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IEG0hE2847331;
	Fri, 18 Sep 2026 09:28:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=oUxPpdAu0ZpGGnt4Ka
	6QhIfGouFoKpIlfr0FAzZouDQ=; b=O0za0CQjKL+i/FDgxYu3mx9ss+DufByY8h
	9mHzWWy+bxD0b5AHZV5ILsyby0/fswaA98UEnLQLzH18SstwKMTrpFI85rJk3pPN
	h+jtsWg/SOv9/L1VrLibJxp/qftK8C8MaUYRNyaIsOghzfRXAtiLatJZ5iqSkL7Q
	cIDLV16bTKWZj0bTXVCOwj+K19H9gMHaqR36alnnlAfPEtBOYr6ZsldqR1CcFWIJ
	EQ28oh8Rh+mPxiEFkq6MOkCIMMuok0YHXMyxI39bhYGxtCeOnBk5d7OHsRBYCpe+
	+vrYMzW8cfZK68h3CJGw/p5uqS0iwYF74KtMV/GIM1a0v+cqjVKg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020094.outbound.protection.outlook.com [52.101.56.94])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gregu2etg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 09:28:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zK3VDBy1QIIE2dkkpk/wG7Pjg7nwUz6JQpF4N2l+BF1Uh9exE3OHXdBn+gWim+nnkM45kwYRfjm0LhpzJaI1EY1FJgw63VbPMVRE27kGtSMZCS7IOs/rVmhvqEjMJ5z9Z4wLq/+6gGCpzImSuwonuPkyci5DZoG6rOBL/tbEhAOa8YhYw8qh5ly0ocFaFz9zFe3FJi4Hw1NiEjC/b58CSWj/clkiJ6MiLTLeaPc46QC/BZQr3hGgnVm/8WBRWUtHll313N9ulHMsI2dQ/hFV4W2eANj1Ak8hj/lXEJQL5HuQ38PvzqUkrnoTe1ir2O4Cg7Ljh54JlgrvCP7/OpLfVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUxPpdAu0ZpGGnt4Ka6QhIfGouFoKpIlfr0FAzZouDQ=;
 b=xZRb2q6FKOdSiPHs7LT4/+h8dAJ4vxxP8GEbuWuR8FZJo8383EeKHtdSTN4J++9gJd7+w+IPR5lsdgQr0GMY9YjfYiokYK76bBo/OkRmSoj1N0l7ZED+/0WKJ+a9siK+QcL+uzBIy66eEFD+9OIrkDBlRsUhw60RTmQGPxs1lP0IgCcOfrkaQ5PRtDFX1npBuYRD3TZjGyQZWeWPGDiYZgWwzM3kk6M9f/w1o0G60z/BYhYqnsKLEeMDjVCL0SR8O5HfXiUa28m4Q/DDXURgr56gVzv/LEA75ow6hHzBU1CN2jhsodQoJzOdz+ZiY1+B/39nYzw5Df3/krT/u3JXRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUxPpdAu0ZpGGnt4Ka6QhIfGouFoKpIlfr0FAzZouDQ=;
 b=mMQPwx9IkfeFt3LW2Cz/gPYuxFpLgUYeTiQbz1D46S4YCtpVfIKEl2L2+8rgj40i7yR5ciF21kjBPPC9ffvl8xg4fQLqnd8nMkOGzyIyCTZ7wRdDnvTbuD8jyShyeaB7p+SRlxe3nyOyggQL7Z3EvJ4PsWGOB0IjBjXukqtBGoc=
Received: from SJ0PR05CA0026.namprd05.prod.outlook.com (2603:10b6:a03:33b::31)
 by DS0PR19MB7441.namprd19.prod.outlook.com (2603:10b6:8:142::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:28:38 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::9d) by SJ0PR05CA0026.outlook.office365.com
 (2603:10b6:a03:33b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.8 via Frontend Transport; Fri, 18
 Sep 2026 14:28:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 18 Sep 2026 14:28:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C4F2A406542;
	Fri, 18 Sep 2026 14:28:34 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AC00382254B;
	Fri, 18 Sep 2026 14:28:34 +0000 (UTC)
Date: Fri, 18 Sep 2026 15:28:33 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v4 8/8] ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA
 codec
Message-ID: <aq1KkZUh7OCyRCKj@opensource.cirrus.com>
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-9-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918131914.681588-9-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|DS0PR19MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: a2979956-2e09-4066-1762-08df1591203c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|23010399003|7416014|10067099003|11063799006|6133799003|5023799004|16102099003|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	4sweZG27D6Nskq/n8GR1rCHL2ja6mr91BaKkiwYIBzPxtTsQgBBxseSL5tMXoQGZIU8OJ8Se3i1Z9qWGrX/Lgi9ydhz5K/4hj38n6XyAOfCdbNNlf0IDv5cA7tfXpu7y6LVW2BvGkkhaZAYpHP5xKGvdUGDnbPryiN+pGc8K5oZl23e4zYyp1L8SZ1T3syMvVnlg+/q8SobN7bE36w7QGViyP7nLBbp2bIwFD8YcbzxgpXW/mAmTFB+EHu6qLYy8kWRUXTagVCS9NhybwrIYtwLziR+09bBfUZG9wcHdPlHMjL5aWRDLLZmZKHoWgeCerb5jhqQL2MAgnq2Q27mzr+YjiQzzaZa5LHUR5w7om3VJEUBTptjHfhsbZGZ3v1KT9enae4Nc8ZU/x9LF5DeA/bas/f2PCo63zJh8R126HwM8MMgtVT+JDhG+px1EVu+DabZ0c8RUf+bB7l/BnpzbBBCxvAnv7kRh1eS2YJJ/A0VMlYAzj5VMKjmv6OH18XuckLq5uInCEkwHz4VGXxfOvsX8oc3MmEfEd6QSMdxpgTzZ8Qxklza66DnTLTjlGfsv5fZKtlJ3xZCZchySUQC9GFL3D9eakjkp8oM1bUhWWiJ/Df0kUfbRdJZ+kemAA/dku31KcI5d3aUP+fqrFLOVCyQHnn3H8yduPE7Nuv9ykMJj/J658EN1m86G+O4ydXXvL78LRa5grF5wywc582WTjg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(23010399003)(7416014)(10067099003)(11063799006)(6133799003)(5023799004)(16102099003)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qQteQMQ/envaX/qtir6krIpkaBpCYIWABC3ImhnP5hQBAdE7JvMXqYmkdaoI5+YjQ7J4tAKw8cOihCnX4bMbVLugnP++mjbcQ+5O4kKpuM9ngkXo7m0jqbbJsC1cX9wDwyC3TxqO1iv8L9neZR8vC8ZKFtu1BiZxNf+EJDbXOvd0FUQDKJ1wXVp+nl4UFiJ91SRpBkBWwuYa5RNlj9ZPbuVOpDrJC40pUAWG7r1xYySmGfit59ifm1jk7XmBDQgwWegg1MH4D5A8BYOkc1jLzpbRBcBk9+BwBRQ4vQvMrIn0r/wERpgffYaeQqKcFa3PXiocyy3Xe74Qk+B/vlsfsZNNnrB0dg+fEmDb3Zd9Tw8rzbJhCqnZGIaOTToT264HdudkNbUYUS5gutUT2ajaKRCt+oHnwCc82rlnB/DGcEeYmYFlRDHqnm7rNA3qm7BF
X-Exchange-RoutingPolicyChecked:
	RrtDSBLh+hgE2Lb51fv5WXURG6o5fVZsfI18/Sqwf7276k9Hs8Bufpu9vZGZbg4hVKwyIi/fMIIIL0kwfnO3pKlQSRLIq+G+xd739AaWhef0BUm6wUB2AjFxk2jLrvVBs6b0w/9AraoDgzjs7NpUNUHgkmn80z9nUqB4ck9LiC0YstYkzzm9fu7IZUlGdsiY+HNCS5t6CwOTe5MH/l3H4CbyUq3sDHKpc2Mr+fOmFTFD/N8rq+MhQ5sZhYwrOePu93ECCo0ONFb/0MzS7ZBGli4w/1VaOwgUywfU84AkYHNvca5i24melr/LVuoeighS31yfr2ArsafhdPVoZ3wlUg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:28:36.1974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2979956-2e09-4066-1762-08df1591203c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7441
X-Authority-Analysis: v=2.4 cv=f8Ddl+yM c=1 sm=1 tr=0 ts=6aad4aa6 cx=c_pps
 a=VRpCj/H3b9lxb5zSmaw64g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=tRyo1ISO_7qUExk7hKgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwNSBTYWx0ZWRfX/lOPoMNmTl7Y
 iatTOcldqt5zbEgCKmCozl49MsZnZkWBay2fqYUNTo/FnE8ctIxVvahSBNWiwF/VpGXPUTdOXRt
 gO8PTvEWmgrCO1UY65hnbFfcHG1fdIs=
X-Proofpoint-GUID: Bnlm5nm_1FG5d81fAcdRwDVtfqTdOMgk
X-Proofpoint-ORIG-GUID: Bnlm5nm_1FG5d81fAcdRwDVtfqTdOMgk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwNSBTYWx0ZWRfXwIAxog6ajHb2
 amwJrGWkLq3sp4Blw8sNH1cSdeE2upR/9KE7QBTvF+aDmYLWPHZWfxIT+dtKjwoqBwFHTMWnnuf
 AqXATV98mFRtgn0R9SdcQMANGDe3V23kneKfPICTbXrDJppxICSh3e6QISdqZVeZqM9zyQCS8Gj
 IcnsQM9V22zF53XJtDLvMovqRiqcrydW/5W87L1rhTZoGT0HnNhpfw9XbRNljUlP45OfWzLsQrk
 8QxCII5R3CPeG3igRw7ovqXxVsDbs3shmOcNKokqrb8eKAIP0WAb/UqQJmFSFcDX8wfliRgOF8n
 uJTV6n9rPfuYnzqf7xegQvlIwGQRYEQUMDOEO58flU45M0it8p+RfvUJ6GEIcE3Jk+4JY3rZevm
 Z1dQXneZVZnBFvunVPyDKoFx3QRM4ZXVFlNo7tLGFBlZLC40380l+cCYNs2Q4AFeMV57VhShQlv
 G/mp3BUO8t2sNRgztvA==
X-Proofpoint-Spam-Reason: safe

On Fri, Sep 18, 2026 at 02:19:13PM +0100, Srinivas Kandagatla wrote:
> Add support for the Qualcomm Tambora (WCD9378) headset codec in SDCA
> mode over SoundWire.  On ARM/DT platforms without ACPI/DisCo firmware
> the SDCA topology and SoundWire port properties are supplied as static
> data through the codec driver.
> 
> The codec exposes a single SimpleJack SDCA Function providing:
>   - Headphone playback via FU 6 (mute + Q7.8 volume) and OT 43/45.
>   - Headset mic capture via IT 33 with MICB2 bias derived from DT
>     (qcom,micbias2-microvolt).
>   - MBHC-based headset jack detection.
> 
> Implements:
>   - sdw_slave_ops.read_prop: SoundWire slave properties and dpn caps
>     for the compute-mode dataports.
>   - sdca_class_hw_ops.populate_function: fills the SDCA Function data
>     (entities, clusters, init_table) from static tables and patches
>     the IT 33 MIC_BIAS default with the DT-derived per-slave value.
> 
> Binds SoundWire slave id 0x0217:0x0110 when qcom,compute-mode is set
> on the DT node.
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Both of these are pretty minor comments, more suggestions really
so feel free to ignore if you prefer way it is.

> +int wcd9378_sdca_read_prop(struct sdw_slave *slave)
> +{
> +	struct sdw_slave_prop *prop = &slave->prop;
> +	struct device *dev = &slave->dev;
> +	struct sdw_dpn_prop *sink, *src;
> +	int ret;
> +
> +	ret = sdw_slave_read_prop(slave);
> +	if (ret)
> +		return ret;

Do you want to call this? It is just reading a bunch of DT
properties you don't have, and if you are using some of them
they should probably go in the binding docs.

> +
> +	prop->use_domain_irq = true;
> +	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY |
> +			      SDW_SCP_INT1_IMPL_DEF;
> +
> +	/* Compute-mode fixed SoundWire slave properties (not described in DT) */
> +	prop->simple_clk_stop_capable = true;
> +	prop->paging_support = true;
> +	prop->clock_reg_supported = true;
> +	prop->lane_control_support = true;
> +
> +	/* Source ports: DP2 (headset mic), DP5 (optimisation TX). */
> +	prop->source_ports = BIT(2) | BIT(5);
> +	/* Sink ports: DP6 (HPH audio), DP7 (HPH envelope), DP8 (optimisation RX). */
> +	prop->sink_ports = BIT(6) | BIT(7) | BIT(8);
> +
> +	src = devm_kcalloc(dev, 2, sizeof(*src), GFP_KERNEL);
> +	if (!src)
> +		return -ENOMEM;
> +
> +	src[0].num = 2;
> +	src[0].type = SDW_DPN_SIMPLE;
> +	src[0].simple_ch_prep_sm = true;
> +	src[0].ch_prep_timeout = 10;
> +	src[0].max_ch = 1;
> +	src[0].min_ch = 1;
> +
> +	src[1].num = 5;
> +	src[1].type = SDW_DPN_SIMPLE;
> +	src[1].simple_ch_prep_sm = true;
> +	src[1].ch_prep_timeout = 10;
> +	src[1].max_ch = 1;
> +	src[1].min_ch = 1;
> +
> +	prop->src_dpn_prop = src;
> +
> +	sink = devm_kcalloc(dev, 3, sizeof(*sink), GFP_KERNEL);
> +	if (!sink)
> +		return -ENOMEM;
> +
> +	sink[0].num = 6;
> +	sink[0].type = SDW_DPN_SIMPLE;
> +	sink[0].simple_ch_prep_sm = true;
> +	sink[0].ch_prep_timeout = 10;
> +	sink[0].max_ch = 2;
> +	sink[0].min_ch = 1;
> +
> +	sink[1].num = 7;
> +	sink[1].type = SDW_DPN_FULL;
> +	sink[1].simple_ch_prep_sm = true;
> +	sink[1].ch_prep_timeout = 10;
> +	sink[1].max_ch = 1;
> +	sink[1].min_ch = 1;
> +
> +	sink[2].num = 8;
> +	sink[2].type = SDW_DPN_REDUCED;
> +	sink[2].simple_ch_prep_sm = true;
> +	sink[2].ch_prep_timeout = 10;
> +	sink[2].max_ch = 2;
> +	sink[2].min_ch = 1;

I would still be tempted to kmemdup static arrays for these
rather than kcallocing and filling in manually.

Thanks,
Charles
