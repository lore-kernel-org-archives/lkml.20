Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C613B14C6;
	Fri,  4 Sep 2026 16:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537851; cv=fail; b=b2X76sUl0iDjJgdi1ZQUkyy4UrmbawTuJV1/IxfVYez8u7mskPgawougAkhInzQdrU4IFmOkI2wnQLDDEBllF7JIagpJifL6W4LmPKA2n2IRp+zszgWx1zx4Z2jAz63LKwJ4WLdfq6L0sbvQGGu7IDA+3KHrZYbqgv/1G9yIJ/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537851; c=relaxed/simple;
	bh=tGoBmEO77ZTm7Ztq+KQCEQI7HgyP3j53F5zRNHzqykg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dROUIpjPqWrS9irbkXippPJ1nHE/9wKv4BCjkcxKiZq/Lc+B8Aa5OWkK52eMblZ3i9LlC/HyFgDQYWfvczrDaE80ll7+Dc+m7tEvzfAVKyj73LaKZpan4xRqqnyTXHoDjO38q8/wdEES+bcV/NvzKB4DF+uxZL7+WMHkUUs9GHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=H80dTzVh; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wcQq8uNo; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="H80dTzVh";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wcQq8uNo"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 684Fu44b4122949;
	Fri, 4 Sep 2026 11:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=n4bJP0vo/SCI8IROnl9P9qNfso1z/1In+x/ePCHao
	Z0=; b=H80dTzVhBJhAS0wF8qSOisKBHpGibrC5TVPrAQAiL8bMW1VfC6nj6/zI2
	VncR/kber2RZbnH7yApPWAoNybt1P6Ptx35ZJY6WrLD6VDYXeK3g3dZj0Q3C8D9q
	a7XREoR2Jj8Q+bHEyYnyHNQrMLnpx9iQfXQY1x1RePwRhwMhrM9JLPR2aAXw19Ah
	egzDPwVW50SzVEqZo/R1i/c/A49nsQ8oX8ainwD5E+/OdVVlxX25OfvYgl6r2yE6
	33YK3ukPcBjqU/I8yNe2hQ6M1efKI/dXFqL31S0lMxBlfR7pCZeQUHNepDKtNsuT
	bCUMODRy9OK7/iEzXwXA56HYnhw8g==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010067.outbound.protection.outlook.com [40.93.198.67])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gg02srkf1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 11:04:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2Y8rtaJdix/4nwCqTo8j/in0ROoPLUwLtsFLF8RIc2D08s2E9LQiXZAaQOWdrTVVbs/SgUOMph/F1uHK9C1e5A58mdQ9KdkhclxHdrbQv9yPsJwzMoP0g3HxqGRncyfnF3ZjquyKuzp1BC/g76r1dAnEEOyC7YMj0jUJBuZv3Y43IjXCNv3FRddp4TZ6wYkGjKEbpl+WkfD5X/V4DppHXW4W11WYSjeTutxwLztTiJ48fgnro24Lw+fj0Km+jMJV/nvUfTqUVmzOVQIG/97yHBcwEyCF4iAg7J3fWk/DkJSS/A48smFhNs4zymvh0kdMpnF7T3TmjHzWfXxu1Wf/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4bJP0vo/SCI8IROnl9P9qNfso1z/1In+x/ePCHaoZ0=;
 b=pGZrqp7k0wXRgfhJHLs+LBg8YYI5V91ktDdcKFN7h6xazMSAHuQlzrGgLC04Tw2QKExCY1M868uC+98bbNltwCezWvxuZ5VGtJayjDOWG+dBiPc/znqTQQBWdVLaQ1G4kRWYa6f2zA5iEIOymid95aNw6NTNtmum5RtiYbisG77V+W29tM6MPwuJ+8GTVppe4AY931iDa6zJMu2jXngTZ/XgIJVbhEop3Zrg7klrRJ7d5qCwbwyl0qZf1ZUfWqHb9NUaMH6m/HwS5b0l8rTlWVioXcpUZo7ErnXVx88IN8UPSETfj60aKgcPq9+0z0FH+TgKSsMfmxLLIoU+kosU4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4bJP0vo/SCI8IROnl9P9qNfso1z/1In+x/ePCHaoZ0=;
 b=wcQq8uNoZHb10NQrKvazmek++qoRUqVBqpAJZXzFX78jbfAY/sj9eshYEJuSjaxbIClI7npEe+bQgUOvuroPq1XXHtqhsC5f15wSoEH0ec9pzBlTxtqxkRAh+5aQgAHIpRMaNdvaX3dinf3txmQ7Z2jiGKT2IXAgJV4DZcjLbKg=
Received: from SJ0PR03CA0190.namprd03.prod.outlook.com (2603:10b6:a03:2ef::15)
 by CY8PR10MB7172.namprd10.prod.outlook.com (2603:10b6:930:71::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 16:03:57 +0000
Received: from BY1PEPF0002695A.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::ac) by SJ0PR03CA0190.outlook.office365.com
 (2603:10b6:a03:2ef::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 16:03:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0002695A.mail.protection.outlook.com (10.167.244.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 16:03:56 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 11:03:39 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 11:03:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 11:03:39 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684G3dBk3788432;
	Fri, 4 Sep 2026 11:03:39 -0500
From: Nishanth Menon <nm@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Jared McArthur
	<j-mcarthur@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        "Sen
 Wang" <sen@ti.com>, Moteen Shah <m-shah@ti.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: ti: k3-j722s-evm: Switch audio codec clock from audio_refclk1 to external clock
Date: Fri, 4 Sep 2026 11:03:37 -0500
Message-ID: <178853777357.2996876.11452602149777449803.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260804210558.1455777-1-j-mcarthur@ti.com>
References: <20260804210558.1455777-1-j-mcarthur@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695A:EE_|CY8PR10MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: ff982352-689a-44bf-a457-08df0a9e200a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	bwpNAE5p9NArDV1oSnh/6so9cWa1KgPasyLcveNNzQpMK0Om6gGVdd5GBioN0jVB5a9BTJodPI/O0Zzb3MvDZHwsS7PABWfZfkuZvayxi/VAt66gSC8jiDF9T8W9PoTsCXUs762jb1eeh8WVbEDCJaFdIiqRtgJ46N25kz8o/rDpR5c0xCwhvWWUFrFcJSf0zTFwuyUA8b75/tESwPcyuj3hBE6va/aE54c/9uiyGK4rTxhzyQMa4zVkVUnvoSsiobCmasFP9hhCBx1ZUunGTMRC5GNbv5Sn46TOJh+k843MFaxxaZiLbSI7BId4f1NBdJsg6/s4mcwjajKX5H/DLfribYX4YHRVroI9XXiWbRXhqtqEBxg1w9XFjaXCqpQlBEwHWuBjEm1a8Wv8qdIgBv6VCuNjDB/Kva73orXGY2QPuZWBBG2WymM2GD5ZrhCcTk74B38fFkL1PFsHj+fEEHR/UC5kWVU0OZGyqUN0TL8MyuERkwrKGRwaVnHTv0db90Eoctmt9hUKNf/CazkhfRbZoBiKIsNIKZIg1Prwc35SDm2PlculM8BqIvFpdsJ8ez1u04uDPTjO0vrOk1H5nQqnThi0iZha4wfqYEpGMqhdUDW5m5M4lbJG+pRYVTTSGIwIFQ6gaHolQZOBOzrLrJO9eTLerZvFRfKmfrQqeP0Zy/HH6tSBsTpcd7vLFtOM7H1wVogi/L0xRD6g0BvKAQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1Fp07Z9yDuoaw+ej4tVLjTovVd/73In0OQn+qN+9eviZsBPj5aUPK835v7TPhp6lz7OVVZa63J77j0zZbBtCsfKfGsfJ6lXuDHkSLi5+z6Bms53Ih12jf5JYIHArqGfuzlrBLjIsYXReH2PDlVnOWmqn7Byv0d9ViyHIX8NdgngzsKDK5ts0pcfrhE0K+hIRApB4OKpwzuyu4/rsGsFoMsGqFbg1i4AnBjbT6KOKiy3B+L6fwA2VNgrtYnhJ78JfVRGFIP6Pbp7TGaM8v4jSoKMZpv6eA47EsJPXRnzvDROtdJhSvLJ/OtYGXXFO7Hq8wQxcao3vuf8jw2R8NrDPSyMoCgZF80aC6GsqZNMS0vpBiPMSswJZqahIwzqDT6EYvi8w+cG+7ygbA1UJLEcos9TRqH+TPr6DuHNezTCtFzIWz+Kzj2EVNIqsyp7sghKA
X-Exchange-RoutingPolicyChecked:
	PddGySIG6s3LVW+PELZvZyT8cm9+szZixkhvYxPMPDRn2ZOcPmjgKzHis1NITwBnirdlgVpNOTgwZsBA+ZehlKunYySuSXNnOgk22B2VKInGXyknlLdCVu4gRfQwVYf7YR8BXyOzS+K3IqXfx9uYq5ZxhGxYooxx/2DXXOh5aMQRPZozk1BpJd2Y07SUqABTXihkWYl6q5DWyGxVljcfg7DasBkmgX8yijZEZo1Y0/y+CXgLQydCtaEvOuAn3ryhomLnsW8pkiZSxEWAuO8eZfQdUSRZPoZdpY0ZVTLmh/aQ22ujsPfafMvJnT6seQaT2Fx0VWayiioQicantTcUJQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 16:03:56.7468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff982352-689a-44bf-a457-08df0a9e200a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002695A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7172
X-Proofpoint-GUID: Aq-n5mVuwEo5Ez4QsHZecx3Ze2jh1AXO
X-Authority-Analysis: v=2.4 cv=GZMnWwXL c=1 sm=1 tr=0 ts=6a9aebf5 cx=c_pps
 a=wCygq6uL5kGpubmeL3zaNA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=fDdq-lyyh3xy62GeCfQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0NiBTYWx0ZWRfXyT/TUv0o7C0R
 HRl7UNGC7odACX7DHxXA295h2zpvuycXyQVXru3qpV6Y1yj2CSeAx/+CANvHFnvUprETOgsjNCD
 h9oDRQBGoytKt0ZJuPlbOVuA5HmRh/k=
X-Proofpoint-ORIG-GUID: Aq-n5mVuwEo5Ez4QsHZecx3Ze2jh1AXO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0NiBTYWx0ZWRfX0AajBfbPqphu
 RmkLUKpqVWiixqcT2sZvFsNHEP4uZhKBl87M8gBXBoFM0I5Jj8QU8jgTcvyNWpElFEd+4WJDEO7
 8SvnU/T9EC77coQS/2CbSrR6NQXjKRpxgbzsu27eq4fohdc8Vx+yCSaaATTJpotMCAB6uwyVzgl
 y7Po5AV1rpWNBrX0B3gqKyCcWH9rQk/0peTnlztic29v2KZS5M2HH6nj01OUCuwglKijnoPXzVQ
 YgdP0+51BDgBYKCcvV3XMpF14Ws2jUawu1X7BMwDOWRk1shl20ykqM1nu3AJE6oHslQMsWvl9Bl
 2lqy1tLvv4GWE9oJYqydtZpsU8CB8jekRCCQli1rklWbS6r4rHmN8v9WND+NlVqPR137O0fAt1r
 vfACv1RzMfX7BSwnNvm/c9BWnntpqRg1YGV8e7nTI0PVK5FLC0e0GsSB99vY412uNkhXYhleJ4H
 VhqpoV40ffSU24YqdSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040146

Hi Jared McArthur,

On Tue, 04 Aug 2026 16:05:58 -0500, Jared McArthur wrote:
> In revision PROC170E1 of the J722SXH01EVM [0], the audio codec's
> (TLV320AIC3106IRGZT [1]) MCLK was provided by the AUDIO_EXT_REFCLK1
> (96MHz). Revisions PROC170E2 and later switched the MCLK's source
> to an external LMK6CE012288CDLFT [2] oscillator (12.288MHz). The
> PROC170E1 revision of the board is not publicly available.
> 
> Fix the audio codec's clock by creating a new fixed clock node with
> a frequency of 12.288MHz, and switch the audio codec's clock from
> the audio_refclk1 to the new fixed clock. Remove pinmuxing and clock
> muxing for the audio_refclk1.
> 
> [...]

I applied the fixes since all boards people can procure has this fix
needed, so best to get it into stable.

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j722s-evm: Switch audio codec clock from audio_refclk1 to external clock
      commit: 432bfc86fe62b654c74d9376b03cbe4d3513ac5f

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

