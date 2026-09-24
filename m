Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011019.outbound.protection.outlook.com [52.101.57.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC263890E5;
	Thu, 24 Sep 2026 16:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266678; cv=fail; b=hLG/xaPgIH+gsXeNDuZmXqxT50lAzb9IllREepbzEq13lEhE+SPs2jR1pV8bpb7rbS3GPyeJGJVf7uZCuxO0CPl6n9Lj0dPFX6keW4b1l/h2kCEhpnW8YY1GMrMokhPgLPdg/90DklD7CzjxCgsbdcwZBuzs2AGyqltt0XiNbus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266678; c=relaxed/simple;
	bh=Co+1kwxnNLWxmJE4h6L//wQrUAGcDH1SIvO88dwWpbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LpDtaLKNYYhMD6J3LrMtUaieyC6c6b7Sv6skBcoFkTezFuq9mmz35un37LpN+ELS+hIF7yLf4MPP4lpF5Gp8moXwKevQMhLozRbmyW2Lxz4PoL0qO99jcopTxGJQBcK//2AJcnCeQVkAQayVz2XbzHLq4a/MMWM5SrrkdK/v6IQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RyZLHUey; arc=fail smtp.client-ip=52.101.57.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RyZLHUey"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWPvuKEQU0c3/moje1uah+tu7h3ggcvjKGrrjS7kjfBGoXiLaBIKSYHdufFpl7liOE6HDDHb/UnR8FBRBuOaevTN0MIw95VewA1Et5nzRd8tvssuVfeYs8cLV4qupZ0319tC9NXU6ca8LfG0gYKBj38leAyLLPKNZZpXWEh2LzzIgVlBdVJlUcTp8lAFdTHkuVmaa8x+KUp6/m3eFinMy2KBZ3iR85VZj6MLvu3ZpgqfF5kh9fldBdZqIOQ6sezJ4DMcDaqnMGX5jAPRHE4c5mxGIOU5UyA0/wMTLdhdUWvs5n+XJklp2XovMOdKpA+ytknKRE5FH6C5jR/nb/NB6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fspr8UzoN/yIoItRIPF6pmd4EOkBxI3aHTgPDjzNyug=;
 b=U1kz05TGErIbqllrWQ0H/+SngOU3r9i81xGKz/GA29GMGN433z5dEguvSa5hVsF7uXyXmo8ihOFiUMqJzGpkp2zVUWXZi51wdbsMI4Ee9bKcxDbUGomjIa8jMxUXq2+b/QBp6k++7iUC0mBo1PU7kIoe55Sg91N+WngUS/gWQNcw6ULmTXtwiNWT1cbKZ+Rw2Cpgz6Z6PvT7fEPKCvSwXXMzNltLChR/epp3QPjHpmm4sHhDeXSiZNS5E2Ps4qDChFkZL6Mg7pYu7jIIdnNv/hJ0FLUzcTJLV+wPH3ziCDHYwbrYbRM1h1f8mzT9SuYLwBaJhUe2BeRyzRrTAkdjUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fspr8UzoN/yIoItRIPF6pmd4EOkBxI3aHTgPDjzNyug=;
 b=RyZLHUeyhcjhvWC40zpmuoVURdqVqQRP93qggQFgbyd+ir1Jue2mEXgisLoOyFdSPtcujFaij0vSVS3RZceKG5nm0Hf1kqZ0ERtMwlRWmkPh11MJXuFCBQP+DI9+eKBPKs3mD7n6apirFYPVO9DGF+VU1DTtMtSnQVi3Y+DNFL0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DSVPR12MB382825.namprd12.prod.outlook.com (2603:10b6:8:4fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 16:17:54 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 16:17:54 +0000
Date: Thu, 24 Sep 2026 12:17:46 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: tony.luck@intel.com, bp@alien8.de, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] RAS/AMD/FMPM: Fix spurious BUG when ERST record
 enumeration fails
Message-ID: <20260924161746.GI1080284@yaz-khff2.amd.com>
References: <20260821094748.145394-1-qirui.001@bytedance.com>
 <20260826035314.1536340-1-qirui.001@bytedance.com>
 <20260826035314.1536340-5-qirui.001@bytedance.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826035314.1536340-5-qirui.001@bytedance.com>
X-ClientProxiedBy: PH7P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::8) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DSVPR12MB382825:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a5a189-f7be-4e90-0d6d-08df1a576396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|4143699003|10067099003|11063799006|56012099006|5023799004|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	zq8ONuzg9k0UUaBRr0xl6k/Btnu7ul6+eSNnm90Ecn580Zw4N5OYpWVtTCBwoNv0Cix62taPYmvg6UZlZ/gIXQ3Yo2gByy8BsqKmYlEg7QFdfA9OS24mlefm840xdHetP4u9I+g/6/kYvzrvcpzpPkwvz7WyJn8C9qdcI2RnmUpCx2KGUPIGajS/4Z5SL0wRgeDeKh5HfFb3JFXO6nxxIauxGogLJ8al2au8HpOdZ84scZA9A9JMlUZQCHa+i1HjNr8ta3xewbWFODFhbwkZ5qDlxfSusj1Qjp3GJPHo+LGSdpHNMpsES3X3TTCmcq7+hdmgd/aSGmvDL4vmK6W6MlCLMqs8HnZmvz4CDnf0Ha0a7GCQSTjF9valbl0kDVGbBDzuQiCj+ronGlNe/syUbMK9AZCPulX9+PYkQQ6b6vsGWpc3ZRtTBMp7bgHcz1Ns2W6k6mTmJKqiFkxdW/XEmFetrvEcoIq+AY8oSwpZJ0cAXbRtjvEkS2aky2Fa8c6P2HRTsSDuNFGZopt8HuHJHH0hQA9mjJnykjVxSO+cvCsXfoRF03Quq2Z5uLtiTduY/ppjcH7vOhQZjI+CEQBf7XZDf+VhdJbI+lxmOvn3JlGQFXhIDXxTDLKzKLaqRX8RTmpzNL2x+zcARpwLuzskaFVjQ8QbRliZbHa9s75PDJ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(10067099003)(11063799006)(56012099006)(5023799004)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Oi6b0P0wDsG2cna0yA0fthzuO9ICMB/P898aumvmR+7Z7wU9qk6QpfN9c5re?=
 =?us-ascii?Q?4FXomJFGDHyP6XtnHSgAJ0BGjt+kHaL5l7XlpGggLzc+e97Itpj/+KQPA1fR?=
 =?us-ascii?Q?affpf8j7FAc348lgn3dUERLwg6IqSM/BYRbTXUhJp7W1SakK0nMALoJfuwfY?=
 =?us-ascii?Q?x5/edctZvw2cqjstwU4nSbcyBut2o82ZcAVr5aQMqKhNJ6BhjUVPXHcNN3vS?=
 =?us-ascii?Q?Z9pf01PJl+uChV/6RI001ojRlk5GEvCoBibFfSzDQdlwJoVZq2kubva7vLz8?=
 =?us-ascii?Q?4f5baCOiMZtLRp89jv89C+p0tFZqKCWf3h+RVqLL/i6GqG8jXCILzvDbwrPi?=
 =?us-ascii?Q?8cnKiseNNuWnxmmV+OPxdGbfuYYvQM99wXKu1C823v2EhlPij4vCo8UNZNlY?=
 =?us-ascii?Q?Gkp07BcBZ0j+Rcu7mDbz2b0IMUEDbyiuNrxLE59Qydhgyg4ZOZEKbPOnsFv2?=
 =?us-ascii?Q?4KPW4N8PExgPvVNHqADDC5ca8UOLSCx1qETBu/BgW4ndom34MHCcuQLGhUfR?=
 =?us-ascii?Q?Eqmi8PTC800B6vth57E/yOWN0TBOrnby0BcUMHK6TIicAB53MfW/6+cqKqTI?=
 =?us-ascii?Q?Utr3GRCl+sqPZu6tEOQ3OBIk47y3KSBllWFFYNAqzC9evbssMAbMfnx5UO+Q?=
 =?us-ascii?Q?aRlpo+IqYcaxZX2O0mstfDGwO5cm9EZfgN9gRO/2aOASrb/W5kuRpI2HYssy?=
 =?us-ascii?Q?pVe/3r2ZfZURYS6Z8yDK61d+6+SzF7yLG/SfhDMfsqhaSe2hHRVZHkDHuRZD?=
 =?us-ascii?Q?xI+Fi7moLEzZsxrYFyUm1+wujs5jIRYnp0dUoLGP9jVaMJxJ69HxHhmH8NkX?=
 =?us-ascii?Q?JQzK9FtVCS/t89RnPNILhOSTdbCkXmJoWtQpPvTupI+XQH6uhS+uq2OJSYvI?=
 =?us-ascii?Q?QH6u6a70+rMDOLm4+SQ92yBodcwhMHsLTms9h0aCIizQx2mR+H61lRcwvCoN?=
 =?us-ascii?Q?fBy33gj2LtQP7w8pDHhvHLD6ZvQg4EL6kafdA95koaVGVdBL4gWSO3S05dQE?=
 =?us-ascii?Q?mOqb387VdznViW+crNQQ9s606hY+fsfMZ5mcodK4p4TnEx5j89dvnJgBNomJ?=
 =?us-ascii?Q?iVM2la/DgOjKlABsFVmldyTAIaGP2O2FRx3JzWdSNfYSCphfbxhUN9cCptuL?=
 =?us-ascii?Q?XulUXN4SyNVEf5izIU/BaBEimYs/WU33KBwy1S86WV12sdqC6wHwE+Fk2MJJ?=
 =?us-ascii?Q?VffvhsQ563WSoSXFCkHA2QJboZUt+84O2vjxm52gskkpAj4XPBoAN8MnfCjG?=
 =?us-ascii?Q?PBdrluJ/8k7jP0AonvRuahdm57kMyswRcZ3sO37ZNAhgG793WllNnIzaPhsh?=
 =?us-ascii?Q?r7VLz7UhLnpdywSHhh0ryD5ldchAmGX0dSGq9MJk698HzBLQ43gxjm9xOo+1?=
 =?us-ascii?Q?LheWYZF8S9iK1Z9DYNfGR6vSNSWz0a4O8/CbcaGmLRtZ5r8LGiFcYT+gpxrW?=
 =?us-ascii?Q?umOUm9Tr9kAlbVh7SS6KW9Aq+rURDb0hn2KSNebUc6gA3FbLpU2P3A0Ol5UT?=
 =?us-ascii?Q?aqwBCoetCEqxcGHvx0CUqM8Ea2NVE5/jlk/SB4hm5TLSAQSw2TSxE21rPLyu?=
 =?us-ascii?Q?qvYIrIGTkJaaFzGaIJVJ69XxM3Srd4CDlO0CevXhA+FiYxjS1pieYsILd6XF?=
 =?us-ascii?Q?Fwm4m+qK5ioSi1KsOQYVZIC5ka+DV6/FR0ukJLOndzDbXBsHDzBVxag5XtKA?=
 =?us-ascii?Q?vDMnZPB6gu5anUs3IWmQ/qwja0PF54P0iN0jruC5nGYYMI5M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a5a189-f7be-4e90-0d6d-08df1a576396
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 16:17:54.6789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjRwGU6WxTOUHP+yVY/WxCUYVaqIkZu71PKXjG3MVfDHXXCzg275qMKGARrD1+Is65ZEcFjQ4+uEhHRdNIkZ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB382825

On Wed, Aug 26, 2026 at 11:53:14AM +0800, Rui Qi wrote:
> When erst_get_record_id_begin() returns an error, get_saved_records()
> jumps to the out_end label which unconditionally calls
> erst_get_record_id_end(). This is wrong because:
> 
> - If erst_disable is true, begin() returns -ENODEV without
>   incrementing the refcount. Then end() hits BUG_ON(erst_disable)
>   and panics.
> 
> - If mutex_lock_interruptible() is interrupted, begin() returns
>   -EINTR without incrementing the refcount. Then end() decrements
>   refcount below zero, hitting BUG_ON(refcount < 0).
> 
> The comment in erst_get_record_id_end() warns that it should not be
> called when erst_disable is true, so callers must not invoke it after
> begin() fails.
> 
> Fix by jumping to the out label when begin() fails, skipping the
> erst_get_record_id_end() call. This is safe because kfree() handles
> NULL pointers.
> 
> Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
> ---
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

The patch is okay, but the 'erst_disable' part didn't make sense to me.
So I went over it with an AI assistant. Response is below.

Basically, the commit message needs to be reworded to cover the actual
issue.

Thanks,
Yazen

=========================

`erst_get_record_id_begin()` has two ways to fail, and the commit
message describes both. Only one of them can happen when fmpm calls it.

```c
int erst_get_record_id_begin(int *pos)
{
	if (erst_disable)
		return -ENODEV;			/* case 1 */

	rc = mutex_lock_interruptible(&erst_record_id_cache.lock);
	if (rc)
		return rc;			/* case 2: -EINTR */
	erst_record_id_cache.refcount++;
	...
```

**Case 1 (`-ENODEV`) can't happen from `get_saved_records()`:**
- `fru_mem_poison_init()` already returns `-ENODEV` when `erst_disable`
  is set, before it calls `get_saved_records()`.
- `erst_disable` has only two writers: the `erst_disable` boot parameter
  (`__setup`) and the error path of `erst_init()`.
- `erst_init()` is a `device_initcall` in `drivers/acpi/`, which links
  ahead of `drivers/ras/`. When fmpm is built in, `erst_init()` has
  already run by the time fmpm's initcall runs. When fmpm is a module,
  it loads later still.
- So `erst_disable` can't change between fmpm's check and the `begin()`
  call, and the `BUG_ON(erst_disable)` in `end()` can't fire here.

**Case 2 (`-EINTR`) can happen, but only under narrow conditions:**
- The lock has to be contended. `mutex_lock_interruptible()` takes an
  uncontended lock without checking for signals. Other code that takes
  `erst_record_id_cache.lock` includes the other `begin()` callers:
  `erst_open_pstore()`, `erst_dbg_open()` and `apei_read_mce()`.
- A signal has to be pending while the task waits. That's realistic when
  fmpm is a module, for example Ctrl-C or SIGKILL sent to `modprobe`
  while pstore or erst-dbg holds the lock. When fmpm is built in, its
  init runs in the `kernel_init` thread before userspace starts, so no
  signal can reach it.
- Before the patch, this path calls `end()`. The refcount drops to -1
  and hits `BUG_ON(refcount < 0)` while `erst_record_id_cache.lock` is
  held. The oops kills the task with the mutex still locked, so every
  later ERST user blocks on it forever.

In short, "reachable" was loose wording. The `-ENODEV` case can't happen
from fmpm at all. The `-EINTR` case can happen, but only when fmpm is a
module, the lock is contended, and the load is interrupted by a signal.
The patch fixes that case, which is real. The commit message just leads
with the case that can't happen from fmpm and understates the
consequence of the one that can.


