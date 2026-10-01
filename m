Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010041.outbound.protection.outlook.com [52.101.84.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640904E06D0;
	Thu,  1 Oct 2026 09:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846906; cv=fail; b=hWwN2jzGcYe5WkipM6zkq8DoOnY4AOYJAJ9MFLpJgEEkIexEiuN31AwhwYcHeu1y8hdjp24xp9XK2H3ZtGW4pVs6zbX8a2lzjldZA+8UKTE+o/IMai6ubKSSQDFzSmAFOgJsb5ubZNnvZl8zS2N2sGiARV8FhBml6XxedMrJHcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846906; c=relaxed/simple;
	bh=/4PZQZBlIQ2bvKMIhv4JfMnAg27tcH3GiMzR7dO/72Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t+oZZhWdpaQsWndLsTiuXT+yECRurt0K4DunvG/TAucH+2slQtwup8rOMD8yjg4xOu9GAwe33oH9JYeBgyMl1f6rJnqfAe5Ngf/cn+48j1+3DoIsRt4vBqb/xJmjiX72lxBMLjl1UajPGXswU/pVcoADZHuio6GOY6keQtP41Ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Oy+swnze; arc=fail smtp.client-ip=52.101.84.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Oy+swnze"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYcHNQpJa/8k0ZTCr+NSz/fnCVXpnvQfAOpA/i0IgA+37+B9hfwaoZ+MX+ukBYojcTJ1zaHTRFuandf7lUJXxSt/C5XFqlL1XQrzK/3PK5dGRvxMjDyXIwArXmUhH0DXOQTTWzg7t+woeyUywYVMd5Xp161f68aZGpKg8xppMEnApHfXfEs2EDqGl4E8qpwKIPV/GzIEw1FXSDgPIW19c8jx/z+Zf6H05ZdpkG9ZCjTmU9gUhFoe8hSmkCmeWtptKm2ruWypFAGOAG1t1nN6AzZNOYONRKE1qHfGnLZAAqo4uNj0ySHVj8d9O9ZHqhU/XrZp/8fHtiU0mr+e5wAw+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0pbtMue4Z4XAvmgNjBYp1/dhnFAUvlmedr5oK8tT1E=;
 b=l+oCYIti0I0fEyCb79L9xlWE/V1t/Ii/YT3SWP4Vh8aJi/vz4+G0DcB9JpuuenwYDWGnhio66VvZNLpXIgvgaFgafcgHaCpjlmWbIXyLpXq2XscpGWrutDoxCZtCdTqg+Te1KhBkFBVlkoxcYEpSnlS7dfe8bEIkM8DK3BlCDEGq/OtwG9NNDnKJLCAPuqgCU/ztswnP7fSkmJsLZUmjx8x3zQOMwqxlVHH9/MHlYWULTlFQUFOGhaaUl/qMbuyzGE8yqdeB3vvllmvS3tl6IXs1MvMxhqS5rukgtQjDTWgPnovjzfwoAR7Rv35+9rjkVVP4EPjYYASVbwWbNSSCpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0pbtMue4Z4XAvmgNjBYp1/dhnFAUvlmedr5oK8tT1E=;
 b=Oy+swnzeWpNv7c3V75Qf9+qNdqkzRXPYTrU4saEBlOxMwiv1zZcgOsy4kRBywPrMm5pw9BSIx/dHqvXS8MlC5+tGNH5NIzrrTVScwiLoT1X+EhZU5xLd35SPffhT8dQAJQ6eFvOy/Dm2dxvvuuEgqiJjhUirBhIuCrsFWLu3KBOtz/hIqby9URF+P1Cx2kj/KfzzLPDVX4ChAfEnGofsTarlkWISH4yO244psUJqXCz/KgDkg+gNPVQ5RI74N5ECe1efplEQVpgh9k39onio3eyFlhplHBJXVWvrCW0xJ5kPYhHX4oeczab1kenQfOum2dcZtmjqjkp47AYJrd4csw==
Received: from GVX0EPF0005F6C7.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::650) by PRAPR10MB5276.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:296::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 09:28:14 +0000
Received: from CPH1EPF0000051E.eurprd04.prod.outlook.com (2603:10a6:388::1a9)
 by GVX0EPF0005F6C7.outlook.office365.com (2603:10a6:158:401::650) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.382.15 via Frontend Transport; Thu, 1 Oct 2026 09:28:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 CPH1EPF0000051E.mail.protection.outlook.com (10.167.241.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 09:28:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 1 Oct
 2026 11:34:07 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 1 Oct
 2026 11:28:12 +0200
Message-ID: <d4591002-e290-406e-b720-03d610d77e7c@foss.st.com>
Date: Thu, 1 Oct 2026 11:28:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
To: Rob Herring <robh@kernel.org>, Marek Vasut <marex@nabladev.com>
CC: <linux-arm-kernel@lists.infradead.org>, <fabrice.gasnier@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Raphael Gallais-Pou
	<raphael.gallais-pou@foss.st.com>, Yannick Fertre
	<yannick.fertre@foss.st.com>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260902124018.606544-1-marex@nabladev.com>
 <CAL_JsqKDniU3VYaOuF-OA2_JmOaKEtdOtxGAtyJfFCLnT=LjSw@mail.gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <CAL_JsqKDniU3VYaOuF-OA2_JmOaKEtdOtxGAtyJfFCLnT=LjSw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051E:EE_|PRAPR10MB5276:EE_
X-MS-Office365-Filtering-Correlation-Id: 8139a2ab-5fde-4f98-82c6-08df1f9e517b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|7416014|82310400026|1800799024|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1Ot32KlaPRyiPzbVJhazrfBl1GUq0+MSniK8sokSC4qpgdHbvhPbW5rUD11/srdOgvo1S+7bcwgvaAe7II7U3e9Eh5w51uXjkN9NRbUyfWdUjCZke89gaGp72LlRWWCktJ0OCe3RBc2nLcUfw+0d4Yku9ajDzonpnJpkBFn20MjObInpd5S1omjH1Kh2M3YHSOBCJqr0XJEvLidMpQFB1r58YPsVCY4yBYpaqZhFP1ptb3cvPPkl6H6n51erzxbDcDGgKduGz55pMSFVjFOxbnrxC2VY6Ux+ZrRmploLyav0ffiX0042DgmK3JeEPGECiq4j5Zk2XMic05Pot4JwzcIlyHKCfgZPjOXdkk6Vfq5dBCk/lX+u2dfnMiJr8DLYn0DypI6MclqDGkWg+FJkKxA/6M+FP5Tad7bKOu6YcO/5h99lQXef1KtmBU77hBnI4ZNZnSOaHHl+c4nACaAnRelHLdp2oSIl2liz7RwTuz3dWSnO1L0KkW53ejxMuENGqqy3rjaq8fqluiAN3OlOaUxRpzzNMCJqxTvZtT6e/W17vOGDvkaWKaY8UPKbu540xEk9OduNS/1IHOQVqBL8qcL7r6XhdVEm+5bVLo3TSxB2zevmheCc7O57YZ96jqw3zRpqtZPA0o2whay/MGFttFIm5fmbRI8P/kZZuam15+BYNtHYIRwkofgUF498TRILVIDatR8Wb3N9ZLrFo54z3Q==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(7416014)(82310400026)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eWMX+G/IOJB4tAfKbGsd+Mdol9GwpMGVXWIC+q0KDrnoKFvq+7OA5BCWNeERYeV6WUyh9hRpcSZIyw0TVbrq7PEC9Op5tH67S+oF0Z4RVIokGRgiVt0SnvqhvLrzwnfWETuKm/1Tk30iviNs7fm8fJaUEGIHOpCRKmNKbF4U4IgIv7/RuhJ+k3RRkTi+Y1BR3BJ+6DzHjUtYd0KHntLCgBRyMrD3+w24+cT5zaeBOCpzRrITHs5VOrIuLUSNr+DHV/KHpMfvkExHK7timfAA4HkfGBiAEygB08JWzMCZhvR595wOMOhTYg1AzDCWNDn8RQnbQ6eKQnNwoNaGaxpReRRVIc/2PdjD7XjS43aeYzae8onJ45qgVDtq46uKTv4uSZDrtVnzT+KmeHC22PH+QrzyB8gugbZRFxLNc7EmKhEVKmyxFNQ6zBQ7q6ez6XNb
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 09:28:14.1388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8139a2ab-5fde-4f98-82c6-08df1f9e517b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5276

Hi

On 9/29/26 23:55, Rob Herring wrote:
> On Wed, Sep 2, 2026 at 7:40 AM Marek Vasut <marex@nabladev.com> wrote:
>>
>> The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
>> represent the USB 2.0 FEMTO-PHY. Document subnodes pattern properties and
>> address/size cells.
> 
> ST folks,
> 
> Can you please pick this up. It is introducing warnings due to .dts
> changes you already picked up:
> 
>        8 syscon@44230000 (st,stm32mp25-syscfg): '#address-cells',
> '#size-cells', 'phy@2400', 'phy@2800' do not match any of the regexes:
> '^pinctrl-[0-9]+$'
>        2 syscon@44230000 (st,stm32mp23-syscfg): '#address-cells',
> '#size-cells', 'phy@2400', 'phy@2800' do not match any of the regexes:
> '^pinctrl-[0-9]+$'
> 
> 
> Rob

Patch applied on stm32-next.

Regards
Alex
