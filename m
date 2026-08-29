Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021109.outbound.protection.outlook.com [52.101.100.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4916A1C3BFC
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 13:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788011701; cv=fail; b=BEvqgp+NPHdDO1xIzvC0gpFJWE8CRwXLi2e69ef/VKRlr+j6CkGuFCDO95FMG2yKRtNpIt/RRTkVIpvW9616F0W43fRrWUcrjopPQTz2sVjnK9xowuJdXqag0qjgfWEf5petCNWjykqelbzSm/4mtd+pumJIaTlsy57EFtFpXNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788011701; c=relaxed/simple;
	bh=9Mlj1SSFI4z4ZcTSRJfcRSGG+eLLR1T3CI/m6szyFuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EqVzVFX1l1lJnVN7AEZXus7AyRaWNs7RCQYa0il4Zcaai4ExuECwf1Eh9sxCZ0wULRk2w5dCfEERaBeTO5XUstS687w2A+VNM4zInMU3XO7GsH7XZjN9GNwBB1ebucYtN+cPnPc6dUbE7OHwZip7InTXU4pkbRbcB0KJuFxPkDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.100.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubv1p9Ut8LRwRc+y1TsMM08Bqa+FfmLKYpShrQWQuRF3ECp5RX+9qW3BDJi1ILN4R8oUf4tEChObZ+nct4BovK8MLfLValq+Pw+Hh3PKL4A9o1Sb4xBgulbOi66FQXo48X/zw0zQ5+vI15tUhNDjfaDNL5eM+unas+rMj51Zl6KeygDg7Jq3pm+hg0i/nboFvcZ5+blXbkTqnklZl1RJEgvwLb4kKQO+HJKvCmCGFZ8W8POuSLoQ69pTBmyFyCof9OF9SPQvG5jeQ3x+Xvp8+V9ucCHNzeRysF1SUWLEZb7zKC1mTQsnwhKlZcZt8SnjH8EpeMqwmyTmdP3L+O/Quw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=6D7MH2FnOMb2+PyFlWDw/xzcL6J//QNTpP0QkmtoHD4=;
 b=PSiiQ1QuOe+r6TpZ0cB+cGEbXJLvTuR6Bu1AveJBx2DalCHYrY2BvhGhf510mCnWiRQch6SQuzmQUZroQsCcbvkepvS9Eh/Az6bY7BD20jvLdtSlkAndLyQmXyU0eeaIuyIJU46JbS8P8eHd6bFHjzRluhAEnaMpgyZ8Bkx0GxZbRbT4nK5dWUoDs5OIK+l54mNe7pLjAa6QN4/BtuzMJpNaranJeQ2D1fy/hhnyHE3aEzxB6m8zU5ChqOm48LPYwPTX9ix9Gvm0V1zvgyB5XBe+CwDXE3TsyMVMZkRs0IiN/vU+VBbRqiyrDIeY0KPRxWZMUOqNZ2pjFpkJAziwYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOAP123MB8159.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:43b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 13:54:53 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 13:54:52 +0000
Date: Sat, 29 Aug 2026 09:54:48 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: Petr Mladek <pmladek@suse.com>, akpm@linux-foundation.org, 
	mhiramat@kernel.org, linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, 
	neelx@suse.com, sean@ashe.io, chjohnst@gmail.com, steve@abita.co, 
	mproche@gmail.com, nick.lange@gmail.com
Subject: Re: [PATCH v9 1/2] hung_task: Reset warning budget when problem gets
 resolved
Message-ID: <nh6j7iplmonvhimh3h7xob4elryuowqfzjau2fezw6zismn4ji@ndm5cmdwej6q>
References: <ao7LW7-3GjJzKNp0@pathway.suse.cz>
 <20260827153001.18515-1-lance.yang@linux.dev>
 <apFPXhPynOlfON4B@pathway.suse.cz>
 <bd452f33-a34c-443a-bad9-a03012de7c29@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bd452f33-a34c-443a-bad9-a03012de7c29@linux.dev>
X-ClientProxiedBy: MN0P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::31) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOAP123MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c3a1812-47f4-4c00-a826-08df05d51980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Qn1/6xAxG28XjPaWxKgMxUpOUwwrOFPrtuDIqyeUU/LsN1/UKRnftp39ixkcGaF6DfiYKvuCL35No5ZO7GfqvklIr4eLyk1QDDe22Wut0tbMLYaDjqikkOFnyHtBYPXGOENIfY597xlUiupgakSw9TRpZaNoxpY2Nc8bL/lDiN/nzXgtntP8/7QHpFBZhGFmUYZksrScX7vTK5vDimAZkIml4RDEDPz6jnsiXb13AojSn3pKpBqrRynjkN1Xq8/rsGkid41eTM4kQEk6Su1gvYzCkqW756QcIv5o0/jv/ED3iiKLGxZUJoBobmGN33HnQjHNKgb7DhFR4bXrFCEwUsopRFA9f+e49689YqUBkHWR0ESq0ciL9gl1E60GvB99syzQSqaHS9sVAHg+B1QBoBLfeRj3MOaMwAHeDw9vo5KXwCZASqrNjTZShyiEEjgKrPv+a3gnYuN2QVcn/3NsaTwJoy1FeaD4BhZZ6z8SebUOn+fV0S9hcKyu1ZkNwcBGfFTLNiPfAfxCDbcV3hcIc6f+zinlxOjEuJqum6mGpcBRTBS37pJGMeuhtV3vAH+w/AVL7MAkGn0SKWsJt04GFFvS0u/f/SgxvczQO3TNTPcK0oin8/K0ydMD1Ch9PRzjjEA+ZmEQvjr1J6ymnV0L0W837L+dXCFcJf1upzrfQTU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmVMMTVXTmptSE41VFhRQW51d0dwZFZycE5TanQ3cUlGeXEwQU9IcjQ5VG0v?=
 =?utf-8?B?Mmo1am96TVAyQnRHRXlGM0tSVnYySS9Tc1JXVHdWVTQ1YjFxWjNqdUViZXMv?=
 =?utf-8?B?eGZtanhoWS9jelNrelg0WGhXMyt0WDJzMkt4SW1La0ZOMUZMcTRDYW1qSjVX?=
 =?utf-8?B?cm4zTGxBamFzZGwxU09PakFBdncza1pPVUkyaUI4YVZTZ0ZzMGdZQzQxVktD?=
 =?utf-8?B?L21FeWRGbEFKTTJacjR0eDFIczBUVTVFRmdkeXdLQk1MZEpJc3JpTFNvWXRG?=
 =?utf-8?B?akNUdVhJbXVWRXJ3R1dUK0dTZzFUWFdjdC8wMTZnSTdzNWFKd3BPaFpoTFJ6?=
 =?utf-8?B?Q0MxNUxHV0xzQXYycytLVDRyd3ptM2xWcHU0eUpHZldScmhXS0JNdmJSSlBE?=
 =?utf-8?B?aHBUVC9VZ3UzWXhRNmVCOHoxQ3VuVWc1bW5PaDhzVUN1dlA0Zkh4VVRUb3I5?=
 =?utf-8?B?TlpWWWsxNFJxRDUyRWVhUUhoYUxuYUhML2Q5V1JYa2tacHFLcjhWZWVuZFFK?=
 =?utf-8?B?Mlpmc0RHNXlQZUZ4bllKbzg4TVZ6RUJJWjVyQnRXY3VTN2p1WHhwT2RXbnNj?=
 =?utf-8?B?QU1Pck1EWU5CVUMzU3lLUFpEQndjQnlYY3FnU240Z1NPNkJERnNoUUtIalda?=
 =?utf-8?B?U0NpNEZDM2ZGSWxDS3EyYmUwU053Q3QzSEMvZTc4aSttVFpPcmxQSU1VUXAw?=
 =?utf-8?B?aWY3V0cxVWh6bjQvN1hKam1seTdnOEJEekVIUjBJMm9oeVZuRmJSbzNEZ24y?=
 =?utf-8?B?ZVQ5RVQ5STFmbzE1TWV1Q1B0V3EzaWdxNENpT21UdHdoVHp1cXpVMFdmNjhP?=
 =?utf-8?B?cmtnemZNSHpjL09VcmxlNkNOdEw5cVNsVEJFL29rNTBjNnMyYjFzMmE2WlRn?=
 =?utf-8?B?dlVFcStlQUxyWTFMTS9BTy9UNWQ0UFcvNThMb2JxRFBMbkQ0eUtKbnRhd3NP?=
 =?utf-8?B?QVJJSmloVGlFQTVrUWI3U2lIenUyVXp5aytZUEg0YXp2WWhzWjB2YjNxWjNK?=
 =?utf-8?B?MktWNFBLaExCT3UraDJVcWJDOHNrOHNUQ2J1ekNLdk9tNkxuNGh4L3czZU5V?=
 =?utf-8?B?SW5xNmxTYTZsRTQ1OWFyc05DYzdmelpyZjhwZ3VJOVpuRXhrZTM1bjg2Uk55?=
 =?utf-8?B?YmpaUXIyV3ZHaCtTclFBRDJSa1JqYjhJMDNodjY3UCtIZzBmZEZ3WHFYTFBU?=
 =?utf-8?B?YmwwSS90ZGUvb250aXUyRVFSeDBiUHBhTHMwSmUrTEl5VVZjRWFiN2lwam0v?=
 =?utf-8?B?M1dpdTBsWGkxN3RZN1dFYTBJbUZEZ2R6NmV1Nnh0QTRPeW53cDJVVFB4b1VD?=
 =?utf-8?B?bExHYWtpd2JGa0wrZVlUTHlub2w3VThXclRVaGovZkh3N1JqNkZacGIyc1hL?=
 =?utf-8?B?QldmcXpWK3krdis4WmZWTEZkSVJIWTFSelR6TTJaZG5Fcmt5V3FiQjBQdWpI?=
 =?utf-8?B?YWpJMENGd3hRU0dYT2FYNlhXNmdZUlh4NnFWV2tNTlQzWlBhaUhGQ09yS0Q3?=
 =?utf-8?B?anJUdUh1ZGZ2SDFlVkxzclM2cUhwK0tCQW95UytWV0VZVGMzYWl2U0MvNzcw?=
 =?utf-8?B?d2lsQVJKeHZDdEpwOHBlYnE5aDVNTW53R0t2LzBoN0EyMlpLY0xIc1hIK2lq?=
 =?utf-8?B?aEFxamM3Q2dwL1BuN3Ixak1DMWE4MnRyNW5Qd3cxWmNSaGlSdmNxTFpPWmwz?=
 =?utf-8?B?aldVWDJORTZacXRwU00rQVJXY0c2WGk3cEZGQ0pRSnA4SmNtYnFKRUZ6cUZL?=
 =?utf-8?B?WCtlVVRhVFcyaDVhSzA0VTM2RkRNOFdHb0w5QlNIRnBLQWhNKzZpQzRoT3oy?=
 =?utf-8?B?Sk8vZGdBSVpkQm82L1ZiU2Q1MGk3bzV3M3FzcHU1S3NPWTNLZjVRNlNEeUhJ?=
 =?utf-8?B?SDZzWDY4b0VCVUlGejlvWXdEMkM4U0U3azFvVFVxVjRMbHVEVkk2bXliVVZt?=
 =?utf-8?B?M1FCWXJ2Q2xTL3dOUXV0TlFSL1JBSmNTSTQ0RzFjeENpZTBjcDRLbzZVaFlQ?=
 =?utf-8?B?aDc4cWpScWUzam1XM1BYa0ZWUXVQaGc5VlNiYlp4RzNuWUt6MmJ5RHM0S2lz?=
 =?utf-8?B?Y1VjTVFGd1VZbzJrUFp2QVgrMEIyYkZaM1NPVkdQSlhySFBFaDRrc1M4TFFy?=
 =?utf-8?B?ak1pWGtiZy9pSDBEMldsOUhQeFZ5RVEvbkw0cEZ4aXBpZzB5K2d4WjNSWHVj?=
 =?utf-8?B?WStHOWZ4MGdBckdNbnVXWlBGUERLcUw1YnZzRTVNS1JQRjFDdjkxZzNPWWx2?=
 =?utf-8?B?TkcwQ1VsRmtwQ0FjRC9EMVh4U3J0MUNNVEs2RnZZVk1jclBXdTZheWZNRWwv?=
 =?utf-8?B?bDVBV1hvYW5ERkcrdmV6eXYzSlpBaTdkczUrSDJleEs1VVkxYlZRQT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3a1812-47f4-4c00-a826-08df05d51980
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 13:54:52.6121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UP7DAqyjzSwS4VtY+bZYTDBEcUEjjxG5+PU4AQRb15VH4lAwdHyvaW94MQMNegBiKOYLkjY8gYGIYY+Nrx8SAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP123MB8159

On Fri, Aug 28, 2026 at 05:22:55PM +0800, Lance Yang wrote:
> 
> 
> On 2026/8/28 17:05, Petr Mladek wrote:
> > On Thu 2026-08-27 23:30:01, Lance Yang wrote:
> > > On Wed, Aug 26, 2026 at 01:17:47PM +0200, Petr Mladek wrote:
> > > > > @@ -314,6 +317,11 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
> > > > >   	if (test_taint(TAINT_DIE) || did_panic)
> > > > >   		return;
> > > > > +	if (atomic_xchg(&reset_hung_task_warnings, 0))
> > > > 
> > > > I would use here atomic_xchg_acquire(). It serializes the ordering
> > > > of reset_hung_task_warnings vs sysctl_hung_task_warnings.
> > > > It would make it symetric with the barrier in the sysctl handler.
> > > 
> > > Yep, _acquire is enough here. Plain atomic_xchg() is already fully
> > > ordered, though, so this looks like making the intent clearer rather
> > > than fixing the ordering :)
> > 
> > Yes, my intention was to make the ordering more clear and symmetric.
> 
> Yep, that makes sense. atomic_xchg_acquire() is a better fit here :)
> 
> > The original code worked because the barrier was even stronger.
> > 
> > > The old-value return already makes plain atomic_xchg() fully ordered :)
> > > 
> > > ORDERING  (see memory-barriers.txt)
> > > --------
> > > 
> > > The rule of thumb:
> > > ...
> > > - RMW operations that have a return value are fully ordered;
> > > ...
> > > Except of course when a successful operation has an explicit ordering
> > > like:
> > > 
> > > {}_relaxed: unordered
> > > {}_acquire: the R of the RMW (or atomic_read) is an ACQUIRE
> > > {}_release: the W of the RMW (or atomic_set)  is a  RELEASE
> > > 
> > > > 
> > > > > +		hung_task_warnings_printed =
> > > > > +			READ_ONCE(sysctl_hung_task_warnings);
> > > > 
> > > > This would work only when "sysctl_hung_task_warnings"
> > > > is updated using WRITE_ONCE(). But it seems that this
> > > > is not the case. My understading is that it is updated by:
> > > 
> > > Wait, I think proc_dointvec_minmax() already handles this.
> > 
> > You are right.
> > 
> > > For proc_dointvec_minmax(), the converter is:
> > > 
> > > int proc_dointvec_minmax(const struct ctl_table *table, int dir,
> > > 		  void *buffer, size_t *lenp, loff_t *ppos)
> > > {
> > > 	return do_proc_dointvec(table, dir, buffer, lenp, ppos,
> > > 				do_proc_int_conv_minmax);
> > > }
> > > 
> > > Here, i is table->data, while lval is local:
> > 
> > I have missed this.
> 
> No worries at all. This was easy to miss in that call chain ...
> 
> > 
> > > static int do_proc_dointvec(const struct ctl_table *table, int dir,
> > > 		  void *buffer, size_t *lenp, loff_t *ppos,
> > > 		  int (*conv)(bool *negp, unsigned long *u_ptr, int *k_ptr,
> > > 			      int dir, const struct ctl_table *table))
> > > {
> > > ...
> > > 	i = (int *) table->data;
> > > 	vleft = table->maxlen / sizeof(*i);
> > > ...
> > > 	for (; left && vleft--; i++, first=0) {
> > > 		unsigned long lval;
> > > 		bool neg;
> > > 
> > > 		if (SYSCTL_USER_TO_KERN(dir)) {
> > > 			proc_skip_spaces(&p, &left);
> > > 
> > > 			if (!left)
> > > 				break;
> > > 			err = proc_get_long(&p, &left, &lval, &neg,
> > > 					     proc_wspace_sep,
> > > 					     sizeof(proc_wspace_sep), NULL);
> > 
> > I have missed that proc_get_long() assigns the value to the local
> > variable @lval.
> > 
> > > 			if (err)
> > > 				break;
> > > 			if (conv(&neg, &lval, i, 1, table)) {
> > > 				err = -EINVAL;
> > > 				break;
> > 
> > The real asigment to table->data is done here. And I agree that it
> > goes down to proc_int_conv() which does WRITE_ONCE().
> > 
> > So, we are on the safe side and do _not_ need the proxy table.
> 
> Agreed.
> 
> > 
> > Now, I am not sure whether we need v10. It might be worth it.
> > AFAIK, Andrew has not taken this patchset yet...
> 
> I think we do. Definitely :) And if Andrew hasn't picked it up
> yet, even better. There's still time to fold the changes in :)
> 
> > 
> > I am sorry for complications.
> 
> No need to apologize at all, Petr. I really appreciate you taking
> another careful look!
> 
> Cheers, Lance
> 

Hi Andrew, Lance, Petr,

Thank you.

I will prepare a v10.


Kind regards,
-- 
Aaron Tomlin
