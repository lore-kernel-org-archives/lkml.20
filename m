Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.20.93
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793271140;
	b=KgIwdB2Iu58/QdQUMirKUoBCFwb7f+gj3BdBgMyvDW6afreRq5X0qA8uqWP5sguDRkpq
	 KTgx8fqBhevsmAkGJDdmkkqkjdIPt5sEJDGdpeXyjALBLJ6UA+W/rjBrWauCbfU9ZrEmm
	 0A58oCu5HlgBxfxs0Xila5il8sc5PmBrptdS0NtZdx5aeHx8oaNL0gUCWoIiy/OHC+h24
	 RAj4zgizVSsEo8qmkr7TJOyGcxrrhWJBjuKXCsr95mo+gmfMuaixlfuMOxbyqC8VcsPPk
	 yksJSkOZRbmtH7tEJ7jmnOB2MovDV36r5AxL9ADs3uLBeheZJdXcpS/RrkEuf0T0rmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271140;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=S3jENSIj+ZQcxJWa1O0eJ4xwsD4jVkw8J+Oy9K5pQEM=;
	b=YeTAVobSCVaXnuhVrzsHDMT3uQqvLEnIm8wzQ+EcLi61+G5ttTS/fI6aReqx3BxqdMc7
	 2v/StKe6W/yg4bWsOy+MKJUJ5ZWqiA8YAA5dKs9n2i6t3kYEYuC86jQ9EhGuTfK3NghEW
	 WEz491b61loqTzOnhTC8uXsqt7IMMPfc3o3TrujLEtTPzF869o/25w2luWdwP+Vs+cnoQ
	 nBGLRqyNG6HTWllaY/xRuyqnjxRe3kK4WyKMXz5dLtJwEdzUj+D3ppEemXQdmt/VeD7mJ
	 DaiiX+LCOCyeGjaiO0mlxcVEVss/oCRkmsizj4ucAe6mvOE2Vqz3h4UUrhxfoT8AQ6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=HY7njfyW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.20.93
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazolkn19013093.outbound.protection.outlook.com [52.103.20.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D213606A31D;
	Thu, 29 Oct 2026 10:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D213606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=HY7njfyW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmEmPTef6rCWNp0P5lRqxI12IA9wrf3e+0RHYZDQr/lrPgNkyg+DwPaqCjR4KXVBJSMtO/VHIgAub58zz9JJ6Fkyp6MK4quOYERpxMLQeZw3J4XXKR03cHvT6nipQZ46MiFodpdl30k5C46Ok1QPd4Rk4XRSeYk3AFglV1SRSkuurt09SA5HyOtsKtxG/G9D8BoEPnHa06my85Tf2RH3cFaoQmMpr2KlWWXNYLxFq8f6r5UHDkwGhbTda1uqbg7W/4ZZT+RzoHW2F0RgaIw6OvWsRqo2h4R8ZH+w9iSIlIgNoVl6jzq1PMznOyLtKKu071o2VfBkzKKe3V3Ffm47sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3jENSIj+ZQcxJWa1O0eJ4xwsD4jVkw8J+Oy9K5pQEM=;
 b=sxHqKXBNIgCfznDbBEpnzQ+afhkL6zkldS7f0oZTCF9rgbzwn67La7MaYJTen+zdei3NeL+MYlFigbNpsj7cCjv0Xac3hehykZHVARiPf4rLCYefEzBw7g097Rii17rbWzNkH5S1boqnmJEaPBylz0nuebVzg9HUHTOmoMUgm4NJVPq1rJVglNe3E/CrFy5gGZB+3V45wFJTcd9Mj13UEhK4mg7kILdBhHrhVYCNLOt84fKkd6xt/c+douTKBdTk/+dUWSRauix37ZIsVGcHQa20iD4u93xGo6VFPOe+FHwtuxMbpUID3wl1ho/kY0SMbj3VwUX58VLpweJc/HQfmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3jENSIj+ZQcxJWa1O0eJ4xwsD4jVkw8J+Oy9K5pQEM=;
 b=HY7njfyW2nq51+D2/p0QejZX4RKSdblK856JoFlycCIhpn7SSW5S697tX98P5psYU9OLPrbLbmdRUS49dK/VUISCYqxUk1WHXzJpvsPafSAa2DmCy6qkcKxnDaCURty0gUVP8jDdhiblUgtd7D4XKlv9lMgem6q6KNyQVmZxF4vGz/xlk2OvkVTjLbZnpJyZ3ftg+AZ/fCR6ZkDWU4oH++fkEqid2gcCNyvrb3ouz30beygEwmMnKzQ6IznW3gIa+SnG7CtkmY0Cxwd25GKX+cAlXwNQyPWBYT/qdwOv9DLxjpqz51zhg/gW9xx+i0QaNmOzS1uNrQjCF2Hg14wbRQ==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by BY3PR19MB4865.namprd19.prod.outlook.com (2603:10b6:a03:36a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 10:52:17 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 10:52:17 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Marco Giunta <marco_giunta@outlook.it>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ALSA: hda: aw88399: add missing MODULE_AUTHOR to I2C driver
Date: Thu, 29 Oct 2026 11:51:58 +0100
Message-ID:
 <SN6PR19MB230341A84A4CACD260883C2EFC6E2@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SN6PR19MB23035A048BCAF108507B59D0FC6E2@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB23035A048BCAF108507B59D0FC6E2@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0345.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::6) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261029105159.16954-2-marco_giunta@outlook.it>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|BY3PR19MB4865:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd71dbb-56f4-458b-dc6e-08df35aab261
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|15080799012|23021999003|21061999006|24021099003|51005399006|19110799012|8060799015|25010399006|260925184616899003|3412199025|440099028|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ymOpB8x66VZOXvFEf2/KTptBe8rmIzvmobdAccD3odVEskZK2iXYNsPGnTLb?=
 =?us-ascii?Q?e9iQif85I93AjT3zpqkn+LxCg2szwamTvI6vKc7K9eJQizG+e5YXkjOOom7r?=
 =?us-ascii?Q?3F+XWVeqdv2DNnzexdYrHTOc41j7bqvZ0jAH79su+niIKmwtnf3Z+xEUE4Xh?=
 =?us-ascii?Q?y01M1VK5C1Qqa/4M0byGwliOphBYu4+PthxT9KYsiZV/agAdgSy8q8dpE4MB?=
 =?us-ascii?Q?OZuHyYodgvEzgFhiyhUmR9LZurGthu1EUv1RtbIwooQmmnmWzSpFJDOdjbSf?=
 =?us-ascii?Q?XRxTJzkGPG8qVsNTX68FNXZgecpI7x+s96BZl9GkSSdGb+0zS0bjWPTZUcT5?=
 =?us-ascii?Q?8p//GacCMNjfSQm69RmFny2g76XzMxFB87GUv6D1LKhl6FwXFWzs5Zj0Yta4?=
 =?us-ascii?Q?xuXeaS4BduZ+WpQsHjEp0c4rrFMk+/hoS2a40CA57fCdN3qqkbp48Suz51o4?=
 =?us-ascii?Q?d3LSwlqlxCONTBngoap264RxQgefk+GsPJdH3qlwugjgyFk4NsA5UG2S4Pi/?=
 =?us-ascii?Q?mCf5Sf6BtQZLa41ljHXa6OcMBZ5ZEax9Fq6+inAI+xwZwLM98LpMfXDQuevu?=
 =?us-ascii?Q?UGBTF1sZzLF11ZZqUy4QXnHszG+4WVTmhEM3+qEbE3Ply91Z5OuvJJkunFJj?=
 =?us-ascii?Q?m1V+D14cjyoGdCN33aAfXJuS3aMy4p3iyTqT2BX70fKx3M92tEhGfsziRjkI?=
 =?us-ascii?Q?u/U3oi1iwspt1MKmIlaewQXHPHcJg5A5yxr5V5IYQ+7XTVZp18lLBkP+ZRmg?=
 =?us-ascii?Q?In6+V0qEnrpbLDCaUhZyYa2jNHUnkSQJUDwOSXB3eqi9CMHpfgNReTv7+dKK?=
 =?us-ascii?Q?pDAXdrOhhMYmYaEoAozdjNU5T/FoVG/QFAs15BT8OPYbR2rn7W0CFufJRMX9?=
 =?us-ascii?Q?N6F2ngH83vRe4783myw5pIzYn34jB5Eal09dnBnV9aiVonrVgBsw4lGxj5Ld?=
 =?us-ascii?Q?OHGojcIxxui5AdXWegsMIogIfFjRQsyXibzuvJHNlowFv6ZcwmBaatGEgepZ?=
 =?us-ascii?Q?yQch?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6bkEp+mNmwVbIpEIU4Vh+z6JNBB45LrRpk9IkNSvxJUDe1f1ftusWBu8pEN0?=
 =?us-ascii?Q?jOIRIO567lyoHbXnj0R0eP8i2TRon5QTO+iTcECZ4gMIkUSWAQhgnXEUhhI5?=
 =?us-ascii?Q?Eq7yDSVcgzvFUJo+rjaDv74ebe51lOrNIFpFGWzqapEJe3Xze4GdaPN9m0zP?=
 =?us-ascii?Q?dzlqyn0jNp/n9KUNrzImDT8GsU5U+k8wLv7hNwrr+7bRhtamoIMYI9LQ8uGj?=
 =?us-ascii?Q?BPy2K3/Du7C7ks6bhGLjlx9oRDxQLDhiodc3PPajR9Co1153o0XCEn8bXcML?=
 =?us-ascii?Q?VgkA6dWUfDCcLeCfXoInkX2r4RDYHsfC68go0bxiYV9HZovjhaJsOwdUW5EU?=
 =?us-ascii?Q?qbwFnY2Bl1XFOARePm9ea+3CVxSkYOYW7mYAfp6HBVhqwEK8eh4tt/WKOT7h?=
 =?us-ascii?Q?IzfnkpM3H6AInLFCEkw4hwfHVNbl2JAsapAlLvKCBuePK1E3Tm9EjBfOW9SB?=
 =?us-ascii?Q?aYWtTg5ZTQZyO7e0kE5a0FY0Q5cZlNnUbbz4sL3IJLw5D4kAFnj1qLgkELI1?=
 =?us-ascii?Q?PrkFKaF7pAeA8rNCyoefggPLg0HlewQbg8dXSfsIAuVPdVueHEVIS9AbvOc4?=
 =?us-ascii?Q?5lutCM4aC/e6PLzSjkB41tj9NPDEpm0AltAZQEKZBdOYJPk6PoiclzlLn/Wg?=
 =?us-ascii?Q?eJKF7/DKuH0gRXdSQx02DzUxgBJ4N37XCCEYoD+GVAWRA2hOoaHM8ygIC7nI?=
 =?us-ascii?Q?xkKWyFhY30VjsBWmg0pCQDo282cwH9X8DTVs+E1Tq8TMxEW+vFIoMgU/0Les?=
 =?us-ascii?Q?YOZ+UwrDpAWLJrdzC4C0ZwcMWTyGSfPMRQFhdlcO/8DvzQGpQe5hWxPBy3AF?=
 =?us-ascii?Q?JwGVxbdH5F4gthRUeyLXXCLzEQUcn1nVXIL575zuBd9nmntZO2Oc0pV9yHTp?=
 =?us-ascii?Q?fnT4E1uKaaCQPpPjVOJvOXlve0UfZTLxZFXJ9m9/cVWoP1MlSPPf4QUOvGWl?=
 =?us-ascii?Q?zUcc742LYkOheUoGTwUBXNjufvB3DaFZFsfLVPQkX+pN06dXoyD0R4BKeIAw?=
 =?us-ascii?Q?Rw8Z5VKb8msTpH5Z84OSDez967QqV6Jr3K/OABhYqAmG/5i6rTnhgEqxtfjf?=
 =?us-ascii?Q?Cd5zb/kd56xOl2tOb6E2ZSeuor1V522eBU5VLS9loW5h4fr0z34MHc/+VZMa?=
 =?us-ascii?Q?SIcG1AgJV8Yb547P8dNuP2ASf6iWt4KNCoYfT7VsRYbpfn9IKsyAYH9cJ9eh?=
 =?us-ascii?Q?4VmPNIEvUb0JiQbKi4hKPEhh69YuPIkDKglXt0tSNAOg99Y0e+t/xAVu4Y/X?=
 =?us-ascii?Q?iKoBTGaLscL3S0++4kqIMeoLJxo1mGEm1CJBOxbWIaXpzA/TELQgVv9UzAIW?=
 =?us-ascii?Q?oES2CqrjeiT6/UZp/Ko9msJsU4+SJSCGu1Q6csZJsP50qbCP466evmHBwPzL?=
 =?us-ascii?Q?JrKTTTUR3fajgzzVwOByVXrSMxXx?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd71dbb-56f4-458b-dc6e-08df35aab261
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 10:52:17.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4865

The original AW88399 HDA driver submission accidentally didn't include my
MODULE_AUTHOR() metadata in the I2C driver.
Add it, matching the main HDA driver.

Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 sound/hda/codecs/side-codecs/aw88399_hda_i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/side-codecs/aw88399_hda_i2c.c b/sound/hda/codecs/side-codecs/aw88399_hda_i2c.c
index 186e13adbc6c..9443ca887431 100644
--- a/sound/hda/codecs/side-codecs/aw88399_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/aw88399_hda_i2c.c
@@ -51,4 +51,5 @@ module_i2c_driver(aw88399_hda_i2c_driver);
 MODULE_DESCRIPTION("HDA AW88399 I2C driver");
 MODULE_IMPORT_NS("SND_HDA_SCODEC_AW88399");
 MODULE_AUTHOR("Yakov Till <yakov.till@gmail.com>");
+MODULE_AUTHOR("Marco Giunta <marco_giunta@outlook.it>");
 MODULE_LICENSE("GPL");
-- 
2.56.0

