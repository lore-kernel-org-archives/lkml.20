Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793791440;
	b=Laa5bNrHy7eQUKdiQ0xy7plmzbBLpY90PNRbu1ablZ+rZ43bySydEnKmxEvDjX76nCgJ
	 AbwR1QuWbgpKGlzpO9XZmRc9CvWV6oDGB42j+KTQIj2ObRubvkAEXLisj0ia5qt7e+f95
	 weYFnhA2G5slcViaZEDUZStbd8rVA4j2wJcjLjUjEMswx+O8rlnNt9sMePWhVHORiQ/vJ
	 0h5gyesfQ0o0fF7uWQP79Tgn0AmLDCE2xa3jQrPyWh/WG0Xh39zO4y5mqn5X5NbEKgWym
	 VVxtkgvWdfGTFFFkUD6K8DUL1EFO4Xb+lZxAL2v1P/kr55VDhGh7wz6n7SvzpJUZCrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791440;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
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
	bh=tmCGdJ8ICJLuqjCemmxrHvDkkOi2nHpa5vhXBiTxYfc=;
	b=onIs+ssVMnjk9qpakdjrjSnkX+mgXmh37prM3qEM3KpwW85P7wzVPJNwyg3epI5ad4/D
	 BYpALz0EJ8bEoZMAmBGfQJD/c2iyXQNaAyuwdwCpKKac1h//cpjL/naQfNsQjAYpTcjfx
	 hg5fiykXC9B4bLKWalyaTDESzL0mcikjDYJkodEQKpRWQ8qRScr5TqJYTjVu7rUMHVErO
	 7H2cCdPXCADVyO0lw1lkhpGeqi7gHQWSoO6kGYjlsEe0ZltMnB5dB6mv51Lq1JOC25RRG
	 Yw3K+QGzzgNk6+hULHLX6H4g6tQm+VdpI/bLFudE+Udxu6sJyBpYsgPejQDYlDj3eMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mobileye.com;
	spf=pass smtp.mailfrom=mobileye.com;
	dkim=pass header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=k5X+iqXJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.69
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013069.outbound.protection.outlook.com [40.107.159.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4DF606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF4DF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=k5X+iqXJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDp52DsfE4xz2l7A0DRcgabV8yvst0ykJUNOokQb5B8BVsztxE0YUEqUxzPx/NWwTn8DgsZXUZ9Jg2TCpCDXv0zySybdsAVcbHJ3sfhI+ORex87hA1mhrbB03i8loGIVr/dhyXhWiJfjwkgV2CNkd3zdYRzGLoEU5oV6ieu2qYs3szXChEoi6l66wdEpxFDjCbCew2wZFDWByQy+OB4mqOgz+BsElHk3hVM4C7fKdTSz197BTgeePWRZPN7pY36ZvdCWSeFyZGlxS4udzeuOZZmt9efmP5r3SLK+6Z76YdD6HdAcAzr5RUjfgk4yK1Ar+khXfxe/8LqXU/qKrQdLHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmCGdJ8ICJLuqjCemmxrHvDkkOi2nHpa5vhXBiTxYfc=;
 b=CUm/TUgcF2FVUoVII/wd+1McUHNtj4jpAje9sDz/ys6aSH5YFREdnSQx1//uZFkAqTc4Ql46ooagPMhKF629X0daNVO8IYM+AvOhQBAtIb7in82SdDcCgDUNKxevze71H4olGJBYsGaU6qaf+3LaKSLtXDXS2ZK+Ua7FrwawIs2syw2FgsDBpG4+ZSnOicUxZkIE6QnDsIf87tK/FQ3AGYkSgo5lAKv7+NL1zJ5K4C0IM7B5YG8SLTCou/LXfRkTolh5QndpxVp0/72+IZdVfDlZrbVrDkX0U7pvOKGbynfyAnvRiAL2fQ5g42DzKTTBHAyeD+pe9FVeBPOx8g9ztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmCGdJ8ICJLuqjCemmxrHvDkkOi2nHpa5vhXBiTxYfc=;
 b=k5X+iqXJmM/H4EFanLX8gZCf/LNHCqt2TeKcqvaT1VgVa7l7CFb6ZIoH2bgE5A4tFSPq2YLJ1e/1QGMvQxtCM3CFF/qN4GeXMmCi+k7O/ZuheJgX0xCPiyxC7hOBSJzbDZGMfh+1+c1T/vEj5KjEbdUAzbiJy6jZzyEy2cK7RFo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22) by DU4PR09MB8388.eurprd09.prod.outlook.com
 (2603:10a6:10:627::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:23:55 +0000
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2]) by ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2%4]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 11:23:55 +0000
Message-ID: <507f3761-1104-4d15-8fb0-c2fca037ddd4@mobileye.com>
Date: Wed, 4 Nov 2026 13:23:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] riscv: accept the atomic extensions this kernel
 was built with
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
 torvalds@linux-foundation.org, olof@lixom.net,
 aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
 Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com>
 <20261101-lrsc-only-v4-2-4e1d010463b3@mobileye.com>
 <20261103-pushcart-very-04a34d0ffb0e@spud>
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
In-Reply-To: <20261103-pushcart-very-04a34d0ffb0e@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::15) To ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22)
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
X-MS-TrafficTypeDiagnostic: ZR6PR09MB889505:EE_|DU4PR09MB8388:EE_
X-MS-Office365-Filtering-Correlation-Id: e927a3b6-bf9a-495e-9eee-08df3a661ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|7416014|10067099003|18002099003|22082099003|3023799007|56012099006|4143699003|11063799006|261022105027099003|261021121427099003|261022075727099003|261021135927099003|261026121527099003|261102124527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	eYyFuLUTqjPNYNwbioiRYccvQ1xgIhn8NX+sCOBUFWGQu+EHm957WkDSvgbtfV6wDbUhKONy9Q4ED5asRSk39IqcnffstZWVGlGjYmTa0EDThsRneU/RDj5+DUPQgEUN0IPcYi2j6NGVvO4y1v2E9ya5F1bBWwQk+8ftGjwp2+ahiH38HXF7ogoikSY0qAG7boFagzSTfV3ag7bMxHcENNzWTJAnK2ZAspFuLx/sKHR8RrPiT4ho7hIOFBQi2TbrjOAuQ4O41ltU7YYdQND4elkWPf6NlkNh5847VNvYtehh05aTpI+iqbJZJTojuOjrS+1UJXTR4Kkwsiv0aiL0MT+VIMmMn0WkRMt+625U97H0OX6Bv2QRk45Z/gJSjnSFy+okaJW1Lb9WHrofRYQexwzG1poMoRUZwerZBX2NkeZAj62PKZ5cnnQ/GRx6I7pr9bJtAFJHqmHxJQv64G12SWfoJSAbgFArx++tQhUHQqwlLimHCspvnPMp6yP1tZ9hr4I2hyQgmgYzFih1JRsE/WR/3O//mvSGAdqorwBApfThDW5OgnGnlBbg75uPj5JoNyuq91/M28Z10z/A+MM4142YT4X/tyy1qENA2/xb5PiV/bfFmhBa/SPJiwp3+XUqu5CJxwS1yF2dRWOGD51gHooGkDS1nb1lg6GRAnxE90Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR09MB889505.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(7416014)(10067099003)(18002099003)(22082099003)(3023799007)(56012099006)(4143699003)(11063799006)(261022105027099003)(261021121427099003)(261022075727099003)(261021135927099003)(261026121527099003)(261102124527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUpPendLTHlCWXR1VWNXZEJxc2tVRjE0U25jTFVLMmM3VFM5aGpXaCtOZzdn?=
 =?utf-8?B?bEJiUnhnQ1BlMFJ4N21lZ0VPTStFYzZRQ2xkWVl6NzJDNTZPQzA0alRUWjRp?=
 =?utf-8?B?KzA4NGRpT29PQ1JrUldkL044QWUrNEt4L0hSMm9pdlExRFhHeXhMa0xXeTFC?=
 =?utf-8?B?QUJDaG1RS1pKbVQzSVBzdHB1Z1NOWjBNeDNJUEZ4aVdFYmt1NVNERkt5eFJG?=
 =?utf-8?B?R0N6cS9hYlZRdXlaMC9JTW4yWnJPZURLSGxId3RZSkIxV05KS1Y4UnNMU3hj?=
 =?utf-8?B?ZWVkMzcyelJGNzViUzQwbkFGMC9JWWdDTGlReWF3NXc3cFEzSmZQdFJyZ2pQ?=
 =?utf-8?B?WXlmclVOU3FUc1lwVk1jUHY5M1ozc1NQU0dZRnNxQVRneDMrTFcwWVo2Mm5s?=
 =?utf-8?B?VUs3ZzdkNS92OTV6TnVNYWJ0eXBjTW0zUFltSUlLbzdKamY3b1Zza0ZJcVVh?=
 =?utf-8?B?aTRzYmxJcnFMTTlTajk0TGVoWWdvbDJiZDJRcmZGZm9aREg1aXM1cGtEaEoz?=
 =?utf-8?B?R25CbzR6a2FrQ25pNEo0WjJPWWVtOW9nWjdQTkg0QjJyblhkVmlVK2FJWWtC?=
 =?utf-8?B?VVNoczh0bzQ0WTlLYXhPSWVVTVN3UlFmZ2VZcStLeXJZcVEvWEE1YkgvRHMw?=
 =?utf-8?B?Z0NoOU9ldmd5YmlFcVlMR0dVT2p6cWxQUHUyWUhDaGtMcS9USmkrbmhQM2lD?=
 =?utf-8?B?TVdxcXF3TXBaNGJaTWtPaEpZSFQ4cHpoSDV5a09Gb2dEM0JwaWMwQjRZRjY5?=
 =?utf-8?B?dTFVS0JuWXNsanloZzZ2S1lMR25UdDVyRzRtZmg5TmprWGdxbzVjZGx3NFph?=
 =?utf-8?B?UHVRYWRIeGlKNEdZaE1wSE1BekZ6d0JJQUdWRzJpQ3JzalVhSlUxc21xUklv?=
 =?utf-8?B?U2VVTmxpRlhlQ1RnR2kxWjZwYjlqY0xSYTN5dHdYdkpTUkJmMklhTmNKSk5o?=
 =?utf-8?B?NU1FS2ZWNUlPdmdiRWVkN1hvQWc0dzhBaEFvZGw0QjYzSXFCeWRMdEtTcE13?=
 =?utf-8?B?Tk1ST3dqSVp0QkpEa21vbDRtRURKVEJPWEwzWkZNOFFiYUduTVluWmFDMWZq?=
 =?utf-8?B?TVZRMXZ5RHgzOHZLL3FITHV3bDAreFpCVnBLVmQ5NHQ3TDRzVlpnRWxjUktv?=
 =?utf-8?B?YmFHSisvRVVTbCt6TFZJZnlEL1BJRHpNSXQvWGtYd2hMSGp5NWFXek9UOWJQ?=
 =?utf-8?B?OXhSMCsrekpxMDJmQkFQVUlKVGpScXpYU2ovZ2cvS0huMDUwamZnaE0rRUlI?=
 =?utf-8?B?Um1zVkd4SnNpeUl1QkpONmNRc2xCUzJoempuVkNzVXBrbVNPMnd0SU53aWoy?=
 =?utf-8?B?UmM2aGZncVJGMXlNbFozaGJpeXZIbFBJTU1KZ1lJdHVLZG5PN0Nxem9keVVt?=
 =?utf-8?B?aUovNlFzbU5aOUw4endodzgrNk51V1piaTdKQW9UQVhoR1JnbFFVM0d0dDJk?=
 =?utf-8?B?TXdWaENBZVVJb3Nwb0JEMjZqd0grWHRGZkhVcTdVaUxlVmJuY0RQUnRRRjMv?=
 =?utf-8?B?TXc0aW9qUlRyQlRkd3dkN1pvRitWenA1OVNJNmpaNUxWcTE3YTQyUWlxbUdH?=
 =?utf-8?B?VS9WQUtwRTFUNlVIOW4zRGRTNzJlK1NQMnJHZ3RRUVJUNXdZdmtHTkQvcXlm?=
 =?utf-8?B?bk1sbmhoZTZ2ZFdMeFM4MVkxQUI0NTkvYmM3RUlyRWJDREcrZjBOWEFvK0Fv?=
 =?utf-8?B?cmxTV3BhdjFXNFRLdzlkZUpVRTJQVG04bXZhRVB2bXZhTVF2UUc2ckRVVlhH?=
 =?utf-8?B?YlBqNVFQR0JuVkxkNFRDT2xHLzFGL2g1RkRzK3Y0UFMvSks5WTBuclhKeFZw?=
 =?utf-8?B?aG5BUmpjY3Jydm0vTVd0UmFKcEt6VXNoQ0VmSmxsSEU4YWFQMXlXMlBMNWF6?=
 =?utf-8?B?ZUswek9EMWVLWkptRjVPSEEzV3dEMTZWMWV2TTRadEVkdEpaRlErVnBhZ0o2?=
 =?utf-8?B?T2J3N0FrZktrdkpTT3NlZXJBUUoyMXVoYkI2bk1pTXROTTB4WW1QSDhqUzRq?=
 =?utf-8?B?VWcrWmJnSnFEdENWNUYyR0RwM3ljRTJtSHVVWG1rVDJaWmo4MnM5RzJwbDY5?=
 =?utf-8?B?MzN2U2E0VFZrZkNPWE56R3pESUF0a0xRY1VKMnJUaExRRmhlVGd1ZDlURlJ0?=
 =?utf-8?B?SHBtLzBvR1ZiSE5TaTVNZGt6Y0YvZHJCVzdkSTd6YnE4UzI2Ukllb3E0dm9I?=
 =?utf-8?B?M3FnUkExRk5pd0NoUm5iTnBWanFZWUtzMXB3L2paOXd4Y3FVREVvd0pNc09S?=
 =?utf-8?B?OEY3NkNnSWxaMnNVNGg3N1MrM1Nib0FVcW53bjdselFUU29kbFZkVTkyc1Bo?=
 =?utf-8?B?eEh1T2tkc0w5bTJRY0FtU3paRXM1TXhlVFFUT2lwbGNGRHRncjdkUT09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e927a3b6-bf9a-495e-9eee-08df3a661ca6
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR09MB889505.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:23:55.2658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlFXefBZNZhQBTMu3vdD7rrNSRKHnNqWJDRquJhtx3DIuLd9abC6+sHSTz1WuDJ8bpo3ftvR5K7r+DRuWtipsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR09MB8388

On 11/3/26 23:41, Conor Dooley wrote:
> That got me thinking though, I feel like this breaks some of the
> extension parsing logic in other ways.
> 
> If you putting zalrsc and zaamo in your devicetree, we never do any
> backwards processing to set the a extension (we don't do this for any
> extensions by design, we only populate "child" extensions based on their
> "parent"). If there's some userspace thing that expects to see a in
> cpufeature or w/e it'd break. There shouldn't be since a has always been
> supported but who knows. You need custom userspace anyway so I honestly
> don't give that much of a shit about this going wrong.
> 
> What does "worry" me is hwprobe. Currently you've not modified hwprobe
> at all to correctly state that you do not support
> RISCV_HWPROBE_BASE_BEHAVIOR_IMA. (and brings up the question of whether
> you support RISCV_HWPROBE_BASE_BEHAVIOR_IMA_FD etc!)
> 
> Maybe, again you don't care cos of your custom userspace, but this needs
> to be holistic if it is being done at all.
> Personally, I don't want to lower the minimum requirements - the people
> designing this stuff to run linux should have checked to see what our
> requirements were (and have always been...).

I will drop this patch and keep advertising "a" because formally it is
true - all "a" including amo instructions do work but rather slow. Also,
not worth to complicate logic here for (so far) one very special SoC.
For this SoC, we will compile user space with upfront knowledge of all
hardware features.

Thanks, Vladimir
