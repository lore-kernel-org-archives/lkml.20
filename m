Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794341847;
	b=V7LhKEmIua+Yar8+G/J7CLx1vKrQdCihx/ZoRAMN0SSLt+4PMsoezKC3e+Nio5V+7OcJ
	 QQajxA9euPTn039Kkww7gKlzRhJg1pmYb/+Ffhjam4x1JEXZMohGFYURScUo962/xUURQ
	 chxO9tvHOeC1/ftTbBqK3AQ3BwokcHtZV3QnL0XZnX9/QCjtckOPdwUcmmK0sppEyLgJ6
	 Pp4K0QnHPH8E5yiZtHyXF66FwZexN2CS45U7jkdbXS81ylUnM0kRMXTOdnL1b2buzRi7S
	 /5w6/DZLYw5REwPA87J7k88zF/tpvQjl/iUdI4Ppe6zUx4tweapOLtFbz/0vFnLpoXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341847;
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
	bh=61zz3gJ+eyKl8/WE413k1bfYoYKzGdKhsarV53vQQWY=;
	b=DAKQ9GY8GPiKbpPg8Yf1/1SQEYj9tP+1+f0/mCaJMxSGpsezzycd2HfyEQ/ONip2/88O
	 bRhKqDztFRGR7xYrlW2xl+hSmrF3AZousty4gQXyFYWWS5aEY09kKK3Qb8prG79h1jJuE
	 vNFXQ+Dqk7Zmb5pVcCYDDJ1k2CAuAPmkRg5ZrOHBFzmiAc4RVQNPJxkC6NEhNcIdxMzl+
	 JxSg/G6yHknd+AJ1V8FzVtc8P5BdDYQRUnZbiWfFF8XgQDu0+RT4aqFpouN5UR7ipKWs1
	 rMKyHP4tDZI3V6NDtMV0lt2vrkQkfr3sf9IxGt11z1L7GthLa/WRiQhhbg6CUhAWMtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UTKLff0I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.36
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010036.outbound.protection.outlook.com [52.101.61.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBEE606A31C;
	Tue, 10 Nov 2026 20:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FBEE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UTKLff0I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ttl8ExiU52j5X6mATE7gux3NtMptF47nnIoK7OQdVt87NyLYF5k63wpnO+XjXVDQrEZk1GOcW921xltsBUiDqFlfVjqhRk8SXJrSlX5B7wZ0V1QOJUJwee96t3OW2SilYKeQUXxuJW4cLwoDMY7A4Vi5edVSU6jHSGG/YBu9S7jczPcHRMyc4+mOeMLgV9fBMM38IzPHaO4ZFSBG8GFdcsiD9xGVfriVulGm+co7q3frPcPNHai5U+FCyVrnRGYhzJJ6uVMiLs9CZW/UUQnnzRwyzAHD/Z5Oa42mdz3PO32k+7MMWdtC6MIfO4kTnVpkY61t8+kHxy9D8ZvQ2Ksrcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61zz3gJ+eyKl8/WE413k1bfYoYKzGdKhsarV53vQQWY=;
 b=bts3ZNaqwVLJvLCkDcDOTmH3Mm4cXQA74hKl7FIaJB1nwpKalxfk03MUaxCttn41rwLH4tnOM2Q8jk/X8KxayRaL9xEI2zf+5D/kH6rivOy1mDVjY2sc+OiYjN6LcTYZBIPR9B9KasMtn2r+Buz7uoSrcBoGLFMZ0ADGezBdIzHBo0QJBH+XdySAHDS29ovpiL6EI/Mv1sBWW28ueD4gztCl/NzXw8GgHBVMTTbay4p3nwi4dbiIYs9Aa4wAd5yjVUOIcm57agu1ryL6gV/VdPJKk94ruR7Wm0SvJOSx9iLvBmGCK4TqWtGDgp2pqSJ6fpUFk3oyy1rr2a6Ob58GLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61zz3gJ+eyKl8/WE413k1bfYoYKzGdKhsarV53vQQWY=;
 b=UTKLff0I0uV2qZD/Z7MKirOeveO2S5vqIt133cjeh7bf5pCwa/pn9uyO9eOlszXKSri+/Idiee8V+93+KnB0oGKDjrDT88o11J422EXcii9o3mgCmuFS54HLJcyl6Es30puFa1bfGionNty5BZpWMJbvK9ophXlI/4j6YgRDPpMil1kWTFfCvkS1jfQhL3s61K5xHajkzi8xz5xs9Wz8jbf22CEGYOxDAG1dcwLTcm+iesY7MvEeD3nPp2vmXgbrbKHiOwolJwwZaBks8Fxhnrkh6nMG32R3aQGOws5e4a7fAE3k9oDcomITHqIe3heRPo4vt6uBZFax87ZvyvzlaQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB7742.namprd12.prod.outlook.com (2603:10b6:8:102::18)
 by CH2PR12MB4069.namprd12.prod.outlook.com (2603:10b6:610:ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Tue, 10 Nov
 2026 20:17:09 +0000
Received: from DM4PR12MB7742.namprd12.prod.outlook.com
 ([fe80::8df:c519:298a:94f6]) by DM4PR12MB7742.namprd12.prod.outlook.com
 ([fe80::8df:c519:298a:94f6%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 20:17:09 +0000
Message-ID: <09ebf7bb-f802-4bbb-ae78-dc4b45c1f693@nvidia.com>
Date: Tue, 10 Nov 2026 15:17:07 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the rcu tree with the origin tree
To: Mark Brown <broonie@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <avNzIwARUFPlPyrF@sirena.org.uk>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <avNzIwARUFPlPyrF@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR04CA0151.namprd04.prod.outlook.com
 (2603:10b6:408:eb::6) To DM4PR12MB7742.namprd12.prod.outlook.com
 (2603:10b6:8:102::18)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB7742:EE_|CH2PR12MB4069:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b33f125-3fd0-4a9f-065d-08df3f6798c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|6133799003|22082099003|10067099003|18002099003|56012099006|261102123227099003|261022075727099003|261021121427099003|11063799006|261009223027099003|261026121527099003|261022105027099003|261021123027099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	wSBJ2v9boRlSJeG9HQFsHpn0ULOWzyM8gG0ikxnrbrYGXvhNAQB2LFtZPV5D/kSlaoFKPAnPschL6WpJJS7Q15xXSMwNuynM4EJ7nCaWu547wcWmoHhMNRwwqa/z+o5XAzdWs9is6hpGYVPv1j4Xn9dIQVElzP8z55hTQgZcUdaTMlnXfeedQqZ0GdgGUpUB7tJdCr8UYSHMNdxpavRC1vvTI1OocJq73YAtxhfRD+DJwVo6A4vFziThCI63JiVHBMHzuHgLN3Mqf2FcWKEFGSWLcgsXmiF2I3RruIbX+OUR0artlrOX8+ueN1AEGEeKHoXEQ6YfIIf5OIo19yl40E3Z2K3uII7w3bGYdG37G6kfGLntNHhmJA88FFBiNRgonJnVlp3DdIuYnMDHOxwixo4Tg5u16fj5cDdG13qVdE2uYHakqwGdtgsWHbX48MhB49x0fxZpb3z2cTDSTvTkXglZW8q7e9C5CcvdVQvu3BThOH2A8KbpnHQq3iArbVFQc7W33pf7lSbyfx8B16EP++2VBFaXw4SXbWLYAvy8/tGV8Pg0PTpzrdRoWZ4pfuTBUMRT9qDX5r+RYbRXiRRJ+WXbv1KohVKSUvGeuq+AaN5JdhrYbfgh3pfiYFvFSRAiFH/zicWlj7AxEZnMJZXhzcywcJFhRD9eqhEkYfVUFXU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB7742.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(6133799003)(22082099003)(10067099003)(18002099003)(56012099006)(261102123227099003)(261022075727099003)(261021121427099003)(11063799006)(261009223027099003)(261026121527099003)(261022105027099003)(261021123027099003)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXV4MmdFUEY2SkI4ZFhQcEsyU1NhaFZBZTNVMktkSGdaOUVQM28wQzZYUzEz?=
 =?utf-8?B?bDdIU2V6dGo1RXlQNlY1ZDFISGJLdkxpc2ZUSGRGVVlkaGl2Y2w5MDF3aFRN?=
 =?utf-8?B?YjczY3o1MTNnK25YV0lFdFpRSWVPSTFmQUpDR1NHV0tPTWtVVUgxakdrT0lo?=
 =?utf-8?B?NjRaWmxHNUw0SU1VUS9lVllNdkFkdXFxVTZweDV6bU9wcWh3R0hadm9TdjRU?=
 =?utf-8?B?czFhY3FRNEVFdzA1cW1hdkxOdXJ1N2lWT0NpVUxvOGxSdFRCb3pkMzNIYUt0?=
 =?utf-8?B?TmRRTGZHY0FtTDRPR0cyUUZJVG9HSHFSbzVoT1NRNmVrcjh1bm9rZzFuRVBv?=
 =?utf-8?B?ckhES2ZNQ1I1UWhKNG5mMjFMR1ZtRElZNHFQUG1iV2pmNDhoN3dydEcrOWs0?=
 =?utf-8?B?Snd2OTlaL0w5RzMvcmVZbjFQbVIxbHZVNHAvU0dGcllaTGUya1VhVlkwMlFo?=
 =?utf-8?B?Y0JkWExQTkkrQ0l0MUgrS0ZSRTN4Ynp3U1NIcFRIN2dGUnBzdHpBL0lEZHlh?=
 =?utf-8?B?bTAvWjBuWnpqV1pFVXBPV21UbmlKcGZJV3NDVkxXK1hhdW0veG1qVkhnekYr?=
 =?utf-8?B?eFpoNE9ubHZkak9ud2hjQVNsSGt0SDBQWTlEREJYbldLTCtBYmZWRENsYlFk?=
 =?utf-8?B?ZlNsNlNhcFV3QlIzYm9MeWE5WXA3TjhmdElYbVdZU2xRWGUzS080NTJMV2xO?=
 =?utf-8?B?NUxvSXZpUS9ZOXVIdkZZRU9BTk5oaXdienNpT2p3c1NyTTlzbTl3cEd4OFFt?=
 =?utf-8?B?a0QxY3diekFyVGgwYTdGalVFTjVzWnhUbVU4aUNiUTkxUzl0ZnpkYnl0RFZN?=
 =?utf-8?B?VVd0OGh4cFhXQkVMZUpsWUprZlliR3pkMGVMQUE3Qllxd0ZWNHhlN21RdU5o?=
 =?utf-8?B?MHpJemhibk1EdlJrSHhTb0NXckZVa1N2Y080SUNWUVE1bnNOSjl6b0FkUWo5?=
 =?utf-8?B?QXJDTUZGcUVMWGdPaStRRFRPYkJCc3NKS2h6TS9BVzFqa2NQcDRoM1M1dC9O?=
 =?utf-8?B?S1pIV0N0Ky9nWUkxYWRDZ1hGeXlMektnVTNVSHZhSHE2YzJxT2M0ajRrZjhi?=
 =?utf-8?B?SXA2amV1NkMyRTNDbFV5U241TDJtUkFldnFSMTN5anhSWXM1eU9VOXRvc1JH?=
 =?utf-8?B?Mlh3dDlvb0pHV1lmMkRSRGM2WVM4emc3b1hSUHcxQ2hXSXRNOElVN21WSURp?=
 =?utf-8?B?c3FrbUJRU0VJTG1xcnRMMjhPYUFiZEQyVHlKQjZudWJrTlZuYTFkYi9EcXRW?=
 =?utf-8?B?SGlSclpweE1HNGRsNVBYbmRmdU5FYmlXVVA1SGxLN2lSMm5sbFdXMnV3M3Vj?=
 =?utf-8?B?blEwYlNFR1F4eUxzT3FEYVU1ZEQ3V3V0QzhZdjFRYWs1R3ZEMFFQN1Y4encw?=
 =?utf-8?B?L3BqTDRNTlhoTzcyRDZZcGluVWNXL1N2K2ZycjhzK2pCZjZ3UjhtV2lvWm5X?=
 =?utf-8?B?Y29nRjBVcFE1Z2MwNzJ3SjJCWHdOS2hZTnBOK2MvNk1pU2grdmFKMk9SbXNl?=
 =?utf-8?B?MTJUUGwvMUN2aTl0ZnN0bkZNQTFtRmtlaFpiRmJNQldaYkVFSERlbFpkN3JT?=
 =?utf-8?B?c282dEtjVTVsMjM1QnppVWpKRkkzZXh2ZmZPVjM3dmNDVlc4Mm9veS80V2tU?=
 =?utf-8?B?RXdOTDZyUEhoMUlpZXgrdGtFdEsvMGJ0R3BjZ0ExUDBjbytFRkc5OStqR3pq?=
 =?utf-8?B?dEUzRnJvZTkzZkdSQjZNaUlFZXpSL1JEcS9MTGluTnB3VlV1empoT0NWajdC?=
 =?utf-8?B?SlJWNVJpU0JUS3VlMWczWGRMS2dMYVJTTDdGbmZ5RUFhakszcGVYTkV2Rllm?=
 =?utf-8?B?RjltZnNXd0ZlVU1JaUI4aEV0bzNBRmNqbUdTcUVCdGlxWk84d1llOFpsQUpx?=
 =?utf-8?B?eDlOaE8zU2gyK21mQ1hBd2JudzFVMXNNR0hYTm5NTTgzZlY5cEhqbXNJRlVi?=
 =?utf-8?B?T2pEUnM0UlJwK0JZZWxEMC93RG9wbllXZUtyd3B3eXRoQjJEWDJzZTFxV0Nq?=
 =?utf-8?B?VTRlbUcxOVZUbUtqMitRc1FOL216T0Vvc1djeExqWjNyRDYyVTE2cTZvTzhj?=
 =?utf-8?B?QVJ5UXQ3V1FIUWVPT1kwZWZoN3ZGT2pOS2JRK0hyVkIyZ0FzWXFra2NWYnM2?=
 =?utf-8?B?VWVTMXFES2tUVGZESU5wTVlsMkt4clB3Uk5lTE5wamk3S3AxYXVpaU9DSlor?=
 =?utf-8?B?b1hYTzQ1a1Q4WlVVZnVWbEQxZC9TamJmMG9NclhkbWhCeUdXUGhrcitiTktD?=
 =?utf-8?B?cGpoRyt4WmorYkNmeHRSQXVvdXk1Skd6eDhKdTcrbjUvQlpIOE5nWFNqTFRy?=
 =?utf-8?B?OFkvQ3V5Q0hqRlRLUlorb0svNHd0alpEVndPbGJKVVZLQlRucXVSdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b33f125-3fd0-4a9f-065d-08df3f6798c7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB7742.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 20:17:08.8613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vpsbwxy/oY9zFlgn/vmohRqoVcPehX3TxjWIOM71l7HAIaL+ZI3nFq5Fi+ceLzUzvj0NM0wR4oaR6xTxS5yVcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4069

Thanks for the report! This will save us some pain down the line. I have rebased
rcu/next on Linux -rc2 and resolved the conflict.

Thanks!

Joel Fernandes



On 11/10/2026 2:40 PM, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   kernel/rcu/rcuscale.c
> 
> between commit:
> 
>   0af298e62e5cf ("treewide: refresh kmalloc_obj() conversions")
> 
> from the origin tree and commit:
> 
>   08fa1784740f6 ("rcuscale: Consolidate per-writer arrays into struct writer_state")
> 
> from the rcu tree.  Kees, let me once more renew my complaints about
> this being done at -rc2...
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --combined kernel/rcu/rcuscale.c
> index 38c75c37a07c3,5659eaebc5c0d..0000000000000
> --- a/kernel/rcu/rcuscale.c
> +++ b/kernel/rcu/rcuscale.c
> @@@ -115,17 -115,21 +115,21 @@@ struct writer_freelist 
>   	struct writer_mblock *ws_mblocks;
>   };
>   
> + struct writer_state {
> + 	struct writer_freelist wst_fl;
> + 	struct task_struct *wst_task;
> + 	u64 *wst_durations;
> + 	int wst_n_durations;
> + 	bool wst_done;
> + };
> + 
>   static int nrealreaders;
>   static int nrealwriters;
>   static int nrealexp;
> - static struct task_struct **writer_tasks;
>   static struct task_struct **reader_tasks;
>   static struct task_struct **exp_tasks;
>   
> - static u64 **writer_durations;
> - static bool *writer_done;
> - static struct writer_freelist *writer_freelists;
> - static int *writer_n_durations;
> + static struct writer_state *writer_states;
>   static atomic_t n_rcu_scale_reader_started;
>   static atomic_t n_rcu_scale_writer_started;
>   static atomic_t n_rcu_scale_writer_finished;
> @@@ -293,6 -297,44 +297,44 @@@ static struct rcu_scale_ops srcud_ops 
>   	.name		= "srcud"
>   };
>   
> + static struct srcu_struct srcua;
> + 
> + static int srcu_scale_atomic_read_lock(void)
> + {
> + 	return srcu_read_lock_atomic(srcu_ctlp);
> + }
> + 
> + static void srcu_scale_atomic_read_unlock(int idx)
> + {
> + 	srcu_read_unlock_atomic(srcu_ctlp, idx);
> + }
> + 
> + static void srcu_scale_atomic_synchronize(void)
> + {
> + 	synchronize_srcu_atomic(srcu_ctlp);
> + }
> + 
> + static void srcu_atomic_scale_init(void)
> + {
> + 	srcu_ctlp = &srcua;
> + 	init_srcu_struct_atomic(srcu_ctlp);
> + }
> + 
> + static struct rcu_scale_ops srcua_ops = {
> + 	.ptype		= SRCU_FLAVOR,
> + 	.init		= srcu_atomic_scale_init,
> + 	.cleanup	= srcu_sync_scale_cleanup,
> + 	.readlock	= srcu_scale_atomic_read_lock,
> + 	.readunlock	= srcu_scale_atomic_read_unlock,
> + 	.get_gp_seq	= srcu_scale_completed,
> + 	.gp_diff	= rcu_seq_diff,
> + 	.exp_completed	= srcu_scale_completed,
> + 	.sync		= srcu_scale_atomic_synchronize,
> + 	.exp_sync	= srcu_scale_atomic_synchronize,
> + 	.stats		= srcu_scale_stats,
> + 	.name		= "srcua"
> + };
> + 
>   #ifdef CONFIG_TASKS_RCU
>   
>   /*
> @@@ -504,9 -546,9 +546,9 @@@ static struct writer_mblock *rcu_scale_
>   	struct writer_freelist *wflp;
>   	struct writer_mblock *wmbp;
>   
> - 	if (WARN_ON_ONCE(!writer_freelists))
> + 	if (WARN_ON_ONCE(!writer_states))
>   		return NULL;
> - 	wflp = &writer_freelists[me];
> + 	wflp = &writer_states[me].wst_fl;
>   	if (llist_empty(&wflp->ws_lhp)) {
>   		// ->ws_lhp is private to its rcu_scale_writer task.
>   		wmbp = container_of(llist_del_all(&wflp->ws_lhg), struct writer_mblock, wmb_node);
> @@@ -560,8 -602,9 +602,9 @@@ rcu_scale_writer(void *arg
>   	u64 t;
>   	DEFINE_TORTURE_RANDOM(tr);
>   	u64 *wdp;
> - 	u64 *wdpp = writer_durations[me];
> - 	struct writer_freelist *wflp = &writer_freelists[me];
> + 	struct writer_state *wsp = &writer_states[me];
> + 	u64 *wdpp = wsp->wst_durations;
> + 	struct writer_freelist *wflp = &wsp->wst_fl;
>   	struct writer_mblock *wmbp = NULL;
>   
>   	VERBOSE_SCALEOUT_STRING("rcu_scale_writer task started");
> @@@ -631,7 -674,7 +674,7 @@@
>   			started = true;
>   		if (!done && i >= MIN_MEAS && time_after(jiffies, jdone)) {
>   			done = true;
> - 			WRITE_ONCE(writer_done[me], true);
> + 			WRITE_ONCE(wsp->wst_done, true);
>   			sched_set_normal(current, 0);
>   			pr_alert("%s%s rcu_scale_writer %ld has %d measurements\n",
>   				 scale_type, SCALE_FLAG, me, MIN_MEAS);
> @@@ -649,7 -692,7 +692,7 @@@
>   						cur_ops->get_gp_seq();
>   				}
>   				if (shutdown_secs) {
> - 					writer_tasks[me] = NULL;
> + 					wsp->wst_task = NULL;
>   					smp_mb(); /* Assign before wake. */
>   					rcu_scale_cleanup();
>   					kernel_power_off();
> @@@ -665,10 -708,10 +708,10 @@@
>   
>   			if (!atomic_xchg(&dumped, 1)) {
>   				for (i = 0; i < nrealwriters; i++) {
> - 					if (writer_done[i])
> + 					if (writer_states[i].wst_done)
>   						continue;
>   					pr_info("%s: Task %ld flags writer %d:\n", __func__, me, i);
> - 					sched_show_task(writer_tasks[i]);
> + 					sched_show_task(writer_states[i].wst_task);
>   				}
>   				if (cur_ops->stats)
>   					cur_ops->stats();
> @@@ -676,7 -719,7 +719,7 @@@
>   		}
>   		if (!selfreport && time_after(jiffies, jdone + HZ * (70 + me))) {
>   			pr_info("%s: Writer %ld self-report: started %d done %d/%d->%d i %d jdone %lu.\n",
> - 				__func__, me, started, done, writer_done[me], atomic_read(&n_rcu_scale_writer_finished), i, jiffies - jdone);
> + 				__func__, me, started, done, wsp->wst_done, atomic_read(&n_rcu_scale_writer_finished), i, jiffies - jdone);
>   			selfreport = true;
>   		}
>   		if (gp_succeeded && started && !alldone && i < MAX_MEAS - 1)
> @@@ -687,7 -730,7 +730,7 @@@
>   		rcu_scale_free(wmbp);
>   		cur_ops->gp_barrier();
>   	}
> - 	writer_n_durations[me] = i_max + 1;
> + 	wsp->wst_n_durations = i_max + 1;
>   	torture_kthread_stopping("rcu_scale_writer");
>   	return 0;
>   }
> @@@ -1031,13 -1074,11 +1074,11 @@@ rcu_scale_cleanup(void
>   		reader_tasks = NULL;
>   	}
>   
> - 	if (writer_tasks) {
> + 	if (writer_states) {
>   		for (i = 0; i < nrealwriters; i++) {
>   			torture_stop_kthread(rcu_scale_writer,
> - 					     writer_tasks[i]);
> - 			if (!writer_n_durations)
> - 				continue;
> - 			j = writer_n_durations[i];
> + 					     writer_states[i].wst_task);
> + 			j = writer_states[i].wst_n_durations;
>   			pr_alert("%s%s writer %d gps: %d\n",
>   				 scale_type, SCALE_FLAG, i, j);
>   			ngps += j;
> @@@ -1051,14 -1092,12 +1092,12 @@@
>   			 rcuscale_seq_diff(b_rcu_gp_test_finished,
>   					   b_rcu_gp_test_started));
>   		for (i = 0; i < nrealwriters; i++) {
> - 			if (!writer_durations)
> - 				break;
> - 			if (!writer_n_durations)
> - 				continue;
> - 			wdpp = writer_durations[i];
> + 			struct writer_state *wsp = &writer_states[i];
> + 
> + 			wdpp = wsp->wst_durations;
>   			if (!wdpp)
>   				continue;
> - 			for (j = 0; j < writer_n_durations[i]; j++) {
> + 			for (j = 0; j < wsp->wst_n_durations; j++) {
>   				wdp = &wdpp[j];
>   				pr_alert("%s%s %4d writer-duration: %5d %llu\n",
>   					scale_type, SCALE_FLAG,
> @@@ -1066,34 -1105,23 +1105,23 @@@
>   				if (j % 100 == 0)
>   					schedule_timeout_uninterruptible(1);
>   			}
> - 			kfree(writer_durations[i]);
> - 			if (writer_freelists) {
> + 			kfree(wdpp);
> + 			if (wsp->wst_fl.ws_mblocks) {
>   				int ctr = 0;
>   				struct llist_node *llnp;
> - 				struct writer_freelist *wflp = &writer_freelists[i];
>   
> - 				if (wflp->ws_mblocks) {
> - 					llist_for_each(llnp, wflp->ws_lhg.first)
> - 						ctr++;
> - 					llist_for_each(llnp, wflp->ws_lhp.first)
> - 						ctr++;
> - 					WARN_ONCE(ctr != gp_async_max,
> - 						  "%s: ctr = %d gp_async_max = %d\n",
> - 						  __func__, ctr, gp_async_max);
> - 					kfree(wflp->ws_mblocks);
> - 				}
> + 				llist_for_each(llnp, wsp->wst_fl.ws_lhg.first)
> + 					ctr++;
> + 				llist_for_each(llnp, wsp->wst_fl.ws_lhp.first)
> + 					ctr++;
> + 				WARN_ONCE(ctr != gp_async_max,
> + 					  "%s: ctr = %d gp_async_max = %d\n",
> + 					  __func__, ctr, gp_async_max);
> + 				kfree(wsp->wst_fl.ws_mblocks);
>   			}
>   		}
> - 		kfree(writer_tasks);
> - 		writer_tasks = NULL;
> - 		kfree(writer_durations);
> - 		writer_durations = NULL;
> - 		kfree(writer_n_durations);
> - 		writer_n_durations = NULL;
> - 		kfree(writer_done);
> - 		writer_done = NULL;
> - 		kfree(writer_freelists);
> - 		writer_freelists = NULL;
> + 		kfree(writer_states);
> + 		writer_states = NULL;
>   	}
>   
>   	/* Do torture-type-specific cleanup operations.  */
> @@@ -1110,7 -1138,8 +1138,8 @@@ rcu_scale_init(void
>   	long i;
>   	long j;
>   	static struct rcu_scale_ops *scale_ops[] = {
> - 		&rcu_ops, &srcu_ops, &srcud_ops, TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
> + 		&rcu_ops, &srcu_ops, &srcua_ops, &srcud_ops,
> + 		TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
>   	};
>   
>   	if (!torture_init_begin(scale_type, verbose))
> @@@ -1187,36 -1216,30 +1216,30 @@@
>   				goto unwind;
>   		}
>   	}
> - 	writer_tasks = kzalloc_objs(writer_tasks[0], nrealwriters);
> - 	writer_durations = kzalloc_objs(*writer_durations, nrealwriters);
> - 	writer_n_durations = kzalloc_objs(*writer_n_durations, nrealwriters);
> - 	writer_done = kzalloc_objs(writer_done[0], nrealwriters);
> - 	if (gp_async) {
> - 		if (gp_async_max <= 0) {
> - 			pr_warn("%s: gp_async_max = %d must be greater than zero.\n",
> - 				__func__, gp_async_max);
> - 			WARN_ON_ONCE(IS_BUILTIN(CONFIG_RCU_TORTURE_TEST));
> - 			firsterr = -EINVAL;
> - 			goto unwind;
> - 		}
> - 		writer_freelists = kzalloc_objs(writer_freelists[0],
> - 						nrealwriters);
> + 	writer_states = kzalloc_objs(writer_states[0], nrealwriters);
> + 	if (gp_async && gp_async_max <= 0) {
> + 		pr_warn("%s: gp_async_max = %d must be greater than zero.\n",
> + 			__func__, gp_async_max);
> + 		WARN_ON_ONCE(IS_BUILTIN(CONFIG_RCU_TORTURE_TEST));
> + 		firsterr = -EINVAL;
> + 		goto unwind;
>   	}
> - 	if (!writer_tasks || !writer_durations || !writer_n_durations || !writer_done ||
> - 	    (gp_async && !writer_freelists)) {
> + 	if (!writer_states) {
>   		SCALEOUT_ERRSTRING("out of memory");
>   		firsterr = -ENOMEM;
>   		goto unwind;
>   	}
>   	for (i = 0; i < nrealwriters; i++) {
> - 		writer_durations[i] =
> - 			kzalloc_objs(*writer_durations[i], MAX_MEAS);
> - 		if (!writer_durations[i]) {
> + 		struct writer_state *wsp = &writer_states[i];
> + 
> + 		wsp->wst_durations = kcalloc(MAX_MEAS, sizeof(*wsp->wst_durations),
> + 					     GFP_KERNEL);
> + 		if (!wsp->wst_durations) {
>   			firsterr = -ENOMEM;
>   			goto unwind;
>   		}
> - 		if (writer_freelists) {
> - 			struct writer_freelist *wflp = &writer_freelists[i];
> + 		if (gp_async) {
> + 			struct writer_freelist *wflp = &wsp->wst_fl;
>   
>   			init_llist_head(&wflp->ws_lhg);
>   			init_llist_head(&wflp->ws_lhp);
> @@@ -1234,7 -1257,7 +1257,7 @@@
>   			}
>   		}
>   		firsterr = torture_create_kthread(rcu_scale_writer, (void *)i,
> - 						  writer_tasks[i]);
> + 						  wsp->wst_task);
>   		if (torture_init_error(firsterr))
>   			goto unwind;
>   	}

-- 
Joel Fernandes

