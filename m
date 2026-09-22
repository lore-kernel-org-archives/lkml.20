Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D5B5505CB;
	Tue, 22 Sep 2026 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087124; cv=fail; b=gmZzyF9dp95FACdVSDj7wjN95VB3j9oVdvata0ZeZYwigqGrIoDGmmsCgFMR/7eKvTKiudHVxFycB6gaaZw/Qgtvk9Na9AksFIXQnMVg7ToyROwjyhsvOLJ/W0D6HZqTHNy8Dv4+2c6ScE9Ck0LihLt+jgmAeQvxOMMXUS/Oskg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087124; c=relaxed/simple;
	bh=3ejrOW9cwivAmLptuFFa5rL2XW53F6MBxpZ44jLTStQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EFbeVe5nvNHMM6yoUC4nVOg0ylwj43yGrJQRbeXKH8aWf4y6AD3SJbtPiG7XGb8hGwvymjscIK/l+UNro79ZOTx2B7N7x1W6egVSA0iGTUEmXPrzsfP9RZDSAOCVOYWdM1yVfhbuNYApyQBWywsBbpwPHxx5wO7UycZEDS1oU2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=FfEl5Qiw; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XuST4DmC; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="FfEl5Qiw";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XuST4DmC"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68MBOsDi3446392;
	Tue, 22 Sep 2026 09:24:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ZqXYRXc9e9cgoGbEMUIgOOz7rEsW/LXxdJ5mHxL7U
	XE=; b=FfEl5QiwGmQvdYhSoy2LIWhpPLxBLgs97reiJZrfN5AelT6ERqeWvEsyn
	offq3lBQ89WkfrKnrvpku3xULTDaTPrK8HY449HUINXgLxHlnOgD9NwI6luj+ZtB
	uUeJ9gfiCOzBTyhHuUZHKDf5JiXuIXUADepapOf2NvOyj7a56G8vlTNso9fmaiKz
	+79shennVbn4jzMa2IakKF7fT+f0oysoaUoqRytw+tFMSJvtJ0V81rKptc9Bc7Tw
	/QwRkQfPzkmQET1+bR1YqAWYKNang79sO1hyl0CfFSeNjwTg48TaXA1e9CVFf5tX
	jSLT6RQpkGKoJQ9zio7JndWjkUQ3w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011000.outbound.protection.outlook.com [52.101.62.0])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gupea1sgv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 09:24:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4LDCYd2JG1RX3jLrabj7QOBStbx0UgtjtO70TJKN+YtlAwAixST6s4Lux09JqsvQ8gSA5h0qdzyQ4rHHjkSIOLQT7iVkDjSwxlDR4u0bOxgqTNG5dDUvbw5wuES09dkERS4zT7316PUJPIXnfACInXdeEb2JKh5CtQu9SN4e+940eHpznq2dLcDp1iyJOFeJaT+Xf75I6FSr6+7+4CFoIh1BBkk+iTY/RQvR489IOp3+0vE8Uyee3cBKwKpPZ8lPoDu3ws8i8Er4WRcRRltzY8AB1K+0eLbN3yzghF94Qo2IPaMWGpZISCaqtpVC1xi25CZFl6VNSQo7DrBMv1oxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqXYRXc9e9cgoGbEMUIgOOz7rEsW/LXxdJ5mHxL7UXE=;
 b=LKlEL049GwdoUEOM2p0UYJvJ2IL65HSbu4GLIamwpwf+XJ97cRl9AtUKwx6aS27gMhFs4Pl0q3f1zdUj+EdKFwOrOfdxChOz7bYvSzAdFsItrTD8AsR+h5CoYk19DeEmBLx6rdIhzSuBiQpP9TC3ie0CxFfL85TN0F8JXtpWMc8egdcu8qpuXtgNA/9COYlL9P4XYYXWsMR5MJjSqyOpMbVS7raxJEXvGbfslJKZVRMubNJQ6YL4JFIDZdlcpKRwR4q/BEhEsR8PbmqKCe4lE02C8rFs+t2fyiMSXZ8wrfqhSDS3/hcpRrAvcbr0/8Y7OnawCyneWPBNPcuQUBRNWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqXYRXc9e9cgoGbEMUIgOOz7rEsW/LXxdJ5mHxL7UXE=;
 b=XuST4DmCnrePnn7ngIq5RnBEpqwOnaFb+ugIbOb3SMvtZkrwO7S46g8RvPP2sH5anQblfioHodfFK7v6tGKCeKMny599NwfhsATFpCUyTKSkmD3dqHPtgYL19FjtF8QQNG7YUCkQVPnbvB7Yb4Zr/vUbtvg5IbdhozRHlfSfRWs=
Received: from BN9PR03CA0908.namprd03.prod.outlook.com (2603:10b6:408:107::13)
 by IA0PR10MB7326.namprd10.prod.outlook.com (2603:10b6:208:40d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 14:24:37 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::95) by BN9PR03CA0908.outlook.office365.com
 (2603:10b6:408:107::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 14:24:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Tue, 22 Sep 2026 14:24:37 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:24:08 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:24:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 09:24:07 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MEO7eU126768;
	Tue, 22 Sep 2026 09:24:07 -0500
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Garrett Giordano <ggiordano@phytec.com>,
        Wadim Egorov
	<w.egorov@phytec.de>,
        Robert Nelson <robertcnelson@gmail.com>,
        Tony Lindgren
	<tony@atomide.com>,
        Nora Schiffer <nora.schiffer@ew.tq-group.com>,
        "Stefano
 Radaelli" <stefano.r@variscite.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>
Subject: Re: [PATCH v4 00/15] MMC pinmux configuration fixes
Date: Tue, 22 Sep 2026 09:24:06 -0500
Message-ID: <179008697417.4042199.9574159763053470223.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260909214743.899477-1-jm@ti.com>
References: <20260909214743.899477-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|IA0PR10MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f7ed20-2b8c-4729-ddb6-08df18b53ba5
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700016|23010399003|13003099007|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	I90RUzEvFzkxnZan8zVQjcHK7JdsGv7YVUdLaRu5fscltoNOUtUpGitRXgqDRRFQaHBjVzIphWwvI0n9nrItC7ormg/IebHIRtzdSw++10onqD8z+oxAzYl3YzNE1e3Z0h8XHMeJ+uaNVPSCA+X8zrJbTTUMSM+WuDhs3hrKJuM4FNO8pSAvO3LgOHRhrKB6ex4obCfednN9vmJAwhaR1TblO9N5rIavpPpw0QEcx7STVNPyw0WA5TFMKx7Vc4AbKsTWcL5XEM+KPHGemYv+jDMm0s93qGueg3GfLlbioABAO8hximlswDHctSdnEJvXmTe+pDdmXkufiQhfEfWZUAwO4IbTr2kzUMrTuHAoiX4LwgRAEjIXDtLMXUHRTp2fRORRuyA4K2AGZUdYuslfr78/4NxZv21UuV3Wt8SxN1kS+wbsraZ1T5PB9hXEqpGwB6VUR6MzlOCXR3qj05PeA42J9eQ4N8cQEVXutDZhqVCtNua6efTYvQVTeOg3b/fNf/ERo/wzoDoVHr01w+aOF75lbM21v5FLEkGK7d+EK4BHvO59SCGESJp3W21Tei2TAVfWiK0e10PsKpve3d9hGmYg4bjyoh4iG21/oyT7ELDrW/+CgFhSfvYBVAbiLDV60+rG+FMfKqQbcdf5rqfvxo2kai5ExQwlF1wDQyih0WdhV0/jty0+yKtCKGFvlplo98hKN/vlBB2q+5t3pVnudQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(13003099007)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	z69LhTKFbEsZOAqoK3abpT6vnF6xKqcEhwR1b4ldwvb4mWliWGTwjK7oqzqsy/BPDAa3B1WtEvni0LPsK+wZRvOmEX+3hbHuUqTDlnAclnkIS8I98tMKKfoSoT62CgALVCwa/FwhWmqWLt/HbI7lksKda9tJDvXAbeb7V/+xWBQafFGM4+pvvSZYVcpDVQaSXu3Fka0uc9MCul0PAqun3P260Pwq+XcABweakP5rPUc9it1WA0xc7Yx3Ta+tzjgckQRANte136WFMYEnBcXVgxV0gTlDnp6wkYK/qwdaXo3ZtHqMhmoOFrS93TeEyJwyiHjtBK40EDKxkl4GGwt598jPWNn/ZqnL8iFhIkvWOynealTL0vTNe2xfZawEKhPTl/aX3/KM7okUXjZEfrcnUarMCD7YJhWqszYtmSU6Sh+8nWZ358wY7/6xLnQO1c7w
X-Exchange-RoutingPolicyChecked:
	dtaq5tnQgc5zuOiYI4UTb9iWJ4MbCx1ExVpJrB/twETzH44HJZ9G8TSsd5ldgsdDP6m0b2NnM7tnVWNRBgmly6rf1mQVlElhGePHfQNON8sycrSnfApaYTjxtCKYa37W2rBHZ1d1w3ckWwkN9j5VHU5DyDgRf/+DiQCWZxLubCdwTX6M4Mcq1+djdXuOnsfL6wqVz/4N0ulXot2JqyRd99Wa/64FXg2VlIu0JPIWJPo3/kC5OZD/mW3d/0K5VdSZvak3a2BMoXkcgQyi08Dii3G6pDefYmGm6a0kOQcgWFZELXC4m62aUMZwTYn29FmbQdSMbSVVQbuDhFh8iJZ9sg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:24:37.7535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f7ed20-2b8c-4729-ddb6-08df18b53ba5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7326
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIwOSBTYWx0ZWRfXxs54WeNdDq/Z
 PUWDvD3xZdPCjhZDjmtr370pRrPlNL6iJm5vmJ2XWteCqj7C6JEzzKkypQwJU83nIKhgRXj+gl3
 JncgN9DKI2upYY8ZexilXopv7zLrcg8i4bL92YRsVOL0rIEnfOwtcnuZpFg+t7Mh3Js9clo2Keu
 IKkqypJlCnJqBhZStAkEzCHTUPT8IditV8yJlhGbtzXrkEPOYxFHCsHRf8thE44yFhWvJ9rTfB8
 IcAA73eYly8X03FCZHaP7QTnmycUkrUQduiHla38GvreGIef5rVRoQb6Km4q5cFWuNJDyXiLSUf
 9Avoor7vzXRw+RiMbHb2D7j5J+T/f5kFnUTFA9FtNWFx6J+qnQJdz4QTJYJ1R0IhgDpy+DWhTQk
 Yb4Wo69B5QH4W/GfyXovZxhiPEWm7DScIcBrRnnMh3/JvjLv+pVTaysaXg4GZQ/W/8RgkFeXDW1
 kOwSygdkvxp23gtpkaQ==
X-Proofpoint-ORIG-GUID: jRpqFZKYu1B-7UxoV425yEWmb4GzyAY_
X-Proofpoint-GUID: jRpqFZKYu1B-7UxoV425yEWmb4GzyAY_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIwOSBTYWx0ZWRfX9vvyfP/6keL6
 pTcbJNSeFXOPXsMMGnoWH94qbR9R/4RG6my+Jiesbxq8W+XawqdcJhYo51RvYjp++opo4Mb1Cjh
 Ql0ud3qtIpjGXKa5bw0rjGYryxZ6o10=
X-Authority-Analysis: v=2.4 cv=Mdz5KJ/f c=1 sm=1 tr=0 ts=6ab28fb2 cx=c_pps
 a=6BiUERe1gyZkJgaADwpG2w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=TGqDKbB73TRB4Q5Cm4YA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220209

Hi Judith Mendez,

On Wed, 09 Sep 2026 16:47:28 -0500, Judith Mendez wrote:
> This series fixes MMC pin input/output and pullup/pulldown settings
> across AM62*, AM62AX, and AM62LX boards.
> 
> All patches have been tested on their appropriate SK & EVM boards.
> BeaglePlay and Pocketbeagle boards have also been tested.
> 
> Changes since v3:
> - Include PIN_OUTPUT fixes for missing third-party boards as per Sashiko
>   review [0]
> - Split out squashed patches into separate commits as per Nishanth's
>   review [1]
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].

Just a future note for cover-letter $subject, use "arm64: dts: ti:" as prefix

Thank you!

[01/15] arm64: dts: ti: k3-am62a: Fix MMC0_CLK register address
        commit: 9852f2badc438de82b6828c11c80ef0a656f1d4d
[02/15] arm64: dts: ti: k3-am62l-evm: Remove unnecessary internal pullups for MMC0
        commit: dfba8329b8ebd49807ed1c1b336992e5791c7e48
[03/15] arm64: dts: ti: k3-am62a7-sk: Set eMMC clock pin as OUTPUT
        commit: aa7d5b1efa75e58c9d440dfd720205045fe6a806
[04/15] arm64: dts: ti: k3-am62a7-sk: Set SD clock pin as OUTPUT
        commit: cfad4f39124b218c2cbbbe17e742971abc9ac8b4
[05/15] arm64: dts: ti: k3-am62a-phycore-som: Set eMMC clock pin as OUTPUT
        commit: 4834050197f205a649e36661ca150e6ac8295008
[06/15] arm64: dts: ti: k3-am62-lp-sk: Set eMMC clock pins as OUTPUT
        commit: 156f4c2208c8e5e04002402494de28c21c0afcbc
[07/15] arm64: dts: ti: k3-am62-pocketbeagle2: Set SD clock pin as OUTPUT
        commit: 843c4d171975059eaa1436c8403d9a29f677a75c
[08/15] arm64: dts: ti: k3-am625-beagleplay: Set MMC clock pins as OUTPUT
        commit: c074abebc76f0e59d13dea499f582806c6a3d94d
[09/15] arm64: dts: ti: k3-am62x-sk-common: Set SD clock pin as OUTPUT
        commit: 1e2e5016bda94b2bcd86258b5eb77fe3006639a0
[10/15] arm64: dts: ti: k3-am625-sk-common: Set eMMC clock pin as OUTPUT
        commit: 8ef8a0e38d1377c6d51c06f95c64d87641b2c717
[11/15] arm64: dts: ti: k3-am62-phycore-som: Set eMMC clock pin as OUTPUT
        commit: a3c2b6c52e02d58941c0b91bfba052788aeff890
[12/15] arm64: dts: ti: k3-am625-tqma62xx: Set MMC clock pins as OUTPUT
        commit: f9a93fe78d8737860a8fb786d17c9dff20782b7d
[13/15] arm64: dts: ti: k3-am625-var-som-symphony: Set SD clock pins as OUTPUT
        commit: dbe55d5f2930b27e9a3ce71f0c9b1bb0ad91a012
[14/15] arm64: dts: ti: k3-am625-var-som: Set MMC clock pins as OUTPUT
        commit: b489fa1808ea807c4467def7947c83d896dfc355
[15/15] arm64: dts: ti: k3-am62x-phyboard-lyra: Set SD clock pin as OUTPUT
        commit: 1d62ef8d47b535d31fb9cf38e5c36eb55b0189a4

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

