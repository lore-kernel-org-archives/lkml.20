Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7643403ED;
	Wed,  9 Sep 2026 17:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975616; cv=fail; b=ntzTVv8btjbBVadx3LJh8Vu/X93zE8YNUYPlI5bGVR9qVlNH/Qa7xjTS9F5OtY/TW5nFh1/uxo3jPU2R26FFkfC6XrGfMb0N4N6t4TX+ne5//0Hc1XJUaOILsr6sQxeeI8bgaBo+7RotoaX+l+i3ICvHGBjOA5kvI+yHCkm9Hpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975616; c=relaxed/simple;
	bh=hoXFiYebC3ZNNxUVhYbmKxc2Idkwt7eIuLpSTfjjp/M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DDWjsJBDGCObfTwHbxLKtHk4VRw9davl1pTkHz+xzLLT2F/CtnHQg6PgWBJLG0ShuE1mf33/IBGO/5NZ0rmnAMeqr1SULpmNQ4/WXG8p/OeGGhvsiaU33i0bxzg829c9pfLu09VYuzEA6sjrKDe41FevzQxX7Pd/RGsBMGsReGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Z6r59WbC; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=utNdFZc5; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Z6r59WbC";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="utNdFZc5"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689HAwvK861906;
	Wed, 9 Sep 2026 12:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=czxb1UaEs1JKA
	LiLUU4ufSqRyxAzLoH70Q2c+3CQisg=; b=Z6r59WbC43ah6EcXH6f6QucI+19Wy
	eYsXh8TXaY1LmwvNtUF2/LGP+zf2afYCxssYYFtoQ6/3JrtnbxkwsIdzs5XHcbal
	eNoHfL782N97AywTwE6dpscrM2v3UinE4Pl8KCURgpJgWAZqZtYn38o/98mgiNNC
	yVrdQycxCZvA/zRKfwh42ImXKBbsl6+XquaZ44UzAx6uyrlqwmC4fUDlMWDoEqJX
	at4Qxt0qkNrZa4M+2nl3/ClVWiDdUP/uguaCeVsC4MbvfokMFP6SBqDVz6bk1pTH
	WkrVSH2GRG+i9DQYqSoO7uV2sG27BWo0ChecYbuyvY30SAQzqu0IJNdfg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012011.outbound.protection.outlook.com [40.93.195.11])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gk4a8kadh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 12:39:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUzDwuv6htQcq4cEPL24+Pw3PWCleXiGBxrE5qzi8w3jj1NoqJ2CqkWRfIXWEMjKV96unQCI1WvkCRa+wuMhB5VvJaJ6LACNYVCiINBbTGgM6Edihyjn4OMEQcqqI3qk3IR9AZ8cto6vR4SwUHVx0pEW4oRUoT+kfgKKiwVJ7TfIJU0goQrrQh2w/Y5B0OJ2OY997MMvdvdg2nfk25GaceTFKNjkPZ6j6Z/QGGjhvkCpYn4uZ5ZjNfxKVOmw4j6mbUUNd0EirhyR8UOqXTCVL2XjVgntrppk7EDX/6GMOhZEF2Y+13d/rBQNDg75p7OTV0F2M80MlgKdu1j/64yhMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czxb1UaEs1JKALiLUU4ufSqRyxAzLoH70Q2c+3CQisg=;
 b=hZrIeuY8v61RzZ8N4gyuwjIVKlJ6oPTCe4XNZzoYAqUBDYz9za0lGilMvPO2kqebsx9ZfqXpEHMoU3c6kuLs5R2/5atGZkGCYKH3+YrAN10rq1d+bfIzOu/1pNx6dm80fnIXYocrIAP03EG5IuMqTaUaEuqQHKq0ZdKzhH05xQxb0ph4ySQKVDtpirRuoEB+DTuXdlv/1kfTMGDwsj8LGPAF8biYyGbfulXKXmwVNHPyaGPbxyj1tDg9/EwcgXNy0bswJOgLCA+Kq1ATmJFpEAJRDemvAMgn3TPK9TBpRdtMZkmz59Dds/96w9zdrFmjRrhNEhtW9QMTbczE6ZB/Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czxb1UaEs1JKALiLUU4ufSqRyxAzLoH70Q2c+3CQisg=;
 b=utNdFZc5g5hC1WHTfuF9COeJhPO7wSAKBrxJ2yczxzkVr1vyZPuQfzZYnmwA7jj8d8vRa69WBsluyEhbt2D6YVOTFOr5ztaGTaevh65DaAS7TdpPnKPjVUprVwDqHAaO87NJvILCBxtp8g/yWY2x+JG+t6iycsBnxgN1Ez/gFm0=
Received: from CY8PR10CA0004.namprd10.prod.outlook.com (2603:10b6:930:4f::25)
 by DS4PPF18D5A7206.namprd10.prod.outlook.com (2603:10b6:f:fc00::d0d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 17:39:28 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:4f:cafe::36) by CY8PR10CA0004.outlook.office365.com
 (2603:10b6:930:4f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 17:39:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 17:39:27 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 12:38:33 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 12:38:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 12:38:33 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689HcXU1736131;
	Wed, 9 Sep 2026 12:38:33 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/1] AM65x MMC power-off delay fix
Date: Wed, 9 Sep 2026 12:38:32 -0500
Message-ID: <20260909173833.764103-1-jm@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|DS4PPF18D5A7206:EE_
X-MS-Office365-Filtering-Correlation-Id: 24abd97e-04d0-4152-50da-08df0e994bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|3023799007|56012099006|10067099003|13003099007|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gYK8u6nss7UP5/Gk53A5ecXzmFXBJGF7CEejfpHhkTeYYtTMvlnyvGp5eehgwnVNHsS7hYZxf2IJTelooTK9pxaBOryB/UJV77ttWmFqmxzXRDYYen/+geR9wV+TEsAqfq1OBiu1bX61Hw53s7SGvAzmKD9xZtwnr3Veeuax/g5jSc1xLwVVHb1qCvpigbefzl8cGHiniXTHETq44MnrR2sK2zX1gNyiSskBPhXhdOqr5CUiDgEameG4c3QQaRG4mCglE26pAwpUlm5aQPOPxPmDAgI1+AftRn1yQmEEeYLXBMLMJghdenC1v4IHRNJmixIC/8VlDzOr6zhd/vRydFlCMLaHIpIK3L7SSgz9BSwN/G86E/NRvuOc8gv/3lvFf6/Ho0628lE5uoLZyRmoj5txf2FHn7CMTsVn9+lQmv+v36icWLoEt3YOhdNvsB/Wx7xRIssUrSiHNfb/HOimbcc5T2f3wrbIZWXfKrAo+/KfiI/pS1P/byfeCGzCZJZFIfQEcNe5ephIJJPFv+G58ZL69Yc793a44NTQlt723nOKU2m2pdQG12DvAtx/FYQ8/vomdsnurQUCb6gUEpjosJvSD1SqXvs8iIZ1F0Iv3QZBQZR5Vbzdgj50lAh25gZS+k8ljrYN1J8doeeROqca4gg8GxkktpzAZ434ZOMX7y9KI1CPmyJ8kx/zMc9hxj7oHMJGAHY8F5bSyLvE1WDOUw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(3023799007)(56012099006)(10067099003)(13003099007)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qV9X19SQisD9yTwhFIcprQ0EtpTLg6SYivNVs0vgc3hqHeOb8oRWHNMiNtJMECf1Ro48UQLW0f4DipQHo/zc+rRjeq7nO+DIeaGdxzp9o25MOwfM4ulLXdQD5iBMb67xNdSI5nhNsld46vxLVMk9BaIOB3UNtYmW2KBo3zUJBmORYGcbBs3QyYL0fAol6Tctvsf+Uq3n1bqBPy7+ZMY7HnwL4jfGWci7CCPfpW28MbszEibQ97Xq21c+xjPBoLokfj2BppH/M4ZkroE2iKTxMFdVwQ7qjOoVIlhddtJnaz+3FcZiR9uOnj6DnAVzxR0ZYO1vXeRjiZ2t+mQK/5ZYHZn+Ycv5hGzseDiU+S3SGhbsYzqkIgHHdhOe9TPoNKMH+BBsxWNg668e7fjrmiE64OliEPkzbFHDbr+UEDZz0IrShUwAv2W3GmrWJW6QbtR0
X-Exchange-RoutingPolicyChecked:
	bAo0Z9Ra2G4khUuZDPorVXPLryVIro8Ye7YZlAWPIe4UWFJ7/M2T89pba0g9+C1Fp5jqClauTCY553wXLmfewW2LJEfswmKz/oVW+nI8fzluQ+MfbVGWSMuOnajrWIi7cjGODPD1rKRl/k74rK1UVkhpfKjOPzHNUgnv1I3ZwTjPc7dhTY4FbBcx9oQAiTFztY22rtaFzcHyHt9Cd7H5ZV9wYU7K8sT4EQGgLaiVfn5+l2DPelV2LxeSZC3wCpp0hHYJgDLBYqxK6iBlWReY3epfF5l62qSadtDylP47JOlO7ec1gLvS4O6wMpie/l/7WCKxks6szSaKFAgO0UxwdQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 17:39:27.3058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24abd97e-04d0-4152-50da-08df0e994bc5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF18D5A7206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE5NiBTYWx0ZWRfX13w/R7o6Ouz3
 y/CJcG75PWVbAps7laJRgLKb3Ji9kQjxIHflaRLu2ZaYB5nQroa4nTmZAQWFmfAixsUFA/wJ8A1
 EjF1m5/t7BX8z8VII5JVV31p505HG3Fh6JGJ+D9BnuPJ5M6u8YqabH35TqkfTtpuHFycbEfF3MZ
 89UnPBRBvKWftiTeCtiF/1+WrUZEBenXU83H+8rCgLVGt+nvCGa7FarCDgoJXfJD/DmOzrcJ9Nl
 gve3+uOLcO33RojzfHYuNHZwLn5x2zIZuf02yKkM+66wb+pt0wpT+GL5I3TOh8CRSVtaUTvyvHY
 k/z/DLbu7N5GCDln7Oor7KmYJ4r5VLrsT06C1KjHuESNNQdod66LPTfHLk6UD1jYntrrIu0Dlcd
 PhCaR63SNPMQW3nrJpErCK7QuJ1JRoWjhWFf2n/KP5eCsEmPReNwEo2FRgfEU4F6yHpbgFap/OO
 NgZ9Pf3wofou0uH8Ynw==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6aa199d8 cx=c_pps
 a=ekzRQQX7ZilozLPATeYkEg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=I1O76cIU5TdbMCoLbL0A:9
X-Proofpoint-ORIG-GUID: QRYYErk7JPng32EHBOvu54Kb5FWra1Pr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE5NiBTYWx0ZWRfXwwinjTb7C+QY
 tN1psV8aMtsoSgkK6YMfKQjEghYIIkHSlhafipL2J8mTWh/aPemgySWLyyjwt+edWFfi+h5dMie
 TG5rUrCy4ofyyEqvxWUa+JD80Biw4J4=
X-Proofpoint-GUID: QRYYErk7JPng32EHBOvu54Kb5FWra1Pr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090196

This series adds power-off-delay-us in AM65x EVM DT to ensure proper MMC
card power cycling during boot.

AM65x EVM VDD rail discharges slowly (~632.97ms) through RC circuit.
Without sufficient power-off delay, SD card boot fails in bootloader stage.

AM65x SD boot failure was initially exposed by U-Boot MMC driver patch [0],
which was correct but revealed EVM hardware limitation. There is no SD card
boot failure in Linux yet, but proper power cycling is required regardless.
Additionally, equivalent Linux kernel discussions for similar fix [0] are
ongoing. Linux MMC driver now supports delay after MMC power-off [1] and
this patch adds power-off-delay-us=650ms to AM65x EVM DT.

Links:
[0] U-Boot patch & debug discussion:
https://lore.kernel.org/u-boot/d17a810c-e2db-4a24-a37d-2d7e02466ce9@ti.com/

[1] Merged power_off_delay_us support in Linux MMC:
https://lore.kernel.org/linux-mmc/20260806162202.657512-1-jm@ti.com/

V1: https://lore.kernel.org/linux-devicetree/20260908170635.238775-1-jm@ti.com/

Changes since v1:
- Fix commit subject and description
- Add cover letter to provide full context of implementation & history

Judith Mendez (1):
  arm64: dts: ti: k3-am654-base-board: Add power-off delay for proper
    MMC power cycle

 arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 1 +
 1 file changed, 1 insertion(+)

-- 
2.34.1

