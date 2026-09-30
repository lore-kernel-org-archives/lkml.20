Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41295255E43
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794410; cv=fail; b=PAGtkx3t+Vq5MQZFwsyntMCkp+08v/NP/B/Tu2b7bPkCeJfWS9UYzxWQmsnz7hxSSTUlUey7absGJTjFB5jse1i5tvHUw5bxbWMLpyBES0jc8eqTpET5uDsSNEiNB1YnytSfR1FsLcE8XWnh1QjNFReO9HXuKJ1ei2CgsNvtWM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794410; c=relaxed/simple;
	bh=6/UxfdzWL0HDKDWrJ8Ybcof3SUlCI200ddxatgP0aRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k1cqgeNfsjFWbnMgNo87VReVuQIigP/PFDu51EQR0l0hQ3BsRi6UnjELYcKjzFzE9lkWg282l03TVyWjZfc77ABp1/MX4s4ILGQ8lZtz6KW1kzKLymT4qburn8/7Eti5pEgf1T6zyrCH1f9MQn6xIDMZY/mIAMJ8hzqaJ7RW3NM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Bb6+y6e3; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=nJtQAcub; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Bb6+y6e3";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="nJtQAcub"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UHevLm104561;
	Wed, 30 Sep 2026 13:53:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=vhgehDsg/eIh2gfRn7c97c/wH1pPqaQC+yF60OQgN
	Zo=; b=Bb6+y6e3aH53W3G/2av9gDHYP2FQ26B7hSOnmq0pwiGrYu5Y47rtP2S7W
	8h3U+Zgo3d6jbIfv7P+6o203nhO91FX1COPywN0EyCDxNdZ/s9LtSFmyO/8CUvvT
	a0bPEi7o4o0v72RVE5XVXX02KKIBgvMvxsRLzH5LD5mXwgLmAbuMsWC79XcjPipJ
	A8nOGPSCvEhbuFrniyXEESY+/nNlKbgirExG+2TB96GM295whd5agOiYLRgCdNUP
	tdFvXKCvWPAiF6D3uZkR03NzOpVTK7QC/ODsf15pMuBo/+QQZ9Bwgzqd0PX/4Kqb
	5AKu0CnWz9F/QMkvVcIlyXdAEzuUg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011017.outbound.protection.outlook.com [52.101.62.17])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s22vs5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 13:53:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJR8EIjKGDX/bdU8dbVCU4m7mfPUtEnCD6j8JMbXAgYvVoAqxaLtmF/GbYzxXjWcDvsno7orsPw7mvrPVRdRRpol0V/k6Q2vtaQvJWMs0RSYrkhEGN1AfpYE14xZELmOsQOvmVSjwSDiuiiQlMSPR2huxSmVdi2yiwYiIYamcI/WKDylC6a3ONmTf02lPaW0A01aqZ0kLKHM06lis4BwBPh3SvfgMGQTSF7EFH8wWhcOOlnIgvzvLi28vIT3h45DeIv3l3kN1bBF6WGmUCByok+DcR7TY1ScX7k9LYOaF2lD9gubyqN0CMfgPRzqX4oS4TpjEptAKUYf+g93QNZTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhgehDsg/eIh2gfRn7c97c/wH1pPqaQC+yF60OQgNZo=;
 b=egHWeY3ilSW/jcKI40E7DxQlrHcCG6FF7NQnm1ZzDbrmegz78FpaXnH9iqSyR1HKkcy+safyX0u5qJD9/bvuad+6UFMqHFbyn6czdNqKzeRS5GnN2kr8TdbxAAbjiT+irdkf7wyasObLTFxpcWKRkk4vqM1XOx+Is1IJhuIdLuId1qWS1zGZW9u4WHVAh7dWF8J/7DPvVJG+89WKLZnyIrHJ8BI278veBvF/0Bl1vHRJHFWuJQvEM+EpFeJvgN/Txr0tZPvGDGa8L7YDKXRCyrwl+Eo/bhwQYArdnwZvIb+IFCPeikm6kJDdX5g1HqAxa9g/auh0oSE0Wyh1RxSGMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhgehDsg/eIh2gfRn7c97c/wH1pPqaQC+yF60OQgNZo=;
 b=nJtQAcubRFjRVx4mUKYYQY1NoGAdPkIQbf4M4xcd4kO9OOcGZZLU7JQ3TkIfUD2Co4iMu1Axs/UMJwiiPS8hhbGjIId0UITP8Zaq6cDrBkeQd0P4j5MGiu/yv/kTFHT3BwRBtWqknMEGkGjs60Q04LyvwUXJNZSH3iFznAtCHr4=
Received: from MW4P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::16)
 by DS4PPF742908B79.namprd10.prod.outlook.com (2603:10b6:f:fc00::d2b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 18:53:15 +0000
Received: from SJ1PEPF000037AD.namprd03.prod.outlook.com
 (2603:10b6:303:115:cafe::74) by MW4P220CA0011.outlook.office365.com
 (2603:10b6:303:115::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 18:53:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000037AD.mail.protection.outlook.com (10.167.244.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 18:53:13 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 13:52:18 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 13:52:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 13:52:18 -0500
Received: from [10.249.33.42] ([10.249.33.42])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UIqHqc3670338;
	Wed, 30 Sep 2026 13:52:17 -0500
Message-ID: <9785e0e2-2bc2-412f-8ba7-d7cc0b5a694e@ti.com>
Date: Wed, 30 Sep 2026 13:52:17 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/22] firmware: ti_sci: Use rx_message as message
 receive buffer
To: Beleswar Padhi <b-padhi@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <ssantosh@kernel.org>, <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260930160607.2674980-1-b-padhi@ti.com>
 <20260930160607.2674980-12-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260930160607.2674980-12-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AD:EE_|DS4PPF742908B79:EE_
X-MS-Office365-Filtering-Correlation-Id: dc9f9ac6-de0a-47f5-143e-08df1f2414e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|4143699003|10067099003|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	xGEY7TCbNWiIy492s23YmeqSkb5Zi+cBpIwA8ePfrRtGYmUoiv15XJvM1vtdcJ7OeB2KY1sjYb6msJcWg8J31OAFjJ0bdlm1X2mt9hkEKnr9V85+r4KPGvN4B2Ruiun8H7OL/duE1B1F0LnOyV/tG+8tOgRiI1zCBgLul2OtKRkNfY6lRi7Fksn9oVg355UfDzc7RVz+oRs2YIXvSlicW29Eyb8tWbjdDlRgl643l3Qi1MoM5VhDgkO51sNcdyEmkPwDCi/7a+tDVEjLCeA9UlB+ePCY436c3CO/dtfo+euMtZlsEWFrRAhDsTrtrajCpE6fSjPgHM6p+uQImlNiAnuHU1gVtC3wVSE9iJiZg9HMfwyGvxoja0w7ytA91JYi72PIea2OierDzJOLhpjVzbAeJQPDNbPAumMfsQZDT3LjDc598m4TqjKFuQ/baKj+pnFsEiuhv7/DxNQ6MvBz9c0LBSWm0znw8NPrKeCh6tQ9+JbBMNuqDCa42wOKWADMj/5E16hvbGFJTwQxPIMLgb9XOsCin2DUxfzW0UHCmmigl2I1FdifDpRtOzr285Jk66f2hKxgV6hJXb0ZWh9iGKIzYen466vvyAowgwigxCTmBCun4VWsZDeogbewWFj0QCIfp9v/VJ3LAxtj+06gncbGtDGd5LLrRH05dbYMMj/7bcEHQ8bIeOsU+T57UewYsVFoJJ9WjFieskJy3Eck5w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ejqMAZfX6S5oXA2RHD8Qc108M1gMFVKPMcg/B+ukJUZGWcS66k3LQD+h53KyuM3WieP2hKz/vrumsy7C7t93OFQdpm/xMWuXaabq6gdHiXDhNQ2NMghjwmTtEty6ZdfJTApS7RqQBpBjbYw+Q55cpXN9uJPjYlB+3x3wuEyhgt4IfOV/ZtQC91YwR0YXv0UDeQucApH2YLQMgqm8CBAlxIBGsYRdxI8NlXnqB+3im3hKok4Sa7UgWVI/+X5cjYRJt4KrwZjdv+XNVz1aC0zZF6VxzjkU/q9Nbqtx2yDr7gHdnyuXs6042y3cf3KJhxM6MLKIXAQqX5Zn8l87fiACHUxPmsNUmqJXp7FQbaCE54T7gWsIrdWj/WxWU4hciVluNety7XLQOLZagttnBEqlApDCvN8DtZYE4zZJqPXqEtSbgIm3yIa40aJ7xd2fLhjq
X-Exchange-RoutingPolicyChecked:
	i77mxrNfNDJrdReAvQco5925bhbEjykqY5jcwNqKtx17cCuAB4tLldOHhQuA6Gr572jX0rU1yXGq1qgsLZ6Uf9Cri0DXaldHMfuqpgRVqp4yOWrKo0rX57lln3c3v8Xn/3kGaesdolxf9Krko6GqcHMeCsRQaEZu389MFbvf4GebQ+ReXCe0SzllGXdfXeo+2+0JGFEdwba8AKeLt+1y5Ru5mahYoNIf8SU+DCfLVWestX0C/Yjylsou/sqvjTx8BvQpnoJEm2GGdmvF/RTOOHGEjO4pnKb25xQ3/T362s/lTwh8iTCQSaeiLZnanXLGx+NLEgQRk2eqWwOn1iZ0gA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 18:53:13.8287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9f9ac6-de0a-47f5-143e-08df1f2414e3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF742908B79
X-Proofpoint-GUID: Sb0Bx9H-MdEQjzIgWewTQ0tzQFjEEtyb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3NyBTYWx0ZWRfX2PI6rSqtDHeD
 wA1Sxd/PxpfGMKJtf4/IGUWDRuqwxlZ43RrjcrnZZ4XHGH61WmbzO4zeep0CKlgmlAXYEnIX4JW
 b3Uzzq6ZD7qlWaEPfZgEZfgPVSGaeMkM1IG2UIGOvrCu5zbrjulRjD5acNeTwteQ/IFKXF300gF
 0RrG+yQmnMREFdYUPK23O3o9MZsT6IDixmNOaayBL3zZUSLRLueZ1vwDcwvWjm4lHpGJL1F/Lx3
 ZnwvfhupjCAhLMaW/L4CHuJ7IDE+RPramHjnuDVKBjwk7I1bwlzh02O18UQF2osDKKGBu1Qm7A5
 RK1Bqsi8551/CZd0q4hjO746HABw++QNLHAVnUAh7TG8wDY2OXdRAfSBsEOcJdtrif4FdOFh3+f
 bFaJ2s0WRyMdVYsNzUCh47F4skG79JbPgjMaO8346fGeNDj71dmcAB2Vc8T3lgM9Rd6/Oug5ScL
 GDcI+2C6GqddBpt1W7A==
X-Proofpoint-ORIG-GUID: Sb0Bx9H-MdEQjzIgWewTQ0tzQFjEEtyb
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abd5aa3 cx=c_pps
 a=ixsBY7txtd2I+GiPRIsFOw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=7Brp7S_suSwx7ezNnAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3NyBTYWx0ZWRfXy1xA68q4zdU7
 fWK21n72R+X+d0RFiCpGCnLSDxpLQ0Qa8fzjYTcZq2UA4129odCCoNx1CGceonXKB4hnXIzBgSw
 3LU1sLLRG+MZaI4EYJBK1fZO4CD15uk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300077

On 9/30/26 11:05 AM, Beleswar Padhi wrote:
> From: Andrew Davis <afd@ti.com>
> 
> Previously we allocated a message buffer big enough for the largest
> message we could receive for every message we could have concurrently
> in flight. Now have the rx_message buffer during the whole xfer process

s/Now have/Now that we have

> we can use that as our message receive buffer. This removes an extra copy
> and the amount of memory we need to pre-allocate.
> 
> Note: rx_buf now points to the caller's on-stack response buffer. If
> the system firmware replies after ti_sci_do_xfer() has timed out, the
> rx callback can race with the caller returning and write into a stale
> stack frame. A reply that arrives after the timeout means the system

To add, the RX callback checks that the message is still expected
and returns safely if not. After a timeout the ti_sci_do_xfer()
function marks the message as no longer expected, before the stack
frame goes out of scope. The only way this can be an issue is if
the RX callback happens exactly after the timeout and is able
to get past the check before we set it, and then also not finish
the memcpy until after we return from setting that expected check.

We could probably still solve that with some additional locking, but
in practice this exact sequence is never going to happen. And the only
time a message timeouts is when the TI-SCI firmware has crashed, so
your system is already borked.

Andrew

> firmware is not responding within its specified bounds, after which the
> system cannot be expected to operate correctly anyway, so this is not
> handled.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v2: Changelog:
> 1. None to this patch.
> 
> Link to v1:
> https://lore.kernel.org/all/20260929201746.4078803-12-b-padhi@ti.com/
> 
>   drivers/firmware/ti_sci.c | 21 +++++----------------
>   1 file changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index 6ed67160c6a7f..fef7028d40e39 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -45,14 +45,12 @@ static DEFINE_MUTEX(ti_sci_list_mutex);
>    * @tx_message:	Transmit message
>    * @rx_buf:	Pointer to store received message
>    * @rx_len:	Receive message length
> - * @xfer_buf:	Preallocated buffer to store receive message
>    * @done:	completion event
>    */
>   struct ti_sci_xfer {
>   	struct ti_msgmgr_message tx_message;
>   	void *rx_buf;
>   	u8 rx_len;
> -	u8 *xfer_buf;
>   	struct completion done;
>   };
>   
> @@ -287,7 +285,7 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
>   
>   	ti_sci_dump_header_dbg(dev, hdr);
>   	/* Take a copy to the rx buffer.. */
> -	memcpy(xfer->xfer_buf, mbox_msg->buf, xfer->rx_len);
> +	memcpy(xfer->rx_buf, mbox_msg->buf, xfer->rx_len);
>   	complete(&xfer->done);
>   }
>   
> @@ -522,12 +520,10 @@ static inline int ti_sci_do_xfer(const struct ti_sci_handle *handle,
>   	 * state, then ensure that the response is an ACK
>   	 */
>   	if (response_expected && ret == 0) {
> -		if (!ti_sci_is_response_ack(xfer->xfer_buf)) {
> +		if (!ti_sci_is_response_ack(xfer->rx_buf)) {
>   			dev_warn(dev, "Message response not acknowledged (caller: %pS)\n",
>   				 caller);
>   			ret = -ENODEV;
> -		} else {
> -			memcpy(xfer->rx_buf, xfer->xfer_buf, xfer->rx_len);
>   		}
>   	}
>   
> @@ -3326,7 +3322,6 @@ static int ti_sci_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	const struct ti_sci_desc *desc;
> -	struct ti_sci_xfer *xfer;
>   	struct ti_sci_info *info = NULL;
>   	struct ti_sci_xfers_info *minfo;
>   	struct mbox_client *cl;
> @@ -3380,15 +3375,9 @@ static int ti_sci_probe(struct platform_device *pdev)
>   	if (!minfo->xfer_alloc_table)
>   		return -ENOMEM;
>   
> -	/* Pre-initialize the buffer pointer to pre-allocated buffers */
> -	for (i = 0, xfer = minfo->xfer_block; i < desc->max_msgs; i++, xfer++) {
> -		xfer->xfer_buf = devm_kzalloc(dev, desc->max_msg_size,
> -					      GFP_KERNEL);
> -		if (!xfer->xfer_buf)
> -			return -ENOMEM;
> -
> -		init_completion(&xfer->done);
> -	}
> +	/* Initialize the xfer completions */
> +	for (i = 0; i < desc->max_msgs; i++)
> +		init_completion(&minfo->xfer_block[i].done);
>   
>   	ret = ti_sci_debugfs_create(pdev, info);
>   	if (ret)

