Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2D8199EAD;
	Tue, 15 Sep 2026 09:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463708; cv=fail; b=EF70VYu0ur2OB56n9eXy2h4SsKJg8Sk05y9nfO/FksWK3l4u7hZ2NxvZS6Lp7gDQLwq5Br0M+LCg/CD4r5ZvINMJ8BKya0sGEgoiatO/ooyAbPS4z/oaNQwFpNt5I+ygd+PZ6PzOSdLj1E22R+URL8bVLYAYLZkNo6f/6naec2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463708; c=relaxed/simple;
	bh=LhNblhrfBO+PZoakxbk4d6DE2fb9ecz40oOpv5fkoJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPNpVM9LrDaWmvzhgYuQA6chDYzB3nqyS/nDqcU8UiMkPo4b3ZQwrk2S+7jObHJ/+P2I3DP0j/D2sH4E9bg2k/M+jw0J59QdyCEsyFBwsJSZBIhY7p9aUSagNmNOxQy605+9IFvfvV7Z3Ac6bfTaEV1H6oFCT87EDnIWGkUHSHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JJHZuSUh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=n+NmAsYi; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JJHZuSUh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="n+NmAsYi"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F4cuIX3183688;
	Tue, 15 Sep 2026 04:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=UfV1GjuM3dFJyBt7HD
	ybOlGkcC+093q7nAD8J2MyBqM=; b=JJHZuSUhxRvgsSv78CJFR3EoVmJjHf/jhI
	LE6XWlK8DpmqvCrmigjW3GY6cQxf3pk9EBe6bNBjnMiaL4+g5L5A94o999Q32oMA
	suh5uYYXdIG9cOZrBhh4/lsahw8Rimx2uRCqfMtD+n12tA7Kxvt2ucMhHFugGhad
	1zuqN3AYoLF7u0L79Dk1Ke5DP6LSFpeeOKH+GxWpssGZW26h7QvPnn17yXx8JTZX
	xujtR5UzB6/wAXWlSA+MzTSw20ngSvVlm7Sa/o0j6tqh10xmTmUKfT0tnntS1i/I
	xkHAymqBF48K4Dd9Sg0+2OBZiTPdNi3WgKv/g81PueZhdoGKnNOA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020129.outbound.protection.outlook.com [52.101.85.129])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gn44wb6cw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 04:14:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oo/VF2FUtTknVUwUQePg25fnOxveCILk5Rz0Zx8GmK3fPseH7Y6u75Ov9JjAalA4pc4/8P93HoFg/w6bRZsH8+7sS4hLQEFczraXQJguld6Ut56gi5fcU8Vk55f0UqZcbfXCpM97AFoVRk9PCJopY3gQyuMbY9xeQPSAJTWBwPl1Li3vG6t1Q72WZZLTRgMsZ0LDLXU5wd7MsYCcwUNFWbddMMsTBlAMGOd9zoF1+d5LzqMA3OsSi8HObJYM57enl/et/vrb3h8yiGto7MKj1FCiIU3qPzkQma51gLVd8p6KdAuwmd401OiZHAC/2Z5mJTbLSKOEZ/uhaKDO5cFhcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfV1GjuM3dFJyBt7HDybOlGkcC+093q7nAD8J2MyBqM=;
 b=UBDlwO+8XlpRZTBpmaRnn5TmkPd+WtJiBvlyKCnwpsUXiBhUatTrwsaFck66JNTq4V34BKm7Z1dTaG04PEcnz/02Z+n5/3J9fduvm7ShnyBTpyi0WKGOq4Mo54M7ZTY8HimU8UjXoIFY/cQ8Ni8+EbpZsAP23FGVAVQBElfFSAW2fej51bmC0ZcbLPGZ+YXN3Cb6/O7hxE3pAREs1UzXUoZcFCaXdvysBvxXZtmGlJh3z/XaG++gi8KCVRlnW6Ngfm8k+U/cEl2DJ7KCi5AHM3vOZz7NF6c99YAOhb+trO/cSCGwXcjLlofGPf1YvQJT05QQkwPLvB8bmGflUE/dUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfV1GjuM3dFJyBt7HDybOlGkcC+093q7nAD8J2MyBqM=;
 b=n+NmAsYi4sg7PU5fqDRQwwE3EqQMtsU8rHv1yWGtf20binEJ7GW0bPca/haW24Xaa8XmW/iDkvGQQIaUmWF98/dgTKkc+ihdMpQ12515+GfOY39o9S4eaYWFMyJbD8fF5gP8HTkvPsw7R4KmTanfW43ZRp2fUHx5Bjd+b+jkSlk=
Received: from MN0P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::35)
 by SN7PR19MB7068.namprd19.prod.outlook.com (2603:10b6:806:2af::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 09:13:34 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:208:52b:cafe::69) by MN0P223CA0018.outlook.office365.com
 (2603:10b6:208:52b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 09:13:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Tue, 15 Sep 2026 09:13:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1FFCB406545;
	Tue, 15 Sep 2026 09:13:30 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 07622820247;
	Tue, 15 Sep 2026 09:13:30 +0000 (UTC)
Date: Tue, 15 Sep 2026 10:13:28 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
Message-ID: <aqkMOFfQo2YRYt2C@opensource.cirrus.com>
References: <20260911161903.419814-1-ckeepax@opensource.cirrus.com>
 <20260911161903.419814-3-ckeepax@opensource.cirrus.com>
 <8b54604a-ec75-4c84-9909-358510f6f3ba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b54604a-ec75-4c84-9909-358510f6f3ba@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|SN7PR19MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fbee62e-e689-48ef-9a88-08df13099ccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|23010399003|36860700016|82310400026|56012099006|11063799006|4143699003|6133799003|10067099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rjMfrkTyCUAVyiDq3RsY0YHjU5vWvzxt+Hq/c+QM+3PZ5M/T4xtogLXQ7+tE3sedE3PVInU5LCoh42rIpN0t5Linwm25fcnujgTEYcrFuFWulNjVwgsI0Mg/un1BEV2F/T6k0ScmuDzT2tE/RRH3gGaaD1Sj3h6iLXCJPIfNhtJ6HjCwLJAYzu4fXsX7LggexwAtnJNOMg8YkSUXWxD18BS5C/88bYXJhu5YiIdo3b0HxSyULYUPPjLLeutSttAlgA/9QQQ9/5UG7EqvZmFtRyal2B/adZ3RP+P/lC3BJdIY4hHWKdD3zPLCPqZkJsOAAOKk1gj2uf48GpvkJNHziBUur3BZH/icGYHXqE9qmQb5EUsUilRPi7ltudZ1XSa7c7ut0iX3OODM9n/u0z3bFGxVnb//KB8+t3XevcjqafsllGlL6H8UtC2kJfdr6Uvpd+/ezaoL1vCb7YteCdo3BNe7KZrLdtEW0FbtwzPQHdtE6fqfjpMO6F+Viqz/Tx5PM6dnwanW1+PbhiCqr6CvTn4l8aoyQRdYO3IsqI7jYpk7FchHqODRM+BbUwoWFD9Ra7F5fVU8nxCA08C2g81VyxRo/opyUgJ5xNbYJtZ8L+O8RpgxRwryxf89R7ZZrMzd5noTuDgKwoDTW/0L9YBGsUAtBAndYnpmhwM0ot57eCfplCguQ9n4D6t1iycMsvy7aaR7nRNcUJJEYZCR7b9hxw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(376014)(23010399003)(36860700016)(82310400026)(56012099006)(11063799006)(4143699003)(6133799003)(10067099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PFWIJppwZRwfm+fV6Zy6h9Q9K9rs9Yfbdk7BrFvYm8IHdJPLzFY6pyNYkWP0B5E8TolIB/bw0McRR6A9+DgPrOJEwLWqA03X3gg0rKNETboOV1zyE9Phf5Ukuw6eL+/7HGRnscpBpFfNXk0zCC6WzzS4sV+5Gp4tv26GxNSfJcOAsAFvLeLWB/Wiq4jtAoIATGqon3bXgy0ZfcuI0yr2+xPtpXRukEBHoHYMSNceryjl9A85vkcsYEixfyBBQwaB28te/mKavS902tkMOp1YSdMFmqH5qXnfT8GaDXPbz7bqr/pyYxwwMs4obTQookgNYWD0zd4/ft+MZZjfpjEYm5dVNYV7f+i1/qOs8Q3pRVla2df3PVkw7tqaw7kJv4G4IHzWnKQ2aCjAFPf/Jct+93OXrYYwZ5AdogK2Jype0YkOxq0KL35CGV0ZgSrJfXxP
X-Exchange-RoutingPolicyChecked:
	ueFftwWxFlW5axe7MaqDhM2tcaI5MwEOX1qP/mvHiYPtHKG9jtKBSIOF3NjZLmUSHgAEoMzwyGs/Qg9WQrpfXbx+YV9IUZQaAro7xZTzR+zxYgruyTyVEL7f+oKOPVraJ23aWma21SmUduTlHFv6VQ1y72Rsty5KitfeivfvNdejCSlN+DpBitlcYvalMpPYsQDDWAohoPOfmfvCrU41LztLpdsXE8B94/6upEQw/UyyAWT+1A9/Vi+9HWNXdpBj5yuPfrda6pJLZwbqTUSe/pesguW6e1JBM40ircbvJGJudQM8/+xTIlfJGhGSiRQJbdZxSjCiXsRMkCiSsKCXEw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:13:31.3917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbee62e-e689-48ef-9a88-08df13099ccb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7068
X-Authority-Analysis: v=2.4 cv=A+T5rKWG c=1 sm=1 tr=0 ts=6aa90c8a cx=c_pps
 a=e+gafPXuV192R5FN4zVsvQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=eFstyNMC5tv-yPAoyWIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzMSBTYWx0ZWRfX79VAJId7PWGM
 07V9L7S71gODz7GYjQsqsgVjAQlzRgxN8IjWhHV/6Ega/SKjf2e4L+PRAquThEYvBIvPVOR+TsH
 uSZrTq4u7bgC+OGY1KxRrUosTTBnh5b+ONOViDnIbZJxyHJTtCEEY0eJE2UlY/IIrsJ90hKBU6p
 xp+RfBTx8yFOX7gvDGRbsZWvy5Ki9pEy2D+2W6znbMxfSUYtrF6UBVAGPfdIM1+/2qWywsgO4Wm
 b2JiMCyUqiH2xDo/a0E0DgG2xY6Uu5RfmVDDdBQlw2siGeHVwXuKFnYUpm5k5Pvm4i75Dv5gEzW
 X9i43T3n6GXIa+gI8Vn2yMDDROTtKc/etsTqtQcvDf9q6dddoeWOMkNQrw2Vx3Ezsrh/eaKMAxl
 LO4+uBVVPGPk8/Zdu6wF7uexWVjMZ8Jca7ilOaN12Vdos3WVh32igeivizeCIxqjhaDHPJEWoOc
 IFHex95WTBNLkEQrVtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzMSBTYWx0ZWRfX3OhFRwksODGy
 bLBM05go1pp6Vb08iRwxsOe1w0OiLFhCdYTaxOID5t19SbXB29URfHfbqHWL+TW9lQYlSSAH2um
 izrz8mUsE5nZBxIwWxEMC3qwSRmXVhw=
X-Proofpoint-ORIG-GUID: i3EyUQUPCNSGMCDsgxTdcvjJduTDiden
X-Proofpoint-GUID: i3EyUQUPCNSGMCDsgxTdcvjJduTDiden
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 14, 2026 at 08:27:23PM +0200, Pierre-Louis Bossart wrote:
> On 9/11/26 18:19, Charles Keepax wrote:
> > Currently the auxiliary device for the link disables IRQs before
> > it calls sdw_bus_master_delete(). This has the side effect that
> > none of the devices on the link can access their own registers
> > whilst their remove functions run, because the IRQs are required
> > for bus transactions to function.
> > 
> > It would appear the reason for the disabling of the IRQs is that
> > the IRQ handler iterates through a linked list of all the links,
> > once a link is removed the memory pointed at by this linked list
> > is freed, but not removed from the linked_list. 
> 
> That wasn't the reason, even if you have a single link we all thought it
> made more sense to disable peripheral interrupts on the host before
> calling sdw_bus_master_delete()

What was the reason for deciding to do that, that is not in itself
a reason? A drivers remove callback should be able to access
registers on the device. The host here requires interrupts to
do so. This was the only functional reason in the code I could
find that things were done in this order.

> > --- a/drivers/soundwire/intel_auxdevice.c
> > +++ b/drivers/soundwire/intel_auxdevice.c
> > @@ -508,9 +508,12 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
> >  	if (!bus->prop.hw_disabled) {
> >  		sdw_intel_debugfs_exit(sdw);
> >  		cancel_delayed_work_sync(&cdns->attach_dwork);
> > -		sdw_cdns_enable_interrupt(cdns, false);
> >  	}
> > +
> >  	sdw_bus_master_delete(bus);
> > +
> > +	if (!bus->prop.hw_disabled)
> > +		sdw_cdns_enable_interrupt(cdns, false);
> >  }
> 
> Sorry, that sequence looks really weird to me.
> 
> See the code in
> 
> void sdw_bus_master_delete(struct sdw_bus *bus)
> {
> 	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
> 
> 	sdw_irq_delete(bus);
> 
> 	sdw_master_device_del(bus);
> 
> After doing all this, one would mask the interrupts on the host side with
> 
> 	if (!bus->prop.hw_disabled)
> 		sdw_cdns_enable_interrupt(cdns, false);
> 
> but that host is long gone.
> 
> Does this even work?
> 
> The last sdw_cdns_enable_interrupt(cdns, false) looks either very racy
> or useless, no?

I mean it definitely works and fixes the problems on driver
remove. I will check to see if the call is redundant at this
stage, or if there are any potential dangers I am missing.

> > diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
> > index 9710f2dc04e29..7495d35ed2fc3 100644
> > --- a/include/linux/soundwire/sdw_intel.h
> > +++ b/include/linux/soundwire/sdw_intel.h
> > @@ -307,6 +307,7 @@ struct sdw_intel_ctx {
> >  	acpi_handle handle;
> >  	struct sdw_intel_link_dev **ldev;
> >  	struct list_head link_list;
> > +	struct mutex link_lock; /* lock protecting link_list */
> >  	struct mutex shim_lock; /* lock for access to shared SHIM registers */
> 
> IIRC shim_lock was used to prevent access to common registers shared
> between links. How many locks do we need?

I mean we could reuse the lock but in my experience locks having
a clearly defined purpose is less error prone, than having catch
all locks. The shim lock claims to protect the SHIM registers,
this one protects the list of links. But if you feel strongly I
am happy to try reuse the shim lock for this?

Ultimately, I am not super attached to this way of solving the
problem but we do need to come up with some solution to allow
drivers to access their device in driver remove. This causes
devices to take 1-2 minutes to remove the driver and fills the log
with loads of error messages. I am more than happy to entertain
other ways of making that happen if you have ideas you prefer?

Thanks,
Charles
