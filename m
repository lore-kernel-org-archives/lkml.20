Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC849443319;
	Mon,  7 Sep 2026 08:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769599; cv=fail; b=fADEeBGeE1Izd3CQ3x/jSWl4l+ArGQgymvm4VCOmu41mtfxVUku3iYqkHRewB9Tol3R9Rg5uN61DhHctVI8NGFBKUoctY+PN0XJhrel+HsVw/9iewpRq0w7ChkmSrCiM5JUGqMKpQyl7Y4JjdOzhyS4zPIT2afrmLlOiPoqjAA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769599; c=relaxed/simple;
	bh=9wvkOTfzJ1hTAiFVOuxFVk50N8wGzIPsN4M/6h3x26c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bRJSMJH0m2Fue3faXViIKL771zaUhzngm9/lp7mVnApNPKCtuLAy8Ce3HqCEFDVxEJaWd7Y4b52YDyBY/d1keu2kdQB4fScbWlLfw+8GAGIKDOm+6ShZWp9Fs1l4uuvWDVQsA8my2U10NvUQzByhvVDw/bJ6TvGVlop6elu0ZPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=HuZqvBo1; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oF8jze9s; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="HuZqvBo1";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oF8jze9s"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687766HL2415363;
	Mon, 7 Sep 2026 03:26:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=x+xArR4D4WtDjx9G9kvn2tiWJRDr4WmnsQDVe+ATm
	IY=; b=HuZqvBo1Etu25DDoSmu4WhWLe+vRQPBB/zkGacbddpucOhGWnPbyjV6mN
	UQ5XN9S9rNdWQIgC7fEXEu9g1iroBR51AiGo1GPm+l0kPbqen2JFdj9/srNmSUR+
	NljrSVePgiXE3b/KL/tyWuleTkYkZKSjX9P3Xi2n1P24HAymJeMq3sWShVSBCzCe
	byXdEipggwO78qNFsgWhJoMYhe76O1+Psj223r7gZEGEUynoNAGomdBwR4ajyC99
	2CwGstVnjc6hh3bMq8Iv/IUEfhb8TFUQXOZZzC59Gwu5IdlTvpxDeyHHoFfOocv2
	radztwpxLqJTa+6Cc7V3v/nE37Fqw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012035.outbound.protection.outlook.com [52.101.48.35])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gh27q4tst-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 03:26:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQQlpa2+758mLWJ7Y7Kqyk6ya71DDqSQospZoLcMVpLk+FQbGCSkIXT9Lx62XduWpEXXjzwaDv8F2zr2za5Is+eMpLh2kWfYCmxiNMFQtd3c1fSt6u7ah5OS2bTrs9f5SGmCFyA2Z2x6R3spfcFqLztssVgOMDPtFyAwx8VQHFkend2JKuiOJB/huHtFDY/9mzqN4SkBkCzspO7BDFxMH+NCBusJC2aDdQWDo4SQzQtHw5oo62VDM4ddCDpfvWHyYQeu8x/pfDoCsmTDV4INrQg1Nn/7NMabfSQRusvp/RRix95GROg6gG21XhHlDyNsiUfwJK0Vv2moscKyO2B27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+xArR4D4WtDjx9G9kvn2tiWJRDr4WmnsQDVe+ATmIY=;
 b=Qf+yGLPYXuZkW9qt2PjKPVdUXjQtc8TEzrUFlki1XwMbVGHrNfa9Ib6meyaEl+7MrYg9fGimZjc94H+z1s1jlSgBLs0m7slg7EfkS/rsmj3pnANA12nyGmoX6fyM8TPC+vbLEXsT5y27B2wII6yyJ0iBZWVizk2vgCAuCGVWvn5YLkFSgxkOMyPCNZ4wUW8Y4H9owUJYQx9RKRzpJ1xLYkNfjf3a4ZYiCY74r6KqZpRDdKDQcX0WvQFj9q6GW437X8GPysVU1ml6mIAKdiYhXOqQZDOF6C/g5OzAFaybCfgL5ymL4TZ+NHHNgJyhNDXwgbtZTlJnbfKGX/RFeLeZ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+xArR4D4WtDjx9G9kvn2tiWJRDr4WmnsQDVe+ATmIY=;
 b=oF8jze9s5x4P6jh4r30KW2uxgE0nSdHETeCdozuCZ0Uk+P4Y6B933YsEYzE/hYI4h6rq8lkuZ24yU+Sh33l3qWbkfRVvk/LgKlQUyn2AMJuM3hkXbSg6uTvXU8SYCOXsHD6PSiUHwPKnPQKWoyPxg/wAlc9PqQmb6wevg7W4rr4=
Received: from BY3PR03CA0020.namprd03.prod.outlook.com (2603:10b6:a03:39a::25)
 by DM3PR10MB7970.namprd10.prod.outlook.com (2603:10b6:0:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Mon, 7 Sep 2026
 08:26:19 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:39a:cafe::9a) by BY3PR03CA0020.outlook.office365.com
 (2603:10b6:a03:39a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 08:26:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 08:26:18 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:25:30 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:25:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 7 Sep 2026 03:25:29 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6878PPNg1150752;
	Mon, 7 Sep 2026 03:25:26 -0500
Message-ID: <13a120d9-39cd-4798-af92-d97c8eee80fa@ti.com>
Date: Mon, 7 Sep 2026 13:55:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] dt-bindings: ti: Update audio-refclk binding and
 j721e system controller
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>, <sen@ti.com>
References: <20260717083201.1887640-1-m-shah@ti.com>
 <20260717083201.1887640-2-m-shah@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20260717083201.1887640-2-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DM3PR10MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: 502a4163-46ae-4d9e-a0b1-08df0cb9b0f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|1800799024|82310400026|376014|10067099003|6133799003|3023799007|22082099003|18002099003|56012099006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	JkvR23nJuwQ9itcdxipKNoaGRohBFS6DNhZRdMKhYZ+Z1X4S2+brAdlvI9lKVrIbzqdf8ERZWs8vCwYvzCDm1YdPrnaDQPBWZHhR31ZZx1N9tdzOqjKizGZZgD1uVjkOYA9CD5faTnC9rlNasQJbZyne7rAJwWEE4o/R0suaQrLgCu8sfRte0G5itD83q2KP0ByKpl4oLQhDPFrBmVSh4WZbmSC7B1EuPi5HxllyhhBGvUH4U0QmYIL1HY872r0hcW/bcovQoepqnXw1lHDYJIsZM45PKF+y+LFa8faBV2wUYHCkWp+fePB4p4kcxLkYz2o2oOMXY21gUcc1u/k1vEbBxjMvv5h0uaBu6pzOuhkEDSEW+6ZcQ6DEvwurKUGoaiPkglr2oUf4lTuZZLOnPqpHcDNhNF25tFFneTYpBztURtYo6A/D4BikIUlZ79kn2zSAijk1euOfdIsA8WdI48ql+qqTX0JJk5dIE6orjTaR0HVqFpUp17bBBhZomP0e4QENhKyvaaRd5mpNoSASWrrWKv/888zG7htADix4zLna9iFcyqB8o5n9wPCYklQvNMPiodx7RBXBnVxsFSpM2BGL9xY4G4Mw5d035XO4Xidza+2P0l2FDm0ge8Dr5iKd/jrgFOoi4zGseyzEiBynZB2jsyZ/y8VoMk1xjPHRg/uLwqANIzSTrvfZb8ec9pvs66/Opwf89n4ttWeVTq9Zjg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(1800799024)(82310400026)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8jpwtGEcbaebMFPM96Jzatjv2kGn1uRiUTkManopkHuAQXU/o8Z/kt5Ce0DDqej6aiJv32WPqD1YuxzmNf4KRGGW2a5c9s3uha5mqYoUK2tYCyf67Rrmey59Z67eLAIrjvWBHtebAT/xnJzW3ersQh/WcYr+TipOHvH2CJ71zJY76M7v8fzh70vGK2ZcwZRVyVytZjmdXXWaJ2ttt8OgQD8idvbL183teQSlooD4HglncgjWQPJIKF6kO3pniof0OOZxOchdMocBan0PPqwjIHk4yNnPM0OgoRTdF7G6oZIPi8MdrxoTL2lLOWiPfVmGtUz1wUP/NGN0hy+4gOepltDqcc7Lh2rVOXW3B3bM49nrMblLh29Qs+rdjUCJdgsyQ7/sdZyQWS4zZlE+Jgj25qTLKfMqIhkCwRnxRFA8gK1/y7TaQn2OiGoaBR9m+mbZ
X-Exchange-RoutingPolicyChecked:
	RmngjPaAFdahoWGXvHTHxAt86jQIqsgfOwRK5dikPCKQPMzjoXqdXZ9ENrY2pB2lPT5H7bbOppyVlg78VCrVQJ5g3eO9t6B9Ruw5b7Qg7d5k8/qS6Fw5rSw3pLW1TuTjC4vZylXbK9fCH4KbslfE8DAx6qQP/rvR5x9twHSekKRxBdO6Y0j/3wYF36UwVhzwSPurMT0zyncQAEkAGDr9tsebb6Z4X0mM7LXX5fp9kqTHjVhJSOzu/WRkkK+N7SQ3YU70g8rAAPbJms97wZk99vRkeitaIUE4iid5mvajgTLzO4c/K3LdlkiVUMrDdDUCaSnaBRd7RKggR6Kx6aIktw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:26:18.5946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 502a4163-46ae-4d9e-a0b1-08df0cb9b0f4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7970
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MSBTYWx0ZWRfX34/eD7cpbc3r
 Pu/ycnzCg0c4BLuIWxsLuJy+YGNl7TGMBN3mDm9zdXPIsUY5H8W4i1T55+9plK3hYP5Y2aT1hC4
 McRZ+HEFjgdtCL6Swls52VpCVr/4wvT1MyUWhnL964uS+zb47893o5Q3jtawRv+rObZ8UDsLZ/x
 2Y2yY5/Ylnr0aEbbjWOxMaE2c/tPZtWrFNPGbpycD7S5VpF4jHnM1NNRwZw9YgzZ+y1QlODPUbx
 JTMbSJH8CKgoRZ7sz1svEH+j47CFNOBXd8hNb+Os7iaGz5O6eOqthyoDSNnqzrORY4KtBzUkg/o
 D7iCtB35IV6u7j5v04quny1MjUZDpsQQXID6/bMt4rDXaL53W+dWjajD0/pyicHv9NHf3fUZnvp
 qfptUl9VWikdLyLp1anxSnQx2yhu3N8V6eynPpJGO5onx3+aug3z54dXlTczwqYNZWB728UrXIw
 6a4023/IL9DJMhRF4yw==
X-Proofpoint-GUID: U83H9UWKsnsvCNCsXDzWXDStxChBUcTp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MSBTYWx0ZWRfX7l/X4gFDsrgZ
 I43znKgky7c9rWvwYV9Nw3KzYSYe0l+3SXiICYsRqxhoTxddBHevFGqPMbNrjOBdgSYqFvxyPc+
 6tIh7nee0DuX2VTEHahmea4mPCtYzcU=
X-Authority-Analysis: v=2.4 cv=e/82j6p/ c=1 sm=1 tr=0 ts=6a9e752e cx=c_pps
 a=SJ7/6Usf5opWGcqe47ja0w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=PA5_Jz7iE4UzxxbiXVoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: U83H9UWKsnsvCNCsXDzWXDStxChBUcTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070091

On 17/07/26 14:02, Moteen Shah wrote:

> Add ti,j721s2-audio-refclk as a supported compatible string in the
> ti,am62-audio-refclk binding. J721S2 uses the same audio reference
> clock IP block first introduced on AM62. Per writing-bindings
> guidelines, the J721S2-specific compatible is added as the primary
> string with ti,am62-audio-refclk as the fallback.
>
> Also extend the ti,j721e-system-controller clock-controller@ child
> pattern to accept audio-refclk schemas alongside ehrpwm-tbclk via a
> oneOf constraint, fixing the alphanumerical ordering of $refs.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Moteen Shah <m-shah@ti.com>

Hi Stephen, Michael, Brian,

Just checking in to see if you or the DT reviewers have any feedback
on this clock bindings patch of this series, or if it is ok to be picked 
up?

Regards,
Moteen

> ---
>   .../devicetree/bindings/clock/ti,am62-audio-refclk.yaml   | 8 ++++++--
>   .../bindings/soc/ti/ti,j721e-system-controller.yaml       | 6 ++++--
>   2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
> index b2e40bd39a3af..6c8fb0793070d 100644
> --- a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
> +++ b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
> @@ -11,8 +11,12 @@ maintainers:
>   
>   properties:
>     compatible:
> -    items:
> -      - const: ti,am62-audio-refclk
> +    oneOf:
> +      - items:
> +          - const: ti,am62-audio-refclk
> +      - items:
> +          - const: ti,j721s2-audio-refclk
> +          - const: ti,am62-audio-refclk
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> index f3bd0be3b279f..364be49f8c7c7 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> @@ -53,9 +53,11 @@ patternProperties:
>   
>     "^clock-controller@[0-9a-f]+$":
>       type: object
> -    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
> +    oneOf:
> +      - $ref: /schemas/clock/ti,am62-audio-refclk.yaml#
> +      - $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
>       description:
> -      Clock provider for TI EHRPWM nodes.
> +      Clock provider for TI EHRPWM or Audio Reference Clock nodes.
>   
>     "phy@[0-9a-f]+$":
>       type: object
