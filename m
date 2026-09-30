Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EB14BD348
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784480; cv=fail; b=ktv86DZqiSfAawW5Dnj3N/WGGTDPxzAQ/QnPeILB0dS4j+49/3SUysdb1yyo5uGV+wiP0qOnuaNnN8ALrB1V88fF3rZanxlrM00HzOtF9JVx1N0gRqoVZC7I3sXAUPy2liyEntFxs5/rnQxOU15yyxlAbmGrTF0dtk3/9hQ6PDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784480; c=relaxed/simple;
	bh=+1hSa98Qu+T5+mqBYAifJOuuyjxdUYgzFQ4embgSV4E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F3l/JRTs0GcUePdqb7/E6CidpH8GbhO6Ar1DoZ7Bko3J+ANo12imk/nwjDgDuZQGIy82oXyH+XhmfMDYIq5WGbpmMW1YAf/l5nyzdQhjBNFMpSB4KFaTxl9i3ESt+ZArBq0t7LKmLSmfmyTmy/arFhiGzGGtZR74+mpu+JGkpys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=TtiLHzCI; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=nM4AuVTo; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="TtiLHzCI";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="nM4AuVTo"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1JNB3057439;
	Wed, 30 Sep 2026 11:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8UzP4p1A/Bvl3prLrgOLlOosbIvhE95UOHewRONLU
	k8=; b=TtiLHzCIBIgnO4xGNJXw0QD7syVTPxGOdqLpwAsx6Ae0E8//7y36ZhPkO
	usg1alBDnNeuEoZfBkFATaX2WVNJdcIcelFQiPGKTyl8U/uCRJDGGWHSkP7SsSpt
	nsz8ikkdk3wHG38BIwmrZfAPPhH5eV97ijEEZW1tUl78+6+JhCD3x6QnvJtV9kyb
	71kryDPnaa1hC/4V4YyfBJgbaC7WsMHSEdFD12E7YSGghS4NkC7GDqqJQ9TSs84k
	eaUQzQnmn/FT6SD1DxDMt4ah0xKMzAhA0u7QGGpBc2okgubu+kqkcZa3LVapxZQI
	pZeRuJcnI5IAwDBYxg10ETPHIMEIw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010034.outbound.protection.outlook.com [40.93.198.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0m9fehxc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:07:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAVsk36LQ1jNCIuCj1qXhvc8HCGZBmPMLXO+R/SNF6txfAj6Qy++vvCEGx+YSmqhvSRUp9dqiX+GbfiLgX6AsaeK1HaH4juGjXXtRyBIx21GgzHnNF+p1F9LXjP9BoNlcjoZThq3zSn1KgNKTtrJH0pDVuMJ5mq8A0gL/wPvRjX5pBtcXV2hZLV7gUYsdWXWJu4HwSXN63JJuNSCBuXsBXzc5laeamrLdUm+Rrc53iLcKO2/53fPKCUDarLMS4NaDEy4Tq0gHRqTNU7ooALb8WQaW0dFN01ikZvtU1MfSIZ+hJd71dHbxgUr3/HDA7Nl8O9snF0tcI40yXpryya3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UzP4p1A/Bvl3prLrgOLlOosbIvhE95UOHewRONLUk8=;
 b=VkdqF3AtzE6Uadan5146h9r7VjiYDmroaON407XXJushAN2fZhWvROhxYnUR+XKSSMprUfvMa0NghVE8LBfpSR+DJr3J8IXixdkvlSwGfmWiFkfe0yZ7SFnbRgUF9Nf8Aiz7fK4xYDsTzD2fDnloTZcT0S0SFdhMjrBrr3KGP4DpYutkrzDPy69GCFXJyWCu81OGWOUfRNyJd0LanrEZeWiDiDYBHHHtFZ7LrI9wUa3tiu+QOt+DlHyu+ZcT4V7qHuZdIYcizLG/PqI0jsINSuFeI0KLvstdsZsyiMGSCWEE/y83KDjKSfG+RXrQ75AvKeQgjIQT8ZtJh8pUmDvA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UzP4p1A/Bvl3prLrgOLlOosbIvhE95UOHewRONLUk8=;
 b=nM4AuVTo7cMfXPOrjIrIUZAyFOdQc8+ICU1byf/37xLW/VFtlo3cSZs6IYZidMDWQuGg5BCGRB9HV/pGibLy983DOqVMfiP9XfZM0G1RBvl4W2OBj4ZscYpEwxbxxN3wt0nDzu35MjTfw1lJmEin5VRukACGD++DOVDMr+mDHE0=
Received: from BLAPR03CA0132.namprd03.prod.outlook.com (2603:10b6:208:32e::17)
 by CO1PR10MB4545.namprd10.prod.outlook.com (2603:10b6:303:9a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 16:07:34 +0000
Received: from BN1PEPF00018547.namprd05.prod.outlook.com
 (2603:10b6:208:32e:cafe::4b) by BLAPR03CA0132.outlook.office365.com
 (2603:10b6:208:32e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 16:07:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00018547.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:07:31 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:39 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:06:39 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68WC3425232;
	Wed, 30 Sep 2026 11:06:36 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 09/22] firmware: ti_sci: Fetch info struct from handle inside ti_sci_do_xfer()
Date: Wed, 30 Sep 2026 21:35:54 +0530
Message-ID: <20260930160607.2674980-10-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018547:EE_|CO1PR10MB4545:EE_
X-MS-Office365-Filtering-Correlation-Id: bb131474-bb65-48d7-c786-08df1f0cef0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jfvft9itaMo5jZJ2lvwqcWCotff6eAvKN+UMvWpe1OyWwJ+wBESeKCGPLX3YGYuChk01RdSaSTaJ5LaufxzI4haNrUvdttzM6D4702HP80VBmOV2aD62WPVkPQ4Z8czbUEWnYZm9SqvtA8cEEko6gFC6u2OjptEzjgpbi0cNh/eXBP5Jo9IgPEE092HOQ28XrrlTNsUB33jsebwV0PIdQHhUq3z8NjEZR/6zxrTGDsaTVhlAdUoChxp2wFNMlSwPGGhmUW0GkXW4lxfExZsOYhhJRLLSRMCkonLI+DX62icXHL5nRbf9ZpYX9y+e2ZkiNEk9eO5BPkf7zJX4sGZgINJrrCwWpZqp0EyvMVtvR6972cW6JCHLOsenDUN+nvQjVd1wDS0VKbNgYE9vwDa2kFEd/ElBDB5ItBvTsi6p6ofibzhRohFXXi/+aFOLvhJOIXeEDnXg+n6ov0za3kbzlwj/B6iMWaw2ZeB4k2uBPNWwvCfL9XBO07Kb1Q1ncthaUBykDzS1xSDnim2mLGQ3qbCZCsTnEcpo+GTqUd0VD8RIST+S+F8qRWHz6c4p0eGTHQqx1QunUH2cFhMgKXJKAsobQugIZyQRT2AkF2n0/+4YKr7dzQErhZUCgv+Ev1vVeh5P57A0aHGjVBIqqrb9HuB4vGLUAqtNxsTBgZe6w8Ln6HTwmvdoC9e1Kmye3JXwpbPpQ0K5tphT7KLFCtgpiw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FRIYm4c2oiNcLr+xQw4VpKdGE93HFIHTwm3+5URbC80yx7uZKNII9d8tHsbo0OrFrI3WpZ6W6F3nnJq0D+uNxWo5ClQ3nCNp+6np7q5VG4DoaZiJGh2Dbn8xmYD/89NQ8lOMhsAr/3HuHWv1+wnsVUo3j7yAMDqR4CnLAnZ60plGrBr8G3ZIGeLaBaCTvaY8exTHxGe/BcXjdKlLIJ+3Xlc1PW09giPhlCUZjDwoKN+DYMi7SA5MqjgBbaYJYdo8fAHWyYWkRS8oGDCdcZnKCZtTo5QqCj0Ucsht/Pkl2pqBKtBwBKwUODKnf7CJ5oaxtOCAy4I6PRpC2w2zYj340dHFwwMPJ7L35mC8XpikktIoMk5maqJFneghV4Chaz3MrroqjBRIGL8nkGGFYoOdrkkhgWy+2AR/1sj92hAQBswpIGnOt8N2oJyQFK7JI+o/
X-Exchange-RoutingPolicyChecked:
	o6EkW3YdwGImk9K72y3BNw4AAlVffsMJLVjsVKvuAoiHjjtew0/PMzoxdJyi1J1bl4ONv80YLChJBNVuvrKIywJtZH48xbC+lZFWxabh3ldMTBAjE9djHHaaSnxcV2QKJtUt9piupfwePuglRoM+ZGtKqqlJLRnayBz0c3zHUGl7/lRd6VEXNNkYbcnYyWbq+GMUz8hta4l1UT/kRjeUfaN7z30kLn2lM0+X2Adf/2OI6beBefaOU5Qe4gh28QRP/3C/D0KU1Uc9lK2Rupe/ZemVT/sHfA3p29Wjs8xWRi3ghb/1hxQuK8WBn+jxbg7u4HeLpzHtB5aL4a4X0KFgtA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:07:31.9353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb131474-bb65-48d7-c786-08df1f0cef0b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018547.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4545
X-Authority-Analysis: v=2.4 cv=VfRir1p9 c=1 sm=1 tr=0 ts=6abd33c7 cx=c_pps
 a=sh6lJpoQSmOZbBTv2jax/A==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=we-QN_a4EPTVeeq35NwA:9
X-Proofpoint-GUID: Y38-Sjxmh363XQrxAetXiQqksFR0d7ow
X-Proofpoint-ORIG-GUID: Y38-Sjxmh363XQrxAetXiQqksFR0d7ow
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX1/3Hx2MxAbgb
 RSdodLhbboVKKaZTP0E246Sulyv0120srPTRl41fQCgWhTkJfdggaOY9z47V/4YM/7+r3gRYiuv
 TTe6m8N1l92kKqqWs6X9oMbiOA84HT8/ifudzKbtTXnTG+KTpZZJaSPTNNnj32JzElMydjWBgkt
 oiCcWkC7xj+wiVoj9aFqKNvK1yWv/JajkUIR0XihsGpfbWFaddzC45rsPGMrgpJT39hv71SNRFm
 Nyz9IFcErltcT3rS99UsrPU0e94wYd7hau8KA+sB43gH4Vbv319tqNSbW+B7dNcBGimD0fB6xXI
 URJZdWwwBmY5p31mUgz14QdvhW5yraVMYPvUOWD3mcb/7qA91wkrRUK8LICoyzGD9Cd5bkS+1d3
 AbZhpcofprPl4T9ZBiDHEeYz7XPUaWtpgrPGMWT9JkMEKtwNZ9lcGAI8u2lQD1P+gs9SG4t99yz
 xFs1OLDE6F3qUYgACdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX045z6a/19XLK
 kz1Ygg0eupjpeIf0THfCwoMwD60DDYZal87xVQ23OLgKaDOhwK0Cy/53JoRq3lrxdqR3na0fgbU
 3AfIlqA4LKMIn7RIDYziVSwP25FhDZo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

From: Andrew Davis <afd@ti.com>

As the only use for the handle is to fetch the info struct, which is only
used by the ti_sci_do_xfer() function, move the info struct retrieval
into that function. This also allows us to move the handle validity check
inside also, saving us from needing to do this at each message function.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-10-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 306 ++++++++------------------------------
 1 file changed, 60 insertions(+), 246 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 6d0ecb77d731e..dbe192142bf17 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -435,7 +435,7 @@ static inline bool ti_sci_is_response_ack(void *r)
 
 /**
  * ti_sci_do_xfer() - Do one transfer
- * @info:	Pointer to SCI entity information
+ * @handle:	Pointer to TI SCI handle
  * @msg_type:	Message type
  * @msg_flags:	Flag to set for the message
  * @tx_message: transmit message storage location
@@ -443,23 +443,26 @@ static inline bool ti_sci_is_response_ack(void *r)
  * @rx_message: receive message storage location
  * @rx_message_size: receive message size
  *
- * Return: -ETIMEDOUT in case of no response, or
+ * Return: -EINVAL if @handle is NULL, or
+ *         PTR_ERR(@handle) if @handle is an error pointer, or
+ *         -ETIMEDOUT in case of no response, or
  *         -ENODEV in case of a NACK response, or
  *         corresponding error if xfer allocation fails, or
  *         corresponding error if transmit fails, or
  *         return 0, if all goes well.
  */
-static inline int ti_sci_do_xfer(struct ti_sci_info *info,
+static inline int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 				 u16 msg_type, u32 msg_flags,
 				 void *tx_message, size_t tx_message_size,
 				 void *rx_message, size_t rx_message_size)
 {
+	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	bool response_expected = !!(msg_flags & (TI_SCI_FLAG_REQ_ACK_ON_PROCESSED |
 						 TI_SCI_FLAG_REQ_ACK_ON_RECEIVED));
 	int ret;
 	int timeout;
-	struct device *dev = info->dev;
+	struct device *dev;
 	bool done_state = true;
 	void *caller;
 
@@ -470,6 +473,14 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	 */
 	caller = (void *)_RET_IP_;
 
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+	if (!handle)
+		return -EINVAL;
+
+	info = handle_to_ti_sci_info(handle);
+	dev = info->dev;
+
 	xfer = ti_sci_get_one_xfer(info, msg_type, msg_flags,
 				   tx_message, tx_message_size,
 				   rx_message, rx_message_size, caller);
@@ -551,7 +562,7 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	struct ti_sci_msg_resp_version resp;
 	int ret;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_VERSION,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_VERSION,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -579,22 +590,14 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 				   u32 id, u32 flags, u8 state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_device_state req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.id = id;
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_STATE,
 			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -619,24 +622,16 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 				   u32 id,  u32 *clcnt,  u32 *resets,
 				    u8 *p_state,  u8 *c_state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_device_state req;
 	struct ti_sci_msg_resp_get_device_state resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
 	if (!clcnt && !resets && !p_state && !c_state)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.id = id;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_DEVICE_STATE,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -905,22 +900,14 @@ static int ti_sci_cmd_dev_is_trans(const struct ti_sci_handle *handle, u32 id,
 static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 					u32 id, u32 reset_state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_device_resets req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.id = id;
 	req.resets = reset_state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_RESETS,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -962,18 +949,10 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 				  u32 dev_id, u32 clk_id,
 				  u32 flags, u8 state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_state req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -983,7 +962,7 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	}
 	req.request_state = state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_STATE,
 			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1009,21 +988,13 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 				      u32 dev_id, u32 clk_id,
 				      u8 *programmed_state, u8 *current_state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_state req;
 	struct ti_sci_msg_resp_get_clock_state resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
 	if (!programmed_state && !current_state)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1032,7 +1003,7 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_STATE,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1222,18 +1193,10 @@ static int ti_sci_cmd_clk_is_off(const struct ti_sci_handle *handle, u32 dev_id,
 static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 				     u32 dev_id, u32 clk_id, u32 parent_id)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_parent req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1248,7 +1211,7 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 		req.parent_id_32 = parent_id;
 	}
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_PARENT,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1272,18 +1235,13 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 				     u32 dev_id, u32 clk_id, u32 *parent_id)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_parent req;
 	struct ti_sci_msg_resp_get_clock_parent resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle || !parent_id)
+	if (!parent_id)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1292,7 +1250,7 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_PARENT,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1322,18 +1280,13 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 					  u32 dev_id, u32 clk_id,
 					  u32 *num_parents)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_num_parents req;
 	struct ti_sci_msg_resp_get_clock_num_parents resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle || !num_parents)
+	if (!num_parents)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1342,7 +1295,7 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1381,18 +1334,13 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 					 u64 target_freq, u64 max_freq,
 					 u64 *match_freq)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_query_clock_freq req;
 	struct ti_sci_msg_resp_query_clock_freq resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle || !match_freq)
+	if (!match_freq)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1404,7 +1352,7 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	req.target_freq_hz = target_freq;
 	req.max_freq_hz = max_freq;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_QUERY_CLOCK_FREQ,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1438,18 +1386,10 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 				   u32 dev_id, u32 clk_id, u64 min_freq,
 				   u64 target_freq, u64 max_freq)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_freq req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1461,7 +1401,7 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	req.target_freq_hz = target_freq;
 	req.max_freq_hz = max_freq;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_FREQ,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1485,18 +1425,13 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 				   u32 dev_id, u32 clk_id, u64 *freq)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_freq req;
 	struct ti_sci_msg_resp_get_clock_freq resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle || !freq)
+	if (!freq)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.dev_id = dev_id;
 	if (clk_id < 255) {
 		req.clk_id = clk_id;
@@ -1505,7 +1440,7 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 		req.clk_id_32 = clk_id;
 	}
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_FREQ,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1533,7 +1468,6 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	u32 msg_flags = mode == TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO ?
 			TI_SCI_FLAG_REQ_GENERIC_NORESPONSE :
 			TI_SCI_FLAG_REQ_ACK_ON_PROCESSED;
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_prepare_sleep req;
 	struct ti_sci_msg_hdr resp;
 	struct device *dev;
@@ -1544,15 +1478,14 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
 	req.mode = mode;
 	req.ctx_lo = ctx_lo;
 	req.ctx_hi = ctx_hi;
 	req.debug_flags = debug_flags;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PREPARE_SLEEP,
 			     msg_flags,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1578,7 +1511,6 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 					u64 *fw_caps)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_resp_query_fw_caps resp;
 	struct device *dev;
@@ -1589,10 +1521,9 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_QUERY_FW_CAPS,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_QUERY_FW_CAPS,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1617,7 +1548,6 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 				       u8 state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_io_isolation req;
 	struct ti_sci_msg_hdr resp;
 	struct device *dev;
@@ -1628,12 +1558,11 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_IO_ISOLATION,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_IO_ISOLATION,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1658,7 +1587,6 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 					  u32 *source, u64 *timestamp, u8 *pin, u8 *mode)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_hdr req;
 	struct ti_sci_msg_resp_lpm_wake_reason resp;
 	struct device *dev;
@@ -1669,10 +1597,9 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_WAKE_REASON,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_WAKE_REASON,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1704,7 +1631,6 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 					    u32 id, u8 state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_lpm_set_device_constraint req;
 	struct ti_sci_msg_hdr resp;
 	struct device *dev;
@@ -1715,13 +1641,12 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
 	req.id = id;
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1744,7 +1669,6 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 					     u16 latency, u8 state)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_lpm_set_latency_constraint req;
 	struct ti_sci_msg_hdr resp;
 	struct device *dev;
@@ -1755,13 +1679,12 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	if (!handle)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
+	dev = handle_to_ti_sci_info(handle)->dev;
 
 	req.latency = latency;
 	req.state = state;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1786,7 +1709,7 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_LPM_ABORT,
+	ret = ti_sci_do_xfer(&info->handle, TI_SCI_MSG_LPM_ABORT,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1798,19 +1721,11 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 
 static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 {
-	struct ti_sci_info *info;
 	struct ti_sci_msg_req_reboot req;
 	struct ti_sci_msg_hdr resp;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SYS_RESET,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SYS_RESET,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1840,21 +1755,16 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_resp_get_resource_range resp;
 	struct ti_sci_msg_req_get_resource_range req;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle || !desc)
+	if (!desc)
 		return -EINVAL;
 
-	info = handle_to_ti_sci_info(handle);
-
 	req.secondary_host = s_host;
 	req.type = dev_id & MSG_RM_RESOURCE_TYPE_MASK;
 	req.subtype = subtype & MSG_RM_RESOURCE_SUBTYPE_MASK;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_RESOURCE_RANGE,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -1943,16 +1853,8 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_manage_irq req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.valid_params = valid_params;
 	req.src_id = src_id;
 	req.src_index = src_index;
@@ -1964,7 +1866,7 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	req.vint_status_bit = vint_status_bit;
 	req.secondary_host = s_host;
 
-	ret = ti_sci_do_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+	ret = ti_sci_do_xfer(handle, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
 	if (ret)
@@ -2250,14 +2152,8 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_ring_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR_OR_NULL(handle))
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.index = params->index;
@@ -2270,7 +2166,7 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	req.virtid = params->virtid;
 	req.asel = params->asel;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_RM_RING_CFG,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_RING_CFG,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2295,21 +2191,13 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_psil_pair req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.nav_id = nav_id;
 	req.src_thread = src_thread;
 	req.dst_thread = dst_thread;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_PSIL_PAIR,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2334,21 +2222,13 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_psil_unpair req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.nav_id = nav_id;
 	req.src_thread = src_thread;
 	req.dst_thread = dst_thread;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_RM_PSIL_UNPAIR,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2374,14 +2254,8 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_udmap_tx_ch_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR_OR_NULL(handle))
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.index = params->index;
@@ -2403,7 +2277,7 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	req.tx_tdtype = params->tx_tdtype;
 	req.extended_ch_type = params->extended_ch_type;
 
-	ret = ti_sci_do_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
+	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2429,14 +2303,8 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_udmap_rx_ch_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR_OR_NULL(handle))
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.index = params->index;
@@ -2455,7 +2323,7 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	req.rx_ignore_long = params->rx_ignore_long;
 	req.rx_burst_size = params->rx_burst_size;
 
-	ret = ti_sci_do_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
+	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2481,14 +2349,8 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_rm_udmap_flow_cfg_req req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (IS_ERR_OR_NULL(handle))
-		return -EINVAL;
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.valid_params = params->valid_params;
 	req.nav_id = params->nav_id;
 	req.flow_index = params->flow_index;
@@ -2512,7 +2374,7 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	req.rx_fdq3_qnum = params->rx_fdq3_qnum;
 	req.rx_ps_location = params->rx_ps_location;
 
-	ret = ti_sci_do_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
+	ret = ti_sci_do_xfer(handle, TISCI_MSG_RM_UDMAP_FLOW_CFG,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2534,19 +2396,11 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_proc_request req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PROC_REQUEST,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_REQUEST,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2568,19 +2422,11 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_proc_release req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PROC_RELEASE,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_RELEASE,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2605,20 +2451,12 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_proc_handover req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 	req.host_id = host_id;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_HANDOVER,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2646,16 +2484,8 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_set_config req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 	req.bootvector_low = bootvector & TI_SCI_ADDR_LOW_MASK;
 	req.bootvector_high = (bootvector & TI_SCI_ADDR_HIGH_MASK) >>
@@ -2663,7 +2493,7 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	req.config_flags_set = config_flags_set;
 	req.config_flags_clear = config_flags_clear;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CONFIG,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CONFIG,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2689,21 +2519,13 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_req_set_ctrl req;
 	struct ti_sci_msg_hdr resp;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 	req.control_flags_set = control_flags_set;
 	req.control_flags_clear = control_flags_clear;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_SET_CTRL,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CTRL,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
@@ -2730,19 +2552,11 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_msg_resp_get_status resp;
 	struct ti_sci_msg_req_get_status req;
-	struct ti_sci_info *info;
 	int ret = 0;
 
-	if (!handle)
-		return -EINVAL;
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	info = handle_to_ti_sci_info(handle);
-
 	req.processor_id = proc_id;
 
-	ret = ti_sci_do_xfer(info, TI_SCI_MSG_GET_STATUS,
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_STATUS,
 			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 			     &req, sizeof(req),
 			     &resp, sizeof(resp));
-- 
2.34.1

