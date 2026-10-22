Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792700440;
	b=J0eRAwzMOlVOBRYgFCeFlHcxs4jYjYIUVdIiamp0f9g/26vx5dsE5OztyceBRFM6gIgR
	 aU+poExizpY0yN/wO0At4eIdAd/9hM9yt2yy3eyedOdtjV6YW6yg4aKEFlrC67mWHJqY1
	 RIES2kdNdC8IzThKA7mKvCuHvlUfkDJR1L3rUkPGAfD45ErSBuT5UN6E1fVAopUfW1DjQ
	 H6GoT6G8rqn+2QSb8WXKRF+VSYRuGdu/iO04p9mxrpyqZCRvh72X8jozpz1mgdjSzivy5
	 EekXEh6Pi/UttA+DewYfdAOk3/t2jiVeR6zpKUyf9MCZ94NENDsO0Wcp7I7AkglYqnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700440;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=QdHHL7IpiHmMLYOMZy+6u6Pt02r6FyjyxB4yFu3TTr4=;
	b=drooQU90b18iVVIXXO8hoIseRjCeOaMfzlXISgvucgolHc+yv8LxVq8YmZ2f8tqE8PYK
	 dKZKQNnCLxvAw3tXC9gVHKebc6ARCghiXgsF2wZaua61iLXU7QUiNj4iIWVstqEnIb4V0
	 8p88ISFLzlXhALBTfMWcYxBcBCJpyQfoDwRcTWGLhUry6oKGnJQnX2mBaeUsnfErsq0yz
	 InKAYKiW2Nic/CFwlvoU5oQsTqlxiN3AlztNBUPhBwviruNUiEKt9/jzCe6vEZRKnWpg4
	 bZsGu5xiKLVsLZgGqeWs7y1BaZ3mqPFwKxBh41OoLRwg9v4H4oFdgu13j6IEP/T0RhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bzA2K2nC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.33
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013033.outbound.protection.outlook.com [40.107.159.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581BC606A31D;
	Thu, 22 Oct 2026 20:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 581BC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bzA2K2nC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEWyaV4bMXIfxYt8vhddu9H0Ls+OVtUDt6MFVJkNTd3QC0G/wexAmhsxAdrT3NgQfGnaEDjbvOqUZs7nxH10BilKjvcKDU9ibG8mIEPKqbgw+8PvYliz0HqCs/U98Ix4KAin3qvdxOMCeuOxyaOsqL9JRB34nwzPcYuj/KvaEkhXiPhXr1wdSQKH044GuwShdWZVISCYnRtrf+hFgPAJsUeUkDllhSY7E8mNNgx2dVb8Jhef78bzTZ5jDmPyw81kwvQ05UuiELLCXp33Dtqb+1xezXMJ1huXlGPcc6K+qm4ubagJcgMaNNBg6qy9NE80MBj5RHz/1ToNKzxuKjGsxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdHHL7IpiHmMLYOMZy+6u6Pt02r6FyjyxB4yFu3TTr4=;
 b=WYZCb2zp1P5T9nlyzgIQRwa2NuUDgirjRqoA9QMO6gnZnJ9SI8J6+lKzuHyB5R1CDJEUalrV4mXe53qUhSv1vlZIy9cmwHEqnjvzlqN1DYyZEoyYPcyiCF+WyGafnlGGjYXn3alZYXSYwml/JRCwZpzMNjxX34+4LKsxYmuS+39xB269SSV6vnli+xrFZ/OEnNsmWvadOy4isFePhrlvRae4y1qM2omLuAoAJ3kucNMlkcQaxx8EyS5YB97OJx7hOdQ/MuLsqYyOXX8ZcpmNz51GZOV8eKTVejoDF8H87BCYf/TBHpZbcfBekF4/z7XP0DMw89t0Kznl6ID578rWfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdHHL7IpiHmMLYOMZy+6u6Pt02r6FyjyxB4yFu3TTr4=;
 b=bzA2K2nC+QJ8yrcuSd43O6ZagFWfN5F7G7Jku6vuZcjTziXUXXrN3et3f4T7mJRtF1XXw2j6Q/ry/4CYwTX3nNJ/jkuEws4yZj2t2FFJiB1xNcG3Uw95KSErm9tFziFlxk6k2cyNKEdRpHk9bi5kWzZQAKrCoXQjNQS2s6QUnYVQatzqarX/cfckO6q5ZoZGeqhTSvI+eKg3EpoXswvw8z7eETNjVcxoD09Qrn0iG7r673dUcJ+18CHxX0YXnKbmLV8FoB/82SlTZuKzAfIChxo++DMs2n3n8gnf7p7BHE/BV2IRLg0KQdqKs7Sv2yeA7p6PK/SLSl1pvhvZLn4kgA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB12151.eurprd04.prod.outlook.com (2603:10a6:10:640::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 20:20:37 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 20:20:37 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: imx9[135]-toradex-osm-dev: Fix USB_A source PDO to 900 mA
Date: Thu, 22 Oct 2026 16:20:30 -0400
Message-ID: <179270041362.1301511.16483651144538374557.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009132550.20793-1-francesco@dolcini.it>
References: <20261009132550.20793-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:8:2f::29) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB12151:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a17e0f9-2abc-4296-2b4b-08df3079ef50
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|19092799006|1800799024|366016|56012099006|11063799006|261009221227099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sJLkFcjY0R25tWHNzXr/J+k77AkZjUMeLphGl7qKhBsPoxVF6O2JyirXFqlYEV+KG1dR+hXd7WfcS1FtIZ52XKUPKbQ7qetp41gQMHf/oGTkhQc7zQedX2abXcdQ+ZPYQRouwgD6KEHp7qOCKZZ0tWsmSTP9y2lrGsrbH6lTOfeMUPdicoD52eLZn9zmDqGmXpC4+RDcMFBf1E/etr8js684RxANLtRk6kjpXHEtH6m4tGvOmFMv0rnxgKE8INTD3pAYDrEYHVI7RV5fqd8PKLXEjlfCvJXj2QLpECckOrhczDuk9qgzHSkJuMvVCSamZevkSSXhe/JtLcfrC5KA17LOPdMV/QtdJj/zND4IpTTLhuY7FTyR4k4XROUCpPsHieoye8UdTFMF/+YirEz/0uECBfaq/NQsIL52fULd4OsmwxnvWetYRZ9hKkyhMOfxlrypPoubTm+/Yo9+4zx2TGYlPSTDecH8t9gWXr2I25Q07z2tqpgd/GqjxfVlxnF/DvSD6HIwaqX3Z8R+FpaWDpznRQUa6Z/1Sl/b3GVZqknEf7OadTkTh7E126pPa4FK+JTzhMD5jWmbWK81YviueYPGKZsUtYOPMXT8jL3B2cusPZ0zmIm6OTn9tMVK6PjVYzkmgoQ//vu7DKBKE/u/V+vlIqjtvsnnlrnfe0BeU1Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(19092799006)(1800799024)(366016)(56012099006)(11063799006)(261009221227099003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2xBZTNsWkcxRUc3VmZxeS9iTnc2eUNNMnlnRitWQzZ5R0l3QmxvNVM5dEZv?=
 =?utf-8?B?dlFtVjliWCsyQldEMkRBZUI0a2drcUNNSzQ1dDdlODFQM1BIOEFFMnNGQkxZ?=
 =?utf-8?B?eW0ydmFtRjlvd0J1eUNwdWFhTmw5UTZYQWtHcU0vUlhKNDhPWFF4d2swU3R5?=
 =?utf-8?B?aWxGbTU3UXp0TjJkcDhtOWVKaDJvKzkvcVQrT2pnakdBZjBSaHB1YWphS3Uz?=
 =?utf-8?B?bkgzVzB5M3FPVUE0MWZPSXBOZ2gvOW1ydlYyYlFnQklyVDlEZWtBS2taRVAr?=
 =?utf-8?B?S1hvUkVqTzROVmYvZG1WTTdlMDNLbGRmSGZGUWZ4dEd0SmNxcnJUZmxackVn?=
 =?utf-8?B?N1FBSFd0R21JRnVYODJWQXpYZEVndnRsWGVZQ2tkNGFkRVg4ZGpPYk5hd0VY?=
 =?utf-8?B?Mi9Pa0xtTSs2M3Nzc0NOLyt1aGpTaWFQWHBPcFdWK0E3VDlEczc4VWJabjly?=
 =?utf-8?B?NkVLTjc4aXhWanQyNGNvVlFsVndYVy9NMkk2TnhZdUI4Y1FzcEZMK2llWjNm?=
 =?utf-8?B?Z0NXeCsxMmhnQWxiRE5rUTNSb3VtaUpScDhFeWFTU0JYYlN2RkNCR0ZQQ2RF?=
 =?utf-8?B?ZzU0cExoVHlybG5ZVmErWjl5cGRlTnZaSzBlZlZpaFhiVnZySlBSc094YXhs?=
 =?utf-8?B?WThSYXRqLzJpMU5yLzlEdDNsb1ZlUkxTRTRMdHhqb2RwWUNCdTBEcmhuVzJ5?=
 =?utf-8?B?MFQra3Z5Yzg0Vm82allHdW1qb1FnanBGblplM1F0Rm1zWGlsT01Rc2tlZC9t?=
 =?utf-8?B?UHl0dlVwZjYwUlpoMzZnRjUremMxOHdJNExLbWt6M2hrRG1ETFVTeDV4WGEy?=
 =?utf-8?B?NWR5S21tTERnbVE1WXlKaU90WFVxZ05YVDNkenpIcHhYWUhDc1NrdGhxTGVI?=
 =?utf-8?B?OG1hRlZKQ1UyMTJzd09DcEhvRXFueXMrY0Zuak9NR3AvaklTMFRnSmljQTFR?=
 =?utf-8?B?aFREWGtzWXNqMysyWkc5MHB6aG42VGgwVVhkYUd5a3JLd0VLQ0daQ1hBdHRr?=
 =?utf-8?B?a0M0N2pmSlN3R0hGOVgzbUdkOEZkNERsZTVxZ1hVNGVqV2hTUk1XV3hvUmU1?=
 =?utf-8?B?MjBqVXhXRFAxNUNGbDZjUlhUTUxiTW11OWd5TlF3R1ZSc25yU3o4T0d2eTBU?=
 =?utf-8?B?cU5WUERRNC83VjZydEhMaGVIazVtaTNyWElHSFpMZURsNE9wZ2V5eWhSVnR1?=
 =?utf-8?B?SGgxbXRyaWF3dE5CSGt3ak90K3FBUHNGdnVrRUIvSkMyZTNPTFltSW1zcGNr?=
 =?utf-8?B?VGpyK2V4bFMya0NaSzBna1JFY3dCZ0ZZZER5V0pxcUhHVlNTNjFDaHY0Ni9a?=
 =?utf-8?B?dS9kaW82OTNWckRaelV0eUNpSmJCTUJCUWNTb1NRMmZJVm9oMytEbzlHRDZC?=
 =?utf-8?B?WXhLWVZQNUk3ZzJ5aHRtR0lGM1oyTXo4WVN0Z3JHMDJJaXRlNFcvNDh0Uk92?=
 =?utf-8?B?TXBNTnVhNG9HT1FhL3h2RTc1cGtGcmpwQjJhY1FycWczWVNqQ2ZPbnVDblFt?=
 =?utf-8?B?SXVSUWQycWtpbmw1WXBzZVYwa284VnYxWncxb0IvSE1oYVN6S2xSdGZlVUFL?=
 =?utf-8?B?SExtVjVNTHp4N1RkV0Z5YW1JR3AwWnhEaUp4YzNGdmJndWtzd2RLUmo1UGlL?=
 =?utf-8?B?N2xGbHhQZzF4Zzl3MFJBeXNrZE5UK0kzYnppM2VraWFVMWREZmN5MmVkOExL?=
 =?utf-8?B?aTdKekQwTTUxZyt1ZFl0aG9mWUN2akZnNGwvTTE2eUU4QXBwT2tRNDc2dW5W?=
 =?utf-8?B?Rkw4cXo0Mm1velp1aFZkRUEvZXJ0N0czWElLWFh2K3NTMmVxdHAyRVRYZXVQ?=
 =?utf-8?B?b0M5Y0IzVGpLaWFYdHBJRnA4ektjQUFjUWtJaSt3Smora2ZwazZreVVNVWhm?=
 =?utf-8?B?dmEyeFVGMHpycXpNTEZqaGQwYkVTR21yNTRUVGZtY1FJcU1SNnQ0UHp0bU01?=
 =?utf-8?B?ZXR6M3BWYUcxUktPd0J4dVR6NlgyYkJIWGQveG5MZFZEQkpIZ1Npc3QzMnYr?=
 =?utf-8?B?em9wL2FPQTM4d202VElwVENlQWluQXgwSzJxVzUxbjM3bWMzWEs3REgvT3lW?=
 =?utf-8?B?eG5ZZld3T0o0d3JxK2FPWGhTMEJ3ZGNEV1V5djdlaUxnMm80amZUSWxVRkhx?=
 =?utf-8?B?akpvK2ErZnhmc0FReTZtOXRKWnJpK2VXWUhPS3k1eXZvYndHNXlObnY4SnZm?=
 =?utf-8?B?S3R4Z0F5QnJsT2VZci9ZeWxEdHpTQnFkTUJOSmJQSXlwek5iMGwxeVhoMW9J?=
 =?utf-8?B?UERSb3pveno4MityWUZuZ0VWSjhXM0NBdkd3azMvRWdLS3ArdzFaSnpJVzd5?=
 =?utf-8?B?RW8rOTlFWnMrbGNQTVlleWxyRzljV2l4aDlmdE9IWHQwcWxNK1cwYVlFSThN?=
 =?utf-8?Q?uUfW5Mky6Hzz8fAt0Fubbfh/bhYIohzK//PQP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a17e0f9-2abc-4296-2b4b-08df3079ef50
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:20:37.4938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Vi8Mb6T/VhqMGnDx9JNmTBclJW0xHCGoLf76GACheOoG8gymfLnxW5pTCP+E2EEEy2mPD6HW/sSgRe9iNUzVer3Jyw9v9OiCR2ojUr2aCVHoKe166c61d4MHAlFQ0WI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12151

From: Frank Li <Frank.Li@nxp.com>


On Fri, 09 Oct 2026 15:25:46 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> Correct USB_A source PDO from 3A to 900mA.
>
> The USB_A Type-C port on the Toradex OSM development board can source
> only 900 mA on VBUS, but the connector advertises a 5V / 3A fixed PDO.
>
> [...]

Applied to imx/dt64-intend (will appear to linux-next after v7.4-rc1),
thanks!

[1/2] arm64: dts: freescale: imx95-toradex-osm-dev: Fix USB_A source PDO to 900 mA
      commit: 43a88b1dd043f686e6b384088d31545e21f32cba
[2/2] arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Fix USB_A source PDO to 900 mA
      commit: 478c8c418615ea9d3fbd80d0a8d3e3889644ddea

Best regards,
--
Frank Li <Frank.Li@nxp.com>
