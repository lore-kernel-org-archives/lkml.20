Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792434417;
	b=HYktW7Qb99s43VRdI8FmwKoCLOMygH5iDOO7eAfVtjEVzbxseS1Sjz04j6QQMvQxKWaD
	 lz4Sl5w67iqJ1szFyHKBXyHZ8Qsq+5kkCthZBUfB4NnVAhjnWbLhuRnO8MsPGh78W4VO3
	 vejx1jcYdCT/estBo9caZiQWcjKF48QRB004kdogw6uV7ybJW6T1XhS2dOM+jFkxLDuKa
	 YRzlAv6wYZC6wCi7tDI4XuNKCLCCVU5zqXptGXIvlQt05RPzn1FZvOzdZfC1bPuihMC2K
	 URvpLPUfgfZYhyKqd8BFL99OuY8Oc9FSSRL2meYo8ofWQUeJfM3oW7XQ6graiaKXtkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434417;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=PQFC7QVKhKkBdYiJ5jG2GZbWp2CIiVOtjgGyaZRXNx4=;
	b=JrfBodR82K5j8cg1c7rHIirOhX11sab/rP2hggxrafXA84xJ3vH61i7DmgIjAnBA5JSH
	 yHDgHCOz9nj8MsvbG9gG4MjZvvCEbK9zg3PHub9oRfrXcACuEiJiIJa+YH0EwJm3ggt4s
	 QjSK7xfFWCZ2RDyDZF0lSKMKpqlnn+RInBeykNFFy6gMysHxZhByhskBhE3xlXC3G/eBj
	 38BCMN+aB4oKLiXBXOQPidPjijEW2jVc2PvWcBT6s7qk2h9viw3BZXMtygE1wNhUdLwBS
	 HJxoWHL1K4sISBJ4eu0i8e8HQVzLxaLxOSZVtNDVMW53ZWBjmK/bqiM/+FOIZu30olw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YpgtCe5M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.41
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AE560A3821;
	Mon, 19 Oct 2026 18:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60AE560A3821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YpgtCe5M
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOIf6NDZXE2dcJxct9GBvrycq4Xhq38BWbF2BW3ucs/0sifNNeUMOtYpIAXeAcaMTYAzZv926A8rDgECeDnE+7teo+JWIJVBWn1SGZqesDmR6yYMvm7d6J6j78IVteqIq3iBs5dW3hT96tUZcfE5YA2yIekmcAVrfrR5jEq+5+K9lGBWFd8nNlUzeg0ITRuxxYNi3yfnkq1l5RXGk4U/v3pxKWatS2y/EUpTIIZWoS0CTbVKTwjwq8UZrng1kbAp02DtAVFVktvl3NNMHt0ddOGHpJluyYWcEXde2Xo3LTSrtJsFcjH/TldhJ09+rQ3yYl2Ppn2VHWKvk1GmckJtcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQFC7QVKhKkBdYiJ5jG2GZbWp2CIiVOtjgGyaZRXNx4=;
 b=pMS2oxW8ItN51ihDGDZIgUdw7oMy2v8N4okXQa/ay3OtHZSo1mNO43qDaadsEZ2/q8BnqOJ1AzsdREK0I7cfuE/qnRQeB+URPZwXFiHLj9OPGnSvDti+D7WdihwKWZTLBvOAi7nIPN8Fhok9k5kkGG3yNqjGU4sQ+yweWNiurQlFtnMVmu+ya4/XDj9vpgbkKmToDvr6PQPFNCIrMQS6U477IBkQ7vS0tkVGtp3/QlQ9EJ4HJHEXjGHZkIAS/KYh29kP6h7RFGvbabnzO1cT8IljJakQoQUyvwmR4/kLJ1swypwCktv55wBN5iUW7Wjj7dGvI9mClj9yD+MUhlSILw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQFC7QVKhKkBdYiJ5jG2GZbWp2CIiVOtjgGyaZRXNx4=;
 b=YpgtCe5MtmejUoeoZLpBIsHkinysW9SZM4vdMzX5iHzaF/GD6gN3A9jI8NvQBqfRI4G2RcaUcOvTlwpcziwTChABXmLWFUnXXr+UFcwAZrhHfujR2wQH1dIDDJKwnBrfwNyRBN3NpF1gmOyaS5ftRYwM0+B/FqzFJC41qc2L5MVzVVW1w5b6/KCn9N15nWoPYCui9OW70yGFDYSxCl1X4rF+qL2lBSybS15cnysMkx7LlUwuY7ly/+k1Sw03MTmceHndFPscVXr757NEk4xfCJvXDPNQpVIiTIOy4aqVeJFXQ3XvjbEd2V2DTvsWjg+StLg6b5fSlCfcqaYaIDn7pw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB11557.eurprd04.prod.outlook.com (2603:10a6:10:607::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Mon, 19 Oct
 2026 18:26:55 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:26:55 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:26:22 -0400
Subject: [PATCH v2 07/13] ARM: dts: imx6qdl-savageboard: remove undocument
 avic,tm097tdh02
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm_dts_cleanup2-v2-7-dcdcbe6389c1@nxp.com>
References: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
In-Reply-To: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792434379; l=1088;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=NBygXTj3eia0bX3n+VpW9iAJlz04N29DVQxsBbVEy94=;
 b=xZIXxnEVhdfytKqyb5x+Dkkm3O0AwNtHjeQJm/p9S4UjJlZaIg4BqPJ+5bMMDk6aibiP9kVG6
 1rHYAFmfsRBA9i4wPm8cQdkMXBbpDFf9htS6NMGYGdfzxb1BSsMzDeJ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS1P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:44c::6)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB11557:EE_
X-MS-Office365-Filtering-Correlation-Id: d33d1181-cac2-4532-a99d-08df2e0e8d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|7416014|23010399003|18002099003|22082099003|3023799007|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Uc0YMX1RpL63kqVSmn9Hl/1O2gD8+zFIfXvBg2NEHmG10syftL1mRJlA3yjN5arAneWPELkezini0di46WgSoXOpf+pjCBCb1c9L+9Fg6xfSMU0c0GyuD7+SIfuDKzCTvCeoVJfFZ0qmQ6I/n/LWSWvjCKQfbZ+SCCzVCzK8O9nlHRUaT2rY+6O3KE+JLR+03hafhcTpO4GXdhj8DzMxfkxJ6vcp7rJhJlA2PI3p6PCqmrjV6raY9xy3JKOY/ch1Ci9T326eE/z8zYRlxdcU+H/04cUQwv0rKifxRfDbtm/OdahTAZZMi406iDV79CCdYnfi1vgmzlVglQSGJ8ZBs23X3P7lQI7FdPn1baikuyb81yV2xP3+vJTwWQToqFkhLku/HEtx8Ro0EZkPDxJ9o9Lpq4FCcypWhsay4gLI0UqjC9t3ORYUs+8fvu4GZbJ9Q8dShSUgmr0b0BTL8Fho63szR2H20zkph0fHM62hKon8Naascq4oAlEH3RBOgzOrvk2bsQhz1o/fbLqlub5+taJak6b2Ck9CF+PZTwEqdY3dQ6buFGpQli3dX+LuW7ZMq46gjWMy7KNitIeoDFikjBvsiHIAXCPyfhie0vzZJtk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk12bFpacWRYclVWOUFvWUN5OXhKVHJRVVZQdENNNlIvUHpLLytERmxHQ3Jo?=
 =?utf-8?B?anptaG9EVW5NZ01rZFREa2l5WjJ2TUdmZkoyaGxRRTVrcTJxV3hRL3lWSWpJ?=
 =?utf-8?B?VnFBSHh5N3h3RU5mVk03WVRRcm5pTzRBQ2FGeGpSc0FrdXVsYk4yZmZTOGtE?=
 =?utf-8?B?VVFHMVVGMmMwN0ZWN3V1Qk5IaDROcXNUVm4ycDdtbUhMUXROMk11WTJhUmtM?=
 =?utf-8?B?OGdIZTdEV2MxbjVGZlRDQnNrbjkza09udW9SUDRHbHZzaTZpWVJNV2psdEdS?=
 =?utf-8?B?Ylk0OFd5NEF0bTVKazQ2bVRHN1RvbVk0V1E2TnN6eEZMbEI1bjB0SGxXZm5C?=
 =?utf-8?B?NFZWYUlqNDdObHY3L1QvUU1KRCszSkF5RlpQZ1N4RnY0VW13RW5vcmVLNnV1?=
 =?utf-8?B?R2QrVFhCSWJ6UDdBcGxyMDlqanFYQUdIRkFrZ0tlajErQWppOHhXZWdlZ09H?=
 =?utf-8?B?c3lQZDRndE14VG5pWjU5K2hTcXY2YlBaSWhrL2hjWitqd1dEY1N2eVZQQTMx?=
 =?utf-8?B?NHRla2orRzVqbzBSbi9uWSs4bGdrb1VncUlFZU8rZzZtZ3RBTTVrMTg3VWVW?=
 =?utf-8?B?N1gwRW85NkRrcHdNa1FoMXpuVGxLRmpXRmlZM1FZNlBKU3VXMlhkZWFDcmc5?=
 =?utf-8?B?UmJPNTRFRk9UV1JteU0vUUlpSFViYmxYNmlPbWhiTitaK3dOL2FJamdnYi9l?=
 =?utf-8?B?eGxuaFQ5aUZWQmowZzNsZzRmN1RnWW1jdHJBbU51V05pdEJ6SzMzNTZyWHFx?=
 =?utf-8?B?U1NLVTZNaG9KckQvMmk3RWJMQ2hMRks1VHZpQUVQd1E0M0FaUi9aUGRlcjdY?=
 =?utf-8?B?cFZ5aGVVblkyc0tLSG5jVTBaWlh6UkJwemxWb3ZIcHNKU2hyanZVcEsrMmVH?=
 =?utf-8?B?cDRqM3NpQ1JadHNpRDdXdnNQQVdoNitxVzdYeVFKN1FTM05jUExZeTZib0V1?=
 =?utf-8?B?ZXgvUG93b2l2V2kzMmZiV1NNNnJyNUFNNlIxanJBZVFNaUdkdEh6VEIzY2lr?=
 =?utf-8?B?amVpWGh5bGFYc2NDaGhFdVk1cHJzdkpsQ29PYzhERktzZW9rT1d0eFc0VzJi?=
 =?utf-8?B?NUZvUHp2blFNWmhsRFhaTUJIK0szUUxVRXFpVFA2SjJSZGY5T1lXZ2o0VUtk?=
 =?utf-8?B?MlMzV3M4SVBXbG5YQzEzSEo3eFB4TXpDRnhOaExlc3ZvanVraTB6TkUraVdD?=
 =?utf-8?B?c2VxV1poUEQ2WDhEaGRZUmNLYlpVbUcxa3VUMXl5dWhRZjJrMCtDWkJLbnNE?=
 =?utf-8?B?VmQxZmNVMmdxVldzWnZVdjVDbURpT0o3R1NHWXlNZW1kSDhFWWx6T2YrczZQ?=
 =?utf-8?B?bXNuYUxWeTd6ZlAvZU1QQURtbFRyUFI3bXpPZmtFTlU0OE55MkZNL1JFbG80?=
 =?utf-8?B?TlhYS1YvWXBWMEE4cEpuRUtaMHNrMXVpTnVJOGdOdlhYMkpKc3B5WnVZcXZq?=
 =?utf-8?B?Y3VUd3JKb045MEpNdXg1M2x1d3k5Tk1xSllpYmtzNXhnT0N3ZE1kdUwvSHhp?=
 =?utf-8?B?STU3N1ZQc2pneGFWc1REVlpDd1hTWG9KeGFoWnBMWmovZGJJS3lScGxVWUNV?=
 =?utf-8?B?SkZ5OXpZeHNtOWt1MlpETHphNGkxK3pRTEVtY2xsZEUwd0QvT256dWMzdEda?=
 =?utf-8?B?WlYxZHVhMS9ES3BHU2ZLV3ZwcU5XYXpJdG1WZ3JGWnN5SG40UW5vSWZWN3ZH?=
 =?utf-8?B?Ym94YVNkaGo3REg0UXRTZjJZUlZueklYSU9Gd1RnNmNLSmlHYkh5RDFWNmJZ?=
 =?utf-8?B?bTlYaU9SODhGWjRtTGRCK3J6Y2FzWkFyZzV3QTZDMTBlem1sck1xMHQrZDdU?=
 =?utf-8?B?MnZuOWFpbWZWWWNCQTlqVHlhRlVWR1V0KzQxczVJNEwyOTVlRWdJTGV1Vnky?=
 =?utf-8?B?L3o5bjVqWmNCVmNJMnlpOWhnUHlpTnV0S2pGV2R2K1JaZW9uT1Q5eC9HSjBx?=
 =?utf-8?B?bEVNNUd6WDc0ZHBPN2szNFJVUU14SUlyb3ZqUTRwOFZaK2NIaGtkZ3AxT05T?=
 =?utf-8?B?UWQwZ09Sc1d1RmRQby9oSTNZMjNBU0NhU0taUnhhdmZ0VE1IVTgzUWx4d2Qy?=
 =?utf-8?B?MEVSSFprb1IycG1Edmd5STY1YWQ3cHNEU2FQeHVyc1ZvbzZMYi90bGlDdWs3?=
 =?utf-8?B?dlZaRGRmamt1KzlMYUZhUmVkTTZlSElteTQwdGtYQzFWWWJzemFVaTFZT2l2?=
 =?utf-8?B?eGtBN1Fhc3pKKzJiL3VvTnlKQ0tJTGVtVWxTQk00emVSTjdoVGJ4ek4vdkRY?=
 =?utf-8?B?YlVBOXkzd2dIVFh4YU05UmVvdlhMZ3Z0M0NqNjNNNjF1QmNqV0QrS0tNVzJW?=
 =?utf-8?B?eTZrTHNTelRVUitEUVJZYlV2T09iaWd6c3JQZVRGcjlxWkNQQkNMN0d1Zy9n?=
 =?utf-8?Q?EQOgzqeSiodFDqtz/fST9pcea7aJZHo4gdc/W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d33d1181-cac2-4532-a99d-08df2e0e8d7f
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:26:55.0028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPDqVf9YFjB9VyYmvE85GpTtxLezIjd17cIgZac79CcbdQLU1EcrW4U79+g+GYyHoy20ssqHs0zWu6nK9/dD330Mi5LNDgavZwOuERKcK38vEmuo0ORPTSJTGLnwisLI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11557

From: Frank Li <Frank.Li@nxp.com>

Remove undocument avic,tm097tdh02 compatible string, which is not supported
by simple-panel driver. Use fallback compatible string hannstar,hsd100pxn1.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6dl-savageboard.dtb: panel (avic,tm097tdh02): compatible: ['avic,tm097tdh02', 'hannstar,hsd100pxn1'] is too long
        from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-savageboard.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-savageboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-savageboard.dtsi
index 2daf2b6af8849..8b476b39aaaf3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-savageboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-savageboard.dtsi
@@ -67,7 +67,7 @@ key-power {
 	};
 
 	panel {
-		compatible = "avic,tm097tdh02", "hannstar,hsd100pxn1";
+		compatible = "hannstar,hsd100pxn1";
 		backlight = <&panel_bl>;
 		power-supply = <&reg_3p3v>;
 

-- 
2.43.0

