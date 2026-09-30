Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF2A51C071;
	Wed, 30 Sep 2026 17:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789428; cv=fail; b=ZsTwTbijkt5LL+5bAOcLpJUcZ1fJ02MhVZh31hxKPDttib4e+2H++XXGJBvPXv9M30op+7Mi6SC8qI51wC65aiprHzovxmaCBDD68HK/rOtCTN6nsxB12WZzvN3lKCduMvSO7n4bNEvI+J44csBxhut1NaJpBi9sFWQwsetvWkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789428; c=relaxed/simple;
	bh=KkNKkn2vQpqk10BS29CBIux3Lm2vMlB8/L1broiy/9A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JsXVSyZImm6M8gfCOeDhLt0ii0spmDdNEuUMmVWveHNbX2z7pf5TpQ2qmWFJxB9HcPKcsXevzSSwT0KX+q1MRMgsnBU5FiJJuTYgzPFdaIVAZ33cw9vRvx3xtHxHuYm9pIoldufHgXWCkPVvbXL/irBZrnVla8TIwsC30S9PMSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Ie8BrvSB; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=igWmz9QT; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Ie8BrvSB";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="igWmz9QT"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1IFY3333465;
	Wed, 30 Sep 2026 12:30:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=2iZoSwAnnmzZr
	G2aVPEAdCAKpUsmbl45kbJRyFWItmw=; b=Ie8BrvSBQfitsnObW3Fk35huDMqiT
	3UZd022c5wAtETyYYMhihs4sT0HMxsZjA4xIUEHl7+5mwBcgxY8vPZ2dNRBCvi6l
	a45/+L7EHQOCgmgN2i6c5XyJSKZHKwTFjYEDvssyjc4yzg65PBKlQtQ7StRCSiHQ
	B6vgCVFVpMxos7W5+JdwyslCgwwvRdBlDhWHZbwSJoXA+InMntwoZsyjlDEXjE+R
	ggihUCVPsJ8VPpxK+Hsi4lkK417NoLDR/2WwmcuiynFjynGgE06M0P7HJZj8Lt02
	ceRuvQJFIf5EIRi6xx/cn4F3bL+n3DjBsRscP72jvV+XjNTauyYh8jx7w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010016.outbound.protection.outlook.com [52.101.201.16])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1tcxg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 12:30:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMtA87CTdUCxKc0Emq/gSMOogGwFceW/P3sff1orc7gMSpC/RMxQYqMc5PjjGiIBa7cCIAK0JPW+eHsLyVUOf4b02XvUj///x5IMaqQR72vX17X64LPqxdMoinnO8IkWwaVE7m04NE+tHzqsdFVZEDOv0NTNLhQlcs5sB5sxeB61GUu6zm7UFysA8CIc6c6z+ygcj9RPHUUN1R+iAxxMrgAHsL2y3+d/Jrim6IXHn9IIEgBvzY1VFOngZUrKkjTRkLtHvJuzyqJJUmjXX/3ll1EZQmJ7RWBNyTEhAqQ/flyPE6Eytu4wAAakcbrlxhKhf/k6dDc491b5xuG18rwr7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iZoSwAnnmzZrG2aVPEAdCAKpUsmbl45kbJRyFWItmw=;
 b=KbaCfMfrBv7UbC6J+VQPhTSu8HY3t9XMKph/V73ZjA8ruhZbq9o2UqlDf4DO2SHK43lc/zbAWYP5pb73WyeMWCqqu3V7yDGME4/cTgXVcspCHjx/5weQHx2u3rRSWiR5I4UCaV8vocIQf8mDOXo+dFADwTJ53HEcHXkog4rNEGh0EERzJFmsLQhryGIvagX95bl8DsmCpGc2H4LQfmZPqexvGcW8OkPJ/tvTaY4CDAv86zsOSG+tZ1mER0M9zI7XHBqnpQbVHHSVCEOuM4zpsMF3qRLBbowp9oriuk+BKofjympMvX1LOD9Gs1oYJqAv7hz5Uv2YC/JMIXMjWHZKnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iZoSwAnnmzZrG2aVPEAdCAKpUsmbl45kbJRyFWItmw=;
 b=igWmz9QTfRKORhziFXnCJWbpeISK5RFE1HWmg+v0sIU37OfatfUzj/rMOAgufhh5nNgx1WamO6NRiokFyo0bN/aM4ovrzYTPyMUsWpdjhGbNbL5Vqx3Sgh7N1BubYHFp4lhyo10VkLfeFE7ykNQPVksG2Xz29R1K8o6kgkYspGc=
Received: from BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::7)
 by PH0PR10MB7100.namprd10.prod.outlook.com (2603:10b6:510:28b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 17:30:20 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::7b) by BY1P220CA0009.outlook.office365.com
 (2603:10b6:a03:59d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 17:30:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 17:30:19 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 12:30:05 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 12:30:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 12:30:05 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UHU1FP303419;
	Wed, 30 Sep 2026 12:30:02 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <jassisinghbrar@gmail.com>, <nm@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <b-padhi@ti.com>, <vigneshr@ti.com>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 0/2] Add support for TDA54 variant secproxy controllers
Date: Wed, 30 Sep 2026 22:59:46 +0530
Message-ID: <20260930172948.2901336-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|PH0PR10MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec45e4c-7c65-4b39-13ca-08df1f187ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	O+Y5+J/bhD2A2NjjK69YN6iVCzgGDzeotpND++TjVOFAa+qXJRocJ0YwaVRUo3HlKhOmDsQb61EdT/fJbogAKQVlzCVXs2nmhkvxjPUJGfkaF9WxzlqzrGtvolPBNmlUkGoNIEDvY1qMpVrdx6aQlQRExXkyMHF6qnD1O6wqPGhXbZLB4XH0ruIhM9i2Jwl0HOkT2rm2FF+FnFeXoZjBS9k4tdlmrFNQn+mxZW4zuBmVelPbM4+xV03VL/RiTCGdDuQuntEK8mkJ4JwgslrgqwZlJ8FWCxD5A7bzPHaVeGlV6neRcxeRP+Mc7jdDXVKm2OhFMLkhMypsdr1yjwK2N87VcM4sXqRiYS+YgdXZDjiG7IQ+FZJG+wnuXoKWm8t/OTu3NbGMAj0I0i6KhPJUTOwCn9mqVO6lc8K0++VTdS6nNvBWhM56RkY4pa7vPy2TvUJYjpzFEB/loynl0ZZDb+MVYkyYckPhx9RVN1X690C2jfGAmvs0MTKKxQNEpy04WxRIzwLoJ9jLKHgmKOVk+E3vCujd9eCrUW8hf25r+Wu/M774s9R8nOmwucEdOlOIFy3TZ0Khzb8mB1fSHraOp1H8EbdvV4HN+eoDOdrJz6d1hJ7hA3GqWoFfRqxe2ic9L1O3Jm2HfIIB6xYHJMPL+YLHXc8EsBUc+7yjdGFX+fgOoy5izqMEEz6rFP5e7LkWkrLQgSw2lSl0ntu8BJIPaQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rBPOde4erEDHOfINDEFlNtjRpUcSx1+4/+IkoimicamPLQktFjSKd/UGsF9czgrpdtOYE56iIVxkXHKoEtc9lsJANUJK0LDxtWxjJprI0cxsmkvxqoJfJO+9X0gjXvTqKElXVhDbeQTrKInhTCACtTQgj6ie9kL2SuYEFiDvIW+6EsZmXlea3vLRalfMg+FA8wYr0lKeU7eV7VT3qcXl6XQcTYSjSTvgZQN4Ypj9rYEdXsvXjHLRgY81Gqt4Vp2t6eevtk/MzAt8YY0xgAB+Uj9mhd2ZgFIhebcf5I3Qcqf+GEwhdfWrr1Dj8Q4c9sNNiXKyALDxXF9XE73EkdyD7uDnZ6MPRTErh/Tx+ictTEpSpGRzyWcb0eM86NlG3tiLFcLy5dAjuljlSe2EUhmboLRUKuR2IeNm2iVKcNguF6IgVKJZbLwtjtuH/0TL/31J
X-Exchange-RoutingPolicyChecked:
	jGvuQoa7ZABlcioK2HlnxB4FjTaMP4R/SdRlCposobCutNlNTkguRiTLpXqUTdVOh1WZnHv/AdKwnUYhxtZYeNFM6doGFgbi/bEUhNQI+AAUiImN9nlhZgvcN2vYiTjsbovcBvVqqEW13K91DdtdxuL8RWBdwFmZzZK56+VKYInPdKKetmxdN9glSHJNkrLXIXm3ZvMzbCbPow+geYmW/F47W79xPbGsnU0nhIhhTRBeqdzO3FkToPC+bOyIqMkTQE+MB8LXR1zafcuzw8k09BQCfXqCJmYTRZzxo+PKM/+LvT29/9oTctRgdqbmN9EIZp05yRsVdDPWgBWqlo3+aQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 17:30:19.5392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec45e4c-7c65-4b39-13ca-08df1f187ffb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7100
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OSBTYWx0ZWRfX0D8q2ZB1L3Eb
 u/RIjNHc8FU3sbCx3MHOELc/F2ry775AZwJqy/Pn95FjB15a3K98erkLvdP5mn/eCJp9QkFncfn
 7KxqgwLerIWDG9pIIc8P1vdnDrGhWU4=
X-Proofpoint-ORIG-GUID: Pmnn-GFWkF8VdN62TZ19HwSMTQwfuMSi
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd472e cx=c_pps
 a=3r3V3iWCG03xnAr+XYP7tA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=Owe0IBU8DGWOe-05VhMA:9
X-Proofpoint-GUID: Pmnn-GFWkF8VdN62TZ19HwSMTQwfuMSi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OSBTYWx0ZWRfX4YikJSpSCta3
 PMRu/BLX1PaM7FRIh6+YN+jbsHyl9Yl/wYLCVVD7NXvm41I7d1cNRoKAwGid+rU+aZhf0Tvs1ZP
 grgopxwvMumGm6RE0/pG4iIp4kifRxPGyV+wCrhVf9Xzvdr9APdYVnD/dGklEAOXeWU54Tr8ziK
 Z7NiYk5WMzagodn5weZmybNOjMtdRLdZ3301JTejRQAZKWsp/6JkDK7ksaEO3wZLOOWXYQndUiI
 eX7TjtHDvur/3j6t67X5rBNwjN0RZlMOf1bPG6SHWZVjLO7ub25BGBN2P5C9GmfbwQ7i4kMiovm
 uBmuM/FL46KWdDMIiuUmsV7HVsvsqvIsEXt/iHdFUB8S32dI5psbgzw9zyerSwrzKPT0VTPP4bn
 kS6Okiq1k8ubDQbhl2dbqRXoYSKuz+c5AwsJ+825EjKzJuZ9pTCWMRvCaaynsk5all1cwoWikXm
 8C9A0jAJBX6DjzZYL8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300069

Add support for the secure proxy mailbox controller integrated in the
MAIN voltage domain of the TI TDA54 SoC, which features up to 444
threads with 60-byte messages per thread.

Add a new compatible in dt-bindings and add the device data in the
ti-msgmgr mbox driver for the same.

Testing done:
 - Build and Boot tested on TI K2 and K3 platforms.
 - Tested that these patches do not generate new warnings or errors.

Test logs:
https://gist.github.com/3V3RYONE/8cb2e49ddd902180a920730b7a5c8016

Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

Thanks,
Beleswar

Beleswar Padhi (2):
  dt-bindings: mailbox: ti,secure-proxy: Add TDA54 variant compatible
  mailbox: ti-msgmgr: Add ti,tda54-main-secure-proxy support

 .../bindings/mailbox/ti,secure-proxy.yaml     |  4 ++-
 drivers/mailbox/ti-msgmgr.c                   | 33 +++++++++++++++----
 2 files changed, 29 insertions(+), 8 deletions(-)

-- 
2.34.1

