Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792707292;
	b=o3OQnsllSwFR8ffFMjjghmfmNvMV8IEjKBPxKTHelS/jIf029oC2DwJpU6rvd0/Kf3zh
	 p/DkNO2U8gM6YNy9xb3mYcdkKsAWaojDdlFpwuQVa4eb1dXfx7NTFGrjPGl2vA5IDQGZY
	 UoumFIITXSpUamUhUnKv8cTq4gxoy/FGtei/e4Dvb6wdhhcOxUSelPzV8ML0XTNmChkEi
	 Mf5m8KjhJPNLV/AuEZEJ9iktqSd5+rpOUSa430H7Vwn56S8xnXl1Xarktx4M+6eYqgZl+
	 VUBsvsvzPQGO/RelEyjGMKCN0/yklBf8vmblyBcPCePHpFseEaeFGlevmUMLH2ZVYhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792707292;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Cc:Subject:To:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=MAG5i244sF9qqOlvKVT8g6vOA8MxxFsvhfnrhtQg+Xw=;
	b=4qTNhVsN2Iy/vgMHQnOk/Se5czBu++RNtAB+6Q1EFVwmfrleLEF+6OVaBEg28AmEXPgk
	 VCI/jYem6HksMvcCajTP4schYcc/5KsxewuFw2x1eVe/PMMwMKBJanIcLipZ4jNhyNz5a
	 85Hvb0KkDax8lPLmz+FN9gxtUUnHFc1C55GDMgT2dWWiQ66vZlvz9DD+lMRRXqgkhpJED
	 JAKBADxoaWSMGOy5iLzyo7+CYFm/sPb7MuKQoOGnMCPVt2RItBcqBVtNT/hXnG49z6qZu
	 5V/Aln3bJfMXsuNV9EeHxifpu9ir6aIWqEWjXYuBIMkzozbtKQr43sNCcO1wFCi1V7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=citrix.com;
	spf=pass smtp.mailfrom=citrix.com;
	dkim=pass header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b="Tt2XjAs/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.69
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013069.outbound.protection.outlook.com [40.93.196.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B5F606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B5F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Tt2XjAs/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6T436cMdRFGJ/AwSHn/4LuFCPF/9CuWR++NOkBxQ9iBWlPHPF1i5hY79cRe5AviXQrT/o8OsjimQfa4lEsTBezgJTNri68XOs6vR8MuLf5rij8x/TcL5zHvDNkva91PusU1YqCfYoNJIWfGjYfnbakVoFTQhumDxwzNsSL3DgaXO5GC3Bh1/78Qr8OwFmYgvPJDloPlxKv/AnXAQTwk1LN6/Y+xHQPgnWOjrE6Oz9WfFh8Z8Fg3YaEOqkCxeui4DgeuKFKyJM1Wh+PpfGgju5svQYE/NSwI/fIm8NlhYNzN2eR23B714yBSLLwgD9xfZl7tdvhieSbQu/1BR4iuog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAG5i244sF9qqOlvKVT8g6vOA8MxxFsvhfnrhtQg+Xw=;
 b=YuHGT1BO1lcMD3G49vks0AA5OzXuVf8I1+fM7vpb8VAo+ibYh4/+fXMf7Nr1AY+OpMaQh0TM95qCEF5mFaeE3QO3cVZlowd4++gPL3iwenCdDGM9ra5SXaPZVKVurIgtBf9yIUCovIa/iAszEr/MhQeTR26ylpYFDH13G8D9MyE/YYvvGcLXGH5cBCbZWqqpIm5KT+lZWaU24YdfXXVCeTLaQbRhZ6o1tXtWsVkEqXUMnjcweHqv4zNSZ4xznrmolCc+OoGiLo+Whn6c2CfxWc+pZHdF/NgG7lyYTcFNSteTcReNwwzHeijd95EN73kbZDCYfKS/m9eo4kJCJzUSxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAG5i244sF9qqOlvKVT8g6vOA8MxxFsvhfnrhtQg+Xw=;
 b=Tt2XjAs/ORJe/xaNUz20/EyKCVJZ3V1DpS97Ucqt3gR2MLmHjdtYHac0WLZOF7jnQYqIE5b8ankIwtw98XesoCdwE+k6DgMCChXt8ftAdflVON3Ra+1750xfQ6BuTjO1nyWgiec2vNzJKbOBcr+HLVz3KiOZpyL7TebIavKe0Kg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH4PR03MB7771.namprd03.prod.outlook.com (2603:10b6:610:237::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 22:14:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 22:14:48 +0000
Message-ID: <47f352d9-1ad8-44c9-bcf2-af1dbf14b626@citrix.com>
Date: Thu, 22 Oct 2026 23:14:44 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Rick P <rick.p.edgecombe@intel.com>,
 the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [RFC][PATCH 20/24] x86/entry: Stash kernel SSP on FRED entry
To: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
 <20261021195147.3B42C03D@davehans-spike.ostc.intel.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261021195147.3B42C03D@davehans-spike.ostc.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0560.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
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
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH4PR03MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: cbed9c19-93b0-4e0a-71d0-08df3089e2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|56012099006|11063799006|261021135927099003|5023799004|4143699003|261009223027099003|261021121427099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UpOZTv4UeVzb/nl3PTAinaGfsKP/MmpPjvGIPyMrK/sX2xA4Khi5JqPVlKMftXKJ4rWJdgvZB0M19xMdm97tW82E/0453I4GjFlTCbmHNz4KAtuqa+vpRd3U/FwYfXjEkIcol8kMSway1pFdKAp+aitB+PSCI7UKme+vgudxhPLnMH7W4nAsGmVVjO9XBG+roar32HV9ZAeGhCWd66KKvLUoedfYeQPPQgoo9jGMLJIhiAsjSn1NbBk9qRcZEqtHoJ0V3Fz/QlroLSi9xzZZfUWpl1GFArFUGZ2MUHZsMygn7MZYQqqiT6HkE1KueLJo33fs0i1nb7VTtXxWIDB39vtyLGWewo/vL5ezkcAcasAx5ydUJKB8BWJwUovg2NuXcVKtQccWtskdAmzChZV62r1xjlgpTCMYbw7fNx8Q/8jWDrjWuSn3QIQYWgtYTfZYiQ0lE/lZXfjXmt8FdVjNHG6GLx3E+vbfOqpSSDtnQ0mwuQG9vOfaYlLKtGDqr6ffm95fl0heiFQRgFpKFsEQ5mOdlcPZjOQUcskKoAvuH+pw7BUaMi2jm+0yQSDMuTmm4R/TjsKa9chtok30qZIh/VPOrVJ2vEpSTZSL69f7veJV3oH6CdVxkyuTk5lvbfT6eYFnKGY52QXP94f4fZYTglpamLBOJaBLRnW1oWmn/sM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(261021135927099003)(5023799004)(4143699003)(261009223027099003)(261021121427099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGZYK25UbWNXZUttOTdyRXNwdGsrSFZjTWhVUmkwNXE4RkRacGwzSGdpdHJk?=
 =?utf-8?B?Qm5RS2N0RUFEWU9QcWlKNXV1dXlwQkJLd0UyWDBPOFJwVGR4MzkzZTlnTnZZ?=
 =?utf-8?B?OHJlSHk2VVJYcUhGVUc1K3hPa0JDbXdHNVp3SXZkcng0Y2g2S0RCaHo3S05U?=
 =?utf-8?B?MElERU9aOHFiS0UwT1FMdm11V0xjcHRmNllGVHdKOGJzUE1ZUUhtNmJjejVJ?=
 =?utf-8?B?NWRTV05OSkRJSXlaL0Y2Q2FTNTJVNlByUDJMZnFDdGRva25TNmVDWWkramNl?=
 =?utf-8?B?UXBHRDEyLzJoM1pXU1BvbzdpL1o4cDI0ZEpmNzg5YUVFeXZZT1ZEYWJDQWVh?=
 =?utf-8?B?RVB1WUovcCtnWm9ydFFCVllWd0s2TlVLTCs2RkpWdkpGVXN3TEVxR1lWdmc5?=
 =?utf-8?B?UjRrL0pqL3VFS2RabWx0dkFYYm00VGZLSW56MFJTdW5RMUtFUmVWQVhqSFRK?=
 =?utf-8?B?VkJIcEhIellsc2E3NGF2MmYxYkU4TlNHaFpkQTRHNlBnR1NKRGJlb2JCS2Zh?=
 =?utf-8?B?blQvV1FhMWVHSVNUMFV0K1orTEN6TGJudHdjSlpwMkY4c0s3MWVpdCs1ZW9W?=
 =?utf-8?B?VlE0TGt3V0VteXNjamtVcUdlYnNUa3lkeE5DVlJjQkdLWDV0dmdOTVN6a0ZR?=
 =?utf-8?B?dGt4ekpsYzFIM1lWREE5STlCQTVyZExGNHhlT0tkZUlEajRJYzRmU3ZNblBE?=
 =?utf-8?B?QjNXM3BRUkdwdjF5cnlGTHFJTkZjYjA0T3lIaWpGNzc0WndkZ1JPdENZNm9Z?=
 =?utf-8?B?NmJOT0NUNlQyb2hUbDcxMHFqUlpQQ3RKUm1CQ0lpVThvekxXdzlLV0xIRUdG?=
 =?utf-8?B?WTlScjdoY05Rb24xY25mcFppODJsU1BJQ3k1cER5UGkzeFQ5bTkvenVMNis5?=
 =?utf-8?B?R1hoZnhjdWtRWGhuTTdPQ24xakRVNXJjODdualk1OXp1SmNBckhmUEpmQkdI?=
 =?utf-8?B?YW1pbUt3VUtmQ2xidXUyVkRBaHFCL0lOSEwrQTd2TmR0dnJUTWxWeXg1YVlV?=
 =?utf-8?B?ZThFNFI2Tzd2VG0zMkUyaUJNOUpaMC9zRlFQUGh2NWVHYk1jSWsvRkhwWlhU?=
 =?utf-8?B?V3p4SHV6ZnBaMlUvZmhSNWdmMGdLZGNRTlpjeTlPV0xlKzJIdFR3NTltVlVK?=
 =?utf-8?B?dklXZVBtMFNuYXA1R21JT2NtaDJXUXJvZWw4ak1KNzZUTGlCenBhQ3FwU3FW?=
 =?utf-8?B?RGNSYUdrZVdnZ1o5R2RiNC9mL3hFczQvT0drOTZOQ1NWWE9hL2I0Y2lVeWdV?=
 =?utf-8?B?M1VGRElpTE4xRjNQVmFmb2h3Wk1tOG9aNzJwcU1VQXBVa0ZJYkFYcU91aGtX?=
 =?utf-8?B?NC9nTUxyUXpjV3Iza3pad3lMZEtPcGtMU0tERFFTcUNZVWZsUHlHQURlemh6?=
 =?utf-8?B?K0lURjc3bS9KT1l0Ykc5M0VDZ0NRQTZSUUNNbVRVS3F5bWpXZ2VlU0V4R3lC?=
 =?utf-8?B?ZkNlNnJlejllMjhIVTZsbHY2NG9WOUYrS2d2Y3FELzZBY0drdFhtQ1lqbG5E?=
 =?utf-8?B?NmhjaHFrRjhzUWNmdFQ0TmFSK0F2SUhISEpaNGFXZ3owQXFtZjhoQk1UblNE?=
 =?utf-8?B?dWdTaEdBd0E2N25uN0JjQ040Y2dmUkg0Yjc4bGdNd0dOcFY4cURKNytLVlJv?=
 =?utf-8?B?dXgxWEJhblVDQzBvYVVabXd3OW5FWS9jOGFHODFGUVFGNDdQdmtseU40dUli?=
 =?utf-8?B?bjRud0h3ZWpNcUE4RWVDa0d5djdaTjNTTXJSa1FncEl5VVFNb2lBanF2SFEw?=
 =?utf-8?B?ZCtXKzU2OXQrVXo4N216a2h6aVhoQWtydG1EaFNTMzhPb3gya3FsamcwcnJ2?=
 =?utf-8?B?d2tMTy94TDNaV0Rvd1ZXZzd2QVBLRUJhbVp6cUxRaEV5Vk5QbTFiZ3RuR2VZ?=
 =?utf-8?B?WnRGUWdhOCtHdVpkd3k0eUk5SDYzb25Od0xWVTdtVjlaZUNBenRmbHl1US9u?=
 =?utf-8?B?UlR0NVNhaW5hNXdDSFN3YitPNTFwb0tWOXRqTnI4MW5LQ2xUV1puWkd3WStw?=
 =?utf-8?B?NWViS2VWcmo4UHlmU0lvWG1qZjc0N2dnN0lFYjhFMTcxK1FCUEg3bmVVck5F?=
 =?utf-8?B?Wm1XUEMxTGJrOVRlOUt2RDhiQitZWXJQd1hVZHB5T21oRnpkRWxwNUJKdlRY?=
 =?utf-8?B?YkhmV2g2M2VQN2hGY2h5U0VjdytRZkdxbmdxSUwxTHZYOVRqT3cra2xqUGgr?=
 =?utf-8?B?aE9aQi9OaFNleDZ5aHJQcmFZVGhRRGl5RUlGenhWSlJYUE1hRUVobVlkMnFJ?=
 =?utf-8?B?Z2FQZkZieWRMVGZtNlVNVC9vMDdRRzlLMTNyZFVCVDhRdVBmNkUxMEczaHdN?=
 =?utf-8?B?WjdJRGs5MnZQQTJKYkZmdENvd24vRUN4d2lTU3FrcUNnT2V4Zmk5QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbed9c19-93b0-4e0a-71d0-08df3089e2e5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 22:14:48.6463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0Q5jwxIwlFt3jnMUpdXPEKp3iYd8qewk7yTu/emuxu1bimdR/9+jcVuBiRXTsg+nbBElDBgtu14R4Kw19gbquOv2Mhg7hBua9eVyRCGFGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7771

On 21/10/2026 8:51 pm, Dave Hansen wrote:
> Kernel shadow stacks are intended to preserve control flow integrity
> across all kinds of RIP transitions, not just strict CALLs. One of
> those transitions is when there is a kernel interrupt or exception
> and the kernel stops what it was doing and jumps over to
> asm_fred_entrypoint_kernel.
>
> On those jumps, FRED hardware writes a special frame to the shadow
> stack. That frame includes the return address of the interrupted
> kernel code. When returning from the event via ERETS, the hardware
> compares this shadow stack frame with the return address on the
> regular stack to ensure that they match.
>
> The kernel munges event return addresses for lots of reasons. But,
> with shadow stacks, it also needs to munge the corresponding
> shadow stack frame contents.
>
> Make it easy for RIP-munging code to locate the shadow stack frame.
> Stash off the shadow stack pointer so it sits adjacent to pt_regs.
> Without this, anything wishing to locate the special shadow stack
> frame would need to walk up the stack. I'm not opposed to doing
> it that way, this just seemed simpler for now.
>
> Note, since RDSSPQ is a NOP with shadow stacks off, this assembly
> is safe either way, although it does a unnecessary push/pop.

It's not unnecessary.  The data layout must match what Linux is compiled
with, which is an extra register by pt_regs, even if running on hardware
without shstk.

>
> ---
>
>  b/arch/x86/entry/entry_64_fred.S |   22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff -puN arch/x86/entry/entry_64_fred.S~fred-entry-ssp-stash arch/x86/entry/entry_64_fred.S
> --- a/arch/x86/entry/entry_64_fred.S~fred-entry-ssp-stash	2026-10-21 12:36:42.552889917 -0700
> +++ b/arch/x86/entry/entry_64_fred.S	2026-10-21 12:36:42.555889923 -0700
> @@ -16,6 +16,26 @@
>  	.code64
>  	.section .noinstr.text, "ax"
>  
> +/*
> + * Kernel-mode events: save the SSP of the shadow stack frame FRED
> + * pushed (old SSP, LIP, CS) just below pt_regs. See struct
> + * fred_kernel_frame.
> + */
> +.macro PUSH_KERNEL_EVENT_SSP
> +#ifdef CONFIG_X86_USER_SHADOW_STACK
> +	xorl	%eax, %eax
> +	rdsspq	%rax		/* nop if shadow stacks are off  */
> +	pushq	%rax
> +	UNWIND_HINT_REGS offset=8
> +#endif
> +.endm
> +
> +.macro POP_KERNEL_EVENT_SSP
> +#ifdef CONFIG_X86_USER_SHADOW_STACK
> +	addq	$8, %rsp
> +#endif
> +.endm
> +
>  .macro FRED_ENTER
>  	UNWIND_HINT_END_OF_STACK
>  	ANNOTATE_NOENDBR
> @@ -54,7 +74,9 @@ SYM_CODE_END(asm_fred_entrypoint_user)
>  	.org asm_fred_entrypoint_user + 256, 0xcc
>  SYM_CODE_START_NOALIGN(asm_fred_entrypoint_kernel)
>  	FRED_ENTER
> +	PUSH_KERNEL_EVENT_SSP
>  	call	fred_entry_from_kernel
> +	POP_KERNEL_EVENT_SSP
>  	FRED_EXIT
>  	ERETS
>  SYM_CODE_END(asm_fred_entrypoint_kernel)
> _

This only works because FRED_ENTER loads %rsp into %rdi before
PUSH_KERNEL_EVENT_SSP pushes SSP, and having that all hidden is rather rude.

Also, you mean X86_KERN_SHADOW_STACK here, rather than USER.

Personally, I'd suggest:

diff --git a/arch/x86/entry/entry_64_fred.S b/arch/x86/entry/entry_64_fred.S
index b98f8945dfff..9a17dd7e2a96 100644
--- a/arch/x86/entry/entry_64_fred.S
+++ b/arch/x86/entry/entry_64_fred.S
@@ -16,15 +16,27 @@
        .code64
        .section .noinstr.text, "ax"
 
-.macro FRED_ENTER
+.macro FRED_ENTER ssp=0
        UNWIND_HINT_END_OF_STACK
        ANNOTATE_NOENDBR
        PUSH_AND_CLEAR_REGS
        ENCODE_FRAME_POINTER
        movq    %rsp, %rdi      /* %rdi -> pt_regs */
+
+#ifdef CONFIG_X86_KERN_SHADOW_STACK
+       .if \ssp
+       rdsspq  %rax /* NOP if SHSTK is off.  Pre-zeroed. */
+       push    %rax
+       .endif
+#endif
 .endm
 
-.macro FRED_EXIT
+.macro FRED_EXIT ssp=0
+#ifdef CONFIG_X86_KERN_SHADOW_STACK
+       .if \ssp
+       pop     %rax /* Any dead register */
+       .endif
+#endif
        UNWIND_HINT_REGS
        POP_REGS
 .endm
@@ -53,9 +65,9 @@ SYM_CODE_END(asm_fred_entrypoint_user)
  */
        .org asm_fred_entrypoint_user + 256, 0xcc
 SYM_CODE_START_NOALIGN(asm_fred_entrypoint_kernel)
-       FRED_ENTER
+       FRED_ENTER ssp=1
        call    fred_entry_from_kernel
-       FRED_EXIT
+       FRED_EXIT ssp=1
        ERETS
 SYM_CODE_END(asm_fred_entrypoint_kernel)
 

This at least lets you see the relationship between %rdi and what's on
the stack.

Of note,

* You don't need to re-zero the GPR.  They're all 0.
*  You want to use POP rather than ADD %rsp to avoid taking a stack
engine stall in FRED_EXIT.

~Andrew
