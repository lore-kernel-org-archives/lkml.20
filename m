Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793725275;
	b=Vj+siAxa4Cvk3sS4/NGuDqWONSfrrAAuz+J3XyH5mRH8Om9T9PfHQfCWECOa6LyK2QOq
	 hIpgWteEwtehMmoDr9R8sn7bWwstBbnvhlYoyUKgjdgcpZ1wGbYk8iJLO/BaAXCZlgqyf
	 I7Hb/hbiGfohupN7gfTQckkFu7rQFIPBpb8mtEvwDkwhk4uyhYBtI3aN859jkoZhEqMEp
	 uJqZmsI2uW4xV3/itwVKpucv1vkHd6Lo+oVdqPxuyGyQgyyCdxb8Fgh7gVU1qTsIp2HWr
	 vYh7fKt+aSfFrW1hRNGQh7r79vjDNiftxxUrpuoYCv7bKEi+jsSKxEZAFfdT/5DlvFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725275;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=fX8haYnt3Sq7RT6GXwVlSImbTCnf8Fz5QKUxu0Wl+ak=;
	b=Uocd12IpG/TQUyL1eDaTL/qKOYInE3jUeOYtwLw79U2ADv3P/dBqh1oF3/5QDt5Y7xsP
	 qo2MjBvGK3wWOkMcNH4ADm2DmL3tVYPE482tSM9OpzdNRBUvPZMtAbZJaPTjinwz9GPTc
	 Zkr8iTP6Ih7LYb/7nr3ybCDvKPNJgYoOxf+UsK3YivKR/397HDR5pbBsFJQ24Uq/9D8AF
	 xWtcfozoizoqWZ0htGT7XNq3RtbXGhuAvQSGahMPYI4/5ZUGbv5XQ89Q+mA/M4xgGw9r3
	 Z0PEyCZXsoFaPEBYWc/Qt0xVMaSY4bUUXriLdNct/+9UXPeJB0Q5KoLgAD1edrjjHnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SiNdDEnX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.33
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011033.outbound.protection.outlook.com [52.101.65.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12662606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12662606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SiNdDEnX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKsAnmufZwHuSHnk4zTp5guIyQ2VClfNWymErmjEWRNC3BQO/mgkFd4kfQktllIy/xmnq05y8zNkTAaT4Rrmnq1aXu1Mpzv8uYuY4yUmGKnKVvYoAa5eX6UvyJ6j/0nQu6AZfCJqO6JGQpey5Hz07DcHVAhXPmTMefURhqFV3LVF30Q9YSVav5JrjX/yub/Lrmtn4VtKw5wJxQlyCsrKTTRvYJ9iZY+nktjWQe+Cp88e3yvIkPcytrl2drBwfuCT1No6+IOrDoXDGuJ6MgH7W15QtQqVLP2E2eMiQAj3X02pXPXuNWeBw7dwYd5p85A8NqWKeOxapD4DcgPfk96uRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fX8haYnt3Sq7RT6GXwVlSImbTCnf8Fz5QKUxu0Wl+ak=;
 b=NNEYmcA+fLge2M22AMKxbBZulkW87Duc0fSPmLdWs5PTjmFBfl987cAo2BS7E0T2CztL6rSzbsJ8AABnC7RROzMH3u/mYnsxx0U+Rjs18LuqT3CihHTavtygeFSb3AHKFjHiLV5+aQPfaBDm16oftVvzZVGi5A2DRmmB8jZBcDgOHXFJfr8q1DsCRwTUvVNbSHYh2Z62sevgv/5o5JtrZDkcNhEiJknufhf2JCmBfpJ2yqByEzuiskNh1DrQ8BFoaMVElY+IfvBZ2ZwVRg4O0xgbiyXl2EiT72kPBvYou5b7Iqzc2s2wGqDwZoj5IO1al/lboG1ZMwS25JtiIyYltQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fX8haYnt3Sq7RT6GXwVlSImbTCnf8Fz5QKUxu0Wl+ak=;
 b=SiNdDEnXmpjuYw/6mK7SH8zRJQXvNDhkGU2UGUL73OvD//FH/TNkzJj3reINL6WMbCFyjJRLpl99w9O9lc/BUg8PmZr9RD81UtzmSvuzgklul0rFEA1gzqFeboxZITa/UZao0uIbdAdWx8ZT7OGfryOQbDizu1uT5uWSBIIW/QC7axb35rFhVl8NXd7RQhWe/9MyHFQskhOzdccS7tzokt2ugCdWMV4ReYfSipFpXwmDiPmLy4wWWVNvjxO8dmEdpI9w+Z9v3UcL9xvFA2qrNgO/LaNN+OTcb6vSQ+JAobejpgsp64esrmTrw4b/0qeLRpAurTComcgGllNBou2Xtw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by MMZPR04MB886210.eurprd04.prod.outlook.com
 (2603:10a6:190:4e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:01:11 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 17:01:06 +0000
From: marouene.boubakri@oss.nxp.com
To: jenswi@kernel.org
Cc: sumit.garg@kernel.org,
	arnd@arndb.de,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	amirreza.zarrabi@oss.qualcomm.com,
	peter.lin@sifive.com,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Subject: [PATCH v5] tee: optee: build the Arm-specific code only on Arm
Date: Tue,  3 Nov 2026 18:15:04 +0100
Message-Id: <20261103171504.910646-1-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM8P189CA0017.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::22) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
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
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|MMZPR04MB886210:EE_
X-MS-Office365-Filtering-Correlation-Id: 79329601-3fab-405a-f407-08df39cc0d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|366016|1800799024|6133799003|10067099003|18002099003|3023799007|56012099006|11063799006|261022105027099003|5023799004|261022113327099003|261009223027099003|261022075727099003|261021123027099003|261102123227099003|261028144727099003|261009221227099003|261021135927099003|261026140227099003|261026121527099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	hfDe/qZEP9OkvNj74c/zEjRVEbTkTkLrYKMAW31RyGM4Wi0ISoALfdoF2Og/Dk79Zhgou+cMs62AsBggj/Qgw7YJZ1l24fu00A0UfDQWLFxAPHL0vN+rMunAsiBs3HdyeFO2V8EcruSpQhn0vbJcslH7N7RE4lRECIGlZJx379YFA6kXoIsP/A8iQUS+gNQYRRcRU8Eb5qUNBkd0TYbXtN+Joa768A78UvDBTUI6AOQeHG7J2ZkkxeXoIWiOoI1ubo2NR3ITULsh8HPSYvwJ7djgfFVso7uDNGYrgbbURy8rtOQZW/fQscQxGMYcEWV2QOr2iRxIDU5Sm9KJAB+jM9CQHBV9c1Q3HjdXaszzz+P0Fv42NElWxNNiE6haDtUcKniBuChUU7ybAKYUlX+AFDxSCf4yyno6AuFvV1CuvghUN4JxzoUBND1ccf4EAHBNDtSxHtt/7VjfM8MIvr9hcycepfe+BaBtmvb0c3OCAttch47TMUqa+d9Rbv7/AHIC6YZQxmMPmjjTBUtvjrV4Pgp3WdQs2B4Jb5/wNUvby8hOrjVZoGRXczSEwXS3o8TxgRAfSTABWgte1HogVl0N01+5KGa+TqegOuAbI/p3I5m0QsOqksutVoTXxiRwvUql
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(18002099003)(3023799007)(56012099006)(11063799006)(261022105027099003)(5023799004)(261022113327099003)(261009223027099003)(261022075727099003)(261021123027099003)(261102123227099003)(261028144727099003)(261009221227099003)(261021135927099003)(261026140227099003)(261026121527099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?36HF6m0w0C3eOM17kTgS5YHekAWEg6z1+TAIS8vrhg0gf8e1Z3suk8Mk/Tym?=
 =?us-ascii?Q?Cx1K38z6tUUTryR0sfuRhPNEV1f/uJl9+CAeAckwEfJ81PhATUHlsLXQ3W/I?=
 =?us-ascii?Q?6NgAhajFcbFTZw63tsEMeFIDeIzO4LyxBKawc/WD5lraxW//jsUle+6xbZqQ?=
 =?us-ascii?Q?cxaRCHB5LsSXtXAdM58ZQBM06OCQ7pkrZqIuI1ViRP7YdrcLBWhU0mXLCdvk?=
 =?us-ascii?Q?Qs1sYyULomJ6h5vlPq1HGxGJBMAQf1/YpCujgL8wlOR2qSEWBW8NPUNClQGn?=
 =?us-ascii?Q?ZUIfqHLTMqKYfPAlUFuTgFlLVQLBYKIsODaVAyaBIHFinUQ/iY2QApctJKLB?=
 =?us-ascii?Q?Oj4mquRBWi+X4zUvAY+uouA/AsYgobXpMlQ+NPfgKY8qN3rO+bv8/HdIg8OQ?=
 =?us-ascii?Q?WkfVGynM+Tg06dpZniXwD6sGMwqWh4M9i7kUZwGU5IjAk0dij1G6mbRACfPu?=
 =?us-ascii?Q?UaWA7dfKlwd4sRoXVCNoY44gymoNb4QrLgVib9KHwHPcID+x09eqi5OJmln1?=
 =?us-ascii?Q?urDRzRzPKgfV6h+DtyhQPRiqYVbt1SiPypL0lRghrYdBMH2Vi7sqDvz6jh5g?=
 =?us-ascii?Q?G8iY5qDrH3ez9DaIStj2jqFc/OXS/gWFipCyIyBxa0Ium770Oo8ABzPZylok?=
 =?us-ascii?Q?j4El3fv0cQlnS1WsUiQjgrU1Q15DGISxj0aL7d61IVqKtrTrVSSUm+E0ssd3?=
 =?us-ascii?Q?05gWsnzHIm3o2gsT2JL/6nXr7/t3BRJCxZ9ymffnagaLlCXZzvEp4dmcQF+h?=
 =?us-ascii?Q?R/YNpy0UURHPToLfAv/wNiBee0VtAAtStEjGe8Iywv8OQwSD96AuzylSnSjJ?=
 =?us-ascii?Q?mkyTjxtOX7W4Wg4oYAkYenyCUGj/x9bbdQI34AbHvaNtb5n93eY4SEUQ4U74?=
 =?us-ascii?Q?4PmygovtZz7Yyhwx/pua5+0clK1V1Yx9t0xEXlkHXcQq5GBNuyizON8MPtv6?=
 =?us-ascii?Q?mCaFhuEW1DcnrwwVA05c/WSD7bUD6vsdcDD12ksWgjKV/ZMyvnrXzxuYuEJE?=
 =?us-ascii?Q?Te2kdEoHRNeNLlgYqqYZD4Fufl4owOPjCFHuMOOOt1dziG4sc3Ga2R2BfalH?=
 =?us-ascii?Q?3Dq8+txvcLoSgxCC5McoLDdxw/CXaev50z7MgiQbPrc0k61vx6cPziYvSgUA?=
 =?us-ascii?Q?lGc0aTwEb5Zf+22C/RNlM/0qPrKLjEuLVlLhZh9eWfZj7UO+YhC94Quvm4B4?=
 =?us-ascii?Q?4HhPUHFF1hkHLgMqL4+UL6gwE8f30pyFg2s6pfr3Pdw4cj+B1gKdEfao8YAj?=
 =?us-ascii?Q?5HNozWbLsGMdvZi1gC7R+4uL/TjcHEWGbCkrfx/ymXaUo0HGqy2IPMpcVoLX?=
 =?us-ascii?Q?huOWmDfF4KYbn29VT7IWQMrGd4Dy0sqSM9g46bQsCBLDalc2fOx0x5Wzg68a?=
 =?us-ascii?Q?nmuKYWV8iTMMl+xQ21hYFj0owiv8/RCxYZnoEtg7LhCmLfrTiSELo5eSJ7VR?=
 =?us-ascii?Q?+E10EbHufYiDoiw9CaXh2xOuWj7GxrxVjB2V01XaD54wx2bHC0s4PXaJMOuM?=
 =?us-ascii?Q?WzLdq525UFRtnJ5zqpLz3+kHX/1nWOfLSMBsY09I3oxqbEWrJ1TR9ieJgC2U?=
 =?us-ascii?Q?3Zo9vdXaGSXO5lf2kmCkKLa+CLaOZ1Uv5BNgZYIrfACunkl98VPV1S3nzoFr?=
 =?us-ascii?Q?1hMVoquMhHoqXd56CpgqmEfHExvVNcNci/IxjjeDgQfae40x0c3foeYUi30B?=
 =?us-ascii?Q?bxRmFNSrRg2fM8IooFhqI+vpDe2hht2QXvlmE61olKKB02gXKEalozmayiqC?=
 =?us-ascii?Q?Y4p3yaSsoYGwqg1CDlRKbLwnrc4Q3eVHS2wkKvepFcWJltCHUDlNI/KSwMn1?=
X-MS-Exchange-AntiSpam-MessageData-1: UsHDzmUqKnml4g==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79329601-3fab-405a-f407-08df39cc0d2e
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 17:01:06.9009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXA0Bx53bv6DDdhRCxavN1xQPXBTR5MFNpjZgK0o0edX5Lqj2zAUd47QFO9DMAT1Nr3qStkEZ04+hUKeTv7khV+i2StpTwcBkpMwMvhiRuSgJVM+NTcIaUrf34BNkKpJGot3JMJxHdSNjQfApE6hYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB886210

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

The OP-TEE driver reaches OP-TEE through the SMC ABI or the FF-A ABI,
both specific to Arm, yet builds both unconditionally together with the
SMC Calling Convention definitions they rely on: ffa_abi.c is always
compiled and only its registration is conditioned on
IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT), and optee_private.h includes
<linux/arm-smccc.h> and defines the SMC and FF-A specific types for
every file of the driver. This is fine as long as the driver depends on
HAVE_ARM_SMCCC, but it keeps the driver from being built for an
architecture without SMCCC, such as RISC-V.

Build smc_abi.c only when HAVE_ARM_SMCCC is set and ffa_abi.c only when
the FF-A transport is enabled, and provide stubs for their registration
otherwise, so that it fails with -EOPNOTSUPP as the FF-A ABI already
does when the FF-A transport is not reachable. Keep the SMCCC header,
the SMC invoke function type, the SMC and FF-A specific structures and
the SMC RPC register parameters in optee_private.h under the same
conditions, and drop the unused <linux/arm-smccc.h> include from
notif.c.

Make OPTEE depend on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT, as it
already does for RPMB, so that the driver is limited to a module when
the FF-A transport is one, rather than built in without FF-A support.
ffa_abi.c is thus built exactly when the FF-A transport is enabled,
and the FF-A transport is then always reachable from the driver: key
the FF-A parts of optee_private.h on IS_ENABLED(), so that the layout
of struct optee does not depend on whether the including code is built
in or modular, and drop the now always true IS_REACHABLE() checks in
optee_ffa_abi_register() and optee_ffa_abi_unregister().

OPTEE still depends on HAVE_ARM_SMCCC, so smc_abi.c is still always
built. The only visible change is that OPTEE=y can no longer be
combined with ARM_FFA_TRANSPORT=m: such a configuration now resolves to
OPTEE=m, with the FF-A ABI available.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
Changes in v5:
- Replace IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT) with
  IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT) in optee_private.h: with OPTEE
  depending on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT the FF-A
  transport is always reachable when enabled, and IS_REACHABLE() made
  the presence of the 'ffa' member of struct optee depend on whether
  the includer is built in or modular (Arnd, Jens).
- Update the commit message accordingly.
v4: https://lore.kernel.org/all/20260924105145.532787-1-marouene.boubakri@oss.nxp.com/

Changes in v4:
- Make OPTEE depend on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT so that
  the driver is limited to =m when the FF-A transport is =m (Jens).
- Update the commit message accordingly.
v3: https://lore.kernel.org/all/20260922131735.524635-1-marouene.boubakri@oss.nxp.com/

Changes in v3:
- Dropped the RPMI ABI placeholder and the RISC-V enablement patches,
  this is now a single patch (Jens).
- Key the FF-A parts of optee_private.h on IS_REACHABLE() instead of
  IS_ENABLED(): with OPTEE=y and ARM_FFA_TRANSPORT=m kbuild drops
  ffa_abi.o from the built-in optee.o while optee_ffa_abi_register()
  was still declared, which does not link.
- Drop the now always true IS_REACHABLE() checks in
  optee_ffa_abi_register() and optee_ffa_abi_unregister().
- Describe the current FF-A conditional compilation accurately in the
  commit message.
- Posted as a new thread with a proper subject prefix.
v2: https://lore.kernel.org/op-tee/20260915020235.507302-2-marouene.boubakri@oss.nxp.com/

Changes in v2:
- No code change, the testing section of the cover letter was completed.
v1: https://lore.kernel.org/op-tee/20260914175435.118303-2-marouene.boubakri@oss.nxp.com/
 drivers/tee/optee/Kconfig         |  1 +
 drivers/tee/optee/Makefile        |  4 ++--
 drivers/tee/optee/ffa_abi.c       |  8 ++-----
 drivers/tee/optee/notif.c         |  1 -
 drivers/tee/optee/optee_private.h | 39 ++++++++++++++++++++++++++++++-
 5 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
index 50d2051..891dac6 100644
--- a/drivers/tee/optee/Kconfig
+++ b/drivers/tee/optee/Kconfig
@@ -5,6 +5,7 @@ config OPTEE
 	depends on HAVE_ARM_SMCCC
 	depends on MMU
 	depends on RPMB || !RPMB
+	depends on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT
 	help
 	  This implements the OP-TEE Trusted Execution Environment (TEE)
 	  driver.
diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
index ad7049c..183cdde 100644
--- a/drivers/tee/optee/Makefile
+++ b/drivers/tee/optee/Makefile
@@ -7,8 +7,8 @@ optee-objs += rpc.o
 optee-objs += protmem.o
 optee-objs += supp.o
 optee-objs += device.o
-optee-objs += smc_abi.o
-optee-objs += ffa_abi.o
+optee-$(CONFIG_HAVE_ARM_SMCCC) += smc_abi.o
+optee-$(CONFIG_ARM_FFA_TRANSPORT) += ffa_abi.o
 
 # for tracing framework to find optee_trace.h
 CFLAGS_smc_abi.o := -I$(src)
diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index 633715b..08236d8 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -1212,14 +1212,10 @@ static struct ffa_driver optee_ffa_driver = {
 
 int optee_ffa_abi_register(void)
 {
-	if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
-		return ffa_register(&optee_ffa_driver);
-	else
-		return -EOPNOTSUPP;
+	return ffa_register(&optee_ffa_driver);
 }
 
 void optee_ffa_abi_unregister(void)
 {
-	if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
-		ffa_unregister(&optee_ffa_driver);
+	ffa_unregister(&optee_ffa_driver);
 }
diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
index 6e85f2f..6801422 100644
--- a/drivers/tee/optee/notif.c
+++ b/drivers/tee/optee/notif.c
@@ -5,7 +5,6 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/arm-smccc.h>
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index aefe1e6..02d6f79 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -6,7 +6,6 @@
 #ifndef OPTEE_PRIVATE_H
 #define OPTEE_PRIVATE_H
 
-#include <linux/arm-smccc.h>
 #include <linux/notifier.h>
 #include <linux/rhashtable.h>
 #include <linux/rpmb.h>
@@ -15,6 +14,10 @@
 #include <linux/types.h>
 #include "optee_msg.h"
 
+#ifdef CONFIG_HAVE_ARM_SMCCC
+#include <linux/arm-smccc.h>
+#endif
+
 #define DRIVER_NAME "optee"
 
 #define OPTEE_MAX_ARG_SIZE	1024
@@ -42,10 +45,12 @@
  */
 #define OPTEE_DEFAULT_MAX_NOTIF_VALUE	255
 
+#ifdef CONFIG_HAVE_ARM_SMCCC
 typedef void (optee_invoke_fn)(unsigned long, unsigned long, unsigned long,
 				unsigned long, unsigned long, unsigned long,
 				unsigned long, unsigned long,
 				struct arm_smccc_res *);
+#endif
 
 /**
  * struct optee_call_waiter - TEE entry may need to wait for a free TEE thread
@@ -119,6 +124,7 @@ struct optee_supp {
 	struct completion reqs_c;
 };
 
+#ifdef CONFIG_HAVE_ARM_SMCCC
 /**
  * struct optee_pcpu - per cpu notif private struct passed to work functions
  * @optee:	optee device reference
@@ -149,7 +155,9 @@ struct optee_smc {
 	struct work_struct notif_pcpu_work;
 	unsigned int notif_cpuhp_state;
 };
+#endif
 
+#if IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT)
 /**
  * struct optee_ffa -  FFA communication struct
  * @ffa_dev:		FFA device, contains the destination id, the id of
@@ -170,6 +178,7 @@ struct optee_ffa {
 	struct workqueue_struct *notif_wq;
 	struct work_struct notif_work;
 };
+#endif
 
 struct optee;
 
@@ -257,8 +266,12 @@ struct optee {
 	const struct optee_ops *ops;
 	struct tee_context *ctx;
 	union {
+#ifdef CONFIG_HAVE_ARM_SMCCC
 		struct optee_smc smc;
+#endif
+#if IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT)
 		struct optee_ffa ffa;
+#endif
 	};
 	struct optee_shm_arg_cache shm_arg_cache;
 	struct optee_call_queue call_queue;
@@ -290,6 +303,7 @@ struct optee_context_data {
 	struct list_head sess_list;
 };
 
+#ifdef CONFIG_HAVE_ARM_SMCCC
 struct optee_rpc_param {
 	u32	a0;
 	u32	a1;
@@ -300,6 +314,7 @@ struct optee_rpc_param {
 	u32	a6;
 	u32	a7;
 };
+#endif
 
 /* Holds context that is preserved during one STD call */
 struct optee_call_ctx {
@@ -422,9 +437,31 @@ static inline void reg_pair_from_64(u32 *reg0, u32 *reg1, u64 val)
 }
 
 /* Registration of the ABIs */
+#ifdef CONFIG_HAVE_ARM_SMCCC
 int optee_smc_abi_register(void);
 void optee_smc_abi_unregister(void);
+#else
+static inline int optee_smc_abi_register(void)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void optee_smc_abi_unregister(void)
+{
+}
+#endif
+#if IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT)
 int optee_ffa_abi_register(void);
 void optee_ffa_abi_unregister(void);
+#else
+static inline int optee_ffa_abi_register(void)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void optee_ffa_abi_unregister(void)
+{
+}
+#endif
 
 #endif /*OPTEE_PRIVATE_H*/

base-commit: 827751b699b79a6e569983359c02dce67f81b94c
-- 
2.43.0

