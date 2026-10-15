Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010053.outbound.protection.outlook.com [52.101.69.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEACF52B1E1;
	Thu, 15 Oct 2026 13:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070927; cv=fail; b=jzhVboZZXESH34T9MszvNeBXhCIkmsQ8wvos/IYkgRMHAtoCtnkrv4Ql4T8jx8ROkVmUwEmyrWPEhige5dEKw9lz0jcrkyCrql1bJmmveRLXtX4py726hZAorROSSaUj5hcnhmtiAfQkJ4E0FyEXDrzOWn3Lr9jjUovyqjjgZ/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070927; c=relaxed/simple;
	bh=SDL3D2h+d4wUsO+c/WhdZN99J9pNCfK9U9uhsAuGQmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Re9P4HeaU3KZUrkAxcCQ3YtH2sIzbX0AP8c9cxecMq+XX+YciPCgbl2J777zk3/FFR/NShgs+JAHnc7u1/01dOg5qq1yrn/W3wKJL1as0e56GwI7zuGcjbyBw9ndjnCpRE+MaOeEr3V7UlHJCPOiT9haTenl9g0Ly0ZH1fZtG9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h9C/rfZW; arc=fail smtp.client-ip=52.101.69.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h9C/rfZW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOhIt/zNTxGMAq+M0HNstCa2KE/oEy8jvLQ7I0CaC+rFUadiCahuHX8hrMCsy1f1sg82xsfGZVDckocTkTyy0+m05VGIDkutDbpg5s1Y6NQXXCCeSmgm8gJUcPOvaqjYw7Edso9rVt6JK4KaUhXFfdT9RABiLpMjkALWYvbYxMKaOZnp2X08HZEwYG1bNm49pjkf9nSHyAvt0JtiT29mXlfh51TtIvYBArh+IqNNXdu/ddBW/xR87o3s2rwpFjZnRg7U30Sd0Js5VDkGiJi4TnV+UeqT9JY2SR2xteYcVlBUHABESuiqY8decx2mYU29kMmS1nSB+/pdB40johtmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDL3D2h+d4wUsO+c/WhdZN99J9pNCfK9U9uhsAuGQmE=;
 b=FE7dbjNushAPepfcOpW+tYojkwXCauwGIp5FjU3e2C+Mh/ovCR8isGkp1FQFaWTNa4iqrLa9JKL0oBIESvFf8xg/63k8EgylwZ8nf6OTIgmalaFfeCqJwoCeolG2nxWP0agpiY5Z/cqZhGE8KnrFaghulTcdfKwMOAT6go21vaIA76lGAZz8hEw3CQRI66F56ifHiY+o+G/mOZ+dZge0lOjubAhV9Be8vKPgexruHKl3WCGUnK5fNNxqVojHukNP7bmwalOG2d5js8DNKoath6P3vyoJXGS9eRi+heAlIK996s7+8C1dg0fS8TH/sT8qubn+tmSTBXLOwsMBNVgZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDL3D2h+d4wUsO+c/WhdZN99J9pNCfK9U9uhsAuGQmE=;
 b=h9C/rfZWmVq6yxz9OQng7DQ+8Fo24g2lBMnulzNvtzM5KrAd+PCRwI+E6Qj1uzgX8+2JJSvaMY25ycAxfUdkWrC6vUZUKYGOt/N/tFRObaYvx8ga5d5khftjZfRUwNL7rScsFRHWIjtIczuACL7Y+YQl2QgjzWtPL1bP4+riarMlESCc1hl8YHetWacQLDVn6eZILsvh2KEjG4BKuZUI4X07sQYH6wW6QsKRGcv8sZQqgif5gd1UYa10bX2EsA2bI/nYn48UIFSQO7nxBAczEyAsthRwny74gSoYE2sc37avRU94YYNdcZRsosgY3jwtiy/u1qCQkJ0L6caoUHSv6g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBBPR04MB8057.eurprd04.prod.outlook.com (2603:10a6:10:1f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 13:28:37 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 13:28:37 +0000
Date: Thu, 15 Oct 2026 21:33:13 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag
 on i2c3 GPIOs
Message-ID: <atDWGbi62U8sISS2@shlinux89>
References: <20261015081149.5919-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015081149.5919-1-stefano.r@variscite.com>
X-ClientProxiedBy: MA5P287CA0054.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DBBPR04MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: 2764cdd7-951c-4c45-f416-08df2ac037ec
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|19092799006|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 dVcunn1Z4Z5fZGa5qcUQ0cyhDd8Y+djB5QIRzniYfKQPxKSthdrizOvmBUT3aXNR0yYRuv1nEhqywSAuyVsHkc5/7ypWCzAXaoSbLqOrlZQeihmpiSzo7dEtd/F0Gz1beive/hHSK+EJJ8+nhjxT4QUHPmE0xifCseURDaUVisHDvEyOaDPHC5dwi2AY6guDQkH6FBHpVw3UaprINvoxzlh0LU+0SJFRc1FOHkNO0KQiHXxUZqL4A2feSbn0N/PdoaOvfvYI12p5ECaV8UGdnAUSyeFH6Ahrlu4pSIHrQOZxu8k9y8UeFU15vJywXl/OR6CZ778onqztjCmpe5vyQmhggT5FnY72GVd3Y8Y0BD3NjvH68ardt+qig9lzKGYnukp9l2geJtDkjL7EF7S1MYRqFiEqI3Weyc33MGCZmlTaqG0YI7A3HBvDIAFtSZ4Jy7qx0egKqSqDIMXUVmL709OibuBhfUQRS6OQZWIXijY9p4KCiTiztBAjmqaJqhGSsNKsny1NcswYdmvZ3apfwWHDWByjXz1ELZocQWMgUmlmyv6zjGj9KeIxvrrbT3FUU4roLjunes/5jJZAcr2g7G8tpfrltfpU7f+fSWLLaLeK1Lz8m4gWIqqrF49cmaRGB1ceJdnnOrq3jxlHrFVSMKDI+2ZheG8C60RemUH8eeQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(19092799006)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?GsL0TmOOBFqdWnWB8UyfNbanSylHglMq/HTuWsWwl+1ukpp0twdcp7nYVej+?=
 =?us-ascii?Q?EE1Xc+eok5LFh+6OLN/NN4mpyiF6W1TIJB8xWHH0D0FrNVb2FvTbdWxdL34c?=
 =?us-ascii?Q?N/qmEomed0Fr0GKDzSIxBJrkM1dVfqVtBP9MYc2UIzYodIEkPirYfU4jkTYn?=
 =?us-ascii?Q?MWkgZxK7gnN1cTbmmc9SDKmy0TuR3GlCCwhtr9s5FBdX+Cro6bqn6pBBGINf?=
 =?us-ascii?Q?jLwI/ejdTrsYvn7JP8BfO+fry3MWKhQT2h6WSwFRKbwxGf0qLETDhDBQPHEj?=
 =?us-ascii?Q?BPiNOWgRxG8NkPRIn7QjoXpezVqLv2VZfCwHhkzqxsV03OOnGFEAK7qpnQZb?=
 =?us-ascii?Q?Ra4k8RMx0wtj16VbCDTFwCBY3kgvK6hHhcxBfezhN0SlAVqCobHFPGkNHhqY?=
 =?us-ascii?Q?V9iCqyZDzNl8UEtiFvFy0NNjkVw6gnIDHkgxds1cXpeOQVPRf0e2WR9d+VrQ?=
 =?us-ascii?Q?oS6WGerOXYIL7C3jX+FEH8l9OSdopEBUIzrDzTfw8n20GAA9FsR5PXmoZnLb?=
 =?us-ascii?Q?TFPdAnwm4MH0yndibbkeYWMbTb7i0aUXG1CZ3D1MmO4VSW4qc7gb6yAtmJha?=
 =?us-ascii?Q?mzj484/q3L+kQM5I+KAGTqiIvU17yUp58Fzo1wkttGL+SgsLSlf55TloyH2b?=
 =?us-ascii?Q?w4spY4LVEMI600h6pD48q0WN6N216efYKBZSbssRgSR2Ash5LewKFn76KTPQ?=
 =?us-ascii?Q?T9T7U8AVeSo9mOXAbZLWQ8+TwUgJHpBbHOebPMvtMuse0PHPif3bEvfjmdFW?=
 =?us-ascii?Q?C2kpjPAQpImsRHGozdCUqpW042iy+ajflNAzeUkzJoJhYmN4DNX/cqieEXSh?=
 =?us-ascii?Q?hnZaL2pfL11AStZzA0JOk4Gn8k1Hd2rFJfsn0678tfDJoSPoA2FwhOHBaJLI?=
 =?us-ascii?Q?EjqVLdZEnfQXv1j456sFETJkBYuCHsCZHW/eGETDUn/g6NoBstujhxfM17aQ?=
 =?us-ascii?Q?AEUOJUclt3HiHUsSXi9G2WdsaL3sv+ebG2CBJ3SXZ8fJxdaTtT2kKutXtA0/?=
 =?us-ascii?Q?6h3ZlGzs8MqCbPPJWNxLmyZ4/lZ9mmp1xE9/i5SVTKGhrf7HVn/9XxYKcKGY?=
 =?us-ascii?Q?XxYRdQZ6H17fnlaeVq5ctQPsKe4JoZzzEPng0tWqY9iuCgASUtJnGqnVn1n4?=
 =?us-ascii?Q?xG9IUGh10Jt3dlngk8w1pTOM43X068R6cAP+ETeWA09hLgGcG0XkdYxoJVzE?=
 =?us-ascii?Q?GT9xmCcayeEuQkXFAa9fa3q0uKfoly9anjlYLGvUDcabwBja2Wgz0FYblKLS?=
 =?us-ascii?Q?o/iz/89plhNPhi/GuZQ9SP9LogvXJV58iP/aW0W62NCo4Y1atM+2FQb7F3nS?=
 =?us-ascii?Q?CMEj9GUu7RE3puK7/h/6sjaj6bqfWyAje7AwFJhLtyQxYSSkcPhAJf4R8ZCp?=
 =?us-ascii?Q?eDIgq44TmdPcTd1tvESZGNEJ/QDT9lX3c2+HdiYO4Xaib4FU9gs6xu5b8v9S?=
 =?us-ascii?Q?YRcGWbOxz0mi7ip3SFtUC999prDS9KI/d4xYphTQnPDy9K9WcbKsOSMbgER+?=
 =?us-ascii?Q?pX3KeYh4XiQjEWWhH8TIsP3M39CZ5rie60/mN1dKZqKnAYx1BGDmYih2bWA0?=
 =?us-ascii?Q?L03cVCo3ilAWXWgGruyfSkyIjgtNl10yyQpbpdyrIQnkOMHndciCVtL/T8vJ?=
 =?us-ascii?Q?SvAJ7/tot8vTETssZhYao1OpBjLAnrWcEedtvQHJIyEAKMGax7AVsgfYtbyj?=
 =?us-ascii?Q?ItwA+IrB/TEzsan848Kp3q6rWaZBxP7byoysk1L5xtEzHuS44+PROhcVsvug?=
 =?us-ascii?Q?JrndUPVLEeHLKysCmX82Sgv74sFJWT27+ALfA/YQ7UjPh/4ChgLT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2764cdd7-951c-4c45-f416-08df2ac037ec
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 13:28:37.1570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AfOCSaWRynZq85cF5PIvmCKF0gXQ2WQoGmwlEPA+4AGWVvcrfagCkRcnmazlcKBFpLPejeQzU7x30Io0Lzpi0jFj/GJZcdwLaNEvrut80LTNNYVRiV+namUXUMUieip9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8057

On Thu, Oct 15, 2026 at 10:11:49AM +0200, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>scl-gpios and sda-gpios need GPIO_OPEN_DRAIN flag, otherwise the
>following run-time warning is seen:
>
>gpio-146 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file
>
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

Acked-by: Peng Fan <peng.fan@nxp.com>
