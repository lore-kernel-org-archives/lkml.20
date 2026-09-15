Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011002.outbound.protection.outlook.com [40.93.194.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846A730C15B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789510822; cv=fail; b=RcIAlcTHgw0zsjI9Hwor81IHgI+FbaKFZQbfasZUvI1+1Ur+ANkyGuLD0TJCGj1+8BIKv2PpxqlEKZDTKiuY6f8v1gy2ITt6MouCaun80R0qbuSIiRl755IlPhRoy5y0g0QBXoMx4HR5QdousGe4rzufIBLVzl3IuKYQpVkLpcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789510822; c=relaxed/simple;
	bh=RDlQfBUMe5itvkGd9vdIr7i0A61D5UG3HDWayjuOviA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K2zFGPkckh3ojbjBu+fyAU1sVH+d9XtxnbfNEPJHqwKnkdctRYQkXyXqtmCL6wgqkYJpVAedyMUvhH8iGV++tqoswMZyllDimyA4ycaW/e8QBmPC9PrbVZhjYqctzAq3RP4Wcw8aUxW7oRyvMtgaqRWG/KUguc1DYDnG2L6bvqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uB4iuqqt; arc=fail smtp.client-ip=40.93.194.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uB4iuqqt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XctqHMY4lXHRCyKHo9If9+ViuZCh+KuCqRWXlOEG6yq8oq4cRYW0tYSgFQTZ754LgbqjEy0xqnmaIlKlfUONBHVMdf4uooIeD9JWuy16QKa7DvC+rOlo0Upkww9O6pghZwYoHetkMtQf8ASK7ABpGg4OuIp6vq/gwkhymgHanM/+PpQ1uG7FlxKr9ihPf2TOe5UbqCBHNyaB9H+JaQ0B2mreLfd67mW0tTkX1c8Ec0T3uC9AzcDc8q5asPbXDjcFNDCPWXT1HyTJdcTWC5O8DwWU7NL9w7/e5ui/yexaPKn8OxmWWdo/ZaHIm/D8qcz5ext6pfP2+OutnpvxQZBQ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UprQMhuI47h86AZoil/ozJx5g6+byGbchCNE9qhj874=;
 b=rCVyc/du6iFaNRlilYAd4B3njREh0XgW19dw/706Ia1l+aRH6uzJpn1NUS377fwrxi6RqQ3CadnzeQKS7QWw0RYZf6nf1I+wVD/JZWZD3DmpXl7Zrw+c+nt52IsYxwhXQi25wgMaPmuL2qqKl96+hufb7wSnZiHWw31MHSjKOllXWrLvgU22yAKSb+raZr9yeHb1i92QKdaty4fAUUrY5bq3LvBvOlewx2BUcZdt0VVM6GMaM4/SnsZag7MP+Fn0f4zrq1DuN1oRTFYOwA6FIVhtDhmVXkfRhRINIPvpshm2GCSvhygZg27U5fI7xt2vRySJ3+sc4syR1U6wtZPi5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UprQMhuI47h86AZoil/ozJx5g6+byGbchCNE9qhj874=;
 b=uB4iuqqtV7RcFEHO6Zinh7TQIk69gUvH/GVUkJXABs9qyqCV5+8iAKveSnBRYaa8+riKJIWoNbhMrxyXEnqr8glVpFJe7ncyvmnbmcfWB++h5qybfoxKnV+QOwARavwxwrTpa9ViHEFiRZRAYKeXXMTNhhjJBnVwfzSeaoZWNv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 CY5PR12MB6153.namprd12.prod.outlook.com (2603:10b6:930:27::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.12; Tue, 15 Sep 2026 22:20:18 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 22:20:18 +0000
Date: Tue, 15 Sep 2026 18:20:10 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: yolezz <yolezz.secret@gmail.com>
Cc: mario.limonciello@amd.com, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] x86/amd/node: Release reserved config regions on init
 error
Message-ID: <20260915222010.GA3101@yaz-khff2.amd.com>
References: <6bd2cad5-65ef-4f3d-a146-d91f120c86ad@amd.com>
 <20260915180543.112708-1-yolezz.secret@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915180543.112708-1-yolezz.secret@gmail.com>
X-ClientProxiedBy: MN2PR22CA0011.namprd22.prod.outlook.com
 (2603:10b6:208:238::16) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|CY5PR12MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: d92f82fd-caa5-45ce-d9a5-08df137785d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PG6OXSCPockbli2Wo3jjKjdgQ3TUKIOscqUR8fiR/Y6ZzzfUo8qNvfSy9aNx0xF8n3Pwh/n7RpJloCKTLOf7Zw8VGNPvP0cahVKz2FzwlnNwEEEaWKgR6wAQewAyRfg99huU7VZEVj2YfiRMMiCaKYGpOkcQL/mPo2e1sVm9/aAtDqCXmliCKspBEqKhBZO9R8Cubywp3rhD7W8e7EIUallk07dYgMcUDzppwa0cS1BA+mDvLj84unCrXvfwEkynYLU+ckMdcxtgOlqY968trlMA8wiPep7lM78BhWsJ93YOaphY6VPNYUvnO6Z3TufkqlqUBIlhae6QH80YmHk1Wmqki64+xdLctE1FWPxhwLgr/JL5IfzmvMrS+axpljb7xdLTe5VI8GVRVscfAnsNLmq2s/GfIUd/8uBtNqWzJihO9zNsqyVLT9RA2ye1dg8ZJ2bq+eac6cnDvgSBrq3JvEblVFONY3FPnNcQJE1Xr+VSdkmdeta6IL/ytBHjWG+JP48u2kxF3CrKUyLiqgpgABheFxx3ktecKp92OSALVNFQZ6bh1Fl1f+zff91rG0sIR5CJytafGUm7NvNpDM5PpsA6fyAyatGRn5AkaSa9Rczukpaj1gScKSfG3x+Fj+8B7diOy9bvsGLpACOfFkC+ZJXrdxYR2OKNH3QmujvuIHY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?//GMXcVUWzhmP/Dcufcbg5Um28tsPikfQgFj5sHzk3WECsCewhBuPvMvgliP?=
 =?us-ascii?Q?nXMinEDZ/8Yl87zYyM3wId6ZiZdWW3fpZxcXrLq0FOn5YRWK5fZiYamKJr1f?=
 =?us-ascii?Q?I74bltt83tVNXjBeObk9XSOEvUoHmL2l+r5QuA5K6xkrUsflX9A+RhkMGD/y?=
 =?us-ascii?Q?rgkuAK6dUehEJAUYubgtyKKlp9FFWIJmIJuMbHakxr7npaXCU4YO6rvO2tXb?=
 =?us-ascii?Q?5syNtFNz3zedk/h6F6uzBrS9/mK0dSxTa/Wf0xSurWQz8BnTbwCM/cZsF+Wl?=
 =?us-ascii?Q?uKJA5zwwO4KSAZDwWzorMnBrKPOjqX+Z+UroKh7p654vSLZ841zP2T02YO4t?=
 =?us-ascii?Q?msjb23vBm0ENufEfTylNLINx4ZEiuNI2nJYqLuEc19n39Jlt04eJDHSQGiiX?=
 =?us-ascii?Q?2cnw6n4jM56ZI8sI/GWzOlxk1CerGEI+LN6/tHKz4XfrmMPHpsbMfVpeHNfU?=
 =?us-ascii?Q?Vxxv3VCaXe+pQO4iWtQq7J0hJpRplv4KDbhmFWKU3E5QS6UYOZtxk4xbyqvO?=
 =?us-ascii?Q?tiqBIg7sZvdaz0mKEfQmjSb3Zb/uC5ximqv25e/FsFyUdAlB4C5griIjxbdz?=
 =?us-ascii?Q?Te2B+lnulzCnWdoF2FADiS4kcVFuBHF4Anpe8Ri64PpxpDEpGUvGiqVsO90a?=
 =?us-ascii?Q?Qq3QuMX+4xz5wPWim5EF4aEhs8+G2uexou4JrAPDI3xAXG65HVhL7YWZFXAP?=
 =?us-ascii?Q?+EdvoMB5McUr6ydktDlIIAvQ0Zvehrqv8XNBVKD//dVYOIKiimJcV6CWhT9i?=
 =?us-ascii?Q?ZRNYJelODGjDh1KTbLJekihjdb2/92y7StUycOa0fu9HY/8wy+R52QVTRw4L?=
 =?us-ascii?Q?dpoFsq73eVtWW27Gx7PsB6MX1gUIAVhpqNIp2nM4r38GkAjLMfDniJJ074Rq?=
 =?us-ascii?Q?uEhHjQ2evDTnZHszef+qgrHVhCIbHHi0FMhPQUSeCIqmU/8d20fgzcChAZba?=
 =?us-ascii?Q?R63vnB1fd8ekTbfK+VbvWcOoQJyxgPHDQVyj1cdPZsRHWgWueJxPMDoT+EOI?=
 =?us-ascii?Q?BcxoYJ2S1MsfQT08Yw7trv6+gYQLeeH09Wk0ofB0bfAEKD+UWcWrJMMJhVZ/?=
 =?us-ascii?Q?KfRkqsFeeWhD15aKivgtVNSVeRjzGLbSXz9rQnSUtHwUrKu3sZXIsNCuKD0S?=
 =?us-ascii?Q?ETE5+WhHa50lmmTNQWEw+8EKj7BzCAiOd4/1h258SVo5DL17erEfjvzXYfRF?=
 =?us-ascii?Q?GJTr2o6bZCuGfwBvrbRxgasa+KvP03PtxPcEcKGy5j3/vY+xX3vZsQIPQdIg?=
 =?us-ascii?Q?u5FD1Thft/lazvxBlhacg3GYRjMDSN8dekfX+t3m+7yRz0AXt3e2xbQLnP1y?=
 =?us-ascii?Q?j1Dtt9AvfhRA0Td2y2Bd0DRflwkd2IgSoODpOsuAHMHiwunEuQkGnG/cXj5N?=
 =?us-ascii?Q?+5nZWiYziufFqcXj/3rys9+5+e4BalPHjvqVZ5JWWPi+qdB79j9N6L4A5J+a?=
 =?us-ascii?Q?BsYX0ABDZqt84ga9TuD/DbGDBv7EGbI7QwjYTbRcdxPlmi+1rDbwXZMScpK8?=
 =?us-ascii?Q?XZ+C9IFMmAjhfkF4mG6fwwzYyl80f/n01OsifThqTYUVAWQ7bcz1lZCmIZCw?=
 =?us-ascii?Q?wnbCXbW7j49oEi7Bn2Mi4djYh4eg3pgfB5MYHbyBzCyIXXe2/mDmL1TG9VRt?=
 =?us-ascii?Q?FRzKi7AwPQc1Dx/hQBgsDjlRjcp6eMUU16VrOS5s6SEzWxfoqSeA3ggipLMT?=
 =?us-ascii?Q?44+ZHKpH4FxIyQDIAf3qC/TUCvMRKgbgPnYT/tx1HMXlm003?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92f82fd-caa5-45ce-d9a5-08df137785d9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 22:20:17.9356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQqj/OKZ0qcOQTGXd4oE9jaQdarIye5lfDCGZj4/1Is3FwED10n4472h7jGCp6993iUCwxxmcTtmEdCYy7CHCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6153

On Tue, Sep 15, 2026 at 08:05:43PM +0200, yolezz wrote:
> In amd_smn_init(), if pci_request_config_region_exclusive() fails or
> if kzalloc_objs() fails to allocate memory for amd_roots, the already
> reserved PCI config regions are left allocated.
> 
> Use a __free() cleanup helper to automatically release all reserved PCI
> config space regions on error exit paths.
> 

What's wrong with leaving these reserved?

> Fixes: 83518453074d ("x86/amd_node: Add SMN offsets to exclusive region access")
> Signed-off-by: yolezz <yolezz.secret@gmail.com>
> ---
> v4:
>  - Remove unnecessary braces around the kzalloc_objs() error check (as suggested by Yazen Ghannam).
> 

I didn't suggest this.

Thanks,
Yazen
