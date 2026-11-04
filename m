Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805852;
	b=b5FRQRUYUhmZeWlNh8cFU1mSCsYnjFryaWZiR5zdsrF3tKCD128zY09XgpAkfd3BHne1
	 HSdVAffGQWA45RdPhW3sLEB14+BI3WNLSTvF8hMYp6OKS2Miu6kpbl2V/aVnNQt6pFgK4
	 vxkF0ShYvxe5X9peXcvb5tBJoXkDdQ5uOVx8k7oJN/cJEv8q0/BYo31IdbafyBZ7lEjqn
	 DmTCeR6Kdihel91UnkEl7m6m7Y0wg20V0d7pYhseDEBUvT1LVAVenuis0w6Jm7dAKFCIs
	 YYEX6luWkK6LbAJakhdzrIHGh5yRjB/LEiOeUlgC4jg8k0UWkR0va35aG6WjUsMpgeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=3W95A5jeKjwn+pgkmtLTXn9deLfTD8GPcWArOrOzMVo=;
	b=iJc0HggxBTHSiyoG14M94W6YGIH7slQb+1vevCm9uywbqthWiGLFNnA5gEq2QWEc3isR
	 NVgCoRPvBbVDpNCMiB3t2eFdosHiXZbWjaRC2Bt3+qMKvJelwip1mHK0v2fYaIFNju/3y
	 FUkQ56JUuDUfOb9TPTg2U1/5Dldl7Yt61MnZalkerphY0C3ul0bTPfy59elBhM5+iTDny
	 m5MIMeB/VZOuf4AhycNHfScm4RAQLTgGzo8ecOgtEEzbqLuAPzXOvNvhrtr9VEP7jK5rV
	 VclJqkW7lJsxjJNiBrMnesTod1kRx3vPI0lR4rrmCarn5n9kRrgCyntT9oSM/htSaVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=QyTqxoay;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=BBCPj3e7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EDB606A31B;
	Wed,  4 Nov 2026 15:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97EDB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=QyTqxoay;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=BBCPj3e7
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4F7kZL3607450;
	Wed, 4 Nov 2026 09:24:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=3W95A5jeKjwn+pgk
	mtLTXn9deLfTD8GPcWArOrOzMVo=; b=QyTqxoayclUNbdZh5l4clVzEXTmPthDR
	/XdVvx77Jo4d081xJE96ns08hKXPOR0qk9e4zKw0OoYjYJMMbj8Vi34GS+cD3/7h
	nogDQNhJGzn/SNB48CkvPs9E32MJJXno8hyl7eBrUA6Q896NsQv2VHLXaYt4siEb
	G1KItzXTOeZkIF2vSVjmToIYYVUTGD+Za5Pi0gODMk1Qz0C8Wcy7s9AETKVBLxfc
	FYuG6fLtSNzW9YOGGwg8mEpk8zB2byxeVOHLdbPQU9l4NctD2nA4t3lffGiYEk06
	wpS36Rtcic9lG9pS/b36wrq13E0x4RIkJPlozPqDweW01WoBoiAXTQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022072.outbound.protection.outlook.com [40.107.209.72])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hndrfdfta-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 09:24:09 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jaHq15jt9YK1F0FH7PiddZFj1t/QIdl1mh9UTHJkGBZE5SqjbIGgrw9PAGrtO3PkHjnipYRqaXWc9q0IoZU51C3QH7CcwM3WY77iWIM6Bb8TLApIfbZ/nllngYyaadbptkgVltcRFCOuM4kb1gBVVkT0pJdxGmyH//FxTp5yEFiDqEIHcN4oqV9els8cfbIfBo353lhzGrAMl3jhmGSDker7v/2FIeMKc0kAKEbDRCm5zIVG2CV7FWj0n/PRMwjpAs8l1u5OqJ1CcsYnrh2caLYbUy1n9m6ecPFibOG39JKmeWcgLY/fbVGeQ4TvrbqToVlEnC98V2lkzoolcI1MlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3W95A5jeKjwn+pgkmtLTXn9deLfTD8GPcWArOrOzMVo=;
 b=I5oHpNz+acGQ1S1oRZsCIhIB+1J7jt7d6MwHyyeGkOf4m1z1il9Ewsir8I0Pt9Nn9/v/8JQFdiaOrdR4PWUaaUgWOa0tB241Kcc4ln7OW49FcsEc0laDjWfRiWEf/1PIjscsjK8Yo1Rd+P3x2LBFofsmtYKbgTadacJyu4NwPcLwQ3MaD08HuLVtQZnT3PCjd2mcxHsqpys8Ndot9LYn8at6UodCzi0UZxPDvFGlVd8aRAsXVZtQZWNhzV7oz+3njx5A1TmLBrVL6yvZmX/O98KjtNas27b29ShWxpJPLBL0knxLhjRfLAOIuvFPJCcQXu4jJekp7Q+H7nKGUhieJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3W95A5jeKjwn+pgkmtLTXn9deLfTD8GPcWArOrOzMVo=;
 b=BBCPj3e7hjer2mnfdzZKjW1J2bf3zfeaHkUrsnGVtuvDPbt1crkbtjZbBGdSomrtRUMgt7oRTDj7VWQ7LNKGLE6hI8CBD06OlQ+8B8T6Xd1Ms3zmraPR5gvpHszVri9QlQqPyKyQm8lJtV6r4X9CrdugfXoy605UR2Vg3LhRyqA=
Received: from BN9PR03CA0636.namprd03.prod.outlook.com (2603:10b6:408:13b::11)
 by CH4PR19MB813067.namprd19.prod.outlook.com (2603:10b6:610:506::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 15:24:05 +0000
Received: from BN7PEPF0000009C.namprd04.prod.outlook.com
 (2603:10b6:408:13b:cafe::88) by BN9PR03CA0636.outlook.office365.com
 (2603:10b6:408:13b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 15:24:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN7PEPF0000009C.mail.protection.outlook.com (10.167.248.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Wed, 4 Nov 2026 15:24:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D4E81406544;
	Wed,  4 Nov 2026 15:24:02 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C642F82026C;
	Wed,  4 Nov 2026 15:24:02 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] firmware: cs_dsp: Fix memory leak on cs_dsp_power_up() error path
Date: Wed,  4 Nov 2026 15:24:02 +0000
Message-ID: <20261104152402.1153795-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009C:EE_|CH4PR19MB813067:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5d8a2b29-21c6-435c-f644-08df3a87a8fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|61400799027|36860700016|82310400026|11063799006|261021121427099003|261009223027099003|56012099006|261028144727099003|261022105027099003|261102123227099003|261026140227099003|10067099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	WN5+HQRtSn0co3N8ecYZUfTMeJoA/xY49O6tAJHdHxVtcSIL28bhaxIIgVaLIIc07oqpoYPLBwh/xC8d7+4ybvJ4rouuIACqeNwxknIe76QP8fvNy7aXKE9/Y1j/m8vkV8iZDTUNwbRhBxd+QotXreoWVLYz9u/CapslN95e/y+r/DMAX4vfkkCoDQ309qT4/NC1ygefZ7vY2n8HmH40jfFS3+sgxWv5iMqxCcgzOWJOPxzJXvhcq2iYoeDWrKwwk6VDCmXZPhgfovpQTR9nvBFvmehu/pDXf1/eukGn86/3zuUlQFREOcmm5P+n7Iqao/1YfdP4JMk7vOrr7qqB7ffHAFrVy70uJ8lo3WV4KDXOrjevW6mOIDbVUxmAB9n4ZTfsZJsrW6vUNlzTPqQJZP70C0WpEYIQEPL2v4V81B9pd4cgsi2IuLK0XdCB5kdVVzkdV49MHHZ5Sm/qvjUbhQHeSnazPJXfSf+4Bftvd9WYkPffIF8bRU91rrae4fIfwMbFH6eogcioyX5dSGxZ50ktQsCD2aUMReQ3lDcv6wpvetNm2chZceg6QhXZPKsOgBKYROvvF3G05kGQf0C21OG3s3D+TfpXopf1bTyQu/QWFkB43tlPHg/wE5bS4CNcjNweg3k9uJMFWMiXcl8JmSnTszDeuV0qwFmuONkNeQt7tirr2jWWxTCFrfSrxP9jX3k2JX1hM+7P8m3OkuoAuQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(61400799027)(36860700016)(82310400026)(11063799006)(261021121427099003)(261009223027099003)(56012099006)(261028144727099003)(261022105027099003)(261102123227099003)(261026140227099003)(10067099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lfy/OVrPWGxAIxKv82mPaG0e3JpxHOV/LA88Qi7ddIHuYhhpQ5HenxLd0noMAjkIv1uJ7yGulRHEdekRmqMPmxJGmeFnzaY7DgwiBMqTV2Z6hbuYFuY3s2zBlcbbh68kyV0ZZp9nR0OU+SszZBCwLmZBdq1ovOKtVOXdwANhlbngpZa1Od37at4BWYgknFlhExM0XCCceZZ5fulAwucxW4HiXBi71jKem8sb1lU72YsSmk67v74n90wDhgYjSqwbkgu00+cGKhkeHik2KoPCbhaNEtQAAKnFkXGsj9rSndOQiGEhHw4glcc4UARPCOeP4PZ9sFn+lhnIgBjd20NCRi1jTGbFxNaZ2/fMMsKOmeFU+qc23ghHySybu4e59kZhyuWJKZ69nlcKKjiqxnt37sDS12zhs4RdNywxk8VXzaINDzrBNWTqZfn93EXxb/he
X-Exchange-RoutingPolicyChecked:
	Bza71QwM3ylO5c+7Vm7l+h8dQwbP8aYWQyN4b+46upT/YqdvCDNqvjNrROlQ1JgUymKg2tI3omCkR5QK4zbuiqMy15HSAFH9y2c+62FEAqL43peq7efxLhDIQrAKkubk/HDGJLD0JN/1IUVrJKtBzFmh3BmxjAjopJCF3pRek/9bbzBl+XiGhCq5SvEzL9ux+6zmJOtB64wIGX7VUj6f1klN49TmDwo/Djwx3kEiqau8vRNwiMwUPfk+qbDyaJPgCAB6XmLfydN9J5SuzHKbx6mi48+xy/IEdZ1j6QKLYkl7Da4rSWIY+HsL8J/ecX9Ik4+EustiSo0jmCvbx+BGXg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 15:24:03.7782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8a2b29-21c6-435c-f644-08df3a87a8fa
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN7PEPF0000009C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR19MB813067
X-Proofpoint-GUID: xuje7uME3PXQQ_U0FZD-5riLOFYmp4vN
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6aeb4e19 cx=c_pps
 a=8rtS5N/ibwcsmpvebatIkg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=EuiA1CtSSRQH3ZlJBMgA:9
X-Proofpoint-ORIG-GUID: xuje7uME3PXQQ_U0FZD-5riLOFYmp4vN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MSBTYWx0ZWRfXxmwT9LR3dVfq
 SJa8x7S5f8s93DrOCMirfhGI9q1HX1FVVzTWX5qqcvOl1Nxb2EJsHn02a3SnmgG4BAVrHdXFxsn
 Yv56T57ISgLhies+m5tilsRd1Ctz5ALfsAK0X7Y5o3Xj+pZBEplVWmve521wP9ArYjiwavLJHQC
 xdOXzK/FF40fbBpGrc+8ei+SD+1eKGaBuB9NS1ueSLANMD6kB2DDWWJymUZPI5ivXwPmcJ+71C0
 RnOuVSU1tcoGoe09mPV4p6gNf95BA+WM7UnrOgcXrH8P/4nU+/9KDtRNVOLYp+qGh4wh+9yjBxH
 FBn9vN4RsCB8Iwc8UOw7G/99dxrlqAoF+B1IZc/YliucQ/QwKaQpyb4WMQNoz6MKH03qXo2LHUs
 0D7KcBWp8UkJEQwcwkFufBUqQn8EX/AJ/o1DG6qMJ/UVpAXPBuN49Fl/AsGfZz/gCDfhbgQ7NWA
 WAoQjR7CW9hYPTNlrVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MSBTYWx0ZWRfX8t/9ClDnByAO
 yzKvNslKIxQDIb5+AwTbWHCapRFHimyRj+RsheZy+/1n58n/vLD4rNOavkePTuXoh+DJB7/KV4d
 bkFY4BkbPyWfWZa9/JTtvR92cQrne4Q=
X-Proofpoint-Spam-Reason: safe

If cs_dsp_power_up() fails on or after cs_dsp_load() mark the controls
disabled and free the alg regions.

Fixes: f6bc909e7673c ("firmware: cs_dsp: add driver to support firmware loading on Cirrus Logic DSPs")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 844c68036975f..4dcce87685d33 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -2793,6 +2793,7 @@ int cs_dsp_power_up(struct cs_dsp *dsp,
 		    const struct firmware *coeff_firmware, const char *coeff_filename,
 		    const char *fw_name)
 {
+	struct cs_dsp_coeff_ctl *ctl;
 	int ret;
 
 	mutex_lock(&dsp->pwr_lock);
@@ -2838,6 +2839,11 @@ int cs_dsp_power_up(struct cs_dsp *dsp,
 
 	return 0;
 err_ena:
+	list_for_each_entry(ctl, &dsp->ctl_list, list)
+		ctl->enabled = 0;
+
+	cs_dsp_free_alg_regions(dsp);
+
 	if (dsp->ops->disable_core)
 		dsp->ops->disable_core(dsp);
 err_mem:
-- 
2.47.3

