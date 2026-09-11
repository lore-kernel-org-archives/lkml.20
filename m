Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D07439008;
	Fri, 11 Sep 2026 19:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154771; cv=fail; b=D+wekvQIkdTUeBqvLdEx6/4Tf1ih3G7wADHSsY2aJTmP4c2Ey6HSw4gVv+sncqV0y050iE61tvP8GzbpqNlw7Tr8wCgSAkHX5KgouNv50JMez+aIFy4ARX8/Gc8vZhXCsPV8f/y7pLNACWdguFR/cbdToTjPCgS3sFHT2Dznvac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154771; c=relaxed/simple;
	bh=b2Js/9zA83qgkC3CB/uAjhc7at2EjsBn+OAEhjjLUuM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7m36lgzc8wMdWvKdeH1qBQkwzA9ywncbhfBbLKenGshNJe38C7nka/RhgkbIV50nQ90tuxwPvuekqP48D8HJtU/VxlWHFjX1GWMvoIJi4knpk/x308YcfhWcqFxkj7dYGgEQL/r5fW1IdlaaaakpA6ihqiB+6m1XQBscZeGV88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=n+a+13T3; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=McYo5ofZ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="n+a+13T3";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="McYo5ofZ"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHV0lq2544565;
	Fri, 11 Sep 2026 14:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=MZN8zcuuS67Kyfe
	FdB3JfWZXDCzeu0ndIRH8umdHgP0=; b=n+a+13T3HeHNlzc0W4B4u6aFKbCZO/L
	OAQ4OAk02PT5z18qq8bWGMv/kXWUbBkXw7H30wI6izpy4baL7thKxe83ZB4fqvup
	ccTQ6IVEUwRW1Zk1vrFIoO/o9fRExWJJPCVNIRbhebRSb29Tei4Eq8gKczyYzdCW
	k52yTDQdRkEkw8/nOF/CyzOfVaBDH7PJOiw0Rc3Ww9/WCTFcDbZUrnQsjvn24ZO8
	0rlOW/e280L/hmJxIy6ET2lPfyg8kPnu3hVuJjTyXJM5Fr1R9J8Uz2OS81viN/T+
	P/dFu8JcwLX7hYpk4tFSKMNR2rLx4HtZF1NzmsxdbD06CCJS4ntcacQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010062.outbound.protection.outlook.com [52.101.56.62])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkyw9rjuf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 14:25:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6En8QGAsW0A9fLSU7d6DUd4RVwG57Z4aKU2otMupZP008V7luiXesf4XtKHfzWJD48edEiFXu2QWaVqy/0oLN5iFhsiR/axoWNAPjBaDXPs8yW4Y+5zM9k7OcoEIsjy0HJCLKXhv0hs7+EHa9wxC23thkczHLxyvtKuio65/Tm1E+WMYNnw49rsIY0cpPGDUf94PLDjxV88RQSOjgR9aUWT+zmo9GpYXRjrTyeW/XDWHV6jGzUuJepE7uS0goHpRj2YU+0smaUFTVRnAiTqaHDKlsQVlfOvKHUVq2aBN2mFhnq7wdJ9flW1iU0UpW0vgnwgSwzxdoGf4khANNM1kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZN8zcuuS67KyfeFdB3JfWZXDCzeu0ndIRH8umdHgP0=;
 b=coLszzqaTEVhmgJUi/w+FE/MvtnS/s93x1RwgL+IyjoQfSNcqIO6sv8u90/Oxh1ExFtUzjpfNMsATuZxyD3GSk0DZkSvKf2gjVja5P1F07LcrCZvR91irB4O7crsIjy9xkM8eUWwNLcpnaI5FfZfZfUwg2IKwJj4HEMt+YwAmeTlwGME9SScHagdUC9pM7jxTtDxM0bA9J6F3oyACVxFW+iQ8QkJuy4WOUEp6ikrrOMKtz/CW5znKgEQNiJWTadGGYKChtTep/7ZM8yct/36r/5ymmZI3M5QF2Uli3zSU7pkRMFmgB+wuCDa7AiXR6pTGr9VUsFp5f/PZjm1dpUZlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZN8zcuuS67KyfeFdB3JfWZXDCzeu0ndIRH8umdHgP0=;
 b=McYo5ofZoYTEnvmUuucf8bl9MJlvYku2i5lj0D6ZLIwRv8Epk3gwUKZU1IYs10W/ofd/CcijiuA/xPCWvYd+w590iQ46dqsS0gSKIjsScMUVrnKZY50SAF4Hubl9RyaLGK71pGFHPczocsRjH7Ueih3MJThyQQxpptzQqpTq6mc=
Received: from BN0PR10CA0024.namprd10.prod.outlook.com (2603:10b6:408:143::15)
 by SJ5PPFBC9E970C5.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Fri, 11 Sep
 2026 19:25:32 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:143:cafe::6f) by BN0PR10CA0024.outlook.office365.com
 (2603:10b6:408:143::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Fri,
 11 Sep 2026 19:25:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 19:25:27 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:24:51 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:24:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 14:24:51 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BJOpdN1665997;
	Fri, 11 Sep 2026 14:24:51 -0500
Date: Fri, 11 Sep 2026 14:24:51 -0500
From: Nishanth Menon <nm@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: Scaria Kochidanadu <s-kochidanadu@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <a-kaur@ti.com>,
        <s-tripathi1@ti.com>, <vishalm@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: ti: k3-am625: add standby cpu idle state
Message-ID: <20260911192451.joeoap4fov5uds2u@decrease>
References: <20260820-upstream-standby-v1-0-6a0553b9713d@ti.com>
 <20260820-upstream-standby-v1-1-6a0553b9713d@ti.com>
 <38c8d72a-50e5-44e2-a196-fb6b9f7530b0@ti.com>
 <20260909112211.2zckbx2omnrjhkwp@scarily>
 <20260911160257.xgq3xe76iijq2bxw@uda0506412>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911160257.xgq3xe76iijq2bxw@uda0506412>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|SJ5PPFBC9E970C5:EE_
X-MS-Office365-Filtering-Correlation-Id: f3890b4e-3a26-4696-ce1c-08df103a6fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|13003099007|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vg5acEikcGz9hunOspmvNHjBan6gtmElR1gtUlNFy4NdYdX4NgeKI0KkOLyWx3tcpX98KFy/5y86d8JLq0M+8DTToE+Istl1o/n/OSzG16FHz1cQjr+ChEb0TpjHBrz/A4jfKCM33CPUDcVefB4/JINOD+n4CHlyu7EtiectOGbXkfkXSMU/ctLMq3IA4kf89nnKIxq4GKnjzFI1PmqYCirBgz+Mt9qq1TLMktxpaVlCfzxaBkKtANOydzFMrdGI5SROv7pABJWJ0LBVEnDqqfKUxYr0jJBB09Hhs/hECZ3UOvflQTl12nhA4j/GAPMx4AyTK3StbSasYW7YRpSPpVS4h/0yiiWMEtzI3QiGg6oVWFdOUCaaBQ5wI3omN73TYN9fSDCRjxTWSCBZr8m178R5+Ur+Clz3MSlmQb88WcfXNYJ2z6L58QkPF5gtC4WOELTtGbI2+Hzlq/u64oQ09kAf/TtXPv4ATt4gUfLdtb8RJsOnwtTXwWtT3pRZdEjxmGT+EL9gE1GAPzQ+Z0CAn5iqUne83r6eliLkfsTq22HGgdnm9aE1T7S2NWCMPhzdpUBQkSuM3og1ydsR9+OIgWbedsFh7BJkNGY2LYDAvFRi2qmuvteMEUnkO1azb+v75rRHW/pVg/KBYc0nNnp3pgwmHcBcop1C8i3m3sgjgmiQ0JQAeRij+90EI9cichsHZiHse+vYXiuuNolLJXzbuQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(13003099007)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IzPPzucB2caNflaQOib2vcSjJYy0PitsBI2gPzAV6IE9GpcN8v1YZ8b+1331kihrSqt3OrMDfhRmiAcp9PnDBkL0GvMI3HnPmsmi57y9uitWFbBWu2BwZ+Xy9sgU5cQFuYfyjcq9TenCQF8ihQxDLydMDhkqnijACJaUrw4Yi2a+Pb6p4Zl9RcofOy+37eDHd2RqLn/kYcenfAPZmBg99dn48D6BZfaLyEe5G8Nojzg9GVAWC1oVWAPDoxUq4ij/ugvWq/AbKBZ/9ngYZ5V9ftRQ7tTHZCDyGE8UXzgN4ZO8eD/7tnFJWtMbBbYzysC1GyZNvxfHLajBrUTrqRkIl//YVXkOe5yPlV7wvCfHHUV6ewvj1TIZMKpBoGU89xLWy3Ve1XIxUSiZHGKYjOujh8hAvPJ9ju7OfoqbY2vhlxhbCId4ix04CscJ3EdKJDmz
X-Exchange-RoutingPolicyChecked:
	2BwOh57SdSb26bXIzTGNOT5FxuitidsouYkn9bPYgvJg0lhZTWuC2oDkYGNbLbwzeAFtRH4a2S6dMf6CU9f9fU92n0hRR+w5+dlZ2uSI/9mQVGi4U/JdDFxnGADW0IGx2jr6B5A1zUrFQf4KKDAL7OZU63PVgSqoRsbvdIIa8u9Sodh1s98iq6LUdsOnYOGuXNccbMGkgeTVv8g20HA3/RI4ngk36ltHDCBW4AkEDtjzaJiMFj2q2SwmTO57W5f6nSXoQpfv4T71CJJmk8IQ1+qjyUR4Z4BLCAmUwq5Phb6DbJPxMfWc1gJ/i9Vd6nuPE8yIQ0+ZUqyrn9KVhD57aA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:25:27.9859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3890b4e-3a26-4696-ce1c-08df103a6fe0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBC9E970C5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI3MyBTYWx0ZWRfXy9WaSN1XaIHk
 8do71QJLrLRLTtR4P+kBJgu9+I+WFPt1vU/ZHG7w7mYUAhCaSsqj2xjYEduP6dBQ3pZrNaFLBBb
 7EoaCKQ3tyfDknZR2NAiYnMIl/MIwp8=
X-Authority-Analysis: v=2.4 cv=ON6yTiaB c=1 sm=1 tr=0 ts=6aa455c0 cx=c_pps
 a=i7V4Gi3kv8keisB7wl6Q2w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=Yl2eXevrh2JXMWbZ8t0A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: NAJWs3J1UqyOhJ8RdxwlUT5Gij8lN00F
X-Proofpoint-ORIG-GUID: NAJWs3J1UqyOhJ8RdxwlUT5Gij8lN00F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI3MyBTYWx0ZWRfXyHE5NpwbR6Kd
 MWzWs6KtLecS9osACih093CR4FhbzMXk08ib+mtrdal4Q+i/mOZkr9nIXRlkGvyU0otdih2FO2s
 ZCq9AwQ3quV7zmuGOp84U1vTCOhVQyUMU62PEPnSSmsl1MqqpYsescwT9PU/RgJPS4cuCjF9eW6
 zT8SvJRhCPvSIkzcNJ3+P/+UCzmOQBx16S2DbBfKNpT4YuS/FGClveWD609ns1YWAhE6gz8oAPP
 3UT32QjlM4ZuJ4G+6D7l5BTgn0lD6pgPnjW8y05mjnNzOsGUG14xrHS2vBAxqHNGdWYVWZi7bdy
 0Q5O7cPJu+g0pwo1NnTIOTvJQi5hhQjAvrogsrkleplwxX+D51zpw2pVssfxvvr2IAm9P4z2Gmo
 gQmycyJ8iZdCb+5urVsboWH94fmC/PN7F/cQmbWXIHrWKacl3f278ES8rsVEENjgr9lrDDl4Pjy
 6sHaePMXE5ErcIXF0Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110273

On 11:02-20260911, Kendall Willis wrote:
> Hi Nishanth,
> On 06:22-20260909, Nishanth Menon wrote:
> > On 16:00-20260907, Scaria Kochidanadu wrote:
> > > 
> > > On 21/08/26 00:58, Kendall Willis wrote:
> > > > Allow the A53 cores to enter standby mode on the AM62x SoC.
> > > > The standby idle state enables the CPU cores to enter WFI through the
> > > > CPUIdle framework.
> > 
> > A very basic question: Default Idle in kernel *is* WFI. So, what kind of
> > savings are we seeing by explicitly enabling a cpuidle state that goes
> > to WFI and more importantly why?
> >
> 
> There is no additional power savings from the added cpuidle state.
> Adding the cpuidle state allows users to use cpuidle to see see stats
> about WFI from userspace.

If you mean how many times the processor hit WFI? mpstat -P ALL 1 ?
cat /proc/uptime (second field)?

Will drop the series for want of better justification to carry these
patches.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
