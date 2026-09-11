Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013024.outbound.protection.outlook.com [52.101.83.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1C1470EA4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.24
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117780; cv=fail; b=erxTtUgL5l3t0zFdeMfjF/6s94l65i27gN8Z3h5mXsWM9sVN5B1IC1FdYzw3MVRSQP0HtGIjEE7VryvcWQ7BZXo8m0HScYjfnsyP6iTXx0pU4KhLI/piDebqqOZaPej5daeStqG3MoM9PevQTX46RLL1sgZB/J3nnrOvE2pVCcE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117780; c=relaxed/simple;
	bh=REUaSiry35n+x0ZI1MYOvCbxzsAzEdZe+fkq8A83OtQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Tr6K/aUkY0Mat3ZKR6KUlz0uFVLVMrM7ZzWR+y4trEUXQ7ApMoq4Li0nhtVmlT4qxaBkHYkbg+0wOP26/jhPikkRr7tryFJ+mSJShbt2r61kv1rNR8A5+9gvNBXVVmtTffuyfhYP8WZ2OE3C6SE77bw9Nm+IlSLsjVUYbHrLWks=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oTHYskhY; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oTHYskhY; arc=fail smtp.client-ip=52.101.83.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oTHYskhY";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oTHYskhY"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FW87jAeVShVJunKDG6xMmA/GPcRPow3+Xk0oAs27ya9CcQdgxk1MnweJmnWx4lAUauH1+LcTCGqnVjbfIfU+98s0z8lp823rjjdQQd2vbLJf1NSsHx1gFxkN7gwI4sWTGkaKv25WTTyFoyHA6kCeHysZBLIXbaizBK0PNNjgoQlgSY8oPUXvlrO/i6z/j5viD+K9VL5yNMjDrkCnycAsqASVbk5mC1ybF/ssMo/4a1rAkC+Z3Z7LJVOc6j/+81IJgpHmwyT5R6zAmipyVhbcWgzYSwz21R2ZHJXre/fGbpyBJoDk5SeQQKFZXVfQ3etDVu1J7Qq8xR/MRrbkov9TWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRtlMHjakoyK6jYqQJ2ajEiZiYbDAFx4XbfHEV/d49k=;
 b=dmMhGRyZN0xpMZu9T/CW6A3wzI+RWp4FnpEMIQUEciZPDkr9HCRWAmIMRuoSvaowgj1fT7HbvonBrbpPqH78uRgxjucKbf+koGm6JGWHiQ9caPen6DfJjH6dxyIrXIjDBjNJqQHii8nS4x27d0sBAtxQQim9sOrxgz0xLvHgtM8/kdcyAwLYrnVxSrrf+NFj/O7fm6bBzw5BfmBzG3hFLf0QNFxHFFnjbgYU4ZjmGVkNp7IcAX++Em0N28qLyFnr82cqaSfFph+wA2M6AcwSf4f72oTKoh9v9KykCQLgV2nHt/7jLNz42mAi8UDctlExrySxPC5SsBQDOET703nlMg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRtlMHjakoyK6jYqQJ2ajEiZiYbDAFx4XbfHEV/d49k=;
 b=oTHYskhYWiIAk4jajRvaQXwLxZUtEFNMvDPoNVk0gPz8nEj0k2qfbr3tf6Po3e4XQhY88QohAXv4yvxDuDCYTAH7MmDg+SrKWTvvD7De+Qjgj+wDmjtO3kYTn8L2qf/eRZD0+iyxFOtxGFUNQYT5wBhMnGXcetq/Ia6uHWGn3sY=
Received: from DU7P195CA0010.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::13)
 by AS2PR08MB8333.eurprd08.prod.outlook.com (2603:10a6:20b:555::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 09:09:30 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::27) by DU7P195CA0010.outlook.office365.com
 (2603:10a6:10:54d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 09:09:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Fri, 11 Sep 2026 09:09:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYchXNM7gqnUd9sFIXfMdlHDTJgpOIjYs1X0PP7Pfaz8daM96OXH7oSC1x7uLlxM4hx4VV1IPBaFuLaOpk17LNIMFwAjbopCoqNuSz2OC2t31O5kvTBKIE+3BfiHroDv5AoGlD0EMEDFzw2PRrFK5hyYchA3XnUuApfGjQb840OIdhUPO6HWODtYft6R7BaBqdNFY1DK7bYsIY+2qLyd/D8g6P69xiMcVzXAaIwnNk4C71yjVSHJxjyFrHNkAtnIh5sbGCpbb6F4L88C4Re0OstSdMIJmBnGm1kJhzf74bj0WTzsRK96tLqV1A3JOHtWhA4xNGwAp8d/NQjbDoas8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRtlMHjakoyK6jYqQJ2ajEiZiYbDAFx4XbfHEV/d49k=;
 b=AuiLmxgtftJ5WWDaQmbXghSLESU7/S6vNeXOzisFHdWz4yGr3Zf1JxFcAC8TIrBrWRTotEjuvSeNk/KHUxIJKByV98jI5PWinJQdj01I6mKSpNUjDorrhwY8FBIrMjGUXkrw5+39qp/Kddysx5drnHRxpW38ni2KB8ElufSgAQErKdlBm9ULBPD7Io1mFHgI/rlreasNj8AjqCTDAeU78V1e1sX4XD4X8ivtfDORoHYzGUaBYwxQo9CRuxut0lP4vNqOXQn0cenEfwhTfh3FEgO2gNd1xgdqrVjTzsEhe6t4T01aJvvSrQPIqV+H1G/cN/7kGT2PTXOWPmLacds7QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRtlMHjakoyK6jYqQJ2ajEiZiYbDAFx4XbfHEV/d49k=;
 b=oTHYskhYWiIAk4jajRvaQXwLxZUtEFNMvDPoNVk0gPz8nEj0k2qfbr3tf6Po3e4XQhY88QohAXv4yvxDuDCYTAH7MmDg+SrKWTvvD7De+Qjgj+wDmjtO3kYTn8L2qf/eRZD0+iyxFOtxGFUNQYT5wBhMnGXcetq/Ia6uHWGn3sY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by AS8PR08MB6102.eurprd08.prod.outlook.com (2603:10a6:20b:23d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 09:08:57 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.21.0428.004; Fri, 11 Sep 2026
 09:08:57 +0000
Message-ID: <0b28c4be-4e6c-422a-b9bc-b247feea22d6@arm.com>
Date: Fri, 11 Sep 2026 10:08:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/5] coresight: cti: Convert trigger usage fields to
 dynamic
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
 tingwei.zhang@oss.qualcomm.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 jie.gan@oss.qualcomm.com, nd@arm.com
References: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
 <20260615-extended_cti-v10-1-1c1694b6d8ed@oss.qualcomm.com>
Content-Language: en-US
From: Mike Leach <mike.leach@arm.com>
In-Reply-To: <20260615-extended_cti-v10-1-1c1694b6d8ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0166.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:347::12) To PAVPR08MB9674.eurprd08.prod.outlook.com
 (2603:10a6:102:31d::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAVPR08MB9674:EE_|AS8PR08MB6102:EE_|DU2PEPF00028D04:EE_|AS2PR08MB8333:EE_
X-MS-Office365-Filtering-Correlation-Id: 43019fb8-a24c-4ddb-144c-08df0fe46331
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|23010399003|376014|1800799024|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 KxZveITNSdBdo8iENFzlYFx6RImRGBFzXdPFk/sqvjGcXyrn7D1iH25fOm/TEUxHXwJgDiioltZRXToRaq60WYOon29cQgy1sTWOKf6dmy6NkWDQws1YaCMd6q6jz+du/fObVhGAT6wTWXol5UonyvOBvihbQvS3sgt9sHYNebeRTZCzHLedw6DeREmB0xwm7QiJVGhoKMYthWtAUIUq0qAc+hnY9RI2f3Nq/OMakWnpOSfTxNLXXQ72jUrEZzE3eYS5Ns/q+GxBBYEnYjaxNUDa2kGv27nt663DgGlRFMdx5SqIZNxGAEU3Tcd8/tahMMyDHww2weS2CiMsE7BJhYn/YkX0YgIIj2sKIdjZJa6rDbLdoRGkWSFqV67t/nUe9bKTh4Uy7F74pogQgc2p20h496Dxzhe8qTqnDV2lHkB5b8paAlgJUsm0XUWDGSLdX/x5Vp8s9V0AqGvWVgL1QwA9OMpUnp9KTrXhi6zGJJPhc5F3CnVYLIhBAcC8iy09sE77cPY8titK79sAvda9a32oj0+MPch+eHtih4C22nA8MR+GOIhMfStgTsd6fN+yQ6j2tl0jKijvbN/BpFQ2OBqYIXra0WDY/pO5a0ZL79ifFYxV6Z/hA33LqwsKQWskuZ17qtxDwzIaqN9ic3tpumNWqYEV1xsDTKZIZJ63vSA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 MNAvflJw3qVLTsjiQLWcVGJ+0ZWC00JVHQVz/TR4QyP+tXQ3vtclZBdAnCv8j/pscqB42xluTOVGdzUS66gbWdCaGY3uSR8553X7FrflXb5GkVt7W4dyWhfQmK1Nl0mlvutynX8A+W5Nh7OcF1pdNYcNUM1xNxpDQf9quZKqIg2i3FqelSSHsMRrhYAo/xL6AikxUZ6PDKtnBrrcSYP9NuAJW5ECK9xVW/8vweXdsrOzYmzSmFCiHbMipJ88HwpDPUGRi+p7xQzKZw/0NPjzoH3UbSG3SjyTYNpNh/4gn5EuDLqPBt8Yyz53V6NSSJs3xrZ/gyxsO3sk0Z1ZBUVljQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6102
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5762a2b9-55b7-40ef-66a7-08df0fe44fb5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700016|1800799024|23010399003|376014|7416014|10067099003|6133799003|4143699003|11063799006|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	WveroWxVMebplrNQCX6+7aSMGxcUrSWCN4WjRrjQHsBhN9LGJTb9hQ4in2YpsCI9xKNeQ9/IqusBofsyWnGIjzGVqOK3Ywf0RnB4jLgNWL5a9zkTxmV+AmS07RbGk51TKmNAvF2Xmc60Bzk7GZMovzRNDbLT3hqIy3nyLdVNBc8fbd31/kD71d6aOTTPZ27u9nYd+L4muztqFuNXLpvVpMaTtCS4apzifmdAn8Xbpr20IcS86SL7q+MYgnpip/pKms77Rc3DkIJQmnCyB2VJhmCLSY+mVodPF5tFF40Cj1IyHcqJIIpfHP9L102TqzEEossJkvxocEzVAygaQuv1k71PXVbRkmJx69eIPKtCVPL+oDngXi+oJc28dKe2EOdIDbJDUGXrkY8KZtuyuHwMgCxesGCaByZl8BvgG+fPAU9hiaDp5yUDfdHgdvZG78t/GrDnANaBjoEkGudoG17JgSCtH2WOV46qK1RiowaEccEIh2tO2sY9nTbwWCkl8qyg3vPvAKcI1Al3tvE3gibOlp5D7t3HYiFnUJQ5BubxzdOe4aNG1KPwYpSZApEgjQQ5D4mtNBPBCwRNGaVkyQVSHvjFYcdcRb10Y5xs3QSmec/Ar+28UnZiJibKiJQhWj9V0D6BrfPZLPknyaW0Kf5RG8vMVvaBfeXKSC7clGp7Iv5V8GdGFVu5Mq+r46wm1iBU9gsePfj4usGR8Q/n+3sSzQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700016)(1800799024)(23010399003)(376014)(7416014)(10067099003)(6133799003)(4143699003)(11063799006)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0H2z6ClTQLRwaCPpxM3HrcxOAB+Z5MyAABXDXVwMbwv1+qnyREoxHNwG5lxm9bMaSMDX8FT3RPiCpiI20JyHLnmDeFv9g/9xKQYlMtuo5B53b45XIvqwGyMenbu1AN3pq1GHaXgY2s6k/iuRsmurz9WnGnfYSVzZ4Bt9vXLsOSpxYMNcW3q3rEdnkgAPQdu77XzNZE2XrejoYYDbcFK+qqFixNu4ED0S792wSOVFeeRhhNTKkBYVTEv8Ugd4RlxCNu7z+YyqUg9jLOacUMHpwu2E425Ayhg+7G59f7Y6eFWP2zuaWIYM8x4w5eJnkB7YHOsjiGdbbYwSeeAi9CGJahoug01OpguzKz5odkaNRLjbrN32XYvpW3QqBwzdW+09+ESfeEbSZ1iEg96LgXHffLeafXBSwF1MV/iMXC8sf7krjb84OyU6YN8xl4s3j38S
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:09:29.9943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43019fb8-a24c-4ddb-144c-08df0fe46331
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8333

Reviewed-by: Mike Leach <mike.leach@arm.com>

On 6/15/26 13:32, Yingchao Deng wrote:
> Replace the fixed-size u32 fields in the cti_config and cti_trig_grp
> structure with dynamically allocated bitmaps and arrays. This allows
> memory to be allocated based on the actual number of triggers during probe
> time, reducing memory footprint and improving scalability for platforms
> with varying trigger counts.
> 
> Also add a bounds check in cti_allocate_trig_con() to ensure the caller
> does not pass in/out signal counts larger than nr_trig_max.
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-cti-core.c   | 70 +++++++++++++++++-----
>   .../hwtracing/coresight/coresight-cti-platform.c   | 26 +++++---
>   drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 14 ++---
>   drivers/hwtracing/coresight/coresight-cti.h        | 12 ++--
>   4 files changed, 87 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index b2c9a4db13b4..572798ab504c 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -161,8 +161,8 @@ void cti_write_intack(struct device *dev, u32 ackval)
>   /* DEVID[19:16] - number of CTM channels */
>   #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
>   
> -static void cti_set_default_config(struct device *dev,
> -				   struct cti_drvdata *drvdata)
> +static int cti_set_default_config(struct device *dev,
> +				  struct cti_drvdata *drvdata)
>   {
>   	struct cti_config *config = &drvdata->config;
>   	u32 devid;
> @@ -181,6 +181,31 @@ static void cti_set_default_config(struct device *dev,
>   		config->nr_trig_max = CTIINOUTEN_MAX;
>   	}
>   
> +	config->trig_in_use = devm_bitmap_zalloc(dev, config->nr_trig_max,
> +						 GFP_KERNEL);
> +	if (!config->trig_in_use)
> +		return -ENOMEM;
> +
> +	config->trig_out_use = devm_bitmap_zalloc(dev, config->nr_trig_max,
> +						  GFP_KERNEL);
> +	if (!config->trig_out_use)
> +		return -ENOMEM;
> +
> +	config->trig_out_filter = devm_bitmap_zalloc(dev, config->nr_trig_max,
> +						     GFP_KERNEL);
> +	if (!config->trig_out_filter)
> +		return -ENOMEM;
> +
> +	config->ctiinen = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32),
> +				       GFP_KERNEL);
> +	if (!config->ctiinen)
> +		return -ENOMEM;
> +
> +	config->ctiouten = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32),
> +					GFP_KERNEL);
> +	if (!config->ctiouten)
> +		return -ENOMEM;
> +
>   	config->nr_ctm_channels = CTI_DEVID_CTMCHANNELS(devid);
>   
>   	/* Most regs default to 0 as zalloc'ed except...*/
> @@ -189,6 +214,7 @@ static void cti_set_default_config(struct device *dev,
>   	config->enable_req_count = 0;
>   
>   	config->asicctl_impl = !!FIELD_GET(GENMASK(4, 0), devid);
> +	return 0;
>   }
>   
>   /*
> @@ -219,8 +245,10 @@ int cti_add_connection_entry(struct device *dev, struct cti_drvdata *drvdata,
>   	cti_dev->nr_trig_con++;
>   
>   	/* add connection usage bit info to overall info */
> -	drvdata->config.trig_in_use |= tc->con_in->used_mask;
> -	drvdata->config.trig_out_use |= tc->con_out->used_mask;
> +	bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_use,
> +		  tc->con_in->used_mask, drvdata->config.nr_trig_max);
> +	bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_out_use,
> +		  tc->con_out->used_mask, drvdata->config.nr_trig_max);
>   
>   	return 0;
>   }
> @@ -231,6 +259,14 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
>   {
>   	struct cti_trig_con *tc = NULL;
>   	struct cti_trig_grp *in = NULL, *out = NULL;
> +	struct cti_drvdata *drvdata = dev_get_drvdata(dev);
> +	int n_trigs = drvdata->config.nr_trig_max;
> +
> +	if (in_sigs > n_trigs || out_sigs > n_trigs) {
> +		dev_err(dev, "trigger signal is out of range: in=%d out=%d nr_max=%d\n",
> +			in_sigs, out_sigs, n_trigs);
> +		return NULL;
> +	}
>   
>   	tc = devm_kzalloc(dev, sizeof(struct cti_trig_con), GFP_KERNEL);
>   	if (!tc)
> @@ -242,12 +278,20 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
>   	if (!in)
>   		return NULL;
>   
> +	in->used_mask = devm_bitmap_zalloc(dev, n_trigs, GFP_KERNEL);
> +	if (!in->used_mask)
> +		return NULL;
> +
>   	out = devm_kzalloc(dev,
>   			   offsetof(struct cti_trig_grp, sig_types[out_sigs]),
>   			   GFP_KERNEL);
>   	if (!out)
>   		return NULL;
>   
> +	out->used_mask = devm_bitmap_zalloc(dev, n_trigs, GFP_KERNEL);
> +	if (!out->used_mask)
> +		return NULL;
> +
>   	tc->con_in = in;
>   	tc->con_out = out;
>   	tc->con_in->nr_sigs = in_sigs;
> @@ -263,7 +307,6 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
>   {
>   	int ret = 0;
>   	int n_trigs = drvdata->config.nr_trig_max;
> -	u32 n_trig_mask = GENMASK(n_trigs - 1, 0);
>   	struct cti_trig_con *tc = NULL;
>   
>   	/*
> @@ -274,8 +317,8 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
>   	if (!tc)
>   		return -ENOMEM;
>   
> -	tc->con_in->used_mask = n_trig_mask;
> -	tc->con_out->used_mask = n_trig_mask;
> +	bitmap_fill(tc->con_in->used_mask, n_trigs);
> +	bitmap_fill(tc->con_out->used_mask, n_trigs);
>   	ret = cti_add_connection_entry(dev, drvdata, tc, NULL, "default");
>   	return ret;
>   }
> @@ -288,7 +331,6 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>   {
>   	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct cti_config *config = &drvdata->config;
> -	u32 trig_bitmask;
>   	u32 chan_bitmask;
>   	u32 reg_value;
>   	int reg_offset;
> @@ -298,18 +340,16 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>   	   (trigger_idx >= config->nr_trig_max))
>   		return -EINVAL;
>   
> -	trig_bitmask = BIT(trigger_idx);
> -
>   	/* ensure registered triggers and not out filtered */
>   	if (direction == CTI_TRIG_IN)	{
> -		if (!(trig_bitmask & config->trig_in_use))
> +		if (!(test_bit(trigger_idx, config->trig_in_use)))
>   			return -EINVAL;
>   	} else {
> -		if (!(trig_bitmask & config->trig_out_use))
> +		if (!(test_bit(trigger_idx, config->trig_out_use)))
>   			return -EINVAL;
>   
>   		if ((config->trig_filter_enable) &&
> -		    (config->trig_out_filter & trig_bitmask))
> +		    test_bit(trigger_idx, config->trig_out_filter))
>   			return -EINVAL;
>   	}
>   
> @@ -687,7 +727,9 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   	raw_spin_lock_init(&drvdata->spinlock);
>   
>   	/* initialise CTI driver config values */
> -	cti_set_default_config(dev, drvdata);
> +	ret = cti_set_default_config(dev, drvdata);
> +	if (ret)
> +		return ret;
>   
>   	pdata = coresight_cti_get_platform_data(dev);
>   	if (IS_ERR(pdata)) {
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> index d6d5388705c3..ba5a7e4b6bff 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -136,8 +136,8 @@ static int cti_plat_create_v8_etm_connection(struct device *dev,
>   		goto create_v8_etm_out;
>   
>   	/* build connection data */
> -	tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
> -	tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
> +	bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
> +	bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
>   
>   	/*
>   	 * The EXTOUT type signals from the ETM are connected to a set of input
> @@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct device *dev,
>   		goto of_create_v8_out;
>   
>   	/* Set the v8 PE CTI connection data */
> -	tc->con_in->used_mask = 0x3; /* sigs <0 1> */
> +	bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
>   	tc->con_in->sig_types[0] = PE_DBGTRIGGER;
>   	tc->con_in->sig_types[1] = PE_PMUIRQ;
> -	tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
> +	bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
>   	tc->con_out->sig_types[0] = PE_EDBGREQ;
>   	tc->con_out->sig_types[1] = PE_DBGRESTART;
>   	tc->con_out->sig_types[2] = PE_CTIIRQ;
> @@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct device *dev,
>   		goto of_create_v8_out;
>   
>   	/* filter pe_edbgreq - PE trigout sig <0> */
> -	drvdata->config.trig_out_filter |= 0x1;
> +	set_bit(0, drvdata->config.trig_out_filter);
>   
>   of_create_v8_out:
>   	return ret;
> @@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
>   	if (!err) {
>   		/* set the signal usage mask */
>   		for (idx = 0; idx < tgrp->nr_sigs; idx++)
> -			tgrp->used_mask |= BIT(values[idx]);
> +			set_bit(values[idx], tgrp->used_mask);
>   	}
>   
>   	kfree(values);
> @@ -316,24 +316,34 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
>   {
>   	struct cti_trig_grp *tg = NULL;
>   	int err = 0, nr_filter_sigs;
> +	int nr_trigs = drvdata->config.nr_trig_max;
>   
>   	nr_filter_sigs = cti_plat_count_sig_elements(fwnode,
>   						     CTI_DT_FILTER_OUT_SIGS);
>   	if (nr_filter_sigs == 0)
>   		return 0;
>   
> -	if (nr_filter_sigs > drvdata->config.nr_trig_max)
> +	if (nr_filter_sigs > nr_trigs)
>   		return -EINVAL;
>   
>   	tg = kzalloc_obj(*tg);
>   	if (!tg)
>   		return -ENOMEM;
>   
> +	tg->used_mask = bitmap_zalloc(nr_trigs, GFP_KERNEL);
> +	if (!tg->used_mask) {
> +		kfree(tg);
> +		return -ENOMEM;
> +	}
> +
>   	tg->nr_sigs = nr_filter_sigs;
>   	err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
>   	if (!err)
> -		drvdata->config.trig_out_filter |= tg->used_mask;
> +		bitmap_or(drvdata->config.trig_out_filter,
> +			  drvdata->config.trig_out_filter,
> +			  tg->used_mask, nr_trigs);
>   
> +	bitmap_free(tg->used_mask);
>   	kfree(tg);
>   	return err;
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index 3fe2c916d228..2bbfa405cb6b 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -719,12 +719,12 @@ static ssize_t trigout_filtered_show(struct device *dev,
>   	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct cti_config *cfg = &drvdata->config;
>   	int nr_trig_max = cfg->nr_trig_max;
> -	unsigned long mask = cfg->trig_out_filter;
> +	unsigned long *mask = cfg->trig_out_filter;
>   
> -	if (mask == 0)
> +	if (bitmap_empty(mask, nr_trig_max))
>   		return 0;
>   
> -	return sysfs_emit(buf, "%*pbl\n", nr_trig_max, &mask);
> +	return sysfs_emit(buf, "%*pbl\n", nr_trig_max, mask);
>   }
>   static DEVICE_ATTR_RO(trigout_filtered);
>   
> @@ -931,9 +931,9 @@ static ssize_t trigin_sig_show(struct device *dev,
>   	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
>   	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct cti_config *cfg = &drvdata->config;
> -	unsigned long mask = con->con_in->used_mask;
> +	unsigned long *mask = con->con_in->used_mask;
>   
> -	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
> +	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, mask);
>   }
>   
>   static ssize_t trigout_sig_show(struct device *dev,
> @@ -945,9 +945,9 @@ static ssize_t trigout_sig_show(struct device *dev,
>   	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
>   	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct cti_config *cfg = &drvdata->config;
> -	unsigned long mask = con->con_out->used_mask;
> +	unsigned long *mask = con->con_out->used_mask;
>   
> -	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
> +	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, mask);
>   }
>   
>   /* convert a sig type id to a name */
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index c5f9e79fabc6..ef079fc18b72 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -68,7 +68,7 @@ struct fwnode_handle;
>    */
>   struct cti_trig_grp {
>   	int nr_sigs;
> -	u32 used_mask;
> +	unsigned long *used_mask;
>   	int sig_types[];
>   };
>   
> @@ -145,17 +145,17 @@ struct cti_config {
>   	int enable_req_count;
>   
>   	/* registered triggers and filtering */
> -	u32 trig_in_use;
> -	u32 trig_out_use;
> -	u32 trig_out_filter;
> +	unsigned long *trig_in_use;
> +	unsigned long *trig_out_use;
> +	unsigned long *trig_out_filter;
>   	bool trig_filter_enable;
>   	u8 xtrig_rchan_sel;
>   
>   	/* cti cross trig programmable regs */
>   	u32 ctiappset;
>   	u8 ctiinout_sel;
> -	u32 ctiinen[CTIINOUTEN_MAX];
> -	u32 ctiouten[CTIINOUTEN_MAX];
> +	u32 *ctiinen;
> +	u32 *ctiouten;
>   	u32 ctigate;
>   	u32 asicctl;
>   };
> 

