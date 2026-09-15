Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011005.outbound.protection.outlook.com [52.101.70.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58AB3E7BA0;
	Tue, 15 Sep 2026 02:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440413; cv=fail; b=AqHbxTviU5izmYhkCBrwkMeHrwFdlQgNgHqdV8uBogeoYQFNbui2KM8FRhkGjdLyWsa/uP2JP5B/3vs9qWAPMQqXKvOiWG05BIgLvrG1ArbD+6du1Sczm8ErJRvN478Tt2fOoCtjow+pAqIfi4AYTFl0qPF+3HqT/5SgxR5Wc3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440413; c=relaxed/simple;
	bh=KNanN4W/ymiMDvRJebFDd+Pb/cggUg8SFJjk78/aB+Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uCC1/mW5K2mIKloIkzrNLcSBQ29VqSxmfog4QTPL0vysCEsrETdjXM0Zy/HA3AJ4w5xnGEonU3I1O8B4UCfubnWNaC5UggnSXPsbKtEUAensbXOAnvzNP526mIDOLgfyXZwOCALR26ObsCjr/Q64mL2S660VoLprgkyzFhOiLP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Qlk1IaeC; arc=fail smtp.client-ip=52.101.70.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Qlk1IaeC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NV3ntgQTvo/0erxO4Cca1wXb1nFqoZoD9q+5CwFVFa+gvjSvc60L29IB4kUsBPufmTKKrJojBloYhNuDRDgx8Yj+y6D3N4lc2DQ62HHRwWg1jjjcUsefe/a9dzNwTxMQYwjuxo8xq8XmRNiYygy5TIYcVOsVMQixYFTz7CNGUI5auVoFdSjQY7ZyfzU5c7yX5cIjPMEAhsFBHt0zuCW03u4lsT2p5OmZQ/XNCc/DfmyWqeXrzYMjfdQF1VTghGmp9CMVgnefEl7y7YdNL+RtR4BEjPA4Z1vGzX4mz7WCM/CA2Iz3zfrPJq3goZXQrqTWDvMUkLeyJckW0u6ZzqiWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+U9RxDQT4IkzAF6hoY7vJKj2yJVmgiILXrkPdVLId0=;
 b=vE+aeA2/5Z47UpThvrjPyFtrn/X9oudk4Ur+WG3Ok89CPNpVbOUh2DKEG4jhM+EUBf+RoOIlVvgn3RDb0eYNXr0UezX3KhBHKotQntLFX/B+Xx2/DPzB4VxpSm+GEE/40gx8rjNdCAMOtfjpvpxinbVUkfpAwsuiEjTo0AEMf2zP5ipFThw/Nx+DpJ5ZjbYhByLUwrwYPhxyo3B+X6LrWZQviDdYreV204s4OmsowavDnbNQ/obdbKKQ8Jewk6uhRcfYA04KSvUNJgIY9jAcLvvBf5GPwKGqVDGToVWyirFC761UurVG+6dbb9s2wLRtGGGi/2kVvxmd68A5GO0e8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+U9RxDQT4IkzAF6hoY7vJKj2yJVmgiILXrkPdVLId0=;
 b=Qlk1IaeCF1VB38pvzaK4bvNnDb4zzl07fsSUxEFM7dEG8HFZSAeE0ndHdNkFZ5DylR1ML9htdblH5/Yyoren6Z2xtBbeqZB9n2aNl1pw5BHtuwhTKUPc7/l9YzyRcFQlMHTq0Yo0S/w3criMfrlCUH8RBvILdcL4pWx8cQGX9tAeK6RjVPTeKCJ01Dp7nfI+lU8TK30WAdQdxkOXjYkBEfdqcqyqiZfiXiTo4NJVd+5zhCuSb3axrLOk6YtoIp2cJSxrksdZlX4zxmw8ISXBv++wkOpokhOHgB2P2KesUuYm+7Sa+PY3909aOATmGVVjMIT7Y8nrgA9sjH989DH7lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PA2PR04MB10411.eurprd04.prod.outlook.com (2603:10a6:102:424::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 02:46:48 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 02:46:47 +0000
Message-ID: <e682aeb8-9d52-4854-81f1-3b1ba38b48fb@oss.nxp.com>
Date: Tue, 15 Sep 2026 10:46:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ASoC: audio-graph-card: Free jack GPIOs on card
 remove
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260913102502.2805912-1-chancel.liu@oss.nxp.com>
 <20260913102502.2805912-4-chancel.liu@oss.nxp.com>
 <87wlsollph.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@oss.nxp.com>
In-Reply-To: <87wlsollph.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|PA2PR04MB10411:EE_
X-MS-Office365-Filtering-Correlation-Id: 334adc59-26d0-42d0-2d3d-08df12d395f9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|10067099003|4143699003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	6h2P2i0ISO1PCcneJeqHJOHLVYczVtsLrgoxEXVhdOeR/A7RFcZpIlW4xuvoOmAuaOkuX7V4y5oz0Z2WBobP9UXXAh4nNqogt0WkxUUyI5eRFjDsl0PEPclI/UxVAePrhPFHOV+c4xlm7vFiY9xMavYaIM4fluP6gbf9TineEdvVhEumo35GG7fbQN4+r4u9oqsBZRHcoSURK+Z8oqd7ABZeiAq7QuJZQeHaZAGSOuUnxcoYJNRYz410REfdZHn6A040yCkLDbFn1WrIb4EzZqqsNzdtO7tzDbA1N3Ql/WPQjy0fp5gdsmcld2vd1eL9j3q9QdBWGWSXZkaJ2FtJac2IN4AgbLwM9RjhpSh44CbP9oGVk9RkGvHhhn800865t6JYiceajKXd1YIZ6KavTipaL0eo7pHBXpnIONVw1zrawTBlU+kh481pY5dYBVukqdC8WQx5SoTU++uA3qSGDjWAUAjAkAGb29+yZntjQph659yDyMC8QoAXw8O0hi2h+RqhoWfPl5GhXeE92W5bNhiGwkhtD3LBVEAYeu1b/quDn+b1HHo77FM/IgiFayaLXIomBUv0YLEmBTe7iQaiHB1PAmDpasjw6uXBJ7KZVzcfcTotNstRsza2KXc2wJSQcm8Wy/QOwdeX5uN1iiBeWC1NZgkpHQHrD0rrifIFG6k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0tFR1hCSXRockYyNUJWam1QTUtKN0tSaFg4Mk9NVmZXWkpUbW03QlMwTkVN?=
 =?utf-8?B?YzBvMlVxYnI5YkFzb3M4M2JSc3orZmQvVFZVb2Z4U2VCRDIwa1diOXo1WlVO?=
 =?utf-8?B?S0JKaGErcHhlNklDU3dCZVAyQnJYblJNY1kwaWJWRXZxaDNEVTRlWk8zaWw3?=
 =?utf-8?B?MHVYaDhDR2hxYmsySnNBNThPUFIzV1poR3V1bGYrU3BTcG5OK2JyaFFZSU8r?=
 =?utf-8?B?NXoybmFUZ3g3RE5ualhwcDFWMmdWL1U4TUFEOFY5NjJoNHZqTUFvQWkwUXBU?=
 =?utf-8?B?Vk9jeWdRRmw4bkVERDRweHBKUGphYUxQTDlIZW1PcWh2My9adTJtUEFCdkZQ?=
 =?utf-8?B?bUxhS3phLzV6ZVh6WnVPY0srNHJoeUkwVXpJTFFQYmhmWUVmQVlOTUMxaVJN?=
 =?utf-8?B?ZHFERU44SDZsOTFDdDgwZjJjY0xtLzlHYzF3MzB1cFc1TzRXMmwrdVc4eE1Q?=
 =?utf-8?B?RG1DTVpkQ0dONS9vd0xmcTNwenBHWTRxRUs1ODloTHcrc3dobXhhYVMzY1Mx?=
 =?utf-8?B?ZHgzWVoycUEvNTZHZlhjZCtqZXBFbkRoWExYRWpIVkFrSHpxOXlGbkhEZXg0?=
 =?utf-8?B?ckI4S05ORHpJSFdYWktoWWVBb2d3NGFKQ3lCVVYxdWNGNWVoeFVEM2liN1Ax?=
 =?utf-8?B?K0Y4UmE2YS96NFh5UzZ2ejUzZE1DNnkxRnZUeElMMnlSYmRRSjZQSlFnelho?=
 =?utf-8?B?S0Y4aXFyZUlYWVJlZS96V3Y2M0crL2tMUWF3MlFsZzdpaldUTWVkVzFXdnV0?=
 =?utf-8?B?MHA4QWh2Sno5aEo4RkVicEx2UDJPRmNRTDdKL0VYL2xJNDJZT3dJaldvM3Jr?=
 =?utf-8?B?dktRUjJpOXo4NWNHeWZYMmFPRHlsa2VtYitwVEdiU3l2SC9GUGlDWVExTTZB?=
 =?utf-8?B?SzUycnhlVTlGaWEzRXI3enFselpOSzlFQmZ0cDQ3eEMrSFpHb1VIUmtZZFFW?=
 =?utf-8?B?SHAvcU5qWm9KOHAvdGswRUpUbHpNN3VLZGhybjY3cVRsWnlZbnVMTXB3bklQ?=
 =?utf-8?B?ZGtZZ1lMS0JOeHFrTmo1ZXRDY2hZaWcvRlRUZ1FWK0diSXVwMVh1UlJpWWRF?=
 =?utf-8?B?SG5hL0g2cEVjL1NlMXJYQitBMFo0STllN0I1MGdFSjRZdzdLYjc5Tm1rRUc3?=
 =?utf-8?B?SDhKeEU4REVmR2g3YVVXSTRRckEzNS8wZUhLZEhFa1doU3ZvK0REeUtSc0Y5?=
 =?utf-8?B?WnhFWE9mUUNVamxyNU95TWE1RGtMZkhDVnpxNFZaNzZ5UndLeGE4NHlzUERX?=
 =?utf-8?B?TWZJTElKa2lsVm54RWNVSmRyakZmWjJiakJWQk5Pa1dYeGlxTzR4VVlKY3V1?=
 =?utf-8?B?OGhOZllqbVVycy91SGtmSlpDN3AxWTFjcEhWMGNJMTBVNEVNM2EzblRid01B?=
 =?utf-8?B?Z09LN3AvTWxHMWpmV01pbUFsYmlhdW85RTJKNTBWL2xRc2RESHRqK2NhT0tD?=
 =?utf-8?B?Vm9LOHU1dTJxalNRZGZxSHVSdVZURE15Z3hWalJUU1JKMHdPK1FoMkdudkRP?=
 =?utf-8?B?Q0RTRm55bzQwRmlkcDVFRG5GMXFOc0x5cWxwYWpYUWV4RWdFNS9qNDRtWjh3?=
 =?utf-8?B?ZnBzamhzalNPNzIzWnljbWN5N0NSdC9ZSmFSZ2NyQnBpdWJjNHlyRjRCUE1m?=
 =?utf-8?B?bHNJZnd0MDNuakRITDFpQzQrQ1VLcjU3UnJNb1FvejZobjg4WXB3dWYwODZo?=
 =?utf-8?B?N1V4TG85R1FzaFBsTXpLK3pNaEo5OURuTVJxZGJPaHl2VHBUcG95ZTJJYmQ5?=
 =?utf-8?B?ZFNVMEovTkNPQVI2ZU45Z3ltU0RtdjNyQmt4VUxQQzRHY0VFZSt6K2IraGFW?=
 =?utf-8?B?NUxzZ1M1N0JBV3I1c2ZDd2d5Z0pqN2xmYTJ1TE9MKzhCa1JnVktCeXk0dWc1?=
 =?utf-8?B?VkRhMnpWZFMxeXRXV28wUVR4OU5zVng1cU51U2I3TGRmKzRMVnJJUi9maFpF?=
 =?utf-8?B?K01JYTFIYVVsRTlZTVdSU2JwZjJJR0FCNjlPRkIrY1ZRVXRzKy84V1U0MWl0?=
 =?utf-8?B?NGJmZGE0K1htVmcvbTBMaUFMblU4OGQ2eVZtMThaRi8xUnpRRmdHUTNkQlM0?=
 =?utf-8?B?MFVLc1lJWDJCRlBLdlNHd3B3bnF0cTFoTXpvTjU4ckkrMTdXODlQTDh6MUJ5?=
 =?utf-8?B?RjJ3eVRraDRvN2dNRXRmUVIxby9HWTdKSVdjTFZLejgxWE5uZ0Rabnk2Ym5y?=
 =?utf-8?B?ckxTQ0hIdDRVTEZlRkV0WG0wQTVTNmJ2MHFPVHdlREJHQmtQMGozUlhMT3Bk?=
 =?utf-8?B?aFM1aWZ1UFZSSnpXWEZiSjRlcTBLZnR1aTRoaTErYmg2TERqNG5mZ21QYUdJ?=
 =?utf-8?B?WVdKbWlwOUJ4WHI0NVZlME9RWDNoUjhLeWRvWCtYU3MvK0xBaU9lQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 334adc59-26d0-42d0-2d3d-08df12d395f9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 02:46:47.8926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8Ki4Duh1BP+YYgrqyWipOjl8D+4heB1PSpBjHgNmXQBR90WiibLg6x4oOMG1tQ244REJNH21ZhE04JSmRgFGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10411

Hi Kuninori

Thank you for the review and the Ack.

> Hi Chancel
> 
> Thank you for the patch
> 
>> --- a/sound/soc/generic/audio-graph-card.c
>> +++ b/sound/soc/generic/audio-graph-card.c
>> @@ -629,6 +629,7 @@ static int graph_probe(struct platform_device *pdev)
>>         card->dapm_widgets      = graph_dapm_widgets;
>>         card->num_dapm_widgets  = ARRAY_SIZE(graph_dapm_widgets);
>>         card->probe             = graph_util_card_probe;
>> +       card->remove            = graph_util_card_remove;
> 
> Basically it looks good to me, but tegra_audio_graph_card is
> using graph_util_card_probe(), too. Please care about this driver.
> 
> 	${LINUX}/sound/soc/tegra/tegra_audio_graph_card.c
> 
> Except above,
> 
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto

For this series I would like to keep the scope limited to the generic
cards. If this approach can be accepted, we can extend this fix to other
cards.

tegra_audio_graph_card has a slightly more complicated card->probe. It
also handles some clocks besides calling graph_util_card_probe(). So I
think this driver leaks both the clocks and the jack resources on card
unbind/rebind. I prefer a separate patch to fix tegra_audio_graph_card.

Regards,
Chancel Liu

