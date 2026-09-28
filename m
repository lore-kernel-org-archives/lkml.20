Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10153DB647;
	Mon, 28 Sep 2026 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600429; cv=fail; b=eZ7Dh3yGMlLmgZ4qKVlUV9H5o1nGlgOoLlE8ZLRC0l/b0pZZXg1ZBiN3Qrump2uG/3WpiH2K4th3d5OzA15r3wkkESn5I1CUxpdU8+S1Zltc4f5X9SdHgJ2IIo6tNapUAiFly49FU2j4nTgNB+6O91mzpe18dDL4vj/1VN1mHnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600429; c=relaxed/simple;
	bh=oHMk2OMakzJnNJVNu8fyQrux2D78LD6ktSHwt2U/OUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ReDS6d0P8CZXKvVj1tkfflQnyZNWf0yT35M28rJXONQF3yKTop2KmRK0n4UcxS3drfhOtDfu2sv2Ql5+at+8UXRI9+gvA6x+sEq8rcnvu8T+l/sw/eUzUjTdJGJvz99ontV7E51qInQ07c7lb0Dq4Rr2tWECWSXSgIQ/pOtDbcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=fpMjWpvu; arc=fail smtp.client-ip=52.101.69.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="fpMjWpvu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guKsYDubjePw6/6d3aehjADY/19Pv5+rTM8HsHmmkW0O0sFpTte/ixfeEruwQOoNaWI39rfvfFIt2u+toQQ9fmP4thBWuJMcVMPy6c0IO/Z6dD7kUFMqh7CCZBEtXn9bvtknQV6bF39afDoSrborvqAGboxvRao6DeKVjHVzLuv8bbg5YMVz3VAUA3DzCtLuwMKlyOWr8BaHvfd89Ly+Qq5v/PPwJvY6Qiuc12PoWaDRAYqWiH/4F+wQMYkhFOhUb0HHPJylftcs6/rWiLpe2K7zhcfTVkdFjp4Q4jX58JMfd4U4CepQoXCpH7UBFrhgy2aIYBoixDAEPZ20PjE4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBLgGttSgxfalRM4bR47Cm41a6bKQMOdXvQw811URU0=;
 b=w2WsYy4mbmoFdleux9DwOVAmklP7MMZfs2zhmovmeoHzoRtOTReDdEuXrP98XCK4O1AeWsrni6Vf7XfpnoK5gywOipuVehQxqPcfm4tqSDvL8rNhHpefyq4eNSTWCvtbz4FijgZcYKgsm/gDA/F/XkqkCVCqUmkdSKW3JVy6iB3HMO5YMVvhZcU5BHThlamorRdqvGIjntnkzgpl62k6g6/QimDEzKWPdbVgeCdk85pPhvz7V3rPWacXZTwqQAcmnE0D3XsuVLeQriY1dfLt91LfYW62+udOmGahjJuz+SwXc/uJSwvlv+R2W5+QKD5+n/AKocZyd+ADRSON5bMuIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=posteo.net smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBLgGttSgxfalRM4bR47Cm41a6bKQMOdXvQw811URU0=;
 b=fpMjWpvuDDkCiqGV2/Dpoay2rUnanI43RbvyLOUhJ+AeeU0hscwn3eSzL5aV50aMQO8X1Lunk3EzXBOGn56Easez2QsrXJkZilDZ0s0JndS7ViWNnzpjj5o1IPPTeGuH6OpBaNpTDSBUJzOn6VHgNnrfvWRM6LiYrX/IVyft5LAItnB2VaM8AuStBrx2hPlcJLcYQMH20/nO1lmbrEdVaiNkV6mVRdKD0JR4w8BYVSOgfgNft/jMOz7kDEzXhljEfor9GO900rhi1bh2VblsG34z4UzYwNdOKfgSZW+wKPZuwuLlMjOStG5uOOLLsdplHQBE0P3E46GgZDhQQXtQiQ==
Received: from DB8P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::32)
 by DB8PR10MB3864.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:165::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 13:00:24 +0000
Received: from MAD0EPF000008BF.eurprd04.prod.outlook.com
 (2603:10a6:10:130:cafe::85) by DB8P191CA0022.outlook.office365.com
 (2603:10a6:10:130::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 13:00:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008BF.mail.protection.outlook.com (10.167.241.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 13:00:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 15:06:15 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 15:00:22 +0200
Message-ID: <4f15d071-bc7a-4b7d-8ecd-68a7db2708fe@foss.st.com>
Date: Mon, 28 Sep 2026 15:00:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: st: add digital temperature sensor on
 stm32mp25
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260924192259.20517-1-mateusz.nowicki@posteo.net>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260924192259.20517-1-mateusz.nowicki@posteo.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BF:EE_|DB8PR10MB3864:EE_
X-MS-Office365-Filtering-Correlation-Id: 4881372a-c0aa-4132-d119-08df1d6075d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZSWSpiRn7WE7PlzLwBTHRC6kxfRwCpvjIpkAex7tZDhiA/1ecjBoJv4D0E+alUuydEIWygJIHUOCjjkJEpknx/Swk13ERwaFFe23nvrgB2x2i7m45rnU/6N6Gg3F/WX7dEGpw/T7TK1M70y8hkLDf7UuNbZq070IRq4pXLK2ekgVz3CTy8BW2hc0flmsO4t1lAhMeii8+JQkNjrpuLD0FN4ZaFd5LwSnqVaRzXiwKI9m+nXTsLeKzqpiMQ8KIPuvihZziCNzuULHuAhEtqVQ95QT+ER9ZhMpWYU0Iqm/dl5VCbfb4h4okOM0wt3Yi4BTG8XlTzVJ6eHioOT9tdqzPsmNezgTWYRC8dNBN3WYq4lv6lypExdh+XwtZK+mrzefMykkMviJnlEOo2IkQzncyjN1eeTez8pzuw1hNHfIWoAKthM9bdan3BQyKHV42jivIHgJkk3BF6H3cwwMCOvpJ6tbhii6sApewfIp3Eg0tBVh+0l/qzOU5zrv9c6DBBwd3djOGqgRTqTEYsVBUUKe7gYyMujIRuseko6tEYOI/4qlL2RSXkr/zGAic/AGnDPjHcOxgpfN3AQ8rP/UyvmBXN6DlV0rmPt9xIYUVDyJ72GuzB+OMuCg/qBZeBsctp13sJqDyJy3XRgPfyIhiiuRUWTCvAtoenDMyONzkCEQsOveVu1wMjOFFmtLNkpoLJ8+3+t+MsynhRis2eqKX7ATag==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rlKxrMxrVnAY9Al7/Wf83aCSm9ikMimdLMq0UfT975Z7KR6WFUfknnmKwbxA1b1IKfKED1B2VqA++i34iSpsFxM4duFgGEswGaey6VG3JOoxmRrl82dZJLZTQ6WfurwYtnvyftjzhbWUjmw6quz4sJuERpPc+MEXbiTEIyX+Egvi+CgDYTDkn/rfKIZzSewbC5e4icMB4TV6dWEnlAnRQ6QA9nnZu3Ae1OFvY8yAygQ0IP8dsbHodmUZY0DTSaX9C+BzuxpaotkxeACwhwyxkX/mb/J9R+Yr8RR8EFk0ljsf3StsVCV+eb/gt2LQmlxRT9Pa+e85Mh5UvNQrHMdINLEjFYDj+IexRgD29rqLp5Equ/IoMLY2T8nyi9KMsMbjsxR9G8weYmUVPhJoSvCPfS30OqYbYEH8pUCggPugaGhpxjlsxj43zymM0Fy93OvC
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 13:00:23.9698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4881372a-c0aa-4132-d119-08df1d6075d6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008BF.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3864

Hi Mateusz

On 9/24/26 21:23, Mateusz Nowicki wrote:
> This series describes the digital temperature sensor (DTS) of the
> STM32MP25, a Moortec MR75203 PVT controller, and enables its hwmon
> driver in the arm64 defconfig. Thermal zones will follow in a separate
> series once this one is applied.
> 
> Tested on the STM32MP257F-DK. Temperature sensor 1 follows the CPU
> load. Two voltage monitor channels, in0 and in2, read about 815 mV. The
> other 14 read 1 mV.
> 
> Questions for ST:
> - The process detector and voltage monitor blocks are not in the
>    reference manual. Are they at offsets 0x180 and 0x400, as found on
>    the board? The downstream kernel places the process detector at
>    0x200, where no register responds on the DK.
> - Which supplies are connected to the voltage monitor channels? With
>    this information, moortec,vm-active-channels could be added.
> 
> Mateusz Nowicki (2):
>    arm64: dts: st: add digital temperature sensor on stm32mp251
>    arm64: defconfig: enable Moortec MR75203 PVT controller
> 
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 15 +++++++++++++++
>   arch/arm64/configs/defconfig           |  1 +
>   2 files changed, 16 insertions(+)
> 
> 
> base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5

Applied on stm32-next.

regards
Alex
