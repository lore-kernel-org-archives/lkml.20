Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793103282;
	b=SdNLwXjlXruXMsnW9fNjjJDF5vhDh7vbMb/toNvuQiWibmm3lTgjIHxh+aO3aRhXNAuf
	 lyCyTh86EbMe+4yF5jQPdrBrBwdmGFdXqmfOy3bdFmdKme4b7MrrQlsrj/f4H0bhhmMVc
	 sZ0tmV34V0qAQVcXfMPnaG0BaQDAjPiQA5ATwqJebxvnyOts9yjUhEN/11bvxeGiEc7fl
	 Tf4c83i+FREP7H4zryJnVcg6UGN/q4gyULZCNp/FP5f2TI3OC6I/ISHf2Iejio9BSZmOm
	 VKNjpDRMb/y/Qp//FNy/kqn6Mqy/5HY9/1U2S4u0/akzzwz5TTNHh4Bfd75dmaFl77g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103282;
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
	bh=pI89OSS0vB6jeY6UOEHPJO4zcMTs/9K7kfNw2W3zV3w=;
	b=xkYj/Wxk6iXCNwwxPQnBPLbJCmNNfm+WneMGYiSuQwtkv423aBy5o7j4F5FPaJlF0Cc+
	 pOxkZ9PQHE58nV5nKFQZwyRW3Ly4nMjHHPOdzaaysNFvnEZj2HNPrrSFRTyBIvlF8271G
	 6sSzReWoNEWvkGiul39hCuYFQX5/TzK0x16YbZIh/S59fQ4RWwSAI+L9Fsmy3i7UiK2A0
	 hrQu3Q4iW03Yg06wl90DiIaKpBa6uAMYPuekSL1CdHjG6+IY1pwWgrNNNHfvRKwKEkVi5
	 SOgV/XUDHCf11EMo/hZ8VAkqlXhtk9Hly5ks95iwe+4CDTYwUo/LJ9CUG1K8GBm3elA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=THoO7Pjr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.67
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010067.outbound.protection.outlook.com [52.101.201.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806B9606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 806B9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=THoO7Pjr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlaMr4KI5pK3RGZ4YkdWlyQWqmDc8yEDKbMWewKKyLU3kz9SqvRUZj/J+K+phXO+zh4PaOQoxhZYlJ7Xp65qVnwUogSKP5R9Rxhx3lMVS/b1TVEx5vqhauReysyArMihumbfBDWFCXH5kmViuVHAFmfu1opwoWvQjqUBwyMmcY0cegWnoVqmFlSS/3pBkIx03HfHZO9GMg4aqJZa5EiGYg4qkJAfnLTwSjTwlpfPsN0nDgydF0q12H6lQzx5zKzJMskuKSUg68LJpDKCHNAict0hpHLFxzR+pJVOOZKx+hFWsDpapuu3tDJgfFtsuqcx688O+QmSFkqtuCsIOQmIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pI89OSS0vB6jeY6UOEHPJO4zcMTs/9K7kfNw2W3zV3w=;
 b=EI1+eeiTChee/d5oXdIeHTP1L1vsOVmiXDEg8bkuqEDhVPH4vYO7w8IWs+3DrJiANCKLeEwnIFuI9Hr//mamifuIoQbCAqhmbsf6zOLFrEHeQqt25uqg5gGjNBcOPoDLF63P61GqOUerjXwth/mLoqW49MeoSSZyF7pj3x3ZvZEw7jEPv8M43gGJxwCWB783RyaEfTETMOdusGR4musn7B6uKzwYlAYidXYRk4ypBWNpPBjMnISBgYAtOt1fhg7MLjgCtw3EAVoxLVy6Fv7XQjRMKpEs6FaBpsFHLdam+pbBq0gCTeP3WmZJzVR1WKWfFzuT5hy79pwMcyWJNXPVRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pI89OSS0vB6jeY6UOEHPJO4zcMTs/9K7kfNw2W3zV3w=;
 b=THoO7PjrgPkIQBVVLGDCUtWGlRtap7YtDwHDKairlKtpHgWFHBaX16ZbL2nKQi8wjXIECbqFPzMa628VnMG631ZB6N2g9A0Xhec0Nri05mZg7RjwBBnKgax70QWPHIP+xZkuJyg5wtYdDpK2Uxg8KFbsRRqJU68oswU2GF/cwP0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DSVPR12MB999172.namprd12.prod.outlook.com (2603:10b6:8:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 12:14:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%3]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 12:14:38 +0000
Message-ID: <e0573e72-dcc1-4ff2-8cf2-53aefde912cb@amd.com>
Date: Tue, 27 Oct 2026 13:14:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/amdgpu: reserve 64M stolen memory for Apple 5K
 iMac
To: Richard Lane <richardlanedev@gmail.com>, amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <a826b32d-597a-4c01-8b30-218cbca8627a@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a826b32d-597a-4c01-8b30-218cbca8627a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DSVPR12MB999172:EE_
X-MS-Office365-Filtering-Correlation-Id: 54479ca9-d4a8-447b-e3a7-08df3423defd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|261022105027099003|261009223027099003|261022075727099003|261021123027099003|261021121427099003|10067099003|56012099006|261026140227099003|18002099003|22082099003|3023799007|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	3dehbebs0vXwrL+JgIVNxHlfEKyOV0hu1upFR4TMgukRJVrWwZR2kEyilDYZjavbpOhs4P+BCIgvjzx3Bv1XPqgHG7vOQVM1nneczkPUEnA9JQWCr7spaI8FeqQR8Ru62aICsXalEqZqjSJ1ce1ASwinkPCqOUz/TWnxUAKXq9mdE9aCRKbUuYqz1+bCGf3qHpkRGc2t/KsUyRAkFLqKw8y/jtxcXTll3GzXXEHlJoVtn4WY7UoC3INaT/KAGVSLlpik3/QwGnhATgVmDNgcqxZpNbOfuTlz76FJJqVlSMOzxHbtbX9dJp984BkXc3vEzA6YG+vaHH7upgQD4SWP/AnafDt89DApdW9xUpcO520KmejFjhBeXxSOJY6eq130mWkv5yQwSGwp+UnZyrGmqVtZiLbYGEP9VGFjBdC7Br6c2voSyv6+ku9vSr4isMBiGL9BZm9b3saT2DHpJGKJhBNDb6mzY/03J+9jD9cPAfi/44p4DJZ58AgNWfH8x5cvNjBYkeW3zu663QtRVWyyNsZJr3aLapaQyItumHEnSTh+PurgU9+43VFRc4Uk1XJmM5YjqKFoeEw/RoOBqn+3lQIqSw2abRQxrSmczh6qUYEr0GaiMl2Vyv9Hovdf8g5XeK0Tqg/XfEdjpLq588KCsEcvAZd0l9Fbwf+uc8G8tB0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261022105027099003)(261009223027099003)(261022075727099003)(261021123027099003)(261021121427099003)(10067099003)(56012099006)(261026140227099003)(18002099003)(22082099003)(3023799007)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0FUWlorRTEzV2RYQ2RHSEVjTXNaYmFadDIyTjhjdGxhTGpqaTVrV1Z6aXJn?=
 =?utf-8?B?eURlVm03ZHBCUlJHTzk4Y01HYTBsbTFNYTArT0l4ZHJSbHFtZmN1dFRLWURD?=
 =?utf-8?B?dWRiNFFIMHB4bGwrMjQ4OU5ldDdwRytrNVRtV3RJNzB3NkV4MDYwMDYxcGhJ?=
 =?utf-8?B?ZE5Vbm91cGhNa1JIampiMXljMkQ5cTFRTmtINWtmTWtrU1RkTElCaXRWcEFP?=
 =?utf-8?B?MkplY3lRUTkwZ2lBKzRBZUZjQlF0cVdkNjQyd3ErekxzYVBqMzNHTFZnZWs5?=
 =?utf-8?B?ekVyT0dmeHc3YTlvaTN0eUp3cXg2NXd3ODdLaG9pQk82bjF4dy9palpOTUJ3?=
 =?utf-8?B?NjJPUGJua1NVNFlpa2s1eGxYZ0J6b2xHdmgzTy90SmE0c1hYeUppQm5pTHN0?=
 =?utf-8?B?cWZGNVRUYzVHMzVrRTZrc1Jyd0pINHgza1pjLzlXVmdJUkN4NHY1Tk1UdjYx?=
 =?utf-8?B?c3IxTURxaUREb1RWd3hQTk1hNnZ4UE9pbFM1bW8vVjhWcDNQYmdFOUMyOVpi?=
 =?utf-8?B?N2VwZDcxWnNpMUxsRjc5dXhuUTZRRGUrb3ZET2dkajB5Q2ZaVThvcTBYc1oy?=
 =?utf-8?B?VmxCRTBMU3FyS0hYRWU4dWgzeFpFbG5iQWdlTTY2RlBnRVVJemprQ0hUM3pH?=
 =?utf-8?B?eDJkNUZzMExTSDNqUDRHMmgvRVpORW1hOCtiNWlvNjJlVkNNQW5WQUMzOW5y?=
 =?utf-8?B?NytId2p0Skc3ZUdGVVdNTklpT3piSTBac20vSGJLenV5eERHZHQvYUdqeHFt?=
 =?utf-8?B?S0RkbXA4c2FHKzkzWEJWMnhLL1lNZDk5d3lJTUEyMUljaG1TT2xGaVU5U1Ry?=
 =?utf-8?B?Zjh2Wk42ZFI2aHdPRlFBUytMWjJoMVJtUDI4VEJWMjdocHluVjdtUHl0RUd0?=
 =?utf-8?B?Y2xYU2VnVmd3bnI2VWJzQVJWYzM0Q1RQdDZZWmc2UGtjY00xdzc0c0ViQ3Ri?=
 =?utf-8?B?bE1QeHFLTnZIQXlCRTZYN2RORmx4dTZIdEkxbmNhZy9jQmJYV0tnZFBzMU5Q?=
 =?utf-8?B?ZzdaUnc3dk5PSlZNUUVRWUhTUTRuYWlnaTlZOU9Ha1FQaHlVZ05BK1M1TzYv?=
 =?utf-8?B?OCtoYmtJbUNCQ2hSTnlNVldvY0pwSFNva25rdEowZkJhcG9VZmxoVytPQ3VS?=
 =?utf-8?B?c0k1TlgyZEt1QThTOUtpeDhvUHBrYzlFRXJCa25ESzB0dmwza1dxM1BPSW4v?=
 =?utf-8?B?WjZrNjI5SkpTa3Jpd2J6ZXE0Tmo5dys3WWxPWCszUmhieWZPa3JxeXpPVFBy?=
 =?utf-8?B?a2pob2hlMXV4QVRVY1ZsN2ZMbHNmWEUzVFk1c2VET1hYMFlldkU5S3FzOHhN?=
 =?utf-8?B?Vk1wVENLSDNwQ0x4QlduUU5XYTJnZmFYaUw0RTJ0bjNSbmlXTXNzeVJ2NHoz?=
 =?utf-8?B?RC9kMmNPeVNRNm84cHZ1UlpGclRuaXVVOGtUd0Z4Z2UwTi9NWURZNHE0eUxj?=
 =?utf-8?B?TmVqODZRV0g1UzRGR2k0VnkvTnhHdUdVNTg3bjQzL0J2UFN1V1Brem8relFW?=
 =?utf-8?B?TDEvQ2hxbWV0Qmw3S2U1S0EycTI0RDFpcGxqYVRFNWdDakFyRHJ2eERjaUx4?=
 =?utf-8?B?ejZ5R2RPTXVqV2FwQ3hEYlVzd0pHSlF2UGErT0ZRenRvMnp5VGdRdldvY3dC?=
 =?utf-8?B?bDROMXVSUHN1NW43VUkzSTNFMnliUmk2elN1NjFPSEI0b0FhdmNTZ2FxTVhQ?=
 =?utf-8?B?dUhCd1hWODNuVVNZYXByYXBVaWhDR3RyaE9nZEVtODRZSDZSV2E5czRHeTdl?=
 =?utf-8?B?dVdKVkw1QU9lSGFIQjJ2UWs0QklLY0V2UDEyTUhNcENNVnZodWNFWTBUWWtv?=
 =?utf-8?B?emhLTy9aRVhDYmlhTEliYjgra05vQk5uUllyazNCeUZjZE1tR2lXSHBRekM1?=
 =?utf-8?B?MkNaNUMrU0VWdTc2WWEzbENJeUpxOHNxU2Rld0srYks4L1JSaUt1VTR6T2Z0?=
 =?utf-8?B?QkU1RlUxODdNbGo2b1pRUTNuZGJSM0VIS3FkQ2dEL0UrVHQyMk9ZZ2Vnamc5?=
 =?utf-8?B?RndxeWh2Z0R4V0FTTWhySFhiYnRnckxrUyt4MlBpZUFIM2RNbXRBL2pXQWpX?=
 =?utf-8?B?eU42c3YybmtpK1JNd2JrVzA0Z0ZrWGNXaVN5Vmt0RUhZVEszQmFrV3ozcCtx?=
 =?utf-8?B?MU1Id2tlUThWcjR5aHFGclI4eGNzL3FjRTYxTWNMR3dzWnVmYVZpMkdMdDVR?=
 =?utf-8?B?N2E2bEVlQ2QxVWptUnU4UDdMVWhSMzhpdGl3QWxpY2JlQitNY2tJbTRqZjJl?=
 =?utf-8?B?VFErYVlNSnlxRE5rRklXeEJlYW9mTndrWnZ2VTFQVVYwb2FWWGJZSkdna05l?=
 =?utf-8?Q?N2Pl0uHWnYq6QmzYp8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54479ca9-d4a8-447b-e3a7-08df3423defd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 12:14:38.1090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5gZ5JeapU78Tbf+Qv7Yp99vP/7B0Pok4h2GQgAErM8EmTz2rvv0dFrpcdgsCnyh+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999172

On 10/26/26 23:46, Richard Lane wrote:
> Apple 27" 5K iMacs report a single 2560x2880 tile (28.125 MiB) in
> VIEWPORT_SIZE while scanning out up to 64 MiB across the relocated EFI
> framebuffer.
> 
> Override the stolen VGA memory allocation size to 64 MiB when matching
> PCI_VENDOR_ID_APPLE with a 2560x2880x4 viewport size to prevent
> framebuffer corruption during boot handover.

Hacks like those are usually a big no-go.

Why is that framebuffer handling not working with DC out of the box?

Regards,
Christian.

> 
> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 4204c3c750a8..8b196fbfa724 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -1232,7 +1232,15 @@ void amdgpu_gmc_init_vga_resv_regions(struct amdgpu_device *adev)
>         } else {
>                 size = amdgpu_gmc_get_vbios_fb_size(adev);
> 
> -               if (adev->mman.keep_stolen_vga_memory)
> +               /*
> +                * Apple 5K iMacs report one 2560x2880 tile in VIEWPORT_SIZE
> +                * while scanning out up to 64M across the relocated EFI
> +                * framebuffer.
> +                */
> +               if (adev->pdev->subsystem_vendor == PCI_VENDOR_ID_APPLE &&
> +                   size == (2560 * 2880 * 4))
> +                       size = 64U * 1024 * 1024;
> +               else if (adev->mman.keep_stolen_vga_memory)
>                         size = max(size, (unsigned)AMDGPU_VBIOS_VGA_ALLOCATION);
>         }
> 
> --
> 2.55.0

