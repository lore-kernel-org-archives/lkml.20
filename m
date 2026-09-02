Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011037.outbound.protection.outlook.com [40.107.130.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA123939D2;
	Wed,  2 Sep 2026 19:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378375; cv=fail; b=rW+RZP2UQLNtaxNQ6BIqyHHpu4thhNE+QnHMcS8E3V/FP9F0pCTyY1E0qnLlW4CIVWr6jEWBwGWtsZzOEn3SOE/Ff9gpsUtKNYf8MetwWPzo+X365xsO46GC3Wu93cJtRMtajURHoo1sIbnwF1K3pjZwpxwKvsI4zcQEovjivAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378375; c=relaxed/simple;
	bh=pFkuqiZq6YvlzS72Kh/841mdi8Jjbwiam8p/dTpfY/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eIs9Mq+Gib50oUKoT5pSgnZuyT8hDx6HN7/kYTgr+UKti3tV0G5PUediRZlnEH+caE4LQHwe7nvXBBWsLJxSWJZzDm5wb4NY/7uUJzKHjCpmC648YB4XyMqEwnoq0ov1xeh60bZUUWyINXBxkuvJOqfmQ5tOv0AC4BWJD0DbrLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=POkaCkPx; arc=fail smtp.client-ip=40.107.130.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="POkaCkPx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIHBhLpB5XoC5q1DCLaq+EPwtafWtahp+/QB0ZYK3oiXWpDNg3usrOS3EieykL/IcZOupj20r6xwKOLAn1CT+hawcFDrsonU5QHYd04EYcjpK+JtHp1kpHrFA1Ok5ofJt4nIiCVSmBEIgLOMrCJThZzOl0zGw68T7lxyCR/hJ1baghKieBwNwUB2YaOQ0iWWk+zqGzScoXvWKqf+8NxENKV7MnQd7aXXz8l2cbMSQJki5jju4QZ1aTesQNzn41hfjLmjerC2O06VjfK02aWoUQiIfsGLXa5dIpKlmy+EPGHDJ7vP1qJJAkLeW9VZZzI8Y+oWPPh4pcjJVlwGja7Vqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWiCOgtp24jLjc3WTKC1adzrh5aPosTuYHhBIhADvRc=;
 b=Rchh5uiXXKOjaxulA4hBls1bv3hiIUrHdCAh9UCSeTtSnAIYED29HVY7PVpgFFAIknS5L986t5HgHZXC78SH0zkCq9nhLIHd6Jq3SXxjbD2weZaMcElh/hvE3SN6HbrBwjBYf+hr7p9DfQKCkaC8wh68pl2FKt/xnC25fXPnCun6OfwVulFibVLxLBY6cXGhnh4sQ7V6vYW2U0ed/14fEG7MAiQ8Kv3pWpKLv9p4hQkoay8cQgg65UPYjcBQ4ROZoLLeXAuRFsx9RpUDuY04GgtrBY3zvv3zTCuew8azIfFuq+dFc+tWhbaxn8HZyIUCG3ayf1D9omlHntjWR3WnXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWiCOgtp24jLjc3WTKC1adzrh5aPosTuYHhBIhADvRc=;
 b=POkaCkPxLan0iW+tbSBknCIzyon6bxL8gVFMYWFeqMr5S5sYjM/qQyO+TLNUmwlWpaQF990kwaUj6xnK8JiCa62Dzkp5kl++raYRkzNL5JN+dpCAmUev9kK0YoU+UvKyfYE4DbR5ao9OivPcZ6PgGwPL254jKHOBvTVoopmyAByOABcJDa4CU7aObcTdj2QlQSTlUF67FeDOpqCObLpTRqnKWc/s+iNgrZRUAcGpXIwo59qfHKOtHlGyRXhAR4FUG1s3EJYu5k59o59uwqMylzIArW3XzsK2wEtNt21bIrfUG3vT9LQacu3DhsI+ZcwPW9q2Z7BrnAz08C8uLrDnDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10612.eurprd04.prod.outlook.com (2603:10a6:150:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:46:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:46:00 +0000
From: Frank.Li@oss.nxp.com
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard configuration EEPROM layout DTOs
Date: Wed,  2 Sep 2026 15:45:50 -0400
Message-ID: <178837828739.2117457.8801273102080547393.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825142718.866803-1-marex@nabladev.com>
References: <20260825142718.866803-1-marex@nabladev.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:930:6b::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10612:EE_
X-MS-Office365-Filtering-Correlation-Id: b64f29e0-9af4-48d5-131d-08df092ad0b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|1800799024|366016|6133799003|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tp85Q3PJZRaPphQ5x9admJWM4D0TJubK+ZAnDDnUo9vREKuo9Nmy7lEyrBinImx+1Ho5L7mPlIQbUENpknDqmjX725ZrNbB1ixOzBu3+FysoH6u+XzyVnQGWzEZZC3vEkTP8tqPIudX6ZdZo2xwRPE0pv80w9rjgvvCfTPNn8tii6kufDU2AlDvwn3Y01eGihM4WNXVfqWeuEaMxgEdDNuSfdcKGexnbzfqBlvnSiqHsRHBfdXIo3ysfbFga83pgcg1Qak9q2voZSyoavuxLs28MFplXi5QbjDke+KKSO+HVSnZytN/xIjdXAe8RpZIlCwbkXPrVQ/7C3hMiv161eQmzm3Ghse65r/NChyggl2ZpP+xV+ZGbb8+SjBVJJv8Rg4lAMG5QpAx4ZMRZYbWq7lkwhFuzJw+PpBW3gYZRHqSjjOYPL/DNv3n3euhH6hQr3lm2wbYI74Ec8ZisOtGqbEfPZNCmGWHYrelf3gcDL+IFFM4+tki2Dd81bqJ2x89Sqv+LMOlS+4C3MpTo4Ufc5HKyZBhDhKRUz+KJc3OPvtzanGS8s4W7vvwkrtxIH1EQMAJUezAxg4CmztdLvYOgly42PEI3VKOG79x6T1MEtZPk2CqOK2SR20cDWV/HEcWpPFrhKGx4JFpNVzZbrDXBEwFPah81nIYECQaEALAcn8Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWhxSEd5alE4b2JYRHpJbjZ1a24vNW4yR0hzOXBPZkVZK2VnL252UDBTbXZK?=
 =?utf-8?B?Mk02YUxoTzNwQ0J4Ukpvc09zcXAwN1hhYksyWXZjdnNTTnJzaFpQMUpZeVVR?=
 =?utf-8?B?UlNhamVxYUVkamxFWWxYN0tCU3NaSGE1K1k5YmpCS1l1UlIwbWprTXBSK3BW?=
 =?utf-8?B?U2VPQlQ2bEFWQjlVSHJja3h0V3J4WnhXQzRlQm9iWTdiMVphTnl4L3BjZENq?=
 =?utf-8?B?eGNPVEE1eUtwUmlzQzBQaGRrd0l3RXJaenpNVXo3VGdrL21ydHM4ZWNwZTh5?=
 =?utf-8?B?bjRHUytkK1d5S0lCalhMQzlwOGo3Tm9TTm5RcWlRTVdESzQ0VEYrd0N3THlY?=
 =?utf-8?B?N1orT091L29MSkIyMnJxdUphbmEya2tCQjhxRWM5NjlVay9UekQwNjNZbFd4?=
 =?utf-8?B?bWFzSTFRZU1lUmpDV25zMHhCL242UmViQUliUVg3VEZzeVJMaCt6dDRjVGNN?=
 =?utf-8?B?YlFEZXRjQ0hSU0wvakJUTWpYQTJTNEdmTFRtSS85OTBrZ2NVRWpFL3RmTVJn?=
 =?utf-8?B?Rnlaa2tlNE9jVUNjcFJWOTJTYVRWMjV6OGJmQTlzMFN5bmRsNGtDUlZ0R3lm?=
 =?utf-8?B?N25sbktzVTFBellkeTBnd0ljeVIvcy9lNUIxMFZpOUZlTUEyWGFkWmdPeWRB?=
 =?utf-8?B?VjlJMzZxVk9ENDhPWkJZaWFKU0FOSFg4ak1TalNWS1plSmNPRHg0VFpDYVI5?=
 =?utf-8?B?SVhIaGVaWHc3cEJiR0pINS9QYnNLK1ZZc0lFcUc0TlBBQnk5MnRZZGtLRndW?=
 =?utf-8?B?bE00cU1mRnZMYjlDcURFQS93OWhRMHo0OFJMNmtKeG9JaW1VeW82alQxc0da?=
 =?utf-8?B?cThsaVJrY1FUYzdVaGZFUnE3bU5QVVo5MzErY0tGUjJOendPZ1ZxWDVHRTlE?=
 =?utf-8?B?ZHNOMGIwMzhPUTlZTkRrclpzK3RPNDZOSU53bjA1UzJOZlFBQ010cUR6QzVn?=
 =?utf-8?B?MEJxQjBTZW13YU9uSmNLK2FvL2N1eFdTQ0xLKytLL2tVaHVtdk5rR25vZVZI?=
 =?utf-8?B?eGk5TVVodW5zZnM5YUVhNUNLUFZYMURYcU1WZFZZTEdjbUlxQlFucjhoQzZB?=
 =?utf-8?B?OE50dWxCZGRXRk4wWmpXK0Z2Yzg4bmdqUFhiTFdPNHkrYXI0dkwrQUM3cHlB?=
 =?utf-8?B?K3lVVTN2M09qbWFwRVBXMDBodUIvcmYyQURtdmVFZkp1d1dhV1VSNmIxQXhx?=
 =?utf-8?B?NFg1Q2tCTlhGZ21jMVcyTmlEOHM3SDE4aVAvNDlUNHllS2NURzNpN0FQdnVp?=
 =?utf-8?B?b2k2OHUreUdvMTdjdkN5aDNtanB4Rnloc1liWHB5NW5zN3djY0dKdlhyemFG?=
 =?utf-8?B?OVp4amgrUjIyczYxVVMzKytpNGVvZ0g4cUJqaEF3NGFCRnoyWEZkb01GK3pK?=
 =?utf-8?B?WVF5UWdDNVV5bkRqL0FnL1lpNnh3NGdpaDVHZWtzb1BsekR0L3dFelJyQmR6?=
 =?utf-8?B?c0p6YXNLa3NjK214bXlDK1RKOU9oWTlQRHEzWURQUHFIZHV6dWFOenRCdFpQ?=
 =?utf-8?B?VlFRaEtmT2prYTE0ZHhKNEtORks0LzdPaitWQm5mVnBuTDFYU3BTUEp4NkF1?=
 =?utf-8?B?RmtteVJUaUtBdERyUGJQdGkwVStqQ3B4NU5WckRMaFhQd0RqL0dXbUdhUFEw?=
 =?utf-8?B?cEt3cEZ6dnlSVEJjdjR1aFhLeW9ud1BKNVAyNk9ybUZoYjEyOFUrNDVBR1pB?=
 =?utf-8?B?bTI2VnFaNFhOTzJySDhDeW9KSlRuVTNuQWkxcjdyMWhwS3FaSkpPbmxUNmx6?=
 =?utf-8?B?dFRXOGJvSnRwTWptYlR4SWovN0RYcmxrZUQvaGtTYlNmdDVyT1RsZGxJTERr?=
 =?utf-8?B?cjlzdU1ydEhkMkp1ZFJnaDZNd0kvdnVNSWhvNTNIcnQxMVc1V2h0cnVOLzEw?=
 =?utf-8?B?RjMrY2p2bDdINHFJYlY1azZaclphQUozVlozZ0E3LzBMbDM3aWlxWDErakZu?=
 =?utf-8?B?Z0dJQXBZd1Z0R296ZW5KZkxjOGpIdFQ5bUZldXYyQ0R5RmE5eU92dDN0R1BV?=
 =?utf-8?B?Z1BZd0dhdzJ2WjVYclZKVm1TTjVnM0tRdDd5b2ZQS0pITTJuSWovVjVjVk5U?=
 =?utf-8?B?ZEYzNDlRNncrUUY3M3RmdTVjYWNIQWRES3B1ZU5XQ2xuNWpkdFZVeC96cjYv?=
 =?utf-8?B?d3dPMnFQbzRTMGNrUXRZQk9Ld3FnazFQcjltRDQxYVdkTXBjOGxOUWtITDNW?=
 =?utf-8?B?Q3g1Znh5MDNKTVBsNlh4ankvQXRzNzNDT1B2RjUxYzhHQml0eTlocFlmWFJh?=
 =?utf-8?B?Q1NYOUJESXNCek5LcU1YV2F3KzV3Mlczalc4Z0M5TzR1b2s1SFRjcnBLU3Jm?=
 =?utf-8?B?bmxJQlVRV2xxNEcybnZWdzBNRXkyR0NWRnhoSVJZOUNtNC9qRURnZTZtMlBr?=
 =?utf-8?Q?KjZZvMFrEny01/ue5t+vwsLu3+hhIAWRWuWNT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b64f29e0-9af4-48d5-131d-08df092ad0b2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:46:00.6594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LaKjg+/NEg7aET6+LQ9qnKfV3GgzKoXTJwEHPwr0EK+R3J5jye0LbCH7xP7Hf2TJ86QEvSPpN9eY0Gp7ky8oqXl7pNzxMlQYyYHW4Lq3ACe7GzoIc2X4/usNirFRFX7T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10612

From: Frank Li <Frank.Li@nxp.com>


On Tue, 25 Aug 2026 16:26:40 +0200, Marek Vasut wrote:
> Add DT overlays which describe configuration EEPROM VHIP section,
> for VHIP section v1.0.0.0, v1.1.0.0, v2.0.0.0, used on ifm VHIP4
> EvalBoard .
> 
> With the DTO applied, the VHIP section fields become accessible via
> sysfs nvmem interface. The entire EEPROM is accessible via the nvmem
> interface as well.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard configuration EEPROM layout DTOs
      commit: 26835cf70bbb6207214af55495ea8bed9ea96775

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
