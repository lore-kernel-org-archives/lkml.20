Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793878804;
	b=yj4kU5+MP8QeNCIa2W0uXhHIt6N5PEd7aLX7gsPxCJaIkXBhd6qLT/xa698LN4gPFw/L
	 fVfxsn1tQxKIh8iDUwkLgpHgFXT4mqKT5FhnR4iWUftWYr5IsncEQcpCKBPRfw9B6HY2m
	 SWI11u1BmOY+7SCXExuCM/D2Z2BoqruBi9l9m7UKSAw9ssVAXTYgf8LpEdLbk5eG/rkZq
	 b27KVofGFFhiF52E+Ey55NtvrYNF32a3NO08s2lDboK2D3lU5Yjn2nd94GK9dB6ve5/vk
	 TDWjJ4+bKwK8H+GHzuncRj2Mpn5LyiD3QtQ4bAA4cCIWxY4W7tQhxAr6aI4LfYUVZRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878804;
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
	bh=oKB4YUhofsu1IeQfbJMh3q4TsGf1VxB9/RE5YGnagAA=;
	b=QBcYjesGq665eNupPcIdHnBISRrlG1acIiTGoa5jAfSVLCrR7uhRSgx/xR4unolILi7U
	 kJijVTvVQP2YQ1rnNuaHBRd7YpLOG1LUsu11ne3kpQiJWQ587a7ch8G/l8HZ+KOmae/BG
	 Bfh3uSPRBt6s8xAOqnRnY1NPE1iW4rMYo3zh5KFfLEQrKDX1AWhySA6TDLL34NNFtuTN9
	 kfRzYoSi3ksCXTfqvmY6AECNbD009NF3EQ7iqwkCFGBmoRFnAbvcfGGdpJ9E+1AzXie7K
	 UdwOoezj2j7k32EGspkbPE3E1TX17ZLRThmO7/Y4w1hZgGLwM01wL1DYcHP8/6hht0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=f49CDH4n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.26
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010026.outbound.protection.outlook.com [52.101.69.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681C2606A328;
	Thu,  5 Nov 2026 11:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 681C2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=f49CDH4n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ivo7f9v5/IUu8qPV4l4hJCJyYvn3CqW4Kj8A4oqohm+KU0aD+Ugv+vP8yu8nlFjC/CarTKOr7+wJIS3wcPvdyWfeUtyfw/I0CcsLdkX8hu2ZP/C5REG8ytsc2qlvGcpOec+yw3lX1ncn8/PASPj5qzl6lEHxlOy+oxJy12uV1tBsK/FqA0lkflFRdQE6cwnWe8T+E/Trfs/tKL+Uu5Jh88xwsPK7HUYlX+8RzLYLqNU+1wjtuR4nBAb/WPuIoYbIX4qDdVHBX4qUXwBpFRzzS1PZLf/nqW3v86d97GAy4yCSMONBZD1Tqu38v83YttcHZdAaxiKQuRU9h/m/yqhpzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKB4YUhofsu1IeQfbJMh3q4TsGf1VxB9/RE5YGnagAA=;
 b=BGrYsUieqb7YqgT17Qcel+YEbIecpgFj3LFkjbhwiZdIAmQ69nTU/Z27KpTqUlnhJGiLmJLw1EDDVo8zNqvo0j1ZZ9L3wtzpXkEwTO1Q49XYNj8xvwECyKlYfdp5ueiBWlfLuCiJ1ZtYW3pEQXAeyqHAEUOwPIie9R975ykyYwLrZJpXdUVtmlzsXUFLQjSgPsvfyPZw/jETnQaAzspVLelP1v8SXIoy/9GFrp7OkhVwd1MYbHxRIx0axRK7KZjjeu5cc/Z0eh0+SZ13TMFaYvrJfIy5rhtzpXpjK/BQBrLyK4YmmaKGaiPoxjpI7zxtajpP5K0CfPZE8OjX84NBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKB4YUhofsu1IeQfbJMh3q4TsGf1VxB9/RE5YGnagAA=;
 b=f49CDH4n69uyUzX1FaIJXxGWCS+DvYWWiRWgAfZtchFkVR74kr9D9rmcJQ86tDii1bBNDq6jtnnMhn2B3QA/ayYSj9NGETucHXzFos4XDNvBMw8mdWame822RGzcFFtIPWpGSlcTMV70sXbns8CZf2Yu09ol7IM9mSU7HkCRATEcpTn8BU06JsPyU9BSI42rz6yMp/+YdMvLs644w9LxRqPy70DTBrBmmzUbCtNJB97gZMadcexYABbP/PMv47vC0quObi0DcmMsKl/XIFRclA5QwzJYjOrZsRIcUbdfCz9XrzHGA0roLWSOJnY48dGrNTIC+zTyiPniWBbmGA3XOg==
Received: from AS9PR05CA0100.eurprd05.prod.outlook.com (2603:10a6:20b:498::17)
 by DB9PR10MB7594.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:40:00 +0000
Received: from AM1PEPF000C1ADA.eurprd02.prod.outlook.com
 (2603:10a6:20b:498:cafe::48) by AS9PR05CA0100.outlook.office365.com
 (2603:10a6:20b:498::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 11:40:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000C1ADA.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 11:40:00 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 12:40:29 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 12:39:59 +0100
Message-ID: <14c013e7-da82-4f5b-8eb8-f95abb1b9e34@foss.st.com>
Date: Thu, 5 Nov 2026 12:39:58 +0100
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
Subject: Re: [PATCH v4 0/3] Add STM32 TAMP nvram driver support
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
References: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1ADA:EE_|DB9PR10MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc95cab-c51d-4286-9ff9-08df3b31866a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|6133799003|10067099003|22082099003|18002099003|261022115727099003|11063799006|261026140227099003|261022105027099003|261026121527099003|261102123227099003|261026130827099003|261026135527099003|261021133027099003|261028144727099003|261009223027099003|261021121427099003|261021135927099003|261021130227099003|261021123027099003|261022113327099003|261022075727099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zm7+6Z2NGdpQtCPtF1r/zi9KsVfcEtCdECRIM8FQ9cg5n54aCBBPmUTAnuzhrj1NdLjdRdEmP2ev9n81ms+xpl1Iy4cJksvt1wElhfgCJJJVdxhdUuFGp+f4QCJHK6HrAUMUMV59JcbPkRHrwlBi7eqQflsXcGqh+XvQ0eCBYFnuteTPgmgw/1ziotpKFeOv+sh6TFR16gGG2Lrjr9nkIdknXGVJE0VrFE4tWFc2b0B/dw1oZ1Ipb069dMSzNmvFUtLHJokddmbE2S2zNDOcI+0TO8gWWdl8rcI9OqgkFr6ToExkfN0sKRGya+I06RLtz1eov8IfFr4NH9nRkppUvq69x2Ps5rYvQI8hRNjkt9lc7H1TNhjUfv56lHvHFAScgm+3Fe5L3IEjMsGE3YZg4xJCvZc6scWaHcicmPEDizup1mSdPazxvO4spiDLHaii9u+zv6ipgLlR/Y3M3EJCoLQNvyUvfHAIniEirqX6RII2CikUMoH8dK0P7e3z1YQKrMDo7+y1/cpxIvtQpZV5IZoi4cgSWLW8rk/3Cizd4hF6S54y7nEgjxVRTDhVI6+t9Z3Ay5iKyvWBmfUMdWPUfBbQmzmXgbe7cJvP0a5DsChNV1lgz/2TUU1nPRiV/YRIDuiEN59YgyTjRlC14rbeJQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(261022115727099003)(11063799006)(261026140227099003)(261022105027099003)(261026121527099003)(261102123227099003)(261026130827099003)(261026135527099003)(261021133027099003)(261028144727099003)(261009223027099003)(261021121427099003)(261021135927099003)(261021130227099003)(261021123027099003)(261022113327099003)(261022075727099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EcUSuEwN7B2pEgFEDomrBn39jeXBNUtPl0HdHd5FtlHxxgGiKevCaWRVEfsU64lkLnnlsgVRUwUZnAH1dAMi/0Widd6ERhcwPzw7HfYhKtDINjksIlFOp5jftswc+jpCwWjcffgcBqgmWM6NjheEUPp9dGcVGV4vTbsKmO2BCf4M8mc5m1YmH4ZuF0w313ipfcnX97jbVa3NcjOlQOrlYiXf2E1OONwubzsJ64j6UDWvZZGpWZfc/q6xXCYDEgidkhAvXxqiHK6PuCHd0RqJqDe5Qd0GEDFG8gn56vwUp7E3hl1iGj4xZtMon2uRs/oYcSCMzWIzq7bFLzwJHeJIUi1XdvEEZFqbxlIGHHAYuwwKDKSVmRXmq3eUtg/TLC33mCnvv9PpdhWyv1RT5eedO0+bGS//8CD7xeLqK6wPoU2o3E/ww6EdBDh9HyU4W3UE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:40:00.3562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc95cab-c51d-4286-9ff9-08df3b31866a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000C1ADA.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7594

Don't take care of this series, a new one is on-going which will include https://patchwork.kernel.org/series/1176665/

On 11/4/26 16:20, Patrice Chotard wrote:
> Propose bindings and driver to enable TAMP nvram driver
> support for STM32MP SoC's family.
> It allows to expose TAMP backup registers as nvmem cells.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> Changes in v4:
> - Make usage of of_device_get_match_data() wrapper.
> - Rework ioremap of syscon's memory region to avoid overlapping 
>   between parent and child node. This allows to remove 
>   bkpregs_regmap_cfg declaration for both STM32MP1 and STM32MP2.
> _ Add select MFD_SYSCON in Kconfig.
> - Link to v3: https://patch.msgid.link/20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com
> 
> Changes in v3:
> - Fix issue found by sashiko-bot:
>   - rely on the already resolved priv->data->nb_zones instead of 
>     of_device_is_compatible() to set priv->bkpreg_access
>   - Fix max_register of stm32mp1_tamp_nvram_regmap_cfg and 
>     stm32mp2_tamp_nvram_regmap_cfg
>   - Update zones_end type to int*
>   - Replace both memcpy by put_unaligned_le32 and get_unaligned_le32
>   - Link to v2: https://patch.msgid.link/20260930-upstream_nvram_reworked-v2-0-cfda749ee0b7@foss.st.com
> 
> Changes in v2:
> - Update commit title of nvmem dt-bindings's patch.
> - Add required compatible for patternProperties in stm32/st,stm32-syscon.yaml.
> - Fix issue found by sashiko-bot:
>   - Add freeing compartment_owner.
>   - Replace regmap_read/regmap_write by regmap_update_bits in stm32_tamp_nvram_write_byte().
>   - Update error return in stm32_tamp_nvram_read_byte(), stm32_tamp_nvram_write_byte(),
>     stm32_tamp_nvram_read() and stm32_tamp_nvram_write() to return the actual regmap_read() /
>     regmap_write() error instead of -EIO.
>  - Add freeing field and update error return values for stm32_tamp_nvram_get_backup_zones().
>  - Update error return for stm32_tamp_nvram_probe().
> - Link to v1: https://patch.msgid.link/20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com
> 
> To: Simeon Marijon <simeon.marijon@foss.st.com>
> To: Patrice Chotard <patrice.chotard@foss.st.com>
> To: Srinivas Kandagatla <srini@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> To: Alexandre Torgue <alexandre.torgue@foss.st.com>
> To: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Patrice Chotard (1):
>       dt-bindings: arm: stm32: allow TAMP nvram child node for syscon
> 
> Simeon Marijon (2):
>       dt-bindings: nvmem: add STM32MPX TAMP backup registers
>       nvmem: stm32: add TAMP nvmem driver
> 
>  .../bindings/arm/stm32/st,stm32-syscon.yaml        |  38 +-
>  .../bindings/nvmem/st,stm32-tamp-nvram.yaml        |  57 ++
>  MAINTAINERS                                        |   8 +
>  drivers/nvmem/Kconfig                              |  11 +
>  drivers/nvmem/Makefile                             |   2 +
>  drivers/nvmem/stm32-tamp-nvram.c                   | 680 +++++++++++++++++++++
>  6 files changed, 793 insertions(+), 3 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20260909-upstream_nvram_reworked-f84a4b37817c
> 
> Best regards,
> --  
> Patrice Chotard <patrice.chotard@foss.st.com>
> 

