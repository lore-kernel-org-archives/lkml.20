Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794560001;
	b=V5cv5Aa3oKDDOT0g4sbzESBTvDBcdOdl1tmjilezGhshp8LLoTBiMi4XEAYFKJiiQ2Jx
	 OqF4HAo8CacHREcjbU7rtahzUrfle1rZQKw3u8O9S33sdikmvb+REGW8bW9mA6TGEj4YQ
	 x9XgtL/dlvW2VvNSPra1ByL1in3dCwt3tzOZDLDZlY1De6+epSsA6Is9VYErdrUZxn4aM
	 HPWsWcIWROgHJLaqjPaJdT1LRqe4vHuX/3m7BJjZEJVJfQy9hjfjxaARqbgACG44PMBPD
	 cqmg715T8FXR0+tD2UOT64dlr1jGIClzkuQkKRlmFSQKOjmuynbFUtaYSaEr7ZYZkmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560001;
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
	bh=adeTvIBAhABFbp6kaVUDKa4tYf6jNTrhfFAk5i6ys3Y=;
	b=OTj1EbVdjlYss1YAWrA3EHtsmyf5loQf8BFQwj2a01q5Nor3zK8WOu8dSCS51kC3SAP8
	 92SuU4eTo2p9T8WToyfMSH/rhpfeU5QLZPnUKaUU0oa25bHaFMGaCIN5H49DdHBfLBi+Y
	 oecgs+Zq+d0IrHGGLtxSobh7CX5evww1zB+TWgFSsFdvfJdcWjatl8+j+GClN0gVjXS7T
	 enO4puGCmg9IxMQwBU84T2hBkZznkc6gO/Zvy9BDgTbQWPJB7o6cJ1laXtEsTjH1Fj/qm
	 4WVR3cF6MKpFQGkS5aWyVXN6s17kC9PZ5ASX2L0iW4CIjoTGRXs9OdY7uCCY+d5E4YQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=HBmOLcrn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.25
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazolkn19011025.outbound.protection.outlook.com [52.103.14.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1722606A887
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1722606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=HBmOLcrn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1dRM6hYIhsKiJmGH5E5ucvtdTq76yl/FdGfAn9FsqxJQprk5AM5pQOWDlSVXOk246gkD2KXTNCLL2tB3AUwpA+z4Znqbp+aiujj53cd+s9/18odHKUgbmOVG++F4MSSTWDOBcNlby/lnQO2I9kS/1bU75SqCUHaEDpPvqNOxVHjcgOQGOZ4P4mZTyII/29Xgu2SisPAR7AgjPPxKb9AMF2qX0xqriz6PDV6U+2oCoX6Wg+kaRAuj9RUiYEJoukg+nbvu7wqEVBemT8CdnJZuc5DOX1MNTG5hb+aLCq0HsB78I8U49k9jgyNJjIpTZUEgLnhXAs3IQCzkhpW0eydDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adeTvIBAhABFbp6kaVUDKa4tYf6jNTrhfFAk5i6ys3Y=;
 b=vzeSNIfKeuFYR2g0whRZzfPtyXupd/m50/KFEANFKxjb4W06s8f1uJftZ+NgZzv8FDEopteSCNeLUusU+CD/6d4UEFWaIQkos1La9RrTsTC25mTgFuHW21kwxUwoBsIqEWLFIc9j7edQyMP8bO6M5lzwv9fACB+UK/MQjbRVJr0pQi8+09XIY4znBASGzc9TdbnkIn8kT5vVB6v3QXePSZFr9kOCMk6BP79O/D+xzZLA/POoQkq7SumhFSmn1Es20IuZiEZ3MG26vJrxn7W2gyr4tKiqU3cOHEMjKGfVek75DnawlJeg/DkehM1LxPZmBvIGvrvB3Ifs/exnoRU40Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adeTvIBAhABFbp6kaVUDKa4tYf6jNTrhfFAk5i6ys3Y=;
 b=HBmOLcrniRwZ0W5TLfJcuTMezcAxVvCv2mTzKjXtAc+a24xE/K8t5iRgftPf7dZaQ9RhW+hiahuW4om2rrPiP1K2DLZGbgxYuLG8trs+m0Of6bYaIHaKRYgf6v7xadYbHZR533kV8M4zNzaKveFAMswV3oN6v6Pn2nc08IOzW+NK6azRNDHxwcF6yDLA4pZXUALdMHktkQw9q6GMAerta4vhYvb6DES4k69heg9WCBT2tJLC/z1ocBgon63XObPRqU5mJWIZoH3Unq1rJT5Y9IGi7ieghOhGmxAZgeGQKHMnUYYYPvzIttWA/+mgIJoeye5y67MGo/Ort/zP0ksiKA==
Received: from SN1PR12MB2528.namprd12.prod.outlook.com (2603:10b6:802:28::33)
 by DM6PR12MB4466.namprd12.prod.outlook.com (2603:10b6:5:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 13 Nov
 2026 08:47:24 +0000
Received: from SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a]) by SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a%6]) with mapi id 15.21.0615.008; Fri, 13 Nov 2026
 08:47:24 +0000
From: Victor Chernyakin <chernyakin.victor.j@outlook.com>
To: andy.shevchenko@gmail.com
Cc: andy@kernel.org,
	broonie@kernel.org,
	chernyakin.victor.j@outlook.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] regmap: add regmap_reg_field_* APIs
Date: Fri, 13 Nov 2026 02:47:16 -0600
Message-ID:
 <SN1PR12MB25284C20A14AC881C1AD6FB0A57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAHp75Vf_Ope66gaYtwa-or=r9_1n6wUq7=gs2f5kQX=fDS02JA@mail.gmail.com>
References: <CAHp75Vf_Ope66gaYtwa-or=r9_1n6wUq7=gs2f5kQX=fDS02JA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:610:b1::15) To SN1PR12MB2528.namprd12.prod.outlook.com
 (2603:10b6:802:28::33)
X-Microsoft-Original-Message-ID:
 <20261113084716.813885-1-chernyakin.victor.j@outlook.com>
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
X-MS-TrafficTypeDiagnostic: SN1PR12MB2528:EE_|DM6PR12MB4466:EE_
X-MS-Office365-Filtering-Correlation-Id: a4883177-46b8-42ae-68cc-08df4162bcda
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|19110799012|39105399006|5072599009|15080799012|8060799015|24121999003|22091999003|22141099003|260925184616899003|4140399003|24021099003|25010399006|3412199025|440099028|4302099013|56899033|1602099012|10035399007|40105399003|26121999007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Dt2vA3ayp7efDHRQ2Oyr/fAVUoLz+GuVnKHgV9hvxkaOpffMz8uZRBr02nfE?=
 =?us-ascii?Q?zJ2/C5GibQTERr/i7sqyNfPwp2E0Q9hbsJqVVo92hlQVph0c+3rzDoYToZ4e?=
 =?us-ascii?Q?JfI+9tG0a0/6uf6FPuGqXWb76cOssemjqpdX3DQLrbYQ+zO1yAWB25FoTAZF?=
 =?us-ascii?Q?k0vkLWIw5jtMWWNTwE+dT/EniTjSjPvRCy6uTOXLlojVzegENikZMMp0/Q47?=
 =?us-ascii?Q?e9YrzkIMJohflN8+SGjv7Sktemknlx9Anvq3t5kf01xbZ3eQfeD6H5oQVpOC?=
 =?us-ascii?Q?24GDsF5JZoFknKgHq7J7akyW1Bjw8AfiNBoRs4QfAeA0Zh1TiTsjxxE5KxzA?=
 =?us-ascii?Q?xOZMOsMdcCQBXD3dQ218x8ONK/3sp6Phri6bmWWLqGVyg63EYbzXK5RB+CzX?=
 =?us-ascii?Q?axXjpqU/TjaoJQFKzpC2B4JSf4iCd47l8J+BoBnz3uRxI9HzbkAD0OVzPwdx?=
 =?us-ascii?Q?7Td2ToCwfKuI2xDyR7IWVLwEJ11LvbTQOgU4GSGSQa0FSwThHrgdhyyhR0uj?=
 =?us-ascii?Q?KyKqFO57U7MvCE4rDoxDa2J0u+ZN7G9jEEuV1FJq6vxdqpqsL7n9WmnZ+bzy?=
 =?us-ascii?Q?FL10K6R8mWxhXMUyWlGbJ4BiGuYSAUAsa0OhbQBu0em+Lhg98RtLYnKLUhwW?=
 =?us-ascii?Q?Aq2jgXbGvbIjN33lzK8jjvRZdfBTQQDiPd/GKwB9iiVXPBSYEn9D+sTG7u5t?=
 =?us-ascii?Q?zyn9Pw4zMcNNQk8TtAWdpZHxea/hd4Ic8f0SaMo/cSn9kM1hTpQtlgoa+p6b?=
 =?us-ascii?Q?N/maP+CpJk3yATFfCDgDhFd7grBgqlunMZTISGxidex/aRI2CmsWIOLzi1xx?=
 =?us-ascii?Q?//rTDi5w34rZAUeKY0+vUE9IHQNoogYkJKiEGQpAwgubDnU4EbUIvlYCW3Md?=
 =?us-ascii?Q?/MVpaElRQILracWeQy1w3D+tuCkrFPhLRD3tbwh2N1jUcQXbVhygnOoXdlD1?=
 =?us-ascii?Q?aWNTaRhkrb1a+o68PyAfLZc2hUuToA6tQfg2kjeuzJxRvVjAGBNydvz8T2h9?=
 =?us-ascii?Q?PADOmh2HOP1nq3k6xS9vUJLZGUsipsxDYy5GNcDxbOIGgH5RPnhaHI0AtrvE?=
 =?us-ascii?Q?uRxzN6Q6hfNUHj9Ytsg10fmq096LRlkQhvQk+ke9ZxFjXI9CSh8C8nVNFPUQ?=
 =?us-ascii?Q?EYMye0e375xkhqk+ELWwONaz/zx+PQ+ekg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OL9GS/us7l4LXz6VePZkqGVAbpyJuMsme0XSuoPDtP3LoN5R0EINuJu91NtE?=
 =?us-ascii?Q?JE5XcIbonjuJntm/Gol7ErB6O0mA3oQyXG39WXIVeFiSZ1VNN5XxLAfOykrC?=
 =?us-ascii?Q?7yGGG4mQjXlQomN9C/vZXf/YE6eo8vlrgHsX/tRsNluzpQbqevDt8JERkR4F?=
 =?us-ascii?Q?NZPhSEoDNdLSZixQgTmQjDZsf+kXcb2DKiPmjK4L4KLjs22f6SCWbc9JWWF/?=
 =?us-ascii?Q?352jUO5se93T073w37Yz0FLcUZc5pokaXoBs1W1ZwOwNlVREt4cBSqPfXJ4j?=
 =?us-ascii?Q?RyghuNJcWONVHpX/1tdeIRzjK9+Jd+A+rfqXnlFS9eSCRyZaH5Ki2IDUjofy?=
 =?us-ascii?Q?C37r8Xa5KRygwxmUctWIX9x5CeCqSL2NkYoNgcGCoOGGeh2mSifFKjk73Aez?=
 =?us-ascii?Q?egGltbA7J4EIzUTsCLRBCjwNIiqyyMCS2k6ivcagsmQz/FjUUtshVvtC2EsR?=
 =?us-ascii?Q?6j5UtD/p8NBAvXSqab8Us3B+SW1eI+g9tABAuRY6TBglSiXj7BQU47+vOFn2?=
 =?us-ascii?Q?hlPvLPOq5DPyLvrtzSm4i3KrIDY7VOH9rILdiIk8BMtPhlx4RduAGHGiohRH?=
 =?us-ascii?Q?UuT8NveKdX74hCVmRmCKfwbkvqXeRL8mXQU51+R53af9ueejqhuy+nCJgfn7?=
 =?us-ascii?Q?8gMzeLVv2LzVWg3WhFIzdpj9IVnO2neGutu7cl2Kh/q+k88pnoE0avcHR1OF?=
 =?us-ascii?Q?vxq2eHDbv7InVaoJecHa35ggFwno8VBmi6i2q/a35wUWqvizOzhzNpbdb7JV?=
 =?us-ascii?Q?iDPTCnU4Gu3iDKbf+FG8EVxOm6h/6T353M7fDT0K5S00jxImyKazTZKKLhbQ?=
 =?us-ascii?Q?vCSXUO0s6KYM9pTl59r+9RRS7Ok94c1M1nKNvdKbHEiK2mMPtzM+YsYTGeUV?=
 =?us-ascii?Q?9OVdNbcG6RTYWc+DzZrEa7H16tpsDco1iwHFQsdL+7scrAQmKoN32tNGWNG8?=
 =?us-ascii?Q?Oe2Wk1Jym8dnp9NvvMS4xn1r4I/V7/ybYPPxQxpwQ0XYXCePTnDHIKqfzgFi?=
 =?us-ascii?Q?GalOXn3rp2I2AFT+ZHZS/1AYguq0EpVL9p5J2wVH/OYUvHcx4/yAUDwtns8h?=
 =?us-ascii?Q?8Yc9F7bKzpCzyY78Vu/GuT0h6BBLf7MkbV56DdG0u0fNK38kmqrIZnrPyiUX?=
 =?us-ascii?Q?Z3Zz9m/CFTtc9eMxiV7M1vI1pjfCi6rjvmeKrpCkKPTV2I/qlss/PQVzopAm?=
 =?us-ascii?Q?aA4eP049YzXrFIVo3xpW5yk1tyAqClbCtTQEaIzHdqm4GCvGcXcVEENWeYtt?=
 =?us-ascii?Q?WapLjm5EH2wBM3kvMTmejO0on2kAcEhBWE0g7SDo0eb16rMZ1D9/b6oJC6oO?=
 =?us-ascii?Q?lm+0kjixBS51/XuABDSVqA7Pmwg1k/z47h9xtTr2v3G+ZbdE2VFACjeBBsAO?=
 =?us-ascii?Q?w01UBfePsGNCfIyaBdFvHX6ZzYIVl2Lw6TwL3Mp7C2MjMqhxpg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4883177-46b8-42ae-68cc-08df4162bcda
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2528.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 08:47:24.5067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4466

> > -#define REG_FIELD(_reg, _lsb, _msb) {          \
> > -                               .reg = _reg,    \
> > -                               .lsb = _lsb,    \
> > -                               .msb = _msb,    \
> > -                               }
> > +#define REG_FIELD(_reg, _lsb, _msb) ((struct reg_field){ \
> > +                               .reg = _reg,             \
> > +                               .lsb = _lsb,             \
> > +                               .msb = _msb,             \
> > +                               })
> >
> > -#define REG_FIELD_ID(_reg, _lsb, _msb, _size, _offset) {       \
> > -                               .reg = _reg,                    \
> > -                               .lsb = _lsb,                    \
> > -                               .msb = _msb,                    \
> > -                               .id_size = _size,               \
> > -                               .id_offset = _offset,           \
> > -                               }
> > +#define REG_FIELD_ID(_reg, _lsb, _msb, _size, _offset) ((struct reg_field){ \
> > +                               .reg = _reg,                                \
> > +                               .lsb = _lsb,                                \
> > +                               .msb = _msb,                                \
> > +                               .id_size = _size,                           \
> > +                               .id_offset = _offset,                       \
> > +                               })
> 
> So, you convert them to compound literals. This change may be good on
> its own (see other similar changes in the kernel).
> The only problem you have is the outer parentheses. They should be
> dropped. If you need them, it's a problem on the user's side of this
> macros.

In this comment:

https://lore.kernel.org/all/auzCxxkUB9p6WKNC@ashevche-desk.local/

...I got the impresssion that you were *against* dealing with it
on the user's side (in REG_FIELD_GENMASK), and I agreed: if it
can be handled in REG_FIELD, why make users worry about it?
But now it seems you're saying the opposite. Can you clarify
your stance?
