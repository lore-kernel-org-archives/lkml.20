Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C385040B6F9;
	Fri, 11 Sep 2026 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152732; cv=fail; b=AjRrzu62a5UyuOt+SPBv404kVnSn5usAFjsDbOzG+VRN12xAUQdGeeSZ3ugbj3xDMbbpL7DlZpmyyiOyYxeyVpAOrn/d2dx6gWpOOwFCjBptamZVYqIKsKE/zF3tnGA5PtLBE95ZgnePL9DguBnulRkrbfF0WaD7te9LSh9QKdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152732; c=relaxed/simple;
	bh=Cc3pmcoWBR830DHZzkAJYIenylr0BM4zbOlGlva8UMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FboXaDJRuxC8N7YjntM7x8hNeJsUbdQiBMKkZL3/QbyTVPfmfRi7axUc54PQxuGJryeJ/Jwja85Ql620QHI5nB/m5z3Z/o8SZlCgqlj+npNj7Y8B9f0ampR/rHd8uA2UX7jihFCz/clsA2nhTmcfMvHgZZcKRIv/JRrSEM45AMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HU9qYTJD; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HU9qYTJD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZD9E/auFg/c5E27LjeKm4rUA+cIF0i3LwylfVnBZhsu8QMkrHc51SYMfOebVKlB+AvbhInFvGRiQ4+ZRrlVT4us97930L7VHJlF9MrstkNAyHF33QOCiOp+4xZotEHfpnt6wTWK6bjIqQY3A26ZhZi3+BfxIINSwp/DTPFW1v2I40V2D0efx4r+KJjHuQJeF0Fh47JKKnsO4e1b8cNJyofVmKdJYqmBjj890KOQKv7NVUK2SU2tpgTMQK8ZUuTtMhuCxiT6teHYwAk9KYT08O4W7ERnQfhxJ3ge5F7BdHGcFAXEExnMFAyOdnQG7amQz/K4GTr9TWDBJp6EzF3KFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHvsQIpdPiQu8Aral9v2U7nRUZATCL4w4U0Ozarumls=;
 b=xj1YzoX/e1crFfbAEvf8X/T/VJyJ5fplR0MLXGncXyLRVEdYleNSZy9AIhr+tSnmF9XnRVRRibQVQCGfukjww2LWc/8tGYd5JIjhhugnWTfZtjiAci804id421M9+quL3RyaE2igjdQzNPpXCTGV63BwM+tNfKbFxVVRHUqWx25BAacOYLll3oZfjAD68Rl1ynlGU2lrAOPF1k7UiUKJT5bO7yt721GT+AOEOvJ22Zcxg71uXJJ5IqRozioa+68DWSpB4zSPGAB9f1IGcraY+4NGEQemSy/Fu2HtOzJl1MJbhrrYsWTCn3kVv/dazdmGM49RmvOXuRLUSf5jDT+R5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHvsQIpdPiQu8Aral9v2U7nRUZATCL4w4U0Ozarumls=;
 b=HU9qYTJD6IM8UM4SKvHYtZExtcgKt7ttJmfIGC5nQf3IVBUP4ZKwhIBKgHt/jjMwtZWEZ6iL78zmmPqPd6VbAm9OnGUg5Jfh3pIMwUJyCp7oWQMVWHYTmnd3mLKbzbMYNyAD9YeO0aMSpI8hA4AMknJX25fkEX/c7fB40dVx7pZiyiQFoC+FJN82l4xXREWiOiE0MWMMiPTZQFpEFTk/pUfrtF5J7ao1Fl9FQ0vPMIVKkZBzzIXBfAwfHWv2KTSp0ylrs510mlcIjTfE7D45+WoKFRRnGiq+g9hgw/iIg73j7wosaswnMeUp56dnvppnsuUAfbxIosiYVwz0oo167A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA2PR04MB10409.eurprd04.prod.outlook.com (2603:10a6:102:415::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 18:52:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 18:52:06 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mp-var-dart-sonata: Fix Sonata SD I/O supply
Date: Fri, 11 Sep 2026 14:51:59 -0400
Message-ID: <178915267857.2916670.15391959554330587521.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902164317.45925-1-stefano.r@variscite.com>
References: <20260902164317.45925-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0118.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA2PR04MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: d12f0662-297a-4055-485f-08df1035c6fb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|7416014|10067099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 P8dmO7fOfibsKRIAEdU7cAtgp5qwOqAEjDizGANia6SwtxZumrLb81W3xiWuj95iLQAiWSYupSLXE/tC0aN1xEuFBJsNuZltO5ZWhWAphR1vDvE1gQ9Zv6prpiyN2jWcL5FxyFJ93/7jAUtXcpLxTr0wrmzv+Wg1TChWHlJe//8mlEcnDUQyfUumumWh/UwU7yMUEoR44j0Yxy5GcvWFouSFOHt5KLgI7f5oe2Ho3jO4RbCpoIY8YJlvmYezHuQbH16JOdbC3rGo/kOXaUD7bHp9JsFsQPE8yKlMbTTdz7GpYbBk2yEqXcC/VADDayFbYlYBZH9aLXsx6UFNMceSIrHG2+/KDuYvc4SGQrzoG+MVhNs+NWLkXHnECUmZQTHls5anHOJA6Am0llGPt62LEG/VpL0HUDZaUovyMC966mb8GgXMRw9gbdg4+k+DcT4c7VTozeuokBzMIBkAj97OuPsKkhApd8W4yzMjOThVHJDKfejceQAGQ3zH6Zm9lIrWDqCjG7RZKhZRt4wilKrY1Pf9UKtC+9Bxuf0bDgw6x60zYmOCGw+lgS68eJthyWhI3Pk6pr2FNLv9UittyA/CQy/YjXhX0peYBm4Y4+88YOgQj0vfpRGnB2MCdD1vKVNTOfivAwhfM1xs1dAKoRB+DKT1FL/fkrga2EO70oT7M8Q=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(7416014)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZTd6YXVmU0o4cGdQdFgyMnAyVXFlWGhyeDExVFhpbHpBVWM4MSsybU9IL2J4?=
 =?utf-8?B?RXpKcElRZDdaMjBnMUZuVVhQM01kUThMOXF3Z3FPZ3B6ZlllT0JpWFR0NEkz?=
 =?utf-8?B?ellTc0QvQUhJb0hNb250TUcvc1Fna0Y1NDMzVnZDWERsbkxrUTBIdnFnc2tK?=
 =?utf-8?B?b2hQSkp3OFZTMVdBclRBOVJRMnNkUGowanNyV0F2R0dHdkZISjlPdXVLZ2I2?=
 =?utf-8?B?ZnQzNXNaWFUxYmpNRzI5Rm5jZXh6UTdwNjBHc2RobTJGbml3a0ZZUkU1QmRO?=
 =?utf-8?B?S1ZDZUhOVkNzbC9DL3RyVWxIQmNtVFVLWTFjREtFZU9BNkkxZ1NzTTV4eUVZ?=
 =?utf-8?B?Qk5Lc2JQempMeHJTaWM4RmJyOGM3ckFhcVBmVkJvZlBtbTZTMXZ5STFLb2Nu?=
 =?utf-8?B?T0ZoVmN0emMyZUphd0tVOEdCWDJzRXhJaTZXa0xudXowS3BxRDMwSzJsbkJv?=
 =?utf-8?B?T29RRDRqb2dWd2NCL1J4MkN1U2psZ3FRS1c1bmtZRmdzeHU4UTNRQk5jQWly?=
 =?utf-8?B?SGRUb0VMTnJ4NU1GeUs2ZlNLdFVsNVhxMjFOaUc2djc5T202TnhaSVpHYW5k?=
 =?utf-8?B?ek9mRXdmTFl4N0FjYUVTaDBsb3Y3RTJEQ1JMTFVOZS8ycjdPbFdMWlVmM2Vx?=
 =?utf-8?B?THU3a1pxWTNldkJXY2RiK0xYa0NBNE5UV0pid0FjWVJ2VHc2QmxYamxhREFq?=
 =?utf-8?B?ZVIzVWpKTVJndFlNNzhOOG9tU21LeSt1Vk9GcmVZTHZsVW4yM3BlQmE2OVMz?=
 =?utf-8?B?Q0VBRkdWdHpxZWMvWjhjTk84dkkyVHh6TWswbE9TcXV6VER1bUJWVEFibUZu?=
 =?utf-8?B?NElseXhGeU1OOHlHSGdFSHhkOWlQQlAvWDkrQ0F4OUpYaWk2ZlFwTEtidkw2?=
 =?utf-8?B?NGl1Wm9sTnZ4TXBqUElFd1hLNXpDaXJLSm02Nk53Y0JTOFVFYmYzVDdFeUFF?=
 =?utf-8?B?Q1FQNVlkVWNxQm8rZUJlN3dodnB2VCtrMy9aOTFXd1ZwVVAwVVB4RWliQlBC?=
 =?utf-8?B?VVZkVmdSWmJCUGlkN1lmaTA0S3ZUajMwbEdYWjlka2hhRnhGL3FKNllXUDJu?=
 =?utf-8?B?N3hOOUl6Yzh5bzd4Y2lrWGtlaHh3ajl0ajYyVDloU1ZQaTZESVZJeG0yWkVt?=
 =?utf-8?B?VXZqVjgwWGxZZWV4d1huWFplZVBlTUNwZTc5V3hiQWJuOUpIWFQyekl0L3Nh?=
 =?utf-8?B?UHNWcHhvRCtwSzRNVjBNQWJRV3pXK0tOTGhXUi9QbFptUTdScUlmalUxQlQ1?=
 =?utf-8?B?NGd6and5Nk5xeldvanJ4Tlh3eTB5STFXQzVBM3hjN2hPWitVakJEZFBjVDJh?=
 =?utf-8?B?MDYvSE12K1JscmNyZlNRNjE2NHcwNXMxR3o1UHFtMmZHeHAxWStTZ0lCMUxk?=
 =?utf-8?B?akhIaXBNK1F6NGh3VnlxWUp4c2hxYXFOY1lWakFJYlkxaGRHRjN0ZGFHalcv?=
 =?utf-8?B?Q0lTVVBUTngzc1E0ak5GWkxqV3FrZ1FKYmRIa0xMVjFWQ3R5b2E1alNjRDhw?=
 =?utf-8?B?UERMalVpMEFncGlUSklQQjFnNHRVbFF2Y3VnWGtHSXliTkMrY25BMHhVdnJo?=
 =?utf-8?B?bjJNdHBOSHo5TElKS003Q2h1a3hVRTdZSGhwMTlNMEs1ZmFTTkY5bnAwOVN5?=
 =?utf-8?B?U1FJaEp0MVMraEl0VStVaHFYdUI3eVhsZ3doekNKVytYaFY1d0Q4R2F5SWtL?=
 =?utf-8?B?emRkaE1kUG0yNTJueFVxWkZlVjR6Vi9yajRWdFhHRFRrS1p0NW9nZUZnVE9u?=
 =?utf-8?B?OHJjS0xFK29zbEExOTRGSU41L0x1L09DZ0YyMCsxdVZ3UlpWcHRQVDNnUzIz?=
 =?utf-8?B?bEFmbHlBTGFGT1oySWYrNDlTR1FTdmZSZ28wOUlSU0JVTVNaekVCd3FyS0J3?=
 =?utf-8?B?NkxybDQxNGMyVkZ5Q3FmQVNQTzRKalhHd2tKUFJOQXdWWUg2SUYySmJOMmpq?=
 =?utf-8?B?ZmdQd2hLeEZUNXMvU3kwUGpPWkZMNXF5T1lXdUFEa3AwVHVmL2M3VEJ4Q01W?=
 =?utf-8?B?b2FSaTg4VVcvSSt5Z3grNldzYlNZQWNBb2E1OTJzbGR5a1pGSEJPWUNNN05X?=
 =?utf-8?B?ckluSG5ENTBBWEtqVzUvZDl2MmlGUW0xTzlnaWRiOGNOTWdRVzVjb25aM2JB?=
 =?utf-8?B?UFN6NzcrR1UveUw1alFDTE52OTFYM3dtTUc1ZzUxSW9lY0FsRHZtVnVSSXcx?=
 =?utf-8?B?WGRMSlRnVys0TWlkN29VcTl2d1hDQmdXNVlrYUtqZzBoaDgyZm1Pd3llb1ow?=
 =?utf-8?B?eU9mQ21DTlFWcEN3TVhvYjFpTEZCRWZWRDVIdDdnb00xTmhSRVZMQUtNSnhr?=
 =?utf-8?B?ZWd4OGpiUUp5T3oycHMrdm1QQUFNYmhIT1V4ZngxKzR3U0Nnc2tia2Q2WnRQ?=
 =?utf-8?Q?rE/TVGKDfHnToV5glWb7nGW/NX+8YD/5zZJzT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d12f0662-297a-4055-485f-08df1035c6fb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 18:52:06.9025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eA3yRhPyvmeXQpLqBptVoDTIq1dbVXyHQTG4qFKEWx6aw/QBadDPVEmj5IAODai6JwGJ6lShzPM6pQH7R14TFrMMD+qvDzSDVAzNC711p1aFqKkAS0Li8gX9FVGFoNiM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10409

From: Frank Li <Frank.Li@nxp.com>


On Wed, 02 Sep 2026 18:43:17 +0200, Stefano Radaelli wrote:
> LDO5 powers the USDHC2 I/O rail on DART-MX8M-PLUS.
> Without a regulator consumer, the kernel disables LDO5 during late init,
> which removes the SD card and causes filesystem I/O errors.
>
> Reference LDO5 as the Sonata USDHC2 VQMMC supply, so the regulator
> remains enabled while the SD interface is active.
>
> [...]

Applied to branch fix, thanks!

[1/1] arm64: dts: imx8mp-var-dart-sonata: Fix Sonata SD I/O supply
      commit: 7ba5290db6bf365e46fb70bf13dc2a47048165ea

Best regards,
--
Frank Li <Frank.Li@nxp.com>
