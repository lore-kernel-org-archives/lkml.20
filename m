Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022079.outbound.protection.outlook.com [52.101.101.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAE33F4841
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417319; cv=fail; b=dsvJ5i1DdOy88Gx7wIsxiY23WSzyPdQA2HLqW4MHUBcnkq8xJbDf/wLHih+KE+q+1D2Z8rD4kRX62bMmp4PVIhIt9XsVHB+U/e05P5czLH+1xMPdojLtO2S+49ub6mL2m+qOdGdUxuDLtYx6XKOCpQAZ1IyFdPIQZ+YiQLEHl/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417319; c=relaxed/simple;
	bh=rgPo6IPKF3XIJvYJTBTxeGMCxxTn51Ffs7HFIUZlo34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r8NeCqnHpQ5lL5180t9Mg+aatq01oPuunIU5oEb7I52zqPbbJH7LX2+CoGfRA62Kw5ZdPaMyL7sNxSmyK2tuHRSNBsiQFs+E2GebPjxBmjgI5JQD4A8nEKTH64g1oL71OOgagL64ZyjNyDLxQcpz4s1Fq500gxj7BVRX/mDMI2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyG+zQzg2w8ZhVw0wvQRdLUX3Lc26LVCWo6Ro4PNR138ZiYyx01PRzMywxe8fvRoHALF30DK1nifW0lWHViHjEV05EVi8yxP0qJaVOLPMgcIw11EdCdrt2GOm1mImYi5DgWgvNvS+SEoWOHrg4S0ZYDlqUs22vBODdAyTPRSHPDzfjDFsW16TyzGSyGX3lU4LwEAOV772UxZIk72pC3/8jcO6alHwSFhF42ygxdozO5cNucntLBEaXAhb8STMUcVW7rai1KD4PGWDQxLHPmyFtQIXJBZ4yRBwsBi8Pv1VUIMtuHzgOx0oRqRcOn3uVr6BZsetQ/zZZOuOV2xadkLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=WWEclBzx53TNd4uJIUgN01raWR9Xanmul4mTD0ee8Lc=;
 b=lcZ7Z6s0JwaeDlLiRMf5+A69DS9ZALFtOp/VxICWXjf1s7DU7ejp+yn82Z0Itcsva0dg9gbZKqDesrGZLd6zbEwTvZHrOrb8aFTXmAsiG6VjlZtEZVLpSGSxbo6EM5tErCv2lCuqAA312RfGK+DBAjQmZTp0UWgS+m5gPf/FMD7cygtuKTVsJmjDjdGR34GJGjG2/eL8vODoQ55pSFOAu5TeiNTAV1dpwbT24jPxxKENOXmp/2BRVV/CDtNI9wws6sdcb0Jh0Ohu3Lck7S89lMfa3QhckGUMxeLDCCCilezt+7W80bzSi4/csdUjYuQ/xDyRF+l0nax2LpxeyEm2Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO7P123MB8386.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:451::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Mon, 14 Sep
 2026 20:21:54 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0406.012; Mon, 14 Sep 2026
 20:21:54 +0000
Date: Mon, 14 Sep 2026 16:21:49 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Breno Leitao <leitao@debian.org>
Cc: tj@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tools/workqueue/wq_dump.py: Add busy worker
 inspection and BH pool states
Message-ID: <a7qutdbigd32hrbniz2a2rxfacvvcfwa5ysnvwjsg54dpsdxbt@vyc7ynvrtp4v>
References: <20260911210625.535285-1-atomlin@atomlin.com>
 <aqe2MTga350uAoos@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aqe2MTga350uAoos@gmail.com>
X-ClientProxiedBy: BN0PR04CA0123.namprd04.prod.outlook.com
 (2603:10b6:408:ed::8) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO7P123MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: 8888e6a7-7825-45b0-0f2b-08df129dd105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|5023799004|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hpz/2bqKwQWacTZ4j797pLf39TRmhdxoHVEKhed53y7KN4QlkXxq5MspOxXqjN7N2oxYT/UpBarSaEEs9t1fqnfBlSK4QwNHnCQg9kpjY5O2e6y+MTZtUY4HCMkN+Vn5GMwflJ9CoAEd81jJUpx/3qgF8RBDUIrUVkz9o8jBFC7yLhso09VXW1QaoPyDCyOdpmFmSkyvYfWRKLCHwhuduYgIS6KK5MV626ASVpqXyBOBry/Z6Sj5jrSX+LSThL6jHC54mgXVTPkG8vn9NIcsrmZ02gzpR+nZWHUAJBWNV62nyF4+3m2WvWU5zp12doeTzrm4p2LfreL03kRvmQWkirW8jgkwTxo9VwBgNSZ1z6y5wCRg899qKEA2S582uJJY+QIQ60TAQq9aSOz+UmR/m8852jWwZbhWKUzy6wcmH7NTZgcGiEFyK/GxZmsedGEfdtLAoJBiPi66GE0fXUhyzrucjKT+7R1KK72c6v1jfhP7n7nlR1Z7BipLzomQI2dBIDsKxxGfnRm7I0aZqLL+QiJhHYKImvIdM9U8eZOEmvUkRWsaLaxoQ3UG+Pku5aG1kUBK1MQbV3KwupOGYBIn11vWO+w+iB2pjLIZN6V7XS26A99BK+9+2QUr/OZ8SDlOY0skJ/8q0KBKhGb41iR8sznSckZfo8WL9azYdb6GUAg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(5023799004)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW9ZZnUxS3drWVh4Q1RUL1hkandpVG5ibDVvcFNDSXRaai9CYzYyVEhWN3lV?=
 =?utf-8?B?UWJUQzBWVnNOYWk4VVNhcWpHd2ZMcnlaaC9LLzM3ZlRYOEwxT1BGOXpQSHRq?=
 =?utf-8?B?dnVIbHhrMEZLc3FOMEl5alB3eFNNS0tvcVIxWndnYVVraGtjeVAvK1dRSlpn?=
 =?utf-8?B?U1lEV1V2NEpWcE50NDdBM2dobGRUL2tQRTNQalhXMVJpK3piTGo4S0s5cVVD?=
 =?utf-8?B?eUFoVFIzS2d0VWRERXhJUzZlM1F1V0ZYdHA4NXhWWEN5YkxIWXduY1RUOFk5?=
 =?utf-8?B?NE56Ti82VFhhOUh4WU5idEN3K1BIZ2RjRjhKVFpUZ3ZFRzl5N2M3ajZzOS9S?=
 =?utf-8?B?d2RlbC9jblpQVzZxbU4rOVNDK2tYaWxyZTEyMWRqcWJid2E0T3BONGEwdisz?=
 =?utf-8?B?UUQ3Ly9Jc2FCVXZ0Tm85dCtNWW9NUEcwYzh6aUhEVWxQdG5uVFBlRndmR1cw?=
 =?utf-8?B?YXFHdEY2STNKdEhpVmZlU2F3dDY2QjJhTmYwT1ExeEtsTStPTTZtdmxYNlo5?=
 =?utf-8?B?QXVIcWlBNytkY0JrdWtqYStUZHQ4ZDJPZmFJbEhtaS8wVkpKcTVDSVkvNjcr?=
 =?utf-8?B?WkErdEowenhnZlVHd2NnUDNMS2xLSmJBSDludnBmVjZaMzkzR3J3YzJxWERX?=
 =?utf-8?B?cm4rUy8rRVYyYVl3eFJDV1g4a0c3R1RnMkw1K1E0bmFJQ2hwQWVEZlFiQ2sx?=
 =?utf-8?B?LzdQS0FYay80cmNHYXllK0czVi8vR3A3SHZoY1FWK0tNdHF1NzBpeGlzdjNW?=
 =?utf-8?B?RlBjcnEreTBkNnpCTTBGeDVYWGhnRmlwSUMxcmNBMzgrYjdpWlJWWjVYRjZD?=
 =?utf-8?B?TDVkNkJEdlNWYTRHaXNBSFVWTkt0MldXWDNJdjFwN0pIWCtpaWtGUytpaC9W?=
 =?utf-8?B?bGNXaFQ5dVNXTUg0RHVLTjlqdktiR0IzaC9xK2lFRzJGMU1xamdDMjgyY3Vh?=
 =?utf-8?B?Ukw5bDNkSWY2T3ppeFp5R3lTS1hIR1owYWRCQWZQOGY0eWIxaUlmNFFrRVY3?=
 =?utf-8?B?TlBHTEsyT3pDU25vTXdTVGhjcW94SlE2dVNzWUtjS05MOWpaR00wUTQvZ1RI?=
 =?utf-8?B?elc1b083RmhjcHptdDBkUC90VzQvK21ZUjdPM3RoR01KUWQ3UWJ4V1dPVTBI?=
 =?utf-8?B?MWltRUljRGZ2cVVUcmIrSCtRRU03VStTQW54TmQzUk1oYVYrR0J6QUpXRE9D?=
 =?utf-8?B?Z2lNN0RLR1FvM2tOb3p3d05EbnByQXB5WUVpUTdCU0Y0N0lqTGVZUnF4RmU1?=
 =?utf-8?B?RGZLSXZpc1k4N0xTVnE0a2pwbGNZUlVkKzRwQ3IzUFVGV2h3QlpISXczOTRu?=
 =?utf-8?B?N2hoZWFkNjN0QzVYNHZrZmtiL3YyR2RrK0pVd0s5b0hCZld6RVg0WFRXMlVV?=
 =?utf-8?B?YWNzSnFCL2c0US9KbDRDcGlLOTFJeEVhOVVLQkU2OEFBOWt2Rm80b05kMlA4?=
 =?utf-8?B?NmNubEYwendWelRMdUFlSG9FemFOa1U0cHY0K0lBR0hyMTV5bVFpYlErOFpi?=
 =?utf-8?B?UmRxRnNvQVEzM2JyOEh2aW5OdlRHT3BkMUFMdFZOREs4VEFZQ2IyV0pXMXNF?=
 =?utf-8?B?QTRkelBXOXJvM2dDcEVJSUxQZVN0WTFKOEdiejYzRFMvSHF1bk1HNmNSY1BU?=
 =?utf-8?B?bmQ4ZFIyZFpoK2o5NUtLT0dQRkc5QSswRVhqN25XYWVnRUdpSVNPZlNVZ09t?=
 =?utf-8?B?ZnNPanMvZWhCVS9iZlNrb21NcEF1Mm8vN0l2em4wR3BTSmV1a1VocG5hcVVL?=
 =?utf-8?B?VWdVMGt4NW9XakxyUEdUSklNSWtrT1g3Zm5IZllocHVZR2ZqaDZkczIrMitM?=
 =?utf-8?B?WUhRaDhGTURzNlE4bThRVDRWOU1ER0o5ckZ4QWVWN0d6b1hSYXViL1dudkFp?=
 =?utf-8?B?UU1SS05FellVZXNJNHdYQzU2VUcxRVFzWWx3dUlmZW15YjErcTg4Y21BZjBi?=
 =?utf-8?B?WXl3dXhUV3JMaFVCMlJ5VkV0dk5WQTYwWE1jcUNmQVJoYTlqbWs2eGFNZThh?=
 =?utf-8?B?QXVKVVhvZEpQa0RjeHJDOGNTcmpqRnNHcXpzc3k5U0JlZU1SU2VKNnViWXpu?=
 =?utf-8?B?UTIzZzRoSWZuMDNGQVl4SHczbXlRVnhNQWVYOEhHQU5tQXdzeWo5YnBlaEl1?=
 =?utf-8?B?aENKMHo3L3AwQUpOWWdUTzlnak11d3dVcVhEYUNMNEFLN3pEbVR4b2JoYjQ2?=
 =?utf-8?B?MW5VSEk0bndTTlpobElrU29STWxXc09VbXBjYkpJbW11OWNVVDhacS9veXc2?=
 =?utf-8?B?SUcyM0NrYUpNY0Z1cWhIcG9KYUNGc09QTVhOMk5DS2QybnpIRmdCdENoSmpj?=
 =?utf-8?B?QkdLUlVFSDR6U2dRdjRGTVcrMjBzMHY5S2xLTFV3dkQrT2FONndJdz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8888e6a7-7825-45b0-0f2b-08df129dd105
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 20:21:53.8586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLTqWlXxojS9n8WpR5UfhUm8Fg5FE9HaNUmHejZFJsdUDBkM2XbN5KYzPphbNKDa3wq9imgrNfq/PuBmXsP0jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P123MB8386

On Mon, Sep 14, 2026 at 01:55:36AM -0700, Breno Leitao wrote:
> On Fri, Sep 11, 2026 at 05:06:25PM -0400, Aaron Tomlin wrote:
> > @@ -176,6 +202,40 @@ for pi, pool in idr_for_each(worker_pool_idr):
> >              print(' strict', end='')
> >      print('')
> >  
> > +    if args.busy:
> > +        for bkt in pool.busy_hash:
> > +            for worker in hlist_for_each_entry('struct worker', bkt.address_of_(), 'hentry'):
> > +                for _ in range(3):
> > +                    try:
> ...
> > +                    except Exception:
> > +                        continue
> 
> Is a bare except the right scope here? It swallows all other silly
> exceptions, so a typo anywhere in this block makes -b print nothing at
> all instead of failing. 
> 
> I would go for drgn.FaultError and LookupError, these two that are
> actually expected.
> 
> --breno

Hi Breno,

Thank you for your feedback.

That was an oversight. Indeed, drgn.FaultError (or imported FaultError) and
LookupError (i.e. prog.symbol(0)) is more appropriate.

    >>> w = Object(prog, 'struct worker *', address=0x0)
    >>> print(w)
    Traceback (most recent call last):
      File "<python-input-2>", line 1, in <module>
        print(w)
        ~~~~~^^^
    _drgn.FaultError: address is not mapped: 0x0

Kind regards,
-- 
Aaron Tomlin
