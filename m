Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.13.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792571983;
	b=uF5xyrgWiZtrQ3ICt/Fzh11G4aUgYhELLfUO8gK9YmGBmjYte/7u4kfGY+6FFI3Qg/j+
	 u+JEgzsqDyBKC1cMYBdDjjVLUUv5d1HzHISIbPaupzLzfJBRgjsgGlE6KUoqmNfAw3QuT
	 wfuL12lNQj+vIHo2ZI4ftcoMKFLgQbiNPfR2swvlAoBUgkmr6Ma/vu08BvIJhiJJlNe/j
	 rP7eIe9XNc4JxVY1ReCdx+X+Q7Hvaw5UoGwqqZKFWmvPCmHiIyOUiyoJcIHEm219WBv5y
	 scqBPUyJftcknOjWceB7W9+DGi2Dn0AWFkkOg0D7WH2z8opj9LUt+mu4UCngPl3Wn9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571983;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=bELvOtTp4xmQFIq0TRApEtcX34viuK3c9nNN0CyXZic=;
	b=RaE58B0hWYVjfg1z4rtdlonEQvqv7V1wxFSWc2QdY1r16tLZ6M7QxwXz6Vpf1J5VGFbW
	 RA/zK8ZNctn+YTmuhsOme/Czhz9rGmic7+jYnEHXsSLgMvNMlDZvdHUAi+BBWI2xgk9lY
	 ld4W13WmphsWjv8WYMlfmry0n4fxfR4F4LAdq1loogDAvP0RuZ+EJ9fvAJ6t4v5jF1IsU
	 JAyg0nfy5U51W/3egzy361yny78Vw1uJQvRoHuoQ14fSHd3Ic4b9gW5dM3LG888DC5MqY
	 60WLnjOk7qObIiGF7Q08srxomUjqaXT8Mp7t9Uiy+zi3Df42GO3VffUK3EopkA2+aaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=r7Tl7qhm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.13.24
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazolkn19011024.outbound.protection.outlook.com [52.103.13.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2231D606A31F;
	Wed, 21 Oct 2026 08:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2231D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=r7Tl7qhm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hzt7YN/CxqBwMoKDxMxVeljlXC0LWlvzMGnMNC5U6sEBgys+gpIkhUfr3oxGC0nho4HaQrJi3+EaMz8Xk890QMdMjQ6i2APlWnEcGT9zDalmvSlL5V2PzJGyI8jr5fOyZ+cDdDTyOaS+BxH37VtXYBD7W2Zg6W4nV9V3cYkR/rwbcu/yc7y5k9Aizkx3XU/nYjeT90/jKFgJyfDoEicObWfViZG8/sA5nq6lUGKxdrLlIK1cf+YJyWonVTgxys8evQXf6t7ffaM/Ql7eEX+FKMhKMdlgt4DbAmiz50Vmr2hIpKUsyovx80wxhWqJdhJosoZnzG27X9cuQVvDc1zZ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bELvOtTp4xmQFIq0TRApEtcX34viuK3c9nNN0CyXZic=;
 b=E/xSm7OILK65N/7lJYlsjnJkJ9QgowyFez+vgZVpM75+TqdjbZDrF32n01p9PzOWAWAnghkkiSZbRUmrjjJWDXyxYti/Cs4DzGZIx8PrujehG3oh8lC4Ch1z2AB8q55VJqdNQ3LmujKGpmDN/R3aR+Y06RYkp+yPvWSvQKIRRMQAwcHeqWAwb5RXv2AKMkicCZdYmg8Umz54SwkPxoZ5GaGkzhTlmej0m8KD4HCremC6ugjzLLaWBE0pGbV97wWi911qF/2JrAcB0e3F3gTAQM67KgUvxNdt3sPvK9xvZYzam38cQ+nklwCa8r9rac/MR9uKBV7/Ex4JLsDmvyZnww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bELvOtTp4xmQFIq0TRApEtcX34viuK3c9nNN0CyXZic=;
 b=r7Tl7qhmm0tnF2ajbUP3qX6SJqYRO1MAiWe2jIOfWTYrhUrozkXbCq6uzr1GHFrklU/cd6y8YxqLjSJk/LzkFqCJbOhiwJT8/H9ex/Kim764kdafTYD//zb9s5xylUMT3iSfnc9cdhqDDrRYMyfxuVb4ljy++eGsnoo7LEZ+Uee7JfaVW41EjOuFrEe94h5sXhxPzp4XX0gpyRnsf1aH217WDpl9E/iLTfmDnJKMvmjenSBlxXBizNr2ZA6iRYpDdY+t/7AhdJcX/sxMRAAg2ZPopV3E/S3wrFqxDo9F2nntjilYDSd8RTYP8Dtf6I0Rz0J2vhPF057YJPETUb7gfw==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by BL1PPF728805D7A.namprd19.prod.outlook.com (2603:10b6:20f:fc04::eb4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 08:38:41 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%6]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 08:38:40 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: tiwai@suse.de
Cc: broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	marco_giunta@outlook.it,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/realtek: enable AW88399 on Lenovo Legion R9000P AFR10
Date: Wed, 21 Oct 2026 10:38:28 +0200
Message-ID:
 <SN6PR19MB2303183ED736005C0A40CA8BFC662@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <87qzhseiuc.wl-tiwai@suse.de>
References: <87qzhseiuc.wl-tiwai@suse.de>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIUP296CA0111.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:351::16) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261021083828.10511-1-marco_giunta@outlook.it>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|BL1PPF728805D7A:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2bed6e-6b03-4fc1-dc53-08df2f4eb485
X-MS-Exchange-SLBlob-MailProps:
	gMiuAN0LASL4Z831lB8tpzpdpKMUIXWlbLTU8W3zq45Vot/bm/RvddHgXLYKv/80Yk/o/c7Y1QL9vqhGwLCUiiebZi9ri5LW1VaWupF0+hARJBINJ9H+b6pEl3PEg4h1Jk5KZtqvExjk+1r5HT+BlEKZf+2eXobkZQHVlBXcYAza9Zwq3HQz2zVQY1uhoLDCpdPixg131L0P/ywtHi0+zai5rJqSW+CvfBo+LpE2fg6uvFVCyYeFy2hJ22cPtJSpZ/XoHLwIEfqvyC35YRlXn8kmp0ZWdIT0reaNKMwxG68AfUuylRO++vSRz/vRNH1G5aWykFHQyDP0Wa58Kq2RxQ3Zb8fPJJNh+azzIokFCoUzRMzOnMyOphnD0JChaIF4pKpZ8HFCAzsCraYXhxGi+9lYE4MI1ajmHi48XwmlHpGYC6KztnlM+6n5YGgTZZ1QwCx+1ibgKXautQEmQ8EuE6t5uuGVYgOK1/o1WNmyf3GZlZLAQ8Ld0LtMKGWZmiOYAuelzlloF6uQP6lREWjmd6nQWT2vplGl7FwkirRapwhZzZ9BYhbuH6/qdHsNvH/VQS/TiL2iT+0FTzC4pko6OQgJA2z40d5rMFf1DfoHo+vloirU/qktImsF+GKQJ4KvNNMHNbaPvL2FyLurpn1uzQIzGeqGqoP++c0PH92KbM9GjCsaW0dhKThJWlZLyGRy77PAysWVOdYBu5kqOGsaPA==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|15080799012|5072599009|51005399006|19110799012|8060799015|24021099003|260925184616899003|25010399006|3412199025|440099028|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F/q1W/csseNbR/fFnbC2NpVYyBWUmVbbb30PzKIhcEII3kVfrQb5ucxPfaS5?=
 =?us-ascii?Q?ohmEtoUAEfQzXEWaD+mFKd5I1WVc7mYZtO12T/V9ivJa+8fap2c/8vOOhz2i?=
 =?us-ascii?Q?gB3wJSmcM+6cr2iBrJcQVUlZ6TmF4ytMgR8mxRx2dkMLgvWco/N1PAZZHROu?=
 =?us-ascii?Q?i5D+H5bCoSa//fnoqEqPl0WIlI2dpVuj01XaDySl5NqWKYP5qTZuKODntb7P?=
 =?us-ascii?Q?hnBMmkqFdR+Gqc0ZQKu1CCI6mvottssQVct3KDdfzrz7UNKrkLQDb7dr6S1h?=
 =?us-ascii?Q?6dsfbwb4EUYJHELiVD5qKU4RSYhKSALjCZFOBQOwl/Z8DUjNXouFnq4fkb9J?=
 =?us-ascii?Q?MfleUhT25QwkXFPYRXuI1b33iJ4inFX5IILUNAB3NF3mEd3B1WHSk7ykO09D?=
 =?us-ascii?Q?hZVeZaQZ3tXCLRA7f5y6owRCKRpGTbtx14on65/QJhMMc/zieNjqIlM6kpjS?=
 =?us-ascii?Q?IE+zSwpt6lgAIOoBZnPyHmmpbsWX1eiadsMlooXHP/yTGtRd3vj9FfIaLmcS?=
 =?us-ascii?Q?bjrLZAig2tuc8xgpBiyQqRk9jexFdYNx0iyb7g07mM8DNHYYayVVP43tcO/4?=
 =?us-ascii?Q?nPAI+vsQ93/HxlJ7JqcrJq44TJx+ROVYiZllP2Nzkn4m27v0Dzjm5t1mpuBH?=
 =?us-ascii?Q?UFHKy1uNPdlNLklK0YNyxdDUteSLduoY2BQT4tAFZYn5Eej+ij7s+h5ngBei?=
 =?us-ascii?Q?BvL1JW6ZlquJLkzeUS0NsmlnT1IY9N/cI90feZkTsRdzGjUF1n6oYRUGll7i?=
 =?us-ascii?Q?nqBY770AwTcDjyrfw/ThEIIOlCIRLw19RJK+B2dwOQbSq+99OJUUCtDQRW+B?=
 =?us-ascii?Q?ZpW1dn3oVfg0twhgS1WPjD0d0VwZsz182hfa8LSzSF3OuKIK+/zflTjVMvU+?=
 =?us-ascii?Q?lA5hUqsrxbLLqdn6CN+wsoWEabQWMxlaGYaMLPPlyBMfnu9L/KLicjYZN8TD?=
 =?us-ascii?Q?RCGoODH4KNZYoRPKZgo/SQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VhD0bVhY+wkMTKFn0uMKq7hbbsVtaUlyA8u6MFQ8WnEf8t9OZ2c1nHHkga8n?=
 =?us-ascii?Q?NasKTdTVc6dflOOJ7OQWz/4Yyjd6dYdjJdJNdAkMWTu//jHvqq43jIhPxPUL?=
 =?us-ascii?Q?yI0og0ry1UgfyD1W+BK/jL2MpTbTB0BnuSP3lQd9covU72JXd0BftM4eCxYL?=
 =?us-ascii?Q?XJhfP8O3RQcIDCSgz3upCJO3RU96jckofBCxCCR0473v6XuEvPIgSQg/6cqa?=
 =?us-ascii?Q?NJRMfnkQKAFp1kd7DHglGskdUhiRywkPIuMEUkMyLmLhmsDU4zzzKV4xz6JL?=
 =?us-ascii?Q?DzgF1bGQf5RginLa7h65EMZGSQHa1hsVmXkzwwuY9AQ6MQTPL8a5xachPkOM?=
 =?us-ascii?Q?pBuWuVzyGNctBwbACN4+q/SoQyF2RWz9bzG9v9KS17pmX3rJu87v8+YrN9yN?=
 =?us-ascii?Q?CL5HNi+B9YWmO7ZTC7C8589AbaXrQyQo4/G06k9mq8otLYWKsc+FkIx6zuF0?=
 =?us-ascii?Q?/QVGPBpkelgQUB/JF3o8lAwOSffV0lmM/JShYYGBP4BoWnxEy3zIsJahOtag?=
 =?us-ascii?Q?x55Z/58djuehhlEj8QxmegJzrX4YVmrHqaz5u31ToBBG0vNXMe6/kD+njFQM?=
 =?us-ascii?Q?4K2gdltsVc8EDI1OUBB6T+AkqrSeLl5aIDBhUt23QfNKmwg2ED2pLN0hXOEB?=
 =?us-ascii?Q?s2liEzLexSgyFwol96aQfxNdC5LswALlDyzO+JbJ+TnncuAYTNLz3MIalYZI?=
 =?us-ascii?Q?HL/jsnwE9VpkPu8cpAtAWZbaDQy1VlxeIBi5ClG3s4oBtK/dlOGNXPXACRRM?=
 =?us-ascii?Q?DdQsM6Qx/W9rDzvcOvNlbLN5loNKzgc9fJMCVcIOUpWo9Yu03apiqjcR0/ep?=
 =?us-ascii?Q?Rix+j7a9axkFe+Xmvu56oox7quuv7EnFyRATqbTEIAKXhGo52I2mUrFhi5Ta?=
 =?us-ascii?Q?wlAuO1hsLaIMhjFOAZ6QT9IYG6+nCuhLNzl8QKSsA6UKuokxzzhOVHwIIBr6?=
 =?us-ascii?Q?vNOyWiV2s2BhMEGs9+2NW5lk79sfqyfCz5zZ14Yxgg7f9kpuyCo7FeGY9y+W?=
 =?us-ascii?Q?mRNsMsVDFivz533721daeozlA6RoQOM/rpP/hNQ8m55bGrqhteGBBuzEQTSC?=
 =?us-ascii?Q?GVEtJDTfaVcp6dKkkEOmWvtlKIAfYDQ1xAt5iWLiGLa8DL7Qmv4POf8hhqch?=
 =?us-ascii?Q?uSq81kgdFBOxDPLcqjBRE44YX6aMszXnZJ1YnDUAGOm9qB3a+uO+BDyNBxyZ?=
 =?us-ascii?Q?59vxCE+jpT4XijF8qga19vd1xQjpz7fo3/zvVg4eXrfvL8PURkL6vXDLXL7T?=
 =?us-ascii?Q?uBt5DR+SmLxHYKiHATe6vfzpN3D7G9HA1tJMQhXKWaaG+yKY7WNI9gYvcJiP?=
 =?us-ascii?Q?S+7QVrQqEqmRrjoF70lvrGgP51frl7bY8WOK0Pkd83Th4WWTf/VdniFl2bnh?=
 =?us-ascii?Q?IrCUKgypQ2sInkSwtZgfxlDl/ik3?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2bed6e-6b03-4fc1-dc53-08df2f4eb485
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 08:38:40.6568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF728805D7A

Friendly ping on this patch. After the 7.4 ASoC PR, this should apply
cleanly.

Best regards,
Marco
