Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B3D3B2FDF;
	Mon, 21 Sep 2026 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997449; cv=fail; b=c5IUX9QQ8ncO1TpsF4YSc6+o4HlsrWUiXw2Z7xeIRoYkeibwL3jv/A8qsRbLJAErikwnKbX/z4czLTz4iu//SGEwJca8xj0hs8xmB11DB6fPtXq9qtj7YvwHj6GNNflJHzD8TcmWP9PeZYPSRIKjb2y9njW6FdTKBFUvGO/oBnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997449; c=relaxed/simple;
	bh=OoOR+Vjm3aSP5xAZhs/zMxhGdxRHznEt5WLHbMWXv28=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=blIl8baAPJ74EbwswKMxVKdTmLP59pG3vh3pAEgzTQb9rweRQeQWL4o8qIpralrbgCNC8OEesTuPe2N8dbNIwTyaKKtmcNtnLjTgWWmJ89SR+8x/rVu5gv6pk2YcNvtVpDS3FAUA21eu4XQVzi4M6dKNQKWdF3Bkonpabat+oH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ddC/OmOz; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dManExfp; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ddC/OmOz";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dManExfp"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68LAfJwr3548223;
	Mon, 21 Sep 2026 08:30:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=d35ezR9GNdyBwKhoDjz7pmtkTvcfaB558vFft+Mc6
	CE=; b=ddC/OmOzVjmvqHddXs3OJgTMwEKR7ZOT7cf4Y6pLpZFODZ4cHveOYDr5n
	HYbGEBDSjj27JQMR3gQuDuDKN21KWbUvn0CZnHhyxNFimlOQXtXqs2VlgyhzUXp3
	bIeOZ3mudRpsvUz9Hz9e8YkbhPqM79egyvZCGA7NlXDlM8liFETGrTE/zcsYosEd
	/yiEheBqcFLzKmJ8TxpRtgkpqQCZ5x9E+dL+fCxQv8E4uL9dVnCPXEGE3FdaGgtv
	LUaojPtz3qOVNKtWSJhvoBgq1mQTxTt5JRIO/6e2IHXf4As8G/6YgcchXrteneYf
	+dPHgjK7MhBeDN157KbRHdMMro0FA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gtbdneu70-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 08:30:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kcbwwm47QYNAZUcFEflHx3Qt7PBY6gy4kl6tWCh0auRzeqIkCGXtkARpLWfh5KZcTWWVVkWd9ZDfj1bBONYTRQFIz5LcgMCT9vUNCNQVXkfVTysYVz5vJvgceIFk4435CgQAZiqbdiv2j1bkfc4xUbdBy8OUXfBrAdnQdFvcrc458GVG0JfB3nDhbZF7gBzXXHHUuC+EASFIwH4Yv+mtMzj58ERnUJ/lQfEXYwYU/f2qu8ETw2JnOMzHWfUUIblWFTX3PObe0bBTUPh7ylTCnndST1lkE+qpxMv2fyNkBajx91enyUaveu/Kz8CJA5kuv+DrqRCSsQdhjgeRWZyB/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d35ezR9GNdyBwKhoDjz7pmtkTvcfaB558vFft+Mc6CE=;
 b=kFzsyS4jA71ed2lfJ0C05XkxfdeQdnCMK972W+qa3OxBSR9LoHp27GpNVHtlfy7LSc95MFH1Qy+LPfYRx2H6wKZ/qDXd0Jk7fZxobdH4ME0TsqYX1YpxfxywTRTgcfTao0kKkhHb3cHEmfx2I6JeUU2vn5eWFIqwhDeFuxLkBEloSW0We39Fhpip/ajP0RFE+kyf8yuhBRhYVihP3C0IzLFl23xR6WjDW4b5Mr7oK6D5Qa8qGK37oRDuZlTFJpAUkPPoQQD11KXgL8Ag5uFeAN+bRBvvQtDElxaBjG1UbjvhBAufKd53Zs156nRdpXYcsLdWGRQhpyUr51ztf3HtZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d35ezR9GNdyBwKhoDjz7pmtkTvcfaB558vFft+Mc6CE=;
 b=dManExfpm5zHoEZA3NpbDKdDLsyq8Iv37VDjX5eLk+EeaCMsuPROsBeyxtKE9oQ/hA1EshOPIw1gKCV2X7Npk2gYCLgOKBXH3ltj0Jhg3qvTGjtrhqMLYrUkKI3f/dn5rhSkpkExVrPuTiWOKbKkSQwkQYSOAbJx//r2KLhtgQc=
Received: from SN7PR04CA0231.namprd04.prod.outlook.com (2603:10b6:806:127::26)
 by CY8PR10MB6779.namprd10.prod.outlook.com (2603:10b6:930:9a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Mon, 21 Sep
 2026 13:30:07 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:127:cafe::3d) by SN7PR04CA0231.outlook.office365.com
 (2603:10b6:806:127::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 13:30:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 13:30:06 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 08:29:51 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 08:29:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 21 Sep 2026 08:29:51 -0500
Received: from [10.24.52.125] (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68LDTicK3062859;
	Mon, 21 Sep 2026 08:29:45 -0500
Message-ID: <adf8dbe9-3f44-441b-80c2-72932a6e1bef@ti.com>
Date: Mon, 21 Sep 2026 18:59:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/18] Add DT support for CSI2RX multi-stream
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Yemike Abhilash Chandra
	<y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
 <cd6818c3-bbad-4ab4-9a4c-4d9eda0ebc10@ti.com>
 <44905087-dcf0-4ca8-a4f2-814737746435@kernel.org>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <44905087-dcf0-4ca8-a4f2-814737746435@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|CY8PR10MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: 2733852a-fed0-4b04-aa4b-08df17e47382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|23010399003|1800799024|36860700016|13003099007|22082099003|18002099003|56012099006|4143699003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	F28k2UZ/DaK8i2s9ad/6f/Alan2gr3VOpOcg6JBw3Y2EuRcOa/KM5s/7N6OS/XnvXwWSWj+zC6+0G00ddzDQWxJd2FgrXEAhT2Lf3jfJe5fWMJaX6IlofKKxwmfV/tEFDoMw0BRtDxtcMGT1W5cQu1eDQrBg5p4fowTCNzX4wsutrDcSeFBfUr5bBQTZ5RbXaE1d+p1n0TcwenI20BWJJDTMiVR927SRfPYGvzKHc2y6sIRQJrNgD6Fn+GhrmgGwcPmNO3kvoYCcWeYFhee8JO4aSY2KH4Rdqx6Gd5MT2T6jnAwqKW74A6fCx5nQH8wIiVuB3MQ5OrtrT7zJDjQFvxpSD7OwwWy7KKpZCJ4J16gzxvUvON15Vdb8O0/zej2aDWztmhCesR4SheIG0UR0yhCcCo88mt8Y7u9m8MxJoirwSQNaNgDh0LIA/ZbVNIJ/0yoJhNDtCEnxOgqI8S6zGZc7CCKdfLrJjuzPYCUdex77n9ClfSyTwn2pFumu/BuNrovyvOYlazBJrpEtnzx+5AaRyuOB/oEA0xzbXpKqquK9fTyNfp1rubMNzx7GCBmi1L+7Mje5vyGn8F95KqLn3/tX+KtLCH2yD8wJ7qHmj/BMldb4fatauOzhOGBOk4mT50VcWb4rPZeQcff9whysXGDX2uV+dI13CqY7jrnjqfwRO5tPuLezDzYDZ1ZIDSz853ArwxBcPg5soPAU/PpOng==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(23010399003)(1800799024)(36860700016)(13003099007)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DtV2xpokYIxLbsuHTn4wBIkQAFI53nHfhtpKbF6a54XTY4gY2VWQ2sYMwOLz2ttuk7EQjCuychON9fDV7vGm5mELxoHvBT2Mo4ydu3/5O86dtbiyztPUrUx1E522bKC6k4IQvee+zMSaJelBW4rjs02QkxFRUTn5XRxdKSK4EwrKdzP+ElPmSLB4/2OmLLKaY1XtGKiUdweLCN/HJAh+2IMe1LnMZnoToMZ+OX5ddMxVVrOnXFc99S6vJtPyisEmq1YMe9BPXU+oi7vJho34fdOhbhGphLyNXAqz6FZIia4Q0hcFPFaaZNkBtmdJ/G41PLPZZCtcz6hvE4WnFua1hbUZqtGs/4BgVBZzCNna+zile/cT9QozLsXzm7Pv6+7OeX302mC+Vr0MBfeqFQKCcsR/F9UE2vnbzl+DM2kNQYt8Ww6h7KFlKMMUAMQOz31W
X-Exchange-RoutingPolicyChecked:
	nb4vlrWcOzVQpVQP/9DSpNqUI6+B1YaIIwcYXUeO9BJtFxIXpnUrzRGvI95RwmSckFdct/j/EQTVnaPFcD4KavwK8VzRHpagg7+Iz8ZQyZ5Nm/x4hWQLjicMjgsyENYJl1uOrdkGaFawav4XwlIv2koGx11/zKAW1By601hUFbQYKWWxZPG+VEed0EeyWSKmD0RbQRLCcBoO89quiZ5zUEmUKjYQOJwV5oHQZN8/5Q8ik04e1F+8mlciAZDyYQb+98RqjNL+Z0ON4/J/BLS4QRBMFiLejF9zCj1Oa3cFiSCSX3A0KJA5r5yYYikBvuk6r5RMlE1YYmtjq5eKIqpusw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:30:06.6994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2733852a-fed0-4b04-aa4b-08df17e47382
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6779
X-Proofpoint-ORIG-GUID: Bej_6oN15y40Z4wTxXZ_mOdMHcAeyfQG
X-Proofpoint-GUID: Bej_6oN15y40Z4wTxXZ_mOdMHcAeyfQG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE5NSBTYWx0ZWRfXzW6DZbb9y9ke
 zGsRTdxu0FafScKwcrXBpVi2vGUptLSVm783rswlrLw7Lo7QQwD7PMXc5ekNR+yKXIEi3ibc4EG
 lfoJwBHr/xiMkoFmrO03AGdCVG33oGaLSCW0nBT58FfmHZhqXxhwPcJgQmhxIDmZWgBYOt14qtH
 ypkNZ5IRZ+RPOFXF85FE3yFKHbkjlZNDM0rDyr4jEp2Phgt/ALZdApKx4RXNWpI9VQf66WJUCcM
 ejNxmmWZXvyiVNLRBGA2TDZ3NjZIrZLvA25I/iesv4GOHTeuekx5+vzVyPWHw7QdU8BF4zd9TDF
 EBMIledhMau+7rTrwbscUm6MFxHZ+WSrhuRRz07PWVCeUbxq8Rq1aQ7ATScRZTT9NlH+qWEbhf9
 meJOU5dbScTMwHRv97fP7g1nEqqmqXPje8yGxYpUmj/cUrT19Tx1441KYVvNWhCuiMZvDUsagar
 Au7Du4S/bdxkxXj1ZIw==
X-Authority-Analysis: v=2.4 cv=bpDZl0ai c=1 sm=1 tr=0 ts=6ab13162 cx=c_pps
 a=YOgfsySBG6Gh3lLixmEA+w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=JDnjcqFthey6cqCdFGcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE5NSBTYWx0ZWRfX4ys0GE6s1qOz
 BlbNMe5Xf0ijIErCNbWE3oBg5pL3L/f9IGFD4dWWKYBUMm+4khRjP3rrF/KjXi80tjHhC53bX/G
 hZxyLhe+P+wiL15UD42BAJUw2vNzxyE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1011 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210195



On 26/08/26 12:20, Krzysztof Kozlowski wrote:
> On 26/08/2026 07:46, Rishikesh Donadkar wrote:
>>
>>
>> On 13/07/26 17:04, Yemike Abhilash Chandra wrote:
>>> Support for multi-stream in j721e-csi2rx.c driver was merged last cycle[0].
>>> This series adds the corresponding device tree support.
>>>
>>> Patch 1 is a cleanup fixing indentation in the existing CSI2RX nodes.
>>>
>>> The next few patches i.e. (Patch 2 to Patch 6) add the additional DMA
>>> channels required for CSI2RX multi-stream capture.
>>>
>>> Multi-stream capture uses a SERDES pair based on the FPD-Link or
>>> V3Link protocol. The serializer takes the input from a camera sensor
>>> and converts it to the FPD-Link standard, while the deserializer
>>> aggregates streams from multiple serializers and sends them over the
>>> CSI-2 RX interface. Each CSI2RX instance therefore indirectly receives
>>> input from multiple sensors.
>>>
>>> The remaining patches add overlays for various deserializer boards,
>>> and for the UB953 serializer with the IMX219 sensor. Also enabling
>>> DS90UB960 deserializer and DS90UB953 serializer drivers in the
>>> arm64 defconfig.
>>
>> Hi Abhilash,
>>
>> Thank you for the series. LGTM !
>>
>> For the entire series,
>>
>> Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> 
> You did not have comments for v1, no comments here, so are you really
> reviewed it (considering code has obvious issues)?

Hi Krzysztof,

[PATCH 01/18 - 06/18] enables more DMA channels to support multi-camera 
use cases. I checked the DMA thread ID ranges in the TISCI docs [1] 
(search for "csi" in "<platform> PSI-L Device Descriptions" links). I 
don't see any problem in these patches.

The daughter card overlays added in [PATCH 07/18 - 17/18] have undergone 
multiple rounds of offline testing in TI downstream tree as well as 
upstream. As shown in the test logs attached by Abhilash, everything is 
functioning correctly.

Thank you for pointing out the code improvements that I missed, will 
take a closer look next time :)


[1]: https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/index.html

Thanks & Regards,
Rishikesh


> 
> Best regards,
> Krzysztof

