Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471127;
	b=ZPNxLVhrZRVy40FV7Ejohb07ZfN6hxsqIKBzD0HN56xJySRa0VOl4vZ/3kM8OzJpyz8U
	 8kOx6kQI8dpAkrkTTtWN/u2gvDXIYLvJKwgAxP+imNKmVu04x1XC6XC6bpnKP87haahvt
	 CLouO34oITl6pMtNgXe2J49qTwONLxCOYRZrznZicx6ANK5pTShw6QtLGWJ4ddj5Zhn3W
	 +GQLknEjHv+GzjBQNjrGNEB/fU+y2C+z/0JwkXn8HjWOAa/uHzhp4A885H3DT7DtGWFpK
	 vCgJrGRtRo70AKigymfVEoyxvJDaomj9NEKXXTSRx9vRIMigCjEmY1l4Im9JmF1xGPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471127;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UwLQBTaX5DSs1CAnX6R6pJhDYs0FM8ZVRIsSUFTBuxY=;
	b=pPgTtS3qC2uqTJL0DrPRVGYkRvP8Prbqkxx1dS3jYDGwRU+Rix695JLvZQJGmSBSFAc1
	 iMnz0OHoTuw2BBPhP+WxvoPg2UdRXhyHder0WlUQI5Dn65O0QQFjD0960lTxy+of1ROjo
	 kw3dUKrY5ruw1WJHKSziDZEq+3sHRS/JOnyhPtybCj0kFHksuzCO7LMbctU5cNFQeq5NX
	 qEZwQwZdHjso7BWTIF6Z4Dxe7pL1T1SBBBS82PpLGDj+5bVkRn60ZW6+BVr7rT8TxYwOd
	 ervgkO1FezPkJt3BLQVYtATocDna7ugf91pmHuMxgH3JY/9FNvnZjaYPYHADfljFOWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=fjSq08WA;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=n9v5P48f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EE6606A8A4;
	Thu, 12 Nov 2026 08:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67EE6606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=fjSq08WA;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=n9v5P48f
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AC5is8l2297511;
	Thu, 12 Nov 2026 02:11:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=UwLQBTaX5DSs1CAnX6R6pJhDYs0FM8ZVRIsSUFTBu
	xY=; b=fjSq08WAIGBTEHSV/uXmbFMRtgUh3tpF33DC0RbK2V46HWGyghrMtYiV1
	X/aGKaUJQqqM2xoMOk/CR75e4QDLyCTwGJoU9AvXmcff/ozHB6p0wC+0meIKeTo2
	YEchbo2blkHZ52BFZeUbEx8+1aL8tTS4UroCZ8dk7Cgvkj3UnWNW2wWzJFn3mp6d
	KyJTej1mgaD+jZFIZgH/+QsnT1w8GdK2xu4pmPnPf1AJGU2FOD/wyYxtBt5fGgJ5
	QKvtej0uM/dZaRIBGjnFZ4T2hp9Nh2FS+dtzhqO9uEcxhODDhkflFDzBZj0aZ1ky
	4Z9b6MF3U4u+K+SMAdMfCAb4nGRfg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011045.outbound.protection.outlook.com [52.101.52.45])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hw7k48vvq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 02:11:47 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSTMwy7IM4aOKzimiazeY5maeT8ETPS5dgDEQJ6LeoU0+4ZAF9n3NrMC1Hb5791nSpxcthgeLic5nEKLUxzIodL2lX6gybl0I1JYIuc13B1Q0LeLPxKKytzSMeYBc+CA5fP8+Jbrd73KuMidLCIVPIcjin34+NlVCyLGESylO42vD3sgcp7BGkxzkF2HBsLGhCj6YxI4rp77zdF29H5oVXW4bAgvqccYFCg0Q/8+7FpYQ5f6F69/PRfK8hp6ilt+jEd8dBLwbGGxQd9d+3siNVPFCWRBAUYBFP5MkOXsYDiXd+aPnzhqPO6XvW4n5fct3rmcCaiijewtth6Jjw1b1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwLQBTaX5DSs1CAnX6R6pJhDYs0FM8ZVRIsSUFTBuxY=;
 b=uQEMsbvwCTCISeLqTW2e8gnY6B/o9vXm7Vsny6VS2weqDLxWk2FWgFAzj19lQY4ixITCxi2UyOoP4gaw8mQhNyaDdhMICEk5kdMMv3arshsrOhsBC1n73CPkHDduNav9unNVckNQCXV8ERX1uTSwgk2BaF64p30Q5Q19MIbuMsCPvZ4BfDZDp5Xq8Ko9osl/GFZgeDGaqfTdwEHdPNr6JL2EvOhexiCQnRy7w0mO5Uzj/1IiOmH85Z8PGvKkV+mdLpdbk78sAWzvO/Btt96JrFKOtMVStxfWqIbW2NtqcbTo/y66iIyZx1N3D34oW8KSpQxkTIOTA7f7ePIjS3lTSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwLQBTaX5DSs1CAnX6R6pJhDYs0FM8ZVRIsSUFTBuxY=;
 b=n9v5P48fumQGQFypM4xmcM0UqzOct5Mx+fsGv7rKeGiZzBir/AYfVEw1F/2+awx8rDR4L6rClC0p+dhqp0BTVBmiEKiUhY7Q9CPzra62//Zk1VED0pvSjAwsqASquFWiwOUG9M21waOJM+AYrbL7EDBAqJ1mWtzsMH+4VgWJjkM=
Received: from CY5PR15CA0050.namprd15.prod.outlook.com (2603:10b6:930:1b::16)
 by SA3PR10MB6970.namprd10.prod.outlook.com (2603:10b6:806:315::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Thu, 12 Nov
 2026 08:11:44 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:930:1b:cafe::d) by CY5PR15CA0050.outlook.office365.com
 (2603:10b6:930:1b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 08:11:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 08:11:43 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 02:11:10 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 02:11:10 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 12 Nov 2026 02:11:10 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AC8AlaN1453305;
	Thu, 12 Nov 2026 02:11:05 -0600
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>, <johan@kernel.org>, <kees@kernel.org>,
        <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 3/4] soc: ti: k3-socinfo: Export SoC registration helper
Date: Thu, 12 Nov 2026 13:40:46 +0530
Message-ID: <20261112081047.1550471-4-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112081047.1550471-1-m-shah@ti.com>
References: <20261112081047.1550471-1-m-shah@ti.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|SA3PR10MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: cae083f0-210e-4f40-1522-08df40949645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|261102130727099003|261009223027099003|261009221227099003|56012099006|261021121427099003|261022113327099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003|261026121527099003|10067099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	9FylK4N8GYbenVdprLfBP4kcsiFMzbobnx0PN2BewIP4vXYzAhQ9qcyNXKC1OgeyAIZEUV9AV++BMDZv3R6NJuR/610/WIrjOe6pYFBIYzq3L4VsTwqAesTf0H45JPM6Aogh+fLTzSmeJnrXyp9nMaW9YrWDarDNFeDS8lcZJ2w0vceXFKEQLBlH2hJtOkh1lzc3esMVsADrpqze3uoWIEaNgieoYlfrJtGGRf9PflsAkEBlUFFzoElgAU1jmIJ9hlVRxyGzc0scpKF2yEELAEf7We2X+dH4D29IyPJXTe8OJ3V6EteoKkveZW7azVLcNI9kuBQQdg6tFPJYLo3jAe5TVhTNOh+poMP0n1B4dhvlgGNwE4iqiod9xJBTH2GXmSJR1dRg2WXuZ0VPE7iBT5MePCespyO0L0CyWI+LJxkLkTdowV5CSdW7ke72kb1Gs5tmDTaK8LqUHytF8YQqfoTm6iAx/+Ly/dyBUMaey/3s10K/wFambWw1GioeNzXwhrU607499HNgY02Bd0FwzrMj78t+wZe4WxzZ0pnVoPWOiBK9+rk32Ey6NcuEoHwg4FD9FMLPoSF6sEn0aY09j1gCdcFSbeWsuz3PemZrTkpQ2hEw7z7ZxqOmDdPWmON189FLnpS4gqrR3vJqphzMqQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261102130727099003)(261009223027099003)(261009221227099003)(56012099006)(261021121427099003)(261022113327099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1w8A2sZF59jWprogUG2bqHgjXzcKBY7+MZoXvOR1IiKC4nxrvJmVEjWXkc9ok9AyjSJKjDS3tqCXNhcNfN32C2XvF25lg3YsS42IjapKbI/6rcz+dhqKjrsas9TCjlHjG2QjoAB9jX1BUGKkz+otjine3MUpcstAuibJS7aRJ6LZXzbS83bLFnQe1NJwB7UvsForTLNQFc2VfBFmyLpmWNntyS9hBx4SSZbDkk1u6Fn9XaVyHy0y7Agatxi99rtft8dxVCa75KDbbICzCyJ+3FPEMUOH6Ncun6JFBSQOjph7dWrmjxzX02Mz93YGD759K1AJC/kUWmcEo7vxjjcxeDsSRIlNWlqLO2DbaT4ovfJI20I/qaOlrRyiDU2U6W4JQM9EM/C1WTpGBHQJrGFkNesZXG1c/CYitBZBkrl3YGmsfdpIjDPrVQzm/hpgSrbb
X-Exchange-RoutingPolicyChecked:
	f+oS4UsVNyqxFAUyCbfYuAr4PEcKPFO1wixhZzgS01Ba7IFAr9joH8BNOH+5yOr652ga1xFoz4kYhAoBp8x/s/cIweQRJToQ8TmAsc1o5/3tS6WYs/7BOOPnR/+K+WFjyBQypiebROqP/H5jQmhUU+WIUypI/tQVYL5REx+4SdDN41P4dTHeDrWW8AdD0gynKsu0jeQlCqV9EsXypOLbbdRKv3XKfFiFRGsV4V8eOO5CI52zLNMCg/GpaN+ORxSjZIs/qAd6JisGeTRw5JmSQX2UCsNu6pr4X0WJF9wHEvqmSUv91wbVmY2lODzW2OieoUWRJdD1TaFd8WaA/X4UEw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 08:11:43.0040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cae083f0-210e-4f40-1522-08df40949645
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6970
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfX4EzI78H7yVbP
 5SiHCvJcIWPHrnUGifsv6op9kpn39Cr1d+Y59Nz1gfu6rWWTomJw5rv4OvvOIsno2xM4enFVJq6
 503z51kPTtb4A5Qk30F6ZIuQpam/Ew0=
X-Authority-Analysis: v=2.4 cv=fNCsTpae c=1 sm=1 tr=0 ts=6af574c3 cx=c_pps
 a=f/vGOH3Q9iIJglbWlzIglQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=MppJNvndz3xZZ7pgNAYA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
X-Proofpoint-GUID: Pq9LxVEjqGCjryO3K-CVILI_it4gpP0o
X-Proofpoint-ORIG-GUID: Pq9LxVEjqGCjryO3K-CVILI_it4gpP0o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfX+VHoF9BrMxIj
 GMMrdvv7MsnHGeHcotCsJ9CFnBiIDr/FZUab/Nl1yZAJxFdtFuapYHk2DmeX2/vFtD/DJNfjwQ4
 XJf9/ArSJcI0gnTl0fXizkm+znsYME4FAeAtNUJfP9pv8BALlvoZg6lq9vfH9lYUrTHi2QToupm
 6ZR7xCRu/PdknoWwAOR4GEJQcsgbbfgKmkRkhBA5gU4TvvYqIlv26o9naobEJ3dEp7uhFxaG3S8
 b4S164q2mFLMkZLhrTyPh+n9fgLEzJMWeu/xftGxRIvIFpyl6dTyKM8cbAytiOleUxKKWGntqIQ
 OE5zkRqyvLUlAPZHDa4aWpQEmQeSrJo+N1nMBiCzbKsdDPDM0SpEz3xeitABemot6R8JVTmE+X7
 GjURHENb0wGRhe7Ldq1+Z3OBKER24BkgIJWN4FGAsWcYdjlmOEYMp9xEW4gJu0HO7JoMv0lZfPk
 R3bSgoWgobxdk6KBruw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120032

The k3-socinfo driver reads the JTAG ID through a dedicated MMIO region and
then decodes it and registers the SoC device.

Newer TI SoCs like TDA54 use a different path for accessing the JTAG ID
register, but the decoding of the JTAG ID into the SoC information remains
the same.

Split the decode and registration part out of k3_chipinfo_probe() into
k3_socinfo_register() and export it, so that other drivers can register the
SoC device once they have read the JTAG ID through their own access path.
The registration is managed by the calling device, so callers need no
unregister counterpart.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
Changes since v2:
- Split out the devm related changes into a new patch(see PATCH 2/4).

 drivers/soc/ti/k3-socinfo.c | 70 ++++++++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index e21a2cd14c811..bf0829fb1d61c 100644
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
 
@@ -152,43 +155,32 @@ k3_chipinfo_variant_to_sr(struct device *dev, unsigned int partno,
 	return -ENODEV;
 }
 
-static const struct regmap_config k3_chipinfo_regmap_cfg = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = 4,
-};
-
 static void k3_chipinfo_unregister(void *data)
 {
 	soc_device_unregister(data);
 }
 
-static int k3_chipinfo_probe(struct platform_device *pdev)
+/**
+ * k3_socinfo_register() - Decode a JTAG ID and register the SoC device
+ * @dev: device on whose behalf the SoC device is registered
+ * @jtag_id: raw JTAG ID register value read by the caller
+ *
+ * The registration is managed by @dev: the SoC device is unregistered and its
+ * attributes are released automatically when @dev is unbound, so callers need
+ * no matching unregister call.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int k3_socinfo_register(struct device *dev, u32 jtag_id)
 {
-	struct device_node *node = pdev->dev.of_node;
+	struct device_node *node;
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
 
@@ -237,6 +229,36 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 
 	return 0;
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
-- 
2.34.1

