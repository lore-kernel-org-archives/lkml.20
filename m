Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792763183;
	b=okrVOsVf5HW1UH8/1xFvi2x/1qVHUALWkb/MEpOuFseTw20jOfev8m1FYEiyNOYIiVHv
	 /FnKuNFeKhFG4ECTPVEPkSkGeAfAOrpHMRifxnq/Wq09aMGF27PvrhxWDr1wAqwONgecZ
	 Ptlr2Ka6MDBdpE6TkRSz1jD4ub0ye2B1ZLghDuV+TXAdjNkrM7rkp0oOyOCHGV+4omE9F
	 DQMDxS7kHKLFelNHIPv/uU3H0dbPnbcE+x7ZborF/m5Ek6SRLIk3ZAzLXcT9RYpdCfgcE
	 09JYeqaDewxzduRh5MKK+KobWwfOxiVnCM5R36aJNoLFPiu9SqsGVZsEUHNUjFHdTqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763183;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XwXonp3w2ntE/olm23FKi0o1hDEO4ArXEyFYj995nqo=;
	b=vDD9YfX00ofgDT8M2VzLKUEirNjswnvytAb5Yx+9n96WuOjw3xKruQyTH3BgO55bVWI5
	 DsrvcKBT3GIlrhudcaeH0CBB4Mj8gGIVmpZJwJVn5of5WWV9lHzcIE5TM374i0o/DKx+b
	 o7mFc/ExdLht2E/9Jk7Yfo4ATZCKSkAZpKR5g+xnCf9FfinZbUsPoszUuJiiu8z+hHvQj
	 dmN3ymbgNNZafhOgrFYU4Jdzx+NScoknD/jmmWP9i4ufU4HOpK5P8fgHF1nvrjLWa3OVp
	 pK+GdXGgHIBnmZKckYHoQkeYgHrNpj5NpsXGsiolYQwWHRHoB95GKz5OTXRvViVx58w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codasip.com;
	spf=pass smtp.mailfrom=codasip.com;
	dkim=pass header.d=codasip.com header.i=@codasip.com header.a=rsa-sha256 header.s=selector1 header.b=X6l12Pf1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.75
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021075.outbound.protection.outlook.com [52.101.70.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090A7606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 090A7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codasip.com header.i=@codasip.com header.a=rsa-sha256 header.s=selector1 header.b=X6l12Pf1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0ZXNYM3vhM4OnOV4QhftSQJJ9E1k2vYoeiJty0ttzNsHsdzDsokaSEIM0oMTSvGIOa1FAWpnIeiLuj+4Y2Brdo7mItzzj18Le0YtRr2XsWskwP6DVhdafSO/25S5m1WWXF6savPR/afjWeVExEj2DBSp9iq7rlXErFMdpS4pQp4APTsBIqUaiqHPv9PsG5zbu8A8lbUC1+fFuNnIwjA6GtvX9pni03QOvAb1aGWJE2XweRo8mJbHY14zJ/rLNGtB8H5SjnpVosFzIqPUObkI9b08ksWZ/q4Qus891gLyHAe1IQnlOowy/Ds7l0lgWclCYy9F7EIQ130yAZNRLVh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwXonp3w2ntE/olm23FKi0o1hDEO4ArXEyFYj995nqo=;
 b=RrizUfAVu7wEtsp0BDomQGOR2lq77F5zCtJplZM5MOz4H/VFOc5NfGIqoM3kk86Xhp/7h0Xvhw2rim5RZvlo51Sl1FgC6ZzwS63rgyW3o9VXCH15lDe2bHQbAzfnnfw6ZMFspwaYxbnFdsJY1qybMLEfe+rFR6df8pzgcqgPneNy3PCo2YrXhcTOVTyVhImXMnIISkde9s/anRsIYZFIHEju1cup0Fm9Dy8+O6RPEfigKLUVXbeFRvsQbQ2+BGOAAgIaQ8CCc8Sdrt6u+HALWbqr4S1ZG9acVAtKhF9oPJm3UR9fQfeCIdi88Lkiz1brpbTD/mkEutA9059e3bkwDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwXonp3w2ntE/olm23FKi0o1hDEO4ArXEyFYj995nqo=;
 b=X6l12Pf1jtIFckeFSogAJPLXtVoxCChMUZ7FQJdrpO9Tf9qHLUkxvRZO/EqbSd7+goLELvRYEsYE/1wmFAVEToS+m9FfVDOBIWWYDr94+bZuieuu4+LiXpUNRAJU4hFNpOxR3V39d0TP9HnPfyRhn1S4NXy1cyBPyby0EoGzOIWg26OaAMoOS4vJFwdch/ph6QVMijES4/lEwSJ18290GIoDr41JHwq5FHr7WqkmETS3i4WZUPIVWnZc6v+nclJs0AZukFJiXrIt5uDyKjr02v8zt8iuc3ykJIuqIgnC5+o8KnWWeAYaI5LnkF29ZxOu2LhsTuewZjdrpoPD3dilKQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1f4::5)
 by GVXP192MB3437.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:310::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 13:46:18 +0000
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c]) by AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c%4]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 13:46:18 +0000
Message-ID: <46073a08-20fd-465e-86e8-9c358787f9b3@codasip.com>
Date: Fri, 23 Oct 2026 15:46:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] maple_tree: fix two bugs when freeing RCU-mode trees
To: "Liam R. Howlett" <liam@infradead.org>,
 Dimitris Charisis <dchar@cslab.ece.ntua.gr>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Andrew Ballance <andrewjballance@gmail.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org,
 maple-tree@lists.infradead.org, linux-mm@kvack.org
References: <20261015-maple-tree-fix-slab-corruption-v1-0-160d97f7304c@codasip.com>
 <dtet2zelrbzt36i3jbwgsi5iv3nnwtlhtnhbgdvj3m3kzewcvs@vdgjqdivisf7>
Content-Language: en-US
From: Florian Schmaus <florian.schmaus@codasip.com>
In-Reply-To: <dtet2zelrbzt36i3jbwgsi5iv3nnwtlhtnhbgdvj3m3kzewcvs@vdgjqdivisf7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::6) To AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:1f4::5)
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
X-MS-TrafficTypeDiagnostic: AM9P192MB0983:EE_|GVXP192MB3437:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b1189c-fd05-4645-cb6c-08df310c0398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|23010399003|1800799024|261009223027099003|261022075727099003|10067099003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	MYIyLPKzNv0JS38FKEv05nHmIbFAFnxLVJftfON2cxvZfPM8J5nRBnOewaqh6AXHCnFXGzHcL2ifq1wLGpTxSBqlacbNSlNKRczJmGS7Nid99nC502xE8ZFHN4RyhlRuZ1vM3NvIjgES7Ou38ev+b4uGZOXgtBYNCwnXCzju+LnAnGYLiKjFUaNAangjYE3shMJvHaiOsGpbt0PVt7btA6KFioBgIdmyJhiuWQ8ZUSDNFBvrqWmV17nztWJGAJSJ8FIN8fZMqC4aCS4VEgPOU3BqN1WSKr/4nqomxo2pp/unnYz2GMionu0hZRJaTKCrVC/Rgw0CLJYiHtIBEbD++gBLRIOqQYtO6tHtsE7NyRWhwtIK7/HnVc5kc+/+l9RVi3iyJfKAfMR9um1Ou74A4a/3kBOoXhJWWZ1yEqCrsqhjcu8Zriyl0eNRpJcOm2l/SYWcyGjB9Qw9W+sboWzstZ+HFhGnK/ne/btlZsHF6pLjUfeDSwjr43j7dDWsDGb6/qVlGnPslbQHPT6IFFoqxCed44ObNMe/zCAnEsfnXl7szABM13EyGwuspR1YEs3G3bsyI+jh72H4lAGouvPmpb3BhCRvxFPdXrrpfJHX8SEx/Ydi6atSan2rAk8zZgtL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB0983.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(23010399003)(1800799024)(261009223027099003)(261022075727099003)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjBCTUtTa2JNUWlqekUvS0NaTm5LUjdGTVRPOTJlcG96Tmh3cnJyTkZzVVlv?=
 =?utf-8?B?ZmhSNFdnaVVQeHBQZERPRk9Dc3gwUGNEMUFiT3Z3QXl2V0ttams1Y3c5WHVH?=
 =?utf-8?B?ZCtkb2VXL2x3aTZSRkZkUXVoZ1hFVjJOUFJXSStyTWRUM2ladVRRNndOMkJh?=
 =?utf-8?B?ek1YMUg5em84MVp2Q0NFVEJoenE5MlpIWXAyM0ZWS2JUdkJORkx1K0hqQjU1?=
 =?utf-8?B?YzVIMUhIRjVaTkVPeHk4RzJ4WGs0ak9nY3NMbW92V1JHaWh1amMyYkt1aFpk?=
 =?utf-8?B?OXJIT2wvTkhZWEh0Z0hZdGdCcWNORjRjbTZtY2F6alJLVzFjOG5qN1kyQ1BZ?=
 =?utf-8?B?Tm5kOFR2eU00d0x2U2k2QjNib0pMZjg4MTJrZ3FtR09yakVWL3FHOU5wckZq?=
 =?utf-8?B?RUZySGJTQStBeGdSOU81Q3lFa2Rvcno0ZnRhdWF4VkxZV1YxSmg5M2p4b1dk?=
 =?utf-8?B?NmRPTkJJeUg4czZ4V0pCWFZlRzZnV2lOTzBwTHZZSzllZE14YUtJenRETmNh?=
 =?utf-8?B?eHRKV214dHhoNktsRlMrQk9SVThNd1pXS0VlbGJQSG1zcEZRb3hYSWFTSzV1?=
 =?utf-8?B?VUhxNmQzbWhBeUoyeTRvT1I2Z243eDluZ2tZMlcxNk4zMncwaU90U3NFSVF1?=
 =?utf-8?B?THhBWThZWkZCOVJnZk44WEY3cko4MjB4T1FYb1dNaWloZURKTGxHOHBpazVk?=
 =?utf-8?B?aThEMUpZVG9jcXREdG80NnRGdnhURWFlUG1SOFE3MWRURHNIQmpWMWFHTDN0?=
 =?utf-8?B?N0wxR3pJV0Mxb0RNSzltbjg2b29INWlLU2ZYQlFmbVF1ajNzRkg1WkpkTGxX?=
 =?utf-8?B?U3BsMzNpbnluOFdhaHdQLzhJRnBLUzhma1crYkY1Vm9XTVR2blNDU0ZsZUpt?=
 =?utf-8?B?MEFtaXVVNHQzaGNramI3b1hZcUMvVUJWR1hQZlNKU3hMbjRoRzFFRFZPRXZn?=
 =?utf-8?B?dmIwOVY4NGNDdUZIN0xtR0g0TldGL1A2dXVmZkFkSWVmdWluc3ozVEFwRkJj?=
 =?utf-8?B?elU0aml1U1dOUDQ4cWpvZmhpTldwNExqM0tJSjIxVDdqL25KcjZDNXdvL25n?=
 =?utf-8?B?YXFJcWZ2MEhZN2pIcjkvcjd0b0o3cW83bUh3NXd2dXI4UHlIV09VZ3c0aXpT?=
 =?utf-8?B?a3FZakFLandXLytwaVoxOTRCV1E3b3BmSXFuWjVrdjh6dzhTVUtUVFdQcjBn?=
 =?utf-8?B?YmtCQzFOcWlZNXd4OFVSdWhkQ1dzM29mUCtqcTd4TFhDdkE4VDdETnNTQlND?=
 =?utf-8?B?Z1JnVm5xN0NpUngrQ1lxQkRsRWZid3lSeXBabksweG94cy80dDR4M2tYZlZJ?=
 =?utf-8?B?WG9TS2RiOXB0SVU1Z1NiTjB5S0tUQkY3YVc3U3Nrb0JNT2k0NFdKVU5ndHIz?=
 =?utf-8?B?UmlZWmlEVXlOdUZ3VFhVQ1JHcEZjRmVReDVyKzBkSWtaT1JRNWIvQVkxQVU3?=
 =?utf-8?B?YzhwcnRiNTRyVFZ4aExsdE1TaGh6RTBhNk82M3N4bU5lTFdlNXhacTI1ZTlD?=
 =?utf-8?B?SnJoeVFwOEtaeXZSZDNJdzZ3bFRjTzdTbW1lcTFuYlVTZWVXQ1NTSlVkcmRX?=
 =?utf-8?B?eFFNM0IzOXcwT0tyb1hGbC9LMUhZRjNtSG9JK1VhZVVzRmlDbm9mUXBkdWRh?=
 =?utf-8?B?NjkvNUt0Q0FCMTJLZzNweXU1OWtDM3JFUm5SWDE5a1JYdmxFeVA4dlRrMDkx?=
 =?utf-8?B?b2x2SWt1bFNyekUyNWxpQ3RYN0NJV1hhL2U2ZzYrUDlqUnNKVWRPb3FWRDNL?=
 =?utf-8?B?L3dQbndUNllGdFJhWENnUzRWR05naHRrU0s4ZTBQMXZFOHFRUForc1VEN2FU?=
 =?utf-8?B?Nmd0Vy8wdzZvdHNQbDlybnlXUWdZbC9BQzlkNjRYMG9wMlNHb2dOMnRqSnBL?=
 =?utf-8?B?NmhvclJmbU9nWGtwaVI0aGNUSTU5VER3V25FcHBLKzJDL3NZNWpQQlFzMmti?=
 =?utf-8?B?alFIV0xkNndFaTBEQmgvNnR5b2ZGeks3bWo2RDZUK2czSEhyWFpOV0xqdVJY?=
 =?utf-8?B?OG81a2Vna3ErUWRNTE10WU9lMzFCM2VpOWtvZGI2K0VwOWlVdzRwSURWYVEv?=
 =?utf-8?B?aTI5eHUxNVBIRURjZjhwUHo3ZUZ0MGRoVDJzREFuMFFWM3pSQTdxWEw0Kzd3?=
 =?utf-8?B?RlorTFpqTHZVQzNrcTBvMHl0THVudGd5dy9IdnYwd0hYbmRSVXUrT2UzQ3RR?=
 =?utf-8?B?cjRKYWVqNkhOV3BjeWNpOVlXcWVJYStqWUZhV3NvQkRSUjNuWk16SWQwVDZy?=
 =?utf-8?B?SHN3RE5WMVpub0NlWnNpMFRvc1ByakNkNGpWR3hucm1GbURIdG81N1JFdjhT?=
 =?utf-8?B?ZEtXeE9lNndHSGdNeE1GT3BQdURiUnRrbkRSZWR4R0NGQk4zTFBRcUtUc3dp?=
 =?utf-8?Q?vYOzAPfG1JAuvUpPh76XzNXxaIHNxwu0wOjc6wS1zgQu+?=
X-MS-Exchange-AntiSpam-MessageData-1: Tg/aQVWDgkjCNvOvxlQH0Qk9i/zI3xt/xaU=
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b1189c-fd05-4645-cb6c-08df310c0398
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 13:46:18.0477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epSH24/tQxUftNqBsacN0Z4L4Gu9vyjem87nAGUaR0dJoRv0B/CcSxlyEp5yQeWFvQqJhno4ebsBhJc5P8WoJN4azcGGAe+AjkiQqHD8gHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP192MB3437

On 22/10/2026 18.32, Liam R. Howlett wrote:
> On 26/10/15 05:11PM, Florian Schmaus wrote:
>> Destroying a non-allocation maple tree with MT_FLAGS_USE_RCU defers freeing
>> its nodes to mt_free_walk(). There are two independent bugs on that path,
>> both caused by the metadata that a maple_range_64 node may keep in its last
>> slot:
>>
>>   1. mt_free_walk() takes the metadata of a node with 15 children for a
>>      child node and dereferences it.
>>      Reproduced with: 2768 ranges / height 4
>>
>>   2. mt_destroy_walk() takes the last child of a full node for metadata
>>      and corrupts its pointer, so mt_free_walk() frees a bogus address.
>>      Reproduced with: 120 ranges / a full root
[...]
> Thanks, but did you see Dimitris' patch on the 5th for this [1]?

No, I missed it, sorry. As there is no in-tree user, I did not expect 
anyone else to run into this and did not look for existing fixes.


> I believe this should also resolve your issue.

It does. Dimitris' change to mt_free_walk() is identical to my patch 1, 
and removing mt_clear_meta() is probably the better fix for the second 
bug than my patch 2.

One thing that may still be worth having is my test case: the height-3 
case in his tests only hits the bug at the root (the one requiring 
mt_clear_meta() to be gone). The height-4 case from my patch 3 exercises 
the bug at a non-root node and is not yet covered in Dimitri's test case.

Dimitris, I can send the height-4 test case as a follow-up patch on top 
of your series, extending check_range64_in_rcu(). Or would you rather 
fold it into your patch? Both is fine with me.

Thanks,
Florian

1: 
https://lore.kernel.org/all/20261005-fix-maple-tree-range64-rcu-v3-0-ebe7fb278e20@cslab.ece.ntua.gr/
