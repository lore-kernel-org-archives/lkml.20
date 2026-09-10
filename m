Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011062.outbound.protection.outlook.com [52.101.62.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AC331F9B4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056529; cv=fail; b=YD+gKh+98STPmQuPxsSc464TJgxPX47IFe5oVJ5Nw+BcAfqopoW3eMQmgHGzJDlWw3oDvwJdcymspRehBiQY/dlrAIaAqGpju2HHr5GaC1q6ECeMIbFZuhtANHGqinwam4ZE0/qIRXXrfAZp9orZPeBlLsx4TYO3fBE++rz9+kE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056529; c=relaxed/simple;
	bh=Fsia5yXW7ESqdJufcv7u5+XxZD0vi7CZ8gi42IFk9qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SOTnSRPjxdOP8G3/D5jg5vjMB+78CnlEWfpctTuTjq/XvkFuF8T3Z77zjlRrnpgaDEtRN+OR9mly1OGi/cfn7Od7kcdZXRhi1JexBIEDwzDf1QfnAsY2Jww3cH//gEDbSrXZoEqGl53+FLAaeUSnbSDLs2Vt639RHV2O2HaPkyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W1mpSwya; arc=fail smtp.client-ip=52.101.62.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W1mpSwya"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAqLon0vT5GClx9db2iez9QJRNGVUTjS0CfnpHCcESxhLtE1yCzPvgwCiKiXpy7AWbUZX4FOA6HVK0L5Ns8ccDX77ZyhJwDjGjDl2vFv4b8esI20KGSwqIhtQL3T2tuGdBZiHBNV236beCOSG0z2SVuIoXM8M6OSHlbAZPTP74XroB4qG7z7HHpVuN51bgCnjq6gW14EHdzHV7r+yEAk0IVisY/JP7Wg8RQTKzCRSQSKvDpwJCtKDYQjlT53Ugi3nDNHGXf3V4xjADN2D/1LBlTDtnkYIhCQpF9frM2330qrpO8X5W5aYkzsY+3rC99w4ksoMQ71n89rb3P88Q7Pfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fsia5yXW7ESqdJufcv7u5+XxZD0vi7CZ8gi42IFk9qU=;
 b=WH4I+Vm1k7Qoz7ee7cd5eyi8XsHeaZK8IkKs6lgUUkZvb/MwcO7lAMUANNxWrThDn8+1Fj1PXJW+D+uo3gsv1etCgbzld24uwdmlkN7FecumptpLduunziBvIZYBveeg8zPeQ6q00h+w6iHqsuWwy5PpfnD+yPwHjhKbru0Ht0Y/JqdRIt4h95tzITkauQZn34G+So+/Q8ESoZhi249/9JnGMbOk6HKKj8br0WY+VXWodpgXySicS6LiTPBoVTc8QvqmqrZJz/Ta7ftnzI0wBP0VUCK8rpcsaH5GqfthbXzdDUAVw5/4pApaBdAHzCdJeHalXxmrLXWGXE2z/Iw2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fsia5yXW7ESqdJufcv7u5+XxZD0vi7CZ8gi42IFk9qU=;
 b=W1mpSwyaP5gK5mSgQ29vkMf+wYFcUvWCmjdsmqqfGjL8CV85RGmeePEeWnYvhGU0s0FBja2uAgCBw6oQ/irjbJeV5ivJ61p/fJoZcpm3sGODAiIoiXa+U1RtzDXgUWA5MT4p6Ypq2ZYjK21oPdMZZxqqOWMRyPgKIlS2WFbc9U4JOunC0f86Mgmt8JUHkOp8O9wsA96t9J70VFFwngoD0i8NDAUqLAFzXqbSg8K0O5BWWdzg+oRinxUSeE759nhk5yOBBrsfot4RjJkG+vm/BJ3FQkY0KXny/eHTlFSVDEUh86BpH/p+tR7bLYZxH3EyRZKzfmXG1KcfWup+NDQsyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB6744.namprd12.prod.outlook.com (2603:10b6:806:26c::13)
 by IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 16:08:45 +0000
Received: from SN7PR12MB6744.namprd12.prod.outlook.com
 ([fe80::28d5:2119:63f5:9961]) by SN7PR12MB6744.namprd12.prod.outlook.com
 ([fe80::28d5:2119:63f5:9961%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 16:08:45 +0000
From: Mahantesh Salimath <mahantesh@nvidia.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Jens Wiklander <jenswi@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tee: optee: ffa: support shared memory offsets on large-page kernels
Date: Thu, 10 Sep 2026 16:08:43 +0000
Message-ID: <20260910160843.1560877-1-mahantesh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aqKiUthQ-swgP5q7@sumit-xelite>
References: <aqKiUthQ-swgP5q7@sumit-xelite>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::12) To SN7PR12MB6744.namprd12.prod.outlook.com
 (2603:10b6:806:26c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6744:EE_|IA1PR12MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de1fb44-c9ec-4d5c-3f6c-08df0f55ca3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	1Zblhedk+6TG2Ja7XUBWFAso2gbhGcHRZUf5xmxjfrnplC25JeXM9RO2cNS/plpulw9yrMBBqkBc0/20FvPMmn2V8SyAN8QjiIHtGb7as7LmzVRw6aS2ApJywfzBLQJpTl1ZP6oOm7VU75cV7cIcLIWS459SJ3e55T70EN3LO6BT2p1i05D/fqS9nbD7opwTN/KKhtNdiq3VUrdwyK7WF4N6laTaD4pzhCQPtYfYz8Q7mmWiF4V58xT8CvGkYYDg9qozKff+wJwoOzlVGbBExFqh82Xf/gdkoh+H7KQNNdUAnsnpzR6MP5KQIYofCtfEm1kOThiVtmTxm7gH9tfSH7pK5E4nw/gKIAtNZ9AN8OGqgST84/gYambDQayx3LpYopImqL1JbgQa8Kyjx7I5l4GxbN3kMvAd/qywi/MjfKpbkfFpgkYZ1SbDl9JvjIok/wSeVS+ZzFTE7Lmu8jtBwmK4s2eQkHPi6BbrfILmc+qlqXEO/WYwpaLMNE61GqnU7FcbSohTRbl4iGO2Vf8i3T0uHswxkOy9JkA+2NEOWzWTEL/UkyreCw0dgU5jPeSelWcU8bfaiQHk4zy0CqwIx57Hpfu4FksJ6V53YBZaQq/6xv79xRRW26QolaixLKEzGniawkes5xA+jqKcqEGvJ6eYpplK1d7q0VxuCj7EJAs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB6744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gsRpmaVAliPiSTkgGpWLowhWl/NK4bCRhhtfpeks4seHCBBvy5UYp5iR8faq?=
 =?us-ascii?Q?CvXmfg3AKaYFCvmMLQJpksrKEM5U/O3T/6sPYLgq/d+ses4MhwoSWn5Qj6xz?=
 =?us-ascii?Q?cQmAFExi8Ox/flm0t8cIQjzHEBxsox1eB6vSFXl4f8F/eJg5Tvx59OAZ6H1R?=
 =?us-ascii?Q?esxbAli2HWKME+m4SepxF51lDGYRRhlI1QzFwjc+Tzkan6eMPs4OmQqLpFDg?=
 =?us-ascii?Q?kicY6Th77m6/ekQm8z1ELyHbAcsbv1wFsZ6gQSOdbaX8QKPBeWk8PW6VYtOB?=
 =?us-ascii?Q?6/sr+NaW9fq4Ni0PojJNU2/aW+yWP/A0Gty55rRDFRes22ROt0Kq5tXpRbH/?=
 =?us-ascii?Q?V+/HK12fC/RvlY0TP9RYWNH9lrSofO3j9yxNsfC1pWC1mIsXzGtaRF4YAjGv?=
 =?us-ascii?Q?6S+TiJv4f5Fkjw8biRoqHSV9qHzlSwUHmy3c4Jp2og/kxv50jU6WpMxRxlYL?=
 =?us-ascii?Q?GOWSt99mBXqeq8wQoWD5ZvL2zeKdExl9ZSMywGnYR0mumsDAIjYV5l3KtXN0?=
 =?us-ascii?Q?TaxCrQe5VMuz55bzwLs5tmFdJ0Iwp3UA6A3/2KppduV5vcqPlC8m2eHPVh/I?=
 =?us-ascii?Q?Vr/4PrQYDg+92yDba4TYS9HOvHirakzRqjKQV3YnV85tfTyY3koVAPgObThI?=
 =?us-ascii?Q?j5BMkISY1DjehD3G2UkESP7zf0GdJRAzSuy3Ctv5n7F7L9EXqDtzFYe2Ume9?=
 =?us-ascii?Q?w3DsEVxVe2QjKCqP2L1aKSs++Ok6WnZGkfE3mNfztFhWac5vWwlLMeGt3Me1?=
 =?us-ascii?Q?hZ4Y4xySwW6vWVmNh6EYwvY8dbAlONefEQwYGvG6tJH665ZEiwO2WR0KdbcU?=
 =?us-ascii?Q?YB0C+DeFgZfqkorxBUd6NpW0SokF+OmuyvR/1I1Sq5EKfi8TwRQ1lIhhSTf9?=
 =?us-ascii?Q?wZq360ulESVm81oowLoVOtcv4c8ZFAqDvRbMU5uSU3aP2F31aojJtiylRvqB?=
 =?us-ascii?Q?ZWveoZiPbg2AmmjXKLY9itBd2StqqHpp07RFSqLSPr1UY18fjqoipKb1SwUr?=
 =?us-ascii?Q?OYzDBYUzu4+/DtesobuUklPsUPZj+RYOmhiF4D3snvZWhVrZRIGTDTyV2FUn?=
 =?us-ascii?Q?UbJK0THJ9FZ0ksqFPJY03w8yWdtFk0CueSP4mI4Zo1/qwhe4U0XugXIq5WzR?=
 =?us-ascii?Q?omRy5QPpFmqJcKentOdGfynfbA509UURyHkqyCcS9tr6aSkWGbzAU5pjl5A9?=
 =?us-ascii?Q?5nN3RFM1ERo9VpA7mFCYzRIj0+3oIH92CtdU5wuMO54HfJd2qbkmrlwXYvge?=
 =?us-ascii?Q?odRgIaigtXFrs0sI4UK+xoBqOemo4rHJthDXlN4rm0noLVsCZ6FndwJorEVE?=
 =?us-ascii?Q?1FqNmwHRAr55hd3H+P9hpGoAjAVHjU+23LISxtcb5IoCL7J3l/jtPQqcA4t4?=
 =?us-ascii?Q?NofoZTGOis7IpoBffgGcVfQc7QIvglZYS3ZsqFSEcx2FkMZbeH0IlX9l6ren?=
 =?us-ascii?Q?Y08dKMzxLiNihU3+jnCeF7go1H121kHRbJjKkSBRf5tHANWtUX/1X0FXMfcU?=
 =?us-ascii?Q?myMogGMt7RyOLMejvKaWFGWAkCx0lJF7zKiNxcGccdoOxOc74v5x1qhG1nKQ?=
 =?us-ascii?Q?HcQJc7qARzoJNUzCaYbqoerMUWpl+clGW4WYtvR0QCE6jneaOux4blob1eMa?=
 =?us-ascii?Q?bk9hiAb36kZ8uKhhCyToazg9v4scNrRfCwxEo6dM7Q8beBgJHV2Gzd6UqM8l?=
 =?us-ascii?Q?XhEpXhklKgYPsWkM5kTmzPfUtIfS8vEsbsXIzrHj/RDE2whntd2jOLy8Yhog?=
 =?us-ascii?Q?SIMM0yQEJQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de1fb44-c9ec-4d5c-3f6c-08df0f55ca3e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:08:45.0538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3R/5qpk8Rlhvjie24DxcXuKPnwQMfXDcxYGT3vwLzh2sVBkzsVNIi96yK1WuPx03rPpsKPFgJInwVEkv7Lzulw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6329

Thanks for the review. I'll send a v2 shortly with the helpers
inlined and the extra locals dropped, as you suggested.

Thanks,
Mahantesh
