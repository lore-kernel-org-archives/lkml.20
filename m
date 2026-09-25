Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010063.outbound.protection.outlook.com [52.101.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D160912B143;
	Fri, 25 Sep 2026 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346721; cv=fail; b=oQfHld7PXi2cLtjxiU1HAJGfpkso9m1OMUuD9zAaum+w3teItmaHI7VXdoeHIDP7ohmBCsO64DPHVUJa7Zcs6xJi6ErwIXPmqc232oK917urDhIQ7MmcerclVhehM3KWJ4zwwaLOIqXJBVW4K+pfhzi6zaiPJLfDa1Q9LSbmKD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346721; c=relaxed/simple;
	bh=WUQgMU5AFmy54jFUujY0aGP0exCKza+Uj2BmBxcY7JA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RwgaKzSyGEb4p+QqCMG7qtoCuESt5LaKjXL5Ej13iYXmRBowMIc/a8D47VSQxXJZnTYVe6V4ZFMGGvRDYealuk4A/Rdt5YWk31YMd7i1qZEzAT54xoS4LC3WKESh7bBDaeqip4nw2gqw/4cDoBWyE/D34zzHhcZoNNJvW3YPxEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wVyqml7j; arc=fail smtp.client-ip=52.101.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wVyqml7j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tst8ja2gcSMsQaf+R+PSPVRBzzfJP+AmCXUwlclt0sXIDhzcuwiDQAOjcIqNliBP/VkpehwfBsF0xSiWiK/J2AAKWLnyB/xRZLeWi+IjNYtyQ3Gn/LTWudSNKo2LJr61yvKkhUjc4lY20T+/saDu3l4RpUZKEmmnuLirQo1ifsHLoFh0C0PVGTW/oN/QaesjBgZMl/3vaEiDjQjZl9DsW1/RHOi6YMHJgmi1UHunvD/JfjbVZHT42RjXR075LBPBQowBFN16F35I9UuK/pllFB0k+0ixPr9Tli8RQ+32x6uoC7yFuBeEK52r933KuQlFG+XbBL5HLydQ+MxPfXm+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpJO01lry9eP8W3IeaG1CdZSdFrTdTPl8/LbR5iEufI=;
 b=AA/GTirRHLcH3K/skR+74jg3mLqqQMQBZNfkVffrodi5r71+1IklALvjDNTo85BgyB9Q+p21Bgpkb8IXjCA3sZll6OvWxh8xfmzJUeXdJ7OPJy38h8ckhCXvEDBdVvHLQR5e6YtAZBrHZ7etbgSemrl6+FhOEKIEG5p5aYjVExOd+yy4Q6SpSwPIx0Jd4podJsW8qJSYkE/hW8lScKFG4ELVSe+9MfeVlbeY7JQtnKhA7mPbgluMG31rYYg3D/KFx0gorVvP87fWoWkmxpc5iVjIc4FKFtQYQ0BdWznSKJhgjq5z/uLV0iaJ489BtQoFEG5HFeS8inKTHFutcD9T2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpJO01lry9eP8W3IeaG1CdZSdFrTdTPl8/LbR5iEufI=;
 b=wVyqml7jcQ7e+lZCoilgkvgmvw2GIHtr1c5SAudXGEe17W0umsblVypX3Wo7OmkOMPXurO930MDz0t/Fgo30vCQfhK/Btcj/P/JjN2mZL+RphXyK5pdI02KVzwtpwHSFqj558db5YFIstwsNA751+itQI7Ad+M6eFCCc9cnl+7o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 SJ0PR12MB8615.namprd12.prod.outlook.com (2603:10b6:a03:484::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 14:31:49 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 14:31:47 +0000
Date: Fri, 25 Sep 2026 10:31:39 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Kees Cook <kees@kernel.org>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	muralidhara.mk@amd.com, naveenkrishna.chatradhi@amd.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] RAS/AMD/FMPM: Fix spurious BUG when ERST record
 enumeration fails
Message-ID: <20260925143004.GA1859103@yaz-khff2.amd.com>
References: <20260925030918.3428029-1-qirui.001@bytedance.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925030918.3428029-1-qirui.001@bytedance.com>
X-ClientProxiedBy: BL1PR13CA0210.namprd13.prod.outlook.com
 (2603:10b6:208:2be::35) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|SJ0PR12MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a99d26-03ad-4bf5-7614-08df1b11baa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	FOVbd5a7P3M0y9a4qUaUw/dv0bZ1AUyGG4n3dBb1Z+XL7iHV3Q9AQghu92845zpUl3QBJP8vCx/U7r6+6h2ETDruAp+GoUiOm0gFiY8f8ZylycKQIwpma2RAUxNxf0B3NLhIkOSjGdqoB9V55DdYrXbU1bWx3qhPqa8Cy01xkoA288OXgNbqav68p0+U59LlE0X5XfraG79Srom2rUz4yoNSSXEBilZDWbD3seuLRQiZvpzWZjXdAGVrXi+oEn+YSFmzROsVLMGQqLM05p3XuD8Te6i56nVcx1oe7bUqWNWHGjLGTMCvR5ZWR8zhG0qUAFV5aKb6PsV38jLSS/A49b236Af0sAVuxzyVsfvW/gPjWNO8GwEQj/bDijquQ+0amCHF6+UmBfMw+yqW07X2PuASXarlIOw88caVpBFxSgukusUKPa3Dg1zI7QyBjptww6dsxCjEo9A7YPzbmK3Z7VKeIqXu4ydyDZKTxXT18XGHMIpbsvl7940Vyay4gemLQNlc8IGon1Gn9FsxG/p3uZSbeFNO9GJTXminm6fq0g3aFGF/36X66bbqVNvELrW8YG0Zozdya1Juy/cgJSlChBy/AsFnPaNQaSy2BGvfYsrLIrClb4aVCm0MwSxsb3pXIV82/L/N+0uXSWPvWavA71kJKhWifx2MlybPgq72DJE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?euXJg9BQ9mkNBk8PDEFgRJRi68Nh2TVQTo4oJCLFqZ9+lBJy5cf+PIp52D59?=
 =?us-ascii?Q?CNFqbIUGUAHxmXjzVMjOoOy6ETBA7qhlG30xdCuX79xv19G2dfgdWf5q1gor?=
 =?us-ascii?Q?6bLjdvPMqCJ21w419nL6pHv4Gae6BExO1u5NXwquhpr6SiZCJ1F+t07ViIlD?=
 =?us-ascii?Q?CZ9VmpsZzNuJT2xNAIuprlX4E6Nmwd31W/YuqitQv2bzKresQiZ7sKZBOB9F?=
 =?us-ascii?Q?j3WEyV6uefmCtvxCeq/jpBCGuZn3A8/tIbtzvfuqFtdHCL0y444o+iwcQGx9?=
 =?us-ascii?Q?5Ytd3tH9HlbmPDbcB18DuyzdcjJc9IQU5rNBW1IweM/dxTiuxcA6y4ZkCdDE?=
 =?us-ascii?Q?3gijkt5r9Ery2DjSONn1GnsIdZDjQo5sxwM6ZyQTdXELWC1PV9YlZ4VEZ99e?=
 =?us-ascii?Q?ocoSV+Y3dm7FazcLtzYEW5BpSwwC1i6Ejyxys/x3p825QHI0jAMfvkubFstl?=
 =?us-ascii?Q?KXX5izE2UrMZhDJbam4LjYEYOF4Px5SWgenHci0vBA4pIImxb4dfGA3hSXgc?=
 =?us-ascii?Q?gJjkMfBfH2b0kIsnq9wf6g5gHcgvebZzDsb5WzBd7K8V1x63B0h8D7ume5Ga?=
 =?us-ascii?Q?ttJgjlXIFjJxS51PgKjL/TB5PWlw1McKSCj8jCEr45ogJTCtLHS4R9VodGpy?=
 =?us-ascii?Q?4Hgyl75X0gvyrDllk4rQdTey60TGLy39TRLM93piR4NgPX5vdoSggdlRgnzM?=
 =?us-ascii?Q?PKC8RtzcldiF1SPJ8Ca+GyrGeUKOEJfkvZ1axDr6EX1n42sb3Hr4dxkLo3ig?=
 =?us-ascii?Q?7UKRn6afbldBKKlt4eaPrzynDS4VQmW6Xx0ohuI0W+rVGhIVYjSU4S4ggChO?=
 =?us-ascii?Q?20K4rPxZT4G4MB/G7136I72YieG3DXaqVJK5/uDn2BARM4khu2SeT3/rRoUv?=
 =?us-ascii?Q?YG2b8UkIdKHz8GohiApJYf4oNACS7C9gr8HOwmI+67ie3Tf6Pn62OEscdjym?=
 =?us-ascii?Q?Q7ZWHGJA7meTV3hri1vYygy3ux+qzkorrd4F96eCd8g3c4bHH+TsLUYdDo+H?=
 =?us-ascii?Q?y4l60+WXnfKXLkZl8RYOqp5Jhjypgt+A/BTx5XKiJ+4zfogLN8kh031ykI6Y?=
 =?us-ascii?Q?tm7NtDE0LEpfAwQnLE4P0NPhc7juitmx21RSVEd+nJd24zhowMSC7MR74OWE?=
 =?us-ascii?Q?CVHsKjHwiCNWayPmZJqxn8t3e+SCwJLDAvDlvaVqX4RIrThBEvwBbRA6oc0u?=
 =?us-ascii?Q?EutUAhLlnJ6xH746/aF7WeM5CSQwsRZXSLY1Mm+oZ+cKUgf4WNsGD2TcVWRw?=
 =?us-ascii?Q?tzK2WnZNA4hzYfeSStgS+OVRDInjz6FQssDWG4yYJ0jURFPPgc4Rf4eEukq9?=
 =?us-ascii?Q?M3sWLFVltoTRUQf6XoaFfJgK6pXRuG8LY8LEmNkKxb2DiAqM/2s4UFikv08S?=
 =?us-ascii?Q?KWkhiLdtXyGKo5ojgYKwTPNYtJfNHwt3VHlY8Ic/9pjdrm5GSTE5xwmogtfu?=
 =?us-ascii?Q?0EFeN7OV7Fv6I+D4jDfZTqwLDdrpsa2DUVzd1iHWzd2nrog84+NZHtruPm0P?=
 =?us-ascii?Q?EiTB0GcK/6KIfh57BIqXHszuhESYnt4tPaVy7Gz63Qvyls3fDWVV8OlhqFIs?=
 =?us-ascii?Q?655RbjqMKcZu1eeKC77nd0Y8pr3NkomgsVcrDQMCTu8sjCpSMEMfc+XRQ1Zo?=
 =?us-ascii?Q?nbQGhoBJZc1URDIOtkmBEiHDsKP+4V0thELMjkcAuppwvq1ZkwXT4xod5H+d?=
 =?us-ascii?Q?GNbOL8a1IlSygXockuSZsvMsU/ZO/OOBFYumRc+otOd6Egkl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a99d26-03ad-4bf5-7614-08df1b11baa5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 14:31:47.2637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ap8i9Kr6FVhPCLgcA/yM5w1sXsAXGl6sbGR5GZZ6fp4/srlbRibHmzlztEOnT9lIzHEe4AxiJLgw365c9PvtWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8615

On Fri, Sep 25, 2026 at 11:09:18AM +0800, Rui Qi wrote:
> When erst_get_record_id_begin() returns an error, get_saved_records()
> jumps to the out_end label and unconditionally calls
> erst_get_record_id_end(). But begin() only bumps the
> erst_record_id_cache refcount on success, so calling end() after a
> failed begin() underflows it.
> 
> This is reachable when fmpm is built as a module: if the cache lock
> is contended (by pstore, erst-dbg, or apei_read_mce) and a signal
> arrives, mutex_lock_interruptible() in begin() returns -EINTR without
> incrementing the refcount. end() then takes the lock, decrements the
> refcount below zero, and BUG_ON() fires while still holding it. The
> loader dies with the mutex held, so every later ERST user blocks
> indefinitely.
> 
> Built-in fmpm is not affected, since its initcall runs before
> userspace and mutex_lock_interruptible() can never see a signal.
> 
> Fix it by jumping to the out label on begin() failure, skipping
> erst_get_record_id_end(). kfree(old) moves to that shared label so
> it still runs on every path.
> 
> Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
> ---
> Changes in v3:
> - Reword the commit message per review feedback from Yazen Ghannam.
> - No code changes.
> 
> Patches 1-3 of the series are unchanged and already carry Reviewed-by
> on v2; they are not resent.
> 
> Link: https://lore.kernel.org/r/20260924161746.GI1080284@yaz-khff2.amd.com
> 
>  drivers/ras/amd/fmpm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
> index c13db1f743e5..48a437042953 100644
> --- a/drivers/ras/amd/fmpm.c
> +++ b/drivers/ras/amd/fmpm.c
> @@ -673,7 +673,7 @@ static int get_saved_records(void)
>  
>  	ret = erst_get_record_id_begin(&pos);
>  	if (ret < 0)
> -		goto out_end;
> +		goto out;
>  
>  	while (!erst_get_record_id_next(&pos, &record_id)) {
>  		if (record_id == APEI_ERST_INVALID_RECORD_ID)
> @@ -714,8 +714,8 @@ static int get_saved_records(void)
>  
>  out_end:
>  	erst_get_record_id_end();
> -	kfree(old);
>  out:
> +	kfree(old);
>  	return ret;
>  }
>  
> -- 

Looks good to me.

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
