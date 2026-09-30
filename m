Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41384CC63A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779164; cv=fail; b=MZnC6iodIA84Hi5KSeyukpQ4pswjl9EWJ2gIWIl1ueZ7cqPx8wnmKXeZ+jFvuRNiTQEUb/WleOtlbkV4KT2EGMgcs5s0pN1ZFw+a/HVt5vGEAu/riLHEWcmIsZZa5VkcVCSFd4R1CGE0J4xM336/yLnErMAs+Qob+XCiutTZ5DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779164; c=relaxed/simple;
	bh=MGfIt81jYWb940LwdkiuMn+W/x1vB83QFAPT5LQ9KZQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CZKfmhrNEr+LbIDD8UM+7Rkp0/QiODg54JNqIEOLqX0jVB71rmuMreUt+NXzFQLgomyLXGmJ+SMK31ach4/ctggwDPZm0mjRNK0vCQqzeUp2nWrcKSD5LdZycGU2NTim/LLvlMt+Vk+Objc92ddmWZ9o+iv3yv9C6r78B+9e9tU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=TmXbfnGv; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=ZzX/JZar; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="TmXbfnGv";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="ZzX/JZar"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1H9s3333348;
	Wed, 30 Sep 2026 09:39:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Lb5dMKV+gJqzNoJwGiREFnqTkpX6spFbGIFdS6eFO
	EE=; b=TmXbfnGvyFzokKUInP3+4sedpuvKfnmLShnWF0zpD0Gwz0sv8HquaRN9g
	7g5FdrAhkn/dllEjYv92f9OBCCr22MNOs43iS3e4bFC/MjR/rdrOAfgUOQPdL/J8
	GNDyrywxJsIge+aCUsOvJSNuAUkrPF7Qz/ozIw+b9Y8TMV1TduEr4LH+ItRgDW78
	cMKahuAoC/34Xdu4NeYo6OBBY9fbCgsJoQoCIFZMQe1zBszOv33gLhNztC9CvyEf
	lgkARQ6ZJKZp6BgG1sJPg7JWZ6rPN3qhXxgvJWqmXxpTXcY/0SwQsKGl0jN7Iymw
	8DmmdO9hmQafLJikc16RMm8uKxQeQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012025.outbound.protection.outlook.com [52.101.53.25])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1sc5h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 09:39:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yr/Y6nb/wBThhEyt2kXNurD1/P7IODiAcTZUIDy0a6ZlGmazrbohCgen3dGw/2XYU+JwAeYbwyoTAOEA4bZtY7VNPE+m/lY/r1ivfbNZlnYC6APw/pjv0IFR8xjeXGzStxHyFrBlGMa3nuN4+kG29cdN4iXvVUWAKXGkPFJJc1TN2+dVT9izat5wNBOMYxtbFsQxN6H7lQSn2bFyeQAbfFII9JDAZKbjM5wRbY8UqeD1xQF+V9yaGnUGY0VruJig1u0xPzOK6unQjHV5eyMqC767Jd8ekveYMp69pZUoBfxXhhWyzM9FA+b+K491u/iw9j2PFYxWEd5Vx8rYsBxS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lb5dMKV+gJqzNoJwGiREFnqTkpX6spFbGIFdS6eFOEE=;
 b=kg3K3+lEXFhHT7as91k8JNgfgxEp4pDpF6Y1Ggzh4RSX6LTfym0E57dFQUAX2S7Xz9mexHiQl0aySMJ/8NOHOhiReqNM8SM3Ig2XBc12e5zpqPIcZ4DCzJZWFUa9JZA+fPwo3HqK5nFVx0gZ+J5YNrhyTncaQvD7/MduX9g44luF9vrHECk7B9M+FKg7U0GeDT9fWmhl0W3PawxPvBXVKosLVUbayYHmt+N/Ny7zZEJMuIKoTLxx/mVbHb5EYwiNhvdM4Dpo4tzGm3CfwozURxysNEl/Kt3oCDDdgCvQifUiT4s0ETgnHXiiooCdAaTJvB1TRjJfnEwqbZe8YRabog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lb5dMKV+gJqzNoJwGiREFnqTkpX6spFbGIFdS6eFOEE=;
 b=ZzX/JZarhVsKFqEQPs+giUYccQfs9tu2lKFzZjWOxFX+YKUpPVSXjvfltOZKN2HBiOVi/E6/TKyOShnqxnWAzYXUolRBMlEJbuWEoQLi6Lz7GkQuxY8QZqJAVS8OgOWOo83rfmZDmtAfkOdzXTa58RF3iPGUndBYjHXwgPpSjxU=
Received: from PH8PR21CA0012.namprd21.prod.outlook.com (2603:10b6:510:2ce::6)
 by PH0PR10MB5548.namprd10.prod.outlook.com (2603:10b6:510:db::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 14:39:02 +0000
Received: from BY1PEPF00026966.namprd05.prod.outlook.com
 (2603:10b6:510:2ce:cafe::6d) by PH8PR21CA0012.outlook.office365.com
 (2603:10b6:510:2ce::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.10 via Frontend Transport; Wed,
 30 Sep 2026 14:39:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF00026966.mail.protection.outlook.com (10.167.244.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 14:39:01 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:38:19 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:38:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 09:38:18 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UEcAmU3303811;
	Wed, 30 Sep 2026 09:38:16 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <b-padhi@ti.com>
Subject: [PATCH v2 2/2] mailbox: ti-msgmgr: Read exact number of trailing message bytes
Date: Wed, 30 Sep 2026 20:08:10 +0530
Message-ID: <20260930143810.2419010-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930143810.2419010-1-b-padhi@ti.com>
References: <20260930143810.2419010-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026966:EE_|PH0PR10MB5548:EE_
X-MS-Office365-Filtering-Correlation-Id: f8dc89ec-a163-44b8-c9b7-08df1f009183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|18002099003|22082099003|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	inbj8UgO2r3q1NN+7stJp9RsasCnkn99WCClT5QV6LYF0XnckTWTrzEgNy3W+O3hYT8bIm9gEgM3mGo4d+pqEAYrkKDnemCsIjs4W7PaG3yyUSVhhu3b5yeMblHF8aKwSm9Mi6JneJD2O95QtRFcFFTMaf/MlllcLe2Tlmmz7Y9/H3NjFYLmza09/aMzjhg4CDDH0FSvQPGj7Q579sYuAZNzkyOsROS3WObZplQ4OPWx8iatSwgXBvShz6oGnSbY3Mg2FNvVlhqqzqTF5lKEPa0VLvYFbDVVDvszE+nI4a8kvW7PNq2pUBRtoUJJHp1OH/wFhA7i7bso95nj5tg2ihs5Wzcs99B9e05j+/x6hagdUXAmdTp49YqzAIkGykMhpAKeYqCopRRYVxFwRKoO5bEaR0+0YdnadA4nAGEOjYT/ZobScBjKhquZsykhSPBAPppIJAIXZ2j9x81Nx5mRpoOJG9p//MP2OWxAfzvz95LgqYYlc3k5uyP9TML067qJ4wIFOiinMPyMk+PxRutmdyBHU+ZfVM2Ak42baz84Txrw1Yz7PCoX3w5fYbLukIliPgj1EFwXafoDMomJhj64rG1D672+aveC0nr2YG+StBiGqL2SoD14R3eGiCMu8bzc+KQeT6ezwZKM65JsU//iO0JP4zS5GYDVJflpeW7SV3B7LjzvJM8g1+acS7uCATRtu4PIZ5oGUltOLTzP6G2nSg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(18002099003)(22082099003)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f1VLX/Xbdjx/z33/kCArVXjvORUe9L1X0vd2mmwa3nD8/kU3kTqW6Un2WG29pcMeq3rnEdbF+yYq2apob9P+wnLlDgsFOw0Nz/s0d5xhBCibjqAzSzJ8AKp6zKEgWp/rxhr3PR6S+xwgMklsBdluxoZWo/LDSD2b11GdAldGZQE3N/3gQAJuKG4ajYLSikBiW0YPoraXuEfddiIroqHE9D3loVAR0WSbLoyhI+1oEmMOYFKxI8qs5lyHYo5tyGNzMlAC0aybl7lp+fp6Ni+3Vp3gLr0OjlPGRxD3yEqRG02tg3u5dZYdoUtmT1XBPzyFXzCTuVxR+tpnGL5Ojoanc+kL/00482Par9hQ+LN0fYWaQq70JieL/oOBy2OVqeqPoA5amV1XiByLXgNBQ8ejZYJGP35QiR+/MHkr+MalxzVf86TKdFlerv5XcBbopuut
X-Exchange-RoutingPolicyChecked:
	GgEPCTT+JStIpi/waKvyr9ZIcns+3/lyvEusAptcrY6TxoFrUHAwEznzpZWMdsWTDN2gxBKuVLPKTt4AYzYyOdkAVyjyD3FHLumEhcbct7dhyDwaYTJaHO0i+bO0ZdYFDhWPQTZKJlJLcQL6VB1b6eegzLGm+U5loWNEIcdw+7Lq3JaiQ0M5oiGVMjEG1jG0tTX+8pL2eSSq4TdePzsK+sU6+HOYL8iNKoiK6C0umyofoO1RJNo6JA3gLHa9jGexYWdWJ58YhYJG3UBwI2KQG+AiPvB/BMldHyQYXtpUSlrhmlNG8V9VT2lBJuoyxFxfV9UofbNy8Pe3+f++pzoSPQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:39:01.0347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8dc89ec-a163-44b8-c9b7-08df1f009183
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026966.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5548
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OCBTYWx0ZWRfX+r9I+JkQCBaf
 u53BIUHI0YE+ITJd0lp525nZBL28Eo1bPv5B2Bn6G0VzbxtjBT7grLeaXrjg+cjUgCe76W+heyL
 rS6p7ecVZG5Jfhd4H/RPUNnbtaS34jI=
X-Proofpoint-ORIG-GUID: pTO442Un5xyvJhOK_W9R9aJ8IBzqFlBG
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd1f0c cx=c_pps
 a=DkeX3LL2/Oc4yJO52xFMkw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=0KoXfk4BxXABeKFHTBYA:9
X-Proofpoint-GUID: pTO442Un5xyvJhOK_W9R9aJ8IBzqFlBG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OCBTYWx0ZWRfXxd0sZU1dzO6y
 /PcjxKtKLa0c8ZCsQafEMv2F8BPgzfBP3Sy1rCw3/CbsFMJPVpwtnVHgl/2QhLwqcjLCABVX37c
 yeJgHvCQS75DrmMDO75X9gnsVj6Ms9UjM/II1ie38MFsTvdOe72+v3ImlGsTmfOevamDQBaXook
 M+m+hVSkOOqjHVnxT07ZPNw/1uOGhCXlbauz7N5F081F9HKPCvQwJdiOvl3eyMsnBSJtmYkQknl
 RY68J5o1jjY0kx6D3YsaIdQLsdVYVzvquK/uy50nFHWxArwULsEtI8MfbNk9x7cTrxpN9joNRNC
 D215BIDvuhhlTL3dNPSGbsdaCAoh8HFswn0YpxxlsgV1D0+FjNLg6aKrglJ7MwvqLMlER0H/V5X
 BrjlSUy1BjU0iz6+EHj4dW0HQR4KsOGHRSPBTxJ0J4JzgZ7BMnjHQHZPfl+bMfVq84u4robJhXb
 EM0CB33X4RgaLxQAGNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300058

ti_msgmgr_send_data() copies the message to the data registers in u32
units. This has been harmless so far because the clients (TI-SCI)
always passed its preallocated message buffer, which is sized to the
maximum message size (60 or 64 bytes, a multiple of 4), so the extra
bytes read were still within the buffer. But, with a later TI-SCI
update, the message size can be varying now and not guaranteed to be a
multiple of 4, which would trigger KASAN out-of-bounds reports.

Therefore, memcpy() only the trailing bytes into a zeroed u32 before
writing it to the register. This is at most 3 bytes, so the overhead
is negligible.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. Use memcpy() to construct the trailing word to handle host
endianness. (Sashiko bot)

Link to v1:
https://lore.kernel.org/all/20260929200159.4033010-3-b-padhi@ti.com/

 drivers/mailbox/ti-msgmgr.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/ti-msgmgr.c b/drivers/mailbox/ti-msgmgr.c
index 425d5f9d9d0e3..e04b7f721ac8e 100644
--- a/drivers/mailbox/ti-msgmgr.c
+++ b/drivers/mailbox/ti-msgmgr.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/soc/ti/ti-msgmgr.h>
+#include <linux/string.h>
 
 #define Q_DATA_OFFSET(proxy, queue, reg)	\
 		     ((0x10000 * (proxy)) + (0x80 * (queue)) + ((reg) * 4))
@@ -425,10 +426,15 @@ static int ti_msgmgr_send_data(struct mbox_chan *chan, void *data)
 
 	trail_bytes = message->len % sizeof(u32);
 	if (trail_bytes) {
-		u32 data_trail = *word_data;
-
-		/* Ensure all unused data is 0 */
-		data_trail &= 0xFFFFFFFF >> (8 * (sizeof(u32) - trail_bytes));
+		/*
+		 * Copy only the trailing bytes instead of reading a full u32,
+		 * as the message buffer may end right after them and a u32
+		 * read would go past the end of it. This also leaves all
+		 * unused data as 0.
+		 */
+		u32 data_trail = 0;
+
+		memcpy(&data_trail, word_data, trail_bytes);
 		writel(data_trail, data_reg);
 		data_reg += sizeof(u32);
 	}
-- 
2.34.1

