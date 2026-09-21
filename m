Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010046.outbound.protection.outlook.com [52.101.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6D83BBFC7;
	Mon, 21 Sep 2026 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790007903; cv=fail; b=OoDNN4CdTF/T34wXhY60wdjCuRRDA4ox+TFQ4qJKwlXWBEGhU7/wJR9xCiCjdQoOfqim4e9OuCIEmlHp4fbex3AJVNLGA4UsS8DDyh/NLombdXu5oEBOsakDj6Vb1fWPhrocDjCnhgeqaYfQnwR8CKzcQIqYWoWwJrDhSRNSuvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790007903; c=relaxed/simple;
	bh=3eq5OA+d2ElISHlEcZjkKcsmpYnmeDtj38pR6tQfUkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ddEk08em1WbkgNro93sMHFPokY+Uib6a4MbhppNd5qaWkFbEkqw/rVZ7XTxWMGmrOouGM5oPJLpU0Zjg5/B08ZYU+0Iv2l4pH0uXrPrGqa74U4NYEmNgcxXeFe4ZTDJO4I/ebdHb/MMTTlbxicjr27CzKtWzA9jG2xW4LLiCq0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RbP2lHJg; arc=fail smtp.client-ip=52.101.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RbP2lHJg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFSXKNxplyoVQb05dScHgvxQUUGIqcvIeH5ZBANNEPxMZrQ0AUoT9fa2o1WY5xNF26WIH0rH+I2ZX4sv7C1GC6W8FSX1Trxc2U6bY1S9hB0Twuez4tHbrGq6VSncxZJ7QaCVHajbI5KftL+PeCoQ6Bso0cOu5dZhPMi2TrZvqInlZPWffnpXOLccBLyOlCAFEt6x4QaaV2NxIYekPhGnXdcapc+Gp6lr6h90Ui6QYfuj+HAFrZVzBmN16x97a4PJyY5LdPZ6mbj0ugPm9OpLS7jp0nhvPFZO8n2Wh8y8ZqiwEFgqxWcjpon6ORFkBnabTGv046ecKFxRZ2jh4JAiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z22Hm2fhBLdpgx6ssVgGDFwSbNnsTivOx0Pt50TPun0=;
 b=xT55YZUF+k6BibFfm+q9agYe8G0i1lc0Y+CT9ptyP3hVi0TAsRYD21jOaoIQy7TlBO6P2rm1cLBP9i+aSSWo6Cs3mMZuHsLixpAiQHlMmn0QAjxcNcxQXjR+VbgFa3lK03QOCzZXXCtc8CbSstOfCkiS0Xw8HEAv9rV0euyI+d0siLAZfVH3DbeKorDMwBKoDORPsrj3HLRBukuG/iDVG0SMjhskKQTnGLu9VGerxbw48DJP//lCHdyMJu51mvPsXAips12uvOMwYVrjCy8xamg4Io1JqvKP1kS22kLRnypRpitNv0pjOHJ1stmhmInsXM9Ogab1fvzYl54co/u1vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z22Hm2fhBLdpgx6ssVgGDFwSbNnsTivOx0Pt50TPun0=;
 b=RbP2lHJgEml60rz0IYpamD11Yj6Qhuc921vIQMuQOygaaq+zq1/D2dfPhVWspQ5oQE3/NtHacnaLNgz4t8tLlY+7Zu81g5/mjUe6WN5D51nrrQ9upduqUReLGgUvnMvUceygx8TpuXGJb/VjjWktb6Q2FYyPbKv6MNO2qdn7Lcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB7967.jpnprd01.prod.outlook.com (2603:1096:400:11c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 16:24:57 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:24:57 +0000
Date: Mon, 21 Sep 2026 18:24:39 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] Add USB2.0 support for RZ/G3E
Message-ID: <arFaR2S478JjE_e1@tom-desktop>
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
 <arD_c9iP63WLOI1b@tom-desktop>
 <CAMuHMdV7mgJ74fLHnqG=nryjWMaoYqeOq0BNAbA_XqoH9P8ntw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV7mgJ74fLHnqG=nryjWMaoYqeOq0BNAbA_XqoH9P8ntw@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0630.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::13) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: c62b4f36-38dc-4333-1e40-08df17fcdfea
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|52116014|1800799024|7416014|10067099003|11063799006|22082099003|4143699003|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	EH16H+5+u1aEt57p1imIaJzw3zy+ZoJRh7QPr3CMR5o2uHN3PT/bFZewiSyvDvi1PKrbbRINdcus8oXp2pvOqBjBiMh14jeaXxeLc0vS0YQ4ZOQaNieHhDp4LisxaiyAnBJyXJdyP5TyCOhqjgbPesBG1NeWAvmFWKQgxfapFOAdA3O9gMF+pOg/VvN1yQgR1sa0GP7HFb5REm3FgCYiQk+X6CDJh8CYWG4u+lf8np8+OQ8Ff3z7KVwW+r+hFzEFc+T9ob1MCwf5JDNkFmP9LDK201U+TULm85oY6uTP4xFhGwVzFrT7nyWlilc9G0ag+0BJ0uBB8Sn2JksgJU5+2igYv51h9gsMFrqKE/O5mKwDkUK303lmWXW7tYfGqBrqnUNoV/x8MGKIOrhZGt18IxEynDmO3Xy+yNq00Fq/Tf/WCFELT9u8gCWszVXzoVIV0WyHJhqNtrqWNl7s9HtiOLeBdFQqJRNaQmNUz733BCysrsYsRxZ1Sy2evzumod+72vQvIwWUQooRlhdxSZ4achUM17e4WasQqhqNvhUHCY3jjdEx65F2FM5pY8Tnl/TCKuoEjZnIT4Y2I1ngSrneLd3Nwu7pwkgKbLKZxvcVpwa+Z4nwCQ5sKUc8xQjS/O2y3Ji2Ud4ZBUaIX/BsacpkbMKDE2bcjcWoSS3lK1WAQ1w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(52116014)(1800799024)(7416014)(10067099003)(11063799006)(22082099003)(4143699003)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a7vmTmhnxTw52QJ/1DfGDo5UUwg20YRZzYPUEpEnvrxLPUMFH3y3MQ8edFjp?=
 =?us-ascii?Q?+kvVyOTC5FDyOP6Zkdwtyn09LeNnMiaTP2s/DHubMLVMFm0GzIiXL1tuzS71?=
 =?us-ascii?Q?RDDfsaV9+10JP84dPYrGfvSfBBPZP/iRygTX9gQUUlU+Mxs3vyQRummAEK3w?=
 =?us-ascii?Q?WvX/cwliDYPhlooC8ox4Q0Kh948JUohh3VM0ayQtr+EWI8vMFidX3LSxYc4P?=
 =?us-ascii?Q?rjfLwQQcypJiGXRSjMyBACEzRxzUmrA5BB/sOVPGP74Jd6GIEgSx9GcceFPd?=
 =?us-ascii?Q?NSdYebJvqbqsadryVkgvgDWpXy8ZIa/GLRxWvQ+lwInxykGZYkUOw99MDlU5?=
 =?us-ascii?Q?sRDxBWVP+lNm/VWmjzm6dBYUulLPyoREr7+tJy6Ak48t18m7m0YYUAjYXmiV?=
 =?us-ascii?Q?J6ZLie+HGm4lr3TcB8RXthWIur0nxmyRn4xhHJJkABjJ7zDimGJcVEPRAvt1?=
 =?us-ascii?Q?SzeuNuzB8bYSyad4YdzeF3aXD/tKrXnxHSm49ebtiqGS6KcKQAj0GDh0cbfS?=
 =?us-ascii?Q?o3m5lPzkHxgvXHEySYNmwVTN3vEWUu9sAsqIbSUWEuwlu9ye3jue+w37hMKo?=
 =?us-ascii?Q?+RhNUeHbxO/gIyn8wQovyN/kczubFilEwFnjdNVBl5CFn2JKRHm5PLZ3GRSv?=
 =?us-ascii?Q?s4FZxzve5TjOIMPoAO7pxzeN777z06qznaHttPoJr5buRI0YKGpbYXOZzRHe?=
 =?us-ascii?Q?8PD9FgKU0KUPoePCVksLUHju5vTRHpHiNyBimmwa4u+An+TJ7fwmwWJimKCV?=
 =?us-ascii?Q?3Wnx8EzpeT13feIcaGq1EJbi2cAEcqXeOnem4culPnpz0KfM4W+3m3wV8AEa?=
 =?us-ascii?Q?oYX4ySMNyaBs3Kdti2C12J7ugjvHeIg8wrNMG4NB3z1IHzManzhmwV9U7y0E?=
 =?us-ascii?Q?bvlryjNjM/eKxbOR+sA9GA1UkdPU2miSH0tdiV0E+2WBo3Tv+qlAz4ECi3Tq?=
 =?us-ascii?Q?zFEFfUzoQilT/akV/N2XEVDtP0jAjq7iZ1snO4+I2OEfFd1qN67TeauI4xRP?=
 =?us-ascii?Q?/aJM7XTbr3c0J8nkFNyyeOc45eHrBvqEGEacOQInwqaSRx176ri/cDh/Qwwh?=
 =?us-ascii?Q?a2BAfkfrG/pgOVJQolNO0Xuyes0MSmJUbKDwcQLhp532psqC4Azeu/AGWgsi?=
 =?us-ascii?Q?svA91RqT5cf3AFOsNAE7byUvnHl6wG51Hlp3/f3CulH8SCdXFtYnbL/bqKp/?=
 =?us-ascii?Q?9bjpmPyuJzFwFm1tqlcebjTKeZzhL9DPbS8XvBrhmVOBP4wLv8YysNvSKnEq?=
 =?us-ascii?Q?Z5EGZv26nK3YAPmPMHEYWIPXLWzcfFs6NYyok0NHnL4xkCa5zJj048ca2Joh?=
 =?us-ascii?Q?wkDbZdeP0l0O4M/dMte/VZ+RHXHK0e0t6ySg+juZTXvcidmfTAY//XPHbT5o?=
 =?us-ascii?Q?ILdDAA38C+gvfGxu5AAG4dlKHx7wQgYE4L3rWQ6dHvKfagIB/gcR+HT+V6qb?=
 =?us-ascii?Q?4USjVBlA3Y5PkUSIH+PzCM1xub7/b5R73lOOB/+u7/wNrllbwduSoUYxP3tW?=
 =?us-ascii?Q?D6Ys8eYaWtOBvKxB1jOkDAK4NzAh8aVlkA/iToEtZtQ456/YYIQmMaUYEscH?=
 =?us-ascii?Q?IHLyY6GpKV2IPqDK9gDhP3GmgA9QorgP473SwETd4RjxVNmO9HlJnfN9QCDy?=
 =?us-ascii?Q?wmDfrdrWdZQOAtq9upUh53WMGjNL3r4Ar4Ms3b5VjxRvnEQPMaF5w1077J4g?=
 =?us-ascii?Q?Laztm2AFMKw8OZxc134eA6DBaTM6WaUOb8xyC+x8XlHytCRRXxTZGGpzMijR?=
 =?us-ascii?Q?YJ4Z+fQZt/aH3yvgi5gz6KGd8RK85HUGfdh5ORpmeqfKEhzxyXaS?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c62b4f36-38dc-4333-1e40-08df17fcdfea
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:24:56.9838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEeqwWm8DHcO54zOebe+zTGHE0/PKiB1/AVkSSL5+RPnyfwHSHbrl4qarq6S5U7YQZbdMFuZ7t48fJb7m3Uy3SCEwGysMoSYRlv7T449KjGxppbEw/L/dGprIv1DFj51
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7967

Hi Geert,
Thanks for your feedbacks.

On Mon, Sep 21, 2026 at 02:31:26PM +0200, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Mon, 21 Sept 2026 at 11:57, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > On Wed, Sep 09, 2026 at 10:54:57AM +0200, Tommaso Merciai wrote:
> > > This patch series adds USB2.0 support for the Renesas R9A09G047 SoC and
> > > enables it on the RZ/G3E SMARK II board.
> > >
> > > Kind regards,
> > > Tommaso
> > >
> > > v2->v3:
> > >  - No changes just rebased on top of next-20260908.
> > >
> > > v1->v2:
> > >  - Included PATCH v7 7/9 and PATCH v7 6/9 from
> > >    v7: https://lore.kernel.org/all/20260812141940.246223-1-biju.das.jz@bp.renesas.com/
> > >  - Drop placeholder patch
> > >  - PATCH 4/4: Disabled RZ/G3L common nodes from r9a08g046l48-smarc.dts.
> > >    Update commit body, and improved usb20_pins, usb21_pins comments.
> > >
> > > Biju Das (2):
> > >   arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
> > >   arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
> > >
> > > Tommaso Merciai (2):
> > >   arm64: dts: renesas: r9a09g047: Add USB2.0 support
> > >   arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support
> >
> > RZ/G3L USB2.0 binding patch is not queued.
> > Shall I send a new version without RZ/G3L patches ie, using placeholders [1] ?
> 
> That might be a good idea, to unblock mainlining of RZ/G3E USB.

I will send v4 then, taking old [1] + PATCH 3/4 + PATCH 4/4 from this series.
PATCH 4/4 reworked to address your comments.

Kind regards,
Tommaso

> 
> However, it looks like the only missing piece is DT bindings for
> "renesas,r9a08g046-usbphy-ctrl"? How come we ended up with
> a driver in linux-next without bindings?
> 
> > [1] https://lore.kernel.org/all/aec1fce5558c6c88725fe710a2f9e4b1eb9e8d64.1787062965.git.tommaso.merciai.xr@bp.renesas.com/
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
