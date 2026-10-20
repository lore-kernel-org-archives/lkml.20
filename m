Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792494700;
	b=jPEOnyJNwxkc8q0uKMPVhszPmz8EkBtlNQt3WIsTbTDxjQNsRObJxP3lJt0eWllXWK+g
	 eKr7vTBD5tJWnFYd2xyURU2cIh7JTtEW8WKUxf3GW67Zw4rjY23HJBve/YV/njng9KPq9
	 rl7mNG/oIksId4sHOsn7kYF+0uL/+E2te25nRJYAiKEyjYElh0r9QF6eUfo2L6WPp1uwu
	 jzg3QWhiN5RwO0d7bpRiPY9+RxcK3XT7yi1bFSDRtppIismCun49gqVJCylYeEiLDkX9n
	 U3Kw5SW1UvV4uWdYlPG4yDRlvX5goIzaOLCB2LkRuycSwst5qZJZmHwpUuIENDItqNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494700;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=M3/YvbclvHZGFz11KVKs13d9WBWyLxdlSbU0gyPYeDE=;
	b=UgKzAafhd4VoZWN3hChqHEL4PpyvXA10m3Fsj+t2BowExrhfnFfLoqWVeqH+ej3S7NN3
	 r8rKtOrYvC6yPrvr0cCXcoExBkk696zkU52KwSp/TTy1sVI9DQc4O1E6V70GEk70PESlf
	 mgWfs+3rpLmLkz0aNSQ5Pxo5AHbQmOtB9RXeq9hklThqrE8kq/ejyvRRKCx7GMP4FEkss
	 0gqNKulYK+HlyPeDxlrpr8yedRwVQ/3d3p76bsQd8vrlmh3NNuXYKMya6nxIgMFM1CPvG
	 hJqFKBV50mDAAdyNgirZLvYcREaUbT7UZtoWuqDUdyrJOCmWqA6+Rm5cVU8gwDbQmRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=oZNyYuCW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.46
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010046.outbound.protection.outlook.com [52.101.228.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1548460A2603;
	Tue, 20 Oct 2026 11:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1548460A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=oZNyYuCW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKupLLQUKyhOGTV9NJylQD5c/xMzDK5ndY2EIN/SzYQo6oIoVXEHRifHC+k+3rn6IVuMtyndRTt7sPPGpDTB71UkoA4XICZOQ2FSYfzSvfsnQH01aQMouLso1DfKUXpNB0DZ7KVs2L0BprtWGToo5hC+x6MnnB5YqAxtPW6BHLoIrtlVokoOeYMxKpNRSgUSc7Fzhz6+ifMow+hDJXfymZ5mei0nu/oRsCQqLne/ChcIHqwiC2ek0hd6HoWEGzIxE1lHIHnvYqHkyun0vqb4svoMb6pS3qFgRQAt62utTIi2GeTLuSZuZrYKy/DTjE324y4XL1EQkRm0fEgZpXvVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3/YvbclvHZGFz11KVKs13d9WBWyLxdlSbU0gyPYeDE=;
 b=gajKCqDofoNMJOvmr+oOxt2+tTsBbimmHDO7vdXySERJu+pRPZl/oS0LQtBs/h3TZPLJIC4vw8VJ814nKQBhzgW8X6GH9U2DzSPj6P7e/rvFR2QbgOAWaGYzilasKFUC4dTypJMM+EsWwWml3q0+xTebakciqI6LKgEJyfBQ4weyjkaCWHws6aJd7hF55ldN6bYuGk2BmJZq4If4LOWwpzIP+7yqIB8F8ZQ2Y797BwUALZW528vJ7mXEVSgvGiVhiLn4Nn1F5k34NgV8xeDQ0QTfCurJGj1OkCLfORKzYXxntHitek2B+XlLtHBTOHMPSeGI6juqwlkLV/afw29vMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3/YvbclvHZGFz11KVKs13d9WBWyLxdlSbU0gyPYeDE=;
 b=oZNyYuCWMSwX9bFJSMc3zPatoagPbuM8vQaWYAzm7lII9OoGJqsIFurLs5RaPypSjlmbqp+sWhtbzWLaBE8MC9oeOgSWZWt8OPd3s0bzeQsTlunakK/NkRWh0+TI7eVtJzl+BuDqpaZpLCcK/p3LVdifm9EjMKketkGfOq0Pd2A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY7PR01MB15038.jpnprd01.prod.outlook.com (2603:1096:405:244::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 11:11:33 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 11:11:33 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Drop clock-frequency from RZ/G3E SMARC snd_rzg3e dts node
Date: Tue, 20 Oct 2026 13:11:05 +0200
Message-ID: <cover.1792493096.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIZP296CA0004.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::11) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
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
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY7PR01MB15038:EE_
X-MS-Office365-Filtering-Correlation-Id: d0537ce5-23e3-4fdc-35ce-08df2e9ae5fd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|52116014|18002099003|3023799007|11063799006|261009223027099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	Le+imNZdB3gIh9h0YN5+wXTcqHfOIq57Le0guz9DzYuQrWG3K92Ll5YyXchZSpstAiUA9SeAfFDccgXWKlz0hQdAJocuYK9WL8jp6G0SFf/myGFkh0CI4A8JpiMeeTEWnGiMLTIiBjDmjUfEUq4h6+Ll0X1uD6KVp8g+zr+Bti0Z/6DrXDCv+kMe30vU+n/FqtqXpV4GEcNYdzJzF9fLuBSv0C8bq4Y+7UIWI65/9qVuCBJrkt0n9mTYGnCRu0PCzre3u1mEfiywUwRHPwsEaPrNDQZxiaZlx0FL4XNwEX6vMzhfTuehIHLM/Vp3aBmHxgoIIAC3zGeVOVnoyDJQ0aZtjLn3Si79T7eUFjVEFpf4mofAeV0OM9jTOXlsOx0WNnEtVVnJ0uKYbTFFsKGiIf49wbBRCs939RPvzuxMRFILfhZuoj5/Flr/ocYclB9RIRRBf0oDiLbG9NSh3PFM8ZrQttg+G45NzEgY4unDQfSJJ3jCfMFqsCImmn21FPvvaZbJ54TPyj2mlkajykWLNbe2H7fv+VJ3bq3RhZRT0DvX26RvOE2M4hM9v0RZzBrhSMlBIRG9RmRi4DnyPO+GynXK7DqxhJNkKHTF9s1AWMbAiVmh7+VSODh+yRhzQmgFEc2PTrg79b++KQtRvjd/9yCa+xxClHMtV5loGLIm630=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(52116014)(18002099003)(3023799007)(11063799006)(261009223027099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SKlt2REIgailOfzsuL7VJzXTet6RAY0ElyV717ufbx610FoWzInxVpeom8aY?=
 =?us-ascii?Q?IRmbYwEGBPTqGbbcERlEKFZyynzkE3e8IeE5BSv/hfuBalGXymN7XlDkW1F5?=
 =?us-ascii?Q?cQgj7QhEpzTZKB10uYbZ59CrzGeruwOgxN3W+GAqkJ1aZOhQ3dMJUd4kdLCZ?=
 =?us-ascii?Q?Ua3KuwnlVzJ4lRrtpDhn9ZaN+GO0YM9sngnBratb/gDsR4V5xJ0g/yEBSW9A?=
 =?us-ascii?Q?HXt3f/EHCwizhQBjnqcitGPwWvefnarVYDT6QUvd9NLp0Rt4x+kcLqtYSJwj?=
 =?us-ascii?Q?dq5m71lUqrtsyLpo6i27AaEkALExMMgwz9plRGfdWszGD9M357lHAG7XbiJm?=
 =?us-ascii?Q?Uy2YmsDiKv9DVdPHYsgvtzhGFHo+dsOlEUxl7LOPsWXJR5EyqYXux4ED15oR?=
 =?us-ascii?Q?L7topBVMirYEmsjTwo4OCtush5seWchTmLaWGPqFw8vu2mSQIDBpE/9fkgG5?=
 =?us-ascii?Q?5zrRalqtTZfURfsblHsRUdUN5zO6j9PPFxkXP507VVIawfoG8WAdtsm6Ys0E?=
 =?us-ascii?Q?UhI8globIRHYRyfP8iefH63bRkI5WCksE3Aq68kAudtv3qyULir5WJeD8UXe?=
 =?us-ascii?Q?YqLGtueIKoF6ERD2wbo6WKKNnm43YMxT+MEd9KkHim2ZFBdvexAzXXMcWd41?=
 =?us-ascii?Q?EtkqZgXgVEQG7hE+UmGckdw1iOywrjiD7qefymfXSvLaApmmJE4HfCLPu/BH?=
 =?us-ascii?Q?urwWbbjUta00Mc7bHFa5Q4jB5XW++FtvRQuhH2DJ4ClylOZKfTgagAjdvfjN?=
 =?us-ascii?Q?raPopcolKQ0UbA6uGmQcbJQFTnB1NhWSoXNZH4FuYek/LOcGHtkHcr6Aovw5?=
 =?us-ascii?Q?dJd3g6PiBW7pRx1jy+jIif9zWowYM5UVG4th9eVho8SLV7+AD3eJMSt7Kvfw?=
 =?us-ascii?Q?aUb5W54L4D5svu6aUBxFDasskSiQwVvMTFq1DaKxkLjfPHNHmnYARd4EIaDH?=
 =?us-ascii?Q?HjiF0JQmdCKOP6T+aqfkC4hc+yJYTG22LbVvWbvshmwBUCqf18YfpCcF5Vs5?=
 =?us-ascii?Q?SrcTiU4MIUCPkHsIWYjxi1ErFQBA7MUPCPNOKrH47AAsq8jZTYlaL/GX/gwU?=
 =?us-ascii?Q?scQE76YnsQNdhVJP+iNfRQeDIisnyNKwE81+y9Sx0REgfYRP/VXguU6TATlG?=
 =?us-ascii?Q?Usjz1NzEB+lWLTee/9FEyP3GBVnp+itUv+8ujwPO5TBj6scSJwYczx0GxHlh?=
 =?us-ascii?Q?eFWZQGDypq1/rp4sBtMhs2g0vEItoXhcGPLHRdSxdD+VPDzSfX9fORe9FT/H?=
 =?us-ascii?Q?lxSMF449ttPMUMv4Duc0jL8PVADq5dWJoT6ShOcUl9pJW9j2T/xFLeoinX5J?=
 =?us-ascii?Q?wjpY4riAQNRR0BI3uFjAT2buJl334QbnTLuyMNpYlLNKPcXqs8H7Mdz80tV5?=
 =?us-ascii?Q?rHG+Lm4Vg0swG0o6rq9zUySoGmgIyUgfTItIHtv6pBbPlxWvXE7olt5TVXBi?=
 =?us-ascii?Q?zr1Zyml/htfNsfB7EF/Z1GtI5YpmA3embDTEH9jtD4HlbPy4KcxOAcvZG52d?=
 =?us-ascii?Q?5edn5X0hgx58cEndwCHc7erNd6YL4q1mCoCAcj2023Jt29pDXz9suDYguo6g?=
 =?us-ascii?Q?h2pNKj26nC7hJNwHnMi9mGt8T2ydpISCCAZcQsoTe0EUy/2sMomKqqIP8h21?=
 =?us-ascii?Q?2VhYKUOEET4STq51xxc2PimX/j/Zs70gMDSx3kGjbbnbU+OyVXsOx48Ova1z?=
 =?us-ascii?Q?9rSKSRU1OjbupmS7U4HQPEXBrk9SnzsMOM9a8AxWdN+sxekk0LfcNF/XqKDz?=
 =?us-ascii?Q?QhoN5yXrx4kQtxh1pRhzMO2+JjqQfWszG7C0T59zsLt+mstCv+8f?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0537ce5-23e3-4fdc-35ce-08df2e9ae5fd
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 11:11:33.0597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kXzvsDUyP0/hML33C4LlhKTLhgJwnhB3a7L0nFcMpUrnFKd0RIKkvva4b9s6YWsjPHi1FjDUnxpvH3rThu4hbJFJZA9u6o0qceh5Eh3rOLCyoEyVxudulSZRxEr63Vf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB15038

Dear All,

This series move #clock-cells from r9a09g047e57-smarc.dts to the snd_rzg3e
node in r9a09g047.dtsi. Also AUDIO_CLKOUT is neither pinmuxed nor consumed
on this board, then clock-frequency into r9a09g047e57-smarc.dts describe
the frequency of an output that does not exist here. The DA7212 MCLK comes
from the on-board versa3 clock generator, then drop this entry from the
r9a09g047e57-smarc.dts.

This fix also addresses the following warning:

sound@13c00000 (renesas,r9a09g047-sound): Unevaluated properties are not
allowed ('clock-frequency' was unexpected)

Found running dtbs_check with -W=1.

Kind regards,
Tommaso

v1->v2:
 - Improved/update cover letter subject and body.
 - Drop v1 patch 1/2 that Drop #clock-cells from required into the bindings
   and instead move #clock-cells to the snd_rzg3e node in r9a09g047.dtsi and
   drop only the clock-frequency entry from r9a09g047e57-smarc.dts.
 - Link to v1: https://lore.kernel.org/all/20260820095742.3094558-1-tommaso.merciai.xr@bp.renesas.com

Tommaso Merciai (2):
  arm64: dts: renesas: r9a09g047: Move #clock-cells to the RZ/G3E SoC
    dtsi
  arm64: dts: renesas: r9a09g047e57-smarc: Drop AUDIO_CLKOUT
    clock-frequency

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 1 +
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

-- 
2.54.0

