Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360875;
	b=13tPtKYWB48gS/zB3o4jkoYWabWSUEgMcgcxx+Iea4sFwnRyUc1Y/OUW/wMLZ1ET0hjz
	 UXmdNYGRDbVNGL0dvRjtaxPXPhJPoN2EdGWMDAOi8In16RuurA2RQ63d7Q1dtOCYA5QZu
	 7XGTxSLwCKl9xPfcHL06hfZK+rkVceIZVvn2Hdx2Id8ufxDdR6DRK/uLkbwvB6v1BFWEY
	 Pv8TJmkUQT44x8gFeBXY2RfByt3t+DoZajJshLJgcQl4LzU7CAJp8cpQpUDdliXeoPF4c
	 sOz0r77tfnJAwK6Y77pEfTEJleB72gis0LTlNpym0FR+zZ/Hd5c+9OPA+YAFSu+idvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360875;
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
	bh=UmH65B6EO530OcWorUFAwiJaTkRj4JGJci1sXxK7Yxk=;
	b=LQSEt9jwraB/ub0Bqs59fp6ZPkZ/RLFt8g5pum7kJYXJeIjzJ+9gx3wB+Wd8CSgaUv5K
	 Y3vyFge4Xq2eNjSTdup6Hi0ey5kAuoezIjcdbazd7DbdKUGxX1H35BfaUtiqqg9YcKGep
	 0rj4bywDhzHYO7p3nmr9L6LPU2OBhBmmHPULNX1tyt2K6Gni+gtyRdbvqS7udgv21CZMM
	 Hh1nnt2r75SYs+8Cw4zBDQjsFK/nY9/rgasvwIc3FvKpg/EwXMWhx6VgatQ+tAK9TSpMN
	 YgPW1C5trb4pZk6cgbcRhOOi/YZejONxjUTPGQA3kbqnu8++sXwjH0ktG8hAiFxl0Ig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Q5sOLasJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.65
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011065.outbound.protection.outlook.com [52.101.62.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3218606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3218606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Q5sOLasJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIICaf/NFuTwy3BRxzeVY46W2rQiPCuEeaNU1f1Ub9uG11GQHcRkhkQhuQUmcHuolKJdJ2Y61ecn3t5ivYPGC5SLrQWHSqxB24qOnqaWW8CfxcgE7l92YXa8X5sh40nj+3/6Nu0lhdT0sXhV4lnJzjPOLoKgb26+bdyURKlMrkPLYPo3JUsDAofmegnCLd6Xsqr1cDl3uTUOeUdJtNQJI3jCGoiKLt5cZZ15UV2muTY4DdI2jU0Y5rUaoYDj+91pio6p/o1rc/UbmZtpKSbWZ1cBt20zGsEDHzfTOuxL3wq/ab7APP4tX003u2iiyjRskWK+QnCQzHBA8QVMkg+dtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmH65B6EO530OcWorUFAwiJaTkRj4JGJci1sXxK7Yxk=;
 b=E+RpKx+L2t/OrUgdVMedONysmmlX+pb35sWzFJi9IOFl69+Y9ZO8/uc7Tebfk9D2odRODq9SyHnCthiTTeQMaotrkVolEdK7faLmjG3zWh1poAiNRLHxvWELXN/ceKTdTtody1HnNGSkceLWIedGbKkaP0siKhJqfoRRfYo0/g+ou4J20RrXNwZ05JU7HPrazx7uk6XWynBMLHb1sxk7qWRPIOmRfo+IsPwk8QjAYlgtq+5Pcksr9w9I/sHk67nzXSSuhMiNTsB8cWYTVclKsBMhA7egutFLmiSoKOpXRo2O90OXHa9iIu+nomMbs3oCZvG7wjIPIxXtCrrA3KaG/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmH65B6EO530OcWorUFAwiJaTkRj4JGJci1sXxK7Yxk=;
 b=Q5sOLasJCgPvEH42EXKYHg7+znF2GPP26kUzl4oss6dBvZ/sQpnqxzWpAyyOhfVE0rPQSyH4A9rlcMRQ0lEZrkNgPhReGGLtGT4W4ILiWpe5c6oMpDNMbkWAFI590f4nsBRN7/yCemUN/zlNB++N5PGDx8diLrRZxfmHLtyLccA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5354.namprd12.prod.outlook.com (2603:10b6:408:103::22)
 by MW4PR12MB7015.namprd12.prod.outlook.com (2603:10b6:303:218::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 11:47:43 +0000
Received: from BN9PR12MB5354.namprd12.prod.outlook.com
 ([fe80::7ae3:c4f2:733a:50bd]) by BN9PR12MB5354.namprd12.prod.outlook.com
 ([fe80::7ae3:c4f2:733a:50bd%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 11:47:40 +0000
Message-ID: <8154f817-b401-41b1-9800-dcd639fb03f6@amd.com>
Date: Fri, 30 Oct 2026 17:17:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: amd-sbi: Fix use-after-free on driver unbind
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de,
 naveenkrishna.chatradhi@amd.com, Anand.Umarji@amd.com,
 Prathima L K <Prathima.Lk@amd.com>
References: <20261026113910.1003008-1-Akshay.Gupta@amd.com>
 <2026102651-prideful-finance-b60a@gregkh>
 <dae36cea-b00a-4b3c-aa79-d82bfbb67f3e@amd.com>
 <2026102842-jam-demanding-7ba3@gregkh>
Content-Language: en-US
From: "Gupta, Akshay" <Akshay.Gupta@amd.com>
In-Reply-To: <2026102842-jam-demanding-7ba3@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::6) To BN9PR12MB5354.namprd12.prod.outlook.com
 (2603:10b6:408:103::22)
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
X-MS-TrafficTypeDiagnostic: BN9PR12MB5354:EE_|MW4PR12MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: 327d5d6b-41c5-4f37-68f7-08df367b99e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|4143699003|11063799006|56012099006|261009223027099003|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261022113327099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BemtsfT4GglQ24I7RnI++xK4AErCStHchTYx0HCZHX2XmuciQ90j6Hq/5J3aEVlHlrooG/CNc5vXLD4wznfcy/iJXY4/Sy/h8SCOm153ikEChk0775IcJQCU5pt1zbJCE9SoyEK2l/83hhc4B+c26FnO+06Lh3CizbKIJ0jQMES/jAc1loN/jM8sbs6VA2WYPtBZ6Ry5HuLk8szGJHLPIeQnW9yMc0I/RSUEOMoYq+6dQ2AHv0RCmRDmRnrSYRd5HVzo7L59NzStUnNoVlMpRWPnGiLa2aRKEMbmmNfcpDSnFCkWdjq3hoNkG/BuibKhPxsab+nadoJHdbjFNciYCot69gFMGTcZO2k3LSzFSoaQ7ad26SGUQ37FakZZqzdm1Klluv1UwwZN8jENGN+goRnUAwA/poD3GYoWcgqO/ghGoF2EV8R+X2HhzJdBHvYvCdIPKYfF5/tUB1FtkWz4E4VJzlskfRU9r8bwf4dhX8hBucNR9rgxC0WMSrziUMBIQAdRu6r0awGdOsM8zJTnwaHYOZA1cexSFBYip+Xxk2+s2ogk1A5WNl/Uw7atvA8l/GXjT9v+NLOPdmgGDqUrtKtNwSwO0DStW/czd9TWFUvMVkqcUIa4xA5JfV30tlV+mVErEEWXdBfekGI+vndoDkAIdIvx91lgkLQZB+w6H9o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5354.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261022113327099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TG9WRGUxcWIyZzVZTmRLdnUvQ1M1U3YyVjhvZW1zcXFSMVV2dWtVdnVvYWpR?=
 =?utf-8?B?Nmg5UmkxL1NMTUN3YlZaQ3k4V2lmaVh4NXFseG9xN25uOFdwaWRIK293UFFn?=
 =?utf-8?B?SnpKTU42VkhocmVyU2wwd1FVVG0vRFBVSWRzUC84VTNpNFlGbEpjM1FXdHdK?=
 =?utf-8?B?YWxESitEZGRoYXFLSnc0b24rMTdPbTd5NDlFRVlSL0hQeWRYbDlNTUdGazAw?=
 =?utf-8?B?bkxRbGpycU1va2FXZ0RncjNudEM5bkxKby9LZjlxYkQ2ZEJ0bW8xa0g4c21C?=
 =?utf-8?B?QjE0ZUI1MElxY3dHNXBmaEwydzlZNm1mb2dNbWU5TXdFN3ZpYzB5MkFDelRl?=
 =?utf-8?B?SDJTeWxBNkVLcmtOTVZVWFk1M3ZjUGQ5b3lGQURDTnI2ZHR4cUlCb2c5TXVa?=
 =?utf-8?B?OUVYQ3dXSkE0Y2dvbXpDc0UrbU8vMk9ZQ1NJSlI0QngxVmdvOUNXY3REMjc0?=
 =?utf-8?B?eUJDT2JJbkZYcDlQbHNaWmJVZ21ReldXQmF2Y3JEM0w3MjdlQUZDZllQQytu?=
 =?utf-8?B?M2pMTDNwWTJoRUdFamJyZnMyamxMQndrRE43OHdQNnlsQmdwT0trSVBpeVda?=
 =?utf-8?B?VW95TUJ0N2l6RXVkU0FYSG5UbFBHMmJxOE1KMUFGVUlGYWxYSVdOMUpoRjFs?=
 =?utf-8?B?U3ZtekRRRnFTM2VQWU5PSU8xaTY5TUVKcW5yR3dCN0hobGVnb3lTN2VzUVZU?=
 =?utf-8?B?S0tLV3QxVkoyLytYNHZNVnZrK2JNQzBmbTllcmZUeUZ3OHVRMUhIU3hXdGcz?=
 =?utf-8?B?SVVZODc1VGtFK1RSak1adHZFU25Bdk0rUXc0TzdtMVhIMll4YWduU1FsRUVx?=
 =?utf-8?B?VzllS2ptZnZGbkZvZ2N0R1o1czFoQ2FXRzdlMDFqdE42bUxCbUt5ZElnczk1?=
 =?utf-8?B?aVhKREhsZStmdERmaDRqWktCS1J4bEJQZmhDUU52cTdlM1lvT1hzNUhCbnpV?=
 =?utf-8?B?RzNoSWNRYXhnZUFKZ2FQYkNkSDNsUnhDekJZNDMxOURRK214WmZhUzJENnFF?=
 =?utf-8?B?TDd2V3hZSUtUK08rZ3lQQzgwNjgwd2pvNk9VaWg0eUt4clRaTkl4bmNwK0Jm?=
 =?utf-8?B?RXdWYmhOWUFSQjhFVHFYNm1COFFvdDRTUU1wcWdoT1dCZDdnWk1EdUZsVzda?=
 =?utf-8?B?d2YrRktIVW1Ndyt4MkFpblo4UzMvZ0hYMjVOTVNyV3dQeDZJUnRIMGNsZmFs?=
 =?utf-8?B?L1BONlBPU0xha052cGYzb053YThLY2UzaFIzZTNjdXFHSmJpby9lUVlCeVJj?=
 =?utf-8?B?T1FYSGhiVnNybjg1SGQzYUJtSkNMQ0YySXB3aEE5ZXAxNlliNWwrVHVycDVV?=
 =?utf-8?B?OUhRTDBNT0V3alJaY2kzSWhHcUNrQnludjJpRnloeWRIYTM0Z05tWUNZblJR?=
 =?utf-8?B?U1VFYXZ6M3ZNcDhza1hYTzBqeE1IUkNjaEo0VDJ4djhEZzZjY1JhanAvcmpX?=
 =?utf-8?B?cjlra1NlZmRpTzJ2Ky80dU0vZ2kyeFVnMTNHTnBSTWo0TW5yWDcyWGdMdEkz?=
 =?utf-8?B?TnlzanpiUnoxeVZ4ZFZDYXYzUFYzRHFnbFUrcDBUKzkzWmtsZE1rQnh5NHNX?=
 =?utf-8?B?SFpJbWdwZnZmYVVtdlUzNTZ4UWNMN01pSkpTUlZYdXphaUxMZVgzYVdPSkJS?=
 =?utf-8?B?Zlhlb1hmbmpDNWJRSGVtSTZIRDAyYWxuSHdVWE9TWmZmSW13bVdYSGxqVm9m?=
 =?utf-8?B?TW93Nzdlbk8zSUcyeXM2ZjkzUm4zcURpL1FaVTZIemcyL01RTi9SL2o5M2Q2?=
 =?utf-8?B?cWFaNkdKVFpyaXhteTJvUVZzSlk1VXBoNktMdnFzUGNKZHdtc1Q4YVFxditV?=
 =?utf-8?B?TllCczVVRURFcFhwOTlTS1MxSGhKdG9VQmk2RXVqc09BOGpOZnM0cFdwK2Na?=
 =?utf-8?B?RE5GcU5OYUxRUGxlN2d1V0had0dLTXRuSk4zRDc2RFVER3hWa0UvT2wzVWpz?=
 =?utf-8?B?OE5PbE5JUWdMQzVrcG1aYmV6TE5SWEYrbmxFYnFlVCtzUThnVGhNWUVnZlh4?=
 =?utf-8?B?dUlHVW9tWDZaZ213OEoramU2M0FlTjNTRVBLdS9rbGExSkZ3T0N6VjF6Zkxw?=
 =?utf-8?B?Q29wSURUeDNhSU5wUUNhaWFIRndRSlplNi81eDd5MFl4WDB1YUgvTGdObHE4?=
 =?utf-8?B?cXpqMUVyUTBlRHRMYllROUNPSVFPckQyOHFxNlhlYlY4eEJqMS9vMm82a3l6?=
 =?utf-8?B?eHZNOGhTTmpwTGxkWXhXQ2JGaVhBK05HazcxYjR3VnUxcTA3cFh6YzJkOHRK?=
 =?utf-8?B?eENRMUZ5YTh2R25rUzR1am5XY0RKeGowdkZaeEtFOWtNZ3Nxdm9tWXFDL2Jr?=
 =?utf-8?Q?raO0OPlkTFC/vZc62V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 327d5d6b-41c5-4f37-68f7-08df367b99e9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5354.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 11:47:40.2474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FyIfjZRNAw0IcBTrgtY9kc3E77F3ABW56NQMd68KTNEdFaHxAMduxhIWzBoL/g+yRtibGmHyLheiWhGUvmbDUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7015


On 10/28/2026 5:56 PM, Greg KH wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Wed, Oct 28, 2026 at 05:49:32PM +0530, Gupta, Akshay wrote:
>> On 10/26/2026 5:44 PM, Greg KH wrote:
>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> On Mon, Oct 26, 2026 at 05:09:10PM +0530, Akshay Gupta wrote:
>>>> From: Prathima L K <Prathima.Lk@amd.com>
>>>>
>>>> sbrmi_data was allocated with devm_kzalloc() and freed at unbind while
>>>> an open /dev/sbrmi-* fd could still reference it, leading to a
>>>> use-after-free on ioctl after removal.
>>>>
>>>> Refcount sbrmi_data with a kref: take a reference in open(), drop it in
>>>> release(), and free the structure only when the last fd closes. Mark the
>>>> device 'detached' under lock when the misc device is deregistered so all
>>>> ioctl/xfer paths return -ENODEV. Move misc deregistration to a devm
>>>> action and drop the now-unneeded i2c/i3c ".remove" callbacks.
>>>>
>>>> Fixes: 35ac2034db72bbbc73609aab5f05ff6e0d38fdd0 ("misc: amd-sbi: Add support for AMD_SBI IOCTL")
>>> The documentation shows how to properly format this line, please fix it
>>> up, and don't put a blank line between it and these:
>> Hi Greg,
>>
>> Thank you for the feedback.
>>
>> Will update the commit message in proper format.
>>
>>>> Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
>>>> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
>>> signed-off-by implies review.
>>>
>>>> Signed-off-by: Prathima L K <Prathima.Lk@amd.com>
>>> Wait, this is out of order, yours should be below this, right?
>>>
>> I will drop my Reviewed-by, and fix the order
>>>> ---
>>>>    drivers/misc/amd-sbi/rmi-core.c | 54 +++++++++++++++++++++++++++++++++
>>>>    drivers/misc/amd-sbi/rmi-core.h |  6 ++++
>>>>    drivers/misc/amd-sbi/rmi-i2c.c  | 54 +++++++++++++++++++--------------
>>>>    3 files changed, 91 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
>>>> index 95c9109101b5..e77f114c16c6 100644
>>>> --- a/drivers/misc/amd-sbi/rmi-core.c
>>>> +++ b/drivers/misc/amd-sbi/rmi-core.c
>>>> @@ -13,6 +13,7 @@
>>>>    #include <linux/module.h>
>>>>    #include <linux/mutex.h>
>>>>    #include <linux/regmap.h>
>>>> +#include <linux/slab.h>
>>>>    #include "rmi-core.h"
>>>>
>>>>    /* Mask for Status Register bit[1] */
>>>> @@ -193,6 +194,10 @@ static int rmi_cpuid_read(struct sbrmi_data *data,
>>>>         u16 thread;
>>>>
>>>>         mutex_lock(&data->lock);
>>>> +     if (data->detached) {
>>>> +             ret = -ENODEV;
>>>> +             goto exit_unlock;
>>> Why isn't a guard being used here instead?  Then you can do a simple
>>> "return -ENODEV", right?
>> The existing code in rmi-core.c take data->lock with mutex_lock() and
>> release through mutex_unlock()
>> The new code added as part of this fix patch, follows this so patch stays a
>> lifetime fix.
>> I can submit separate patch converting the mutex_lock/mutex_unlock() to
>> guard(mutex) after the fix patch is merged.
>> Let me know your opinion if you suggest to submit the guard_mutex() patch
>> before the fix patch.
>>
>>>> +static int sbrmi_open(struct inode *inode, struct file *fp)
>>>> +{
>>>> +     struct sbrmi_data *data;
>>>> +
>>>> +     data = container_of(fp->private_data, struct sbrmi_data, sbrmi_misc_dev);
>>>> +
>>>> +     mutex_lock(&data->lock);
>>> Again, please use a guard.
>> same as above.
>>>> +     if (data->detached) {
>>>> +             mutex_unlock(&data->lock);
>>>> +             return -ENODEV;
>>>> +     }
>>>> +     mutex_unlock(&data->lock);
>>>> +
>>>> +     kref_get(&data->kref);
>>> Are you attempting to use a kref without a lock?  That way lies madness
>>> and is sure to be wrong.
>>>
>>> Are you attempting to keep the data "alive" somehow?  Are you sure this
>>> is correct?
>> Yes, the kref is there to keep sbrmi_data alive. kref_get() in open() does
>> not race with the final put. misc_open() calls ->open() while holding
>> misc_mtx, and misc_deregister() takes that same mutex. The probe reference
>> is dropped by a devm action that runs only after
>> misc_deregister() has returned, so the object cannot reach zero while open()
>> runs.
>> kref_get() and kref_put() are atomic. I will add a comment at the kref_get()
>> saying this.
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int sbrmi_release(struct inode *inode, struct file *fp)
>>>> +{
>>>> +     struct sbrmi_data *data;
>>>> +
>>>> +     data = container_of(fp->private_data, struct sbrmi_data, sbrmi_misc_dev);
>>>> +     kref_put(&data->kref, sbrmi_data_release);
>>> If open is the only thing that can get the reference to the kref, and
>>> this is the thing that drops it, why is the kref needed at all?
>> open () is not the only holder, kref_init() is the reference owned by the
>> driver binding and a devm action drops it on unbind. each open() takes
>> another reference and drops it in release().
>> sbrmi_data is freed only when both are gone, which is what closes the window
>> where devm frees the structure while an ioctl is still using it.
> That's not good, this should be attached to the file descriptor.  Don't
> go allocating things at bind as you will mess with the lifetime rules
> here very quickly, and it gets very messy.  Rely on the rules that the
> vfs layer gives us and it will be much much simpler.
>
>>>
>>>> +     return 0;
>>>> +}
>>>> +
>>>>    static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>>>>    {
>>>>         void __user *argp = (void __user *)arg;
>>>> @@ -570,6 +622,8 @@ static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>>>>
>>>>    static const struct file_operations sbrmi_fops = {
>>>>         .owner          = THIS_MODULE,
>>>> +     .open           = sbrmi_open,
>>>> +     .release        = sbrmi_release,
>>>>         .unlocked_ioctl = sbrmi_ioctl,
>>>>         .compat_ioctl   = compat_ptr_ioctl,
>>>>    };
>>>> diff --git a/drivers/misc/amd-sbi/rmi-core.h b/drivers/misc/amd-sbi/rmi-core.h
>>>> index 975ae858e9fd..ae084beb6c03 100644
>>>> --- a/drivers/misc/amd-sbi/rmi-core.h
>>>> +++ b/drivers/misc/amd-sbi/rmi-core.h
>>>> @@ -9,6 +9,7 @@
>>>>    #include <linux/miscdevice.h>
>>>>    #include <linux/mutex.h>
>>>>    #include <linux/i2c.h>
>>>> +#include <linux/kref.h>
>>>>    #include <linux/platform_device.h>
>>>>    #include <linux/regmap.h>
>>>>    #include <uapi/misc/amd-apml.h>
>>>> @@ -56,9 +57,13 @@ struct sbrmi_data {
>>>>         struct regmap *regmap;
>>>>         /* Mutex locking */
>>>>         struct mutex lock;
>>>> +     /* Reference count; keeps @sbrmi_data alive while misc fds are open */
>>>> +     struct kref kref;
>>>>         u32 pwr_limit_max;
>>>>         u8 dev_static_addr;
>>>>         u8 rev;
>>>> +     /* Set on driver unbind; open/ioctl return -ENODEV afterward */
>>>> +     bool detached;
>>> How can open/ioctl even run if the driver is unloaded?  You aren't using
>>> the cdev api properly I think...
>> This fix addresses driver unbind, including unbind through sysfs; it is not
>> limited to module unload. misc_deregister() removes the miscdevice from the
>> misc-device list and destroys its device node. Although it prevents new
>> opens, it does not retain a reference to the driver-private sbrmi_data for
>> files that are already open. Such files retain sbrmi_fops and private_data,
>> so a later ioctl can still enter the driver.
> unbind through sysfs is for developers and if things break, you get to
> keep the pieces when it happens (see the discussions on lkml about the
> recent taint flag added when this happens.)
>
> So it's rare, but still, let's make this simpler by just moving the
> resource management to open/release instead of probe/remove.
>
> thanks,
>
> greg k-h


Hi Greg,

Thanks for the review. I will drop the probe-owned kref.
v2 will move misc to cdev API so the open file holds the reference.
sbrmi_data will be freed from the device release callback when the last 
file is released,
rather than from remove.

thanks,
Akshay

