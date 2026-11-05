Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793899045;
	b=GcZ8TSzH4DgR5TduGQbNH4sO4ppnXTDs3GjMkao4+wycO1ZemeQL6rXajujY2a37Ktc4
	 Pvx051o0s5y1Nmf0eaP3mSE9mwJsvAEgcoNjEomKqYOSwFJHYCgsYkmFoIBEVP1RwxXwX
	 fzYNrqB+OzE60qRZGOxoDXlHrNQJ9M0QoEkJX2gLeUAeKbSQADXyn+w/WBVMyvGLuY5sA
	 cAA3u3ffpjc9vSVtjt5VOOtpgixHxNgeMGo7cDSP05fem9NMcElozYfNlM5jCxaz6ChdV
	 rpRDmuolZ6LlxJR5URkrV7CvXkV5xh/og2hw6EhlL70ipuihaz8cYAaVFcvSMq5uMvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899045;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
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
	bh=Y/occHS/qxiEV5iyQbJWhUR6oX0snGm/bUlcQ5fwlLs=;
	b=EfaLDKWYiH8YL//Qiu7kyQXj1Z29KpmwbX4Ul4HISCwEyku7WKKLz5ZOoa/jEEjfBcbC
	 sC9Rd7UnSJpUSVvEgri39Tx8zfdoOhk2Jovf2qNxEsATBGGDa2FzQECY5IUimuiJpURlb
	 NClD3lLH1jVTM59gv7etgB3pnZKXg+HgPhShyH8X9CfpqaPdch7VJ2FctigpwjDnMN/Gz
	 cMnI1WJYna2fVD+en/d45uxzsL8F2q1rHAoT6jAEnOAqRCqjapFDeoQF3K+coF/OLedwO
	 JVn9G+hWkJs52NqXx0J4n0FldmK8o9eLq1ilP7bP/ZJ8XrRALTzNTWMQvd32+gnyOnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=altera.com;
	spf=pass smtp.mailfrom=altera.com;
	dkim=pass header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=IRzsNcYG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.30
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BE1606A32F;
	Thu,  5 Nov 2026 17:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5BE1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=IRzsNcYG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjhcjudS1CBLd/aJfw2HOpxPGSf12W2o25lW4sJ7BaB1OhfhgZFiC3XGMcMjtNWJyo+QfN6V7/vUFCoA4OXQXZmv7RU7IiLd9n8R0rSariNtXC8im4OWpAc2NpwuJalTKWGALV1ZuGGAqfH2tRRz5er6dKQFX6G/T0lqfMWI63+i9iNNjgEHSGdfQ3OqFJ6dPUAbA2NvJ/z1HMyDQUUPgpCe718GaoAD162heYh8H6rmRVcQo6DUJy1G1ckp0I2IDoFbH5wEoRoZaE/w4/elxOQAGl5xUx75gPPa6L1zZxp+lRvDd4jqMLlTEfLS1nC7uOwLnQzJT7ZSiz6Fm/il8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/occHS/qxiEV5iyQbJWhUR6oX0snGm/bUlcQ5fwlLs=;
 b=VEX2WO2CQvax28oTDCQOemHV03xqVafFjHe/Xd/XEww5XlRB6VCxi7WFjLmRdLMbVo5V0jG5fPjWjm2ZJtK+2NT7vH7haK1etFDGF0z5p5P24xRRybJ4beC/9s69VwZXpAMaVxgB2S0j24G+XKXMfzhfgqYdb8TMigtUgtW2ETUQkHI1K/XGxK4th6LIW1Y+gGGpd8hBodPICppfvU7pJY7cUBR8m9SVVeott5YasOBYXjiVLrR2/QdMBtztQuk39jGGodNr30AULGfhD4+6P39I2XzCpAD1iqXFLCKoeiXciQQEbGutJBfteRUqJlTcE8Xfg92szLwvk58LM7oUMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/occHS/qxiEV5iyQbJWhUR6oX0snGm/bUlcQ5fwlLs=;
 b=IRzsNcYGuAZHjLMywJAghVXR4JWwTXGfsVAbgso4kPzpQmkUScQSb7j9weSOTayf/M6iVpEsZK07Pii8Bkp/wwumISGfcbM9W0HolrXEqK+adW6OVJMTPPcxosQopzHHUONlA9+4cwXwQns1YbGp8hB7VrYID/vAJiEYqbnnALps0WlnI1DaYiqDzmvWv2HA4L5tJFyJLkAoGwAx3Y3iwR7358u5AzRkNLebHERRVynb88uF7DGYl717XQHnBAVkOgi44omHC2nZawpZmTcojXESahQRJrjNvbAUIj10CF6AyOgAkmT+4Ry/GZks/6yvsegRn4xKyPN/ZoeSUoX5yw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DS3PR03MB097838.namprd03.prod.outlook.com (2603:10b6:8:546::7)
 by CH2PR03MB5205.namprd03.prod.outlook.com (2603:10b6:610:9b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 5 Nov
 2026 17:17:20 +0000
Received: from DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59]) by DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 17:17:18 +0000
From: hang.suan.wang@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Gabriel Whigham <gabewhigham@gmail.com>,
	Will Deacon <will@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-doc@vger.kernel.org
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v9 2/3] firmware: stratix10-svc: add FCS crypto-service commands for Agilex 5
Date: Thu,  5 Nov 2026 09:17:11 -0800
Message-ID: <0a4c0b71ec076cb467dd409249e3a7466b541084.1793895850.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1793895849.git.hang.suan.wang@altera.com>
References: <cover.1793895849.git.hang.suan.wang@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::17) To DS3PR03MB097838.namprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS3PR03MB097838:EE_|CH2PR03MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: 2638119b-5ca6-46ce-8a0d-08df3b60a569
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|261026121527099003|261102123227099003|11063799006|921020|261021123027099003|10067099003|261021121427099003|3023799007|261009223027099003|261026140227099003|261021135927099003|261022105027099003|6133799003|18002099003|22082099003|261028144727099003|56012099006|55112099003;
X-Microsoft-Antispam-Message-Info:
	EUDqrG8VBH9wUqzLynoXcu7ze/GAv95A0uiq2hwrjibJrAglBF0wx8qdcodAMt/TlXXQwy05ff/ByWAJU8IRoDysrIBswcbrG+II8+zAVvCNnRSlfLJR61clMaj631f1DR5CPU2XsULM3AzJ5GPurbJsxUm6IahaLlAQnAvh0PNG4v0JjC3Ys5m/cknqgpIrLIV3p0qwK5O5e8JWaQ3y540CYlaDzMpignaqPlM5VtqHGtekCQXcgsZqHT4RKvw8fqLvgp375GfqSHM6fI6FMim6e3lcs4n/dwjhCyCDR9BK52uucD2lkOc6ojNa+1UkplWaklpuHn8syXwfK+V9cj4X9gi+Hwiy5dTpAZNnZYYkSoRnNKm68N5xevV9OXQPu9stE9ONJpiso6b21Cmu78Go9WposJspzM4J3XDIlz+GL11uIdk9zqq860FK66QJen+PTUYYh4WBc+vmR+ancacIecQUXFC08WSwKTjyKPebrZNp+kt0CGZdClG11+43l5RB7Xcayxd2fgybf2bxc+a0UK9M0NFSuht3BBWKwYmxezM6TQdv7+YTw+q0BjLf4xLPShWRVFnUyqozl/kI6xUDNq7a15QNKuYCxqeeg2aDECABJhTi9dDkQKXdz+8RhKdocq4XNZ/U0cbJhh3/ZJjZ1Wzz6xjFj6qHmLoeWNtvwmO75n6RksnpoPbO5pbkhDClgpkynjDcBSksBAGlfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS3PR03MB097838.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(261026121527099003)(261102123227099003)(11063799006)(921020)(261021123027099003)(10067099003)(261021121427099003)(3023799007)(261009223027099003)(261026140227099003)(261021135927099003)(261022105027099003)(6133799003)(18002099003)(22082099003)(261028144727099003)(56012099006)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nwpLinAAyxRHUZbN8/E8Vc38qIrHZl1mouxkvXxpLA+D/Szb4ye7yviy3pDr?=
 =?us-ascii?Q?RIGoGOrd1207yhs4cEzpyUtSL2j5tQVF+dRivi+h5SKbmBW093JYYAuKwa8l?=
 =?us-ascii?Q?s8yIM82t/qiaMxqRgV6c0Vjt3SvhBdadxfD3EF+u9LFZizMqAi5e1u88DmtK?=
 =?us-ascii?Q?az0dDBmHWl90iWmWBtksW6GpwMXYl/ybtgU1Qbeeky/Y+/3ok2VucHTWykNd?=
 =?us-ascii?Q?oupemVEwDHnMB9fL5uK6QR0A1NlHbt054CzwJGgdPt1PvvV+f5JCq9yPw8IX?=
 =?us-ascii?Q?si0jVZo5VDVy7NZC7zoXx43v3EElBtg4NoKBfHP9s0VReeNXfjgMWkPfCGCQ?=
 =?us-ascii?Q?6R6Rtk2aawwDp2T1y7M3U7bvXlDJtPx0plgtupZxzr+wtnYp0h5koGcxxTUK?=
 =?us-ascii?Q?+0wiH+1GNW9V4tCg4z5uQTsQPjGApOHsD6A4gHVjU7C949+lRQfckjxUone2?=
 =?us-ascii?Q?XXwdjvuqohpOrlS9jSYB/ku0MI4rezEuDAPQ9v0CgWuNHDutnEY+x9O/UOBB?=
 =?us-ascii?Q?gTxQCSlUEFSmQfERWSJ7SBrX3iMl4gs7pj5zwp4HBRZyy8Ty/tUIulukOxLY?=
 =?us-ascii?Q?K4Em82/bGh+/IyGbyVRyHHMOINNN8/5cTk+p7cXbgDWCJZ20e3ta/t8PzcS8?=
 =?us-ascii?Q?7AJe532wp3WlV8xH8tUCGxZt9NUMuiAl2317fZ79u5Uck0vs1xyXZMSEarPe?=
 =?us-ascii?Q?HZBn5ejmqmbyDwE5Cs6Ou404lVDqDK4RGW9o7WMHEDRUQDP0ncJ78DXjcgQp?=
 =?us-ascii?Q?XH5m42i/JZKeJMtPgZysHbFxlBBK4kS+eodVaJ9mUOA9H+UT4ED1g9w0m6xs?=
 =?us-ascii?Q?IIHBjc9S9RYockgJdIPyfp818x20kJG+JOPjs5ZE9gLbNKnBHVm1MZZzQNxn?=
 =?us-ascii?Q?2kg8SyyjkZh3pURk8ClXQXaJBjmxwqNpkza5iswR0qgEw6nIeGGczVi3k4Ug?=
 =?us-ascii?Q?zR6IssCJko1xs8q72WzVH/FtwBPUv9wVh8znpADMHaxvjU9+ADoLXfloWGTW?=
 =?us-ascii?Q?0BiaA7IAqtwUnZ79jkGkV0VEmmDOs7h58D49zztT7OybX6DSTCHrs8z0ab8w?=
 =?us-ascii?Q?TlTExdkJ4C359D02/y8HREL+zpS2xN/dx+ezocAGO3PCyAA9iNsMe6eFloYq?=
 =?us-ascii?Q?Ih/J1NbaAKKfq+XoHcyx73Wy1n1rQTBCpptheBO9OICTAgb54rgSTgakcZ39?=
 =?us-ascii?Q?3E5U+LXNNojrGcsiJd/+zlzv7TPcnu18Pv0/IpEDe+Kr95knafbnDFZSmFmd?=
 =?us-ascii?Q?q+9HevIcWvaKLART2gHzOG7J+wzikwXco9q64U8/pXrh1v/q05iPYGNwqtDv?=
 =?us-ascii?Q?IoVIfSmo+hnkQBA2WDltQC1xs/FBSadO6MOCmlbur9OAFzLVAH7In7TrUHfI?=
 =?us-ascii?Q?39O3m/GPfXM+2ZmmiZhAgy2lyMxGFScBSkNPs5fSDZEVEwgdOmFQ017FkeQl?=
 =?us-ascii?Q?7nZk929sT33O3eVR8OtixyLGgaa7AZDN+shOuxdWn/fOg7pwW8X3h7MOussh?=
 =?us-ascii?Q?xLBKtm9NAbp6jte8wGWv16Gd/s/GUBHSiHWhaFAqBwq6xdr6rDouSbWu4gQC?=
 =?us-ascii?Q?DfpHBEXr2uuNvBuI7nTH7ty0eKPCtLPpb2QbcEk5FPOUEa/EA8GO288vwrTW?=
 =?us-ascii?Q?zE4byrnfJrF6Xf8kzW9r0BXpuMdLOKUQ2xDOJl747HwtsTQ8YXUplPUSapCn?=
 =?us-ascii?Q?gnLR1kK3n6PC6gm4lxW0anDyPSoouR1SogTUbSM/Pic5uWBfI4OfxsPvKjzx?=
 =?us-ascii?Q?fXLsBbvL/g=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2638119b-5ca6-46ce-8a0d-08df3b60a569
X-MS-Exchange-CrossTenant-AuthSource: DS3PR03MB097838.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:17:18.8978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBYltQcayHsKZzInYoxUv1YjZZYAr9BkWfl+7F+WuZINvbRG0f1qSiVhr9BHgWeMqrUiA9OjdyNPWu642fZn8HFs1QWU4ClVK9ma34ECg3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5205

From: Hang Suan Wang <hang.suan.wang@altera.com>

The Agilex 5 Secure Device Manager (SDM 1.5) exposes an FPGA Crypto
Service (FCS) over the existing SIP SMC mailbox: a session-based
interface for crypto primitives such as SDOS (Secure Data Object
Service) encrypt/decrypt. The service layer has no command to drive it
yet.

Configure stratix10-svc about this interface so an in-kernel FCS client
can use it:

  - add the client command codes COMMAND_FCS_CRYPTO_OPEN_SESSION,
    COMMAND_FCS_CRYPTO_CLOSE_SESSION and COMMAND_FCS_SDOS_DATA_EXT (all
    asynchronous)

  - add the matching asynchronous SIP SMC function IDs
    (INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION,
    INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION and
    INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT) with their register-usage
    documentation;

  - match "intel,agilex5-svc" and register a "stratix10-fcs" child
    platform device, mirroring the existing RSU child, so an FCS client
    driver can bind without a dedicated device-tree node;

The transport is unchanged: Agilex 5 reuses the SIP SMC calling
convention and async mailbox ABI the driver already implements, so no
new transport mechanism is required.

The command COMMAND_FCS_SDOS_DATA_EXT takes 2 types of buffer which are
the physical address of the source and destination, and SMMU remapped
address. Like other device in the market, Agilex 5 drives the SDM through
an SMMU. The remapped address carry the IOVA returned by the DMA allocator,
and the physical slots carry the address backing it, resolved with
iommu_iova_to_phys().

The SDM can only reach 32-bit physical addresses, but dma_alloc_coherent()
has no way to ask for that directly. Once an IOMMU is involved, it drops
the __GFP_DMA and __GFP_DMA32 flags and adds __GFP_HIGHMEM instead. It
assumes the IOMMU can map any page, so address range no longer matters to
it. The only attribute that skips this behavior is
DMA_ATTR_FORCE_CONTIGUOUS, which pulls memory from CMA instead. On arm64,
CMA happens to be reserved below the DMA zone limit, so it ends up
32-bit-reachable. The contiguous part is not actually what we need it's
just a side effect of using CMA. Apply this attribute only to channels
whose commands carry a physical address, and track which attributes each
buffer was allocated with so it's freed the same way.

This is a prerequisite for the SoCFPGA FCS driver, the first in-tree
consumer of these commands.

Signed-off-by: Hang Suan Wang <hang.suan.wang@altera.com>
---
 drivers/firmware/stratix10-svc.c              | 178 +++++++++++++++++-
 include/linux/firmware/intel/stratix10-smc.h  |  64 +++++++
 .../firmware/intel/stratix10-svc-client.h     |  14 ++
 3 files changed, 247 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 8f07b945392a..15af21203c8f 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -72,6 +72,7 @@
 
 /* stratix10 service layer clients */
 #define STRATIX10_RSU				"stratix10-rsu"
+#define STRATIX10_FCS				"stratix10-fcs"
 #define SOCFPGA_HWMON				"socfpga-hwmon"
 
 /* Maximum number of SDM client IDs. */
@@ -145,10 +146,12 @@ struct stratix10_svc_chan;
 /**
  * struct stratix10_svc - svc private data
  * @stratix10_svc_rsu: pointer to stratix10 RSU device
+ * @stratix10_svc_fcs: pointer to stratix10 FCS device
  * @stratix10_svc_hwmon: pointer to stratix10 HWMON device
  */
 struct stratix10_svc {
 	struct platform_device *stratix10_svc_rsu;
+	struct platform_device *stratix10_svc_fcs;
 	struct platform_device *stratix10_svc_hwmon;
 };
 
@@ -181,8 +184,10 @@ struct stratix10_svc_sh_memory {
  *         On the SMMU path this is (IOVA + %SVC_SDM_DMA_ADDR_OFFSET);
  *         on the gen_pool path this equals the raw physical address.
  * @size: size of memory
- * @dma_addr: IOVA returned by dma_alloc_coherent(); used to free the
- *            mapping via dma_free_coherent() on the SMMU path.
+ * @dma_addr: IOVA returned by the DMA allocator; used to release the
+ *            mapping again on the SMMU path.
+ * @attrs: DMA attributes the buffer was allocated with, passed back to
+ *         dma_free_attrs() so that the release matches the allocation.
  * @node: link list head node
  *
  * This struct is used in a list that keeps track of buffers which have
@@ -195,6 +200,7 @@ struct stratix10_svc_data_mem {
 	phys_addr_t paddr;
 	size_t size;
 	dma_addr_t dma_addr;
+	unsigned long attrs;
 	struct list_head node;
 };
 
@@ -306,6 +312,10 @@ struct stratix10_async_ctrl {
  * @svc_fifo_lock: protect access to service message data queue (locking pending fifo)
  * @lock: protect access to the channel
  * @async_chan: reference to asynchronous channel object for this channel
+ * @mem_contiguous: when true, buffers for this channel are allocated so that
+ *                  their physical address is reachable by the SDM, which is
+ *                  required by commands passing a physical address rather
+ *                  than an IOVA.
  *
  * This struct is used by service client to communicate with service layer.
  * Each service client has its own channel created by service controller.
@@ -319,6 +329,7 @@ struct stratix10_svc_chan {
 	spinlock_t svc_fifo_lock;
 	spinlock_t lock;
 	struct stratix10_async_chan *async_chan;
+	bool mem_contiguous;
 };
 
 /**
@@ -336,6 +347,8 @@ struct stratix10_svc_chan {
  * @psci_reboot_nb: reboot notifier for PSCI secondary CPU offlining
  * @use_dma_mem: when true, buffers are allocated via dma_alloc_coherent()
  *               instead of the ATF reserved-memory gen_pool.
+ * @domain: IOMMU domain the SDM-visible buffers are mapped into; used to
+ *          resolve a buffer's IOVA back to the physical address ATF expects.
  * @dma_addr_offset: value added to the DMA address (IOVA) before passing it
  *                   to ATF via SMC. ATF uses this offset to distinguish
  *                   SMMU-mapped buffers from direct physical addresses; it
@@ -361,6 +374,7 @@ struct stratix10_svc_controller {
 	struct stratix10_async_ctrl actrl;
 	struct notifier_block psci_reboot_nb;
 	bool use_dma_mem;
+	struct iommu_domain *domain;
 	unsigned long dma_addr_offset;
 	struct stratix10_svc_chan chans[] __counted_by(num_chans);
 };
@@ -396,6 +410,88 @@ static void *svc_pa_to_va(unsigned long addr)
 	return NULL;
 }
 
+/**
+ * svc_va_to_pa() - translate virtual address to physical address
+ * @ctrl: pointer to service layer controller
+ * @vaddr: buffer returned by stratix10_svc_allocate_memory()
+ *
+ * Provides the physical address arguments of an SMC call. On the SMMU path
+ * ATF expects the address backing the buffer's IOVA here, with the IOVA
+ * itself supplied separately by svc_va_to_iova(). The backing address is
+ * resolved through the device's IOMMU domain, since dma_alloc_coherent()
+ * returns a remapped virtual address that virt_to_phys() cannot translate.
+ * On the gen_pool path the stored address is already a physical address.
+ *
+ * The SDM can only reach a 32-bit physical address, so reject anything
+ * beyond that rather than letting the SDM fail the command later.
+ *
+ * Return: physical address of the buffer, or 0 if the provided virtual
+ * address doesn't exist or is not reachable by the SDM.
+ */
+static unsigned long svc_va_to_pa(struct stratix10_svc_controller *ctrl,
+				  void *vaddr)
+{
+	struct stratix10_svc_data_mem *pmem;
+	phys_addr_t pa;
+
+	if (!vaddr)
+		return 0;
+
+	guard(mutex)(&svc_mem_lock);
+	list_for_each_entry(pmem, &svc_data_mem, node) {
+		if (pmem->vaddr != vaddr)
+			continue;
+
+		if (!ctrl->use_dma_mem)
+			return pmem->paddr;
+
+		pa = iommu_iova_to_phys(ctrl->domain, pmem->dma_addr);
+		if (!pa || pa > U32_MAX) {
+			dev_err(ctrl->dev,
+				"payload %p resolved to %pa, which the SDM cannot reach\n",
+				vaddr, &pa);
+			return 0;
+		}
+
+		return pa;
+	}
+
+	dev_err(ctrl->dev, "payload %p is not a service layer buffer\n", vaddr);
+	return 0;
+}
+
+/**
+ * svc_va_to_iova() - translate virtual address to SMMU remapped address
+ * @ctrl: pointer to service layer controller
+ * @vaddr: buffer returned by stratix10_svc_allocate_memory()
+ *
+ * Provides the SMMU remapped address arguments of an SMC call. Without an
+ * SMMU there is no separate remapped address, and ATF expects these
+ * arguments to repeat the physical address.
+ *
+ * Return: IOVA of the buffer on the SMMU path, its physical address on the
+ * gen_pool path, or 0 if the provided virtual address doesn't exist.
+ */
+static unsigned long svc_va_to_iova(struct stratix10_svc_controller *ctrl,
+				    void *vaddr)
+{
+	struct stratix10_svc_data_mem *pmem;
+
+	if (!vaddr)
+		return 0;
+
+	guard(mutex)(&svc_mem_lock);
+	list_for_each_entry(pmem, &svc_data_mem, node) {
+		if (pmem->vaddr != vaddr)
+			continue;
+
+		return ctrl->use_dma_mem ? pmem->dma_addr : pmem->paddr;
+	}
+
+	dev_err(ctrl->dev, "payload %p is not a service layer buffer\n", vaddr);
+	return 0;
+}
+
 /**
  * svc_thread_cmd_data_claim() - claim back buffer from the secure world
  * @ctrl: pointer to service layer controller
@@ -1492,6 +1588,26 @@ int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg,
 		STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
 
 	switch (p_msg->command) {
+	case COMMAND_FCS_CRYPTO_OPEN_SESSION:
+		args.a0 = INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION;
+		break;
+	case COMMAND_FCS_CRYPTO_CLOSE_SESSION:
+		args.a0 = INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION;
+		args.a2 = p_msg->arg[0];
+		break;
+	case COMMAND_FCS_SDOS_DATA_EXT:
+		args.a0 = INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT;
+		args.a2 = p_msg->arg[0];
+		args.a3 = p_msg->arg[1];
+		args.a4 = p_msg->arg[2];
+		args.a5 = svc_va_to_pa(ctrl, p_msg->payload);
+		args.a6 = p_msg->payload_length;
+		args.a7 = svc_va_to_pa(ctrl, p_msg->payload_output);
+		args.a8 = p_msg->payload_length_output;
+		args.a9 = p_msg->arg[3];
+		args.a10 = svc_va_to_iova(ctrl, p_msg->payload);
+		args.a11 = svc_va_to_iova(ctrl, p_msg->payload_output);
+		break;
 	case COMMAND_RSU_GET_SPT_TABLE:
 		args.a0 = INTEL_SIP_SMC_ASYNC_RSU_GET_SPT;
 		break;
@@ -1589,8 +1705,13 @@ static int stratix10_svc_async_prepare_response(struct stratix10_svc_chan *chan,
 	data->status = STRATIX10_GET_SDM_STATUS_CODE(handle->res.a1);
 
 	switch (p_msg->command) {
+	case COMMAND_FCS_CRYPTO_CLOSE_SESSION:
 	case COMMAND_RSU_NOTIFY:
 		break;
+	case COMMAND_FCS_CRYPTO_OPEN_SESSION:
+	case COMMAND_FCS_SDOS_DATA_EXT:
+		data->kaddr1 = (void *)&handle->res.a2;
+		break;
 	case COMMAND_RSU_GET_SPT_TABLE:
 		data->kaddr1 = (void *)&handle->res.a2;
 		data->kaddr2 = (void *)&handle->res.a3;
@@ -2157,7 +2278,25 @@ void *stratix10_svc_allocate_memory(struct stratix10_svc_chan *chan,
 		return ERR_PTR(-ENOMEM);
 
 	if (ctrl->use_dma_mem) {
-		va = dma_alloc_coherent(ctrl->dev, size, &dma_addr, GFP_KERNEL);
+		pmem->attrs = 0;
+		if (chan->mem_contiguous) {
+			/*
+			 * Some SMC calls take a buffer's physical address and
+			 * its SMMU remapped address in separate arguments, and
+			 * the SDM has to reach the physical one (see
+			 * INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT). The default
+			 * allocator path adds __GFP_HIGHMEM, so route the
+			 * allocation through CMA instead, which arm64 reserves
+			 * below the DMA zone limit.
+			 */
+			if (size <= PAGE_SIZE)
+				size = PAGE_SIZE * 2;
+			pmem->attrs = DMA_ATTR_FORCE_CONTIGUOUS;
+			va = dma_alloc_attrs(ctrl->dev, size, &dma_addr, GFP_KERNEL,
+					     pmem->attrs);
+		} else {
+			va = dma_alloc_coherent(ctrl->dev, size, &dma_addr, GFP_KERNEL);
+		}
 		if (!va) {
 			kfree(pmem);
 			return ERR_PTR(-ENOMEM);
@@ -2211,8 +2350,8 @@ void stratix10_svc_free_memory(struct stratix10_svc_chan *chan, void *kaddr)
 			continue;
 
 		if (ctrl->use_dma_mem) {
-			dma_free_coherent(ctrl->dev, pmem->size,
-					  pmem->vaddr, pmem->dma_addr);
+			dma_free_attrs(ctrl->dev, pmem->size, pmem->vaddr,
+				       pmem->dma_addr, pmem->attrs);
 		} else {
 			gen_pool_free(ctrl->genpool,
 				      (unsigned long)kaddr, pmem->size);
@@ -2303,8 +2442,8 @@ static void svc_data_mem_cleanup(void *data)
 		dev_warn(ctrl->dev, "leaked svc buffer %p, freeing on unbind\n",
 			 pmem->vaddr);
 		if (ctrl->use_dma_mem) {
-			dma_free_coherent(ctrl->dev, pmem->size,
-					  pmem->vaddr, pmem->dma_addr);
+			dma_free_attrs(ctrl->dev, pmem->size, pmem->vaddr,
+				       pmem->dma_addr, pmem->attrs);
 		} else {
 			gen_pool_free(ctrl->genpool,
 				      (unsigned long)pmem->vaddr, pmem->size);
@@ -2386,6 +2525,8 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	init_completion(&controller->complete_status);
 
 	if (use_dma_mem) {
+		controller->domain = iommu_get_domain_for_dev(dev);
+
 		ret = devm_add_action_or_reset(dev, svc_data_mem_cleanup, controller);
 		if (ret)
 			goto err_destroy_pool;
@@ -2421,6 +2562,8 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 		controller->chans[i].scl = NULL;
 		controller->chans[i].ctrl = controller;
 		controller->chans[i].name = (char *)chan_names[i];
+		controller->chans[i].mem_contiguous =
+			!strcmp(controller->chans[i].name, SVC_CLIENT_FCS);
 		spin_lock_init(&controller->chans[i].lock);
 		ret = kfifo_alloc(&controller->chans[i].svc_fifo, fifo_size, GFP_KERNEL);
 		if (ret) {
@@ -2448,9 +2591,20 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 		goto err_free_fifos;
 	}
 
+	svc->stratix10_svc_fcs = platform_device_alloc(STRATIX10_FCS, 0);
+	if (!svc->stratix10_svc_fcs) {
+		dev_err(dev, "failed to allocate %s device\n", STRATIX10_FCS);
+		ret = -ENOMEM;
+		goto err_unregister_clients;
+	}
+
 	ret = platform_device_add(svc->stratix10_svc_rsu);
 	if (ret)
-		goto err_put_device;
+		goto err_put_rsu;
+
+	ret = platform_device_add(svc->stratix10_svc_fcs);
+	if (ret)
+		goto err_put_fcs;
 
 	if (IS_ENABLED(CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON)) {
 		svc->stratix10_svc_hwmon =
@@ -2484,9 +2638,13 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 		platform_device_unregister(svc->stratix10_svc_hwmon);
 	if (svc->stratix10_svc_rsu)
 		platform_device_unregister(svc->stratix10_svc_rsu);
+	if (svc->stratix10_svc_fcs)
+		platform_device_unregister(svc->stratix10_svc_fcs);
 	goto err_free_fifos;
-err_put_device:
+err_put_rsu:
 	platform_device_put(svc->stratix10_svc_rsu);
+err_put_fcs:
+	platform_device_put(svc->stratix10_svc_fcs);
 err_free_fifos:
 	/* only remove from list if list_add_tail() was reached */
 	if (!list_empty(&controller->node))
@@ -2513,6 +2671,8 @@ static void stratix10_svc_drv_remove(struct platform_device *pdev)
 	platform_device_unregister(svc->stratix10_svc_rsu);
 	if (svc->stratix10_svc_hwmon)
 		platform_device_unregister(svc->stratix10_svc_hwmon);
+	if (svc->stratix10_svc_fcs)
+		platform_device_unregister(svc->stratix10_svc_fcs);
 
 	psci_cpu_off_teardown(ctrl);
 
diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/linux/firmware/intel/stratix10-smc.h
index 6a6fa51ad39e..fb01116c1cb9 100644
--- a/include/linux/firmware/intel/stratix10-smc.h
+++ b/include/linux/firmware/intel/stratix10-smc.h
@@ -669,6 +669,70 @@ INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FPGA_CONFIG_COMPLETED_WRITE)
 #define INTEL_SIP_SMC_FCS_GET_PROVISION_DATA \
 	INTEL_SIP_SMC_STD_CALL_VAL(INTEL_SIP_SMC_FUNCID_FCS_GET_PROVISION_DATA)
 
+/**
+ * Request INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT
+ * Async call to perform encryption/decryption
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT
+ * a1 transaction job id
+ * a2 session ID
+ * a3 context ID
+ * a4 cryption operating mode (1 for encryption and 0 for decryption)
+ * a5 physical address of source
+ * a6 size of source
+ * a7 physical address of destination
+ * a8 size of destination
+ * a9 sdos ownership
+ * a10 smmu remapped address of source
+ * a11 smmu remapped address of destination
+ * a12-a17 not used
+ *
+ * Return status:
+ * a0 INTEL_SIP_SMC_STATUS_OK or INTEL_SIP_SMC_STATUS_ERROR
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CRYPTION_EXT (0x12F)
+#define INTEL_SIP_SMC_ASYNC_FCS_CRYPTION_EXT \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CRYPTION_EXT)
+
+/**
+ * Request INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION
+ * Async call to open and establish a crypto service session with firmware
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_FCS_OPEN_CRYPTO_SERVICE_SESSION
+ * a1 transaction job id
+ * a2-a17 not used
+ *
+ * Return status:
+ * a0 INTEL_SIP_SMC_STATUS_OK ,INTEL_SIP_SMC_STATUS_REJECTED
+ * or INTEL_SIP_SMC_STATUS_BUSY
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_OPEN_CS_SESSION (0x13A)
+#define INTEL_SIP_SMC_ASYNC_FCS_OPEN_CS_SESSION \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_OPEN_CS_SESSION)
+
+/**
+ * Request INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION
+ * Async call to close a service session
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION
+ * a1 transaction job id
+ * a2 session ID
+ * a3-a17 not used
+ *
+ * Return status:
+ * a0 INTEL_SIP_SMC_STATUS_OK ,INTEL_SIP_SMC_STATUS_REJECTED
+ * or INTEL_SIP_SMC_STATUS_BUSY
+ * a1-a17 not used
+ */
+#define INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CLOSE_CS_SESSION (0x13B)
+#define INTEL_SIP_SMC_ASYNC_FCS_CLOSE_CS_SESSION \
+	INTEL_SIP_SMC_ASYNC_VAL(INTEL_SIP_SMC_ASYNC_FUNC_ID_FCS_CLOSE_CS_SESSION)
+
 /**
  * Request INTEL_SIP_SMC_HWMON_READTEMP
  * Sync call to request temperature
diff --git a/include/linux/firmware/intel/stratix10-svc-client.h b/include/linux/firmware/intel/stratix10-svc-client.h
index 9bb46c3cb0f8..edd7953d5d08 100644
--- a/include/linux/firmware/intel/stratix10-svc-client.h
+++ b/include/linux/firmware/intel/stratix10-svc-client.h
@@ -122,6 +122,15 @@ struct stratix10_svc_chan;
  * @COMMAND_SMC_SVC_VERSION: Non-mailbox SMC SVC API Version,
  * return status is SVC_STATUS_OK
  *
+ * @COMMAND_FCS_CRYPTO_OPEN_SESSION: open the crypto service session(s),
+ * return status is SVC_STATUS_OK or SVC_STATUS_ERROR
+ *
+ * @COMMAND_FCS_CRYPTO_CLOSE_SESSION: close the crypto service session(s),
+ * return status is SVC_STATUS_OK or SVC_STATUS_ERROR
+ *
+ * @COMMAND_FCS_SDOS_DATA_EXT: extend SDOS data encryption & decryption,
+ * return status is SVC_STATUS_OK or SVC_STATUS_ERROR
+ *
  * @COMMAND_MBOX_SEND_CMD: send generic mailbox command, return status is
  * SVC_STATUS_OK or SVC_STATUS_ERROR
  *
@@ -190,6 +199,11 @@ enum stratix10_svc_command_code {
 	COMMAND_FCS_RANDOM_NUMBER_GEN,
 	/* for general status poll */
 	COMMAND_POLL_SERVICE_STATUS = 40,
+	/* for crypto service */
+	COMMAND_FCS_CRYPTO_OPEN_SESSION = 50,
+	COMMAND_FCS_CRYPTO_CLOSE_SESSION,
+	/* for extended SDOS encrypt/decrypt */
+	COMMAND_FCS_SDOS_DATA_EXT = 82,
 	/* for generic mailbox send command */
 	COMMAND_MBOX_SEND_CMD = 100,
 	/* Non-mailbox SMC Call */
-- 
2.43.7

