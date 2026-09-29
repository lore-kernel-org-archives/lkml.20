Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC3856E04D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713192; cv=fail; b=SnRx2efeiDnO/5EjEelHeDYab+xuArA4DRRbQ3ru1IOngHzvpjpVe5fG7yKi51XHMoFtmuVL8CNUX5fLgf9QxuKfjHcnV79OLQ8mVbfYCojp7KNS8lGsWhfdiy8R1vCStNBLLJNenDW6fMbgPPziyF/qg45jtyrJnTGenIlVMCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713192; c=relaxed/simple;
	bh=yaolUtCVuZ8/7oH15io2LiCUuKE14IS1QFA0tzTOT2k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=odFtEes+94LJpBv+MMWKmbZAHoE72DHvOvWJwJEt3S7SwdbQqihKHQX7qD4AUtfZ1J0cLJIH6JDRWopmQiUb/zJtZECve64Pa8pliHKFB4kz2jsJ8rsovjzhITVb1QhIM3gek71gjtvPF2Oa24MdA39z0q32PPYUrlNT85vrWmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=pGaVVOvC; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=OeRNKar3; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="pGaVVOvC";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="OeRNKar3"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TGJssf486747;
	Tue, 29 Sep 2026 15:19:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5baH74h3KopzV/Bl3rghpAdBLme+h8K75dAISBVUQ
	94=; b=pGaVVOvC6GVRyOYr1YmwhKBEpmCnt8QHadAxDZimCJ+lDdWZKS0vpeakT
	hwxDgjlB2hWznOvXFiJ28UgStvZ+QZjk4eebLfO1RG963H73LPoBteoux+592yyP
	OWbYCpaDOI8aR2LrM0zyQ3cfkOguSAAlDXMJqeBp6wQZ0WDj7oSt3CIm2TBnnZdV
	oD3nhTJIGcQMNlagPQ/70T1Da7hjT7n3RPstAkhTpCOtJs8FbG2bLYhzoytakobE
	xu707rLGPEvMvJPWUPNOtTlVgq4kkf9/8Nw4MsIz/NX8KuDGw+xCPWMK2lZInKe8
	FgIyozQvkg0LQUYr2zE+i3c/Q63Xw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010023.outbound.protection.outlook.com [40.93.198.23])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0cpc3a4e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:19:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vX44Tse55A1U94cqmfV5ynNWhTTxZsJMJ+koIz+yHW180y6tV8A4RMckzvQjHrRPYwiQ5Mw+n+hGHZt8OpwFr93nSAJY6zx6CoGrPk5VNYQ9orE2xn3oawKdshV4/DG1gtqf2NReJfmGh10tnpiBHo1+0eOSumaghSoGSw3pLL3L/eCOpqDjZMpB+YLijfQx+Yh9Q49oaSUbDwsOLqyBCi2l7b3rRB5UxP/2NWjhKaQWmVhisXi44+fSlhER5Otcz/LcwFzgbudNIco9DYe4MB54E3EW4MWFgsQCJlC/mHn5fhCIaOgUw369YJP/bryUOpSJG/MiqJGugfdj3OUySQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5baH74h3KopzV/Bl3rghpAdBLme+h8K75dAISBVUQ94=;
 b=KX6iNrSYY1xPAFGMyO+jSiZaaEjmbc8Ys+OefoVfuOyyq8voMos1awfFbsdPnS6dzI7wi1YjK0DahzDP2JsKXMnc4m+Zp7SNqCAVrG5HdIw4WpmvgCrDJrsLJcmTPu3/JXYbPYCBuN9GDcboAxSh+premWEOv+zotF03Q/y6EgBeKs4q8PdOK3BnaARd4jceUEdkJwfh9jL2MV0qlrCNN9NMtDzZhTK9B6E5DdJTUzSumWPhg+o3480aOVbPRMC9neCTaPiMvJx1RL444inqE9pPKg+iVb0FKXMHNEq+Cog4WtfyFwtX4FShE/mmJ1SH6oxZYlpmuBfOpmTA4fDMFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5baH74h3KopzV/Bl3rghpAdBLme+h8K75dAISBVUQ94=;
 b=OeRNKar3w8D2kunQg/th7VEqbbeKBEPzg2GG8lNRISPblEuP9klIBPwFwVpJwceUvfcvMBZ9MmYdBm+oQ5OTt0CDOZId2YhK70Rxxc1y1O6xMQNQG7Q83JkTf421n8VgQuQs7zJK+Ryv3TIFhhDL6cXMJ1ZCoSswBwYD7d36ZO4=
Received: from DS1P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:455::13) by
 PH3PPF5FDE66ECB.namprd10.prod.outlook.com (2603:10b6:518:1::7a6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 20:19:23 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:8:455:cafe::99) by DS1P220CA0007.outlook.office365.com
 (2603:10b6:8:455::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Tue,
 29 Sep 2026 20:19:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:19:21 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:52 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:52 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMs1688208;
	Tue, 29 Sep 2026 15:18:49 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 20/22] firmware: ti: ti_sci_pm: Move pm ops into its own file
Date: Wed, 30 Sep 2026 01:47:44 +0530
Message-ID: <20260929201746.4078803-21-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929201746.4078803-1-b-padhi@ti.com>
References: <20260929201746.4078803-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|PH3PPF5FDE66ECB:EE_
X-MS-Office365-Filtering-Correlation-Id: 22321c28-d25a-40d1-d931-08df1e66f2d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|18002099003|22082099003|3023799007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	XmbMtsNe/t7vvc2hM9y/mlBhgE2MGh06Yp4QEVcozuC9ZHzq51lna4y8ZnZXJ3lxShQGHgX3Etd9U9z8K3764i3K1pZkL6O6w6iCMn+u1PacIosSAlnKf1SWWCU8RddkRB7+jJyJVSs4maHSSwu/u/rSCD540YDjKoXRzDN6DpNZQdf/iMeWsEAQExjO3Vm7RtDI3zLgxUtx+6oElj6Je56sdokHs71/xWNZZOftpUr6znO8QKstIb3arzi1T5bSvkQ6Cc8xmhFy54X7g0B/RwdiS9DIo5v1jtU5t1g+IR83FDTrCRPtJjA2fCA4nQM2jZIGO5HTorCgGcTp+5PYYLd/mwV9MdPnNhNe2+FeO3SdBpPTIqQuAuy4O1Se5400oyaOF+S9ckWxg77gdYY/FrKPKhYO4HzLuSlQfqHYPENYkPAg6jVhmDy3ew2oLhsH3XpfmZ4o/ubL41SM0SrlAJyLYI4omzkNhHLeFH/jQw29c5EtZk3xP70m3qUzfJIhDE+z9n0POHngcvvlmVYCXFaaU1it2YPgxGWMMOdaASgRZgFhsgc3uBfeXEjD8X800CBc3yVyJ4fb5GwbuRl/xFddOIhD6sK1HDFU/+tHMZbgO0XMO6QXIT+04ZyoOz4D47mqwyQAJUQPqy0oSqoxpw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(22082099003)(3023799007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zvUqLv+lSdMrEPEfUHeC2o7c3EAZdIx0xvUDwl+ymS5ua+tkfBUwM4K5oLq//yjePRCh4EiK/pglNmxzjGekRY4SsaLFPZTL+C7orySlPo2FdTz5RaB+nvIj/Rlxg1pykDaEZPtfthiuHteI8RODHlDIak7L9QBekbkcaM1hIfz+BYZTkHtFIJ7lpmlVmVUq8ejX0yw8QsQytud0o4JGwHnhU8+loy89EnFPfYXeliSnOkFfPXuartmFBxHz9op591i8ZzPtI+GQKZ8Pc5N1KpTvDwoKAv22HTkSR+aYEw+ME0uYCxHDQA6xS3z3M+efPWIZ4ztoLQbbHOUI+uA1maI1KWUMUFnMuzV/Tq5agGaCe8jZPA/yElLFLl55RdHT12uSCOLa7PUvd4RKfZua2ekO2TOsGhwaNao8ePZALmfujPxk6hZcCPrhOwLRf7jt
X-Exchange-RoutingPolicyChecked:
	JY0LvQCfx+oCD4z7kvRQtXvca5sO7cjiZvrL82MnXGZIycozR0JQ6KBjCN9HdchgiQWTQbr0Sbr3WXtyc1Gd09xv+ldlrMRop4qIpw8VGAUCFvDHFcKhx1WZFneP2Y1SyOzetFrmBbr3v1V2zOp6Hs9yGTNpb3QoQhphBKmvw3BurX1Z7yWJpKgVYDhHxjIRWow5Ns9xTvxpHyca0rg9AGIb1rV6q2kUynzz867YG4HecGQW/tnBLAqqJZ6lGztLXcNY/UPt11dj2OsrAb9iST4gWSjocI1dEIx4e+4occ8vTF/92KNoTB+NRQqN5VrMgjyPDnDsmdqsTvDSLQFzPg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:19:21.8342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22321c28-d25a-40d1-d931-08df1e66f2d1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5FDE66ECB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX8xZ/Ltgg1hkm
 6GCm09caFvmQuJmlP278PXOo7hYcAkDrAFIAWWSTIct1IalfmRy1pQGXw4OCXbuAuFq4N4u5uDS
 OLnkJs1VwLxYqwBYkRoCmCwDFb6o2Ss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX+GPT/28HdCv9
 F89Bc91m3lYl2FuA+djVQtbxM7o3eObe0BQQ3oXjdyjbPnmF1HkItErrY0k6BaPrQlK43Y2VBkI
 7O0pEaAo9S25NW+HUOfZiaqwlfaXvPV265CM3cZD5VYbi3ZhmhfmVK4dA0CLoseGfVl46mqa4++
 Eqx0Z6wqygc+QLbuYNwb1kRz1tF6Kaj93aoBjB4mtiGe8rSREgRnkt63T3dKHAiNH7xmXS39g2w
 g7q/1Hq0b3BthjRi0MqhrPDEvPkanNBxJZwN3n71IeD6pps6ZgCfSNa92hAOqU7c5Dd5mjlXDoD
 1crgOwmhBIzxncQ8EAzl6M/C16VsfH6NHreRktDM7WvSMO+LkekcwuO/ZOwsAMmZZbAD9NDLBgL
 Mk26Qfm3DOs/n34uIXzhO2/A4g1PbgSMTWkJrPOyi8m1hwlMweldzjepgSIjl0tbO7MntlCnLRV
 vC+qwLK2K4ya2ebIhZw==
X-Authority-Analysis: v=2.4 cv=Y4xtIReN c=1 sm=1 tr=0 ts=6abc1d54 cx=c_pps
 a=kGaFF29v6S4cQQ60M6zgkw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=jiaZLWohtit7zQGSWZAA:9
X-Proofpoint-GUID: ntVWQZdOZC0x7gj6r8sPmAl8Ax4WCCZ1
X-Proofpoint-ORIG-GUID: ntVWQZdOZC0x7gj6r8sPmAl8Ax4WCCZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

Extract the power management operations related functions and services
from ti_sci_core.c into its own file. This breaks down the single
large file into smaller logical files for better readability and
maintenance.

The pm ops need access to the TI SCI instance to get the device used for
error reporting. Move struct ti_sci_xfer, struct ti_sci_xfers_info,
struct ti_sci_desc, struct ti_sci_info and handle_to_ti_sci_info() from
ti_sci_core.c into ti_sci.h, along with the includes they need, so that
they can be shared with the split files. Upcoming splits also need
access to the instance state, so this is done once here.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti/Makefile      |   1 +
 drivers/firmware/ti/ti_sci.h      | 100 ++++++++++++++
 drivers/firmware/ti/ti_sci_core.c | 220 +-----------------------------
 drivers/firmware/ti/ti_sci_pm.c   | 145 ++++++++++++++++++++
 4 files changed, 247 insertions(+), 219 deletions(-)
 create mode 100644 drivers/firmware/ti/ti_sci_pm.c

diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
index c4233542ad57d..bbfe73587a3c7 100644
--- a/drivers/firmware/ti/Makefile
+++ b/drivers/firmware/ti/Makefile
@@ -3,4 +3,5 @@
 ti_sci-y			:= ti_sci_core.o
 ti_sci-y			+= ti_sci_clock.o
 ti_sci-y			+= ti_sci_device.o
+ti_sci-y			+= ti_sci_pm.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index cce59cac35ed6..7a707c632276e 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -13,8 +13,107 @@
 #define __TI_SCI_H
 
 #include <linux/compiler_types.h>
+#include <linux/completion.h>
+#include <linux/container_of.h>
+#include <linux/hashtable.h>
+#include <linux/mailbox_client.h>
+#include <linux/mutex.h>
+#include <linux/semaphore.h>
+#include <linux/soc/ti/ti-msgmgr.h>
+#include <linux/soc/ti/ti_sci_protocol.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
+/**
+ * struct ti_sci_xfer - Structure representing a message flow
+ * @tx_message:	Transmit message
+ * @rx_buf:	Pointer to store received message
+ * @rx_len:	Receive message length
+ * @done:	completion event
+ */
+struct ti_sci_xfer {
+	struct ti_msgmgr_message tx_message;
+	void *rx_buf;
+	u8 rx_len;
+	struct completion done;
+};
+
+/**
+ * struct ti_sci_xfers_info - Structure to manage transfer information
+ * @sem_xfer_count:	Counting Semaphore for managing max simultaneous
+ *			Messages.
+ * @xfer_block:		Preallocated Message array
+ * @xfer_alloc_table:	Bitmap table for allocated messages.
+ *			Index of this bitmap table is also used for message
+ *			sequence identifier.
+ * @xfer_lock:		Protection for message allocation
+ */
+struct ti_sci_xfers_info {
+	struct semaphore sem_xfer_count;
+	struct ti_sci_xfer *xfer_block;
+	unsigned long *xfer_alloc_table;
+	/* protect transfer allocation */
+	spinlock_t xfer_lock;
+};
+
+/**
+ * struct ti_sci_desc - Description of SoC integration
+ * @default_host_id:	Host identifier representing the compute entity
+ * @max_rx_timeout_ms:	Timeout for communication with SoC (in Milliseconds)
+ * @max_msgs: Maximum number of messages that can be pending
+ *		  simultaneously in the system
+ * @max_msg_size: Maximum size of data per message that can be handled.
+ */
+struct ti_sci_desc {
+	u8 default_host_id;
+	int max_rx_timeout_ms;
+	int max_msgs;
+	int max_msg_size;
+};
+
+/**
+ * struct ti_sci_info - Structure representing a TI SCI instance
+ * @dev:	Device pointer
+ * @desc:	SoC description for this instance
+ * @d:		Debugfs file entry
+ * @debug_region: Memory region where the debug message are available
+ * @debug_region_size: Debug region size
+ * @debug_buffer: Buffer allocated to copy debug messages.
+ * @handle:	Instance of TI SCI handle to send to clients.
+ * @cl:		Mailbox Client
+ * @chan_tx:	Transmit mailbox channel
+ * @chan_rx:	Receive mailbox channel
+ * @minfo:	Message info
+ * @node:	list head
+ * @irqs:	List of allocated irqs
+ * @irq_lock:	Protection for irq hash list
+ * @host_id:	Host ID
+ * @fw_caps:	FW/SoC low power capabilities
+ * @users:	Number of users of this instance
+ */
+struct ti_sci_info {
+	struct device *dev;
+	const struct ti_sci_desc *desc;
+	struct dentry *d;
+	void __iomem *debug_region;
+	char *debug_buffer;
+	size_t debug_region_size;
+	struct ti_sci_handle handle;
+	struct mbox_client cl;
+	struct mbox_chan *chan_tx;
+	struct mbox_chan *chan_rx;
+	struct ti_sci_xfers_info minfo;
+	struct list_head node;
+	DECLARE_HASHTABLE(irqs, 8);
+	struct mutex irq_lock;
+	u8 host_id;
+	u64 fw_caps;
+	/* protected by ti_sci_list_mutex */
+	int users;
+};
+
+#define handle_to_ti_sci_info(h) container_of(h, struct ti_sci_info, handle)
+
 /* Generic Messages */
 #define TI_SCI_MSG_ENABLE_WDT	0x0000
 #define TI_SCI_MSG_WAKE_RESET	0x0001
@@ -1567,5 +1666,6 @@ int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 
 void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops);
 void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops);
+void ti_sci_setup_pm_ops(struct ti_sci_pm_ops *pmops);
 
 #endif /* __TI_SCI_H */
diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
index 848c040f598e0..60d0d64ac4ae8 100644
--- a/drivers/firmware/ti/ti_sci_core.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -13,11 +13,9 @@
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 #include <linux/export.h>
-#include <linux/hashtable.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
-#include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -25,10 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
 #include <linux/property.h>
-#include <linux/semaphore.h>
 #include <linux/slab.h>
-#include <linux/soc/ti/ti-msgmgr.h>
-#include <linux/soc/ti/ti_sci_protocol.h>
 #include <linux/suspend.h>
 #include <linux/sys_soc.h>
 #include <linux/reboot.h>
@@ -40,53 +35,6 @@ static LIST_HEAD(ti_sci_list);
 /* Protection for the entire list */
 static DEFINE_MUTEX(ti_sci_list_mutex);
 
-/**
- * struct ti_sci_xfer - Structure representing a message flow
- * @tx_message:	Transmit message
- * @rx_buf:	Pointer to store received message
- * @rx_len:	Receive message length
- * @done:	completion event
- */
-struct ti_sci_xfer {
-	struct ti_msgmgr_message tx_message;
-	void *rx_buf;
-	u8 rx_len;
-	struct completion done;
-};
-
-/**
- * struct ti_sci_xfers_info - Structure to manage transfer information
- * @sem_xfer_count:	Counting Semaphore for managing max simultaneous
- *			Messages.
- * @xfer_block:		Preallocated Message array
- * @xfer_alloc_table:	Bitmap table for allocated messages.
- *			Index of this bitmap table is also used for message
- *			sequence identifier.
- * @xfer_lock:		Protection for message allocation
- */
-struct ti_sci_xfers_info {
-	struct semaphore sem_xfer_count;
-	struct ti_sci_xfer *xfer_block;
-	unsigned long *xfer_alloc_table;
-	/* protect transfer allocation */
-	spinlock_t xfer_lock;
-};
-
-/**
- * struct ti_sci_desc - Description of SoC integration
- * @default_host_id:	Host identifier representing the compute entity
- * @max_rx_timeout_ms:	Timeout for communication with SoC (in Milliseconds)
- * @max_msgs: Maximum number of messages that can be pending
- *		  simultaneously in the system
- * @max_msg_size: Maximum size of data per message that can be handled.
- */
-struct ti_sci_desc {
-	u8 default_host_id;
-	int max_rx_timeout_ms;
-	int max_msgs;
-	int max_msg_size;
-};
-
 /**
  * struct ti_sci_irq - Description of allocated irqs
  * @node: Link to hash table
@@ -97,49 +45,7 @@ struct ti_sci_irq {
 	struct ti_sci_msg_req_manage_irq desc;
 };
 
-/**
- * struct ti_sci_info - Structure representing a TI SCI instance
- * @dev:	Device pointer
- * @desc:	SoC description for this instance
- * @d:		Debugfs file entry
- * @debug_region: Memory region where the debug message are available
- * @debug_region_size: Debug region size
- * @debug_buffer: Buffer allocated to copy debug messages.
- * @handle:	Instance of TI SCI handle to send to clients.
- * @cl:		Mailbox Client
- * @chan_tx:	Transmit mailbox channel
- * @chan_rx:	Receive mailbox channel
- * @minfo:	Message info
- * @node:	list head
- * @irqs:	List of allocated irqs
- * @irq_lock:	Protection for irq hash list
- * @host_id:	Host ID
- * @fw_caps:	FW/SoC low power capabilities
- * @users:	Number of users of this instance
- */
-struct ti_sci_info {
-	struct device *dev;
-	const struct ti_sci_desc *desc;
-	struct dentry *d;
-	void __iomem *debug_region;
-	char *debug_buffer;
-	size_t debug_region_size;
-	struct ti_sci_handle handle;
-	struct mbox_client cl;
-	struct mbox_chan *chan_tx;
-	struct mbox_chan *chan_rx;
-	struct ti_sci_xfers_info minfo;
-	struct list_head node;
-	DECLARE_HASHTABLE(irqs, 8);
-	struct mutex irq_lock;
-	u8 host_id;
-	u64 fw_caps;
-	/* protected by ti_sci_list_mutex */
-	int users;
-};
-
 #define cl_to_ti_sci_info(c)	container_of(c, struct ti_sci_info, cl)
-#define handle_to_ti_sci_info(h) container_of(h, struct ti_sci_info, handle)
 
 #ifdef CONFIG_DEBUG_FS
 
@@ -687,128 +593,6 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	return 0;
 }
 
-/**
- * ti_sci_msg_cmd_lpm_wake_reason() - Get the wakeup source from LPM
- * @handle:		Pointer to TI SCI handle
- * @source:		The wakeup source that woke the SoC from LPM
- * @timestamp:		Timestamp of the wakeup event
- * @pin:		The pin that has triggered wake up
- * @mode:		The last entered low power mode
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
-					  u32 *source, u64 *timestamp, u8 *pin, u8 *mode)
-{
-	struct ti_sci_msg_hdr req;
-	struct ti_sci_msg_resp_lpm_wake_reason resp;
-	struct device *dev;
-	int ret = 0;
-
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	dev = handle_to_ti_sci_info(handle)->dev;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_WAKE_REASON,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret) {
-		dev_err(dev, "Failed to get wake reason\n");
-		return ret;
-	}
-
-	if (source)
-		*source = resp.wake_source;
-	if (timestamp)
-		*timestamp = resp.wake_timestamp;
-	if (pin)
-		*pin = resp.wake_pin;
-	if (mode)
-		*mode = resp.mode;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_set_device_constraint() - Set LPM constraint on behalf of a device
- * @handle:	pointer to TI SCI handle
- * @id:	Device identifier
- * @state:	The desired state of device constraint: set or clear
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
-					    u32 id, u8 state)
-{
-	struct ti_sci_msg_req_lpm_set_device_constraint req;
-	struct ti_sci_msg_hdr resp;
-	struct device *dev;
-	int ret = 0;
-
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	dev = handle_to_ti_sci_info(handle)->dev;
-
-	req.id = id;
-	req.state = state;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret) {
-		dev_err(dev, "Failed to set device constraint\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_set_latency_constraint() - Set LPM resume latency constraint
- * @handle:	pointer to TI SCI handle
- * @latency:	maximum acceptable latency (in ms) to wake up from LPM
- * @state:	The desired state of latency constraint: set or clear
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
-					     u16 latency, u8 state)
-{
-	struct ti_sci_msg_req_lpm_set_latency_constraint req;
-	struct ti_sci_msg_hdr resp;
-	struct device *dev;
-	int ret = 0;
-
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	dev = handle_to_ti_sci_info(handle)->dev;
-
-	req.latency = latency;
-	req.state = state;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret) {
-		dev_err(dev, "Failed to set device constraint\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 /**
  * ti_sci_cmd_lpm_abort() - Abort entry to LPM by clearing selection of LPM to enter
  * @dev:	Device pointer corresponding to the SCI entity
@@ -1708,9 +1492,7 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 
 	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
 		pr_debug("detected DM managed LPM in fw_caps\n");
-		pmops->lpm_wake_reason = ti_sci_msg_cmd_lpm_wake_reason;
-		pmops->set_device_constraint = ti_sci_cmd_set_device_constraint;
-		pmops->set_latency_constraint = ti_sci_cmd_set_latency_constraint;
+		ti_sci_setup_pm_ops(pmops);
 	}
 
 	rm_core_ops->get_range = ti_sci_cmd_get_resource_range;
diff --git a/drivers/firmware/ti/ti_sci_pm.c b/drivers/firmware/ti/ti_sci_pm.c
new file mode 100644
index 0000000000000..6ea09a7e342e7
--- /dev/null
+++ b/drivers/firmware/ti/ti_sci_pm.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Texas Instruments System Control Interface Protocol Driver
+ *
+ * Copyright (C) 2015-2026 Texas Instruments Incorporated - https://www.ti.com/
+ *	Nishanth Menon
+ */
+
+#include <linux/errno.h>
+#include <linux/soc/ti/ti_sci_protocol.h>
+
+#include "ti_sci.h"
+
+/**
+ * ti_sci_msg_cmd_lpm_wake_reason() - Get the wakeup source from LPM
+ * @handle:		Pointer to TI SCI handle
+ * @source:		The wakeup source that woke the SoC from LPM
+ * @timestamp:		Timestamp of the wakeup event
+ * @pin:		The pin that has triggered wake up
+ * @mode:		The last entered low power mode
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
+					  u32 *source, u64 *timestamp, u8 *pin, u8 *mode)
+{
+	struct ti_sci_msg_hdr req;
+	struct ti_sci_msg_resp_lpm_wake_reason resp;
+	struct device *dev;
+	int ret = 0;
+
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+	if (!handle)
+		return -EINVAL;
+
+	dev = handle_to_ti_sci_info(handle)->dev;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_WAKE_REASON,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret) {
+		dev_err(dev, "Failed to get wake reason\n");
+		return ret;
+	}
+
+	if (source)
+		*source = resp.wake_source;
+	if (timestamp)
+		*timestamp = resp.wake_timestamp;
+	if (pin)
+		*pin = resp.wake_pin;
+	if (mode)
+		*mode = resp.mode;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_set_device_constraint() - Set LPM constraint on behalf of a device
+ * @handle:	pointer to TI SCI handle
+ * @id:	Device identifier
+ * @state:	The desired state of device constraint: set or clear
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
+					    u32 id, u8 state)
+{
+	struct ti_sci_msg_req_lpm_set_device_constraint req;
+	struct ti_sci_msg_hdr resp;
+	struct device *dev;
+	int ret = 0;
+
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+	if (!handle)
+		return -EINVAL;
+
+	dev = handle_to_ti_sci_info(handle)->dev;
+
+	req.id = id;
+	req.state = state;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret) {
+		dev_err(dev, "Failed to set device constraint\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_set_latency_constraint() - Set LPM resume latency constraint
+ * @handle:	pointer to TI SCI handle
+ * @latency:	maximum acceptable latency (in ms) to wake up from LPM
+ * @state:	The desired state of latency constraint: set or clear
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
+					     u16 latency, u8 state)
+{
+	struct ti_sci_msg_req_lpm_set_latency_constraint req;
+	struct ti_sci_msg_hdr resp;
+	struct device *dev;
+	int ret = 0;
+
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+	if (!handle)
+		return -EINVAL;
+
+	dev = handle_to_ti_sci_info(handle)->dev;
+
+	req.latency = latency;
+	req.state = state;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret) {
+		dev_err(dev, "Failed to set device constraint\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * ti_sci_setup_pm_ops() - Setup the pm operations structures
+ * @pmops:	pointer to TISCI pm ops structure
+ */
+void ti_sci_setup_pm_ops(struct ti_sci_pm_ops *pmops)
+{
+	pmops->lpm_wake_reason = ti_sci_msg_cmd_lpm_wake_reason;
+	pmops->set_device_constraint = ti_sci_cmd_set_device_constraint;
+	pmops->set_latency_constraint = ti_sci_cmd_set_latency_constraint;
+}
-- 
2.34.1

