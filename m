Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793250868;
	b=mIJy0hc8amaErZ/41vNVmVFzUiV9ZuQyctpGZhHEt1BC9dMFCs6SV8GuDDn45sDflGXV
	 rHzwaQQ48NN8n/W9sGBhBPMemifDFbDaChnZOP3AOLS1klzR7g8ZPw/8s1+EXzepLARiW
	 maQmdRu09VFuYZnYv8cQCcgHHCNFEEarZC0ipAzwIOQQvr62VeX0oqy4gFXjViHVY9Hl+
	 yPEAVcesIY8N3uZqpU0lCZC+jwGfPX1wBGy22hT+6y9fGmQ++gumRMavKllZpc9/Fo5Uv
	 j6rkIpsrrBVX6f9A79FZTdcoazIfECVB5coySpbJ1Rxlm9itxWK8cCqFwBTj5dheDyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250868;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-AtpMessageProperties:X-MS-Exchange-SenderADCheck:
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
	bh=yjHlK/d9/hQurhRPuRio6hXFXp/BRZzuDv1UxsyAaXM=;
	b=5cM0rkU8AFlypR0CBDmJF1VC7Wz33VKcda9IkcNLI83/4KuaR0DjwLkf8ugbmF5IYIOD
	 q0Ci0VVmcRqjILsyrwzx4ptdt0gmU+ne7BGBImdpvkxllk4QeoweJ3mgbB/1yto3Yi0N/
	 KqmJtJRQJpPE4zQ5jTwUe3U+QG7GMgJBLM86JxRS/DIuhCH9HmPS0SeS6a7kIt7vKOmYZ
	 3gdlOCI/c1CdT30k0I8Rvt1qVZlHuuDRIRnx+R9wm5p5fathm9wE5pyhsxDizJ1Vyl2+h
	 g2EQUec4FS2QRKLyMqxge8XpojcfgSaI80o00JlOc/S02N1arFRX8FGk/z75FQM2j2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=altera.com;
	spf=pass smtp.mailfrom=altera.com;
	dkim=pass header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=E3dnd85f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.43
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010043.outbound.protection.outlook.com [52.101.85.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1428606A31A;
	Thu, 29 Oct 2026 05:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1428606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=E3dnd85f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0Ynog8x+fzQpKSUn8Sd8Zk9qso8GZfPKTlQBKqj6wU/29S9FoqfUvumUWJ1IZrZBF9tHLs4AkpIdD3I5hBOG+avgBZgdqTigF6kBqgPOgFCAO+Z+fIFHPuhYxXQ4yLKplULeNJ1t4/PzY1R8wWhlxJjQ8N+9kGdgjsSZuRWa6RotgFyDDeAxH4VwOP5GelsTqBWQ9URxunvYRHgwFZlnQI9BsDZOCUUd5p8hNYrUgQPwt02J+plw6nOqHxIgqYhig7AAdw/2f6YepyhcLeakF8mwmm9KB09MwwXJ1Zzp+HsbrMaKK2xeGeUgz4FA0GwwDSTBkNfTBdZKR1UK9P3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjHlK/d9/hQurhRPuRio6hXFXp/BRZzuDv1UxsyAaXM=;
 b=OQBHGHGwIkCXdW7rOPPNNONePDa2A1yLGyjQs6S44L8FC7M/vx+Lup7omfo5pgLnx9WQaIKsXRJEvvwkxmN279fdZ+nwTS017HcCwNYgTDrFoqtg9yORkvBhS4YEdXO0u5cZcZOgr4+8od8YaamTe9x62FF2NyoIiCAQILkIuOgUgAk7Zgawx5soHVA6YazaJ5dilSJ40vafLhiyp2Y+abqwnpca1iX9r1RHrZDJFc9HuptF1YntGhSr0DIeU3y/ny8NFsyWkbFfrOP+i9pABPulRlBFZIk7/w5gYVB71tT31d1BQw8N5wGymsE8J+1Go3mDr2zJZJpY5GWKa1MruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjHlK/d9/hQurhRPuRio6hXFXp/BRZzuDv1UxsyAaXM=;
 b=E3dnd85f6pkoskhbFbxj61QnL8UeBAAxma53By7zzvEer9FxA2R03BmGzfU1A+19d0PdTHaMd/gGoWX4fJ71w/EKpLlFQEyU6rfVnVVd7gFTXrf4aZbar4Minw+64G2I/OhxTNuOZOKrE+CuqPa4oIbTvZgahNtjhKCZBNaMPmjqHhN71XocyejrGbKv3mnEDpI6cLXZuPpNGMKaAQpeUNvb5fvxk6fd2zCcktaZ7ZAUFKrWNEzXs4nl2v71j2rNHa8QlO2wlMC8vWGBkFsMagDDYPxaObJk8ODwdeh6st7B+szpjsBJ6EKZXlkAXGLrljI9YANFdLuKnu5/H7/hGA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DS3PR03MB097838.namprd03.prod.outlook.com (2603:10b6:8:546::7)
 by DSSPR03MB989214.namprd03.prod.outlook.com (2603:10b6:8:374::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 05:14:25 +0000
Received: from DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59]) by DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 05:14:25 +0000
From: hang.suan.wang@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Gabriel Whigham <gabewhigham@gmail.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-doc@vger.kernel.org
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v8 0/3] Add Altera SoCFPGA Crypto Service (FCS) driver
Date: Wed, 28 Oct 2026 22:14:18 -0700
Message-ID: <cover.1793197438.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::21) To DS3PR03MB097838.namprd03.prod.outlook.com
 (2603:10b6:8:546::7)
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
X-MS-TrafficTypeDiagnostic: DS3PR03MB097838:EE_|DSSPR03MB989214:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c98c846-25b1-4468-d988-08df357b7ff2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|921020|261028144727099003|5023799004|56012099006|11063799006|261009223027099003|261022075727099003|261022115727099003|261022105027099003|261021121427099003|261021123027099003|261026140227099003|10067099003|261026121527099003|18002099003|55112099003|7136999003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	72rHVyF4aEYPNV0Mn88t9CBp2Da44OelFQqYdA04CQdAINzAjFCyABejUCak8Cpejv5ZBC2G8cpZ8pM3PnJ/hXny74WVdteA/O1A/M0qUxJKyanssB8JJU5AjXB3SQOqpwrfRs30jA262Jeha5hKJEEAYQVzoa4AkqVoNr8eopMm+cFE9hws6F/uQPmgzawOfu44u4ksJWyxOs9iPV+YtYs6alpSLX2Y5zjOUrbncpK+vknDrgHOIZk00aRaAp7NiTW4bFCa5l32732C0b2tqF+arS7xAvTzsNkYi53q4q8xC97Dosv1erfEDtg+8p+2HI7NLqXd5kyJWOHobXYkvq3vrCoM+w+ns37LZ271EnIwphAyGnUs9ZP5H7pxZ5hgeMmyKPmjrNVTnwn4gHEUSAjO+5I8AzddDJ5L6ONT5NdGCvRDYNFhSCdy181yp3xJt0OAuTCFq854V6Cr/TJn3LCJWjOmwtVTWld+5pWXK0uZ2Ij95gmOWM5QDPl+iWZ25Cn3/DqV83lq9uH1oCOkiwzCPQ7AdcsejVaMZihUNUmVQ/A2sNVXh6ap+W2r84Hb+BeZMalbzapDAJWvziYJ+BRDL9/BZcBUeA39Jd5S1/XsmMlOkEFH+EdL1LlCKEY+ptzpLyiJLfrq3ONq+dgotVTAf+FwW7DDxcKDlI7pc6FSej1paWyIzqCMkT6R9GTEHRp5OXpxsCzQbmHh6JKisA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS3PR03MB097838.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(921020)(261028144727099003)(5023799004)(56012099006)(11063799006)(261009223027099003)(261022075727099003)(261022115727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(10067099003)(261026121527099003)(18002099003)(55112099003)(7136999003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EgNINE3v5gmjMXeQRxU9OtYstTROioBhcEJAfDWNhsOdgbICfIq2VenJnl9W?=
 =?us-ascii?Q?7ayTzYma+53CNpGKeCY+8YG0HVB6gFsvavr4tEOm7dyWp8rzTUhfZjWCzh7J?=
 =?us-ascii?Q?f8FgDqyRjzDUmylYZz4X9kxfva7zXG5qbGvRkH1J/cidTD8exo9fSq7yRBJz?=
 =?us-ascii?Q?M0SFt15WsKscFNqlgn6V38QqrpDeMAOc0TCHfoKvckthmxj5B3y/aLq6NNvE?=
 =?us-ascii?Q?ceeZODb9h+xoGwI4XUPI3/MDvMiIBvNxHieH/S7ReqTlyicnBN0KbaRwPqug?=
 =?us-ascii?Q?AoaXq9f0WOP5Rdlx5oWw/kOG7YxvRUhI/GgijOh7vwLMNX7FQ8LGKqCcno2B?=
 =?us-ascii?Q?xnpdSs6ylsJQYfbpgjcD62toSKM3KjOg7VDfWaUzrgokrckfpOeU029/pobR?=
 =?us-ascii?Q?k7pgdir2mNpDMd/foBg11oSVmOWO0kTUNYIhmawpB4Sp9SPpcLai7G7B43Ha?=
 =?us-ascii?Q?6QJIoB5FdsrRRMCfeSmheUUL8JM0a54+CBFzniNPx00JprCU6+r3XUCZ1NRr?=
 =?us-ascii?Q?L5HTQZth5SMUZSd/NF308sNEvEcRgep74/IHktREOqg0oFRBGZ03OVq3bHl1?=
 =?us-ascii?Q?cPeQheYiLErXiFsLPb4NumCwR8UPUhon/jyE1MBd76SrLenbGyDk8TdAfcK1?=
 =?us-ascii?Q?3JC6Np1gPEkvvLmIHguXDPTyZyY7MEE348hNHhV9mtLm9o8rtjIWHpj1uCeL?=
 =?us-ascii?Q?QC7f6ElRKfN5H3dACjHY8BPPcC9xMJQiSPkZfbzeLRAOn07lP8oSJXFgfUmB?=
 =?us-ascii?Q?CzZ+WkNA+19l5NY2dytx/LYyRZxEmppz78C5f6MYuk75YEQIHNrzulOqAi0Y?=
 =?us-ascii?Q?GD/EabtKJUtOz8LgXHWkwR+57nea5FJ3NVOz+ORPoQLa6GP6LFzXDLUgB7ix?=
 =?us-ascii?Q?iN49422cbLnSzeoFj3QxZ5Hsldz1MyoChUUwELGGX/NGpH9dExnXsTxxLqi/?=
 =?us-ascii?Q?ZHp0qNCHAbLlgNfXMTCePH3+Dm7nJQJgKOxJOPUL6RFDdIUGhVjm+dNkjYUm?=
 =?us-ascii?Q?FyZOJIBV91kTxc5pekv2rh8LYFRVRbM84A0pd/9vbuoB7K646omOF+fXPCfK?=
 =?us-ascii?Q?LM4uRJL/bUIkouUecFSLgpGm66n6S+cY/eEH4wSq9f75EMnUa2NYIdWZ0+AX?=
 =?us-ascii?Q?BVms4jMsHKbtOx+zzg19nc7j0vYGbQdEFb2dS1fGBpntELwBUymHkkN1QuJ0?=
 =?us-ascii?Q?j+AqK9jRxhN0qLYOpI/bvaDyiOCFPouGW9tUnNyjqPXUj6v1HCWXzmosI4L9?=
 =?us-ascii?Q?sqvaACL7BkIKFOehllm8/5vswUpxIZg2VSrZN/67clZ8Xk9pqjGGLwVlQXhK?=
 =?us-ascii?Q?JH+XJHQrmI+MD0xaGB30FQw7tNy+Cx/LTUBMP4kpk5PjR2//suYAth7PwRDV?=
 =?us-ascii?Q?J0KDIRsGnF4z36s8ykYpHiYUX8Cq2mHh8C+uxz7biUAP9ruumz+l0zjSMKJr?=
 =?us-ascii?Q?db+uCpJvtBdogHeYtTCdGjciFuzwGsdDK/shqP/um4gdF9vpX/Ixju6vtVkP?=
 =?us-ascii?Q?PoCPgMNP3IzB0eEq85zwdZiMzpRjluPyV6QA/xzCyzvnsbzE/T1LfwWP/aXy?=
 =?us-ascii?Q?QKhD/NoI7SrqXnBqltByvYwmnwFjcA662Yyq436t8/5+B01U63BxcwTvUCyx?=
 =?us-ascii?Q?7xXUCwtatYnRxKf4ILDWfLZP/X6hLsq8bM7054HoZeFytS8/vwyobcsJ0YHc?=
 =?us-ascii?Q?U9Z9tNJsXG9ZgDFaDvm61VRNoA2pFgMd0+I2BKhYuwNdCBvo0FDecWxdXciT?=
 =?us-ascii?Q?3A/RRTL9k3sVD+hpHgi2hoESYBOKyAM=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c98c846-25b1-4468-d988-08df357b7ff2
X-MS-Exchange-CrossTenant-AuthSource: DS3PR03MB097838.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 05:14:25.4829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XeJ7S9xqzDETzJP4DdxZ3VH59QJzF4wKE56tuZOfvL7Lr6KZXZNbj3GoXdKP65a9hmizM+AVyhW63pbJp79wKelRCPv14vkN9Re7mzgUniM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR03MB989214

From: Hang Suan Wang <hang.suan.wang@altera.com>

This series adds Linux support for one of the Altera SoCFPGA Crypto Service
(FCS): Secure Data Object Service (SDOS). SDOS is an Altera-proprietary
service that seals and unseals arbitrary application data. FCS is a
runtime cryptographic interface provided by the Secure Device Manager
(SDM).

The SDM is the hardware security controller in Altera SoCFPGA devices. Host
software reaches it through the existing stratix10-svc mailbox, which uses
Arm Trusted Firmware SIP SMC calls. This series does not expose the rest of
FCS (RNG, AES, SHA, key management, and so on).

SDOS protects data at rest. The SDM encrypts and decrypts using a key
derived from a device-unique SDOS root key that never leaves the secure
boundary. The host supplies plaintext (or an authenticated object) and
never handles raw key material.

SDOS requests use the stratix10-svc asynchronous SIP SMC path. Source and
destination buffers are allocated from the service-layer memory pool, and
their physical addresses and SMMU IOVAs are passed to the SDM.

The caller opens one SDM crypto session with FCS_IOC_OPEN_SESSION and
closes it with FCS_IOC_CLOSE_SESSION. SDOS commands use that session and
do not open or close it. The session belongs to the file that opened it:
another file cannot use it or close it. Closing that file, including when
the process exits, closes the session in the driver's release path. The
SDM allows one session at a time. Each command takes the device lock, so
only one request is in flight, and the kernel gives each command a new
context ID. That ID is not part of the user ABI.

This is the session model later FCS commands will use, so a key imported
in a future series stays alive until the caller closes the session. Those
commands are not in this series. The ioctls are usable on their own. This
series does not add a daemon in the kernel or require one in userspace.

The obvious question is why this is not a trusted-keys backend or a
crypto API transform. There are four reasons this feature cannot fit:

 - No key handle. The key is derived inside the SDM from a device-unique
   root key and is never set, imported or named by the host, so there is
   nothing for setkey() to bind to.

 - Object format. The SDM emits a firmware-defined container: a 40-byte
   header, the payload, and a 48-byte HMAC, with the owner ID carried
   inside the header. That is not a generic AEAD output.

 - Size. SDOS seals arbitrary application data, from 72 up to 32,760 bytes.
   Trusted keys exist to wrap key material and their payloads are
   bounded far below that, so the keyring model does not fit a
   data-at-rest service.

 - Status reporting. SDM statuses 0x102 and 0x103 mean "decryption
   succeeded, but the key is outdated or should be reprovisioned". They are
   successes carrying a warning, and the warning has to reach the caller
   together with valid plaintext. Neither keyctl nor AF_ALG carries a
   firmware status alongside a successful result.


The series is organized as follows:
 - Patch 1 (prerequisite) enlarges the stratix10-svc SMC argument array so
   the asynchronous FCS SDOS command can pass its full set of parameters.

 - Patch 2 (prerequisite) extends the stratix10-svc service layer with the 
   FCS command codes and matching SIP SMC function IDs, adds the Agilex 5
   (intel,agilex5-svc) match, and registers a "stratix10-fcs" platform
   device that an FCS client driver binds to.

 - Patch 3 adds the FCS driver. It is a misc device (/dev/socfpga-fcs).
   FCS_IOC_OPEN_SESSION and FCS_IOC_CLOSE_SESSION manage the SDM crypto
   session. FCS_IOC_SDOS encrypts or decrypts on that session.

Testing:
 - Built for arm64 (defconfig + CONFIG_ALTERA_SOCFPGA_FCS=m).
 - Tested on an Agilex 5 SoC FPGA board (SDOS root key provisioned).
   SDOS encrypt/decrypt round-trip; the decrypted output matches the
   original 32-byte plaintext:

   root@agilex5e:~# hexdump secret.bin
	0000000 cf4d f649 0053 eec5 7fa6 c864 6eee 2335
	0000010 c8c5 e960 94cd d20b c12f 6228 b236 ad9c
	0000020 1209 71b1 7dc3 f7bc dd18 a2a0 ae87 c6a2
	0000030 3eae fdeb ccf0 5e57 e8fd b385 205a 60c1

   root@agilex5e:~# ./fcs_client -e
   root@agilex5e:~# ./fcs_client -E -i secret.bin -o enc.bin -d 0x1234 -r
                    0xabcd
   root@agilex5e:~# ./fcs_client -D -i enc.bin -o sdos_decrypt.bin
   root@agilex5e:~# ./fcs_client -l

   root@agilex5e:~# hexdump -v -e '/1 "%02x "' sdos_decrypt.bin
   4d cf 49 f6 53 00 c5 ee  a6 7f 64 c8 ee 6e 35 23  |M.I.S.....d..n5#|
   c5 c8 60 e9 cd 94 0b d2  2f c1 28 62 36 b2 9c ad  |..`...../.(b6...|
   09 12 b1 71 c3 7d bc f7  18 dd a0 a2 87 ae a2 c6  |...q.}..........|
   ae 3e eb fd f0 cc 57 5e  fd e8 85 b3 5a 20 c1 60  |.>....W^....Z .`|

---
Changes since v7:
 - Give the caller the session lifecycle. FCS_IOC_OPEN_SESSION opens one
   SDM crypto session. FCS_IOC_CLOSE_SESSION closes it. SDOS no longer
   opens or closes the session, including when a request fails.
 - Bind the session to the file that opened it. Another open returns
   -EBUSY. Use or close from another file returns -EPERM.
 - Close the session from the file release path, so process exit still
   tears it down.
 - Generate a new context ID for each command. It remains internal to
   the kernel.
 - Document the session lifecycle, and split EBUSY and EPERM in the
   ioctl and ABI docs.

Changes since v6:
 - Add proper support for the two SDOS address forms required by the SDM:
   pass the physical address backing each buffer separately from its
   SMMU-remapped IOVA.
 - Resolve DMA IOVAs through the device IOMMU domain with
   iommu_iova_to_phys(), and reject physical addresses outside the SDM's
   32-bit addressable range.
 - Allocate FCS service buffers with DMA_ATTR_FORCE_CONTIGUOUS on the SMMU
   path so their backing memory is reachable by the SDM; track allocation
   attributes and use matching dma_free_attrs().
 - Mark only the FCS service channel as requiring physically reachable
   contiguous allocations.
 - Rebase onto the current upstream stratix10-svc implementation and update
   FCS child-device registration and cleanup.
 - Convert FCS core logging to device-scoped dev_*() messages.
 - Update the MAINTAINERS mailing list and Makefile placement.

Changes since v5:
 - Drop the exported fcs_alloc_buf()/fcs_free_buf() helpers. fcs_sdos_crypt()
   now allocates and releases the service-layer pool buffers itself, both
   under priv->lock, so a pool buffer can no longer be leaked when the device
   is unbound while a request is in flight.
 - Stage user data through kvmalloc() buffers in fcs_sdos() so
   copy_from_user()/copy_to_user() run outside priv->lock. A faulting user
   page can no longer pin the lock and block device removal.
 - Read the remaining 32-bit mailbox results with lower_32_bits(): the SDOS
   payload size and the ATF version error status. Both still cast an
   arm_smccc unsigned long through a 32-bit pointer.
 - Document struct fcs_ioc_sdos and FCS_IOC_SDOS with kernel-doc in
   include/uapi/misc/socfpga-fcs-crypto.h. The structure layout and the
   ioctl number are unchanged.
 - Add Documentation/misc-devices/socfpga-fcs.rst: the device node, the
   ioctl, the size ranges per direction, the errno table, and the
   0x102/0x103 success-with-warning statuses.
 - Explain in this cover letter why SDOS is a dedicated ioctl rather than a
   trusted-keys backend or a crypto API transform.

Changes since v4:
 - Read ATF version words with lower_32_bits() so a 32-bit value in an
   arm_smccc unsigned long is correct on 64-bit big-endian.
 - Keep the SDOS payload size when SDM returns 0x102/0x103 (decrypt OK,
   outdated key). Those are success-with-warning; still return the
   plaintext.
 - Release the svc channel in driver remove, not on last close, so unbind
   cannot free parent channel memory while an fd is still open.
 - Guard fcs_alloc_buf()/fcs_free_buf() with the lock and a NULL channel
   check so they do not use the channel after unbind.
 - Always call stratix10_svc_done() after the ATF version query, including
   send failure, so the sync svc kthread is stopped safely.

Changes since v3:
 - Rebase onto current linux-upstream; register stratix10-fcs beside the
   existing socfpga-hwmon child device.
 - Drop context_id from the ioctl UAPI; the kernel owns session and context
 - Make FCS state per-device and kref-counted so an open fd can outlive
   driver remove (-ENODEV after unbind).
 - Copy user buffers in the front-end; the core uses kernel pointers only.
 - Use kzalloc_obj() and shorten comments.

Changes since v2:
socfpga-fcs (front-end):
 - Replace the sysfs store interface with an ioctl character device
   (/dev/socfpga_fcs) using a fixed-width UAPI struct and
   compat_ptr_ioctl(), fixing the KASAN out-of-bounds read and the
   32-bit incompatibility of casting the sysfs buffer as a pointer.
 - Add include/uapi/misc/socfpga-fcs-crypto.h and register the ioctl
   magic in Documentation/userspace-api/ioctl/ioctl-number.rst.
 - Add a .release handler so a session is torn down if the owning fd
   is closed (including on crash).
socfpga-fcs (core):
 - Manage the crypto session internally: SDOS opens and closes its own
   session; reject a concurrent open with -EBUSY. Removes the
   user-visible open/close-session interface and session UUID, fixing
   the session-exhaustion/DoS concern.
 - Harden the async poll loop: keep polling until the deadline and
   always call stratix10_svc_async_done(), fixing the teardown
   use-after-free from the previous -EINPROGRESS early-return and the
   needless full-timeout block.
 - Clear receive_cb only on the synchronous send-error path so a late
   firmware response cannot deref a NULL callback.
 - Set priv = NULL on all fcs_init() error paths so a later probe is
   not permanently rejected with -EBUSY.
 - Read the SDOS owner ID with get_unaligned_le64() for correct
   little-endian handling on big-endian hosts.
stratix10-svc:
 - Enlarge the SMC arguments array so the async SDOS command can
   pass its full parameter set (through a11).
 - In remove(), unregister the child devices before
   stratix10_svc_async_exit() so async_poll() cannot race a freed
   handle.

Changes since v1:
stratix10-svc:
 - Forward result registers (kaddr1) for OPEN_SESSION and SDOS_DATA_EXT
   so session ID / output length reach the client.
socfpga-fcs (front-end):
 - Publish sysfs via driver.dev_groups on the platform device instead of
   a raw kobject under /sys/kernel; callbacks now get a struct device.
socfpga-fcs (core):
 - Convert completion timeouts with msecs_to_jiffies(); drop TIMEOUT.
 - On SDM-busy timeout (-EAGAIN), abort without async_done() (no id
   reuse) and return -EINPROGRESS.
 - SDOS: on in-flight abort, leak s_buf/d_buf instead of freeing to
   avoid corruption from late firmware DMA.
 - Validate the caller UUID early in fcs_sdos_crypt().
 - Enforce single instance: -EBUSY in fcs_init() and priv NULL-guard in
   fcs_acquire_cmd_ctx().
 - Drop the always-zero platform attribute and fcs_get_platform().
 - Set/clear receive_cb only around the synchronous send.
 - Use device-lifetime priv->completion for the async path (was on-stack).
 - Use the local ctx snapshot consistently in fcs_sdos_crypt() and
   fcs_session_close().
 - Point sdos.dst_size at priv->sdos_output_size, not a stack variable.
socfpga-fcs.h:
 - Drop platform/AGILEX5_PLAT; add sdos_output_size.
---

Hang Suan Wang (3):
  firmware: stratix10-svc: increase args array
  firmware: stratix10-svc: add FCS crypto-service commands for Agilex 5
  firmware: socfpga-fcs: add Altera SoCFPGA FCS driver with SDOS feature

 .../sysfs-devices-platform-stratix10-fcs      |  22 +
 Documentation/misc-devices/index.rst          |   1 +
 Documentation/misc-devices/socfpga-fcs.rst    | 171 ++++
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |  11 +
 drivers/firmware/Kconfig                      |  17 +
 drivers/firmware/Makefile                     |   2 +
 drivers/firmware/socfpga-fcs-core.c           | 760 ++++++++++++++++++
 drivers/firmware/socfpga-fcs.c                | 304 +++++++
 drivers/firmware/stratix10-svc.c              | 184 ++++-
 include/linux/firmware/intel/socfpga-fcs.h    | 148 ++++
 include/linux/firmware/intel/stratix10-smc.h  |  64 ++
 .../firmware/intel/stratix10-svc-client.h     |  16 +-
 include/uapi/misc/socfpga-fcs-crypto.h        | 118 +++
 14 files changed, 1807 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-stratix10-fcs
 create mode 100644 Documentation/misc-devices/socfpga-fcs.rst
 create mode 100644 drivers/firmware/socfpga-fcs-core.c
 create mode 100644 drivers/firmware/socfpga-fcs.c
 create mode 100644 include/linux/firmware/intel/socfpga-fcs.h
 create mode 100644 include/uapi/misc/socfpga-fcs-crypto.h

-- 
2.43.7

