Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7E833FE0A;
	Wed, 23 Sep 2026 09:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156267; cv=fail; b=sBeyRPEcBy1jhneyaYCJ9W4GjqCbsr4aZdVtag0XUVKFac7/AqP+ho8xUSNGFtQo3v4gVrnDDW/uaEKMjvosm/q7Omc0wo/Wz++MWBaDyyw3+ucWVA3/Qb/g1N4iIJdvDcRz1RCX1Bioi3iJsEDXOWfG8LQY58gFAQ3wTOy/jz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156267; c=relaxed/simple;
	bh=/yC29OGoIED7tUNY4GcOFd6/HtrzJLFrKbUmvStKsVY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A4tQOCKA8gVBcHlVvHAXhj2CxWT5DBc14hrGJktEMsvbZgBifuLgzXsXTdt98EalUwg/WKOM3jGGK6tcP6u+If5wWhInfHmrYK9ISQanTWpRhEuKOnBQ96hdQ3euGO1HYIFtW3+mKY8Zxx8hiW8hddNG/vuWjVQO1GwUA+emCrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=UiGxD9xB; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=i/Kalj6U; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="UiGxD9xB";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="i/Kalj6U"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68N8N9oI1611710;
	Wed, 23 Sep 2026 04:37:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=xGszQV0nGiNlfF+iK72ZuVu4nUMw1rB7BjMe4OW5x
	/w=; b=UiGxD9xBDl1ZSwf82vrb/pN3qlQiorF7cT4dpoWsj0vOwggc7/Vr/SXUO
	LheONxmOuONQyj61FO75g0cepuYMj/IOE1j3maxJA/m8UBBfkIvqt97CjYw4D5je
	8C4Na12F//lkck6qXLqxxbggdjz8eE6Q4VYgk0ERqmOjJxddA+YHzEJlguwxx6QS
	dOzc0nMk/GP0ApkvD+Da76DSKhiB0HjpUqy371nnSLR2pYzd3txWxrThnFHvDEA7
	idvpQwJ8ETTwcLXC7N8TpXY0lOCqwG5QWkEchUvMy6Vn63nAJz5Sa9QJMY4coGPj
	j/lkkXpJG6bnHIzRg8pjxp0LPcakg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011012.outbound.protection.outlook.com [52.101.57.12])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gvb77rdcc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:37:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3hCQTTtd3GBbstIoPd3WrEjoHcv0/HjwRKhq7BMu3p8F12WZTS7LlhM1HXN0I3FP6ukubXr37G3l2Btv3sONHEL4D9rCyLQFY0jeoLgzrs3OC+KtTGz0FDD/VLg2X4TFWy2azYfU7DQDpvBKxY1s9w1adJ2XCVo4jTbWaVl8v6hTl+PYRLO7aV1kAo40cu0QrGdt2IWnpki6fn29carOF2fD1deu+shxpW4zMyqDZjur8/bnLH+lsFI5ep9U08Z1hAVAT0BG1waUreqQPRCyVSZUvTI3cKF6BCNwLpJ8zMQ8acze1aaFwHXlGTFiC76pohaJaEE6+VN5c7GofAX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGszQV0nGiNlfF+iK72ZuVu4nUMw1rB7BjMe4OW5x/w=;
 b=uyhx1NiosWDHVp6fzPSlXJvVAt+fFLK764WFVUxJYJYP3BCzNJz/XUP3UgGrIEpu+L6c7fbQCjF2X93Gyn1Mn+yROaV1lwnhJRxw0RrAGlU/yOL5/vS8rIh5tcvU1MrIl9iPieC2YxUf+Ud6ZXO9nZnT5droqlm5H5LGUqWQPkwC2ctJJ/qDcGLq/6Jos3EadhFuXZs4BOLVPmRux4aG4VwrazJGJf0nU6BuJQB01MizB1h7QbzHpg0x0K6jG+hlFw7FGZjTPcfKcTQB59yo+eI56PME72kBxegkGPtCRT/EvZO2m2mwVpsAkK42hEjk4DXdDA4qQjW24zt/7cDURw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGszQV0nGiNlfF+iK72ZuVu4nUMw1rB7BjMe4OW5x/w=;
 b=i/Kalj6U69aS0eR38IzNsJhZ9DzSuj+pyR7zA5q/HHuQTVcqXu6lc/rXwNn9q+pCpFhpqACJ+SnWL5ymQT2zfARvVq5aNnsoGRw4uvLFFTF18KzkC55SxT59Pfgy4hSZlxBcYKw5cqKpFIToujWjtaCsBiNiSDzbMOZSg3bLC0U=
Received: from BN9PR03CA0450.namprd03.prod.outlook.com (2603:10b6:408:113::35)
 by PH8PR10MB6388.namprd10.prod.outlook.com (2603:10b6:510:1c3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Wed, 23 Sep
 2026 09:37:16 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:113:cafe::1f) by BN9PR03CA0450.outlook.office365.com
 (2603:10b6:408:113::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 09:37:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 09:37:14 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:37:02 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:37:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:37:02 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3Wc1760658;
	Wed, 23 Sep 2026 04:36:55 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH v3 14/18] arm64: dts: ti: k3-j722s-evm: Add overlay for J7EXPA01EVM Fusion2
Date: Wed, 23 Sep 2026 15:04:55 +0530
Message-ID: <20260923093459.28125-15-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923093459.28125-1-y-abhilashchandra@ti.com>
References: <20260923093459.28125-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|PH8PR10MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: f7205c59-5516-4944-35b5-08df19564090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|7416014|82310400026|23010399003|10067099003|5023799004|56012099006|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	DU5xlt0HNIuAjL6J6thwIbw9nHVRhVU+F6DoEgj6Tu+YHdq9u3oeEt5S1yXGxLyuXkHC4CKuxzKlCXaclA9UJxhdr793XLycmOl3NdZ06zNDQuFdzKdykiV13/QvvTLWBmChOpKQm7sAw14BDJ9x5ww9szQcy9APNQdeRkCepkq+2VlPbvkyF2AKGNX8S/906UQKJQzNUT0EsISssRLe9fTfx3+m2XIxS1IfjN8xbj6JwlmIoCPGgD44bFz1TJC+OKtrjf7vHul+TPGRuqShXwXQlJshVvtQLqpFfH5zC//1F661VjWCaBq2Of/cs75MCCmfL10M9AU0qmczJKMbYYVwM6R0//34GX4m37mKbxz6zXuknyAJw/pycs5NQnv1jGuyELC85gjaCgL6g9U5j1Muc1e+WMr4KD4E/E7/5VPJHZnsw0kvu53PwWCOvJIY8IUuE8fCoruVtZveI/dJOmCwMBmBrkHYGkSoFAit3M0LWBoHjYtn9kj8DYhNzD69ERvODkTHMM5+SniI96ZMwTZvVosKx9czeZhBlT4EHzButYcUyEbjZYrcAWkwYJnpl+BVxOIT4GITBnIT0zjskto78sFfeYn86MV7S4cKHvAzuiwOLKkU/OGqadMi8QRCBme7ucKSOQ1x1SI9JxaBNg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(7416014)(82310400026)(23010399003)(10067099003)(5023799004)(56012099006)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XTzXR00D0tMyQvEzudfiQQHGYZQagpDcdIVtcpr6fdqRY3xt02MrpqXaaRGdD1rN8iAIrFFIabajrNZW8Eei6BpFPZ1OUSF7RlFCZ+NCru8QPS18KvUE9ATyWGMFTfTqIOuUl3VF465k8jxlUISu5zjg1xec/SNZ5nKuFeUMkvrgpZWxT6797etRHhWGUms2AN2SgNnJU/VWI8N0hKjMt5oOWqwn9OVVa3iwgCN+9jlLIK82AbPNHYM3/NvAB3npTAKMP2a9ss8cey2qPu62cyDq5ct4GvrCcHhrNQ0AtJ6RaOIsm9Qr4h+mbZAfJMFpydp/9L1Glq0mLO9yIrixAb5qtoNieSVN9P7vYnr8JQoLSiraIs568ZYEmY/sHYs3qh+ZpZZkSw9UmHf2jWBrop3onpq88MG67LCoXBQIX6jF9RrxjpKtZO4PkwU7ldle
X-Exchange-RoutingPolicyChecked:
	fFNeO2mElZcrgSRwwpacTSESRDTtdNhuAYe2g+ff+JOeD1lOwnUerkRsQMYcw/D7Oof8jKjyBVicPC9EDHQzCnbOUGCsrK/YFh59bPP20zkxpnt9hhBF0tzZP0ux8Yry/uBDig1LjggEuxtUn+f3Wbx1Gd/8ZrKAuPWeOtAwvPpmeTifRQlTc7wDhpujkiYxI5DE6AAuYP6cSj0W5OB+owmOYS2q+71VKzxx0bgziUPKghD16kqawbcrMYROD1RvZIp0YokD1sEf/Kkta12CNoKYh6qsXK9SgZIDguX90vknsnx/7bMlNt9OUs9utm1ucmgZwRdKutVbTtzTMR5wLA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:37:14.9807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7205c59-5516-4944-35b5-08df19564090
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6388
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfXyqpxQL/mRzJ8
 z5xq/hC2s2Z3xaZXTT4oLUUJmaXofP3TJmE8NrHo9nFnLMhpoXyIi4de6BMZ42gnBDdGogrNINT
 dsvROxsecG9EbShWnODefAouWwcOc8Vx+xbmsC4LGpWqT3kAVT9WIldZC7FY5LRF76Iy/dQoJZB
 B0Y3WWhMYO987TKZJs9d7dOqt2qLjEdTjTSLpjXaRQ3UKZ6r3NT5zsC9maspm5zwx3Qm7AeRnog
 wi+6sVa8N50iHIpviEirgpmTk95wnY/Eojc6VR8inWYinX76z5bnqnezUlCm0zaH5f33jvr6Dgq
 EY6as0Z9b/64dt6lT89C7GEMvZaHCvCFQtwzOyISFqdYmC1kCRVMkyUwVQDVsMlm1bk8MzI//8P
 +sB4mWCVL4Rrm31N7/vNMtR0WOuscaHEx44HrOxHYLFYP86CsFZccyCqLEttpNMW8LUyK1Mxrz3
 7MNvMIFfP2hgqJQJAOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX3YDEOonEbMp0
 ViVhA0P44npTFXrLWazZcIos9j624tqnb8Y6D55UbgaC0okH3/GUM6a66ZXjqfQvpyE16V1GSsL
 0qN7Fw+al1f8qMg29Z5Guoe18Vn+x48=
X-Proofpoint-GUID: NZigiN9Xbu4dlLFA7G6VnbiQfQMMfevV
X-Proofpoint-ORIG-GUID: NZigiN9Xbu4dlLFA7G6VnbiQfQMMfevV
X-Authority-Analysis: v=2.4 cv=cPt1IVeN c=1 sm=1 tr=0 ts=6ab39dd1 cx=c_pps
 a=6brTJxCCefizds7ERwDNzw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=-ataLAZeJnTW1ooz-NYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230038

J7EXPA01EVM Fusion2 serial capture expansion board features 3 UB9702
deserializers, each capable of aggregating data from up to 4x cameras
over the FPDLink-IV interface. Add support for the same on J722S-EVM.

EVM schematics and design files: https://www.ti.com/tool/J7EXPA01EVM

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changes in v3:
- Rename fixed-clock node to the generic clock-<frequency> form
  (Krzysztof)
- Also rename fixed-clock label to lowercase
- Override CSI2RX ports using &csiN_port0 labels instead of the full
  &cdns_csi2rxN node path, and drop duplicated properties (Krzysztof)
- Fix minor DTS coding style issues (Sashiko)
- Update copyright year to 2026 (Udit)

 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../ti/k3-j722s-evm-fpdlink-iv-fusion.dtso    | 275 ++++++++++++++++++
 2 files changed, 279 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-iv-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index ed8966694d63..44ee01c7ff99 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -212,6 +212,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-fpdlink-fusion.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-fpdlink-iv-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-v3link-fusion.dtbo
 
 # Boards with J784s4 SoC
@@ -441,6 +442,8 @@ k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 k3-j722s-evm-fpdlink-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-fpdlink-fusion.dtbo
+k3-j722s-evm-fpdlink-iv-fusion-dtbs := k3-j722s-evm.dtb \
+	k3-j722s-evm-fpdlink-iv-fusion.dtbo
 k3-j722s-evm-v3link-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-v3link-fusion.dtbo
 k3-j742s2-evm-fpdlink-fusion-dtbs := k3-j742s2-evm.dtb \
@@ -550,6 +553,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
 	k3-j722s-evm-fpdlink-fusion.dtb \
+	k3-j722s-evm-fpdlink-iv-fusion.dtb \
 	k3-j722s-evm-v3link-fusion.dtb \
 	k3-j742s2-evm-fpdlink-fusion.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-iv-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-iv-fusion.dtso
new file mode 100644
index 000000000000..bb20bb925681
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-iv-fusion.dtso
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * DT Overlay for FPDLink IV UB9702 Deserializer on J722S
+ * https://www.ti.com/tool/J7EXPA01EVM
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	clk_fusion_25mhz: clock-25000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+};
+
+&main_pmx0 {
+	csi_expansion_interface_reset: csi-expansion-interface-reset-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x114, PIN_OUTPUT, 7) /* (G26) GPIO0_68 */
+		>;
+	};
+};
+
+&main_gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&csi_expansion_interface_reset>;
+
+	line68-hog {
+		gpio-hog;
+		gpios = <68 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "CSI2_EXP_RSTZ";
+	};
+};
+
+&pca9543_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	i2c@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+
+		deser@3d {
+			compatible = "ti,ds90ub9702-q1";
+			reg = <0x3d>;
+			clocks = <&clk_fusion_25mhz>;
+			clock-names = "refclk";
+			i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+			deserializer_0_ports: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					status = "disabled";
+				};
+
+				port@1 {
+					reg = <1>;
+					status = "disabled";
+				};
+
+				port@2 {
+					reg = <2>;
+					status = "disabled";
+				};
+
+				port@3 {
+					reg = <3>;
+					status = "disabled";
+				};
+
+				/* CSI-2 TX */
+				port@4 {
+					reg = <4>;
+					ds90ub970_0_csi_out: endpoint {
+						clock-lanes = <0>;
+						data-lanes = <1 2 3 4>;
+						link-frequencies = /bits/ 64 <800000000>;
+						remote-endpoint = <&csi2_phy0>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					status = "disabled";
+				};
+			};
+
+			deserializer_0_links: links {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		deser@30 {
+			compatible = "ti,ds90ub9702-q1";
+			reg = <0x30>;
+			clocks = <&clk_fusion_25mhz>;
+			clock-names = "refclk";
+			i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+			deserializer_1_ports: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					status = "disabled";
+				};
+
+				port@1 {
+					reg = <1>;
+					status = "disabled";
+				};
+
+				port@2 {
+					reg = <2>;
+					status = "disabled";
+				};
+
+				port@3 {
+					reg = <3>;
+					status = "disabled";
+				};
+
+				/* CSI-2 TX */
+				port@4 {
+					reg = <4>;
+					ds90ub970_1_csi_out: endpoint {
+						clock-lanes = <0>;
+						data-lanes = <1 2 3 4>;
+						link-frequencies = /bits/ 64 <800000000>;
+						remote-endpoint = <&csi2_phy1>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					status = "disabled";
+				};
+			};
+
+			deserializer_1_links: links {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		deser@32 {
+			compatible = "ti,ds90ub9702-q1";
+			reg = <0x32>;
+			clocks = <&clk_fusion_25mhz>;
+			clock-names = "refclk";
+			i2c-alias-pool = <0x6a 0x6b 0x6c 0x6d 0x6e 0x6f>;
+
+			deserializer_2_ports: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					status = "disabled";
+				};
+
+				port@1 {
+					reg = <1>;
+					status = "disabled";
+				};
+
+				port@2 {
+					reg = <2>;
+					status = "disabled";
+				};
+
+				port@3 {
+					reg = <3>;
+					status = "disabled";
+				};
+
+				/* CSI-2 TX */
+				port@4 {
+					reg = <4>;
+					ds90ub970_2_csi_out: endpoint {
+						clock-lanes = <0>;
+						data-lanes = <1 2 3 4>;
+						link-frequencies = /bits/ 64 <800000000>;
+						remote-endpoint = <&csi2_phy2>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					status = "disabled";
+				};
+			};
+
+			deserializer_2_links: links {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&csi0_port0 {
+	status = "okay";
+
+	csi2_phy0: endpoint {
+		remote-endpoint = <&ds90ub970_0_csi_out>;
+		bus-type = <4>; /* CSI2 DPHY */
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <800000000>;
+	};
+};
+
+&csi1_port0 {
+	status = "okay";
+
+	csi2_phy1: endpoint {
+		remote-endpoint = <&ds90ub970_1_csi_out>;
+		bus-type = <4>; /* CSI2 DPHY */
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <800000000>;
+	};
+};
+
+&csi2_port0 {
+	status = "okay";
+
+	csi2_phy2: endpoint {
+		remote-endpoint = <&ds90ub970_2_csi_out>;
+		bus-type = <4>; /* CSI2 DPHY */
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <800000000>;
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+&ti_csi2rx1 {
+	status = "okay";
+};
+
+&dphy1 {
+	status = "okay";
+};
+
+&ti_csi2rx2 {
+	status = "okay";
+};
+
+&dphy2 {
+	status = "okay";
+};
-- 
2.34.1

