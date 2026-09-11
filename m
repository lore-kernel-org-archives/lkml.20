Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010038.outbound.protection.outlook.com [52.101.69.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5F03F23C5;
	Fri, 11 Sep 2026 18:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152941; cv=fail; b=deuqqenbpRCpASGMJdgkVbr9rftiKd9s63fISwXyeTpiSdPqpMJ5s3J14ZVxAkt436rcN/lToF+atOMBxzkPQb9sQG8QdAlDIcHZW61WJaXL7BvoZSndCppnkZDBSZ4bP/fhNKybn6aacgf7BBoacElghCilreHjYhNvsUhxTfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152941; c=relaxed/simple;
	bh=OO5NNYZuhQZpsd3TYX9qcLULOz0DCT36zhHB49rINuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lw2pRJQerZaqu4ufW4B5nePFzj+kmpzkAN00smSoCeiwA8GmCBPZ8jJWuYcNHWeDPUNHYmWkOz3LiPEXZwewZRIYZNVbtxU8ISDDyF8xegN4IDL78Oo1NdeciCXP3W0GGCDdPK2N2cMqDpI+Ytm8VCsL1f9rNSgmLQ87AYzgDeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TvqNNzKn; arc=fail smtp.client-ip=52.101.69.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TvqNNzKn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxMi+6Qpf5JjkvCOD6cYh85HX3yXh4JXpPKLUQHRcgUMrQ4buqWNezLU+nn1uimSCP6+QL5dhBVY00S1Jv2X8caMESCC+nS6r/AofEuCO31sFOcH+F0K1roVwxDOsLpwvJAz9qiFPqr6x+YuVMOJ6km5GUab2aX8O3QBIWsWnEKCDWfm155JIGRnq72YJWIc6ZjLab1hc1mgvpxjxV8UNfAGHOYQISuGbIvGSjRyNV4NbpHs5QJOqUR7PDvT8XXDdIjhYRpnl43eLL5Kd4lIKZHAukLcutW2SSQLgHFpGef22NdFEQMRyXg/ge8aRJOt7xq4Fg6cUwNG4o9AG9Kxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lq6xWSyQpzYCSsA6tdR+rHHceJQdmU0Rk2Quur8MSlE=;
 b=T1wySlQS9FZRy30Bs5qHpHChsSMJOvoKsdOy13vitnx4eGipUdWMbOxJQqmdYRZhTQ4HbkbTqx5M9L8gBNqKpgywkFqW6mKrMBU6jHGUUH/RjpJ4B7SGExXOeFFnLtPLAmJCzT39Ux+pbCpt3oBAqUyTV+X+qiody5MesXeUP53UQiT5fMryNstZCkVAv6PodPAZlvtBtd50RkcXqa/2h4nwVItKmONZ4+AFuGR7TbhWvPBGHjzdhL/F6KeBZxyZ+asm0HIFUtNtIxyQY6DIPSv6cdVqko/JWzUEb8ZBB1jy1Dfq0KcKEjyNqrm8LSqossM2SxxyBO33ec9R4v4PKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lq6xWSyQpzYCSsA6tdR+rHHceJQdmU0Rk2Quur8MSlE=;
 b=TvqNNzKnt/EdUTNSEhoILmxIUUw2BjLvpeiNM9F5wBZm0s+vW5PZPqRK3G3K98rKhm2IU3XBWp3T1w7Ic0e73HGo0jNhyRUagJWVFPYBsS9G7+vcEARwQsG+tPVY7rPN0jkc+ebvImMcEZ0T0QpofNnwwtnKXwlU5q9YI3BWK6GxUXLPfKSVoNPIfMjqhSEy9dGydgFDRPIqr2UsUfcUqy9grqeNGzQ7EMgBy0zOCihPiG8c/esaVmq3foCQVmNr988ak+g582cbJtMa2KNxDv64mnQC+GCLhwrK+MWNkReF75QoMFK8kryqbf5vhd0O1w+bhaS0nXjWrYj1jMTztQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA2PR04MB10409.eurprd04.prod.outlook.com (2603:10a6:102:415::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 18:55:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 18:55:27 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: imx7-tqma7: correctly specify PMIC voltage constraints
Date: Fri, 11 Sep 2026 14:55:17 -0400
Message-ID: <178915291407.2919686.13200648813310370165.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9a916f24b610cc60e0efd13296f281e00b41391e.1788335665.git.nora.schiffer@ew.tq-group.com>
References: <9a916f24b610cc60e0efd13296f281e00b41391e.1788335665.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR15CA0170.namprd15.prod.outlook.com
 (2603:10b6:930:81::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA2PR04MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: 6153a6a5-a233-4fa2-63e3-08df10363e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|23010399003|366016|6133799003|3023799007|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	M0wRSo6KiD4HFWS4nRIY2DAJE1NeL3FC7Ve4Dy9nTNRPSi+MXUjcKw9b3CDs9MHzEvR3+rSAuu+HdRxVs2WYzq+ldxO90YH1z9Y9RbWh171ubDdYfoxLdV0mdytf26/8XoKs8cBoGSDwyRHjde1olU0j9Gl5TQwIJ+NhrdcopO3x2OY2u0KBoVUVOaTK5YMRd8KoxRdxyRrvo6lkpDQ9fUvkMSAqqFmkIV4Auhf2vGBCJhUly59lYkRGeMDOG99yYmVOYMYzhrEoM++F441jUpTDH/Dm9MFSkByIoNcfwvEo+OwP9Fk/7ENtsbH1ZOzcz78vc0xBjPZB4A2t4MqpI1BDCFRb6AGKwAB98wj8Qr6JMtiUoV2ubBCL72LWo4+w588PGwAXCwA9KbRRTsS77cnRVEqHqY3Lp3VdgyoVn3R6rFaKeqvWZg542ert7nKhRSOHGoYnnIfABsyPH0JSsyjIoV5IBdnGUZH5Y0Vg8e0kGhox/i7Sq6+kfMnS45F9oJd5C08rl78YZVy2twHXy7zox+37q8O4VPzO7pA0hg97MBxy73s7QgzE6+khEU57CVkBujtE6CsDU9fDNOtvhN+ooWDJjgNyiLwOxevfL5cDGIyHmZNLvwraJNNFLI4IfWhevOmQ/HINNzb0eib0yh7X5/t/bI1JUGh2rqX3Gxo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(23010399003)(366016)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnY2enkvUDhldUR4N2FTdURxQUdwME1pR3JJQk5FdzVRbEU0b1N5SGVxMTBm?=
 =?utf-8?B?bzBiRUFHbDFjZno1aFpQWGJkVjhYMHlmTCtrMHl5a2laTSt4cWc0N29JekFz?=
 =?utf-8?B?cXB4T0JEUk8ra2hweWM0aXFXbE84N0R6dDlFb3V1ZGVpdFd5RGtvbUcvVzRH?=
 =?utf-8?B?TWtJaFd0N1ZuTk1ZaEVwVmN0K1ArSE9KczZKencxLzZoNHpmWlJjdFU2VTZt?=
 =?utf-8?B?UVVNd0JwNDRENGs5VXNicTUxeHh3TVE5ZUNSMlFCcXJZM2dkZk9NamV0V0x5?=
 =?utf-8?B?Mm8zQUcwOXZHRlUzMHN3czYwU1ZzZUdEcm5Xa29HeU5jbmU5QytZbXQrVjAy?=
 =?utf-8?B?blpUVDQzUEhJem1JU2RtampockNlZitCL3ZOZ3duUUR6cGZBZ2RoRHA1Nmh4?=
 =?utf-8?B?akczZTBpREN5dVUzd3Y2a2phSWtTOHpoYm1qbHhMWkJjT3RGRVpjRlQ2NU1m?=
 =?utf-8?B?aWpNMWtxTUJJSDFZS0s2RkZkSTVTZXIvTnFtU211U3UvQUFsT0FreVk3ZGRx?=
 =?utf-8?B?dTZ5SFBmU1Q2Q1N5UXVqanpjWlNUaHlMcEY0TE00VExsL1FDNUE1ZkNBR0F6?=
 =?utf-8?B?amlXQXNXV1Y0c3kxVGVOWmovWVgwK3ovTWZmSVpiNVk2UUdyNnhYTjBUWUM4?=
 =?utf-8?B?QXY0dVhGdHM1Y2tGME9TUnRqYXk2WHdCN2pmYVM0ZVBPNEliS3VGTFh5VERI?=
 =?utf-8?B?OXFYNVFyNE1QTnJsMzFkVVVsTFROUUZ0RzFUckRraEl3N0hPbnFTalMvb0M4?=
 =?utf-8?B?WFp0d2xlL1lXdzF2OWFpNEVBa3lzbVgxOEJMYm1RbnZpSU44TFlEYllWa3hz?=
 =?utf-8?B?SGN2QzA0WlNTaWRqU3RFK1lsL3VGc3hha3A5NUQrS0x0UytIRWVxMy8wUlRK?=
 =?utf-8?B?Y254QTRyQlZwemJLMEErNVJJbktCRTNlMlNKKzZkUUxnd3VTdWl2eFhXcTBJ?=
 =?utf-8?B?OWxoTzNRd1liTElqRjJuMm50TlhOeUFvR3BKQWxCV3hDQ1VVeE55dExaajdK?=
 =?utf-8?B?SmZPZFJDNHZzVlBVRlh6RUl5USs4MUxOT29YeWdUR1JFcnNwNTg1dmxqS2Iv?=
 =?utf-8?B?Q2dPUWM0ZEJtL3dLYmNjQmdpMjdJTDFsR1NZRlMzK1NZMU1HbjYya0pPcjRv?=
 =?utf-8?B?Mi9QWDBZeCt4UmRuRlA3ZG81dnNLNDNpZGN4Y0RTckdCNlR5U1AvS1hhdGRB?=
 =?utf-8?B?NjZubjlNVXU2MUxHbWRmbll3dWFrelNjQVRxM0lQRWxDK09EeC9HMk1OVHYr?=
 =?utf-8?B?L3BDalBTT09FclJxTFo5VXJ1WGdWdjljWENIVG9WL0dEMWVxb1FEYWtDVno3?=
 =?utf-8?B?NWk4RmVUcjRPK0xNbW1zWGNOckk3YXpxc0FBb29LcTJPZXduTmNDL2N6UCtK?=
 =?utf-8?B?dktCSjV0TTZzcWR0bk1iMUpVUkUwbDl3SFBMR1doQnZ0NFRiZlJpVHlQRzNp?=
 =?utf-8?B?eGduYmVrS0VlZGR4anRvNWNaUkgrblVkaDV6VmNtYkpIQWFIcVZhcEpSbFlN?=
 =?utf-8?B?Z2NYS0hPd0xZcGdvbGp5TmxQKzRxUHNWeG1XaFB5SjlWcUF4d2oxQXFxU2Uw?=
 =?utf-8?B?a21ha1hsNkpUYThCVnAxK2Z0eFIrQVBQNERoUWREdmhJamFZd3I0S2xMaEV3?=
 =?utf-8?B?RURxeHhTUFBFMFcvZDIxWEJvOEM3VWJ1R1h3dXFUeVRab083QWRVb01Rc3Fw?=
 =?utf-8?B?UkhHVjRvYXZiRnlDL2JMSklkWnRPaE5TU2krWm11eDJtYlhtNWlsSjN0VSts?=
 =?utf-8?B?Z3JtTnpvUGZtMVk5VG1aV2w4WVNiZ3ZERG5HNHdYV3hsVTVwWlA4R1Qrc0Rl?=
 =?utf-8?B?ek5oWkhyUERqTU1VQjVjckh5L1k0K3JjVFdtSWR1UmVUNktxZnVUazN4aEY3?=
 =?utf-8?B?QnN0cWl4QVZVWW4yLyt0aFdXcTZpdTBRZ0N3Vm0yd2Zhc1lvUysrTzZRSEg5?=
 =?utf-8?B?bTFzWEZYS1UwcE52YTdpdjlnZ2tzTlBVTnRLbG9Va0d4d3owM2xoT3dwTVdv?=
 =?utf-8?B?U21oWmc4d3VvSjdQc0MzWnJSazQrWFlXSWRhcWFGS2FpUmJwc0V1TDl6ak5n?=
 =?utf-8?B?NlZLSVowclA4U1FNVXlkNXQ0YlJ4bUlhczZiV2VCMmoydmlDSElpeEdnYm4r?=
 =?utf-8?B?OFdIdUJEcEJ4L1ZQTjZnUVdmQnYvemVHaS9iRFBiZXBhVlYxRVFkejk2cUNK?=
 =?utf-8?B?RXZ2OUoxdWUvcyt0VndSdm92OGhZWHdDNDJxZEtMR3pPaU9xcHA0RUVkaWZ3?=
 =?utf-8?B?czFSN2cxc21Qam82WFBVTUtjL2hjZzUreGVCUWlyMTBIajNQTExEWHhXNVBL?=
 =?utf-8?B?MXZMNDdUL21Qc0hXc1FSbmtIUXVnVDVmN09uSXl1R3FtTnR0b2pOMHFIekk1?=
 =?utf-8?Q?VOYYL3x2S7yllEy2UzXwz8ZkPONENJfyWhQVT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6153a6a5-a233-4fa2-63e3-08df10363e7b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 18:55:27.3920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3r6GqXVDvt+Cmkop+zkoloIVdrwj1EL7/8JqVkD1t+GPCo6D3KNnTW1VF+k/xJlEAK2qtNKzpUvOj9x94Iyh76fWOulx6WSMMATJO+L8TYtXbESI8qFlCTdDV1o1rMgt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10409

From: Frank Li <Frank.Li@nxp.com>


On Wed, 02 Sep 2026 10:05:37 +0200, Nora Schiffer wrote:
> regulator-(min|max)-microvolt refer to the supported voltages according
> to board design, not the possible range of the regulators themselves.
> Update the configuration for the TQMa7x's PMIC and also add a comment
> regarding the PMIC's VCC_SD switching feature.

Applied, thanks!

[1/2] ARM: dts: imx7-tqma7: correctly specify PMIC voltage constraints
      commit: f322f8f68c2c3291633ead663effa3b25c18f7b1
[2/2] ARM: dts: imx7-tqma7: sort I2C device nodes by address
      commit: cd329bd34c81320c0f9dc8c4149a7d3ef111a651

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
