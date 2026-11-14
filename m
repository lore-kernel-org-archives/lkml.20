Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.2.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794694804;
	b=m+vCmmX7ibie3u+iIXpQbgt6LGocULRxLsSU/eyLeSBN9Fiwwmyx4Yq2YaXvOR1Opmh0
	 PJbpxnZrqmCaW64N3NIsBc9DD1vpzU+WTQ4nKwidoXp7QBLIRDZ+n/AL6BABugg+q+lHR
	 pRoPXll0tcauKb/oj1htKgxbktr9tdVUBNbXEpqBDmjficM7/VTv/GMLTX8I3CutaWWzT
	 n3iPRUahSL2RIE2NxTU2KhQQbm5TEenDpqkAQIaZAskhpcc6rj2JOnqvIbIvtkwR4CFx2
	 wv8IXoe9lh/PxyqqSzfLuBMKmSKnEjfHGFBGEukxpagbwsPGiM79bmtwJwMbANDZUFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694804;
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
	bh=MDMCdI55AyDsG9PWnXAnVG3x6NjM/fb7kuMbMATYZaI=;
	b=i6wDVLmnf9u6AzZgvLl/R3WjbsOGze+yZhJcOnWUVUjzrfhTeDXURQ/ovoLerpFuXq2S
	 Xnj8hkhcAtmX/QepaRQff2di+LoLX19R2Cv0rnrFLNEI30d7u++cXI29eQ6lxZyzcCz/4
	 +HcdMd4pBD0AcM9dXy/34NY2hkIFptj/L1wsfajXTFac8nWihwhxfpqxuazVlCpy7qyt3
	 WUFxpm0JqlK8+Skd8emRPBzGnh8BPU5OMZ8OznwI4g4TK2HbUarMyMhQ+E8oxSxMJ4QXi
	 VfT11y5CxA9cDefGu3OGvCwIjma9oMlTgahaXgccrCxLc4yniuQcPhtwuixZcBM5+uA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=hFOz9gqL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.2.16
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazolkn19010016.outbound.protection.outlook.com [52.103.2.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4529C606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4529C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=hFOz9gqL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KyGNlGwjbqN6EEPDYFkJD5PchiM7KrLn4RA6m8dLccKsG60yjbrfT28MeKYh+8iE4rehqSOCWI/JjyD9ZmtWoFOVEk6p8IMAFeDvEWVN8trxiuAepoJ1E5ZuBwEOpHuExTDY7vDir0C7FYUpmJ9oTZ78wjbz9gsnfQ7QdkYJbWUql2RqnTIQOg+c/BHtS+bG5eCq6HyHcnIxlMgFVJjMpxQlvKD8lq6Ei4Tl4ldhnr+FSSoJ0759UV+kIq8fvpffH13B8Nfq59VA9FOozpZw/bpnmMlBR++cedcwnkflGLv9elWARQdkVPsTE37mkDT9twtKcOHXwNamFNZMqqQ8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDMCdI55AyDsG9PWnXAnVG3x6NjM/fb7kuMbMATYZaI=;
 b=c+Snf6oqgWRseynvhXFC8ud+FpYC6qoNjqJ7BsVX9TT1U4Y79sN2Jr+H9qvF8RbxqPqrXDpyihRe92hs1leDeeualIytFQMuKKYjq0IClEtuPdedS27lubpboqUHQju8nrFuOCK5LFqezNLXsMGA2TjO2Qlp2U6LWTkubFGwMbjRm/auuAnHQ8onIpjonz8zwbRLxTzN325CXGiXaTHAW2l7ngnizUi9zis27q/wSUHl6H1ql76UWqwcQX0bSPVxhhMEyNDvfiAFxvhgJuS09WG5DrjSlL1ameJoVnqSvzITjsTzKHDcidiRZPatGVvm+M5ATELrWJwe9bGBiwr6Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDMCdI55AyDsG9PWnXAnVG3x6NjM/fb7kuMbMATYZaI=;
 b=hFOz9gqLCSj6ZugDyzKytatQ+t5L8cfPVZWkAH0/YvZBNQuyDwCJd64zs5rJq6fGA1QhK9Sf/ByAmMUJp+w+BLfwIrHCAY+2x/vHAp9jrGy+Ny0P2FH+AP8f4OsvGJCYyFF+/G+pgf/OOVbmGRCCrKjWY7XuhYga9nYHnA08EtBHPjsaGiCc+M1p9y2LEm/Z1MQX7qPliBQCAtaWYLQlnUU4lS5nlEhe14hhYW9wlpBHnJ67cBDsYxEk9X6WAE8IZwNfsYpZHbge1frHs2P0SC4zDMFFr5qWMZ1bVZX/xh7lARx8Cuqt2rONZIB8owo5/iQrnP1PubYoCOwRBHLrxg==
Received: from SN1PR12MB2528.namprd12.prod.outlook.com (2603:10b6:802:28::33)
 by PH6PR12MB128275.namprd12.prod.outlook.com (2603:10b6:510:3da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sat, 14 Nov
 2026 22:20:02 +0000
Received: from SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a]) by SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a%6]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 22:20:01 +0000
From: Victor Chernyakin <chernyakin.victor.j@outlook.com>
To: andy.shevchenko@gmail.com
Cc: andy@kernel.org,
	broonie@kernel.org,
	chernyakin.victor.j@outlook.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] regmap: add regmap_reg_field_* APIs
Date: Sat, 14 Nov 2026 16:19:46 -0600
Message-ID:
 <SN1PR12MB252828E9648C9D61C53A827AA57E2@SN1PR12MB2528.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAHp75VcNL9juKhcRQYMH8WdnQJephKb1APuucqLNtk960_s78g@mail.gmail.com>
References: <CAHp75VcNL9juKhcRQYMH8WdnQJephKb1APuucqLNtk960_s78g@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0308.namprd03.prod.outlook.com
 (2603:10b6:8:2b::31) To SN1PR12MB2528.namprd12.prod.outlook.com
 (2603:10b6:802:28::33)
X-Microsoft-Original-Message-ID:
 <20261114221946.876388-1-chernyakin.victor.j@outlook.com>
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
X-MS-TrafficTypeDiagnostic: SN1PR12MB2528:EE_|PH6PR12MB128275:EE_
X-MS-Office365-Filtering-Correlation-Id: e61b859f-4f3a-4857-0df9-08df429d6b95
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|5072599009|4140399003|19110799012|8060799015|260925184616899003|12121999013|16041099003|15080799012|23021999003|24121999003|22091999003|24021099003|10035399007|1602099012|40105399003|53005399003|56899033|4302099013|440099028|3412199025|26121999007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2qkMlSQr2Wt6lL6FO6b+i4lRmy6v3dyWZMuE2i/P0GVAo+z7M16ktL0D6UjB?=
 =?us-ascii?Q?nF5QheMDJwfpV/46tfCtKi7DxombC05HhOpeJy+NtSgZmEB08KNb+BTOaRxm?=
 =?us-ascii?Q?kjvNudWWJVQXsaPr7sfQYn7p2I0dBE/M7TgDC1FkG025pEwjykfAPO9doaSj?=
 =?us-ascii?Q?OE5LnwE25ThSI6thAeRjhKiUF3MxEVUYs22VZziPS/gdkXoIRhvSfT5jfbqm?=
 =?us-ascii?Q?R6eGgZkTK4MIhaaHGbIPvF8Z2L5oqjomz9X25BCXZpRyYPX2hJfazTdSKwJ6?=
 =?us-ascii?Q?YbSoZPhYUp05CytMcFUOGGiTr7jV6pwraZxi71tPU5PuisdtlaZyXQUFotBk?=
 =?us-ascii?Q?YswGnapkjH69glsjzmWyWg5JvZCR0VxhRsf8fbvcEytU0qTAkJ8qPUj+/zsW?=
 =?us-ascii?Q?M5wwEA0pHt/O3y6QqNFZTtj44peo3zQ8O04swuaQY62uG4No0WFk5cZam4pg?=
 =?us-ascii?Q?YkgFEAi4fylzb22irJCcl0szCvCHPGtr8ZjOmwbgX2CG67lIIcC09Ij4eoFz?=
 =?us-ascii?Q?vBdm01RpMwNRC8wvBBRgtWtjZexedbqkCO8hIN9l9EHxthWDRdwbmbvnsGAC?=
 =?us-ascii?Q?BPgD1xdXV7f8SiQdrw93toiabmpu0PgcgoWnf999lSIpypgUqaWQtezRizEu?=
 =?us-ascii?Q?EIgroxwXMdmLpDiJaB7vuBc967KuudK5j7DOFuFKTW04JdFbAu3XVpCFO++P?=
 =?us-ascii?Q?jpoZHrS2RpQbheMBBuo705/3Y+Y9RsR2+ACPQkcqALwVGDijpeXLsCALKG2d?=
 =?us-ascii?Q?FwM0V1h7IcEiNKvx/Mbq8Z7DKKdnx/hVwpwoK0IeoA34556DFyCTD9jWl2aC?=
 =?us-ascii?Q?mxSgYqvKknx8D2IBGj70llyiwylPTit5+pC+ltQRScny2uIMiBw8lMkxSMEn?=
 =?us-ascii?Q?D3At91QOku+QAnoet7SG37abmWpoZiZo+gqDLjLW1YoSszIi9ZKsTOwmALxQ?=
 =?us-ascii?Q?HItUis1kBhYe4o6wFv/lQyFM95nEVL2YD1YylS5Fb/nJafX/Sfg6zud5R+JE?=
 =?us-ascii?Q?bL8yghHSPvQ+Q3dvMVH0O7DFJRkCsDRJ7bYyY4LxPrRN19KM3wDiTR6SjpMV?=
 =?us-ascii?Q?oq7vZ+ztmxzJEvCg8a5Gam7QM4CFLHbgQMzvbs4IYwg7aPNRbKQCwQX9vBdA?=
 =?us-ascii?Q?k9xDyz9+Rk6qo6Po//R+zChNfn7IqfAqWeXGUkq9gRkWy9cIOxgCPrU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KqkaUi762qTaE2lpGTK5hDO3TftnpVzsfrqJOpNTaVvFJnzzu/zzdesx63uR?=
 =?us-ascii?Q?B078KVTP4BTCaETnkTuGzb+tiCC9Pom3p6IH3BHA6Wg5qp4tKfIRrU9JYUl5?=
 =?us-ascii?Q?6EbnL0jqq2uurwzs8YuWsIH/9zdnKfEFB5o9Wvo/EtXYpzReSHnEvnBc4ygG?=
 =?us-ascii?Q?xxCRh6zhyVnIgoHVKAQX6xS4yb0nYsYLrsHGBo0XWG+J7/hyo4sCR9oUuGwM?=
 =?us-ascii?Q?cgW/3UbNzLi/4orygtDwUAGARQrykUgOR93iEthJVSV/OfgsgQD0uAmZURNl?=
 =?us-ascii?Q?08/EnBFvE3CzMkqrQKpg+6B8iAEx/BA7RiLROZqmVCPPYGN+UaLFFBRKNGJ7?=
 =?us-ascii?Q?TwadMDWHFLMVOyLm4x35xroF3JVjez/OMJ8HeBAM9N1eLMkai/MRSlQE3eiI?=
 =?us-ascii?Q?Jc52RAjh0Pm2RlyJa9kwQ4+bF3a932mWaGGlJoh59YX3ZUs7PPxNJdldv+X6?=
 =?us-ascii?Q?CH8u+/S4zF600hpJjPdEfWiPw6wLl24U9RdN64MB6k2TQWq3KzFZUUO0oPvK?=
 =?us-ascii?Q?dTCxmcaFvolI73uZlfitx4z2lrb8aGie0jXorxNGlBTDb8bHMkOOiCMT/nLi?=
 =?us-ascii?Q?h8n2ch8esN5I2XzqrtuY1gZoDHMrP4p8TOoiQ7MjfhNAp0+PiewMYtfDFBs6?=
 =?us-ascii?Q?p1gRFmzUSyWA3KWXjTdZo0sGlNowCJjWwryozMkkgq/B4/OWhPHcXb7sM3jl?=
 =?us-ascii?Q?TDbOhUcIWNbhj1HtCfH6bDRCZmRAz/mksIhPDGX7QmtJWowm4xdBILXvx+0e?=
 =?us-ascii?Q?mA2OJLYCl0Dax+nv6Vmnuj8ryITBUoCXUa8t1gZK4WytrC3HfTPOtersZIfw?=
 =?us-ascii?Q?l6MqsG2i43SZSfB38Gt+BuPBuw4Il6R01p9YC6WDfxbn8DCLJcyY+jV2zKb7?=
 =?us-ascii?Q?cCYF6+We+0ykZEV5yHs37Bf7dsB3LRDxaP9jmYi39NMFW+34I6bEsCT8ELXk?=
 =?us-ascii?Q?khJ1Q015LR/ZHf4roAaRfr9h48ngVRSt1stCSEV8wchoXcAIEo1DKn88wQVg?=
 =?us-ascii?Q?825m/2Q9fSx0HH6GtQbbYV55O+T/6An40BF8zHjSvUVfipdFyXedmY8jYif8?=
 =?us-ascii?Q?tI+vgnzTot2aOM5Ba0pSYjpZIpRmv8F12gdybZr9m1kngpCtJtcinOtRlBTJ?=
 =?us-ascii?Q?vEOrDeDGnoKP+xyeLr+W8ekQwzIvpSc/aBLFx1upoaKTbF1SCAyl30tVS+3H?=
 =?us-ascii?Q?i5j21tXwJD55ZyOxqWf59sH3rFT41BRV1H8nOphp9V2c5vEnm5Tmqzj2FG7i?=
 =?us-ascii?Q?udm8sMPulhcA/XbP8gsux7nr5wA5TViGQOC2+f8tVOIxCkfJ3HZWSRK7+wy9?=
 =?us-ascii?Q?ij7KqeuL5DoPpdoGEW3499lN2VH+BL5mxhr0yXansRyV5HvBWIzWpZpP4yyO?=
 =?us-ascii?Q?rdcHQDdssadvJCRU7M5R9BQ2AydH0Ypo1c88iGwGqcoYZ/70EMH/8o78mVCj?=
 =?us-ascii?Q?IXObJugg1k7lP/wc/JUHb0vb+ftmIV2QEi32fEj4YwNC9z5P4C+iRw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e61b859f-4f3a-4857-0df9-08df429d6b95
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2528.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 22:20:01.6742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR12MB128275

> > > > -#define REG_FIELD(_reg, _lsb, _msb) {          \
> > > > -                               .reg = _reg,    \
> > > > -                               .lsb = _lsb,    \
> > > > -                               .msb = _msb,    \
> > > > -                               }
> > > > +#define REG_FIELD(_reg, _lsb, _msb) ((struct reg_field){ \
> > > > +                               .reg = _reg,             \
> > > > +                               .lsb = _lsb,             \
> > > > +                               .msb = _msb,             \
> > > > +                               })
> > > >
> > > > -#define REG_FIELD_ID(_reg, _lsb, _msb, _size, _offset) {       \
> > > > -                               .reg = _reg,                    \
> > > > -                               .lsb = _lsb,                    \
> > > > -                               .msb = _msb,                    \
> > > > -                               .id_size = _size,               \
> > > > -                               .id_offset = _offset,           \
> > > > -                               }
> > > > +#define REG_FIELD_ID(_reg, _lsb, _msb, _size, _offset) ((struct reg_field){ \
> > > > +                               .reg = _reg,                                \
> > > > +                               .lsb = _lsb,                                \
> > > > +                               .msb = _msb,                                \
> > > > +                               .id_size = _size,                           \
> > > > +                               .id_offset = _offset,                       \
> > > > +                               })
> > >
> > > So, you convert them to compound literals. This change may be good on
> > > its own (see other similar changes in the kernel).
> > > The only problem you have is the outer parentheses. They should be
> > > dropped. If you need them, it's a problem on the user's side of this
> > > macros.
> >
> > In this comment:
> >
> > https://lore.kernel.org/all/auzCxxkUB9p6WKNC@ashevche-desk.local/
> >
> > ...I got the impresssion that you were *against* dealing with it
> > on the user's side (in REG_FIELD_GENMASK), and I agreed:> 
>
> Yes, that's true and I confirm that it's not a business to handle
> expressions in REG_FIELD_GENMASK(). We imply that the parameter there
> is a regfield.> 
>
> > if it > can be handled in REG_FIELD, why make users worry about it?> 
>
> But REG_FIELD is also a macro, it's not their business either.> 
>
> > But now it seems you're saying the opposite.> 
>
> Nothing is opposite. The statement is the same, dealing with the
> expressions should be done on the caller's side in REG_FIELD_GENMASK()
> and REG_FIELD() (as the latter is also a macro).> 
> 
> > Can you clarify
> > your stance?> 
> 
> I assume you are trying to have a use of it like in __uart_port_tx().
> See also uart_port_tx().

I don't necessarily care about putting whole expressions in there.
All I want is for the following code to Just Work:

#define MSA311_F_SOFT_RESET_I2C	REG_FIELD(MSA311_SOFT_RESET_REG, 2, 2)
u32 mask = REG_FIELD_GENMASK(MSA311_F_SOFT_RESET_I2C);

For that, there has to be an extra pair of parens *somewhere*.
Now, I hope you'd agree that making users write parens like this:

#define MSA311_F_SOFT_RESET_I2C	(REG_FIELD(MSA311_SOFT_RESET_REG, 2, 2))

or this:

u32 mask = REG_FIELD_GENMASK((MSA311_F_SOFT_RESET_I2C));

would look a bit weird. And if we're not putting the parens in the
REG_FIELD_GENMASK definition, that leaves the REG_FIELD definition.

The only alternative I see is making users define REG_FIELDs not as
a macros, but variables, i.e.:

static const struct reg_field msa311_f_soft_reset_i2c = REG_FIELD(MSA311_SOFT_RESET_REG, 2, 2);

But that would lead to a lot of line wrapping, and would mean that
registers and register fields now use different capitalization styles.
