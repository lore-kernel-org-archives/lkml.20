Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010008.outbound.protection.outlook.com [52.101.85.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC001E0DE8;
	Mon, 14 Sep 2026 02:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354267; cv=fail; b=ifU1UHFwePkEGuFTocfYkFNUCuJIRB90RtpnZd69WXWAolIyS97DpvNW7x0BeEYmPbHI91Y0jwqoJx/r6yKRmB3TXe/CSwUH3aGnmj/WYhcJRUo7QfTm1SJlWKVRGkPcp/S8wtYuRSkDeviBhgnQEGKfV5cLRXTsFKHntbguuRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354267; c=relaxed/simple;
	bh=VJeQqEJ4bqOF5REt+AxXJm2RAQ3GHd1X+2P13ulwBO8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=VLwsBpx+akojaPXBEkf2353/KOxYHhROIZwS+XtckR6dVjTZyqbjlonAvSv8THzJTrVqbbfab5ksUKm4ys+TY25wkpuete/DogXeSf3h3Ltv0zpcSV0NnNkuyMfQp9yDD/Qf3x8yIQ7Mkatm8/ty2xoUrKW33dUbYjh6Y3BPtVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=VGRn+xH2; arc=fail smtp.client-ip=52.101.85.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="VGRn+xH2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3prMSGXEvw7iOrqYICmY22gafgG0uQD6mGyqQknfLlTTHpWuh7shq81yq+wYWSUNf0wfWYBj0b+qQlccOqBk9vrnz5ECqsiSqvq45bLw7MJM/htHsfN4RIOVHP1M9uW0TwJa3AKLQJ++Bhcvf1a4siVLjA5bJF3W/HPKLTvwH4CRdkK+95HIDLJOb6pjZ6zBo7lCCn3+584F2LniCOO82QrcMbn4GPvO3jZp2+59SrmRxg49bezHjesqs7XB3T2dWl+gksf3oKRG4ftDtCOsWPnRJcy9FRrYAE2JboFuX/Dk63gXnjXopwRRGZNd1wfu2Ot8LiXGvMaVr0MX/afyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niI2ffEOLuFlp3Jdsyuc0XaH6ucKktDfUw4ZASqo4ik=;
 b=hJGefNM5CKbxiHdRukl6eO/XzeeBuwXFZcqsPheQUHlma41IM1VfhSWuQLNSB6JecE89P46mz3dw7SsQccX7y+X8PlBwMKxFlVFQiKlAkssU2t4VpDWeYc2mQMggYuSFaUSFy1umBg7MmxruITgXxplzYEdvWbr8sQNxWjzcqZeAaazQo7VJyn5Z/bKaKuSP+XSmxi10y0mkJQxrDg3tAT27kGtwhhuhtb+2TBZM6HT3ILYrV31xo2g7TVlaJrWVbyx2meJsARVAfAvcVPVCQf+DBqW6OOmfdaq3XJ2dyakcAaV+Be0xeYHncCTQ6/deje5+fNxB/uUePFsP5waMXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niI2ffEOLuFlp3Jdsyuc0XaH6ucKktDfUw4ZASqo4ik=;
 b=VGRn+xH2ri/EzWP5SvYtpPJlkXEVnEOC632uEr6ylFw8b1p4sd1rLG2g8CfMB6EqlFOJOHJ32hYOsQoDDYHikWGT41b/OiaJ2pjSOeMROZKPjiI8fsYSNjqsrh55jyJNPNeIaeT5Nc/I+KAoOIHosp/oPh7foDmyUdXnluQl5BW/XUoM0oHRNnJKcPndbpTu0gV7veOHMbxggZCSCk5E/0N9lwm8BwDn8aC0RFt2+nOhXI1bbj6WUqJQKHY7UwCW/dJ5/xFVRG1oovaa2ZD69AEYKFekBLtqbA7INnBxUd4Vd6a10r5XWxpupwYAogbsNCPr+R3wd4Hur3HTfoeQLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by PH7PR03MB7267.namprd03.prod.outlook.com (2603:10b6:510:24e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 02:51:02 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 02:51:02 +0000
From: genevieve.chan@altera.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Ng Tze Yee <tzeyee.ng@altera.com>,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: socfpga: agilex: add Agilex7F SoCDK multi-QSPI board
Date: Mon, 14 Sep 2026 10:50:50 +0800
Message-Id: <20260914025052.14354-1-genevieve.chan@altera.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::16) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|PH7PR03MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c400be-0ed0-45bd-3572-08df120b0326
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|921020|10067099003|56012099006|11063799006|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	1cPTLKoRwCULs+T7bGB5SUVbIeZ2yjdr2I4GHn89klzd9fvOlNu2EUFkjndJaz0tc/9IRgw2c4bk+z4FZq02SzkjIRm4Xt8YXckU81+ZwBz2PKmgZpf06sIKxKyTNmDzRS/YuAAFwqls1eUyCwBwhIyBetLtO9jYcfJwp1F66bIP5pM5aEHmWe030JTHD2JlA61whIMJk6GU/wpF/RlO1jwymA1/yYCUqXxzU9fYRoOAQteKx/QP4KKcloVScjVSJ77912qKhCu5oS3iMAW3BbB5eHFGoSR872rs4if67TE+PksfL4TaMt4g30ivEuM2hAQ+vcfdVhXUJRzdFdv63sx7DAQfVPU8MenQjc2vOmFXnO1VVwqvlZewm+OQihrvGKSfb+nHSZh80jjwwqWWHbr07GaDHEQmpsGQ6FdoG9tIE/0w9GJ86DTrxOvMDqzoNPIFb3af4DTAn1SANbflm2IDaIgTDx3DzXa2Dqm2i+H7puMw2/giM00qSMxtgn4FciIJtJ/WJyi6rIn7z8zZqkj/pzkJrPs0qtNqxCmEkxAleWbARTxApJG8hxKNvNiLy/DstfW7so9074wnZJ2+W6a43JGhmia/QdhvVYbqSdZP9m4f+y9NYDskMAbAB7sr07LQnPljlT4/4D5qABtp7cBeF7KYtwN/0JlW6jUNJ6T4QDOflbw3BJ5sbnfHC/Td317JosSuT0n6rjXaWscUdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(921020)(10067099003)(56012099006)(11063799006)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tegxx+HxNEbD/hKOZJBfpfI+5+xrVkFu05cX2RJVHl+VCYwINOye3hBsGswj?=
 =?us-ascii?Q?0wnACEeG2LJWWBByM0UhIar8zweMJnAyQ8LFrBeugdqOfK3De4r5CFf8sMr/?=
 =?us-ascii?Q?oyClK1jhpSzuOgfO5ysuR3hhybRDhbU8OoPjwT+MfbZuaE8auCUKk/j7FrMj?=
 =?us-ascii?Q?FxKc78ei5aa0xtprDRc4Y95waM87p6AyBoO1su0T8V3iyvvcEQTJQtIBGKtc?=
 =?us-ascii?Q?4UMfR62DBC3689Mdt8+DlkaNflaNii+HZyz9JpXdum6ba+iSXhMsS1C1Z2BW?=
 =?us-ascii?Q?TJUJppsNIZA9Ck/aGXtPDJ/CwwNjJScKhIkm3OTm76ypWYUDvTMdU6FzGLT4?=
 =?us-ascii?Q?qc1eyiy4KanGYTTD4FIabeJ9iG4Ov3amuNIaej2oQ3BcKZ4KMWKl9G1zcHAv?=
 =?us-ascii?Q?bdXRpFUl8r7gVZjFWx2ovAxt32xtT0+JqLiym9759pcv6GN0M2FcM8wvmcPi?=
 =?us-ascii?Q?B6k6WnmtZg6dgHcJi1Jpr/FXNaHY46YAW19LTFO+KFPQx3wmYl7jBbB5YDcF?=
 =?us-ascii?Q?7Zzksc/kPrwDA70wzJAVRQ2FNmsLClGPdkbDR5JHaWg32/uwh4egkxih4AYs?=
 =?us-ascii?Q?xzYr2e03QRUmU3nUIrmG8vir+V4hnkYaOEJeT8qao2sV6bf7fQefKbhHoasi?=
 =?us-ascii?Q?J9N3TxD/W/UPCBamjrFMtHwq73ZYn9oqz4x0JSeNWUJyaQAlX9BabPK8YhC9?=
 =?us-ascii?Q?cPe696UglCz+MpwPMX8UnShCLeCvbpekSHlmlvx4KFYoIs4tbVEOg9AZ+w4c?=
 =?us-ascii?Q?uqUVe45o2e2uic4weHya7pupC1Xrgw7FUexgg1w3uyBY9U2Tc71wtSH89YCO?=
 =?us-ascii?Q?A87/kgxP0GzCQIFAtdaTgHApCL013J/fQkznkq0532hHl9LXfPkY99LrVMqA?=
 =?us-ascii?Q?lHFyTye7eh304KDXIIZ+zhq+c1KxgtXWhCEcESxdcad3HCOfMMXr+me++Wc+?=
 =?us-ascii?Q?P9VQI+cFBmDwifE3bfJLpciJBA+A1X74XDx+L85oeALZP5vlMbu5ryx5rji1?=
 =?us-ascii?Q?Jfi13GDEB9OKfrAuJKXXnSyLrH4AQWlfYDHQdgHTTKPurUvi9wwPOtUvRgoM?=
 =?us-ascii?Q?/ATudu2eiiRCVMmdcMexhwhxCWG0XG90RkY7/4otK+E87ldWT7GfchkPv+PC?=
 =?us-ascii?Q?O8B6xhcNocYpqxuqFAsU8k6ozqxwXVaFTdaLoKVGeYqc6rWGDAxkMlqQCC53?=
 =?us-ascii?Q?IvNmwYxmN1PPR4crBQ42ZGn/w6dCCapPxt/r1TpVyZ7AyThZ1zwZ1+HBqcmC?=
 =?us-ascii?Q?nN9lrJ+Jk/D7RcpFJfAdzCooV9pGL+8FyUO6E6xas8QjCuvwl0euVZpl+vby?=
 =?us-ascii?Q?Hp//kTsC3lFIaLQPI/t0J42/dmTigJ3HKigVZlcQ4yKK8dTQzuWW1VCdoH6n?=
 =?us-ascii?Q?lzmqLYAOEsAo3zfnIbNUyqdqLt5ZNbslCRTu4GcvodrpVhBh1llBUHgfonbc?=
 =?us-ascii?Q?qJ0IGHGNf9PVDC9PzlPbJS+M0s3p/++m6pgXn1q0yC23KY9jz9k/s+6jaxYg?=
 =?us-ascii?Q?ZdCGHfrAbZF1cAVXM/+TRK5m9FQS93QUvXO/33zyDv+PPiBjhp6WP83j7zfN?=
 =?us-ascii?Q?Rj+ui8GoKFOoW8TekHS8QVr8nZByQzAZvIpThbJ3SflDpPCQtAG4L7pzGKKL?=
 =?us-ascii?Q?yj3zMjWePCc+7Tft2+EI66VYwMsklo+SjEAagOoVKKrcEQcMngC59jBCHKZN?=
 =?us-ascii?Q?Uks0LdxHBDJDtZJXYUSdBEFcT6dkeAejyXpolZvOV5sd2oMO5KDzEW0hbU6w?=
 =?us-ascii?Q?J/YL17+YMxVwEHey194n3cUeRW7jKNs=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c400be-0ed0-45bd-3572-08df120b0326
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 02:51:02.2661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSWJiLjmZa2h0zyqQ10e/WwW0uBFb1Nqs+tRxdvqCR2ak7Z6CyorFBr9sz8wB/Ov3xdvIXabS38SK//HsTf+JzIGLMnvmOhd3aGO1rNBhK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7267

From: Genevieve Chan <genevieve.chan@altera.com>

Add device tree support for the Agilex7F SoCDK board variant with
multi-QSPI flash. Patch 1 adds the board compatible to the Altera DT
bindings. Patch 2 adds the board DTS, based on socfpga_agilex.dtsi,
describing four Micron MT25QU02G flashes on chip selects 0-3.

Genevieve Chan (2):
  dt-bindings: arm: altera: add Agilex7F SoCDK multi-QSPI compatible
  arm64: dts: socfpga: agilex: add Agilex7F SoCDK multi-QSPI board

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../socfpga_agilex7f_socdk_multiqspi.dts      | 214 ++++++++++++++++++
 3 files changed, 216 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_multiqspi.dts

--
2.43.7

