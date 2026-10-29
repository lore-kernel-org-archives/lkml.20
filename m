Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793250871;
	b=yWgJMQP96v6Xqe+ncWHBQNeV410gytI0FRkmGhEZgVU+LX2xGjHklbjM368v89mvYbRs
	 2SkbgpVYWLc4VuIZ6p/hFSWmgPDiiEZRv6HC3DWAElT5MJGkV7aEDK2typ1aCV+SMor3M
	 6cLRrZqzWllsjtjes+EE3YZq6VCzVg7aEszklO7WNlsEUIeb7+RMU52o+arS69fw1daHt
	 LrQqxKKRerm49mnpGSNYLSA5KxTwM8E3k0/DnBkZWxZT76qIirIHsJ2NgiLr3wbb3IbBg
	 lLwIv4BHR7jvuqaeMLX4DyHl7PgM9fyQ9tHouABE1LupWlLkozSB32X6lqdBMtahIGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250871;
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
	b=IQI2eblcRgwzmU3M4rhqcLjV4fCUss76TtD1gd92cZ5IvpiuputVlGOdYJ/umrqJ9G87
	 nPbN5nOd/gXsekV/Gg0JDrRUcPzjErT1tVFqYrroqzhmOojEPG8WExiytRAHQ0MdCPfHR
	 XxOudlEKNhw1G/Sg2G4W7xbeXcs3eF/v0F0Ek39HQljwHubY7hFN/cO1WOC4oFDN3MawA
	 kJ8kyCinLkGr0tAmx8+NIo/J8hhdCXYVlX/B3TdRP3aBgP9EWWE5uLuChr0ewAqw5Q3Os
	 pXdRg64Hp2AWgTYgAE3Qtzwb91tPrlKQwisP05zWZTzpN/Hb1wgoB0/SDUE7eYA2EtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=altera.com;
	spf=pass smtp.mailfrom=altera.com;
	dkim=pass header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=CsyxuNhG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.37
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012037.outbound.protection.outlook.com [52.101.48.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996B8606A327;
	Thu, 29 Oct 2026 05:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 996B8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=CsyxuNhG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHXhDHDx970eWFH60u8gxqmGXpS07qcVH/8QnjA+87MeZCgPFg26q7ANutRXVTlG9JQy6BKixEQ/n9rCJDZl7/ZHXgYssf5vNg3n5X8vOGCx/mKhHj8bF+2/6kBxNEEztTyTYcxt9cCLl4OChED9r43rhLzDhLzYnvGbtD1cBBnFpQmkXxZgR+GueTEj41OwJBWefB8UgJh5U2u8faREX4/QhYJBeO49/mASv0qXosCvQfs27mMF5qBh1lO1FeFmXxZPHEQwFbeJFagt1QKaTp0Is0COqMlqs7m0pyWu6WPc+nmoOcabqhbYkzayQ9a67JZOSVlvA0oQJUKEgvZbzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/occHS/qxiEV5iyQbJWhUR6oX0snGm/bUlcQ5fwlLs=;
 b=ZCXt999ouCT9qwaaaNXs7FcN0BVf3UA8aDkZsCyfYsWAXgq7HkwoSHWmlpq6Lr5ne6Q7VjAmOycQF2HALBE3Nx66xNfzc5a5FyWslifHXXUon5O/Y/18/qbDWbFkfdy+d1CWNTKmfIF7KJsTHh3GeAUPP+EJK2nya1ok/KkpsPnDj4J8kMXfjjP8v5ipsn0IvRLuDwc+fqDB9hZcqt8gah6DY7BOnEGIyYDji5fTuRMtVED5JlE83To5zpsvdnha0PFZ11LGf+ojK80o4pJ8JeiJhLm18tojRQVuB0gNMhr99XuW9bIEfhaGIeJgoRaSyUaecjcw86/tXxKZKP2ShQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/occHS/qxiEV5iyQbJWhUR6oX0snGm/bUlcQ5fwlLs=;
 b=CsyxuNhGS6mcAzpNt6H3qdZvt+QZZRzQ72YnpLt8IrJxRQplnEnz0818VVwjNFBBGpYu6fhl91n0ytFvFD8Hc0frQAdFZPoHF2UrGSV2Cz38fw3OBPBIuIJYGHyRh1v2+UpbBBzmxNeVzqqPs94Tad8ndpoUTZtnN211tPMJE4jeBbbABFTGiYHZy9ybkUz/XJpff/QFw+csuuZiIXzshTU7D0/hGaSxRasB2FUtt8J9+hjsW2adOaoQ3K7JCQSiAr2s8bfKO4Ojv2RgRwAdJ0YDNjrzaO/puIaRLKWPM5UdEHbJMlAiQuxvBUIPvcerHkAzsJXwkEtZ0IeC6tthOg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DS3PR03MB097838.namprd03.prod.outlook.com (2603:10b6:8:546::7)
 by DSSPR03MB989214.namprd03.prod.outlook.com (2603:10b6:8:374::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 05:14:29 +0000
Received: from DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59]) by DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 05:14:29 +0000
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
Subject: [PATCH v8 2/3] firmware: stratix10-svc: add FCS crypto-service commands for Agilex 5
Date: Wed, 28 Oct 2026 22:14:20 -0700
Message-ID: <0a4c0b71ec076cb467dd409249e3a7466b541084.1793197438.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1793197438.git.hang.suan.wang@altera.com>
References: <cover.1793197438.git.hang.suan.wang@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 23b53490-b5b5-4244-3ce5-08df357b821f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|921020|261028144727099003|56012099006|11063799006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261026140227099003|261021135927099003|10067099003|261026121527099003|18002099003|55112099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	pv9sb3pP+TACXqHpSORhZ/uDEtYOb/vJLhDTcsp3ZP4U0YjxgtITqjDuL79/6h5unlG5chSxCFX1u/w06oXjj+hmoDE8g91EdowmH8frjZQ9miKsMnb3A6qVRBWZvHGgUDPwBqSsPzOlMlaT7OGl3cxz0lxxItEHPCyZJpjudOnM42BRgeS0SPqZLi7w8mcZlijEO7BGac4OT0jhtfSew8hb0fUaUq1/arTnnUV7viNTOyFRlGZ7f7WBw6TbwSRFqK3emjhiBLCIUx+xgQuwW5BnCsyn60rMZYGsvGzPxEyc+5qvk76Y7t61vnCF/I7Facbm39exRpKnCYqpimyr+5by69kxIJbQxVWTF65qPyb3uVYkzMsBHUHrVczcazil4shYzwJT2QYkAPF1YfrI7QFUCYFRKbdGtKBkkU0gfQOmbM7A7Ml6Bx7xCvdaE1aLMeY3ZpuANkffyvSKewJScIPIY1tyRtLTbXgbPHcBANUvKlz/Y06OCR715A9SpzH8kvMtDreLZadQq8ELBiuIhrVDsxp42Ik5CV+GTCujk+V/e7RqF+Gw055yQYXfJC2EBc7FETHwAl+RwAPd/radOBZqF1/LPbXjNb5eooQT+NEaevM2srRmNTcd2CvmQ0h1pBItJ184xB07aXE01DZJsnkYJ5ePqw7WTjDoN+/MtUluLm6XoS+6WyVp36ydTugneuQ0IAB2bst1AmQu1P+fmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS3PR03MB097838.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(921020)(261028144727099003)(56012099006)(11063799006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(261021135927099003)(10067099003)(261026121527099003)(18002099003)(55112099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gqSMI79mgFurV9EuexjYceAMUmudVUn7hyrtGcu9WgKD6y5KVovWWto+/szm?=
 =?us-ascii?Q?tADjqXV4DHv64vNZAWGBVC/5/YIjYFrSipv0efNOjYvH0peagMxy3kePM1wp?=
 =?us-ascii?Q?PR88fyCyearbyv9PI8qeMyVtCMeJmBNGBG/Du69h/rGwzqHiE7bfBbLANlph?=
 =?us-ascii?Q?rbcKykAj3FaZQzkMz5CJkcwAbSlUxPCARvrlRniYJkxuQ1VDmYBnGwSoFNki?=
 =?us-ascii?Q?ONRqs8cOxcNy1nzWHlqwl/IiIBukNJNKLG/glnkvB5NVJJkivT33ifvk4Fxm?=
 =?us-ascii?Q?smog1xkPAPykfLwft4ZGx99XIQ8HQQEW9i25mxmKCQ1pg6TORzNutCx+KRY8?=
 =?us-ascii?Q?qyJ6M6+Mi+5AFGL+lQq0gBrl03wvOAiXyWCzc6t9BvdIcwXVqa9Mge6ycMeK?=
 =?us-ascii?Q?0carGdKB6jPfi1lfX/4IKAZ8NFiKuJkr59BdFIJ5AeTr48hA2lap9ax+1AtK?=
 =?us-ascii?Q?4lIz09DWX/qu1wVONEJENTYAfCmJMkkS/GdrfHvHCj6oyFgBnBGVz5mPpGxQ?=
 =?us-ascii?Q?mJCmToZWgqi1mbVGz/IexKMog+Pul9lUe38x0qM2RR45xzX8ubRTF5PTMrT0?=
 =?us-ascii?Q?3ph5s9Cy5wjwkfvJZg3Aglkr/fspL2z6WC/UT3iSkwxtF54uzpqHk2xD2HJ2?=
 =?us-ascii?Q?e7cfPSwu69OWblSuopx9FyB7nZo0crLZvIOdUY93+wYpMxCZBcwBbzhSa+gg?=
 =?us-ascii?Q?bEnD4tGAuD4Y0A+lr3LGBue1C+AJOr3hfN7JxgYDceUGZUvfqu2A+2qSCCFx?=
 =?us-ascii?Q?dWCq8f2aDe7b8DmByw8UBLNDRIKeSVoPQblqWl0AiadYhF0BIDo3J8gsR2yA?=
 =?us-ascii?Q?KjeGCDFbzuMLeuRIac+KdX92SEqrFcvP4MUFd8eJl2AmXZqQXxPA8YXoAUZn?=
 =?us-ascii?Q?gG8AQnTctfCVfwTWax/pM5D9G/JEWWy3LyxE2eBBR9MOiVFFuGnQCMQ79BT3?=
 =?us-ascii?Q?At/n1bSNl2XKlWClRmg5f4HkzSshT9OgkltUdeTH6RDls9oA6ZdxlchdUkXc?=
 =?us-ascii?Q?Yu/ZDt0FsBvi0J2AIEhlUN9YDHxa5kU1AQbcpmBHVjznNhjlTR29UiO56t1A?=
 =?us-ascii?Q?4FmX53mDZbCkCMab3kHxat/Z6SII3YFoXrj1lF9x2T4Yrcw+BZI8Mydi/fRZ?=
 =?us-ascii?Q?E35k44GaJUsYG6aTGEBC58AWKawVVK9KCMEHJnjZBoMN+mD0NtlcC5RhR33X?=
 =?us-ascii?Q?wE4wQ/05J3YMeiDx7O2fw7kWmvwU8i9cFI8I3asJY2OVJAKWn559YV3sR6mG?=
 =?us-ascii?Q?rnY6oWKA6u+KS0+J4aGQuEFBitht05hmvYKfETUFrbuWgbeJVstNQhOMlKMu?=
 =?us-ascii?Q?XVYXT7qGW+B4ME9B1BDy+9A/nnPU7L1GRLvzTmM2x314ErFM1PS0HFwaeiIm?=
 =?us-ascii?Q?krA8JcXPHeL/svyY5CzNs5jtBe3MRVbi80txef5D4/y3yNB0DJXh0fKOeNLj?=
 =?us-ascii?Q?dKVmOlo8Rhr1n5fLNFe/F8WUP9eo5f2dRZFuxzln1lSZzSFCGhJGyCMV3y6G?=
 =?us-ascii?Q?dcdxMgJihhtsCPFAQOJLnzy3eVN8AyPD1yFVhbMHR3qIjKcL45pX2A96M1fs?=
 =?us-ascii?Q?PWN5Jk+VbRb27I86jKUHWuSTGwVCwmn5y2JvtAcNAblAbzasp/9xTM+IdG6x?=
 =?us-ascii?Q?hkUf3kQLwDgy3nUkDgB2Y7gPAd7hT0DCf2r1W9lyX0vPmmhZiI1ulNfzDruZ?=
 =?us-ascii?Q?o0bkehDp11tJQIlyRk6qYS02eAogpDGL+YAti6yS9+Yt4mNjAJs6Ao7nMoIw?=
 =?us-ascii?Q?lVfSqIKoAQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b53490-b5b5-4244-3ce5-08df357b821f
X-MS-Exchange-CrossTenant-AuthSource: DS3PR03MB097838.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 05:14:29.1184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxLQFkaCb0vs1f+M1/qRuNtiofaAzy/V9kuVCct1IfRQKWbBs71zYMBjZZ0wmMPdvMBMLD35a3dUaXspCiOvn8/46ZLeLQos+twRzfGYXFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR03MB989214

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

