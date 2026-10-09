Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011012.outbound.protection.outlook.com [40.107.208.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E340451981;
	Fri,  9 Oct 2026 12:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550426; cv=fail; b=oXShszSvFjTsaXSmpAW3mYhK7ucppR1nyQL246fRBOBT5n3py0TRwveHtDZf5S613yqE/B1b/LnqP17qtpaiicxOF3v0Qc0gTOi03PsoSJwdFjZnA2MeBQgezoTZmWljOxZeXvNbZI5/8NeU5lZIQzTfW3tmffYZUwEjrrTbgKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550426; c=relaxed/simple;
	bh=ReHjn41gkfKpTURQrGjGLy28CaVmJZb+xxP+BkflfGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g9Fozgl3+q9T5vZarSGJ1wIW9HXFStO3CIWFZJhivsqQbQdIzrhUW0eegizJf31UdV3Ha7Lsyzz2WOS0kNi71UlniuHOiH+lSXnBRx6qh8aj2EQqAIP54z9Ql0TY9zHHjTJGHjbShGTqifz3ZnK8oTnh9smM9Sehdan81QARptE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t58oKdOe; arc=fail smtp.client-ip=40.107.208.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t58oKdOe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnN/Oia4z6V1grd3j653I2az9pQx1T/CyqgKDOwfRNE2aJydcC2U0SQwMCfQcQUzoRAwH8UuwaQkFYM6cTro67pV/p93KsLJbPQrV9FFQ4dvVNI0b/8jgshBOCngg77IaMa63pFIP6fU4iMB+zQBL2wexsA1/COw297u+AI74vQUZvLh+OpqSwy7PF7bVfwaac7gkyDtGvwdXG454aV8zCXXOGvDrBC03Fw57lkyNdAfqTrVNBw3Bn6ZcJJsJQnoY1XXkNBM897H/1ncBQMSI02HIDeKFqA+6zeyWf7J3XmSQfo7ECjaItcRuAphmEs5rR1fgUNBjNxnM45BTLM1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqE/2BZkQW3a4FCzOntQMWswhLvmkMKu85QekZUh7rQ=;
 b=Fq52WATMZNQCrEA/NDmfGSZiZy5lQ5EU2ptoMUJDsGUjwBbTTjOC4wWgHIBpUpIQoW1JqeqTi849EzEEXtz1lbJM+5kFJYaoPQVu3PhHYEBwxZoo4LZYzCkYMbymlvL7JiQZadOyRJqDeRmYILTF3gliJA9MKPStHWrUXlc/bBIG6KUBeph3lkwDA9QGQAsD0KCfWK16xIgJ6vtal7qDLyAv3yLQ1hLnXNI2uvHtqB50iHj44TFji0WYfoFVX9Vq7WBc2y/cew2t6PGppDNCQ7WKe6pvRU+gV0OI4n5n6Cvs/8XCc0hNBjkdM+dx9AJ3boEoBrDKFUR+KbTPe0kAEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqE/2BZkQW3a4FCzOntQMWswhLvmkMKu85QekZUh7rQ=;
 b=t58oKdOeWhpm+u3SVS70tpAUGanHXsHR1Gtor5oiFcUA3HjhSJoFvrXdIW8RQSagUbgX/LI1BiuEaUpk0SCyBcKOYPXFUFLZXDXA4S4Ue+9OjXqF0DLxKrGhmOLb2I1YVCVNmTxK3HKGVuqa73MdxLZ+j63BkKYjq0FhRMZsN1egBaCw+gohlVRi+yyrj72H8tCK4B2N49F9a5dxJpjhomPdvqvqOThB1z2j5VUEl01C5XtyWUCQqe0QHcW8Vc2+oEKoqxpMHKjNU0S2InkUIh4VimISHKX3Iu9CiW2QkfxF6Jy311jrR1beBd5y98KwtOe1YJlr5CDywwwxImXSSQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by PH7PR12MB6905.namprd12.prod.outlook.com
 (2603:10b6:510:1b7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 12:53:39 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 12:53:39 +0000
Date: Fri, 9 Oct 2026 09:53:38 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Diederik de Haas <diederik@cknow-tech.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, Alistair Popple <apopple@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>
Subject: Re: [RFC PATCH 2/3] dma-buf: add a warn-only mode to DMABUF_DEBUG
Message-ID: <20261009125338.GB13920@nvidia.com>
References: <20261005064133.7305-1-kmehltretter@gmail.com>
 <20261005064133.7305-3-kmehltretter@gmail.com>
 <DLYLA3WQNN3X.3FB9MO8ZWBQ5@cknow-tech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLYLA3WQNN3X.3FB9MO8ZWBQ5@cknow-tech.com>
X-ClientProxiedBy: BN9PR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:408:fb::33) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|PH7PR12MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b8bd9b8-63e5-4e3b-f261-08df260456ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|6133799003|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	LowOHvK2LOpRjynHQTTG/3t9jDhgM3hoyFqk4zwGd04nBv3BiTwa8R997RNW8mxYF4JyztvVLo4ASdF/bDwTdjH6ef8y2UtD7lbkvXY8HUMg55BEZCJJ07oacGPkOWmjJq/r5cFKtJjfflovRwtTAYJ5eaQzHNXj+mD1Kl8oANhICrmw0zr43DdRXq35hXR+AtiDS1jnfS4V99/4eR/9YZIBjqGnJWDx0dTA4FiBOnwv78+xzh3lGwMIy6udmW2SG1tO80ROMKDvt1+OXr5M0EbGKCNUqSQcLf+KnEkQckF2edY1NeD7EGaz5fIT2IKqmBv+oExI8OEm6SYYKjlBjhV0WZ2V/t9CIpYYywemghixhr4eb6CEu8HO9b999n5IpaEXJxv7HDGpJYae/BWpXMw3UXs18q/Mv3YpXRi74pondpaWgZZP/RTMS8rTMGJj1FRwNs1cGYq915FFIP6IyhrbM5zTK+aPQo8K4DHGSqR73CKhwixfPybV7JQ68FIvQ9fvWzOZ6qdR2WwwEZvmrhvOUXRMSIU21KNXIdG6dJ47creiLVkxBE1RGR24256ABJ1VUcY9ORuTgij+h+Wb/7evkTYHHa4NFl24SV+Wi53UnlWn5pmwY2unWO75YDKZtQQ5DHsRee0tx4d/JJ9TO5wpnvx8WJfXGzGiCatkBK8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZH97mflSZJAP9V/5eyd6K+VVJ9XRT4ac07mx/h3rN6c2MCamwCIjSHjYvg37?=
 =?us-ascii?Q?GJcRj3Q42D4GUJaazgcTiLij+dPgfE3LB9WwnN5i8GUT9ep6By13u6CBX8EH?=
 =?us-ascii?Q?Vw+47ccIEgfeoJkP0ZJhgzUtnR9EpVBtIa0HTvJUAiuGlkFVjgI2fy5EZTOd?=
 =?us-ascii?Q?bULSIj4OHR/RwItVWIXjJLiZzeQfe5sx32r9sELNt3BRGtuWTxslZZzNEMpv?=
 =?us-ascii?Q?dTQ0jCQUnHQk6efAwwcpwvSv+KUcOiD3DwGsHHIfAvgrX1kFT6zqzuQDA0b8?=
 =?us-ascii?Q?nrmFY5tZKl/XJycwCWt7YkDF9QfVu/e7bhO7QRvmBRtRw0j4H8gXPDA4k61v?=
 =?us-ascii?Q?nq9u2Qig5UJzAdIP4As/DGZyZsv0rbq3R64MPI8hK5rSXHeMLFtBCMYTi+QQ?=
 =?us-ascii?Q?Iut38iF/VTg026OALRkdsZIwYdcbvUQGBYIWlflzc+SIx+1A+YJ+3X2A78uW?=
 =?us-ascii?Q?FI7KuuGXPI5GY29MlUjQ0VngTIn5khC2wQUHtT0lYYhF0BPEmpmRa2mC9dpU?=
 =?us-ascii?Q?MxSFqLvB6ycR4lQFDJmruanmYepzq2kdx24MgXsoYXVzoD/ZeYj2an401mUr?=
 =?us-ascii?Q?qhjJrEDm2QgOLUH9A5IlZQhnXU4vIfWO1pUabkwuxr+yZorPtqmnYRzRLzpd?=
 =?us-ascii?Q?gw5kQ1qFzWWY8YjF+8n0H3MSKeavEsNrw4QJUjLD1LIOw54H1ybMW/jFZXU1?=
 =?us-ascii?Q?YdTjiFtbMUIcLYGxXZT0NzixJOh76Cd7x1PiETstvXsdFtp0PTtda0/+Hb8P?=
 =?us-ascii?Q?syDt929UvDSoK+FRQigm0ykYlO9ZU6RBFHfx+d4OfoB9SF0C50+Qf5iEyc+/?=
 =?us-ascii?Q?X7l26753qy1vVaHv0LoUn4FI6ZvB4hyzodQA6EQsUj1OKTPSQPBpvqB/5wma?=
 =?us-ascii?Q?rh8wEm8y1MCZGf++cRwmKnQidr3KGAIarzCDyzbKn9M/D7JtrtFxu/Yabj0G?=
 =?us-ascii?Q?m+StpWo9IMvZRHs70MdobPTFrAmIJvuwFDZNEkGNQI2BOPAUJb0r6dhVFydn?=
 =?us-ascii?Q?VVUW3H3nXB8O+7F/EcjerF2vbaDWbwHHewTKVYyYjgaOmVUplaMGK+P0dxRG?=
 =?us-ascii?Q?4aXlAnsfvWQ5o1OZ/I0Re30v+r1k4xU2iB0s23Bqt5yyKf2J1nlWSBpy3FS8?=
 =?us-ascii?Q?VICBrDpA6/AXjiNfHKYCjE/nVPUdT5Uyec7v93vBZk8cPWSalhB1K6yXUhJH?=
 =?us-ascii?Q?mHtIguwiDuw4bkTthDRIkCsSPQ/PbBLz/WwtFzH18fy2Cr7eOnhMicPB02S8?=
 =?us-ascii?Q?OZni3FhSitaOsEkw+Qxa0Q16WkYNARBUlPdbD5Ycm7u+VVpx7XUifKp8tl2m?=
 =?us-ascii?Q?5KIJ6nmBL5kX8G0tGbmbVViCX520PORUfvc0Cbrp71lkHr48JNDrbxsWwS+P?=
 =?us-ascii?Q?hpJdFVhKfAKxUafmwyX64YrP4vd60ElsCm3RinfOqmRGnFwOEpF5oEa4g0FN?=
 =?us-ascii?Q?VNpzBVLyJtH3oR+6+Ix9oHXhWP1+LDpQjFdgLdHD5muAQ4G0QJ4bDdKPrIXP?=
 =?us-ascii?Q?B1BpxhvUiNY2AOJVrCY3PyfGuIq8uAFCm3VhD2YUfm8qzsmKF05VcTaE6Xyg?=
 =?us-ascii?Q?gS4xR6uS09cNWgtfuRsYv+rCOH5aoVGqTuqrMeg83iOzymmlgHcBZzMSgsBN?=
 =?us-ascii?Q?z0YaxSl9iE/1mqfdmC+mVgSw7gP0ORpeD8rWB9exu0HXEPf3FQQVpIBC5Drd?=
 =?us-ascii?Q?AxamLIz/+17iodzbNjTnxCmZJvzbMaxTMrPqlFyqYU81KbDE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8bd9b8-63e5-4e3b-f261-08df260456ee
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 12:53:39.1043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4qybqjnBMcBHjgJCqqOcKnAitUCC+2gqR+qeuZ1DswOnsj+sywkTDua9dVIZqDf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6905

On Wed, Oct 07, 2026 at 02:02:31PM +0200, Diederik de Haas wrote:
> [ 1091.981354] rc rc3: two consecutive events of type space
> [ 1104.670513] input: EDIFIER e235 (AVRCP) as /devices/virtual/input/input12
> [ 1172.090231] devfreq fb000000.gpu: Couldn't update frequency transition information.
> [ 1189.403278] devfreq fb000000.gpu: Couldn't update frequency transition information.
> [ 1206.309295] input: EDIFIER e235 (AVRCP) as /devices/virtual/input/input13
> [ 1268.968696] DMA-BUF: importer used the CPU side of an exporter's sg_table

This is a nice stack trace, is that the point of this series?

> [ 1268.968710] CPU: 6 UID: 1000 PID: 29025 Comm: sway Not tainted 7.3-rc6+unreleased-arm64-cknow #1 PREEMPTLAZY  Debian 7.3~rc6-3
> [ 1268.968715] Hardware name: FriendlyElec NanoPC-T6 Plus (DT)
> [ 1268.968717] Call trace:
> [ 1268.968719]  show_stack+0x20/0x38 (C)
> [ 1268.968726]  dump_stack_lvl+0x60/0x80
> [ 1268.968730]  sg_dmabuf_cpu_access_warn.part.0+0x24/0x30
> [ 1268.968734]  sg_dmabuf_cpu_access_warn+0x34/0x38
> [ 1268.968739]  iommu_map_sg+0xc8/0x1e0
> [ 1268.968745]  rockchip_gem_iommu_map+0x8c/0x128 [rockchipdrm]
> [ 1268.968757]  rockchip_gem_prime_import_sg_table+0x58/0x160 [rockchipdrm]
> [ 1268.968761]  drm_gem_prime_import_dev+0xa8/0x1d0 [drm]
> [ 1268.968776]  drm_gem_prime_fd_to_handle+0x1a4/0x280 [drm]

So.. This is the exact same thing I need for iommufd.

rockchip is managing its own iommu domain and you cannot map to an
iommu domain without using a physical address.

Of course it is *completely* illegal to call iommu_map_sgtable() in the
importer side of a dmabuf.

static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj)
{
[..]
	ret = iommu_map_sgtable(private->domain, rk_obj->dma_addr, rk_obj->sgt,
				prot);

Jason
