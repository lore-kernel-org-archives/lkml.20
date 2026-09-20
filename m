Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012006.outbound.protection.outlook.com [40.107.200.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90093E51D4
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789926939; cv=fail; b=mj30TUlzbB1pJK8afou3+3woXpqH7OVu0tvWmXSTxpEaZYUZaOJKxB+M2DtrO/BeLkhkLezZAfE+dITBvuK5TBbBUZeAvKRDEFSOPAPAgvDNHH5cDg1tJ/O8I1VE6XovmYIe0rfEgrlW+0BCH0XAPMeERz1oSW3WzuPeSk1NTV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789926939; c=relaxed/simple;
	bh=xo2GANJZA8PGBA4b3YvE6f9wE9bO0qVhQJN3J9QP/Q8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qi5Zb4hBfA/FneKxConimlOPUb3ejPjXypyTt7INqlAp6PNNL/qYYM+5wAn74MlPHCEN940kp8BY5D6YRwrQYoiawptlAS0RsqaG5FFQ8iB1ms/UT9/E4k838nT2j9JmZ5RCWYvxJ66Fq9lec+7zH6mIjt0SMcwZa7+sqjoKjJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uYyaXVlB; arc=fail smtp.client-ip=40.107.200.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uYyaXVlB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdiiK2P53Zppu/whO17amp4thzTJpNqgnGh+9f2x869Rny9/XR4rVfpGlxrXB3ZlrnVQLOLz6uNfzEQAkz7SfoA1BPJ3txzFxBLaCjhQQszuvzZpbm0cjKHcvNch5lPzVwZ6nlrNbz3aUd5S9rRZRKB0R/RY5xt2mZpFORMA8CVXLseRe8tPE0z+Vtthb9zeyB4GRO54KneY8MwqXBCh/3MBAaViPIkzl/OJyyNiG8Jk9yBG9tELzKdAU5UufVTH362l7Gv2ecLGboRCWnx0qF/1EUouFjFEXPhMyjnd/p8a7lD2xxG14nslRLJ8124xSrKOcTH2ApxphxgZ5dBy0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U56623n8Ks34jChFmDTfEXLfMk+NAqcS76VbSHJv6QY=;
 b=tyzP3LYtdJkctHnr6szBNh0/jduliLANKkZ2Th16Vd4z0/lFaNcvg4lJKBcf7Zxi2MsnsoV3Kp2nGI/QFOpKz2b1tuU5+gPnm4xhmH55TcJ+odgUpbykDw9IYzRIG28WIhr7kftiLKHqS88HyiJYZg8o/cbDREj03vN6awy6OIPvaXQIJ8dk5HF/zwnBQdDWJre0ReNC+uns32neqoE3hEq7t2Eg9f9yXWNWFwcIYZUWMFJTo0YS0ibo6/S727kGc9EvyOlYEPIGwexoKPWbx+i0d+s7tojsNpnWMmvWDudT2B2pevyeiV0F2Y9Ti2X1rGf//YnNmx9mmLN79qFxqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U56623n8Ks34jChFmDTfEXLfMk+NAqcS76VbSHJv6QY=;
 b=uYyaXVlBtlvdeq87itE0Z0tm8JvzXRcblIR9e/5BC+Sw3keCMm/Flzl87OX/6TqaIA6/ilHoIkm3tAhk4jakuAUs8NUMK7d3vXZOS1aYMH8sICRUHRr1l3SZgRLIEzdbrsKdlRmRsPsXPThPiGgFpiNI/K0NLXbxazmx4sEnwBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PR12MB9575.namprd12.prod.outlook.com (2603:10b6:610:2ad::12)
 by PH7PR12MB6696.namprd12.prod.outlook.com (2603:10b6:510:1b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sun, 20 Sep
 2026 17:55:32 +0000
Received: from CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da]) by CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da%5]) with mapi id 15.21.0428.015; Sun, 20 Sep 2026
 17:55:32 +0000
Message-ID: <74afa5df-bb94-4e80-a634-367cc6cda716@amd.com>
Date: Sun, 20 Sep 2026 10:55:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] x86/sev: Register the guest with the SVSM APIC
 protocol
To: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>
References: <cover.1789345277.git.huibo.wang@amd.com>
 <d0b15a9b5f6e2199ff48bb77e9396044fa96dfb2.1789345277.git.huibo.wang@amd.com>
 <8e4b05a5-61e7-4015-ab72-1e55156e1772@app.fastmail.com>
 <3f4e75ed-9a4b-448c-adb4-5e2e8bae8b11@amd.com>
 <e624a245-e699-40d5-9948-aa77da5c44e1@app.fastmail.com>
 <b0927c73-9171-40e2-9d1a-3dcb2da1c839@amd.com>
 <90950a0f-5954-447c-bea1-0ae225e0ba73@app.fastmail.com>
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <90950a0f-5954-447c-bea1-0ae225e0ba73@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::21) To CH1PR12MB9575.namprd12.prod.outlook.com
 (2603:10b6:610:2ad::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9575:EE_|PH7PR12MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: e907d239-1c6c-42d5-b637-08df17405d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	0mcxU5MFkp6kdyE4Bmzq7vx+VkaKOCoRt86uCmSRD5aGdgSAHAa9Y4OJ1BbYpaz8jPXdJZjC6kfG3wLvsKgvZbwo8xRiXDXKBsBjb1GwZYof5LF1P9LBMot/4iDdF9OUljI10Neb31dAkaW7RoSrCouU/0vGhfRFSQnzMZIIETr2YRXAHrRkBugxav+yDrkSaVPu5rSbNHySCC345iyox9+6uPzgdgwBE61qVbrax1u/7hupBVSPyPiuw7dDtgSw/y6yxvF82WWQFyIyBlgsPlIbh4f8UlhwGfAwgzhz4HXNKDsk8uxnqIbesngoBRQl7JNE++Ypmm2QNzKMf12x3n4EEVLJ9exZ2StVKGJEkilkZE/+uL6PcuRZpvvAOxImDS4ClIvSHR/yk5IxyPvS1ph8PhFEkPVVfToIe3hyWhnnH4IhvxUm+cXKwEHHeWT/cSE6kyvglpOo95Zt5uI2MzW2HhPLu09668ENeipZcIHdCouHyYa+qxuGgVJgSbx1f9Pf3WE6ZzIzHo/qab/6c3D1bz67ZeOt2LFEVfx/yRtE/xcVKBmS+GW/LNJyEU/wUWunpnf45S70XpwtKh8z5xanoenSSC/1j8q8EnSPRAadmB0SNMagb1A35jG+hS927LfrQYLr1MSPn9y1dr+kTjdTTZd/xnKgqgGw25Zjs34=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9575.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEJVbFh4bnNxb3BVYkpqNmg2SGhXVmJYN0tYRzB5aHNOVHhVNjV4K2JraUxX?=
 =?utf-8?B?K3R2S0IyZk5yQWtQVi92d0FZY2NMcWN6aGZUSG9oaHdwdWxZT0lqS01TUUNR?=
 =?utf-8?B?dlZZZkhJL0NYeTZtcTFYdkhKdTM0MnFhU3FLUmovbTVHdjdNRWJzc2pMTmZ2?=
 =?utf-8?B?UTdPajVRcnlpMDhxcWRiTDg4YjBOelNhRmVpOXN5UmhhV01wK21UL1N0aWRB?=
 =?utf-8?B?Zzhzc21oemZTREFwcHZQWTZWS2U0emQxSnI2UllxUDFCVkkyRUNYSGlnZmxr?=
 =?utf-8?B?U09tTjc5UTVaZjdhbDM0dzEwMmh6S2xBNHh3MzB1ejdCZFAwUDBwM2M3RUdq?=
 =?utf-8?B?Sk9ZSTg2eHZrSXRLTUMrOGtWVXR1Q21zRW50S3RJS3l1RGpwbmcrOHdtY0Jz?=
 =?utf-8?B?TzZJTGl2WFBoZWxId1BIYXBFWCtCUW9OdWhJUGFKUEtiaDNqdS9SME4rMGVo?=
 =?utf-8?B?eUtNelIxVmk2cWhjaHBzdHIvMDZmazkwcFlZOG50T3NuTkdBbG9ENVIzMUxY?=
 =?utf-8?B?WXU3Zi9LT0NTWmVDQXcrQVRFZXlwQzlraCtWNjIzU2hJKzRVRkxJUUR3R1U0?=
 =?utf-8?B?YnhUSXFGRm5DTHc1RGxRSkFqa0d4eWY0R1djK01NZFkybWxFWVRVMTg4aEt1?=
 =?utf-8?B?M25icmpaL08xME9sMWkrcmRFMmNzMDJlcjNmUEptVHZlOXp2VGtCb1ZZbHJt?=
 =?utf-8?B?dmhhZ09jajAwZnVFNlRscVJPSXRVajV0NEtERDN1U1pLdHk0aTVvNnJsVDBt?=
 =?utf-8?B?SjlDZVJObXg1TCtINWxwckJBSHppY2lZdFdNRTJXYy9vY0dHMHRYb1AyN2s2?=
 =?utf-8?B?YlQ2RDNHbmUyZmQ3TkpVeXM4cm53ekpVMWNiQTc4M1lYYi90L1l6K0tYUWgr?=
 =?utf-8?B?b09vRDBmbC9PYWFCZ0s3cDdMbDNZeVQ0ZmNYYWJUZXdISlZveVJaMlcvcnQr?=
 =?utf-8?B?dmJkeGlCNUd5eFlRL255d2trd1B1dllvVUtsQlZhUlFoT0NLakRxaTM5NmVn?=
 =?utf-8?B?NHFJZ2lLdkJycW13aFJSQlRrTWt3R2tyYUNRdVd6TG9PbFRmODBpbGlMb0F4?=
 =?utf-8?B?LzZ1NlhsL0lXYzFGdzlRR2JWU2Q0ai9DTGpaTWdlb0hmbzRmOGIxdDhySU1p?=
 =?utf-8?B?VytZOFEwZldRVVZsWm9UTjFmTVc4UHpwOEtKYVd5QmVNZHBGSUJvVTh1N3NF?=
 =?utf-8?B?MWt6cGlpL3ZDRG1FdGsramY5RSsrNW9iSXowMW14d0ZoM2d2MXdxU2dDeHNz?=
 =?utf-8?B?U3k2Z2RLNGI0bi83M05VZUxqRUFlL2lDejk3TUxSZWNhSll4VUo1TmM2RzU1?=
 =?utf-8?B?eWx5TWdqejRxeDB5MDIwU2IxU2dXWlFENjJlU0cwOVFFRTVGM2hxWnlGTlh3?=
 =?utf-8?B?d1pzYU1rbTVyMUsvQ0xNNHBRWk4rZFhVYzg1d09XbVUyTnAySFZiMWpJNWd5?=
 =?utf-8?B?SUVnM1RoMTEyYVFZUEozNjJiTjlxQXRmNmpOcUdyWHBCSjN0R3c3bjNQOXl6?=
 =?utf-8?B?bFpBalZGY0pBYUkvWFV4Tlp6QmR1U2VwLytEYUJreHF3akFIU2dvT0VzVTFO?=
 =?utf-8?B?Ly9HTnpVR3AyWmVCUGFVczE3djhxVVduMG43eUl3dzYzMEN1MjJRV0VFWWRk?=
 =?utf-8?B?bitOZVVKV2Y2VmhDMnFIcDZORGc0aGpXaFpTV3VYMHhKa1N5QzU3dThIZEd3?=
 =?utf-8?B?dmZrbzJJMGNIZThnaXQxeHRpU1hZQUtuM1NSNUcxOElzVzdWVDM5ei9uNVVN?=
 =?utf-8?B?TmFXZUMrL1FjbnpGM3hXQTA1MThITkNKVVRvYjZ6eHpENWpqY1VDK20wZTJE?=
 =?utf-8?B?dy9xR1lxcm9MNWdYZ2pZVWZZdzYyQ216cWVQTWZVWG1XRDNHM3d5RktyL1Fo?=
 =?utf-8?B?Z0s3ZmlYVXQ5M1hsS01Eb3d1c1dXWUpCbGg1K0Q1NU15SHA5MEpIMEV4T2Jm?=
 =?utf-8?B?cWIzaCsrejE0cEF5Z2l5YXdqNGNNVlN2TDVGNHA5OGxJbXo5aFJsRUtKd0xv?=
 =?utf-8?B?NjFzaVRMZlJrMWpSYk1Mb0hBNTdWaGlEcmpXUzdGVVhOQnFJZFBKNGp6QTFq?=
 =?utf-8?B?Znp4T3pxS2haTUhmM0ZPMGo5SXkrdTVJMVh1MitvSVFTQXBiWlM4cHZvcWl1?=
 =?utf-8?B?RTh6ZnY4T2o3bkNLOGVYOGtNcCtuOHhXVTNvZExXTHBMY0ZSSWZJRlRkME5M?=
 =?utf-8?B?L3lkTktNS0NoaU51VzlnMUJOc053UkNYZFpLckFQRG40TjZBMjkzbGczSDVz?=
 =?utf-8?B?UndDbm5ETUdVS1pLS3prNXZFcjIrR2dvVk54MU9uc1RQYzc1UVp0UlNoM1R0?=
 =?utf-8?B?Q3FQSXIydERWalExb1E3bVcrRUh1a2FodjlpOVBIQTVWOVIrTHIyZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e907d239-1c6c-42d5-b637-08df17405d0b
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 17:55:31.8294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjl1+5rt0ZOrRLez8mbC4lq5K6FFlei2kRQ8t0N87WvOZOyooeXCH17NXdgpIGEPmojeCsfdCxQv/WcRlMVfrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6696

Hi Ard,

On 9/18/26 1:14 AM, Ard Biesheuvel wrote:
> early_is_sevsnp_guest() needs to be exported anyway, as I am doing in [0]

I see, I can export it when it is needed.

Right now, I think I can put the code in compressed/sev.c since those 
functions are self-contained as you noted.

If it is really necessary and we want to be pedantic, we can carve them 
out into a separate compilation unit but that's for later.

I will send v3 and cc you.

Thanks,
Melody
