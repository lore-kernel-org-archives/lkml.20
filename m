Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D733941A92C;
	Tue, 29 Sep 2026 12:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686003; cv=fail; b=dgHjkMnhfnoEzaN43wyUeerPwP65jZwxDWgQZbDtmZSCkSr8w2o5OUqCizlDoS7vJinUnBb9b63fbk8UxdAYKmUfiI2AZ5Zw/pAs65n7kbleeOEFjSatYZc8ooSGz9dULXyn6QN89WZ2POv9ESWQeNYeU9ksn2bmnI5lIRcYvFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686003; c=relaxed/simple;
	bh=FAMFLX7BBgcltW33MQoowSu41FXSSLMe75peotdjz7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLdDAANVb+S97kGzf+JX2ip+FfbsryQ0K4LhsVwFwrWwO7XgQJcRkzpmVluXS8qUOGxdXRKqDhsKvcYUytGjgOvGR7RpPmf0qsW33LG1DKw8NjMafrBw7PQjaH4h2nqbk/ZE/y18DMnnHuTJ2WbFtjmsDtFm6I9HqNej++p+4dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=e26w7KHz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=aHLEXFE6; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="e26w7KHz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="aHLEXFE6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T4o9jV3159770;
	Tue, 29 Sep 2026 07:46:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=2FyVt5KlXIYf6JumIV
	j8a+h4O6qiUIRhrtMNaX1d8MI=; b=e26w7KHzZVfKlhkAY+VYGUUqHTqOTkw6oo
	MampJrUdIdTxz2HRAu28rvl1Zsw7qfz0zfnLdQCtRBFaN9rGBFYhGANyeP1P1vfu
	e3i3k3gxDRkoBRZuOpxwH3sALqFcOxpuGVUt91ga61U7toVhYm85erFNpLfZE2Fi
	d8hY6MWPkSeZARsrtOylDA8fj/IHiS875BuO8wmFL4tPq5PNYwYMtiSwPXgM3AXw
	hHS9PfxKsY/BJhALToyMTZDasYPaAyvbwuBWTZ4pCEXuNTYVVarYOjXvr1+Vu7PT
	xz7rpOca4aj1e0XwPtGayQOb8DewbRILhx+xAlZkrKBWlkYQ2OZg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022091.outbound.protection.outlook.com [40.107.200.91])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gxafjbcp4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 07:46:24 -0500 (CDT)
Received: from SA6PR19MB8573.namprd19.prod.outlook.com (2603:10b6:806:40e::12)
 by CO6PR19MB5339.namprd19.prod.outlook.com (2603:10b6:303:136::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 12:46:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kl2GsWhtzVfTUk8E3S5vQ2Xnhc/xGcLmqmx+Do08uJITCmuc9eBb0yD8mivtjSA+pFE3/EFcRundUqXk7Z46i3bLZB1UNDxWhLsrxlu8QhBpD2Jmxfxu2Mpt/y6yFWyHnC3PkMyHFUCffvn2tf7kjfrmvA5hXO5HDE8GVv4mYNHjAEO+O8bSy91NdHD3ozc6yGPWP0AymfxkH7Skcp3tHYXM3PDu/sE0faUvUBvrUAvRxP9eLISWeAq1p1z5BJNdMR0qXeTWyDMtlRAwaUuN65rDpWV143WW5AcbjscfCdpROe8OMWTuL9U5dIWbIh5C/VdYDdvr7vC2ChcZd6T9/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FyVt5KlXIYf6JumIVj8a+h4O6qiUIRhrtMNaX1d8MI=;
 b=h2p6K0xYYXlhr1LIyVmyRT0Phaw69TerExR0DjTxZYk1wVk1MFJPFHLf0NufAdi9v9jt8EKJSzK+wnQE3YnXqRD3SslpWbaFYBg67PRTm87a4tJfGxE3KCMcWBEVT4IlmenCL5n7htyc2nTDDEIBhJb/dnMjzdwda6dZS1adVhrzVvHH7QKRvQ/rhCfU/Z0VlLWsnxP2SD08z5lWPdXjSfhihA2nCGR0rg+Rb4uNnGuK8Qcoq6x30tDv19CeQQB58sjAJ9J6Tpj9xkhOmRO90o6nmOPmnqJLrW/7wS5VvjMvQ1AHpwsd0Y8qnVugnKOgFfUzhM8djRvOfAKbB9510g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FyVt5KlXIYf6JumIVj8a+h4O6qiUIRhrtMNaX1d8MI=;
 b=aHLEXFE6Oa2/V321lkWg5LLnvhpwemSd2gchBPxDn5Hx24/ECGzihh4q5Rwrzbl/y4NUWWt/Lx7nXz/k252zHqPy3qrrQ/xrHnhNxz0eJaF//XFnUZjseXVrIWYrZ9hUXb4ixVXgnXqt8CGxxKe2KRq2lRVsj1qwVrY1YYk+fKQ=
Received: from CH0PR03CA0298.namprd03.prod.outlook.com (2603:10b6:610:e6::33)
 by SA6PR19MB8573.namprd19.prod.outlook.com (2603:10b6:806:40e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 12:40:34 +0000
Received: from BN5PEPF00046987.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::34) by CH0PR03CA0298.outlook.office365.com
 (2603:10b6:610:e6::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 12:40:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN5PEPF00046987.mail.protection.outlook.com (10.167.245.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Tue, 29 Sep 2026 12:40:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 78F90406540;
	Tue, 29 Sep 2026 12:40:32 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 60D6882254B;
	Tue, 29 Sep 2026 12:40:32 +0000 (UTC)
Date: Tue, 29 Sep 2026 13:40:31 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
Message-ID: <aruxv3Gy0yj5YzV1@opensource.cirrus.com>
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
 <20260925154216.3520136-4-ckeepax@opensource.cirrus.com>
 <2c4ea801-f048-405d-a163-e65691e93fc7@linux.dev>
 <aronxfoVEKfBm9Zb@opensource.cirrus.com>
 <db7d1d3a-1be3-466d-9f95-2dabe918e57e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db7d1d3a-1be3-466d-9f95-2dabe918e57e@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic:
	BN5PEPF00046987:EE_|SA6PR19MB8573:EE_|CO6PR19MB5339:EE_
X-MS-Office365-Filtering-Correlation-Id: 479233e3-75db-4f6d-5f40-08df1e26dafb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700016|23010399003|10067099003|4143699003|11063799006|5023799004|56012099006|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 xEJk96oQf8Fcy3VkSRCDzmeEpWN+nYL3+JK150yjXxAHepI2ICP/v06jNLCwOddHYJFrwos+ZTTUhriD6PmAS91AhEik/CL4AGq+vBCpe3Mt1z6ToO/W9GFYh4zgrCEJKSiQoWSke5tQue+dbyIpS19psVuXGLQZWPNB10dy2KKYlmpYuhbRP1NecD24BIBm5v3vRXRLXCpSDf00XmIhYq83LzRp3MIh7nrff3eHiU9RrcFwtpMCX/V51YhBSeFwUX4/lydJYi7pGjbkwkeZeKfvgfQfDTUfWN+d1ysvua6INxctX8xv+63GY23DGMbDioDz0hpupQ3VBFbujnlbkUyLAAcUmtxp67py/Uah+cnkVRf3cIIg/2nhm9zzIwRF3DQhLuzPV8oYqYvKXktNbcuQoyVoro3wiai1kltUOcpRFsF/woCSe0Q40/1fHD1RpeQFvGwByuk/9GlwfvYsEXEgIGpuzTPznCiPcPP1whZpDigM1voo4sEILJG/1rwXkWHtg37aSrLTHhABuZNOX+PSdZ+ghqDClhGEZBfObReXAxCIG5dSl2vy6eXY/i1ohOOWXCDBzzCuOw3xNgF80URDwbVfteS2wJ9QuatKyYr1t46JB0v/SYyRInPMq4ZSNhznpRDP8/wQMvo5dFS+RtRUGdQBLrwg+2sNCDKhmY5ivr29SwIfpOBePwcAbTqBSF/pcRa+cu7GqbH65Q2ETA==
X-Forefront-Antispam-Report:
 CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700016)(23010399003)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 BlOk6uAiqe74gCG2on2EiYmvz1DFB1Fhw5ZtVp94Om4sgYcDRf4P9B3ZmupZvMEztA14T1Vyi1DfGQ4v5W8Ymar8iUKROmpuSC2WV6riQ70Vrh7pRJJlfm0XFSGJN6nyww3yECwscRo6eh8T4qCmTANwXaFiug0y4EVUcFUJBaem/QK9ZLvVQIr/nhH83j3FwD2yoPTJcEbMFKZZXcXdfy3KYZLQ+mMowprjp9pMcmpzO+jTo/3+O0OOxIKrDxE8qxF16wf4GKRVl6pZUFgO1maJf6I/zwXyFBjRoWEmMoA1XCaK07VbWiRBU0qWPUMlryMwyukrCg/Fgm0yPB1G9wTcs1SrnINfP940tASWNkBVPzPgEuXIMyFbVKQsamNDAVJCWvzssPGpNiNWMRo8oWZxCkxmp95eFT+2g+sxLIjuj/7Ua34HzXPiodv4L9VH
X-Exchange-RoutingPolicyChecked:
 AYcrKIUJYxrglEWSVwMitI/tMJp9ZjdOvTG6sMuK6Jxc7/UDOyYJaFebAQnwFFyok1FL0GoLdPWoAvP6FaEcudKtN0JXOkzTY8ErKnpaSfAcF6xxbcCWYAA5jm6ow5s8IFKu4tnS+BAG/ASe+Y1s+76vSRNcwbSh9IG289UH1VZ3Ue7Ak7RHnLtTHlL+QVr6Jb+37Cu1FT3oQphK4tcPRcbcyKpbxOhTkiKL7fUKrzC/cFmY/8fH+p6kB22eUjd/Klw2eA5wylV/P8mzFMXaSnExK8w2qe2ZogL3uaLBkEe/nlJCiZr1dh5bsz1W9jlH+GA48d57+vldFOJYiKMcbA==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 12:40:33.9253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 479233e3-75db-4f6d-5f40-08df1e26dafb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN5PEPF00046987.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8573
X-OriginatorOrg: opensource.cirrus.com
X-Authority-Analysis: v=2.4 cv=GtLXaU1C c=1 sm=1 tr=0 ts=6abbb320 cx=c_pps
 a=70jXYUHAk1O2tkEs2HJmJw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=1Z88yr78IQEsAvC-09cA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: KbVK6hU6Kcn_dRAl8V0AuCBvtJf9NhrH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MCBTYWx0ZWRfX2YhK9RtWkvjN
 RknHFrdgX7aLMSaB7PRK+XE03/FgipTFQ6p3s0kzmnky0ygVls2IWPhH+fusVq4CjVUXktZbs40
 2lXaLHG37QMsXWY3sSCfooQ9LCFjrdEeRo4hg0qPt4shja8MTtzzeiO8IpIqM9iFTbsrMpBciYi
 7G1GyvcYTcOfsbg4WGzWONqbwUUwUmIueHqbcnMb1Q9vTXOKackPN8LJqCPVVWpK6CujAphhFdy
 c6FdfpMG9Eb/h7c1twzfNZRhlzSbtC3X1sLqRxTqZ7Rp9vwukz2R+48l63LffDLWtrYJGVdNkmb
 rPPIN1Qj9hVQJIrfFeFjaE2H4VbHhwUaZFJQkFYxaYI1rmmrr6BllPjm67dl7F6sXGK+QbEkJjf
 uw1AIVbuiDUe7wAuflCdEH4y3Y+pXf9IiDpSa/xVnGX24nxUFa6lOWXsKFkF5wETITpIeymmsPf
 WPuZ0X9qvn/8ulst69Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MCBTYWx0ZWRfXyKVKVYIAG9fU
 vA5gSJb/CSoZXwGzVu7CrmljU6dt3mC+3edUTty6fRH/cNLhApChxgT05jl/qpclphYLIlObAXa
 YeaOnsGKpqYFyc++PCF98josPpEcNWA=
X-Proofpoint-GUID: KbVK6hU6Kcn_dRAl8V0AuCBvtJf9NhrH
X-Proofpoint-Spam-Reason: safe

On Tue, Sep 29, 2026 at 10:34:16AM +0200, Pierre-Louis Bossart wrote:
> On 9/28/26 10:39, Charles Keepax wrote:
> > On Sat, Sep 26, 2026 at 05:55:06PM +0200, Pierre-Louis Bossart wrote:
> >>  void sdw_bus_master_delete(struct sdw_bus *bus)
> >>  {
> >> -	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
> >> +	sdw_bus_slaves_delete(bus); <<< this would be the second call?
> >> +	sdw_bus_slaves_put(bus);
> > 
> > Yeah seemed the simplest way to not have to change any existing
> > drivers, the second call is a complete no-op if the first was
> > done.
>
> humm, that seems to work but I get this layering violation after-taste,
> and I wonder if this works for AMD?

Nothing should have changed from AMD's perspective. I do think
perhaps a slightly better fix could be done moving significant
amounts of the IRQ handling over to the IRQ framework,
however that is a much bigger piece of work and more scary
from a regressions point of view due to it being a much bigger
refactoring.

> AMD use a platform device instead of an auxiliary one, but overall this
> looks like the same problem of disabling interrupts before the
> peripheral driver is removed, no?
> 
> static void amd_sdw_manager_remove(struct platform_device *pdev)
> {
> 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
> 	int ret;
> 
> 	pm_runtime_disable(&pdev->dev);
> 	cancel_work_sync(&amd_manager->amd_sdw_work);
> 	amd_disable_sdw_interrupts(amd_manager); <<< SAME PROBLEM ??
> 	sdw_bus_master_delete(&amd_manager->bus);
> 
> If this is indeed the same problem then the AMD driver should use the
> same solution...

I am not super familiar with the AMD stuff, so take this with a
massive pinch of salt but it depends on if that IRQ is actually
involved in SoundWire command transfers.

A quick look through amd_sdw_irq_thread() and amd_sdw_xfer_msg()
looks to me like the IRQ is not involved there. So I believe
the AMD host doesn't have the same problem as the Intel one.
Although there is perhaps debate if SoundWire alerts should
still function during remove, which would be broken on AMD,
but I am not aware of any devices that need that right now.

Thanks,
Charles
