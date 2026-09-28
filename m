Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B231E260C;
	Mon, 28 Sep 2026 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614212; cv=fail; b=emhJMh6vLNZM0qTBnUb4LZoIb0tZmAynsHlXEOS3QQ5jUGI6LwXIVQm7OHhaWudrHZTlKUdtfxHv9Nf/s6Id4GWlX85aJf+8zAdY8bsV2wH9U3nDEnAT3MYiildkD1u++09Ajbif9qvJayrYlH6jvmqiLYD+CG4q6gyb0mU1m2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614212; c=relaxed/simple;
	bh=0IOwKeRrtW239+dgZzRO46Hetq+QZJpZ+DxZnrybgkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rSQqNf2UEGREOR/HzC4hNs6mz1fBk3p3P/5GL2wJAJja1gVVOkoAxPP4E1aRb0Q855owOYvKBCKe9dCATTo27fct/dM+JiuvDGth1ggbu23ptCtgbRxQ+5aswM9ZrcLwTDFe5i68/4zcg06FG1mHil3WqXawiO2T4f5nTkDaAhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=fGmx33sg; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=WLEv8DEH; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="fGmx33sg";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="WLEv8DEH"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SFKBsx1826545;
	Mon, 28 Sep 2026 11:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=XVTUN2TezebO+N3JpQWxD0xujYMb23pRQf35S/kYG
	lE=; b=fGmx33sge2dj/HDsf3Thrwmc5A95nNFNcPNATRxFyrC5csoAjJkNsBR2k
	Dh8pyp+4KxIaj7vZnZurRfSjJjjfNaCmuqO8OHyogwc/OIFH0MvaeuIBNCSRvuQ+
	u/z79kBFdo520DQKcVY78FIXsJOYDpEgQ1JCkYsfzTr5lHh0Ms0Wy15mbgyv7Ie+
	jE89WuR31bDhfuIfpvmP8v1+QiYpSxF3zNoua7BdxhSrPYLBeYKaxegDWTd4Jw2O
	VhAuC8kEB1RI0kCdYy1jUdJLuA/vfZnq7vMUUiQtPKloHGrisjSNhdK1qL6/WZH8
	A7dgKrlg9P9Rc9Vva8zo2KRKO0k2w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxw6nyeqt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 11:49:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXj0indYuLn5lKDaSqXp8iXw2Hpx2RIJ1xO3gGxtqTrJXQWSmqR0fbBBgqWj2zfvOSNJfQAvXkir8K1Bba3vF0FZJ/85g3xSFtSbS7Ci46iiVWHHFlsevgWqn9imgoKzN4+8IoK4k5Tl9PeZ+NrthgArhWqjBBlU4PAR+ac8VMB9OJzcbq5Do51gROGdrw73AAQkqG2rKB4CBZDb8z8ULHGrpkgcX3TY/t3sIzFCoiqnqUN5VLaW4rrvwu2cGidK9Zixz3sRBhxPLr7ZVObb7uVKbHiSkEorOluO4XBkj8GJ61sPczXVQZ/4G6kinzvFSQPItZYb98CL7bADKSj8bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVTUN2TezebO+N3JpQWxD0xujYMb23pRQf35S/kYGlE=;
 b=nvlxKLn6MS1wnn1BfigL0IwRAlgknhj/PNLrL8s96GT3XftMr6c5AW+qm4eWkjjPxvgJ6zXWZML9hh1vuqEyLTndWppTRBH2qzYO+XSf+rHGpnBDK8D+3cDaN7PHvqjS1/LdbUAKNdVfTZLw67C/9MUU+3gLAs5+QuD72UC+C0cMoM3iGcdQC6m51wRPhNHPrWUX/N9KuDAhoH2aGtNbWTuBnIxOjfhxIFA4xrCVxCWPF9l1MujcHGVmIHzS9A265XU0dZzcglhN7kqT/lqbQkpZj2QdHwFZYx79E1/wcnEy/n9qOMqn820TVsXhsZbfpOoUDqeVNX9WxFKlzuMIrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVTUN2TezebO+N3JpQWxD0xujYMb23pRQf35S/kYGlE=;
 b=WLEv8DEHtf0c/JEYhxWWa9a6s8RGHk0mqQ0qqfr1nIQZj5GEj0Q3IQwUwfDFAorL9EGcHtcH+SbukPdkPnvELA8/ggcM9EH9Zm4qOO2A/eAeasl1iRR79u8V0m19ELL+ziH3VHdCpgiKAh2ZmFZqRbsTmd3tXvwVl8AS8RUFugk=
Received: from BN9PR03CA0166.namprd03.prod.outlook.com (2603:10b6:408:f4::21)
 by DS0PR10MB7342.namprd10.prod.outlook.com (2603:10b6:8:f9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.13; Mon, 28 Sep
 2026 16:49:55 +0000
Received: from BN6PEPF00000071.namprd03.prod.outlook.com
 (2603:10b6:408:f4:cafe::84) by BN9PR03CA0166.outlook.office365.com
 (2603:10b6:408:f4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 16:49:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN6PEPF00000071.mail.protection.outlook.com (10.167.248.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 16:49:53 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 11:49:11 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 11:49:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 11:49:11 -0500
Received: from [10.24.50.130] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68SGn894238451;
	Mon, 28 Sep 2026 11:49:08 -0500
Message-ID: <eab8b32b-b261-45bb-834b-b02e8df2b487@ti.com>
Date: Mon, 28 Sep 2026 22:19:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am62l-main: Add ADC nodes
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <hnagalla@ti.com>, <jm@ti.com>
References: <20260928034115.1084840-1-s-adivi@ti.com>
Content-Language: en-US
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20260928034115.1084840-1-s-adivi@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000071:EE_|DS0PR10MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: f0319ee5-8e03-4c41-0fc9-08df1d80851e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|13003099007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Pi7FMnOKHYwhW/8R2DDVAGTt3Pd6I/mMgZsP74HWAXQxz0GbIT7dnafXPkPYMhntliQDi4gXZSPspmEPdZUctxVfQ3JXKFB98OSwJx+KMTPECu6NU7VqtvVoxf5K8ARdQPJHzuXl7DNkrSY0zE47KzNB2HIVk6EVeknk0juOyqZmQySlSXl4GkKMyK6gdL/7H2iRCAzs+T7GIA7ZooNj+9kitquuB41VrRRuwMOE2ygKenyNctMKUrLyRPS41K0wAuL6PlKmH0y2jMJJh0JoOJnQqSpkwTtPKSE315vBUVyQ6pdGm/x+bPGoLxvr18NJMXlkewtX6w8IVt9+L6ppPLrztzTpImkU3fcH4SpSXft3d0vw2eB1+USwdoplxmJb1Bf+H+V+hJFUJpAiAfhjlN8v0me8syuNsV37Ulr2BskB/EdfuNOaOHHf19SbnlGikOGWLylyjLH040cGIv8s7+iWJDR4AFwvPCAVwFgq4/oTM/KBLI5YdmUO2pqfIPsSvAJWaat0ffFfsBC8mg9Zp30nqR529dOApIEbAngucij8U42m+ghCyM5Li3En1zMNmQ0TZW4axfoTmfLrxEdyJ5c8Y3FMTroTSJMQDj6m8u5f8JlAHruhhYDrI9Sq62Ze2y4DVM1ZAfePGeP9fp2AmQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(13003099007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YxRW+bEPKVWZGVQEFrzBX2o+KwzJszRSO/SxUW9ZNC/htSLUJybC4oEk3rkWk5m7M3cZFiEahXn5OpeNyjkN63Gu/i0DngfhOkzKvk4mTR1ssJjWA2bwlr5kDeiWEtrtbWJFERAICYs/2HWN8OuBxnVsQxX9A6YYxQILOlWoNepsW/taoy7BhpY3dzqpuW9CkU7+VppkQJK3MCfM/iMK/hZIHQ9rIyle0LvjmHS+fYULME/qJXLX/KuG1m5b84WIeO6I19X0CBwx/tg/4/JvVmVzHszhJh7JhpjxrI5knNyktsEZKIP9T37flEKzH3gBU0nJC806NyHgMFT5E7LRU/jNbj6T97X6qSZpZSmOg8JNPTjg+tpn7DZniFyZkw63Tp5U4MQeGIVspK6F9lpUuBFW54ZXO0DW9s0llJLXxe1i300k9UfKg2BMqObGAa8Q
X-Exchange-RoutingPolicyChecked:
	SpK0Fr75mZDlNalAUt5803e3NPw0XduHv6HvebAhLdBKlJksMBsmCjtdePy+m7hRvk9oPRBMdS9BEqVG3WFLz9erneimoVql5JszDuMF+ZWVvsAFh5HTxfE0/ry0Mokpf6BlJ0Rh9ZmA3XnBrWHn8vEknN5dWW9+IOWurTCMr6Zwh+P8c3Mu8aPPEUxlWcVoveBNWnsWm7dG6hp9DBYPBzQBSrIUrn3dkL0EeHzDkm83hhVzwTPXljIeQQc8Ed2qwi6F27PE+FYYsyKMqDHqH8K0gLaY74IdGYmawgKxBCRooQwKFAEfcbAZ5G0Z2QljsxT3YPpF0EdtQ7gsa4SSVA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:49:53.5070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0319ee5-8e03-4c41-0fc9-08df1d80851e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000071.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7342
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NyBTYWx0ZWRfX/+A2/E1ezNYg
 t4GOtWWxX45OO21/sMOhGfWsK4IBSu4AfO1sroHZBwvoWtV95dPHnlmpDG7e2sZfu8+zETSqDRZ
 rM5QRL+rfMV1A7h+QBLBdGxX86pKdzs=
X-Authority-Analysis: v=2.4 cv=dbkVTnXe c=1 sm=1 tr=0 ts=6aba9ab7 cx=c_pps
 a=g+XQapjYtrKCWQI10hurPg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=NzjEUj9A7pmJQGqcN5sA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: NJkCLVDIyy9DKGKYLmCpJp58huS3dF1l
X-Proofpoint-GUID: NJkCLVDIyy9DKGKYLmCpJp58huS3dF1l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NyBTYWx0ZWRfXxPl9QFE9SGAx
 +yHQhmttqAGOOOwdAHfuZvf7U1xX7gxPNNYdp0pYYA41OcEqcDcYyqASxVODr42GKQwJoXQ2Lfb
 bXCIJ2GHqTJUfy7OANpsMGaeVNcF8VKxbMKimWks38u3uY20VUeR6OGAOCfUVNcDE16AiVX7ctG
 hLKU1W5SHpRoPZyKu9shoeAGeOcz5YTrj/RBBeWK5AlhQOlCkvvp9o2IDT70mtkP4jPc0jTVilX
 pZUaYpTCHkSeKDdsJVuOYnOJI2E1fc15I+GAwRfip2PbSVxbs7zU1fVQEG/l/Lqq7QX4iOUKjCb
 Z3BgPu8MIGGT1K6CnbEj9xj7lO9Fw16K6m0P97ag7O8EgtnAc5EiIRe9OsH8EvsdLTopwaAiLFL
 iqOk32yOl0iAIDxwR57T+ITzIZY6lDZ7hEAfQrpZZY6YVgEPm2xQ0srMJYXEZtxNF5keLITrMNE
 4EyanouhTRvnAzatJtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280067



On 28/09/26 09:11, Sai Sree Kartheek Adivi wrote:
> From: Judith Mendez <jm@ti.com>
> 
> AM62L has an ADC in main domain, add ADC node in the respective
> voltage domain file.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> index 80615ca1e01a2..70157981aba5d 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> @@ -544,6 +544,24 @@ elm0: ecc@25010000 {
>  		status = "disabled";
>  	};
>  
> +	tscadc0: tscadc@28001000 {
> +		compatible = "ti,am654-tscadc", "ti,am3359-tscadc";
> +		reg = <0x00 0x28001000 0x00 0x1000>;
> +		interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains = <&scmi_pds 0>;
> +		clocks = <&scmi_clk 4>;
> +		assigned-clocks = <&scmi_clk 4>;
> +		assigned-clock-parents = <&scmi_clk 2>;
> +		assigned-clock-rates = <60000000>;
> +		clock-names = "fck";
> +		status = "disabled";
> +
> +		adc {
> +			#io-channel-cells = <1>;
> +			compatible = "ti,am654-adc", "ti,am3359-adc";

compatible goes first

> +		};
> +	};
> +
>  	gpmc0: memory-controller@3b000000 {
>  		compatible = "ti,am64-gpmc";
>  		power-domains = <&scmi_pds 37>;

-- 
Regards
Vignesh
https://ti.com/opensource

