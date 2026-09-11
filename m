Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8303BC696;
	Fri, 11 Sep 2026 03:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789098973; cv=fail; b=MOXErjuH8RGkNWlprEGM3mlTJex9cpubENqeXs+5X4mrFLmII2EEni1k8pKbaGbIHhnIxsWDlG317NU4CZHp/ANKmQHkBnqSiK9y4k6QVgYIs0A8IQSbQUFkz5nEw4Sh+/gzl7DZuo6Jx+NM69+iRFRVSOCrnMWqfP/wifOU3no=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789098973; c=relaxed/simple;
	bh=vMT7VKtClfnqGq+ABsLcRmge78tTLL6TFnwXJyUDMC8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWNJXN/+XMmGR6HTsnIRp2cvhpnfHuz4DYqYFsMWzY/H40xa1wUrsgjtn6yyM2FgJGzuYGDQl8KstW+dyWoYJkZ59sMvccsVjXchtkxVVKIDr4fsqhWBu6C1V1z0NlAGSABWw9boFUfVmCC+BKADaWqUh8v0jh6LeXEL1eQUldU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=UNdbeu1B; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jsguinx4; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="UNdbeu1B";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jsguinx4"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68B3ARTJ653325;
	Thu, 10 Sep 2026 22:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=u1vmfRLgx4KWxrx
	Ql+HlbPBOEsYBBAQzsFjHdlGpcoY=; b=UNdbeu1BxnShH18gxdYUTE2bk3D87fA
	HNujexyqKkLH8Ffc1KhWOfye6wAkygsge6F663vsBHAkQYek+MhQzbvlACqfy4Bi
	wQv8J9H8bOQn1GD3GwXpXQ/OaQWWhxbMKTqOddwt9o5i7TguuDOUlj4M3/PNEitV
	4GSzvadtzYPHUXH6mEqkFwmXXVdzBNI03Kncb5PqiR/dQg97XKaWsMh/VAgZOFoF
	3l01VKSkrCkRooPMo5jj+cObZsQbqTlAGFY5VvoiGUzOjI/q0MaJz7GGMoAK30mT
	G3QKtHQ8RDjh5uX/FjQgONNPMV1JgHdXlsFGxjCNJalvi5yBgUoSMFw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gm9gqr67y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 22:56:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZmGkWPnVWZliPlgBy81qEJuON2m2x5o+dOIJXQ5hopoCOrs+ztNLmaokwd5o+EF1L+9Jz+UIYbPJxTxQ+gSCQRE/Ke6kUg3siDCmAC7ZsXPL9Ul0AbPvQZ0g/8iOWcXzpu9qPDxoYclAE28N2c0trmDDsDEHsXUOSQ8Q/+oMFn8VP2jEaEEOtSE0ALQsE4LsRM25P8IKkNzArL7FT5dqvxlomjUmo4zM9cgxE+izYyDvzY0itBdzLqYrR+QDdvmfw+bd+skoT1erVuttkGw1ozeSVIJVlNIzlnM0yG5Koh1Li9kivn+G7BPy8iQYvncC5SmXQ0H46hXSdYzE+OB6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1vmfRLgx4KWxrxQl+HlbPBOEsYBBAQzsFjHdlGpcoY=;
 b=dhXRJ+DKXd/XpsFjuYqoHJXgFGszqHf3aXY/Qo4lTZotCKl4m602WR9b1jYTHkzTM9aJj3/O5+fyh1DxLOeQZUHqEZNzZvaztBY1mric2UvjgLursCQN/BOyT5kRiwWmVfC9SlwOomPuKDmx+esNU47lDc+NkOB43WMWgzdo/i4n0YsUOOu6coeEKT7nl2P369FzvrTbp0VGVYDvfphVAhTtGCYcbRZfcYoh/Fy2Nd6Cp9pvLYZN007dTzSiLbU0FFPmLKf/zeh8wq7D55msf0/jKSLPzhgCCIlAsdEjcCa/+HYc59AdeKaokupGb6ORlUVVu9CJHPLmroZgaKHxbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1vmfRLgx4KWxrxQl+HlbPBOEsYBBAQzsFjHdlGpcoY=;
 b=jsguinx4YW7f0QwZtqLMhQo3ADqOS8lcPincW1MYZfkqbG4K4yu12SglYoAPA5a3aa+GZHncbr+sauocXR9dDD6/Z+rGkHrGzmTltfqSdHkwuPotKlygGCEucew/L+/zDiDzsYC2Krl3m8STgrQMeH/pYAd1j9k0/a3UXnKhkJc=
Received: from SJ0PR03CA0008.namprd03.prod.outlook.com (2603:10b6:a03:33a::13)
 by DS3PR10MB997726.namprd10.prod.outlook.com (2603:10b6:8:345::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 03:56:04 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::88) by SJ0PR03CA0008.outlook.office365.com
 (2603:10b6:a03:33a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 03:56:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 03:56:02 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 22:55:35 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 22:55:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 22:55:35 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68B3tZ5o3568677;
	Thu, 10 Sep 2026 22:55:35 -0500
Date: Thu, 10 Sep 2026 22:55:35 -0500
From: Nishanth Menon <nm@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: "Kumar, Udit" <u-kumar1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <s-kochidanadu@ti.com>,
        <a-kaur@ti.com>, <s-tripathi1@ti.com>, <vishalm@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: k3-am62p: use ti,am62-m_can
 compatible for m_can devices
Message-ID: <20260911035535.eexmc5g3rdwyahl7@speed>
References: <20260902-smth-v2-0-b3678ca44c7b@ti.com>
 <20260902-smth-v2-3-b3678ca44c7b@ti.com>
 <412fc9b3-cac5-4fff-8071-ca2d4855db30@ti.com>
 <20260904145913.a437wnuif4arwb7j@uda0506412>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260904145913.a437wnuif4arwb7j@uda0506412>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|DS3PR10MB997726:EE_
X-MS-Office365-Filtering-Correlation-Id: 330aea58-464a-4f25-807d-08df0fb89907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|30052699003|36860700016|376014|10067099003|18002099003|22082099003|4143699003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	/NcUveMVL65K7tweckgJ7UADOi2WQdUSvdqCorZfNjZ01a7NTshrFO6MNJtncRDpxAIM/9maggg/+VeJ9vdmuoigGfD6CVP7fdcCWZfvVkVCXH1C43FhUsxujeq6M6VVL0arNejt/hgNpSDKjn4PmZ/E9V0MFws5PXOTPE0BfdWuAOURCWqkytVuKke/uLScCDeQxAtR9fr5kG91RMbN+28t5ZStQXZr449yhR4imiKXiuZBjciws8L7ivpQSHLF3KL4BQJkHa0IRy0n0f+NRdrICo0JOe8xgHxB1IRjop+NZzI8cC/2b7zrJi9u/Y0kQwr7/ovv3ZGcaMVRYBgqCEO/FqjOTdugaDjO+JxHKjiYqkLguIfqATTquoSEIaYjzEYxw5Tr7KWU0CPJpbXF7AM7NqepmVounxF+13uv+owsu+TR/FrgYdvXfJmH/4U4DJr6tmRv1IV+bME509CpvspuywcMNPtuyBJ1mjtT79CL2LpMJY09lIbC1uc3xZFVQRqfMhDlHZ28Xd2aJ0IUWW34EEOXcUif1LNlq3WXfUR8th0qO0ZPc8RriV9bLTV2GiO/fwadsKOH3psXWJ9XzuP0h5mBEKt8uJwadP0J5+0Vfn9nzQDX8wKY8cM+lKW0foWlSc5j+0ipKSmwZheSDPjbzRbFrlz4k7fG+w9CGsqpGeVfIAHygu4EAC7/fUi0MF99rXmm7+qS5BzSxbQCEA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(30052699003)(36860700016)(376014)(10067099003)(18002099003)(22082099003)(4143699003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6mVCgaSn0vRkcHLSme1UITXt+EIxsApXMaKFHoN0xQmc5xC+mUdXhWnknMxiR8rNxMxlEFtqhOwd50sM4s+V6bFpu9bKxYJOxAbioQG/YUKSuowEjvxKJLDc4sxwX4PU8c3vOiNjTOWQOGc3oIpqI7c42e4Q8NCLDeWLbhrp/CSJo1Hjtn4jrWAAu0mS62k+5gWIeyIIqgFTBuFVXu1E7iBIZeYmzzCiSRACMnCJMnFXcdmMdEqk8juo+jUo0fj0O8ekAnPb6Hp856kkNXDCqyJxvloH/4TLGIONTVKUTgyHAxGJEHllJ8H6E8CcGmNXz6CggoRYjdjFmdOGSyhCDChUMWmxJgIn2alSqdASsfJtiynT52ZuN3xbPE5s0xgF88VEvKEvbNhAf6WKi4PJV9rzT47tOn5U1VzHwdSZwQwPmAaK2i3m0OPvJosSoIYS
X-Exchange-RoutingPolicyChecked:
	SImxYKGq5ho0DG3CV2JUuwVMrN0V2zG490odhl2u2dKvLu2xXUSW5HnpWFNkQvhrCqsAoFAfSL6krlt+oBbK+neDh8NyEzMZVGSmh7AOVofCNRPBhdfDHzup0gj/7FEyx6BctgcxRqXz88BjswmRQxOxElBVJE3BRUFt35XNkBOyTIcDVD5+wOonIO4w4rnddjUag8ncAt5yoH9nFc/xVkPtXpudr5pE+b14pEtlKztc2KZ2rpGD06bh5dq1inuSeZrKfKDuoWzmCwCw+nbvcaVhrigzTYkZq/oJe4h5MzuooV7H8IYTMWjgiPiXGIe1s8k6YA7Iit52QnN2yk79UA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 03:56:02.4357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 330aea58-464a-4f25-807d-08df0fb89907
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997726
X-Proofpoint-GUID: hmFVTbwZ0y0GaOOMdbnzL-mpC1-qrjjL
X-Proofpoint-ORIG-GUID: hmFVTbwZ0y0GaOOMdbnzL-mpC1-qrjjL
X-Authority-Analysis: v=2.4 cv=XaUcX455 c=1 sm=1 tr=0 ts=6aa37bd7 cx=c_pps
 a=GeWWyO5P+zJVL7v3m8oIig==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=XPXyJvHr2pQhLeclgY4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA1MCBTYWx0ZWRfXwwzFiWBHaVU/
 /Uv2yljFhvFBYXcF1+dTCa894Cv07Wim4WzhtlYINSGcB5NJmvVV+CxMdZHrZxD+80+K91jyd+T
 WOPlszdiAQfuE72DC1q0UmaLtpUj3tGbyvTc9fLXr2/mkx7ePkfxcZoADQCDYnidZjIQxKbdh7K
 //wwkF/E/cQM+jimqXmkVWWoqPUItAo5z7qHaReG6wTNUEwUxHqTAYBU51GZzzoe//Atrs5A/AR
 fLR1c6mZpqU6hX8sdNSWTyPS9Q3XMcrl0NV1UqkTrBlu2vmmgSoXijkeYfimxHL7hzx47C+GZkE
 t5PfkFA87kiF0X6vKeSxABXhSxHteYtVTcSpTAeaY5K9F8aLCf2uup5gFH6cIBR/QQzomiLew13
 L6Cy94NgKmz6jspnxmyh99JcgKaLloz8LlvTHtZQH4YHP0IWUVuc61Nr6yPS/qtHchf818R+eNc
 YeKZTucq9qopBvwXAog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA1MCBTYWx0ZWRfXw7VgbDtslpUL
 RwyMqwzhrfcuBFu6dDKCf8ZqMjJreAWurn0ce4VYUwGVSZtGQG9fjydtjkEqgfbGwJobEzXJmM/
 cmACHYJ7MBBbj6qmaecalDwQCwcRC14=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110050

On 09:59-20260904, Kendall Willis wrote:
[...]

> Yes, that is essentially what the following patch is doing. But for CAN
> devices, there is a chance that not all pinctrl_state_wakeup have
> out-of-band wakeup functionality which is why the compatible is needed.
> https://lore.kernel.org/all/20260902-temp-v4-2-3896f7d16ce8@ti.com/
>

After looking at this driver side thread, Lets look at the DT series
once the driver series has hit master. I am going to skip this series
for this window.

Additionally, for future reference, will be good to state explicitly
this kind of driver series dependency in patch diffstat or
cover-letter[1] for example ti,am62-m_can does'nt exist on
next-20260909 or master.

[1] https://lore.kernel.org/linux-arm-kernel/20260902-smth-v2-0-b3678ca44c7b@ti.com/

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
