Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011067.outbound.protection.outlook.com [52.101.70.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370EB3B8BC4;
	Tue, 22 Sep 2026 08:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064982; cv=fail; b=YJhWPN6E2lOX339gioTkTQfp62OpyaliEy9Qa7b8zy/laCGE7I/dgPqbwCuLQRRu4ZGOtnHI+b3VB4cltmC/0LDbzRt6lLvMoVc+E/OjLft357lGFiSYIHwjEKc0eEpWxnXIJYjR9xzw1Felf+UbkOKH5LV9eLBFQ3UVY2NA20o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064982; c=relaxed/simple;
	bh=qLvIaPpgEaSJCH+R8dIDq5ck9PLw1pWpFpAYDrE7oig=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=q+l1Afp/NUk/IsmdFVjRJfI9q2FUNJOCarAXaVAVtyCuuPIpfPBKWUNcpXoRMhaCDdGRPi/YI8fwo84/21ZDE2EqSDyuiH5VbocA3cQOmjvke3krEeM6R8gUuDBBMILBSNthTIqn2eiPvVkMVv2EERlrlI/qnduEblRMczYqyXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=CiKy7JZg; arc=fail smtp.client-ip=52.101.70.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="CiKy7JZg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+3Vl47lf3AMXFoCIJJ2t6Z/GUqF4ARUQv1qEDSurTGODI3BLPy+HH4B1MdjZ1x3FoOchCJ76bBqGIJ7SVj2/iepVhFRl2m3O49YMMv7FyNtmUEBksraNzB2haGN3jcEYhCBFtgI5JXoqrUMZ0EWJYh7zwoqoz7hLxCipN23RXsiiNxkQMn+cKglCxvfxbFhob7glw8Tt4RKbeqkgxleftQWJfRN1pc1c7q3m1F79zC/KvhngE1ahfzfY7kkf8+mYy4JiJdw0f/OlKfO90AdQedudiGEk5tVfH44QdptEBwtLxoE9nDdj3aUzzdcOxO26pKaYYDMgZO2b2buS+MWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4UXtHLK5FAk8BLOvt2xHDnk4lsAil0puPmrfGhCSjU=;
 b=mzfDQgelvToDbfxEtz/y6ilLD572ESCQx6T+not3bMCthiOP6p7edbNto8ZcAHDfCFFy2AU34ig7MFp87JsvZcVUhy+eB3cDRoXkirzIWwKJVhsYR7dQ0RTpJZNB5UJcOHOf+8rZWsa5rvFW8nzwTshOSMQt3asjJIUmEP8MAo2AJHSofb8wMY13iZ766Mgp6wLmpUlKqZRz28eLVdVGn4W627xmwR7fUukEyzzCnSHttH1/rxmg1iBf/zbjHYvZczDczCgGfrrCyxe5nFPS/88Vw4XoSrHDy89LXLla9w9CoCg/CjfrSD9olcQz3K65iyhAUfaHuQSfzYNfV49Qzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=xiaopeng.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4UXtHLK5FAk8BLOvt2xHDnk4lsAil0puPmrfGhCSjU=;
 b=CiKy7JZgUq9nT1z/3Hndtxv5Z8pfL7otRGToopV/iM0nHyJBeOLnUkpMmqqALW18ik6xEsn0p5qHIuvK0xG7KJLrvGgxIBvZ50pgbKHY0zKRm35lOFizAY0hE1Xg172AYrRl5T6978YkmqhVudhWFDVVddFsMVuXUMo11Oxj+WWAddmUCbOn96Pblw4ztKCq58h7i3Bvoxvnt8Us1N8WFKbaWtfBHGiLPKl1wgAViR+bGJNjdzSUK10u/I9mrSudOot4GJsyzqFspu3OoqnaT9NHyu7ixaMco49PqRGRiVVpz/+0d9QDCvescHJYMEkgDoez65PXCtZx7jQFaY6EUg==
Received: from DB9PR05CA0005.eurprd05.prod.outlook.com (2603:10a6:10:1da::10)
 by DU0PR10MB6779.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:478::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Tue, 22 Sep
 2026 08:16:14 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::40) by DB9PR05CA0005.outlook.office365.com
 (2603:10a6:10:1da::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Tue,
 22 Sep 2026 08:16:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 08:16:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 22 Sep
 2026 10:22:41 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 22 Sep
 2026 10:16:13 +0200
Message-ID: <6c95cadf-c73a-4b2b-8d21-97753087b372@foss.st.com>
Date: Tue, 22 Sep 2026 10:16:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: vgxy61: reject out of range MIPI CSI-2 lane
 numbers
To: Guo Zihao <guozh23@xiaopeng.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil@kernel.org>, Sylvain Petinot <sylvain.petinot@foss.st.com>, "Sakari
 Ailus" <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Liu Chao <liuc63@xiaopeng.com>
References: <20260918060352.1879381-1-guozh23@xiaopeng.com>
 <0729208e-e1ab-4960-aa03-810bd4915001@foss.st.com>
 <20260922064604.847150-1-guozh23@xiaopeng.com>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260922064604.847150-1-guozh23@xiaopeng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0A:EE_|DU0PR10MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d3b195-8b92-4ec6-8bbc-08df1881c51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PZ6px9xk8LAxurrEsYCDV2GiWkalkN/3WUR3X+0BPcBj7ljQ6aG8KynCkt9KiaMOPCzxTRN/QEGbSgYBj8FO8Uu2Cx/BFgbnNAMfUTSM8SLCJ+Xlwvtt/5pu18LuWIl1FG+j03fPao75hEqfVoMs6GRH+eFaDZEU1HP8NSKovAjJJsm7H/F0dfFT4Zw7mWoUPCGWuKEYvyC4jxBEjLP1g3NZuwlGzJo94Xm1uYeuWcYHmXoXMeSvWNvOgPVrtdpX+jjKb8sfKoNaClkmtmmFdwfM4tQ7CGMwlsvCqf5yYXxNhuUGKN7/Unq5V3teLzBaKGkDTW/XRX3cjXb1nxHIzDhqReSmzYelMgC6b6ix7VhQgVFMP9NAMj4J6vb5IJHl5/pEZCjUgKuH6lQ/X++rRF+GEZ4ZS6DrxmMs2svj6wVVkJ7Jxu1yD+G0hjsUdnHw9K3SqzDsvKEpz71jRz2R08dRqsvPW0sCfJiymoEfWoQ2/3vzzEE2uhVhzey2r2M6kWgFXxlKk/k70SRInHgEdqLNRbCbyJUVprQCl9VgTwNM3DxgaRJijNXZCgYpuTk4D2F4WMICWy0AION9Eumgr28OZ/PdjvyquYGl94fxHXBJUBruzKn0QtNfzILkCsl+Odpaifv5dtHj20M0mIJVIJb5TocgzID/14ACZQVNbOh/GhrbYNcadaWqnXQQgmv6s8OsGjJp7MKkeQxPyWKw9Q==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/RGLGlaKagYB7iUhHgdW6LxHyTBBmej+jllzZPfqeL3tFVgaxGjBnbyoIA/GtT8wDcjpVTy/Elg48bDUeNcoqQu9FPhY1667KtY1gPCQJvAHSUI6E4sgqkHxIAxyE3Jlo7Ax6AMfn8r14CXjovfuuAvXol0oI3gnw2dGBr3c1qNjWtd5pnULVgV2d1AVgCU5tSt+nAiT3/eyZqWHWUeyhw2+NF+3skxOOaGunY7kdASE0yHT4Ds8MUO+jf8XxLNAB6/z/aoNJmZQbVlNmYlTogWEPzbdaFU97pX7HuVpgcm/brRbs64CYb28vsRnC3SU+uImD/s/Y6a15nd3h7XKmhQw73bmdbWqtUU7YnkqFnLaGLvc4fNRyrQkQr7uQhEJGrxfgLK70VsozPol8Sy7ccc534RRlC3SbIHVIsXA9roZDz826vUGuRuYFyBiMPts
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 08:16:14.5569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d3b195-8b92-4ec6-8bbc-08df1881c51d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6779

Hi,

Le 22/09/2026 à 08:46, Guo Zihao a écrit :
> Hi Benjamin,
> 
> Thanks for the review. The maintainers are in copy now.
> 
> On the lane checking: l_nb is the number of lanes, while clock_lane and
> data_lanes[] are the lane indices. The check at line 1453 accepts
> num_data_lanes being 1, 2 or 4, but an endpoint such as
> 
>         data-lanes = <1 2 3 99>;
> 
> has a valid count of 4 and an out of range index in the last entry. The
> indices are stored as unsigned char in struct v4l2_mbus_config_mipi_csi2,
> so an endpoint value of 99 arrives as 99, and anything from 5 up writes
> past the five element phy2log array.

Ah you're right, my mistake. I'll review v2.

> 
> For clock_lane the write to phy2log[clock_lane] at line 1461 happens
> before the log2phy[0] != 0 check at line 1480. vd55g1 and vd56g3, which
> build the same kind of map from the same properties, check clock_lane
> before the map is built rather than after.
> 
> v2 keeps both checks.
> 
> On the tooling question: yes, this was written with the help of an LLM,
> and v2 carries the Assisted-by tag as the process documentation asks. I
> went through the code and the reasoning myself before sending it.
> 
> Regards,
> Guo

-- 
Regards,
Benjamin

