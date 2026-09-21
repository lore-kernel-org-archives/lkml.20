Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012004.outbound.protection.outlook.com [52.101.43.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B954AB1A3;
	Mon, 21 Sep 2026 15:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005014; cv=fail; b=Gpuisccs8d9pownKOePsaeUHwBtpSj8U62M59iGIqu8cdoKyfrwteOE1XPPl1tNKHRLvGqjC8nunZNiqy/BwinL4SDrspU6/biMzWfoSuS5t081Z/qMr54T1YSrzyL7pplSliQ1cWEL7Q/YrQL1+S1/sH5c/vR0/a4x8QBtBqlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005014; c=relaxed/simple;
	bh=q6c1rjx8+XSBGSEltpbgQ4LVn66yL1XpAEEOD9mVZng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eFQ8tLKV1MxiWZXHoslLwwEXwoaczkTEah6l8+46geGHIVeynjzYh5e1NVIEG0GKN2ZgjSb5w7E2iDuNO48NGIVhI98rxRHM8HkJjDmcQK2OEajEI4nPQD17JKSmErN/uZON+r17ieeoRAaeek+LWohA5N2oZunzRmbw48CFpcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TvA148iW; arc=fail smtp.client-ip=52.101.43.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TvA148iW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRwv5xRwptW9o1rESBRY93Z842AsOMEYesSL4anRGXwAVC+CBmrQ6bKIcOtSwEA34SKz0xdoOWtz1yMzE1700LpeSpsUNBHQRxroZO60oywvDQv3zwlctAJrSVRD8cQ2QNjteATmLFDkb91ePlCPNprGqdzWh1yY8jiLgpm4V7qlliC/Zs36BPwDTRBRfupAreHrRS2fCpYDPNlhFtTq7sPvPm3oYd9eMiEXDIlLvzxoTDNT2Qoiayy8ECUe+byxlhJB/rgg5rCotxKCLwU0z6u777hihWu/kM+cV3Xv4oJlFYOuiNvo/ABDFmXA9GD+1Dqt9HvhikubUE91DHfc7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dv6X9++9wQkK4exsZpJfEdeZ5Gdf9AgszK0cPCSLTjg=;
 b=o4fYx9Odvh84ldd8AAJdEWNYS4edW31eeqfLkNhzuhd/yg6McLDQKqtUvhqn7nwu6VL5LphoY12cqZpSa9x98snPbpxIH6UlyfMeWpQjUFy89ud/Ns/n3vDsWAOqvU0FCb3FWk0OqB401KE9NVev+0sPxe3JA5riVsigCXiDaBV2dD8RHJhQxYwRr0q1mpz3v2ceVncXGi8OMnVoVgZwk/SRgfX+Guuw6jFeCwyEU36sVEahhY7+BlF4ZilXw+mKUa9ryE6dhGsYCmDWW5G481B+uv1eiAc/O8yPLC9l7vehIXHyavmGZwJdNCEQGf+vuPEKjSrVv/UaGevKRSSz3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dv6X9++9wQkK4exsZpJfEdeZ5Gdf9AgszK0cPCSLTjg=;
 b=TvA148iWcqCMCkbs9ut/4UbDAb7nJRjHpz4xY61exbecpAcOlRvx/I8Gd6RfA9C4VdLC+qzWU29bBthTmDpZV2T0vlh6S26kifLKfUSTQQMnBwPpwsYsM4ma/bqHT2CHarm39Mrs3/0gXaqyT5lZEwGq3R5L+sZ0gpyfaQ6lzDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.16; Mon, 21 Sep 2026 15:36:49 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 15:36:48 +0000
Date: Mon, 21 Sep 2026 11:36:40 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Rosen Penev <rosenp@gmail.com>, linux-edac@vger.kernel.org,
	Tony Luck <tony.luck@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] RAS/AMD/FMPM: use struct_size_t
Message-ID: <20260921153640.GA100628@yaz-khff2.amd.com>
References: <20260317031650.93712-1-rosenp@gmail.com>
 <20260319162818.GC1666212@yaz-khff2.amd.com>
 <20260919035457.GCaq4HkXYv5VYfBtoe@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919035457.GCaq4HkXYv5VYfBtoe@fat_crate.local>
X-ClientProxiedBy: BN0PR08CA0007.namprd08.prod.outlook.com
 (2603:10b6:408:142::32) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DS2PR12MB9750:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a626a46-3f70-4c1b-7c6e-08df17f62685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|11063799006|6133799003|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TeES0+GRB1YU017mrqYScA/fLQZg4xTnUW/DCykbT3E+V19cyHjvB617ryQIjfuVoNsJzOo8JsYvuVD2NXCJNUf+URgBfZFS0mQ3Bch54crvF/+faft2X6irmVo11xuJvac4luSZpQQ0jdgS4nVG3qZNMkjDmp/Y8q/c15pC/fH6++09UEYgFy3WAY5EdLDDJEjFQWGYiBbAT96KQ+qIJH0gNvwFvFliLSPYI2Y0Ul1ukJ1kmmrynTFd0uNkyJwQnHGn+Sylo4lUMwo4qdvIrcJYJCobQ277WnobtRjdFZQBvho39IaGk9xNtSNrfsJ6KC1vPBPAWIexqCGIWslL86IGxShxhY1gG0nhhDz9HnD/h/9sTcN2b15t/KsI/69x76RJMvGJa69UA9l0zFOYqrmkC531jea2tFobs3e02BDNHJV5MGHyfS9DE3DDwbE8FLzPozRcM+9KNTiDb6yayd3MraKcva5NC66pk1AAisMIdKEwgczRLrHsoCThbBBnVWWVwDKeDnAhbgdMDBNjJYQxqWJHnKD61tSBwj6zqbejykVxGJjqoqLuUf9QwgEHpbEnmq2ybCuufdsN7lG+717iVOb/Sk51jK/cFE4Dp4M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(11063799006)(6133799003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lWkFnGc2QQWUe/qDCaK431eaufXRoUo0ndkIUr81SPmK9GyVxhoCl8kfNQvx?=
 =?us-ascii?Q?wgiEkirQFAaJO4JWcEg8gymWi2pbDuYljrz6U3Bj9kX04BJePvamATVnIUlQ?=
 =?us-ascii?Q?O7650FthLg2o/ea+bUfkGVDaNUm1+brXeLfDN25/I99LOOctvojEH+QQFxX6?=
 =?us-ascii?Q?GCliABPgxCtA84eeHFZXkt5XvKGVvlZ6agxL3l6Vh+O7G3AIS8D18UPktOBy?=
 =?us-ascii?Q?yspz7CxEZPAKitnpxhxRY2XmQrJuRNq/641Fpqg/qqC33GBuMINyYV81k/C0?=
 =?us-ascii?Q?j/uIWbq0fjfSAENYiCM7L0aEryYU4yGBowN2i2z8TX0N6t3I0aI9sNq1xJKY?=
 =?us-ascii?Q?IYQlz/PS7SheZfvawEEhnnVtzGVQSP1pkZi7BAvQ2kOrqyiNK2D6NxQuYDB5?=
 =?us-ascii?Q?wZGomp+ulzjc2UQ4eJ+ZHouFqKDW3i6hXk73SHgoNr4KdjtmgnOqdH7JaApM?=
 =?us-ascii?Q?L8sdh0lB4eek1HbWC6hIKT43s39HiPwwYYuxC+zFzPNx9di7BPmb+8jkxO82?=
 =?us-ascii?Q?JoW6OoHuDJzfMXELYgrPvQaD73Wz74UI6rVzzMd1jaJ+6v3i2w6F65c9C3B0?=
 =?us-ascii?Q?QP7j+1THkk9kcIb9Ccv5GmTn+KpFgp9aUDEE9q+D37KkaPtOuv+6PVVey1Pb?=
 =?us-ascii?Q?yZR4C6kdSnLTcJRSX57fJSYZlsn2UHNSwSKrp18ie8meKfw00oxsTBbaPJ1r?=
 =?us-ascii?Q?BBer9kFfQjqaGNT1aPo4gxtnpwVgWMzVQ1IiTngpAEPqmF/FhZjrkLtiDMz7?=
 =?us-ascii?Q?ZVIS0jHHaTgpFG2jS4z4esIc2QMvOc6IiwfBxXaVrhyzQ9EFmAn2buAmnOfL?=
 =?us-ascii?Q?XU7av2IgyiV7CW2zL9a6dJMsZPTlvZthO2GDRoHAqkS6dOVjiM3pnEkO6d6J?=
 =?us-ascii?Q?xDJdI3c+Gb5ZPYZVR5rxYupe5tjZh3rfG1tusQ+o4NoY0O2Vti12oGKG/ida?=
 =?us-ascii?Q?/VB/4SPgM17acUfv6j0UHB1iYfQQ/4oDqZG8oE6SxzdyU1Xrch9rVTCZHvIF?=
 =?us-ascii?Q?e8DNu/Dg9kS79ojxeOKBiqoeTzehRK2Jr8ywSZatsYoD9qgia/iqPdw5dHQE?=
 =?us-ascii?Q?mXjZftZRkKfiOonBDKPtLZbcAEsMGAxkb/Qvoe37/A22/4EwI3yw4IblgSn2?=
 =?us-ascii?Q?3pZ6eznDDYnPRQnPnesqtYUR6/TSgGkurYNHeOuLDkHlueHOdHZ6jazRyqun?=
 =?us-ascii?Q?6X/HHTqb0PNvXwaziijWae3dkpFlbFFz0EwKcAzHRHfsoO2hailjZZfjG937?=
 =?us-ascii?Q?3hgjTrK4K2yHeP/5caOXlEWKbbcrOfrEgv4rUFeDbQjJ+xpHahnuA7fDtlWZ?=
 =?us-ascii?Q?E4Wvy7CqJtlsROxDhLiwtHnjg4upHdHjLiH8x3RlKjqBrxD352DXSCs1Zz0/?=
 =?us-ascii?Q?WJaaHCQ99nj27PA+9eih9i8qvqKirJ9dRXP4bUrlTZFQ+3HFJLRFC1ASPLLA?=
 =?us-ascii?Q?Qof5ijKdmP0N6ao91EeJdArxOZH0cCPzKMg9Bs/bounWsGd1Q7Dm5VBBQgrI?=
 =?us-ascii?Q?TgXaZKB2tRUvfUveEmdR9mNR4HeLECa5UmuUqAqhkS77sqDg6ZXfz7ePacbJ?=
 =?us-ascii?Q?wagaKe0K+e4pCU5BxpQBF53r3r9VRriAzbaiGqWEu60ANRiuZ/F/sYL8JYaa?=
 =?us-ascii?Q?aEyo+9nEQ1Q6gPxYveWsNMgKDAV/BCZZlTjRJCNn0kuZDc+vy95A/Eyn/Vo4?=
 =?us-ascii?Q?FjXPG/i1eXc6VQ4gweqanBL5yM1aV0wPmAOwTnRATv+51Wyt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a626a46-3f70-4c1b-7c6e-08df17f62685
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 15:36:48.8219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOOdhx64otWT28puIyyOES2IRqbzLCQLZMUgsbMpqKY6EGwe7zis6KQpjjOn0RZX2ic0BcawKP9hhyh1V0g+JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9750

On Fri, Sep 18, 2026 at 08:54:57PM -0700, Borislav Petkov wrote:
> On Thu, Mar 19, 2026 at 12:28:18PM -0400, Yazen Ghannam wrote:
> > On Mon, Mar 16, 2026 at 08:16:50PM -0700, Rosen Penev wrote:
> > > Avoids manual size calculation with the proper helper.
> > > 
> > > Also use kzalloc_flex for the same reason.
> > > 
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > 
> > Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> 
> https://sashiko.dev/#/patchset/20260317031650.93712-1-rosenp%40gmail.com
> 
> Yazen, there are funnies for you too in there.
> 
> :-)
> 

As always :P.

BTW, how are you triggering Sashiko?

I see that Sashiko replies directly on the linux-pci list.
Ex. https://lore.kernel.org/all/20260918145619.3016889-1-yazen.ghannam@amd.com/

It's nice to have the email replies rather than just the web interface.

Thanks,
Yazen
