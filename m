Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7154E235D;
	Thu, 17 Sep 2026 14:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656072; cv=fail; b=mr0TaWgf72OSGDUvR6tCnQvHgIjVxMfkVk4SHdkiiUIOi62xyKC01IIufJy2TZlkTvyHM0oB0Q5Z7QjSTUQWqp1SvuW3wwvwh1QX5ghwolQejv6rsD24GEH0FxZ/F8NHRvzqfwWD/LD4h1ENmZeZa2F1j7MKUkJNxNB8qk4kf/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656072; c=relaxed/simple;
	bh=YgplqJaePBjwvXqqZWH7zHwSape8rm2sGTBLVJYz2Do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QTPrm+GYXRQ0sIv74aVp/wFLnWKE3f/frLC8BjinwUPMOBLCtBYn34n+vCormegoXjvV1M8MPq1vjbUexSkZioUF04CcNDbSQWO9IemDiBc2kXZ/o3bSbOPEsu22sE7MYOa06OxnRdybP2jlO4St/DdSxoFOMN8SM5SygYVVncg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uwSpy/k0; arc=fail smtp.client-ip=40.107.159.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uwSpy/k0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXKfhzo/jWGnZrkb9f1z1U0HLSluuxLMpSZupXQDwJqlVUknLh8nhQ82bOksnqhD6o6MafFxYp1EwrUa4c8jtgKxDXtUpCU0U7Zp1o3mVLYi3Z8Y6GNxpAAUTCxxoeYKaMMC4jnqlGc5u83Kw6Qw7PV/+05unjlt7JUCdUSx1RmyBBv4/7QRvNh9VGouNYcFIcZwVHdQ9wVWCvUCACsWHwO7K/nZOiVrBRvj95eKMM3vMamrRbZiEkzWd+EIayLXQ0zgFoDZJdXv21b5dt8msRY9L5aAv9/QHVNRMo8N2MqUehXo238AYwtfos91g86QjP4hChmzdrmNlFrVV7d0/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlKtVbEo8CrHBPyP19LQtfwbfEJyn5cU5UMO100x7Vk=;
 b=c7VpAa1nnX+lP44zrhLAr/Vq4mHX7gwCpNzi9EUaNRJS/vKMCa45ltAssiTcj9RwvvaUcv3oQf3TluiaXpItieNbzDHrMjFqL/2u46iXlna/+vcGOxnMWn9gMFXbBQizlIqvsMJqcO3MgTU5/q1DyIQGJDrSPf72YnLpR+x1RDvIkvxSIQRFcC1ipFIpzMSjlPRybXSCxZRqn7w8qddjZUe7eNXiAEfO4fxmxw6cLQZR/ILi7Z920Y9dOBRQI12OEEQ1jk58CcyciCqO5rGa6lh1k7Ul2AemIS0vKpjOKUw0TT7KU9PvtS8BfQ8KJcpjI2L+SYe4HWMb57+298AHtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlKtVbEo8CrHBPyP19LQtfwbfEJyn5cU5UMO100x7Vk=;
 b=uwSpy/k0Lwhcqg2CqPkxHjs6A9Jb3zTuPG7nS/EDIQ+U3+LXOvDIroSi9L17jugMlj8mEnrj+wFDqX6Ka2+k1ikTGJA5jlI1uok55b8DoSD6W6HiOsBg1170r5tnjYLCSNIEQuH3KtWtjqrhEAh2neH8cJFTW2UpK4MC52wYJTza7bhAnRhVEh36y1MeAxvBeDuHVSYErrN5nG181MKFe1gjv5zxgKtlizgEtPvabHMrnvC3mbiNHODMGd2FjfWkjfvSfO+DZQfEoAOUhO0CkRNArUH2whBHlQhPRsYJRS6d+AhxcpsF6iPxzLf8876Vl2U+qz++gaCMx/pDYQjpRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB6968.eurprd04.prod.outlook.com (2603:10a6:20b:dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Thu, 17 Sep
 2026 14:41:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 14:41:02 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx95: Drop unsupported opp-hz-real in OPP tables
Date: Thu, 17 Sep 2026 10:40:52 -0400
Message-ID: <178965604416.825098.5035711520491860982.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915072308.64047-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260915072308.64047-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: 321c84d5-b7e5-4003-ab61-08df14c9b24b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|19092799006|366016|376014|18002099003|22082099003|921020|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	vmp2fV7LAbDJ/R8T/LwjX7E5LNQrjpSMqqIDI7a0+uLYO9YeUWv/4pQ7nf2MsRlbiqKW2zGwg3eOf0FtZzkOWN9mr1DITcKGgoKA5Jkcj9oHBfBw9H5hGcOeOoUcV1+meMnl+uz7IEFHR5NUpdzetbzir535N+GMk5YMQu+qiMW7U6ZNvUH3VwwmXADT1dUYBbzLpAoO6lyYuI3Ta8MuDs7syJap+I4NtMZQOSdcZoD3A/DMVGmsjWkcW38K/MgbfaP2vWbFECocHY0lQTStdDMigVVPjzGi/Z+n0cPKMfMCo5I5DLfObSWg92HqvrBubHYLe8g+oIix7oc2e6HGp5pph86BaD0ps4SpNdj+eCpAU3h3UboWNgwTTDGBja8MOVOnzPZ61+q9JjTEfxQOeIefQjwdRJfBtgISPyKhXPKYctrFSA65XlhzDlCRxR+Pg9DNIiVHG6qYcA8pMnM/H8lGDfBbvVpudw8uwTKmfsCrKhlZ7Q+2ueOdlx0Eh6TJvZp5Ll6Z2Aa8XshCINBp9mQmpcQp7Mh75vB8sQ8/+Q1g8dNAjNdJpfSIgfRiaXIWUvU9BXVqpHC3p3swtKjEwBZfju5r4OTOUW+x9xXhEZptf+YqMBSvX85NyM2MNT37V5ltQ1OM8tjKtDMNG5Ucn+YO2k1E5wvO4NJH2gGkg6SRhJtakRUEbttF49w6PcC/WEKv6AhnFUQuWY3JQFXpiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(19092799006)(366016)(376014)(18002099003)(22082099003)(921020)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ymg5c3pFNHlkZERaVytGb0I5WTZMZXBzUnA1NjcxSzRGZUtLNkJEdzZZWHMz?=
 =?utf-8?B?RDdLUW5oZWE2Z0JlTnE3RldMakpZaHF6K2hvSlU4KzNqNDBUSjJ5d3kvc01F?=
 =?utf-8?B?MWtZU3FWSFVTVEVCZnBLa0lMSjNsL2JwWjg0bEVWRmZZK3ZaT0laMFhKNUlW?=
 =?utf-8?B?QkJ0Q3FDbzJFak44ZEEwMnlGQndkYlg1RCtlRHd1dWQvKzZTWHZXRkh1TkFp?=
 =?utf-8?B?d3FQc2d3Qno1OE50V3AwOS9oekNhMTg3RzJyMnQ0SEJwYkFmV3prS2c0UHk2?=
 =?utf-8?B?UFpaSkdPNGNLS0ZaMzAybkxMNmxieXBjQWE0Q0c1N0F6TDdJUEFRNU0waURs?=
 =?utf-8?B?d0lqWlByQWN1S1ZGanNvZ3VrcDk5UHN1TndJTWo3ZHc0NW42R3ZZT1JPNFAx?=
 =?utf-8?B?WG5pK1JSelJPVDF0WHRKR1BsVUZIRjFCM2tnQ3NYb1Nid2x5V2FhN1RCL29n?=
 =?utf-8?B?S0FrUzVjVFNyV0tNRE9YTDUzNXlYaFlJRVZUM01ydWw5UkRxaU1TeFBLd0dX?=
 =?utf-8?B?Y3lkM2IzdW5WT1g2dnRScWprTjZHdVFYZVhkaUhDMlpMMWlPbVIwYWhjRFpT?=
 =?utf-8?B?ajNqNmJUcFd3cm9yL2I0WHNvdldWeC9tUG50LzZGb1FqTXhvbjBHMUN1c1Iv?=
 =?utf-8?B?dU9MelE1eG5NcEg2OSt5NlVOM2VPd2pvN2toaWNaVUVDN1pCOE15WTBEVE5P?=
 =?utf-8?B?cTJoN28yaE5WZjVRNlUwcXBwOEtsRDRKNmFhOTY3UklaZDFmWFl5UGdmWTRF?=
 =?utf-8?B?T1I2NkUwcWlnRTJMTVpEcmJaZy90TU5TWWJOQTFsLzVhWW43a0JsMzFTWjdR?=
 =?utf-8?B?RTZTWWpNL0piY0xicU9RbFNBRnhJNnZIbWt1YVhycTRxYjZweGM5Q1FRem12?=
 =?utf-8?B?Y1hLZE1KdDM3eTgydjQxdElDaHU5OGc5dktxTDRuWHJkWkdxN0hFVmN6NkM1?=
 =?utf-8?B?cE0zeEgyc1ljc2hSdWV2Ty91bGNWOFF6NHJWc3RmTGhmcUR3QWdPRm9lZ1Vx?=
 =?utf-8?B?SjlCOUNTbWErYzBndkJjUDdxcDFlOTJlaGNwcDFHNUpkUGg1aVg3WnNuMTVK?=
 =?utf-8?B?WjE0UnFiaDFUZndMOEE1RS9rVUxRUDJLZGxIQ1BPVjVsREV4U1I2Q29OdVV1?=
 =?utf-8?B?T2JCN2RISFlickJYdWdRcmoydWFLRERiVng0a1RONjJVVE1yR3cwTW1ESGUr?=
 =?utf-8?B?M2trUGk2SVJhU0NUUDNWQXBTc2Zrc2xBTjVWVnVsRXQ4YmkxZm9ubFBuc2Zw?=
 =?utf-8?B?WkRvM0VWTWVPZkNKeGFHOFkzSm92QUgvbFFZWTJBM25pNnFFZm12MnhpdlFp?=
 =?utf-8?B?ZFhjMCtWaXFkQ3UxbFZtRDR6Vk56VUVlZWJEODd0TjRWWHBtL1pTQlRhTGdY?=
 =?utf-8?B?RjJ1cHBMejBzeU1FZHJ1Y3M1RlpuZDRsTW1rSGtlMUxSY09mZ3ArNlRybTU0?=
 =?utf-8?B?Q0JpbEQ2eVJRbHFJQnBsdFZtK0toaE4xNms0WGk1MUw0eHBmQnhJR2M2NlVY?=
 =?utf-8?B?UEcycWUxOE83UXl5dDdWTnFEM3d0R2REeEZIbStPdmNXQVUxR2Z6TkczZDNi?=
 =?utf-8?B?cU9HMnphYzBuSWJ0TDFJRnBZZjVFNk0xb3dXb1hkL0wrM0pNcmZSYUljVmhj?=
 =?utf-8?B?NGFodWRJWlNmd0pHb1R6YTVMZEZOdUF2TW9MdUtWVWVKSUJHOHVPRlpuVFFO?=
 =?utf-8?B?UFprZm9LRDNLdFdGUHc4TU5QUU90U3oxaFlPRS9VNVA2SzY4WHlWWS8zZjBi?=
 =?utf-8?B?cmROSW5uM3NtZ3ZHSjYxZXpkSmx0WmpWdFJGN0lWak1LZUFxMHRZK1JVdGVV?=
 =?utf-8?B?Ykp0QStxcXp3RnhtQUxPUHc3T0hrL0hCZWFhVk5rTGpBSjgwVDhKdWZueTk3?=
 =?utf-8?B?Z204bzBBZTdoQmZybXNKTGZ3cklaQ3JCbitpT2ZBUm42QXJ0RDF2aU1GQTRq?=
 =?utf-8?B?d1Y5b3pwMk5aL2hGL1d3bnRxcERodmFacXdxM1lHOGQ3NWZzSUV4N25wZDRl?=
 =?utf-8?B?amxmOWlRejkvWld6WTV4OUFGc3FaMTBWUWFFRTAwVktRSVZ0cmZtWUxCakln?=
 =?utf-8?B?SVI4WTJ3anlrYUp1ZmxzOCs4Uk4xK0ZNR3lYeExJTGxKWjdxK1IwcnM4T1ZR?=
 =?utf-8?B?cTFKc3d2SlRTdmRiVitQZzFnU1g5NWdsZk5oMTRJZFM0RCtvZ2w1bk8zeUlM?=
 =?utf-8?B?QXVqd2VZRWM0TWt0S1MyRmlQTUhGY3ZaZEh2UVFLakF5aVRZOUtlNU9VeFhj?=
 =?utf-8?B?THFyMzNieTdGcm14dUFWTGhickk0bGpHZXJTZVM1MHh2dkEyTy8rVFdwdFFD?=
 =?utf-8?B?d0tHMzN1T0ZieExTS1BvVFVISm9aM0sxcnczZis5U3A5S2lMMGpqSzNuR0Qx?=
 =?utf-8?Q?qfrnVK0nN6SzYgyujwG6zZIMVMccZYRrG2kqa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 321c84d5-b7e5-4003-ab61-08df14c9b24b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 14:41:02.3702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2K52nrWolG3Jb/jtDk2v2A5EeqklW4R8XhNSUFBv9kka/My/8XoM5/9liyr0wXmOg73YWK850roaPfk2bI3h2hF2NgAYWUfg2AZOr1AQIdNlanMtA+JDtx8U5SEXULt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6968

From: Frank Li <Frank.Li@nxp.com>


On Tue, 15 Sep 2026 09:23:09 +0200, Krzysztof Kozlowski wrote:
> There is no "opp-hz-real" property at all defined in the bindings and
> new DTS is not allowed to bring undocumented properties.  Fix dtbs_check
> warnings like:
> 
>   imx95-15x15-evk-pcie0-ep.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx95: Drop unsupported opp-hz-real in OPP tables
      commit: 478f68c644732750f8386e4de7c909c5ffb26ab2

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
