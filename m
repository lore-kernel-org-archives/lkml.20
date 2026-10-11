Received: from iad-out-007.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-007.esa.us-east-1.outbound.mail-perimeter.amazon.com [3.221.209.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B19364029;
	Sun, 11 Oct 2026 05:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=3.221.209.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694902; cv=fail; b=sCaE/vVkKhebnrYLPY7jyO1ypy8sp5aF/r5waA3mBxmfvVl77AFqF2gWHNwze0dbrBFX9TwlvTf5cmlWLvpcJb38YcxgffeWfRaQwebpDR94GLp2gIYsJAT4qWYI5jEjnBLH8J3vPEDxE2weoADxQHdabStsmiIN2Spnf2LrTK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694902; c=relaxed/simple;
	bh=EYCEsvDueaUT6ZfLfopmv76uFh01Fin+DSzyS1PJEuE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HY9i++uDkQ2LfBpNsEZW1pPHhv7WkelGQyAiwL8nwpgxQ/j4Jx5Rti64txyx/SajPpwzuV1us/nZUlJGSrhK1nmh3XhWcEGv/OiJmBjTgDUVg9FKYdD7QaIxFLJbgb8GrW1lPbomKld8mGZeSpOFbpc5qWxLc+90ZPRX7/bZFfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=BmDCVO8L; arc=fail smtp.client-ip=3.221.209.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="BmDCVO8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791694901; x=1823230901;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EYCEsvDueaUT6ZfLfopmv76uFh01Fin+DSzyS1PJEuE=;
  b=BmDCVO8LIwX0JqQM+zGJ+1pDbRdqLnaJQVHZOfKXZgIjaAHmfp9cNDID
   tGXJaC7zpaomXp3a5WcrKNcOiLqKeYuNJDqn7RRTGDmsytThYh6f01h+L
   5XnGeJF6SfWkGU5ExedCvu75zhCFdcW7FINWJNyfGUiAc9dc68D4ov1r7
   GtBxup4xTibzunLZ9tgD4/5IVo1rniDNRFBYoMqhWWVrlCIEuVrHjrQzB
   0VfqKiLhbLZvtdyFlE2A6n9kVBy0UsolgMxFM0jabpSUq/V0/A0JPNE1r
   sU7Mtyh/9TQaY/OvxUTSqfxZEXmcBPafQ/Ld7AwUvDLRGrLIfDqY6AYtI
   g==;
X-CSE-ConnectionGUID: C1MbNFeTSauGQl1VSH9lsQ==
X-CSE-MsgGUID: 0vaWUoR7S9arR18mMNY+2Q==
X-IronPort-AV: E=Sophos;i="6.27,151,1787011200"; 
   d="scan'208";a="29363499"
Received: from ip-10-4-10-75.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.10.75])
  by internal-iad-out-007.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 05:01:37 +0000
Received: from EX19MTAUEC002.ant.amazon.com [52.94.133.138:20380]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.22.157:2525] with esmtp (Farcaster)
 id 5e14e02d-96c3-4b31-9e4f-f1bb675cd130; Sun, 11 Oct 2026 05:01:37 +0000 (UTC)
X-Farcaster-Flow-ID: 5e14e02d-96c3-4b31-9e4f-f1bb675cd130
Received: from EX19EXOUEA001.ant.amazon.com (10.252.134.47) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Sun, 11 Oct 2026 05:01:37 +0000
Received: from EX19EXOUEA001.ant.amazon.com (10.252.134.47) by
 EX19EXOUEA001.ant.amazon.com (10.252.134.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Sun, 11 Oct 2026 05:01:37 +0000
Received: from DM2PR0701CU001.outbound.protection.outlook.com (10.252.134.239)
 by EX19EXOUEA001.ant.amazon.com (10.252.134.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53
 via Frontend Transport; Sun, 11 Oct 2026 05:01:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idbOrcWwHSG/6hUtPCPUzUY1TqbLzl+pLIQPhQP+3AVEeNg+qXaHcCQAzfBgSur9xmWcDaHBa0x79cO5ZxlG7t92cwaBl3LzAUd2eN3sfvWAu4xXJuAxiXGOWoHL98wUAkgZOepfKdQYljPA+o+uJckeUPoDCZPFUnfx4Tsjv96pXKsEujnMhh+v7n9Cd927L9O8GXdmqT0MiSLsY3EdciL23mAPlliUqts2GcODuTGnEVFbJc+NOdRQIO4wznedr1CnMw8mnzFJAAt1icRzV6HIT/VcEXQh0QxjZERqwSMuvZCRnRpFw1eTgkSUl2M7lrmTyo6kdEy6vPfHT2p3ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYCEsvDueaUT6ZfLfopmv76uFh01Fin+DSzyS1PJEuE=;
 b=baAOmA54aKI30b2/CjNhN7IwnatZUS6WhJgB+uZwMxA2OR0DHjgm8w4jhkikA3iqrg6YDpGO7xqmNfhZbB2W+UXrCrO+rzQBzeOpZfmW1H7+dkRidO33lnmRsVYNiSpzdx+/sQ+vWIXlySwrGA0aQ0K5mUtwzGZgMZFpMiPzI1LROxig9WORiecQXtcp3adXrtSLR6WO9NP79klem2wGbye78qNDafdYaX8ygLtTgpkqKNJqIGdns8rNE0jkuGJSpeAsLLVBCoCFVPGcpoe1Ty2vTRaLc60hqD9dX5AmSYpK5hl1vA8cHyKbfApqvTU2o7CHlmJXZ4SZRbX1PC0lMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by CH3PR18MB5485.namprd18.prod.outlook.com (2603:10b6:610:15d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Sun, 11 Oct
 2026 05:01:32 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.022; Sun, 11 Oct 2026
 05:01:32 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, "Shenhar, Talel" <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 8/8] irqchip/al-fic: add irq_set_affinity callback
Thread-Topic: [PATCH v4 8/8] irqchip/al-fic: add irq_set_affinity callback
Thread-Index: AQHdWT2V0aRacIbvtEiqgO5H1Ow20g==
Date: Sun, 11 Oct 2026 05:01:32 +0000
Message-ID: <BY3PR18MB472230FEF12ADE458EECF2E4C6902@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20261008090058.38591-1-farbere@amazon.com>
 <20261008090058.38591-9-farbere@amazon.com> <87jynpfi4v.ffs@fw13>
In-Reply-To: <87jynpfi4v.ffs@fw13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|CH3PR18MB5485:EE_
x-ms-office365-filtering-correlation-id: 6ffd0747-b652-45c2-78d0-08df2754b7d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|38070700021|56012099006|6133799003|10067099003|4143699003|11063799006|261009223027099003;
x-microsoft-antispam-message-info: 5rIR+CWlJwz+JDqvSN211AXDSM4aiB9/5bgxHYuBUH0UsILvo0ToaNXjXbDSeAUhF2ETBL3hYFxaInczTzGVKwcYZ3x/69D2FFgzp4wqimRJJT3f5uK/gty5JgHFCABKBmARykLSb+dWimmWAa+s6iVmlLwhvnaZp3XEIAyAtDcDx01lxrtOhVNfe2hhPS7SIzyXB4puH4Ur5Oo/iurgjKrMOZwaoyhdDhvbBxudIGipl2axBY8mV6VEslUB+pnIn6ORqfjrWZWYOSyJbM+UrIP5sXnRmebYAfKFuKSqJFFpUzgPkhtxCFeA7BKHo3vrs+76iS5lPaYqwVtqK7K/raPqTlKpnEM8AmE3smVQUSSHytPx+hx6BcoacLvInkiEdMbLdoVm2i/cC2go1un5BNldlE73TjwTGFYihBnUCKZ8eAlA16VbsgfWFLbYtH/XyoXK/BkatOH4E8rFf7Bz2StkU4A5rujxrcRuIzyKiCp1CsZJLBHejFCdN5qq6hDy92Cv9pRgijyE64iz1b6xJWvCQovQA24OpfkdwJbgZj1Y6zzUzbvaLGcaOMYFwZeePWvD0oS1nsqspL4oyPgmImtF1cRzG/krCDPrLVBESGyXAfqM1MyFjxBrN2hHWiG8O6CaVVsucv8lWvcX1yz7uDsWkQIK8CG89U/y0Iv0ktNcGN/QR8Uki7drb+3l0MybLFjOF2t2O0n91+qRcK0UoUHzVoAJu7M5L1F6dMlfNuY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(38070700021)(56012099006)(6133799003)(10067099003)(4143699003)(11063799006)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FqDTgGsPHUz4XosJA/QSuZbhB0LIH+d3cOApB2ex9nvBa1qsdT5+28qYWVhM?=
 =?us-ascii?Q?xw8euBGgY6xhn/BdoMyoSFu0aOAPY2Go5XaG7WX+DePD+KJExtYen8cM4W0p?=
 =?us-ascii?Q?0INWUv4Sb6SdhxegkB29TSSIPaSJniPRJPop6tEXkdohtuORcpd5Js6iyjV5?=
 =?us-ascii?Q?tGIG+z2HGmZ7qj1xRDL38FlqUEtpSVla7OVN4QHWe3avyg51BXjlZj7oF25O?=
 =?us-ascii?Q?bREooOQOc9ZFf7bJntjLTGyAzurc7rUmL5zT7KqKwbYSiSl5Q2SILYpDf4TK?=
 =?us-ascii?Q?onKLb4FYfkWVgznPkRFQQbPo06h7ZDGpW86iNVanwly2URB4dekVr6Sgw/Mr?=
 =?us-ascii?Q?HIgJRAf/PQ+40ACizo2qALKVp5vLILCh0VXwzOHSAJAAWwTm8BVwHfTd/bbL?=
 =?us-ascii?Q?qHfxSiYJJ7Wea/PbvTEbssBQBOHG9Hr7W8xAL29wrBDLDXkIko9XAdctym3a?=
 =?us-ascii?Q?zf6Nmo7r76HFQA/DD15Pd3XL1uceSq2239v3ktFHr+LUWroqQ3NBK9T9xhlP?=
 =?us-ascii?Q?SndgjWRqNWCP9jo/SDZbpb0bagM89D3fgIBVmjaO23sWwItr0gNayJurUruZ?=
 =?us-ascii?Q?zLP36rHary6LczGJSrPVLwSJOc+JN0hn5c9R1b7J8B2dE5btO8HaQFsoVyfO?=
 =?us-ascii?Q?DikyZRRaeGRn01XEWdRz3rX6SzPRbq/Y2hvLi89JyNTdc7knvBFM4IBQVJNP?=
 =?us-ascii?Q?fbmaZRaB8GM/BsigdnzJQAAgM5w5BMF72iuZ4FbfCBtE4TGC+UBRTt1aEEZa?=
 =?us-ascii?Q?guspvRqVt6BNfrjCXvWAXWDiMRuhvRA0OrWcv75mCZ/tQymk01CWAhLZez7W?=
 =?us-ascii?Q?70UNsdLXv7RlSmu3TnxNPI0/isRYYoocI+jkHRQFJHXguXMefNZHF1hHk1WD?=
 =?us-ascii?Q?LpQELR6gMfCMtMAPPTpyqqz/+k3fj9/fxhKXBqs295XvA/doXE5srY6AgEWI?=
 =?us-ascii?Q?8ktfWb+VxKrgyPqmYDKefXjHciOGYJduMWZ1d9VERrUE/lxQ1Il3dY2TR802?=
 =?us-ascii?Q?36peBcODr3yDiiKwD8Raf/c+UitV/dGukks0rq6Ml9Y1q5HzNg1wl85utGUm?=
 =?us-ascii?Q?Zvo57ZsBNDRvvkQ7nzcBTFAALeFpJSL0jb4VnYrPflRwxrLQ7BmnBEV5zEnW?=
 =?us-ascii?Q?lMCAnwKErG9hKFdDTrai3mr280etx2QV0X9eBL6oa9I3bMMhqkIdNgMV+idN?=
 =?us-ascii?Q?NeiBaRCeQCo6cCy55EcG6DFEacL9pQwRG/Ea36YT4J419OiJbaYxqoToFB/F?=
 =?us-ascii?Q?E1YoQCaaGX1U+FU8tOCWABhQwKY1PXV7XXKk74jKKGxdUwvYibArBtxlWjcO?=
 =?us-ascii?Q?oYoIJE8ddipzNuvv0F/khefojKPWD30d6gmiTMYbtEqK3iNb+p6I+geuOfa6?=
 =?us-ascii?Q?XHiU3r8lu75uKhyn6azvxXn9p2/MacQUeqFjPFu+4pnDXu4MxHF4WCx7ffLH?=
 =?us-ascii?Q?yPshkwDRYnZr78BLkZjM+gvB32Pg40e5X0wQF6ssIYuuMQHIYook84x1Ae1n?=
 =?us-ascii?Q?+EeYpX/zY0ylPquF6A3cN1Ktz5sqQkbmCgc0QUvlB/T4ZR+sr2HupS1ew0Kf?=
 =?us-ascii?Q?5BfSgMJyygvrQRUQQmqIF5SWj5XFHVmz9qNuM3IiIpLQX6cWk3V+ZuEF9nvM?=
 =?us-ascii?Q?olNOo48+kn6RUIVFFrnkSBin91iMCDb4ReycR8aGdDTb6EeJ7P6GyVivhJm4?=
 =?us-ascii?Q?BIbYV7MiDSQOxbOFjrl2T4O/Pd3WOiEQ+kzGSGd+0m/KWRkr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dBXnM5VvnBKTikIRIj8Ul1Tzgc5ATXdXzrJ2a+yj/D5gulWTbjRS++ID9k9m2/iq2Wxg/cVFO/wjqrfYwaDP2rxEM0B5Z2ioru7D0IIQXnaUaxxzc7a6gLNEYs+zvK884YoZPE0MR1sVbHYCDkY2p3FTdNvUyb30tAl28spkshT5a8FiS5Nv3N9GmHBX9EMxEVG54pxg4L9nxVPg9RcX8R0hSI0dgW+2hiwBNz7pHvOLAfaoI+OSpkW+FZR3fA9AVHuJHeWwHsqan0ByLn064XB0m3mXpBEbZNo9MumfUh7GKOqxce5cP+AkNA6i4vb7EFWQhsqUK+Zy1TNVW9KbyA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffd0747-b652-45c2-78d0-08df2754b7d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2026 05:01:32.4285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KbqWqft+Qh/IBnm9E1W8rtJsVf/S39B5QfWphrKbFMhF5IEdgODwsSXPThGUEsc5UXasu8EnQcdZAe/Y8dOoDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR18MB5485
X-OriginatorOrg: amazon.com

On Sat, Oct 10 2026 at 21:52, Thomas Gleixner wrote:
> On Thu, Oct 08 2026 at 09:00, Eliav Farber wrote:
>> The FIC aggregates up to 32 interrupt sources into a single parent GIC
>> SPI and has no per-child affinity control; affinity is determined by
>> the parent GIC SPI routing.
>>
>> irq_set_affinity() fails with -EINVAL when the target irqchip has no
>> irq_set_affinity callback, which prevents drivers that call it from
>> probing when their interrupt is routed through a FIC instance. Add an
>> irq_set_affinity callback that returns IRQ_SET_MASK_OK_DONE
>> unconditionally.
>>
>> Affinity requests cannot be forwarded to the parent GIC SPI, because
>> it may be shared by several FIC instances and changing its affinity
>> for one child would silently move all the others. A pr_warn_once() is
>> emitted when the requested affinity differs from the parent's current
>> affinity, giving visibility without failing the caller.
>
> No. That's a horrible hack and just pretends to solve a problem.
>
> We have the interrupt redirection infrastructure to handle that
> correctly. See fcc1d0dabd and subsequent commits.

Thanks, that's exactly what v5 uses. Dropped this patch and implemented
per-child affinity with irq_chip_redirect_set_affinity() and
generic_handle_demux_domain_irq(), with an irq_pre_redirect callback to
move the ack (and mask, for level-triggered groups) into parent context.
Tested on our hardware: a child pinned away from the parent SPI's CPU
runs on its target CPU with no re-fire storm.

Will send v5 shortly.

Thanks,
Eliav
