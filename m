Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.10.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794623693;
	b=h6UV0t7QynGUfKadslQn25DjpaCkLeP0ITsbWsQPeJMr30uoV3+NgsAlr34Ly3y2JsiQ
	 cbO9kzxiohmdKw+CJ0UnG03LcbMQNPZeSV8ewZt9mMC7RyUVK5qpJjL4p8MpWpILq4mmE
	 0IUogcw/r7bkMUeo1OdCXOJ2xUd6LZXVyHmw0eIKiNBl2cN2zd260lPDonSKo/5AGnEpL
	 ZmNsm8kWUEkJEJPYCi5YnWAHkqrjxAy+HcaVYj2i/IiCwQE2c/mW4e5ca//qodZK6PZ2i
	 iuUExjUs76nxI+xFQPQEOzrmO8uVygw/TsZ3fP2f8X0qhfEuQbU7dk4vLSk5ndW35gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794623693;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+lo4C+qsWWyNxr4ZxCbTfW+m3/MjjUjBzgD4XAkSDR8=;
	b=eJj45Z2R8LiE6f90alw9Cc+7LmW95vL8fzdYncrXKoWLwa3zFg5ADIcYDEi7sS4yap+4
	 0W8AbrPFIqfI5wlAAWmFh6wvRAPoYVeuU7WzCnD34miwu1WyygRfLIoAw31gXz06won8t
	 FXjmvEp1MeJ01BiW6O2qi6kxGkyzW05mPWoyn0K0RVxdai6uTdc9rFU4i9ghUwvqe+hsk
	 gGvWwPumEIdSC2AoO99cYqhVszg8Onh5ZWLKx0xPoHcOJZfpfaJdxuxhvrZauiixJhbw9
	 +eyKPLPQwEw34U5dG+unvE4lKeGy1F7Jxtvosj7n/ze/XGRo4yiskUlDa/bYoEW6NMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=KkSptO4y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.10.39
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azolkn19010039.outbound.protection.outlook.com [52.103.10.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9955A606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9955A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=KkSptO4y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzZgeXjm6DI6WmD6XifFkzO1+QmKVb5r6uiNdBLnrJZS6pdQpfC0GVt68q4QucFGUp4k/ty71+7LuUWemB2diswi74Z7xMkthMpGLtqaKo9fCDEEmLjrjuOGx+loroQmGRDQLx+LgtAAsiLkkyb/1xjKBjynfGQ8l26qUQFvpsHWeS7r64Uc+XY6mlw/GwO8tgn/Vq4WEUhHCH+J1NXMrBOe2HO8Bsqz8mUuPV6Zxf+H0/U39piS3lAHsvoADTbSIdUavzi0qsk4a6EbGLNEEf/TAGSbKPeSjx1q+FDltt7i8WJKX8qp1BJZFwzuE4HqlSlYwWOxhThnkGj8Ecd0Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lo4C+qsWWyNxr4ZxCbTfW+m3/MjjUjBzgD4XAkSDR8=;
 b=gO/FoDb2PjiwTFxMmEIEHSFdjH7SE7SHUUApXIiSJFItxuyKD7oArD/8e2HcyFUZNrYi16ftKTt5wd/hkuRa8gYGEm79hHclEWjmRLGOG3RTS+zlFIC5jEBI7cINsXk81OPu052MXnrp8teh1THeb6a0SEpajn1C2Exyrprto03/w4TkUhq91y6JSUjGSsFXDEsBOuMtPZoZwo/My6vQHUaosLuNVpXoHonziZmJIEGaiz/jSEcCOs/a8d4fSDngLBgotzHloiMUgWRCmkTdDKPhgMPnPHxc/DMKwfGC1eSlY/Cic3VfyW3waI2gKwUX6hJr+FcpMOikFyUXiL0Ihw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lo4C+qsWWyNxr4ZxCbTfW+m3/MjjUjBzgD4XAkSDR8=;
 b=KkSptO4y45VrEMxW73oFfLUGUWQ2LndiunBHm8g/qBi59TykVTySHLGVdIqPFEazWv/DpB7PjSfIu1MmJK54QrvM0SiLb8+jLBJkxYkbs7kTvn0CoohJTS8IdbLQe4NprsK3YZf3RUBTK/xWBztW6jvMvwiK8Vc0kiJTKE4unzHrc5s6tGnFFQQQrU/UBVlRVUZM4Nx/jlEh3DD9rkOoZW59JmSHK2PoFMdBSE1JHGO0up90wKnAy6s5Bq9oQYqgUq+GBN/klVm52xk0bgkl4jOyK4zhOmZaMlo3G8jpVMyrakxbbrzPkUvMJwt8gq6bsbDDzoYnl5zh0F3ZRiH0FA==
Received: from SN1PR12MB2528.namprd12.prod.outlook.com (2603:10b6:802:28::33)
 by CY8PR12MB8299.namprd12.prod.outlook.com (2603:10b6:930:6c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Sat, 14 Nov
 2026 02:34:50 +0000
Received: from SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a]) by SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a%6]) with mapi id 15.21.0615.008; Sat, 14 Nov 2026
 02:34:49 +0000
From: Victor Chernyakin <chernyakin.victor.j@outlook.com>
To: andy.shevchenko@gmail.com
Cc: andy@kernel.org,
	broonie@kernel.org,
	chernyakin.victor.j@outlook.com,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [RFC PATCH v2 0/2] regmap: add APIs to bypass regmap_field and work with reg_field directly
Date: Fri, 13 Nov 2026 20:34:35 -0600
Message-ID:
 <SN1PR12MB25283C95C4C1ED837F80790FA57E2@SN1PR12MB2528.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAHp75VcR0EjuEoq3PWwVgt38fcOB_gNh7v7_s1CUqnLFwNbcNw@mail.gmail.com>
References: <CAHp75VcR0EjuEoq3PWwVgt38fcOB_gNh7v7_s1CUqnLFwNbcNw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:610:e5::30) To SN1PR12MB2528.namprd12.prod.outlook.com
 (2603:10b6:802:28::33)
X-Microsoft-Original-Message-ID:
 <20261114023435.838619-1-chernyakin.victor.j@outlook.com>
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
X-MS-TrafficTypeDiagnostic: SN1PR12MB2528:EE_|CY8PR12MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: 923b3af9-b86d-40f5-b6cd-08df41f7dad0
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|22091999003|22121099003|23021999003|24121999003|24021099003|260925184616899003|4140399003|25010399006|5072599009|39105399006|8060799015|15080799012|19110799012|10035399007|40105399003|1602099012|26121999007|19061999003|3412199025|440099028|4302099013|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f8B7Vpiwhnpf/efdST9r/jnVahZcvptQciJmkMERvs2kTcGLSxYRUKWbXQUm?=
 =?us-ascii?Q?8iJU1kvM9srdH+Aj4aPoyi6PpOHOHS1T/ssXxAKEVxyWJ4lwLln7ntH4jrtr?=
 =?us-ascii?Q?fcKxt81B6H+carMRbgmytPWASxjZqzP8STmgzEfOeX8lFzkzYc4SYeubt5Pr?=
 =?us-ascii?Q?oVkuZvWUB4f03Qn5eJrKt8WSzpcOx5k4jeKbXTuItTwhEWLaZdEBC0+tWXcl?=
 =?us-ascii?Q?cAZQKgs0z33HWDenenrPj9XCJSoWlBB1041895pQgYB4uboPeVyS1fDVw/Xg?=
 =?us-ascii?Q?q2sou3uQDS9Ax2AnEmpIEYvgVGkKhbi7wGPK3Orb9eaQT8RYCwo5tiqx6pbI?=
 =?us-ascii?Q?x2He59cl+Bb7bvtKy4tQDQpYfr17qQuWqhqvOvn6N4xeulr0TaAxiA+ZvHNg?=
 =?us-ascii?Q?EsMHr+QCK8eam/TwQyXLqVm+efLgYepRgWApDN7rUH+WzP2wxmPaG1R94hCh?=
 =?us-ascii?Q?2AaH/Wp0cT9XUfMBpx7Mi8lJStIIZIIhfZJZtfi/Izwt2oCFRs8L43Ngeu9C?=
 =?us-ascii?Q?PyPDdKblToc7NScuwC8BWfaXKjTIT04MwejsSEU5Th1z7F9cIzJXWe51Jcbx?=
 =?us-ascii?Q?jm4lgxaBJZnTNrPexnlxK1ElUqMiDcCwQS0aF9tnK3QIHCrqMy18MhY4BunC?=
 =?us-ascii?Q?6TUMI0j7/e86U4Bmeso7ntnrlVnL8Ms3SAZsIodbtJJKradx7fC7l8wSrMeP?=
 =?us-ascii?Q?yWSWXanok8MmXQba4OP5EqTwUOapCeJGRnLtVdDSWa8S++NELTJ3ss3eqLEC?=
 =?us-ascii?Q?DHLljpx15cPOYtFRYlgrgmUhRkTxAgIrG88GKYOZujoVuR+Ds1MwTLfGnR2V?=
 =?us-ascii?Q?LPNMJ6YvxFMHnnUIjsAsSfRyuWALLYsNyMQHg9QBr+pGrbi+j5gLTj2N/43N?=
 =?us-ascii?Q?R4N31ioMqq8cZmcfMyYTnRj4+oQMv9Dqxx0UjNhEdkTMj+sL7iXneKCHtR6x?=
 =?us-ascii?Q?A/XoyBu8i33Lveeoxa1NrTGTRXkgcFhWTirziY6jkpZ/pt9aXhZxr5hIrKeW?=
 =?us-ascii?Q?vQm229lcH+KtegKaVfTK1V+RKabFENgUPtcRZUL+D1EoPe6Oan9SsAoxdC7u?=
 =?us-ascii?Q?duMvW8EPNbeNnwLeePr0jB/IWbe8QwBH/R6F0ib2uQQ8iDMDjAXp47JUkcPt?=
 =?us-ascii?Q?Xr3B91QIdMUF1hIatveMAZhCFnaCuTa+d9enCzcCO1Uy/1I2VjLWgtU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e05mBhKrAXpQHVkkIIvyWiIys/bUx0+D42AojEgr2wwdvdH6BbWaj6xrn1U9?=
 =?us-ascii?Q?8u4UsbAkw9YIXZd64XcnJ4h1rzat16iulokCPXPG3xSfkcbxQ6+DylbXiHCD?=
 =?us-ascii?Q?yFqIzojU8NmkN7LlyD9pOdDWH772zDz27A78MGm7R2yD3+XYS/i2KW4qngFT?=
 =?us-ascii?Q?bQqv5ZW9a6ZptSM8mpu60oaW7NPmNYdzFX/RLmdRIt9rBQOnJf3JrZGlFBNS?=
 =?us-ascii?Q?iUXK4BLGjAQlCgV8i6RfYBbHEbtMxLvLw4t5SPj/M0ozsvSwykpV+iIjLJ0/?=
 =?us-ascii?Q?KQpxogh3hFZRmilyU8NB3Exr1qf1m1t6ggg9d0SrAL5zYIJVxXLEcB0Mgc/0?=
 =?us-ascii?Q?Yu8Orl2ELGwX1Xs1XMk2RIFe3tAFIZbNVDqUHwvCUUx8oGjhO1B6DFqw9kDZ?=
 =?us-ascii?Q?OhelUv56RrvEK10Y+2y1qIKIH2ecSgDsfqb82aRxkjN0jzttzNR5TevSqKYb?=
 =?us-ascii?Q?FkJHZ9Catb2sweO1Qn+CVZKpIssCzR31D6Q9rAw9YKs2nex0/hauTvyezmU9?=
 =?us-ascii?Q?6j3PZ1ko6jy1P+QGE/e9Ecw2l2tvb4u0YT4wFLTAbRQ6I+F4PcouCpOiyD59?=
 =?us-ascii?Q?4NiRh0vdhRDPinfPnT5KxSei40NWBV0FzO8dBkhsSkQOWDI7QrrZ91iXyKfF?=
 =?us-ascii?Q?rlRU/l6VjtTO2MBVArIIVTisJLtLPvLtsRvjxejowchJ6zjXqrcFnJD1VQmR?=
 =?us-ascii?Q?ftXHigiP5iOGpPKuVfE7bPqMkMRau9G2t7egQAdGIb6+1lo6dNoetYa6pAyn?=
 =?us-ascii?Q?gmNJUf9bTw8h47zPX0YbRidxuBFsdTR2SiRiGl26BF8TGuOI9vWO7nnL5HH9?=
 =?us-ascii?Q?C8eb130yGsxIVci+NNse+scgw8Ms7ghvfCsnghT+49JiXlLbkYu1upYdLKnr?=
 =?us-ascii?Q?GatK9PqcZLWmEYw5HAZ97tjfhUBKCMXRAgj3nKUNu+MQu+i1N1o+uG9MBo8h?=
 =?us-ascii?Q?5SVkDP7yO0FX3kgvpr2E9EpkzKKdM4vRWYCS5ncjRdeSAM/6AXFGzp7He2LF?=
 =?us-ascii?Q?v8AnLEzZftNrBklk9Sk16QqMJ9V6t62Dmkx+TxwaaETuXD+GSdWfz12ZSdOx?=
 =?us-ascii?Q?5PjyygHSOU3W666+UIN0EUWB1LShJtp5vrJIvX1mbDE1PkGyLbdN+MayCHKR?=
 =?us-ascii?Q?+NQoU6cAFoKsT9RUKTOfTrQiDD85oKkcp/lA8UMKGnPa2gf2d8lKHeNtmNsm?=
 =?us-ascii?Q?KXczTy6FXK0CP0nKEuSfFTgMRCqQQ3hDsCt11fWbMyCaPpmsfn75BluA2qJf?=
 =?us-ascii?Q?NmYqLKT+HpHIZ5SLFBmTjONP3c80rNPq70qVf6oWr1jFWYRmPENVliKcU+Y0?=
 =?us-ascii?Q?wYOxYMb9pv8N6XzibQgVejv5JO6S7KoxtlI1HoM91QPUBvy9M5sMYmGgeAhW?=
 =?us-ascii?Q?u0wnDnPdgcqb/qeIz0SrpLqu9xtR0/cNCR4Ssw+b7KZxsvfx7g=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 923b3af9-b86d-40f5-b6cd-08df41f7dad0
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2528.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 02:34:49.6626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8299

> > Working with the existing regmap_field_* APIs requires you to define
> > a reg_field, then use one of the regmap_field_*_alloc functions to turn
> > it into a dynamically allocated regmap_field. But reg_field and
> > regmap_field are practically the same struct; all the *_alloc functions do
> > is shuffle the data around. So this RFC proposes adding functions that
> > cut out the middleman and take reg_field directly. Patch 1 adds two
> > of them: regmap_reg_field_read and regmap_reg_field_write.
> >
> > Patch 2 ports a driver to use these new functions. The result is
> > shorter and simpler, since all the code to perform the allocations
> > and manage the resulting regmap_fields goes away. In theory,
> > there should also be a performance benefit (we're doing fewer allocations
> > and have less duplicated state), but I haven't benchmarked it, so take that
> > with a grain of salt.
> >
> > If we like this approach, I can post a v3 that adds regmap_reg_field_*
> > analogs for all the regmap_field_* functions, not just the two you see
> > here.
> >
> >
> > This is not actually a new idea! Both it and the current *_alloc approach
> > were suggested as alternatives right when the regmap_field_* APIs were
> > being added [1]. The *_alloc approach was chosen without much
> > discussion, but I think (and Patch 2 demonstrates, I hope) that
> > this approach is the cleaner one.
> 
> It may be good to Cc your attempts to the authors (and active
> reviewers) of the mentioned change.
> 
> > [1] https://lore.kernel.org/20130604210137.GV31367@sirena.org.uk

That would make sense, here we go:

Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>
