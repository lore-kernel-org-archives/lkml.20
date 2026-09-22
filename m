Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63CF3F5BDE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087193; cv=fail; b=nE9EQr6IjfBaIvQ/hhNLF+37Wq+23yGylp05ayL3rmJNXA2UQrOmorJtxT0N1qzGDrD1Mcx3PQurHt+7o3v4li1YbhyHQ22QxYrWm1WOjmH8MNwQR6fPp2N1sAt8q/nlySllikFXRkHb/NQ3/d9I3LXMCWwrGxmPnjjgkVrSAV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087193; c=relaxed/simple;
	bh=E0X/l1t8g4ovoGp1Qb5SQKNKU3CYSB0acB41lCu1WS4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EN4v4aZqMSBPk0bpkWIrXXfKmtgrr8ILesEROMQQJYvxYOuAeX1nu9GciQgeS0QM9fvi+/20nAvpCHxR9i9UY/2upGRyCmRBihyRmTPJGD6ihz4yClRJyjVEgyv1gZDPva1ehvlomRqNW5EfFlX0chwi5GzkOU7fGiNbJpj55Sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=KZc5Uyml; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JiZ+iiSl; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="KZc5Uyml";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JiZ+iiSl"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPaje2082073;
	Tue, 22 Sep 2026 09:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=kuu31TZu2Qkj4POf8XZKCyFAn2E+S866YYFP+vC93
	GY=; b=KZc5Uymls4uwlgK1fEWlSuCI5+JsFJEk9TQ8buzTxHOu+r4l5ZtPZpxGb
	ow5fB0Bw8rExzOz3BW5D2n33OogrpiWMAXAA9zN6zcpHtlvBWLmDi88PavMF/8F5
	Oi4snUyv2bmNzofB5aE4CXiUBbvhETIlCi/Et9nr9ZbZ6KbZHtEGEnc7Y263KknP
	r4Kx4YHGooPzzS14kTx6kRZN3A4SS6wUdpLllOecncfmwbuK/tfhwKAJzxlSGc+a
	l7FUaSYuaIymycNkrD1MJTPTNxh/761wN2fEnU+c0POdFAIQopGukBWXEJ7PmTRD
	LcIoPolOuxS/n0Z1o1YV0rVZ2YzYA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012034.outbound.protection.outlook.com [40.107.200.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugxm3j04-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 09:25:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPMngFrRTf5wzmawD2U5OpIKDXOSEJWK4LnCYu/Pap1UWVKAOyWFOL7NZRUwZt+MRZaTvB6i4JN7iL9Z3MamHzehdgmqdNh2tgqTB/9s774Uj0GtPj1ldQ69gE5G411HCtSHauVQGJJocDn3cGvv8i0qYvzYG6P5DrDnuHoyzYQGsKC4yNv9zdYlt5XTTJS4S8OUdoQkJUMtjMrWjfbIU5+aUJCoN+ySfO1mbzNDb7ygbBaDicSr+Z/cPxcKW7rdSoSV8K0GTxESm4MxOO26hrDuX3EB1abLte5RgPRU9GTXEoWGpRota2R0OmrdoelX1/6oM+Dk0vGICbWkNX35Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuu31TZu2Qkj4POf8XZKCyFAn2E+S866YYFP+vC93GY=;
 b=mRvL1WlycZbV6uWC90BYmCXm6McI1FZo8BGq8i9FPIioSV4Ve5rW3p2hT86j6r1FQf3G+BrNVzlyNuQyYjRt2HonssZsDAk7gnAeLnIhaN/s6S70stjkPCllZJ6pj9wC5mYMs8HksxmsyJZcajztF2c5AJx+mE+p9iAHWaj+rANPKWFI7pTa1cECkEAFJeF6oHjMeq3MCTlW/PhDuLDF0BR4/riDMYUuOlSVozSS/KhjDWEC+hr6FxTI+Hf3CxazEH2Mbdv4LLilsrhKS5fwHy3TJwnTF8+psoAEpHBXf6vK5OkJqTfJJWduqHV4oJVhmC7IpXLHpROhC12frY3B+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuu31TZu2Qkj4POf8XZKCyFAn2E+S866YYFP+vC93GY=;
 b=JiZ+iiSl1En148mC4KcY0EGQtdRR+OSl+Kl6a2iS2ulf5+ONCURGN0QFIW7ZeWUuTFvttIjlGYh/cihW8r7cQXRPSeHkWhQAgucmPN982oGWhlWaLYab9w7wNWSPzgcBU6LQe+nw4NRFAJL9y6NL2HmvpL7PzuIvhsQBuYk0yDo=
Received: from PH7P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::19)
 by CY5PR10MB5914.namprd10.prod.outlook.com (2603:10b6:930:2e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 14:25:10 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:510:33a:cafe::3a) by PH7P222CA0025.outlook.office365.com
 (2603:10b6:510:33a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 14:25:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 14:25:09 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:24:37 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:24:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 09:24:36 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MEOast1031155;
	Tue, 22 Sep 2026 09:24:36 -0500
From: Nishanth Menon <nm@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        <alexander.sverdlin@siemens.com>, <jan.kiszka@siemens.com>,
        <ayush@beagleboard.org>, <robertcnelson@gmail.com>,
        <upstream@lists.phytec.de>, <francesco.dolcini@toradex.com>,
        <leonardo.costa@toradex.com>, <matthias.schiffer@ew.tq-group.com>,
        <stefano.r@variscite.com>, <eblanc@baylibre.com>, <msp@baylibre.com>,
        <thomas.richard@bootlin.com>, <miquel.raynal@bootlin.com>,
        <mwalle@kernel.org>
Subject: Re: [PATCH] arm64: configs: defconfig: Convert TISCI to modules
Date: Tue, 22 Sep 2026 09:24:35 -0500
Message-ID: <179008706338.4043221.12290695447527419007.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260910134409.1713610-1-nm@ti.com>
References: <20260910134409.1713610-1-nm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|CY5PR10MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: 581a30c0-d32f-4ef3-6423-08df18b54ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|82310400026|376014|36860700016|56012099006|10067099003|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3yzVKmvQ5bpmM9yoXGPpnwsAQYp5JpoxM8WMA7GlanZLxJfnb53Pn9VoZACUSHLSns7JWYC3qX+HJGmhbpAYOTYmAO7vIOmCmIGcawVLBgwPSanMWdvnByZ69FDMg1/qG+h0bdbeArV6irOaB6YHYM/jsfo1DEMUImZWfPXTBP94Pm+8JHG6xD1Lzr8AkOPRCwPm3WtDuD0I2JKCXzQl4QZTesNXBuOCZPEB5dl4dEMN7wW2XVkdFPMJNjgDlp2KjDvnyAJwzZ5ofGa+GxsLY48l4LborI97rYAYM1vD5D5/J5Y78BnFxwA/OdB6gLf5zdJ4AYwIu1kaZMdQWN0MYPHmin51CUGbnM+LrQm/WG2QFnFS8YwRrbO+4KvTdnD9/AF3AM24Rzf2XQ86v1xO6PVPCXZ7eqt2SK7vnPSMleJ+fUIeSJhm5ZYajCFvJeyp9/7pQbzAzuwzfJ28WGX0wd2eiaMlR1r3EdQRxVLjy4zXEFb+HK6VLEMuPnyXz8cDHGbj955u7+eNvii2k8FpCvL2FksC2755Vyaxiv+exNOGA7GXYBGeEYAmfiNZUhFcrwcBZF4ZB5Wsp0avW+NxWFqm6oMd9Tqnau1ryEoUBsPJvf9pvfKJKlBwxsbDPbaE2i5GA2eA8rE71hzspp8nFNgGgDqJuxyvOOyQ6CTPFmSWC7sR+oDoL8V6yh4PkqxU+m3PS0S2JVuNhXvfBoA8Sg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(82310400026)(376014)(36860700016)(56012099006)(10067099003)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A+HnMf0tERW3I7oIwjjeQv9VRSp2KFvv+43P03Sbp7VPF/9BiNO+uRlkqiZAVjZ+PnFmPEVxZILr3+YRI4DV5NtT1ksuVkg65Lbl0jRv+nyCA8FQthFy7KsiHDRmfjCHcZZWYgFJY7/49bu+aTAg4dKP/L5X8XR0Huq0mSBYCv3LsG9UM4Z4qm4nWrwbmy4e4Y7NrB3d5dATF7hBnidnFkR7DdN0vMf0ExyOPl9et3tEwNU04bD1Lo77GUx1CZWjoySZott7ayx3VN/khWiPCP3nZ4mcsHr7AeRFsuh+XpnnPD26GJPDLcjczCgbOA+Ynqb7RPwS7dxOUu52a3ZLDKQYUb6YDZAfQDqz0kf6D5Qv8Zw8NaTbrYp78KeESQ0bDKNUn4CVEiw7e0JzLewHUdIQOdHSaIsDhwAxJuaV1atawdeZ8xR4HsIxZ+S0PlSL
X-Exchange-RoutingPolicyChecked:
	xN+RGtFHkJs6tGLw6Eh09JwIQNcmrSqtaBknsC0X+P30hMVK1rF7NU+wnWI9lrmoILv3DBOnMIDq1+BtxqjOGeJr/Tg01eWZz+hxOj2DpgyM9DuzBGAuoVfR2ZylqbS7+jvPG1NILgR/FUaasvxQmBH1DPngYNXj6B5/SYqr/6aPZophJbAekdX7l97U7oylG6jCIfHIXHtjXVoGmPgitNBEhmGpJ5KaAGfqfqloFkNZ0prxGxbBI0nGoLUBWpSs2U1dLkiUEFEPduxxoqX3pWAbW4pvdXRbo6SZNmRqS1jmeMQwSGHnWlMQqb71aHcFYnDVKqk9Nql/caSSJ5UBnw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:25:09.6861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 581a30c0-d32f-4ef3-6423-08df18b54ea7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5914
X-Proofpoint-ORIG-GUID: 03_xKioOYkTwYEhKrvG3zQeLQdTn6N8z
X-Proofpoint-GUID: 03_xKioOYkTwYEhKrvG3zQeLQdTn6N8z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxMCBTYWx0ZWRfX9rPtlx8Lh8DJ
 9UZ4/YIk0yUt7PCP9iTcOzZY7wObejWkVcRx7PFiRkFjvDni9uhTD2GY/FkQA3lJ2845OsR3r9+
 GX0PsZcsa92IpZMz4FVmzOQiBE/KKowwkGix66XxbdQrrSagW6JxHo8H5KN6YhtUjoTDtrHQB+U
 0pGLhWvZv+Yba3n17gVIetKkrM3RDg4734oXN52gjlGW3qyX/ZBPJVXK8vPfJu/9iZ5JK3jFyWk
 LuKnBchLMKVbQZqLfofJYcvxC8dk6cX7ciwhQbQF8/NUhncxuZ6y8lXuZR3WBYYl1xlj5aulpXM
 iodSa4eSzHzRJr+sKk2ClAZOpec3x3Vf230aO1/wz207m5VwfEAV6oQA/lzHHAp4Zipp9m3P96o
 11F/LQi6DecAfhrpDWje1+izTrgnZTiWNY+7NoOqG7wCd8cE9oGgFDgUFM816clZcsR3f/aL52W
 JT08bKpSIHjNaDNtGBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxMCBTYWx0ZWRfX4M5ZyX1ueD2C
 QWruwr8fkB0lC3GluDTpcXBfhc0XISJ1Mgr6vKxKO8r/MqgVI5VipXwUxURQQSKj/zwmG6nId6z
 fIBDUmZnu/fPNgQYOPsVUZJnFV9t6oI=
X-Authority-Analysis: v=2.4 cv=INeXmQvG c=1 sm=1 tr=0 ts=6ab28fd3 cx=c_pps
 a=9AcDkMntNQwiSFi2uhiI7g==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220210

Hi Nishanth Menon,

On Thu, 10 Sep 2026 08:44:09 -0500, Nishanth Menon wrote:
> Now that all relevant drivers have are ready, convert the
> TISCI drivers to modules. This impacts all K3 platforms for
> boot, recommendation (based on empirical evidence) is to use
> deferred_probe_timeout=60 in kernel command line to allow for driver
> probes to complete successfully based on the initrd used.
> 
> NET Savings: (Ubuntu Clang 23.0.0)
> ./scripts/bloat-o-meter vmlinux_previous vmlinux
> add/remove: 4/380 grow/shrink: 0/5 up/down: 32/-143248 (-143216)
> 
> [...]

I have applied the following to branch ti-k3-config-next on [1].
Thank you!

[1/1] arm64: configs: defconfig: Convert TISCI to modules
      commit: e557da9b756dba66f9b1ae8bb27add2b7719baf4

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

