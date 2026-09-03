Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAE137648F;
	Thu,  3 Sep 2026 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427026; cv=fail; b=Ns3YE2DQ18JX4Sq6T5mpQSRMy+uBeq3KGLmgE/26SVau0wuBvY5Vqj4ntraOMY64ozn/FcMUoR5vpFgwZvqefbEP2NOsRcAnI/vtIB9GcQAPtKlf86jjIivWZWC3sdpVtOGsH1LVg23Au0aWQTwrYt2f8rYtbmx0EMgmUVIKLtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427026; c=relaxed/simple;
	bh=C1hyWn1NIvEVRLeWkUY5g00AH3QPHMbpZM6P2EQbPI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bgWGDbNcNXheaC4LbzO/S49NcUPuDMIwn5siS3W0p5naQvnBlk6UDuuzOySYbNmMpyeel3GgySmZqf2rk8h7UjPuS9V7oSzTwhDv8Cxcqg0AFnMrBcBYjEFHUTm1DVhyxyXFKVAqB+iH5SWZtcIEbp5iEVE/XJJUd8r6aSzNXa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=MxBxVvTb; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZanRQedT; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="MxBxVvTb";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZanRQedT"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68391CHO3302174;
	Thu, 3 Sep 2026 04:16:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=yScHecepnSl77oXyawtJTt41FqDWSM6OqAv9e7/J2
	Vs=; b=MxBxVvTbl0rG7Q6cplMQjBLdDxNJ0iYb9CfROywG3keTA1VfcuwTgb/nB
	J93ywKglsBHrI0JlFj6VrMWEC9i4kTAGMoGP8NlNhT+qRBjrcQrlyiUsTPOrbQZY
	z0DroRAYPNMsKQ+UpoRy2s5TYXj7IxGqSw6wfvup1G+O6lyQbv9UI2iPaPpRZtCX
	5RV7uOGSdSyPUNNQUCOnyAeLxE+q8jbRrXZiwnm1AXzBzscG1C5I7/PjpuPfyfBR
	QgSoA+04woD9Bb9Tc5mbl8hbw+Mgw1+OBKkNlM0lcaeLl4EFSKYd0vW9Vjx4TsfU
	HJ2zVoWT5K+XaeS3YUItobqeimiFw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gf0jv1vk1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 04:16:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4GZx56cTNrRAsui2LFreWm22ho75S7GWdQ+dJZW9nFU7F+quLXmMTvaSaizTBWLI1cIjFwiv6v3wqQbJKzsdwDXUgAXc+J53Mb+4M0Oh3iwiIQ5Ngq4GgL6Z/aY+nXdLGxn2Fe+yqvh46rsEvY4UqU4J19lrp+YQ352YPuEm+40GtblB+4rdSiC0hHRc16W7qefT/tWHdtZ9UykzRCnOOJG/pIyLc4J6FS0GQSrQd2PT41TwUsMe+DprZV8T4Rgu1t5/mrAPbfPcU1nqLTynXAlPyFDQKEGyOQVmbtyHlrkw2u+8wzmv5vNlFZHXt9aLANq25T7IiVoxv/ycdeCgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yScHecepnSl77oXyawtJTt41FqDWSM6OqAv9e7/J2Vs=;
 b=Tlx1Sc3KB0bCovMQyw1L2/Az1EPeMopePXwtt01HL1mpTleMesa+e6dffCdntJBYcqxqjaVF6/ydXoyYnbYOcrGk9wZPQBukfcsrt81NUtFytPyf2eT6Br5yBa1J6NGZyfCVv+UhyheIqTK6gFpJNkIGEstH15Af6gGPulEob+c491ul2uWaNFQAUwPx0feGdC1/q8c6hj54pFG9SIA4Om364IfVeOQ5K+Ce9A47GLjzzp78Z0ZQk6NJBQ/kDnbI893rg6qpm0FOYcOGHtOTXMnzMrIr7oBzsFaUDwv6ijmPMqwgowlP52hpV1nH+fgMBs9a1CseHQZZZbs/qBaLZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yScHecepnSl77oXyawtJTt41FqDWSM6OqAv9e7/J2Vs=;
 b=ZanRQedTAurkwwXN9y2JEYF7i5oSdNkE0cve+J1Lw+qyamdL89JBdjhcZQ7V2XraJ7XqOo0IABAVZryQQXhEX8olAZpYTa3QMqbTS1FLU+NoFMTQjRgynJESuhzmd4EHS1l8apGcLeciFct5GJmGRpeGbNm+tsPUWnBMuxqgvws=
Received: from BLAPR03CA0091.namprd03.prod.outlook.com (2603:10b6:208:32a::6)
 by CHAPR10MB997745.namprd10.prod.outlook.com (2603:10b6:610:2f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 09:16:41 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:208:32a:cafe::28) by BLAPR03CA0091.outlook.office365.com
 (2603:10b6:208:32a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 09:16:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 09:16:41 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 04:16:20 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 04:16:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 04:16:20 -0500
Received: from [10.24.52.205] (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6839GGq01268955;
	Thu, 3 Sep 2026 04:16:17 -0500
Message-ID: <25d22caf-c971-4a6b-887a-7770a0bfb6c4@ti.com>
Date: Thu, 3 Sep 2026 14:46:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add DSS support for AM62L SoC
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260811130822.2324438-1-s-jain1@ti.com>
 <5727ba42-4469-4a12-ab70-9f85089dc6c1@ideasonboard.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <5727ba42-4469-4a12-ab70-9f85089dc6c1@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|CHAPR10MB997745:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f042ab-1372-426d-9928-08df099c10d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|10067099003|3023799007|56012099006|4143699003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	Dlv+SeLgnoJMaBxhtP+jO9wS+FroobDrZSJwn8c6THzwTl2DsjsDRVIZ6LEUy8LixkiAe89BArl6pttYpg3WJ2+v2WpYGM18YhclAiai4MHGRai7IfnSJYnXqU3GamQDtgBrGRu4QETAtFB7YSZYOBNs7DMVsOGVi3evwrI6viMyuTYjxaUlZLDa6JZSdFly0cic9Fq8ZjysthOh44nutNx18wuvqYYd066aZKkINVbMr0Z06AgbfjASaOFQ6JjK6yBuF5EqwBWdZCJoZXD/J167wLY+nl81IjyAYcHQfLmBXt5Lf4l/N1P/MOkpg/JJg/H3aiELH66piHTll/a0lVGXyVK1ZV2rX9KoGDJdyxw4kA5hAlUvWgeEb2AJbDc5UI0rV8YcsY/hqqhYBcb171oDNNeCd0LUpRdmmclyU6YQX3I3HyQsuXQ/dJrJsr5fQ4EuH4csuw/Uetf3CPYbeHNzIuwEiqWSScF+ZGT3snrpibbkbj0RPjvR+j9do9xaPyBiZItqXOA6JxnGkmXfLRyVphbXKDbJpgnsEM/Z1+nEE91JKG6QuAaT0hPbhhVQDuqxzBaHc00yjSa0TCC8UUleA0e+ya9McfV7KkdgafXkfTnJ+D3ytNOLm+Bz3wliteFXFgZgnI17FggBscgJqOtfopea5AJA8zAXD1YeyivYahM6orYafdscz60LUObFZVdsV7R3zH2jPJCiTkMC6Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(10067099003)(3023799007)(56012099006)(4143699003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6D5jzNv3sobfDR2azkIOJ2gcLOWZ3pcTcKF5VnADbTXJa4cple0LkDOFbkgClBNGRUOSWRhKGgV7WxVCbGO8TI2ECOdSzIps8SZb0OprBIQFwJg8hbtFHprzmmOjLMcXdaKN2npxOVYmj+4F1LW1OyAs/N3G7aHjBlQIVI1h5+pxa5lJPWLsXBHvMkh1woWv6+yjgBqCqoUAYQ6g8GBdxW1aph4gW7wrtULE9579mfV91VB8Dbd07gil55Dpb1RdRyatRNipcP/cEoqnORLltnFDFYEVNvN8AcP4UJWzAvdWwI2GLJL98s1qd1uJo/ayxsrthRnMLh5+oauyKrgLynITyL2aldbRQL5yaA7Ec3WttQ4Me0kr76LvSKguRCPYPqXoKQgLDJ3avkUz+lAIq+Aj4g2+xFZw0ncGhjCzi+6v6tKLufugf4w/6Es7xHBx
X-Exchange-RoutingPolicyChecked:
	5nUJ6cZjILClBIIEZ0EtlevQ7wUUCvtPYRfzKP/L1h6joq3kGi3Dspp3+3NFApapSEoyUWAoaqibbut965VQnlZF1YwtmhUeV/AY0q6gHtupab9Tg/HzRCN/87Yh4XmIxezAfSlSCmBY+ARACzzZYMIJLn9yVOl44wwPrger2TJhGRumcg1vOEdQQxEeAfoOjtgyiNZIBmgDI18pcS/0pV9etOQmLdd5tnKRlwly7xq50lxmT8pV5LL5rKMcw0Z7tsDvq2GkkXV1ffLh1oKcRCeN5hZPh9WqRyK9RbSts8R3W1jtGF18cK/4vwfD7uye+BUtCGTru6u1X9JFHwbe9w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 09:16:41.0518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f042ab-1372-426d-9928-08df099c10d1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR10MB997745
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3OSBTYWx0ZWRfX4hEOYdPUKOBu
 mGLwsewmqvUeyLvZLmAtOq8LP7ymg93R/uP+2smKHqGekO2/x1AD8bgFvasZIBZMq7u1ZzAHnOS
 L+jvQMX6g3nJ0TKaoxaTGr9B0W2ydj4=
X-Authority-Analysis: v=2.4 cv=J6eaKgnS c=1 sm=1 tr=0 ts=6a993b07 cx=c_pps
 a=zHP1L1ZDY46t+2XtVYLmoA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=P1BnusSwAAAA:8 a=Bdq-GAt1Ba0-0Rc_Fw8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: xUvyWa_5M9qg4YHbHXXC4migUrRr6bUE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3OSBTYWx0ZWRfX7qLsCjKmMsF/
 sHEGU1pb7ijjBBwbLW49e5cyDC9mZTt+6JxPENs5g9yGp4t+m4K03xBb6/aOJEHcCzP/Uz7mnyE
 k5jkIMVh3IjFc57j2evbUWpR5KVBADhOShkU+4Dvc7D7ZQ8Z255zhTCQFMG9Z2bTk/GmF68CgMu
 Y++fJz58Ca+RwC2aZN3WLyNf+BMw7HrbCwXf1hW8l5ZggbItYQwePV/K/f9XtYp+rZY+9dswqNx
 /S4vbShCX0ECnsjIFXYZs1mpYsSpXw+kFcQFMFyisJaRxVbqo/Tu2OPBkeLtJ/60OMvUNxqTpnP
 yiO89KqX0cI3TPpJI1bWIWfgXUcBZIKjUGFIpuce8XLmg6ZkObiRr2GzXUwPWgfFuQ4ndoRRbiP
 JKIKjRApjhXu3xmLsoCgIuHQlCFcrEVQuV15tll/v/Atl/B1zayS0LLr3gT7G3/jQMoCgTNnBDP
 51y9kKCEKJ2HtEmuIiQ==
X-Proofpoint-ORIG-GUID: xUvyWa_5M9qg4YHbHXXC4migUrRr6bUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030079

Hi Tomi,

On 8/21/26 14:32, Tomi Valkeinen wrote:
> Hi,
> 
> On 11/08/2026 16:08, Swamil Jain wrote:
>> This series:
>> - Adds base support to enable Display on TI AM62L[1] SoCs
>> - Adds base support for DSI output
>> - Enbales HDMI output out-of-box
>>
>> [1]: https://www.ti.com/product/AM62L

Thanks for reviewing the patch.

> Do we really need bootph-all? In any case:
>

We need it to enable splash-screen.

Regards,
Swamil


> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
>   Tomi
> 

