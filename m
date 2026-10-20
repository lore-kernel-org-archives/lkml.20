Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792494708;
	b=OaIf22otKd0HB0MpcNBt9/5CKKp6JtD8DXbQY1qD+cPkamE4nalVetIpDkoSM8SDit41
	 4vL8WB6sz7JhY5kTPWdGi3brpNdQ0iWDTIBX4nhHv+ZWRUDt3G7wSqjsZDBsEMzDoAJ00
	 8GUhfva4Hf7ZVB1mYJjn/bjiDFAWJXuKsVlulzS0gc32BlDTDJG2TSv54whomfLDq0zVz
	 km135QluLOH8xYEnTw0eTp+1oZZkiZRH0erDnG7mIlNiwxh2yEhEVFrs5wm494Uyparmd
	 H7LnO1246p49TXIJS9TBh/w3kMaZteQ/pQwuu0jn+3H58S1jKH2mFAUUIslc9ATmiuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494708;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=UDoxDpYs5uoVSOlSZorgXqI9n6MPKWFEWdAAeeC52Gc=;
	b=RjhyWdhV3Grs4+2x23/0QA9HlJCue5R6PfILf8x4CC/5q0k0lBveItx2jEZ2IEWIXWc+
	 4j2nClQlT6vO+xtjN8JBHeMUI36kuiuLdG+0Q1SBvpDPXr9QFyYWd3bs7oeNNGpF938wW
	 1QJFjV6l+ZKCWRieT8ogqknEsMSqj+TSJCZ8OR9jTb7hSbliwZaTf7hsgTfkCxkImzI8Q
	 t9gloXqyK76sE6ku59IYIbo82x1Dl4UWm+SqTUdcG8ZTc5yZsdLIQ3UTCLKQnwTD6l66R
	 ZmFwbU9KWvbRhxAJk/+X9HRcgIx4OJA3BB4YNVgLniQ9HoLSwpQo7aKwP1RJokhXzrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=ThRYLhSf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.34
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2937060A261F;
	Tue, 20 Oct 2026 11:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2937060A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=ThRYLhSf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QC+sGAcnD3jUt5GX1JjyNCVAdzA1aqA3rDRFnSkMzLvD4sp0gm8+CByEEeDHlMrXOYUkgQGjFJ4MUnFqcr+LoaknQSvAL/fx6qf0N6vcjErkW73X5DmjVFYqxSqc1vTI2wT6+0bOlqAs0vo8PGauM6XnzMGfymg9myr0p/luVOQOhZ9dgGLGMwf6K7hoKU8kR04T1oSf3Ix61hIUTSWwLdTR2mMYuGRciWzu3T6qWb/OeUuwFrLWhkewQ4esZd036GH0SG8eneiJg1rKt48+RlFZDTxx9njGRq6ZX9o/+YcAfJuZRenWbv54i0vDBshpSUooMJwSklEDxMV1Y+D+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDoxDpYs5uoVSOlSZorgXqI9n6MPKWFEWdAAeeC52Gc=;
 b=gFlsHqd95U3KdYyuv2M7wBhw38lShOzioGvcr5wLognnqYgDCFmpFni5GzVkuXzYNyiL6fbuUiRYa0h8UhJZYdmzYD7zfcJvpO4/bqRDBfztzOSsnlhHPTP12Coej9UrZ5j9uWIVGni4NjoXIjQBalbcor5VvT3ZTu7dbp+J5RX6qp7dniMQcVCGqsSgdhzxh/ufOoCCL/ZqcN35+ut1RgUuBDE2P8za9PA7A7xgjsfKtJM5R8X7NTpUuslaUblV1QNmHLZGb2UFt3HPrcXTV2dKmVJc+ZWhYqGfe4qkXiWhZjh+vq2zEokIzhoUG3OuZT7+AKitLrvwPdzJO9pkyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDoxDpYs5uoVSOlSZorgXqI9n6MPKWFEWdAAeeC52Gc=;
 b=ThRYLhSfKqPvqHS/ViCLR+55EinfVCh5gpc5YNX4OP6jupK5HsehasUQIc1V+AIbbXGa123JigDY+Pj9rcoioBuNT5zVJjfY04ZDQn4KmfrMbuKZ/91X+Cux/4wC/OZM7O3ds+SStgetkcKuPeepbft/W4vsmoWp0m0RB/ykYD8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY7PR01MB15038.jpnprd01.prod.outlook.com (2603:1096:405:244::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 11:11:43 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 11:11:43 +0000
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
Subject: [PATCH v2 2/2] arm64: dts: renesas: r9a09g047e57-smarc: Drop AUDIO_CLKOUT clock-frequency
Date: Tue, 20 Oct 2026 13:11:07 +0200
Message-ID: <e2473162dc19edba539d8566c28ada810f36e73c.1792493096.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1792493096.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1792493096.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: a430efb6-fbcd-4b03-2901-08df2e9aec4a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|52116014|22082099003|18002099003|3023799007|260925021311599003|11063799006|261009223027099003|260925022911599003|10067099003|56012099006|260925021911599003|38350700014;
X-Microsoft-Antispam-Message-Info:
	920ELtb7x//JkUrXYVmvNSZH4z/1FIf7KImRRyCaEzoOgeV/uJGg7AXNyXLoJgFmt6bX3US+RoB4/Xs2pmUUBsaxJSxglQDaX/tnfl4BmUlVQv1b/Yg5iba1BUhlwewwksnsCn5D3Z9yXYLd7Ulv5XXY4F7CLoqs4FXPQvxkYyGVuO4LgZ/JTvm4jrJvwG4iM1Yy9onybazODagrxNVUGJLlpptScqQ7FW/DBeFG7QBBeUaRdWhwKg01uTpzPKV0J/hWv2QIOjoPmTrQ/7vd62GJxJQKTktSG42BsWbWZI6+evu/QksmKgjPabOkN6HOJvMMs0P9fE+hiiIDdppDvXCMqJ/gRUP0olY9z8/JGO3dQ9VTca7bRQ0erTYFfk1Ug8YRU85+3EDiIci18VbvnrYqRcc2KYw0+amwuiUic2FS8rOqXzQYr7EJxON9KJkeOm8ioXAagVnqokMrGLOtM+m0aLDAczae6z82AzPYcdFbjLIrpTJWNb29qwFcwOMzaGGu39UP5zCK5947bU89l38JY1j4R/e4E+wLSV9CKkXP09P4u8C7iqxvAC1UR+OoY2Ov7rYZe8kxriTL5fQSNNVRKAvjPCN89oY6eC9xxNbLHc1yFCChy4Cu3aPhdRjztRTtMB6O4ZgA7hV6AJ3pmrHbWCewhGlgfbciMVSwitg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(52116014)(22082099003)(18002099003)(3023799007)(260925021311599003)(11063799006)(261009223027099003)(260925022911599003)(10067099003)(56012099006)(260925021911599003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A8A62N/Wd0ENCRmxmgPwrt6a4kQ/TMMiUtbNPpWtONBUEPpfCy3OzEay51Qt?=
 =?us-ascii?Q?FWIga72UE/NcILp1PBBL5V1zPd91ga6697Hw0j3RqWmHBc+1HCACglLDiFW4?=
 =?us-ascii?Q?Pn0ImaLLf8wvMLUx6crrNMpjFIgujlvVD1rCj5z5CE8KrZxReZu03LaLYXeB?=
 =?us-ascii?Q?ItXyq+yyiq/FOwXWqcFXzWDm+HColOkIHHZdx5BVYPrkSIgTq/1NUgEvVrgl?=
 =?us-ascii?Q?Od8dCtIeq4tcDTZkWFWsEjBvtx9i0ssf++Sms8K255GSCztMUbkx/WFWu01O?=
 =?us-ascii?Q?9NVJmTG4B/P+lSsXEOuQM+MvmuVPtqEu8KmUYcRzUXLXlB8GXu4lIzAh/hHW?=
 =?us-ascii?Q?B+TTUXmL2JaD1feFGzFocZ+6hH+Lq1GxfASx2+yZ+//K+/JF9/vRw407F5Gw?=
 =?us-ascii?Q?pF/9ozruwrSenzxIN1zlLJ50wcee1Qkc4zOSVmlg4Ee86zI2mqJKXoSmC3sK?=
 =?us-ascii?Q?X/RP1JiWwrbt+mWRFI0J7LWb8Ik2rPk/R7FDTKJ7RSqEk8POSAyVuxfB+7fV?=
 =?us-ascii?Q?Mgbdw3R3++uinBXOCaC7BzzneOT6Hy2I3oPk5rF6P46YOqiKqLmajll+0Luz?=
 =?us-ascii?Q?U1B7SkBk/gd2ynbJ+ZjVh+9Yz11o80wQY0ZNKdLZmUcwmkVkBcNzdbZgJJ0H?=
 =?us-ascii?Q?7ePI9wKM7/D8iQCg5oxc+0Mjqcp4rDF6REfZv7oFZBkYyIc6Gbb72UAhKu7A?=
 =?us-ascii?Q?hqGIcvu9YJHx5TN023A/W3qtM4P7mU1Ex6j5Xpvu7GGi3UOj420YiKqiMEsT?=
 =?us-ascii?Q?f/1X8OUs21J1cNHK83psVQ39z7B+VFA/QTQ9BtxYVPx4jRfCBILCl+ZMbGqD?=
 =?us-ascii?Q?wOs3XY0VPj1Kcg/5fgRmllcXTrcccDcfSAnDjM4FbF8EBZZbeJZYicpKiP3C?=
 =?us-ascii?Q?VgYSJBzHDO8dUBpN0ZkhcDqAIrfyAtobrPiDvjCY3n2BoorDFpLcq1c1726k?=
 =?us-ascii?Q?vqADi1Ffe6rT44sJVYQoi8VgQ0ISG+dghOj40SbhEbon7k5jnId0zBoX8YGF?=
 =?us-ascii?Q?uj+vvg06engoE1sGuRR2YhHE0vcS+tAGy1U2XBo5QDNBHK/70zVYdDYKs7Vx?=
 =?us-ascii?Q?fPuwxiueNkj+E23lQtH77EZukVOFuQaxOKjVgXpowOt3R+Cef7sVosRmCs5p?=
 =?us-ascii?Q?18hIBxq+JvklSKPFu8sGQBhydInjxzkCjOpBl5yUJz3vXawHuAVOKLY1YI0T?=
 =?us-ascii?Q?RsQNdo73iIIxcSFL8YYz+dP7pSAlUou2mBiuqC8QKPl2X+unyb+QO21g5B8u?=
 =?us-ascii?Q?tGHWzE6zFtDDua13Maxhbk94Rroc7+m3JCSG7m16P+barqmOcMTGUSEDP5m4?=
 =?us-ascii?Q?OktLtfDQqnfzvmMAFcOzpKVpzduu1R34vQ53CamiD8sdEYKHpGvtfpDNpl9R?=
 =?us-ascii?Q?R/d7pevjmVAvGPKmH7zrfAWdYEN1u4yZWz/8BF16djpBuAQNl8vU/thlDNp1?=
 =?us-ascii?Q?6V9C/gSxyhfQ+kniMD63o/srBFnMe59n5av+RbkUltleMdzmthF9uhaiV0uC?=
 =?us-ascii?Q?YkFmDe2wNW/kfJd4EvB96AooHkSi/VYfmf1yCBDePo2HUGY6yuQIGbbnbjFf?=
 =?us-ascii?Q?4SFUwg+5WfbcGgvlRvPJQPE7HZfYwz2R0obU1jRpQ+T6zkMTVvgFibciLX8L?=
 =?us-ascii?Q?ahL6ktJlDbBsIb7BEfFGtT/pleezlj7xhnNNahd/4Wyc7x8WVLQtJKEAfkVa?=
 =?us-ascii?Q?lWKDWRtafjnUDFJqRtrJmn4opfCyRQWqH21imFy85CtCoTqe2FfrcMt3EJyj?=
 =?us-ascii?Q?1Lu/CALzgUPeOhBEY18fuF6lboTKAyQHKKJ0LX+zTnPzd9fB+nyF?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a430efb6-fbcd-4b03-2901-08df2e9aec4a
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 11:11:43.8490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WE9UKycov+vylCD1ch1qRPARHT3X6nnt+wJ7RSwv6qB2B2iT8ZPi96V0d9W4hjpNmq1WDCQXqSBqFtiAb8FFjmaImKwjWh/RC2uSa+ZBZqLJA5Y1kyw4EhbsLdYKbSd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB15038

AUDIO_CLKOUT is neither pinmuxed nor consumed on this board,
clock-frequency describe the frequency of an output that does not
exist here. The DA7212 MCLK comes from the on-board versa3 clock
generator.

Drop the clock-frequency entry from the snd_rzg3e node.

This fix also the following dtbs_check warning:

sound@13c00000 (renesas,r9a09g047-sound): Unevaluated properties are not allowed ('clock-frequency' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/renesas,r9a09g047-sound.yaml#

Fixes: 3e23d2548ddb ("arm64: dts: renesas: r9a09g047e57-smarc: Add DA7212 audio codec support")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch.

 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index d242f2976296..6c0053735904 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -378,9 +378,6 @@ &snd_rzg3e {
 
 	status = "okay";
 
-	/* audio_clkout */
-	clock-frequency = <11289600>;
-
 	/* Multi DAI */
 	#sound-dai-cells = <1>;
 
-- 
2.54.0

