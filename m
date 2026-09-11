Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013011.outbound.protection.outlook.com [40.107.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999EA339390;
	Fri, 11 Sep 2026 15:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139607; cv=fail; b=jAdH0bgVhftJbxsjs/q5//qavhrTWr7BJS9cB9r3hCFAX+3AxTImwK7cdwuq5/8cmjXkZJDJ31w1mYPcCn27aRM+HQX182T1Mp2KBM42Wd0poXIvpRmoYFrjT2jqZXoWyNd2n2MyB4QYTz+YvaMCSqmVeFpZTJEXim4UqZ/gGO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139607; c=relaxed/simple;
	bh=cE31HZRXbIA9Nj5uFT9qN5oc+2Ft/xQUwZ8stBpASOM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KD4c4mXwfFFQKkxU4g3KnZHRhjJi82zsyKy9ak8OXIpU7AOUyLnzqpJyy6aVWd/iaqDICmVugn+cdV/5/ny6J6a9YJ6G/4l0F0adByyKdTO1Arfdy7OgBNTCbZdyhgLtIWGgd5kr9VMHWbDADgXz+lj1Rxwt7EE+ni7RTvWD8TE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=DL2wa6K1; arc=fail smtp.client-ip=40.107.201.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="DL2wa6K1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpF72hwg9Kqhzn+Y+AbpA94A7MvjX5XQ+6F0RD6VXb7RYpZyhTA2F5DExRZ2XJOiH8AuijYHfna5BkdLrInKfvz6uGd33uUkwaCTb1r5LPzvVgBd+hQ1rywzB3MFP/Chh1zBhHgoKWKQXfsZ/ZFKYEeupR7XNDTtyMja4rKQerLSXCz9GWj9RME9iJafrGDAsx34cMYwLeU8OoWUK8leFQIYMiw0ovuHiJc+KWt3GV/rp2C6E4r2+3Ie2kJGy7zzSMlRL7mSCl4CFIR7k+Ny+ZpuO3W0cxh2MYYuWoQpeU/8P51j9sMvg+CrcwFj4q4hAS/m3nvX7lIwUKTpQKOjSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUexaUXv7jp6TWGWDkPKaNjeIx/awvHB/4UggY+mUgY=;
 b=c+9VQzJd3RfXkQS2ZTNXnVIVFUIA4WojP1sYwrBUdm3t9ajn5kutuBXAZREPI6QDlffYwZpMSWNKFCFCjt95P7rsvSyVWfBGmN38R+WQTLa6Uf5OkLSvwkseFzWaMKGr12GCXP7jqzn5vQ1R3GbdVI+a57sTQN1sieUHMfqo+YRfoY1/7MR1dKQGaxJ9R923NrD5X3AVul2xUStOZeu0ibB1MCQM2Q1bK5Xap/wJjjSbB6jD+EK9F3XI43rExon1lwC/4WOLo/oYw/2VYKp+v77p1tDue4cWt1OEO2vBuEJlWvlD06xK0ipe3Ciyz/czALU66siDSYfAqX6cvqTo3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUexaUXv7jp6TWGWDkPKaNjeIx/awvHB/4UggY+mUgY=;
 b=DL2wa6K1m6YFexkZpzY2JmgsYUeiscz82cuyTsw0mMhdn0dyq6atbnxDuurgJbi+oK1/cRomD0b7xqJ9cqoTT4giAXvAZAT+JzSsKtH5RD6H+pw6bjye2s57kysXFb9uiXebJIfcaItU05ztxJkP+0iAYrhgl/mi0eBM1MULMkFU0Lnkn2ILgptwfD65e+X4KHeJgFtbu2LC1DC4xdVeGjvNQhhKYDA4H/za92Cbfr7lLF0xbpXqDsIIutUTTlzAEG7t4sRzvKAA/qEJESNG+TjbEqlW3ZJgm4EqRO7TRsMep5aRsfs0b2eOQZqEsOSPWDmONjyZUbAuo1VSUtJD1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DS1PR03MB7943.namprd03.prod.outlook.com (2603:10b6:8:219::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Fri, 11 Sep 2026 15:13:22 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:13:22 +0000
Message-ID: <54005f3b-94d6-4047-b969-b10e2cc8daac@altera.com>
Date: Fri, 11 Sep 2026 23:13:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Add Agilex5 support in SVC driver and FPGA
 configuration and partial reconfiguration support for Agilex5
To: Dinh Nguyen <dinguyen@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.v3.git.adrian.ho.yin.ng@altera.com>
 <5644e6cd-c8ab-4f3f-aa7a-11867d00446c@kernel.org>
 <399d0a7d-857c-49bf-8beb-76ce5530184b@kernel.org>
Content-Language: en-US
From: "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <399d0a7d-857c-49bf-8beb-76ce5530184b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::8) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DS1PR03MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f7b690-0c14-4c0f-b097-08df10173841
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|6133799003|10067099003|11063799006|4143699003|55112099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	nNfLqsvs361z2uIbyPXq8+Mw7FGMFUe6FotQ4XIQ0Z+w69xtxpm/sd08/GR49A74P2/oKDe+R9tX/ETPok4Ims0k4W9ljYGvtF3JUe8WpcN+34OAXHJQt8D2HiJtd01K/RUq1i+5W/aSnda0SLLbLvq6m1LIxYqxq6C3zwPuZtuXTYnqnTcePg1FUNd8Xl+tLmsAH5WuJocUg4Dr3L9M13i8QGTVvd78kZqvzAd1sWYBVbs8Mqg+DWbemhvtAQaFMTZ9Qafpqzc1AjbdxY8oiY9hubU13eXindZk8jMVoXG3UltuWDep/IIONw3rpzM3+KHCnlo9PumAtOJtmjJJlXIlxIESD7bN7WVsB2W7CWaqwfaJo+67OKfYtiaQifmIJ9D3ogwRXv5tLqSdX0ZpE8tKd6amGm2jiuMq2F/xfLydwrMhW8eQxlRLy5DoA0T+yN39GR+i2N2lmWqXwC3FS2kM424YBooP+iK+JuSVQFaF3QGlci62qLsABaX55b+vZ6p8h4oVYiJ99Ho6elvw2DPPytwrc+QjwPfw0CPC3DXiCnlbE+4PUT4QChPHSln0lAPfqgydEA2T34BCtChNWjpoSHk9deGnckw2FeVJPKvUYB0VAEtRoLUSetRdYjbVkfxI/1+3Y5VD6TneYp69/zi98okhWu28ERMy8+9NeFI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(6133799003)(10067099003)(11063799006)(4143699003)(55112099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0xDcEJqUWlvZ1lMbGttYnNNT3NQNk5SdXczbCtidVNQbDdZUXM1Nko4S05V?=
 =?utf-8?B?bmtZKzJDNlJ3M1pxUzZRTllCRElqa2h3YnNpcW1iUUNlKzZma09xcTRJaXlS?=
 =?utf-8?B?eFgzNVdpUnpEbjZFQVh1amNkVVJrRWRaKzQxYitKL2U4WHZLZXlRdjFDM3k3?=
 =?utf-8?B?ZUVDTHhCcXhIa3dPcEp5ZHp2RUV0d0ZCc010UzQwUkNtTzNPSUF4RVpraXgr?=
 =?utf-8?B?Z0ZRaHkyWXkxMHhWWVdLbEdtNkNNNFNXS2FlUkdXdVp3UU1WZkdiV2lXQnM1?=
 =?utf-8?B?TXRmTXQxNlRnSTE5RzRRbWl5WDhPTEI2d21SWHVmSUNFZDVzaEVZaW8wQUtq?=
 =?utf-8?B?ckl1RklaZUd0WWFMaEt6amJVOUNBRk43c2FzcFY0N3VuQ0lFZmV1ODR6bkJ1?=
 =?utf-8?B?U3A2eDF0S3lpbmE4WVB2UE5ubW8zWHBUME94enYyTmhFcmRJdTcvN0wzWkl1?=
 =?utf-8?B?M1E3WTlTWWt1Zkw3SXVkdkFmY3VhY2lGbTdwSUNnUG40V25qak5Rd25wVmVa?=
 =?utf-8?B?dFFUUTVWbjZuSFdSL0hueGdGS05haSsxTTZGYnpJazZSREx0Qk4vS2tzMUNl?=
 =?utf-8?B?djlWWGZ6cm1LekVnZlZTU3lDR2NYeW9jd1lIK21CSU1sNDZUOEc2ZVk0N3VL?=
 =?utf-8?B?WG81VEc4VTFKbHgxbWR1ZGhTRlVCdTh6dnBXZ1hzZkluY0xGQU1uQzhjRmJI?=
 =?utf-8?B?T0JnN0NoMXpWZWtQTEh3ZSszZEU2eUVMaEtjNUdhMUp4U2I2T2grZWpzQ3dL?=
 =?utf-8?B?WkQ2NzB0aGhHKzRXM3N1dyswdnBFSDhwVmo2Rk0za1FscStKRG5xdlJ6aWxK?=
 =?utf-8?B?Z01ORlh3WjZkRzA1cFNGWDJGc3JaSnJ1MVFScks4aXFtb3gwWDlQNzdPd0ZD?=
 =?utf-8?B?SVdVNXE5MCtsaXZHZnpUOWxsd0dKVzVqZUVSQ0VsTEdzWjdzaXZUbC9pVDU1?=
 =?utf-8?B?YTFtSlMrV2gzYitubWxMWlFvcEJqUUYrejZHYU5tUmVmTDkybnoxa3Q3aVN4?=
 =?utf-8?B?VWNSUklNK01IeHZZSjZrRERRTkNrNGZoWFc4VGIxOFZBVDBsbmpsOElUek9M?=
 =?utf-8?B?VXE1eUg3bkkrU3c1SkJaWjYyRU1NR3ZGeHErSXZITFl4UTdkdVNjRWRDTURG?=
 =?utf-8?B?S1hkS2cxZTN5VTBVSGkxZ1FYZ1lLTEJCS2JJbnZBcSttbXhQQTZoYkJaaFRW?=
 =?utf-8?B?VnlkbC9YR3oxYVY5OHhuMGFQeGs0ZnFXQWhmTml6UlZTVTFCUUZtTThWSmRG?=
 =?utf-8?B?dmszbFhQdnF0TnFRMXJabGFjWTFGYjA0YThoOGtWZDZ1aU1DL1c1WG5hSVpy?=
 =?utf-8?B?dzlEWkNRaUNCU0MwUTUzQTRzWDJucHozSmpOcU4rYmJVOERlZGFtalJYY0Qv?=
 =?utf-8?B?Y1pBTnpuMUxYSy8wV01SZTZacXEyRHV1VzMwc3JINnhGdUdJMVVjUXgyT0Fa?=
 =?utf-8?B?MFJNMjlXdzBJQ051enpFeHNod2VwVzRmeUJ5cjgyMmdMSGZ6a1NCR1RCQmFV?=
 =?utf-8?B?L2ZhTkFIL2RHcDZJVDQ1SEtlUDNTNmJFd0pBZXJJOUJoWG5YYkt1V3AvY1dp?=
 =?utf-8?B?amZSOWFIYVE1eUcreU93SStsTWF5cWVxMW8vbHZmUUJBbGlMdUc2Z0dSbmUy?=
 =?utf-8?B?QzBMbXNIRG5WNHZwb1Z4TXN1djZicGNFWVVncGhBeXFXeS94YitpQllNeTZo?=
 =?utf-8?B?ek11d3gxOUhtZGxKRDN3M2I2ZjVETE9VWTNQRTZvOStOSnlqUFdySHplcjBP?=
 =?utf-8?B?RlI4eE5VTFVtWDZmOXVWaDZ1Y0NnKytvQ0sydnB4QWZNOTNOemtQSnhjb0hK?=
 =?utf-8?B?bjRXeE0rK3dVVXJkVGRJcGV2TE5YenFJVDhjVXpJSEJ3bTRQZGdkbitaWHNr?=
 =?utf-8?B?VTZDTUFIYmh1R0x3YjZrOWw2djZqcU5aVmpVRFMwdzhpZUNzRVRxRWFSWVMw?=
 =?utf-8?B?OGNvTExuVEhBakE4ZkdLS29Oa3lyNmowVEh1dHZSbzFqM3JEWUZmV0xWNjd2?=
 =?utf-8?B?V29BaWx2MUduWVB0UVMzNTRvb0RHaGdWb1dyaWFSUi91SzFpSG13OEVWcTRW?=
 =?utf-8?B?c0hncW9MaFNkVVdsaXlRNkx2ZENpUmoraWtFdkFqcnFOYlBxb05OMXdMU3FQ?=
 =?utf-8?B?Ny9wdjc1UUVMUUtibmJueDZ3aGZ2em83OEFJczl1TUhsamFGUUNxTnpYQUhH?=
 =?utf-8?B?SUVLYjBtOVVWYmQ4VDNtZWRBR1hkOEZWWVRMN2ZuVmQ5N3NzOTRPZXBseDY1?=
 =?utf-8?B?TENhSG15ejQxbnV0NXVRMnVYaFE3RUdEWmFQVUp0V1hUK1duUmxyYUVpNmJJ?=
 =?utf-8?B?SFVlVEFpWTJwaUFidllMV3NqSnJ0dkRlTGd6dTY4QWx3VnRJK0xPcWJVdlZ0?=
 =?utf-8?Q?NZRSPahPbTg/FzuI=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f7b690-0c14-4c0f-b097-08df10173841
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:13:22.6960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YM1oWNzgFZyg4szuCg79/lOASEw6KVgQIEFWHc/xDUfhjLpO22OWgTXpBXqcU7r3gRKwBqGVJMltSVNMDuGwTlGgJPJiJsF0KOZDf+z9dW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7943


On 9/11/2026 9:54 PM, Dinh Nguyen wrote:
> Sorry, but I had to un-applied the firmware patches.
>
> Patch "firmware: stratix10-svc: add DMA coherent memory allocation for 
> SMMU-enabled platforms", when built by itself produces this warning:
>
> drivers/firmware/stratix10-svc.c:1112:12: warning: 
> ‘svc_setup_dma_memory’ defined but not used [-Wunused-function]
>  1112 | static int svc_setup_dma_memory(struct platform_device *pdev)
>       |            ^~~~~~~~~~~~~~~~~~~~
>
> Looks like you need to bring this function into "firmware: 
> stratix10-svc: enable Agilex5 SMMU support in probe".
>
> Please fix up and resend just the firmware patches.
Hi Dinh,

Thanks for catching that. You are right — svc_setup_dma_memory() was
unused until the probe patch, so building the DMA-allocation commit
alone triggered -Wunused-function. That split was also inert on its own
(use_dma_mem stayed false).

v4 squashes the DMA-allocation and Agilex5 probe enablement patches into
one commit, and resends the firmware patches only.

Best regards,
Adrian
>
> Thanks,
> Dinh 
