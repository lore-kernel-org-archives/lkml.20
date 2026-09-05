Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66718331EBD;
	Sat,  5 Sep 2026 13:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613239; cv=fail; b=shvDbsF9g7m1BxYs2Fgl+MEDdpghAPLD9W6mCxUZfOaRYBuHWyb47PEb8auRGwvHa8La0/Ba7/0BI6MWbWiw67yeIz4DWP/+bhSbgaDashDiaak9kjiHhdevmGn5wfFj/EPcFTuHeDw+ij7jPQZpZZzRzIuvd8gv1/Ql3B9vVBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613239; c=relaxed/simple;
	bh=0ygDNg5VcWHHnBQPxSofZ2jIDkBxl/wla0wqovBUXPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Fh3M4zi3YFIrcq82ea7pGjBLTuKxeA0l9NSSGno8SGjyT1WZhPMRGgI/qxWWr+13Pv38CgwhT/tiXI9N1BPFFISJ7aWqInRy7MS1cuAZBru8V8x3PtxjH2I7ppSTxLeKyF0s0PBsrB4ZCJyA2rBxCxN1RSG7Ay3IoVMZwQSzKgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ghmkpbl0; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OXJxCCem; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ghmkpbl0";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OXJxCCem"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685BUdnT1885998;
	Sat, 5 Sep 2026 08:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wqo6bMrTQlQH9jrMeizdPnyRKuLc7Scvp+vg8edW8
	/E=; b=ghmkpbl0Sh7XCL4CCvUEvzGxuBxod0rRXCcbjTaifXAhC5boOi1uuQYXy
	O4aichPFm3UaILQBTdXpEQkt1VfnO+NcfGI7N0vmhWs+JukjnvFnOCvRUOlL+tY2
	E3Gy4sxYAl9XyHM2s4HF5TW5bXBjueb0KAcyYhXFLcm3wP653p2knRZA82YFHZI+
	utkhdxF9uIx8fqWjX6biyEzqY0b2fADYjwMROzy5cke8iLkElrJEjy6FXKSbBXEp
	OEeTTkQ5iUjsuihGN3ZMeLfmNZXWjn7XXHlpZoiNqM4Wet2DHeitXcB/Aazov8FT
	vBpL8nIGT82B2KAiG5+H1CrvoXNIA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010006.outbound.protection.outlook.com [52.101.46.6])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gfyyq5rx0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 08:00:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhKbo4MP/JQ5PnNwdxh+j028rC1KZJF421vTvRst6LtowzjD/4xsQs/kE/W0sxR0kZKmCyXiySKAi0fYTF+q3XEW7Dw20DK32+0Be5ReOHPD+iUT8fcPRzIhXRWVE0vxM39ZqtKr1Wtlw36KbmtG/9fHQNRP6H0QMclQqUvZDq8G7pek42zHHuEe9DWY8i5snAjoA5vVzNtKdpqyuyr62cM4vkMlNkYMoEkLg3lFzqfqZ5YYQ6qqAldI2uWtuNk2LZltfJOR+3T6G0rqGRTmGoYhqjAlz0+jJwZqFXMbnx6dLbSflIMGfjIl9hT08/oi8UYqXYH4tcGUPgLY6ssNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqo6bMrTQlQH9jrMeizdPnyRKuLc7Scvp+vg8edW8/E=;
 b=DBHY1q69eMbnCvyOZojSqoHp6dcF9AWTD2DhDI5GCPhZ0pXlqm/VixATTguexDmGoDvphA+kNPNnJe4tM9K1LkoDs7r4tIyvfq58I2C4tOQYw9vrMjlz1fqvRezTvBu69q2qx9CycN4c6fRxnXeqH80JGp0J+4Yyhcc9pV2s99fm6+S3o1EqGfoD8iE9TnmCbcA+aDxCN4AJgwZ7A7ET3ubiCy+MXMhQOhHkv/WWR/Zb7gkb01shJ4GftoRg6Jn+6yCUyvYnrhF9Hk0931ME8wWh1BcfT5H/uzOpFYa4j8Ke88fHOBd84UowV2Wfzdiat3VLlt5sQyYH6SjRvjfZ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqo6bMrTQlQH9jrMeizdPnyRKuLc7Scvp+vg8edW8/E=;
 b=OXJxCCemrbF4k7DeKUBhXvHPkvJ9Lk8N6OXxxke4ORUb9pZyWVKHGVu/CkUV0o4vgPXzEIkXtiXufAEfSlP/p0KeXHMX/0fSEQLza5ZB8Sc3e22q2O5xBZ0tYTiz1WduFFYR5pYpX1a+gA46M+NR+NN/3S8pf+qnKqLGPm6EnN4=
Received: from MW4PR03CA0218.namprd03.prod.outlook.com (2603:10b6:303:b9::13)
 by SA1PR10MB7756.namprd10.prod.outlook.com (2603:10b6:806:3a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Sat, 5 Sep 2026
 13:00:18 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::78) by MW4PR03CA0218.outlook.office365.com
 (2603:10b6:303:b9::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.14 via Frontend Transport; Sat, 5
 Sep 2026 13:00:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sat, 5 Sep 2026 13:00:16 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 5 Sep
 2026 07:59:45 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 5 Sep
 2026 07:59:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 5 Sep 2026 07:59:45 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 685CxegH2197313;
	Sat, 5 Sep 2026 07:59:41 -0500
Message-ID: <bd2fe0c4-1657-4dfa-a34a-c8873a96f646@ti.com>
Date: Sat, 5 Sep 2026 18:29:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: ti: k3-am62p-j722s-common-main: Assign
 SRAM to VPU node
To: Brandon Brnich <b-brnich@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>
References: <20260810205206.685971-1-b-brnich@ti.com>
 <20260810205206.685971-7-b-brnich@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260810205206.685971-7-b-brnich@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|SA1PR10MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d55d33a-f03d-4782-ad6f-08df0b4da20e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|921020|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2B0IgHpTaH64AjQk+lGhODmcdBOLgcuUnLIIjBNT9K6qjZsT7LHpBoiycYTnOcap94VdPOIQ85uM/dol5Ars/J214exftenZzIZq2Ll0J1AQfPk6Qb9wTY7dHuTl6YU1B9Rme+w16nffIWkd4oztjUHE3015UETZtE5onQ13Mo1sZkbgwRGgqZN2PI7jueR/DKyWHfhNHTP0joNc1NwpriceyFAmP7vghclbywqYCM6QgICU2v/bfM37t6mIEAp8Ak+80EaY52EZ5H64lyoN8Yu7L/Cf2g8CwyTMCcgA3xiWvIeghCejkpVx82NZYdWsNaJiumRIJAwVIt6wbXheIv5Ci2Rt8W3ERvJnsQEcdh89NwvZon34KIO54yoLxhEDe6WRsBIWzPawmO8f6vcKPbRIzTrKAeRzYh3+3gfzr37RkqJCYejdKZMe+wLZ1DLKMi1Ex2b1tbPTyz/Qfpl3CKuCOxswTz4AKw+RbLTCCRmyxBXYsKKaA89Y+KEuNcqnR/hx1II2DTsqJ0tXYIiY5q1UJuQFpY7oD3KKg5qGmwq9wvEkpBUccQLTzHSA+jaUw5DalO6XBBE64NS8vXxrM/Jdwr8D5gFwP0YBdjQZq3C2948nZgTq+ARoQulWZUQeWHMX5mSGs5Vj8lE908ovZKa3loiatPqjXf5ptLD/OQ0UUJS+CtZsO4s7y0z1moWRo3skqdrf8Faj4yOEqFK2JmiLpeQOu9psav+l6DxooM0Mhd9o3C1MPD2K1Di3eKzb
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(921020)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lZ05QPdCcRetu2QthAk9mwSqKOseswGqt0KgUvykejcR5+8xpV/ga+RERhkqhH4ok69ASlU7tjl7Y5ix3+gfQgaZgn27sRpmfuUvDv585qrMgw+lj8jOtb1V+2XeE59lEIbz7vCAMbqqeFZu6QBotnASXU75dRb0o0ocrHeNxhrqbPckVt7rUOvnFK62dXzk/P1kR89/w6S//Ti97cXefj3MQitpEhHuRBueo6uwPa+l/2XuUwWHIHTaTiIW8LrpJOGa1HFeCvL91cHCpYAPs4sAzml62WMVr365eGHnuMq2g3Y/ZxWOh5lA6PKCboHfQYSC7LmQ5vIeerWy+x7/ihWm1APX9zp7xPT32lALSmsNSy1Mem+NaxDJi3fDVH/7577RuHs8wJehKnZTNUBv3XwUsdFWISNTB+W3CXXZ4dazx/m96fPAbbSnuMEP9yR6
X-Exchange-RoutingPolicyChecked:
	cESNKGPrB+FYtTTdTHT0gGTnRxxzV7dM7ubneykWW4I+HmCn2xMQtznPDc2obXzjqpN0h/ZzdUQhqT14kVr0Yczw1lfP548gOZf3lq9zVcvJasSmpr+n1WoQZmggYxNrMyehvE3pgv4evDSGecZ3VCcTYubV2aDPcdU3sFGNJe7H1Z0BU3RhFG9wR+mrVmoGuFuhXZpkM5zOSlFVD776j8cfdUAYPxDuSKpUEGXvnob0KR1dZOyfK6VCazQFO1WnaTrKntf4uOp+JP23cPYKBH781pocTiLJ+WGOuigDL7X8S/8wLhyWgLqtcoRMyV13F+O8zBnySNcMk5hgnKQtVw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 13:00:16.7861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d55d33a-f03d-4782-ad6f-08df0b4da20e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7756
X-Authority-Analysis: v=2.4 cv=AfqB2XXG c=1 sm=1 tr=0 ts=6a9c1267 cx=c_pps
 a=KOHnGYwbv2QpRqiwWHMRyQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=4bPgbMrSjmlkycFVCvgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 3HEfcm7kS1Dg8KXNrSxIuF0vY_wshscn
X-Proofpoint-GUID: 3HEfcm7kS1Dg8KXNrSxIuF0vY_wshscn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE0MiBTYWx0ZWRfX8N3J9+Qg45Cu
 Hp4hrGHx5jt17OvodHtsmK9SmXwIbamODL9N2mDxkUKJh649KR6c0f9X/g2T1Z5cq3kCV4wm9rF
 bBNA9RdothLdiEChXl0Hgo8dHzArGR9OMkGwcuGEkQB8rXCy6bkUEXJWCehVR/ulIlMmsFPKETc
 dwwn0tXD0vdQ1b0UB0KDZhm/dzhNNT8dUHVJ1CRiY25mSBcd1K5ZHehHx8KOXBeN+A3YSLXOyXH
 FabdKUnCdh3P39c5FToteMhe8NIhwS2MUq8PP9CZ5BeWxMKreRab3HiEWDO5VPRbAq3MWeKQIGV
 n2iU2VHoHEg3kmcXDmfUVCa+MhHCBlXqV2bbs0LbcQ+uyPwRPyGdJZBnG3yztAIeENRG85rUFY2
 XxYm5CsUFh6w44p+S+tWierGJFcSanxKUrq98x9muUzKhenpD6gGMCm3vrZk8cMKMmPbeNIvGhX
 ZfQWfjBysmM4khNM6cA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE0MiBTYWx0ZWRfX8gti1Kwh4Qfe
 U34Hkwb6W/UWlstq4kXpxIgbSbFWuPjg4Q636l1+xfDK0J0XalDsLY9IU0p/xr2d4sAfmonhbhv
 oozUMpw+kX+Bpta6lHO4ppdFvkTFj78=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050142



On 8/11/2026 2:22 AM, Brandon Brnich wrote:
> The Wave5 VPU supports connecting to on-chip SRAM through its secondary
> AXI interface. This allows temporal buffers to be stored on a per-stream
> basis, reducing DDR memory traffic.
> 
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> index f130c7cb998d7..61e3588bbfdc5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> @@ -1117,6 +1117,7 @@ vpu: video-codec@30210000 {
>  		interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&k3_clks 204 2>;
>  		power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
> +		sram = <&oc_sram>;

Reviewed-by: Udit Kumar <u-kumar1@ti.com>

>  	};
>  
>  	hsm: remoteproc@43c00000 {

