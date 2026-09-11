Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEF4581259;
	Fri, 11 Sep 2026 19:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156365; cv=fail; b=a4tKd9aUmimlvTMdh/kxjAYZbLQ2H8Ff6tdgK9EwpRDkTtN+Iy0wU0Z0KaI5F6hmkH0umowsbNlDc8GZjsivw6aV05xWc4VSfZn/l4OYckLdhTvjGeg/9SzjzCNX3eaIB5JPMxA6wu5jQcTlei6+tD1viAg84ZKZryZCcvN6I/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156365; c=relaxed/simple;
	bh=lvBEP6v9GGisa/w8W3ffD5ae/X5cUXQAgOW9ZNkock0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bLcBL3Zj3rFWYXXu8nIFB/HAvXGm1/mi20EZnTm9Evh/QMN0z1L5973cx//HXSVBWAJnKIhseKa0E0nBXxGTrVXsikNy5PWhyaRY2ZSRTWh74O1DYPls8N7+J/ttvhnnYRbUNHPVV4x8w/VgPzQyRS9Lp96HgWHwbzYd4GJB3Jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=I24p23YH; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oVUff4yU; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="I24p23YH";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oVUff4yU"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHV0HJ2544624;
	Fri, 11 Sep 2026 14:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=AbFqdpv6FgwtYI2jcDYc8JX23aGjUI0guKlr4qMbo
	sE=; b=I24p23YHUsBqxxi2qLL93aiVlkjXoqMB5cOdrpTElnMAXr28kMuOc5LlZ
	Yz4FmVWA5+8YqoyBvYD9hJkhsknMwW1qXoQMIrr08R1o4iGTKLuO3I5TQZmt4T9S
	cb9mI5AfM9VTAQRdFHCzbQm9lj2qbp8ZFXfxIlAvK0Q++DjCQEA8Ks2D4nzIPEd3
	YrNE9WdgKQsgp0MyNcWDdxBsSjuZImsICUflBqv/mOoV5cYcrHg7qbqIKml7ZHoq
	GsN4dffNOMbt3IlJxQRfimCQ00fAtjfjCPapgjBPFnM/BA//lpoyIkioK+6qs+il
	moasra9N6hFAKD4YqhZ37nF1Tu4tw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkyw9rpkv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 14:52:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZlmYQHEQ/wiV/EOK5YyHypDN8uVXE3F7RyNFrlzlAvsWo5DaykYmO39C5ZMGbTa1Wbe1oAVsurqITpDj4S/+Vt1iMpa21+xLsHaLqzyqABblVVEt6spB5FQCqXLk3sDEIQMAzZjb3kyOssrnAPyvHPnxwSFkjxn17JpkasDmSPyirneAbm52IFTk3T/OieB1VesV/X4VFfug9LVbTzOVhBE6+MSyW2GW0ezqNJa3HZLCgGcI9osRZSP7gimTJFZxP7Qk10tjqT2Q4/ibKUHaSEG0bObAH+e1CfbgYNXmsqPuqCMVTAhjhnPG7tAJskoh1jQ8NxmYTLO1g0fz8B46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbFqdpv6FgwtYI2jcDYc8JX23aGjUI0guKlr4qMbosE=;
 b=gs5bLxPXjJRKg1hkNYCkiRh5ILOaNw23EcCCEk7TmFQCzM9XNZhmJQknRl7HtysOhq2nD6IgWYqEQQqkFidGAA1mhR5716Cq0J2r5OnnkzKEjIQqr3TqZ0JqKT/LoghBOMTgOaChjiVp+KL+NpKVKlh45JZlGRoOlwxobGJfG6uX0F0q5iYF0OOuCdR5KkGpXttRiCfpKeumpHvH/4Awu/ZRDSrJu+IBjRrsPj3NqKjXOnbJaLF+v9rBtwy+x1/KeGnog0TguMhybpfrkuN/LnCzPbrQH7HufIgTJFkTugjeHv+Xjjt0VusA95tUyCFls4SjE/VykMhf/QNTp2n51g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbFqdpv6FgwtYI2jcDYc8JX23aGjUI0guKlr4qMbosE=;
 b=oVUff4yUy3aCUhLEsB+kPUbqw9KFKLi14p9wRTynO/m4wexAcNNN/5r2uJKthj5slNmCnBk3M7AeWfhzDCnEjHZVJUyyFw77grn8AvMW8lqo/EqD91wxdZQaRJVyQusChCZjJ07gHfSAyioTTlvR4FNyymvMrBSBKgOf2Z6/rss=
Received: from SJ0PR13CA0047.namprd13.prod.outlook.com (2603:10b6:a03:2c2::22)
 by IA1PR10MB5899.namprd10.prod.outlook.com (2603:10b6:208:3d5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Fri, 11 Sep
 2026 19:52:23 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::54) by SJ0PR13CA0047.outlook.office365.com
 (2603:10b6:a03:2c2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7 via Frontend Transport; Fri, 11
 Sep 2026 19:52:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 19:52:22 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:52:13 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:52:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 14:52:13 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BJqDf2714688;
	Fri, 11 Sep 2026 14:52:13 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>
CC: Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 0/4] Add ethernet aliases for TI K3 Boards
Date: Fri, 11 Sep 2026 14:52:11 -0500
Message-ID: <178915624941.2343781.8279993082998560858.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260811061351.2538688-1-s-vadapalli@ti.com>
References: <20260811061351.2538688-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|IA1PR10MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: 583aea90-d3e1-44dd-30f1-08df103e320a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|10067099003|3023799007|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	VWBd7iyb9riAeX3N670e51nXyK+OEl3xxdMdsO7tDmpOuL5HeH21YmXaqsPvNGrqXQeo69AchcyrwqkvDTEKjru/tvW5VIp/PIyZprC0VamrA4yynX7K4zSIaw3UeU+ttmjlO3K5bnE0RLB+yniLtkqK4XESY2/+/h+M0ukMJRpK5rp96OcQUFd8YACRLiWh1IRCuYVenq8WemMRHCRO4/mUtvg7QEz1dJaNGAcBpVHcACRHCX6SNKpiYd/qT3pLH19T92tN0NcxRyCNMdeJqZFjPG0mzqr5EPFc1VBsYVpLFNsYBRZe8z/ur4PmVJop9IiLaHn3Gh7gWoyqKADMVZS7vVM2tw4B9nuKBQNEVQt9QboVJ9zFnFVLPNkq+Rejl+D+x/IaqCNcdE75DybB5snBUpI00+5IIlzabsQDVZ9oDNviTL/VV7Cj4FzDYKVrVgC40c02lgYeFdzHn5X+/QKTP01gg/dWMUokjxZVCcs0nUESX4BDa+Ma+DGkfGbYvSx4FxhU6i7BbHnmu38pLwaoTPOy5Ifpmy8tMWE75JvU8pp/Oc5qKf7oCTk1OlUsr2Us0dh+n7xzIUJPPwiVslWpim37+3zoBdrm/BQMO2MgNFoU327rx3waE0J4BDl4foX7tc+9rJEFiWxwfj4XS9sb1yw3SDSCnR9CEkf/Y7hu6qUaUp234s1JUw7SjW24of9XcjXZtxys0UCAfYSqpQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(10067099003)(3023799007)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KN95Yib4EUQhFSQt+MEw/xUFVdkTolwbuestsRfxIA1+EIACkuu8lc6ooz0iN7QCo9DYOHaQHQogN2fnMKBChhKlcdnPEWe5lLYlarPWSHnXLT8LfHZKIiYIfCf8wSTKzTEnUmjcSbk2pzvmnNNzLH1TWGe1rrQNwsK6unxoPT1GhBVahrJyjtdBOQLLR2ZWSMpyiAMXIUJTrkuq2BSTi3avUGRbSDNUIg5h6lV8+yWP25P+PYtUPqetYKDNdsG8CzaWspqb4TA/kopAlLX5DiVvX4vJ4Db9ZwgyVGd7SZvNEOMiSyOZRLH/DT3gjOCJ6/lhxN9l/V5gG8cllNjZull6/M3ororwmYXERk7DJ/HX7lpOvfWMsvL1jgNUVrBC9hizY4Xr1rTyxe1IA4b7HzOaws19U3Fzk+NZV0U6IEGJ7nTro2dMHI+dx96vocG6
X-Exchange-RoutingPolicyChecked:
	MYyPy2/S76vl8OmViIkx5BfBIMKQ8dqOQeUYkXFXBDetxczOoAy19m4WPDVD+4D7igr+V6cSCh7Z5ungEOh1ABUVoPaRBWh9y+FKLvQiOh1SBej5c/dWSm1VgyHKPseumhBWqQT6HMRivZYQIPdaiCaTa/y2b/MaoXQg2LzX6O6bY/raLN1umPRco+61gCq2dZZCN4en78hmaVdCij4oZ6N1FemxpIu1g60x5x1lT1MaAeiSy9rijZpoaEHVBJqak2fj7tPN1XJS/fgpeCEibccN5NFP5sGgLgQJK6GdsLhbAQUXGmW7gdo3t5OKRmCDebGeNyqRkKHSVDfLoOTzjg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:52:22.2155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 583aea90-d3e1-44dd-30f1-08df103e320a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5899
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI3OSBTYWx0ZWRfX/g9TUKrgm1Ik
 agTu16aHAa4hfWWnhsuwK1Excsml0wrALAj8mGMmuv4Zw8Km5NzG7WK3A2YLztC5RsJsuA/kdCm
 v+N8/kYQnSxoiEDngvjA+biiMcSzBbo=
X-Authority-Analysis: v=2.4 cv=ON6yTiaB c=1 sm=1 tr=0 ts=6aa45c02 cx=c_pps
 a=gTn3qzDU66SAkKtIq75K5w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=Ms95HSm5-DtX0BCDy7MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: LiriluEUxwii_31xRkyY6JUGJfQ0Lhit
X-Proofpoint-ORIG-GUID: LiriluEUxwii_31xRkyY6JUGJfQ0Lhit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI3OSBTYWx0ZWRfX1yR3GBhNEU8L
 Z0ZaOBnMdxzD7jhFd9uF6pDrqAy8MX2dfkzTCXsY16wDQvLZ2hB2qwREj3Z3hgM+RJGBimJP9JW
 Mm5OZ6A5qn8cStn6BkyouJSr4v5+blAyA8HMWzbnygfeYnv0BxINiy40E1eoj5oYlNqyxc1H8yZ
 RHkdYw9UNDsmQwMRlQbCayxEfCKkFasH3xzZGzRuczBSmL3slFplB8SMxCCHKGeq3rtKXeXD/aj
 qfu4ksMKhAFCTQWjlzzES/3S2uT8BD6fTKcWl9ThwD5C8gzy51fsxz/wKz8RSZmKjAqqrP5uiYk
 dLhovS3zKy3ahoJbodzNsxrSpNEQTa3l5sJQf0TfV19x7mrdIIpjFrCBeN2IwO1jlCPiYqixjg7
 mftnpVYb/NgilxeKGBZciRVnYfeDFnhk0CXnihjLicNrgMavIaGH8X1hq7ycYgsXX35t9xRARn0
 kEUYW1Rn/dlWRI0d4TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110279

Hi Siddharth Vadapalli,

On Tue, 11 Aug 2026 11:43:39 +0530, Siddharth Vadapalli wrote:
> This series adds the aliases for Ethernet on various Texas Instruments
> K3 boards, keeping them on-par with other K3 boards which already have
> the aliases for Ethernet.
> 
> Series is based on linux-next tagged next-20260810.
> 
> Although the merge window is closed at the moment for TI K3 DTS, I am
> posting this series to get initial feedback and prepare it for the next
> merge window.
> 
> [...]

Having looked at the discussions on the chain + looking for precedence
of ethernet (not can) alias in the kernel tree on other SoCs, I
decided to pick this up - primarily because initrd can be pretty
minimal that starts up nfs mount.

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: k3-am62a7-sk: Add ethernet alias
      commit: 86e0a0fe67c6d189c272e48b7097d9ea92324e87
[2/4] arm64: dts: ti: k3-j7200-common-proc-board: Add ethernet alias
      commit: 39e757646a87feaa26ab1040ae56df4d38e8d260
[3/4] arm64: dts: ti: k3-j721s2-common-proc-board: Add ethernet alias
      commit: c38aeaee6284bfffb40a58c36ebe414a4bb92b03
[4/4] arm64: dts: ti: k3-j722s-evm: Add ethernet alias
      commit: b6dd75f9a5102960107eb222cc93e20e2158a8e2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

