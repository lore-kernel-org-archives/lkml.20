Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011016.outbound.protection.outlook.com [40.107.130.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCAE52ED23;
	Wed, 23 Sep 2026 20:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195890; cv=fail; b=lLtbIP/pbfzE4YmElEK9YyMG5I+I8HWsdmmSmWjBgiFf7rsjCQBVJC8FLmG6+GA9NPJzSoRAa6yNEGUyzlM4r5HxgJs/BGZ9w2FsOWA2gSD8Dy+s6QV8waZjXmN21i5GFTTFZaWQR7PMNI6Q/XTo1Xz15PKcNgB3wWidw+8WUgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195890; c=relaxed/simple;
	bh=c1xeEh5fEvNJEDuGUiEHr6fLAJ2yO8bBssYbHdsxcG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DCSZVXtfq9/fUjk3rQoiUpxmOHdqfe4dkd+FobTKnKQlnHeZ80o/9PBFfi3HUsaIEoQsbW23jGIyEB0jmUOC5JXhg/dEhZni+6TfeWBh2EbPSxAgqmi4fhCVv6eBFHpKfqLDrrDfLzR07MsgOGNGJ/96n9eX8ntw+dZciOfT39w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fsuxkPgm; arc=fail smtp.client-ip=40.107.130.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fsuxkPgm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYMpreGJf0bGn4AfwZGMF7DyF7qiw6ZhgXzj98A6WXA3uq9D6j2yepOcwLCvAEKwnL7Xhotc0uWRhNu7NZ4LuQNwlzWPuOI3JgnZK+FuX4dBMaZDowA+/R7IkVEDbWnYfR7kIb//p67/FJt5LIJp3iAEoguDvhdYN2ix7+zLDzc0n3HS/b0vOA3iW7SERenO4JciHtk3BDiJrmAHE9gAp1vDaSzB2bu3amO6dolDI1JB3PmtjGNw1GYGNLTuaexpbKYQ5iRqUncVX6DOB+VsEAyUdpFkjpAH8M1aKW6YMODbeX1jNqubLP5h99HYx04PX1JCcsokFIujw99I4j11XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nFBpexLejNaK+rsHO5eMTZYnY5BD8no9Z/Nrg3DkfY=;
 b=ygzEq+XIssH8wTyM4DYfOm0Jpeor8VtX2tU6hSt9DmZKhUMK1HVWNNM+Bfd/OmXDOcNoK96EUw2i4q2GgOTUQapcEg7W+uS6V+MnUc3B9kTugXpjcpykHTSACyJqS8mBL9iHOVesgtl8M7YUScLEnTkXaFx8GdgnZMUq4OEpKuuSmd+3SIZ/+5SF/sMyuffM6yysS4iKDl8NxA4AGMa/IOKnzzfL20mDTL3fQG66tar6p8E4ggeyYeVKCgCquInwLFAmCNkb+UZEfu+eLnzecOme8zEf9GQEtLdcE1kXC9S4knj2DyqUKfS46vb6g5hGu6WMIpjpSJuAU5lWnA8MDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nFBpexLejNaK+rsHO5eMTZYnY5BD8no9Z/Nrg3DkfY=;
 b=fsuxkPgmBL00QX0Bt7QkAlh/oYpE+cTDYufnHxy+4JlNUW9wADCnVLUAC2ch+Mnh/QrkDFCRbuZYcyOrydk/0POGBDNa7VAv/lNJUSsPuIKoR2C5L5/oCRXpfKq+FN8WsfKf14xtljeTG0P/PgDRsRJoxznlQDIYOzUVnc6WcitA80e1292kzCW6TcsW1fv9k1+XFHSbDYiNlCpSzS8femFM8DrD3SyTU9JZaS6y/q+qebFEwU6qyeT14PkuDxYbrckUXfU2GoH+WyL1unqQjwnuJvmzieAvr4fa5eTuObIKn/Rd2GHzx/1VTT6OxUts5TlBMJOvwqEoAO7gBymM6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB9877.eurprd04.prod.outlook.com (2603:10a6:150:113::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 20:38:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 20:38:05 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] arm64: dts: freescale: Add Toradex OSM iMX95
Date: Wed, 23 Sep 2026 16:37:58 -0400
Message-ID: <179019586937.3763388.2864908684573790285.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917102011.69071-1-francesco@dolcini.it>
References: <20260917102011.69071-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB9877:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f8245fd-9b57-42ee-74b5-08df19b29224
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|376014|7416014|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RpsRbj1U1Lo5jU+bjg2DsjdTU9cFqb1AUQ5a5vMJjgQ+3Q8ulAeSmYebxZQWa6hTGPjmBLkTQ9r81q1IQpRueVCrmgFQ8EL0SqYzVVHgbuQSxrKksaUkniHysfxwioyxp3uw3cdpl7xd49LmfJ5qaYMOTbQiO201fAASMuFoCijtJNaWT++nobXs7hK6qTDIPC6FsHgC4rtpU4VwUSQfpVpUftUX28oYzOx79VSpSAn1iBQ4UaHqez57IC/w8pFOxeqyG301yZ535a/GPHYNYtjd6ob24dfocS8eLAwK9dL+hPGL33Z4V7r8G4fEf1v7ORliJ4w8UPFENOdCx+Qi4ahWCTCVIjKWQtfSIJAYJkR78gvVT7sjexi7QK13f2ud41x7zhv1mduiDYCf6dkNqgQXnVKjoIKNPZMU9a2e8veWOAZ7BCNh9/uzztSt+KDz8mCm36/T1jSAceYhPB5V1BQNA9OfOg/yNUd992WmEKqYh9RW5qVV7IL5mrvJthc/NeNkGONcAbuZktf128zcVkcJggB9TMwSEAeR/mGl59uh55cKZo7lZuMmTaWG9u4qPIVlPuof53jC8/MyJ4XUQMTB/3R99MOmom8uKq//FlgrmgojUS/ns0ibYYjDbzgI2s8mk9ALp0LhP3BhpB9aYv9aAa0NoC0Ggsec84tXOWY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(376014)(7416014)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnhlRzA0SDN1MHdzZkFhTFVKaWVNcGtEZnd2NU82WWFZNjFBRmRQajA5QXdX?=
 =?utf-8?B?ZDZYL05XZElva3ZtOXFBWEgvS1o3Sk54SDlSZThPOXVvaXIzb2w2N0FJeXdO?=
 =?utf-8?B?c3pIazNmVmZObkVPZFNwQlY5dkxzUWR6bFJ0dXV4dU5yQ0RYUlNYY0hneTZZ?=
 =?utf-8?B?WXRqSFFINUFOY1BteVhnY2FsSkxQZSs0WnY4RUZTVXluY2wvV3V5NEpIemNR?=
 =?utf-8?B?TzVpYVZCNk5UZVFIbnFJOHQvd2N0VmpKQkp0VTRKa2xiN2FFR2QyYVpuZXFz?=
 =?utf-8?B?Rk82UHpFaG1UNmlVeUlCUmFmVEJpcTQ0ZVU1T2RuQzdSQ1pFdWg3NXJzbDJW?=
 =?utf-8?B?dWdWVno3ak1SS1B2OG43UFpEdHY4TDE1NWdENzVXUjdOeUptMXpCNDdlcC83?=
 =?utf-8?B?NnUwREdSZS9FUkU2RGp3Q293bE44VWFYYityRW56Vmp3TGJQMjludHdNUGhr?=
 =?utf-8?B?Q3BoWHlEbFNZblJGS0JRZ3I2RGxXbjEwQWpXdzVHUFphYVBORDlXNThxK0kz?=
 =?utf-8?B?bURmRUVSNnVUMVJjZ0E4aEFtM0lWWkphUlF0NTNOcnRENmJkd3BpMU9pTzZh?=
 =?utf-8?B?eXVmQlprNHVwWm84NlAxdDd4a1JqTjI3RnV1bDY3T2VHOW1rZDFsR1FvOEdo?=
 =?utf-8?B?NDlPN3ZFQmFueCtkTlJZcUh1VjZ5dkh0RXhLUjlOODRIbkZmM0lMUEZuYndj?=
 =?utf-8?B?SU9YWGg3MEtHUUdTTnpNNm95Rmx3WDJkaU9jalQ0eHJrYTEyNkxCYllsK1ZI?=
 =?utf-8?B?aXBuUTZvYkRzMHA0TmU1RzNpK3ZCQkVmY0tERzk0ZVZVTU5wYm8rdjRSZFI2?=
 =?utf-8?B?MFJPdzc3SW00S1NMYVQwSzQrU211NG5YSW5MVTlJUmVUdFpUVkRHY3U5QmpW?=
 =?utf-8?B?OU03MFBxZ3RPVEovSi9Hb3lybzYzWVRpck9mdjJzK2haS2lMTlJ3bWQ2eGhK?=
 =?utf-8?B?WUNFdXhUZVlkNU9TazNSWkpsbS9jRE9EUHh2WlZQUDFFaTRSUXh1NGMzUTZN?=
 =?utf-8?B?VG11d0pxSEIvOUVkQTFwbTNIdFVwbHpSWlJwdFZaZ0I4Q0w1YVV2S1F4dnhW?=
 =?utf-8?B?V0pWRERIM3FsV3p5QkZGcFdUTjFaMWlSdzIvTGx6TkdYQXdLbWZNYWlqYXZB?=
 =?utf-8?B?eVZVcm5Sd09pemUzci9iUS8xYUtscCtHdFJsVlp3b1dQR1B5a1dnZzU1L25O?=
 =?utf-8?B?TUMyeFRVT3VGTTZvcUVlWUt6SXNaRE4zWlJkdnlzbHdWUlYyMkR5aVVMckNq?=
 =?utf-8?B?dkN4V2l3NERaOFIzaTBJU3o3T2lwRXphcG4xU21wYlkwNEJqSDNtczdLRXgy?=
 =?utf-8?B?MTk5Z3FQdEEvRWRjZ2p4ZWZpMW1jRTkzbW1wQ2xmczkvQzIvaEZCZVRhM0Y2?=
 =?utf-8?B?bDEwcjFveHlEZFIvWDRWaUVnMXZxMlNqQ2dML1NYajNwbTlnZ2V0ak9UWDJj?=
 =?utf-8?B?OEViSU90ckFJa3NqMkNsWForYjlDdUF2dVJ0cFZ4S2Y0YXRXOHY0ejJLWldW?=
 =?utf-8?B?ODI4bkg4RUd2amRkbU40Z21ReVVORnNZU3FuNi9rWTI4ZTRQRmYzd2llTkVO?=
 =?utf-8?B?eDMrZlpzQm42UUh0clVRN1ZJRjdEc2d0RkptM3hBYU92RHV4Ym1TaG13Z2Rq?=
 =?utf-8?B?N1NPLy9kenNNNGZDZDZ0NTF1NGQ0MHl6Y21adFlGeERCL05lSG9jWEhtVHVa?=
 =?utf-8?B?amJSNkRsV1ptdzlCREs1R3BmQmFiN3FlV1NsOHgvUlh2ODhnOVZTeU1ERVZr?=
 =?utf-8?B?cllURExkd0p4UHZuSVZnaFFwWUpkTUVDdVdWcnlPMUYzbnE2czRVSHBXakJr?=
 =?utf-8?B?MU8vKzBselgvaUdGZEJXazFKOGkvai9ybHdqZ2hzQ1d0bzdZWW1yVm9QUmZj?=
 =?utf-8?B?VEpOMkltR205enhkVWlKbUJCR1cwTk9yRExiRDB5aitJMElENUxqc0U1SEdW?=
 =?utf-8?B?KzNINTJoUjU1eTAxbm9jcEhNWVYrTyt5Mi9sSVFIaDNxWk5XbUxCOWhKNkxR?=
 =?utf-8?B?MEFEa3dNNlJJdGp5VG1qdk5aNEpQZSt4RjIvbUg3Z1hmUkQvYS9HQ3oydVgy?=
 =?utf-8?B?cThSNVFGRkxSZW4yTFh2VmxzZml4S1dEaEhvdDhjLzJTYm9xRG5WR1NBMHps?=
 =?utf-8?B?SmpIRU1vcjZRbWMzSkZTYlFXc0FhUWpDS0xlcDVwTmZoTXM3ZDlIcXhYZ2NZ?=
 =?utf-8?B?V014YTN4eFp5VVlkRWRGVFBEVm5SVUU0aXVUb2RkU3QvTWc5VmEwbmpjL0xJ?=
 =?utf-8?B?NHQwVkd4VzVoR3dzY2hBeWZMK2RlMSt6Tno3bnVKNHN1dWNKQlFOZCtPUFF5?=
 =?utf-8?B?U0hRVlc5WEtsZnA0cU4xV2l3UHB3TnhydXZPTzRnTnh4ek8rb1F6Z2RaTUF0?=
 =?utf-8?Q?Jd2C0O+hwDyxtZ/LjsbPuxfHbvlJ5BxGCUHu1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8245fd-9b57-42ee-74b5-08df19b29224
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:38:05.8338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IkOANqwyiVFN4xWkKd6tPAIlH80fNmr7ap8CfglLEXcLtnl63VLlybrGKAJkGzoDdvmDmuVvudYzxD8zfj1R7gjI7z51TFYE9Ip2lhYYSze5W/jDr2eWgkZimtY910KE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9877

From: Frank Li <Frank.Li@nxp.com>


On Thu, 17 Sep 2026 12:20:07 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This patch series adds support for the Toradex OSM iMX95 SoM and its OSM
> Development Board.
> 
> The Toradex OSM iMX95 is a SoM compliant with the OSM V1.2 specification
> from SGET, based on the NXP i.MX95 SoC and available in Size L
> (45x45 mm).
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: fsl: Add Toradex OSM iMX95
      commit: 4fed69596d776c1361150839acb9e089aaa0116e
[2/2] arm64: dts: freescale: Add Toradex OSM iMX95
      commit: 7cb2afdcf226b76134db909e411b915f9fb28852

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
