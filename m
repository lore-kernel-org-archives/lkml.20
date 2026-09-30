Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B4C51993C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784469; cv=fail; b=Rdef9dv11X7nPgfGwX/hTTVEyI5r2DgFcUEw+d4M9GSpA6H+GaiN6faxU8RzjwbC8OMReo7ft1BncYCaSHtA6ZAGSYg/F4VPLoFGm6nzbw5ZrK6wjeu/G78YiNkhqTSCJW6MkEb3FM7kgDgKpNkwLVV5CxEVnl2LYJ0Z6Ujy4pE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784469; c=relaxed/simple;
	bh=cyp7ul5LH+f96lqLPf8v3F1I397GSGXOHxpA+7PFRAw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kzzBuTs3VSHWYSzOQ9Fbhw9At+6Z8mqU35DoZRbJmif3DjmMuZoqS0xo6mN6q5m2it992uhjAdajW+E/e59NOfeCIX4NtyWuDv9sgzzoS/kbyH9Sj4vsaJuqLH5gbt7108GGOy7jPEWpnBQJ2Dx5iKpLcs//qaGFNcKDivI17Xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Vxe3YM6n; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=OAJG/nt5; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Vxe3YM6n";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="OAJG/nt5"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1XXT3555902;
	Wed, 30 Sep 2026 11:07:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2zamzywmVPXx2zFYEkSbqo03l2l9gYAQanB9s1KDo
	og=; b=Vxe3YM6n/komEL/qEg+4PiHyYi5MohceK+rdIJe51MTe669Wn7IpeT09P
	i42hTdVHKVlCobsrv9Q1wlA9M0Xweq8Hg7fYfZLxMV4cRf74bX03zr/YOm3AvBtx
	w2yqySF0Yh7LFQ9OhcpHe1otL5jQs6GJUpJDR7DVKgo2wPliRnwZSdNtjFbIrolJ
	+wBh+tThb07BBQ8F6pdNF1Ukvw+7ZYuTCSnFUt3PNF3S2U7oXG9ZMq+n8/sTp1Z1
	LoKr7VMLeSK/KEazwbWaVewQa4W/0d9W1lM2WKuTOhIj+iCMUw2N9CLxm5AQse9D
	FzwwPicAkZD6Dno/SKP9jJ1e66rTg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011020.outbound.protection.outlook.com [40.93.194.20])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydvacp8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:07:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKSwupCkTJnEwgxm+TkmLzzjAe7CfVU8s9IBs+jvxKHjHBQnajLWgM+SrZm3hmASUw1eDnWmRindZcZAZcN7kMn02ku26KIQT0B71m4GqTAm5nFjaqB5w7cc14xJGhYBRVKp7U35HLmkv17CWJUPHIPExG4JyBWCl9pd7Rv/HmNEy5UeRD+ew21K+KoYQRVdB9CaSBiJYDrq7MpOH7BT5cNHejFm4M3CTNSRWehT1eXPibRVP47lyb4i9AUZ50mYwoV9Bg4y0jDmlPmaB81IyKK+zHp9h/5WLPi7ChAPFD268r9BiD/8ujiqwRggeKGk++jNh+46d3s8FriaJF5tsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zamzywmVPXx2zFYEkSbqo03l2l9gYAQanB9s1KDoog=;
 b=e0rlKO8payF/BVe8XPD3JjrA/dtl7hqXH5gIXeLAeoToW2jB4uwdZbfIHDNhJyknxlKWSJDGXCHb07VlK7SH7kNop2Y80z9J4Ghlxb19UVPS36M+G4qEob2eG2FfzLP/J/9jFXNZKg+15gxlekhfdIDNSki81ljxoGVEETCTHEDXuosbbbksXDzr3frVUsjm5tHclGdQSs+d2wubRGdM2TPSFEe7JXdPzZBvnkd8OCw7fjV4Zjf0FWKNDBYQ38mvTH9zxaCuAj0YV2Xul3e5TExKQ22giRiU1MYGUdrkiMxw2oC/Q9HVVN4hQTQyvkhGlgZYBjYHdTqzg3L0EkvoLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zamzywmVPXx2zFYEkSbqo03l2l9gYAQanB9s1KDoog=;
 b=OAJG/nt5a1x3HNUdVso2XdS6gzg0hKA7sYw0ZtctFAtGCd2Hoi5Id7bzbQfJESp/O1GJRf1tUdEvVscjrjaF2LzZ4h0IYRWVwuSohM5jGr3j6TYApAB+OX55D4ls56dcWC595nP2nDl5hkqWZS5YYGxim8kDmyNx1KGnYsTWAI0=
Received: from PH5P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::13)
 by SJ0PR10MB5860.namprd10.prod.outlook.com (2603:10b6:a03:3ee::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 16:07:31 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:510:34b:cafe::1a) by PH5P222CA0007.outlook.office365.com
 (2603:10b6:510:34b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 16:07:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:07:31 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:07:04 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:07:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:07:03 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68WK3425232;
	Wed, 30 Sep 2026 11:07:01 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 17/22] firmware: ti: ti_sci: Add missing includes for self-contained headers
Date: Wed, 30 Sep 2026 21:36:02 +0530
Message-ID: <20260930160607.2674980-18-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|SJ0PR10MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7c30d9-dbed-44f1-0d90-08df1f0ceebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	p4S1V5/Yo2/B9H+9/CXeImPa7q5AP+wXluCW29TKDdLZFwdIvH10fclDuznu6mIcqIvc08/a8EcjawqDWcCLI6JUCKF5VqJ2M2e/0ABAwQxot8do5VQ20N6N69tcoW49/N+VWl+pG2ON8OWyugMf38rvTeA9oLarcGwwLSU8/VkEFx560xDejtbwcjImgHhcj1Hv1bOG5DyzEsXsgQO6DcphUMcv7OECI42LE6mChmbI66Qhf/GyDql/vvy/PtvoK5owqEgcTY+iBZYELjzzK6zp7Cbbk3NTjOw8wmGspjwv+1KNAwPnNc8IzppUUpxAmnuds5NJrAR6VrQD7OiyCECGd/Bkc6S9w9nV89cZV48TjgLOwuvH5Rzvyzquwl0EVZxRbVdQPqEJCgxk1Ux3KZ2ZcelZVoV6cjBArZU93KOH1jAoG1Nh5KyE09iayJj3Ijupi5f4KsOMBp5XZgf3E7Sptcrtv7cxOUtQL2WwpQuTgWQdd0WOEC51OR8yuyJ/dGpUud4VjehUViy6pd1AqE27waAT4Xi8JosXgcIM1TDqE1q0TCPksnW5O6ILEY8VHEkc5P8xnxi0LCutOs/Bw9Oyuk3I4T+5GkJ7huG61j69BB8+usXd6J7KE/HC5uNqmffmkVPem5Z97jbrIboJBOvytD5uDA9svjql67FVF5IXi3bks0ah8bm6z93hJYUhZsbtKvJZgUAmiXBAFKnkQw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	01qR2jzaR0t1di/zoTFmSCwjA5Vz35qDFjg9JFZKQvYPVRAbLQ1nAa9QYuDIH7FsZCcExCuR9bkBjkS+GNYY1si7fZ01rQFdAfqG09VdiYm76Ww+0zasMfRejNH1HPNBfNTN4E/jnifYjqCIPRCUlw71zdV25619L62ZF11M7iPJFGqiUSxghL/NBQdvU+KXXBpC1XJOmxo8YHGmu/pfi4JBTtzk3n8uDmfNNdqflkcuYU6+IBA5K+u3hjlzXyo6i8JrWhSNZXa6rC8lhkm558Jr2cOG1MFUaEKfMqgbS5seHerfbmCtAGGF8eDy+cxn3JyK8gUqYT2uww8ax3w0pnHK7ojyR+13zfcxvc159DG5Uk/82Wn0GznA8SnOZvmmAg9FJkO/4ryb9oVK09VEr3W3KdjntHr1XP4qiMi/Gcrhe5lpiWbVS1iv6r1znh4k
X-Exchange-RoutingPolicyChecked:
	y0KK8Fv8RSTgu7zGSLyZbt/1ggEzzu1YZfDl89b+hYQ2bfSFVv24LISg6SfpAqm9cak0ikHM5A0LLYDHLFBzGkUWBIba/MnoxdcPOhNDN1Cq/y0G8C2R4yQYbD0xR2Clf38yj658qtxbyNq7m14L45UuMfxg8uzp03dLSuoTDHV872/LSSiyucBVoKBiZHSfDtzmyMQQXp0toBkkHqr7MZX/7amzKvrVJWJi9mTvKGTxwSRSX1iLeEbkjrLMBc6J6fNdcmQghKBiXvLxE+H5LhPQmeBsCa8ALgFPDpo0tksgpJizsIGeZiKjFdPrzrYuWICxpes2/ui1KxHL/oB9mA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:07:31.4061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7c30d9-dbed-44f1-0d90-08df1f0ceebd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5860
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX5/7QTImr/mkF
 DJkeVS6unNcupnrWJUPpDztuFGN6u84kZkmN0BFFpvHEXU0tkST/xwke4+Md2WGa4CiV6FVxrLj
 yPi/McNEA8H872195zdBoHctC9zZjoI=
X-Proofpoint-GUID: LHEXwqf6lZohX-5Ilmo8tzR6zGH4z26b
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abd33c7 cx=c_pps
 a=ut66qxPycOxoCiL0Gbz/2w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=qxQJPro2LbhhYBg5XAAA:9
X-Proofpoint-ORIG-GUID: LHEXwqf6lZohX-5Ilmo8tzR6zGH4z26b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX+2C+yaO2Oc/s
 AilJEO9hUn/lVLagdGLx6/jFfrlwS1is+NHcMvhHOfnx9WKo0JHXz29PstD2FH1hZOOpS6G2wLI
 H0YEM5Htes7JXh1sfuKhPhWxnZMuwYDjP/GMPGvIznoor7X08Vu59QyJ62QZ4XKLo479gulRKdN
 rBsJImY3Ljq2MP17FWn8PNf48iZtAol6koHVpTwJ9M4BDquf2qacQsWzUF0u3DUPgcRENf2XVrU
 gGYKrWhl5MFlwUYbCabydJEzljBcnfgN1n2qpi1TfK5x8V+1iSbnhNC+bKLBw+LgRDjRf9R1Dci
 ykEDJOINhgw5dr0OqZwaekQBGHJV1BD01PRl40IGxX63KLVkTQd+rZ8AePIl72w7uOXF/h/4sqQ
 6hZuLCJ1BnXTWVHWW/YCNQ+1TarNhg9hpKf3/XqcFR9Pk9jrRxEbpPrPBT032dpOAESXkw7wgyQ
 oYKNgGPwb76IMhjAYCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

From: Andrew Davis <afd@ti.com>

ti_sci.h and ti_sci_protocol.h do not directly include the headers that
define the types and helpers they use. They currently build only because
every file that includes them happens to also pull in
linux/mailbox_client.h or similar headers first, which transitively
provide these definitions.

Make both headers self-contained by adding the missing includes, so
that they no longer depend on include order or on other headers
being pulled in first. This is needed ahead of the following commits,
which split ti_sci.c into several new source files that will include
ti_sci.h directly.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-18-b-padhi@ti.com/

 drivers/firmware/ti/ti_sci.h           | 3 +++
 include/linux/soc/ti/ti_sci_protocol.h | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index 34f7848073a0e..f2f17bcac39e4 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -12,6 +12,9 @@
 #ifndef __TI_SCI_H
 #define __TI_SCI_H
 
+#include <linux/compiler_types.h>
+#include <linux/types.h>
+
 /* Generic Messages */
 #define TI_SCI_MSG_ENABLE_WDT	0x0000
 #define TI_SCI_MSG_WAKE_RESET	0x0001
diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc/ti/ti_sci_protocol.h
index d8efddc1d4ca4..c7bcd9562a71a 100644
--- a/include/linux/soc/ti/ti_sci_protocol.h
+++ b/include/linux/soc/ti/ti_sci_protocol.h
@@ -9,6 +9,11 @@
 #ifndef __TISCI_PROTOCOL_H
 #define __TISCI_PROTOCOL_H
 
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/types.h>
+#include <linux/spinlock.h>
+
 /**
  * struct ti_sci_version_info - version information structure
  * @abi_major:	Major ABI version. Change here implies risk of backward
-- 
2.34.1

