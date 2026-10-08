Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazolkn19011031.outbound.protection.outlook.com [52.103.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C137745041C;
	Thu,  8 Oct 2026 22:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498889; cv=fail; b=dXV+Bf9VToLVDEsBfFCWbVWpos61NPuPGi5fkeyZKiVcihcyMQ4vNSES0j5hXbUCBY873xsdaDdCTrrhRzFMl0j42ieRG1xOeJjVohVL6/gV6dUI26rh+DeQG5FeH5ioq29noflEGzM7KfvY9BIsCzt8YYI0NZszdAii1Yvm4CE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498889; c=relaxed/simple;
	bh=m0LG02tSnfVkcWjrXesByQa6xfB80MhvnxJGHu1Vk7g=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JPkQvxgAv0f7Zv8VY5TO5/OfbmtSq0K4pEc9SmJZpSGFPLYFYDgkzYfWDlPHPowcIjTyuWVCz/a5vnYS9YVkXcgWlk/YxkUdCorz0N77mbsKZafaQ1CSehoDtAN8KLTWZcWYpj10oK5gIt4fAVEWJSpp0gaJKBim9OGHL/HEtFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ezkCjeNs; arc=fail smtp.client-ip=52.103.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ezkCjeNs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=komik2Eu+mnhoFigOKgymm5jrReE/Ka+9TX5rAyzuZUwIkcT8N7Ng7oFwM/vC16zJrNR1kRS6UpmQhK+JsTpC0XR0VQtOU+HBE8HAAZAKKhnyP5R4fSrX62NHuQ43Y8QRb504sAxSLx0BZ4DBqMwsdIT/2gbYe0xHNPsbpskbdqcX1uwWwGtFcjD/0H9h+h1aNYstHgNfoCnisL7ezFw5xpvua4k9tjz/RR1/ZGJm+iE44o5H09LzCeIb0Id+kujNZ4yQQSoTOj3c7g1c66KadTBJ2BKvxrfdUTmi2kwHGr/JobvXgmdVmlNzICp/3dkZLjnCF/JTVZ1Ex8h2R22Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgMgRTBQCiYR8AV0alB83BZg1hQh9goOmhBtVWM2c4U=;
 b=lZ9fxu7jKDb7wpBOlVviCd1mc1a4Bfhps5MheALOMdDFvRT2lVna994aGP8oEL7PGDc1s/nZHSNk9cN5OH2shNm46m9c25XAvN5PXZh7yXMXYzm9ud832fjTnxfsC5pR+x9FxfHrRq0D2hS4cDBDdFhDMfxT3CyoD7LJ/G1p99d9ibW67jJVzc4SktbJodYLtZNdnuiG5fEv5uvsTDyG7MeQiwzaOPEJmms3/kPJqElpqetW0X3J9pitbpHVkT+IUODpfMOJ354OcgNM74nVA/4TqBmXUzdrUde7YzMY7x+PyaY29ipTzFKUVMSc5dC/EO3qsW7opzI80wI+9NnbEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgMgRTBQCiYR8AV0alB83BZg1hQh9goOmhBtVWM2c4U=;
 b=ezkCjeNsbaLZmu7yW0xFCoaFFDQynwyHsj+z6KngQeFLLa7JSulwSQmssDWJbV/iQXDxun7eAPw3gBT7rRrsfCevKZP28Bo0O+j/4xSXQjSOsXZHzVg9Q1IwU860U2uLj3bHbPIpx1QvIz0P2rQ0+CGCxjR2aQ+dKCHg0lj9ArJqrTCqpPFHeXAOlyjf+Y5QrgJFXh4pzUJgfLmV960jlc7/H6nf6aCqVANXnefXvUW8Vog5KFhhuKzqb9hTsxii/NFZfgjCO6FJ9+lzLS5+j2ZxcU9cKs4e/70SBRSgjfSmJ92Z3df+Xj25H5gN7d0aignMIAqumksY42MBQfZqdw==
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com (2603:10c6:10:32c::14)
 by SY3PPF346C5784E.ausprd01.prod.outlook.com (2603:10c6:18::40d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Thu, 8 Oct 2026
 22:34:38 +0000
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19]) by SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19%3]) with mapi id 15.21.0522.002; Thu, 8 Oct 2026
 22:34:37 +0000
From: Zhang Jiaxi <Z1529105815@outlook.com>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 2/4] ASoC: qcom: q6apm: abort prepare when stopping the
 graph fails
Thread-Topic: [RFC PATCH 2/4] ASoC: qcom: q6apm: abort prepare when stopping
 the graph fails
Thread-Index: AQHdV3UzQFCO+4g1Yk6MP0nkiXNA+w==
Date: Thu, 8 Oct 2026 22:34:37 +0000
Message-ID:
 <SY5PR01MB10600AE9EE74BAE7A40B23D19A1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY5PR01MB10600:EE_|SY3PPF346C5784E:EE_
x-ms-office365-filtering-correlation-id: ade46269-816d-4b93-a679-08df258c5596
x-microsoft-antispam:
 BCL:0;ARA:14566002|51005399006|8062599012|19110799012|31061999003|8060799015|25010399006|25031999004|15080799012|41001999006|38102599003|24021099003|102099032|2607281247196008|440099028|26104999009|3412199025|12091999003|40105399003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?fL6O8G9PjDbGdDxK0gHrsQD61/r/1kKn4RHX3BmAUFqGpzN4gax4KMJ5g2Pm?=
 =?us-ascii?Q?OcQ2je6zEO2RHzrj+rVX7BtRH6o3QdXyD4TgMnI81rFj751HdqwHxBS/rEX/?=
 =?us-ascii?Q?S2Lj7YCgdMbj+II0hW+U/c/aEmm0xb79UF4+W1yB1eEggEoDrGVqo4QX+1Qx?=
 =?us-ascii?Q?hkRZ6RL0+1CKB2Hsdn/OQz0+ogyONAlKFQSv4fi193WAWHWA+8DtR1jZfkss?=
 =?us-ascii?Q?oEA802nvfxb7VTafNRpIlk0uE7+oX97FJ7/vFmJjEpM2Sb2E5BXKPg2hlzvT?=
 =?us-ascii?Q?s8nMw3VS9RfmG5S7E+qK3umB+8c+QXq6Ik7B0FwOYX4naDVqCQkfJysIzvYF?=
 =?us-ascii?Q?/mAtX6bLgXbdycoQ++c0O3XS3b8VZtEIHVkJ9JzB1cC8MVLX2khZDAhwJhKH?=
 =?us-ascii?Q?xo+10ttsby2FjmVGXpx/XPBrfWwlGEs+pL2tXvL91tdAhsl7H67Ide0dqmWv?=
 =?us-ascii?Q?0Fxwk+xHEkLMT7aJqIvCQSq6OdiUx1Vyrp1Jj/lwOL57fqZbU19ayW2Jfaox?=
 =?us-ascii?Q?7z7I6H60AR6Hy0dG6tXystR02iuAdETzh3AHXt6IRtGT0x6SX2s7bn/b/sy5?=
 =?us-ascii?Q?TeFVHRUDFuWGN3JLm2w+1jPkN25ciiKo0357OX1zK2qCWOv6DL2FCT92WUNN?=
 =?us-ascii?Q?fkSKPagTxlVoIo5JOVW7rYSE0FD8nKts81zcRyWN6ZVywqz++gJhOpzwasUA?=
 =?us-ascii?Q?LcT+ukArULxtwwo5N8I/wlXI9PFxAGi209N31BlCfJvI3SvDwlDgsxAFH4ig?=
 =?us-ascii?Q?MOwZWjWUKQvu8RTBWObqfOb9wjsreX6raqTfQx99lMwUx+KqJoTw6YVzeTR3?=
 =?us-ascii?Q?X0UwMRPN885CHBsIel383bS7VSXx8TNOgvAQsreEhTMf4juhTfRpZBivKRFE?=
 =?us-ascii?Q?GjagBHPZaXm7r6iJuHooB7uo/0KAp1FzHNcnKaLJi+zYHwJmqFLBvZ8Oq3/Z?=
 =?us-ascii?Q?F4/3fxpaTHdD3MDGKdfkUuRGQ1W6O6YT7NRuIc4pGTMR+wcbPB4Fv5AaWke0?=
 =?us-ascii?Q?gOAQsenTlDNezxlK58EurXjWtaqTYaoibH9faTTmoDDVigsMarH08giSR495?=
 =?us-ascii?Q?56rawkY2?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?j2365sUob5+1QxXeTzUgZTiNMhWURXSDareVHUIqa40LKv+aKDiVhBMYXwua?=
 =?us-ascii?Q?fh4EykS3coKjFcb92Rb/mac86Qw9PkgmWVpzj3ujC+KIi66aXxihe7RUQ751?=
 =?us-ascii?Q?KpvOTAdRQsoieeNMu/fyWZN32hV8JxlEYXgz+gjerUdlUODrgKREnPmYzy9R?=
 =?us-ascii?Q?ds637L1q94swVwWvUwpKbrbq+jfSgI1vPamGphMaBIRuY4fKw0Z6z9pTxlRJ?=
 =?us-ascii?Q?nmwrsdbZJpC+qS4KTo//d2Dj2uWKgwgUFpOqFaeXwigGD0kLZ6my9h83puom?=
 =?us-ascii?Q?N6DELhWPt1y5awJ9kjNgVJG/4kNXfg32aXCcwUNvi7IvHwVJ6N7Pf0n9IHCW?=
 =?us-ascii?Q?8eeO6oqd350MPw2PW5RHfo1dWAwLbFknrovvYVd1ZxSsLDn9rCggO85Fezx+?=
 =?us-ascii?Q?yDwbLxXB3gLv/2f88Uo4r1deJAdNlKnHKvDCMrK7RqDj7Wv8J3SyhtXMxZUp?=
 =?us-ascii?Q?ued19tHWhD/Cv/c0yM0rU5HHA1VnOCQH3z1Xblu6UKwbraxexyGY4s3Zc9ul?=
 =?us-ascii?Q?nhI7LsHgsPpED9Zl3l5r7E9M+UrmdnrborfQTw+fvNA7XGw2aJkX4BYHyv2k?=
 =?us-ascii?Q?eWznL3a/2QXnkxwu85yhgOEWbW+sv+urssz6kODsX+nfQxqe9/p8792226On?=
 =?us-ascii?Q?Oea0+B520gqcRXjXt3OYXcgtjOYONiuA4Mhg0A5MFmYC3jApMTgh+mdGGey1?=
 =?us-ascii?Q?2yrQ427+n6RZFLBJ76P7ZzqNPVLJOCPvpdiiol4zSuyE8Su349/kwVkbDLP2?=
 =?us-ascii?Q?17SrjSn0Ypu0xgGJRRbVYh97P7HRLcet0AnWWWXllwnly50WfbTc2aa2Titm?=
 =?us-ascii?Q?bg6YDKtgTMFB5FP9t8WswY3zNiF2tNGx9WofSiprBlN8/1CqK1XbHqMK8/Pb?=
 =?us-ascii?Q?T0QVIlvgAtBG39H/rN/ZxxEfELQpNb9RxNN/GuD6mfBVYy2BJGJfrRsnpxwD?=
 =?us-ascii?Q?Pj7N4NjWHK4bBXVCZMjCXUootwoYW0rb8bPbc7c7QuR6kuu1ow4MHWScJOUe?=
 =?us-ascii?Q?GjH62KpLEGSmOt+b+bZ7fw2EmfIfiZqocLV7kitCdcnYXN1yNhw8lX1jPiqr?=
 =?us-ascii?Q?jB+7ABqK8gFdUEfpi0zIjvfbCd/7T6NjUY9hlXcO0fvvon/D+9sUmptTdC75?=
 =?us-ascii?Q?ZeSBUZdpgNW+kREFBl4H6Ixuqt5NvLYh9qyTSUdwU1T19bjYMC0FX3Y7leG3?=
 =?us-ascii?Q?exlGOdh81CNDroTQ9vYlvrAdHJLhEG/KqMWf6I1DUgMKriC2pu/uYUr0/7tV?=
 =?us-ascii?Q?x4rcSdTEIXMmPdIuceWubaKqjAPLJaLDip/EFqZVpx4/bAgzFyYyr2ZIhyYO?=
 =?us-ascii?Q?NO1fI3CctwBCwGMbvydoMs7AEaY+q/exRHUZKuc86RtvEix1WsESwOFVUXRr?=
 =?us-ascii?Q?XMTMO3KaI5BlI9ARYGnxhacGPQHO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY5PR01MB10600.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ade46269-816d-4b93-a679-08df258c5596
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 22:34:37.0990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PPF346C5784E

From: Jiaxi Zhang <z1529105815@outlook.com>=0A=
=0A=
PCM prepare ignores a failed STOP and frees the existing fragment table=0A=
before configuring and starting the graph again. The LPASS backend prepare=
=0A=
also ignores STOP failure, clears its started flag and sends new format=0A=
and PREPARE commands.=0A=
=0A=
Return the STOP error immediately in both callers. Do not discard the=0A=
old fragment table or clear the backend's started flag on that path.=0A=
The existing successful prepare path is unchanged.=0A=
=0A=
PCM close, compressed free and backend shutdown still perform terminal=0A=
graph cleanup. This caller correction leaves core reference accounting=0A=
unchanged and does not define recovery from a lost STOP acknowledgment,=0A=
close-time DSP recovery, retry policy or concurrent lifecycle serialization=
.=0A=
=0A=
Based on sound.git for-next=0A=
62d9f9ffdfd44e88010412bf8f23732f0a93a9be. No target hardware result is clai=
med.=0A=
=0A=
Signed-off-by: Jiaxi Zhang <z1529105815@outlook.com>=0A=
=0A=
---=0A=
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-=
dai.c=0A=
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c=0A=
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c=0A=
@@ -347,7 +347,9 @@=0A=
 	audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels=
);=0A=
 	if (prtd->state) {=0A=
 		/* clear the previous setup if any  */=0A=
-		q6apm_graph_stop(prtd->graph);=0A=
+		ret =3D q6apm_graph_stop(prtd->graph);=0A=
+		if (ret)=0A=
+			return ret;=0A=
 		q6apm_free_fragments(prtd->graph, substream->stream);=0A=
 	}=0A=
 =0A=
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6=
/q6apm-lpass-dais.c=0A=
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c=0A=
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c=0A=
@@ -234,7 +234,9 @@=0A=
 	int rc;=0A=
 =0A=
 	if (dai_data->is_port_started[dai->id]) {=0A=
-		q6apm_graph_stop(dai_data->graph[dai->id]);=0A=
+		rc =3D q6apm_graph_stop(dai_data->graph[dai->id]);=0A=
+		if (rc)=0A=
+			return rc;=0A=
 		dai_data->is_port_started[dai->id] =3D false;=0A=
 =0A=
 	}=0A=
