Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793832658;
	b=B8nZiF+dPXs1/3fj6Tcwp5yxYxUw14S8UPwmnAI0+CJE8QZcx9OpPzv+8WsVJ2tw+pGw
	 yvDAACXIoCmvkaiAdRNuc/3PTjdoDKvz2CBucILNN6J4DyTXkPU/ZYvgQYZQJSf8IOrsX
	 BYhX95s7cEfbHrGI8F28ZFiPEMdCpAwS/NSItNL4rWXFiXXzRUDSUmpOj699QGkgdxXPZ
	 n8toewjfXZwgDQ9ooF59dYc2dWKoa44I4pATCOi+ESaHnG4slWaW+5sbNPmLHhpoRrTbl
	 I73EgfAGne5crKPx1NTOYjuTGQwsaR6bk4XzL9fLSTduwHwnMeFvBZrzDqvXxF83xuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832658;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XVIzTaDeDuxlY+jVt1I3jYIexJYgZcMk1yHETs1Z7zI=;
	b=c8xSRa1l0iYLxIFBBSNWCU+OCbUgqfJiHmsZRAddq6wynYk7bTk5GevFZzAGfD+zHT9r
	 LBN4UqeP62Rirac3+TLKVqJlepS3S+b3/9qNShYRdzd+w1AGguJ223DGPV9wG4KIucJ1Z
	 gk5cr7jehI1B7Z7o4IlkzAWNb2UAfjGGwUVvbu/2M2xfH95EQIfaPyQAYFz7evdEImwEO
	 mzqdwAKbueVTBxv3h4LCCdJmRVucrLPIN/gV+WyIuab8dGO9Li99i6sYdgaC2mXc7257c
	 V9xvhQT9d3Mk2pYRbhM9VhQP90C76O8v9Vhew+8JvWkDk5JVJFPizoRW8VzQbyYsCQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RliaWsaR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.24
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFC7606A31B;
	Wed,  4 Nov 2026 22:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DFC7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RliaWsaR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjzRtAEsx1VVjjikDs9+Rms/uZ6ZxqgcDWziMuefMLQ8Zp20pgjGKI/E5tTHsrQN8/WvvRt0uDxOz/3p8pIl1bdjtzEvArajLR9th6yzSj0lLvvKdA7S0jPnUCWMhjcg5j19CQ9XRoFkwUHmGrnrYIS0UBjdn/V1KcUtSXogOGsq0WTMF/WGxItdBCovEGojMH5xDAkv0/S5Dse9YO/yJSV4cbTJOqMLvehYQKyYpQryKTwqlJicE6FZwBJOybJUe5jwHIlxBg+Vo51l7JAFbEAaJUpl6pb2QhBBnYkYl1yQ2ibbfIBaLnbe+hIr3GCyZDhr8UQX9BaEl0Qq5eChTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVIzTaDeDuxlY+jVt1I3jYIexJYgZcMk1yHETs1Z7zI=;
 b=hjH5ObS6UypZ0R8mXOd1/h3uwoMqDXN6JZJF2mERthIHpxOvFM1FgJzAQ0qntDPfaSf8kv2rn6FbzaaZZrs3mb9vSHF3eeOrg7S6QNC5JJSKphY40HAfuRAriufP1MpsAyHX4nq0F47t0y5tqAkj+xKWSSbF9SFzPTloOYs3gZD9+gK2nuew7+4yeRhB/AacqvSjM4lSXGRUsXBGzi4F5RWuMm9kXmqXDRdS/C2jDmZWUQhVxqgTTrG2TAw7PmpbueQG4L8DXUuIZf5+Nuchg7BrGd97LqLtwCf9iEhpItMmcV7ZrAGqhkO6G+DW8P1ZYCYTTzC78h73idlIw9DNbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVIzTaDeDuxlY+jVt1I3jYIexJYgZcMk1yHETs1Z7zI=;
 b=RliaWsaR31Ah0tNXrEDTQiR0z9XYwF1p7g6yV6hBA2f3fa4IU/umpJEN+NSLTE1n5qcxA3vWUedD+07jkxzlf+pR7WQAauqsHTicl7e/xpG7VVSOYUrsto8sloWwZ1xOLU4yHaRqkuTtvS0oDus2XOJ1NVAP+FfXhKcCMoWgD/p8sdMazCaCV8QR6/bkc1+cHPT9E7fqLd9bMsVnzMVHOadz3JQTGx/durbMzuuoD8XY0H5r71d0U0/bzQX4a3tqozDzcO5EjUz6+BcVxm8a49Knh62Vu16OOVxRO83hoamU59t+ji76L7p+xUhRSVWJObXGTTUQhLIvwL8Yvje6Nw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11)
 by PH7PR12MB8055.namprd12.prod.outlook.com (2603:10b6:510:268::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 22:50:52 +0000
Received: from IA1PR12MB7687.namprd12.prod.outlook.com
 ([fe80::44bd:3118:a52:69d8]) by IA1PR12MB7687.namprd12.prod.outlook.com
 ([fe80::44bd:3118:a52:69d8%4]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 22:50:50 +0000
Message-ID: <705b63c3-297a-4bf8-9eb2-b826e280e7da@nvidia.com>
Date: Wed, 4 Nov 2026 14:50:46 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 2/6] firmware: smccc: Add support for Live
 Firmware Activation (LFA)
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: Salman Nabi <salman.nabi@arm.com>,
 Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
 Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
 Varun Wadekar <vwadekar@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20261102165421.3651202-1-andre.przywara@arm.com>
 <20261102165421.3651202-3-andre.przywara@arm.com>
From: Vedashree Vidwans <vvidwans@nvidia.com>
In-Reply-To: <20261102165421.3651202-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0178.namprd05.prod.outlook.com
 (2603:10b6:a03:339::33) To IA1PR12MB7687.namprd12.prod.outlook.com
 (2603:10b6:208:421::11)
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
X-MS-TrafficTypeDiagnostic: IA1PR12MB7687:EE_|PH7PR12MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0195f1-913b-48aa-1898-08df3ac612c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|6133799003|10067099003|18002099003|22082099003|3023799007|13003099007|4143699003|11063799006|5023799004|261022075727099003|261022113327099003|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261022105027099003|56012099006|261021123027099003|261021121427099003|261022115727099003|261009223027099003|261102124527099003;
X-Microsoft-Antispam-Message-Info:
	rN+15hpaDhlNtnRq4ts3HgifZhjzMAX2VZWKdIRQngBWVdyJreSDLt2uQ6dSXhgyLOiyaXIOngZ43jErtaEZiFCPm0RwTbznsh9JD1ACY2JNElTto435h9eCkGRvyrr3/zu9Bq0Ld+9heBXnkVcdUdgcwtLYOyTfld6kSwfYoWo9MTRixICPv40H4DXQPJWi16FdHegeC1UmcTv4XseMS4T97mLJcfJFFbELODFEYInUbwGDQp+YNZNJHAg10ox0EMVK9yxkD77puTZvCpqtecq3klQf8h4x/jYWYxmKrsCOMFSycAvP25VY102s3nOirAH5gv0/yRkA+//bhGw/qbgH2DOod/3BDyY5OswIL748lMfpXoVGBJeJdt+7yJBJXnVnuFWSer8muxpIsjBMF7vQrGY2Y2PEBtObxxdknxjO0inEqWTzsmK6qvrJyJf8mb7L1K7d2L0TZ1JS0kNWnw9QorcDyI1tt7wHPt9WpErmeT1/g3CwJLGrBBDJDOSKmC4C2D0N5Mr8ZUm8FrN7lGVIr9kxhhbyXzwbewV7vXTO8eh/UgGQWn8qmPLWj7jYtNszDhO9nm5vSdD401H2X/nHYTbmKxQTyZSjqrR7+u72n7CSoyMOE8StgKreInkfqWmT/vIDuXK58ztJgJ0us+w/bJIRQK+Qt2M4SI0W2rY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB7687.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(13003099007)(4143699003)(11063799006)(5023799004)(261022075727099003)(261022113327099003)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261022105027099003)(56012099006)(261021123027099003)(261021121427099003)(261022115727099003)(261009223027099003)(261102124527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dytFK1R0dk9BL2RmQ0JpRXhPRjhGMGcycjErQTg2Vi9ncm5MaVYxN3FoT0VB?=
 =?utf-8?B?dzIzWWp2WldjbGtIK2tLa2hmdFAxblpsdkljWGtPblBZRUQybzk2UW9WMWpL?=
 =?utf-8?B?U3pPNHBIbFdvWmdURUN5ejhYcm0xeG9ETDdlZTR1b2lJYitxUU1RRDlQZUls?=
 =?utf-8?B?QW1PaWZZN2JHTW9TRVFnRUhYVkZjVWpPcm9pNzhVcWd5akVIaDViWUc3VTds?=
 =?utf-8?B?UEhPYTJpbnBSYm5NTzdoVzc3cldtdlFwWk45TUd3MTRUWHlZVGFiTUQ4UGQy?=
 =?utf-8?B?SUJYcVc1WE92dUJNRGc1R1VTdDNLMEpkVnJRTUt3bTdzaUxuQTJTVmREaExX?=
 =?utf-8?B?MmJCS1ljUGQveUhuVXBBd1hwZmNsZ0lyRzBMK1NJUHNodFdEQ0F6ams3Ulk0?=
 =?utf-8?B?L1BMNVdOenl2c3drb28vdlBLVmVrK1V2UjBDcDAvQnlYdHlPdW1INTRWYTNO?=
 =?utf-8?B?ZW9WVGJuK2pSU2c0U3R4cVZVK2lvOUpSK3NEaHJHN3MzcWxWbk8vUGxIZTJ1?=
 =?utf-8?B?MzYxT1ZURUwvd0FxNjNJeDBEaXN5VDM0ZWpYbnlzc0hwdW1Fa1NYSDN3VXcz?=
 =?utf-8?B?UEU4SnVRZ29CSWV1TUE3OEE1MU9oRnBSRDB1eUFPSFhhdE9WN3oybnpoZXJP?=
 =?utf-8?B?TWN6TEl2dEpxRFMybGhQTEJiZ2JmS3RLK25FNFVZTkxhdkdPbytLamVaMVdC?=
 =?utf-8?B?VVQ3Smc2aUZWVTBRc0ZWc2JaQ0tLa0JwVDFTM04ySElHc1h0cjI1YjZxUWw4?=
 =?utf-8?B?VCtUREErMk9MVjk0aFJLZ2pkL2VZVGN0ZUlodnZhOGdXc2pqQ3ZjSjBXakR3?=
 =?utf-8?B?YTlRck03Y0c2NW9mTTZjUnNFdVVVZm96YmcyMXQ0dkZMaTZPRjR1b3l1ejZt?=
 =?utf-8?B?a09pc3BncjI2SlZxNGlNL2VmUmJ2WXVudk94Z1dPTGlVK0UybHFPWnZ2SFVn?=
 =?utf-8?B?cmI4OUExL1R6b1FNM0xFVmswR0xYOVdxTHRZZXp1eExaMmtKckJoOExLL2tK?=
 =?utf-8?B?Vjk0cW1TcmtrTjlubkpCNk1UYzhZQzhISSs3RTZkdWVTRDdQcXZPRS9mZTFJ?=
 =?utf-8?B?cG5GcGdvQ3plWEVwTDA1OHVRMFUyMzZrWWNISndaTXRwUDZvOG5oc01jaGo0?=
 =?utf-8?B?bEk4MWFHdXFjb0hjWXZ0emcwYkwwQy9kSnJuei9YeGo1NHJiVUl5dVQ5anNC?=
 =?utf-8?B?Y01Bb1IrcXFpMSsrSThBRThjMWZkSWxPLzBvcWg3b3FFK094MmlFSG5GWUVs?=
 =?utf-8?B?S0xvMGpLSEJBSFdRbXU2R0NXT2JUc3JMNzhvREp3WkVqMFp5Yjh4MXNLNDNI?=
 =?utf-8?B?cVl5OEVvMUxOb3NXeWphMXVCUkh1T2ppTXNmMS83a250ay9jSkYwcVVTcm1x?=
 =?utf-8?B?MVJQVU5DYkpjcUdyWTJGOHZFVzJJVHRZVDlxR29PbVl4OStGUlZWRVhuQXI0?=
 =?utf-8?B?OG9yL0dhM3hMYmM1Q3VSK3dXeVgzYWtvUjFDeXI5TlZrYkROcmJiSHdyMlhM?=
 =?utf-8?B?d2hHU2xkaDBhdDhRc253ckVMNWxyNTJLWTJyOC9UTDcwbDgwWjBmVkFBVWhZ?=
 =?utf-8?B?QnlKeEx6RlNjZXlpSGxQdVFaVWx2a3IrQU0ra3FpY29tamw0Z0lwQnVGNWg3?=
 =?utf-8?B?Z0VCdG56eXc5Z290VEhoQVZpSDc1RGNER3pnbjJtSmhSbnpFSDZjYlVrVVVX?=
 =?utf-8?B?U2Q4cWxOK2R2bXBMYVkxbXYvL1RKMVd2TWt1dXBPQlR3NUV5RWdSR2piZmla?=
 =?utf-8?B?ZWU5SmhrUUdrUTBFNXdoZEgrSFBaZ2pmVVhxK3Mvd3ppQ2czeGtaRE1JQzBC?=
 =?utf-8?B?L2lLenM3ZzFhMTVoZkJXQU9tbXlCN3dmeFZ0L1B3S2Jjd1R4Y0xiL0JYT2VM?=
 =?utf-8?B?Y3NDdU1GU01iRjVIRUtPNE4rRnNvdXhOZTNXU3cwbjBuM0hUTFJtQWlFMkJE?=
 =?utf-8?B?ZTZsWWp1MXVYZVVkL241YVM1ckRMV28rNlZTVmUvMlZNcGw0REVtK3RoVDNJ?=
 =?utf-8?B?QUU0cGVITzk3U3c2M1B5ZngxNUw5b2FMYW10cDVSYzRXdjFtQUtIRWxlZWhz?=
 =?utf-8?B?YmlTeXFFR3lFb2ZpdVRmWnQxNGtXN2tub01UaEwwNFRYTFEzNDRSZ1ZPa3pZ?=
 =?utf-8?B?ZzJlLytvNmIwMWtQcE9YL2JUb0VUY0RCbDBvVkhkZDhQWW56R3NrS2xPQkJ1?=
 =?utf-8?B?YmV3YVhBdzJLbEh0eVZpYzdyUnlnWlV1bTRvalNleGlVa1hIZHc1R3h6ekFK?=
 =?utf-8?B?V0NlMGlmYWFkdE5hRkUrK2l4aHcvN3MwdkE3NUN1Zm10MlprVVIvNUduSU1h?=
 =?utf-8?B?Rkw4eEZtWWxSRmJORmVHcm82bDNGSzNjK0hJRXl6bVhQcUtSVDB1dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0195f1-913b-48aa-1898-08df3ac612c8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7687.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 22:50:50.6865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+V1OSzDcUST7UqhZqBKCcUtL/XPAHNOeLWdrXnx/87ccSoDsFCmWgeCda71EICC/Hvcae995fuq698JcTIzZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8055

Hi Andre,

I have a few comments about retry handling and inventory lifetime.

On 11/2/26 08:54, Andre Przywara wrote:
> From: Salman Nabi <salman.nabi@arm.com>
>
> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
> activating firmware components without a reboot. Those components
> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
> usual way: via fwupd, FF-A or other secure storage methods, or via some
> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
> at system runtime, without requiring a reboot.
> The specification covers the SMCCC interface to list and query available
> components and eventually trigger the activation.
>
> Add a new directory under /sys/firmware to present firmware components
> capable of live activation. Each of them is a directory under lfa/,
> and is identified via its UUID. The activation will be triggered by echoing
> "1" into the "activate" file:
> ==========================================
> /sys/firmware/lfa # ls -l . 6c*
> .:
> total 0
> drwxr-xr-x    2 0 0       0 Jan 19 11:33 47d4086d-4cfe-9846-9b95-2950cbbd5a00
> drwxr-xr-x    2 0 0       0 Jan 19 11:33 6c0762a6-12f2-4b56-92cb-ba8f633606d9
> drwxr-xr-x    2 0 0       0 Jan 19 11:33 d6d0eea7-fcea-d54b-9782-9934f234b6e4
>
> 6c0762a6-12f2-4b56-92cb-ba8f633606d9:
> total 0
> --w-------    1 0 0    4096 Jan 19 11:33 activate
> -r--r--r--    1 0 0    4096 Jan 19 11:33 activation_capable
> -r--r--r--    1 0 0    4096 Jan 19 11:33 activation_pending
> --w-------    1 0 0    4096 Jan 19 11:33 cancel
> -r--r--r--    1 0 0    4096 Jan 19 11:33 cpu_rendezvous
> -r--r--r--    1 0 0    4096 Jan 19 11:33 current_version
> -rw-r--r--    1 0 0    4096 Jan 19 11:33 force_cpu_rendezvous
> -r--r--r--    1 0 0    4096 Jan 19 11:33 may_reset_cpu
> -r--r--r--    1 0 0    4096 Jan 19 11:33 pending_version
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # grep . *
> grep: activate: Permission denied
> activation_capable:1
> activation_pending:1
> grep: cancel: Permission denied
> cpu_rendezvous:1
> current_version:0.7
> force_cpu_rendezvous:1
> may_reset_cpu:0
> pending_version:0.8
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # echo 1 > activate
> [ 2825.797871] Arm LFA: firmware activation succeeded.
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 #
> ==========================================
>
> [1] https://developer.arm.com/documentation/den0147/latest/
>
> Co-developed-by: Vedashree Vidwans <vvidwans@nvidia.com>
> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
> Signed-off-by: Salman Nabi <salman.nabi@arm.com>
> Co-developed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/firmware/smccc/Kconfig  |  10 +
>   drivers/firmware/smccc/Makefile |   1 +
>   drivers/firmware/smccc/lfa_fw.c | 845 ++++++++++++++++++++++++++++++++
>   drivers/firmware/smccc/smccc.c  |   5 +
>   include/linux/arm-smccc.h       |  15 +
>   5 files changed, 876 insertions(+)
>   create mode 100644 drivers/firmware/smccc/lfa_fw.c
>
> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
> index 15e7466179a62..7fd646d515f86 100644
> --- a/drivers/firmware/smccc/Kconfig
> +++ b/drivers/firmware/smccc/Kconfig
> @@ -23,3 +23,13 @@ config ARM_SMCCC_SOC_ID
>   	help
>   	  Include support for the SoC bus on the ARM SMCCC firmware based
>   	  platforms providing some sysfs information about the SoC variant.
> +
> +config ARM_LFA
> +	tristate "Arm Live Firmware activation support"
> +	depends on HAVE_ARM_SMCCC_DISCOVERY && ARM64
> +	default y
> +	help
> +	  Include support for triggering a Live Firmware Activation (LFA),
> +	  which allows to upgrade certain firmware components without a reboot.
> +	  This is described in the Arm DEN0147 specification, and relies on
> +	  a firmware agent running in EL3.
> diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
> index 68bbff1407b8b..cddf2c460ab9d 100644
> --- a/drivers/firmware/smccc/Makefile
> +++ b/drivers/firmware/smccc/Makefile
> @@ -2,3 +2,4 @@
>   #
>   obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= bus.o smccc.o kvm_guest.o
>   obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
> +obj-$(CONFIG_ARM_LFA) += lfa_fw.o
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> new file mode 100644
> index 0000000000000..db2a7fe344d5d
> --- /dev/null
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -0,0 +1,845 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025-2026 Arm Limited
> + *
> + * Driver for accessing the Arm "Live Firmware Activation" (LFA) services
> + * provided via SMCCC by platform firmware. This allows to activate certain
> + * updated firmware components at runtime, without a reboot, as described in
> + * Arm's DEN0147 specification:
> + * https://developer.arm.com/documentation/den0147/latest/
> + *
> + * An "LFA agent" is running in EL3, providing a list for activate-able
> + * firmware components via repeated LFA_GET_INVENTORY SMCCC calls. Those
> + * components are identified by a UUID, which this driver uses to name
> + * subdirectories under /sys/firmware/lfa. The properties and controls of each
> + * firmware component are exposed as sysfs files in this directory, for a list
> + * of them see: Documentation/ABI/testing/sysfs-firmware-lfa.
> + *
> + * Each firmware component sets the "activation pending" bit, if an update
> + * image for that component becomes available, either through some host
> + * initiated update process (UEFI capsule update), or via some out-of-band,
> + * BMC controlled update. The latter can be signalled via an interrupt or
> + * an ACPI notification.
> + * The actual activation process is split in two phases: LFA_PRIME prepares
> + * the activation, it can take longer and might require multiple calls to it.
> + * The real handover happens with LFA_ACTIVATE then. Some firmware components'
> + * update procedure might require to gather all CPUs in EL3 during the
> + * LFA_ACTIVATE call, to prevent them from doing any service calls to the
> + * firmware component being updated, but also to allow the updating firmware
> + * component to initialise itself on each available CPU. This is called
> + * "CPU rendezvous", some firmware components require that for their
> + * activation. This driver chooses to do so regardless, to prevent stray
> + * firmware accesses from the kernel during the update phase. This can be
> + * skipped by setting the force_cpu_rendezvous sysfs file to false.
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/arm-smccc-bus.h>
> +#include <linux/array_size.h>
> +#include <linux/delay.h>
> +#include <linux/fs.h>
> +#include <linux/init.h>
> +#include <linux/kobject.h>
> +#include <linux/ktime.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/nmi.h>
> +#include <linux/psci.h>
> +#include <linux/rwsem.h>
> +#include <linux/stop_machine.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/uuid.h>
> +#include <linux/workqueue.h>
> +
> +#include <uapi/linux/psci.h>
> +
> +#undef pr_fmt
> +#define pr_fmt(fmt) "Arm LFA: " fmt
> +
> +/* CALL_AGAIN flags (returned by SMC) */
> +#define LFA_PRIME_CALL_AGAIN		BIT(0)
> +#define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
> +
> +#define LFA_PRIME_BUDGET_MS		30000		/* 30s cap */
> +#define LFA_PRIME_DELAY_MS		10		/* 10ms between polls */
> +#define LFA_ACTIVATE_BUDGET_MS		10000		/* 10s cap */
> +#define LFA_ACTIVATE_DELAY_MS		10		/* 10ms between polls */
> +
> +/* LFA return values */
> +#define LFA_SUCCESS			0
> +#define LFA_NOT_SUPPORTED		-1
> +#define LFA_BUSY			-2
> +#define LFA_AUTH_ERROR			-3
> +#define LFA_NO_MEMORY			-4
> +#define LFA_CRITICAL_ERROR		-5
> +#define LFA_DEVICE_ERROR		-6
> +#define LFA_WRONG_STATE			-7
> +#define LFA_INVALID_PARAMETERS		-8
> +#define LFA_COMPONENT_WRONG_STATE	-9
> +#define LFA_INVALID_ADDRESS		-10
> +#define LFA_ACTIVATION_FAILED		-11
> +
> +#define CASE_LFA_ERROR(name) 		case name: return #name
> +
> +static const char *lfa_error_string(s64 error)
> +{
> +	switch (error) {
> +	CASE_LFA_ERROR(LFA_SUCCESS);
> +	CASE_LFA_ERROR(LFA_NOT_SUPPORTED);
> +	CASE_LFA_ERROR(LFA_BUSY);
> +	CASE_LFA_ERROR(LFA_AUTH_ERROR);
> +	CASE_LFA_ERROR(LFA_NO_MEMORY);
> +	CASE_LFA_ERROR(LFA_CRITICAL_ERROR);
> +	CASE_LFA_ERROR(LFA_DEVICE_ERROR);
> +	CASE_LFA_ERROR(LFA_WRONG_STATE);
> +	CASE_LFA_ERROR(LFA_INVALID_PARAMETERS);
> +	CASE_LFA_ERROR(LFA_COMPONENT_WRONG_STATE);
> +	CASE_LFA_ERROR(LFA_INVALID_ADDRESS);
> +	CASE_LFA_ERROR(LFA_ACTIVATION_FAILED);
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +static int lfa_to_linux_errno(s64 lfa_error)
> +{
> +	switch (lfa_error) {
> +	case LFA_SUCCESS:
> +		return 0;
> +	case LFA_NOT_SUPPORTED:
> +		return -EOPNOTSUPP;
> +	case LFA_BUSY:
> +		return -EBUSY;
> +	case LFA_AUTH_ERROR:
> +		return -EPERM;
> +	case LFA_NO_MEMORY:
> +		return -ENOMEM;
> +	case LFA_CRITICAL_ERROR:
> +		return -EACCES;
> +	case LFA_DEVICE_ERROR:
> +		return -EIO;
> +	case LFA_WRONG_STATE:
> +		return -EPROTO;
> +	case LFA_INVALID_PARAMETERS:
> +		return -EINVAL;
> +	case LFA_COMPONENT_WRONG_STATE:
> +		return -EPROTO;
> +	case LFA_INVALID_ADDRESS:
> +		return -ENXIO;
> +	case LFA_ACTIVATION_FAILED:
> +		return -EIO;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +enum component_attr_names {
> +	LFA_ATTR_CURRENT_VERSION,
> +	LFA_ATTR_PENDING_VERSION,
> +	LFA_ATTR_ACT_CAPABLE,
> +	LFA_ATTR_ACT_PENDING,
> +	LFA_ATTR_MAY_RESET_CPU,
> +	LFA_ATTR_CPU_RENDEZVOUS,
> +	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
> +	LFA_ATTR_ACTIVATE,
> +	LFA_ATTR_CANCEL,
> +	LFA_ATTR_NR_IMAGES
> +};
> +
> +struct fw_component {
> +	struct kobject kobj;
> +	int fw_seq_id;
> +	u64 current_version;
> +	u64 pending_version;
> +	bool activation_capable;
> +	bool activation_pending;
> +	bool may_reset_cpu;
> +	bool cpu_rendezvous;
> +	bool cpu_rendezvous_forced;
> +	bool use_cpu_rendezvous;
> +	struct kobj_attribute comp_attrs[LFA_ATTR_NR_IMAGES];
> +};
> +
> +static struct fw_component *kobj_to_fw_component(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct fw_component, kobj);
> +}
> +
> +/* A UUID split over two 64-bit registers */
> +struct uuid_regs {
> +	u64 uuid_lo;
> +	u64 uuid_hi;
> +};
> +
> +static struct kset *lfa_kset;
> +static struct workqueue_struct *fw_comps_update_wq;
> +static struct work_struct fw_comps_update_work;
> +static struct attribute *component_default_attrs[LFA_ATTR_NR_IMAGES + 1];
> +
> +/*
> + * A successful component activation might change the number of available
> + * components, leading to a re-order and thus re-assignment of the sequence IDs.
> + * The lock protects the connection between a firmware component (through its
> + * user visible UUID) and the sequence IDs. Anyone doing an SMC call with
> + * a sequence ID needs to take the readers lock. Doing an activation requires
> + * the writer lock, as that process might change the assocications.
> + */
> +struct rw_semaphore smc_lock;
> +
> +static const struct attribute_group comp_attr_group = {
> +	.attrs = component_default_attrs,
> +};
> +
> +static const struct attribute_group *comp_default_groups[] = {
> +	&comp_attr_group,
> +	NULL
> +};
> +
> +static void component_release(struct kobject *kobj)
> +{
> +	struct fw_component *comp = kobj_to_fw_component(kobj);
> +
> +	kfree(comp);
> +}
> +
> +static const struct kobj_type component_ktype = {
> +	.release = component_release,
> +	.sysfs_ops = &kobj_sysfs_ops,
> +	.default_groups = comp_default_groups,
> +};
> +
> +static void delete_fw_component_node(struct fw_component *comp)
> +{
> +	kobject_del(&comp->kobj);
> +	kobject_put(&comp->kobj);
> +}
> +
> +static void remove_invalid_fw_components(struct work_struct *work)
> +{
> +	struct kobject *kobj, *tmp;
> +	struct list_head comps_to_delete = LIST_HEAD_INIT(comps_to_delete);
> +
> +	/*
> +	 * After an activation, firmware components might have been removed
> +	 * from the inventory. Move those components into a private temporary
> +	 * list, where they can be safely destroyed separately, as kobject_del()
> +	 * would be trying to take the same kset->list_lock.
> +	 */
> +	spin_lock(&lfa_kset->list_lock);
> +	list_for_each_entry_safe(kobj, tmp, &lfa_kset->list, entry) {
> +		struct fw_component *comp = kobj_to_fw_component(kobj);
> +
> +		if (comp->fw_seq_id == -1)
> +			list_move_tail(&kobj->entry, &comps_to_delete);
`update_fw_components_tree()` invalidates all sequence IDs, releases the 
list lock, and restores the components individually during enumeration. 
A deletion worker queued by an earlier refresh can run in that interval. 
It only takes the list lock, so it can see the temporary `fw_seq_id == 
-1` values and detach components that are still present in the new 
inventory.

Could the worker's selection and detachment of invalid entries be 
synchronized against enumeration?
> +	}
> +	spin_unlock(&lfa_kset->list_lock);
> +
> +	list_for_each_entry_safe(kobj, tmp, &comps_to_delete, entry) {
> +		struct fw_component *comp = kobj_to_fw_component(kobj);
> +
> +		delete_fw_component_node(comp);
> +	}
> +}
> +
> +static void set_component_flags(struct fw_component *comp, int seq_id,
> +				u32 comp_flags, u64 reg_current_ver,
> +				u64 reg_pending_ver)
> +{
> +	comp->fw_seq_id = seq_id;
> +	comp->current_version = reg_current_ver;
> +	comp->pending_version = reg_pending_ver;
> +	comp->activation_capable = !!(comp_flags & BIT(0));
> +	comp->activation_pending = !!(comp_flags & BIT(1));
> +	comp->may_reset_cpu = !!(comp_flags & BIT(2));
> +	/* cpu_rendezvous_optional bit has inverse logic in the spec */
> +	comp->cpu_rendezvous = !(comp_flags & BIT(3));
> +}
> +
> +static int get_nr_lfa_components(void)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		.a0 = ARM_SMCCC_LFA_GET_INFO,
> +		.a1 = 0,		 /* lfa_info_selector = 0 */
> +	};
> +
> +	/* No need for the smc_lock, since no sequence IDs are involved. */
> +	arm_smccc_1_2_invoke(&regs, &regs);
> +	if (regs.a0 != LFA_SUCCESS)
> +		return (s64)regs.a0;
> +
> +	return regs.a1;
> +}
> +
> +static int update_fw_components_node(char *fw_uuid, int seq_id,
> +				     u32 comp_flags, u64 reg_current_ver,
> +				     u64 reg_pending_ver)
> +{
> +	struct fw_component *comp;
> +	struct kobject *kobj;
> +
> +	/*
> +	 * If a component is already in the components list then we just update
> +	 * its flags and seq_id instead of trying to recreate it.
> +	 */
> +	spin_lock(&lfa_kset->list_lock);
> +	list_for_each_entry(kobj, &lfa_kset->list, entry) {
> +		if (!strcmp(kobject_name(kobj), fw_uuid)) {
> +			struct fw_component *comp = kobj_to_fw_component(kobj);
> +
> +			set_component_flags(comp, seq_id, comp_flags,
> +					reg_current_ver, reg_pending_ver);
> +			spin_unlock(&lfa_kset->list_lock);
> +
> +			return 0;
> +		}
> +	}
> +	spin_unlock(&lfa_kset->list_lock);
> +
> +	comp = kzalloc_obj(*comp);
> +	if (!comp)
> +		return -ENOMEM;
> +
> +	comp->kobj.kset = lfa_kset;
> +	comp->cpu_rendezvous_forced = true;
> +	set_component_flags(comp, seq_id, comp_flags, reg_current_ver,
> +			    reg_pending_ver);
> +	if (kobject_init_and_add(&comp->kobj, &component_ktype, NULL,
> +				 "%s", fw_uuid)) {
> +		kobject_put(&comp->kobj);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Creates/updates the list of components provided by the firmware.
> + * Must be called with the smc_lock held if called outside of initialisation.
> + */
> +static int update_fw_components_tree(void)
> +{
> +	struct arm_smccc_1_2_regs regs = { 0 }, res;
> +	struct uuid_regs comp_uuid;
> +	struct kobject *kobj;
> +	char comp_id_str[40];
> +	int ret, num_of_components;
> +
> +	num_of_components = get_nr_lfa_components();
> +	if (num_of_components <= 0) {
> +		pr_err("Error getting number of LFA components\n");
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * Invalidate fw_seq_ids (-1) for all components as the seq_ids and the
> +	 * number of firmware components in the LFA agent may change after a
> +	 * successful activation attempt. Negate all components flags as well.
> +	 */
> +	spin_lock(&lfa_kset->list_lock);
> +	list_for_each_entry(kobj, &lfa_kset->list, entry) {
> +		struct fw_component *comp = kobj_to_fw_component(kobj);
> +
> +		set_component_flags(comp, -1, 0b1000, 0, 0);
> +	}
> +	spin_unlock(&lfa_kset->list_lock);
> +
> +	regs.a0 = ARM_SMCCC_LFA_GET_INVENTORY;
> +	for (int i = 0; i < num_of_components; i++) {
> +		regs.a1 = i; /* fw_seq_id to be queried */
> +		arm_smccc_1_2_invoke(&regs, &res);
> +		if (res.a0 == LFA_SUCCESS) {
> +			comp_uuid.uuid_lo = res.a1;
> +			comp_uuid.uuid_hi = res.a2;
> +
> +			snprintf(comp_id_str, sizeof(comp_id_str), "%pUb",
> +				 &comp_uuid);
> +			ret = update_fw_components_node(comp_id_str, i, res.a3,
> +							res.a4, res.a5);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	/*
> +	 * Removing non-valid component directories at the end of an activation.
> +	 * We can't remove the sysfs attributes while in the respective
> +	 * _store() handler, so have to postpone the list removal to a
> +	 * workqueue.
> +	 */
> +	queue_work(fw_comps_update_wq, &fw_comps_update_work);
> +
> +	return 0;
> +}
> +
> +static int lfa_cancel(void *data)
> +{
> +	struct fw_component *comp = data;
> +	struct arm_smccc_1_2_regs regs = { 0 };
> +
> +	down_read(&smc_lock);
> +	regs.a0 = ARM_SMCCC_LFA_CANCEL;
> +	regs.a1 = comp->fw_seq_id;
> +	arm_smccc_1_2_invoke(&regs, &regs);
> +	up_read(&smc_lock);
> +
> +	/*
> +	 * When firmware activation is called with "skip_cpu_rendezvous=1",
> +	 * LFA_CANCEL can fail with LFA_BUSY if the activation could not be
> +	 * cancelled.
> +	 */
> +	if (regs.a0 == LFA_SUCCESS) {
> +		pr_info("Activation cancelled for component %s\n",
> +			kobject_name(&comp->kobj));
> +	} else {
> +		pr_err("Activation not cancelled for component %s: %s (%ld)\n",
> +		       kobject_name(&comp->kobj), lfa_error_string(regs.a0),
> +		       regs.a0);
> +		return -EINVAL;
> +	}
> +
> +	return regs.a0;
> +}
> +
> +/*
> + * Try a single activation call. The smc_lock writer lock must be held,
> + * and it must be called from inside stop_machine() when CPU rendezvous is
> + * required.
> + * Returns a Linux error code, not an LFA one.
> + */
> +static int call_lfa_activate(void *data)
> +{
> +	/*
> +	 * Use the cached value of the rendezvous status, to be consistent
> +	 * with how we were called (via stop_machine() or not).
> +	 * As we do not support updates requiring a CPU reset (yet),
> +	 * we can skip the entry point and context ID parameters.
> +	 */
> +	struct fw_component *comp = data;
> +	struct arm_smccc_1_2_regs regs = {
> +		.a0 = ARM_SMCCC_LFA_ACTIVATE,
> +		.a1 = comp->fw_seq_id,
> +		.a2 = !comp->use_cpu_rendezvous,
> +		.a3 = 0,	/* unused entry point */
> +		.a4 = 0,	/* unused context ID */
> +	};
> +
> +	touch_nmi_watchdog();
> +	arm_smccc_1_2_invoke(&regs, &regs);
> +	if ((s64)regs.a0 < 0)
> +		return lfa_to_linux_errno((s64)regs.a0);
> +
> +	if (regs.a1 & LFA_ACTIVATE_CALL_AGAIN)
> +		return -EAGAIN;
> +
> +	return 0;
> +}
> +
> +static int activate_fw_component(struct fw_component *comp)
> +{
> +	ktime_t end = ktime_add_ms(ktime_get(), LFA_ACTIVATE_BUDGET_MS);
> +	int ret;
> +
> +	do {
> +		down_write(&smc_lock);
> +		/*
> +		 * cpu_rendezvous_forced is set by the administrator, via sysfs,
> +		 * cpu_rendezvous is dictated by each firmware component.
> +		 * All cores call into the firmware with the same arguments.
> +		 */
> +		comp->use_cpu_rendezvous = comp->cpu_rendezvous_forced ||
> +					   comp->cpu_rendezvous;
> +		if (comp->use_cpu_rendezvous) {
> +			cpus_read_lock();
> +			ret = stop_machine(call_lfa_activate, comp,
> +					   cpu_online_mask);
stop_machine() takes cpus_read_lock internally. Recursive reader 
acquisition can deadlock if hotplug writer intervenes between the 
acquisitions. Could we drop the outer lock/unlock or use 
stop_machine_cpuslocked() ?
> +			cpus_read_unlock();
> +		} else {
> +			ret = call_lfa_activate(comp);
> +		}
> +		if (!ret)
> +			update_fw_components_tree();

The return value is ignored here. Since activation can reorder sequence 
IDs, a failed refresh can leave stale or partially rebuilt mappings 
available to subsequent operations.

Could refresh failures be handled explicitly, with further component 
operations prevented from using unverified mappings? Activation may 
already have succeeded, so that result should be distinguished from 
failure to refresh the inventory.

> +		up_write(&smc_lock);
> +
> +		if (!ret)
> +			return 0;
> +
> +		if (ret == -EAGAIN || ret == -EBUSY) {
> +			if (ktime_before(ktime_get(), end)) {
> +				if (msleep_interruptible(LFA_ACTIVATE_DELAY_MS))
> +					ret = -EINTR;
> +			} else {
> +				ret = -ETIMEDOUT;
> +			}
> +		}
> +	} while (ret == -EAGAIN || ret == -EBUSY);
> +
> +	lfa_cancel(comp);
> +
> +	pr_err("LFA_ACTIVATE for component %s failed\n",
> +	       kobject_name(&comp->kobj));
> +
> +	return ret;
> +}
> +
> +static int prime_fw_component(struct fw_component *comp)
> +{
> +	ktime_t end = ktime_add_ms(ktime_get(), LFA_PRIME_BUDGET_MS);
> +	bool retry = false;
> +	int ret = 0;
> +
> +	if (comp->may_reset_cpu) {
> +		pr_err("CPU reset not supported by kernel driver\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * LFA_PRIME will return 1 in regs.a1 if the firmware priming
> +	 * is still in progress. In that case LFA_PRIME will need to
> +	 * be called again.
> +	 * regs.a1 will become 0 once the prime process completes.
> +	 */
> +	do {
> +		struct arm_smccc_1_2_regs regs = {
> +			.a0 = ARM_SMCCC_LFA_PRIME,
> +		};
> +
> +		touch_nmi_watchdog();
> +		down_read(&smc_lock);
> +		regs.a1 = comp->fw_seq_id;
> +		arm_smccc_1_2_invoke(&regs, &regs);
> +		up_read(&smc_lock);
> +
> +		if ((s64)regs.a0 < 0) {
> +			pr_err("LFA_PRIME for component %s failed: %s (%ld)\n",
> +			       kobject_name(&comp->kobj),
> +			       lfa_error_string((s64)regs.a0), regs.a0);
> +			return lfa_to_linux_errno((s64)regs.a0);
> +		}
> +
> +		if ((regs.a1 & LFA_PRIME_CALL_AGAIN)) {
> +			if (ktime_before(ktime_get(), end)) {
> +				if (msleep_interruptible(LFA_PRIME_DELAY_MS)) {
> +					ret = -EINTR;
> +					break;
> +				}
> +			} else {
> +				pr_err("LFA_PRIME for component %s timed out",
> +				       kobject_name(&comp->kobj));
> +				ret = -ETIMEDOUT;
> +				break;
> +			}
> +			retry = true;
> +		}
> +	} while (retry);

'retry' is initialized to false before the loop, but once CALL_AGAIN 
sets it to true, it is not cleared before subsequent PRIME calls. If 
CALL_AGAIN is followed by successful completion, the loop will continue 
instead of proceeding to ACTIVATE.

If subsequent calls continue reporting completion, it also bypasses the 
sleep and timeou checks inside the CALL_AGAIN branch.

Could we derive 'retry' from response of PRIME SMC call?

> +
> +	if (ret)
> +		lfa_cancel(comp);
> +
> +	return ret;
> +}
> +
> +static ssize_t activation_capable_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct fw_component *comp = kobj_to_fw_component(kobj);
> +
> +	return sysfs_emit(buf, "%d\n", comp->activation_capable);
> +}
> +
> +/* called with smc_lock held */
> +static void _update_fw_component_pending(struct fw_component *comp)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		.a0 = ARM_SMCCC_LFA_GET_INVENTORY,
> +		.a1 = comp->fw_seq_id,
> +	};
> +
> +	arm_smccc_1_2_invoke(&regs, &regs);
> +
> +	if (regs.a0 == LFA_SUCCESS)
> +		comp->activation_pending = !!(regs.a3 & BIT(1));
> +}
> +
> +static void update_fw_component_pending(struct fw_component *comp)
> +{
> +	down_read(&smc_lock);
> +	_update_fw_component_pending(comp);
> +	up_read(&smc_lock);
> +}
> +
> +static ssize_t activation_pending_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct fw_component *comp = kobj_to_fw_component(kobj);
> +
> +	/*
> +	 * Activation pending status can change anytime thus we need to update
> +	 * and return its current value
> +	 */
> +	update_fw_component_pending(comp);
> +
> +	return sysfs_emit(buf, "%d\n", comp->activation_pending);
> +}
> +
> +static ssize_t may_reset_cpu_show(struct kobject *kobj,
> +				  struct kobj_attribute *attr, char *buf)
> +{
> +	struct fw_component *comp = kobj_to_fw_component(kobj);
> +
> +	return sysfs_emit(buf, "%d\n", comp->may_reset_cpu);
> +}
> +
> +static ssize_t cpu_rendezvous_show(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buf)
> +{
> +	struct fw_component *comp = kobj_to_fw_component(kobj);
> +
> +	return sysfs_emit(buf, "%d\n", comp->cpu_rendezvous);
> +}
> +
> +static ssize_t force_cpu_rendezvous_store(struct kobject *kobj,
> +					  struct kobj_attribute *attr,
> +					  const char *buf, size_t count)
> +{
> +	struct fw_component *comp = kobj_to_fw_component(kobj);
> +	int ret;
> +
> +	ret = kstrtobool(buf, &comp->cpu_rendezvous_forced);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t force_cpu_rendezvous_show(struct kobject *kobj,
> +					 struct kobj_attribute *attr, char *buf)
> +{
> +	struct fw_component *comp = kobj_to_fw_component(kobj);
> +
> +	return sysfs_emit(buf, "%d\n", comp->cpu_rendezvous_forced);
> +}
> +
> +static ssize_t current_version_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct fw_component *comp = kobj_to_fw_component(kobj);
> +	u32 maj, min;
> +
> +	maj = upper_32_bits(comp->current_version);
> +	min = lower_32_bits(comp->current_version);
> +
> +	return sysfs_emit(buf, "%u.%u\n", maj, min);
> +}
> +
> +static ssize_t pending_version_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct fw_component *comp = kobj_to_fw_component(kobj);
> +	struct arm_smccc_1_2_regs regs = { 0 };
> +
> +	/*
> +	 * Similar to activation pending, this value can change following an
> +	 * update, we need to retrieve fresh info instead of stale information.
> +	 * Update the activation_pending status on the way.
> +	 */
> +	down_read(&smc_lock);
> +	regs.a0 = ARM_SMCCC_LFA_GET_INVENTORY;
> +	regs.a1 = comp->fw_seq_id;
> +	arm_smccc_1_2_invoke(&regs, &regs);
> +	up_read(&smc_lock);
> +	if (regs.a0 == LFA_SUCCESS) {
> +		comp->activation_pending = !!(regs.a3 & BIT(1));
> +		if (regs.a5 != 0 && comp->activation_pending) {
> +			u32 maj, min;
> +
> +			comp->pending_version = regs.a5;
> +			maj = upper_32_bits(regs.a5);
> +			min = lower_32_bits(regs.a5);
> +
> +			return sysfs_emit(buf, "%u.%u\n", maj, min);
> +		}
> +
> +		return 0;
> +	}
> +
> +	return lfa_to_linux_errno((s64)regs.a0);
> +}
> +
> +static ssize_t activate_store(struct kobject *kobj, struct kobj_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct fw_component *comp = kobj_to_fw_component(kobj);
> +	bool activate;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &activate);
> +	if (ret)
> +		return ret;
> +
> +	if (!activate)
> +		return count;
> +
> +	ret = prime_fw_component(comp);
> +	if (ret)
> +		return ret;
> +
> +	ret = activate_fw_component(comp);
> +	if (ret)
> +		return ret;
> +
> +	pr_info("%s: successfully activated\n", kobject_name(&comp->kobj));
> +
> +	return count;
> +}
> +
> +static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	struct fw_component *comp = kobj_to_fw_component(kobj);
> +	bool cancel;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &cancel);
> +	if (ret)
> +		return ret;
> +
> +	if (!cancel)
> +		return count;
> +
> +	ret = lfa_cancel(comp);
> +	if (ret != 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static struct kobj_attribute comp_attrs_group[LFA_ATTR_NR_IMAGES] = {
> +	[LFA_ATTR_CURRENT_VERSION]	= __ATTR_RO(current_version),
> +	[LFA_ATTR_PENDING_VERSION]	= __ATTR_RO(pending_version),
> +	[LFA_ATTR_ACT_CAPABLE]		= __ATTR_RO(activation_capable),
> +	[LFA_ATTR_ACT_PENDING]		= __ATTR_RO(activation_pending),
> +	[LFA_ATTR_MAY_RESET_CPU]	= __ATTR_RO(may_reset_cpu),
> +	[LFA_ATTR_CPU_RENDEZVOUS]	= __ATTR_RO(cpu_rendezvous),
> +	[LFA_ATTR_FORCE_CPU_RENDEZVOUS]	= __ATTR_RW(force_cpu_rendezvous),
> +	[LFA_ATTR_ACTIVATE]		= __ATTR_WO(activate),
> +	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
> +};
> +
> +static void init_component_default_attrs(void)
> +{
> +	for (int i = 0; i < LFA_ATTR_NR_IMAGES; i++)
> +		component_default_attrs[i] = &comp_attrs_group[i].attr;
> +	component_default_attrs[LFA_ATTR_NR_IMAGES] = NULL;
> +}
> +
> +static void clean_fw_components_tree(void)
> +{
> +	struct kobject *kobj, *tmp;
> +	struct list_head comp_to_delete;
> +
> +	INIT_LIST_HEAD(&comp_to_delete);
> +
> +	spin_lock(&lfa_kset->list_lock);
> +	list_for_each_entry_safe(kobj, tmp, &lfa_kset->list, entry) {
> +		list_move_tail(&kobj->entry, &comp_to_delete);
> +	}
> +	spin_unlock(&lfa_kset->list_lock);
> +
> +	list_for_each_entry_safe(kobj, tmp, &comp_to_delete, entry) {
> +		struct fw_component *comp = kobj_to_fw_component(kobj);
> +
> +		delete_fw_component_node(comp);
> +	}
> +}
> +
> +static bool lfa_smccc_has_all_functions(void)
> +{
> +	struct arm_smccc_1_2_regs regs = { 0 }, res;
> +	u32 fn_id;
> +
> +	regs.a0 = ARM_SMCCC_LFA_FEATURES;
> +
> +	for (fn_id = ARM_SMCCC_LFA_GET_INFO;
> +	     fn_id <= ARM_SMCCC_LFA_CANCEL;
> +	     fn_id++) {
> +		regs.a1 = fn_id;
> +		arm_smccc_1_2_invoke(&regs, &res);
> +		if (res.a0)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +static int lfa_smccc_probe(struct arm_smccc_device *sdev)
> +{
> +	struct arm_smccc_1_2_regs regs = { 0 };
> +	int err;
> +
> +	/* The LFA spec requires SMCCC v1.2 or higher. */
> +	if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
> +		return -EOPNOTSUPP;
> +
> +	regs.a0 = ARM_SMCCC_LFA_VERSION;
> +	arm_smccc_1_2_invoke(&regs, &regs);
> +	if ((s32)regs.a0 == LFA_NOT_SUPPORTED)
> +		return -ENODEV;
> +
> +	if (!lfa_smccc_has_all_functions())
> +		return -EOPNOTSUPP;
> +
> +	pr_info("Live Firmware Activation: detected v%d.%d\n",
> +		upper_16_bits(regs.a0), lower_16_bits(regs.a0));
> +
> +	fw_comps_update_wq = alloc_workqueue("fw_comps_update_wq",
> +					     WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
> +	if (!fw_comps_update_wq) {
> +		pr_err("Live Firmware Activation: Failed to allocate workqueue.\n");
> +		return -ENOMEM;
> +	}
> +	INIT_WORK(&fw_comps_update_work, remove_invalid_fw_components);
> +
> +	init_component_default_attrs();
> +	lfa_kset = kset_create_and_add("lfa", NULL, firmware_kobj);
> +	if (!lfa_kset) {
> +		destroy_workqueue(fw_comps_update_wq);
> +		return -ENOMEM;
> +	}
> +
> +	init_rwsem(&smc_lock);
> +
> +	err = update_fw_components_tree();
> +	if (err != 0) {
> +		kset_unregister(lfa_kset);
> +		destroy_workqueue(fw_comps_update_wq);
> +	}
If fw_components enumeration creates few component kobjects and then 
fails, the failure case here only unregisters kset and destroys 
workqueue. Could we call clean_fw_components_tree() in the failure path 
before unregistering lfa_kset ?
> +
> +	return err;
> +}
> +
> +static void lfa_smccc_remove(struct arm_smccc_device *sdev)
> +{
> +	clean_fw_components_tree();
> +	flush_workqueue(fw_comps_update_wq);
> +	destroy_workqueue(fw_comps_update_wq);
> +	kset_unregister(lfa_kset);
> +}
> +
> +static const struct arm_smccc_device_id lfa_smccc_id_table[] = {
> +	{ .func_id = ARM_SMCCC_LFA_VERSION },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(arm_smccc, lfa_smccc_id_table);
> +
> +static struct arm_smccc_driver smccc_lfa_driver = {
> +	.name		= KBUILD_MODNAME,
> +	.probe		= lfa_smccc_probe,
> +	.remove		= lfa_smccc_remove,
> +	.id_table	= lfa_smccc_id_table,
> +};
> +
> +module_arm_smccc_driver(smccc_lfa_driver);
> +
> +MODULE_DESCRIPTION("ARM Live Firmware Activation (LFA)");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> index 5dc768ac4143a..848d992141568 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c
> @@ -100,6 +100,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
>   		.requires_smc   = true,
>   		.device_name    = "arm-rsi",
>   	},
> +	{
> +		.func_id        = ARM_SMCCC_LFA_VERSION,
> +		.requires_smc   = false,
> +		.device_name    = "arm-smccc-lfa",
> +	},
>   };
>   
>   static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index 4de81848fe2ee..381d527c16a4c 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.h
> @@ -304,6 +304,21 @@
>   			   ARM_SMCCC_OWNER_STANDARD,		\
>   			   0x53)
>   
> +/* Live Firmware Activation (LFA) calls (defined by ARM DEN0147) */
> +#define ARM_SMCCC_LFA_FN_BASE					\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
> +			   ARM_SMCCC_SMC_64,			\
> +			   ARM_SMCCC_OWNER_STANDARD,		\
> +			   0x2e0)
> +#define ARM_SMCCC_LFA_FN(n)		(ARM_SMCCC_LFA_FN_BASE + (n))
> +#define ARM_SMCCC_LFA_VERSION		ARM_SMCCC_LFA_FN(0)
> +#define ARM_SMCCC_LFA_FEATURES		ARM_SMCCC_LFA_FN(1)
> +#define ARM_SMCCC_LFA_GET_INFO		ARM_SMCCC_LFA_FN(2)
> +#define ARM_SMCCC_LFA_GET_INVENTORY	ARM_SMCCC_LFA_FN(3)
> +#define ARM_SMCCC_LFA_PRIME		ARM_SMCCC_LFA_FN(4)
> +#define ARM_SMCCC_LFA_ACTIVATE		ARM_SMCCC_LFA_FN(5)
> +#define ARM_SMCCC_LFA_CANCEL		ARM_SMCCC_LFA_FN(6)
> +
>   /*
>    * Return codes defined in ARM DEN 0070A
>    * ARM DEN 0070A is now merged/consolidated into ARM DEN 0028 C

Regards,

Veda

