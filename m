Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792435357;
	b=H54KbSjDxzf4nJ8qZOODU2mjQ09vNrtWa8Yyu/VV/3O38ebjU4y6s/cvNx7TKGZkA5ka
	 fYbkW/9VS11Q5qUjVsnRU1mpj/jWZLeQeHqdGg9mlxn0gdpfTXg9jqCPtwhJoIs7Ucjtq
	 biW0xs6jjUi4qjYuvlSuViQP4Y15753EkNFQh4YAVygJTpiyYg1aeapVzCdn02alP3x71
	 LuVaeSHPCQUbWwwdI9+Bk7CuaASqwhqgzWDd1+dO0QMwUZCF95DVdgB7DxxMVZIbGw8VM
	 uFxV+b9kxjBbdwFlmlXPIRsWVFae0NNhvxMwoDn6xTAip4USp0fQ1EQHzJj2dWjil3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435357;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=O0/VYkXEIyWNDLU66nfUqanWJBrmo78SmdwQEdxnnCk=;
	b=jAFsy5+2PRa0sOPMVs7/Chrt/sanpZ0AyT02DYQ9wNk71yNXZHPcM9bxxxUXwDZLDHnL
	 jhLzS4t1M9QwSwOTd+jnBbTWUdAQb0glyUNtf1fPFDKFLm3dOYj7xPNcU1eTmViEjMzNe
	 WnGqa2EjPApusrv0TUlrKRzbPZ/r6/UOpMTWeooTvx4gAQyOVMvTrg9i6ogIKqzZZLLlr
	 8bbU2r0mwBY0skzBxozomDPrF7mQT7ujNQSYKiusYHQAdmgCFGTzPi6Ok9inq4zUKV2kr
	 HtKpnTxv4umtYa5E+y5AJr6wBonUZ9wsMQ4zO7nCF4VN18HntZQrcmnml8kcwy+0nuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kZlm5W7w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.15
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011015.outbound.protection.outlook.com [52.101.57.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B9E606A31F;
	Mon, 19 Oct 2026 18:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B9E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kZlm5W7w
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZ/NU3gM/YTbgJ6qq8XyjTxKPwmVRIHxkWOX50XZjhmZLVphBzQTPZ80cFDVP2nGV3Znfpp6mplPNj4nxLcqD7S3GF9qbGotyxmwnvczX3MUXhx0p5kuL8By0XtE2//e8WsOYbdZgaaQVyGPqe5sRKI9tVmFBBy9HQU09Gt1jdPWdHNWdOZYarwDuNSVvh4NEeF75NyvAyHZ7UCCZfGy1bZJrALNNCutuGnoi6a0ZTthxOIx/HrDjdwhj45P0rkTXevUCjtpLPz06Sf6UhSGCVkqxH514M/4CnGepXZvSX9yLV9ATx0rLzUIppeGdqmNoPm62NpMIVXbyXqaz63aog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0/VYkXEIyWNDLU66nfUqanWJBrmo78SmdwQEdxnnCk=;
 b=J8kpWeNYi73GBPos4rFEBM2Th+ZJy7cXQ+UiqbvU8V524ZXDECGL2/4V+9AYl5fJlgkqOijsOHlNhuIEakmtOaKdByS0GWWwnmR9rcgxnKDWsp9i5tSeV2ELAJP+3whYs6HzXeCyIY7jsrPX1ATYlqDtdLLMKOJ+jv+tMxZb4pT0rZfSamAP5Q9TzbdkpMuzZiE3EQBbVQQNabBYdaAoDkJWDONsQ/llvMThymzbq3W8jrwwE1Zo2Bdw8+7ltOEZr0P5ALzFwevzCKu0+fTZno3PCCWwxcxXjyC4mlJiMH3uTA7Fa70e/glFu5KqtBbUDaJe4yBj756lZjE4p7BQLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0/VYkXEIyWNDLU66nfUqanWJBrmo78SmdwQEdxnnCk=;
 b=kZlm5W7wOlPJT1kyFu4q5mQzDk3DGLx+yBTG1r5NiZYqnk0FZ86+6pG42aJL71R9h5PaY4g8uNQhVdhCV7V9H8ml9Ux+GCRLTMkPVEMR2pzmkIC8ejJnf5GsXCcdjz/A8C2CapwyJbSMYmwHYJl4Prz9Bq7XRz9IrpZ8229QWdU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 PH7PR12MB7794.namprd12.prod.outlook.com (2603:10b6:510:276::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:42:32 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:42:32 +0000
Date: Mon, 19 Oct 2026 14:42:18 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Adrian Schlegel <me@adrianschlegel.com>
Cc: tony.luck@intel.com, bp@alien8.de, x86@kernel.org,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	sohil.mehta@intel.com
Subject: Re: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as
 memory errors
Message-ID: <20261019184218.GB144824@yaz-khff2.amd.com>
References: <20261003222012.19685-1-me@adrianschlegel.com>
 <20261012193305.38931-1-me@adrianschlegel.com>
 <20261019153207.GA144824@yaz-khff2.amd.com>
 <DM914GO4A8WW.Q7YN7ISOQJJI@adrianschlegel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM914GO4A8WW.Q7YN7ISOQJJI@adrianschlegel.com>
X-ClientProxiedBy: BL1PR13CA0372.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::17) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|PH7PR12MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: dc56b835-82c7-413a-f157-08df2e10bbfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RLpSC9UjsDpvUMWfvIhVlKjYE13m6wu7xWp7UA3RUivVZo+J0/HGFABajeg/h+FlBg54m2K9MamuB8MgPC/ZgK38TnVoTmC4akZowHXKfn28qkGBpPJgM0Rsdh2aLiJhO7IrI/tmUI8db87rL9MAsXURL2jLAbnL0Vpr0GEjKJk0ZEM3vg1PY8CwJZWmFXmRuE1T03OCYSfZW8L049z8I73OykJ978/D8YiTHnoZ3Buv/z+klVXKJxpC6aezpUJzjwyd5ZfEv4cnVw5wPhBLpjgD6bf7JYOjO9msCK0Iz6UCHfxSFegBvYkV0CBjTCX+Avk3p/1RJr2jvjCo/k/9pJS6Qsdfkgm1yInKWRf6+wigA0aNMq8d4fwyx9mtgZlvR6OT0uuwkErmZTgqrvumhV2osh9xj1j6xIFcFoLjOv86VU/Pz3fEMR94zLYavqV6lsAxJw/3mBPxGAdcyv/y/1RiihN68LNkWgT0CM+/xJDSBmnZ4J2FJ5DZUtv/0w8RJzFmnKqLQF/gSaupQfQYgFhP0h7y5ChH8GlgJSB89VSobVluDeQRbenY1L6t+zq/A5Za7VmZ8uDXpVlH1iupxeTMm7bbYpD7sPaMPuo7etp2OhE/72xq6l0UImSFJN1t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CBUT3E/fFXcG6ddQkC0ENi6kXAD/MWUbrGnk981nlmblyvo/v5L7xm1S3R4t?=
 =?us-ascii?Q?VdIVnXw3VuKnWDSvC42Y5edxFlnrBxdQ5jJf6TfB7RedNM92eK3sNc8I/yDe?=
 =?us-ascii?Q?uY0DmNhEWKovdAqIySpzoncLfjb/G1ZSHkSwkDEKHm2wTDTyNSf3xyDje6rb?=
 =?us-ascii?Q?MTyyreU9df+7KHZOWkNpc28T8tPFLNe6DuVdHxMAckom8CUe/wj0/pc7KI9j?=
 =?us-ascii?Q?b0Qyr6rGMwVnXowjACMLK8KniKhn76v8ynnk32p03hZFhzlj6+7N+qktBKQj?=
 =?us-ascii?Q?doJdvaGmPdqkELlfOdcngCF7L57Z62wA7188cEb5JActqNz+oIaJ+zEbVfPI?=
 =?us-ascii?Q?T1raY6lbdGn7/EtwZSAlS6kuRtVmnJ6cgchFLg5L7ZYuIhV2eWVUdEkNfZMq?=
 =?us-ascii?Q?dqyYEiJw8o7hvjBztmTkoMcMLG4GV4Fc22Aph1cUpwGZfH4LZLJRi20xYE1J?=
 =?us-ascii?Q?Oh0tuaI+6KH0ghDKpkrGKe+n8mi4VcbziT3mK5uNsBmu47izbc3RsABGpJ/i?=
 =?us-ascii?Q?TuN32Zv5KdRIqZ7G/afqGtLGvzGbW54MqmifbdJsgNG4pEsS9PJYr+yZWg7G?=
 =?us-ascii?Q?B6p0IYQPeuyjPUK9S3ufobHy5gsnnuvIFpEIU7kdvzIxbMl50o38PdvuRQM5?=
 =?us-ascii?Q?J6kCV5VxZ8qHoIw2+usbcOWSNFVpnrxbx0664VdDxKUyvqxpUq9bYUZecq1J?=
 =?us-ascii?Q?vnGpOpcHoeLlKLUBV8647WGE9y/i3Xy7uioNFR0LJ/wK84CdlVnz6UU8jWj8?=
 =?us-ascii?Q?CYkz5QpcIuUbDXs6i0ExcHdHDJnBObbdd/i/vjU4riX1b3IZ0+OjWe9IUOyp?=
 =?us-ascii?Q?Z/Kv3uH/yzHcISplt3RmfUc7OWbcA5B4f3HmC5r3cnK+2XEJlpE/f9kCcNoh?=
 =?us-ascii?Q?8kfom6iLKEIliG8+icEq05XBvcabnB0EC9IXmZ/iv2N6v6PQBCfMVuo6IxWS?=
 =?us-ascii?Q?O0ObkBcNiLkWqRsv2AolOBi9DHTPaCOSIMK6+A2Xma1KwZh66kQmjkmlIETu?=
 =?us-ascii?Q?4lhAMnWOd1slKBrsX2hPOH/QH8M2Qr7HcFucun3KT8BufownV3du/Tc/BgMJ?=
 =?us-ascii?Q?1oFI2dsMs1Mb5TwJYIuNGeb+56fWn5PDf82OJmYstfXhkxsN7NyDRqKi6DcT?=
 =?us-ascii?Q?LKHPDip4y7DdS5tT5x1JPZyAjxY8K8cIm/r5AZm7yKVJgxlT8YCI8Fv5jHPw?=
 =?us-ascii?Q?l9Q+OsUKSeqVrZY8VDRd4olYhTgQBfnc/TLzTqUDHvFru+Z+2AaERQyeXc//?=
 =?us-ascii?Q?jLiQYYCkwdUFqvXN1lIpqcpZefuipKqt1hAuRghE8fTI4XqXyLSWL/Nec4Zb?=
 =?us-ascii?Q?4Zi80HJKIpW6ROe2XZinoXZJgnnH9u6KoKC+6Rx7i3Jbg/njNvOH5Urt4iWA?=
 =?us-ascii?Q?64CI6DA3Q0nUUk2xnU7uqetxAiXnPndb+FJPhOzAvsUdRVWdEXohC/Erbkob?=
 =?us-ascii?Q?hLBdEUmv6HJnG6joW9rWNqQXlDfisckvOsNK2j41vZjp6OWla11Qe+V8XXjn?=
 =?us-ascii?Q?/lRnc69/Ni60b+fJD4ueUBR+boBn9bRd7Xs/2IzqATAQKDjyuejwIBrSGQ9G?=
 =?us-ascii?Q?JOktP/igqukGtGjW38os+fzMLFbZgseaPa99E3G04Ulc51urtZmcRC5vHWCH?=
 =?us-ascii?Q?EDrKhusNjfd0aJbfejvPYGO/68gebGlDrdm8NVb00BCU6MDJz7CpwsdyujVh?=
 =?us-ascii?Q?9pDkMngFE47hxBjH9xBSGHpxBYjjO5GNf0Zici7ellm6CvSB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc56b835-82c7-413a-f157-08df2e10bbfa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:42:31.9667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pSIuNmh1bQHTmRGw4y0/3CgvnwV0pOzg9RDwW5I/m94rVq0MeTSAUhGyvt0XGWAIyy2cAd+gSs1q/YZUHYYCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7794

On Mon, Oct 19, 2026 at 08:34:06PM +0200, Adrian Schlegel wrote:
> On Mon Oct 19, 2026 at 5:32 PM CEST, Yazen Ghannam wrote:
> > The SDM also mentions "Extended Memory Errors". I guess these were left
> > out before, but should they be included?
> 
> I don't think so, since from what I can tell from the Intel SDM (Memory
> Controller and Extended Memory Errors), extended memory errors use the
> same encoding as normal memory errors, but report errors in memory that
> is used as a cache, similar to what cache hierarchy errors do.
> 
> I also found this thread, where Tony made the same point:
> https://lore.kernel.org/all/SJ1PR11MB60831E048B544C83E845D907FC8DA@SJ1PR11MB6083.namprd11.prod.outlook.com/
> 

Ah okay, makes sense.

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen

