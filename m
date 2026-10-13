Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3D12749C1;
	Tue, 13 Oct 2026 05:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870552; cv=fail; b=R7Uw/OBe+pGe2MtYf2sBGYBwyAWJ4SKKZE/d9wG1qbS4P/G4vFSXLEzkoaSkVkKGCyqEPauc/Ky7JkA/bh5g0z8FR5nDiegJJgYPSMPcdazeLKPSpAvo2GP/kZW7uspyzRavwM7ERmen5Ww5XZKdQ9BLCY8rvt/pLYS3vsYRqy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870552; c=relaxed/simple;
	bh=+TXbFF7LkuN4AligB9eRr5ugTeLTexDCqyEj89Hd2uo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IReBLwFQE9RP0gXBm3mAVyYYpPc/5P5SfO24//u7w6KHnHidSdzd79LqJlg3tJDax+RJVRd+gNGgjjidoFXRR3g2HqFwf/EifuUH2vEGeZF0xVyc/V/ZyomnA0278puMzf9tm6X9J4N2tYLci3mbOH6QeXQQzH0vb7pfv7xj+og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mCzKcaJD; arc=fail smtp.client-ip=52.101.229.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mCzKcaJD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3AEQ8EBGl5MHr9tMn23v+AlTCa9Qt9pfLiAZaAyMz5QC5GklVTrTuRTFuNlstI18q5WyebgeE4PGflyQlngDOInkAHeAAb5Y9wByD9vBjeZBgX+mv3qLIFV7vyeS+c/6BQQJZn6sW1cldfAt2eV8oO0Blvq0H9lVIQYByw9kHTlWjUee1vcqFewR/WhCUJn6/sikLx09P47MdUaIB3yoYbRJxNTiqAgfFSA6q5RxNXDZXryE25UaS+aF+JrqB+xBzWm5GPHPulUAzr7blwCGcB7VldQjQKMrDz3xfi19+7BV64Oj6Fz6pwhq+gYn30YfKJ16WpPb/ijJtQt71fOOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mp4kNcT6sN/DhX0KQ0u7QvOx+wAFjqgfJsq0MdX8UbM=;
 b=vwg+fWk+NE6Wmd3FfEspwo0lEA08RR4Dyy6jBwHFdltZnh4/lPDwXFiecIP/pQB+182/yBGdD0A8vwgrIvh+fodtx/yZ1QyiO1UPIZZNTBxu5SboC3f8jFUOa1SUK27btdZeYlR5HBZxiwwfOryE7Xdb3ih57FCdcL/+oULAKh2LhH5kdfo04uJMjAl+Eoispz1QVlSn8VP8FlF8Mz5aNOzfuiIukQJG2xCavCzLxUo839rAcYA5xvf4v5PC3bFe4Au/DyOzbIkjDopYVw8+e4q1P4LPWeQhQWX+gsrY/JJrpte8nLsCeSOj1nUKayFGw90akOGwiwyT5AbIruVFHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mp4kNcT6sN/DhX0KQ0u7QvOx+wAFjqgfJsq0MdX8UbM=;
 b=mCzKcaJDdA5ghKzb5aCUugmgbS7ssjCsIKXm8KwhikE4uD6bovMlh7V+ywYahYp1utUJ64t6aj7nwQeWjgzVVdLM1bCk7f+1AP2a2xrUqRbrxJIfSFmIvt8iqGW+QK5QjzHcgy/cj/Mb3y/PW5CeBTEy8EP9XBa5tryrLx7DbSM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by TYCPR01MB18295.jpnprd01.prod.outlook.com
 (2603:1096:405:3f3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 05:49:07 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 05:49:07 +0000
Message-ID: <87se2aw3ot.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being skipped on rollback
In-Reply-To: <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
	<20261008103831.542533-22-phucduc.bui@gmail.com>
	<87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
	<CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 13 Oct 2026 05:49:06 +0000
X-ClientProxiedBy: TY4P301CA0113.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::13) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|TYCPR01MB18295:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6a0406-453c-49a8-92e9-08df28edb256
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|23010399003|38350700014|4143699003|11063799006|56012099006|22082099003|18002099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	1Jlexqp1K1uiOC8MxrBi+rK4m54CERxPt+styf6DRrDlqQNahMCy2oEnmnJAcA+i88EvpmwGiNqmd4Kx2X4ng7njaJV/zgqWkGx0fhEPzMLsgFQnZDq/kNJ0sS768N59WnyKMhCoyjd0Z9Hc39xMNkbKXjJDOyWCrIKHhSKb48GFSDkKB00yDmbFCUdxl2ECooNlx7MwNFvg3DN5oPoGdvHh3I9OTkoAADleOwz/qtZg221/pBBuBF35ns77yg9FpCsRW/Z3RfqnJX7EZedkLtrm0MhYUncL3gnYlc3V7RiQ0hrhcVnDfiRu1+Vt1s7oW965V+MP+pOct4vDiEHHkfAUEDcWc/s7FZspnIZj1cwcHlDQV48CHVeKsjYS0Xtxh8nKAL2bIXwK367GD35tfIucDzp4OnOUnVcTwoJGr83Btb0fC2tNfxcRv2kusGCSaC2q+vTT+vDETg0Q+JBX69fz2r0f3ATxP8Tkzn+vGLTwPhfo/IopZI7F/PgRyvsZx1SRRmRIu4fdSodb0OHIXwquFxGEIyDS22u6FLl1ss3iesK95fP/U7OZ+3rH+SFapyyri0brEPovoMsmf7masMxl6z8bLZM0z4VUZfE/sBP7eFLzL+JCXDqXe4XIC50jqCjQ28oeX466s2NqpFiqDm63UHC6mNw2K29FqCJJo87YHgGUk9DvqJQwlXybMz2wOrSKbWi+4Y5gI6wUtipZrA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(23010399003)(38350700014)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MZrjW+v5vxFE4vAe1Wp+XbgvfMxeIEZEPdBmthUtXmMR5hLX1tIAOylXEVlA?=
 =?us-ascii?Q?Mez7qSpWMZGW1/JYmIAkilpTWElFOIdkGct2goBRpO9GUBu88B0wm97LJZHB?=
 =?us-ascii?Q?6zpPRl+BgpdkEoYxWDLchiIAtP0MBPccnLf1lsv/exdt8kIuYCU9uc13O/fY?=
 =?us-ascii?Q?sZGfb+TW8apv+E1GnFv517Z+elGhv5rxU/MeNSvoy3JcuhEqwrTHigrLF8xG?=
 =?us-ascii?Q?SiP1lAD4Dhp0OMS8MzSmvzu502n3ivfWY6oSRRfR24awem9pr8Ug+v0VS0Ux?=
 =?us-ascii?Q?Bc5hyScfbZK2d2oRlSAMLwDIg2yzkfNwYJK/N9wdzwAqBgLpLVet5bSPdc0R?=
 =?us-ascii?Q?C46wrb4hVUiDIDY8bp1F8RmHsq9oLZ4StSMPS59dstSzxQhb30rPjElKwxKx?=
 =?us-ascii?Q?bdP/SNnOOxf1bLx57i9lPwZYjs5aRX0IzpVcN7xiwVtzpPRwaHbLZUguTZRV?=
 =?us-ascii?Q?8JCwuHasMjDIo59+2Cnp1k4D1BwX9cOf2aORkQuKin4gfBo/mt7ivLvm1FIF?=
 =?us-ascii?Q?LoWjpJViGDHl0n7fP2I40CiLez9alFJvWUPKPxDWTl+wB+4ufKZP9kGJiIux?=
 =?us-ascii?Q?HJviFDNh2apeviK+WfZx6qhlQa1aJk7zXMW5mymNMLy3HUuB+597mnlfaO43?=
 =?us-ascii?Q?V2KUh/ndTNyez7/h/z18Zr6HL0Kie10cmk74+bv6zj0HWEAP8wdjFes4TEla?=
 =?us-ascii?Q?HDOwUzhE9jqAqtHjmnYraVoRMoiUZ0Q3jAlbQrmL6cNwjZR4Cfe6NDsjnD0t?=
 =?us-ascii?Q?xNlfJiAoE561y5YWPePzKHAOsa3ZHy88MvJmY4Uxs6dxYamU0UTnW4TlGBbI?=
 =?us-ascii?Q?1V7x6UZq20jqasBR/JjlXd7eD8P3fp2oYzraQ++GV2kAG+UPtd3Ew2SDuPCz?=
 =?us-ascii?Q?WFY1HiOjOHiykDLv/52Leymudf0cmiAx3kg/RIyFqIH4LPoL0bMXyDZLHqWR?=
 =?us-ascii?Q?zUbjudNYNckpJTsr8CKXcHqsHy/zSQKoWKtsw03N90t3ensE4WxDTnsXDh+q?=
 =?us-ascii?Q?o7Ow/3Xbxo32VDJU6HgvDFwdzv86Sc8ohbaHwHni/QgLVltmadKu6pM5xe7P?=
 =?us-ascii?Q?QqWYM07AZlI7Q/c77z/cfJHLrpY2NwBeNZW8gj/KoshlHLrhgFYjjBNt7+DS?=
 =?us-ascii?Q?Kn5hQH3UWlPd7NCTOsn0tjXR/TArXEFlrYWTG0BgU5gnbkNWKrtfFWr6nJa1?=
 =?us-ascii?Q?sJe9mqHYEbRyXSiisQ+fHZ1D7eti23DWUUR4fervrdKJTX463YxF0sgeeIR5?=
 =?us-ascii?Q?VrVEzDOyjyXxo3ItZ6G0bbHx4uvG9lzgNdGRQbQcDeAhLgc/ll+YWqjXdMks?=
 =?us-ascii?Q?vSOOWNGPBfLWsVzbt7BdkvmRVphIefzeO7MkzpSNzAQ9bmS3uAOSVutTkSuA?=
 =?us-ascii?Q?cNzE+CevQ7VOFYfX91TfbGr0Ss+FZZmjXYUqu2XMELQiBijKUc5tl79l16HS?=
 =?us-ascii?Q?hKFPx+5DZb18quXWsw9w4EXDD7xzSXhVMlSt4fW1tpnlYRVG0JS51rkZOpQk?=
 =?us-ascii?Q?Np3eD4dnqMFNpTfj1VFGDLnQj7o5I+C4f7mtNZL3YSx7bznCQFVxJeabVb0r?=
 =?us-ascii?Q?mVNcQJc0kPv73b/K60lMRg7qSEG+JnMp0niDq72mXLMkc3pSelVdPFm0SDal?=
 =?us-ascii?Q?6jqM6CmI8tR0xLCt68tQi1N7PdSF9iKtTzS6KLPFk27jR+U/R1L9G8cBIW+1?=
 =?us-ascii?Q?5zJOYwwyQFqpHnYTCLJVa+PYao2CsTJp8jWpcmH6/pQzfWV/I4NDwdrvK3pL?=
 =?us-ascii?Q?BgTlHYgrMa5z3xZ+Fj8pMCNgcOCE67MOMKbu6uF9d8yE33jPHlyD?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6a0406-453c-49a8-92e9-08df28edb256
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 05:49:07.5134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMsOVrRM0gfmlVFKJ7EkF7t5SyQBpZFrkSo1AC0tCDpHVIz7l6POciAvZEY3uc/iXVMzfmAYmL4McDfqc/G3niiqCMNkNagTq0UPp1Arkq8LzOtnFWqf91JbvBMPyWU1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18295


Hi Bui

> I'll add a comment to explain why the return value must be normalized to 0
> in the affected drivers.

Thanks

> For MSIOF, I noticed that snd_dmaengine_pcm_open() already calls
> snd_pcm_hw_constraint_integer() for SNDRV_PCM_HW_PARAM_PERIODS,
> so the call in msiof_open() seems redundant.
> 
> Since the first call succeeds, the second call should return 0.
> Would removing the redundant call be acceptable?

Nice cache, yes please.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
