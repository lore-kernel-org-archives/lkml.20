Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591423955F4;
	Tue, 15 Sep 2026 16:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490512; cv=fail; b=pyPX/Znr5thkmLCt731/R2lHB18IW/N5cRLY7MMSUdmxIci+fK4/eAJlOHkx/l8M5yiO8i8BYDW7YzQNr7wp2t7eBoeV41Ru0ChRfSoQQmJ7GLWbAvTHRpOYDtsDBqoGHf9RzTMqb+nAeyyTGNncM8NCdMg4yxNGAC9qlKRo0MU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490512; c=relaxed/simple;
	bh=CI4Gon6xjUeYbWTuP7WDXdixiEjw4X4xNaBFZJfOu9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YTNRItqeJd1u1BQnzinvpR7dFu7Q8D4+GfgTBBQRnk9hpn9oC0QP4ZoH7/awGJ2qHl18WrO/alsvFNxvnxK3PMSQxVFNNfMqJ806xYNyBPunu81hEPiok8gTteyp+LDJnkltIJibmao3vT2HaTwULU3dyx+3HEpbxtoowB+9Sjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=REjF8Skf; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HWjwUZrm; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="REjF8Skf";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HWjwUZrm"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68FF6YI8329914;
	Tue, 15 Sep 2026 11:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=fcB7yfs+gbM9Kg0Yi2qLEnXU+b/JC0lqih9Cs5idV
	N4=; b=REjF8SkfPD6CvHKyVkzBZp8rshllRBlbbksi5dRqQDgNwEWKOPyNcUTer
	VafF9uSi94FVXqtWwkAUGY7rzhL4S48Wv6ETnmDzy6BRLOy/pqLd8t1MW25gtu+3
	F0zmI8IkB/Qr3R5Q4HNwzCY8EU5uEIasNqIOYD1gYLsuqfRF9ox/8z8sAJq2snUd
	IW8PCPFP2qLhr+4YpegcIv+TATpkfDgLvrmCzhdzDEmXbmeW0cLMGqG1A6TDlaRl
	mf0LqzOsK2lY2Bt4R3ose1PyBg0H79v07xLweYTTyzF04mrgvDaS4k3QmbCm+k/+
	V8q2+wla8lxm8s+/4/zCv9/L1UqOA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010049.outbound.protection.outlook.com [52.101.46.49])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gq58jj5mr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 11:41:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWIGrmm2QgHod9jGt2llhMPErB7E72TKZutIKsAx7u0BUOL7KokeE7djAJrllvPRJ478konvGtY1jGH32EZ0JZk+DsWt6AYfwXTAnRsWHwJFdwM6rh8S9oUvZ7qyaxZv0BD0cgezRZVoM7hd4gGP8uqQOGXmCIKVdkz/fsnXJqkEiJsYBusy1opjipDuKp8yJMhRPtHB39BikYC2PQ8D3hjaKUEyx/0BUXHWTH16wPoFNSPFVrs1ISc0dQPkdxbSD7O/ERzDRqCh0ycW7Qd6iDsxb1Xm1MM7gXpxXcokOO7fp9+5ZxptMcnZ47AfpYlJyBARNEojFIMbOBEVhLws/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcB7yfs+gbM9Kg0Yi2qLEnXU+b/JC0lqih9Cs5idVN4=;
 b=Ethb5vx2lkYA98VvFweNo67qftFdxHWCKFERwNZ+wpp8SBre+ne4UDILdDNusyHE7Gn3CJx1tXKorlBwmTP0PQEbRWg9gSWW8HvACuOV6D2Exlmn5gliGDZfyierEJMXHA4tYygcIIdNZf8lU0gFSib3Cq6mLLatk0rh0r41s+9iX1+o+QO1XjMCd+ftIRby5LbINzqthJ9u1IL+6de1Y005doQbmn0pfHaiQHcN75/cbGqnU6RNtgc/6npCirCVfwvo814ApdE1uo4MxW0kSq6yOhcfxvbdHbA/fut0OemtUUz1X4vS/xCjZN/Ik6HWtIqcpJrKIJzTpoaYJmKMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcB7yfs+gbM9Kg0Yi2qLEnXU+b/JC0lqih9Cs5idVN4=;
 b=HWjwUZrm2OJR1SLtrXpYYzzaC184oWR4RvMQJYalp1xGOqf8qXqsQvjoyFcy8foSI3OOJmcV6P82Cz97xe7nhMKlaV2tcniRm/azYTx6k6U1PSeZkSOpC8ga0eFdkWZdET2HCFOvGPwdKEz0XMTPWiNBcHbfR9weGYGyX+pzzUw=
Received: from BY3PR05CA0022.namprd05.prod.outlook.com (2603:10b6:a03:254::27)
 by BLAPR10MB5011.namprd10.prod.outlook.com (2603:10b6:208:333::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 16:41:35 +0000
Received: from SJ1PEPF000037B6.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::95) by BY3PR05CA0022.outlook.office365.com
 (2603:10b6:a03:254::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 16:41:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000037B6.mail.protection.outlook.com (10.167.244.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 16:41:34 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 11:40:29 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 11:40:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 11:40:29 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68FGePSt3587292;
	Tue, 15 Sep 2026 11:40:26 -0500
Message-ID: <b490c984-8fba-4b92-96f0-8e4a4cc811b0@ti.com>
Date: Tue, 15 Sep 2026 22:10:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s-common-wakeup: Add GP_SW1
 efuse node for silicon revision
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20260915001304.3781247-1-jm@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260915001304.3781247-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B6:EE_|BLAPR10MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: a0ac8977-f515-4876-e90f-08df13483456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jpiu9TPzUYrm4YPJPTFcJGidn/sTYyqVAMKVGzld3eCDr4VMRYFEK6vQzd10KQX5IBYXHyA6ebLLRFWo1Q5hWPDPTaGjokDUTzwHROddF9eHT0ULtokHhlstQGoEvhvOeiUJFiIgWM+/FFwnikxmzM40ZnsM1Z9Z9goaCbEuO3KH7IVPU58lx852Y6203W0H9eP0zX4ZDIJU11+vXiIdzIZIljAakbVRotV1H8fhrpHQyUj8tW0kVKCqJJTWdx5wcBI6d9gZmJpmX0zP2EOIGFHeoi2VEMNu/I9Yo3R0bLgB/DbjL5UaX5BNC85uiGAzUmVJBMZgHu8scs5B/xncX7d+0CJVSYIOjMWSnNfTCocHANRAWxiE/RLqtwWErCnlDBnV6JHfubvpQEpkOQJb1QHk1MJXEC6vZfXCtoMzC3B3kqJgyY+Ipay9DDMP07om+q/YvPyb01rQALszGC4Z7Ym4HwMBkOgYn+cY7VIAcudRRivodoGKCUv8fR+nTPBUmG16VG7kvAbKWz3rbPyDf29oRfxYE1WSOpNTBi4wtJPkUrdwGdcSkJjgoDxmJAnFyj9BM1TDZq+3sOIoIVn11gEIV1VlTT9qIPC2BS6T+Yiu1YuDemdOlacz1EObEdp/H+xmNHYWilXUi2Dg+wdgHnGcAiYvnyaD0dvU412kFmQaXzWYQCZzU74e/jvTE4HLquOyqF3CV7np8cVfLW1CWw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C0T/Auo2H+ylSlT6+d8ZGQKgL1Hci3AyBElA+h7G3wVrimqNPVNyqvSpOJ7X1BNC1o8RI4+VpiGl9+huCkOh/6limQCnkGuXTsHGF8Z2a/1j8X4vgwt2vOIj3f6jueTpGSqLCMr/wYsBBkF3ApKEFTaU/m9Bs9EBTWb76IwlTchNIKOURoLnwAehwai9GQ5Xo0yBV0QXM3OwInXHNcg2TZUAVJ27Lu9WaNf48C3Cn3ejz1FnA+dXI77K5S2nTmWncGfnOJMUqmrqDdXwJcrzMtBsX8xGHTeXLlkXfXF/gRQoobWZCzahH5pnzAex8Qv388hPoYqqyi0a1m9a/y3lTC7cWoHkbUyT3DpEpZu71lo0h/FojWEu6gpXWUKtzpTtXS6gm2XLV0S/ODu9uLq98fioC74aiMulq5C/bUcju1MW72f3e3JSvfOaLqBt9aJs
X-Exchange-RoutingPolicyChecked:
	mDV7kCyKY7spVM9I1Xm5TKAGYMqh66EzN/xdXUfJcApnqGksYYaUqLce9kEgwx1I9Bz9+/M0TwIYJaLkTkCyoFFz89zt988g5SBqGb6TqfVra7ng8OGjz5MLk6YR/hW/auvT29tPpfUWRsUaOv/6H5YybPF7OqObHuWtDRH52U4e7MLIrN3iK4GsLcjasJCPbEmUyvBNc8rFmoAcQyK2tOh87/Hz9o/vOfLCsf66YyynkDuinaNic8zmu+ogOcLnK5unpkT/rf6QZ4HUPG26ov4LEE/IJ87OHB3ykyo07AENueivB8LQZEo2cQGsmt04MIlXh5J0tK7dttkeWewv3A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 16:41:34.5881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ac8977-f515-4876-e90f-08df13483456
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5011
X-Authority-Analysis: v=2.4 cv=FMaOVOos c=1 sm=1 tr=0 ts=6aa97544 cx=c_pps
 a=+5nsKerQHvRPAoQt0ERV+A==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=nHT8rZ4wS0swP3lpeygA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0MyBTYWx0ZWRfX9N//LCXvYlgf
 /kELUCzpVDfT2Yzh0n0g+GP/90yJPne1DMk3UufHiitzqvX4Snw0DzWGxc9hRVztCQkdENBocEk
 DCpIWj1FCO7pFnBqJlURulG6GZWnIyY4sOIcmEkJgHHn3pRR6js3QaUiVtMw7uozNPTthQ1sKpG
 i1nt8WTYGdoZXRCgSqzPt+66qhK4wXL5s31kFUvEgpbTg41AQwKZiyIPF3MYd9JeYguZO2xe1+x
 1SfpE2q2NqsIDuuM5ZG1fv0cj7g/ila76WgbQdrE2VyS6ODpQXL8nA8txYtGsoXM3gJtiPFO5nP
 NS/P3w+D5IUsLceRGXubKyUcdANhtutD9a+LctBY8ctn+H2Maxt4wuvkMMmIiCSh/USatbai17L
 Q8xaTpnp7lypfpLNo/rGxI0KfwdX9f0IlEP17ZiMvTEjhqX/WY9whEYC5dffVkpEPk08jRJinr7
 Owg8JaMyeIwF5t+UHtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0MyBTYWx0ZWRfX5pcup2nDO5pb
 wTCc0ru1OyHhf9zGckd0OvPiFIKQWgLW5yqGAs5WEbfx5sIDh472loUFovBqn3NBBM1cNBtekRv
 yVS9AgWeG2UBAcsq1Gr1mlDxOkJ1bF8=
X-Proofpoint-ORIG-GUID: dCjE9X3K-am2WnMVpHYXf47BGjOpWgcw
X-Proofpoint-GUID: dCjE9X3K-am2WnMVpHYXf47BGjOpWgcw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150243


Hi Judith,

On 9/15/2026 5:43 AM, Judith Mendez wrote:
> Add efuse node for GP_SW1 register at offset 0x230. The GP_SW1
> efuse register is used to determine AM62Px silicon revision.
> Reference efuse cell from chipid node via nvmem-cells.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>  .../boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi  | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
> index 8612b45e665cf..0f00e9d87f8ba 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
> @@ -19,9 +19,23 @@ wkup_conf: bus@43000000 {
>  		chipid: chipid@14 {
>  			compatible = "ti,am654-chipid";
>  			reg = <0x14 0x4>;
> +			nvmem-cells = <&gpsw1>;
> +			nvmem-cell-names = "gpsw1";
>  			bootph-all;
>  		};
>  
> +		gpsw_efuse: efuse@230 {
> +			compatible = "ti,am62p-efuse", "socionext,uniphier-efuse";
> +			reg = <0x230 0x10>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			bootph-all;
> +
> +			gpsw1: gpsw1@4 {
> +				reg = <0x4 0x4>;
> +			};

For J722S, this register this marked as reserved,
Could you update in am62-p specific dt.

Thanks

> +		};
> +
>  		opp_efuse_table: syscon@18 {
>  			compatible = "ti,am62-opp-efuse-table", "syscon";
>  			reg = <0x18 0x4>;

