Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012058.outbound.protection.outlook.com [40.107.209.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEF63BCD3F;
	Sun,  4 Oct 2026 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791133539; cv=fail; b=KFAKr+q7jUZeoP8ouBNj0r5vaD83KhfOxANfQ39VhBFnquqELsBAtafbqtZdOb34oVev3ALOx1+FdpfbAU+jHvcPS4QOHVS//UWui4Lqg2P8Tmq0jFhKckhZbN5/pyqplYc2z3AEMAkQUJCCaW0+zn736V58wLw6aVWnRerj6bQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791133539; c=relaxed/simple;
	bh=sFAR9CxkPyRxHjndCrG0VHJZVvWlmW3lGPLkBejvJ9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JMMSwJJsRsVTJFYyZ7yJuX3nDUezMMBu/j1Wndr9bIjczl682meapv5ZT4CqagyiZQj+JQTeMQzBLuvYxYxsZ/3qRJTsha0/yfcXOJnE1S8JOEbLCRF7R4+9wWCkq2D3oSgeum+11GcUp+Cv1I4QJGkDxHOhZ/eiyhR4KU3Abko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AXolQI/L; arc=fail smtp.client-ip=40.107.209.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AXolQI/L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjHZiR5b2AW8mj1+oI0UP65NeErLZ7qGAMT/HU1iqX2EFz6m6BKYKF3mCkKMhFKC05suuadJdl91znu57Kz+yKBMzWksTleIfWDNEdgSNVGY4UI1Qrm8wnRh6oiEvrj1jfa90RPJIo2n9qtBPdcFwfaVEsyCLdARjCVNOX2AXG0aJVxRPiV3KCm/fZR6AiIHCSvI9aAdfFgouPoWee9y7akHuXK5j19we+Vrm16Mt8xy1UdPAqRtBX46xp10a6izjb4YPVeFM6dpPKeyaTlSHqY+fYS5zM3vuUR+q6g+0BjvUcv0NFtL4rlK6HZ7P32N6zfNI8lvyZik8sVWll+f/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOSnEQbSde+aTmOB4rADTC0UGigWihMPXqGDx26xsdo=;
 b=PflOPiSYZ4TCwHiZEcQNRxb6p64sAI/AAQQKsqCA1z3eS42/iYEqCnhNVudT5eJC6K89VUtWBsMXgBAOIDuNR/Z7yWkE98LJzj63XYLCkaU09/uof1WXqpXK2KPTbw5MaYFj1kV9aCrVy8Rw6CuT6pdyGw2elkTHArYnHSnsBL/vuZG8kdWGSiq55O6Rye25MRBQJ9XjasMJo1ryYWiRRWC41yCdQW9osCKUBAxqnSYYemlWpJzuOsbRjSeeJM/dU+2EYkJNg7w2G/GapZ8CtLYNgqsnPY05gaH001nPb6SAcolPvzuzurZPlkZ1hfnjIMSOyZsueSzROt6c18ZlfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOSnEQbSde+aTmOB4rADTC0UGigWihMPXqGDx26xsdo=;
 b=AXolQI/LtLTnE76oGC6Rt8j9iF2eq9dUf8HlQMawoYYrYf+JYy/BjqnCIZAq7ck138m2OBdZRl7g/7FoQ+v+5O1xFIAIlGCUieHyWZR4QhyJCysunISdrH+31SIYKk4HR8qSMgSNZew5t04JWmdUgML0YJiVqTGroKbWsX3CITo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 BL3PR12MB6572.namprd12.prod.outlook.com (2603:10b6:208:38f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Sun, 4 Oct
 2026 17:05:32 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 17:05:32 +0000
Date: Sun, 4 Oct 2026 13:05:25 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Vishal Badole <Vishal.Badole@amd.com>, tony.luck@intel.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] EDAC/amd64: Set zn_regs_v2 for all Family 1Ah
 models
Message-ID: <20261004170525.GC2673@yaz-khff2.amd.com>
References: <20261002113204.3358815-1-Vishal.Badole@amd.com>
 <20261002113204.3358815-3-Vishal.Badole@amd.com>
 <20261003012238.GCasBY3rN9K8ps1dDR@fat_crate.local>
 <20261004151447.GA2673@yaz-khff2.amd.com>
 <20261004160412.GAasJ4_AhYcuacY6ZM@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004160412.GAasJ4_AhYcuacY6ZM@fat_crate.local>
X-ClientProxiedBy: BN9PR03CA0741.namprd03.prod.outlook.com
 (2603:10b6:408:110::26) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|BL3PR12MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba357d2-f6cd-48b7-d11d-08df2239b313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Aqv4f2L/P5KoZKDHrIOv2cYV1LQHofTRrf3RorF93Q0+XE8JaofTaeyKc/UP7KnakwP4KgWRoqgY2Bk8kJYD8lt5tZg6etuoDN0Sx/D6oEjjXvn90TfPcTtRgIUTgYtpyCDWAvXYGcHICJTOPJWH+yuuRjWfUCAUm5A4VSKYO79CudXkOoX/hvX54l6R2PbPLuhEEm4aeJqY6ruuJ1Z8rrOxTQurjVWhYQA67+ywV1KilD/QVdUEu3Vo4xJdmWD29VjEU8dBMj60SubbHdHo1dQYRfw0XnsPOWu9RMoiWju0GvFGsgI1E50/W5FUm1oxCO97V/V6pnw0Y36IEeAoOaaW2iddRgXdn7/zJxk2HUwyBtRvN5KX8bB6/J/zBoNtc0KbdFLLzmvc1FPvCsCpWaDMjpPBk1HCchRHSVMD9iVlXn5zCI5koI00DOnYcPSJm7jp+6vrkUouNk5atEHdqa66TqlsxtgzJ3bnns69GRmMETIH732Wlo0kOrqXRtS2Z9f80pRQQi6ayehI489MeSjdUeAvnzCLAx+swJ7hw4b5Mw7zFQDOKsERxqPs93o8cPzV6n5LJALAeEtvYsE533NcQM/Ix1xLwmrho3yNtYa+zc9h3jRWqCZyZSGLfr4DhwejxztWEX/3gEtx9w3xp97YA9/D4ZCG/r2u5yrfFXg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ii65VLpC4zzhJUh1SdbFi3bRgUXfdPwtf0or4BEwFlwfsJDRiULsvMnHiUGb?=
 =?us-ascii?Q?VMaLqoN4QxERgC7fsQmQas56XMLL9dJ0b/QZRJ/hec09PfBPoiZXkohx8EJq?=
 =?us-ascii?Q?Oay1yeEQzV9rTobAUD7eNTLqyM6r01VNjeHFC5b1oWpxoyXv4Xl5sJYJcvEz?=
 =?us-ascii?Q?9OLpHcrdCIjPykpTa09n0rA9pbQJqg4HkJ3MYTCYDArdFZf+gBo5a/lX3tf3?=
 =?us-ascii?Q?UH+vnXZ5lneoZ8JFlbuXDn5TdT/NZanCdi+QMvn8/z2gskNR6E/H78Yuy+In?=
 =?us-ascii?Q?hk2tqTWxHXe0YORPzWL2LgDXoSP41/H5KdfiInkLeCOk/BLtLw4qgSgQqKWW?=
 =?us-ascii?Q?fgK+CLjYCWCGpd5nBOn3VnayHbPAHRd6yO0nwHiYDv24troITmBKvlFZIWbL?=
 =?us-ascii?Q?jm2kzQMeDSlo9lif5X8AgeL7UwHIa19qPqfjgbs5gNg2qycL1NABV7xWr0UZ?=
 =?us-ascii?Q?JZyXQwDgG1z/MkK0RnvxliXb4Xc3hUXm1oK/XHh6xoQHMW8Y6Y8rdfhOVYiZ?=
 =?us-ascii?Q?n9AALljkBclQL7aFBRL+ypnvL6fWdy3eCPWuJ8U3+SzL9RR3afNFIyty08PI?=
 =?us-ascii?Q?u652I73IApDdvzM0voe9+3WTkOY1efVNPcQqVpzt5XQzMp+CuXYesuzd3u//?=
 =?us-ascii?Q?emqHGkMDq4FI8PX/2WCVGt3HlrfKHYgHLUkkbNvAiGqHcsTIREA7995VF94D?=
 =?us-ascii?Q?kbnxZWwcE7DRH6y2MNWbXsM6jNU17U3E73AlXgmS/amdgJSHetIWRp0A1Gcm?=
 =?us-ascii?Q?SMbgpzM3HitLIJLQkp638lB8KGtOyq2NbG7uMEn8+BRkUZOkxoEUW2kUVGM4?=
 =?us-ascii?Q?zPTQDo/O/P1qUBloWjxZjXVIxLHz3mKQ9TrobnBnWqLqYpY4zbIi+U3Zwi6m?=
 =?us-ascii?Q?66Tt8Eq6SkxtiDW5xsWfSnv2ey9HvVEQ5u2fqeTa7HzaytEuB8upIOjy22W6?=
 =?us-ascii?Q?tryEnvAjXWns1fbo2AvPl/B2pIbhVdJiqeY83rR98oqQEzY0Zy9RrMHdB0Uv?=
 =?us-ascii?Q?zAhN6A+ewP/tUVchvB5dX0mVtbAxYClH9bqWyQBEMJIJDXqqsKjRtZX7GCp+?=
 =?us-ascii?Q?eS86gmxL0vrjpyTpBltSami5jQvnTofDsGvpDdMhzHARdOfrURe3vm763FPv?=
 =?us-ascii?Q?GfBo2SpOCEmd0KYTUzJ4GGVroynLZ3xjFR6tmmgMWAY0TCQ92HidIQscSJG8?=
 =?us-ascii?Q?uRZatA/KwW6JrW+2j15WHjZCL13Ka7+evtx9/C3oT+KxUPONSKvgFcUKFZ2o?=
 =?us-ascii?Q?OcnOZlXrOtE7ztZiDBiSc4EKyQvQLLEoc79DcOWDKeyylv4/AC94q9SZbFcK?=
 =?us-ascii?Q?0D32tzOSdMAipxY1Ylr2tCdivWOtPpuJuDqEDlll2Vc/wLlBAsfXUmOfEDDB?=
 =?us-ascii?Q?Fk9EAEXtE4k/e4rqRSze3IDAv8Sa8u0wngvby2ZDyTGgFylO6sIb0Bg72Kn/?=
 =?us-ascii?Q?ueh9LztlIQiLNIX8SH/c4DdG2qUnRiPCjknWYu0K/Li/JfWFybVRKb0FURRC?=
 =?us-ascii?Q?0Y/wr9YqYhnrYPN03nE901TEZ8JeOvcEY4AJ2Wfq6+P/cWeeANcDUy+Zc4fB?=
 =?us-ascii?Q?9Ich/9EQE3H2BwGT6ywXNBl2YA8FX0mq/KuWlAhTXXNiwKgyo5cJVHDnafFa?=
 =?us-ascii?Q?v40/h+cA19SI1Nh0C2O8lum5Gpos7Lk59UIKxtfV5xsJWwKmFzER6RIKnikn?=
 =?us-ascii?Q?nMc0NT1DZZ7SC5emhVuNvG6ht/En5hNibVLgJ7QGu01Aimaw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba357d2-f6cd-48b7-d11d-08df2239b313
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 17:05:32.5412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grFUhNXlZtDevFeedM8H7Y8NfzgMKfG0ykOsGyvAkSX3hMFUGSGvu6zBAjqn/HLt/yxjS+n5ytTQCHbpWI3DpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6572

On Sun, Oct 04, 2026 at 09:04:12AM -0700, Borislav Petkov wrote:
> On Sun, Oct 04, 2026 at 11:14:47AM -0400, Yazen Ghannam wrote:
> > Because it becomes an empty case once this flag set is moved up.
> 
> No, models 0x40... are supported. The others which are not explicitly listed
> there are not.
> 
> And no, the code doesn't enforce it yet but probably it should. And there
> should be a default: label for the models too which returns -ENODEV, like it
> does for the unknown families.
> 

I see what you mean, but I think that's a bigger issue with the current
design. And I want to move away from that.

The current design is "opt-in" for each new model/group even if there's
no technical difference. So we keep having to write these minor model
check patches just to load the module.

I'd rather we load unconditionally for all models with the same base
behavior using sane defaults. Then we can have model-specific patches
for variations, if needed.

Essentially, we could avoid a whole class of patches for derivative
(client, embedded, etc.) products. The module would load with the sane
defaults. If the test folks find an issue, then we can have a
model-specific patch.

This is how we've been trending with AMD64 EDAC. The family init has
been shrinking over the years.

Thanks,
Yazen
