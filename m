Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010039.outbound.protection.outlook.com [52.101.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9B545D909;
	Mon, 21 Sep 2026 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984647; cv=fail; b=R/69AwqBkbS1eQKago+kX2iPi1YSB+byR4nis7q/hVy7nUgZZND0byet3xLjh3cB7nyBKoH+U79Sra9mainWFj2I0ibIOIY5nZrF4IMvop4yLJ77p9aFeWHHh65BQAMJI3tIZX05y2rfze397mQPvTuEp5/awqjZToBoxSCG25o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984647; c=relaxed/simple;
	bh=kqvSBOlmyuqRrMV8+wUo5/eYc0A98dYAy7qnm+hWW1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CU3TC4gsWT9ogo12kklQKdMyU5NPN8CKso14HiUy50192DCbXr3yX3yf2Lupy16vpAi6mX6HTGyFWWZ5w6MJhVvPFnpQsZ4WJPigPo++Rx0p2O+x4kAfXJJUDzj6Nxzpm10Ux01QFYXOxUgbEso6Bf1mErggjqVvO+tcpmxdFsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BMUD7aNX; arc=fail smtp.client-ip=52.101.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BMUD7aNX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/gH8QNKJj9LOXLNr+RJho5PIqf9x25+rBZSl+ZvBkl9HSM+y6uCoVGWJDq0bvpyxJNz/PSl1ci+Op3Y7gU9jQfUCsvoelhiFMv4QuuPEAVleQUU54s6vA9QRF5DfUNNYecqUAfjQi1Xuy7uh1JUV+WYgH/8h4e+ELIvPHSZ5b5WDgmSRtr/5YTMODveSkr5/KDkk9XMHVyJ+r2jQDLC33VyrjnJMHnIbthuoJi4U+sdxhbdKQFTaRYUhLth88H4BlChVL3aGEIzm39Nzxwz99Ug1J+vtgUChyN1Iqw6GqAkNjGG+cf2juHvRWDVDQWiZAfc9i8RjjrcxiKhD4yPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbBbwCIDpq3NDfvZmugPDSAm03hW3/n8XzIQ/d3qWl8=;
 b=jsrsq+PTkFgiZjrSL8KPD4G42gzxck2cYJX4qSVhuT3hH7V+pv/qNmjo17yneYGEfss/qU1mtWnnQVQROICWYKPb3h4bdJtWRO0Y/EJxNfHIICcj3AA1yRsW5K8tM8OQTrnIGfg86LyDlOBEnDdrKyNlBB3tMmSeSLZGi5Ey/aZTSRFnGhxYQDwksOKrDK0MXInZD20eitX2VKxWc4iZWg9bIG/QkYFAe7VYWCYMPt1pBonXfSPqn2sGJUI6A0hDT1mmnbRMVxwRvkMdIxeD9M+9lY8f4U8bvPov/WcDytFh5lzW6m6+u8knrokWdcIvxckbGnOjolPzBQp+5d7BGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbBbwCIDpq3NDfvZmugPDSAm03hW3/n8XzIQ/d3qWl8=;
 b=BMUD7aNXlz9fYGZl/Dg4utK9fvv1/k9nWZ9WArZShVbesaLcl+OsdGR6bng4zT7op26F6LJlSKhms4DiQerVa8cHSMR2poz13IGEK8AqWEm6LU5D0UighuVrXfaemvWN3fDzR4/ktrjxJCL9NbPpI0goGfkz6E7G7ochA7QviSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYYPR01MB6811.jpnprd01.prod.outlook.com (2603:1096:400:ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 09:57:22 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 09:57:22 +0000
Date: Mon, 21 Sep 2026 11:57:07 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Add USB2.0 support for RZ/G3E
Message-ID: <arD_c9iP63WLOI1b@tom-desktop>
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15)
 To TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYYPR01MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 239f4c38-3325-4e25-da1d-08df17c6bb09
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|10067099003|56012099006|18002099003|22082099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	bkKMmeqVqz7l7pViY4Xw0SOIWwzcssja4J2LrI6ZVVnHb/eCuOsoROuuafzU6afwTapml+BQn0aCgtQhXDDGfVNoJb4s9Lsolm9HClcVGsPKw0h2IHdEsvuxgOk4WhlXzDSrGw0DAXV7hHZsqO1dSob4kbpSJKhVWubFK635Tue2kie2i4qOFK9Zvo3DUD0U+GYPPxj5clFl8P/8nxzlO8+LeeH49ARRuTXMFlFaI3cxafh5qUTqRUc1b4457nN9AGoj0Iy7Em2dv4T+u8+KDlvNdGghIUNaIB3F5ocaJwj7PaK6G9Ajdc+g+knvpQ+A7USpCwo8iTPBCoH/TgtSgmLYqVGhQIccx+I6VZ09/mpHNXbUH/2ELLoQHgrX1L2hMTDDNaW+k+8RWAttxJ9tI66YAJUC8Cxw3GM2tEoXqcsl4+4zWQZp/UGv3r8Yg8cepL0QGLVln6LOjQ6LqzpLx6fVFHlPrdFb6jX/DxWpBlFuec5TQTJ4K+kmrZ15gA4sJ7XuREfvGLuwfHXGImZob3jqQ+qQUGuBzx6Y0dQTKMAbwSzRbX2rbIpMS3olJtzB6NENsyGg+MottKHoCzAhsl/P+a2orUFDqjmpZjMyUtJ2LjfPI8cPTdZ0tCchCP4ARUYaVqtdylt8f9Z88jEr0rt1pqmH7E7X8io70hr5jCU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pKRZVkrjjyFdHBnQ57lb1LcULxGTKpoancHZvXexLR5o+MkVBPXODr4NNkc5?=
 =?us-ascii?Q?F0ytGjSnPY8ApB2MMaCcWGEQer7I6kGla07ovtA+m/Or3WfYZvQHJ8NgzZCi?=
 =?us-ascii?Q?0e0nj8cgKJTCcSgvFrLXNEYNQaoO4vHSfsuJH4J0IDBWDpIQLqkvTgCJTLPm?=
 =?us-ascii?Q?dDFD1fOU8LFcb8N/eY32t4wmjAgvSqfDjMIbhKGX7iHMnFouG7SfFHswP5pA?=
 =?us-ascii?Q?J5tL/5CCpSTc5tGJOyT1J5uq7TaMyJhx06BZxruuLgo58m0NpmQWhwDEyHjY?=
 =?us-ascii?Q?/0Q9Ec0/9ZB82GIc8e5gNWt7xBESj2ITOJoq2c7vs3zHohg2/4rmIKMpZH6/?=
 =?us-ascii?Q?HQlI5521LqLecJI2bCYiy2Xcw07aDZ8fR79y+jcQ9B8Jj91IoZozxBO7IhZ/?=
 =?us-ascii?Q?aUzEFgVYZfwnhffSFysEynL5xfIzwG4GIUWzapgFNU1/tOjX3v71vDYmjdyw?=
 =?us-ascii?Q?H8hogrnkXUjNL9WoII1qHNpFHVjwiCz1aaYsLoj5NNS19PIpcUuUEwzGnLVL?=
 =?us-ascii?Q?7d7juXgurzYrU8AzBW6FEwr2YK2G4HoNaVERCmLB5WqU3NhAp4evU6cJbfZv?=
 =?us-ascii?Q?JKBg+NJjfgYRvBH8G8vlKBCb4fbqBBKvGMB/8qH39QS6q0fA0jJ0zOtQuDaE?=
 =?us-ascii?Q?N1FN2JZGpnu57gC981bjpSppVJKNkSKZL66Mocw3WN/pkMlqdKCE2ovPk+M7?=
 =?us-ascii?Q?Vp69pR40tTNbU1AfugSVXDZ6dTpj8k2eOGuZlThoeKLFrzyLYN/qbP/h/ABJ?=
 =?us-ascii?Q?odX/jAHKBXKnNyrE977/Z+kP8cw/VBSyvJ8H0R5qy+4NUYVIQ4AKWTGzbJIa?=
 =?us-ascii?Q?2LSY8+GVtHS8b6HkJdHjOulIrJsmccHkgZgv5FLELjWDxEamoezP0F1b32I9?=
 =?us-ascii?Q?n1f90aUNrwh6C6qYczOTHx/Z75mkacXeemFMjjPfcuW1litJSK7Ov42nOf1G?=
 =?us-ascii?Q?7o/Q0xfru81IIxTfCiQJSVrvcTzlrhFUAq1Gxrb9A1t8RVyN/ITTFjR/huO/?=
 =?us-ascii?Q?RRVqHH6QCdl+Wmqxiq1A73gJpj/m8ftVKb+HcfgI13L268+ZdTLsXTUbDbYo?=
 =?us-ascii?Q?+ooqyiGvhn6BSki4K1S0FkhK+jidC4FLeW3Sxc24EJa3v5GdUo19tRUDpIO6?=
 =?us-ascii?Q?j4M4tT9PX4go0D/VyKQL0vGLquVd8EoIxFQUZAbqVsNi3XoAFBXrgASwRo1P?=
 =?us-ascii?Q?qxakFEOY0lGUW1uM6XYzjpfiifmJFKLkCd37CaILcFyMi7myMsdsTFQxDMqK?=
 =?us-ascii?Q?D3zFOybY/+R9QqTmC498bZ4yA54+Pt66l+CQdJAT7qA+7P2V+d/a8uz92XKK?=
 =?us-ascii?Q?cCO9ejz65O+rGw9OPGKGhePACI5EHIlNjtYBkg8iPk1oFtxMVL43m5wfF2Tz?=
 =?us-ascii?Q?dMmSrFx5BWl0KmFEkFd5qeKTEQexboIrP6i0CyNfCofrgFMXiOOvrt3KkWtQ?=
 =?us-ascii?Q?SDjOzr45C3Y/MvwimHU4XvMNWXjMBGeDNziqeadzQM2cQkQpjGX27UaD4CiE?=
 =?us-ascii?Q?Y5WV6X3E03y9Mo9ZtWva4Mti+D4g9sC0owLtHQ6gGgHpOV0SSoAfCEwzNpYs?=
 =?us-ascii?Q?+PC9ETODlorQ64x1oCSSHDUQJa/wJRIWz1oUzPE4wr8EZf81kTvzYy0i+JsL?=
 =?us-ascii?Q?yz6BfFnRIXhnn9+/Ghaday9HA9sL14aQ3LuFzxi7qE4j2d+sGMvtnwa+MeY2?=
 =?us-ascii?Q?xfyXJqYA0PiQAlKGmgFUFAD8hfADto9AjQm2z3+lOSkzDUHTe0dXYwt1AuxF?=
 =?us-ascii?Q?B2y5nanJgd7IlBkGOwSUM32DtAn6JL2m7fHanp0hYIy4Fdu7h0FA?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 239f4c38-3325-4e25-da1d-08df17c6bb09
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 09:57:22.3317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xm1tT87j5oTj8d3DIolOvaH5dgoNXsMzuHiX4SqLMrGXEaw4YmdLFrwLyGpuTo97jtnaael6HkBpQMOEnM1iJyixJKmomqYea2NoVcNq7SAEAg8yF/TWafPSmJ5jpA5X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6811

Hi Geert,

On Wed, Sep 09, 2026 at 10:54:57AM +0200, Tommaso Merciai wrote:
> Dear All,
> 
> This patch series adds USB2.0 support for the Renesas R9A09G047 SoC and
> enables it on the RZ/G3E SMARK II board.
> 
> Kind regards,
> Tommaso
> 
> v2->v3:
>  - No changes just rebased on top of next-20260908.
> 
> v1->v2:
>  - Included PATCH v7 7/9 and PATCH v7 6/9 from
>    v7: https://lore.kernel.org/all/20260812141940.246223-1-biju.das.jz@bp.renesas.com/
>  - Drop placeholder patch
>  - PATCH 4/4: Disabled RZ/G3L common nodes from r9a08g046l48-smarc.dts.
>    Update commit body, and improved usb20_pins, usb21_pins comments.
> 
> Biju Das (2):
>   arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
>   arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
> 
> Tommaso Merciai (2):
>   arm64: dts: renesas: r9a09g047: Add USB2.0 support
>   arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support

RZ/G3L USB2.0 binding patch is not queued.
Shall I send a new version without RZ/G3L patches ie, using placeholders [1] ?


[1] https://lore.kernel.org/all/aec1fce5558c6c88725fe710a2f9e4b1eb9e8d64.1787062965.git.tommaso.merciai.xr@bp.renesas.com/

Kind regards,
Tommaso

> 
>  arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 142 ++++++++++++++++++
>  .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  20 +++
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 124 +++++++++++++++
>  .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  45 ++++++
>  .../boot/dts/renesas/renesas-smarc2.dtsi      |  25 +++
>  5 files changed, 356 insertions(+)
> 
> -- 
> 2.54.0
> 
