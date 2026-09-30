Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F92651121D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784494; cv=fail; b=SOZPCAXihlC+WCI60VLwOslbOzRpUija8egai4Axy4ZbbN8mPnKxeMOe56m4yUVztno+0mVvN0HKq3KxnKsgp63eXmuHX/GbyYvD5sUm3GTRVI9BgOUzgmjydgwOCbGF/RDowgrVpdZoYL2l5g/DmSxd/GCZEqQBRZRV+vGnuUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784494; c=relaxed/simple;
	bh=TVUNj9bXuS6kbGiCeEX7eAQ1PB+WVqdlgDzSvvPwJZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RMih3Xq9ncGd4LMj+vqbpClMocifG0Im3VWutz6gvGq8DXk+Nvc48DBZnp/FyvHmXsICHuKoJl2EoY499cnQ7lOlgcuUHCMYdPBUtnrHQIBgJb77Pj7mPFu5SfeGospyCd8I1oQ0x9s55pe3WGco4Gdol7CjsJDkOYDGw6jTZ0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=o23BW9sZ; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=pS5Ya9DV; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="o23BW9sZ";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="pS5Ya9DV"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1HJR3333344;
	Wed, 30 Sep 2026 11:08:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=XLGGOoP7JqtCfK89bBq2EHdANMphSOan7bL/LHC3l
	N4=; b=o23BW9sZ9KtOfiIuoQMx28dslVhUv/rq38XaAZu+2Rwy5xYJpQ218KEmA
	JOpLxeG9ZZE/EbncZ335LK9RlJGYRp11UXYovWJvwlbzSiatDfm/DuXa6lewE2dX
	cjhpln9Em3WWmkG2Zt1kktJ6RtvxWaS2PzZKuoLMrcXJsiDsBQxy4Qkzokuv089R
	XL5T2oA7+kcJZQ6wXD5K3Si9KduP+OUuo2skL2nt87g4vJSqCkfV+PsHqUtQoGJX
	eKsvD6WoyL0O2NJgIcNf/G1UdNloYmD+pDnMDYSjokEKBxEAl+ufejKnksuo2rPz
	3Gbk9bXIbE9arOh8yUcYngrh5QG8Q==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011030.outbound.protection.outlook.com [40.107.208.30])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1svwv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:08:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9ZKD52IU+8id4mdxuANFT47RXlAV9KSBv+9yau4IHLCIfkYcZaQDUl5VvdvAZa9kuto4GfUno1r1tkI+E5M2IoEj3Grg7S47ZXQN4F1+hdVSBgmw0VqwsZGZlrYUoPec3x88kuiE6kv149EvUal+uMtYEjxUhRMuD9TQOmbTbOkd8vr3iK02vFv6L2/7TWoJabZN+ueyFD5nKqoOUs3Wy/pkDJLb/VgCxIirA8ZxAt0q+L99zlqP3wiX7LM/X1yiYFTEbG2QzHDZmtHzgTkLS2u5sb+gYEU2AQriGHRQKbArzrNzyUVqfaWk1LRu7X9JPUFlGUPAsspWL+KyyKjLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLGGOoP7JqtCfK89bBq2EHdANMphSOan7bL/LHC3lN4=;
 b=GqZL8Q/HzXx+b0+h3C7tXaN1q1mDlDklm9wzhPvO2F/9cpfNkfjKvDMIePDWYtiZr/Rq8jWaIPv1qsAxD8uzWSxvj2C9dyCOPl6d4yuen5EHxzblSeWakmfh7f4vg9EMPzfArD1UpKBNAgRDteYX8FFvkKL1gcPOgo8fdbPik9IMdbBlbWNS5KJRsLj0e6tAhJQxlLWytUtPhAuAiiY7CZUTHtHsTsoErlsmQOWnjYP7ElHUVsk65uSH/atfWZWDf5mpnq5JrlvwnMdPvC95/s0KO5gFHTpqP2yf/nH/1Xdh1ckJquPhMZsFZidMqXG7F0HKzG00OPn6VWVYuK/TMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLGGOoP7JqtCfK89bBq2EHdANMphSOan7bL/LHC3lN4=;
 b=pS5Ya9DVALOZ/EY44mAPSBLwoyTUnknpp7DESdOAKsVly45kz5rQ08pmLosWImDrt/IOfEaEeGwf01PCy234dVZVgWsaAIB6vgEsGSRnSt3+XrX5rp2oxvO57NQ4r/KTqY897UCES7zElwAWSiXHrhCg5Us1Zh/HrSNBoeJpmZw=
Received: from MN2PR14CA0015.namprd14.prod.outlook.com (2603:10b6:208:23e::20)
 by CH4PR10MB8195.namprd10.prod.outlook.com (2603:10b6:610:243::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 16:07:56 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:23e:cafe::2) by MN2PR14CA0015.outlook.office365.com
 (2603:10b6:208:23e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 16:07:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Wed, 30 Sep 2026 16:07:55 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:54 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:06:54 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68WH3425232;
	Wed, 30 Sep 2026 11:06:52 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 14/22] firmware: ti_sci: Do not export reboot control
Date: Wed, 30 Sep 2026 21:35:59 +0530
Message-ID: <20260930160607.2674980-15-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930160607.2674980-1-b-padhi@ti.com>
References: <20260930160607.2674980-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|CH4PR10MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: eedc7dc9-f37a-4604-eac5-08df1f0cfcdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|13003099007|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bUT3MtP5pDN4lQcjxHbcm+jWlQ2beeO/liIfKcwVI+badY5EZNqDOz+3YB0S1ZcK1LKOo2+A5F2i7fSv/jrNpBYu1m+4fPEezzUKGHB7/VO4vn4TPFKdEImHSmTmGLGJ0KZrfDH59Qwtec65ojMyxlC0JcrBetbyjux7qig6mZBdN0RxarMX+eoXpY81Aa6LNH6FyzlcCYkjhsOTUGnnAF/F0QB2Cuo57yl40iaDklrdYYpaJLpCYKxWNtZxAANUfqOFc+wMZhUi6GF/LBmAYpIo7RtJAUCoAlpOVkNxJVHhuFdiuIu/kXrka/96vMIoJIeiP5iimEs9YGIOZvJ5S/CJimg8IXf1PeYDeqjtE7TWIA2gQ76dwpoImFnY+WiEYZkhnxmwfQ29UtbF90iJarg+Nqkj/gJTl3mZXUG07raVx/wBTe9FuNGI82m3h3N4IN7pudUwPrDin5jUIuSl8p4f3SPhj8RhiJbA3cISVV1jq31MniG0riRMpwBLwaPlEcFQxMh7Ju9DmxaFgLXMJSuQ0g/KmUuuC8VQx4QljnzviRHD6StdDBvetMsqBzl3UPgBnbJCnoCvmSSFygAWZJrKcvTEkDe54WnSG+lVs3e3Yb6x3GRJyfDuDjKVfr5XQ+qCAsA4GYGWe/4eEJQ5BzohfigB+aQUqUGlKL+8450lqGO/m1R/mO0Bbf9pE4JpfGDA47Kze6kAJLJxaHGG7w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(13003099007)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y2SrKbjnr5GWK8i/vs0oeHI9wMLHLB5rzPXf7L5MhKyHEqcCidVUualrSqX0Byu7wLCpvj4ex+etnffKmEddPR19N2dAf883OE4Qdu8rcRbTfpYWSUSIPt7Nar7nC1azd/UnOMu5Ob/Wgezdd3FBgHI3uaAjAAIcaxdXmLM29DQQlVBddwYCc5kCE/4nqmJ0RaRr0dGcc36jS2yzLmKbSObQOix7O+PFyImWfuLeOPeZJ0cMcj51H5mtnsqiOH/ga8y6yajRqAe6mLfBOiAmF4JBoQm5PCJ4V6AZ7wPD7ke0z09ynuqupqsdLckFs5BbHM9IIoVfeabyrru0RVypv9qItOD7SGQgUEViM6SMjZTxGiSJVmMFWSa30sV9dmjlRrm9kjOW7sURcONoUFRfY5vL2kgeOFLQume3JC82NspsHRqR77ksczOWRaYn4UK0
X-Exchange-RoutingPolicyChecked:
	ZUY2vkDwuxMhaNKlIYABGbusEnpVwah+8hSLrUhOxJMsQ+PcdAQoBM/JqoMAkiovivWblEsFgwiVzl8eWKw8SCbZ6rAiaYe1E1+eFJovV2H14YjR8wknTa6s3hwmRr51Qtb1lwXa0KBZIfSv2ePaC6iNY/yoCnI+YW6BPXd07hRcaObRYaP3z/QjpAhqO0PbiAeo0u5hEC5dUFLvs1eNlFrUpCVbSSdmefyoptQ8/ZFdAIgkMs5y9hH5Jrthyoc0VdJK1LIV8vIlbozkUK4nHgBdUPxtJQrwLJG2GkfdUBHyWZUiB3SWfnzAbO0QX63wwYtEDU1dJ/BgCzFecWZdAw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:07:55.1260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eedc7dc9-f37a-4604-eac5-08df1f0cfcdd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8195
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXwMuaP9qIlidS
 APZXehu79zs/bAhwg9mqKeyPImZqTy7NzNGraGC0dsUKAEjJ1+NT9GJi2qBOeq+8unxw3Jf6d3e
 L0WRUnjOB5nMfMTKs/fR9QlkM0OVMMg=
X-Proofpoint-ORIG-GUID: xO00TWaFUffOtGP7vRVwYF3SKCwsnpUC
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd33e1 cx=c_pps
 a=ysgzExocFkmHQmNOaQPFvQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=4y9GCjRDMv2ZYqE5liQA:9
X-Proofpoint-GUID: xO00TWaFUffOtGP7vRVwYF3SKCwsnpUC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX4LvdHGyF6CXg
 7qH3ygfpHvyCE1RbLYIR+xVIJ3W54KKZ8/lp1j6vGqCfpphL9FRyU32eqCSpcEc+7mBGH7Usz9h
 5C7oJZZWYP3WQdGIvs04E6F2f0mr3lkcQ7spvHZMtDqjT6Z8ss/nfJDwDgmwdnlQyQTXCpjGN2a
 dJkerG5U6oeutwZN49XWpYZf7ikmQkmTyt6x5wm08Av14I3rMQMlwj83ivk8F6CpcPWfdp32yrv
 IwuOa6g0H6HNntLaCq9aRYrFuX3+ZcTBBsT/qI+/BrpxozCKeBKSFTAZULLprBGfGeTZqvhrvTd
 VZ5n/Al9Dmr/zi1nmeSc0Y3eP6Lola0Xo6gNdPgqgJOBHJQGdOnfRBrg9yDLwBGT2YMcrF/Kg2+
 btCqFyVgyPj/2Pq2ljWDQmXraVk7973s9Dgltucy8EzHSpVATpC14VHad7C0eha4coUmxQhtjNN
 raY765HNgn1MSho/Pjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

From: Andrew Davis <afd@ti.com>

This function is only to be used by the TI-SCI driver itself through
its registered restart handler, exporting this control to any TI-SCI
consumer is not needed nor probably a good idea.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-15-b-padhi@ti.com/

 drivers/firmware/ti_sci.c              |  3 ---
 include/linux/soc/ti/ti_sci_protocol.h | 12 ------------
 2 files changed, 15 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index fef7028d40e39..d22686f9346ea 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -2567,7 +2567,6 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 static void ti_sci_setup_ops(struct ti_sci_info *info)
 {
 	struct ti_sci_ops *ops = &info->handle.ops;
-	struct ti_sci_core_ops *core_ops = &ops->core_ops;
 	struct ti_sci_dev_ops *dops = &ops->dev_ops;
 	struct ti_sci_clk_ops *cops = &ops->clk_ops;
 	struct ti_sci_pm_ops *pmops = &ops->pm_ops;
@@ -2578,8 +2577,6 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 	struct ti_sci_rm_udmap_ops *udmap_ops = &ops->rm_udmap_ops;
 	struct ti_sci_proc_ops *pops = &ops->proc_ops;
 
-	core_ops->reboot_device = ti_sci_cmd_core_reboot;
-
 	dops->get_device = ti_sci_cmd_get_device;
 	dops->get_device_exclusive = ti_sci_cmd_get_device_exclusive;
 	dops->idle_device = ti_sci_cmd_idle_device;
diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc/ti/ti_sci_protocol.h
index 471f5580787cf..d8efddc1d4ca4 100644
--- a/include/linux/soc/ti/ti_sci_protocol.h
+++ b/include/linux/soc/ti/ti_sci_protocol.h
@@ -27,16 +27,6 @@ struct ti_sci_version_info {
 
 struct ti_sci_handle;
 
-/**
- * struct ti_sci_core_ops - SoC Core Operations
- * @reboot_device: Reboot the SoC
- *		Returns 0 for successful request(ideally should never return),
- *		else returns corresponding error value.
- */
-struct ti_sci_core_ops {
-	int (*reboot_device)(const struct ti_sci_handle *handle);
-};
-
 /**
  * struct ti_sci_dev_ops - Device control operations
  * @get_device: Command to request for device managed by TISCI
@@ -905,7 +895,6 @@ struct ti_sci_proc_ops {
 
 /**
  * struct ti_sci_ops - Function support for TI SCI
- * @core_ops:	SoC core operations
  * @dev_ops:	Device specific operations
  * @clk_ops:	Clock specific operations
  * @pm_ops:	Low Power Mode (LPM) control operations
@@ -917,7 +906,6 @@ struct ti_sci_proc_ops {
  * @proc_ops:	Processor Control specific operations
  */
 struct ti_sci_ops {
-	struct ti_sci_core_ops core_ops;
 	struct ti_sci_dev_ops dev_ops;
 	struct ti_sci_clk_ops clk_ops;
 	struct ti_sci_pm_ops pm_ops;
-- 
2.34.1

