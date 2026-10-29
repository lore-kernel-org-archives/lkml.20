Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793267669;
	b=EJT3knwtOYEz3uJ9g+JFJsvwmh/dbY6RAd2am40L402gSBsKGpODPU6M4aA1Y0vH+G3k
	 xRwabWgcA4MpBXV+I9686pJRQm1OimQX1Ef0FsSjkd2X8yzKdQWK9piAbESBVybKerBgW
	 UpgprL54OKvYJX+QRzgrfbo0mxDVR7QqhLV8b75C7ZVfhbwsYfV3k3nDlS6mkimAypfJf
	 AROBrynbE1DNz+ahFHRacj5X/aC8cZqDohKW+irPciPLChm3i4T+AA/0b+582q/yzlhGd
	 RownsMhOFBN76PFSwowgDZpeK/ZNep2upGPUfgjnAia92Q72hKlGK6/183nxjhAJkbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267669;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=eEL3wboi4iG5htAvVkp/8DL3ChDa89CZfWMBboscGUA=;
	b=1C/EyMFG/K0/UMWCFWQXDtChWGOximtgD1LwkNCppfsgPLJ1RmNx+jUVP2WnsJPVsZ5G
	 ft+FIQlarSMd5yY4KYjDdj63QZ4ulDSYMRpaQQfip1TzHSZI7gnWuzazCIbJa09ns8Bby
	 jmO9j1x0dNMXsFWi+F10sm7EOi0O9kGN0CHpl8BLBbKU6E85kOmOcYciMmjNvX9NPKII8
	 NphpEkYITbt30M3kpcCfbw+FkRduPefqtI3ljNRXzB19FLXiVXwWX6kqeW3QRNiRG4KeU
	 MiwynTxA4eY2dSKzS8qXKCsH+Auk0AG/x8bBMiys/JdQpM7bVYlAL3XVYMnVJeZNA5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=CY1Y0hMC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.20
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011020.outbound.protection.outlook.com [40.107.74.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26547606A31A;
	Thu, 29 Oct 2026 09:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26547606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=CY1Y0hMC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AU5ZdyIbs80VNYwy3qQ4Paa4fHH/K4yhQjCmwc/Kn1FAb9HPnSecaglXPrunmlbZ4xrbuKrBLTSjn7inmtTqg8O4eKT1CLXG4s2qPHVx/Wi1qN5Rj9wrYuwDExCCJ47Gj9XQxXLLgVbD6/Eln9zADGqNN/6g4+s4R1n+7rnX39sczMLIjOW+MMrZj4vmeKljkoRGY7jR9vNOXMv7/TRUtcFeqMfPcA4u3qCfNlTax7AFJwOlbwMLH3syi7BQNmnYrMWO7NEGUEWlN8Vo15/WgULeaxi0OO0Cnz+NIpq037OH3skhjp2ntg1KA2iZzGm5W+9D7pE4AdhkHRkEJ2ZDmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEL3wboi4iG5htAvVkp/8DL3ChDa89CZfWMBboscGUA=;
 b=FQcIAM1MmJ38IAHVmGlR9WeyV0OpQjmWjEtfHhNcPILBOmH5nlThMBdUPYADQ2NSEd23VqgkkOIT0bkFLef7Nxyao3o/cxUsYFjkrQk6oq/6MqUPxlTRg5vtotZozniE+MIDNWGFGBaVPp/BaxPucr1y/wg5iC5YULGeyoOZlaOH71DTqyopwUV6oYES6jhV4N49joVZjo324r9lPTLZzANIvCsCjzCGF4cu9KClhtzDuZ55ixXLGG6PPU4jnHs5M1vTptIR6D208QEqzbdMKvfYbpv3c9Ch7BfWrMsov51olphOMh2eE43cR5eGVREi4OseNIAWx4SGP5FN/9y0Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEL3wboi4iG5htAvVkp/8DL3ChDa89CZfWMBboscGUA=;
 b=CY1Y0hMCKYs54VW7sGLtDHAnYJ0z4yoNmplny3QfiR0w7JgEZgqoov7bMdiPPhM/9Lokmd9AiG36gE76DOYfCGVJgLzHrYkMY3KiSVRp1sKZKyqSZKTthnfcwfOxSOKxgYw8egR4Zg+rxykZC3/hrwEOnJwLqUhu4iYlV6QVgUw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15118.jpnprd01.prod.outlook.com
 (2603:1096:405:1a1::11) by OSZPR01MB6955.jpnprd01.prod.outlook.com
 (2603:1096:604:136::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 09:54:25 +0000
Received: from TYYPR01MB15118.jpnprd01.prod.outlook.com
 ([fe80::1116:d56:8164:63b4]) by TYYPR01MB15118.jpnprd01.prod.outlook.com
 ([fe80::1116:d56:8164:63b4%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 09:54:25 +0000
Message-ID: <db1ad309-c02e-4616-8486-ffa967207d44@renesas.com>
Date: Thu, 29 Oct 2026 09:54:14 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i3c: renesas,i3c: Document analog noise
 filter control
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-b7ad60cde650@renesas.com>
 <ate-aNmqsyXCAIX8@lizhi-Precision-Tower-5810>
 <64f604a7-7e70-4a0d-8164-28c5d7b1e509@renesas.com>
 <at-5E3b_wKcnuJ9Z@lizhi-Precision-Tower-5810>
 <f4b8a714-dab8-45d4-b98f-717d010806de@renesas.com>
 <auC06gqa5lGtKPjj@SMW015318>
 <7dea4022-20d8-493b-b560-ee635deb7cbc@renesas.com>
 <auIK38HPyv7PmDJF@SMW015318>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
In-Reply-To: <auIK38HPyv7PmDJF@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::17) To TYYPR01MB15118.jpnprd01.prod.outlook.com
 (2603:1096:405:1a1::11)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15118:EE_|OSZPR01MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: ea2a3f03-7c5c-4796-f146-08df35a29d61
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|261028144727099003|4143699003|56012099006|11063799006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261026140227099003|10067099003|261026121527099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	kTyzRKZnAbt/nnUTSUtAUWFRBtrDqc943nJmlCTirGr9lyXueKYuwHQmVDLQ+SPUWTmRI7arYNyGMfo5gaB0dbsTI/MNkQi18s9gET8To59DO3wAiXXOng8EPysPTtHn37ehrzFNTE3v70RI+o3Nl9lT7THPqyD7qFajfpoCs+k7+9czSdLVCICySe1DJrwaIZLP/d+BLLxhWeaJDPJKDWbuft/yI+R9aZ8MgnuJVvWAdO3I5GwBduWmSfB84sk+fmO2nWxhT/hrBnP+Z66MHacteqRc5DJ7qVEXpG9wc8AeJdPbJa52MVWmsqQfGDu0vI9v5lwsKbkKcE9j6Ceo+1DdsEedMfd30taQq4OtrqggAKjndwVDxeN26vkZwooOy4UHZr3BAH/jZUc+Tce6uPOOYxX6FFr0+G2exLhfC1WYukjck42yQ1INfulRBrO8HuLAI4GI0Ol9XBR3MAbYuYmG7J1GzIvZqKn0RJz4827PHWt+kWfZ4BTr85KQSueOJmy7PQvU+pUmk7V+Bm+p//YHT9KzJ4uaSTFVLb7umPz/RfE20Gc2cR8u+zAUcSdskSUIL9IKw90Uwmwq0ep/20htlCJHGnGHBzmPEH+TzemKELvce9WOpElxnNxQ89VxH/5HsVj7L8srz5Dq4DagYePGNPIJOQ/5xbPlFIxdQKw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(261028144727099003)(4143699003)(56012099006)(11063799006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(10067099003)(261026121527099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1dzRVEwTzhFWWt1NXNzR2QvT1NneDYxbWxYdU5QL3IzckxqVXNpZW95UjZO?=
 =?utf-8?B?M3FaSkVDMkpFMU1uY3l4cnUrV0J2WjEwcWx6a2RLWlIyOGo2dGxLb21JK3Vn?=
 =?utf-8?B?RFNvNTdaTXN0T1BCc2J1NmR5cnczMTJJbFgrOUUrS05mdmhHWll2U0xEYzE4?=
 =?utf-8?B?OWZ1N0xVRHhBSjdmZGhreFdPUCthUDhId090TGRDcWYyL1lYeFpEWFdzUy8y?=
 =?utf-8?B?T3BuUEN5aVhpOGRUelJaSGpkQmFJRWsyTFZiaWRJWlRvSGNHcXpROFhUby96?=
 =?utf-8?B?bjZEMWwxMlFpUk5FM0pjTEd0dnNYR1Aza21rcmdXYzVHcXduaExZTDRmRHdG?=
 =?utf-8?B?bEtiL25xRU5ndEtJRE9Rb09uVENxbUJHSEZ0TW1CMU1RZGUyY0t4WnJHU2hy?=
 =?utf-8?B?dzhORkdSaCtiQ3BwOStZZ1M1KzVNVy9lVmNQYzcrR1h0MWs1TFpQTjg2cFRq?=
 =?utf-8?B?VWFpS1czTFhjNloyOHNlQy9kY0NwOXZBSDU2ZVNaalpIUW8yeFlaKzlkcVNs?=
 =?utf-8?B?V2JYVmhWZ3dJM2lwVFhYR3A1ZW9ZdVlDRlpTZG9NaVJtYmZnSXlVKzVvWXNn?=
 =?utf-8?B?eUxwSVpudWpUOTlrUk05bGZrQVFkNFNWRjlVdWtIOG1rdkMvQXJSaG5qempi?=
 =?utf-8?B?bHJxK2NUcWpES2UwL2FRQlgyNjFiY0JFcGppL2VQdDdlNnlMSFN0N0FzeGFq?=
 =?utf-8?B?aVN6bzNKeVF3d0ZtSW80Z24ycExMc3FidlN2OEJhRXBUQWJaZUl0VGpJdm9K?=
 =?utf-8?B?UHZQM2lkc0xwZDB4NE9xU1BDbTg0cVFVUVhGUTdGYklXR1VwckVrQkNBL1Jm?=
 =?utf-8?B?czc4alNvcVNuOTR0WitQNHUyclU5Nk1ZRzRyV2lacElZU1NGVUpZcnRscStS?=
 =?utf-8?B?ckQ3dDB5dnV4UFpybFNlb3RzRkg5KzJSMU12eExGTHBscmVqZ1RtYWUrYUtJ?=
 =?utf-8?B?dVlUTnF1YlM1SE9TSzNlT3BEd3BmbHY5Ui9tZnZlOC9BbWp2UFpvOThUY083?=
 =?utf-8?B?SDFPMnpxYmRYUGZHZXFkcmtLSjNtOEhRa3BGMkFWS1FhUjdpRlJub0xHYUVE?=
 =?utf-8?B?Z3FCb0pvRS80d0trRDF4V0d1Ny9pUGM2bjBVQ0NDRjlSeWdpd2dMYmlWZWIz?=
 =?utf-8?B?SHdMMjNac0lnQUpaeVNZckI2MXhpR2x4OVFULzZDdWxCc3p5Q252UXNhZU1R?=
 =?utf-8?B?S0t2VnRzbmNhMEs5TGJuVHRzMDlpa0piWnpXUUV2UDJTeWlUaHdlMnAvbjV4?=
 =?utf-8?B?UkFsaTZrTlFiOFNtSGIxUW9UNTFWTDA2aFpFWDdUajczblZFbTdwTU1ocXpX?=
 =?utf-8?B?NFZWQ3MrMGQ1dG1DNWNlSWJ1TWg5S2FxTWhsMHFPaWZ4eVB5MlhsYWZqZEJt?=
 =?utf-8?B?V085SS94b2tjVUdxSlR1NGg4TTgvc21LMDdVM2RQNTd3bnNQL0pUYjNvYnl3?=
 =?utf-8?B?eHNZWFl2TDZJZjBrd0RyeVkwTkRTcStINGl5bldIVUtpMFI1YkovTHI0TlBF?=
 =?utf-8?B?dFhYYjdIY2c1VnZQRm5UVmZ3eC9sY3hBWGpnbm4yTDg1emRYUmtielRIQmJX?=
 =?utf-8?B?REV0YzFnTHB6Y0pESW5YTDRsOGN0eEVoQ01sWlVNWllpanhkUVhRazEyaThz?=
 =?utf-8?B?Q3M1WUlkQVltby9oci9wUFBwTEVHN0t5ZHIrTGpuZnNqL2tmVndiVG51VVc0?=
 =?utf-8?B?R3JxRExXbjlSSDdoRzJwUXFkWlVEYmhTcTRlVFJ0ZkowMElaODZxM2duSmh5?=
 =?utf-8?B?WFhCZVEyUWtOM2NCSnVIM3ZKOVk2THRhZ05HQVFoTE1PcVo3RHYwNkNxdVE0?=
 =?utf-8?B?eEVmZmp5YnM3R2VoS2JOTHhkc3lkeUZxaThQaGIyUnlMSXNJWnk5TWRHdUxL?=
 =?utf-8?B?UHhwcUpBcno2bkRnZTdaNWh6VFRSTHJaa294QlJxeEN2VnBRQlFqU2tBN0RQ?=
 =?utf-8?B?Q0lYdXFrcjVPck1CUVZYT294UFRpTFVEV0laRC9DWU5IZUtsWG02MlAxVS9t?=
 =?utf-8?B?dERPQmZMN2ZDaGpONjEzTkZRTjdEVjczcW9jQkJEWG0zM2xUN1lLMlJSd1VN?=
 =?utf-8?B?SmNwMm1rQkRNM3ZsYXVCcjRCZTlFYVgrM1d4R1orM0tUVHhxc0ZJTnVXcW1r?=
 =?utf-8?B?cm42ZVRLY01yVGFSS1pLb2taUjJ3Y01nU1VTdSswSm5LTFYvMGl2UkxSVytY?=
 =?utf-8?B?YXNOczBPV2F3NWJsQ2FBV2R3dUxwaWRqRC91OVgydnRvUG9MYmZTcjdpQVQw?=
 =?utf-8?B?U1B0NnFMcWkwc0YxTzNoZnV3QkhsQzl2ZlRmaHhRNmhXRTU5YWg4bnZlbmlx?=
 =?utf-8?B?UUJ1dnIxbk0wNUxYZ0VpamtvMWFGVmp6Q2tOZEtxVGhPcUtWemwyZz09?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2a3f03-7c5c-4796-f146-08df35a29d61
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 09:54:25.5193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSjh4GMr8nKA20OKWrZ93leeVKilYz86OqlyNpHENcQEYDwJ5o8bVBiTts1pAwEFQLy1u/8a/CHhF8KuI7u72V9brIdMy+JXRYDmsCiPK2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6955

Hi Frank,

On 10/28/2026 2:46 PM, Frank Li wrote:
> On Wed, Oct 28, 2026 at 11:10:07AM +0000, Diogo Ivo wrote:
>> On 10/27/2026 2:27 PM, Frank Li wrote:
>>> On Tue, Oct 27, 2026 at 10:34:54AM +0000, Diogo Ivo wrote:
>>>> On 10/26/2026 8:33 PM, Frank Li wrote:
>>>>> On Mon, Oct 26, 2026 at 04:21:06PM +0000, Diogo Ivo wrote:
>>>>>> Hi Frank,
>>>>>>
>>>>>> On 10/20/2026 8:18 PM, Frank Li wrote:
>>>>>>> On Tue, Oct 20, 2026 at 10:36:26AM +0100, Diogo Ivo wrote:
>>>>>>>> The analog noise filter for the input terminals (I3C_SDA, I3C_SCL) of
>>>>>>>> the Renesas I3C controller is controlled through the SYS_I3C_CFG
>>>>>>>> register of the system controller. Document the
>>>>>>>> renesas,analog-noise-filter property, which references the system
>>>>>>>> controller together with the offset of the SYS_I3C_CFG register and
>>>>>>>> the state of the filter: 1 enables the filter and 0 bypasses it.
>>>>>>>>
>>>>>>>> The property is optional: device trees not providing it keep the
>>>>>>>> filter at its reset value.
>>>>>>>>
>>>>>>>> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
>>>>>>>> ---
>>>>>>>>      .../devicetree/bindings/i3c/renesas,i3c.yaml          | 19 +++++++++++++++++++
>>>>>>>>      1 file changed, 19 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>>>>>>>> index 08fcea89a015..381807844351 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>>>>>>>> @@ -96,6 +96,25 @@ properties:
>>>>>>>>            - const: presetn
>>>>>>>>            - const: tresetn
>>>>>>>>
>>>>>>>> +  renesas,analog-noise-filter:
>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>>>>
>>>>>>> I don't like this syscon property, look like it is one kind pad propterty.
>>>>>>> Is it possible model as pinctrl?
>>>>>>
>>>>>> On the RZ/G3L and RZ/G3S this filter is not controlled on the pin
>>>>>> controller's address space but in the SYSC address space (hence the
>>>>>> need for the sysc phandle).
>>>>>>
>>>>>> There are a few factors weighing against modeling this as pinctrl.
>>>>>>
>>>>>> The first is that the physical pads used by I3C are multiplexed between it
>>>>>> and for example RIIC3, so we are not filtering the pad but the internal path
>>>>>> of the I3C IP. The pinctrl does indeed have some controls for the pad's
>>>>>> digital filters, that apply to whatever block is multiplexed to the pad.
>>>>>>
>>>>>> Besides this, even if it were moved to pinctrl we would still need the sysc
>>>>>> reference, as the pfc driver would need a way to reference the sysc address
>>>>>> space.
>>>>>
>>>>> System allows multi pinctrl devices. your syscon can work as pinctrl provider
>>>>>
>>>>> pinctrl-0 = <&your nomral pinctrl>, <&syscon i3c ... > ;
>>>>>
>>>>> The key problem is if model is resonable. Syscon is simple, but have not
>>>>> good abstract.
>>>>
>>>> Doing this in pinctrl is feasible, especially since the pinctrl driver on
>>>> G3L already has a reference to syscon for clone channels. The question
>>>> really is if this is what makes the most sense, as again we are not really
>>>> controlling an external pin but something inside the IP
>>>> block,
>>>
>>> I don't think so. Generally, PAD some property, like pull up/down, driver
>>> strength, some include glitch filter (capacitor or schmitter trigger),
>>>
>>> 'renesas,analog-noise-filter' like adjust some capacitor at PAD, only
>>> controler signal (register) is not in your pinctrl region.
>>>
>>> There are not analog-noise in side SOC's digtial part (Or we can't care it).
>>> Analog sigal generally existed in PHY and PAD.
>>
>> On the RZ/G3L the analog filter is located after the pinmux, at the input of
>> each I2C/I3C block. Each I2C and I3C block in G3L has a single
>> register bit that controls if the analog filter is enabled for that specific
>> block (so we have SYS_I2C0_CFG, SYS_I2C1_CFG, ..., SYS_I3C_CFG)
>> each with a single bit that controls if the filter is enabled or not.
>>
>> However, for the I2C blocks they can be multiplexed to dozens of pads, and
>> these pads don't each contain an i2c analog filter. Rather, the signal
>> passes first by the external pad and pinmux and then it reaches the intended
>> I2C or I3C IP block, where the analog filter is then located. For example,
>> the P2_0 and P2_1 pads can be multiplexed between I3C and RIIC3, and each of
>> these blocks then has its filter at the input of the IP block, and a single
>> bit in the SYS register controls the filter for SDA and SCL together.
> 
> The location in hardware is not important. What's most consider is choose/use
> which software model to descript your hardware.
> 
>> Then,
>> there is the problem that if we model this with pinctrl with a pad property
>> then pinconf would not know which block's SYS register to write without
>> coupling to pinmux. In this specific case of P2_0 and P2_1 pads without
>> coupling pinconf and pinmux we could not determine whether we should write
>> to SYS_I3C_CFG or SYS_I2C3_CFG.
> 
> coupling pinconf and pinmux is quite common. I remember pinctrl framework
> already consider that.

In the end we got confirmation from the HW team that the SYS_I3C_CFG 
register does not actually "exist" and was unintentionally left in the 
HW manual, meaning that we cannot control if the filter is ON/OFF so 
this whole discussion and patch series becomes moot. The only patch 
needed on this topic is removing the SYS_I3C_CFG register definition 
from the SYSC driver as per the HW team's recommendation.

Sorry for the noise and thank you for the discussion and your time!

Best regards,
Diogo

> 
>>
>> Then there is also the precedent of i2c-analog-filter being a controller
>> node property rather than a pad/pinctrl property.
>>
>> For these reasons I believe that pinctrl is not the best way to model the
>> I2C/I3C analog filters but please do let me know your thoughts.
> 
> But syscon is also not good, which basic have not any abstaction.
> 
> Frank
>>
>> Geert, DT maintainers, do you have any preferences on what the best way to
>> model this is?
>>
>> Best regards,
>> Diogo
>>
>>
>>> Frank
>>>
>>>> so I'm still not fully convinced. Are there more opinions on this?
>>

