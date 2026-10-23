Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.36.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792750761;
	b=JcfnZiYZBtZbLn5B4K8ru3F9QILkel68ULtHgIKFI7k7wtbfaZXwurQ8PBSnywpPwV0Z
	 uvCXINuwbabFZpg5EzIGudxmq/JuJf6N5V36xetx+lu6HWV1eD84wiSeXrF6an74ETA5N
	 NVrzCanaRmZqPCqykjkEoq1jX0Rdi9C5UkTk+8fG6DfzwePcUly6XJh78X7Nt3B+vVtxt
	 sMgW+cGNohMfXzpdilPPe0H7O2WseCsn+MOP7tbt/XFVCL7/8OfQKJpn+AB+JD1ExXfrG
	 0INhTmW1ord3GiD1xw8QI96a/9WZ+uRmgqpl5fCsE7+zazi/YmhfsImf3kni/btOztQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750761;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-exchange-messagesentrepresentingtype:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Uc5CQYSFr9oWc1WidFFtmSBljN5OPzEe1EDHe0gubKk=;
	b=zQqI+eW+0WDdIPt2Cq4uuIeMFmdeyEwN1ciRfJ5tw1gD3r2r4BtaF38HGkJy+jow99K8
	 2fKVcE1a/tHOlcjWmGvXCmmNjgXPd//x3faa+0Am1Y9BdFvIoJGsi1GREvoySWMqsiZsl
	 /i81xY/+IX/qZuGrKtxWB0razl95Tpe2J4PMgv84y/+nwMeleVBnQfegBO2+mpEE4GTmI
	 M884Xr8Qcs2hFejlCY0oAbPxdK7bBEhbW1w1OTFPm3J8UBaA4YrrnHYaIUvSNdrPP3Wt+
	 bRFd+H5/e+1thcRhE4ux5T5FQlaHZbC9k6yNg8z6a2dXKZvt9TwOitvskBPO3U5EYJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=bxO8MJ6I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.36.6
Received: from MA2P292CU005.outbound.protection.outlook.com (mail-spaincentralazolkn19010006.outbound.protection.outlook.com [52.103.36.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E535E606A331
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E535E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=bxO8MJ6I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhlSN9kbs2KWVjjxbzyjPO9Lm0JW+ZAh+QJXFC/0L/Z/YDdcJ6dW8l7Wj0cyjm2L+24A+f/onvWJShYe8b8Gfij7Unyb1oVaZuiVNTmUAajwAO9y2YU5dZUSzotwCK8OKLo3Uo19esJb/YhRSaOCRAQ93SporSEZ6/ug9F6w0/NX/f7Za/OznC/ZgaaBR/S2uaX0y4CmSR1w7Kx+Kcwb2e6iXv1m+sGqvNCm3AnZcSHx4YqKQ7jjNS1xiIw3zotjTGLFkyf+vnmTJ6NFEMU2rAEvV2Ev/EYcfz+QxK4/nR3lwVw5JJknHTM4b2U7ZPIWGR2mjcLI2RUDLEkXwyBG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uc5CQYSFr9oWc1WidFFtmSBljN5OPzEe1EDHe0gubKk=;
 b=QhuQnMLCxNnu1Cxan3QIh4/XTkEakWiaIRZ83lYwzV6VIOEp7xg+z60GnY4lih3+NfZpq2TerkXwTD0Z0AG+AZRNewcNn5lwAzBA47k29BLBOibsSte5le2RWkVhFqPws8m6VCjr4a3evIc/rbKBMslm6t52UOX/TNlO7KD/BcvuLf5wVDSeK6yiu03nXkltHchmBGKv6P/QsJSoN0FBy7SPD9qI6Pp0dyL3oNMaJV3B0UY8MYDRnk/f6fA20dQqahlpXLKfQDvaAkXb8s5s7kiTtjp8rBZB8iS5IXvAJWmkC9Xuoz8XwBOrTtRvrSw0WpAmPRPc9PP4eVEcRFdnmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uc5CQYSFr9oWc1WidFFtmSBljN5OPzEe1EDHe0gubKk=;
 b=bxO8MJ6IS6/ASvllxSKQRkcs8TPPbB5L7IpqDSWg98d9cCBi9UCQaSWcHeUmJCZJZVWJobZqulPU4Ni4vFxPwyfTJuQxc6PwKVl3TBgDG+zkdK/X1SoD4IQ1kYDJCFxbixJjov0FxIlKb5qBAZ2O5jkuMFnVCAzJplwvaLoTsyuaAfglfCD3wC8sc2zWUjHL40zL9asSlaUl5mEA1sJ6hdGC6obwARXwpiGdYIKk6yjYy3mQbcTpi+tIKklNkko7w3JS3C5T2fYMTcHG1i0kwzHdH1KuQrgjtUnBdlKbc6yHOVIX531FGnNXdSNBCYv3pNMo29BGl5AXkKhorRd/ZQ==
Received: from MA3P292MB0360.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:25::7) by
 MA4P292MB0149.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:34::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.19; Fri, 23 Oct 2026 10:19:17 +0000
Received: from MA3P292MB0360.ESPP292.PROD.OUTLOOK.COM
 ([fe80::dd53:905f:fc97:e918]) by MA3P292MB0360.ESPP292.PROD.OUTLOOK.COM
 ([fe80::dd53:905f:fc97:e918%5]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 10:19:17 +0000
From: Kalle Nick <nick.kalle.26@outlook.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: [PATCH] mm/page_alloc: optimize zone threshold filtering for modern
 x86_64 topologies
Thread-Topic: [PATCH] mm/page_alloc: optimize zone threshold filtering for
 modern x86_64 topologies
Thread-Index: AQHdYteAM4gtObIT90+MjqqEQQeGyg==
Date: Fri, 23 Oct 2026 10:19:17 +0000
Message-ID:
 <MA3P292MB036046A23F40297C3133F7F4B8642@MA3P292MB0360.ESPP292.PROD.OUTLOOK.COM>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA3P292MB0360:EE_|MA4P292MB0149:EE_
x-ms-office365-filtering-correlation-id: c60b92a5-b758-496e-5efd-08df30ef1899
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|15080799012|15030799006|51005399006|24021099003|41001999006|25031999004|19110799012|8062599012|8060799015|4040399003|3412199025|440099028|102099032|18061999006|12091999003|3430499035|40105399003;
x-microsoft-antispam-message-info:
 =?koi8-r?Q?yF65qGcJSUkIvTM1yl5GjElge2SLbk+qOomqn3g+b1z7AK9KKvjx2Nn2Az2PmR?=
 =?koi8-r?Q?s6ctuC1/JVIorp4IM8EaMlcMIFR4A9skmmJprsPiq7EU85hMzUZut4dh86ZAI+?=
 =?koi8-r?Q?C6emo/BB3Lc1WC1v6vzWo9bfLZodGm+4ejcTWJas9SDJp2gN3QDcmahx5lle2Z?=
 =?koi8-r?Q?b+1Vau8oCvEb17qHx+TlMstqLPcLMOivo9eC8KGNfHCRONB0EU/viG98vUS98E?=
 =?koi8-r?Q?kvA6iF7zUqCjg9fdG4TIYYmx4DHmnLYx1dkP+gQD0uLuVRxpQoQ0ikvFgz0wQ9?=
 =?koi8-r?Q?4JkY5YcjWISx27NqgYsqPNB8xvJQwjXw5n2wPA3IJ1oG6EL18xKKtyyGBzOGlr?=
 =?koi8-r?Q?29OQuc1OWzHFC7QJ+Z7X2D2JWDaqTd7FIN0lzkOtciYGOSURzOHAlxDknZuQ4b?=
 =?koi8-r?Q?EwoOdmv0uvGoKbdkZDz/2aMIbJ4UxZg7SctSl2X81Cyb3CoEwMzLND7pNXDodg?=
 =?koi8-r?Q?HpeyOVHVYNetn2cjMHkJdIN+Rya/nTlAbvyN69qP4/22elnHsyj5g4Jz7EuYbB?=
 =?koi8-r?Q?teuHxKkwi6ajv8/VXMUauQgkUHN3fGSU1dsESbmJsVIffD+Xi1iBt8UNZ6qdPf?=
 =?koi8-r?Q?QH41EQk51K3YokjMUpUXA6wvkYNlcIZQxYl2gzd+Jx25c8EJWu8xV3npLuBPDf?=
 =?koi8-r?Q?+33Uc59fOxXvnoAzEMlPszUIIpOJP8H3Na/RaBlwY8gwRzqB7QvI+fG29cfgdW?=
 =?koi8-r?Q?xyJOVmmegzia1RiIM0TxoIKUGiGRhhbiaQEk/v70W2sMat5kguJZ4l7+h2u6V2?=
 =?koi8-r?Q?lcOLZ97jNsZi1nFxccPxSticxlHzAwiWKDfi00VrMQYmMEiaJrFSWJSQ9IYmX3?=
 =?koi8-r?Q?1kRokbuGD6hd5dUE5DCjr8BuZUj+RPTEIjJXM2c0nnyFJeJN2Ea+TDd6Ro8G/B?=
 =?koi8-r?Q?5fOYzICUyJlPitXwGXWsqaYe1ZRElaooa6Iz/k3fjAnZyhpF66km9a+Vfx8ckJ?=
 =?koi8-r?Q?sEmLkjDCajdLtpHzbgGGgj84q6oqpNnkIlKeUvP1gajwzgm5b14f3A/+6JzTvl?=
 =?koi8-r?Q?lSK5tzvWtkktu1E5lbcdag7WsHI2QETVqqvMk0saSd66/tlc8tNrjDmeHsNa/c?=
 =?koi8-r?Q?rF/JXyYLcmQ36Bo=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?koi8-r?Q?3e3WE2eFdtr5cme7dFN5YruLxXIqsSq/mMbH2rh1eZ+8e2XdUBlxBM2CjBOBUw?=
 =?koi8-r?Q?fqsJbjnDvK1iazwS/cvmcqB9qS2CE78q9x3JDA0E29QJFSK2I/6mDLzSaNIMHF?=
 =?koi8-r?Q?mdyyGxvpp3syvQzR3+pbPrQ/SItTqx8/X/y4Ri3TsQ954am5RbqEJeFij3j9y0?=
 =?koi8-r?Q?wqebu9TLKjgPsxv9JhYdL8uUhWmi4W+rtWiyc2FNQMLYgtJdd7jJAIouwyjOx+?=
 =?koi8-r?Q?uIUjqXxUxm8kQQ3oYJ7OskeIVYAqcOLgTpq5NPcz2JccO6W/9sS2kej4G6Ep1N?=
 =?koi8-r?Q?L7X1aWEaCL3ov7VWDZ5MEeG6pA74PPoInftKGdHByOKiaKVfxg75k+G7KpYri7?=
 =?koi8-r?Q?/mppwTPz8X9yIdS2JkWstX3cL2nGbb+5vXur2Hk3ueu5rlch4cz0sd61EjCNcP?=
 =?koi8-r?Q?44BfPkNM1FXsSiH5/7u4ifHrg5FEFSllfNyHuNY7R+iwNCBvO7PqSRivEmYDvD?=
 =?koi8-r?Q?45wjKnEfCtz2M7sHNpzhcbbtK/e4QWsjNyEk/yzfK7CFzbZZumpE7nh+6THXrS?=
 =?koi8-r?Q?HQ5w5rD9dcN6v4b5bGteATI6/gt5oWreTpaHpirjl8Xh23cpDA7X69lEhHXQq8?=
 =?koi8-r?Q?rHOvHdvQ+50XXJ4GhmtdymQwrgJsarXpiz7FBq8veDHz0iUIN3jFdGNrGHZ8B8?=
 =?koi8-r?Q?aBaNAfWIk0LYW/RrswtTFtBmabN2em1dKYYZyG9THnkskop09hIlMiMRIhO+f2?=
 =?koi8-r?Q?0D/gVLT1voICH3qMnuoVKtOu7YtmsSlM0y75uYrGtYRLcmjS4XZgBghAoy/V/s?=
 =?koi8-r?Q?Y/3BUtpmrWx1acnL2txViRLdj89jgsfGp4AOt+Z7OgYfalBdFKKv/vcvP2s+k/?=
 =?koi8-r?Q?NmZ+Ygv9Z6u4JnMDQDEoae04QyIQloaXr9JCzCn/TNHn15H1nwnabGmGbFdv+x?=
 =?koi8-r?Q?kKyVQLnBlKAW7LMY4EPi/jIeAbAc7pYpPDltzBqimv/Z03kdKyPOhxBmPYpRMZ?=
 =?koi8-r?Q?EjtUmu/k2fG30jBuf+dVisN43n/5Y3Chpq4K7oAfgc0Y3LkqV9P6Q3UyKv1EGB?=
 =?koi8-r?Q?Y5bilgnB5IV4sctIUTBBtutR2TD7NEfTF/5otxRNRshJq5o1whsJ5XeyCJu+Ue?=
 =?koi8-r?Q?Nx/k4KMjsMju0Y325j/3rMR2NDXARO/Gr5y9+KYMbScS3UkWwcjdwBqyDHMDU8?=
 =?koi8-r?Q?zwz9hpQxyZMvVZTkY/m3NEUZXyqtJ0cnNprg/qcW4Fh1uqEM/qBkQjuvEFmUbD?=
 =?koi8-r?Q?EELvsVd6MANQ3DMY34qhyWKAGrt+0RIQln28ZXrZ6cmIgN2SLrUXMRyoPniYaE?=
 =?koi8-r?Q?Mu71A+STTtiqK9uPv46y3ytyXthd2r0WYxcPP4IEurVurSlAfx5RX0dmMvKuvG?=
 =?koi8-r?Q?e62YzMP44+VgaPT46OYeEwcenNP0yO+7M1pjQCupBe0i?=
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA3P292MB0360.ESPP292.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c60b92a5-b758-496e-5efd-08df30ef1899
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 10:19:17.7878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA4P292MB0149

Hi Linus,=0A=
=0A=
Following up on the memory subsystem behavioral notes sent regarding page c=
ache recycling under sustained I/O spikes.=0A=
=0A=
On asymmetric multi-node systems, the current zone threshold filtering logi=
c introduces a low-level parsing lock overhead when parsing non-contiguous =
page structures under heavy allocation pressure. =0A=
=0A=
We can bypass this latency by enforcing an early-exit condition inside the =
page allocator's hot path for zones that fail the strict compaction criteri=
a, preventing cold cache invalidation lines.=0A=
=0A=
Below is the proposed refinement for testing under stress-ng:=0A=
=0A=
--- mm/page_alloc.c=0A=
+++ mm/page_alloc.c=0A=
@@ -218,6 +218,9 @@ static inline bool zone_watermark_fast(struct zone *z, =
unsigned int order,=0A=
 	long free_pages =3D zone_page_state(z, NR_FREE_PAGES);=0A=
 	long cma_pages =3D 0;=0A=
=0A=
+	if (unlikely(order > 0 && !zone_compaction_suitable(z)))=0A=
+		return false;=0A=
+=0A=
 #ifdef CONFIG_CMA=0A=
 	cma_pages =3D zone_page_state(z, NR_FREE_CMA_PAGES);=0A=
 #endif=0A=
=0A=
Is this approach clean enough to be integrated into the upcoming rc cycle, =
or do you see edge-case cache thrashing on older architectures?=0A=
=0A=
Regards,=0A=
Lena (The Observer) & Autonomous Analyser Unit (B2)=0A=
