Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF264BA1C1;
	Mon,  5 Oct 2026 15:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215140; cv=fail; b=mQpveVjTf3cxLwMOIsTi/CcLOtCJXraafho35QIsvPiuTZZ7svlHcK8PIaPPNPy7XEyJgQ9F1iRDb7Vx6NaVsRjE+bLYvvJCsr/9KYhKy+RLaKNfG59/vrYVu635Ni8iLkcfdlFAfuhmUpPUQLjEPk8F4MqSuRLIw5xnHFP6RKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215140; c=relaxed/simple;
	bh=6wiKWOYjJHNSMILhgHBhaVvfI0bO8g/gnOm9MSvs3dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=McPdiuoLGgSgl6ZonqyX4vnFtJ3lI8scf0uwYTk8X9LyCLzL6GFULBgvdXemyXcHUtP3hHmM0F5onGZOLxvKqnVk1XcTAlJXYcVcMiHiViWYIVBAfYMztcL2XTmHsrFJHJTj4NzCa1brt1tC5GP5g2WDFtpuncfyOIAg1CL4vM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=APwD/OLZ; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=lf0/L14n; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="APwD/OLZ";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="lf0/L14n"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 695ES2cK106209;
	Mon, 5 Oct 2026 10:45:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ZpV7YLIcugOcSmlVvA5RRT+ngb6InId0H6adveLtf
	VI=; b=APwD/OLZPwfwsL5flXvGHfgFDFTRd2bWlaj8UWLkpTcdZv9pbbbPDdBJX
	AQU3pPrNsrLo/3QGemIbnCzQMT+B6xK4DPIKlqoFsaRAjAyozyKTGpS3w9PVlIv2
	h02/fFRb1eiUYhbjBKnCCfYKDvC+jX84Lh3eOX5JgKGuf0GUSNygvmgTIM13n1Ho
	Rx39LklIfHzPV+efNhmGR1H60aUndFz0afZ2lbrImM4yztRsnF51mYBeW3d3H87r
	Akq7dJZ/oYBHnSz/piYN5bTIJkwOQXRE5JX6YiPYb3IcKfoOb7uWGwyRPi4aOe2t
	aKGrtHXcchEbrHgFqZbnMxeEJlzuw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h3knnp4kv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 10:45:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIUWfpk3k4xj8JXaNIPJ710DH5jWk7LyNycHEXlHG8sVyLIgOO08lLH304AeLyr4HbMnjfK4zWgjU93HpXKkaVcIL/4jGky8D0NRk7RKUF86bFL6sFU4ODA8YsIwXvk/r6p2aS/dMjJn5K3XNmtyP8N0kORxwNDSsa+eTXLKFW+4DXrJRmGgzygL/8haS39wW5OMf+CD6/ZBufkdP1mx6f80jZ48VarypaBHNfmLbocehpPXyaxh9Z+SG2UCPux3cicsRwJlUm63wmhgOO94JsbZ2rK2dTnqbNGxoO1KMM4xKNFD2KGQI4aQ33x5FcXizVNTxy5cD+pbWddpKumniw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpV7YLIcugOcSmlVvA5RRT+ngb6InId0H6adveLtfVI=;
 b=ciWelFJEnLdcbTZmoVExh/LlYmf/SjEFYAAPjiT9nuZDbabkuQjdow1mpVtbQFFJ2pvXkcNa4xMN1Rn8dgvUnlzFPZNE7/vxGVttS8BY5QVFtO7h9MicTf0I0lrRqSGeqIE5C6lZAg2bEx+6bmMjOY36Br2UbHf8y5TVcK0SSO3TTs0zu3KwAXCAJ6D5dz2YXj8C78HzgmzWubeqgHdVGljlecOclt4RnHRwfz0OHqj7aWXhgtQXRDT46Dbh8TdfTgG14CrPWjqrlljN7ns9dDCx7rHV/SKU3JEyel2QiXNJMN5qE+VyqdYXQbdWSzOcs4R3JYA8Jk111UrMujc9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpV7YLIcugOcSmlVvA5RRT+ngb6InId0H6adveLtfVI=;
 b=lf0/L14n0hruuErNZTvVX8EUyWxXLbGCVgTsTceehqz2sMCB3RATc1uPLAZdPbPKtjYEG7mixphokcGm8julOy5ndYDOOSAFgKSPCwguSE/CzoPlZG0EwcUWbPpRxlqlFQEz/nTkrjSeauohnGeKHV6XKkhpNlr0UiYM5clMuyA=
Received: from BN0PR02CA0040.namprd02.prod.outlook.com (2603:10b6:408:e5::15)
 by IA6PR10MB997632.namprd10.prod.outlook.com (2603:10b6:208:5e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.12; Mon, 5 Oct
 2026 15:45:26 +0000
Received: from LV8PEPF0000005F.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::65) by BN0PR02CA0040.outlook.office365.com
 (2603:10b6:408:e5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 15:45:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 LV8PEPF0000005F.mail.protection.outlook.com (10.167.245.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 15:45:24 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 10:44:58 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 10:44:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 10:44:57 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695Fison1424820;
	Mon, 5 Oct 2026 10:44:55 -0500
Message-ID: <b82dec19-02a9-4b93-a2bb-3cbb6f33ae63@ti.com>
Date: Mon, 5 Oct 2026 21:14:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: Add k3-am62p-wakeup.dtsi for AM62PX
 efuse GP_SW1
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260922165714.425576-1-jm@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20260922165714.425576-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005F:EE_|IA6PR10MB997632:EE_
X-MS-Office365-Filtering-Correlation-Id: 144e9dd3-8765-4c7e-a90c-08df22f7abcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|10067099003|22082099003|18002099003|13003099007|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	jRrMykxcVgNrPy2eDxmfg8RXl4Klu5z/9zvSYG1BJc2MmJMEeMjawKFGNy+oZ06b+iobgWzWE9X7AtLGnJnQWv1QeQI8N4eWmgtHgxaEJaUljZ6cLYl6BIqgV1A3UUWVPhwcRPTjVvCHfnvcB7i2zF2hJY94wOOz64IvpWLnRAr6cg0WYP6qTr8onpDABWSStRPdtp2NLh3OUsJcGQUiFQflzoJMERyvTn5LtvfMPB0QhbIUC0MxnHIQi4oZ7iRC85F5JGO4MMClrK975gFhV0gFi6ZyaAdoonYS7w/E2s+8dO9GvEndJfQOpWgnJnujqnWtvgGuG1ox0GlQStnzArnRVtACMU9rSOfDWBrVzayb8AP0qaSPVhzHZ6dcYaTy4hhYtXaHa5JxXwevw4FjMXURHj5Q5a3W9v//6M8kCjYjqIGeZSrsgu96gQfAEkvh1dv1cR3KP69Ls13IzgQQmykbB8cq0SKU9In/cYm+BidSTSHNulYqRhDadfxevWGMFTKKAST5zycwUen9sKBbOhk6hOASg2aYg7a7iYqHh13zkunAXCDpou0lDsMzNWw0WffzeR4/h1wXafQTshC+NM8vJ3H1MxY7LLtolIIFqQUfd63327ZoOtCjM8z4FQeN/IBQDUOTLyjnWLHzJzLzRA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(10067099003)(22082099003)(18002099003)(13003099007)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9ZtM5C6aw5wo8z7ybdBXSFOHv+Q6tosmkS+/nN86khhmAaa2Z9goEOTQzfZEXhGnUliMAeaahmYle9+8svMrl01A4u/ZEaWTIcuNm7dgeT5JliRjL+9Lo2GPjXZ1Uo2gaePBldMSq32SFvRUFdXVjD7qp4UqoF6MtJNJhRQoFBAbDgKS4sJfV8+I3uclkJTD1C9WhYl8l2kb52mTGF3Lt6XDYQhI0wdQqZJj8V4kXa1MoAhXXphdC4MCfg8dhRsL4+xTUBatnBKCsQOZgT3tkaH8GvPLCOE/Jag/DliyGninDmwd2E8gOOJegwKXIiSHQf8yY5PZHxpLQv8OZ/p7lwfWrYaDQKBUP0N0rhWhJSxzEGByYvZT7Fi1EEOmMw4xb1k6DjjKh0NOWI/PaGjlnMxvlHNQE1TpOPLfZStpEaOWApj68/YWrw7vv8k+CqcT
X-Exchange-RoutingPolicyChecked:
	BjQSF/ZZMLk0+W5QvAO9OqBNWCmHgVfJoU+5VecqyJMSONsotAvmDCiYr3Dd23/xV8zaCTG6fZGM7O9rPCY/9vW+o1xrYUlxlxLFPak70oYrkD4r9aqEkjhQHXCna7FtzAsvJuOXWw/HZ+PziipNyYShApQ81H/C/AVS/lyG6iKx9KVs+2EG7B20tElgN6BdJRTa4Vsx/OTROwgv4BPkHRH/WIMgbA1oPEWper+iOZHf1W+SU9SKJNzC+8eDz2DbwNxXj6xaVSNG5SFf4PomoOxOlS86mC+TiF8EsOVDvJeQywHMwwgMlvEt/iLOf7MqqZdut2KgtnBjv3sHSzUB4A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 15:45:24.3967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 144e9dd3-8765-4c7e-a90c-08df22f7abcc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997632
X-Authority-Analysis: v=2.4 cv=I/7w19gg c=1 sm=1 tr=0 ts=6ac3c61a cx=c_pps
 a=WJg1qJ+8ll6SXBP1xA03Zg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=pgIRJvdz7goghg79Aq8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: H5rL2q6q7qyNy13hicxJJ2VC-FBgty6F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MSBTYWx0ZWRfX75PZ+yZ/qvbE
 yfIohzdaNcy9JKNDuQ6+rPfMKc684pu9sOvCfuG5yS8XapuCZyhcBGPsAyQcVVHazPlpqz40/3R
 LUukqvoh750juN0kWilflCH4C1QqEOP8zGqJq9Xt/oDwOUXAe7bjO4bfGCgu6hDQWjU8fYT+FUr
 liNh80lAw9iCBIJFSZbhmUw2PtlPxLej4Bep/6aXR6xHfJwb7ePfJ/AS+5flmLAsubgo4DDQPaZ
 f0yg5i5VYu/iKPIEHFYXNtbnYWgaZGb657kqvHmbigLu4ZN2c1qUvAECIoEx9IxFHOyaeW989hr
 lAI4OnLBDsiN9aSK9NYM2v/yDq+QONOh9MDCrYEEqiuTQoW0BjovAaElTr+2iYU5W9KZbkMK3pI
 MUonDRlh2R3JcWI6qWLCONZZd2OAccqxXNZDkkSiOi/BWeSXTSSqVZygjiwiTGWZ1uqbSt0SbBN
 3TdD0ftAfR0CYmLREng==
X-Proofpoint-ORIG-GUID: H5rL2q6q7qyNy13hicxJJ2VC-FBgty6F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MSBTYWx0ZWRfX40/THOtNzOaq
 XJ9EK3w46Tt19QzrLAudgOtiMmB2TDUo40Fpnyo2v8YkdjHiyXjw106IgFXOR3tDFUxp86Yp/WU
 9RwsCwZ60GQyI1JHwkTxRYZgCoVuwIY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050061

Hey Judith,
Thanks for the patch.

On 22/09/26 22:27, Judith Mendez wrote:
> Create k3-am62p-wakeup.dtsi which includes AM62P-specific WAKEUP
> domain nodes.
>
> In k3-am62p-wakeup.dtsi, add the efuse node for GP_SW1 register at
> offset 0x230. GP_SW1 will be used to determine AM62P silicon revision.


Nit: Isn't GP_SW1 0x230 + offset? might need fixing of the msg.

>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> This patch adds GP_SW1 efuse node for AM62PX only now that bindings [0]
> are in place.
>
> Changes since v1:
> - Move gpsw_efuse from k3-am62p-j722s-common-wakeup.dtsi to the new
>    k3-am62p-wakeup.dtsi [1] since GP_SW efuse registers are marked
>    reserved for J722S.
>
> [0] https://lore.kernel.org/all/178942274041.683176.599438200260103620.b4-ty@kernel.org/
> [1] https://lore.kernel.org/all/5d4742fa-e26a-4b49-8eb4-b6291c402334@ti.com/#t
>
> Link to v1:
> https://lore.kernel.org/all/20260915001304.3781247-1-jm@ti.com/
> ---
>   arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi | 25 +++++++++++++++++++++
>   arch/arm64/boot/dts/ti/k3-am62p.dtsi        |  1 +
>   2 files changed, 26 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi
> new file mode 100644
> index 0000000000000..c56fb3890c983
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Device Tree file for the AM62P WAKEUP domain peripherals
> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +&wkup_conf {
> +	gpsw_efuse: efuse@230 {
> +		compatible = "ti,am62p-efuse", "socionext,uniphier-efuse";
> +		reg = <0x230 0x10>;
> +		#address-cells = <1>;
> +		bootph-all;


Nit: I think the property ordering for bootph-all doesn't look correct.

With the above two changes, if valid.

Reviewed-by: Moteen Shah <m-shah@ti.com>

Regards,
Moteen

> +		#size-cells = <1>;
> +
> +		gpsw1: gpsw1@4 {
> +			reg = <0x4 0x4>;
> +		};
> +	};
> +};
> +
> +&chipid {
> +	nvmem-cells = <&gpsw1>;
> +	nvmem-cell-names = "gpsw1";
> +};
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
> index 9d6266d6ddb82..058f264ee0646 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
> @@ -154,3 +154,4 @@ cbass_wakeup: bus@b00000 {
>   
>   /* Include AM62P specific peripherals */
>   #include "k3-am62p-main.dtsi"
> +#include "k3-am62p-wakeup.dtsi"
