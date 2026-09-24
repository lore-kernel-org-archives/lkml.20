Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011022.outbound.protection.outlook.com [52.101.62.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106AA49CF20;
	Thu, 24 Sep 2026 15:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263799; cv=fail; b=rTs3mYEnEJx/NvB6SJi41af0l65rFNd0yh9ad9AQXYjlm8jv3tTZjazSAtL34pitVgrPBVDXT9cl2F+Kl8PfiRa6GNenJ5w5JbRCJQsFwxcvu3BICaZmgxBFM8Wogcqada03btYjm60UPrBLPZCdHC2/kk8UYoQ9nNxW4BogJqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263799; c=relaxed/simple;
	bh=Yz3pEgV794/KeJtRRrVFLuNf0IMTLZfgq4pXWmz4piY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BU3BGlvJ8xJGSrpqlUFzeruLGg95oFEzkEyekIhdAgZhZMfKHuj7LCrnGGwgGhjAdT8HPhpKGWbHT8S62gu7+urUFfP9Gg3Jvtv9B5A82SCXZJ/97uPUCo7PmnaCvsXJgZBdtZ2117DqNJGJaZAngEoqUiLTLR+hc6NjsJcNf2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kv4Wcisn; arc=fail smtp.client-ip=52.101.62.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kv4Wcisn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybWohRqvTm+8+ol9ZYB3iUiJsQ2QgLrpEUgWD+qf9lv/PwSvStbv5D3uwHDwn277CMdLK2krE4F8YIafMLXa+Hev4p9Ev6HxySg7UABrdXdoV3L0tN58V/gsIb/rN/95r8gh0XsVPJaUrh7nurnUC7/uglFWRmAZqia1l2RLUwrCMMV6P5m26cXjTwbmZ9TgJ6GFXy+NtvholmJlPg+0daUW2oKOSSfZhzJwfeO94YAJ2OWZXvoFC50MUjKJlFvBUJ070jv8jVC2gHgYrxtryW46aAWoJiOebyZvlhKgqZJ8nzQP7mm4seFI+hxeEnSTbZLLoddzdJSP15zX8MeghQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lorVE0WyDLYZj61rEMi8OOXMNv+9R+G4PvNdYoTq2wo=;
 b=YIahHVJnEspvt6gh6QAXNc5tlOZkS/Z9/PeHwjeln8ecdCEXINYHXpp0pu6Lbtk5YV7kRajnK6+PFWZm+D3IBZYcVxj4GNk6H9xAYts5nXl5iXbywBBCbwUtBK+OB8xmYnUEkc3KeLVAAKP5ZMrcWGVY42D6iwZ2NALAxcMfA1VOkpKC0l+iuEeugoCiUx9wGTQnNeAyV9Tp92HhcLOBeSkLW2BUcwFaKs8TTofYgKfeWNE6o+MLfCxxPHsUy+G8zsxl9LoyOMdWsk3t5BTYJ6D5j9txlK+CwmCZKIJnnL0mJW2epKpEXKXVdXjUy+RbSfE5Qo9NDztH46wjvkxVuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lorVE0WyDLYZj61rEMi8OOXMNv+9R+G4PvNdYoTq2wo=;
 b=kv4WcisnrGZDPoAncDgTFWzO+OXcQs8inuFeS2R6gRCSQLb75ewDiO2WCsntGnL9Jg8yLWQU0DN8o1ZdcpX09z9S9KNIRdYDhQuJxqtMArKbf9CL51xGKHLWew1FIg+54Qt4v8meaoQc62kUflSlDA7TiHfmyT1pfKGrcC4PWmE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 SA1PR12MB8744.namprd12.prod.outlook.com (2603:10b6:806:38c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:29:33 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:29:33 +0000
Date: Thu, 24 Sep 2026 11:29:30 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: tony.luck@intel.com, bp@alien8.de, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] RAS/AMD/FMPM: Clear new records bitmap before
 rollback
Message-ID: <20260924152930.GG1080284@yaz-khff2.amd.com>
References: <20260821094748.145394-1-qirui.001@bytedance.com>
 <20260826035314.1536340-1-qirui.001@bytedance.com>
 <20260826035314.1536340-3-qirui.001@bytedance.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826035314.1536340-3-qirui.001@bytedance.com>
X-ClientProxiedBy: BL1P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::21) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|SA1PR12MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: 9461259a-d1a1-4636-5bbc-08df1a50a24b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|6133799003|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	r+P/wgGhxdDDUBiF1HASGzgJUlN84zHZGkOpJLDiRsoZyWR1s4hzR27NtbizoVrDK5O3UgDVb2e6bgDi7bGh8S47uUR597S2ZMITZ9Wg5zES5enhdfwkyYSvIFZwcsRCokksHeOx4kh1kk5Bt9/8wVgYddd13YEwHd++bg9DJVDBHEItTKiyg6AffzTCLV6KSc5OLFt7sUfvJL82h1A9MFmtk7eWQkqpafCm6DZog2G+v7YhQH9ublnPiL8fo+bfwBkCc/6bBN3nKf537DYuG9OTbSdgBhMPeSLHxXupt5nzpRm0tCDQuw8Jx2WvhRMbvFurndBRPYA30CbmmfasOV/xIkNQ69mOi8YemJ7g1XMfIy6byuZ26a5rQ9+IJYtQBtx4zQckr9CNbNKE74/AUjrcVjpeT9/T5GhyflfQWjBZVwllvUCHpCXw10zpZKUDzMPFFt3pzBdDEh0H2XTARFhWg3MkK4ZAV3fgds6eTDTNghmtsEVEoNbhRR/Fvi5V+FYLNZOAajEeQwoJQln4BazF6z3kTizmm0ksBtUgWYlga8/yAl1I7LkXcN3JgYY/elmtNTgtHo4ruSO7dJc6rrXCetqaglmwCem/zSgSagouBhnLWlg6e1LzbWDxijOV2sNun40blpx3hPkOJ/4yk6fy1nbmU59c0g7cMRH1pko=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GnuDnP5/GJhva9bpr57HAkTPR9p58tvAllE4fJ8D/yT0qtpSMrm9LSf96xcg?=
 =?us-ascii?Q?AjV4IHziWVidaeOmiiD4cd1mP8TDT1a+yO+pQkPgfXuHrNcEXjCwXbS0E8nz?=
 =?us-ascii?Q?7u4nZhqV5cF7Yt25G3iYD01foCkznPJa9pjBwkhufmRvmHw6gnIj1PTsh20b?=
 =?us-ascii?Q?OeTNw5GwoyBREy8dk8aXsVtibz0khcVXcQZ6duxX/s9DU74z15z177xsvFP4?=
 =?us-ascii?Q?BqsGeevzlZjYQl6cQJ8c3GWgYsZ5rxnP6fKgSEUSAMX5dVhRBENEwWVTu7Kw?=
 =?us-ascii?Q?wSJeOSsfst8+CUBkJK9hCH1VuuDHY3v9Z4KfyK4GJO0e0wkIj55c6XWehwGd?=
 =?us-ascii?Q?5IxT19fVTzu5yj/9OMHoQ0IahNiVWYfeH3dXO6s2cgVX+RbJuI3PiRLViKID?=
 =?us-ascii?Q?2pkDoLQr/shUHlIpP0HfEAVp+WRFLKPVOyJKKY1nvtGGCMo0CS5NGcDqNHzk?=
 =?us-ascii?Q?DjfzIDZ5hyHu9LhcwNuru34r7btTJsEvdL150gaeoHUTRlyNT9vQM/u5p0DN?=
 =?us-ascii?Q?B0aieRCX+yzYBfpYCf/+ofW8MYY/9vJLW7HzcBUOf3bvHdrHyp0CRX6JEH9S?=
 =?us-ascii?Q?qzZTzDqIjexaqhig3XGCNu0J0i4xPMr/g0Z4cWtrri6iqfLD/gqhUOlFjCVb?=
 =?us-ascii?Q?pxMWQI41cH8eJZznYg3sGzeYDcpXZBpA5r+3ZHAHkQZvC9z9wYXZOkNAPCpe?=
 =?us-ascii?Q?bBF8ti2Bsj7LnJlRJ8QZ12pOjJTZbo1F3rUsXJs0nPP0UCx6RngIC4z0LhY+?=
 =?us-ascii?Q?OQ36rITyupAM7zFPEl5P2Z1GzXtMjDBdbuSWTi/uiik9UJK7RNlBUfR/9TLE?=
 =?us-ascii?Q?STWTmpxvu3XSnjY71M+UOxbPuQifLbEn6xQtdAH10BAxat8/2g0I3FMreHIb?=
 =?us-ascii?Q?BfdlJ7106i/9gvQA0Ll6kAzdkQjAm4FQTNkZjLUdhaxZpVX9coTbQs2kzvye?=
 =?us-ascii?Q?4oeCiO61Rsh3/pa7aPi8y5GIEh+9LcMGHqOrCheMW2Wu4yuXrB+SgQpsPWx8?=
 =?us-ascii?Q?1IMal+PXdM/UKHVbi2jFQfh41wRLazsPOMdMZEbj+AATtgZdvBjIMvkdA7Ne?=
 =?us-ascii?Q?k9GYvj/uFhoML0R+ZwAdEnpX/nmUxl+vRLtw6Km2BPcMWcQ7GD81OMzW7xIs?=
 =?us-ascii?Q?mtDN1enmzLSUpQHWiVPtdZmN7D0S6jvydqWl7Bj8FDBOFhijJySbH+FM1G3A?=
 =?us-ascii?Q?pyWC/8ONi3Iu6Y5+HbWimVzul1pglYQH16uPbGf33CIStpXW3lr7TVQm5thL?=
 =?us-ascii?Q?w0mL5JOiFVSWyCBJ3aP6GDm8WHQ0gYJwKh5ViOc12B5eXBvIpLQPUA5isYcu?=
 =?us-ascii?Q?G3agh2MbmNEYOXU4i653pINJQ2tz5eRhcwQSi/zTROUit7ePfCT/7BF56Gxf?=
 =?us-ascii?Q?qarw1+E8HquS+DmUj5DmRW9PYH1YlgBT6RZADIgpppN//SI/9nJfpsmjc6Yi?=
 =?us-ascii?Q?TKFpqaW6FNdTkAIWNDPjH4bHQqmkeVQfy0R4hk+MAvBjkumFQfydtmi+IXDp?=
 =?us-ascii?Q?89iTm71nqWWEToZ0fuyvR+jhgfqlEAs17s8kt8JpY5KUFUrQnd2PLpnkeTQ6?=
 =?us-ascii?Q?KONIM8ZjxRKkyu8EkDbi069AKjqd5iwkmvGr0/wqFtGFjPupoRH6Z6PlMO9g?=
 =?us-ascii?Q?hebbc29iEj6Y79PyFqMlBQL6p9aUdgrYXI2SzOUY50AaBOADpAz3ItmO9EZy?=
 =?us-ascii?Q?9yvvmKiZNk+MtNi9WUBCsgl1pZTy6oq08/v8DjsX9e7zJRVi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9461259a-d1a1-4636-5bbc-08df1a50a24b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:29:33.4249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P06XNt2xpfbu+BEZ2sn8yvEwnEBLD+W5hvPWDAp82ipUl1Z5UHo8J62DR1RPjSLjK94C8TG5GdXANfAuL+uo6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8744

On Wed, Aug 26, 2026 at 11:53:12AM +0800, Rui Qi wrote:
> save_new_records() uses a stack bitmap to track which ERST records were
> created during the current initialization pass. If a later write fails,
> the rollback path tests this bitmap to decide which records should be
> removed again.
> 
> DECLARE_BITMAP() does not initialize stack storage, so the rollback path
> can observe stale bits and attempt to clear records that were not created
> by this function. Initialize the bitmap to zero at declaration so that
> only records successfully written in the current pass are rolled back.
> 
> Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
> ---
>  drivers/ras/amd/fmpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
> index 81d7f02c053d..e3f7bd053479 100644
> --- a/drivers/ras/amd/fmpm.c
> +++ b/drivers/ras/amd/fmpm.c
> @@ -528,7 +528,7 @@ static void set_rec_fields(struct fru_rec *rec)
>  
>  static int save_new_records(void)
>  {
> -	DECLARE_BITMAP(new_records, FMPM_MAX_NR_FRU);
> +	DECLARE_BITMAP(new_records, FMPM_MAX_NR_FRU) = { 0 };
>  	struct fru_rec *rec;
>  	unsigned int i;
>  	int ret = 0;
> -- 

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
