Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3652F8EA1;
	Mon, 28 Sep 2026 03:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565757; cv=fail; b=JbxxFc1gLs1bqHBln36BjQUwfLXOR1dlSauhfU/06nvsWn85hPwA4PttN+9n2BqfGXxCuCWXcSR+ERKsfO02y48PQ1rwtYBv57FOP2reamD6oaUNLJq5WH8nwb9QoxvFRl6CSAUq9oi+CmjEMYS7FiO6c7p+rTgymL13ZNBlyjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565757; c=relaxed/simple;
	bh=wxkdoRCCtzvfxOUZROowMZ5fY7xVqMry7BH6LBOVIQw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RpcCfPaZ4rDy6MMXCvxy1iWj33nnyWfXBpNzezXsA4kYp/9fKeHATeePPswhdoyQPt3YTQFr9FbuC1bnzWMtrMF+KoKe/JgusXIW0EIOo0YqMLh4GIKYQnz64GO/GwqlrfkvpQs3RxfKVdyK+qNjkzRfQKn+fNrLk1rlAnv5Ti4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Pf0iEtJP; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NbYtlMs9; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Pf0iEtJP";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NbYtlMs9"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RLORPe2806506;
	Sun, 27 Sep 2026 22:22:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=TvFonLAYA6qrQ
	dB68Vmd07elHWkp2cIL7qlKHk8oDF4=; b=Pf0iEtJPy1Ijpi8f4dlxNJLLwlfga
	CD77bxu5jD4BIAv+fTwJBUg7VaWDiGh7fy5lNW32sJFjA4rqBiebVjk1gjqw+HhI
	gDjHQXYRTh/a4zlSUkoOZPxO/1HiZI7breaxVUpm+t0meJzkJM6bbiXe23mBN0Jy
	a/HCA2TTqMjL1XJGC6sk+nUu6qyE2NkROpUgGR/AjGYTLIgACZOoyvL7B3B1/JGe
	lr+06ouBVjitBmmaS2QQVcoFJNNH3VFn/IB8CTvUxODlbWQx1Gz2ky38deABhmiM
	c6ueHw7FbBll/ShzeA934v60kmgZtWBUgsuuVlPsprnYRMZV2RXwlEcXg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012009.outbound.protection.outlook.com [40.107.200.9])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxwe5kjk1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 22:22:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TURDKFxqHgKds5F9FATn26exnGA1d6i3yr9p0ccwtMo4SvxvV9AqbUoKIt/OxCa7lvomKdXo88izExGdP3sEDcsBIbtymHb/XRKVjyhTsOsli/XJGO2MGhEem5teoqkwjq4gbd4Z5bdL2S/O5s9KjN+qdOwmQwfY7wTH1X77sOCfoGWk+x49vvFp+cG7Nq1b/0NODxoUD/kLPO8QgALSlLGt1GYCtRZCmIkMD7cKwPB+7vl2xNdZJPdZRiEz484v2XWHobhpC4SQKxanowdVKI+JAhJ7hUMURI1bjb/NuA3DERKuj6IGEEVcwC48Lmf9PUAu4TPD5STW+aBoJIVguQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvFonLAYA6qrQdB68Vmd07elHWkp2cIL7qlKHk8oDF4=;
 b=Et8Trr910kk/YPrDUmf39gRsvo5X3JtOPXaOHb/q406qU7832N6y7OMhFPbfLiVkkAFQSeGKEOag3KpdtxxTkUDRBmHA+FAXZMuUGQKOhtZzeJVdIH4A0G09UoF+NYhT5Znhxkib6fdgwEX0JlLO3+u++68NVcmsydLVa2ZqHqvhKCj1AQPXMwSCr7+Ljyifl2iZu5XtPpNu6xJGPsTOK2xqtO/vGB/7EgyTjK+2gIjTO11BclJk2l6UdpitrfuLE4iIczpZPLFtqBl4IW+83B06stTV7dncwVfgWAWGOyGlPRBMaj2CA7PZQwkti4yACr3g63J/b1hp7E2pprpqSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvFonLAYA6qrQdB68Vmd07elHWkp2cIL7qlKHk8oDF4=;
 b=NbYtlMs9YBsA/OL90RDRKa7utwc8hVBC+mMvpUX39fGjCgjP6NmIUzSzMYgInbGqiw0xmT+ae3SPVFz0Kq4WSmH0MUhFG919LXhC9oWN6FkWH1d4QR+QVHf1SD+VVMhdQEzrBdkzP890GDROM2PtlURasbYHLXCC+hRG8i2oWis=
Received: from CH2PR15CA0018.namprd15.prod.outlook.com (2603:10b6:610:51::28)
 by CO1PR10MB4673.namprd10.prod.outlook.com (2603:10b6:303:91::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.6; Mon, 28 Sep
 2026 03:22:28 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:610:51:cafe::4f) by CH2PR15CA0018.outlook.office365.com
 (2603:10b6:610:51::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 03:22:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Mon, 28 Sep 2026 03:22:27 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:22:27 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:22:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 22:22:27 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S3MNu13209268;
	Sun, 27 Sep 2026 22:22:24 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-adivi@ti.com>
CC: <hnagalla@ti.com>, <jm@ti.com>
Subject: [PATCH 0/2] k3-am62p: Add MCU SRAM node and Reserve RTOS IPC memory
Date: Mon, 28 Sep 2026 08:52:09 +0530
Message-ID: <20260928032221.1072316-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|CO1PR10MB4673:EE_
X-MS-Office365-Filtering-Correlation-Id: 771d5dc7-078a-4342-0a7e-08df1d0fb952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|10067099003|56012099006|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	OQ4wvApB54x++e+tnaHTXYgpnejtg16qV7Fr0ahwb5g9MehvtddUpxDOVKQTjSGoGumh92pNHgFdUUUziSsL4sO1a3qltR35BpqIl8PLiNO551BrI8k6LfoePcF5eryKduUSh7tD4AzobhtkUbA/LqI7aoURPRqvUjvOAvHljUmFAxWy/A3GTRN+x//k1sVv4ngGZBkfmw5NV0VFuOeI/YqTDa6E64IWM/6P+Rcx0S701OU8FYWAQMDfgxKs+3z+4uQ+YKhnryPN97ziiLzwxT+FNm8mt8HO9+4RQE88UA6WbnWJJeDgRE73/q4YB52L56SHHq5F/CLSa+bJ2yMdBY823NSoxArZzgu6zPGeHPyT3uVLLU005+SxG+0QE8ddvhOsu1GOaXCOt1xjKe6C7ufqvkMX0q3D+JmnYC8v2EqaeNZ+axlQxhBQ7jzNAwc3TXleX0VBn7H0/G0AB1ha5mN+ktGbezU3JsOUl/OBVwyAk2P+dAW0C84HqY+1BfEke1lVsyg4QBZLN8cleol6uu9NbmPmTpKAVODuSnfzx7ULGWyBNfue2oYdZDmXGnQQ9aItUnvIFktsFmDL3dkYXqpS4/y0BxpCkSl2s1zkMYfsiaxGZ7BHj+XN6B8Wx3hs1lmwLP2Dt/zjNMRiZtLl3Rax2xI5/Gvh5cMhEeeNTFXabKiLVyqXkoQ7dkhEB2XN7sy1+1smFkehQHkBn1TnU+ji95fRzszuSw8ncPCiaZkirsn8pWoYTiKVTPaXGyPv
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(10067099003)(56012099006)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b8N1JnvOgBVcnaeOPD9vYYHCNRVtNHP5djpCo3v31d0UVyRUP0cTOz/vLtRdSgutHjuXWeKFcVqpMem4a2iXlkNXWPmm/9T61j+KRpM/TGL6QcxNHY8ToAEMrRCMFTo273cPhUZjBjFoc6xRBTm43PzLX2njL14u+TcN2SD0Ux/p2NDVLT3cADFyt4FkgsrIhbJqNXU5wPvSumJxqKMcKgC17SFDhKX+Y6T4YswpDx9CN5NMcG8p/2Z6126rLpNWbGYnaTDD0Os3sS5TlBARYwtvm00CBV3dp59bpUrg5sRZrtVk5ZZqfmh381N5qtnTsz2QPKc1Jt9jOMTGxPSMVpljqH1jjHGGMy6HZKm6U+KubXQHsUYgk4ZwH0Vm56a8clvxWYRWWGZ6a8S03Et1ssb6qo3jJLEKNZ5/mrX3aMXan60oB9EYQ/8qeCfufINm
X-Exchange-RoutingPolicyChecked:
	33+fPbgzppsSSpE5rLvPC2J0IoWzo4L1B56UmFZdYsvCpdPSwqFPU5T2gk8QYDSv0OE+XsHF3TM/wC9OLm/8oS7DS3C8RdD/6spfoQrqbUIyrhsI+XOhJ7uVG10EMdfUAD8p8N2facHgVtElc+mlVXMBqEGaaWsew+2Ck4vCWPDG0EMdlXEHAj7rDBnX6u9Pb679I0NQ9l9HkGgJWe5SIGjWgXhs/friI0nFG7KOlTNDmoJWBHT3vRjU3je8/6HJ+JfRUVyYyV0DchO+7eoU79zgTZvjqPqW1cfSqA1lVQt8t0/VZd5HwTRBTrpfnLP29XG+s2kMOJ7wMuDNmAvm4g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 03:22:27.9714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 771d5dc7-078a-4342-0a7e-08df1d0fb952
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4673
X-Authority-Analysis: v=2.4 cv=aeP0Dhot c=1 sm=1 tr=0 ts=6ab9dd75 cx=c_pps
 a=xqAAW0zfUN0YSepx5EhcMA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sWaHgeplREPVJFHn1wYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX2oQHe6fr4bBy
 9DonQKFg8QylAZ0DMzls30fHsZ17IdyNn+3OOGOBvr3eS7UwSd7RBUcG9Jqa+rxoMswXbKCknvG
 DrmF+ggX7ItUGTfuoLnOAYyn22SRk0pdULT0Pi7tdrDhnwaEKr8CPt+SEVQDj1dXTwUcA+PMixb
 j13C3D9fgLzqfdaBPvnQA+PVLqkfLk242cemtVyKWjVmmjy92f3ZuDCTA/M6H97a4CMRnl0UIrx
 NRujf6d9iddpL1GurHpryKGF+i4zWhv6H39FLRGYiRgvrGpyf63VY078YbPT0bJonkPj0OcAJwC
 fV3d6CEme06YrC/Kd7LyEHlDoCSDcMi8Okjh9sahJCJ328okBzZmnw7xdc94yXLhDddkQmuv0Fe
 izph/gVNLUM/43D3kK9b+P5hQNc6VnD950340EJ8SF5NxeISWalh+RHGvNARGN0E7Se/iEJf6fA
 R6kAum9DGEejliB6x+w==
X-Proofpoint-ORIG-GUID: Wj-Qopz8tZuPGvYq7FQQ2rviWUDJqv6X
X-Proofpoint-GUID: Wj-Qopz8tZuPGvYq7FQQ2rviWUDJqv6X
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX4bnghchH02Fp
 fV213FiInMae7nw/4OmPGpra8N5d/kfYhF9VfPJqLH4r7aFCFzYzYaxanoX60Bje2gsfiZMmPWU
 PO/LxVlXQDY3olywqjvKRruVMQd4Ako=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280013

The first patch adds MCU SRAM node to the device tree. The second
patch reserves shared memory for RTOS IPC communications and makes
the MCU SRAM accessible to R5 remote proc driver for image loading.

Hari Nagalla (2):
  arm64: dts: ti: k3-am62p: Add MCU SRAM node
  arm64: dts: ti: k3-am62p-ti-ipc-firmware: Reserve RTOS IPC memory

 .../arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi |  7 +++++++
 2 files changed, 19 insertions(+)

-- 
2.54.0

