Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A4747A871;
	Fri,  4 Sep 2026 15:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536403; cv=fail; b=ha6DCzZFlfwQPODGH4y1BBevjzAjpwZhHmfHvCybN+/OVnf+epcDo+OvEtU3dbpGdyuFyLqKgZ+FNjimZ/6S/xxwmBt9T51YswIucvPsy7bIMWTpTAZxauHth7MSGMfAoQ3ZCcH9UmitT/V+2MwezxBoQCVeqFB3MPiU0WyKyK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536403; c=relaxed/simple;
	bh=U9R1CAZ1YzeSGhSco3GfShYtl2vf5rh4Yr9TiqZomyQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9BcsBc19Th3eBpChNkMlx/63YCe7NDxLhxkxZP9vrA792MyTGcs3sW+jiZ2Tu4f9619UuSQPOqnRG3ZoYURd1SUITMGjBblj+u8z55lmaGaUidiPHeouTn8o6n66LM5CAeFJ0VGV7NvM8u+dYSv6FR1qdcyOWwNSecYP+la9z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ARMLX+qR; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dRlhHwMm; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ARMLX+qR";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dRlhHwMm"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 684EtcXW2476711;
	Fri, 4 Sep 2026 10:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=rXna758Ot6XYskm
	gRk1NaVJ0HeyYC9JQunFM0hLhdbE=; b=ARMLX+qRkgGTkQOUmQENkB5yhcttXxt
	XxxmKLRbVOTZIT/ykyfb8iaqEYCyeNdzbhZb2oTVveklhGJ5qLgwnG+It0MONa/K
	DZ0AWiyR4hecTk25WtyEVHYyrdnkdfNZj1xdZp8zZPcW10K8AToEkJgX+bTZP9BI
	fMSNQjhsTd8L9JsQhvyMsxVDvnt8nFj6EPbIuGHTnMwYRhfKOTMK2/d4fqgapeoQ
	oky9Pom3PTubeVjCXkUn8k+4dGoz4+OVO8+i7JfyBX8XDj8FdNqqGzIYx25EXMuy
	Gvp7ZA++kAU/Qge8STlRIg64LOSZdyEXU8riFbPB+dK3f6tp0OoXruA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010051.outbound.protection.outlook.com [40.93.198.51])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gfyx7rfbh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 10:39:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GB97hLS7EMA0whPQfG/6XtxEpKQkl5fbS+DyLCJluBfJ8X8MKm8Gql0e8vWr1KLJt0N60up0fb9085uI3pUEppOb+//CTKPsMK3UHZqwGb4oTwBpxTCLuiy3+M6hOEOmwhOiOynaRJT81XdUoNjJJSNRpFbE730sjZwwnRfoOP2LnRKugUE769hgvZiwtymBTkwiRiKayFqURariIKO2QKUuWSGmQptM1UuSuKhIf4SKnrA6cfWFhsHeHPfyHAH2OfLfzpcLLifTkw0l4nFJAExQoo3Z9TWW1/4Sglq+IcOxVMd/Kcau4f5GVyHySMmsXd947WIwOZz8BmgVVlmoOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXna758Ot6XYskmgRk1NaVJ0HeyYC9JQunFM0hLhdbE=;
 b=cZB2ecQwZ3D9otpnDDY10an4N49AplfaQ9JTZZ1kJp41womy/PZfhSD87cZCekMGE21vbREx0FYWBssmT1soWVkoY4+LgoCUrVB5bI3/NIQwtkvkzr2pk6LErhPpfR7wp8oRutc0BRUul3P4dKt4ILHiKboksHbM0uPjFW1M/amhKhTwmbKy9hotWVrgujrP22uA4FkIZuyh438QixiYdMEVWfdnA40InoIJhLlPpCMzVXTnyKRTpn3skBoqoYYNsKGcurx1yL6yBYpQR/oVdotisuqI9LAr8v28c4iJOfFmNDFlgI5aUVRU0maw1CWYuqWLwWzl+dFHbfaTWIDY2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.phytec.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXna758Ot6XYskmgRk1NaVJ0HeyYC9JQunFM0hLhdbE=;
 b=dRlhHwMm0e0RlSaX0pBqt5BUQjmKOxNYm3Oomzv2kL3FIrSw4vjGr1yiHYXAmP5tLohN4JxWhnBR9QysFv+/FsTCnLBh6Stgp8G9SPVX053GItKa5CToDvNRUyH/UuHCCs8ZL1Gxs5nMvft52S0hp9AQziZgHp1MhbNheDrsM3U=
Received: from BN9PR03CA0221.namprd03.prod.outlook.com (2603:10b6:408:f8::16)
 by SA2PR10MB4505.namprd10.prod.outlook.com (2603:10b6:806:112::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 15:39:30 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:f8:cafe::6b) by BN9PR03CA0221.outlook.office365.com
 (2603:10b6:408:f8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 15:39:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 15:39:28 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 10:38:42 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 10:38:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 10:38:32 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684FcWaJ3754398;
	Fri, 4 Sep 2026 10:38:32 -0500
Date: Fri, 4 Sep 2026 10:38:32 -0500
From: Nishanth Menon <nm@ti.com>
To: John Ma <jma@phytec.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <w.egorov@phytec.de>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: Add support for the phyCORE-AM62Px
Message-ID: <20260904153832.auficoomyq3q4v2y@disgrace>
References: <20260810183728.1542417-1-jma@phytec.com>
 <20260810183728.1542417-2-jma@phytec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260810183728.1542417-2-jma@phytec.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|SA2PR10MB4505:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cfdfda4-6bd1-48ac-ce1a-08df0a9ab4bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|10067099003|18002099003|4143699003|56012099006|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	5Crocemt2jg+t7kWIWbtWtA+5DM8T9gILC4GlITIXRtAa9OoqbVlu9vjN0TTpA8gHxCDfpnZadJaS+qCPoZ+bfj3GC21Gzy9pdvFAkozwR8i+3bgNB8M8yCP44eCjqY0hyCwF2M8j21ObsiCzm5v3NItHY5FvUc+g0C3L+poTrGYUhKG1kCj/u3m7s4p7BDGnDJiqYB6OIdxdOYAiSPKn+8C5M1nUFCNAc+tO4ZFCo5ebTCsQN+EsKxvByB2YinndYyqLH+MYCs4xT8gWoeA7feN/F3fYNC56+UrL84RxHEP3vHLwror7BUcQ+YlifTrqVsFbpUxnLL+QW4aDW/Bd1pJZrpzbQAdhCZCZPsnLcMIam+WFvOnat1m3yJ1vrYfzlaP06lh7x6xhY0WSAnk63q5N6CjBZkd5sib6BfEMBFj0fgkaiVrbQui4uhXNzXntyISGU5UYKGqnfLL4VYJuuQuwlMpesw9retn9nsW0w/Ub36TCAxFWL/jv1nkRCQT2bnbEvBl7hFBy4IysLzsMpMJAT8bMhOwep+n8G25wYxzoY0vqHSXssoBI0zXjLHeUhJAKDz88r2P0EOWxyh/+moD2llmVUJCkzg/gzzBL3GYqA1/A9Br/cPycIi/hntLRmMUFoJOQKOd0btYFfSxAXIigTPxhXJsv5+ZS485J2MGjXGpdtzgNOerMlmZk4GfzGOMi2BhPLPw4Csu9umLcQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(18002099003)(4143699003)(56012099006)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iUZ/opiTtv4ad/JEyKxUbI2mI23B/43C28Dtwf3JRV6qMiIU0wwEjkCnLvHRflsVDFu1zm5ANv1eAwwje1HLtMsehB9Pivcpr/f4lRc+WLJJ3L87T9Tfhw1Qslio6pztY7vZZ789o77MwPqFoMJ0MNmI3r1RL1yPe5BhujutlYK5E+5vFhNteIyTW7iEgCawtAfjvGB5Dp+yj11CeYw62k8Z1lxydCzSprlIrqgVcLfsr/9om4FaPmVaJ192YGQDx78wM5zZQkzX7CpeBiyyeNt82533+sO2BgQqusulDfYCnAr7D5K+Wj/TKQujsxlp0L92owR+K3rUGKoPOkYZOo/NWMefk8JxH10xHDZiMCjLw4rYmWPZYMu3inGPAfCG9pupOkY0Mi7QbyD7QqBmPklntQKfv8Yks9+UDKI+cQgai2KImqJ/E52dT2mPEL5o
X-Exchange-RoutingPolicyChecked:
	2o/MDHLdKGSTr4m9dd8oWc2nISw+u/rxro/XDH5x3N24O580n/qKxaqAWiWfmrIUd+oT0XwClT1Hh9ELYoWSWatPDfB1B0y9hLCFJq8WfT7QlniH7c0+l4YKK8ZBM4RXjkf1pbiuUss2QZ1gVi/wd2Ql3BX7KB/frjyCd2wvfHZ3+4kYkp0UhwtLJ0qSBLN88EtRmIdynrZ6wRfRjO2h4iLlr0IBkgFZqw+Hi70ORQrgkefUX/UOzhTg4DMKeMXgVAQomKw6x1Ug/t1ZQqCLvZjrVjIbEnKL3h+vFAtKxPpu5+vfjyyVkmLrzAy3YOKBy35oNUYUP7i43PVofQOPDg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 15:39:28.2809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfdfda4-6bd1-48ac-ce1a-08df0a9ab4bd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4505
X-Proofpoint-GUID: 5EaKjyla52UyrBLetfrM53nAN9OYwqqr
X-Proofpoint-ORIG-GUID: 5EaKjyla52UyrBLetfrM53nAN9OYwqqr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0MiBTYWx0ZWRfXy9+/REzKcnM8
 T8zs4mMHHffYPMLrsbcgprEyA+6HFQHKav6FjjItyPrcTDTI4wp9nTbFyBm1Hn76K4Ug95iWpkW
 YWJ+NZY8pkO7zUSd9FL1g6hDx1odAK8=
X-Authority-Analysis: v=2.4 cv=PPM/P/qC c=1 sm=1 tr=0 ts=6a9ae637 cx=c_pps
 a=PojWdYBvulneKNx6glcDcw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=JSOPZz9IAAAA:8 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8
 a=J5Wyd2DpMTEPn5fAyUUA:9 a=CjuIK1q_8ugA:10 a=B-1sCzwcsC-Wa9HVu-tL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0MiBTYWx0ZWRfX8DBS4qEYr6I2
 dC04m39cu2HomAWikAdMQYEGgtcHSoLt2Y5GSNq2fmcwvRY7/4ajzobdWUB9oLHF67I7ANsJG8L
 8HpzZH2Is9CxWtMnLVD8yR+Gl4nlzVinq02Y5UB0aYh4MyvflUfKREZqnZi7/R95oOyQGJco12K
 1a3YyUtWhZEwIVnZB/Lks9yVNmenZwFfj2xwKm7IiPIiaZha9LqshO2IO5Jhny3qQZjfJ6SLKWG
 PGxkNbSFva5cIeGS92G0E27fWijYK0BKNQaMcIyLzHOilphQUT5bru2sDtYzf4zeDPV7v9WxCmX
 pFnfZpn1ANECxKOq7iGhhKdG13pN+iV16oKPXG01YIJ1G0hcJu2vWt8YI7qM/BIomHPvUBkxbt7
 gdJtGsqCKE/uLtDXm3lU7vGK5zi22Nf083tm56C5oOE9dxbPcKDU6nNhKmX1XUohHnRYJNXe7sD
 JnRWbFobbJw45Pt0Rng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040142

On 11:37-20260810, John Ma wrote:
> Add support for the PHYTEC phyCORE-AM62Px SoM [1] and the
> corresponding phyBOARD-Lynx carrier board [2]. The phyCORE-AM62Px SoM
> uses the TI AM62Px SoC and can come with different sizes and models of
> DDR, eMMC, and SPI NOR Flash.
> 
> Supported features:
>   * Audio playback and recording
>   * CAN
>   * Debug UART
>   * eMMC
>   * Ethernet
>   * GPIO buttons
>   * Heartbeat LED
>   * I2C EEPROM
>   * I2C RTC
>   * Micro SD card
>   * SPI NOR flash
>   * SPI Accelerometer
>   * USB
> 
> [1] https://www.phytec.com/product/phycore-am62px/
> [2] https://www.phytec.com/product/phyboard-am62px-development-kit/
> 
> Test results:
> https://gist.github.com/jma-phytec/fd7911a834e39b3fac0104690668882e
> 
> Signed-off-by: John Ma <jma@phytec.com>
> Reviewed-by: Wadim Egorov <w.egorov@phytec.de>
> ---
> v3:
>   - update EXTINTn pimmux
>   - fixed tab/space issue
>   - update interrupt for pmic
> v2:
>   - added bootph-all in cpsw3g_phy1 node
>   - fixed ti,fifo-depth property deprecated issue
>   - update ospi vcc-supply label from SoM
>   - added bootph-all in wkup_i2c0 node
>   - sorted nodes in alphabetical order
>   - sorted vendor property
>   - removed unsed leds from phyboard lynx dts
>   - added chosen/stdout-path
>   - update usb0_connector node with proper name
>   - fixed missing space
>   - removed unused pinmux
>   - removed bootph-all from rgmii2 pinmux
>   - added interrupt-names for adxl345 node
>   - sorted status property in main_uart1
> 
>  arch/arm64/boot/dts/ti/Makefile               |   1 +
>  .../boot/dts/ti/k3-am62p-phycore-som.dtsi     | 340 ++++++++++++
>  .../boot/dts/ti/k3-am62p5-phyboard-lynx.dts   | 522 ++++++++++++++++++
>  3 files changed, 863 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-phyboard-lynx.dts
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 371f9a043fe5..b223681cdfbf 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -76,6 +76,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
>  
>  # Boards with AM62Px SoC
> +dtb-$(CONFIG_ARCH_K3) += k3-am62p5-phyboard-lynx.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dahlia.dtb
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi
> new file mode 100644
> index 000000000000..0e3a429a835d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi
> @@ -0,0 +1,340 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (C) 2026 PHYTEC America LLC
> + * Author: John Ma <jma@phytec.com>
> + *
> + */

Could you do a couple of things:
a) rebase this to latest next.
b) ./scripts/dtc/dt-check-style --mode=strict new_files

I know that --mode=strict is not perfect at this point, but, it
did point me a few issues in status ordering, bootph ordering
consistency etc.. you will have to (at this point) cross verify
against ./Documentation/devicetree/bindings/dts-coding-style.rst

Example:
arch/arm64/boot/dts/ti/k3-am62p5-phyboard-lynx.dts:315: [required-blank-lines] "status" must be preceded by a blank line


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
