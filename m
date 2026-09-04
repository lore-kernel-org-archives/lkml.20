Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021082.outbound.protection.outlook.com [40.107.130.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214F5414A2A;
	Fri,  4 Sep 2026 06:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502677; cv=fail; b=u5Y/uVoMwnlWW1jZ1j+FMFWri/QalSsJJvFiPwBxx1hNo7+TavPabsuLoxTK4DuBjPu4g/nvswTOuOGeO9i+N7stZKLe3xvdGlY1MRRKl5/qPRT6GpSCdQZsM8DsaCXGnpiLWA2FKsmxXKFZ3Eo50k+rBmEvFcSz3wxhX5X1Qcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502677; c=relaxed/simple;
	bh=GCUbciWZkAn+mhdoSsMZcmosrTUuv+q/u2VykqybgWQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=t+/F95L16eMgQBcetHaXcy3DGSIdr/T6EHrobquVVnJSh14FzMKwc0+M+gnYCCK5NJLDAU0SXwAFMeLP7W9izCVM4sh4JWXT3h5RZOwGHYzCUkgPk+oi7wcIyfdDEe1pWAJ7Z2jeutWA7/eQvS2tIA5OVYTR0U9HgcorRvQt3sM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=jmql8yQd; arc=fail smtp.client-ip=40.107.130.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="jmql8yQd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkHQUivueZtAE/Y2OqzKqr3ImEPDpwXqqbhrORdVizmLt1FvPl6WgVhC9qe3ab1YDBSlRwvmNNxgMun7es6JOr1wWQ6wfIMU8Aav/nllzQyWdClUd2ihbLxgTFKsznMKcFvaSTH9bdjHbOdc0gdHv+8zNh0hY5Cv2PLDmGlNgkuFxpoGy/pBIXd+EvkixUxUHgfsOOWuz6aLVVZuH4H4qxwoXP/x1cG8W9V/2utZbX4+suOq19KPGG5GJOWCBiHn5LYqIRK98F9vdIsmiMjGLO5xn9PvYed4+py8wRlATn6CVcpBB5DsMXqllup7/KO1tfD4fOb/gjR0r2KiCOvxWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HzRVOGWdOrcEJm29Ea77ApZqjVmNMPClNdrtiCHDpc=;
 b=jwkjFLtGTs5pQFe8rMScTuXonw08jlkcxcCQOmgR9B4aO7VQA3RczbY4TtuQ5fOaaGxvyagMwnCCsQnHzSCAbv8u07hP6c2ULBlic7Z2aM7Gh7JfQggUD45Lb6s66sfCBzp+NoKwG6ZyYaHGhdmVS8PSDpoAO9M3EVYW+sdXkKwQCLm3QpU1UrvtpuKidL/tDUk4MsDLEbq6HiKCUJpYR64LEKUGMs7bLKPBJ/9QVglZqoVBBLPWbI4mCJWSB0KW1Q1u4Q210+xxliofOReDw1J/L7q9vQwQ1Bp+QMyoeki773cYX6ZgQTzWOW7FyChHgXF85xUBpb42T/skBNYFYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HzRVOGWdOrcEJm29Ea77ApZqjVmNMPClNdrtiCHDpc=;
 b=jmql8yQdEUrgAqEduWqR4FpFszqKhSQPcz3oOgNkA3S6nfA/u9BzlcXrFXb6fyhxnpyb3r2haQdo09sTVC2xm5qkc8WAMlWiacve9+M2tHLKrV7fXikcws+05ybiX6xKuf3VM2MatnDJL+UGLq6OcwOk4k2f45Zom2GpFi3u2/NUJ1JuW87HYuVcyKXQeUGrB5EZP/uv+pDIVaXGNVt4OJ5OQgGWzMphpyLYMthrfz+NrxeF4Syn1aKVF0jRBDJ3lR4Ey11/ZJwxyo3ohU590wg0gqMJsTF6vpNzj9VZdGqnMv0iGzQshbzFtH3Yy2PmBH1KfPVYY+4cshHOB5ix5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by GV4PR06MB10345.eurprd06.prod.outlook.com (2603:10a6:150:2df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 06:17:45 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:17:45 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Subject: [PATCH v3 0/2] mux: gpio: Add optional enable gpio
Date: Fri, 04 Sep 2026 06:17:35 +0000
Message-Id: <20260904-add-external-mux-enable-gpio-v3-0-1b868e669e43@vaisala.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH9immoC/4XNvQ6CMBSG4VshnT2mLX/WyfswDgd6gCZASYsNh
 nDvFhIHJ8b3G55vZZ6cIc/uycocBeONHWOkl4TVHY4tgdGxmeQy50rmgFoDLTO5EXsY3gvQiFV
 P0E7GQq0qzCvSWmeKRWJy1Jjl4J+v2J3xs3Wf4y2IfT1gIfgJHARwoFzVFRaNoqx8BDQee7zWd
 mA7HeSPK/gtFSecjFxTcFlihg0V4p/btu0LUFOjSRkBAAA=
X-Change-ID: 20250925-add-external-mux-enable-gpio-c9ba5beddd49
To: Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788502664; l=4500;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=GCUbciWZkAn+mhdoSsMZcmosrTUuv+q/u2VykqybgWQ=;
 b=7Pmg93Gku3T5jSBkeRV6vg4jWrcgK0gO+UzYvLuN1AEHfYinqvdk/HLrcSH+mpDu4t0mifP86
 T/h5wq2GKz5DFoXqv/o9pg5AUZgJqGn/L8b4BzPi/FthJrnsGA4ZIs7
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GV3PEPF0001DC2D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::10b) To AM9PR06MB7907.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a6::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|GV4PR06MB10345:EE_
X-MS-Office365-Filtering-Correlation-Id: fc94a1af-9170-46a2-b73e-08df0a4c3c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|38350700014|56012099006|3023799007|10067099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	l7eGR/eOECLwUth5nyqT1WRqKJcDDPurZw+kvqjwvCJ/fQRHWs+IBdCx0QPhMIUwDiLvSG9oTmy+3qRBWD7GR0MlOnPt/ghGAEBk2PyTeIfFKnSeMmbfZpbP5ffpdC/GaIL/pmzZuA0auoSTZfvmQYMusAfYCad5pcAcaIyMtysp2cxOR7SX0Yv/0pxdLQeyxDpEZ/D6oUKi9MKQi5ZmeI61aWDIioBTyMywHu1wgYPT8haUQGwfI1Yd/BaNwJRPSb0ueFZ4SbjvWHxvhpcBzfkFqZ18uvSsRFbNuDJ4t7ywPBXsTNU607WXVQ4FY1FmVaC0ur5ccnZwCpZIL+NawKaqaQayuaA7fGdrtYM87hCWFbO0ESsfWT+PfC3ZkmHpTFNnaAUFGHpW5Ssqmph8mUY1I8HdfoH9NsehIchlBw5RkIO8jLH2wkPDqgZKrFJV7UK0DFhDpqPqh2+iSF0o/OREudsshr6+U59J/o/OJWmPwanMqf4Mp3N4eOHQL6bfVExiqnZM7JR6pNzvwQeRjpcxrUTDc1ke194hgHemEvlWUEACOSjxZrwkSv9EvugJL4yRbJFHukzRFv2Swq14vitfhbBE/x2XY+hcW6VzumMpoRnLROmWC5Ha9qWQ0doFxkFIMsDAkcmRfGBIvRYTg279ciowhfv9Yq3IFNXDzVhLrNe86kZgl4ebQjCM9zlgP0RDMzA3baa/ZZtQtU+t3g/saVGtngwIZ57XIGc6u5A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(38350700014)(56012099006)(3023799007)(10067099003)(18002099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFY0SndDVjhRdWpIRjhYQzUxdktHZTd1aFlVVFNNRlFqb1JCWVFETEljWTZB?=
 =?utf-8?B?TnhhR2xJLzNGWlF2UWJMbDB5K3h0WlZuc0R1SkY5NVA0OXg0QU53bEFkMzhC?=
 =?utf-8?B?OXhhMkVEZHpCMDllem53aWVTM0JSdmM0SmovR012dHdTNWgzZXdOeUZIRjU2?=
 =?utf-8?B?QnM4TUlBa3pRNkh5d1NEdk1DbzM1N3EvZFZ4ZUhvY290Z1NsZ3lnUTUyUEZP?=
 =?utf-8?B?Sm9BSG0zQUlrak5ZbzRuSU5hdXRGaVZvUmkvdXQwNjdyMmdhWVR6Rk05TU1K?=
 =?utf-8?B?NHRCaTNQcGxZTUxSVWNEUE1pUlZpM2FNeUVISEUrZ3Z0bXc3Qmgza1NYSVJC?=
 =?utf-8?B?V25GcXord0c5VG9YblVZU2lSNVlidFYzUm9IQnV2ZGNKWnhOTkF1NXpySng2?=
 =?utf-8?B?ampkczR2ZGtRaFg0R3Fxc3dUZUZaMXJ0WTh4dC9pYWJHK2JVWHA0SVJRcHpM?=
 =?utf-8?B?TWliTUg1YW1ZVDBHRSsrUHQzNVZRSHBXT0FSbElwQ1JjQS9uMHJ6bXZQVkxn?=
 =?utf-8?B?N3A0aERDNndWVDVsNm84UWNRdG9iZmI2ek91RkNQdjM2SUV1ckJtSWJkMVVp?=
 =?utf-8?B?TktMZnRoZWtndmZxS2svbE5oUm10U2lZblJrWDFPM0NyZlZlaHZnVCtiZjBV?=
 =?utf-8?B?Unlmemh1Zng4S2NqZmZmSjZJYitkTnRVZTFPUllGYjk4Sk5NLzB2RHJEYldV?=
 =?utf-8?B?TGlYYXdvUDRpZ0s3cUtuTnp1ZjVRWks5b1EraFhjSmVXakJLMjBxeHFDbmZh?=
 =?utf-8?B?WndOWGVmMFkxK005T0x0WFhvMDhUTTcwOEEyTjV2dmh4eWJPcEU0MmtaUnpX?=
 =?utf-8?B?TStiSDFyaGgwRVl0dkh6b243VDh0bHJkd0oxbDNKblM0dFVSODZQcjFJbVJJ?=
 =?utf-8?B?TGVXWTdmT2lvWWkzVmxoSE9aNDRPc3AvUUs2L2U4d0lWSVpHNVN3eHRJZ0dN?=
 =?utf-8?B?V3YrcmNtK1NjQ0pSMmJ2UitpNjI4ZWFuTzJwTjV1Ym9PT3pacG04dGZMOFFB?=
 =?utf-8?B?MlpKT2t5NHl0RWxRR1prWjY3UkluRE9tNmVqS3h1VDc3MFlLQ1B0VUlGTlFD?=
 =?utf-8?B?czdycE9sV1J1M3hDQXhJQ0FiZi9FVm42dHpPU2NIMzJ1TFU2MG9zckcrYVRP?=
 =?utf-8?B?WGVITzFGRC91TkdrRTQ5TTk4emx3LzVsdUwrNzZvZ3JMNFNNd2xIa1o0VnJ3?=
 =?utf-8?B?eU1aNVNFR0FzMGgwbWh3Ti82eUdvWk51bEVxTmw2dTRQcmEzTWdYTDFKWllh?=
 =?utf-8?B?Z2lhNkpoczRUQlBocWMxRlBXR0w5c2l4U3BPSUdhZjloUm1SdFVERXJ2VVVM?=
 =?utf-8?B?Y0pEdng3bU9teWpmK2Vqd0FrVm5UVVpTZmlyWW1ZNFJZUm80aWtueGhqbjJz?=
 =?utf-8?B?V2dvVnEzZVI1WThoRGw1ekVJeGxlaEZuTXBTc0NDaWNNWEo0TWMydzZlV1lS?=
 =?utf-8?B?LzUzV2dIdEpzTGVHMWpVREJ1dUJob01CZFozS1FMZUZjU3RUcncrUGVQMDQy?=
 =?utf-8?B?NmZJb0lhWXVzUjU2MEdkeTI3aktaRGpLNFhlMmR4OWRIOGFZQitZb3ovS3Np?=
 =?utf-8?B?d2RDSFp4Ry9hdFhRdkRYeGM2M2svc1NzVWsxSmJMcW5aV1grdjYwL0VCU1pi?=
 =?utf-8?B?aDdpRGNvSytjaTJrU2JDOEt0bHFyV3hicTk4YVBPeEY1dEN2RWt2eTI4KzhJ?=
 =?utf-8?B?K1FTU244aVhPZlliMTkyMXlhcEllV2EybjBTM3h6THAwVVQ2RHVQNHoyeldB?=
 =?utf-8?B?REpoYlgvTkZkTVk5R1dCQ01lK0Z5STlGM285ajFYakZqZjAvUWtVRE1GakR1?=
 =?utf-8?B?RTdyMFdWWHFXaWlVNmhuSEZaMUlLODdWM2lRZ3o1NG9JZjRkUFVJbm1GMkx6?=
 =?utf-8?B?YjYrS01nTldNYndwM2htSHlRM0h6WTUyTFowOXM5ZFJpNW5xcVdqWTNNTThF?=
 =?utf-8?B?Nzl1RFU0UURpV25lNzB3M3BBdlZkSjN1TVRNRDdqVUtmeUVNVXVBV0QxTXhs?=
 =?utf-8?B?dHo2ZzBPMG93WVJUYWR5elNhTVYzaVo5clVXUkFCbHIvVEN3ZEd1MnJhWFI0?=
 =?utf-8?B?WHQ2aCt1SFF4RFZFSUh5U1dmZ2VLaVdLOFQxb0VIRzhpZStZaXZTVjBGK0lu?=
 =?utf-8?B?QUxxa2Q1N3piZXhUTEY4NmF3czdNQ2RvdDFRRTl5ZWV6Mjh1amdqbDZmM0JZ?=
 =?utf-8?B?V0lpb2tRUlIxRStnNFlGaU4vUzBrM1BZUkRaeUVrZHNTUXU0TlI2V3hBQ0Zo?=
 =?utf-8?B?VGg5eStUc1EwaTF0YTJHMllCVVg3MzBYSXV6U3Y4RnlhVjlOMEdLSWlna0g2?=
 =?utf-8?B?RnpaR2dBbytKazg2MkkrMFc1WTJNbm80MWNlVzZEVFdqWm5sR0ZUTUhMbytn?=
 =?utf-8?Q?VcY0nx/aQRmsUn/k=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc94a1af-9170-46a2-b73e-08df0a4c3c20
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:17:45.6566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBPIw45ofdAq36iQ+DXSR9QRcIxvyh2RA2GnkQKZT23Bx0wKSkoD9ulp9LYVx6qHg7jQbcq8thpn8QFT7szc43OmqMRxYo/ptYLAAH9nhG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR06MB10345

Analog multiplexers have an enable input that puts all channels in the
high-impedance off state independent of the address inputs - the E input
of a 74HC4051, for example. gpio-mux has no way to describe it, so it can
neither reach the idle state of disconnect that the mux-controller
binding defines, nor keep the mux disabled while the address gpios are
updated one gpio controller at a time.

Add enable-gpios for that input, and use it in the driver.

Without it the driver rejects MUX_IDLE_DISCONNECT outright.
mux-controller.yaml allows it - idle-state is an int32 with a minimum of
-2 - but mux_gpio_probe() treats every negative value other than
MUX_IDLE_AS_IS as invalid, so a device tree asking for the disconnect
idle state does not probe at all. On the board below that takes out the
i2c-mux behind the mux controller, both SFP i2c buses and both sfp
devices with it:

  gpio-mux muxes:mux-controller-slot@0: invalid idle-state 4294967294
  gpio-mux muxes:mux-controller-slot@0: probe with driver gpio-mux failed with error -22

4294967294 is MUX_IDLE_DISCONNECT, -2, printed through %u.

Tested on an i.MX6SX board where two SFP cages share one SMBus behind
DG9411 analog switches: the address input selects the cage and the
enable input gates the bus, both driven by a PCA9501 I2C gpio expander.
With enable-gpios and an idle state of disconnect, the parent bus scans
empty between transfers while each cage stays reachable through its own
child bus. A logic analyser on the enable, address and bus lines over a
full boot shows 97 enable windows and 82 address changes, with no bus
activity outside a window and no address change inside one. Dropping
enable-gpios while keeping the disconnect idle state makes the driver
refuse to probe, as intended.

Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
Changes in v3:
- Address Peter Rosin's review of 2/2. Cosmetic, except for the last
  item below.
- Say "Some analog multiplexers", not all of them, and note that the mux
  gpios are not guaranteed to be updated atomically and that only
  controllers implementing set_multiple() can possibly update theirs in
  a single write.
- Drop the _gpio suffix from the struct member: enable_gpio -> enable.
- Reflow the comment in mux_gpio_set() and soften it to "might not be
  updated atomically".
- Flatten the idle-state handling in probe, read the property into the
  existing default when it is absent, and assign mux->idle_state once at
  the end. Use dev_err() and return -EINVAL rather than dev_err_probe(),
  as suggested. Written without the empty if branches of the suggested
  snippet, but with the same behaviour.
- Beyond the review: return the status of the gpio writes from
  mux_gpio_set() instead of zero. The other mux drivers pass the write
  status back, and mux_control_set() only invalidates the cached state
  when set() reports an error, so a failed write reported as success is
  not retried. Happy to drop this hunk if it should be a separate patch.
- Link to v2: https://lore.kernel.org/r/20260831-add-external-mux-enable-gpio-v2-0-f6027a4afe61@vaisala.com

Changes in v2:
- Describe the enable input in terms of real multiplexers (the E input of
  a 74HC4051) instead of repeating the binding text, and say what needs
  it, as requested by Krzysztof.
- Add the missing gpio-mux: prefix to the binding patch subject.
- Limit enable-gpios to one entry, and require it for an idle state of
  disconnect in both the schema and the driver: without an enable gpio
  mux_gpio_set() drove the address gpios to the bit pattern of
  MUX_IDLE_DISCONNECT instead of disconnecting.
- Deassert the enable gpio while the mux gpios are updated, not only for
  the disconnect idle state, since they are not updated atomically.
- Show enable-gpios in the binding example.
- Link to v1: https://lore.kernel.org/r/20251105-add-external-mux-enable-gpio-v1-0-e59cba6f9e47@vaisala.com

---
Tapio Reijonen (2):
      dt-bindings: mux: gpio-mux: Add enable-gpios
      mux: gpio: Add optional enable gpio

 .../devicetree/bindings/mux/gpio-mux.yaml          | 22 +++++++++++
 drivers/mux/gpio.c                                 | 43 ++++++++++++++++++----
 2 files changed, 57 insertions(+), 8 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20250925-add-external-mux-enable-gpio-c9ba5beddd49

Best regards,
-- 
Tapio Reijonen <tapio.reijonen@vaisala.com>

