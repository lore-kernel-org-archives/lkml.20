Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792671779;
	b=fGCu8R35/kPcnJUQiYHdW6B/OJZjheaU9YPnzIXzBHVXPRdawtbpohOPbjI5QM+YHZOj
	 Uq8hi0hhElfn2g4W/beg0F5OfK99h4e/aI0PAmlfBRndVvUiZBNyhTORIO0CJjw9q62HU
	 yS7xTB7+90UyaO11dQFtyJwxH3qxC3JivIJOZ46of7pDeFrJsSefB/Mqd5uXIE/RtheCC
	 /PBuZk6fZWx6leftZXso2MyQIhDKW9CnVydTXZvmvukLslbTv1oiL8PTQ8noYWVwe+QzF
	 e+aFY5ZTNl6EvbzoogTjA2ZWTOGzb1P3qrknJwrNbKsZEoU8w8rxnQRhM3DUx+vbkUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792671779;
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
	bh=sIyTcflmlFp3PMW5lR+vqpIb03mEy9Kl5Kfj1jkQ5t4=;
	b=5MzkGO/uM1wHdkSc2rTrBBELCczU9Ib+i01GQ7rYXePs24ATcBU0SPgbAN8IEsTVhS1h
	 VVn3BFc6R5Tr/uJ+pLpzOv5GnQ6mGFX5qhcK4XLUyg0k+9ZJWlygQuLiM4S64JujNxkmk
	 RFyrkFFISfwiwxaVb32ySRpU7SmRoxRpSWM+2sKUzQE9cMj3Z8bvXYJT7Aq+lyk4dW9aa
	 InckxR87eYmdLun/K5hyYG5fwBYqo8hsfbXdpikojNYyW6kZq4lKK/mI0mme2E1AdPTDS
	 wJJfFeepzLCcK4gQ+i8absny3lsHwVxfm4l8hKF2Tgn2J4Ztw58uQXnYexhnyr8djvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=P91xfxx7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.31
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012031.outbound.protection.outlook.com [52.101.43.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F23C606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F23C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=P91xfxx7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQ1Z8yv3dTq+Yg1aaj5zGFYQLWgT28o3iGOd+3hvJvCfFHD1aU49ftq6eTQ3WOonledbAJs0CSBc7Xh5awIb1CUIDjP+o5yPNDLTxKWvhNBHZ7wnsVCcAtHjQoadaSgml35+9GcJ+BfmP4hzdfDi6hOErz0k0C73gCMlfCTGHCXbzRzxf/aVqQMKO4nfRQXiKfzxvV+arLaaHIfg3BcK8ZYZNxtIN2XOp1vWc6LftJvXd71otKg4I0XL3SnMwtn8Cil9hJoWNNKYh2JJZOeCgmg42RiOqF0UO7pMudNjp0yUYzPfLGaYNsNA1UdqKp2trCQv/64ByjwiB5SWGN8liw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIyTcflmlFp3PMW5lR+vqpIb03mEy9Kl5Kfj1jkQ5t4=;
 b=APdYX1GwNVVhVYyXIscQyu7szeUB6MpgR5KycD7oTlRGdYj7lbKf21O6CLNhklv2A5FTFWLTmc9EojRJG4MHk6nHOp9tkOpJury3J4dhPj+Mx0Z+waCS7wJp9v4B+Va1RTK54oALbownlV/7ey7OoCxtGBf5bReDF0yGgSMPCh1/YUwqNsNHlqbj91WU90VrzEECdBa/sdhkqixUd6pBqC1TvvKZsyn/+VknpuVjdptgEhZODuCa/B1lLxcff71Izo2lbMHSdxuehSMt42aOCt5IflWWz414s7cXDt2iZcp74weZc0PjJP84Vr5sgE1PEL3uh3M4cj/eKvfgWUinHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIyTcflmlFp3PMW5lR+vqpIb03mEy9Kl5Kfj1jkQ5t4=;
 b=P91xfxx7Lq0Xj7b6CjJsKkVsMLyP6JtQuv4/jLhE83pwtsXV1fRqKBzAIGefeyhmb5aBL1T8Cjy7tuvpnKacFETeMv9dFACOpre0biuecVp/7wRcmzKFIgEeQcG8CcLREhhgb8SK1vigA8+ZNMXtkyzQA6VCD2bb2dVPf1HeyvrbrJKrFeh4jVhDBuZ5cSwOoRQ8IFcPFIh3I+SnX6LSKPm0GiiZjtkSlZImbXK2ehV2U+GXj1NURx2W995gmFfGo4Efow02kSjKrfCzc93IdNLGVx9NFhTnxUY7F3MfWbacyFmhfCWAiz294pTOeuq6JBlNMfShjN2SUcfnYPg6AA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by SN7PR12MB6814.namprd12.prod.outlook.com
 (2603:10b6:806:266::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 12:22:55 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 12:22:54 +0000
Date: Thu, 22 Oct 2026 09:22:54 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: John Garry <john.garry@arm.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
	kevin.tian@intel.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org,
	Cristian Prundeanu <cpru@amazon.com>,
	Breno Leitao <leitao@kernel.org>
Subject: Re: [PATCH v11 06/11] iommu/arm-smmu-v3: Add
 ARM_SMMU_OPT_KDUMP_ADOPT for kdump kernel
Message-ID: <20261022122254.GB3008132@nvidia.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <ee4257b62324aa75d7140f1f4a49aa0f78586fff.1791226953.git.nicolinc@nvidia.com>
 <9f500b81-792f-47b9-a8a9-1415ff11b699@arm.com>
 <atj7XTdjC0CIVDQY@nvidia.com>
 <ab304d36-c655-4a3b-b1ab-e4b7292bfd24@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab304d36-c655-4a3b-b1ab-e4b7292bfd24@arm.com>
X-ClientProxiedBy: YT3PR01CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::16) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|SN7PR12MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1f0ca5-3ac9-42cb-e673-08df3037330a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|10067099003|56012099006|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	toX9ua5lZ/jAoU3+41LhUWfm1Nb1y36WYrMk8925BJyl5/So9kvP/15TjlDMMl/DEP72m5vnH4apgVDNNKXmDXVvjQFfXBpY6pAuEEc0G29bn37rmWRZKBdKKX3AIq9GNJYlI+VZTctdntRtOikJZcAEO4j5eC5TUhjMJ5uAp8w8UR9I2jARv2EitySRHXAdvkvAB69gBFP71BGBgFKJaW8flKHBQy1qfvbBj6sgX/rtNJuD6NnicCPOGNYPZuB94AUb2ZaAx9Tsxox0dar8c8YxgaUhL2Ebq4ZujxgFdsdLD0+ew5scYWICA7k3FbEDCFCZ0RTF9C+donOY/qqDKMFmFMAx2FIbBrGUSjDfEFwR8/lfov9e+mhnlMXwwGCp4h1nSs2sCuVAQpFkL8e+/gTkqcJVGg0rKc6mSFs/m7/a5IeAi3wqVNZjnrnkIwg969hCaIOLfzmsvrmawVojOu/OFkxuiQZmYJZGtp09AsYr6gFGCjqC7S2SnlsE7uFIa6nSxOz+WLRbAglrY/z0ozrgc1ESWacoY2b6Il88LK26mZPO6NhKTtPrl3MwqGkuabx3xRHQx96ScXgnhWwwRh4hsyUFRAw6oIHdqvVw/mDUN+V7CUKwe5NTChdcxilK9zU42Pu9+jv/DeLwIOFE4Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JIpln6ILUYBKc7f/YqLbcXBAXxWcCRJVaD/qWfWNMVaXoe5gTnel0ctRaXou?=
 =?us-ascii?Q?a/tRHdLFkr74BdWpDNS5imw74Y0zsVgz6NB+OW3pKDQ3BLyTFgvLECnJrFJO?=
 =?us-ascii?Q?RCINqRd0iDcodgT7kXC2IoQSCERYT5ld1VSPl0rfdMCDuTEvnQJS2kWwAeBC?=
 =?us-ascii?Q?e+KHHgV/OjE7fccDC6cfHcd1gjUeMT4ltDW67CjoEaIwjR2DbAeLI/MWHXXv?=
 =?us-ascii?Q?GdWLFkAIsTxg+GrSGcSTeX2VifF3vCO3irljqdHIRTzsgkwm0IA/8f52SmIE?=
 =?us-ascii?Q?YAKr0etxrUG7K+Glaj9WaaN+K6i/gh8s1PaJ5BXdcFzneuyYmlVBR3gnAkdP?=
 =?us-ascii?Q?58tMYAjvZ5GJrPhUWzkjGuv27OLX+zkGu80TgTk6ZUygYpk3tRr0y3OP8dnc?=
 =?us-ascii?Q?pdTavJFWKzGcJMie9QADLJjXvtHI6BFMBlyQ/fw1x9Wof346AL1VjsLgGalz?=
 =?us-ascii?Q?3clWO3j/cv4ku1BRw9bQAZoE0McEeKmZ7wrkLFpOEhvFzv2dTMujOpzoLAt9?=
 =?us-ascii?Q?I8Ul2pbzJ9T0Mx+CQVULQfMRroutHolpz/sCqvg6liO6gSbwjZSLL+P02vXk?=
 =?us-ascii?Q?RGf8+8No8y+snEJoSsagn/CiH52vC+rpjZ58raGzdF8hIfEYOzmctVH5Ib2L?=
 =?us-ascii?Q?jZ9M/H4c8vHZAavQgV5JD/CW2b8WxLzkp6vcnKqgfATYvLCb4fPxu+RHf0Z0?=
 =?us-ascii?Q?m9rbBOf2XyKG14iPh2aC5RHNfX92xz75yw9yT/4gf6AWdAQkp0gsoxh/aQ9T?=
 =?us-ascii?Q?6BrJZmjqvl7CkxJSq/9xIgX8oUo9YRCpof52h4FLpfIbto0VuYHzZsdhV17b?=
 =?us-ascii?Q?pq/n7UpnNxXAe0WjpJmDH7z2QXjAFKEaj7newm6lv4gmviaXYWld0n2VpJ3V?=
 =?us-ascii?Q?G8+7XYlNN22hUohMVreU5PwZD9j3YkPQJ6KFSXltTz2+8YatLMnZPKgPlUOd?=
 =?us-ascii?Q?YwR3jpgChke1bn89Ch2WYs7Xdf5w7RA5J+j1utthpkg46tKn0WFmKV4TU3Ws?=
 =?us-ascii?Q?pX5eC/f5J/wWQJarY69oZxzvasn79WdvcCy+Q2i1yFfzQ8TWcvVQYu4MaCQm?=
 =?us-ascii?Q?3l8gKAEW3IeqsE6mRMJL0iTsoqbxr3JCGR0MXGKVrbMfHTIEbvCGD13K8HYN?=
 =?us-ascii?Q?iMIei+nKUu1Ofb/Ry48W/lEhDehgkpAbAc400iOqYS6e5znCIaS5vF7/xPVk?=
 =?us-ascii?Q?x+xnQMMrOqj2X5rpzSy+oBMWl+u0c3vspMlTDtTdxOIeoYWERl5B1tqGRV8u?=
 =?us-ascii?Q?Yfe9jql8C/0u7riM1OfKV7hRoiNq8n7qR7YwwcjCJdYUFLZZ/yTFEKU+b0Fz?=
 =?us-ascii?Q?UU9FjiniiGu2+59omLfMJZZtrPlNd5oniVbPqOA0hRTriYYxOEt1h4HngWov?=
 =?us-ascii?Q?X4nwuI/qzyHX51b+IW53G8FdmLWJwFIywxBQaKIJiwSJqPF75DpBnQ4U/goF?=
 =?us-ascii?Q?kpczs7eTwdBBvPWLdUek6LccuG0YweFDvviVEG5peD6TskXP2zJ4TXQpX1hx?=
 =?us-ascii?Q?5HNLiqQxdX3WTOF+TlcRN9xuG0H59oGjSM15nW/8Lck8xLl/96efbx/71KKS?=
 =?us-ascii?Q?8aegPbAtFeySTM9oRVLIt16xtMR5pK8TFa1kTGO5VkfnCk9mVyYNZbfhsEq7?=
 =?us-ascii?Q?rO1Xp2tm9H64nbVUA+Kv4uFVrGzJABEOJ0RTgD2SecDgu3+fR2sksgVKRYdT?=
 =?us-ascii?Q?JSEsTeZF+MW3yLAX5lLZTHaOmGh5PvzZ+AXc/oMNDV++eOvX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1f0ca5-3ac9-42cb-e673-08df3037330a
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 12:22:54.8269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5N3mVaVFq3sLEbgc/kZeRIjeixZngKfv6EUCr/mgHa59kcSrLm288R69h1e5nxg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6814

On Thu, Oct 22, 2026 at 09:41:18AM +0100, John Garry wrote:

> No, that's the point. Currently you first try the adopt mechanism; if a
> problem is found there, you fall back to the normal full reset. My idea is
> that if a problem is found with the adopt mechanism, you just re-probe with
> the normal full reset method, so that you don't need to undo some adopt work
> during the probe.

It is hard to convay information across a re-prode to tell the
second probe to act differently.

Jason
