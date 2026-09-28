Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020087.outbound.protection.outlook.com [52.101.225.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B18D40926C;
	Mon, 28 Sep 2026 10:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590930; cv=fail; b=Ma8xnLnta0rYClEpnlfrOXntfi17mwrSJ99594U4BuXUBS5yBT/asLfS2rvFj7ibYXgON7cYCjsA+09hv8lM/rZbHlra+6vZUWKo7s5CgPeeIxUff++KNc/48GZkGjcyzYJU2yvELJKuoHA9bRMHbOpMWPnWLcdQZSxxIHDyQyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590930; c=relaxed/simple;
	bh=wmhPl2omB6Lir8S4Kh2W24VZi2qkNDueJ/TloZAZCJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LyDK1ibA9RqpqXiZoQwvdy02OQ7WycPYlpudxe0IANEG2ycsuy6Pd72MBT7yC652oVVbwclw7RTTMi1MdhVuCFmHitkwRh/fkuutqDeJkS2kg3LbYdyCySeoqo0E8skWTID+TJJYLY3HajWpuvrqnAosFv7kna7nelHlj7E0yqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmrqtZ0hhUwAQ+Wq0Z2dm6PFNV5FhC9KhL3Zqw1e9JQ4YuHDsGv2kNsoayVgwiEcaJQ7pswaXW0+0VWD4WyQE9CEvSSRz/nZsS0By62KkmUhBOyFlGZjONfDw2mKLV8e+NxkGWtEbB0BjcxeI+7Xoe2iLS454p7v2TL+a6XtvIJpzb7wYcFIljzVhyF9WyRDsTGXMB5WldklKfIsn1KrdqNawwTP1+Hlo+wHxa7KLMD1CGlNLwSMHlBsjjSOuRlV0TSl2a16Hp/ABCXUcPTjKmIIGF0RmgKtZDag2S0/5gGoo06M/esQpzKI5qpIDKJ7zX2Svf/UuUvgdj1RE2/VbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5FEfNHSC6zmI4hApqy6M6dr9052ft+v4LlvMTtlNkA=;
 b=eQ3XZ0R+C7ov0AHlew6bWFYBTX5PcnLQkB9EtX6yPgu8w+H/0o2w3ysuT/mmFelQOATRRzNPigqYsUgDSjZ0K6BpuyYYRvQ+aZlZic64zAmTL24mBIb9CXO6XpSbRHqlGDL+0TLDmyT5+VYTqhHZh7VCnvB04xpW7SaUS3kwvaLSYfFW847EXpPXAOW9HdpUlCUP3mX9Arn9P9lUyE8aSiBePGLEo33B4rWK8nukPiYyMzVi5gwrpJxXIEbfLutcXW8nY2rB9gx8WRcW20tXNR5pTvUCBcYkA9XiM0pA/P13Wrivquxta0D3UaVK3y2iz7ERshuj2hDxlSORP6rB7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB5196.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:22:04 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 10:22:04 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com
Subject: Re: [PATCH v3 3/5] media: qcom: camss: vfe: Fix VFE reset while another line is streaming
Date: Mon, 28 Sep 2026 15:51:54 +0530
Message-ID: <20260928102154.529821-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cd778fa5-6382-4378-af18-1e19cf0d6c9b@kernel.org>
References: <cd778fa5-6382-4378-af18-1e19cf0d6c9b@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::13) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: 199ab7d1-5967-49b2-b78d-08df1d4a572a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|23010399003|10070799003|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LGoNgWicTC5suyq+3ou1PBnk+mwFgDa1qrN2wJYCut04IdhpflyTOsp6FWqY/RzmL3V5FXZld8HpPoF50xWbLnCGcS4d7BS71Y9HHcn05Z1cPmUt7mI7fH8h2UHAuQ1n3TKby4We3EunSvI2QCUl0ZhOSYJjCT419uyU3XUnm3Y2QptDwsoMG5kNNNbeqCCfC7SVlvlcHqSsYHIuChBcNjvcN4M2FxdHVuIm/JHPgb+fHON3styqzRPWh+73B1h0pldb2ULeMXKT4XLn+6o2A/K2U25e69W2P2j6PyFr1ebDD/06XAMurFOx+7TUBUaVV5D3ioWfzOnkJam9lEqAyiGIYwmVlYP/477FbejM4bOSk8t0vM+K/iW6HuXstC5XqZWg7LWMEKysU+WZxLmqyF2WNBtnDwTBXFaWjYWEiRTVshmtPuUhCIAwi20G8E3rtsZN3JK74OZ/ywjPxNmZAX3m6Y4WITjRDJOO1h1hP07m1s78zL2F5sORgMcQhVyunWfHesjDw7/Mi2fnxtBl92DT3xJJzcbPhd376FHY9q8vFD0gi28ElHrHqcAojU7eyYu38+gGNA3Xd230Bc7Avp87rNNKUQQqnplKl1ifBIsLpemAFtBSVLEmcd3yG50avL2CpFhUa2YKdfJIvt6rmJ8C2hCGeqDb0o/d49+Rd38=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(23010399003)(10070799003)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NJNH5HWCSZrk1xugTkMf0nVa+gABGGvFiNNcMHZhpXSWqWBbHEHe3GQr8HKv?=
 =?us-ascii?Q?fbyoVvVSEcYrz2l/Nn0UtEolv1pLCLvIfLfIVJgDEgzFsRT40gMTsQzyjNsf?=
 =?us-ascii?Q?ONxc9lFAmMCWkh296I4A4tTMhCKLqqXI++RxewKVfO9ZCeXJn1kOy07CkJHi?=
 =?us-ascii?Q?bpiRMHwUjRo6Eh1OTXbSgrNL+ERcJ0tMJSEHLKJu2apSi6Imx6JbvrVjShEB?=
 =?us-ascii?Q?BLjWkrdQiAgbTX7gCvHE/bmsOaTMDd4vADQk82YEMsb3qtimUi9X2WAd/cEe?=
 =?us-ascii?Q?QBVCS9Nwi91qIa8hq7UpxEwRDGTDLMZv+fJdd5sEMHUZZx/LlWSEM7TYN5iO?=
 =?us-ascii?Q?GF8wiANqrt/fCd+Q/HK2yXqoWjzQCeRjMV0LFB4fVb99v8xoLNdvp5X8aeCt?=
 =?us-ascii?Q?VjCxX/l1A5kr9ldDpnV9autK+fX1G4g+FfB9aLWACyheQw5s0HlzfOybRyQR?=
 =?us-ascii?Q?QYZHqJaRUCAu/BmW5PJQ3vQjcIrGNkdM5jWhkmSfiDJkhYbXmve2o/X0gCzn?=
 =?us-ascii?Q?UysybcjdE4nucxq93Np3E3yKqVIV2kcjOAr+lD8n3T/7fYvULTvRD5o9a/67?=
 =?us-ascii?Q?RZLQARUmGTPZpomerApYt4Iz5NfPaqgKbl9yREMB5Xhjpe9dbriv9Ywi4mbH?=
 =?us-ascii?Q?MZvfa0pYscO7pIHf4YRJfUqoiyTTFZd7ImX/QWHslMbahF3RZ4+KUzmtiI3z?=
 =?us-ascii?Q?3QxftMTy/bzZd5S04b5hqi8b9mOUcV0ojhlVIwlGbBpS+GAkjSfrSKAXU1Yi?=
 =?us-ascii?Q?mNC1MCSaS9Lt3jnQCcPrLqjxVrYhGZKRjtJmDrobK9R3pSm/N6q8FxGO68NZ?=
 =?us-ascii?Q?IvrM5STqVqA/x+GUAn09YTuBvPCkXUNZrTCiLUGQx6BfFuw81YOb2FTiJMyd?=
 =?us-ascii?Q?VD45bMrQs3msuwCh03bz6hN+fjKftCdq5XITiQ3Mak6bqXaD6ndwki1NVRD7?=
 =?us-ascii?Q?O6xCRDZIjTlGmiIeHeOO8uoHAtIfCt5lSP3r1Zef/R8dV1c+gF/DOjojEa1Q?=
 =?us-ascii?Q?/tPn8LrUz1UrrwlaT6mb3lw5DjxdXhz2a0Ml/g8QDMunY+OWFOGnhcc46nnU?=
 =?us-ascii?Q?PlLE57vAZZJlPMe1oSco4HCpEvBAuylZKFUWy+RjRpsgxyXBg1/0XDhoYrMO?=
 =?us-ascii?Q?PNs5gtJCHON34VqSOj4rtYaPXRH4hhncNU79HR7rhnqHXtdbKyVwlUGGgoYP?=
 =?us-ascii?Q?jPOYLkynFrEqbO8xSCrP0bQ5ACdOfM4zKtYRdwGLdQLflG6FMwFuxybO7iC+?=
 =?us-ascii?Q?PPCRd/JEiUgJw/oIDUW2Pf4GBVhlboEZSnO4tF5V9hUiWcpu3jihQndO28fC?=
 =?us-ascii?Q?zes9d7N7ptoShR+70gRAgplsk/yIgKY4nxK/8YHmVqAD4wy/lzsXaCJtylYc?=
 =?us-ascii?Q?0VepmXTGUYM0gknnahOny5CFnjQmcAAJUVE6MzNZqMIaklUiZMrCpNy0nw0+?=
 =?us-ascii?Q?Ovte3BOpqFgcB927/B+/MnAusBbyFAkZDO+YQ5jstQoa4BiixhH92K8N96Tw?=
 =?us-ascii?Q?n58GEV8RyAeL4foYr6UjReSrIrmTFMoUHWoYTp85k7if+aBqHDygiR9CCfw9?=
 =?us-ascii?Q?6gKqac6aej+iNCyzgaxOcDnNwLV1n9wtbcNyE1QFEnwFxn+BWAkaiablpsPb?=
 =?us-ascii?Q?GANCr4v3eAtTU+3TyWPOZj2M1C4fovsGp4Zy74N4c9wn0H0fh8ydjrZxJLQq?=
 =?us-ascii?Q?yz7jRF0H8Y7iUdwp5oCFd4mq2sWXQy76bYhyuoQEjJU2K17DanK6ZeCvPPsR?=
 =?us-ascii?Q?L7ngIXYn7q/fetiHEZ1DIs3CsRy8l4PuIEyQi2hkN9wYzsLA+hmPC3ToyqbG?=
X-MS-Exchange-AntiSpam-MessageData-1: g2tkiPaB6QTkkg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 199ab7d1-5967-49b2-b78d-08df1d4a572a
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:22:04.0168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +uUBnBqJ+o63WzeuyGhnP2nUbtqp1hhqmwrK9kbLyKDAWnQRc4VrnDl6ffVhCKmU8YRTeIXICUUVlguYvdr9EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5196

On 28/09/2026 10:49, Bryan O'Donoghue wrote:
> NAK.
>
> This can't be correct, in fact its very racy and will break.

You are right, thanks for spelling out the interleaving. Sampling
stream_count before the decrement, and outside the lock that protects
it, lets both callers conclude they are not the last one and the reset
is then never done.

I have taken your diff as is for v4: vfe_disable_output() only stops the
write masters, and vfe_disable() does

	if (--vfe->stream_count == 0)
		ret = vfe_reset(vfe);

inside stream_lock. Keeping the reset under the lock also closes a
second window I had left open, since vfe_enable_v2() increments
stream_count under the same lock and then configures the output after
releasing it, so a line could have started coming up while the reset
ran.

Retested on the RB3 Gen2 with both cameras aggregated as VC0 and VC1 on
one CSIPHY, so that CSID0 feeds RDI0 and RDI1 of the same VFE: the two
stream concurrently (60/60 frames each) and VC1 restarts five times out
of five while VC0 keeps streaming, 200 frames without a gap and no
"VFE reset timeout".

v4 sent as a new thread.

Thanks,
Hitesh
