Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FAD493632
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355628; cv=fail; b=CUTTLgArOfQmzf3UbCbJs+3qZdaN6+rmvXoMMtf9cu2jXiGbKslUcungOdlWZFrbNWo7S19zATceoXknGa7JphQFac2IK50XPhZLm8QynxPAZk7SAvnAiAPGXDBmxsAuuIq5gCwBrrOdn0ME3a2wOgUKceccWOIeAtLZ2bMEras=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355628; c=relaxed/simple;
	bh=ZnqGbnt9+0eYAVJa9vE9eZXQEuKySRGaMKFLVHxiiec=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcZd2dXpZJ5qnBdgye+8NSKC/ID9tnhKK/4/n8APzXCBUC5wGF6xpt1vIDojVxwE1kQje2rr4tTrfqUt03jYzVsBBXNFFClOLAgb4SneA/ZMsMlBx+8SDL+n2lsRc4yXYa3+Jc2pfHQbiYIdDgAu09Y7+6eCNqZ14kD6Hmcgdg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=LSW3drRh; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oGd50ADR; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="LSW3drRh";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oGd50ADR"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 682CUGwU2332276;
	Wed, 2 Sep 2026 08:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=ZtlYABq5fCpzQ4P
	d/+3JE4lw7alkI2EoMvZbDaDzwmA=; b=LSW3drRhq4zrqJ9Ptxzc26vJQlUUC5T
	HkvGu1bUfPwhlEhXo1Wy0BvjOfqvtauag36Ord36jelHZJzJFmcuDGX00dKfJaae
	nwuO8PWYyNJBbdBeloxvNaRmIce48RSOqZT9K/vH4ow3B5GwP+wD5xERcPcs8Zzo
	E+XvCsD8qquqVvhIRhcCjYcGH1zV0SQ7n5V9IGGQEVXaeziazwSjtd5vhVp5ZVj7
	ALr+G7c4YTI2SY4N1vTv050B4ARPJ4iXNbHTYE9ai1QYNJ0cDU0dg8mj6T5odTC+
	qF+XBjPhpZRXgvduWq5701AIGIzi4+QEYYE7GpORvcmEKjUHs+tMjjA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012014.outbound.protection.outlook.com [40.107.200.14])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ge7gqcaxx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 08:26:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3KCBDrW6+RgekREfGpqZJWLmbYT4E8HCny2jKSe9EHx2KeI3Clf/PUWZtmWTxD6BVftmduhmTzCFbgRtI3sC5xJR4HbWSRjnhAmoruIzegq+uJIRZzU9LVDalkiWTsYJPRieOoEeVRiUO3nNURNCOucujRTAhFRukOGXCoy/fJM1hhBiINozr+cZXF4ov9Mag181PydMD4MmQF3s9TjXGhzRRKZRKBGY8frHdHZ3MXQKbLidwvka86Lggz9amqk3p4/sYpeQyU3KlDgCzG7OPndG88cjHO8dbhv6D4eyiSjEcCww5FU0N6n69e8wkeB7MLTwRoTyNpxM8TLlCNQPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtlYABq5fCpzQ4Pd/+3JE4lw7alkI2EoMvZbDaDzwmA=;
 b=UuVDwYCGIEdnUVTvM75Nt8N5ZvO4XYRO2Dz2xNW0WGa++lBl18lWUDN2O1XQP0i0qelhABCoZhjORZ9hTv0KZWtYyYpzvOBp5SLanMYV4ytBD7r4Ha7fiLKUfihc5ruQypTvdiz+EyUQGuXFyVaPceBZJjT+UmpzqpeNdrfk2eQ2e9XgDmzzTGTyXd/O0M8QEyllL8n2ZNPLZrToFV6GEzKZYMvI2vL+6LYrFrXY57wDcDYztaDwGWyahqLq2odhliJasQRerkUuqKY933TraStkOSUTRzJPUBOaDaocvm/ib58VNj2gMRJj4+TkIKnK8LIWeOs7mZz3LH4rmyvpIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtlYABq5fCpzQ4Pd/+3JE4lw7alkI2EoMvZbDaDzwmA=;
 b=oGd50ADRkK59HgD5aojw+t7SPSQ3Yge3fdFfjSu09e3LfI+fmQAka7Rp6zmzJLlb9FGvo43CyjEQQDr2QjqDOgwMTLqw6rhtzXMWNhreIGTECCtQfiMHSdhIIjTeUHD04dwH5usHvwxCVUhLJsimKkXCjhez3EcZlsrdB+xm2HQ=
Received: from MW4PR04CA0217.namprd04.prod.outlook.com (2603:10b6:303:87::12)
 by IA1PR10MB5972.namprd10.prod.outlook.com (2603:10b6:208:3ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 13:26:48 +0000
Received: from BY1PEPF000264B3.namprd02.prod.outlook.com
 (2603:10b6:303:87:cafe::24) by MW4PR04CA0217.outlook.office365.com
 (2603:10b6:303:87::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 13:26:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF000264B3.mail.protection.outlook.com (10.167.242.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 13:26:47 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 08:26:16 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 08:26:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 08:26:16 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682DQGht678811;
	Wed, 2 Sep 2026 08:26:16 -0500
Date: Wed, 2 Sep 2026 08:26:16 -0500
From: Nishanth Menon <nm@ti.com>
To: Francesco Dolcini <francesco@dolcini.it>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] MAINTAINERS: Add git tree for TI K3 ARCHITECTURE
Message-ID: <20260902132616.xrtqgrztojlvzynn@bankable>
References: <20260615132640.161584-1-francesco@dolcini.it>
 <178275222394.2162147.13459463877313723046.b4-ty@b4>
 <20260901163443.GA122104@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260901163443.GA122104@francesco-nb>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B3:EE_|IA1PR10MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 168baa2b-914b-4048-de6c-08df08f5d6dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|22082099003|13003099007|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	0yETG/YtcFBZE1gqyS07IBBAvd7vXgWSgXEFcfjOTCc/YnNWpUb+mJE9oC0tL+X/ZhC1F0Pol4ZSv9lFQDBARr1HwHIaFXgZ15GdmzjLz8H5ZMZTsAom6p5ySHlxUx2V8qVVSdPZKb1t9O8aK3e1SjeuR3vP41odbxoMHk3qpz35Bg1BF16bPSYmP8khB7mUVkgNxaIMLc/9j5A1LuEYcrJUESyR859VRd+WBvykmyh/jp+CZ2/sYjnCDktweXJZZUGG/f2TDYsyQ8YWxzO+oBY2R4KhXzMCyQ98T0rbL1NTSJ2jItksuWpQ6FmG+wkqps9/4FqDDu2tZ93t6DD02PnIuMZDerz5mW1420CjBVQTZGN7d4wI9lytSYBNQKBmtpbAh3zrhUfFDaQPyDixCpGY0zSkPwcmL9Vu17u36x6dXIkaSQc6UDE37aeIEA3+UAgJFzjnsif/3pkObod0Y1XOhXAWJYVQxYArJocnF0X4Vhj/Hv7D8tNx7ckLUG1njvjRPocnCBvWNpRNs25cdCElfCysv7LQBOyzhloCyFSqVYz4UiBYzt014fNpRn/yUPAwCjiv43QsJ8JvawWQBKHZmtStxar7sBid1MffuEJ1HlRZWkN57A7ZQzadMERgaEcw5DRvjFM6FTG671wM+rZIBtlWEzEJykD0zOpbhFjRkAodSnqm0QysJ3/GWQz6aiecX8T+ODe95AgGb0Vmsg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(13003099007)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yHzTgs+i41MelEv4QZAaCbya+f/c+0jga0E5qVr1+PyDLOJgLMz2cux6Tjh04ihKuIoukrBZeI+Fr6ExSYFNXo9h2dyYP4/z0fCM5GolooNb8mCoXw9M5oKe+4LY8hspoARjcsoVAV6CgbE0zkExcUFWnc/G37zwbbpdamJZFZIQ0/8tQr0Bu7ji8xRfpQMu0ULRIKtfT00SJrXHv3lropCHFadbn5/SPME+Bh3m3kp1gHzQjoQsPGnxEBZcEHYPZjYsMrIgnpADXqy8NYBCiAFuGwphxXFwsl2VKBR5cHzaGH/s1ICnd6H1df+5aNnlbFUy/LquF6uZ7iHJYk2lEm7n9r5uiJaH9PY4mpiLbPovXyVm0xLbwINdJnsf8LGMTR7GbPPuSRM14ofseUHBKtRjkgez/wkMFJt0AOHuM/q/kIW6WWFrepAWorPOGUD7
X-Exchange-RoutingPolicyChecked:
	GyTTLvNoXkCBPLCsKwgj9AN7UDwEy7cU1oVpL14EsJWXKVS+Kcm0ZrpDUdgT9ahEj0uNFwE3vR215vR3ZDYFux8A7LyotbVWKlw/1yfW9/oTAx0vtwxF2deb/IWRvQsaXTfQ4jdYlXYv5GJKpfCyz/H284lMT+5v/sGavLGV7ONzK3lZKzXZs6k6p6EwpCqWwu9VUKEkqQNIru0qa8LzkNWsbOS5jJUoMO1Kg3s2KDVuusU3T4bXp1iuuFkQFRM08W9+wBCCuZUHztMqF2zvDF6tO9n9+Xwn1nsBmBlOLnH/jfcs1byMkwNJBukqu4t3x9+HbNeO2rKTEwwQ6lQSzQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:26:47.3519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 168baa2b-914b-4048-de6c-08df08f5d6dd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5972
X-Authority-Analysis: v=2.4 cv=fZ6dDUQF c=1 sm=1 tr=0 ts=6a98241f cx=c_pps
 a=3EeCZaq8L1ZepF5DamB/SA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=eLhntcxe93hylMjpXPUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: vyjQjZND0WuD4dxW8SBpyiiY9h7QxgEq
X-Proofpoint-ORIG-GUID: vyjQjZND0WuD4dxW8SBpyiiY9h7QxgEq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExOSBTYWx0ZWRfX2jhYWI6r4Xk3
 viogJ+uNjkDpXwp836R6j7tIPHyamhTYRpURbThhbr/6HUqNY1gzS+Z7QzJOWz394RtGNIlh0rW
 gih+3IQ57gewDR2jRi66r2lv+/55a9M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExOSBTYWx0ZWRfXypnJKqa9Dvyc
 rWv6er2WucpAPSNIUXHfZrvmG0AMntv3at4tgnVvzWc4KVoEgZeNJCe0up7uzR9u9/HcwYwZCif
 4e5NRJduPrysm9f2nDUjzI/YZ7YdTW0Wj8WdVS2W92mqZvF0Kb8LDjO1fVc7yfnV4O925ZkoXzV
 upC3JgcACSyfMCyAadFqln+4DkCMDH5GhRJKcfieGNwcY/KaDzbujBT6A4PlWrdRvGPFiKK8MMu
 2O3FMurlj0cG+nA4baK7RM9UiyKWxbERCutEvIs7iqrVgLKRG2Ug9deyoSRteLaHsfT4zB+3qkF
 CQYiiHx7bmmp2Ct0/hqqdUQYE2E8tay07zaZxPiVkbjuZwn8RaZpCrNNomNCNdY6+2FmoGMFkOG
 HcSQg7xPsl4VazExevuYSia8E6ovDGLkKrHI7EWqZld2K0EZVrg86SKKZpjl0pZqAPUdwQ5TgOb
 2gLdBd+go6oaLIsAhvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020119

On 18:34-20260901, Francesco Dolcini wrote:
> Hello Nishanth,
> 
> On Mon, Jun 29, 2026 at 11:57:21AM -0500, Nishanth Menon wrote:
> > Hi Francesco Dolcini,
> > 
> > On Mon, 15 Jun 2026 15:26:38 +0200, Francesco Dolcini wrote:
> > > Add git tree for TI K3 architecture.
> > 
> > I have applied the following to branch ti-k3-maintainer-next on [1].
> > Thank you!
> > 
> > [1/1] MAINTAINERS: Add git tree for TI K3 ARCHITECTURE
> >       commit: 4fb6763ec70d49f592cc6e684bfc5f17a7db7133
> 
> What happened to this? I do not see in 7.3-rc1, just in next.

Missed sending it out for 7.3-rc1, my bad. will have this wrapped up.
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
