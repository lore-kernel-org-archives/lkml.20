Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022108.outbound.protection.outlook.com [52.101.101.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DBF43935B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823355; cv=fail; b=iyKqpq3tAdp4UZ1FgAQd11gwX8CczfUfEaFelUCuYgCG0g3iu79D0Y9M1pQVWl3Y0cehqVZVkTOZVhAdyebDCbHGNvLHsgGbEQi5xrLVvKzHBCPUWdssRIvYx+P9cEpxaPNoRBJLzedZM6AjbncENfKX2iRm5pBMu5rtuPcYHA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823355; c=relaxed/simple;
	bh=RSTb7rJc4RHBuupjEwXQausEWNGiUScQCbmpPj6YMPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d9oyJ7Uvf3zk7hJ0K+PsVyS4lOjjnOFuVhXQByjkWs0KBo0FPQBeFJFQ+AP0OxqjuAFh4SkoLV/EWOSWLfV1GqcIJJl/QqS/2n/hG4u/f9eyVZyrE7xE98W0fpo+8go1IuLEDG0xMsJoCoXGhAQ1RhyNPz93zMA364VnQcGVGOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S37HKNQkvIZ/Wwq2uYkpCFKSYjLDjvGWwjYvUKRwOgXLjV+4M+nayIdYwg+9G9pmJhDcaNgRFsHr7+G3X3h36R0KzRQ0OILbDAEHKdG8paaYIy2lh/qMAVRd38sEvpJma3h+HDCZKkgb+MmYMmmSGnxqlPs6vabym6bEvQXX4gqM5WDriiyqOGcmBmhy0DZMBuwqS+h69GAZ+lks8gzIECrO6IRnMBFLvRfwuprkLDQfjiMz9CyZ3TaeLsNsrSJaUz66vF0gbugBaxMCHIqMxGMb9oQN6SCVCgeCajhivBc4SgPnMvnN9IPuYdY3Ce4Is0Vyq5F8/tEOOQvI5YY8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=k9O/3xcJHcgJBGbbMseC/B38TWKW++JqrlGwkBj77/0=;
 b=h2+pfVmwW3UEdiRFdEafBSpEaX4TplaIshRrrY113xcdka+cGk9YZE4zxQwGeCnbVIh6P9mTIQXeTT5QW7MlDGwdSKEzaHoSDUIe1Dw2JQMi5apyQRlCEm9stBswXHsLNMa1rNhk4bKlP2d1HG+RN6/9SHHFW3uveOwO9Gbh0rEM3K4cDwLn7oc9gzHt1mQPTSWnL1w8wM4i0fQhWx0ZnD14zW1NOH4SeakYm9lAUik9cPVMC+a21dKiESRt9dKjHTneLhj/a9zaHfCvmnlIAClXWsc55ISe19D54FtaMRMi379Ve09eNWC4UvoVhobuNmeiWPBbEeSB+5OVCAGfTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CWLP123MB6460.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 09:35:47 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 09:35:46 +0000
Date: Thu, 27 Aug 2026 05:35:44 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	paulmck@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	zhanxusheng1024@gmail.com, neelx@suse.com, chjohnst@mail.com, mproche@mail.com, 
	sean@ashe.io, steve@abita.co, rishil1999@outlook.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/6] sched: Annotate rq->rd with __rcu and update
 lockless readers
Message-ID: <36maob3lfrzbuktn6qii76rxdyt5bphjauc7dwg4rkmmgljqq2@j46iffegq6hd>
References: <20260826224238.936456-1-atomlin@atomlin.com>
 <20260826224238.936456-2-atomlin@atomlin.com>
 <20260827073036.GC4121339@noisy.programming.kicks-ass.net>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jv5obv7jdvp5jj6u"
Content-Disposition: inline
In-Reply-To: <20260827073036.GC4121339@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: LO6P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::10) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CWLP123MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: 409e3686-1f2f-493b-c5f0-08df041e9264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|7416014|10067099003|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	V6+s0Fqr7cZMibB8ijdwVaQ+wIDzOQGReq4kXvcLWdilf3+66PH4QAUu/xJRD6MPc/ccie4AU0jiC4Yn3NWgAS7NC7qHRPc6k+oRwbpvWM8KKscaHPnrDvJJFpHC/B0UUWgpnEI+xRsdI4gxIN7vG1iiIApxLDdl8Q7nIH0RJ/It4HOWZzZa9NlFiSUwGOrxncRkkp8rR/A4Z0CMy8CN4soEkHwPaPCJ/qa01ImhfmzFkXPKePTTwLD2FrM9094hbJdXVRgMgIZjwG78dmHarW4U49GK6FjBG/z95MvgfqQ0vURLnTmhb2U6s4bW8DnjbPcWS0m8aHZo48A5AIGleTpdGk2fD9g8Bm5PVHunQuHuFB5l5HbXqswyTjaKTx8eNlnUGhvJmhH8O02SekgfhycP/Nt5XXBwltCRBOBpwjXifHE2n7SsNBWutJ8UALaajKzUzrg6e5ZKVsdY0xZ0lKnzTKjTRJECJ4GpRiP9GxCE+z0r0rJGknH6b6mbaosj9EKEbdpAoa8w545PV2wYtdr1yeIYEhnupd7VMjxt+FDTEXrImrbFltbSZzeQ67s7Fu04mBQ3Em0Yoely/BIv9mLechd9AijKHYkFTa0LsjlRqHer7scgJv8SxtFTOwJl4jX+ux5UVdZ3/Y9KEriJR2uyGJRP4KAouQKyFZz2tU8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(7416014)(10067099003)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MENIQm5yRjdLNnpKUms1cEF6OFprSnFhc3c3clBnY0REUitoaWY3ZGFvUjB4?=
 =?utf-8?B?Vll3dUpJNTRETC9tU1FoSVZjM0gvbmZNUWpSNUJBbEVyblkwUDJtc1l5bWNj?=
 =?utf-8?B?bE1YR3VYZjhkbVpMTU82bEozNDEyYjVqUUIyZ1RIa0ZUdms0bCsvRGQ1KzIr?=
 =?utf-8?B?aDlXamtnN2k3NmVES2dXS0NVbS9qbCtjc2NEa3plOHVTYndCQ3BnQm5UWFk1?=
 =?utf-8?B?U25tSWZLS2ZTTW93ODdhM0NGTVNMOTIvbklNVGhFWEVUTWd6a2JhQnBLRSt1?=
 =?utf-8?B?SzJOcVp1b25BRnhjTXYrdmx2YWN0WWQyTDRKdThibnN0dXIwT1hWQko2eVYx?=
 =?utf-8?B?ODJCenF4Ny82bGd1MHc1bm4rUTNvV0dBN3dZUTZic21zbEhtTlJQOVdtTzRY?=
 =?utf-8?B?WjRlQklkam9wNEhONHBack1YaHVyanVhZ0pyOEtqbmVHTEV0blFPN0h1bGF4?=
 =?utf-8?B?cnBaamNwUnYzOE9FKzI4N1FhMkt2SFRubWZhMUZLTUpZS3BoTFZRWFUxY1ZD?=
 =?utf-8?B?L2l5NmZ6MjRJakt4a1E5ZEpuMDM5ekFIa3ZnamFPMUNtNGFFQS9tRTVJL0NQ?=
 =?utf-8?B?TDNoNEFtZFNldG9lNE8rSU1EQjU4anZOSll6TUY2Q3dLeXlXR2RpRXB2Yy9r?=
 =?utf-8?B?RkZDWFF2OGhJZWxHVDd5RkRWTHF4aTBBOUExMkh2akFvSFd3Si9UdmtoS2Mz?=
 =?utf-8?B?M1NvWG13VjYxNFlrcnlJRHNoYlNoc3JEVHNSMmlEaFUwc2pnRTkxaGI3N0Zn?=
 =?utf-8?B?ZkdsV3NWR1g1SEtkTjczeEQrT3IvcXV6cFNqV3EyOUV6dXFGd0htUzdPM1JI?=
 =?utf-8?B?T2lHTlpRcTBQVVhLT1c4aGNaUGdDWjE4OGYzcXRUbGJhYm1iWDQ0cVd2QW9R?=
 =?utf-8?B?bDRZYjZOWnRPV1lxL3ByOEFjRnFaV3JQRkdjTjZtTm9mUFRhVGVqUE9mYldI?=
 =?utf-8?B?SWNiUEwyMEhMd1gxUjExYTUvNmhXWm4yOGVtdlJnYmpaMFdkSjNjZGJ5OWQ0?=
 =?utf-8?B?bGxSc2RYR1pVbDYrYmNJaWRqeFV2MjgyMlF1MHRJY3hKSFZVWS8rY1FDM3RW?=
 =?utf-8?B?ZStTRFpqTnNXNmo1NHU4czMyNFYwWUkraWlMRHRueWp6ZWt0VVplRk9HeVFL?=
 =?utf-8?B?MkpYdnFuaG9MRGdHVE90cGQ2NGRCK2JmRHArUW9wMWtwVDBCVXZQMHhPOGo4?=
 =?utf-8?B?Uk9tSkMwMEpPbDNjT3lLYWg0Wi9xWGFJV3RWeVoxanU1OUI4aTc1T1dPeVFm?=
 =?utf-8?B?ZUVMSFkvSTVtRjhpQ08vb0dHcVdhZjhYd1BkOFEySWJrVGIyQlEraUw0bnAz?=
 =?utf-8?B?cG9xcVU5RndrekxtdUJnRUcrWnB1bVYzaHp2YUZWMS9FVlBscmRvNGprWTE3?=
 =?utf-8?B?cWovWnFhZ0JZQmhoQk9nWHdGaGJGVG1QdVNxLzVYSGxRYlJIL2V3U1lldTlT?=
 =?utf-8?B?RXFVdU1CRzZBcnAwMWpKNWZ6d1d3RWV4UXQ1VVVLRjAzcnh4N05QR0RUSnVW?=
 =?utf-8?B?c1kyNnVBd1hrTHNhM29vRVUxSVNNc1FHOVdXNXFKMkhqVFdQNDh4cURkVEdn?=
 =?utf-8?B?Z0FxVGovRm1URDRpZGg3YWR2WW1TV0tCdWxyclpIV2xCMWFEQVZyMEpzdEIy?=
 =?utf-8?B?T045ZEc0cCtJbWo1cisvK015WXFveUZWSG1sMkJRaHNMSXBnNE5ZczBIY1Rn?=
 =?utf-8?B?ekZTMHJVK2J4Z2w5ZTdBZnZXdDNNVE5SdEMxSWRFeWZBYTc3cjdzMElmUzBB?=
 =?utf-8?B?ZzlWYnZTK1poYXhsRWRvODVpV3NSU2tEYU9VbmR1czlOVUdMaUcyeHF2TlIw?=
 =?utf-8?B?TXVsSmp0azBwcFpqRTZEN1dMSmZScHJWTG9IeHYvOVhqSXpRdndmR3JJVElz?=
 =?utf-8?B?RGZMOWcxT1dsclM3Qy9qYkw2TmlxYU5PMUk5T25ObXNhWHZycmFibHhqaUtS?=
 =?utf-8?B?TW5FaC8xT1VDOHlEVkk1UmQ2dFE3amNLMFE0djNIVVY4blptM1ovL2w2dUlR?=
 =?utf-8?B?SWplQUQrcmxrR253UmhFSjZrelhVak1VZTdvRzd1WW5wclFrc1kxMmsyc053?=
 =?utf-8?B?bHFNNnBLdm9FNUQyMWJWR0NWNDlqT3NOU3Q0Sm9ITGJwZWpQWmFncWljMkdu?=
 =?utf-8?B?dmRHdmJTbFp2NkxkdEt1NnczRjNrT0x4aStCeUhhWGQ4d212QUN4bzdWR01R?=
 =?utf-8?B?dDBocVdUQStOYjl1M1RHZGkzcXBpVmZTQ2YrMGE1YWFXaDE2QmZCMDRpNFIx?=
 =?utf-8?B?TCtOSVRaU1UvV3BhNHppZ3d4NGlzQjhwQXVBTlJkTzVvY1dFU25mTDQ5cmJx?=
 =?utf-8?Q?an6skfb+D8O1Dv2RHs?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409e3686-1f2f-493b-c5f0-08df041e9264
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 09:35:46.4600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxvqflejT9PnnjUd3VUyeEmLaD/JT3P5ZYgNDICmEaf2kRh0p0sQL0CJ/SI4WDaM5YsqQMf35yX+YzqQVkV/pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB6460

--jv5obv7jdvp5jj6u
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/6] sched: Annotate rq->rd with __rcu and update
 lockless readers
MIME-Version: 1.0

On Thu, Aug 27, 2026 at 09:30:36AM +0200, Peter Zijlstra wrote:
> On Wed, Aug 26, 2026 at 06:42:33PM -0400, Aaron Tomlin wrote:
> > The root_domain pointer rd field in struct rq is updated dynamically
> > using RCU, and its memory reclamation is deferred via call_rcu() in
> > rq_attach_root(). However, struct rq's rd field was missing the __rcu
> > compiler annotation, and several lockless readers across the scheduler
> > subsystem accessed rq->rd directly without using RCU dereference
> > primitives.
> >=20
> > Add the __rcu annotation to struct rq's rd field in kernel/sched/sched.=
h.
> > Update lockless readers across kernel/sched/ to use rcu_dereference(),
> > rcu_dereference_sched() or rcu_access_pointer() appropriately. This
> > ensures proper data-dependency barriers on all architectures, enables
> > Sparse static analysis validation, and documents RCU read-side ownership
> > contracts.
> >=20
> > Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> > ---
> >  kernel/sched/core.c     | 24 ++++++++++-----
> >  kernel/sched/deadline.c | 67 +++++++++++++++++++++++------------------
> >  kernel/sched/fair.c     | 29 +++++++++---------
> >  kernel/sched/rt.c       | 64 ++++++++++++++++++++++-----------------
> >  kernel/sched/sched.h    |  2 +-
> >  kernel/sched/topology.c | 11 ++++---
> >  6 files changed, 113 insertions(+), 84 deletions(-)
> >=20
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 2e7cde033a31..86de58f5825b 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -8547,8 +8547,10 @@ void set_rq_online(struct rq *rq)
> >  {
> >  	if (!rq->online) {
> >  		const struct sched_class *class;
> > +		struct root_domain *rd;
> > =20
> > -		cpumask_set_cpu(rq->cpu, rq->rd->online);
> > +		rd =3D rcu_dereference_protected(rq->rd, lockdep_is_held(&rq->__lock=
));
>=20
> This seems wrong; rcu_dereference_protected() is only supposed to be
> used during the update. And rq->lock is very much not the update side
> lock of the topology.
>=20
> Also, &rq->__lock is wrong.
>=20
> And this is far too verbose to endlessly repeat.

Hi Peter,

Indeed. Thank you for pointing this out.

    1.  sched_domains_mutex (not rq->lock) is the update lock for topology
        and root domains; acquired in partition_sched_domains() before the
        call to partition_sched_domains_locked()

    2.  Directly referencing &rq->__lock breaks the rq_lock abstraction

    3.  Repeating verbose RCU dereference boilerplate everywhere clutters
        the code

To solve this cleanly, I propose introducing a concise helper, for the root
domain in kernel/sched/sched.h mirroring rcu_dereference_sched_domain(p):

    #define rcu_dereference_root_domain(p) \
        rcu_dereference_all_check((p), lockdep_is_held(&sched_domains_mutex=
))

This covers both the update side (under sched_domains_mutex) and read-side
contexts (under rq_lock(), preemption-disabled, or RCU read locks) via
rcu_read_lock_any_held(), while keeping the call sites clean and
eliminating Sparse warnings.

Would you prefer rcu_dereference_root_domain(p)?


Kind regards,
--=20
Aaron Tomlin

--jv5obv7jdvp5jj6u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEeQaE6/qKljiNHm6b4t6WWBnMd9YFAmqQBOwACgkQ4t6WWBnM
d9Zrdw//XF7PX0L8xCpRljMzGM3cuZhb8P6GfxsGLI9FJ1nzjvx8Seb7id9tH+Hq
GM1pyNq4MG7qtezlHkGeTSdpSlsi7bPRrU1ULnUFt2EId7nXQn9Ouv7zuHWqTtjM
UwhxBu2mgveyxC/giGQWnQfwhqFg8Z0LUN1/OYmfiD1tru6uKAEXu9lM4YWKW/Jo
6dLom/XW41DwwCXGpK/WVXAo0khe9JVi+Wba9CWc1G2wf+eVnzSTztrYyAtDBwEw
RGRjkFDG/tvSjmvjn7T908pV4gK2e9FNIF6vY5OOAJym5eOI9+vEvLPudTsxgDjz
wBjL68amIXm05QjYyBcLzHlkFtYTPt4mJRdqAWIhbGQH14J0Ep6qelYWngLZkSMY
qK6FbspqSW90mkKy/WpTJ8u1UxZless+MAgSv+D4yR3t4L6s9x0o6GUBpN62WmPe
8+XHGIwB7rBOQ8zMSBqaLAvJiIVGbMVtYrsJmLm28ivre65Nm+Bb+5N/LozH8/h+
j4Bp/bmLSvcV/jJt56LUBWFQFYKY2Qh3Vz1S/KUb0pA9gPQLv+xz4ko+OoCcZBoj
qKI2On/go7Is4W0rrEJ2KeTXeDzR+u/++z8cH627J1V7qTLn7YQ17sjghJBEaetp
F5F65rv8vBh+mQbFAFF7+gReqNNGMRkV+Vz1GksUXlTraFBIAvI=
=S1XG
-----END PGP SIGNATURE-----

--jv5obv7jdvp5jj6u--
