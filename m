Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC97495048
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397327; cv=fail; b=YTyFr306y2GUxDdlrhaCpkhjQOvNNv/r75DiQ6Tu8tb5KKlbjAWDuWWSp5I0X6QKXmGBxV2c4N6wwH1S+mSjxKrsSlwHIR335d/p4fXpJ5SXeqBADuxpwcQeUMptQB73G9fbWZcdwDNOILYzYxbd9XZETi7eIe8OvJPOjfatMWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397327; c=relaxed/simple;
	bh=T0/SVAQtSB5KASX1ZQUZTpCG0awzp7b/cdC/nisUO24=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qJAExzBLVTdWxshI8s+n/8a5hmU7l6bfnitFR+qcRmOhrVbOlvVIdO4iOypORiUW2aQi8if7OTepWXk0dn/w7TA1B+1muIt3ZNEG7zQbl66HsU71/OVdgfk1EEt+ij9KxOJLDQfuqwNdrA/MFRH2wqn086eNOscmPhQaXh2dXSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=UgoWvNAh; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=L0NN21ZU; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="UgoWvNAh";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="L0NN21ZU"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69J4gs3R3373331;
	Mon, 19 Oct 2026 03:08:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=v5Hyo/+tGzy2mL8NZjAmkfe5NNANSs0grC3Qr91Y/
	5Y=; b=UgoWvNAhvOw+RpoQHntYIsevOLC9QxeSVlSQq/+4Y9HAfBwKP4ChxT1PG
	9KB15zh8ARqYT7ppMxCnFpz5TqJWhcG8eLbUxvP/P73uaLkKpNt49imhx8T2jrki
	PjQ2uS5w/DHwOv+JjVF1qxyDCYsnQjV2bJSDh80ELr1h+SA31tZ0sSuxyn4roeHQ
	O+bNrJlVFWJM5WFY4IhVc5LGi8mxzqevKm5haA0v9NTrhaSG6s3O5swZlhtbtR0Q
	PnfxUMZY1+f3PrczBnL4kcA9B5915tmRK/eLANlPOfFrHhNoS8iIQbE9fyWF5JQp
	BW5YGJi2IOHENj0gO5+ORiC6PQK1g==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012064.outbound.protection.outlook.com [40.93.195.64])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hct1jme4h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 03:08:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOyARFjW2LQbFqTlCuMqIfiGgA86HFcI0rgRbEgsX3MVTClZM6aYI1PxW+nuoLpUr2NrJSfC9z0LAj/RYM6SSBj+/Qo6nporaeT6e5he6JrCoymr6ibtZcBfTWTRPmVKnBy9ie1J1LtJGoU34ddv8to87As0XFjGm7wePzyobn6arg3pSYXcFML9QS8Xm4FvYsdfenoszLLnchMUxclOTUaQNTRppqYM3f3YNzHPFCRGPfpyYzpf+eTClWlQLdni2W0ECw1z2JoCkOfzQ1f4DdBqALr3UnffnK6xNPBX2BjrFge0wLkjo9n5GwfvGGYBrcsvI+2Yrk4G2+6gxAYQOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5Hyo/+tGzy2mL8NZjAmkfe5NNANSs0grC3Qr91Y/5Y=;
 b=XDBCBvmg9eqLtZKoGlZOsHf8loCxQFdLgw4lPBGin9h8x4atQs0FWkLK9CTrGpweRnagIctJuX19Q2YqYK6er26KeAcfGGuOpklEvcpJZJjwmW3Tv30WcVF/zRDLZGGRYLIz25D3+iU41dNd2b33YxVpD1zlCxk/foup2s/lfFlDuiPX8lfafYD/TGOXkbBngibc7pIY19PZQhcPW7D8+CoGa/jrJXUkz0/fYECRrft1ykf0gzhkNTyAh5wmTn/MZnPH8Vn340ecfpC4D9Dle0vR8WsPHVWxakHLtPO+SGu2vdCwvFd7q4IJ6Xj68PZ8BtUZKi3toRSybKxKMTVfng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5Hyo/+tGzy2mL8NZjAmkfe5NNANSs0grC3Qr91Y/5Y=;
 b=L0NN21ZUI3Ms7Mgfz4ItlU7u/svZMt+bBNmp95sH8q6KbdGjMyWaIrF9x0MZbu5RBmgJuA3x92vDZCd1Eh7D1KWcMz6GHzf0UtJlLMzGZISO03GGWg5OK2DefVTsoEvxFYkZSnkowZbLn/qdytqpANRzxxu05uxCgWoUIQ2z1Jc=
Received: from MW4PR04CA0349.namprd04.prod.outlook.com (2603:10b6:303:8a::24)
 by DS0PR10MB997675.namprd10.prod.outlook.com (2603:10b6:8:311::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 08:08:37 +0000
Received: from MWH0EPF000C6189.namprd02.prod.outlook.com
 (2603:10b6:303:8a:cafe::22) by MW4PR04CA0349.outlook.office365.com
 (2603:10b6:303:8a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 08:08:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C6189.mail.protection.outlook.com (10.167.249.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 08:08:35 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 03:07:50 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 03:07:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 03:07:50 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69J87aSr3342624;
	Mon, 19 Oct 2026 03:07:46 -0500
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH 2/3] soc: ti: k3-socinfo: Export SoC registration helper
Date: Mon, 19 Oct 2026 13:37:35 +0530
Message-ID: <20261019080736.944127-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019080736.944127-1-m-shah@ti.com>
References: <20261019080736.944127-1-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6189:EE_|DS0PR10MB997675:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e656486-b7b6-43f0-62e6-08df2db82cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|56012099006|5023799004|261009221227099003|261009223027099003|10067099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	ZV2lUMYiUtZrSLFR21oDOe1+XPJzWbSbZsMpwO9KHnvYGWxeW8gVffP3KdaGXxj5ESoBc7EqXPtW2Kec5Si5zdq2z6fPupST3qH7mvQgNQZLIFkzmezAdKHmHuv3NiSZwuXJL8m5o5cW1rYjiC5xJMOHa4wj6oB2DhnK/XAgqQ6UI5Qw3YBGSmJ7I39zrCxarlXptczjmcBLCMzWJ7SlGjj0gyxcFZK1ClaB56KB+jJK6GMg01THsCInBfaZw4SQ6LNW634FJ4913meyJsaed5qvqxFp7gbGS8uPsRoIm830JnBach+LeX3MWyyYwUMywRxtL0Oy7uJvei+g3LDUEpDWiJvZSS9X3Q2TzpL+ARgcSgRwo6ZdomCYWckeD/x+7DF1K7xcse5z1QkVSIZROyROM7dQYlT/3DkDlMdWOADlArD/3V41KaFa3BaNolwkJzqu2gZ/UyHwQYs+bCEDTZhqy3FONlWZ7GqIjqajmve+bRyMHfy8PKn3/9YW2wvN7VRgiIsSZ8flJpLRJrDc2p/tD8TPt8Hjnqk+SKJgp7KGt/pWttwPQnvWFgEASXC6xrvGlvWbJew33oMmP2VkB+SBdsMR8cPIzc71YYZQSnAlfO4CJqpk8xaCYYe9XtHsBWQ9SC7REtcZymSL19/Pfg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(56012099006)(5023799004)(261009221227099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zYDc1l6SdM4RCd9RGZo//DYCfbLZEYxWFboVYRXowWkumbS1BdMI4MCncTbHLL+iRflRFmPL6zyLofzC0QLe5KvT9HJt6rShTRBkKoANy2uU7onc0szZr8M5ArJvwGyBiWoE8CA6oMoXGyMhL0JiEUY9QHL2FZnQ9vLdJUYLBqruZDu1qMAdXGdqBHZ/5kEYpqrmZulEfifmM81JxE7i4JoLQ4CkzVGdgQ9v/wd1IIbur4H5HmHvtHoeZLjBdy/C8uB4k15atlw5VvEGrurg+5B+FNS5MX5+OwUUMzKsuP3bavqbJ96zTFuPNztez+2f/t5HnMOMvv26JbjzqBH3jLNCOgFZ3uTeu3yhUKzNoy2kDZcfyzuhSB5DBm8sOxvsSJ4WkxbCr8jMqfhBojNo8zBcEYGJ7BczD3N/CKEOybz6cfMrrIrfZMgeM2iXpBZc
X-Exchange-RoutingPolicyChecked:
	xOHRsRI+fOPF22QJ+EEZR4Sn+LGozNUWmLZuYEsD2btYWaFSZLscXbuEz7FLKRe6Jh9tLPciXbne9p7vV3N8VdetQOiwmV/l9/UcUryf7Va6KPL3Eu8YHRibD+8SEKojSpoPUiCK1tXi0E8FaKPhSCitMxuRhpCx+9uWwkjI+xInzOinbsskgIPASjIWrF/xi7uKvqpmjEI1wrwNLtEJwU3vCzpfuWRPsbIZFTIDQLemASncW3uku4zsegmxVui4LT7PA5RWGC96ZQ1ASxZR3gekNQ6LBXtG5u32BNbUPtGQEKZF2qaojp/f9rDKh6I9MeyBZ5uB0h9CZk3TVQJDVg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 08:08:35.6652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e656486-b7b6-43f0-62e6-08df2db82cc1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6189.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997675
X-Proofpoint-ORIG-GUID: 9is9WqcGDRmyGyqR0Zuw_GzX5QAHhuu8
X-Authority-Analysis: v=2.4 cv=ZN9CCn7b c=1 sm=1 tr=0 ts=6ad5d008 cx=c_pps
 a=bXbGeLyqALV9C4BWsqKi7Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=8hC9c-gETmGWFzvnjE4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMiBTYWx0ZWRfXx0qSTm7xYijj
 S2LSArEtkNnFWk4d9DNDEzdIOn0BQT5KhiX96gLtXCPI+b3BfANaQYHdV1Yqgqdo/xDr3gmFE6O
 248eZr7ao1IxLY+UvBmlU6NrP6Cd/a2LjD/QTdxwRdRoTGMm7x/toytzFr15VpPxSj4YC0DnaVc
 ijsR1jgGKM+4+oMAlMi1WWgoMGKzMVQs5ZEjUT39OIH/DCBM9W+sG/5Nstmet9ITl1IpVxtJy0Q
 SX1Y9W2EC4YCIDV5dlXqWm/dsoJ8XIBOhSpPmj4Fdx/wiFWe7U0oV0aG+WXQaWLlo1dOeB1HbVe
 kfdkDNpj+eOt/S1b4pJme8zgUuMv8w32qcL0dGK/dRaQNeuIP8c5Yr5OOkZ/rldxCxlQaNrhZKH
 WkvdYiqQ7YxRY/Liw4+3jN15obIQEmsRRLN9kGH1jWm0rLb/CpSBhjF4KekoT/vfyxvbaqc2H0L
 I4LBnYQjO1eDK7Honvg==
X-Proofpoint-GUID: 9is9WqcGDRmyGyqR0Zuw_GzX5QAHhuu8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMiBTYWx0ZWRfXzJ1oLwoGq2FG
 F5UfntTHn5Y9beC7jU7T79gg/q3qULtQRoElJVkLFp92Xxa6MuXp3sqANHccSH1JZqYCysar6Th
 3+28dBFPIEsgGrVZKE7FxQbOcJwVxSI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190032

The k3-socinfo driver reads the JTAG ID through a dedicated MMIO region and
then decodes it and registers the SoC device.

Newer TI SoCs like TDA54 use a different path for accessing the JTAG ID
register, but the decoding of the JTAG ID into the SoC information remains
the same.

Split the decode and registration part out of k3_chipinfo_probe() into
k3_socinfo_register() and export it, so that other drivers can register the
SoC device once they have read the JTAG ID through their own access path.

Since the helper can now be called from modular drivers, it must not leak
the SoC device when the caller goes away. Tie the registration to the
calling device with a devm action, which unregisters the SoC device and
frees its attributes on unbind. Callers need no unregister counterpart and
the helper keeps returning an int. If the soc bus is not up yet, the
attributes are only parked for later registration and there is nothing to
undo, so no action is added in that case.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 drivers/soc/ti/k3-socinfo.c       | 101 +++++++++++++++++++++++-------
 include/linux/soc/ti/k3-socinfo.h |  11 ++++
 2 files changed, 90 insertions(+), 22 deletions(-)
 create mode 100644 include/linux/soc/ti/k3-socinfo.h

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index 48dbef3acceb4..5fae03004e350 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com
  */
 
+#include <linux/device.h>
+#include <linux/export.h>
 #include <linux/mfd/syscon.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
@@ -12,6 +14,7 @@
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/soc/ti/k3-socinfo.h>
 #include <linux/string.h>
 #include <linux/sys_soc.h>
 
@@ -152,38 +155,44 @@ k3_chipinfo_variant_to_sr(struct device *dev, unsigned int partno,
 	return -ENODEV;
 }
 
-static const struct regmap_config k3_chipinfo_regmap_cfg = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = 4,
+struct k3_socinfo {
+	struct soc_device *soc_dev;
+	struct soc_device_attribute *soc_dev_attr;
 };
 
-static int k3_chipinfo_probe(struct platform_device *pdev)
+static void k3_socinfo_unregister(void *data)
+{
+	struct k3_socinfo *info = data;
+
+	soc_device_unregister(info->soc_dev);
+	/* The attributes must only be freed after the unregister. */
+	kfree(info->soc_dev_attr->revision);
+	kfree(info->soc_dev_attr);
+}
+
+/**
+ * k3_socinfo_register() - Decode a JTAG ID and register the SoC device
+ * @dev: device on whose behalf the SoC device is registered
+ * @jtag_id: raw JTAG ID register value read by the caller
+ *
+ * The registration is managed by @dev: the SoC device and its attributes are
+ * released automatically when @dev is unbound, so callers need no matching
+ * unregister call. If the soc bus is not yet available, the registration is
+ * deferred until it is and cannot be released by @dev.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int k3_socinfo_register(struct device *dev, u32 jtag_id)
 {
-	struct device_node *node = pdev->dev.of_node;
+	struct device_node *node;
+	struct k3_socinfo *info;
 	struct soc_device_attribute *soc_dev_attr;
-	struct device *dev = &pdev->dev;
 	struct soc_device *soc_dev;
-	struct regmap *regmap;
-	void __iomem *base;
 	u32 partno_id;
 	u32 variant;
-	u32 jtag_id;
 	u32 mfg;
 	int ret;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	regmap = devm_regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = regmap_read(regmap, CTRLMMR_WKUP_JTAGID_REG, &jtag_id);
-	if (ret < 0)
-		return ret;
-
 	mfg = (jtag_id & CTRLMMR_WKUP_JTAGID_MFG_MASK) >>
 	       CTRLMMR_WKUP_JTAGID_MFG_SHIFT;
 
@@ -198,6 +207,10 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 	partno_id = (jtag_id & CTRLMMR_WKUP_JTAGID_PARTNO_MASK) >>
 		 CTRLMMR_WKUP_JTAGID_PARTNO_SHIFT;
 
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
 	soc_dev_attr = kzalloc_obj(*soc_dev_attr);
 	if (!soc_dev_attr)
 		return -ENOMEM;
@@ -224,6 +237,20 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 		goto err_free_rev;
 	}
 
+	/*
+	 * A NULL handle means the soc bus is not up yet and the attributes
+	 * were parked for registration at soc bus init. They must stay
+	 * allocated and cannot be unregistered, so there is nothing to undo.
+	 */
+	if (soc_dev) {
+		info->soc_dev = soc_dev;
+		info->soc_dev_attr = soc_dev_attr;
+		ret = devm_add_action_or_reset(dev, k3_socinfo_unregister,
+					       info);
+		if (ret)
+			return ret;
+	}
+
 	dev_info(dev, "Family:%s rev:%s JTAGID[0x%08x] Detected\n",
 		 soc_dev_attr->family,
 		 soc_dev_attr->revision, jtag_id);
@@ -236,6 +263,36 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 	kfree(soc_dev_attr);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(k3_socinfo_register);
+
+static const struct regmap_config k3_chipinfo_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int k3_chipinfo_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	void __iomem *base;
+	u32 jtag_id;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	ret = regmap_read(regmap, CTRLMMR_WKUP_JTAGID_REG, &jtag_id);
+	if (ret < 0)
+		return ret;
+
+	return k3_socinfo_register(dev, jtag_id);
+}
 
 static const struct of_device_id k3_chipinfo_of_match[] = {
 	{ .compatible = "ti,am654-chipid", },
diff --git a/include/linux/soc/ti/k3-socinfo.h b/include/linux/soc/ti/k3-socinfo.h
new file mode 100644
index 0000000000000..487e69d0069d1
--- /dev/null
+++ b/include/linux/soc/ti/k3-socinfo.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_SOC_TI_K3_SOCINFO_H__
+#define __LINUX_SOC_TI_K3_SOCINFO_H__
+
+#include <linux/types.h>
+
+struct device;
+
+int k3_socinfo_register(struct device *dev, u32 jtag_id);
+
+#endif /* __LINUX_SOC_TI_K3_SOCINFO_H__ */
-- 
2.34.1

