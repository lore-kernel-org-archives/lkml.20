Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012066.outbound.protection.outlook.com [52.103.72.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3E5483BDA;
	Thu,  8 Oct 2026 22:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498895; cv=fail; b=f6BfyF6DxqOH+UcDVn1IVEDYrtagQ4hLQGtOsejgdX3JDFfU0fi1xHRUhxPoh31GSPPyh3DvYb0Kxj+KXfRAJnlfz8PTitHKWe6HUv/MChMytz+QrMTrVpB1H+yhhSMgivWW+2UThlCbDK425L58Lkt4EVFx7wAeystb4DHCq4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498895; c=relaxed/simple;
	bh=WuuymhbBFyldlwEFOnnosAhkWhupZCKFSxGsnTDkTig=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BvOZ1m37v7PFJWjJrlrS/IRpDFx/0xw+kF1irfcN9jdX8IyD22Fm5y9aHKCbZHIoHPMEh2GH88ab4VE/HYAzG0NfRnek7zWD41UaRo9TNE40XXkSQSCeETro+Zk+cClObE63w9FajH1GuMzygYOvLgi3ApJIuJrYZbQucyXpYFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=KqdNIs6U; arc=fail smtp.client-ip=52.103.72.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="KqdNIs6U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1I6LiIz/QuiRaQJt+S7z8UrjmYx7LG0aKYiWYxabTHWrPBQZ3OKXTuNAouUHf8Ljv+pJzUUVswMChhW7c89PPotKi33FNkkMcXuriSYpgSKP0FIow1cA3xS79I9H6TTxsZ5VkWWyhZDKJ461cferiqZrAtmZpE3bdFF4WBwWWeMVNgWbeI0vNJE1OKMWRezTsCaYifd4A2rAglmNsQdyPqUz/8PT/V/JsPhOPxhIgQXNQGpOd7nLNnUEJ6K/N895m0FBeOihJIpFWyJcBOs2gf7SCacStNhho/trxJH8xwt7uR744D3E4EYVa4ysnSNZfdrNPdbckAf5SzLGPkoUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N50doD2EuYqM+aK+txZfmF5JY3yulohlXi1t+tp4nVA=;
 b=tMRBCurED6vOwQ5AffhdcUT700QT5vULmyW1Mc7rtFOrmkP42icw0mONO1Pl1K7nk5EDFPVGmuQ6ZLzvAd+XHnC2OgjjZWnZl+8F5kBOx6YTwhBy/tJZbr7y8HqwlZvijggsNUumNWzuuV3kC9SZmSm3FoXWezQdxLP+Eh2KrXjlBh5VQF5mgMI2BqzWty2iX9XQvFdmgPqgx591BquqDq4mUlru0Xklis/TOvTHHYFErINdplFBYFkh3w2lSn9pAVbHp+Hm9+72NeAbZs0RpOEpEByPTHkcXiWZtMsz3JjYXz+aemjnn8ie4jRrDjULMjqxfej3kjzTlm4LSfO2cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N50doD2EuYqM+aK+txZfmF5JY3yulohlXi1t+tp4nVA=;
 b=KqdNIs6Ugpn3ySAcjA3wl3HBlnfhDbCg7c6rKO6A7h2qyw3OOP4ZHt6Ah3AsmHjs+eyTWtVW5k9T01qi+hwLAL8fzZy5GhXw9rtRdGs5tVxf52ijA8EphHM4mm1j0fHvT5EWJHf49+ojMZ0QWrdBaCZHKqKMxg1RiQLEiPxinb0KZ802l1BKEQ0KFJCAJbFGd228QgdR2tjeXp+Hc+UZxD2U5kGZi8qQYj31VtcB3DDlZMFk6KdlmgofeEAJpC6hVpikxe9e6F+hLg4Uyk2c0Ochnxo2k/Ybxg9hDd86oNrexNzrLG0nzCxmY/5zsM7GOzr7Y2nRH3jwBnuRTe8aBA==
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com (2603:10c6:10:32c::14)
 by SY6PR01MB8347.ausprd01.prod.outlook.com (2603:10c6:10:1da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 22:34:45 +0000
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19]) by SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19%3]) with mapi id 15.21.0522.002; Thu, 8 Oct 2026
 22:34:45 +0000
From: Zhang Jiaxi <Z1529105815@outlook.com>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 4/4] ASoC: qcom: q6apm: recover PCM from failed data
 receipts
Thread-Topic: [RFC PATCH 4/4] ASoC: qcom: q6apm: recover PCM from failed data
 receipts
Thread-Index: AQHdV3U3WIlOi83Ne06dTfIKe6yXxQ==
Date: Thu, 8 Oct 2026 22:34:44 +0000
Message-ID:
 <SY5PR01MB106003E6E5C01FC8CD6AB06DEA1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY5PR01MB10600:EE_|SY6PR01MB8347:EE_
x-ms-office365-filtering-correlation-id: 3777699e-9acb-447d-6105-08df258c5a43
x-microsoft-antispam:
 BCL:0;ARA:14566002|51005399006|41001999006|38102599003|24021099003|25010399006|15080799012|25031999004|31061999003|8060799015|19110799012|12121999013|8062599012|40105399003|2607281247196008|102099032|3412199025|26104999009|440099028;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TYivkRuELJSk9wxvMoSMwb2x49b12UbMYEJxDPdgUHE4RClkxWZgld8gofIr?=
 =?us-ascii?Q?yj91gsfuMrG1YLAmUof9bkWxJG2D4RdHrnHUadDVclh1u1uAfQcWFW3lqc1H?=
 =?us-ascii?Q?WlS855vJezzVHA82BcCVvoUH6Jf5CXc7hrLd+bVvfthJMCi2uVVDomdFE9SE?=
 =?us-ascii?Q?1U3H+eZNRncR9tyYrx0zy6UPhjltTXxq6Tgfw29K6flsH9uT/IHSCPqSX1bY?=
 =?us-ascii?Q?AfYtDXG57XZA4VgJuj++7ocgBZnmEj2qaq/8wjFqZlYq/3dXhw+dC4WhCifl?=
 =?us-ascii?Q?pAKK37zGLXsV+M0I92BpMk/fRQsUpYmpxoN5dj43EZ6ua7PaBPtNuUo1C1IC?=
 =?us-ascii?Q?IjLDYxc9ksL0q5rMPZMBBHqJ/SjG/PUv32S35S94LhyunMo2iZyTT93FshZ8?=
 =?us-ascii?Q?uk6DzXxnCUjXVmn8aRyqOCQYEkvZnE3vhOko4hYYACQHhWx6SBWb1fLdBgk8?=
 =?us-ascii?Q?GdxI6J1//b93mAnceL8ygdZ2OKwx7EeMtI17AwSRFceiTY8jhxUOnxGz8VWw?=
 =?us-ascii?Q?ySse2/u7/zLI0vmt4StlIeTMPIBawB5aRF3fx49+BCMV1qrzthCr2fqZfjao?=
 =?us-ascii?Q?W6y3tFK9XsEewx+/8+cxHNqakvi9j9HsM4TETsSAtZWcHx6+v4ONr0Mm2Ipv?=
 =?us-ascii?Q?J1YCjDL5mCVIwwLoXg250wT+65VXMoIj43Usk4eDK+zyB3hZF6sIMqsqBpEj?=
 =?us-ascii?Q?4HO1Wpq9xvpIXX5hW3Ayb4hlv3V9s8pdasv71gQPR07jY296msMYiLRfyolD?=
 =?us-ascii?Q?6uXEjXVYuHF6HseQCWmxQeAMRYBFVwdmZoPyyeLnVQbKXk4k8d7ML4Jeufpy?=
 =?us-ascii?Q?qmz1CvTW6pBSB3/g9uU3aAnJ8adLTLuuNrBPQP2eE4UCqVq0oWxLQoe0ES6R?=
 =?us-ascii?Q?tg+LDoWS14bQ06SFSCC783pW83IYyZah8Ckj5YK7KZwGgfykJg/VsMpl5JI2?=
 =?us-ascii?Q?79yuYjrwC9Hrj12wvjgsy2AYPjTiYvS/jCJmlJdrs6J3DJNIgI4HGJt45u+T?=
 =?us-ascii?Q?aRJ33tRDfp/bEXKKoBMl+71CpmU8Z6gTiF84dMzv1+GoZXNIE/4V97TMO43d?=
 =?us-ascii?Q?UxH2WoH6?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7Dqe3gnU+V1yevYqaxUGuY5rwKasG11kYQbNKc0wfXIU5dywYGORZdNc5Xnp?=
 =?us-ascii?Q?5W2oZy59kMK0kI+1lFk+cRzFjs0zE17VzWZ4iMcpYrFk4/O2zMlBADbBwUp5?=
 =?us-ascii?Q?ovryp4vvBP5s5qoqw1z+0CwGxhsevE97g4o8SZwAxNQsd+9t2qnmw1/hUqWa?=
 =?us-ascii?Q?jerRim9ChFzp6GLeEbVwFKapg+7wVQb4bDH9PUUMwtFi8LoEB1cGY8CwQ16H?=
 =?us-ascii?Q?DyP3UyL3UP1D1rSqyvaMN1TZ1sV+RJ+gYIIFeOAsvrJxsUZENL4kBfWqYz66?=
 =?us-ascii?Q?+9TOY3+Wl6gc3dCTy4kH3awdmvuhDRfN2YEfo63a8VI0Z+v8oxavSvi1tbxh?=
 =?us-ascii?Q?3g/Lc9dFMrFilNsXgvet99cvMjn+PWbBIzrSuQBOHeXeYbHaV/+LtQaZ3zVo?=
 =?us-ascii?Q?0GHPLzv7JbkEPO3v+RF62EVgcrVIzeJTDAQiIEq5GG5ZirFmdwf8V4pBa9AB?=
 =?us-ascii?Q?tW4PKzWN66rotebWTD5LpZaMogpsqpJh0zXPyP/1b0vlXohtW1EhvMMgHNrn?=
 =?us-ascii?Q?lIGQLdNBwX4B7vkyghWX1wUZ3hnw4/WUhtElQyOZ80F6I013wv5Ez8FQYvz0?=
 =?us-ascii?Q?pYNh+i0259zbaTEKMJSv26VexPaEdGyIwWN6gh7qsjrVjKWK9rW0xzn+Y5WH?=
 =?us-ascii?Q?phhLywqEcjKmXdQRJp8V6Cm1tnb8nRTTxxDBovHASasDrTk09eS5hLSttfAn?=
 =?us-ascii?Q?Nwzc/7Sgi826cV1O3xXktOQhlqrg08rql0YBLrlfZuXyw6fhz6jFj9gLXs9j?=
 =?us-ascii?Q?zdcGlR4uae/ku13o8w96/Yz1cggPRJN1rzl8GK5H5xh3cltbymIgIHJmJGzZ?=
 =?us-ascii?Q?v8h6MdkzKUqizsmzBiqAAcvr2r634qwF56WjIy7pYnc51Trfq8vZAqmqzWW+?=
 =?us-ascii?Q?Oj6yEgd3KB9cOwiCBW4pw6vuMSwuKuh4gHCzSFU+aVHYlqzob+2IQ1s9EyAq?=
 =?us-ascii?Q?TDGHIWc2p1vy6BiNYNDM2qi2J6HMf+eUkpUT2LpsNqn2K/LuuB6j/cAx0Rqs?=
 =?us-ascii?Q?9Ux3UN1DwjukIEZFHXfAZqhGaz9ciTT71WGlE94YlVzgd2Wurmc+DtLWN+tG?=
 =?us-ascii?Q?PKw4i0Pwo79ffadbpzja2k2NqofpEAa8h4Dxti2+UY7SQadbG67zU6+47K6f?=
 =?us-ascii?Q?uob2mj6pF0lYmGO/t1KGXtpNeztia3JzNa9/mGBWSNJJY4YBtdLdJj5fhzk6?=
 =?us-ascii?Q?PfRteBhBYzq4nTUPE8j0PFXdrVSIxJghbX9Hd+CEX/iTreFO5J5ltODJ1yUk?=
 =?us-ascii?Q?+dy5CP4v+sqH36rncjvahpsmX8NHs5PnoyOSFIevLuBpvQo48+PKusrEc9o/?=
 =?us-ascii?Q?5REWv8R80GsK/XPfrwDRPm0Xb+I/3auMk0mHtYyIMubI8hq2o8po5/f+vpRi?=
 =?us-ascii?Q?Vfi5m6IEp2afakZC9frKk/TJtydQ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3777699e-9acb-447d-6105-08df258c5a43
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 22:34:44.9731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY6PR01MB8347

From: Jiaxi Zhang <z1529105815@outlook.com>=0A=
=0A=
graph_callback indexes period buffers using unchecked DSP tokens and=0A=
publishes hw_ptr before checking the returned address. A valid DSP data=0A=
failure also reaches the normal period callback. The PCM consumer then=0A=
advances ALSA progress and may queue another capture read.=0A=
=0A=
Validate the complete V2 payload, period index, both address halves and=0A=
submitted memory-map handle before publishing a result or event. Opt the=0A=
PCM client into a host data-error event: a matching nonzero primary DSP=0A=
status latches a PCM error without advancing hw_ptr or sending a normal=0A=
completion. Stop a running PCM as XRUN, suppress later period callbacks=0A=
and capture requeues, and make ack, start and pointer observe the latch.=0A=
A normal prepare clears the latch and can recover the stream.=0A=
=0A=
Capture reads are submitted during prepare, before ALSA is RUNNING. Keep=0A=
an early error latched and fail prepare/start rather than taking the PCM=0A=
stream lock in that state. A nonatomic backend START may be awaiting a=0A=
GPR reply while owning that lock. The pointer's XRUN result also exposes=0A=
an error arriving between the final prepare check and START. Use=0A=
READ_ONCE/WRITE_ONCE for the new flags shared with the GPR RX callback.=0A=
=0A=
Clients which do not opt in, including compressed audio, retain the=0A=
existing valid-receipt status handling. This patch does not claim=0A=
compressed DSP-error recovery. Malformed or identity-mismatched receipts=0A=
cannot be attributed to a live stream and do not generate an error.=0A=
=0A=
No new deferred worker or GPR lifetime contract is introduced. Existing=0A=
late-callback, recycled-token, port teardown and DSP restart limitations=0A=
remain; the current mapping/period identity is not a generation tag.=0A=
RD offset/data_size and metadata-status semantics are also unchanged.=0A=
=0A=
This draft targets sound.git for-next=0A=
62d9f9ffdfd44e88010412bf8f23732f0a93a9be. A focused test extracts the=0A=
actual callback and PCM prepare/ack/trigger/pointer consumer functions=0A=
and models ALSA/transport APIs. It demonstrates the baseline false=0A=
progress and the bounds-only stall, then checks matched WR/RD errors,=0A=
untrusted receipts, early errors and normal prepare recovery. It passes=0A=
with AddressSanitizer and UndefinedBehaviorSanitizer; three compile=0A=
warnings concern the harness READ_ONCE mock on existing packed pointer=0A=
fields. The expanded patch has not been hardware-tested or=0A=
lifetime-stress-tested. Target object compilation is recorded separately.=
=0A=
=0A=
Signed-off-by: Jiaxi Zhang <z1529105815@outlook.com>=0A=
=0A=
---=0A=
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c=0A=
--- a/sound/soc/qcom/qdsp6/q6apm.c=0A=
+++ b/sound/soc/qcom/qdsp6/q6apm.c=0A=
@@ -570,9 +570,7 @@=0A=
 	struct device *dev =3D graph->dev;=0A=
 	uint32_t client_event;=0A=
 	phys_addr_t phys;=0A=
-	int token;=0A=
-=0A=
-	result =3D data->payload;=0A=
+	u32 token;=0A=
 =0A=
 	switch (hdr->opcode) {=0A=
 	case APM_EVENT_MODULE_TO_CLIENT:=0A=
@@ -588,6 +586,10 @@=0A=
 	case DATA_CMD_RSP_WR_SH_MEM_EP_DATA_BUFFER_DONE_V2:=0A=
 		if (!graph->ar_graph)=0A=
 			break;=0A=
+		if (data->payload_size < (int)sizeof(*done) || !data->payload) {=0A=
+			dev_err(dev, "WR BUFF Invalid payload size %d\n", data->payload_size);=
=0A=
+			break;=0A=
+		}=0A=
 		client_event =3D APM_CLIENT_EVENT_DATA_WRITE_DONE;=0A=
 		mutex_lock(&graph->lock);=0A=
 		token =3D hdr->token & APM_WRITE_TOKEN_MASK;=0A=
@@ -597,14 +599,33 @@=0A=
 			mutex_unlock(&graph->lock);=0A=
 			break;=0A=
 		}=0A=
+		if (token >=3D graph->rx_data.num_periods) {=0A=
+			mutex_unlock(&graph->lock);=0A=
+			dev_err(dev, "WR BUFF Invalid token %u\n", token);=0A=
+			break;=0A=
+		}=0A=
 		phys =3D graph->rx_data.buf[token].phys;=0A=
 		mutex_unlock(&graph->lock);=0A=
-		/* token numbering starts at 0 */=0A=
-		atomic_set(&graph->rx_data.hw_ptr, token + 1);=0A=
 		if (lower_32_bits(phys) =3D=3D done->buf_addr_lsw &&=0A=
 		    upper_32_bits(phys) =3D=3D done->buf_addr_msw) {=0A=
+			if (done->mem_map_handle !=3D graph->info->mem_map_handle) {=0A=
+				dev_err(dev, "WR BUFF Unexpected handle %08x expected %08x\n",=0A=
+					done->mem_map_handle, graph->info->mem_map_handle);=0A=
+				break;=0A=
+			}=0A=
 			graph->result.opcode =3D hdr->opcode;=0A=
 			graph->result.status =3D done->status;=0A=
+			if (done->status) {=0A=
+				dev_err(dev, "WR BUFF DSP status %08x metadata %08x token %08x\n",=0A=
+					done->status, done->md_status, hdr->token);=0A=
+				if (READ_ONCE(graph->pcm_data_error)) {=0A=
+					if (graph->cb)=0A=
+						graph->cb(APM_CLIENT_EVENT_DATA_ERROR, hdr->token,=0A=
+							  data->payload, graph->priv);=0A=
+					break;=0A=
+				}=0A=
+			}=0A=
+			atomic_set(&graph->rx_data.hw_ptr, token + 1);=0A=
 			if (graph->cb)=0A=
 				graph->cb(client_event, hdr->token, data->payload, graph->priv);=0A=
 		} else {=0A=
@@ -616,6 +637,10 @@=0A=
 	case DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER_V2:=0A=
 		if (!graph->ar_graph)=0A=
 			break;=0A=
+		if (data->payload_size < (int)sizeof(*rd_done) || !data->payload) {=0A=
+			dev_err(dev, "RD BUFF Invalid payload size %d\n", data->payload_size);=
=0A=
+			break;=0A=
+		}=0A=
 		client_event =3D APM_CLIENT_EVENT_DATA_READ_DONE;=0A=
 		mutex_lock(&graph->lock);=0A=
 		rd_done =3D data->payload;=0A=
@@ -623,15 +648,34 @@=0A=
 			mutex_unlock(&graph->lock);=0A=
 			break;=0A=
 		}=0A=
+		if (hdr->token >=3D graph->tx_data.num_periods) {=0A=
+			mutex_unlock(&graph->lock);=0A=
+			dev_err(dev, "RD BUFF Invalid token %u\n", hdr->token);=0A=
+			break;=0A=
+		}=0A=
 		phys =3D graph->tx_data.buf[hdr->token].phys;=0A=
 		mutex_unlock(&graph->lock);=0A=
-		/* token numbering starts at 0 */=0A=
-		atomic_set(&graph->tx_data.hw_ptr, hdr->token + 1);=0A=
 =0A=
 		if (upper_32_bits(phys) =3D=3D rd_done->buf_addr_msw &&=0A=
 		    lower_32_bits(phys) =3D=3D rd_done->buf_addr_lsw) {=0A=
+			if (rd_done->mem_map_handle !=3D graph->info->mem_map_handle) {=0A=
+				dev_err(dev, "RD BUFF Unexpected handle %08x expected %08x\n",=0A=
+					rd_done->mem_map_handle, graph->info->mem_map_handle);=0A=
+				break;=0A=
+			}=0A=
 			graph->result.opcode =3D hdr->opcode;=0A=
 			graph->result.status =3D rd_done->status;=0A=
+			if (rd_done->status) {=0A=
+				dev_err(dev, "RD BUFF DSP status %08x metadata %08x token %08x\n",=0A=
+					rd_done->status, rd_done->md_status, hdr->token);=0A=
+				if (READ_ONCE(graph->pcm_data_error)) {=0A=
+					if (graph->cb)=0A=
+						graph->cb(APM_CLIENT_EVENT_DATA_ERROR, hdr->token,=0A=
+							  data->payload, graph->priv);=0A=
+					break;=0A=
+				}=0A=
+			}=0A=
+			atomic_set(&graph->tx_data.hw_ptr, hdr->token + 1);=0A=
 			if (graph->cb)=0A=
 				graph->cb(client_event, hdr->token, data->payload, graph->priv);=0A=
 		} else {=0A=
@@ -645,6 +689,7 @@=0A=
 			graph->cb(client_event, hdr->token, data->payload, graph->priv);=0A=
 		break;=0A=
 	case GPR_BASIC_RSP_RESULT:=0A=
+		result =3D data->payload;=0A=
 		switch (result->opcode) {=0A=
 		case APM_CMD_SHARED_MEM_MAP_REGIONS:=0A=
 		case DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT:=0A=
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-=
dai.c=0A=
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c=0A=
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c=0A=
@@ -96,6 +96,7 @@=0A=
 	struct q6apm_graph *graph;=0A=
 	spinlock_t lock;=0A=
 	bool notify_on_drain;=0A=
+	bool data_error;=0A=
 };=0A=
 =0A=
 struct q6apm_dai_data {=0A=
@@ -240,6 +241,7 @@=0A=
 {=0A=
 	struct q6apm_dai_rtd *prtd =3D priv;=0A=
 	struct snd_pcm_substream *substream =3D prtd->substream;=0A=
+	snd_pcm_state_t state;=0A=
 =0A=
 	switch (opcode) {=0A=
 	case APM_CLIENT_EVENT_WATERMARK_EVENT:=0A=
@@ -249,14 +251,29 @@=0A=
 		prtd->state =3D Q6APM_STREAM_STOPPED;=0A=
 		break;=0A=
 	case APM_CLIENT_EVENT_DATA_WRITE_DONE:=0A=
+		if (READ_ONCE(prtd->data_error))=0A=
+			break;=0A=
 		snd_pcm_period_elapsed(substream);=0A=
 =0A=
 		break;=0A=
 	case APM_CLIENT_EVENT_DATA_READ_DONE:=0A=
+		if (READ_ONCE(prtd->data_error))=0A=
+			break;=0A=
 		snd_pcm_period_elapsed(substream);=0A=
 		if (prtd->state =3D=3D Q6APM_STREAM_RUNNING)=0A=
 			q6apm_read(prtd->graph);=0A=
 =0A=
+		break;=0A=
+	case APM_CLIENT_EVENT_DATA_ERROR:=0A=
+		WRITE_ONCE(prtd->data_error, true);=0A=
+		WRITE_ONCE(prtd->state, Q6APM_STREAM_STOPPED);=0A=
+		state =3D READ_ONCE(substream->runtime->state);=0A=
+		if (state =3D=3D SNDRV_PCM_STATE_RUNNING ||=0A=
+		    (state =3D=3D SNDRV_PCM_STATE_DRAINING &&=0A=
+		     substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK))=0A=
+			snd_pcm_stop_xrun(substream);=0A=
+		else=0A=
+			wake_up(&substream->runtime->sleep);=0A=
 		break;=0A=
 	default:=0A=
 		break;=0A=
@@ -353,6 +370,7 @@=0A=
 =0A=
 	prtd->last_pos_index =3D 0;=0A=
 	prtd->pcm_count =3D snd_pcm_lib_period_bytes(substream);=0A=
+	WRITE_ONCE(prtd->data_error, false);=0A=
 	if (q6apm_is_graph_in_push_pull_mode(prtd->graph)) {=0A=
 		if (prtd->pcm_size !=3D prtd->push_pull_size) {=0A=
 			ret =3D q6apm_push_pull_config(prtd->graph, prtd->phys, prtd->pos_phys,=
=0A=
@@ -414,6 +432,9 @@=0A=
 		}=0A=
 	}=0A=
 =0A=
+	if (READ_ONCE(prtd->data_error))=0A=
+		return -EPIPE;=0A=
+=0A=
 	/* Now that graph as been prepared and started update the internal state =
accordingly */=0A=
 	prtd->state =3D Q6APM_STREAM_RUNNING;=0A=
 =0A=
@@ -425,6 +446,9 @@=0A=
 	struct snd_pcm_runtime *runtime =3D substream->runtime;=0A=
 	struct q6apm_dai_rtd *prtd =3D runtime->private_data;=0A=
 	int i, ret =3D 0, avail_periods;=0A=
+=0A=
+	if (READ_ONCE(prtd->data_error))=0A=
+		return -EPIPE;=0A=
 =0A=
 	if (q6apm_is_graph_in_push_pull_mode(prtd->graph))=0A=
 		return 0;=0A=
@@ -455,6 +479,8 @@=0A=
 	case SNDRV_PCM_TRIGGER_START:=0A=
 	case SNDRV_PCM_TRIGGER_RESUME:=0A=
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:=0A=
+		if (READ_ONCE(prtd->data_error))=0A=
+			return -EPIPE;=0A=
 		break;=0A=
 	case SNDRV_PCM_TRIGGER_STOP:=0A=
 		/* TODO support be handled via SoftPause Module */=0A=
@@ -504,6 +530,7 @@=0A=
 		ret =3D PTR_ERR(prtd->graph);=0A=
 		goto err;=0A=
 	}=0A=
+	WRITE_ONCE(prtd->graph->pcm_data_error, true);=0A=
 =0A=
 	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)=0A=
 		runtime->hw =3D q6apm_dai_hardware_playback;=0A=
@@ -593,6 +620,9 @@=0A=
 	struct snd_pcm_runtime *runtime =3D substream->runtime;=0A=
 	struct q6apm_dai_rtd *prtd =3D runtime->private_data;=0A=
 	snd_pcm_uframes_t ptr;=0A=
+=0A=
+	if (READ_ONCE(prtd->data_error))=0A=
+		return SNDRV_PCM_POS_XRUN;=0A=
 =0A=
 	if (q6apm_is_graph_in_push_pull_mode(prtd->graph)) {=0A=
 		int retries =3D 10;=0A=
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h=0A=
--- a/sound/soc/qcom/qdsp6/q6apm.h=0A=
+++ b/sound/soc/qcom/qdsp6/q6apm.h=0A=
@@ -42,6 +42,7 @@=0A=
 #define APM_CLIENT_EVENT_DATA_WRITE_DONE	0x1009=0A=
 #define APM_CLIENT_EVENT_DATA_READ_DONE		0x100a=0A=
 #define APM_CLIENT_EVENT_WATERMARK_EVENT	0x100b=0A=
+#define APM_CLIENT_EVENT_DATA_ERROR		0x100c=0A=
 #define APM_WRITE_TOKEN_MASK                   GENMASK(15, 0)=0A=
 #define APM_WRITE_TOKEN_LEN_MASK               GENMASK(31, 16)=0A=
 #define APM_WRITE_TOKEN_LEN_SHIFT              16=0A=
@@ -98,6 +99,7 @@=0A=
 struct q6apm_graph {=0A=
 	void *priv;=0A=
 	q6apm_cb cb;=0A=
+	bool pcm_data_error;=0A=
 	uint32_t id;=0A=
 	uint32_t shm_iid;=0A=
 	struct device *dev;=0A=
