Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4816247140D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402262; cv=fail; b=nM6f8RSp7RutCNohn+PbReCroG1+cs0ZbZxnD8htbM0MhEPmlSC/6LHJLTsRPV6P0pzFX4iLi6SNaMLc0KOsCBmoklIguQLaJDE6WBJ9qh8hbdOOEhFqXuyvEWINyJDfrXNis47hhQ9kp5th08Y3v+4Vi6baLFyT6RCvOwtfPzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402262; c=relaxed/simple;
	bh=j9bXZayMV6avo/uwU1wzGrcV4uW0LGRCNFwqzvP0EzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h7g41zID76zP6rct4OPDLc7lynhTuhS7Qpjd7S2PnIBgInfj7bhrU7STeW+BNvRP3qjhf2TVF1Q5EpMgiI1PGNFjYw1/pmaW3OyrlUjmB3OrPxZipq/+hNRssDSSGOrw2NorIRo+PYkQyWx+EvXZYwCDArIJniwfl4RFEHYBsxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Qeq3DxDl; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TWS0/LvY; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Qeq3DxDl";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TWS0/LvY"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68ED0vBx1487282;
	Mon, 14 Sep 2026 11:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=aLu319U1LKj3iM3vbnWijbay5520MzjjCS/hYV/Jw
	E4=; b=Qeq3DxDlzfu8hf+t+GqoFtKUbjMhzT1rT3roW8xxM+0xcKnuLxzrfYwtO
	QR59ZKPyCZOAiZhF844KZW1iEX1E3SD+XMHFTjeAaEZC5JQHSSzPTw7Ho88B0nRZ
	xX6ACmRjqU1xu736s3YcNajEWyEJrIE2IQCGFogHKA9imxTIF+EzwI2hX8Mj7o5g
	OiLJTN2Rde6Mn8iwjuyow+ZhyU3hAXCWDDmfUjKc5BMauaWT0YxePj0pmiA2fWVN
	XANh4O/bzAxBwOI6XNC3B9V4qbEQTffdWFewhEsdvWU5+jtXbrnsCkhlw3tfA5KT
	o8418bbrKfnDEED1+odeVzHyS62Mw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012060.outbound.protection.outlook.com [40.107.209.60])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gnqrn7xs9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 11:10:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdMtlhh6Ce17AmMuTIXc1hGgEAg1aGeDTBBCbe5qwcPOEb8005xKSvhVpU2QJz9XtqxNrUqa+8B/mhaRfYD1Jtad+nJ/NQunYUA6tVKx9lxKbqTOxcOVQ+Z9yNWw+t0dSUZiIsRem59XdDDZ6yDNVULIOI+8J1OyNkis3gvK62UuRAro0yRQwG2v/6POT/zsnxEpr880Y8oeoM7QwjXYaBdBVhQciw0EK/XphPUrOigF8WNvrNQIEmhWbKYtHoLQ1lfFeEBEigbVvkMsNh98Wpd87le5BehNqho9rxtjQ0IW9AiOgyNy2JvK77KDX5Dw6+4tzaSWnbF3/2NNCkAnug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLu319U1LKj3iM3vbnWijbay5520MzjjCS/hYV/JwE4=;
 b=HNV9XH/Oq4hOXQ+yiNnuXwJs3xYEhC7evYSd8ee6y0sVONvF+JsteogXFj7ngjiPGCL87RjlUfZiMWRxKAa/6CNfyHPcdfwqo5JXuw6knRtbVfWQRfSy+ZPvRDaSBVRJP8weXLWOZcD2B8IpoymsQ1SJerbQ9uBnU1w+V62VtMbn+/TgFzS2VHNsp5F2AkV/ugFMYCEscyE0EFm+IPEVqLUs8rJpZbK3dY77dNr+7Eu1SNoO9L1PqqDy+EuKzGTaAHSso703imRipzJu+l5nri8B6WwUCIKBdYUF+LaXrAekq/ly2TDgWoxOpSCLnLaOPYNT79Dc7qMH/N7xpjmAiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLu319U1LKj3iM3vbnWijbay5520MzjjCS/hYV/JwE4=;
 b=TWS0/LvYy7D1br8QkKVXzwyUhsnPYMmGFnOLmm2B1PvbLP6wYv0l8QvDCzUSOc4rbA5ovaTIdg0/zjMqokRXezBLosMOaV+dlEoTMS2vA5Oio9fWmYNQC0O5wtRnFy7b7+5eequMQ5x6CnP9zg9Ez/PDZfC2HY7aPROSmJixKDE=
Received: from CH0P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::24)
 by DM4PR10MB6061.namprd10.prod.outlook.com (2603:10b6:8:b5::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.8; Mon, 14 Sep 2026 16:10:40 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::1b) by CH0P220CA0022.outlook.office365.com
 (2603:10b6:610:ef::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 16:10:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 16:10:40 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 14 Sep
 2026 11:10:26 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 14 Sep
 2026 11:10:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 14 Sep 2026 11:10:26 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68EGAN0t2480434;
	Mon, 14 Sep 2026 11:10:24 -0500
Message-ID: <86c79191-6d41-427f-af94-92b91c41b07f@ti.com>
Date: Mon, 14 Sep 2026 21:40:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] soc: ti: knav_qmss: Fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>, Nishanth Menon <nm@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
References: <20260911085055.715191-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260911085055.715191-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|DM4PR10MB6061:EE_
X-MS-Office365-Filtering-Correlation-Id: 22578296-0592-4571-7d97-08df127ab8c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	A1idp7TvX44bWeF4Xkxpdl0RKZX1LjBKwyhMugGgEekCmu66XSkQhi9ynlh6njRSSeed7k2y7fPH/kfkG/Jbk/cZuZPiilEt+nK0R9/X/fYkRlI0Ag8SG+cuyY/PUvXUXyO0P0KAFmM2o58pgtGaW+Q67mEgR1HDPyYBD+LhLa0h0mnqGhZNY+59N0XqErqXDjBrCD7EYDZ6IzN3tsB/3Vryf8R2cc27pVxCeCPrM2V8y60jXNeKAh7f7C+7+xx4zCOAi0BSYmTDTZHCu7BiUcrLxIB76341FN00Twz4pYvovjbtlogGOkootfzrvq9MhKzfC4UU0qfEEzMbgryi82XcNMbdo8O22yeCN5YaWDD50TBdGIUodECffsMOPxfrxTdik9XV59KAxSOzsd0BNsgClnCa9bbal7kLVYJwTSCz+Z10x5+7C/nGMEBVCF8tTG8sLv7Gpo1ZOaa2rNZVyVnfxF36BmFys8hErqLoM2CE1Nq8fGk/mqSHCxqoUhnCgwt/06vI9sB/fzLWK2FZ43lq/do6bIoY7woXortQHZzMUA8+D96qytrk1XX0Mz6D8UGECXLk8cm5PB0T4fZqw3/LtB8I9g9OyXJSlJ4PStuvIhza22bSU6zDi9gAOnMBlND12YLYlVnR5p0YlZryhb4Bam3MPRTVLBlsBpQWPH1SLOfXmFtgSENvglpVgSwMidqiH5gLs7JIZL2ijGG67w==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LTdcSwlrr2X20rL9loTSh41LEdfqMqwWlama1TlbYF28ia2EOyUo8tTLCgfjdbbB6FboXBVVpvb7m8BUOMHc+j1asvHKtDaO05DXFtFrhnYPn1NrvjLFFk5YiPUyOWgYpENRpQ0NOddDSLtNsKGwr9C3EHcMsd+e+xtHPAna8wSYmnd7Y0dLsv0gx8VbB9iWk2/3cyScQotRV5CBjU7HjwtajCg+uOoDLMHAWJ1geNB+4B4gGScwtLhS6bTLumzYIQ03D30SmpoNS/nOtT5aY3q3aOrLF75qVpg4Zn53UW5jpHN2JW259Yo/awjio7fkxCESN6pmAHVEdG6MtIF8o0HKPGCi6Bw52QIfHxk4/nO+V/owW7B3fJRCvlX1ipRRT9ry/bjjaYSQhG7NDxNriEvkYKsRqB/KbgLQXv1wW4/fsIDNPdDl5Q728w3Mduh3
X-Exchange-RoutingPolicyChecked:
	2Ovn3aVbUES1e8LER0qkRZ013JAfu22yCCbXThtatEI1dSv1cFtqZen3BMXDFfwK5nSqHo+zD5tjs0y8Dv7S9pBiD3gU1vP+LaSq5BEww2pVM9/00m8OIYrWqO7uwh2pLbt5kQaOA6Dk2AoQKEt4C3xEKhv/VSPLVzKPoVwTmRO/lj/OukUQ/cwHIVjQe4Yo01TqQzbZOjAintl3g6P3t88Jf38cdZsGYpsvo6gkdiwPfz2pBhXEiffykVxTaqHBT5Cx5BLSelk2936Yz5qA4PZ8v93tdd1wIsypKD42Fz6KjW0KCUxDKMq8+39//b7gMHf7XIOrQZ9G2wIHEWN2wA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:10:40.4288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22578296-0592-4571-7d97-08df127ab8c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6061
X-Proofpoint-GUID: XGOB0v0oXjf-lKGw3IKF2u74Lg3AJ8g_
X-Proofpoint-ORIG-GUID: XGOB0v0oXjf-lKGw3IKF2u74Lg3AJ8g_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIzMSBTYWx0ZWRfXwGiSF9DbmvdE
 G1HdwLTow9U5AxVTN1MdsxMD7PHcJin70EYRjAA/s/kXxbL+1GG2meLiktwpP8HH6hXBwuFP7cE
 dvr1i1U9hfYQOG1FM+saPfrFIcvv4sdgAC6suOx5/dZFJGoTFi+oKqNMlRdRiTtwnmvbrqu3s4Q
 pQuH+AM36mNdK+o/jNP7bHHxVTOjaW/ze+R6p3BKrggjdhrTbsRjYHj4fcDxvvdagOJzJHDi0Lb
 P34bL+4R1bZ8x/0dW7DyQM/A6MVkB12M8TDm2RmICcok1xtsPFebdqyWSe3yuy2q0nwJdeu3uoL
 qplIxZPHciRfkkLRUWmn9/gn8JqKKngKd9mwjzu0RRGtGiRSF68uIjcadgvdGgftYNXwRgLJICa
 bxUjKONaILDxNjzrx+tm6XNVqe2r53dTe47iWDY+chiK6LE147w2TWR9SsXN+CZT7DGO6Gc7UXr
 9HoSMxMH/gzzviCmFGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIzMSBTYWx0ZWRfX9Sby0Ms496/k
 k19iUa1PqpxNrZ/dkPOLnaTGbuU+n+TOvE4QVx6l+gCcrxG9x8twbL+M6J+aC8F7P4T1G74nssW
 KFCcWtM1KM2dfNGheqFM+c/MlLFMzdY=
X-Authority-Analysis: v=2.4 cv=XcgcX455 c=1 sm=1 tr=0 ts=6aa81c87 cx=c_pps
 a=Yf+1g9CPtaneS6NJHGTLjg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=sozttTNsAAAA:8 a=SIqqbWPVVWNU4Q5TPjUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140231



On 9/11/2026 2:20 PM, Hemanth Selam wrote:
> Correct "specifes" to "specifies" in the knav_queue_open() kernel-doc and
> "accomodate" to "accommodate" in knav_pool_create().  No code changes.
> 
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
> v3:
>  - name the driver as knav_qmss in the subject rather than
>    knav_qmss_queue, which is what the recent commits to this file use
>    (Udit Kumar)
>  - dropped the Assisted-by trailer naming the model
> 
> The diff is unchanged from v2.
> 
> v2: https://lore.kernel.org/all/20260910044551.50308-1-hemanth.selam@gmail.com/
> v1: https://lore.kernel.org/all/20260907062247.9994-1-hemanth.selam@gmail.com/
> 
>  drivers/soc/ti/knav_qmss_queue.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Udit Kumar <u-kumar1@ti.com>

> 
> diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
> index 3e4041454f69..6186454dff51 100644
> --- a/drivers/soc/ti/knav_qmss_queue.c
> +++ b/drivers/soc/ti/knav_qmss_queue.c
> @@ -509,7 +509,7 @@ static int knav_queue_flush(struct knav_queue *qh)
>  /**
>   * knav_queue_open()	- open a hardware queue
>   * @name:		- name to give the queue handle
> - * @id:			- desired queue number if any or specifes the type
> + * @id:			- desired queue number if any or specifies the type
>   *			  of queue
>   * @flags:		- the following flags are applicable to queues:
>   *	KNAV_QUEUE_SHARED - allow the queue to be shared. Queues are
> @@ -805,7 +805,7 @@ void *knav_pool_create(const char *name,
>  	}
>  
>  	/* Region maintains a sorted (by region offset) list of pools
> -	 * use the first free slot which is large enough to accomodate
> +	 * use the first free slot which is large enough to accommodate
>  	 * the request
>  	 */
>  	last_offset = 0;

