Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.104.109.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808960;
	b=TxirltjlnZSVDFcRRUWUm6sWX97uYOG4TH9RhAH8o0jOAIFCel6fpAvegna00p3LzS9Z
	 zzUd33yrzMGWmlJyYKWwYzsdbSoQ99y2GmTVbqDSo/s1d+YqBKMeXVUFuqcADA1myu+0O
	 geV3oBHrjDk17Y9MMHaNQlLY6x94V0z5oZ3+cB/scII/HMDhql9D2jEh0OGKz57uQ88Bd
	 I4A1fV3nBwGkwvyh1T00pgJbiKBU8jA2Zi/Gu2LGY5N/dc3XenA6bWaSUXlbP6J7P4IGa
	 j6Hiz4mrEOTloOE5Wlp8ydaOP3nm8K6g8UlHM758v5OFHLCv/Q+0tsL8CH2pHbUksew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808960;
	h=DMARC-Filter:DKIM-Signature:X-MC-Rep:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=9Oj2ELQCrtTkA5lsszU/OsP/4dI+l3o2giPlh0ncGkw=;
	b=b5qookGFnmlTgipuxfiBQOCuhcLvLWKmgxhU6Y+kiJ99VzMdkL2F+Fw2ryWf1WHx4mPr
	 95gpHtO2/QnT0u8WicE/Ndc4Lj9lz6TtszmysmMPTulE8lFv/FHxr0umksvbJCNdTaIeb
	 6gT8isx1hVGlOczKjhRtocZPKw3/5zNDz1Lf6js7lsx1GWKkNVydPd7T8jCbkcDWhjxNG
	 RPIAM3jsZmeqZ5hL6F5M/7iTbo8ZcIUjp/rgwAMGMSJYJlqnBa8cBynDYCwyTfxXAhwfh
	 VCUXe9oPby+3RDbe12fCfID44J4BbJS2q29DdxBc+OcPg4ylIzv9hCGW7TplGs6l4DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toradex.com;
	spf=pass smtp.mailfrom=toradex.com;
	dkim=pass header.d=toradex.com header.i=@toradex.com header.a=rsa-sha256 header.s=toradex-com header.b=WohUHNVp;
	arc=none smtp.remote-ip=194.104.109.113
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EE6606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4EE6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toradex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.a=rsa-sha256 header.s=toradex-com header.b=WohUHNVp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1794808952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Oj2ELQCrtTkA5lsszU/OsP/4dI+l3o2giPlh0ncGkw=;
	b=WohUHNVpPc7R7t2SZl7jtZeTyOZdmFSrdZw9xMakf86sv7Hkl+jjfxLmwB+IwmSSkrRt6T
	SKE/aniy8fpf3sgewrcWf2LE7mqu9LushSYovCorT1g2MZmJ+rm1QzPBrgGNNdOOroJBR2
	/SLXayhHVfehplUHDy9uPXX/hZcefVk=
X-MC-Rep: binary re single
Received: from ZRAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandnorthazon11020087.outbound.protection.outlook.com
 [52.101.186.87]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-7-hrUWpZZsPpOe6YszUONVPQ-1; Mon, 16 Nov 2026 06:02:25 +0000
X-MC-Unique: hrUWpZZsPpOe6YszUONVPQ-1
X-Mimecast-MFC-AGG-ID: hrUWpZZsPpOe6YszUONVPQ_1794808945
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR0P278MB0107.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:18::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.14; Mon, 16 Nov 2026 06:02:09 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 06:02:09 +0000
Date: Mon, 16 Nov 2026 07:02:05 +0100
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-bsp@toradex.com
Subject: Re: [PATCH] arm64: dts: freescale: Correct white-space style
Message-ID: <avqcXcVsmUR5gt7R@francesco-nb>
References: <20261113185329.183113-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261113185329.183113-2-krzysztof.kozlowski@oss.qualcomm.com>
X-ClientProxiedBy: MI1P293CA0001.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::8)
 To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8)
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
X-MS-TrafficTypeDiagnostic: ZRAP278MB0495:EE_|ZR0P278MB0107:EE_
X-MS-Office365-Filtering-Correlation-Id: fb842dfd-d4eb-4037-dca5-08df43a72679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|10067099003|56012099006|261026121527099003|261022075727099003|18002099003|22082099003
X-Microsoft-Antispam-Message-Info: sGrUim8dNIKKt4Cq9v6M4xAyP+l1La1iLXB/jVnrP5GW+XRZvNkHA2pllWmdGTcz+5wiBuEhYfX43ZIPbvcpu72/zf6ja7Kg6sVCLyXAyre3Vgbg1ZOVXcKEA/Wik6CxUzqni3TKZ5VYTHHAUSmadIIfiVsF59IjPeAEYBwr2bCoSAqAn0KHY9u8x4ZtCOyi0kDDk0IS0ImtFQUqo87ETYLm4pwHb2hxNZDK+usYYdo4Eca/UgBE099mix/2+VqI2K46EjSpFkGJt6dDw8ziP9YiqlTrN030qt1YmdJ8kuVplRb5A9cvmMKccK7bbNSSpvFXqGiab8jexItksWShzynnOaAz8BSu4RV/Gqj6fuhJqOaHuNQ37S9Dt/Fyh+l5jdyRqzd95uod1534KS2559Gy+J0lrJp/B3grpj+pcug2Lyypl8+7exU7qRlQYOjcVvLDd7ZsCBP0Atf3JmQAtEZxy1FUK3W295JSTLzv7p9A8CzCTm14R15svfLnB8vWiUf/dkusblbpegcLqtKzEF8Xu2tvos6K+Z/K4prZLdOBXcWhAZt/H0+xlSUy0ouGTP/V5dmHPWl+YYZYb3EzhgcraRggnIJr0Phi1177HzBPBJcP/xIcXU+iHadMOjj93kNYB4PPPZmmpMrY0TV9ITMd227Kk1ORcmYiuQ1fUfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(261026121527099003)(261022075727099003)(18002099003)(22082099003);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bmhnq8PRtFXEKJCQOqvBVmRYEjX4rwfzeF96fVhePis1bLbK+1I0HYZ71H+T?=
 =?us-ascii?Q?YuZn6eKdErjKBU1DmjNz5O22UxRSDbEEnji1Wx4IC92v3NqSuvrBkDslqD51?=
 =?us-ascii?Q?VZq+hqv8aT888KmmbakRzbULdGpEnOV6sLcL9gOkfONLFdFAtvlAdk8ucM6V?=
 =?us-ascii?Q?U9Cg+4R4S8Y+ybYkg255gOVYuG2QAcfhrBMaIM8SsEaVWi0L/vN4heYDTS14?=
 =?us-ascii?Q?+p7fgLjcgzB3WOwu8ts+EYnnR/D3U4JI2WrDjyAOc5Hols3aAIZFel55b/qu?=
 =?us-ascii?Q?Klwci/QxhBGFpHkiQSjz+RCsCHdt//x8EhEhH+JD5/Orc9MLTGD8mu4aumbJ?=
 =?us-ascii?Q?BEPUGF8sjm4Ju7H5wC11ngIWu6SD2bwT7/Bkb5AntiPbqqKCbkBnOFQOzHyI?=
 =?us-ascii?Q?N25LKKea02MSpUXR/MiLoFplGu3PcK5Vag1SuXqtnR30Oj4cvOZP4KE1tXqH?=
 =?us-ascii?Q?b7qacvTOQF7wEAyCdp5WDoCIQCmh29zbmzlJCue4eevrUOA+eoA0P+xjPobm?=
 =?us-ascii?Q?vQWkVJmVbaLStVZiZ6G3cfNSu1PJvYIaD2ApU3TIR1XFAKrexdi2wWtcvxDb?=
 =?us-ascii?Q?eA9FEWoTX0qLIVeUcLGA3uMwkv4NC8HdqCKugpLJWlPoPAPJsIH/H0UD88C/?=
 =?us-ascii?Q?bRmYD7v34B19M1xlToypKhP7+tphYd2ZXsFqY+KtyFRSAjXkkEI3AnllB6sW?=
 =?us-ascii?Q?Al8jXdo8f5LDOTy5ymCnTF6g7fOoOP4vMZaBntlbFxdlJmZ4dVQoX2Lt8ctG?=
 =?us-ascii?Q?BSS6v9IE5jZh1fl7FnYkVsH1TcGkEm1/pLe1S+2PddgdMqjQORRY8gFxVXx6?=
 =?us-ascii?Q?YsuL/SgkQ66VD/RqSnDnTEgSnUlPQCOJT1FnrVOT0yYOgj42IHZqeoWUyoV3?=
 =?us-ascii?Q?ZgIb370XfVTKuze6u0VN5MubdS187GwsmfSocSUtwCaeOIwLI8X3eMojzX5N?=
 =?us-ascii?Q?MclyXCJMkKz22QbHP0JJ4+VgVCGiUdPdYs1gIyCmaiESV6HocWUd/o5CIH2e?=
 =?us-ascii?Q?El95XG2v6ow3Nd57hLP4OHkA/F8KUsvQzdYDS61ss3CKqBSliRkOYNPJHW/Y?=
 =?us-ascii?Q?qUorElUNaKz+5/hLI75N1q9puv/UrC+Woe4aK56c/DG8TJKN06lIoWbdIe0w?=
 =?us-ascii?Q?Cb6Yl2U73O9Z9laRJC+MUxhj53S+ykUFXNtF00gP05lPa7B5rikvQODyxJA+?=
 =?us-ascii?Q?qEfKS4ydr55A84QEAIN9VFHE1n9HPfq+Uu3WbqQA000pjjxPT0+CMidaBHhp?=
 =?us-ascii?Q?zM2sTVU7JdCDdFW4dFlrBhUE96Q3SObWLuckIRsjtr/i1jBq0yhxQEwRYfqg?=
 =?us-ascii?Q?3Yk318ZKIIZyJ6kJ9k9nbVuz7BgkdhNEm3QTArqY7dTnk/rCJl7a35MMMSh5?=
 =?us-ascii?Q?5Uhsc/wjYE9nH6iDj4w4++rVF4El61qfp9AgFRp0wYUOtQc1mQh/BM5Ld9ZV?=
 =?us-ascii?Q?JOE0gW2oYrl3tl5vywmgPRU2i0iUre4PN3WX6KoerzBzCFXrLjQRX+nHPIlh?=
 =?us-ascii?Q?Rj/4976awg/h+QQsxpmOgwQH/T55gUcMiaeOkxa/JXKnkO7FqdWiZusSDpGp?=
 =?us-ascii?Q?Im3zA1zPLv3ZbrB+PkezGZ13SFaU5NpSXGUbh48QYIt80xtcwFqbQedIGthC?=
 =?us-ascii?Q?Mf627Jh+8TeyYGUr/phSEIA6M7kLTE1oNYhQRtSEnO7IoLCHP6H19y1nsF3R?=
 =?us-ascii?Q?UWsmIQ0VUwb5ZJHmKtolL3H3lfn1rsgmFr25IFALE0FnTWNsFe1jIHkxUqKG?=
 =?us-ascii?Q?NhOZTwBy3hSy48cg93myTK7d0xVUBFA=3D?=
X-Exchange-RoutingPolicyChecked: BqawtAk/EFtFzBGm08lTGUSHujhjxcQEb74x63CCLjPO7ADYXg70uMKsk+fItZIr7LdPfhpZ0oGc9KwJ9CARhBNuAGgeWh2CNJZqNSEXt4ZSD2YREkGvC86nl/aJE69MdW2teWVc3x0Hl3ta+FDUwTZYNLvouU3XR9iEXAGjwXv4i1jrcklDzLa0oj6pk+lMun1AFKLHCGlfxpNonXsyhal9Y+m/SpKzHjpSp5SXlUD9IOXrAyEveWfULaMlesDY2PXBNAKkIPbuMjav25TwCNRRZ8UXuaITsG+J9sfrsu1iZkGzE5YlRfxKs9V3subab6f5NgnBZdFUFZg5+IqsKA==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb842dfd-d4eb-4037-dca5-08df43a72679
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 06:02:09.6804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1Ge5qPjpqKcCl/s/wJCsoWfdlBX/7Bv/iWAYTBElo4403kMJcRT9FyVuuqnHZH6P7Jv42AVo8MYTdlNVekEtqXyGhN+AidDuGojn8PMD6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0107
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ISysog4G4A_w1xiQTtoBfxXeSL8j_ybiWbiIZROKQ5M_1794808945
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello

On Fri, Nov 13, 2026 at 07:53:30PM +0100, Krzysztof Kozlowski wrote:
> Correct minor style issues around white-spaces (e.g. double space before
> '=3D', missing space before bracket or colon) to fix dt-style-check
> warnings like:
>=20
>   imx91-toradex-osm.dtsi:75: [redundant-whitespace] extra whitespace afte=
r :

whoops :-/

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Thanks
Francesco

