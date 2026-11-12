Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794463461;
	b=muR5UXsG3kA3uo/4WGkxrngfYgXQL3eG9DiNc+i2l/MpADDILy5pAE1MAUkZ0HQZMlJG
	 1I6ZY4YzozPGHaCWDGG3BMiulw4HO1RIu8w9jDB5BGatL8JnIoXM48ilplPcXPvgKYmBe
	 x9UpkCSwjUygL0LmvFlLq5pWU+n36QXk+SFPPD7TIza1lihaXjjWTaG3UvjNYBc8q1Ntp
	 slcHcwLFjBl5y1s3rZAvNbFr/fx7W34ZtT2mqe1n+FZXvmQYZdmO+v547A1uXTrCaX5xb
	 4NLu42WeiIwC4coKcu7lZVAUKYxWEfOh1k2PCXD+vleHIIdc1c6u3azGSoirsgzBNvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463461;
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
	bh=BYfqjoYslJofAtcQPFySqHDOp2vBAxC8H47ZU7wkw3A=;
	b=GPk97LkY3LBgo0hrslel2UMtqgB/9ZuG+Js+5umVgKh5GoAF+EaDBrIGfD3PDZRRG1Ok
	 f45yOpSU1tBwEHNhSt7p89degGW9OOY2QTaTgjQDetyPO8JkyWKi41hz2sV1KfBQzKw4K
	 Nhut0ElZrV4T0jitLzSVB/JfSd1WrgIuM/OINtOnBjSxDlP+JNgiRKvFESR+/ADrSns9D
	 E21glYNHLsEP1PDiqc3liMCM+tPFTYonqrxcyn43xvVBEdf+pFJQfCQwGZhEOI7hHUxTW
	 rDrj5BGcvOktfi+7vIqqRkkKSy34/DXNB5coiv2kJ4x9C2xVupU3chV1WlklWn/i/Yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MG56SeWY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.18
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010018.outbound.protection.outlook.com [52.101.201.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E4C606A323;
	Thu, 12 Nov 2026 06:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03E4C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MG56SeWY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMdUeL2/BO0q+7Bp/NkJNLT0hytkAGCaFBh1p0oKhoUiWpg2g336rFUnHwjjk1fuLjHVCtsVCC69dNmJpCBkmqOgoR5ruEHK447LfaoWvHGfh/ltxE97f6skaK0L4yFV7D0rYuuzoc5fNrqf5rzfuSlN55ytYwWPGHtOecfHOAtkFyexlZ+xDVj+sBVkXmVctENIcGsENT6xKZ4ySLRz4aGWj1iKj+xrG7k4dJZcNF3xQIWZXUJeUZZ3tvEj2QrBIrbGSBonKCzigROLXMYnhLOItFCgPFAMhBLYgEDzKRx+noLcjuOj1qvoFhjxhspEqR8ET4Y59t9CboVV2Aqp2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYfqjoYslJofAtcQPFySqHDOp2vBAxC8H47ZU7wkw3A=;
 b=NbaaLuP33wOGM7UE3HD2cJRumdCVzodtWrrSFiy/T9hBnrflY/kHsw77hre8X9TkhTA+2XT4+fMJmeBdR1W6fS85Ge2nfRofDpO3u5Nf6mO2rUHiDKaUp0sbcJStnm4uzj0Mv/5jb9jzY2d+IQYZeVg/crEgtoaOUPZvokQFKEaOQdOP6bAzvsaRXXj35xnF7Lu7E2aeUVIlxiotZUrbcW6GBKBv3JaQ76/T6b9zPXWI51ltNzjnuQrBikLt7b4ALbiz655RmhJrKOrXMQRe0eCAwweG4LpEK4zZrR0zcGZSNDyxMpliydUyVE2EOGe4bm6+khMbWacIoXsoZQ7Bfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYfqjoYslJofAtcQPFySqHDOp2vBAxC8H47ZU7wkw3A=;
 b=MG56SeWYgBhZvfDmvx+MEP1ncZmUPwhCeCNASlLqyyCA+5wF0LKxlCMC9eR6PpdF/aYoEiDUkGjXXlyTRbvopWkKPlaiVLsVFbzC3kMFTOXRXHKLZUcP61lAKbXrMNDQQ+5ZTVkgTu56U/RVeEYy8Nxzxk6NYzSNef02Hku3eW8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5356.namprd12.prod.outlook.com (2603:10b6:408:105::23)
 by DS5PPFA33D606F8.namprd12.prod.outlook.com (2603:10b6:f:fc00::65b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 06:04:18 +0000
Received: from BN9PR12MB5356.namprd12.prod.outlook.com
 ([fe80::8e9c:2f3d:9679:942e]) by BN9PR12MB5356.namprd12.prod.outlook.com
 ([fe80::8e9c:2f3d:9679:942e%5]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 06:04:17 +0000
Message-ID: <e00546d1-38ad-4aa5-b0e9-6609b2796a3e@amd.com>
Date: Thu, 12 Nov 2026 11:34:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] ASoC: soc-acpi: move common function topology
 helpers
To: Mark Brown <broonie@kernel.org>
Cc: Sunil-kumar.Dommati@amd.com, vijendar.mukunda@amd.com,
 Mario.Limonciello@amd.com, venkataprasad.potturu@amd.com,
 Siva Subramanian Ravi Saravanan <sravisar@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20261108193119.2308421-1-syed.sabakareem@amd.com>
 <20261108193119.2308421-4-syed.sabakareem@amd.com>
 <179442205142.484483.13609312009662203150.b4-review@b4>
Content-Language: en-US
From: Syed Saba Kareem <syed.sabakareem@amd.com>
In-Reply-To: <179442205142.484483.13609312009662203150.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYPR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23f::35) To BN9PR12MB5356.namprd12.prod.outlook.com
 (2603:10b6:408:105::23)
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
X-MS-TrafficTypeDiagnostic: BN9PR12MB5356:EE_|DS5PPFA33D606F8:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b20cc1-7072-4124-e049-08df4082c8e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|11063799006|10067099003|4143699003|261009223027099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vnSGXN/s3yYlcobkfLjBmE7N099jEqg0CUArCF9RtbHvyZZsEqSVIeq8bp9RSFwwPzDQFfecCeQiz9gCZk2dz4m/kn1qraXyJXP/GUIcoBH8qqDdNA1lNJQ5ApD3ZdwjpaI8c27hMkygUwolQpLQOLECd2IAOPY47eIAdYrOLf9fPvXwnvijjWHyULokff94sE3MN0QzDb21KH5S090lKhwUP5I8iXil1pThLgW2FecccONEjsdTADJfl5V0p83RqXkWWjWwecrPt4rPQ9wG5zO+OgYrgcse6oIN1aTOX7K81tIoR66he0vInsOx4L0ApviCO712uenZXxP7XgTIr1a8Bk7WtTC0OogM8X7pF163lIiKrZQpHGPqef823SRxTT4xXJwr3FnD2Q8brNYOmq5SPS4fmI75wDtD2MxT4Rful8ac/CW1ooRrIVd08wHspHGGEVrgsQZLB6UF1r3a5GmGVxlhfIOX+Wnvgy9XnAppcyPSpTQAUfhEIJhNluk+UVCf6XP/KY2MichHyQR1xpN1Wz5NksOxnoWtp+ltor8yLe8ZTkFgO+B+dpOsP+QsXF+Uj/uLB6nNSnO0d/cZBASJS0HMIpjbhrylrI6IMUniEjLtcZtMR8Ur4D1sxw2GSrCa8Xx1w2f+mTC2rTycOJQMmJMfVz40l6c2sx7ALxo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(11063799006)(10067099003)(4143699003)(261009223027099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDFSVFJVT2JhZmkxNVFGamkzNzM0ZFIwWFZiYVU2a2ZoMFQyWXV2V2hPaVNs?=
 =?utf-8?B?TmRPbUxmMURKNXVQMzVDYzBoVmVVMExGR2EzdGRudjh6dmt5enQrS1hybGRz?=
 =?utf-8?B?a0VBUmZnNzJvOHdaQ0xGTHg4bWU0eklVVzhpRXpXUTJPcmJrWEdqN3Q1R09R?=
 =?utf-8?B?QkphMVlPdTJlNituaEhjaDVucjZkdTFFVlhpN2VIRUl4bzVhMFQrRFIxVUVZ?=
 =?utf-8?B?NnhEeFF6a0lMbzFkQWZJR3J2cjliVVZNTHFJOFE3dnEzc05lSS80ZjdTZnpM?=
 =?utf-8?B?N1BMZEJKbWUrU3ZsNndjSVlGb1FDeUsyZ2Ezd0h5OGV3cHdjSVdGUjJNeW0z?=
 =?utf-8?B?OXp2aWxkZUhsMzVicmZoTFc1OHZVOWlQbDRPYzJkeTJNd2phc1hhNzJKSm1t?=
 =?utf-8?B?YTdKZTE5eFdMbWZiTE5Ld0ZnWThsczJUNy9HL25mSlFtaVQraklVVjBGRENp?=
 =?utf-8?B?dDJyKzZTV0d5dzB4R0paKzgycEhvL0dLZEN0RlVZSFllZy9uQkVlR1M0QUcr?=
 =?utf-8?B?K3U2RlZKZ0EyZjNycGhBOG5jeFQ2TEJWMTRiaExROUNXWXJiNzJEbjZwZDVy?=
 =?utf-8?B?Mm90T1F0a3R1MElLbUNzNUlRbkp0emhVSWlxMjVBTHRHWS9aamZhWERJakRJ?=
 =?utf-8?B?RC80OS8vV1Y4WXpyNGwwVmZBY21oZXdoOSt6WTliNkNRM0thbG42OS9rbG42?=
 =?utf-8?B?M1JjZS9ramkvYTFEa1BnOXhPaUVJdEhzZ0Y0d2FGQTN1OGU2ekFZM2ZLL1pO?=
 =?utf-8?B?WUt2QlFlbXQ3RHJNY2N6cHMzN3R5YXRCVTI2TnZjTTJZWkFnSjdBRmVCN2h2?=
 =?utf-8?B?aEdyckZDS2h5UzQ4c3RaL3p0UHloaisxdVd3VVMvR1VsNHBBL3UwQ2FxYWEr?=
 =?utf-8?B?THBzMnZHMVpoby91b1FzOEI3VUd0ajhJTjh6VzljSVVZYnJ0T1laSFhRb216?=
 =?utf-8?B?M2VVQXdrZjFnZXBJUWh6eFA2VFdKTnZnQU8vNE1xYjEyeTlSa2ZWWWlQL0RC?=
 =?utf-8?B?V1lnZjJnbUhucW9STjRXMXFvTTFON09SdmNPakI3dElFMXA5dEhNaHY3TzZj?=
 =?utf-8?B?eTVnQVRhejJ6Y09ZV1lLaTF3bkxyQm9xY0ZBUDFRTlh0T3VmTUxoQUQ0NXRk?=
 =?utf-8?B?bEZ3bXZhanMzTFU2NjB0QzBaUC91ZFFwS3lpbE5iclZROHFEdHFmNVNqMmo4?=
 =?utf-8?B?OFBSaEpURS83cWxSZXkzTVVTRGdWaE5EdzhTSE84c1k2NjdLb2hXR3V0WGNS?=
 =?utf-8?B?YjBTL2x4VEZaOHM0VlF4YWJaeERsWmhWbzByVFlBZ2cyajhtTGdaTS9GRUNZ?=
 =?utf-8?B?KzBwMVkxRWZzZ2VhaVdWZW5Kam5NcUIzbW1IYXpNTkswSEkra3dScHkzNXlQ?=
 =?utf-8?B?V05NZXhBR0ViTmc1ZGJlUENRREFFbmlBYkxYWWtpbFM0SFd5THo3VTFVck9J?=
 =?utf-8?B?WmR4OTM1N1pJUGYwNGtCbTRJNHhXaUVURGthMXJyaDlLbmNMby9OZk9VOVlq?=
 =?utf-8?B?R2NxM1AyZ3JxYWhtNjhuTW5KNjJNUEN4N2xHVi81ZVpacTNsK3Bibjk0aDJ1?=
 =?utf-8?B?RlpmUlQ3Zmp5OGxSMFR3Y0k1aXd2VzdCRnBTb0NpOWVDWGd3NXNoZWRTdHRh?=
 =?utf-8?B?cGp6NWhVUCtRQU9pVCtzRFNaQ3dwdFRNbTZhdjJGa2EvZlBsSlBtUWtHMVRU?=
 =?utf-8?B?UXRQSmw0bllQVDlScFNCMFFwbmh5SHFDOTdUT2hLZitWeDFtNlR3bVhwUmk4?=
 =?utf-8?B?bTJLaW9XTDZ4SE1FbVlaNng0eXpNL1NSeE10UzB0Yk1wSHNjRXdWelBOT1Jt?=
 =?utf-8?B?TXBIWkJER0RhNzVsR2lSOWhhWTM1SEx0THNIaXR2NVliNWpwL3BzOG1zdDU2?=
 =?utf-8?B?L3hNM3pJMjFwZ092T3d5TGdDbUFJc0MvUCtxNEV6ZTc4cXUzLzhQeGNnRVkx?=
 =?utf-8?B?U0lhR2NERFFIUThGdkdzOVBCWm5VVXAxZkpOdm1RR3hJdkxxaUZvcld0VGxD?=
 =?utf-8?B?TVRkQWFZTFUrODdNVWx6TVNZNXdYVWFaY1pXb3pBOUUwOWFPVDdCcjFZYkJh?=
 =?utf-8?B?czRIZmJOVE9SMzRhUm9KdXl2NExOTFh5bjVwSlJZUjlQdmVkOUxOTXliSCtE?=
 =?utf-8?B?MXdVS2V6ZFdpTkZmSFQ1aXRzMC9obVNmd1lJRmlZMEYzcCtwQ0FCdmwraWxE?=
 =?utf-8?B?c1dSUU9sTUp3WHk3WHl3KzRZa2VaZCs5YmErcStMaWRKUFVxNnhUTXoyWC9K?=
 =?utf-8?B?V0xCK0dYelAxZkJQNTIwbmJUNjc0ZlpmaW0zaUJHQzhkOVJ6dkdjbTRSeDZV?=
 =?utf-8?B?YmlZZkpvVzdydzRPOEJpYStuQWxkOTRxcDlQSXZuVDBmRm9vUzVmZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b20cc1-7072-4124-e049-08df4082c8e3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 06:04:17.3619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMK54EzauW2Lzwqf6HBLFgP4vuamo5AoJBdrl96mU/7aGMZemPBVF7YuOUfavAzrZqXo5/Mip/APlPzvLvoDxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFA33D606F8


On 11/12/26 00:04, Mark Brown wrote:
>> Move the Intel function topology helpers and the topology device enum
>> to soc-acpi so that they can be shared with other platforms too. The
>> moved helpers are:
>> index 2ee303b791dc..aea47a42f43d 100644
>> --- a/include/sound/soc-acpi.h
>> +++ b/include/sound/soc-acpi.h
>> @@ -257,4 +257,29 @@ bool snd_soc_acpi_sdw_link_slaves_found(struct device *dev,
>>   					const struct snd_soc_acpi_link_adr *link,
>>   					struct sdw_peripherals *peripherals);
>>   
>> +enum tplg_device_id {
>> +	TPLG_DEVICE_SDCA_JACK,
>> +	TPLG_DEVICE_SDCA_AMP,
>> +	TPLG_DEVICE_SDCA_MIC,
>> +	TPLG_DEVICE_INTEL_PCH_DMIC,
>> +	TPLG_DEVICE_HDMI,
>> +	TPLG_DEVICE_SSP_JACK,
>> +	TPLG_DEVICE_SSP_AMP,
>> +	TPLG_DEVICE_SSP_BT,
>> +	TPLG_DEVICE_SSP_HDMI_IN,
>> +	TPLG_DEVICE_LOOPBACK_VIRTUAL,
>> +	TPLG_DEVICE_ACP_SDW_JACK,
>> +	TPLG_DEVICE_ACP_SDW_AMP,
>> +	TPLG_DEVICE_ACP_SDW_MIC,
>> +	TPLG_DEVICE_ACP_DMIC,
>> +	TPLG_DEVICE_MAX
>> +};
> Might be sensible to have some namespacing as part of this move (eg,
> adding an ACPI prefix).
Noted will add.
>>   config SND_SOC_ACPI_INTEL_MATCH
>>   	tristate
>> -	select SND_SOC_ACPI if ACPI
>> +	select SND_SOC_ACPI
> This seems likely to cause issues on systems without ACPI, perhaps this
> should just depend on ACPI?  !ACPI builds are pure coverage testing for
> x86, they're not practical.
Agreed , we will fix and re-spin the patch series.
