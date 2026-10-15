Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010029.outbound.protection.outlook.com [52.101.193.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C863A5438;
	Thu, 15 Oct 2026 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079378; cv=fail; b=njM7jN2ablOpVlZP0JtC8+Rk+okQmgI39VbHOu/Ac9yBkc8Vli16t5Osz3cWJYkxRKMHagIuqnBIxyP6aPwtTai+gj7D+PIpDZza0H8CqoDivh8utySB4i2FuCqtfL5IxSjvyyxdxqbsRGIRKBFBqA9Byjbn0Q1Fox1jPDpaNdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079378; c=relaxed/simple;
	bh=jiTxgedhJNX0rFl14z8KYYuT3fwq/zmJwmT7JftPQPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TffqzAiuxL2dZgUwuELYLaCiIS5xcaUO/Gcxzz3QzVKB++JgBSBGt8D+vDIya4Tj6ZAK86+HNjIEurpC5Lf7MMrKwsa+Gsyujd+fpFT4BBXy9k/EAoWylFSmXviCBRruB2R1pmyM93lgvYuUtz0jkqFAIgFlspQazUkJ4hqTflQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Z7XrG1AO; arc=fail smtp.client-ip=52.101.193.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Z7XrG1AO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yK/2dzOfeYZQw3pfdvDLrbmQdelg2n6UIMFmeV0tMueDF2hDMyrF3AsP1AjeZMEmbLrQTtRhi3KgCOAeYWY4Os8SCect7TZAm7W1XPaLnyz2jJABZiGUu10xJ+d1SM+Tiy2Rh/LnZTAp00H9oRUA4Hefi+qi6BrvSCgY3LSouqAWXbL+XiUR+g8+dGiHpqDFiI7pYYSfVcxigedZ+ss8h2eOXxx8UQm8x9awVDLTvLe+xYfHpVTnb/+eTk5yoK+9xmt8lzGEM0PRQrZVx0EKEj5IuEpd6oYi1dPoKueYq6S9cvs6LUBIta6iEeQ5LR3gUTWx7aQjCxUu+t1yFWM7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MmgtwTzn5EAiHTYdXQDriMhJUgSmhyl+4tJDQtu+GM=;
 b=VJp8JIUL9XsHhyfxT6pwu4LJOIRNOjp2hj3aytIQ7FSNtZabEflfwsaWMGSUU1FdXKm0ogu1r3WrAh1QiTH4J3rPFLRwgoBds5WwEBx4uK3aC74WmWiLuM2gv1hpSkXo16s9iJDEYmnsluseVzEV7RKDnilyLLa2wzPFGCHmr+cIndWSexvCDKRsTdrfVrq1AicRuMJd4oPVW+O2v6e/SZ6g8tRW/RGtc3x5I5Aqx/JTbfkPtVxkmioih0LWIZmmC/N6nJteSutZlYBtjbArjpFKwYydj3ypFXXtBzREqjGgXvm9gpJR0RW8JlOJhUZ1ZFCpSjjODOaux4Yk8DpLKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+MmgtwTzn5EAiHTYdXQDriMhJUgSmhyl+4tJDQtu+GM=;
 b=Z7XrG1AO2c8/0Vp35sH+gPnIDNrKerMQDDbRRBv17ifNtH2npCHFLN6an1uRjJzzOc3lRG8fECzFAXeQO1aeDQPg8eaZGNxvqtkbuPtBqIee1WKUXTD5dm484JH0MUpDJlZn1yXB4j7dNty8/AsVFFtUelH3yx21CGhdQa+wANo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 CH0PR12MB8551.namprd12.prod.outlook.com (2603:10b6:610:186::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 15:49:13 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0522.011; Thu, 15 Oct 2026
 15:49:13 +0000
Date: Thu, 15 Oct 2026 11:49:05 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Vishal Badole <Vishal.Badole@amd.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] EDAC/amd64: Consolidate Family 1Ah model setup
Message-ID: <20261015154905.GB5279@yaz-khff2.amd.com>
References: <20261014085720.1471993-1-Vishal.Badole@amd.com>
 <20261014085720.1471993-2-Vishal.Badole@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014085720.1471993-2-Vishal.Badole@amd.com>
X-ClientProxiedBy: MN2PR20CA0053.namprd20.prod.outlook.com
 (2603:10b6:208:235::22) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|CH0PR12MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f83ca0-ed57-4a93-e3dc-08df2ad3dc60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ShZShVmiONFlzdI0QnLO3gvGqP9AXGUcFM5Ygh9JtI+tdYezr2HTDnPkDNUBQEICHAct7bNuDK3ggPMB5ho+15MsPBS41aP+H/Z60v/WzvvcjmvtrYiKPF+t7zXjTaiGLHVSWoP0kZikVxORLh232IUA7YIDngqiRJBPjfLwaZVg/5k19A/dYO8+8WtL/PQ+AI1YyuFy/spci02Ua6zQuZfGcIMgxe/GAzVwpgF0TL5gPafravKHOHkq3LNA+w5tA14TxEKwnd1+LH4Aeph7oltdZLLeEUgKwpnLfbw9EVE/8FSxFpvKe1wPNl3yOl4seavuHNPImxsE15a054ECey6jpvmwjbcqeBGNf4h9S51vMLHfJ4hGn+XX8Ed7yE4vi51MvXIlRIUN2Mra6EVdgqgHDKI/7DEQ0p5xrPJlC1RI1rJizQf8wSbSdun43iK9i+59tDbDAqKXC/UOwJlkVz3Z/RbQ0JH8hTNYBHqk1+Fi8h6f1Z3Kwl2KIoxHjxmTz4GNdeiV+TJP7etCKna9LZN8QA/16TGPC0vJkqP11UzauGDNuCA1b0Bu+S2HnB4TkGJnsIbydpFqe6UiPicGbeggKHJFPzrPgMzIO+2KhTlGwQTDCNQPAMgD72HFGimWmqBIVrhLD/c6ljQcs9UD4jLrmVKTLOEFNmef78+RgrE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qjykKJy6/s8u82WKzyQIqm/S/s0NQdwNwXiHG20RoppRwthVztrdmNIoryoP?=
 =?us-ascii?Q?2jwWtMse3mILAcT8rMBgUgj5YLOjpJ6i5VqogCG8RtDMQW3FNYhKlUlkGxRY?=
 =?us-ascii?Q?wIBR2wi28Mv7e0te4Q+Mf3XdmkbRio9XH9fGPnPm8drpZN3FdQhPXe+jYxFS?=
 =?us-ascii?Q?al5Rztydp8lYCEfv42oQwIzRwXTPMTS5ZCE0O8VVDacNRiL6eHwc1AHotajb?=
 =?us-ascii?Q?nQE3lE96lbVkoyZr9doHsx+PRW6PtU7cuXEaUUX1Ls/E1BKdU2zZHmN+y+6S?=
 =?us-ascii?Q?myqtJqg25rxWMbJKcAbs89ohc4kWrchogaK7YHKBqkTcQYM0r3+W0EBUu39b?=
 =?us-ascii?Q?806pDZkbEGfMkl1N+zcC1bUhBLzdxyBTr4nsAZPNC5HspR+tHMZR9EVqQ3+0?=
 =?us-ascii?Q?SbPD+HVfp1QhpVDjT9k3jTrSQg/SwdyPsFNh1zgXoxMgMSRXjsEykZKjFdSV?=
 =?us-ascii?Q?VNkCsuNNhIkjwRVXKpED3MKER2NMtmcP5Q/NpoqoLABtWceF8X7C5tjx/lic?=
 =?us-ascii?Q?G7YWbZeR7+bTlCHuBfGWn3Ax8uKVfrfLKQQmeRDjubadOZLpmBWFAI4ACxXQ?=
 =?us-ascii?Q?6xw1AnKPumc12WbV9U7ynXAXlojPkHXxbepXwECuCV1n2Q9PV3tO0mEGnym5?=
 =?us-ascii?Q?3mdA43+DMFrKKvTt4Q+d2zFkw8RWdokLG0ErgzGikexy6da8J7YzwSN9/SfF?=
 =?us-ascii?Q?l0ElzlK+IH3ECc27X5n/iv96CB/YU3UqPk54otBk+rBnsjvFquRgNSf1w0nD?=
 =?us-ascii?Q?8QAu/JKQNBwieTRXT/V1oFoudh4D2wQnTjdBGpkwPxZnQ2RYGz5zouMztTPo?=
 =?us-ascii?Q?RCWO54XLFL6OZR1WmxKA6aEWklkw4IDcxIQZBbooXKdnKTgH3fc7e+KBzxPy?=
 =?us-ascii?Q?xzwgjeEeQkZg97WQ2Vnm6kRMmi2vk9KPxtG+TdqbAttirbI/xhDfolKufGMh?=
 =?us-ascii?Q?P1u1/f/Jm9Rw2aHYI2qVoAWoczQwD/ROIqQtJ3A6MDoEOyEw3uMwQ5ScFQB8?=
 =?us-ascii?Q?lDebU1YKYL9x/WCnLy9wsR3yjcE4euojD3mjGT0PyavcBANeBMd+d+O8OEwg?=
 =?us-ascii?Q?WKAOE4ZHyB+6Rd1MWKz7TjB//e52p9SjMt2FPWOLiXjIdIeeSQ5q9TjKzqKy?=
 =?us-ascii?Q?wHSdCUX7CC/8VNakklgYcFUgf+Vw2EY0F27QpqvBmY2VdsDiLMOLFPq9PgUz?=
 =?us-ascii?Q?RwXeSCPgvRXBx85+mo3L5hGlsedasqHk+uGM3R9JpFplYtU+tTyMGKoj8JZQ?=
 =?us-ascii?Q?fUlV9YlAWEVRpat6sI3leOYuhEp4n7UIM2HPVwkgYUFwKQhspwaBdvqjpLWe?=
 =?us-ascii?Q?uXMZCnYMoQpkWaFATlkcFkRQAaS0Fko3eekoQ6yrj61eTJ5Mi1/xBe3kr7ME?=
 =?us-ascii?Q?W8O/gwhmgVQsM0KYFfXt6f6HCk40UbyhuAxsmHuLMpw5gw0+kmpt5Rne7oqF?=
 =?us-ascii?Q?D6Yka+4TD/UjnX8UV6nIUPr94znNzJCGWYnhfFDlSEx9ZUISToPrqRy7dH4r?=
 =?us-ascii?Q?A3LBafrLn6C/qP0XTE4+TyxGvLMHm6oOcbK4QrJuIKAN0A55r4f7llwe6iwz?=
 =?us-ascii?Q?KtHBfEfy76QxcpMAkS7ZZWZhzvUPJlyRJa51Vko1MBNquhYz+6Y0D/2FMibP?=
 =?us-ascii?Q?3N9MA9nUFxqlmWIAE2iBnOVhfBqDP/SX/YcPHnmadvi1PQPD5qCoOn90LYfF?=
 =?us-ascii?Q?R/1bU8MWYh84Y5R5eqN0dEY545v4168b5n6bW9DsiINJSy3K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f83ca0-ed57-4a93-e3dc-08df2ad3dc60
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 15:49:13.5228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nrNGtD095/OzwXBnovc9HpACo71K6EJwKKCHvLN2z+tKyDYVKYzbK1OBIkYQzXf4qG5Xql4AnzjE5Ee4G3cqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8551

On Wed, Oct 14, 2026 at 02:27:19PM +0530, Vishal Badole wrote:
> Every Family 1Ah model uses the v2 UMC register layout, and the driver
> must select it to decode memory errors correctly.
> 
> So far each model had to select this itself. That is easy to forget when
> a new model is added, and a single missed flag quietly breaks error
> decoding. The driver also had no check for unknown models, so it would
> load on parts that were never tested and look supported when they are
> not.
> 
> Handle the layout once for the whole family so no model can miss it, and
> do not load on models that are not known to work.
> 
> Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
> ---

Boris suggested the 'do not load' idea. That *could* be its own patch
and apply to all the families. IMO applying to all families is not worth
the churn, but splitting the patch is a toss up to me.

Overall, looks good.

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
