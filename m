Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0895158AE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784463; cv=fail; b=cVav63ONfxSyxOQNWZOu34T9FfPvwbFp/iXk2ywgPTiXyPL7zobJnTuMfoj8eHhyk19MoKNSeJlF5bgs7GhaFMh7zF+NbQhzy/OtCwXml1rui8DRYzYm6bw/wz/trY+WYtLFLWa+NUZ05glrd/rLBKqAjeq+cZLW+lPJQbA2G1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784463; c=relaxed/simple;
	bh=FjyrCjqQOO+ylelZrm4Gg9m/sn6Fb+56PI0TYc6Cqos=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jne2ExjLCfIJ+fHktst3XigvlavIhMt0Iy01mzk9lSlGuXZJipNfphhFDgcdvlAKALqAm3dqgKPFtZTnC7C59JcigDkzzDUjqnGUXm0bD2MSBzdtnaQLSJWItA41sfMy8d+plDSd1n2LP3yVCv7z7L2JayDJUWgXzp4lIvwX4Sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=mEHHvGQR; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=D/uRLclr; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="mEHHvGQR";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="D/uRLclr"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1MdB3057476;
	Wed, 30 Sep 2026 11:07:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=23X7ZpVuxZg9RYxL6J4V/g/vPkRAqakH2zhkTVgBK
	ns=; b=mEHHvGQR7lNiSfULjF5XvIDjHomi+OtEVvaeOFF+m/WTT2+eRxQpCUOV1
	u1069BF+R6bQ3ZTyaVoq42p8Xwjkms5IFhNnj3DKVOzkcFXNGAydpMjjyzYVFF9K
	deK+My+6Dk2T7DL5sdnBtjG/eRZ0Oh5e2D7VmMbcE58DvxDLFHCWxrtZCrmu/uu6
	pMy0PBSf+H8CLatR7Y5EhXlnnUC696t0SGULEh9fFguc+F4hJWE2bIJZzil0hZo3
	46xMLHtRAeyET7A2VUSh8FAOVT7mwPNtQ74LB19bMKwF2EmzFFvEnfT67dQvDuAx
	xTpvFx9usUvNWSfpJy74L79+P7SeA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0m9fehwq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:07:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPFxPaWOsAR5NcOKU2NIsEhniRvgFwZitC1To7CxMk2x4vgpmi0FH1cmBCX7cCNjftFdZ1mtjFVrKcs585YIvec9qV5zOIaos1JLRQ5fU6XIBPTwJeeKvnJDhyPV25VVfdueWxv/BUEdU+X5mZf3mTFCTC5yfpvFLMKPW9MrA8pSBKwWykms5PwhkIwXt1cyUGjdTXWAFDKt/dKBVs/X/PYpWGszGYB5PNV+yoLgEF6Ss5gFhmYuMTZypYwYJtBsgszD9yxQAuGmM11qYjZ+5x9QeRH/UHBXMDd0TlTOixPhBXLPVBNBg5gaGIaKt0fWncG1QR21B2tQUwSA9OzpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23X7ZpVuxZg9RYxL6J4V/g/vPkRAqakH2zhkTVgBKns=;
 b=qiac2SvEIRvG5VGpSiEQicbfQsCiVK2E5XuklZfnY37RcOE/5/8/YdXIDEoLA+pShBQq7J9gqmyhD4jSdl9t5vt2J3hQgV4KFecRTrjhokesH7cpt6J16HJfvJ4++C6bSiQPmDR3wXevCbZLm53LXiI/TmHLLDUGzBRLdRaqhl//JXlpPyivajlfYtWjyT6yrYcecVG8SgkZ1ORDv+3d12VBT9GP1aQGF3QFRm8vjBQzb1bh7o56e+PAf1Pa1O2vFevV2kdllKc5eEKdHAgiyA5AiMlclg5gIrfJrU4/MEAV8T6GxntUaMAkGm5SBj06jwLlRzmCGdZGSUCiqxIX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23X7ZpVuxZg9RYxL6J4V/g/vPkRAqakH2zhkTVgBKns=;
 b=D/uRLclrwU/oup7ktg5Z5R/4Ys6ks+RbF5X9pLE/dhzxxv1PFZxSolGTQSGyEvY31xtvibMNCBZSuyNikVn3LwROaJ7ZaSuLhcfUtknpcMA7JQvm6c16gQxiwpwxBlbPzqDm9dxFLetn13BH/qV0s8QXvR15qmsu8z984W6cPLY=
Received: from SJ0PR03CA0142.namprd03.prod.outlook.com (2603:10b6:a03:33c::27)
 by IA4PR10MB8660.namprd10.prod.outlook.com (2603:10b6:208:561::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 16:07:26 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::19) by SJ0PR03CA0142.outlook.office365.com
 (2603:10b6:a03:33c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed,
 30 Sep 2026 16:07:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:07:24 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:57 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:06:57 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68WI3425232;
	Wed, 30 Sep 2026 11:06:55 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 15/22] firmware: ti_sci: Use pmops fxn pointers in suspend/resume hooks
Date: Wed, 30 Sep 2026 21:36:00 +0530
Message-ID: <20260930160607.2674980-16-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|IA4PR10MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 54848b9a-0010-44f6-9da1-08df1f0cea96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|13003099007|6133799003|10067099003|56012099006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	keEldM6gDRzJBLjpXhKUJnyyJn1Xc1tGA7K2/At4T7wEp9B5CrVdjmYzkG3C36dOgxQDskJSXkA0RPe9ZEaFCwDzTORORLsllV3ZyUhxptg5rRVGRwQ9oNyZvJ6AtIl1jEWdOouIT7KSkIoN/p3Zs5HIXl16YffGM47cC6p0zCgya4sVb44JhPzNYuGu8t81wtFuQhWzDQT0d5Jnfzi2AOQuyfVVWHK+Sm1I7VE1MXfdmoxBUq2Y121vbORis0eQTm8FshsWKrS37hiv9HBu13KdHWB4GTKc+QEXWybLIlOhIoelypIJDrQKgYqDV2lXvtoLTqrkRJ6D78a8TjeUt5M9fad+zmOi4WYz1W69FoQHT6muIe3e07hEnMY5UIIVnhPKFcIv+svN0YkBO1oWb2KKiRU/ECzMDDefSPm5iqFMNOzqvUC56elomnuEh1tO3FtgiICpzWIdO07WZl84olOiJsVbPCl8p2g/ki/91H86mUqpW5s2Iv9WKrS8R0e9WKMVVPFR9XJEPwYgUW3fIlOCLKZ2MZGkir7g3y9CdPigxWUuHHW25dTvxJUrUmYAHUb72ark6p7r5zn6uF/HRAu/4SSw0Ryjdqz6Z0xoAKR2te0Iv82Upljqg5W4rZtzDfSMnJ+jcdwyqm3Dt1ZQ2lQ1jjxLiKEKsXz8A53R89UuoCYpbSLj4suJQtctvdzUcvG3nJUplTNdXLa2Kt4F3g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(13003099007)(6133799003)(10067099003)(56012099006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lpd76G0jgyM12S0YO5HeyeUE/f7dsDw5ad982tjea4rgzYeA4hfGQAjARekBJyvzFbps4q/QsM37LQUx9ncmBdc3gLLtIn1MW85ixXNTHgqpJOPykDtrrVM9O/LflpR91zAPeXu2u98YcMueOm9V4E3j9JZafGAAegio+t/ZC61I+2H8Sq5sKWLEzICTDBqa+0QMMcWfM8bWxgpgVJktebg+i44G+mMYhN0uiTAOx9tSKiM/Ym1HxC1WIcHkYST28rUv9yOmmci0/t2DJJLgoYClyK80OGCZI6l9zZn/AXL6PMeIfpc9MrpECAqvq11aeHIZIYsZ494R26ri5mIrqCLvX013sO9qGnnLxJyuJ31lkOM6Q63hDX5CE/RR+Jo6Qjelo2L38dr1xZDbDrUVjxpOfZaEZrTo4HF6QtpbL9rSBUNlcUMtvpVvpZdxLpnk
X-Exchange-RoutingPolicyChecked:
	SsEu3GPM+7O6QSr7r4c1pkSlnL2IH3yJUgWltdj5I2LiZt7jQ7U+lZp+6Rc6lPNb3Dda32SDZCImtYCexAHE7C/cQeW5+MmjJBSXOUhZvuVbUVgjSro9oJQ7YDhdGkE1ECCjbLCxC8Z0n6OzXFjDtMJsWbeQNACYN/5/hHrSHz8vsNYEcjqqot6t+tSCTRplkgvVoxacXXSreVP2Oe+R5Wo2We5BzLXWVEdy3Kgmo2YLAPASAOmkqwSyDQfOAtgR5J9CAjrIPalc8TEpeEcHzEDPJ5gxAh9qxmRTD0m8v/Sg44e78iFvK1X7WhCBDqsqUQeJiPoBtIY3f5UAXlEpig==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:07:24.4422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54848b9a-0010-44f6-9da1-08df1f0cea96
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8660
X-Authority-Analysis: v=2.4 cv=VfRir1p9 c=1 sm=1 tr=0 ts=6abd33c1 cx=c_pps
 a=os0lWWs/UWv4pnmIIs5naA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=7QgvFepopYO1C1vgVtsA:9
X-Proofpoint-GUID: 0DhZ12VvEs7yNyt7Yk0nD7hf7yJq52Bp
X-Proofpoint-ORIG-GUID: 0DhZ12VvEs7yNyt7Yk0nD7hf7yJq52Bp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXz9UjBWmR0e4m
 zJwQlSZlxg3Q7Tp5/OXXk4POZDMgN5y4QEakB0nPSTZMXnCeHM73Sg7hKC+KhuQh2wfMUAwauiH
 A1njjem2IzIOeAqVp6+imZ8Ktw0yHczjBS+yKsQsbUospGV37GULvDhcArNNVT1JRblNXOh2L62
 YOd5wkdhy//zWHXAveSdQ9fLv5s2KrxzIe7KDM+1cANzcFA68Y4uokaLw9bA7BVU/UYn/svHamT
 nnrDg3fv5QF3jTOHwPMsCCZi6h/AbaHsQ9Flt8KVhPhORafIajD+sLXhQfXf1g3sW29x0KFTBMW
 gxnlWap4uT0GOc8Mk+r6az5c06qmel8LhNWuLQCUw55kftU50D2CW9iRqRcqIUwmMjQJZAHEGEH
 BX4wx6JakomF85WaL/LOU/vXfssoeuK0jEgK6q6cKvIzQ6ABHv+EGMhah0sONQngzMtou6jn9Ze
 f0Ly8HMs9W8j3QBk1wA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX0m036LQc3TjE
 ohXsj3JscKMrv9bYHqshte1USwZrzNCKp6SDNmdzYreots5TW1tum1+W1Y9m1yk3MpA0GKwDehU
 k6J2dlchCBTuwbaGz07OQBh8bBMXDSg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

The suspend/resume hooks invoke ti_sci_cmd_set_latency_constraint() and
ti_sci_msg_cmd_lpm_wake_reason() functions directly. These functions are
already exposed via pmops function pointers and pmops is available by
the time suspend/resume hooks are executed. Therefore, switch to using
the pmops function pointers instead of directly invoking the functions.
This also helps in a cleanup later.

Since commit 60357991f6b9 ("firmware: ti_sci: Introduce Power Management
Ops"), pmops->lpm_wake_reason is only populated when the firmware
reports MSG_FLAG_CAPS_LPM_DM_MANAGED, but the resume hook bypassed that
by calling ti_sci_msg_cmd_lpm_wake_reason() unconditionally. Guard the
call with the same fw_caps check which should be the correct behaviour.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-16-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index d22686f9346ea..5d3151571ac33 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -3154,6 +3154,7 @@ static int ti_sci_suspend(struct device *dev)
 {
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	struct device *cpu_dev, *cpu_dev_max = NULL;
+	struct ti_sci_pm_ops *pmops = &info->handle.ops.pm_ops;
 	s32 val, cpu_lat = 0;
 	u16 cpu_lat_ms;
 	int i, ret;
@@ -3175,9 +3176,9 @@ static int ti_sci_suspend(struct device *dev)
 			cpu_lat_ms = cpu_lat / USEC_PER_MSEC;
 			dev_dbg(cpu_dev_max, "%s: sending max CPU latency=%u ms\n", __func__,
 				cpu_lat_ms);
-			ret = ti_sci_cmd_set_latency_constraint(&info->handle,
-								cpu_lat_ms,
-								TISCI_MSG_CONSTRAINT_SET);
+			ret = pmops->set_latency_constraint(&info->handle,
+							    cpu_lat_ms,
+							    TISCI_MSG_CONSTRAINT_SET);
 			if (ret)
 				return ret;
 		}
@@ -3209,6 +3210,7 @@ static int ti_sci_resume_noirq(struct device *dev)
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	struct ti_sci_msg_req_manage_irq *irq_desc;
 	struct ti_sci_irq *irq;
+	struct ti_sci_pm_ops *pmops = &info->handle.ops.pm_ops;
 	struct hlist_node *tmp_node;
 	int ret = 0, err = 0, i;
 	u32 source;
@@ -3262,11 +3264,14 @@ static int ti_sci_resume_noirq(struct device *dev)
 		break;
 	}
 
-	ret = ti_sci_msg_cmd_lpm_wake_reason(&info->handle, &source, &time, &pin, &mode);
-	/* Do not fail to resume on error as the wake reason is not critical */
-	if (!ret)
-		dev_info(dev, "ti_sci: wakeup source:0x%x, pin:0x%x, mode:0x%x\n",
-			 source, pin, mode);
+	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
+		ret = pmops->lpm_wake_reason(&info->handle, &source, &time, &pin,
+					     &mode);
+		/* Do not fail to resume on error as the wake reason is not critical */
+		if (!ret)
+			dev_info(dev, "ti_sci: wakeup source:0x%x, pin:0x%x, mode:0x%x\n",
+				 source, pin, mode);
+	}
 
 	return err;
 }
-- 
2.34.1

