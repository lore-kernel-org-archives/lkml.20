Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794080192;
	b=c+fEuhVDwFoGzeUvGvA7vihmcaHB7NWjrbQS3nG7BEbJQoTHHnIibopCVe5Jcpl/tXpW
	 BAIIlxUph/EqNJHkBVSNHzYF2/iqjES2j1/HswXhQTSXCFdvLqz7MxJGT4i0Py7WFIB0C
	 s/ljH9RaDa1OWTpQQ80MdIdmSdniZEVFN+ZZBCGSs+zfFMDMUiP4lkJdnI6lHS1Jqqf3M
	 m6PmZNQnUB5iJJ4QYb66VJgEaGBD9k/foSdVXI3I+S3RFjuZkeEISfM0evQxUljoCdHeN
	 o4eiqzrVg4uJnE4s0lKWTnVoBqhTwZr3Z/e2FjWwbfdGDsP8dmfLe3b6+rX09ODKang==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794080192;
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
	bh=mXujhPmcdURM8CFqJATESmdNaHtvHM9RrpTQWg2vdpg=;
	b=f/auln8ah7LKn/Aq07k+eGbMguGz5bFsxlcucHlgKJwwge9JEwL5PvMwrstmLjk0+aBx
	 i2yicXUBTPX4FbCy85foQbVJ7DXOO5xkH61Dtpp/xsvXJ9qIrg7JQNFP8iH4Zv+Tq8ftT
	 wGFjbymb/G0LCslZS7syhMY6MbamIk4VUr+vRzwgPslK4F7VXHz/wHxyTxrE8r/c1wmkp
	 vKKWxSziwRn8zRJb85NcIgPmK82jXP021qM8wj6kfivPY6mgIHsF2YG90jpKx6WFymIxZ
	 hvc/k1tnZzrOvB97kdSXGHtI0dWYZAvZtqGEg9ZBZ/cqTQlyOPEXuzNqGfht/ipThHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OtrEF0tq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.3
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011003.outbound.protection.outlook.com [52.101.52.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A4C606A326;
	Sat,  7 Nov 2026 19:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4A4C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OtrEF0tq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nF7Rey0yAsC7itGLdANRzHLIGwF55NW/pZbxWWkbYFGzUEj4NO7WR1Wr44LjiTh33PLWwe7UpjmFZ/unNOlNQvupmuG/4b6HzL6lfD+npYkDmzGrbcjodpUb31t43QOH2EJPrvIV5V2Np1hUuxefLVU3gnYKlFb9pVWyPdvsBy7zLNO5o6kzcPwPJ6bmzfhCIm034WEJZGDhu70tuEkHGplhz63qggZZyj8vTnlQkmbaL4K/SYPqm7d0CLHpyOyIxNATJ6Y2JAFZqj3D4Iix0XMChm69uybm76h82q0unzObdW9xgoizyQdeuw8e4FCiU+zuAITxkb5fUkPoZb3QMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXujhPmcdURM8CFqJATESmdNaHtvHM9RrpTQWg2vdpg=;
 b=kRQ9vp0Kvf9F4gUBkOIlHM3LxnSiHYfmG7kDnVsUb316Pz9RbZXmWApPSNuMUWJwDv80KsMZOI5gxoM626PeohC5GTizrcLykK/Isv4T4z3aSGLIF8BAMzpywqSOCLa+Eqoze/lunHuU/9kE+4ujrTv+QBS5vRbQSnO64ABZvZ9KNBk5hoGJp3omEP0h6UGXC0DZa0IwRGuZ6jG6QnODD3BWlqdjQ1+aoSx4NuUhck5Sia+587eQ041zR34+oEA9FQrlKEm5OW09kEEnuxH48fzAD7y4xchclHl39a7B/VifewKngPeI8/3gaDRRm2h1G/TrnpBWbJUCzK6e9NLB/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXujhPmcdURM8CFqJATESmdNaHtvHM9RrpTQWg2vdpg=;
 b=OtrEF0tqMeJkzLK+LYhqimPPU+UBV6hBJfDdfvHr7NAhxr1UtcbhGWcDXsmFsXuyJzI7ufrQGTGEK5FTV/QOZdXd6yMYQAjXA0yjNgYqkF5hZ0LR4/K8oufh0Bw/b+pYtImbPeh/7qiFhlAFmZk7xGQt1EojRBgaKC9A/M8yMwk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by CY8PR12MB7099.namprd12.prod.outlook.com (2603:10b6:930:61::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 19:36:28 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0592.009; Sat, 7 Nov 2026
 19:36:28 +0000
Message-ID: <f2f294f0-55bd-482f-9b47-fdc9f506fe53@amd.com>
Date: Sun, 8 Nov 2026 01:09:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ASoC: amd: fix IRQ handler races in AMD SoundWire
 drivers
Content-Language: en-US
To: broonie@kernel.org, vinod.koul@intel.com
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
 lee@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20261107175339.3547918-1-Vijendar.Mukunda@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20261107175339.3547918-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::9) To CY5PR12MB6252.namprd12.prod.outlook.com
 (2603:10b6:930:20::17)
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|CY8PR12MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 29eb1c91-1f24-47b7-60b6-08df3d066acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|11063799006|56012099006|261009223027099003|261021121427099003|261022105027099003|261021123027099003|261022075727099003|261026140227099003|261102123227099003|261026121527099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Qfr9eFumx4ZB9qmVh3NaO/K9d652ZYEofloUFxIheaNdLe4jT0ES3ndprbteB+pyDR+OzrA+hL+YSHOxa9dDMNrzBg16vBpAFuIIBxtyZH+Dz3bLrlXWoaCHPP2OiDGKeXaX+qEC4KbU304MgI8EHgDyK9YXKvNszjHgZ/tRBvm+8dSTfgMbDS5acnIXY/ujdJ6QLTJxahk681Gm8Pc7nH0tbO0zioHhKWRNsPypv6fP9SHruv/ndkCSh0eh38ceBjuAGP49WKBDES0+8aq+294hIbxsBK8uKm6iCe9LCjfZwcmfu74FSs52zNjmqVZEf+ZqLitOOP45Y6fGzRoeuLDr0M7XQW6OqsHLZOE5OY9BBbBmtrDmL9wnKS0XwCwbVnR2Zg1o4netsFS06Jyh416JxPgWE07BuSFXWKJjrVwxwzJUITe4lQ3oAMxloQ3ViCl8jpvBbpuBMRg22LL2vqz6D3lpi7mRiUPbdCkVVjZ9qrLIC/UHNfe5BgH13n+MWiR1tZeGgCL5O3SmOsN0pYtuPKK9VLDQUYjQuDQWoP1b7pDAk2Qe9XTXL2cvowzGYCL8QxeBSK764gxKPd+krXEZhWLj5esu56HdhPOoj4s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003)(261026140227099003)(261102123227099003)(261026121527099003)(261028144727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVZVYUtDcTdHcWFJOHJFZ3ozTWxwTnNuZUNNU2lvVDJyWGZWRlduUERZS2w2?=
 =?utf-8?B?ZUxlQ1h2Zy84WmZxWlMyUDYyRGxrOGlWNGVUUzhzNDN6dHhQbWtlWGhPNjZr?=
 =?utf-8?B?dnk0ZnIydzd4Y1lTQXYwbW4rZWJXZWpiK2E2RUVaVHRtRW05V2FFbjUwTVB1?=
 =?utf-8?B?NGVzUVFCZVE2bkpzTEp3c25vUWo0Vys5djFZOUJYZ2NGSHNIK3Z1QklmZWRh?=
 =?utf-8?B?bUV6S1ZxV01oaU1TNmc4alRKQ00xR0MvNmJyczBLYlgyY0I2YmhCM0pMU3VO?=
 =?utf-8?B?cHYxVnZWSCtvRHFHZy9BaHVoQnFNV0NUOENJc29LSTRXcmMyNUhIUnVUNVNZ?=
 =?utf-8?B?eWNGTk5SU3VhY3hXeEZJcjNBTjIwT2N6UWlNemUwNmdxYll2OWlJQzEraTRR?=
 =?utf-8?B?c1JHcE91TG1qWXdrL0MyMHFRWjFXc0I5dU9oWWVkVVhkRzJNZHBvcjVhOVc3?=
 =?utf-8?B?Rnh5b2RBdUliN1ZUMll6ZitGaDh3c3lHUFdtZ1A3TytzeTFVazlTcWhrdUFR?=
 =?utf-8?B?VWh4QW93ajBkTHZIWE5iZ01Fb3ZZM21ZOHBvY2ZHWWxEcUhENU1TTjFjRXZN?=
 =?utf-8?B?T29Eb3VJWnFjYXBrWGZsWXhrTzB2UVNKOFZPREtIS3EwR0c2dDNmem5FZGZo?=
 =?utf-8?B?ZGFQSitacEFXS0dQTGN1Ry9wWVNSVmR3TW9FQkFzUC9QUjcyQ0dYa09EcEVN?=
 =?utf-8?B?cXVSWktnYjVjRk9lZG0zcVFjamNOYk5pMXFScjFPZHZMTk4wUzJ2Y3UyTWZS?=
 =?utf-8?B?S3hFUDd5dVJlcCticHhpaWt6cnpKTzAwVjlDMlhqSVpHUDFVVGNGQURXWTFz?=
 =?utf-8?B?Mk9SdlkvVFRTN2FZTWs0ZFg0bnFJbUkrbE1KTTB5WHh3Zkt5YmN6WUs0dkxV?=
 =?utf-8?B?VmF3Vi9ScGFUbVFGS2plM2tKQjZjL1lRMmtSVWZhWFNUV2FBUHNyMm1oMnZ0?=
 =?utf-8?B?bkZIVStBN2xncjZ2Q2ZISGlpdlFxT0V2eWt0b2Z2STR5T0kxWHMveTZGWnhx?=
 =?utf-8?B?bG5qT3pBL0JzWlo1WG9nazN5YlNMTjdENE1ET29PYUxDMitneVpYYXFiMGE2?=
 =?utf-8?B?M2UzdXFqNU9CNk1SbnRLSDM2ZUdXdjgxd1dYK3N4ZlZkT1M2Q1hqZUVlT2lY?=
 =?utf-8?B?aGFoVmJLS2padklqKy85cXhOblE4RmFwcGhGazh1SnRPeENVeG5DdWtsK3Vn?=
 =?utf-8?B?RW9LM1dXckpSZXBzV2pmNmtiVkJ1VWZZR2w2Zm1FRUNOZUFZNWRRUFFoZzRE?=
 =?utf-8?B?Zytrd3g5aTdCd09VL2pKSWo2bzB1VzBxNXBQbmpueWNoKzJLTnVac3E0VWJm?=
 =?utf-8?B?SERTVnFiN2FCb1ZvN0JZZ01TckNRVmxQRkFnUzZTSVdhdENEcUxmem1ZRm5L?=
 =?utf-8?B?TnZ6SzRjeEN6SUZRQmNpK2hZWk40dU9keUN1NWdqbzJnSVpsNnNxemgrNnpG?=
 =?utf-8?B?SmRQR0E3dkloUVRJbnFLMUFDOTU3V1RNWEJ4dmhBdHU2YmhPUUc0OEFLdkp2?=
 =?utf-8?B?bFptSkFzYTk2NHBEM2preUhpMk1lMkZtUVBZa1dQQXUrd29wVE1wMXVpU1Ro?=
 =?utf-8?B?cnpQUDNmZWNXYnBuaCtnUFFGRFRvRkwzRHl2UUtFby80ZVVHb0ZkMWNVTUNY?=
 =?utf-8?B?aEs1dXlnQ1hrQ2RLTklpL0g3TEUrb0dHM2Y0Q0g4cXNBSWdPU1QwS0FvMU11?=
 =?utf-8?B?UzF2Tjc4S1VneE1xMy9PcldUaGdFdkh2T2tFWmNjMkVNSTZmdkNmYUQ3UnlB?=
 =?utf-8?B?WEtRMjN0cFdwMm1ZMEJDVzVKV0g1TUVsSDVmM3ArMWd4UlBZQmNrSjJEbEhG?=
 =?utf-8?B?N0l5Q2h0UmEwaVJiY0pZQXZtQXh3RVR2d1V4RG9ISXZTNXlBMmFwZWJ5bnpC?=
 =?utf-8?B?YkZwTXNYSHA5c2xKbXlhWHpQQ012dGdvTUdYanA2V1QxcXh3N1gwOUJkaU1z?=
 =?utf-8?B?NDVCRXhkTlN5Q3JJZmQ5YVdYc0N0S040S2lzVHVYTzF3M1p3cWEzVUdseWhR?=
 =?utf-8?B?TTdQZndjak0zR3dTK09yUTRYSWd0cEJpamtYRzVQUFRZTkt6MjdtWnYzVFN3?=
 =?utf-8?B?VHF4YkRwUDFLSjdISExHUEJoNGh3SThtRDlGZDJKUUtEVGtKYTA0ZkRtaUdr?=
 =?utf-8?B?N1hxY2E5bWJxbnRXcUd3UzBSaytaRHArTXJNaThWTkhzRUZFV0NZbFR1ZUF5?=
 =?utf-8?B?MnUxWXF0alF6MW0vNGJhNDRBZE5XVEFzcVl2OEZNQUdwenl4UjhPNE4yV0VO?=
 =?utf-8?B?L2ViSjZYbVdNL1l1Mm4ySDJYS3JYQVBhbk1RSE9yelNTOGd5VnVFajJJeVJT?=
 =?utf-8?B?UEZOTW1PRE9YUWN2bkdSWUdpTWgwYkFyT3JJMzNFRjFMZUFNdFE5UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29eb1c91-1f24-47b7-60b6-08df3d066acb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 19:36:28.3852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2SyzTEYQonZQxQHJcen0DbKS8k5JhfOlvyuqeixelqFDwF5lFHUTqBSFwBO4gwoEmTXV6RThgGjf+YqFlv+nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7099

On 07/11/26 23:22, Vijendar Mukunda wrote:
> These four patches fix two related race conditions in the AMD SoundWire
> IRQ handlers for the PS (ACP63) and SOF platforms.
>
> Patches 1 and 2 guard against a NULL dereference in the ACP external IRQ
> handler.  The handler is registered before sdw_amd_probe() assigns
> adata->sdw, so a stray interrupt in the probe window, or one that fires
> after sdw_amd_exit() frees the context, can reach the adata->sdw->pdev[i]
> dereference with adata->sdw still NULL.
>
> Patches 3 and 4 guard schedule_work() calls with the interrupt_enabled
> flag so that an in-flight IRQ arriving while the SoundWire manager is
> being torn down does not queue new work after amd_disable_sdw_interrupts()
> has cleared the flag.
>
> NOTE: Patches 3 and 4 depend on the following patch which introduces the
> interrupt_enabled field in the AMD SoundWire manager:
>
>   https://lore.kernel.org/linux-sound/20261107154659.3358223-18-Vijendar.Mukunda@amd.com/
>
> Until that patch is merged, patches 3 and 4 should not be picked up
> independently.
Hi Mark, Vinod,
 
The following two series have a build and correctness dependency on
each other:
 
SoundWire fix series (25 patches):
https://lore.kernel.org/linux-sound/20261107154659.3358223-1-Vijendar.Mukunda@amd.com/
 
Companion ASoC series (4 patches):
https://lore.kernel.org/alsa-devel/20261107175339.3547918-2-Vijendar.Mukunda@amd.com/
 
ASoC patches 1/4 and 2/4 reference the interrupt_enabled member of
struct amd_sdw_manager introduced by SoundWire patch 17/25, so the
ASoC patches will not build without the SoundWire series. SoundWire
patch 18/25 delays *sdw_ctx publication until after startup succeeds,
opening a probe-window race in acp63_irq_handler() and
acp_irq_handler() that ASoC patches 3/4 and 4/4 close with adata->sdw
NULL checks.
 
Because the two series are split across trees, the Sashiko AI review
tool sees each series in isolation and raises the cross-tree dependency
as unresolved races:
 
https://sashiko.dev/#/patchset/20261107154659.3358223-1-Vijendar.Mukunda%40amd.com
https://sashiko.dev/#/patchset/20261107175339.3547918-1-Vijendar.Mukunda%40amd.com
 
When both series were combined and run through Sashiko as a single
patch set, none of these cross-dependency issues were reported,
confirming that the concerns are an artifact of the split rather than
real bugs. Reposting as a single combined series would give Sashiko
the full context and make the review cycle easier. Please let us know
if that is the preferred approach.
 
Thanks,
Vijendar



> Vijendar Mukunda (4):
>   ASoC: amd: ps: guard adata->sdw dereferences with NULL check in IRQ
>     handler
>   ASoC: SOF: amd: guard adata->sdw dereferences with NULL check in IRQ
>     handler
>   ASoC: SOF: amd: guard SDW IRQ work scheduling with interrupt_enabled
>     flag
>   ASoC: amd: ps: guard SDW IRQ work scheduling with interrupt_enabled
>     flag
>
>  sound/soc/amd/ps/pci-ps.c | 32 ++++++++++++++++++++------------
>  sound/soc/sof/amd/acp.c   | 32 ++++++++++++++++++++------------
>  2 files changed, 40 insertions(+), 24 deletions(-)
>
> --
> 2.53.0

