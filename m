Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F2A3AF646
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393267; cv=fail; b=ICBMSDrlICzkAQJ3QIEKFQewpX4arZ7JzYv50DgeQdk0t0hophhLGt4TpoksGPKWYg20F9i+Hd75AZLIFM6ttt4MWEdVvdi92HLw+Q0jEQ5odKV0LWdFopZy8neRuugoIeq85x/y213d8vUwFyfYgmdlWio3BKHYOOVmMMzDV74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393267; c=relaxed/simple;
	bh=Ba6K5wUf3d3YYhjw6bzrNaendCqqR4b0Nq3lBtpsMHs=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Ywl7CaRyP3WNbtsdsWUVc9BGfBS8tCKE+U3pVFNCV0h1NSmDq+nWYke7tRGoRREQwiyfUL+hx6ib++QFNtSnsx8hPELIrNCD6YTe28SELXMZ3uckZM5d2P8hOiKLZNjYPiMniulE4pamiwR2BBvUZFTInGwle3GZAKZ3nVa6gYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=x94Zm5ng; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="x94Zm5ng"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED5hRH1344254;
	Mon, 14 Sep 2026 09:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=fIfIc/RebVWaPvoZJLc/2CX0mBj
	1vSWcqLw8pT/8DMM=; b=x94Zm5ngAKDOpPlH6L86LieNwZ26CaxgD2yG2XSWQ72
	mU66V0Nu7XHRarCWFmko+luWhPQbFXbfp7sovBIL/EcReBHwnkV27o2Ya5hzaNTO
	wo3dQECIC1KR8aJO+Kdb1NysH2sMw8tDVzJcFmViTWPAD8VSNxVWrF3x+aj0Yzc2
	oZ4lZqGG0d2ugTZmdbtHN3iWv0s5OS/JTxKIJo7RJUFJeebB1nXs0nRO/+orOvam
	2P4rANFHiTQWk2hzOil0I3Lz9no72NSvcpvIBUEC4wXhtUiQZ3ZTW4xzvuBtNvYQ
	v4k8FnB68hpA4Lvxj09FkUScF6pPpUmal2uHHFJtIOg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gnn2cdtbv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 09:40:48 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oy2Cj7uNEIJhNm1p7gnj9v9njb1OPBzc8e2Qpw4ElGqJk9suh9zhkaEtrHVa2GtXMCgyy9wK+YU1Pgfv2zJYnzUhAem7HMxgfQOVYFpyVTf0l8NgoytoCNcwmdp7XPn+nO6bX4XnSR/yhinUMwAZra43SfpKOqBBqG8B2WtloITIGAauEN3CTDtLd4zQ6iMboVcxhkfL2aQmdZ3Tia7p85Bx8e+ThVBxhJS+D9dq6olMNXxr2RmIV4Fe3UklD77pDfLbt7wuZJjnM5zbmxObkN+pQW6hNCphEwjM6FfR/OfZp0/Ro+C8qDCcB1Sgq0SLQW+yF94ZezYEewo8qc68fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIfIc/RebVWaPvoZJLc/2CX0mBj1vSWcqLw8pT/8DMM=;
 b=WSe2HEB+PHINFGNSvXUEFKikT9pmxP7Tf4Euqp/DWTC5GVz0HqWvgNURv+YIfiypgaAcx430+Q72br4SS0iTp7rm2NJ+YJAAKBRAAgUP/yqR/BeciKPRACQE08TIkW8C5fdaxhMNFhQWHJwil8CZg3y834Al1trLHhurSVljGKu//NALREJ/gmNiMOrVKPPoRtNke95rjO0AuvzcgoZXKYDoQp4/NOD9miYoiwN/mLC8SuPTiJ4ByKPNbMz23tlJPIc39wAG3wd/mHEJsjcMaoVJnaqLTc/1Mqw1XPPZcE4yqJxqPiIkXHdousQvdb96pvVaOR+pRzD/wPnFj4QYTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by CH5PR03MB7862.namprd03.prod.outlook.com (2603:10b6:610:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:40:45 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:40:45 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH v2 0/2] mtd: spi-nor: issi: add support for the IS25WX01G
 octal flash
Date: Mon, 14 Sep 2026 14:42:00 +0100
Message-Id: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7ZgWhKAr72FYlDKFMdKSDqKGc
 HcBL+DyJe+/P4NQZBK4JDNEmlg4+BXSQwK2M74l5GZlSFVaqLPW2I8NysDoQ0RPL2QRRtvxgOS
 ystS1qQtFsO6HSI7fe/tW/Vie9Z3suAU3o2MZQ/zs55PevH9+Jo0KbX4qdO5Kmyl3Nd48Qnu0o
 YdqWZYvdboWAdUAAAA=
X-Change-ID: 20260911-mtd-spi-nor-new-issi-chip-ef3881bab60e
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789393320; l=1548;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=Ba6K5wUf3d3YYhjw6bzrNaendCqqR4b0Nq3lBtpsMHs=;
 b=6J/JXEkxNj5YwETj2sOUoFDU2WUDyRuQjciwvwrc1Vz8MjC2tcUjPh9LfHnK+Dthi13KRoZra
 vD3oTmXX0vjBgbMy5SWiZeQdA1wgaokA3IZua/Eu0htE0W7kTdB9I7t
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MR1P264CA0191.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::6) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|CH5PR03MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 251783df-cae1-4c03-f5d8-08df1265c720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	fFSoyFvPonOUX5bjk7LUXQ63V+JdYv9Y9WsvaMnHbqOagCFnzQLNmXv06G6Nimu0Pht0LyUuphoVAGOZWxO318ZkHCHIpA/eVhVPkO8RdAAXZwcJxtFVB034CuLFylLHn5wAuJL0AG8vWDwYVytxaxgwm/xlyNJgJDaGDOII9l65rgvbbxN0V/ABeej1dbj6Decomp7YXA0475QsklkRSxIV7ufgMWFWYKiat05ogx5EJqkMfKx4VUpIlpLkZ8crI8Ht9gN8s7YavypCKKQm8VbQolTNQFhqfeyzMyfzgVo4z1SxxdT7y25IF/WTXXSM3m3wiERAQMxtMBZMieTJgRWS8TIr8GNFC7gQOSkoy/SOMkCGIQ8sPXCnZ+8XbO2BKK0aSdATVDWj6nofcPydbyKqi12z61YtGAzD+BS48J9AfIdsd4/xlpZqN/hYC85QaGP6on46qzfMJntUZq2bL8ThaRnEeyVD4KrSRURIrooc3iMgcRVtwKOP6Bmhe/MFPC/LQUiaxzJV7Nb6CszSZ+uMRNB3e9LGSVPCrEQad6A6lPcirayK+WmPqm45ifNJtXAWvjjsT17sUHx9sbyuV704DR9Xl536zw5a+5gVXjE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2JQK2dwMXU0dzlBeWQrcW1vbFI2VUEyalV4S1laNzJsZUZNVzZaKzNvRXk3?=
 =?utf-8?B?SWtRYlM0YjF4ZmJkM2lsSTR4MjNkOWNKRWgrejVjMDJIbHdMcEdKZlVNSFFM?=
 =?utf-8?B?dy9pdWszRjNrb1NaY1hJdUw4bGI3ekhlcUE1N1hQSTlWSUZ5NFM3bXBpekRD?=
 =?utf-8?B?Myt6N1J0cERWT1BGam0rM1NHRVRJOHJvUG9CZWE4dXlqdXBiRVF1a0xiaUhD?=
 =?utf-8?B?cjJkVVN4ckFlSUlqbzhkZmJhOVBhUnV4aHdxRHdpcEo3S2FEMWw4K1ZWT3VW?=
 =?utf-8?B?MVM4VlRnRFJ4cDBJSzMvaWN1VVRJcVI3ZVQ1V0g1cXNlSUcrUTFlTDVSRUR6?=
 =?utf-8?B?TnAvdi9NK0xyb3BGaWtFbUxHMDV6NnRaTUpHTUV1VHRkQXFvZjVsMnBZWUxJ?=
 =?utf-8?B?bTk0ZUExcEtLaFdQT2tpVkVvU0l1WE9SUmp0dkRVVGpEb1R0aUlIQmF2Qmx6?=
 =?utf-8?B?cWlrc3ptYlRQTWt4UEYxb1lVb0ZTUTZjYjhHckpiL3NJVnlGUG5LeHhxd2I5?=
 =?utf-8?B?UXVodUQ5SkV5OUgwRVZMc1pMWVZuQXV4d0RMWktwRm55Tm5jTytKM2dvTUxr?=
 =?utf-8?B?ZzkxNzdDYlErR21BYnh2MWhqUFgxSmhMN3VWSVlwVzBqRWdKeE9HbDl1SGw0?=
 =?utf-8?B?SEk2aGZjZGpBUzRNNjh1c1lhS1lVMTZOakRWcTBRVHF2RXpHckJOSEpSanZP?=
 =?utf-8?B?UnZPWTVPQTJBM0VxWCs0RmdVbFRzUjRMSzVmWFJvWkZlV3lmYUgvVEQ1Q2M0?=
 =?utf-8?B?dExkUlNLN1dCZGlWSkFySllnVWNkUzBYeDh4YUF5WldZYkxKaU1rSkRyQ24r?=
 =?utf-8?B?NzZMelF6Yzg1RFBBcmkxa2ZrT1NFdXUvUjhvVjBvSmFiUm16MDFnTC9kNnFh?=
 =?utf-8?B?a2c3WEg5UndIRXpxSHd2UC9FNFRadmc0NW5NZ3NOOVgzSGtVcFAzb1BkRTFH?=
 =?utf-8?B?TUlkWWVBd1pNTncxZDEyeW4xellLZ0FkMFE1eXVIQkJjUjlYdXQrdXdhKzhW?=
 =?utf-8?B?WkNIWFkwYklpWE9qbG56OEk0b1AzTTl2R3BpV0JRNU9XaHZwN0l1UllWSTFO?=
 =?utf-8?B?RVBuaFZaZGovMkF5QjRSbkpTRk5zNUp5MU5hSGpBNGV5Q0VyWDVXdDhzejFL?=
 =?utf-8?B?RmxpMmpBbnpDMDVjb2VibHpCWmxUcVk3RHhiNmhHRCs1SnNJd3Z6OGJQSnRs?=
 =?utf-8?B?ZTlibkRFNzVoc3pBWUhhUklQaVBoVG9UL1NVMEtZNU5qdTR2UlRoclFPWktk?=
 =?utf-8?B?Y1BlL0FtNXFNZEs1Y09HN0FvR3NiOFZkWWlWcW9lUldYUkFIWUF3ZU9MVnNS?=
 =?utf-8?B?bTkwZFN6bzNlLzgrc2RyMkhCMXBRN3BlTDgxOWtvSUF1M3oyYlE1WVBkWk02?=
 =?utf-8?B?YVFRQ2l4OWFKbkdyV3dUNjcwSHB5SUlLeldKVTNwSUNFVk5iNzFHQmhnMDEx?=
 =?utf-8?B?eEJqT3J2bHhIclNWU2hmMWVXcG9MMWc0ZC9heEh1aXdXZlVTemZyblI5SS9h?=
 =?utf-8?B?aHlOY3g4UmNEelRBRE4zVC9ZaTVNMTVDVFhybGoxTGRtL1kxdVlQMDlzM1V0?=
 =?utf-8?B?dTJYelVXRDU0US9KSTN4RURidlVLaHFGREFNZVJ5VEI0THhFbEUwdnU5dnBQ?=
 =?utf-8?B?Wm5YaGZGWUpiaGZvSFd0Z05jN29vMWZJR2hDTW9LME55S1l1a3JrQ3cvdmdM?=
 =?utf-8?B?TmtGK2ZwVTlHdzVrUmFQNlF1R29lSkhOVjNrd2hmV1JMaUVITEE0NUJxQzNp?=
 =?utf-8?B?bVY3S0Nma3Q5ZU9ZWWZNZTNnYVBZOEpHMmE4S2dOWERuZnkyV1ZuY2RET01R?=
 =?utf-8?B?cGJ4Q2JFQUlvK0o5QVF0OHdaMjlvdmxYcUVpNmxPTjN6M1QyQzZwTXVFdG1D?=
 =?utf-8?B?UWZqSFJtbERiZVgydFUzTHJpeExMVWVlendGQjdZcHFkTkhhWHFrTFZkb3FT?=
 =?utf-8?B?b3VLWHF5MXRVTml6R1IrT1U5eHEyNTNOUGdKc1RGOGJKYU43QzZZcyt0ZEU3?=
 =?utf-8?B?eEFRMnFraUVJcHRjMUlqNVBFUnRZQitUVXNXOHpRL2c4RG5NWDlpOHE3alEz?=
 =?utf-8?B?MDh2VVB2MmlPQzNJVXdHcFVSak9aMnJWVzVPSXlDcXlvSmxRTmQreWdyN1Uw?=
 =?utf-8?B?Y1FuMjloQkttVkQ5NVFaOWZ4OW9zL3BhZDMyUkczaDBEaGNVbVcxMXVPUXoy?=
 =?utf-8?B?M2paa2VrQW1MR1hPbTF2U2kySlh0aFZrK3F4WDFDNHZ3OUxXc0VCVGcxTStl?=
 =?utf-8?B?di8zZXAyZWNIN0RNZXNvYjdPRTF1YjF5eHlraS9NZTJFcFF5Z28wUC9pL3BN?=
 =?utf-8?B?YTFlUmIvdFFkT0xQejg1ZW5UMlI2UEJlWVoyS25LV0dkU3lGMVhXZz09?=
X-Exchange-RoutingPolicyChecked:
	WTwJCCGyg/0Icgd5OBxAzApqOEltMNpllJqG+UQHsrob0Ikr3znENJZkdyOw9+RFoYuEyB3mAgUFTQApSk1zldyjLmlgdw4IFFhGI2hgD7F+QQkQwk21iLSMzZxqYl9HKLKvjnuLEgyiQUT8Y5goNd5MvXIT0RfYGD2ykoxMmuB2oV9iUs3aE92vglSA6umgYnFood7dgoXQK3dXOhqzo9lRnl7GxE1kYjdwzmtwRNh31Da461rX8tPGf7erOhObVvrLedBj9uFI9o2zl9vOmGmMjujuHpRBbH6NPhqq6C/FO7qLCWlueDQytlESlzvMmvUk9+5zBFHlO5JFKRu36g==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251783df-cae1-4c03-f5d8-08df1265c720
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:40:45.2684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bo1maDyzmfj8oPx7b4B4BABHeXvBFRk1vUWdwjE5f5Kt2iE/4meRM8OqExFJT6kvbCmz0tYiLcXK6uvmii/24Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7862
X-Proofpoint-GUID: UB2RAcMr_xtKMTAW_IrHE4-se5POo_o2
X-Proofpoint-ORIG-GUID: UB2RAcMr_xtKMTAW_IrHE4-se5POo_o2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5NSBTYWx0ZWRfX7U7ag3CbxHGi
 h0wQ/VJlxG7ueQptPcIcCScFyuu0xN0d4W1pICge+qjEFBzFB22yfo+opdCVP0HgiuYOdniFsUb
 99LMzzr62dtZphJQ0mhOmdyYrmRhl6lI2ptdQsmt04ZyjQzT01fAMfHtFRDXdbiK1oavxHFRQOX
 fBW9vZP+C2P7ccwoJnhDqWU6Nf8oHXRgFoIEi7WzMoFM6tWANbT7YmAVY2iYE4sGL+6/38FTQz8
 dEeO6avV6WsvDpKUrybTKwZeWOY3Qjw4HQ58zNiOobn8fB06p6lSv7DmqNzgfMpLUVsMh8D2+Sy
 iJggwr0RFkQ1sInItRPrMJDuVbUv83RJLThfPDNUhjgMMYHfQfzpZTVDY1sp8ldZlc4UO03krvw
 44m9iXvGAVo4f0LSP2/JQt0FeGZ4QcJee3uUsLmxAX21VR7ppQM6KWJtMoIlUwQfwi2CAYSZ3Pm
 pObnz7VX5anNF52B+ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5NSBTYWx0ZWRfX7aiHjR8Gkz6m
 wwIXxWgzW68woOpfeVkcH1ZjAUl9oCHHBzmfzUOoSQJnkM4xDO9+OXWn3eyA5SF4hcAXsPsAC1K
 HI4LfiRqS1rpWlYsXEwC/hBd+94NU9TBUsFGhXKLLsIFwyOTPpE0
X-Authority-Analysis: v=2.4 cv=bcH+w+PB c=1 sm=1 tr=0 ts=6aa7f960 cx=c_pps
 a=TofqhMGnQVwdh0HkHXulOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=bC-a23v3AAAA:8 a=gAnH3GRIAAAA:8 a=8CgkBcaItM9QUDwAragA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140195

This series adds support for the ISSI IS25WX01G, a 1 Gbit (128 MiB) octal
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

Patch 1 is a prerequisite: the 4BAIT parser did not pick up the 1-1-8 and
1-8-8 page program opcodes, which we need since the IS25WX01G is beyond the
3-byte address range.

Changes in v2:
- Patch 2:
  * Adapt the code from 6.18 to spi-nor/next;
  * Drop .name;
  * Add support for flash lock/unlock.
- Link to v1: https://patch.msgid.link/20260911-mtd-spi-nor-new-issi-chip-v1-0-c54615f8c30f@analog.com

---
Nuno Sá (2):
      mtd: spi-nor: sfdp: get the 1-1-8 and 1-8-8 page programs from 4BAIT
      mtd: spi-nor: issi: Add support for is25wx01g

 drivers/mtd/spi-nor/issi.c | 25 +++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.c | 10 ++++++++++
 2 files changed, 35 insertions(+)
---
base-commit: 700bf34058ca7cd792236b1ba5caad3770d66208
change-id: 20260911-mtd-spi-nor-new-issi-chip-ef3881bab60e
--

Thanks!
- Nuno Sá

