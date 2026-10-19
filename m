Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012059.outbound.protection.outlook.com [52.103.66.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9D248F85A;
	Mon, 19 Oct 2026 07:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396247; cv=fail; b=l3nskq5BLZIkj9uly29gGP1qXDbt0AkfYmp15RMpM6GtuW9/Y5Aiip00xZ/ZNfIw/d69yjw7PbgfFvBTEcaEaazXTz31P4wnh8u3qLBcdfXQtig19eAZ68zWYfYkY/IcjbM8SFGgdm1Wq+7Yhwk7TTfWksNnsM6PpcJNfuw2EqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396247; c=relaxed/simple;
	bh=ah93Z0qSBYbzvN/mWAg0MCCtZyhF4hh83BeXIzCzWc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S/yYrOnz33y+xaCqOnJ3eu7n08v9nT8AYYIed8CBmyclmPtzibFCUPdFRuz13GkT4mplqCN1aAhkeWbY+SP8ZFXmvT/SdP7IdO37KY7Gtqc8cVfUD0dwBSGHfpxUzpvIQNeRXal/dDnKEPh+WiOCqXm0ReM4i1ifgIJkotuRJkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in; spf=pass smtp.mailfrom=outlook.in; dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b=DHz8LKD9; arc=fail smtp.client-ip=52.103.66.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b="DHz8LKD9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cO+T1lxp5IIbXx8ilLyfyhj44JCDw9QOBBgdalNlqsig4GHDl/Vs7ND0F0Bhx/YNJuSCKC+qAXEqR/BTAJNHJ6GZiHnRPLlTmC+BznLW35XpuTMJTrjW8Th8CcAdArqp5Jsn8mWgft5ST2Gk2y/em27ZSMKc/sg/z6T/Mu89h63x16XOBLht3TPfpC1rgxA33RZun447DBHIAn1VryYKCqa0ATkZItRdNeoG7wF7fCpDMYn4E1GatkAoCQpUq/GdC/e/AwAnv/edeQhZIJiMa5jMWQvnZwWU+8sJ/aij53N+igbmMX4esXCJNFxJgPwpFusep4BCssDktrXhZWyf5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ah93Z0qSBYbzvN/mWAg0MCCtZyhF4hh83BeXIzCzWc4=;
 b=B+IAA55o3JtUj5liiogrVpmrcnZSKeZjkEj1x0OU781wcseYzZtm2w3TdtmelNlOXeOc877jjvAGJ+6mHnEUaA4HDdIXQh5QU9YpM5d2x0RKSMFZ816LMikqEsB7LRgFZK4TbdFNr6l8HK+uj9wekCY+Oa/ulW3nwJXHPnl32UNaAWEmyhE7zamLD4GPj4tRt+Kvt9n/urECjnSmfo9V+xi2GLGuaT7ybCBWJWn/K75BCU2RK5CHPzZb7JsrUqUjNMfUmVji6rBMLCUCXWr4Zh57SrubpTNCCLD7jC7bc76T4VVvbbobMRmpfWPoczZdegjaNX/0fJ9lTTCLfPu0UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IN;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ah93Z0qSBYbzvN/mWAg0MCCtZyhF4hh83BeXIzCzWc4=;
 b=DHz8LKD95NER8q6s93w/ghQ2PJ13/479DdYSP++awZbKcLRfopJUaqBEZXQ4roTgCW1Nb71xcasTP3Ge4fsL84zbvGPdq3yZEAMLwjgqFbJeDBUN4ng+lO8Qp7gyNrYoIvnGF5rGdbDxS0mF+h39Uixri33pATg8i2iL/4J96lz4LuXSFuBloTqrzj1RpOXhydK10budC36RS8x5kEr46Y2erKSXkHE0MPyg5yrnwyQdWdHgMIl1/9eiP0NDn1QqYBgjITRDvoACKVIEz0TuRiOTbBisSAQ1HeIpghWbbEaV9cpzC+UDJO7Rv85pIKkAYsKnm/cbSzgX3KbkEIzdtA==
Received: from TYSPR01MB6204.apcprd01.prod.exchangelabs.com
 (2603:1096:405:53::14) by TYSPR01MB6054.apcprd01.prod.exchangelabs.com
 (2603:1096:405:60::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 07:50:38 +0000
Received: from TYSPR01MB6204.apcprd01.prod.exchangelabs.com
 ([fe80::fb31:bf3b:597e:24e3]) by TYSPR01MB6204.apcprd01.prod.exchangelabs.com
 ([fe80::fb31:bf3b:597e:24e3%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 07:50:38 +0000
From: Shujath Mohd <shujath@outlook.in>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@somainline.org,
	martin.botka@somainline.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sdm845-sony-tama: Enable UFS host controller and PHY
Date: Mon, 19 Oct 2026 13:20:25 +0530
Message-ID:
 <TYSPR01MB6204401DDDDB12AC906BB9F7C3982@TYSPR01MB6204.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <PUZPR01MB514158F5EDA660AC85FA8D5BC3BB2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
References: <PUZPR01MB514158F5EDA660AC85FA8D5BC3BB2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0251.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::12) To TYSPR01MB6204.apcprd01.prod.exchangelabs.com
 (2603:1096:405:53::14)
X-Microsoft-Original-Message-ID: <20261019075025.12774-1-shujath@outlook.in>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR01MB6204:EE_|TYSPR01MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 38db5cf9-b576-4881-4b53-08df2db5a9e7
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|13031999006|12121999013|19110799012|25010399006|260925184616899003|8060799015|8022599003|5072599009|23021999003|15080799012|3071699003|3412199025|440099028|26104999009;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5HEVY9q0envAI2cv1QC9WgFU5u5pOfNORShlKqtGeEN/xMghx7M45GsVHFza?=
 =?us-ascii?Q?WF/tVquy9RQqiixIwWO8yX0KeAJR9LmHVPBTFnLKEpMYJK/7dy68c+ks03bp?=
 =?us-ascii?Q?KNPQtS5/l8GOeiC0GIdI2PeGwsqWx6ONVBIwUmxvOOEWwC7dxoouyzdLYzSu?=
 =?us-ascii?Q?e/nxL+9ir/ipP3h77PVpy2/S0xSd1wDjOQzT301NQLw2BKvhQ7xEcg402L9P?=
 =?us-ascii?Q?dAwwXnaMrcsxsEGvUM3foFLMoO03vvY9a14Qd+zFKcHdZMoiKOhwOU7Yz5VY?=
 =?us-ascii?Q?NROCrczzDGuRZPr5JbtdRhBwXrJrbB5BLPmPTYzs67F+tqTmIBctdbX2RZGr?=
 =?us-ascii?Q?ldMOmlx3Qr4cPo9GSIErto0IutYhrfMhhVyP6jCAkfXwqF6ASTW5LSB3lLdI?=
 =?us-ascii?Q?MZ29QMjujiDaQjLE/10sUXDFbObt7JFV4IQClHNZSog/mtRvcbzkZjaHn77C?=
 =?us-ascii?Q?jw5S6g4mtEpJ1GqX0UFimU3pnAVEvRejjmfS8Q+dlCUMN+AzCzi1Bq23ljhv?=
 =?us-ascii?Q?OH7Uml5dDa/vXAfAaS36GdVNFqoLXbmKhQ3AR+k6bqThW5oZL1KQ2z6L3hZl?=
 =?us-ascii?Q?CMoVs+x7ZZMlC8U9uvwAYjf12i/m/g9nKv5B6RZk9QCzEa+/+ZswVA/e2YS3?=
 =?us-ascii?Q?oVNZYoMW8jbgc+JVjM0bJqdOS3d8iRiozNeQ8PxqRDuBoxl9L25dg3DSqJnd?=
 =?us-ascii?Q?WxLG5lGPbUl6ciQpSuIs+pfwKi+YloqPOXzxorZx8QDYzZgy/p0BaebOWMvr?=
 =?us-ascii?Q?klGjhFKuD9qASe8BnGMQS+9GyXJq8cNQ9cdh1HK1z88mW1Jtzjp2WSMwqKpd?=
 =?us-ascii?Q?zqhop+2UQ/Wl1r9BkSPM6NTkPoBhl5YJKjUOdO2/fkSrl+2Cr5Wud0cMdhk5?=
 =?us-ascii?Q?SPthjyvpD9rUYMEsqgCeV3PdOrMggfuZY/l7/rwYIJluXkmivUrjV9Owu/Zt?=
 =?us-ascii?Q?uY5jG5dZlFAQlHH5JW8gv2Q6ZHA42XYcGXtFZswqnMwXWiSWRuyB1mfiUlvJ?=
 =?us-ascii?Q?c7u5?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XFlCvOHgamY8XsAu3+Dh+xk+fAbISFa5t5unUraBVHn1qsAXqNFmJ8GIszAs?=
 =?us-ascii?Q?ANYoXQ360Tl1XbCvFfEgUIVXc1AaMrXdcRCAbd4cF0o2wsNGu+SJRY4G6FuC?=
 =?us-ascii?Q?wMrcKUOMZNT3Okms5h+UpMQR4tb+RR0qLphwpdAnLv1t5W1ebAusyeaKxQaW?=
 =?us-ascii?Q?YJym2qs4xYweLyeuRybJcEldwzpU+b8Bwt/oo2IQ9o6A5WdsJ7ABfc2Eg1cW?=
 =?us-ascii?Q?tlDnQx+U5FaKLZezJWxtSi4L9Ibol/Zb3C6al+y350MEeyfLBEDcs2JRNOCq?=
 =?us-ascii?Q?UUnk6L9L1ITlDxVQv0SnIXgj066tmytKGXIPgknDk3XhPdQ5nNFx6GVHcgMh?=
 =?us-ascii?Q?bC+dUytdvYyBl4JORDo9cyNM1ACxTZPKILNTR9Mf4yHf5mD0beekEwEXOim3?=
 =?us-ascii?Q?Xs7vEhCSsLCAX0mt6UKr3DxQxSXHxMGvC3oJiwS6ZuO/mk8Fpv/XBjn/TetS?=
 =?us-ascii?Q?z3ys39GT/4gNrDBW0DpjY+rR2ZVX6/OwnKRRE6AXByJ9yqMWvGGZQk/c6wMc?=
 =?us-ascii?Q?E4VN/TNGA706MGpEk0g+Nh7kNSWs/BjWBjRCF2F6tPYwIkVi9xIrErxlANcP?=
 =?us-ascii?Q?6wbNBOtd6Q8oQzsT2Ay9xezwOPF3V300dkv/+ZyElT0wdbkYwCh8mQu+h4Xe?=
 =?us-ascii?Q?RP68FtjiWV1+DQIVN2KfbWv33mYUb+Ze4+2Vl/Iqtfzz1UnYHveoNVK+rECQ?=
 =?us-ascii?Q?KGA0A6lYkow579huX2WdZVkSxB+6nxVUvuwCIZyyRO6CKb0L10ZY4SDWhQXk?=
 =?us-ascii?Q?IzFw35sZuh/ErW5SJdGJbRhdHSJm3ocRrRzOupoKKK6qIqHsubldRIbYWDpa?=
 =?us-ascii?Q?ZtQxOAFuPekyZWWx1oLLczdzlUYa6l2W5Kb+49UVCHyPI8LGCAI+o9f6HcdW?=
 =?us-ascii?Q?ggf2uPaAnoukR+a9wGH4xSQtEqljuy3iV/eYtnMrBoqoqsFPzK6NCC51vOZE?=
 =?us-ascii?Q?GCHDt5SQOBnYdg7dY6IcYEGEEC6p756CiyN8as51dOfBjolmhgHaCQdPl0aQ?=
 =?us-ascii?Q?gLUBc5r7hT3v6MsiEqf715N4cz8zKJxwAykYIhaxREqpgJfAmavsloaJjGpD?=
 =?us-ascii?Q?RgqoQ0aCReIDkrKswzzAwxcXOEiUGh7kNLpVNazJdinGIGVVjUpBTKX7FELz?=
 =?us-ascii?Q?spHtsyjwn4W+82KoFCvgkNvYKqYCqS5q7TOxKapCwpoQUHlXwp7QiEF7bCLy?=
 =?us-ascii?Q?hyzj7LTFUjsctSRGIO1tJ04HXYdnB2YoddEVmIOWiK02dMo1im4HW5brhBf4?=
 =?us-ascii?Q?aykiczVTNgI15e3ry+PtbjSkMCMqPDC9gyQkttl8H69c6HJOmPaRYx2QRB0m?=
 =?us-ascii?Q?rcqSpcT5ShiWr4jj5rUVQW0KESRcxtlFxvqrdChqeGAhMZAPP+QaoVoCKqZi?=
 =?us-ascii?Q?DrRM1EQgqCsPAxH7aNzlI3J6lAQp?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-3e488.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 38db5cf9-b576-4881-4b53-08df2db5a9e7
X-MS-Exchange-CrossTenant-AuthSource: TYSPR01MB6204.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 07:50:38.2320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR01MB6054

Hi,

I wanted to follow up on this patch and check if there are any
comments or concerns.

The UFS host controller and PHY have been tested on the Xperia XZ2
(Akari), XZ2 Compact (Apollo), and XZ3 (Akatsuki) across multiple
reboots without observing any UFS data loss or corruption.

Please let me know if any changes are needed.

Thank you for your time and review.

Best regards,
Shujath
