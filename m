Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022137.outbound.protection.outlook.com [52.101.126.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985C0430CD8;
	Fri, 18 Sep 2026 12:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736245; cv=fail; b=QUYcQ62LMiQgw8IRP+iYHl78RiQP+lFLcqoREgXHV17sotXQNjJgmO1v1oR4qHUqAO1CnQJ8YLjv3Z9jh1H7lBgJNZ9++e8p1j9odWYB+30/srTSziLGSOlIbS+5As+C6IB+sM+1r3HPgEx7Q0NAVuCry1gPflvMZOVNfsf5f6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736245; c=relaxed/simple;
	bh=/1TJGjhscnB+TwPUOP43IG24xcxRfgX10gXDOD1ghhM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=X7DCpW5uBjZUUQMFqgIF0efQu3jfK6J+sajze76xNjsZNOnXAO/oQsmICrGf+suW5sEaxG2igb7/ffVk00OmIw0qtceVCqQkOWaTSe3MqDRn8nq0Wj01pmV2t0JWdtLVNhlq1CaNyHS3sRrZ92+RUNmgE6gh0vBYu40JILoQ6dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crepuse.com; spf=pass smtp.mailfrom=crepuse.com; dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b=peX6zdCV; arc=fail smtp.client-ip=52.101.126.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crepuse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crepuse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b="peX6zdCV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8rU08io5bf6mnCKjVz6Ec0W4y6fR39zJmrKOWSuMtz3pQ8t4XuFBiGUEoGGpkCmCs2DVtiuCxZqFdT9rlnsLl31HJiVUeDCt57MmfMeawfXBgtjHdMwRKvPxAXPzsqsKjpDWJdUI3CmCgM3d/uR6UvtQA79+zKgGoxOogikKICePuoYvccmW9OhyIZSFH5NKR9TrhBs2P5K3RvIeAxTaHo5+CF+VJjwFR4NItNnnoHA+wK9NrlDp3NhJodHWYx2uMXLTmYJxg8YtW4JlkxpIgL30B27kvoHcVxhP4oir2AfQiNbj0uFpjB8RKeUsXr90RVtpuE4XZ5pczIDSabjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yfs9HWIx8BRHnKOBh0Nq50Gbh9QbKPPzqllUr7EVQs=;
 b=hAaXx1refNMmj02i7XAgpasHw4BpOxgVk9xzjscRBXiDtQHC3DYyfjFi1DU7e0+3Ii2JNgWnX15nnVMMVkmHP29IGr3W2L57mvpT6fH5lLLNhYwVr5B08IWzCTbJzpPRzWEMWVWxFTaTa7j1zU543RBY7jbL4H8R5MKP+8sfqgBCtruZKUa+iGPymqN8NQ+7cH2zP9/XT37YtEgcvK0YAYpG7ogxAP1VY8BzF/AB0WwX21QeCRyd3MSpWl4X6g9FxJhlETcalj0wmwmfoHqiikoovLJ+scgo5Vmik/y5nn58gXAh1KMGAF7+hJaLDXH8gVsFjjsWMl3bRuHpmSwY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yfs9HWIx8BRHnKOBh0Nq50Gbh9QbKPPzqllUr7EVQs=;
 b=peX6zdCVbsxIW7RBPyFnEbX9cyeCZ92fmAbUqwDwfIhuaVE588DDZwTGvlcC39ZuKMmZ961KbutgCaq/vLj10XQ19Y3johL6vNLAdqdorTqyPd7TSZbBB8DNo3HK6IYoV+uBP9SbU+SPh9HIB24quD6ydr36zt+0OTOQO4+HvCFzWpTF2ZS9uor5T58ESPoO6uo55tKBJgg3nrCqM+FAjmwrka+rNjOqKsC4xVdf7iTIYjaqpM71cyzErieQxihMXSDHTsRKt4OA6BtP3KpMaAhNHaE1kY0ARwistSfoiqPqSfIMeodvajL8e2RK8Musjy4gRmqWR7h2/d9v2sb+uA==
Received: from PS1PPF6469DE8C6.apcprd06.prod.outlook.com (2603:1096:308::253)
 by TYUPR06MB5980.apcprd06.prod.outlook.com (2603:1096:400:357::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Fri, 18 Sep
 2026 12:57:19 +0000
Received: from PS1PPF6469DE8C6.apcprd06.prod.outlook.com
 ([fe80::e60a:2617:6895:a0cf]) by PS1PPF6469DE8C6.apcprd06.prod.outlook.com
 ([fe80::e60a:2617:6895:a0cf%6]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 12:57:18 +0000
From: Mizuno Miotsuki <founder@crepuse.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>
Subject: [RFC PATCH 0/1] ASoC: codecs: rk3308: add support for codec revision
 B
Thread-Topic: [RFC PATCH 0/1] ASoC: codecs: rk3308: add support for codec
 revision B
Thread-Index: AQHdR2084WOWJLbj5kaUO71XLMNpEA==
Date: Fri, 18 Sep 2026 12:57:18 +0000
Message-ID: <20260918125711.94361-1-founder@crepuse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PPF6469DE8C6:EE_|TYUPR06MB5980:EE_
x-ms-office365-filtering-correlation-id: 53095bbc-3bcf-4d37-aa7f-08df15845f4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|7416014|6133799003|18002099003|56012099006|10067099003|3023799007|38070700021;
x-microsoft-antispam-message-info:
 ePzJN2hY4X/ieL2Og29ixmcqoD2G7M6JDb7pCTRPeKkBNnwS8CTWr40dHHTjSV6gmQw5soPpyEwuBaNyVv1WNV6qMa+DRR546U756v/8PTDhe91ZRCYmtnutLjCAwZKSfFI0iRcoTLPBThgarb/V7Rs/hxIyJ3capRDnshEQk3dlxAUS4cHIvhSxDBKdiqRoQHaXIP0gZkU9BJq0hvgMgM2T+yi3FaxAEe4kwTGxLVy+iXC1xTFGQ0pO6gPrVnBc+nm78F2l/wQbvXY4bdaSqyRLDPAuD4aOHhZiNzLtntzH+VXs1dFEJxKqz3Rihv6MKPKsTx2NRQ4uNbVMzNcc33oBJmrygYUnjWU9pHxdg74dQ/kbYpWk/aijsJESM+E0mdWY2yLMw9Uf4UtzvIoiuvqg17cTO3nsoa2Oe1n4/GeMRJcvToXeM4YNew3Jp/rylutXgsivQsu5w+Z+7czhMkEIPjverQx1R9YW/7lLD8SjyzTiLiNuYtnJKIs9AUkMKkh48TNdM1ZE2s6LQS8ZW96J4fHFc2SWETF4P/GtxNQRb5eALOpOW2Y1AEL945boFUCE4C4KtLxFx03kiQnr9autGnu9lf5G6RBR0MJIpracWZiSw6DvZdimeh/O7MPXbDaEgqTWFPi7nIt/azIyls6Q8J0yYLL6EwLLBjQzG4TSq/2Sp3omrwRFoxGM2hVfkeNHfK3dcuL7d47jdoK5IA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF6469DE8C6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(7416014)(6133799003)(18002099003)(56012099006)(10067099003)(3023799007)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pSV6jWZW6vAxvtvr6caiH0JOtx2WJLm6C+Q84lFlhBzleN/UrBRR9DEbs0?=
 =?iso-8859-1?Q?7kgR0X6V46HZqKuLKO1xCB+vLXr1t1H+8dBauoGuoD9nR8YBWWfQtGZtmm?=
 =?iso-8859-1?Q?v2rMJz/gC4pj5n3CqeYLWksslzg3QfaL/cBJeaCkxE/Yf745gbIhXc47Ri?=
 =?iso-8859-1?Q?CN8w9SzywVt0/1NuF1dzTCtZ32vFRoXINF5qFywX3fUaICRIgtmAAHvgXM?=
 =?iso-8859-1?Q?ANE8w3FYqb6G2hd2qxATOtSFlELiFwQ7pfKKLcpzEN7ix+dbLS/pPzNZt/?=
 =?iso-8859-1?Q?2qhLpFg68Q9IVPtFIlmd/3HbqyYSTZHNMsEw6RuGnrLYT6HjyWuosi30QV?=
 =?iso-8859-1?Q?Fnewi8k0+AV+n93wFfkl7rWimy1z0LUmSLAXG+r4UxoCIdHrVve+jwpFAJ?=
 =?iso-8859-1?Q?qMhj/KrNdFIwGesaINkxrFB6eU0ZsVXdHWhv07pc1oKi265Q9Mw77P8PBO?=
 =?iso-8859-1?Q?+jTGJE8q4q/YjBQIHG5AlUc0YLLVTEubqHGgNdRF+mSEQv0ha0jhQHHGoR?=
 =?iso-8859-1?Q?8/W9aMszd0B+SLcm2u3Q/+ezv8mnyRp+GCQ+AmijWYiMJRU9VbvAAzvXTe?=
 =?iso-8859-1?Q?YyNAZQDfgVZEL6Uhcfb8xINJdDTpOfHzVLk6hpJAI4jjN9lrmPlJ/x2485?=
 =?iso-8859-1?Q?U0NNf1mAdNXyqPwLS9c0MtA3XHBcNObFgf4NanEscMccxWHXMopnFWhC+2?=
 =?iso-8859-1?Q?Z/zVhTGtMPn+LVtS33bHvNbpNPNh3P4LECD9elZ6DgpAD4vZdBs5ZixnGF?=
 =?iso-8859-1?Q?BnFhaORnAABY81sCA6VNykLwahEpHCm22jBZsGp6XzOhlvfjXk5GbbCvEf?=
 =?iso-8859-1?Q?G+U8TdP+IFOKNMUHrV/s0FsSfDKXI2qD8no/e+Wg3tfrYmAtJZegt2Og1K?=
 =?iso-8859-1?Q?gDyF33MpRB6dkwIfuoSrEsy8AtyXJSVuSTbk5YGMQM3J74ZwboEnv15Umq?=
 =?iso-8859-1?Q?/nouuX/9vuSBcA3HjaRhOejNdRQElU2SBtMmHAAehSF26hBSpqzEHxHipG?=
 =?iso-8859-1?Q?HkDVuj0RyLk0J2SouKRamSEuKbkJ9U96rCtulxN5kQ17FbhV28fGH5C+5A?=
 =?iso-8859-1?Q?PtttietqaIXUd2g1SwE4YRkeH9gQQ/bRJWaBk25QB7wHtn8Nvn/3o4Neud?=
 =?iso-8859-1?Q?Ef8nkIA69ubR8uFnycreQV8Rhjj1rKJPz/K2Xu8AhckgIUhLFKSUjjVAIu?=
 =?iso-8859-1?Q?wKPvDwMjjWIUQAQIV0nQJSjGkm/JMHei7SI7M4tbYzvpZkPMH7r2YgmsqX?=
 =?iso-8859-1?Q?TiaTXm5UBQRPBRN5PitqTlw1VpEo7G19pblS80sCRUNudXaUfZtj3nOFHy?=
 =?iso-8859-1?Q?lh3u7fGQMiVey/DshhsrP1nALH1YZEcI+mdvc/AI1pzlxFrII4lrUDBczB?=
 =?iso-8859-1?Q?fMRCZnt5jRj4+1XMhV6kzGzpTQCoOnSteakZiC1O5Sp5MPKK+HlU1pkQPT?=
 =?iso-8859-1?Q?0doQbRCf/ez2Nd7OWPi9GiBuGd2UHpxPRlfqNay7f22WqYTRTvwDZNDtCY?=
 =?iso-8859-1?Q?Puoh8OSG123sefzUbR1chg8Gsl2840N504wVxrJMO77ixm/ah7nhiBTgLr?=
 =?iso-8859-1?Q?XeDV2DzA9D9i9ad3ag1+SlAet8BeMC1AhRgXAcGv5nKs04TpmdzoR3JRga?=
 =?iso-8859-1?Q?t8as7ynHeCIaSxyubxDLQ6YroY9Ue8KCqLedgcyelMbv/QKQzRKsQJ/yyK?=
 =?iso-8859-1?Q?31fkAb2O6OSnWdEMjnw015gnuZUFlG03iiTQ5Yxp0rnpqxu1igIhuk8XbY?=
 =?iso-8859-1?Q?iZw9Un4rk/cLKKCdZ2xTOSm1TcEFg8uXpshmUJy+/nYu+t?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: crepuse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF6469DE8C6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53095bbc-3bcf-4d37-aa7f-08df15845f4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 12:57:18.8412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1d352272-7d70-4a91-9c85-0db444db1bc9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pTNbWpQ38ukr0FvBxLCAnxqtu4oRueGsgEhGHvu0i085PEx0Mwlkwvx05kvnRxV0jiWtCNYoa7nlXTAD5lFkoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB5980

Hi,=0A=
=0A=
The current RK3308 internal codec driver detects codec revision B=0A=
(chip ID 0x3308) but explicitly rejects it. The initial 2022 driver=0A=
supported revision B with a monolithic power sequence; the later DAPM=0A=
rewrite left it unsupported.=0A=
=0A=
This RFC restores the revision-specific DAC output VCM/current sequence=0A=
as a playback-only DAPM supply shared by HPOUT and LINEOUT. Per-channel=0A=
LINEOUT events override the shared DC baseline only while LINEOUT is=0A=
enabled. It does not restore the old codec-global power-on/off=0A=
functions, and capture-only streams do not touch DAC_ANA_CON14/15.=0A=
=0A=
The original 2022 upstream v1 selected LINEOUT_FROM_INTERNAL for=0A=
revision B even for HPOUT-only playback. A newer Rockchip 6.1=0A=
downstream driver instead keeps CON15 at DC_FROM_INTERNAL for=0A=
HPOUT-only and selects LINEOUT_FROM_INTERNAL only for LINEOUT or=0A=
LINEOUT+HPOUT. This RFC follows the newer behaviour. Is that a hardware=0A=
sequencing fix that should be preserved?=0A=
=0A=
On a DFRobot UNIHIKER M10 V1.2, revision-B probe, the board MICBIAS1=0A=
route, capture/playback PCM operation, capture isolation from CON14/15,=0A=
and the LINEOUT DAPM/register states were verified with the preceding=0A=
clean candidate. Physical onboard microphone capture was also=0A=
confirmed. A short transient at capture startup is also present with=0A=
the Rockchip vendor driver unless a longer wait is added, so it is not=0A=
treated as a regression and this RFC does not add a generic 250 ms mute=0A=
delay.=0A=
=0A=
The shared-output revision is compile-tested but was not deployed.=0A=
Physical LINEOUT and HPOUT audio remain untested because suitable=0A=
hardware endpoints were unavailable. In particular, the HPOUT-only=0A=
CON15=3D0x22 choice still needs maintainer guidance or real-hardware=0A=
confirmation.=0A=
=0A=
The M10 microphone route, its overly broad output topology, microphone PGA=
=0A=
controls, and capture-startup transient are deliberately kept outside this=
=0A=
codec RFC.=0A=
=0A=
Regards,=0A=
Mizuno Miotsuki=0A=
=0A=
Mizuno Miotsuki (1):=0A=
  ASoC: codecs: rk3308: add support for codec revision B=0A=
=0A=
 sound/soc/codecs/rk3308_codec.c | 102 +++++++++++++++++++++++++++++++-=0A=
 1 file changed, 99 insertions(+), 3 deletions(-)=0A=
=0A=
-- =0A=
2.55.0=0A=
