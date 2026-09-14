Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022095.outbound.protection.outlook.com [52.101.96.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C6C3E95B2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419259; cv=fail; b=gzDbFg4/b/0geVnsfJKf/IyZhNyrhLFVOITh/zT6IPsS2PykE6Z/ZphSf/PUYZSHUbUOKyqRKI4o/ipTfj+Ke4KsS+oBg2C9peSXcWgx0MDr+RQuS2+dxWUvIj8YvHm/hnSJbJKWpZkTQS1DOHf3x8VTw16W+PU4Jj+ayazpYyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419259; c=relaxed/simple;
	bh=EgYki2qTg9jEth3mgB8FPu5aA6K7JymVq1hT1S2nUjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vbz+YusvooXmSBU+ZWNlTF8P3uCcvkLj1udNj3EzCa7sDZUQiOhqbyTdM8iQ6oSpjaRkrjSL1bxK5E0wQd4oFb6mZwB8YjY4mspjoe6LkFiGcp2vS6xhXmt+zIcfyKGtsnIuz1vylZ0EA02jdSZM/GkTU7/borvSV+5rj01xjF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5Ltvs6baQ7VVnqoFBAi8pcrXy1Yn83ajoXsGru8LTmoNkWI97aIZB6zIwyV/N0jo5JyM2SpeamAHAo4G6qmavBj8jelWyvTXFftkt0Mik6592FY2j57DXHBCnq6gu1x2iC+F6B6y6bdH6Olfjp+gLBs27A9NkPP8lX9xgjdLcr0917X/9+IA1YPiH9MKku23m881ASodZQ2jrf5C6Qw6lpH7hLJs7Ac9enKCoBCeTMsBfcNulWyYJGtqA3jQO7otE26AOa+wj55pEQSkFYTdi/H0NO6A5oGOylsZML1YCQ/iuhdQv0OrWX0Ut9Y7+vIGU1wAjG3boXx7rkE8PwwsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=V2X/+C/iMDZL9T17cW3kjeHqw8eLFA7mF4zyexXBTAE=;
 b=aGjUKPMDjmITYpE20kNWeqAASRLn8os5nbPaHCyZBqwV+juGJofE6hAs6XHTk20b0Du0I4wdRUL3KVTcCVZULPI+V5BKCt8XzdwhWyhC0YnW4SPWhAJdt+u7o8cS95rzPPDsFFrSQBsCe3gyGtA2riE+WLeiwlWmuT3jZR+wqcNrodsjilFcN2IRbFuQ3gMr5iM2xgo4nRiwSDXZzrEvZ5iu/iNxo61hcpd/si4AgSYZeoOVCmk7wWLK1EHn4jTjYLExVQh0t8kn287CHag9Il+L6z36s+V19pbXOeG0i/ONRecGEnrclZzklAw1DecyW4sqINUsTrFAPjsYLlWkTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CWXP123MB6173.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 20:54:14 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0406.012; Mon, 14 Sep 2026
 20:54:13 +0000
Date: Mon, 14 Sep 2026 16:54:08 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Tejun Heo <tj@kernel.org>
Cc: leitao@debian.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tools/workqueue/wq_dump.py: Add busy worker
 inspection and BH pool states
Message-ID: <jktxu3et7suijjehlaosiz4cdudqjarqxnrygmsipodegd5x4u@choklcsxima7>
References: <20260911210625.535285-1-atomlin@atomlin.com>
 <22e5b93e20119d75440a731054e2845a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22e5b93e20119d75440a731054e2845a@kernel.org>
X-ClientProxiedBy: CY8PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:930:48::21) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CWXP123MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: 7995a7b4-638a-42c8-11ab-08df12a25557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|3023799007|6133799003|56012099006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	1rb/Y8vADCp6VdhfaOTZC+AzYeKaFzAt/uzyVFtIFWeqdPUF/I1JlO0C9IauzoT/MQbd/oeGNDlwvUW6EfOqcf/nZecqK6FDV4m+Jri+RHmFKH2V3ZVki+chhx1q9DKSjqvFkM4p4ty+SnlANivgrJ8vP8UNJgeetSluzkTOfvPelF1F8CqFQ2bSLVzGM+Wi+8BAU5TDM1csMqMCHlbL89qG3i0dJ38KrHjA4pVEVB8+nU0B5hfZZ+4nmmoi6LQH+7F1hm+NmeUKoL7W24LA8OVknL4rqcYsK4t2Y5pypLGBGaPkmlHpx4C98+xNxcYvOUNIyITw63T8ANRYFcAnEB22jtvyWVD+gHou5jQ/Qtda7HNCV7Rzvxxc67zmrotuBQgSozhgoSTcwMPB2brved7lJOnQUj3GBKyMJLpMg3N2ITfTUxqrZZxbEKr3ZqFmwoEHu1u6+n9tkR9co9AxfM839LPE0fHo1Xg4VlEa7YVY5+NKb1f8ji2/SmnGZKVK7KMDIzs5mqiGMHTVBG6EeyvmJA5HjdxjOGfRC/DD3dxAv8wHJ8VHnusI1A67SkxIMSr3R3YEhSCyQInsTHd6y5SAC6AojGiAtv49FdlCfTyKBJkrGV752QdRRYb1r242oNDs3rMgFsHvfXL6A4XCBY6M5/rVEaY8Rcsi6I7SAtU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(3023799007)(6133799003)(56012099006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGxXcVcrcnoxWThmemp6cGNTeEdGN0hhc3VlSmd0akdXZzhKQU5VSlhsNDVQ?=
 =?utf-8?B?SHdkOWpMczFoVFdPOU54bmo4OVBVc3VFU1JORzVnQjJlYVp4aDBpeVhJOWpn?=
 =?utf-8?B?d3hIa3pOTEZqbGZGWmRXT3Z4cGJVMTJ0V2FtR3dib01XNXFKUjVqZU5HU0tp?=
 =?utf-8?B?cjIvczJaeUhZUlFPeUJOankrRlpPeHhQWmh4ZUV5VUJ2ZWcvaTRhNEJLNG1x?=
 =?utf-8?B?dG04NHhEdmVoT21yU2NDVCtDY1VNYU1rU2dXVGtkdnEzYlFDcjAzOVVGMGxz?=
 =?utf-8?B?MWhTa2VnZlYvT1ZQWk5aaENoRVg2SXhYNW84YUo3ODdyZUtpRlgwYjlaSGsy?=
 =?utf-8?B?NUowTUF5empDeVVpbS9MS25zUFJXYjhrTmpmQXVMTWJhQzVoK1RBNlRDbm1V?=
 =?utf-8?B?TGsyUkpjR2k2Z09ER1NmU0pma3lVOG1vVlgxOFJ0YXMxaXAzWnN4TkdWdVdR?=
 =?utf-8?B?aFUyc3llQm5ncDFURW93M1ovSnNQVlhDTzJFaytiSHJJbTAwaFk4aG1XamhS?=
 =?utf-8?B?TXQzL28zS25QZTdVTG5MTEtHZ041VHNKSFJPMEpaTUZ5TDFSTkFrOUtHNTFT?=
 =?utf-8?B?VkxXL2dZYWhCd3FDS1RUR01TdUxSSndTVWdBYS93Vk50VFlIVHdvVkJ5dzZp?=
 =?utf-8?B?cWk3ejdiZC9ad29zKzZxazZ3aElNL01UTVl2OXdjL3R3Q2s2MUFnVm43bmNu?=
 =?utf-8?B?TVF3a2RjZnkyL1kwWDdPK08ybHBpK0JyVENVSEpDbzByNU14aklmbzdDZ2Z3?=
 =?utf-8?B?YWtDa0p3K1VXNmRVdHYwNnpxamdKQjUxbnk3cGFyQ0RjMTlQRGJnNml0Slcv?=
 =?utf-8?B?LzhLVEk1ZWMvV3JCL09HZTFpL2ZjOFZFTkZERk5SSjE3UTI2bUNpUHV5M1pG?=
 =?utf-8?B?OUdyNVAvYjI5am5Yd09MYmR5eHUvZ0xOcjlYN0ZZSzBlK0EyVWMxempxbFdE?=
 =?utf-8?B?akFRNmV5T0xTaDRHenNLQk1kUEJxcW5tTDVCenJNUjBjaVhkRUpFMmlkWlhQ?=
 =?utf-8?B?alQ5NzFJOW02TjJCRlFHRVFqVXZ4c0VFVW5aRDFqSWdOZlh0dGVuRFkvN0pQ?=
 =?utf-8?B?ek5WUjZ4VTJ2aVJLektyZEt0MnhpQU82V3RMaXhCR24rRitOUE1GQnJjeWpY?=
 =?utf-8?B?MGdyZjNkTjJOMVBjYXA5SkgyeU1uZk5jemtBN3h6STJLZVAxRElDeCtlRXBI?=
 =?utf-8?B?aDFnTGY2WEZ6ZUNmQ0lsc2NwWFZVMEkrSzM2SEFHMEpqNi9ZOElpMCtlNmlG?=
 =?utf-8?B?ZGk2WVpiTFVYYXRUV0xPZ3ZqME5leVp6eHovbG8wdC9Ud3l2cVQycldCNWpN?=
 =?utf-8?B?ZGlSY1E1eHVxMnR1dzFFemRCSkxEVWhFREV5SGwzMjZZNzI4OE02QTg0SHVz?=
 =?utf-8?B?dDc4RklWblFTSnFrRDhuUHJZZ1ByemdGT1hQeWtoalpVWWNYSDZxeUhsK3RM?=
 =?utf-8?B?N3ViZjJ0UGNDcXpxY0FSQXNmSytQanRyRGk0UFQwZDQ2blloazduc25FU1hJ?=
 =?utf-8?B?cXlMOUtmWDFxQ21wMlJ5SEhmMmNKb1J2WlNYM2UyY2tuYnZVYVczS0E0dlhY?=
 =?utf-8?B?U1RaYmowd09MMGZOOHdPRGNKdTAvM2I4VW1CMG5pVjl0R1pGTmgrbENYYm9u?=
 =?utf-8?B?V2lNdzdKZFRuMWNKT3Zia1NkMldsRHNvcUJLaE40Vnluc3VqOXh1WEF0Umdz?=
 =?utf-8?B?cVVVNjN5cllXNXdTaEt1UG5RQ2NtMGJkaGV3NnI4YWhTWjV0T1pkSE9BYVJN?=
 =?utf-8?B?M0FFUHNSZkpVOEFJWlUrVFgrMVlsNzZjbE9sd1d5OGV3Q1dFMTBURXlkL0pv?=
 =?utf-8?B?ODVYVkp6aGxDZXNpd0sva1RSSkxpZ2l1cmxpTENtRytEUlUvZVA4QzRTYkNx?=
 =?utf-8?B?TVhaNzVNK0dBdStZN0UwaUVsaW9XZG1jT2ZDRUUxbHphcTVPV3F6MWFhSk1P?=
 =?utf-8?B?eVQ0SjRXdzJlcnAzMlJHay9uUC9nOWszZU5HRUJPaCtmaU1icDVVQWJsRXpr?=
 =?utf-8?B?d3g4alNGVkE0LzgwcDdadXpOdHM4WStRZ0JrdHlsNTBHS3ZKRU5MTC9VRzNv?=
 =?utf-8?B?T2c4a05naUhpbm14aXhjV3M4VmNtUWxNcWxmdTFJblBvKzZjRkd3bUdYSWZa?=
 =?utf-8?B?dUJGTkcrcDA5TDVOQjVoWHZFYSsycENuNHhBWDMwNzY4Mko4VnpPR3FueWZI?=
 =?utf-8?B?aXI5dVFmNk8yU3Q5bWthTUdIWHBHeXFEUWJDdG8zNnlnTEhzMGhJZmVoRnA0?=
 =?utf-8?B?RzhGTWdNQUhsVnVuWk1iMmh1cEVSWEQweVpyZ0crZWhEUzk3SXJKbFBYUW9N?=
 =?utf-8?B?UjhQeEo5dDgvZHRYVVNKNVFUcXhUUGVjdytNQVZOcHdiUDQ3QnR5Zz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7995a7b4-638a-42c8-11ab-08df12a25557
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 20:54:13.8295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifl4nsryDpFrMbi3ElRjSO4xFZAxXc/R1ZCI7pkHrzC70eIV72/+Bi+tJqSYjm15sDoBC9IWVj1Khd03yrW6Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB6173

On Sun, Sep 13, 2026 at 06:01:41AM -1000, Tejun Heo wrote:
> Hello, Aaron.
> 
> On Fri, Sep 11, 2026 at 05:06:25PM -0400, Aaron Tomlin wrote:
> > +        for bkt in pool.busy_hash:
> > +            for worker in hlist_for_each_entry('struct worker', bkt.address_of_(), 'hentry'):
> 
> worker->hentry shares storage with the idle-list entry, so a worker going
> idle can send this iterator into the circular idle list. Leaving idle can
> leave a self-link with WORKER_IDLE clear. The per-worker retries do not
> bound either case.
> 
> Could you break out of the bucket on an idle worker, a repeated address, or
> a traversal read fault? Warn that the pool's busy-worker output is
> incomplete and ask the user to retry, then continue with the other pools.
> The exception handler needs to cover iterator advancement too.
> 
> Thanks.
> 
> -- 
> tejun

Hi Tejun,

Understood, we need to address the lockless race conditions on a live
system without holding pool->lock. How about the following?

 - Guard lockless busy_hash traversal against circular idle list
   diversions, self-links, and traversal read faults: check for
   WORKER_IDLE, track visited worker addresses per bucket, cover iterator
   advancement with (drgn.FaultError, LookupError) exception handling, and
   warn if a pool's busy worker dump was incomplete

diff --git a/tools/workqueue/wq_dump.py b/tools/workqueue/wq_dump.py
index 4a3281bc5605..32be5c69a61b 100644
--- a/tools/workqueue/wq_dump.py
+++ b/tools/workqueue/wq_dump.py
@@ -137,6 +137,7 @@ POOL_BH                 = prog['POOL_BH']
 POOL_BH_DRAINING        = prog['POOL_BH_DRAINING']
 POOL_DISASSOCIATED      = prog['POOL_DISASSOCIATED']
 HIGHPRI_NICE_LEVEL      = prog['HIGHPRI_NICE_LEVEL']
+WORKER_IDLE             = prog['WORKER_IDLE']
 
 WQ_NAME_LEN             = prog['WQ_NAME_LEN'].value_()
 cpumask_str_len         = len(cpumask_str(wq_unbound_cpumask))
@@ -203,38 +204,55 @@ for pi, pool in idr_for_each(worker_pool_idr):
     print('')
 
     if args.busy:
+        incomplete = False
         for bkt in pool.busy_hash:
-            for worker in hlist_for_each_entry('struct worker', bkt.address_of_(), 'hentry'):
-                for _ in range(3):
-                    try:
-                        pwq = worker.current_pwq
-                        func = worker.current_func.value_()
-                        if not pwq.value_() or not func:
+            if incomplete:
+                break
+            seen = set()
+            try:
+                for worker in hlist_for_each_entry('struct worker', bkt.address_of_(), 'hentry'):
+                    addr = worker.value_()
+                    if addr in seen or (worker.flags & WORKER_IDLE):
+                        incomplete = True
+                        break
+                    seen.add(addr)
+
+                    for _ in range(3):
+                        try:
+                            pwq = worker.current_pwq
+                            func = worker.current_func.value_()
+                            if not pwq.value_() or not func:
+                                continue
+
+                            wq_name = pwq.wq.name.string_().decode()
+                            fn_name = prog.symbol(func).name
+
+                            dur_str = ''
+                            start = worker_current_start(worker)
+                            if 'jiffies' in prog and start:
+                                jiffies = prog['jiffies'].value_()
+                                dur_s = ((jiffies - start) & jiffies_mask) // hz
+                                dur_str = f' for {dur_s}s'
+
+                            if pool.flags & POOL_BH:
+                                w_id = 'bh' if pool.attrs.nice != HIGHPRI_NICE_LEVEL else 'bh-hi'
+                            elif worker.task.value_():
+                                w_id = f'PID {worker.task.pid.value_():<6} ({worker.task.comm.string_().decode()})'
+                            else:
+                                w_id = f'worker[{worker.id.value_()}]'
+
+                            desc = worker.desc.string_().decode()
+                            desc_str = f' desc="{desc}"' if desc and desc != wq_name else ''
+                            print(f'    busy: {w_id}: {wq_name}:{fn_name}{dur_str}{desc_str}')
+                            break
+                        except (drgn.FaultError, LookupError):
                             continue
+            except (drgn.FaultError, LookupError):
+                incomplete = True
+                break
 
-                        wq_name = pwq.wq.name.string_().decode()
-                        fn_name = prog.symbol(func).name
-
-                        dur_str = ''
-                        start = worker_current_start(worker)
-                        if 'jiffies' in prog and start:
-                            jiffies = prog['jiffies'].value_()
-                            dur_s = ((jiffies - start) & jiffies_mask) // hz
-                            dur_str = f' for {dur_s}s'
-
-                        if pool.flags & POOL_BH:
-                            w_id = 'bh' if pool.attrs.nice != HIGHPRI_NICE_LEVEL else 'bh-hi'
-                        elif worker.task.value_():
-                            w_id = f'PID {worker.task.pid.value_():<6} ({worker.task.comm.string_().decode()})'
-                        else:
-                            w_id = f'worker[{worker.id.value_()}]'
-
-                        desc = worker.desc.string_().decode()
-                        desc_str = f' desc="{desc}"' if desc and desc != wq_name else ''
-                        print(f'    busy: {w_id}: {wq_name}:{fn_name}{dur_str}{desc_str}')
-                        break
-                    except (drgn.FaultError, LookupError):
-                        continue
+        if incomplete:
+            print(f'    warning: pool[{pi:02}] busy worker dump incomplete, please retry')
 
 print('')
 print('Workqueue CPU -> pool')


Kind regards,
-- 
Aaron Tomlin
