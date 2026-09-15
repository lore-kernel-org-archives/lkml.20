Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE733F1075;
	Tue, 15 Sep 2026 09:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463750; cv=fail; b=uedBgfjwjycp2zytvtLKJzHsKbZKvvQ8eDSyPZBw1L9GDXjSqPEuINZRGeFXpTS3UA3SwedmGv167zFJIHsm8HSXrxIognqNN3G0xibEIMkhG6VL7uW/s/rbajnzChR4/QarQdMvFlQwoev1S/gkgItgIZI1zwwcW+UtoRGcpVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463750; c=relaxed/simple;
	bh=pBEvhx5XY0Oz5WkyYDwNP7q0xnnfciIobyRrrJjt+bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sd8OGVkWVGLj/JRXkyWuZvXm5Djx7OJEOmRt9VP5VJ7N6OGYv9Ks2EhoFZ++J2LdTYeKSRZLe1mVZMO6QWWvEZqoHMgm7kGsCIdPIJlbFJS2VfIum9s+aj89hx2szlXWUj5bNWnrGNdVR+kLQhKO76PrDwE1BEzxCYnQBCx8vDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Xhp3NkrG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=aTS1GmZR; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Xhp3NkrG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="aTS1GmZR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Kf7x3350193;
	Tue, 15 Sep 2026 04:15:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=tpISbbjR6WAWrnGPlo
	gS/QQd1eLznXn+dhMNxMPoDiI=; b=Xhp3NkrGWgbDc6p5yR9kOSgqlGTaogJdgL
	gk0hIzTaXvXTs1kjTOUk4aWxHx6z+hMti03EzLcRzlNKWxS5KHuRK1c/Lt1Twkls
	H7ZZo7ovWvOPQN6QSa1QC1Aflvnne/tg50iBbEBTszA28rNBN1LLga7rBsSEVtdM
	T1Ju+S3WIrGpTbRUC6s6dfcrXdcjD+2vQYbRTIFnKDOR7f3zcsfFCuEEPYYpNCw/
	pcrcDCC8iKTimTnZH5Pn3oyVWgvzTvTmPZ8pZkqECH/062OV1lIx9INJwvE2Sx/h
	SbTq8YQJFk4ZSJD1McCwhlODffRlbyk86as3HpiEfuJDbMZl0y5w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021115.outbound.protection.outlook.com [52.101.52.115])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gn44wb6e2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 04:15:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iquDX7uYnWDW68DbDIX3msD5Xg8/YDVA7kGA55jO/OTmqX/TnT4CVQIOFec2l0zp7u/VxzU1mXqFPqOjq82bPYmnecy4CcxtnRq/9wru1chP+NJf/Rsctpv8yylRVvCGhmbeXUbTRDdM0XdMbTrYNXb5rh1O0K5BBTfwLdvwvwiS9eLq5XfLDpy7Ypj+GgBCyiGmhutMwAQIVuffJgDZ5r9Xpwr06PR/iARZv79hcrbIKRWnV7YerIhDsvg8G6BoQtXRVJsnqDgxM574ER3lPmgMBcRvqVJWbIR4k8MagOgSEhLUP+cO7lmu2dco0XgHJzQWJsXKPsfkObFrlnhQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpISbbjR6WAWrnGPlogS/QQd1eLznXn+dhMNxMPoDiI=;
 b=DKsNRlbEvSfyleyRys4vDLsGBR3FDHkxDvkJY10cGcY8RFuDT9IJy1GudgA5dYK9KyFPZ4gbvG3JGqmLY2G1XdXzsS3PfjCNwu31MMd7y5LMuApcL47LNR5zaHtY9WGNgn+8DXeaQHbJGR5hDGCR9fBuCSpNqcMbwg1yZgeZYioXsMKajafeMwbO8zOqK2Mg6hdmNLdRR17XsekZ85Ysye7CyQkIb7CqhF+J/E2ag+rJH1+KKQ4XztrnZ+2BX/tlT4T+fgiAB/g2H02w+jPXurR+DcGDSTwhMR09tLJAu6RjaFJ8Jks2KBbH7/Oq+0m7NX3l7ASMbdomUAD6+qeRMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpISbbjR6WAWrnGPlogS/QQd1eLznXn+dhMNxMPoDiI=;
 b=aTS1GmZRkWVpvxMhnRekzne+sPSECqVCYYwBwypshL5fx2YCK0ZQVn4NcRA66ffNL8YgZMdFCgpGzZDH1MLGFSp7ASoa9xZsJX+H3YjLjmyPjgRgvRhnOACfno3KHtvW1HQQu77o1uDmDmNMwakjG2h+oWNHi4/gmSnKfl2aKV0=
Received: from MW4P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::16)
 by SJ2PR19MB7487.namprd19.prod.outlook.com (2603:10b6:a03:4cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Tue, 15 Sep
 2026 09:15:38 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:303:115:cafe::97) by MW4P220CA0011.outlook.office365.com
 (2603:10b6:303:115::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.11 via Frontend Transport; Tue,
 15 Sep 2026 09:15:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Tue, 15 Sep 2026 09:15:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 04E73406547;
	Tue, 15 Sep 2026 09:15:36 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D5A09820247;
	Tue, 15 Sep 2026 09:15:35 +0000 (UTC)
Date: Tue, 15 Sep 2026 10:15:34 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soundwire: bus: Don't unassign dev_num before
 unregistering device
Message-ID: <aqkMtpvk2b2DdpKx@opensource.cirrus.com>
References: <20260911161903.419814-1-ckeepax@opensource.cirrus.com>
 <20260911161903.419814-2-ckeepax@opensource.cirrus.com>
 <1ec1211c-51bb-4bd4-82c9-160216953c1e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ec1211c-51bb-4bd4-82c9-160216953c1e@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|SJ2PR19MB7487:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d4a67c5-ec9c-4921-f5eb-08df1309e788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|61400799027|82310400026|36860700016|10067099003|4143699003|11063799006|56012099006|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JLlHxLVfWDR771cadPk1VcoMLXPC0Y1IO+NU3UJ8mlVesQuOoVQf3yRH9dFhn7D3x8a1qLHejOtGAoWM93eIU4uoYQthIOxpnHKnPBb9MyvLfdNsfEspjAiOUxMiFUu4OFbtULb66n0wqT51rOjhl531SXfXShkvbvceunoVZbwVxiTwr2fuunK10KKfseGYjZMyUo5dpSp0Z8mhBnahdysTsdELdrv65ekILJePZDuh0l2IWdLLSLOY7f/AzMVlA1T4UrB4J7D9Wc6GOpIq8yO20tkwf7GQt+1ULvYWvQg9VkmTOrxNEiYWG3HVMESiPjglfj7FTbI12pNFzpH3QI5wdqNJgKwPuKX5wH+jQTMd0C5UxKeM2f42hBWHsJC8zAxFHSCMFSn3nrPKFnSDlNoLAX7A0haaYi106cpKk4xkbx6JLNcTk6ud/sr+rFCzMSTSUMuBHpo1IuCb/E2jUQPum13T7GOh438Du1KGjg3nOqI7N5utYgEGQMa1PVG6bM9lZOiTvwWHLCSt3m9oHBwC4M4Uz+Q76SX3DbBX8fz9EV451uxcPhPtx5lE0AtoGCUMPogmwQ9SC0KHshXfbFnmYMkQr1KnvZbe15gWpHLqJatTWu5DSVaiNHautpLL8whsAuHhbjeapHXvUQPHM6pDmHpvHBhIqRSV/irDtnXnsKuuOuS7CvHFfZRA1jW33Un8YUe+qFlEh5MeuQKW4w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(61400799027)(82310400026)(36860700016)(10067099003)(4143699003)(11063799006)(56012099006)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ef4uQ1b+ng8YRutox+yuUZGPW6O4Xf1O+B3SB2nQ1zqeG+vcD65UCJYTMh1ikqcU1XrLY9inOei2teZvR1ixA0Ov5WxyeEq6wF2MT1pMJilHMSvTpv7toQWM+iERu2u4c8ep6OGji0/WaCmkQAWYA+kQDv/0Nx95rSHqfjBs4hBqZibps4GJ9jS9bUhQxW1dfFpZDAsWTSvP4Yl5Uf0PnIgJLpNqsI0U0lVDemRd7KT4wz7KH3MN/RkPfqk13ukHw+yOitbO0FysoweAAFYjOwSYh46EUuasMIcCVT8xZzIjjmcX7QLGnikhOlQfNN9GcEAuB9wgaVM5LlU8WaoDRqni/3sdwk0YJTNQ0e4bwavm5cdEtJhpsADN8C041mKVwJ4PByhwXOA2qloaLvcUoWHEmR+5D+zCysOh2BT6idqrKtGEYc/elUKbtLLblGBh
X-Exchange-RoutingPolicyChecked:
	X620EtONlApBeXJhg3gNn1Ii2atKHHXVNPZhwquOz/qw6tyfgEAjO2lBpngSVqqwFD3joBKtmiKrk9DS5FrZzFfDVTON8H63DXpqKfAMhFR2k0+bPUxZVfpRVkPp0ReVu7/gT2Bf3A4LFuWRbE9uVCK660seLbDL/Doe+p843vNcONouR5vihenDNZQN+Qkm2i0X25pCW5X8QFhFR922Jz/mxqWzpLFuyLwnavm4JYl2D4DKH+Jg+6QMGUpfVl6gaoJAfpr0BJZuTSPZJrXEbLt9cBdsGbX/q0uCc8H/H4hDGWhjXoj9p01s49lrpqSJBWlUcBbe7mvvPX9S3SJGQQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:15:36.7989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4a67c5-ec9c-4921-f5eb-08df1309e788
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7487
X-Authority-Analysis: v=2.4 cv=A+T5rKWG c=1 sm=1 tr=0 ts=6aa90cbe cx=c_pps
 a=G7MN2QGakcCL30ZscpFwFQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=7sg1Ol_qWo0s7YP5hVsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzMyBTYWx0ZWRfX4ZPyoCAuDTSP
 Wjg5jmPSr1yiOa8ireJ/sH/QbFHMvxf4uoxZfFqNkmh9hS2x5fiC0/CYaLmtQ3WM0xes6v60+IG
 2Pt60D8ihzxK8prMDlZiK6UDWYtw5x3VM4c/P89ovZMYZ4IQV8oreR5WIiHC13RZoTRQ6jUe7XX
 f4ddckkdsPz5f5UlMUeZIzDlghVi9cpN1rT/qhM8HaC06c1jJEAncPxT5PRTZy9fEJJKUDMUhyS
 u7LQyeMfQuXLqPMpSIaHIgHnDpcGQR17irKHo3aLld/TzeAMsVLnnsRRbRYKJFApTRk+Q/vK9O1
 DEpgupfYldC6wriX6Guk/IymK6xroC6v6YBV2MK+L6kras4BPLfX6BlqTCXE7B9rvqKEtgZBDnP
 S6mvm6BG4fuLq7EZ2jHNZ8Upu6VB69Uy03HSPu1keHTedIBIIbuv1h0iIUnKLmNXi5BTTgP3XOz
 ZlqfWnqS1oQpzxauo0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzMyBTYWx0ZWRfX0dQvPAbft1JI
 4636bid6dzQLYdSLbOev/fbR96oQJKCCIe0A5NXo63zXV8wahd16yB3+LcYWWOmlh6ZlS4b95e+
 ZCd0QmnDRX0tbQ6yq3uAfqob1klViJg=
X-Proofpoint-ORIG-GUID: BOMXVl6JC1R1eCOTlN8ExilJyTx3bnXc
X-Proofpoint-GUID: BOMXVl6JC1R1eCOTlN8ExilJyTx3bnXc
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 14, 2026 at 08:21:34PM +0200, Pierre-Louis Bossart wrote:
> On 9/11/26 18:19, Charles Keepax wrote:
> > Don't mark dev_num as unassigned until after device_unregister()
> > has been called. The driver may want to communicate with the
> > device as part of the driver remove operation, so the dev_num
> > should remain assigned until that has completed.
> 
> That change looks fine.
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> 
> But I am a bit worried about the dev_num handling now that I think of
> it. This is *only* at the manager level. At the peripheral level, the
> dev_num register has not been modified so the hardware still reports as
> ATTACHED with the dev_num whose mask was cleared on the host side.
> IOW we have a zombie peripheral on the link, and if we do a sequence
> rmmod/insmod things could be fun...

Hmm... yeah would probably be nicer to update the slave too. I
will think that through and see if I can find time to have a look
at doing an extra patch for it.

Thanks,
Charles
