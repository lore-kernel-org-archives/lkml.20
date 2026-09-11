Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6023495501;
	Fri, 11 Sep 2026 16:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142606; cv=fail; b=C+YW2P4vBR26LFiGJJ9Ws0vF4EcVcIOOTL/Dk0PysRQfolwjPpBzg7v2zN9XJjhnlEetaoUicaWkRwBRMTCHWSMzB29h8D8y7iGanv8cXWTwiE4VFkFQO2+7Vf4Sk5JMIsoM+xtk748lJ6oWRc7NEDd9cEKpmpvzHpYsOZBp12M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142606; c=relaxed/simple;
	bh=693I3+PiFcoKuhCnEEtqoObReZ9rRKIiAxx1uB1SEbw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKczSTPEajMZ6KEfP2zYiLmzgIipRKs+qivpVmrT053B3fJHNzJkzyL9HMu8yijqNhFF1mQ4vZC7YDzSvZgUmOUyi1Y/jEZ8uK5ggSdXw8jc6QINETefRojKCgmV/7MGETCRSuSiQfTuCK6dw2QoqC4SZ7kdgPTykhZ3Z9d0Tp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=YTz6TvMz; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Z2J4xQTB; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="YTz6TvMz";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Z2J4xQTB"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68BEjZFN2019274;
	Fri, 11 Sep 2026 11:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=S3OPgx0I2/l+kxz
	IfyXAapDzjUZuY0bks2kK7gA/OwQ=; b=YTz6TvMzrtXKRXeeyuGFiECw3hkM/JR
	8rdULQhsfHkAPo8H2Ko6lcMYk7rzCMVBTYA9uKcCI3hXZa+ODiJa8sQbko8h8a7d
	caWzNlw5GyrdvSvxhD4GuEiCbny3QQjLbqtjHQt1QuJ6TRBkXxRwkVZL1QOmO4aG
	onJadziQoiorsgzHCWV+e/wg7XnhzvbZXGX616sdpmsDQdVcFxEQDMWTWN1TvpVD
	bhFKD6t02oqJf7yI1KwwTD3GXVSRnGbTOr2kTUYxRceBhiU9HlafBrSY6QJi407p
	6h9287Y7tXeiEnilAES0YBWUN2MK9XATTBwVUIXeH4wyTu6nY+c+v/Q==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010023.outbound.protection.outlook.com [52.101.85.23])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gm9gquyss-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 11:03:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQGbmpUgS0ts7yXc5CJ/cDfPpXQvgSKH15dv6iDhvo9NgnJxHTB1VO2l63wZ3ROFMJhCshzWSZ1DvM18og2B9wp8H/LBavF6KIbtZ6WQ3YS8VKepgYYIPMMgu5/NfNJM58mxCH7/db+jJA3QVfN33QEoFQDwX3eXB/qfaKQfq8uMXXCbJ/X9bjVO9uFUsNflAK7LTYGvxCNy3bhrRmmFH+AlX3SZM5jnYZh1tvgiDTLd8+LJ0RC5kQ4eLnMPQ/vYl0HsB7g42Dx2ZcO8IoxAPKzgcv6vXNx/wqFcUlBbHo5VlvYWQbqJMHU6Re9eYR0Kpv2DjcTPBW0C8NWQkN14Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3OPgx0I2/l+kxzIfyXAapDzjUZuY0bks2kK7gA/OwQ=;
 b=jyeRDOnY8mO6lPWGwLCJECZQz1ChqULgpLPMjVxleNTs6R6i/oF17c56rxRzCZC1L4b8XaND+MXP4Uqv5dIMR295vQfEUO4UjSHnZ7rPF1M626I6R/iRF06gNLv+3Tvof1/jalc1guxDH0Hsau7QeyRaWO7SijOLgnHv1zPaSbiMvdf/tsqYU9b91iEoywlnqFgZhEbB/xoWhh+YFGLVo6SkSdExdR6woIDnhk460XFp39FayJV6njSt0UeUQvA847GDmNlodgNXs1J1dBFxDhJq+E2BXRAuXZSlN2NeFQqSX83ULlWh0uX2dpvAu/8boV6RMyrJ99ozcqZpJ5iuLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3OPgx0I2/l+kxzIfyXAapDzjUZuY0bks2kK7gA/OwQ=;
 b=Z2J4xQTB9FibtZlWANJkvFAfifKtYhMmAG2ccrieanvANpvKTUM33aSIMLtyJ1uAxwpWXhN5CEOQ5YnGfrcEWVAdC0A9UvYq7InN+IwpN0t4aDRg3Ek0Jd2BUqObQ568TTA3xjxQfFq2ddGrkEQz3jwlhObS27mXHo4e/UHgeI4=
Received: from PH7P220CA0038.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::21)
 by SAVPR10MB997819.namprd10.prod.outlook.com (2603:10b6:806:4e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Fri, 11 Sep
 2026 16:03:19 +0000
Received: from MW1PEPF0001615E.namprd21.prod.outlook.com
 (2603:10b6:510:32b:cafe::36) by PH7P220CA0038.outlook.office365.com
 (2603:10b6:510:32b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Fri,
 11 Sep 2026 16:03:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW1PEPF0001615E.mail.protection.outlook.com (10.167.249.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.1 via Frontend Transport; Fri, 11 Sep 2026 16:03:18 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 11:02:57 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 11:02:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 11:02:57 -0500
Received: from localhost (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BG2vh9399371;
	Fri, 11 Sep 2026 11:02:57 -0500
Date: Fri, 11 Sep 2026 11:02:57 -0500
From: Kendall Willis <k-willis@ti.com>
To: Nishanth Menon <nm@ti.com>
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
Message-ID: <20260911160257.xgq3xe76iijq2bxw@uda0506412>
References: <20260820-upstream-standby-v1-0-6a0553b9713d@ti.com>
 <20260820-upstream-standby-v1-1-6a0553b9713d@ti.com>
 <38c8d72a-50e5-44e2-a196-fb6b9f7530b0@ti.com>
 <20260909112211.2zckbx2omnrjhkwp@scarily>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260909112211.2zckbx2omnrjhkwp@scarily>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615E:EE_|SAVPR10MB997819:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f657037-8493-4655-675f-08df101e324b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|10067099003|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	bflSLlRMo+EnTpf4rEg6dmHr5+lhtZhBDGWFfwlH9ch3sTz+TmIPEQ3sDFxlGNlWkG1vRrgTHRoIq92rb70vpBCGG8sO+E/jUHxf/yYkfJ+OjZu/+ynzmiGDAeCdFDy8w4f963zU7FfRfRWJcqVE2xakITkE3M3F856k8zn65QDT/j4Bpj8K8R4PS005ikkQbdoAIPdKqP0TOSVPTeSeq4KvwO18g+bTLilwdkgImk2XgYKSJXHlOzWUqQ13jGjWVrz1KJwmKyCVOBmZqTIZW2rmfw0HRKu57SkqGwXUT3bL2lBW4N3GXfPJD/f8czb+YCV4MglNAYeSmLorRiReBlti5LamUYlip1CeWg2Zg8YTF5gzYpOprgmYVSyfU+Kuj3ehbOWo7DFG23gRUM7zdqhrrCaIv/A8BtnBhahmOo5W0t91G20qaxWCS19T9i65vAnSRnv6K567F5jakqx1grbfOg3YJ+8mi+WXM1Pgz2el0LI94iJzySjC/QGM/mxasZasHDBOk9NHCtVddq/vYDL7PzMo2ZWdLSaNtdOI6yz9DmGjkQJaCxCC3xfhi3JpyyRhWwS5CUzQ2dhmihhMiLrW/ayfQBXDGTPbb2jFRTAzw7pw2+9K5PnJYcVSuTSI/vsWviFZ84j+GtWsW7KnCN8g32pS78mja7roeOkTnfjkW5gephZj/XPJR+xMAcCCzW0TerFqaLEek3QCeZJwgA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8qyzlGK/nq0XQcAiBQykha5/uFTUsbOeSoBAxubF0zNPARRpxxXMzTQxDAm+6egZBDPTG+o8Ai+sBSAuvvmYl42WrNg911LKfelhjGqnkT4Z1iEBgk+jTiuTwIaBUuiQUDzy+XH78ckfmj48jNgnUQHdMQVWRoR6P5mOkLz7H3rVk3FVhMk+gI9wm9f0IOi2S2OhQ2bIE+e9+qT+F/0KafoYZiDrvJghkeaMhcdqDIkikq14jdcMeqJgpZ2m/QN9MDnfzfY+keIxvIkKPDVEB3b8lzF+XInt0itfELd0wAYPbJ+wOJMykxzSwPCX2J9CVV0n7Jd7d9DZL1/htQOBqilVH8Uqo1Hvynb4xeQRTXaMwlWwT8TPvnZag+Im8aFys9CETTzZi0Z8QJtCjN3G5IVzjfgelY/7UOPOAXpHKletGjkOkYxWtALXR4WuIInB
X-Exchange-RoutingPolicyChecked:
	oEIZopQKNs00aCURy9LoEZKPr4B3qX+0lpXBRgn4DrnTq+o2ptTygaTB+3eLLlTg99HBEV7T1gRINcEhVdNWD/Yo7sXuFqXeWe5UV0u73mlZUcY/w1jTmqhw1I/7ZdiK8wXPF3OHGtfSpflGhRcYMJxPRwlSdyDpnD7ELKNipsuE+sTlWodrwRKYP7b57NbqXS++d3BKEcSD2zs2nGXXkHs0/LlW3keEhLdn5M45Phnid2KrIlc1nqkkAJxXGDae6V9i2e7TvvAUU8OFukJSSU8mvcpo/NQWO0GIyr9BbAGrSuPQonFF9Ux+tqQtVrmPniACtjOQ53TKDRYSL9lSzg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:03:18.7500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f657037-8493-4655-675f-08df101e324b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR10MB997819
X-Proofpoint-GUID: cPCY_jk6UVZuUC88SDa5I3Hc6xc_4C7e
X-Proofpoint-ORIG-GUID: cPCY_jk6UVZuUC88SDa5I3Hc6xc_4C7e
X-Authority-Analysis: v=2.4 cv=XaUcX455 c=1 sm=1 tr=0 ts=6aa42648 cx=c_pps
 a=3TwBhgzW/NSYP80ElIqEIA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=F8Rkng_cwtQC9TaxgLYA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIyMyBTYWx0ZWRfX/YBxb6UJvTra
 /pSRvZLRWw240oNI0z/mUAk0hT+J/5zrnt+7qaV6KtEtDAj6CemMl3X9t27SNItbLWmkXNdzZOQ
 CGs6uCitvdyXcj4su7Zu8CN1vYjxpAAi+F/8RBbFYvr2C7JIyzIRgicp1Q+q2/99iHFMT1ek4Z8
 dJ9ecdA1Uil17eiC0LFvkfZnk5nENMB+MbbMwpixuaMk+u0LqwS/sxMFFpdBcwtPTO8GL/uj3y2
 9B/H0dwq+xNWF06ZJa2Ny1SNv6xv8BKHVhE4x/iVUVau4zWZ3KR+fXfWum1xCxo1q7q7eH50X7g
 5ucJcmzf2GrK5NbqQHGJkeqoeawkyqnoGNahZNz5LLgVpMisS+U/ZOt/b+x4FtWPXhPnQ1rEE9Y
 0KtAOGRb31HewGJuqjlz42V4WRq60y7YkE6i+xU25OZYBQ2ZDCUneoGefAXoddmcaHIwGc88HRj
 WAgbYf1rQRRvXqjsHWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIyMyBTYWx0ZWRfX2I21Amz98FBs
 FhSl3SWg5HbT9hL/8g9EDcpnKebk/C5aROrO73nZDXD1MiPo6j+DYUhH14F6zKp1n/QBLR51gop
 wnqCuVQ2NoI4EnVoQwNZ6Igana6ej28=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110223

Hi Nishanth,
On 06:22-20260909, Nishanth Menon wrote:
> On 16:00-20260907, Scaria Kochidanadu wrote:
> > 
> > On 21/08/26 00:58, Kendall Willis wrote:
> > > Allow the A53 cores to enter standby mode on the AM62x SoC.
> > > The standby idle state enables the CPU cores to enter WFI through the
> > > CPUIdle framework.
> 
> A very basic question: Default Idle in kernel *is* WFI. So, what kind of
> savings are we seeing by explicitly enabling a cpuidle state that goes
> to WFI and more importantly why?
>

There is no additional power savings from the added cpuidle state.
Adding the cpuidle state allows users to use cpuidle to see see stats
about WFI from userspace.

Best,
Kendall
