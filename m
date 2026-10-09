Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59023CF210;
	Fri,  9 Oct 2026 09:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536619; cv=fail; b=Ibrw1ZhIJQc7Sjs/RFpAW8JowqXNG6PRly7zmF5WRG2YefJJaxXXpwHXyByx/R/dY7/s9/43zRuGlCe1/9CI+nTSEZThgAbTqtQYDRbDUq/XbIMPH6DoVFMEwoXlHpg+Vamg2obLhFuU4kC046ti1xodGabaSntD3non/3ReU0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536619; c=relaxed/simple;
	bh=e6Wqr9BG+2Rgj2n0z6nYH9MwDpTNm/yLd2qnWP7mSuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKOi9+uDS2orv8qkqOKc7zfQazigQsXlY3ERzJQjn/XepyzEc2p7ugBR75AfksX+xEWgSHuEyhTSX6p3Pb4SoQGXFL5XCbJtsLo3PFylYWqr9a2PZt7l4gnN87cBQj03obMA0opxgoU0sURs49c08C5U/e88tKRYmkMEiI4WA7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Snrccd1+; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=loDwsQD/; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Snrccd1+";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="loDwsQD/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KpO51159755;
	Fri, 9 Oct 2026 04:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Hb4RKLvAqhfaLz4N5h
	40xsT2nNS1ceuaojJ3CHfN42U=; b=Snrccd1+2OXkyTn3+3PZOLbAuhuB6a9KhZ
	1j/pFfbMX8koEr9naWt9ffnbz3cAPcRWXmN1J8FNUAwr00NL7rSmAgY3dJK3tmV1
	TCXX02BciLftiqe9QSvd6TNYCgbmX8pAdQcIfxeX7KrRe41TChaKZPeZaw5WdUVT
	1J3NG84HrUo9XgvySOgUQzJB+T9eXbavkVRmVy+3D93vaiDRtYIu0FBIfSyxhUbO
	nfMZplvWFlCBDQN0ktB1CBwt3UwcGHm27MgP+Tad+RILkjVxoWt/R1x8pAP8KOq5
	nDkiwFJQG2lI82QSB37W6AUCAYYnCfjEH6PMMYIek3yT4n7wD5vw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022101.outbound.protection.outlook.com [52.101.43.101])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h5xdajb7b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 04:03:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNLx8kEj9lAm9XX47YKZ81iSPCcU3utHA9kYr4YVCVFP2N4G7v3SsJjPbbTWzOHNMsH8Qt3d4cTzLAtLRrXXRzLYIy4N1S+p7XPlNCZ4d1KV7IJObrhJU8XiwdW+tar0xkXAuvTU4xWC2Obt8LoEkmh3YlpqPg7Rx8WQowAcvMtStteJIH1sQ4z3CaC/U519ekmy1/xCW2kRrx/7RE1DPHUgvaxkWz8JpnFsP/srucBQcvxiGoo143y3GUpVCz69LjbDGJ9EbxkLuIotkUkkHsN0TLPIGrcEGcSuR3JL5/piAimMBmqBiOxdzuJ+z+u/A581YHEasto6Bct4rMLOvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hb4RKLvAqhfaLz4N5h40xsT2nNS1ceuaojJ3CHfN42U=;
 b=sqZEO/VzfLBJ1rbgYVWdTsIkdeMbiXGQRR49NwdATxrea7QzEA6CoEkN54WfBMu7Te31Z914VkaL8hpdBHVQwBL38qxRTsZQDt4L46N7j9k7hEijR9/exh3u9grQ6PBelEVezR3hdwkm6Ep8I/1PWes1K2ebZ2YZNj5sKrde77XHKSFa/YhqX99lB94snFgc8iUhzL48ceSR53B+v7l2YwREoo154RYsOsXd8XPRjVzBmDxzYm6jejHGj0Ea8SIfeNmxskFeZysUuoJt3pKumqrbryGXCZxwngF2R8xfy0xN7eW3Xod04wIJwQot/22Fnx5+SUDY7M0ULCVcHFb2nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hb4RKLvAqhfaLz4N5h40xsT2nNS1ceuaojJ3CHfN42U=;
 b=loDwsQD/lcpYSqvpltaNNnu1kacFAjoJde6QK9P3VxlHrk2cbtgrFbIPC52bAWDaMyqm6bfJoQJa1IsjoGygGOrsR3pot0+FKsROwDmH/bYhtLzN67pYQEvqY6hQSj0yX2eWR0YgSiyeVqDezBkzURiZvJiEflsRhMbhli/mwoQ=
Received: from BLAPR05CA0020.namprd05.prod.outlook.com (2603:10b6:208:36e::23)
 by SA6PR19MB8594.namprd19.prod.outlook.com (2603:10b6:806:412::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 9 Oct
 2026 09:03:28 +0000
Received: from MN7PEPF0000014D.namprd04.prod.outlook.com
 (2603:10b6:208:36e:cafe::a1) by BLAPR05CA0020.outlook.office365.com
 (2603:10b6:208:36e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 09:03:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN7PEPF0000014D.mail.protection.outlook.com (10.167.254.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Fri, 9 Oct 2026 09:03:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 69211406544;
	Fri,  9 Oct 2026 09:03:26 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4E66E82024B;
	Fri,  9 Oct 2026 09:03:26 +0000 (UTC)
Date: Fri, 9 Oct 2026 10:03:25 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Patel <ripatel@wii.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
Message-ID: <asit3WWNt0/iRnyc@opensource.cirrus.com>
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
 <20260925154216.3520136-4-ckeepax@opensource.cirrus.com>
 <asJGxhij4OzWNYn9@wii.dev>
 <asN8pXcsRRRrwp58@opensource.cirrus.com>
 <asOiEwRp77ETKznr@opensource.cirrus.com>
 <asePYrXFHxHNssgK@opensource.cirrus.com>
 <asgjJLeH12OAlYai@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asgjJLeH12OAlYai@wii.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN7PEPF0000014D:EE_|SA6PR19MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: 9321f183-a209-4051-116f-08df25e42ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|30052699003|61400799027|10067099003|56012099006|6133799003|5023799004|4143699003|22082099003|18002099003|11063799006|16102099003;
X-Microsoft-Antispam-Message-Info:
	7PhH3SmBX0DsO+ztbQIjO4FqEXn7camYGO8R59IanokcYknLf3MUKITNm5KRrkJ6X3I6SUodE1dC6WpvwzWsHR4fs0iDuzP7tOtyBJqoVpUAAs4e0hDEtTuL++0mE3s64bE18+O6PfGhtVK7ZJVEcdwNNmO2ekmHTjOIFfUcZn+4GoZWW+fG13sQgabZDFfmGISVkK/mwTnZsZYr2tvrpMjcmqWbL4H1DHtLY7SpPIHbzPRyKqLlnlUvIESDB3toKUW/bKWURdwiL9q/rMj9wXcYlBpPx/jHu+LZlu44606rwxfPTJUg4IqpsGA7O3bBNDCHwocYOTt6HWO8OZoWIxn/sVEqL478VJFIID6li9/ofrvGqZPd8yFlwGZcusa6ZygeTN9NSQhzGcNFhro3eid0NRHLaTimYE+4dB25KpDVzsQmlWXUhaALDEpfHA79BmWF8lSdrUlc/O64vQZGEuV5tvQMfI/X+Gu+fEj/tIUxI5CuQr7akvfrtiuYkoEsDlqC5ind5fnf2ps20RwRSNjFagXBivjldDHPCh4Wj1pQLMN2STdhlD3h1gCEGlooFm3CMO2Yaa250QZ3LYxFz0Ibcpl2NSx3Lpo0CowERlNX7TILniFaUfsL8W502Ag1lH3Z5u5gWvnWMDuN/nRdwn+Xv0XuV6z4n2KC7N++zPXGba2u3O+w4cmS9b2aH6aSfqM+M11UsdhF04T4KaHgLQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(30052699003)(61400799027)(10067099003)(56012099006)(6133799003)(5023799004)(4143699003)(22082099003)(18002099003)(11063799006)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lMSpjeQlQzLOcv4F+TezyZWN5wWZSbrURKmvpSV91vgmwX54GQRhaVYV7w2YL6IdMZeRd5gBZX6qjejIu7L1e3BlawhCqEAFGp8CcC+4tiIp1xfhQPeQPFiqHIe+2m1P5t5gZMmqR1btI8eG4ld7mlAeD5/GElw3x3TWjs5EVqyCv9jwVYOgGeyIHprpGy1A0o40jM1Hl5dUz/f0thhVGQ63hLtxNv7FZK7Tmf6Nsk2zcphcws4EuJxAM2Tg9u56QHo6N/m2flynqewuhr9wK7nZqZdVfl/2i9R2RijLkrWBFdnGOXVQBFnSYqk7eWrakxeD2HvJiBRiZGFSrH145DY+Sljyfh7/F9BaIP7RZzkGGd24CaMhQozOxBPvDO+15Z2PkIc6n67wYJUG7Hh8I6w6EcrYf9AogQej6oI/rzzdgKG6Unwt1JsFYTcNBhxL
X-Exchange-RoutingPolicyChecked:
	SW+s9qQWvSjP5WRE7HI4JZfXW4BTiITVQ5JzBX++Bcl+zeXeMU5g5jsdxXOGpsdBQ6h5naQY2dJnzPpTVPFlFtKuM82hKzo4Y5NV3KIeuYJ0GkxAl2DhfDtJsAhfdPPtSNLxhaH6FldVzmtdx+9+zR6/ozxmf1PX7IXRlXeq8BTbf/joBxlG/yJ2LJ959v0pQ4vQjrwgY/SoaGdCV5yG0LBUJTkl6XVKN68iDTODyLZTCTiEq2bvM6nyqRsnw7PT/R183mQeEH2gsx3OPYKDiGeri3BsB/uJ4FEbPUNHs21L3cCF+ILC7zSJcRTToSapg1wLqxdwk2JDdo6MGDDakA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 09:03:27.5148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9321f183-a209-4051-116f-08df25e42ec3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN7PEPF0000014D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8594
X-Proofpoint-GUID: fuGV5H1ODgRwSfi2EocrtMjFoYDggpqd
X-Authority-Analysis: v=2.4 cv=es1KXYpX c=1 sm=1 tr=0 ts=6ac8ade2 cx=c_pps
 a=pnjbK6IZVO9937LLr08Axw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=BXGlR5rJpiURg2HiSPUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: fuGV5H1ODgRwSfi2EocrtMjFoYDggpqd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzNSBTYWx0ZWRfXxc8uLi0QImlA
 AVdlWb0DMaAt2oozirbJGMv573TOdNCWqh3ywekhID2I+iaQS38ln0LxSnLBpOxz8NjSkBpxgpl
 +GEkTICt+PhoKSu2uljy7+W2D7nmTRp5+PlCRD2cP35lhF0BR8nK+BD+4xP+gPHsvbzPsrB5ooN
 +O1T9x7idCJYf2YFQxm55vVeXTHhFLy4RrmYQN03HQIII3gNS3rDxLncdM+COviXKXzc4cpZzfk
 7miZ9Yzb33cIbw6Jp/nIwjezbmFAUj6baw7T2ZNOivcdVn3dZPeLYESKgOXXN1mu/2Omp9QWf8V
 s3fNVd32oHEffG2nBVkyFRKypFkagDoZa3VkwZbfENBJ0PAjfG3ZGP0D2BHReY0SAkC6Iz1blqx
 QwzAJVNdEAt2CP6+n9sC1i8XcMv5zPBhVoroheBT6b8NpoHMTP8ZdJxElB801mlGudS4UyQU9/X
 DN+PCYmrmNwpprSLUAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzNSBTYWx0ZWRfX7fHPsJjpdlq4
 OHS9795Qgcg8Wvy/8Kejl+6DL/QTbygeN1vFrYptpbJF+vAAdNAvN1PG9A+OiScnz/7i57bFKKm
 h/s+ridmCnIWNMrDlzjQi7Z/5ozRrYg=
X-Proofpoint-Spam-Reason: safe

On Thu, Oct 08, 2026 at 11:11:32PM +0000, Richard Patel wrote:
> On Thu, Oct 08, 2026 at 01:41:06PM +0100, Charles Keepax wrote:
> > On Mon, Oct 05, 2026 at 02:11:47PM +0100, Charles Keepax wrote:
> > > On Mon, Oct 05, 2026 at 11:32:05AM +0100, Charles Keepax wrote:
> > > > On Sun, Oct 04, 2026 at 12:29:58PM +0000, Richard Patel wrote:
> > > > > On Fri, Sep 25, 2026 at 04:42:16PM +0100, Charles Keepax wrote:
> > Ok found some time to look at this properly I think this is all
> > fine. sdw_intel_exit() first calls sdw_intel_cleanup() which will
> > eventually call sdw_cdns_enable_interrupt(..., false), which
> > should disable the SoundWire IRQs. Then sdw_intel_exit() frees
> > the ctx, whilst at that point whilst the IRQ is still registered
> > one should no longer be able to see soundwire IRQs, so you shouldn't
> > get a dereferencing of ctx.
>
> On my Galaxy Book6, I was able to get a ctx UAF with your v2 patch set
> by adding a sleep.
>
>   BUG: unable to handle page fault for address: fffffffffffffff8
>   Oops: Oops: 0000 [#1] SMP NOPTI
>   CPU: 5 UID: 0 PID: 34491 Comm: irq/165-AudioDS Kdump: loaded Tainted: G           OE       7.3.0-rc6-ibt+ #2 PREEMPT(lazy)
>   RIP: 0010:sdw_intel_thread+0x3c/0x70 [soundwire_intel]
>   Call Trace:
>    <TASK>
>    hda_dsp_interrupt_thread+0x97/0x320 [snd_sof_intel_hda_generic]
>    irq_thread_fn+0x23/0x60
>    irq_thread+0xc7/0x190
>    kthread+0xe5/0x120
>    </TASK>
>
> --Richard
>
> ---
> diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
> index a7437cd42028..66a08dad7281 100644
> --- a/drivers/soundwire/intel_init.c
> +++ b/drivers/soundwire/intel_init.c
> @@ -155,6 +155,8 @@ irqreturn_t sdw_intel_thread(int irq, void *dev_id)
>  	struct sdw_intel_ctx *ctx = dev_id;
>  	struct sdw_intel_link_res *link;
>
> +	msleep(5000);
> +
>  	mutex_lock(&ctx->link_lock);
>  	list_for_each_entry(link, &ctx->link_list, list)
>  		sdw_cdns_irq(irq, link->cdns);
> @@ -393,6 +395,7 @@ void sdw_intel_exit(struct sdw_intel_ctx *ctx)
>  	sdw_intel_cleanup(ctx);
>  	kfree(ctx->peripherals);
>  	kfree(ctx->ldev);
> +	memset(ctx, 0, sizeof(*ctx));
>  	kfree(ctx);
>  }
>  EXPORT_SYMBOL_NS(sdw_intel_exit, "SOUNDWIRE_INTEL_INIT");

Hmm... yeah, I guess the masking ensures a new IRQ can't come in
but nothing ensures a currently running IRQ is synchronised in.
Well assuming the masking does actually prevent an IRQ coming in.

That is a little awkward, normally freeing the IRQ would
synchronise it but as the "IRQ" here is done as a pile of
callbacks that doesn't happen. We could do a manual sync on the
IRQ but that feels like a bit of a layering violation, since
the actually IRQ is several layers away in another part of the
code. We could add some flags/completions such that we can wait
for the current IRQ to finish but feels a bit like adding code
that shouldn't exist. I think the correct solution is probably
to switch the handling over to the IRQ framework.

I am going to go for the theory this is not directly a problem
with this series since the problem exists unchanged before and
after the series. So lets not block this stuff on it, but I will
try to find time to start porting more of the handling over to
the IRQ framework, or happy to help review if you would rather
take a run at it.

Thanks,
Charles
