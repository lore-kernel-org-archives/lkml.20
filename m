Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793293014;
	b=fLIcQHhiBL6P8wJ6GS87yNKalUjwNW55Ni1DCJ7ZCh1Hiyd9ud1oAf1xjRe/GqpzDEbt
	 CrX8OwSn/2tbdWElSrWcl6u70oKcFukfzWoB+5MqUsF7PSxUAPo8ixiRXgeyK+6q8xuJG
	 PgdKnACn2jIF/CM530MiN3J+4b5hMBNTR2WzgADnUMG8h72mV1f1lNXosmBgX+EgWpLzF
	 mZx2Gc81gMAlghwkMt/2RTMxiknGL7awsvF7YAAWIx4jGcXeJvgI08bgPbnlDae2wDeOk
	 USRkQOFvLu5zjHUcVRCDVtrrgMfyYKNVnF7Tsj8YXXbU/AzVjDwKklZ2YP3NhSe5tew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293014;
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
	bh=+cyYJXCHRAgzhHoI3soyP3D01wugxufJJ4k9T1yv3oE=;
	b=t6KSlEBddO+MbpKeZxMsnPp/9FdCSb41o6cXA1Ld2qvDtlpIR+szDXRuA57vE0K4NgTz
	 lGXsvOCLf8PJ0KMtcvOyi8dtvUwxkq4Rp8feCIocNXiVP9kI3cGjnvF5FeKWo1s2/OOb/
	 wguF5HDUZK4yh5ogi+tLxWwuWRXCdJuWkjC7HKJFER0rBc3rB/3ieHFgnIGtA/e79H2kG
	 H5YmqCG0npNCRvTpCa+svPq7HJGv6CwfDLRu+fD5stmO42wdcEWMEh4mNwyOEp6OemFlw
	 R/nasl0jI135TExSsbE5jBjuJOmWq7sc/nMGpznFVCj2lXuzucOvM5NRAk+4t4DFVOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1YD7cru0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.42
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012042.outbound.protection.outlook.com [52.101.48.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F49606A31A;
	Thu, 29 Oct 2026 16:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65F49606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1YD7cru0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCjUmhmQRvfRONRqxcO5YROwtwJy6GUw1ODtj4PA85zhSX3+ZJtm89/6M4TplVr5erhxCz/Gj5o3QN9JexW/JiimHiwL/cPYmhEWdDR5akZFLhgf3szGWz5aa1tdIwJrJGG8fChLAMo86m73kXWI1mpEiqJchz2j6EfopTHyNxJmo+L9ph4edPaM1FedBz0juKsZtMYEjhxwPD2cjEvE8xRNF2q/bUWPnzjAChp+jRiMNcNWiftpDI0eWn1+cyGPmC1hDTej3FAcUCGdfsrdsPHpMKuYPAELKZzqdJnTHV4DIQD7vP4bhjCFYMBYbfzslwMxVLYNXFvh3OILNEon2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cyYJXCHRAgzhHoI3soyP3D01wugxufJJ4k9T1yv3oE=;
 b=oLjtf+xoAxYd9jvLu3U+qubIAQS5CQCp/QGXTCzz8VTxrFfGsY+HEqYhDbE+j0UVsHwAVayZ3xt1XvKQIVk/Rr4T9dViwFL9f+Cq0j6tbwCMJidvVJCJ5gPI+hscNSdoXw/032/TctZcDEGyH99hzeZpAWVoI9/1km7livNZi/LA2ofjUjKFgpk/tZzzrPsk5szY0ZRTwmMLwDg6IXM6Fev88j4OGWNsbKgKtpGocC4Bd6TCGaodfpZoq+4Z5oWja8Xf585lrOoVDDfCVax9xfWGcbBkfcAQFnp55dGDg25b5YfVVwJxjzm1sRKm534WPAlrjQJS/Cnlifxy2ULamg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cyYJXCHRAgzhHoI3soyP3D01wugxufJJ4k9T1yv3oE=;
 b=1YD7cru0A3cphKAqib3eCTpTc8JG76ubpDsyUWcKEIWV7TOuJ5ldBlA9DcPv+MZH2WjFZ//g9Q0qCmBqmt3k3w8aWwpFORKNQL6qDx1ARrcWkwNjwYgeZCjJ79qGR+Uf4iH80i5HXVYOhspBLbNJWsoZnuP/pHHLAt+aHeSS/ok=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DM4PR12MB8559.namprd12.prod.outlook.com (2603:10b6:8:17d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.8; Thu, 29 Oct 2026 16:56:47 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 16:56:47 +0000
Date: Thu, 29 Oct 2026 12:56:36 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>,
	syzbot <syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, peterz@infradead.org,
	syzkaller-bugs@googlegroups.com, Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org
Subject: Re: [PATCH V2] x86/mce: Serialize sysfs controls against CPU hotplug
Message-ID: <20261029165636.GA5110@yaz-khff2.amd.com>
References: <6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com>
 <87ik58la9w.ffs@fw13>
 <20260817235553.GAaoOfieqJBZTsAn3N@fat_crate.local>
 <20260818001840.GBaoOk4Mz_mmZYK2rK@fat_crate.local>
 <878q63lrqr.ffs@fw13>
 <874iec22sf.ffs@fw13>
 <87y0bhy5h8.ffs@fw13>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0bhy5h8.ffs@fw13>
X-ClientProxiedBy: BN0PR04CA0155.namprd04.prod.outlook.com
 (2603:10b6:408:eb::10) To DM4PR12MB6374.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DM4PR12MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e5060a9-488a-4a38-8b16-08df35dd9e60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|6133799003|261028144727099003|56012099006|261009221727099003|11063799006|261022105027099003|4143699003|261022075727099003|261021123027099003|10067099003|261021121427099003|261026140227099003|261009221227099003|261009223027099003|261009220027099003|261009223327099003|261026121527099003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	IWwZYmi5Ru95Ay5VXWjzrZzUTa2QR9VCb+m/BOMaok6qG7s9KxJjeoFsuRM/pUzECSL5cOlndY6MdcXtW84zDIMtzMokahbYknUJziu8orva5fQWRTMYxaeRtl8dPmnNqCd7vsEV3pizOu6gr9bPEzi4pnMoAM1HbN5ZYUmC120FayCQEciEK3g1Vb4P8N1gBL4Q/HTXiN/yHgPLvkN0bf7/RmjR9eFyysWeJ0Lz+9NdZldKQzy8pLQ3B1+4n/iUrxWoMz/GmC1swEg1m/0KqS8czo8egh6DHOXnz8YtnVneB5TQX/91vkrO1yitE2fJdTljHy6QRpjmD3UimTAMbcs5Hes1QmH5+cEf0eqnzCJhQwaQ6zIDcB1u8mpGoxcvmcVinJkST1MiNYCVW9+CEiizNVr2R+zQOWTFqceNoJV/4KVUTuljIvBzYcaFtjz4LyymTGmLByEB8DrscSkXyu/RaAOFSfzL8NoxgKiTv0bvfXYF+xfw5t8sJu9SGroxQLcF+DgYh4I3ggrtExStVYI9WhFJGo4vsmu9Ioc8LxB5mU0w57fCYMniL3lA6aAb/I5Lgqm/Ei8e2A8Y1kR2EmakEVjyEsDeVYUd7gQNKhaC8oI30ZCQB0ANCfOnz9U6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(261028144727099003)(56012099006)(261009221727099003)(11063799006)(261022105027099003)(4143699003)(261022075727099003)(261021123027099003)(10067099003)(261021121427099003)(261026140227099003)(261009221227099003)(261009223027099003)(261009220027099003)(261009223327099003)(261026121527099003)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BddblfpEoBzg/gfhHHIf7cimblrLnjO6AdpN+Qtrr3A1ds06sd6Br3HIGsY/?=
 =?us-ascii?Q?Bn4wX666lKJqzniJ5f2a/Z9bt4sjsv0NCoAgRjiaBnI8AycqlWmIUqEKendw?=
 =?us-ascii?Q?8/MCbea3cYVh3ov0maKM9Tvg1m4gKbUc/C4D+xmUwT3pUmLJkwF9RidIIeZd?=
 =?us-ascii?Q?2lBDRmM6W4GfEPjzaZqZF8Sko3ELdcbL4tY/Z/lf7HygiIKDrLUILdUOG9Ls?=
 =?us-ascii?Q?3Z7XyBNi7uGYLFlUU3zI3zHql59kpGU1/hWM8tx01V9JB3y/EJACDbN7eo6e?=
 =?us-ascii?Q?zF+lDx54SuOpa8BtEmIvv79hLz9araMgOp7PIZUmlkJVGRYw0YeBeLJe117H?=
 =?us-ascii?Q?c9GBT20Nelvk/E7vxkT0mynJDHD3+OuWKUEdKSGmiY3FkdMaQuIVNs4YTzUU?=
 =?us-ascii?Q?mh2NlAGBiNnBll5GlcaOF+jBosPa/m6pBotbRe2XltWe9hqBebqwOT0x4B4D?=
 =?us-ascii?Q?OStl1YZnJN/QWv0R7yW3AANx4fpox7VY80wqTlazfyZM8/Bwq+SJ16Th7X1Z?=
 =?us-ascii?Q?z8ewNf2kJ/QZfx7M8S2qLNlETfOTVGHct1Z9wczxGjxljnBXHZvZdg8AimK8?=
 =?us-ascii?Q?tyMCs/ppRLVLR/+lYRYrL1X3zN+gh6r4e0GPerhgh8XpP9AeBQCoDx+E35LM?=
 =?us-ascii?Q?hLHSFxZabzybliC/JKfx2JAV3cI7n67drWWUr2VXIYl/jpPOJ6cRnM4PcNIS?=
 =?us-ascii?Q?KW9qUPxlAUOvGr0yURtZRk7cgNxm0laMMPAI6wvASlcgJv4D5V3Of+X9+fuA?=
 =?us-ascii?Q?WlgvDyj3GCDtLHobNNZePBn4S01dJzu3IeRulJ2nx8FTLSuiMDMftLqGD96J?=
 =?us-ascii?Q?fodx59mRoXAcsqv24PWgpertBgvv2taaqU4YPETedv/C/qoOeClcIfGnAzx/?=
 =?us-ascii?Q?Xea/o/nyG4EIpW/SwQoJxKU0N40sIqqbiSuemU3LqR+93iGNQvo7wf0Wh4kv?=
 =?us-ascii?Q?DZjpboHWTc93oPskf9p3YnfBtCdjQKTW0r6sMspleuSkBKjO7J7xyZ7FoIR6?=
 =?us-ascii?Q?InJ25zNG77LLvL5w/HcKXyxmWBql9FQ+O6ItMKH7dZAmGJb2xSxzU6BJZkCX?=
 =?us-ascii?Q?zwpykqi9o6lAyYcAYyIymLCvOvire1ZhscWtRNJtaO1VfK2aRX1IX9QE9UVX?=
 =?us-ascii?Q?azu9zXhOAncYdqGtvw2w5Z0rlYXQexN/JqyfJYssD/jtPteT6lrRO+GHFWIz?=
 =?us-ascii?Q?C70XVc+hRH0o/d4txXpKil5winTU73+ybvIwk0DaMj2GO3r3+d4FM4rVC4PU?=
 =?us-ascii?Q?qtFotj1GkIGlP9g9pTm0I7oLssZr1F5yRI5gYbkoVD2+mQFOyBzBRezu4hsJ?=
 =?us-ascii?Q?rfzl3JD+aH+2WqqE2X5lpAsyTkCdM7B0IW2+jP+dGRJ40pEOFzdcfsD6FLFH?=
 =?us-ascii?Q?a2k8crqIc4e/eL5SXV1/uvR8pOCBAj0+aUskCIEkx6RY5hcRjTLN5CFKBwH5?=
 =?us-ascii?Q?RxorHuWl6IOQ06Hhmxsj9FM3kPVr1uwOj3m/l0zo9vLd1ZYryhmEV5LPYEd4?=
 =?us-ascii?Q?rQji31r6CYCR+BCJvYuyhB7bP5ntaa9u98KMc3fO8ifvKSuFYa16yzw+3wQt?=
 =?us-ascii?Q?myW1l5Ixrt1zD/J/+/v22evkrK1P8i7ZDtuXe87e376imhR+6bnEjN4QCM8p?=
 =?us-ascii?Q?NjhgJ0tr2HfucRS9mnLpaSlLMu2CnSjP81OjXnnamp03f+4KSj4PfstR8/mz?=
 =?us-ascii?Q?QryIcusPsHyubjBYzN4qzkEjzi7GEqdi+CVFknwYBRPVl3iA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5060a9-488a-4a38-8b16-08df35dd9e60
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 16:56:47.2987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsR/2P97cbOpDUpHvcnqCsZExRJSlL68uHR92IIU66M0XlmHenymJHICMDI2ZAyiaTW8n6+0YKpVJ1Tzbv5K3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8559

On Wed, Oct 28, 2026 at 08:45:07PM +0100, Thomas Gleixner wrote:
> On Fri, Oct 23 2026 at 11:18, Thomas Gleixner wrote:
> syzbot reported a NULL pointer dereference in the CPU hotplug code. It
> is caused by the lack of synchronizaton between CPU hotplug and MCE
> sysfs controls, which allows the sysfs controls to reenable not only the
> timer, but also the CMCI reporting on a CPU which is about to go out. A
> similar issue exists in the CPU online path where the timer can be
> enabled via sysfs control before the CPU runs the initialization of the
> timer.
> 
> Prevent this by:
> 
>    1) Serializing the sysfs writes against CPU hotplug.
> 
>    2) Removing the redundant timer_setup() call in
>       __mcheck_cpu_init_timer(), which can end up in initializing an
>       active timer.
> 
>    3) Splitting the hotplug callbacks into starting/dying and
>       online/offline parts.
>    
>       The starting/dying callbacks control the timer and the CMCI
>       setup/teardown. The online/offline callbacks handle the device
>       creation and teardown.
> 
> This ensures that the sysfs operations always see consistent CPU online
> state and the timer and CMCI are shut down at the time when the CPU goes
> offline and re-enabled when the CPU starts without interfering with the
> sysfs operations.
> 
> Fixes: 9af43b54ab45 ("x86, mce: sysfs entries for new mce options")
> Reported-by: syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Closes: https://lore.kernel.org/all/6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com

There are three others that seem to be the same issue.

Reported-by: syzbot+9d17de59c48d71bd6824@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6a6cd87b.2d659fcc.1d46f5.019c.GAE@google.com/
Reported-by: syzbot+553c9f2c5781192c2214@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6ad23c08.7952420f.283480.0348.GAE@google.com/
Reported-by: syzbot+edc6b57cbed1fb72d0f9@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6a6cd832.1aa927e4.17d4bf.0008.GAE@google.com/

> ---
> V2: Use the seperate hotplug state as sashiko rightfully pointed out
>     that taking the sysfs mutex in the hotplug callback can deadlock
>     against the device creation/deletion.
> ---

I was looking at this issue before and have some QEMU test cases.

These were able to hit the new Sashiko findings.

There are two separate ones.
1) Another deadlock.
2) PREEMPT_RT warning.

The diff below fixes both. Though I'm not sure the if the msleep() is
okay.

Thanks,
Yazen

=====================

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index bcf4cba2b7ab..6d74e393eb6a 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2512,12 +2512,36 @@ static ssize_t show_bank(struct device *s, struct device_attribute *attr,
 	return sprintf(buf, "%llx\n", b->ctl);
 }
 
+/*
+ * The stores run with the kernfs active reference of their attribute held.
+ * CPU hotplug removes the attributes with cpu_hotplug_lock held and waits
+ * for that reference to drop. So never wait for cpu_hotplug_lock here.
+ * Restart the syscall instead, like lock_device_hotplug_sysfs().
+ */
+static int mce_sysfs_lock(void)
+{
+	if (cpus_read_trylock()) {
+		mutex_lock(&mce_sysfs_mutex);
+		return 0;
+	}
+	/* Avoid busy looping (5 ms of sleep should do). */
+	msleep(5);
+	return restart_syscall();
+}
+
+static void mce_sysfs_unlock(void)
+{
+	mutex_unlock(&mce_sysfs_mutex);
+	cpus_read_unlock();
+}
+
 static ssize_t set_bank(struct device *s, struct device_attribute *attr,
 			const char *buf, size_t size)
 {
 	u8 bank = attr_to_bank(attr)->bank;
 	struct mce_bank *b;
 	u64 new;
+	int err;
 
 	if (kstrtou64(buf, 0, &new) < 0)
 		return -EINVAL;
@@ -2529,12 +2553,14 @@ static ssize_t set_bank(struct device *s, struct device_attribute *attr,
 	if (!b->init)
 		return -ENODEV;
 
-	b->ctl = new;
+	err = mce_sysfs_lock();
+	if (err)
+		return err;
 
-	guard(cpus_read_lock)();
-	guard(mutex)(&mce_sysfs_mutex);
+	b->ctl = new;
 	mce_restart();
 
+	mce_sysfs_unlock();
 	return size;
 }
 
@@ -2543,12 +2569,14 @@ static ssize_t set_ignore_ce(struct device *s,
 			     const char *buf, size_t size)
 {
 	u64 new;
+	int err;
 
 	if (kstrtou64(buf, 0, &new) < 0)
 		return -EINVAL;
 
-	guard(cpus_read_lock)();
-	guard(mutex)(&mce_sysfs_mutex);
+	err = mce_sysfs_lock();
+	if (err)
+		return err;
 
 	if (mca_cfg.ignore_ce ^ !!new) {
 		if (new) {
@@ -2563,6 +2591,7 @@ static ssize_t set_ignore_ce(struct device *s,
 		}
 	}
 
+	mce_sysfs_unlock();
 	return size;
 }
 
@@ -2571,12 +2600,14 @@ static ssize_t set_cmci_disabled(struct device *s,
 				 const char *buf, size_t size)
 {
 	u64 new;
+	int err;
 
 	if (kstrtou64(buf, 0, &new) < 0)
 		return -EINVAL;
 
-	guard(cpus_read_lock)();
-	guard(mutex)(&mce_sysfs_mutex);
+	err = mce_sysfs_lock();
+	if (err)
+		return err;
 
 	if (mca_cfg.cmci_disabled ^ !!new) {
 		if (new) {
@@ -2590,6 +2621,7 @@ static ssize_t set_cmci_disabled(struct device *s,
 		}
 	}
 
+	mce_sysfs_unlock();
 	return size;
 }
 
@@ -2597,15 +2629,20 @@ static ssize_t store_int_with_restart(struct device *s,
 				      struct device_attribute *attr,
 				      const char *buf, size_t size)
 {
-	unsigned long old_check_interval = check_interval;
-	ssize_t ret = device_store_ulong(s, attr, buf, size);
+	unsigned long old_check_interval;
+	ssize_t ret;
+	int err;
 
-	if (check_interval == old_check_interval)
-		return ret;
+	err = mce_sysfs_lock();
+	if (err)
+		return err;
 
-	guard(cpus_read_lock)();
-	guard(mutex)(&mce_sysfs_mutex);
-	mce_restart();
+	old_check_interval = check_interval;
+	ret = device_store_ulong(s, attr, buf, size);
+	if (check_interval != old_check_interval)
+		mce_restart();
+
+	mce_sysfs_unlock();
 	return ret;
 }
 
@@ -2769,7 +2806,8 @@ static int mce_cpu_dying(unsigned int cpu)
 	struct timer_list *t = this_cpu_ptr(&mce_timer);
 
 	mce_disable_cpu();
-	timer_delete_sync(t);
+	/* Pinned to this dying CPU, so the callback can't be running. */
+	timer_delete(t);
 	return 0;
 }
 
