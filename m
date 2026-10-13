Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25A85221F7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907123; cv=fail; b=lv9FvnJYnOceLJFdMd8QhxdQ/Km4p809z2T+a4vxSjPhuo5Zvf41bAgHN4F9UhoEN3vlow5fQT8iPsPnNnXbWtEvUdts/iGMhBVyavdLk8Z6Zv5pLZ+xQWJup3CaYlU5s3E67DVBn5svroK2lb2wnFna+swjQZcMJg46/2KmzMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907123; c=relaxed/simple;
	bh=Lb8jaDltPt4YXi8WLn3+3/InhBI9gUBsUN5NlefnhMk=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=SrI1rmm1rGH2Hntcv46IvplmFnK3raFqZziO5bX/bz4NZLVlEyEzMVNKHSXj6Bb1HdfXbTrDbt4R1RuhTQu3hLqXkFzN4i6aZXFgaJm7kqKiUMxeDgc/t1uzlM7BoYq4Ds3szeMssbRv56QC92RRe56oUpl+1F89RJZ5o5oMfSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b=nrfiIkro; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=GQnAA+1C; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b="nrfiIkro";
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="GQnAA+1C"
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DFugpp4161942;
	Tue, 13 Oct 2026 11:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=BQZXFyCovccFnxZj
	A3hf3XhcQm7oWR3A09MRBa74tBU=; b=nrfiIkroII3drdBOlJI06aXYRZChMJfv
	9Hi9ahgylXJMWCPwQXx0hgQVA7vpXF1TpleSkJ8yVhtPZHDho3idWj+4dTTYNKCW
	o234UCAS1xC/aUXt39frC7EAoM3+6Unf6hL53hZ4zBZDYsmycQR1DnLPVzMeNy9w
	PFQEqqNQMxYtny3loKt8hpLWhWlbmgeQUDyHfizd8rDHqSCXlF22gCpHKrZ8vgBI
	6GLVsrTZWT4H0a0Zw2HkcT3AZ2KMFhHKIxKX6FIgAy9iV26BCZwerRPqoDVeqGAT
	gdvV7X5qj0blEvt188rc2ISTJ2e2OJLJj9HWrTblY6pj7Y08uyx8FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=BQZXFyCovccFnxZjA3hf3XhcQm7
	oWR3A09MRBa74tBU=; b=GQnAA+1CfJpCAP1xWxTAJGnJCmAMPu/rpjuDcftGpWX
	kD+kNSQZx74W12LoR4wvq25aeQyodP/zGbWEH1+xPQDa9DJvXXuxdWrH/HuRdcXU
	T0M6+xSYISaThukcR/zBwoF4PC26eLVb4QKHcywL3NwPNLsjbClt7Q9WTBG63Gs2
	KzCci0WTIGDs9jRe3X5pAUSyJTTuWG18b6VQUPU1uB5MOnH7LTGQ/2W0T/JCjuD6
	ZpEbPWB/rgwWEYa+SToePNNI5x/1mKlOGL4ghhcbvBKgQM/ITFbolym8kgA+o3K7
	Z9uX3L5CB8eXjviMiI110+CUaErdG1QJCScEFmxL6BA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012069.outbound.protection.outlook.com [40.107.209.69])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4h97u64yy3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 11:58:15 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQx4FxJMAARgMGsL6fZvmX507G6/95vxPAfohY4v6ge5o7fCcQmG0xwS3aagnhr+Zh3VVcc1ZPtmRwyxa4lupKlBSwhTB8BTnyh0U1SXtG1l8L98y9faoovqzK+8IQo/OQ9dDpBqXdiKiYQtBAjCyv5WzPqgN0qHq6Rv1qGcON9aFYzBfGoRx3Cz3/0ZtModoOP5ALC+lByXBseagndCRPkFG1b4WaTbR9nwqI9lnSfe7fgmcK9XJtiwPwV1X3UtBtb8qxO3ruug37GWQeNo8p1TRjy41o/rzN4iQguzJFPZm3K6YleORJu82MLfr8c0IGVSWCX+45ojdKDWwWnmTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQZXFyCovccFnxZjA3hf3XhcQm7oWR3A09MRBa74tBU=;
 b=UPJ6O6cOelTsRwZYI6OyCGBmfrzT/VSp6r1iCsniHZStEUvSs5C0rhRB9MbtbsKq8zPIWZHuAq22vj9unR4kLIYUxt6Tisl0Z8Tj/DqdXnjHgsJyX6NZo3p5dpf69JocH5BELIeAg6IYdhu6PThEIvp8xg0sJNR8cHn9rSMFemmhi5hG8FbbZ9Nvgv6uflFMSKRhKOFR3V5hu61dG7UnuyYiLvtU2bAlW/rbJIqM1zHYccs9jHtrJm91StHq4R0IYhd7l6qUkofKclNOY6DI+KPdosiNSNbnjwWpHlCeLGuIoKuZSq3suv8c5kZh5ZtJJZMbB0aNjZNQGVfRVz8Cbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BLAPR03MB5458.namprd03.prod.outlook.com (2603:10b6:208:29d::17)
 by SA1PR03MB7124.namprd03.prod.outlook.com (2603:10b6:806:33a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 15:58:10 +0000
Received: from BLAPR03MB5458.namprd03.prod.outlook.com
 ([fe80::7eda:fa34:15f9:e656]) by BLAPR03MB5458.namprd03.prod.outlook.com
 ([fe80::7eda:fa34:15f9:e656%3]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 15:58:10 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Tue, 13 Oct 2026 16:58:49 +0100
Subject: [PATCH v3] mtd: spi-nor: micron-st: Add support for is25wx01g
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261013-mtd-spi-nor-new-issi-chip-v3-1-099c58673142@analog.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42Nyw6CMBBFf4V07Zi+QHTlfxgXUAYYIy1pETWEf
 7fgRjfG5UnuPWdiAT1hYIdkYh5HCuRsBLVJmGkL2yBQFZlJLjO+FwK6oYLQE1jnweIdKAQC01I
 PWKs8F2VRZhxZ/Pcea3qs7tP5zeFWXtAMi3BZtBQG559rfBTL7p/OKICDSXUm0jo3itfHwhZX1
 2yN69gSGuWnSv9SyahSptLVDrXSpfxSzfP8AsDXZ60gAQAA
X-Change-ID: 20260911-mtd-spi-nor-new-issi-chip-ef3881bab60e
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791907172; l=10835;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=Lb8jaDltPt4YXi8WLn3+3/InhBI9gUBsUN5NlefnhMk=;
 b=nxOUecpQzDUbyBkLhpg2GF4zjv15jvPwq8rBGpvGGskdBzSDGezLgHBk3dzoNJaCcvt0ZvesQ
 bYLkxRRCihyAp+Oa9DobuIGAzQErBEiocqwVafbYO8niXxdyhohE0cK
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MR1P264CA0138.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::19) To BLAPR03MB5458.namprd03.prod.outlook.com
 (2603:10b6:208:29d::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR03MB5458:EE_|SA1PR03MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 7527a4ad-6d69-4c66-6a62-08df2942c786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223327099003|261009221227099003|261009220027099003|261009223027099003|261009221727099003|260925021311599003|260925021911599003|10067099003|260925022911599003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	hdixqlnIPaj03KfvQnmUtEMaFkWMg7mqfvYxuaSf5fUkSDkfUc1aSp1DEh9LuOCNzS5cfRn8wAtJ0o3jWaY8YjFj7nP0Hi+t6XuOgrTH1RlllPfAkZxA5IJ591m5TGaSUE6rBewhYa2qpeBvT7jAxZVjrMKnIUeM6lZICCD1EIpz2+kAsa6o2sP8shA/muC6B3DGbvyNWmJKhz1r9N8gFHRvcB+jAamVXsR06lUef6Y6TJSlgJEzodVU8DVx1ycX3uvHaUUMDLlsfU6zA+CUt6E427ERqB6JHuK4SysaEQMPBH4FdKofp0qszCurJS4iU9LClTAUB4rQpFFYe0XarvP4nT8nA4ZHqfpnNZEcGhFVJZoYP4HTy+5D19fEKcttkjZgMfKfrHwWycoI73sNY89jDLph76oDc6YI+YAtv8xsBQ3MlEiZh+XWZz0pYrsH1TdL28a1NY1RE3kf3JSHY1p/Wa1MOh8Azxp0Clj9O0ZkWSJvUPzykVV5HqGL/CUsNP1gvCMm2y5DqiSWkY2N2DdoeGgrV3IVP9UdIaS7YELnBgaUaTeA+CcdSUdYbFIr6UADm6areH0lTZvWuGU5FsIDEDrrTaInwEcnTaRRTwXb0KKcMW+Vyxzg4FPtUwm0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR03MB5458.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223327099003)(261009221227099003)(261009220027099003)(261009223027099003)(261009221727099003)(260925021311599003)(260925021911599003)(10067099003)(260925022911599003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWdrbmlZSmU4TDVJbE1Bb3ZHK0FIQVAzVFZpWDVHUHlEcFQ5NlhhK3ZSaWFj?=
 =?utf-8?B?MnpheXpMa1BzUmxjMXk5dWhqcWxFY3YrbVVMVkJ5OEIxdmJFakFRbFlROXpW?=
 =?utf-8?B?SlFXT0owTzUxMUNaOXg1cXBlek1laTZqM0l4RU1rQVlpYzBDVlN5Z2laR3lU?=
 =?utf-8?B?TXhQOVVrdi90Z080WjMzcG5VOG5yRE56QnpSMHY2M2tsck9Pb0ZTM2NLNWJx?=
 =?utf-8?B?NUx0aFJyTmdIVWh6dmhEU0lhanlpcUoxbk1KREgyUkpuWG1YcnRzanRpZzhx?=
 =?utf-8?B?b1NURUcyWGNmQU4wR3ozYlhkeDZXRVpkNGY0RGl3ZzRYb3V0bFY1NnY3cTUy?=
 =?utf-8?B?amZ3d3VtUVdkbE9maGEwTnd5ODVmRW82ZlBGb1ZLUDZRVTZpbkt5VTFBOWdB?=
 =?utf-8?B?QVZFR3MrREVpU2NZQWlKbUVEQ0I5TFEwYTZMTWNPTTdnZ2dSWHRmN2lvSC9n?=
 =?utf-8?B?dmlRZDRsaEtHZDZvYUNnTEJtTXBSV1QzT0grNDdPSTd0Si9WdlRVRDUyUVdG?=
 =?utf-8?B?a2Q0NGJZalZsM25LemNsNnVNZUJ2SUNERHU5Vzk0UmVvQ3o2Qmw3dEhhc21N?=
 =?utf-8?B?Rzg3d25uMGNLNzdla21tTStBdG1qZEx3VE5QY2J5Y2xTT0kyOC81RUw3M25r?=
 =?utf-8?B?MldaeEVmdEhtTkl0OFQ4QVpvcHZWMHZRTndtSm1wcUkvRThuZyt2enJUeUtM?=
 =?utf-8?B?cVJMeCtiOUtpckp2UlFXK3dWeWhRRlNxM3dUQnlzQm9DdzhDMUZYUW5wenEx?=
 =?utf-8?B?eTdhWW9OWnRBa0toV0JLeWMvbjZWcTJwS2ZqVDFIcTVxcFpxQ0JtU2FJQ3FW?=
 =?utf-8?B?ektjcDhKU3Jnb0RCN3Z0QkRpUkJtNTJoakhHUExFYklKRmw1V1NXeUpNdXAr?=
 =?utf-8?B?MlJBWVUvZHZ4RFZWYWw0UjdkeWZpRG5HODdxU2RuK3g3Qjh3UnVkUVd4c2Mr?=
 =?utf-8?B?S2RxSi82SUhGUFMyZmRWNDJhM2lia0tsd1AvUXVKa3ZyNm1rbkJ6b3VmNnNN?=
 =?utf-8?B?M3JRVk9ndGVrUGZUOXpQU1ovZXlmVmFnQm8xK1hVckFFVHJCSzQ2aDB5ZWhQ?=
 =?utf-8?B?cXc2YzBINURPdnNpdU1aVlFXcHg5aDJrMGFpblhHcE1qa1lJVVczUEs0cjVu?=
 =?utf-8?B?U2s1QmhYK0RrYWQ2SmQ3TWxodHdIS2UxSWRwQld5ZDFQL0E4ZGVFMnk0cnlL?=
 =?utf-8?B?M1lBME1MK2gwQkZwUEhxOVNwclR6UUIvK1QweEJLRjJMdHVTSzZIYTNWZ2w0?=
 =?utf-8?B?d2RJMmgwS2dDVUZQd0tka2xObTVSbWtabnhrUmdJK2tMZGNqT1hNdFpvOGxw?=
 =?utf-8?B?bEltWm13QXVXc3NCT3c3d01iVnJPenR2S0VpVEpWSFo0a0tQbkJObDdyMGNO?=
 =?utf-8?B?T0dqSGc0amtiNlh5dklya0ZkT0t6ZTBxYjZSanNaaTZML0FlV1JWRlh2M25m?=
 =?utf-8?B?Z2M0aVQ3enJaYnFSSnFhRVp4WDlpRE11ZEZCUy9Fdkw1elQ1aHJxK28zTWpL?=
 =?utf-8?B?cUNINlRRMnd1bGs2ZjBoTmNiY0pBbHIyTm1lSGVYUG84WFp1ZnVEbTR2R0py?=
 =?utf-8?B?WlhJN0tOMllPYjdCakNGYWxKZnZyOUprbS9rQzd1dS9TSko2emlKWU01V2NW?=
 =?utf-8?B?SDVEOEcwUTFCK1ZSUEJZN212ejBJakt1bmJmUlh3VmNOYkhWNHcwWnRqcnFv?=
 =?utf-8?B?MTVIQ0NBVTNlYlRERmR1YW1idjdWZEZGTVo2WGRkdlFhZGdqN0RyeWFMaHlB?=
 =?utf-8?B?VU5rQ0lyZjVVQndNNTZpb2hpMjN4VVlHa3BlV3J4RlZ6Sk5jbGY2Y3FhZi9T?=
 =?utf-8?B?bHV4UlhWa2NFbmtlVkdxSGtXU1JQYXVncUJ2MkFZbTZDbVZRZXpZbjNncnJk?=
 =?utf-8?B?YmxGNkpUSCtEZHJTYUV0emNTTHJ4ZVU4dEt6ejRQRWV6LzByb3R4WVpLVlZZ?=
 =?utf-8?B?dDVSY2FVMStvSjh5cU5VTmZuV3IyQUlWRCt3NElrUmplMEExSFZMbGlQMUxZ?=
 =?utf-8?B?TVloZTkwYk44OEY2Znk5NjNYbUxPeWpwMW1ORjAyRC9UUWErald5dmo4Q0Ur?=
 =?utf-8?B?VmE5azVEQzhqbUxFYTF2NmJZa3RBbXJvM2hZTWt6Y3krYkdrS0F5dWJtNS9D?=
 =?utf-8?B?QWtEQzc5Y1VHN21uekxhZU1YcE0zTno5c0QyZzVqTm52dDVta0s1eHRPalo1?=
 =?utf-8?B?RFRVZE5RbDRCMWRDMzZYRHFlbGJlWmg0UUd0c3pOU1U2MFJReVBCTWZMZUp5?=
 =?utf-8?B?bVQ1TkZIa3g2Nk8raXkvOWNkVnBCMFl1dUlDcEgzbzhCcUVXMVVyaTVYT05u?=
 =?utf-8?B?ZFBJK1BIZEZuYmpsZ0x0OTF2bnRJNnY5bEIrNXpSOHowVElJc1dzUT09?=
X-Exchange-RoutingPolicyChecked:
	2bFhnxXONYxk/eOEf3aobyDdgP0bI/ne266nWy65i5CkY/e5fQHMmzwnN2hqrV+phjdEUx1wx6aH0i4kNe0vCfBMPgrT/AkmAQVNdBdxNYbVAVrcbu/2zbJfi8CZut/YXuM0E6xYqkPDNMUbpJcfiwPRRjj/fRHM2E32EigqpPC+nkTuG36Go1flPs90nuaTe3hGg2crz+T2//jVXnL3Uld17SdyzdlnBZ4GuCeUY/7XSBXVnH/H8hpB0y4Gb17oUjaqioM7OO8H9s/YYscicUbRtAo8HCkUsSHh3B1WEgsxyDtKJLsXvIyA524Ib4GS+rH2SXoB965/C8KQd283mg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7527a4ad-6d69-4c66-6a62-08df2942c786
X-MS-Exchange-CrossTenant-AuthSource: BLAPR03MB5458.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 15:58:10.4486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tixuLvp83hqBllLQ+iJwF7rfS6WDsYZERhmDBBQsSlW1RX3VL5v24Vmy5jyADSzRHhSInlKwNVhTymMNeWHKfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7124
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2MyBTYWx0ZWRfX7qeezTdLMxWZ
 KOmne52BzjZgQG5GhwSFtGkTrXKkXu3cT3jcd3zRqzTsnXK+BzPuaJ7GEIGyWCR8WaXyNyFbXNA
 77Nu3fEGoJVI80sDc2Qx6HGZqTrcI4dh69Zolxzt59/b/HOT5IB3zP4k5fTHUVUhFB7qAG58Fix
 IcfykHS+Ii/GI+29DRGhZVs3nfp/vlnIP++sYaCNPZBwx1u5WQk2GMJzWi8oA2ORIFFoZ8yC4RD
 S/SqoDokUjBZ+mRBRCe3Py7LfsJAbMA3oLBjQqdPRivkPqFQa/+moFj7zI4GZALksaM2JIGJFN1
 Wtp0NzD6XKHh2gnUj8Wyo9jb7NYcbLjw3SbkDGim5hvD3lRUBWzo+Cuh0g8KVW8ojcTOkP1Gtle
 5VOXS+Z432zv+K+021+PMpzzu4jNYcIguRKne9/z2Th/6WU6TH3UNTRzGeltOitH370p08TfW2f
 fMcPjUfkxSMw9yUUFdQ==
X-Proofpoint-GUID: h4COC-o2OWzLsvaSK21iPYEqvKtUj1NM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2MyBTYWx0ZWRfXzxof319gBnOw
 6krgukpITQpl7O2iz3z+hC2TvKrzayzi6QKDqWabIhPOMwrQNivl9AtnHXjgbMWoAmY6eNB/iqr
 rT+IUwMlax5nDAyCeTSR9dPaVVkLOVXn8xz6GmPfi4nQHaGK9Gq6
X-Proofpoint-ORIG-GUID: h4COC-o2OWzLsvaSK21iPYEqvKtUj1NM
X-Authority-Analysis: v=2.4 cv=AMOHH4aD c=1 sm=1 tr=0 ts=6ace5518 cx=c_pps
 a=Cwg/eoBiIzPoLCvUJpemAw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=bC-a23v3AAAA:8 a=gAnH3GRIAAAA:8 a=PVkDEAEEmQ6aH4wvTtUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130063

Add support for the ISSI IS25WX01G, a 1 Gbit (128 MiB) octal NOR flash.
The part is fully described by SFDP, so only the flash ID and a small
post_bfpt fixup are needed.

WRITE STATUS REGISTER (01h) takes a single data byte and only affects
status register bits 7:2, so the default 16-bit Write Status assumption
does not hold. Clear write_sr1_and_sr2 so that the single byte write_sr1
path is taken; write_sr1 is already set to 01h by the BFPT parsing.

The flash also has no Status Register 2. Configuration registers are read
with B5h/85h and written with B1h/81h, and the 35h Read Configuration
Register command does not exist, so clear read_sr2 as well.

Software write protection is done through the block protect bits in the
status register: BP0-BP2 at bits 4:2, BP3 at bit 6 and a Top/Bottom bit at
bit 5, which is exactly what SPI_NOR_HAS_LOCK, SPI_NOR_4BIT_BP,
SPI_NOR_BP3_SR_BIT6 and SPI_NOR_HAS_TB describe, so set those flags to get
the generic locking support.

Note that given that the Flag Status Register (FSR) handling is the same
as in some micron devices, were're adding the issi chip directly on the
micron-st driver.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
Add support for the ISSI IS25WX01G, a 1 Gbit (128 MiB) octal
NOR flash.

The part is fully described by SFDP, so patch 2 only needs the flash ID
plus a small post_bfpt fixup:

 - The flash has no Status Register 2 and does not implement the 35h Read
   Configuration Register command, so the core's default assumption of a
   16-bit Write Status command does not hold and SNOR_F_HAS_16BIT_SR has
   to be cleared.

 - Its BFPT Quad Enable Requirement field carries a reserved value, which
   makes spi_nor_parse_bfpt() keep the manufacturer default quad enable
   method. As this is an octal-only part with no quad mode at all, the
   quad_enable hook is cleared.

Changes in v3:
- Move the IS25WX01G support into the micron-st driver and make use of
  the pre-existing FSR handling.
- Link to v2: https://patch.msgid.link/20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com
---
This flash is populated on the sc846 board and was tested at 125MHz
using the cadence xspi (cdns,xspi-nor) SPI controller.

(Note that in fact the controller also needs some patches and a new sc846
compatible to integrate)

cat /sys/bus/spi/devices/spi6.0/spi-nor/jedec_id
9d5b1b

cat /sys/bus/spi/devices/spi6.0/spi-nor/manufacturer
issi

xxd -p /sys/bus/spi/devices/spi6.0/spi-nor/sfdp
53464450090103ff00070114300000ff84000102a00000ff05000105b000
00ff0a000108d00000ffffffffffffffffffe5208affffffff3f00000000
00000000eeffffffffff00ffffff00000c2011d80f5200ff4462990087ce
04e22801273d7a757a75ffbdd55c000070ff8170f8a12fcb278b00008401
0082080000000088ffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffff430effff21dc5cffffffffffffffffff000b801e
b181b58500f0ff9f500a000028d55a8cffffffffffffffffffffffff0000
060100000000000081050000e70000000601000000000000810600e70000

sha256sum /sys/bus/spi/devices/spi6.0/spi-nor/sfdp
a1fa0cab6324b45a17e6bd7fc7e581496517d558d8c7684cc85e57a5dfe5d87b  /sys/bus/spi/devices/spi6.0/spi-nor/sfdp

cat /sys/kernel/debug/spi-nor/spi6.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-1S (fast read)
  opcode	0x0c
  mode cycles	0
  dummy cycles	8
 1S-1S-8S
  opcode	0x7c
  mode cycles	1
  dummy cycles	7
 1S-8S-8S
  opcode	0xcc
  mode cycles	1
  dummy cycles	15
 8D-8D-8D
  opcode	0x0b
  mode cycles	0
  dummy cycles	20

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 1S-1S-8S
  opcode	0x84
 1S-8S-8S
  opcode	0x8e
 8D-8D-8D
  opcode	0x12

cat /sys/kernel/debug/spi-nor/spi6.0/params
name		(null)
id		9d 5b 1b 10 01 00
size		128 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_4BIT_BP | HAS_SR_BP3_BIT6 | SOFT_RESET | NO_WP

opcodes
 read		0xcc
  dummy cycles	16
 erase		0xdc
 program	0x8e
 8D extension	repeat

protocols
 read		1S-8S-8S
 write		1S-8S-8S
 register	1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (128 KiB) [3]
 c7 (128 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-07ffffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff | unlocked | 1024

dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out

mtd_debug erase /dev/mtd4 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000

sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read

mtd_debug write /dev/mtd4 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

sha256sum spi*
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test

mtd_debug erase /dev/mtd4 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test

mtd_debug info /dev/mtd4
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 131072 (128K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

flash_lock -u /dev/mtd4
flash_lock -i /dev/mtd4
Device: /dev/mtd4
Start: 0
Len: 0x8000000
Lock status: unlocked
Return code: 0

mtd_debug erase /dev/mtd4 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

mtd_debug write /dev/mtd4 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

sha256sum spi*
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test

show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff | unlocked | 1024

flash_lock -l /dev/mtd4
flash_lock -i /dev/mtd4
Device: /dev/mtd4
Start: 0
Len: 0x8000000
Lock status: locked
Return code: 1

mtd_debug erase /dev/mtd4 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

sha256sum spi*
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test

dd if=/dev/urandom of=./spi_test2 bs=1M count=2
2+0 records in
2+0 records out

mtd_debug write /dev/mtd4 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2

sha256sum spi*
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read2
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test
03781ea58ffe95ed666f174f7804b84999f525516595c1ba0f99ee83eb8af22b  spi_test2

show_sectors
locked sectors
region (in hex)   | status   | #sectors
 ------------------+----------+---------
00000000-07ffffff |   locked | 1024

flash_lock -u /dev/mtd4
flash_lock -l /dev/mtd4 $(($size - (2 * $ss))) $((2 * $bps))
show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07fbffff | unlocked | 1022
 07fc0000-07ffffff |   locked | 2

flash_lock -u /dev/mtd4 $(($size - (2 * $ss))) $((1 * $bps))
show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07fdffff | unlocked | 1023
 07fe0000-07ffffff |   locked | 1

flash_lock -u /dev/mtd4
flash_lock -l /dev/mtd4 $(($size - (2**7 * $ss))) $((2**7 * $bps))
show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-06ffffff | unlocked | 896
 07000000-07ffffff |   locked | 128
---
 drivers/mtd/spi-nor/micron-st.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index f97f2dead8c2..eba07efdca75 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -216,9 +216,34 @@ static const struct flash_info micron_nor_parts[] = {
 		.size = SZ_256M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ,
 		.mfr_flags = USE_FSR,
+	}, {
+		/* is25wx01g */
+		.id = SNOR_ID(0x9d, 0x5b, 0x1b),
+		.sector_size = SZ_128K,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6,
+		.mfr_flags = USE_FSR,
 	},
 };
 
+static int is25wx01g_post_bfpt_fixup(struct spi_nor *nor,
+				     const struct sfdp_parameter_header *bfpt_header,
+				     const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * There is no Status Register 2 and no 35h command. And WRITE STATUS
+	 * REGISTER takes a single data byte.
+	 */
+	nor->params->opcodes.write_sr1_and_sr2 = 0;
+	nor->params->opcodes.read_sr2 = 0;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups is25wx01g_fixups = {
+	.post_bfpt = is25wx01g_post_bfpt_fixup,
+};
+
 static int mt25qu512a_post_bfpt_fixup(struct spi_nor *nor,
 				      const struct sfdp_parameter_header *bfpt_header,
 				      const struct sfdp_bfpt *bfpt)
@@ -655,6 +680,7 @@ static const struct spi_nor_fixups micron_st_nor_fixups = {
 
 static const struct spi_nor_fixup micron_fixups[] = {
 	{ .fixups = &micron_st_nor_fixups },
+	{ .id = SNOR_ID(0x9d, 0x5b, 0x1b), .fixups = &is25wx01g_fixups },
 	{ .id = SNOR_ID(0x2c, 0x5b, 0x1a), .fixups = &mt35xu512aba_fixups,
 	  .fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE },
 	{ .id = SNOR_ID(0x2c, 0x5b, 0x1b), .fixups = &mt35_two_die_fixups,

---
base-commit: b1fbdc83612abc9281304e5b000b93b106eb3733
change-id: 20260911-mtd-spi-nor-new-issi-chip-ef3881bab60e
--

Thanks!
- Nuno Sá

