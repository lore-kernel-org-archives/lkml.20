Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799831;
	b=43UB1UzDmkSHQmOZ2uTNwZUEANxUbRsA4FYKE/n/VW2H4DnzzoS1DJhg2wAES43Yf2Tc
	 RcOmLwykBSM/z0jZIYSTfFMrXBjXnDmGi/s/Mxhttjbkuph99yrMYioK7zgppZc/mDFYK
	 MgbLdY+waTnpmGx0j7y838rFRUaRdi4Py4s7uwJ7uhj4UO7JIsWhIssCLqE1xx/+iFAQ4
	 fcbpsVkigBuToFN+k3Yot9DFqiEZJmA0TT63W0JcgQApPNNrrl2KUCNKLBKCdmQHam5MK
	 5DAvqWcLwNS+oRHGdynEyi0Sv+qj+TnnC1U5HWp8yF1jcT+mttwcOLqENV7yYZ5jz/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799831;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Be7af5HJQZ49zCsAUtq017hjOCQXbhAR9q0vS+Hj5pA=;
	b=bOxea/tCw5nAmHq5SgACbe+zg5C1gElRI0+54BWr6SgvQ5Yuhw1O3X6KWIpL5wHR+9U+
	 f+ktJXJ3rDG1toCmcxO8Azz0cFoTEFPLYB81U6YEmcIdl0NGE936eEELC6tjKaAIhv5Hm
	 vLOz6FU3HLDF01MZI7jNSR00hXL7ubA+QJ5sXADZ0o1bmuDnEr9PBpN4sdUb/Hqul/DuO
	 PBltTmD1/AYHpiidTch2erNHfcHUfJbIrZYCloJgy90FKlk94Zd0dGrelsEcIEes8FtVI
	 GPx2SgFO1EGPEVwkulT+KCI+Pi7RT7gSUNwI2OSnm3bhKvU+nGPXbOd57mJEeJNCAng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=IjOMEaCI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.57
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011057.outbound.protection.outlook.com [52.101.65.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A51606A328;
	Wed,  4 Nov 2026 13:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A51606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=IjOMEaCI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUxKkaMP9M7RXflhbcNblldXvloloew+ZjA00Gh+IF1DbjBoFtldK5kgD28/LTMEYmW7DuR5Qx5KVBl01cqwVSiNtxFEUUI9tgheiW6waV1O9oTZh7+7iUM2h507NJjcWT/6ef6NIc1WmM3/21Pp4sYyHFNT5mEGkGk5V9+3YFbhnh7UWOoAe/CeJ5XOiLNYjxsC0P6s7HTwfx2mCMY7Y8+244FY5NZNtE1w1RdRdSbm+n7ddRHjlhKpom53ILNPSlbPpPIlcvP0Jzh45mCbs/GrFHbNoNukzBTixPUDr6Ag1zhsUfkFyXhaYRM69AxZgL/oMYLYqGic0d+oceLIyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Be7af5HJQZ49zCsAUtq017hjOCQXbhAR9q0vS+Hj5pA=;
 b=ywuTp34THEHcVpTtr0weRQSlgakGtsZg+BMubmJ+F75GTZc+xF5Imhqg+S6J/n4sLdutiFEU/3CgmZ3tBe4xbkSBPTfUE2p51FeYuXvtvIKghKn9+IuTDstiId871K5L9GkuiIKpCpgVmQ6c8Bl+j3OaAUM1Mn4Zk9RwNfxVXA5PO+kfpM9DbpzTVublBMFwzcfwzAA70mSJnBKirVXCX+6TFKV8z/KvepIWsOc12isnQk0FlHyIgX7PrQPLsocpWpW6JrH8qFvGoD5hMhCWgd+/i3ts2xn2ePSnC87wYlYXlNjDyafDoVE7QgARuJIoHnX9t3nWZ5jDetWkLfec7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Be7af5HJQZ49zCsAUtq017hjOCQXbhAR9q0vS+Hj5pA=;
 b=IjOMEaCIkGXhhiAXL4AwXT021bl2+59r+VEKjQZGaqvdUZUs+eXY54ecNAmr7ydJXyIyBP3Pmw2R9zur+QxJE9Mby2VYqvpV0Guk+Ic1R/vrqaTZl/0aHP3+C9rKSPHvE01fOOr8v1kjSGpYninaZ9n3hj1bzl9cn0mjLzhdKjSR3s74KAjuzLeruPGZIWHHwflB/P63DyJ4YVGc6AVYsd34Fe66AU3gHSceUQj6AVBXVVMA1Msnk/NgaxwRmB+5joMPfM4XIBHx9HqmnBuXuTP/oRpsAsR5L5Z1SrviFQ6e3G33jsN+2T2DJUDP0t+P2jmpTzfoQrqTg1S5CoLQPg==
Received: from AS9PR05CA0352.eurprd05.prod.outlook.com (2603:10a6:20b:490::29)
 by AM0PR10MB9581.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 13:43:46 +0000
Received: from AMS1EPF00000093.eurprd05.prod.outlook.com
 (2603:10a6:20b:490:cafe::38) by AS9PR05CA0352.outlook.office365.com
 (2603:10a6:20b:490::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 13:43:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000093.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 13:43:45 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 14:44:30 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 14:43:44 +0100
Message-ID: <87bca3a4-e12d-4160-9a92-0944d078e942@foss.st.com>
Date: Wed, 4 Nov 2026 14:43:42 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] nvmem: stm32: add TAMP nvmem driver
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>, Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
References: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
 <20261016-upstream_nvram_reworked-v3-3-f65908490cf7@foss.st.com>
 <20261017-positive-curassow-from-sirius-c283c0@quoll>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20261017-positive-curassow-from-sirius-c283c0@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000093:EE_|AM0PR10MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 2229d312-ae48-4d99-ecd8-08df3a79a601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|82310400026|36860700016|261102123227099003|4143699003|11063799006|56012099006|261021121427099003|261009223027099003|261028144727099003|261022075727099003|261022105027099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oE57gy1ZkPyl6LEhAk4MkK5xSQPqze8M0FVrP1opV89ntBH3U4beNB68fFZJ2Xu8D3wnfug7UJ5s9ulJka07rQkc/f1ap95FYBbTC1S0P2HT1Yb34fRSD/M8G9PlPNln0XmWIrS2N5SfmG3We47pTF0s5DzyO0lfQqQx1jUm7oZ1UU9jINt3Cb25tIwXJWechtlPn3Qv9+9Kn/rERBsmrhQhdEbxi5eyVNbRImfSYdg2vH/82t/lFantFm/yaGaV/IzbKgzmN8hiNZkUtAW+pTWFfW5TAMRc6ctO5CaTYDTbehvBK43+OegyffdsMTujxD5yvoeHLcZhPUyyyTA5Id0hwgZJ7UpcvaDHP4W10UgNExANx2tuJdvELmwfLc8RbsKItsfNXg6j4WfPFax1jLHDWUR3UoW0Ox8b5ZCvLVsbGKc9i8cfYuryplzCCcaqzbRyr6kmAO4ndsoCHg5vT9SHiNYxfwwwdN/vLM8qowOVe8TMEh8Ab0fp8XEOrdgjAww8g681Ar10OrawlOcL0GBGIVS9mEV4WfAxGJIqXJrTIVcsMXpisg5VkDqiQApU0T4jsnraCcnD1hzh4FdDMXUbD3Etu3CFsqq058rLqwZI1ZFvIQvo+ctD6aXe4qzzvjjuzzrIXy2VOiosPRa4gg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(82310400026)(36860700016)(261102123227099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261028144727099003)(261022075727099003)(261022105027099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dnwH+L57xrmnXpsfGTSLJZ3e8MclYM8ZaAOQgQg9YIg0lElYpPjmuNCHoHBjPgH97rQMGwV3pMH20B1vHvCUmQawyG1dU7dDMkpROCyM3akgrnbj70lKDlEWBv2lhsMn7fnuA/yG4D1I2Rr1utX0D9DSVFODC8TVTMYGVtiB5mFE5IbnRGvjnEPA60gJZ6anTq5CqGeOnXfDeiXkz36eNdTLUBXF3Xsp/ydNydj+LloNdZYMxkEEofdTkRPRhke3+xbqS4mjQJp7mPY5HdgI7f3xYIAAhFKLc4TKvz4oXHdeg285BOBg3tYwZsmaXRyaPDigrm1PZNzUquedwTvFKdvg6j6X7Yzz8ZbiNLzzLgiDl7yEPtWfNljbhB3xaFe0le+i0i7xrnZraLotTQ+WYtBVVAiZRdPVGqWazOPVoQA/RSBHJwQm0nMja+F0SGKw
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 13:43:45.9660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2229d312-ae48-4d99-ecd8-08df3a79a601
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000093.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB9581



On 10/17/26 19:57, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 05:26:05PM +0200, Patrice Chotard wrote:
>> +static int stm32_tamp_nvram_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct stm32_tamp_nvram_priv *priv;
>> +	struct resource *res;
>> +	struct device_node *of_node;
>> +	const struct of_device_id *of_id;
>> +	void __iomem *base_addr;
>> +	int *zones_end;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->dev = &pdev->dev;
>> +
>> +	of_node = dev_of_node(dev);
>> +	if (!of_node) {
>> +		dev_err(dev, "Can't get of node of the device\n");
>> +		return -ENODEV;
> 
> Entire dev_of_node and if() look not necessary.

Ok

> 
>> +	}
>> +
>> +	of_id = of_match_node(stm32_tamp_nvram_of_match, of_node);
>> +	if (!of_id) {
>> +		dev_err(dev, "Can't get of_id of the device\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	priv->data = (struct stm32_tamp_nvram_plat *)of_id->data;
> 
> Use wrapper - device_get_match_data or something similar (don't remember
> exactly).

Ok> 
>> +	if (!priv->data) {
>> +		dev_err(dev, "Can't get platform data of the node\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	priv->config_regmap = syscon_node_to_regmap(dev->parent->of_node);
>> +	if (IS_ERR(priv->config_regmap))
>> +		return dev_err_probe(dev, PTR_ERR(priv->config_regmap),
>> +				     "Can't get TAMP syscon regmap\n");
>> +
>> +	priv->idx_bkpreg_zones_end = stm32_tamp_nvram_get_backup_zones(priv);
>> +	if (IS_ERR(priv->idx_bkpreg_zones_end))
>> +		return dev_err_probe(dev, PTR_ERR(priv->idx_bkpreg_zones_end),
>> +				     "Can't determine protection zone\n");
>> +
>> +	zones_end = priv->idx_bkpreg_zones_end;
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +
> 
> Drop blank line

Ok> 
>> +	if (!res) {
>> +		dev_err(dev, "Can't get resource\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	base_addr = devm_ioremap_resource(dev, res);
> 
> You cannot use wrapper over these two? And I am a bit confused - device
> takes syscon from the parent, so how does it map also another memory?

This part will be reworked. On patch 2 of DT series [1], sashiko made a similar 
remark regarding the overlapping parent syscon's memory region.
I will address this point in next revision.

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20260930-upstream_tamp_nvram_dts_part-v2-2-bd73158ce46b@foss.st.com/

> 
>> +	if (IS_ERR(base_addr)) {
>> +		dev_err(dev, "Can't remap resource\n");
>> +		return PTR_ERR(base_addr);
>> +	}
>> +
>> +	priv->cfg.name = "stm32-tamp-nvram";
>> +	priv->cfg.word_size = 1;
>> +	priv->cfg.stride = 1;
>> +	priv->cfg.dev = dev;
>> +	priv->cfg.priv = priv;
>> +	priv->cfg.owner = THIS_MODULE;
>> +	priv->cfg.type = NVMEM_TYPE_BATTERY_BACKED;
>> +	priv->cfg.size = resource_size(res);
>> +	priv->cfg.reg_read = stm32_tamp_nvram_read;
>> +	priv->cfg.reg_write = stm32_tamp_nvram_write;
>> +
>> +	if (priv->data->nb_zones == NB_ZONES_STM32MP2) {
>> +		priv->bkpreg_access = stm32_tamp_get_access_rights_mp2x(priv);
>> +
>> +		if (IS_ERR(priv->bkpreg_access))
>> +			return PTR_ERR(priv->bkpreg_access);
>> +
>> +		dev_dbg(dev, "\n"
>> +			"Zone 1-RIF1 %3d - %3d %c%c\n"
>> +			"Zone 1-RIF2 %3d - %3d %c%c\n"
>> +			"Zone 2-RIF1 %3d - %3d %c%c\n"
>> +			"Zone 2-RIF2 %3d - %3d %c%c\n"
>> +			"Zone 3-RIF1 %3d - %3d %c%c\n"
>> +			"Zone 3-RIF0 %3d - %3d %c%c\n"
>> +			"Zone 3-RIF2 %3d - %3d %c%c\n",
>> +			0,
>> +			zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
>> +						true) ? 'R' : '-',
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
>> +						false) ? 'W' : '-',
>> +			zones_end[BKPREG_PROTECTION_ZONE_1_RIF1] + 1,
>> +			zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
>> +						true) ? 'R' : '-',
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
>> +						false) ? 'W' : '-',
>> +			zones_end[BKPREG_PROTECTION_ZONE_1_RIF2] + 1,
>> +			zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
>> +						true) ? 'R' : '-',
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
>> +						false) ? 'W' : '-',
>> +			zones_end[BKPREG_PROTECTION_ZONE_2_RIF1] + 1,
>> +			zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
>> +						true) ? 'R' : '-',
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
>> +						false) ? 'W' : '-',
>> +			zones_end[BKPREG_PROTECTION_ZONE_2_RIF2] + 1,
>> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
>> +						true) ? 'R' : '-',
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
>> +						false) ? 'W' : '-',
>> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF1] + 1,
>> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
>> +						true) ? 'R' : '-',
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
>> +						false) ? 'W' : '-',
>> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF0] + 1,
>> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
>> +						true) ? 'R' : '-',
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
>> +						false) ? 'W' : '-'
>> +				);
>> +	} else if (priv->data->nb_zones == NB_ZONES_STM32MP1) {
>> +		priv->bkpreg_access = stm32mp1_tamp_bkpreg_access;
>> +
>> +		dev_dbg(dev, "\n"
>> +			"Zone 1 %3d - %3d %c%c\n"
>> +			"Zone 2 %3d - %3d %c%c\n"
>> +			"Zone 3 %3d - %3d %c%c\n",
>> +			0,
>> +			zones_end[BKPREG_PROTECTION_ZONE_1],
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_1],
>> +						true) ? 'R' : '-',
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_1],
>> +						false) ? 'W' : '-',
>> +			zones_end[BKPREG_PROTECTION_ZONE_1] + 1,
>> +			zones_end[BKPREG_PROTECTION_ZONE_2],
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_2],
>> +						true) ? 'R' : '-',
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_2],
>> +						false) ? 'W' : '-',
>> +			zones_end[BKPREG_PROTECTION_ZONE_2] + 1,
>> +			zones_end[BKPREG_PROTECTION_ZONE_3],
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_3],
>> +						true) ? 'R' : '-',
>> +			stm32_tamp_nvram_rights(priv,
>> +						zones_end[BKPREG_PROTECTION_ZONE_3],
>> +						false) ? 'W' : '-');
>> +	}
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +	priv->bkpregs_regmap = devm_regmap_init_mmio(dev, base_addr,
>> +						     priv->data->bkpregs_regmap_cfg);
>> +	if (IS_ERR(priv->bkpregs_regmap)) {
>> +		dev_err(dev, "failed to init regmap: %ld\n", PTR_ERR(priv->bkpregs_regmap));
>> +		return PTR_ERR(priv->bkpregs_regmap);
> 
> return dev_err_probe

Ok

Thanks
Patrice

> 
> 
> Best regards,
> Krzysztof
> 
