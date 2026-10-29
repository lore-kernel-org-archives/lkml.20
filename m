Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297293;
	b=qWl1lVGoU6LYugDHOeY4DZ/Eydhvr9gN01yN6itsC3T8jgh++5VZJX9MKnxITlJuogEj
	 sDG81knAcxLHghMUl72oPKfWCfYBWXPsHthOS3AXOjgeinwzO0rqXYz4t6idrUOg4/egT
	 +ZqdmqNbidX2H43FBzO/HUR2He1EmT0APJ0Tc/dXUdotCiM1XWJHhH9p9lKazrT0ysNu4
	 K2A3YyaL1GmvxK0tUDHIZX3SmeVQkiF4FQupHzBAlZzLFoqNNJXC4HuoCJtsdtQKHpV7q
	 ByTVAkBY9tEXYZ/nLtHYfqMcfPrwOa01mXYPKk3IpO4+ctvgK9ZE7QATP7gGM/6WtwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297293;
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
	bh=YNa7xo0mefAiD0p7mBrLLAqSTbHun/2qEhHFhNGo4HI=;
	b=L/mtmXH8pYfETJsId+mREBE43OABSMaMd+XHgt34uJwd86zAlPHqHBHRDN7fI6l1uIGO
	 fkR8KRHrr0FHQFXXODD74XBEmcTkuNvZU8HAikqR1jtIQ4MWQnY5atL7VMLbhL7aDi5OF
	 /thOzRKF2RXusDpkkkbeLOytYFFYt7mFb0MgVFRNBqJX3QfZ6UteeW6dri06bJxfZHihw
	 L4jYOrMjO8T8M96oPunfMllwKiCasyNrjnYTnb9gSMwtPUWRfrOHaVrFYrztZWfKS2k2P
	 OtfWFuE5vz2yV1Jvf0EMSV3DlAjOSPo/qlUVzFM3vrelTzGthnAVnJu/XAQCl2e4W+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zzqncsPh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.24
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012024.outbound.protection.outlook.com [52.101.53.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46055606A320;
	Thu, 29 Oct 2026 18:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46055606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zzqncsPh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTJD8SOQkmfa2SGKZFZCo75lX6egp5A/UsPoOxsF3N2U74jJFdKFvnec/U2iIITIK6VZ8sRVoM4v6oI7qzuWNBxvXF50iqlq4fPuI3g6sBrwCuEVHr7H7+dU6vMfjUUUKxW+tBmL1fHyl9pNmAqXgAo5/Br/MZ0DjiZ0TnELOKEBTpxAZeWT8Ty1jJSChge+y/fwNwDYkNH54HIWVVZcF6PhcgJ1aVsp1VALkxVLVEmaUn9OwR4aUU0RTrpCwHDSHMwKAq54VrbupgCifCktoz0reV9hU52HgSoLU9fQvysuraT6H06hVVVOpdxaykBA3lEpqlCIsG5duA/f/rcKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNa7xo0mefAiD0p7mBrLLAqSTbHun/2qEhHFhNGo4HI=;
 b=P++VDJLgmFzSKd1G+lJMPI3BoQZ0AqT+HRILwlHE6hz+fJldss541+N9Ib0pu7zHfvZ7nZcHdUWq5jDJKEPi4VmGpuzxm2fBxdoCuGf2bA9TiWBziCOqv2uILYWTSsvuFk1ni2QWNPaA7Wu/Jhahm/oiFA3Gil3pTPNgkeKGFlAo8jCyOeOntee2WldUxjxwHotTKFzm9k1LP5lp0VjdDNKAVgSwGYJOaA11MeA8GzV073KV66WXyzvompNDxOvqVj2CP1X+fmY7wN9/uO1VsvkM2B3KqScgFGr/Z7lsXjkACEXtHPCAJDsDNI7HqVjNA0WRg2Zg0lYyrCPHZt1GVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNa7xo0mefAiD0p7mBrLLAqSTbHun/2qEhHFhNGo4HI=;
 b=zzqncsPhWLIsxXEz4ie/In+FttP5JXCzATEBhZT9yU1MGG88BEPjzdtNmar1pZqnhtaRsgps63cKd9UBlQ5EaGltznoBpTdejxeSJE9HM9VKJIIt3d1N/oZHuqzTlWCgqBxU9zFFXDSsTdH/CLmAv34p4cGjkE5pfnbkWfZQFAs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 FT1PR12MB249006.namprd12.prod.outlook.com (2603:10b6:170:34::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 18:08:10 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 18:08:09 +0000
Date: Thu, 29 Oct 2026 14:08:01 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>,
	syzbot <syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, peterz@infradead.org,
	syzkaller-bugs@googlegroups.com, Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org
Subject: Re: [PATCH V2] x86/mce: Serialize sysfs controls against CPU hotplug
Message-ID: <20261029180801.GA96343@yaz-khff2.amd.com>
References: <6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com>
 <87ik58la9w.ffs@fw13>
 <20260817235553.GAaoOfieqJBZTsAn3N@fat_crate.local>
 <20260818001840.GBaoOk4Mz_mmZYK2rK@fat_crate.local>
 <878q63lrqr.ffs@fw13>
 <874iec22sf.ffs@fw13>
 <87y0bhy5h8.ffs@fw13>
 <20261029165636.GA5110@yaz-khff2.amd.com>
 <20261029174646.GDauOGhqHXpndpV5BL@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029174646.GDauOGhqHXpndpV5BL@fat_crate.local>
X-ClientProxiedBy: BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::12) To DM4PR12MB6374.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|FT1PR12MB249006:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c9049b1-c945-4dca-8889-08df35e796a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|261028144727099003|4143699003|11063799006|261022105027099003|56012099006|261009223027099003|261021121427099003|261026140227099003|261026121527099003|261022075727099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	NbfruwOSPW2qEFNYehFHOvZlwCBKQUqP4zur5k6+WV6SgdFC4/q77QFeb1k3FVzpWLGNj987MK4ujsvayp/M8EPztoZmo+B8qeEGaZk95FKG7tL4FB7yMk35XTDtYWKmOWt98bfZEHgHvYWFl3cQ1t5x/+K3U3bYNzo1ymyk3jSvSSQ+TE/G2uODX/mBm5SvA8SgcFVZIIK3cW+UXgY86ooY+ZMfuDgmMvXYltSJsStIQ9xgKtwFPSlczXgryQtz2fPQMnLRumwMR+2QhCcBD4aMptZhb1dyhW5i/b0LoUCOZ6qAgtYtrnz5OHb8z1jtWG5XFMNI96gRC9YZWUE5+/2R9CXr22t1wXt3CFKkxQUfZ1ciLie2J690HTStJSFyvBdJ5lpGy5j/uw/jvE3/c6T6Y8hOzP8U/pK5c/lYZ+lbJCPtkzE76bV/lTMx9f3LKHBerCbGVhq5k0Y3AcQby6Uv3RTzaIZ2rdOLgdxkngNtqLcF1997kaWIs2qEPM9pqN7oYzYLu5EeM0I9Ulb+HZZxllzyKHUUElB8oVZ8qwXmNIjAldVash1oq2ClnQ9lwAX/V5eoNzOcp0e/xXi+OAABTLfCDZOjuPST5AREBeOvHcdA4ZvH1/fRffwddncah0TrdRd27gMu75YUSUhOukAp+ZkWzZ0k47EGn5NLrDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261028144727099003)(4143699003)(11063799006)(261022105027099003)(56012099006)(261009223027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022075727099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vo42I6Uw9KtKWDiZ3TzH+gR5zEngpuHHqP5kAc/Ly3kptPAKUy6juwPoaK5l?=
 =?us-ascii?Q?58rAPlE7tuWDURFeNgOgEdMhgjI1b8ctwzZQmGV5S58p1rATyZERIKr6/3Ca?=
 =?us-ascii?Q?d9GG/HW+OXXU8CQdNLvCEKL44I2qmCHFdW5gVL96eisooq5nplS53oL04FV+?=
 =?us-ascii?Q?5RZ2Kacjao8z3jRizNP8F7SOnDlQ0YDUgOIp9/nMF87k1XX+h6m1l9Y3hDnr?=
 =?us-ascii?Q?Iam19gmMbMp0LWlubCaejBlHLJllJ2n+2dCz9vE9RAFivlojfq8BTJ2mWfy4?=
 =?us-ascii?Q?AEZfTagIpavDiZki20b80aR9KmwZeT9zpqDQCaA8cd91+nDEey5Izn0X0ure?=
 =?us-ascii?Q?37ya7gbaWEJ/G/DvHQblvI5xpEAh/TYEJrwqAe35R0hkoER135wKWe54gOss?=
 =?us-ascii?Q?dMG//5sTdqXLA11iYxlzmZwfCMKRdN9Zk/ljSuTfQjJeNi6s/s4eK9pzs/qm?=
 =?us-ascii?Q?KDQBnFGIdEpOMSI6pgszFcRNgxpaT5Qlh3zgm+KVkC0BvDB8/EwFQV2v19yf?=
 =?us-ascii?Q?HritUkewjO/6mQoG5UNXEQnW4qx/dlGMh3+9Gv3P/yM8IqVuQ7DirVRixTnR?=
 =?us-ascii?Q?+QE3fmRZpB05PIBMA2E2/3WHqKdfmrAvA1lg4DaepJ6elhFzVFnCv/ENNBQi?=
 =?us-ascii?Q?2ar0wtxswUXwEqDZlBkZrN8h/z5WT+kQqdRfUNy2QeIrgSPS21EMx6D475ru?=
 =?us-ascii?Q?tEtCicGV3zmPlvjSu7YYcaaPQpcXVYUEYBbmTytw9CUyh96aaDFUCLXY0nYM?=
 =?us-ascii?Q?kPd5ZiiFbP0qq76sCqN4UM710puvyqIcr5WFkkikjL+l40hsY12Lzc0dSI2X?=
 =?us-ascii?Q?A2aQFCqwzWWe1JqljXXXEFAtCsdtLIxTi3ouOZPPjiEl/BC5gH95I6kAxGmU?=
 =?us-ascii?Q?sD1DTuoBCocW/C5NOaIBgEtgponVsRgd7gaRpuJCz7DrJ4YHntKvqHWHMaEL?=
 =?us-ascii?Q?W5QHKnl8nT6oke4g37JOi/mMnRtwktmbMEF/hRKuPv/nLyVb69ZbT7ZbwMJc?=
 =?us-ascii?Q?ocIvfVFbcPLDXgD5dtTWJ4DrD3zsFOZm5QtfqVhOWjC3zvu6WC6hzSPJGTNQ?=
 =?us-ascii?Q?a+SVaA/q2ydJwWAKaZb3adiPJeQCaqaYppwsimwy+WtzcBENrfYU+oey5IMQ?=
 =?us-ascii?Q?JX6Qcm7p5leEAhLNyWfLO+p/LK86AwaYqcnhVvs6Y+X4pJuadWK+5w9bK+hr?=
 =?us-ascii?Q?DPSX7y4bP0NDyVSrx1RtiO6MdtMPyGeaPP8K6ZQTqpN7mWQ79MK0jgoz3HGr?=
 =?us-ascii?Q?HBS1j0qkkLr9omIfLlHa/QlmLL+icgZqrTxpfQnTT7fnraTqV6c84XbLHkiI?=
 =?us-ascii?Q?5aMGa1hnVAjLqDWMWF9+5VpRGu3R8ASYdFCSuiRQbQfWl5MARvPvHi1JRQcV?=
 =?us-ascii?Q?3QYjajaEvW3qL0rc0n+0RTB+fAKg1PapGrI542ZIdwtDyXzum6MhXPZxwW47?=
 =?us-ascii?Q?IU4qlfHOJB0rrtKXCLxCMOSsPXe12p4WwB41ysodT4HQ5yJ+fHIZlfE/y7u9?=
 =?us-ascii?Q?qhXs1eHMagFeuB8WagK/0siSCf5Ez/Or7UznRKtQ/zgKdBKEqnlym1guoI1w?=
 =?us-ascii?Q?4LxhJwA2Wi5blgYE8zlGwCQOiK88tr7FeT0UQpYcL8UUEXNfgkDfVoRpMq2e?=
 =?us-ascii?Q?6v064Jq4834qwFi0q645bm5AP+nWjxMMtqDa2dA71vjnikHEGj+gewvbfvOV?=
 =?us-ascii?Q?5xR391xqPQYY6lW7xOZgdDK5nwLNkOZdV30rFywB3e0Albay1T9ReuXKegY3?=
 =?us-ascii?Q?JRez1fRuLQ=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9049b1-c945-4dca-8889-08df35e796a4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:08:09.2694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAurxa5pcM0s4u25fcfxu1baRvTTT41KaKgEVzYLmVtz9CY6G7wfV7/o3JSQR88YB4kbz1lf3hT+0l/uYuw51w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR12MB249006

On Thu, Oct 29, 2026 at 10:46:46AM -0700, Borislav Petkov wrote:
> On Thu, Oct 29, 2026 at 12:56:36PM -0400, Yazen Ghannam wrote:
> > The diff below fixes both.
> 
> No, we've been trying hard to fix this shit and I already told tglx offlist,
> I am that >.< close from simply disabling any hotplug operations as long as
> someone touches those sysfs files.
> 
> There is no good reason to be toggling those continuously and f*ck around with
> CPU hotplug at the same time. You do those configurations and then done. Not
> whack them all the time.
> 
> So this code needs to be simplified - not made an even crazier and
> unmaintainable mess.
> 
> So, I don't know yet in detail how we are going to query the hotplug core
> whether operations are in progress but once we do, those sysfs helpers should
> simply do:
> 
> 	if (hotplug_operations_in_progress)
> 		return -ECOMEBACKLATER;
> 
> And that hotplug_operations_in_progress should include partial hotplug. I.e.,
> has someone done partial hotplug? If so, error too.
> 
> And that's it.
> 
> Thx.
> 

Right, so what if we deprecate this legacy machinecheck bus and put MCE
stuff under the CPU bus? This could be like cpufreq and cpuidle.

I expect this would need a lot more changes, but the end result may be
simpler.

Thanks,
Yazen
