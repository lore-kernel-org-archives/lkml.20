Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013024.outbound.protection.outlook.com [40.107.159.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874144E4306;
	Wed, 30 Sep 2026 15:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780703; cv=fail; b=UDLYZ5G86vw/RC2qHDde1u7zBKL93egJ2x6SgdAmTvOUdM5roiYkVLXAx0zFouC0Ge9o6rib2q6wDlNu71Sidhp7nWKo5YSJzeWXFGwJV9se3/4ZV3JbFnOdQpUq+bjOyvgn2N7MkFHefOVkC3hLUg8VsIf34A12AG9j/wx2w2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780703; c=relaxed/simple;
	bh=E1tJ8Gk2SEpRaiiwWBpQj2NtLC65tfls3PXk/zG8l+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VZ494kb4+VJ+vWQN/A7BhaymG5EMOmFv6tqKXn1JOX1S9hFQBxLzpcoeFKROkbDTKmzqHc8KsYxdKymb9faeMIOCzqXgoXofXXpit7bvXxHfGomYdrrmtQHYEVEuJkyIe+kApoFJaOe2r4r66nJK0Cipg6xHp0AcjMfrBZIHlNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YEUSLeG8; arc=fail smtp.client-ip=40.107.159.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YEUSLeG8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3FwoYO+D5pgZjruhwfAJdXcGwuTTu5zdiJD4q+uTxB/jpiWAx+sBheY7OaEobmElAVfwyT1RaPrs2CickYJECfTl9gZLtdUz2ILcioc/oBZ6R5qzKphRwuZrPzrMF7dgjS9r3Y2DdjaFAF/Mo2QvGUHGE3o/RujrzJUJY5/9n/jHyaTPcGkIkiY6EAzedu1LiJJ7wtCcJl250G/5Og0teV9A7BXf9zDRxbz/jEf4mr/fwDuv0p1lUrNakeooTnLneEaQZ0I60KNOYvJFuYRQ4iDvu3ZBEKk9yNyRDtw8FSMrXGgjaYt9qQWVXOgXrMYfwQmYBuoYZxhfctfSi3LPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDEVZLinhUt1WrQBvsDyYVHwMFSgDX2XjmBMxTgGJek=;
 b=PbfHwZ5feRrHL+I1zlptHvuxLk6cq4hKRqrxq2cBn4uZcZ4wgkykHZaPa3++Xs75lxuBc/NrKjws8UM2E1XWLe/m9RKL6pLihWnhTY/EkC9+eGMd5F2Dm54qr+XB1ueTeGeRUvNaurNQtP20YohIIyFb5nH8Y0hIxJT6eXran3pY2Q+5D1LYZkMQsYwkXsdH8mAFU5C4JA5gcmbjujJ4fDaYgw3MKWspDfNaVfcv/ST9Z7DU3ZowLwASFi+koP98t5kC+uEV9pZhaQhcMnd4vbsByVSu6JoDpugH0jsFbULMZfMR75vaudEpFZ5cVEK3f8KLQvP9q8c5mNCXe7iOpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDEVZLinhUt1WrQBvsDyYVHwMFSgDX2XjmBMxTgGJek=;
 b=YEUSLeG88XkVQfV+GdpVoZ0pIZ/6vydR47UzYmZEIt3Hd9oFpvGgRS3Ooo8+QQaenRP0pHh/g4w3TBWhEalrygRG9GKxX2ZwmqbGLd9/shubWxXAqRfrc/oLjHgtzBRSlwue2vTl6Kox43XhFYU9ZS08XuPOIXrTGPFTsR4yq/cjbZpiTn2XiUkmcfCwaFIV+m5yAUpdS3KdEU12Azxb8EAzRubNVeu229GsUYJrVSfrFl+vBU+uQcpklxuGsVgwUtmIRmBuwHPkPDHnsfbd/H6Kz+qcu8YM7yGgb0v5HEdT9GRassTVtrdRcijegLLgb4Hx2yaPbFRHAsnpQikjlg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7872.eurprd04.prod.outlook.com (2603:10a6:102:ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 15:04:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 15:04:49 +0000
From: Frank.Li@oss.nxp.com
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 0/3] ARM: dts: imx: cleanup st,stmpe touch screen related CHECK_DTB warings
Date: Wed, 30 Sep 2026 11:04:41 -0400
Message-ID: <179078059675.554251.15674488334332958827.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831-dts-stmpe-v2-0-f93d5f080443@nxp.com>
References: <20260831-dts-stmpe-v2-0-f93d5f080443@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8PR12CA0044.namprd12.prod.outlook.com
 (2603:10b6:930:49::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b06174-e100-4d48-87b1-08df1f042bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|19092799006|23010399003|22082099003|18002099003|921020|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	6kFn33w5YgMyv6Ydi64JJcPpkFwSXVspDtLoCNPFrzbYAmsZiJ00V+WGhQn5mGEBjm+uSZ4jUM84vvKEsJwEIUvYm9PxMmUIKp+S1QwkKv/xzvANs7MfaUxRqYzxvRfsJaKPhxrVLhjb0Lz7AAp7KWsOsXpJz/l6pFJ/gqFhXCnklispJOzv+N/X7c1gWo3sEN0gMehGIuKczzK9ZWEUHK/ohS49kw/Hoz88LyNtO3TdI3ZC0n4pmJ1QpsnD12SHXcXAHQzHKYEWugL5LW/oBozjXleQWZDkRIai5YJ41ivmEu4Ly077gDKuNPDOWP7R3zD+fYLCa18nz+EVT+xnyIDz+n9w+zX49xvdNxEr0pGh6MrsHicZ92gGod74Re1UkCoue9Ue4WihYBQmbYoMQ8K2D4JGZz+lmtUI5pPYN9I2DjbcKC0WoJ7OeENWuWoINGE1GZO0I0SYOw/4kg3O6XUhLujLXA7vQDCt2WFFTnqRrXn1WD1xYvwaF58oQ7vSMIcfpr8YFNkB+dlQ5TnJdxEwth6UjtWfeAs66NE85eK6XCDAHkfd0nWtgZC1Zb1QigWjx0knbHFBCBZ9l6QUuj+0/Y1K87bFE6qY57ARPFoCAu4+L1ijS1IaKBehqU1Bvj1tHP04sGxHQEF2FNdztgJckpKYN7cyBFl2r+kXgSxfZU1GwA8VM7c1p0H84Tf7jbNm4PnL6i0x3hH6A/GHvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(19092799006)(23010399003)(22082099003)(18002099003)(921020)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVBwa1BaN04xUGRJaVdTeVYyMnZneGM2ZlpIdE13SVB1Z0ZjVHl0dU5IRDBZ?=
 =?utf-8?B?bmFmcWlOWUdkNEMvNGh1ak5KUmJlWGJaZlA0bXpNVFFCak5Zemx4VXdueEhr?=
 =?utf-8?B?WW9PMXBGSWN3VGZwZ0lYTWtGMDNmTWNPQTVFWmF4MTRYRXFOTHJsakorOXJs?=
 =?utf-8?B?c0gzREY5ZzhOZVI4NytjMzlVdXFkbDFxU1RrbnZ1VU0rRjlLalQyaVUzd2tM?=
 =?utf-8?B?ZFkwUmpidTZoc3I0WnkwOEhuSGwxZlNFY1BGNjBIekdhMWxITTc0WU5YRGR3?=
 =?utf-8?B?UTNDMEhlQXphWnB6cWYzZ0c5NWJZVjU4dG91dEo0dTdUaGJsa2t3SUNOR05z?=
 =?utf-8?B?b05mNWl5NFoyM2dPVGg1MEdkWVBscWwzWlBpNHM5SElDbjh1TnV2UndSajYz?=
 =?utf-8?B?dm85RExBVm5DSkt4Q3RDWXZuQ3hyeUFVK0Z5L0Q3dHFsZGNXQWN2MjRxOEtZ?=
 =?utf-8?B?SEVtZ1FJZzlBY1FFWG1JWWtmMXJFQzhENnZFZEpBQXIwVTFqTHltQkx3aGlU?=
 =?utf-8?B?WlJHNFl3ek5IeVRTelBXMXduOVRtNjh2WlhWTm5remdVM1NuOXV4Z2E0T2du?=
 =?utf-8?B?L3B1THVGQW9LbklQS2I3T04rMFlDOFhIdFpGdFpWbnY5L0tyT2N2ZURzaUR1?=
 =?utf-8?B?VkN1dG0xV3lwcy9WMDBURGZMOWlZRzkxeVpXY1V6UFVFT3BXMXIyM1RTVUpQ?=
 =?utf-8?B?QWpVZnYwNVBiSGFUQTV3TEwwMkZ1WUdKWTlQdmJUVjVuTUQrWTAwZmVKRzYr?=
 =?utf-8?B?dHdjV2FQYzh2ang3VkNPMnF3dUpVcU0xSmN4Skx6ZVg2RHBWK3hIdU1UN3Vm?=
 =?utf-8?B?SzFUTGVTRExJQy90VzY0TSt2MmlCdVB1RU04VUhSdWZyb2d0YjQ0SVM2aTRt?=
 =?utf-8?B?VHJCWUJ0QkpETmxmZGIrTG4rTVRaSU94ZGlMdGt1QjFzUlhtMU5KQVR5WHph?=
 =?utf-8?B?bmlJcUljZVZxdUFJZ2VySlJLengyazZzM2xQb1hCQjY4bW5TRVJuMXFmR2tF?=
 =?utf-8?B?OTljd2hZaG56QzA0VEpEN3dVK0x1dXEyNFBZejhwMmZjeXcvK1MybXZqYkd0?=
 =?utf-8?B?b1dkS3hyMTN6dEN4UVlmL0RmSVJObnVwYi9JZkk4Wm9hdnpTbGp0cU9yTDU4?=
 =?utf-8?B?a1ZVa2tJYlpWd1JEejI1T0pIWFd5WUxiam44bTFsdzhhT3ZQUGVqTDJUOUpm?=
 =?utf-8?B?NXV5Wjg4Z2FiZVcxVzZBZU9yYWpueThLU2hPbWo3eHhXR0Y4RUVyTEZYWVdo?=
 =?utf-8?B?bGRBc05UTGc1STEzYUtjTkV4aGNUbmNwa1lGSi8xUjFVNnJuTGxDZFd3VEZE?=
 =?utf-8?B?TEtPcERtb1ZjS0NYS3RQWDFFSytrYlVOM1hmUGJmQXlFYk5EUW1zc3o0YXNM?=
 =?utf-8?B?cVg1ZnJHZW0rNzJGVnRSd3Y4WmhkVWlweCtMU3FIdkFRUGh6MkcrZDBoUnlZ?=
 =?utf-8?B?RGQyS29xU29aUmt3T0dxeXo1cnFCUFBKWnJMTTFFSzFONXJMQytuT21kcFI1?=
 =?utf-8?B?OEhRRUFiOXp0MWtkc0NHUW9QWm5qNUFTUVFQb0ZHNmVUeXVubVA3UURQeFJD?=
 =?utf-8?B?c05QQWZITHJ4aHliNDU5UnByZVZ5NFY4UGdEUHlETHE1bVpQUFYrdzVTN3VS?=
 =?utf-8?B?RWpIS3RaVk50cTZLRFovZ0oraG9FRVhrYzdJUHJJbGhlcU42VDVYQmpwMWp3?=
 =?utf-8?B?bXl3RVZxd3VMdEZBbkxSalNIU1hvc0JOK0RKSTBzV3BYRzIwbEFRcC9oZW5l?=
 =?utf-8?B?NzJjYlBlVWJyS0tDSzl1NEFSaTRXVU1wRWFYQklBTmF1NVlMWDJ6SnczMnlz?=
 =?utf-8?B?RW9rcmNSZnVra2lnNjVnNENKVEE1eXFqUFA4UjFTMDQ1c0gyMWx4Z2c3ZTZZ?=
 =?utf-8?B?KzlQRk9pTTd5QzlQMmJRY2ZKUmFoMzFpRWNiVkt0WE02Y1VCTGtHZ2hTTXZL?=
 =?utf-8?B?cVBNVllSeGZuT0tyRno1cElCdG9zUU9odU9yNmgrWlo5YTRiZUR2VjlrQjV5?=
 =?utf-8?B?VUFGOWRoUUFORjV4Qm1ydm50NXNaMjFNVGJJSVYwOXNSUmRUV2ZpSzF1LzJ0?=
 =?utf-8?B?dmF6Y0ZmV1EzYklmTEtiNVZVQ3F4dDhSRGVXZGtkMC9IdXdBWGdycWhiUmc3?=
 =?utf-8?B?VjY3NnhvT2JkeDNDN1hUdkNCbktlR3JrYWNTNGtwSW1sUHk1NHMrdCt5TFZs?=
 =?utf-8?B?ZUo3SWo3UkZkaDFodytsUmxKMlNadTFlNlUyeXdjTEJoVjlMbXl4L3prQyth?=
 =?utf-8?B?M0ljY2VyUHVpYzl0Q05jQXo0QzN1K0FZZldFTlFkTElIKzZVL0JiOUdtcVNS?=
 =?utf-8?B?VS9vWlRha3hFclpnZUpTNmRaZXo5TE1sQTArMFZZZDFIdy9CNENSdUZENGhP?=
 =?utf-8?Q?iyCv4Pa/QLGuWD6E=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b06174-e100-4d48-87b1-08df1f042bd9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 15:04:48.9300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZ9GqTQLDOVXk5TmrDtaSwkYe7596B9naJXPeSDniygTqgXC5g+1D1vpbuXGGw/qaTnNXex7hVQWcky/lCakTT4Eisgx3hn532Z1YqHdTV0pUiEaV7EdCPmycVFUuLei
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7872

From: Frank Li <Frank.Li@nxp.com>


On Mon, 31 Aug 2026 14:50:17 -0400, Frank.Li@oss.nxp.com wrote:
> cleanup st,stmpe touch screen related CHECK_DTB warings.

Applied, thanks!

[1/3] dt-bindings: mfd: st,stmpe: add deprecated properties
      commit: 0d120c9ab1ec657da76d7446fa9b91ff3ec46b88
[2/3] dt-bindings: mfd: st,stmpe: let interrupt property optional
      commit: 0e9d73e4fe6f61c1a741633b102886467b1ed388

Above two patches missed at v7.3. I picked up.

Lee Jones:
	If you have concern, let me know.

[3/3] ARM: dts: imx: remove undocument properties of st,stmpe*
      commit: f05cb3d259d3fb9f811cb9b14591ab08e9e7a182

Best regards,
--
Frank Li <Frank.Li@nxp.com>
