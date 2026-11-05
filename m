Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793888213;
	b=P6HJSms4qTSKfB+kWEAVvXY4jOxGp6JjB3SLZioQaesA4KhB0XeHgIWanPuZak2tDY6E
	 z5sVu3j2acT3rmP14xG0Je9R4TPBMhlHkFfKpsKHj+ku+BepwJQaRKOUH+Vf4v+u9msum
	 UHGFMvEb5J7EuJV7OWj91B8qVGJ9JEnKK6EK2HxwYzPCP5yhK6RrTwbMd1lA3h/RiuLX+
	 gsrbscclmKb3NsuLJnvL9jYrNHosVVMYugafEIJedlWO3KWG1+YbAMZ9Vm9JhGmYP2Qf4
	 gYsEdSgL+ilebVcEVaO/jl56mDtR9S6SqvfM3oPwIUhurEbiSu/kZ1t4xLQMOvzyBMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888213;
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
	bh=oy7ucOouBCaFuik96G1uHvz33Oyu2k6qAZpmKthB6AU=;
	b=wR0CwSJZZrZ0V57sucdsQcGqOdYBET2rw8JAKyWiqEhdcZ9fXAhI95kl1kkIt+aNG6jR
	 jn6o9X+O+6oqiKP8FlYiZtfXNz2ES262mxUj47acerEM+rJKLeBGhfnmIu6myIvb2nWXk
	 sVweSXDtbsfPWe4HzwboQiCLk1rDvHapAWCcQFkQbcXg3j/AU3q80APXcKUszEw3SF7bA
	 S8MVmdxSN6CmhtlsVxi4Pfw3oAzwMkOvEqoMDaYaKSbpF33zjVIwafqMFs5QL+1/pr2IG
	 eevILRWolvRI5pvZMQFP5MH58j+2ULLJZyGFZBxYdyf+5utsAK4mRZpn3NoLcyQ7RpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2SZwK4fx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.29
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011029.outbound.protection.outlook.com [52.101.52.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D87606A328;
	Thu,  5 Nov 2026 14:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25D87606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2SZwK4fx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNTBwp46mS8HlDRBrvu7N2V8Pk/4Mw5EzE71LP3bu1s33u95Mr8MtJKuvDFalj4nTalwrz6cO6zamqD4ooZ1063Pc8aWMwF3sG/wUQb8NbTWNSNU8WONeT3QJfGQ5K8R4lqdSEZU3HyEcEvNddHgKrq8zKbjhBHX7JxILALy6eRAeJxI2f/otpTRGIuhxC0SAYXUF0ftvRF4Dxv2Cr2ej9c73xS5OGT4a2v2jfjp7Xluyra1xVDpv3pTogi9+Rrlugy+RkV9O7Lh208A7lyr8Jn3hha803sCxdTfW9HEADkZOipAIz/pE4amcWdrXv/sd5cPUNtHCVTWU8HzpyeP5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oy7ucOouBCaFuik96G1uHvz33Oyu2k6qAZpmKthB6AU=;
 b=WBX2d+dRCRGlEa9gGzFusvF0kyyNXeeotjojJLuMLRzAVKLwe0zrfa8oOHECEWtkHZIUt+6DkC9JTg4uTfAmBMFNd+lXsA4XyYhUwcRzxXwqxjEmJNziZSO2LjxoA/83ZH3TlYVtHDLrgIXQ2FZW8UrUy7qBrz7fVrZoCxEEduCjwWy2PK6yCNTXA4YbJLcAf7pjCIEwKhLjM31oDBRAW1cv85U8M+lK04zguIP3ZTsuDkES/lR3T9P3JckNyCzxGXk2hSpid6EwMvXj5AJQi26WFpWv7G0QUK06kOoLoUtjq0roNd8TQ4CuauA7FVPKYT4+XWeCJ+acIlpeI5A8iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oy7ucOouBCaFuik96G1uHvz33Oyu2k6qAZpmKthB6AU=;
 b=2SZwK4fx+VpNGV3sOnFqmQ94/9aFJUiEFZ923g2qZUekFGBUZc/6yhA4/VHXjK9zdOya8g0RmPiq0doMXwTojuItpmYTRx0Jpa5dtdcweG57wPzmaawNYpQfTJymhG14Rdrjk3ij1x8JrUjFqFkhsCct0eAoXUpxugN5EV7kPcg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9)
 by BL3PR12MB6452.namprd12.prod.outlook.com (2603:10b6:208:3bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 14:16:48 +0000
Received: from PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc]) by PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc%7]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 14:16:47 +0000
Message-ID: <29502d1f-6358-4d9d-9898-7295b3cc203c@amd.com>
Date: Thu, 5 Nov 2026 08:16:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: amd: Load alternatively signed firmware with
 an "_l" suffix
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261104-superm1-lms-sound-v1-1-c50b9284bcc2@amd.com>
 <d98e6241-c3e1-4e18-a133-43fc7daefc2d@linux.intel.com>
 <75156710-5ef8-4575-8f78-d65b9d752200@sirena.org.uk>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <75156710-5ef8-4575-8f78-d65b9d752200@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0365.namprd03.prod.outlook.com
 (2603:10b6:610:119::13) To PH7PR12MB9174.namprd12.prod.outlook.com
 (2603:10b6:510:2ed::9)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB9174:EE_|BL3PR12MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b68a119-de60-4703-b9c3-08df3b476ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006|261028144727099003|261026140227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	DyTrmUiTVj0WnIAqFLVksNe+nyRCh59iG14x+XXLZWGUaBaklT0d+5byMigWgNiN7aSF1v3m6b/8BCzyANv3HPvfT+AUMdJaOu9LLFDvRL/0hOsjabjmw0YNwnPKytlkiHlujgDBrvgJ4uEY37yqFSRg3vn8Ngps6pSGREVSciqMqrUBiAlFQGI7u0BIc7k7nw2wXBxAB+kDpfWHHxY5HHWypbP7uByYMsz6FQdGZbUZGb5wlAxVfYhYw700Uep712KBTjYrs8gdxPb5DpNaMTDSZ02GhT203VrlWxRjEQemtxM8n8ljQ0n7PJpJtfND9XooQHmV1MexxtDVNDf6TdOOA17jejlWLaOBw+5EqKRQ5Xvg5y9SEy7yn7gQzdibVkYT5MlLlh8uuTzNpc9gcQy4zk/nsNFG+MLxsksoDMnUn+mv6uGIZCUIwqo+Yxt1Fh/WcvYiQnqNPbkIDaYNVwHKHDm6EtRaM0dPL7j+Pvtp6AOj71g5Kqa1QZkZMjnsZILMXaRq9+ksNLNJ5w9R4fFpm0vE4KfNiugKm8dcEWvF3hFkurBpLBi5PxF87pMTrPOKYqhAXqLP6d9X0VerxB8Rdsx8i9d/4+M3jR5z/tgWafngCgyjd6jcA5pBKH4MoqsCxennDQnkvon2fKGkMTmW4dvajXG7RTkIfxXnIjE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB9174.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006)(261028144727099003)(261026140227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWlXVnh0aVpkOWoxaHk5SG1Ld1hEOVVGOFI0QmhXUlQyQkFTWk9rZURNZnd6?=
 =?utf-8?B?RGdOYzkrV1B3SmxPcmJCWWxTMWtWQ2NMT0VIa2J2OEtmQStvWXphd25Fc3Vk?=
 =?utf-8?B?WFJGZDBlalpoZ3QyNnVnQkJiMWZNdm4xV0JJRWROU3BQek5uR1prbzdmM21Z?=
 =?utf-8?B?UGRnVHFHWCtJVU5BWGVSQ2pZTXVRTHNzZVZwdFVBcTN3TG5FRkpxMUprNGVJ?=
 =?utf-8?B?RExaUVA1dTdlQlF4clVJYXFwQ0pDbUMwblp2QWdOSnBleUl1ZXgweUZvSVFT?=
 =?utf-8?B?WW9WeHRMenpmUTI3UUdaRGtLbURQY3FHQUVHNUplaitqMVFKN0pIRCtOZ1Fu?=
 =?utf-8?B?ajFCMWtRMDZGRjdrQnBNY0c3blpGVjFnbmc4cjBhR0ZWUXpNcnZzRUFqTk4z?=
 =?utf-8?B?Z3FxR2NIVGNyUXh5MGZXeXVWaTE4d0tUeE9jQlkzNVM5SW8zQ1lzcG9PVVZG?=
 =?utf-8?B?QXB4ekJGNG9hR25zcnR0VlRRN21PNUxiaDFnNTB6QmcrdUF3VTcxaWw2cDAx?=
 =?utf-8?B?SWZKOGhPK2lwY2h4dUh6RGllNU9FOFpQT0NOdUtpTmtOQTRIazI4d2xJSnkx?=
 =?utf-8?B?T08rR1I5YjI2dWR2RGM2ODArNmFXaDE3ZFNaTkt0eXpVM3dodEJpaDNuK3o5?=
 =?utf-8?B?WFlieFdLUTB0NjJtTDh3N3lCYzdkL3E3N2tZNmVNTHB6KzRwNnRmcHd1T1lP?=
 =?utf-8?B?M0lsM244Yk9MaTF0d0pTeVdUVXRoQ0h6UGJvdllzeFVwRFFzZDMyUERtNGV6?=
 =?utf-8?B?OVl3R3VyL0pxOXVMemhPOTJvaWQ0NWdQMHd5eXBhMzIzWE5rdWJRRzZINnpU?=
 =?utf-8?B?aHVKZXFwNEh3VmZOV1p2eDlybm5vNjFiem5DZmhQdlRkNUxmR0J5NWlxLytt?=
 =?utf-8?B?YWdtYmpTbEl3WER1akQ3RVVSTDE2b1lGdTNXSElxSjlMNFR6WGVqU3JDV3pQ?=
 =?utf-8?B?dmpLODJ4K2lqdU5PL3JYN2g1b2lMV0tyb2MrT3FzRWZDMTVvaS95U2VqbzI4?=
 =?utf-8?B?eTNkVWV2c0E4TDhwWmF2WHUxR3F2NDc2Ky9TdElxTk52UTRvWVhaQUFhTWMz?=
 =?utf-8?B?K1FtbVFVY1hkUXljd1phWUZLNDFJWEVCK3dXOE1teGtNRkZBcWlqQjFUZzdt?=
 =?utf-8?B?di9lL2V1aVZlTUZLSjZQL0lXYWhuTWNsbm5rTVo3NEJmblBXMVpMVjlMa0xy?=
 =?utf-8?B?a1VheE5HZ0JSNWJ6UGZlQjExR3NDVkVuWnlhUVcveUxqVW5RSG5NUnBZUTU1?=
 =?utf-8?B?cGpvUlJmRmhESm1xSnIySTQ2d0FVUHFpZEtFcUdJUHJGcG15OThSWnVoY016?=
 =?utf-8?B?QUthSm9lcmZvLzZING1RVTlscGpsY2tYdnFQRWkxTnBTU003Rlo3UjNIaDBi?=
 =?utf-8?B?WW13SWZvbVppUGdaRDVoRDYwZ3UwN1pGNkZ3aCtEK0R2aE9mUStKaFhFRTJK?=
 =?utf-8?B?dHRPdWo0OGZaaHJxdW9TL0tHYmZGUWk0ZUZPdEZZdW5ZYmpHWFV2dnFTV0xV?=
 =?utf-8?B?Ylp6Z3o2UmszUWVTNTc4S0dkY3ZNRVRoc013TGxkN3hlUFpEQ1pOYnUrUlBa?=
 =?utf-8?B?a3lody9CWDhhVENnQytNR2VDK0xmNmJwWUFMZENOZnlaVHV1bVZ5ZytGY1JQ?=
 =?utf-8?B?M3VEY0M5ZFJKWktSWWsrQ1F1OEdWbXptNjczcFlnS1ptZXU4dE5Dd2pHNUdR?=
 =?utf-8?B?Q3NBaHpJSTFFVEl3WkFZSERJaFhmT3BRYTJqQTlZa3NVUm9GN2hwUmFWNWdk?=
 =?utf-8?B?MWwwYndMbGFLTHVVdXhZeTNqczNrTWhTU1BtVUlIYjUwemVjN0VuWXg2NVBk?=
 =?utf-8?B?SThLZktRWkhaKzAzU1F4NExlVlFtdC9HejN4ZmJLMmZSR1NLWldBQWFzMzZ3?=
 =?utf-8?B?WXBGaGZWaStRUXlNUk03UkFXa2RIVmoxVzBlOWJsekFHUk8zajBWZDBCRUNm?=
 =?utf-8?B?bWx4anJmL0U0V3JzbHZJSStUNkNRL1JLL1h3eis2YTJkUURSTHc4enNUcHho?=
 =?utf-8?B?QnlyU3QvSXRzNEZySnNSbmtFeU1Rd3lNUEpoOGo3c1FxYWluaDIweWQwVm1p?=
 =?utf-8?B?Vk9xbEd1bnEwL3RFdE11N0xFbGtVaWRVSkMvTXNVaGh3OGRkVVpTcm5ZUEdD?=
 =?utf-8?B?YnVSblAyZUw4UXVseHd5NG5KV1NxRk44MmpPTUcvYmtQck04NEFuU2g3Z2Yz?=
 =?utf-8?B?aklkM0x0b1Z6QXlKRDdqd3pvTEwza0J5Z2FHRjJqMUZPSFdhRTVkSFJNenpG?=
 =?utf-8?B?QWNmVzU1VDBpOVVlbXVKU1FpakJxUHVpcnFCVlozODVYWlB1QmdwdGFqSGZJ?=
 =?utf-8?Q?Y8lcHamFH3ksrxoTpX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b68a119-de60-4703-b9c3-08df3b476ce5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB9174.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:16:47.0378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvEqIlsQcqhZlamTRwfDSPeAUnFsXSVX8m9Ijp0EThtO+Jz54dyGxOrQFjhFM+vdphtX1QidWP6OBFnhDCsmBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6452



On 11/5/26 08:07, Mark Brown wrote:
> On Thu, Nov 05, 2026 at 04:03:32PM +0200, Péter Ujfalusi wrote:
>> On 04/11/2026 23:53, Mario Limonciello wrote:
> 
>>> +	ret = amd_smn_read(0, MP0_C2PMSG_63_REG, &val);
>>> +	if (ret) {
>>> +		dev_err(sdev->dev, "failed to read PSP firmware signing type: %d\n", ret);
> 
>>> +	/* all ones means the register isn't accessible */
>>> +	if (val == 0xffffffff)
>>> +		return -EIO;
> 
>> this would also merit an error print?
> 
> amd_smn_read() will convert this to -ENODEV anyway so that won't be
> reached.

Oh yeah; that's dead code then, thanks.  I'll respin to drop it.
