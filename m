Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012054.outbound.protection.outlook.com [40.107.200.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618964BA1CB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576597; cv=fail; b=KCgVFyynJ0D4AXe6aWyHwuDf1JE28u85bh1YncQ8V8jBP7Nop/z3gQsjc4FQfmjf6T61GVz4LqSGeWauG5yDxNHZcEjaV1RB6F6Imt64bD3rGgcE9bf2b3WTvQ/rjbKRSRxCOq3aVRoayjUgYxhqQLttoaHCi0y4XacOrJQq7us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576597; c=relaxed/simple;
	bh=gVXWUiSJ1HF2rxjC45WkjrMTgvNruk9UVa77xCeeubY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TfE7q7uhOXLb9BjNMbfm5lNJg/dkzNNPCGRkw/MOwoVLnIQRyS49EqOsNTRZFQMLJjufM2NmEjax203kHk8XBv+zz2cwK5TTnIMv+6UZe85OoirheeaczyLcB5NYPWygq4EA43P1UBxieByuR4nJSzzFYs/Sz5ZmZ9VIc5bdh9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QHlmlspY; arc=fail smtp.client-ip=40.107.200.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QHlmlspY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWi+PFj4Sk4OH03HwXC+JquEW/ZLN6QE5PJ7KQ5TrkOhWrckHBEAgsMf1NJDLpld8KBdCQFqdtYcLSeKiXl4ptwzUrUe7nNKSf0fvii0DOWLAnX7bx7l2bvhH5YbxWRzoZLmg4QE20noZgz4NLY8q00dRhRQcllcOQ6usoXvucur6zei7RTz/dcCrbejs/rWupcYNbGDsVjK8+uQP8946cwMdQBV2e6F1W/5E+AE23o2l8GXXD368cxK3DPpVldTkeT7FU2Kx4xvF5bOrRpn1Hn5ZyUome6rGrpMgsKeh66JzJwD8EAOvX2snNRUowT6wCKibh2pPndU6Z9diHbTGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JRKtm//xQbtNB7+AdqF5pDsx5KWg8KzaPgkZtf9apc=;
 b=TvSR5y/pngriKFa0vUaEvd2yx1w1s66n8c5q7LapOb5h5TY2I3FNTdtqAvftObRaKzJq19+SLsXYpaQAD9o5+kD9ZUH+3M6Bca1q8qta3V5YG2wYBHN2A8ekBl3AUVQILGYc7bUIGZGOcnfE8q6W+HwXnmBRB7KcE+/dXBdRerqTnMB4+a7N+ez9LcbXiYIXZ48EFtbXPv2ELs6bFZTTomkEuhTseyid6dNdAnsysIf//20T0yaXm1EhPJvFXc7etj+dyyq+NUZ6Mk2dWBU//mVnloBHshKRUlhvbHmZHiVULVylduXcDMfMFeTS22Z3vNSoeKCDYLxLV54u6t2bgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JRKtm//xQbtNB7+AdqF5pDsx5KWg8KzaPgkZtf9apc=;
 b=QHlmlspYnhTTjCH2FCvGZFy2swI/QcCEX4l8joqsoD8+e7Mh1vKrVNVT3vRKitcqKlijNah4eoInS7ANrWURYaPDLS4IWRKjhoCH4zNmih8WRZhAhaj4uBHRSfkunVfP8MxiPB4e/c9Ugtt59qrJzBLwYkH7R8dOLH3cs0bwWNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 SA1PR12MB8744.namprd12.prod.outlook.com (2603:10b6:806:38c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 16:36:28 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 16:36:28 +0000
Date: Wed, 16 Sep 2026 12:36:18 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Ilan Bonneau-Zamon <yolezz.secret@gmail.com>
Cc: bp@alien8.0.org, mario.limonciello@amd.com,
	linux-kernel@vger.kernel.org,
	Ilan Bonneau-Zamon <ilan.bonneauzamon@gmail.com>
Subject: Re: [PATCH v5] x86/amd_node: Fix resource leak in amd_smn_init()
 error path
Message-ID: <20260916163618.GA1395@yaz-khff2.amd.com>
References: <20260916115955.15965-1-ilan.bonneauzamon@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916115955.15965-1-ilan.bonneauzamon@gmail.com>
X-ClientProxiedBy: BN9PR03CA0045.namprd03.prod.outlook.com
 (2603:10b6:408:fb::20) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|SA1PR12MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b8e606-c049-454e-8785-08df1410a81d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/vDSyiibcylzyPkA3RxaU62DUf9I1oyUKU0rfYLEuhZls74UwgaQuJQclqReJOdLk/m9zjKF8k+BBdZ84nhuX8pzvjHtxM5+tBhbDfcH1rSXY6FRLssrdw5o/K7wRj/HOP3GNeUX1VLYPybIOBnUcL4BdoQE0qFbvhvWBpUpKS7IgDczHOYPKX6NaQCPPNI4CUqRN47E0Xjja2Q8AGRaDuV5hXPWtjYfnl8LskUzSHx2Bax0cRz+xsXOCdZ5l9TenSpLc8FHRqfkJBabhxDk6B4K6jg5mt0HTNU/IyEYEtfKRtd871aIqwrcJPRB6xFSdtjbfcEXkKG408RhdmI49RcmoZZ7bcpyP9ybC47ZkCtIwtOfR3RSTeYHVWZk+pfMP4AGHml9mGDN1sKkUL3i6hCzzEEF72USbV5iu08mSLNc4ZVI4QM1g+xUrSZ7bnjEhP3eYE3qUakJZhIsAMwx8MoRLvBvuu92q7mChCcHJb7bhPbuY2ruNYQJKOj1tHqhnBBg2ukGDo8gIMpDUnZW3HEYEtuL4gKxEyBqB2Py5mSbk2Ig4UTwGmQLQX1BDOwZllKUISCDL0Jyk6WM3Gf2n3OEC6ztpgBtg3VtgqYYOE+fRLhp/FDzHYmBbQwCuK+UT+Q+8yyeD6g4sSn4Zp84tW/WnoawANTVgdRaMxKeMAs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XJu7CL/Ab3Nhocxt1iAxz+WXFhZ9LisWibhNDJ/NkUHCi6buT0gtH6tSUsn1?=
 =?us-ascii?Q?IjueuAnmvG4M5hyYI7x/M5SIXC9L3H2Ks+7dqM9Mycgcw13WvggsrWA/tJoy?=
 =?us-ascii?Q?R+c6+lrUcsEYiA6jd/MaSIood+FXTU0N7OFXTuTHIUg8VolGRwX2cIvAvfO8?=
 =?us-ascii?Q?xBZcIo2iZVBkuApZz5742uL3VkqXI3hrNxZn7asb8aWeBR+eG4tGrPKL3oR1?=
 =?us-ascii?Q?VmkGUcBpM56dxzPVTVDIYBHY4aR2iLFmYubl7hBZnlpB6/UmtktkrXkDD7E6?=
 =?us-ascii?Q?Rr4EqSqZp/4CPvNo34gI1ab1wOeNse0tvdiPsMGiVEiALd9DnzyRbm3w3bpN?=
 =?us-ascii?Q?84xBinHolAzIx5Rg8rbXPsdwE2d+wATdN7SJ8cQ02+WRBZL0Jpe+hGOplIx4?=
 =?us-ascii?Q?gEovmIsxApnQEw8RHJdIkHs091860oorCElo+/DGSy2koPbbcdTjCzsIiMgL?=
 =?us-ascii?Q?Sh+BOlN76ALr5Te25S62qaofKa2AIZkT2W6aYDlUwRlW2yqLRiPmlNvaofOe?=
 =?us-ascii?Q?fJFGWvAJwVnbMUM34pC3ojqw3WVDNRie/I8HEKCKvl8bplLdiE5gSlUsDRjx?=
 =?us-ascii?Q?eDLdTndpThMoLbrokfyHgjxxNG8xSNbTkOCQa+wI0FpLrnX38vhWjA0yDfBf?=
 =?us-ascii?Q?L5yYnnOwkyxdLUIgGOgcfjjF5PW/nk7RN6kR/exVGzgYYDXHT6OTVcY+p+vP?=
 =?us-ascii?Q?T6fh4tflxgiyEXRO0j6eveWmW+yqTqy3TuLHRhscOi+YbMiLQ6fvz/DYeLxe?=
 =?us-ascii?Q?/PK7ZbBuB9PxZdm6DX4tVhcrjfF1Y4L9wa4YjfxovliRWNDkqqGXKgljBe2z?=
 =?us-ascii?Q?q8mN5dB4kZhq7kIi0KaVwylVoq8liwHawhLfATqooxLnBuBeU9CxInrFnV9P?=
 =?us-ascii?Q?oRTp/Q3Jq+mDCTMuwdPQQO6amtefkiO/JnxLng63yQhcNNbSbsraj/zwY4//?=
 =?us-ascii?Q?UYuEVRNIfm96Cxe/rsMMmgKP2uxN75UbSBOoYruaHYQqb2m+XBR2Oql5fTx5?=
 =?us-ascii?Q?MGE7b9PZcgyrNm4Fxby4nRKMKdvQzhYSXbGqEzDqdJuX9HvbF89r8nKXoaSt?=
 =?us-ascii?Q?HGSQG0aD4qyfRXfIlN0TaYciiYUP/t7RwRp1vnfOwExW7XyvN3dwDYMXK/tK?=
 =?us-ascii?Q?kAsUG9mvu3n6hL6qTP3ci9888jYbPgdeBP+BHldjaHkiTyoJ28h7nYmq0kz4?=
 =?us-ascii?Q?zPVbz0zO/ofThRBgBo9GO4NiKaQe3FEfsVC6/mI+MfymhIV5tkBWwuGs6nK7?=
 =?us-ascii?Q?+IBj/KiR2nYPejQhE0N0oN3PKQdpFYx6IbcSmF6SrFdfEuNgCwuQlrdtHmks?=
 =?us-ascii?Q?FrBosoEjkBRL6FGRnw65XdHiTvt96dpq/ajWgaQsXRtsO90IPZ3Zvf1+yaxY?=
 =?us-ascii?Q?1jmKBe9yrQOYcllVfPmgssMed+6jbYUo/yQW5PwNrHsux4ut1HP+62X+8xGO?=
 =?us-ascii?Q?ZFrx/EHeJjiVDtnPn0g3p+5El7wvkbOBym9R6fg58tRq6yghvzK74JdKOzsQ?=
 =?us-ascii?Q?gvqGEnUyg5MF7A0j/wBF5/JmMBDw0BI9ey1lchB3ms73FqRaoWiiHgVnSG9y?=
 =?us-ascii?Q?R7D46lzXVfVg7OPmNu+0v8EAwUPnv+lRCyjGGRl3Tybc5Peu4ttSN511w/pQ?=
 =?us-ascii?Q?LbnCFlwv2mZvtnMEyhLX0aCS0FiPcP0/JR0ZSvLYG8FwLso9hKLrqwSqFeIN?=
 =?us-ascii?Q?hZ4txtXg5Q8hobO2LIvEOtOZRHeP/k/5YHYiTASLIL5qCYX7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b8e606-c049-454e-8785-08df1410a81d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 16:36:28.4199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTo8znZTrAsyPkGYIIbtMwD/NRqnpXsyzi/4T7NdEsKRkPGVAJpaucp4aH2/v5ABtJPdMzzFOxPQf8KPc1yicA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8744

On Wed, Sep 16, 2026 at 01:59:54PM +0200, Ilan Bonneau-Zamon wrote:
> In amd_smn_init(), if an error occurs after reserving PCI config regions,
> the already reserved regions are left allocated.
> 
> Unwind the setup properly in reverse order using traditional error labels
> and goto statements, ensuring proper cleanup on error exit paths.
> 

What is wrong with keeping these regions reserved?

The goal of reserving the regions is to prevent user space from using
them. Why should this be backed out?

Maybe we should *not* exit if a reservation fails? Rather, we should
unconditionally attempt to reserve all of them, and warn if reservation
fails on a particular device (but continue iterating).

Thanks,
Yazen
