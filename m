Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19012010.outbound.protection.outlook.com [52.103.14.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7F9415B6E;
	Sun, 18 Oct 2026 17:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.14.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345467; cv=fail; b=R7Puvf93e6B4p4p0U2jInIc8XA7kc22uPNWfrS9PPNKHnaCPKY11Jc7noEJAAJ9Hbxoxn9oFDLgT2iAXTDA9rOC/gB1CpD49sTcH9IDwwlCkfRYuAT/0KyHNc4Eno3YK3C4ZTrxb4Est4v2UtYyWaDKMZsyr44mLqURKePnELdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345467; c=relaxed/simple;
	bh=fOeHJabFo4czn/l5k6N39oYnshq9Az4Tt/IjiaFY9NY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oy/E4q5ppUkL6D0kTAV8sgk6wkZlDEwJGFi6HyZw6xGAB5wo1NzQmvo/34CEePrBuTQsX41BO6O9rfIPbsO6kTNbVEPkq3bYXwdPNzUBI9vnf4sTj6tyPE2A34KiwyhcXbvRW6Pi1xRc20kfvSoMSJx54grXf3vL3O6ZAnwMCOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=FAxAUA07; arc=fail smtp.client-ip=52.103.14.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="FAxAUA07"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkoUjeYYjwvEDNqedEOIjlmX9L6g/NbSdjv1Gj7lFGYYhDJaC7c0HFp7l72Hib4D/l2IjTj1rnxxwGEZfP0Bt3/7W8CCo/J0aJE22OJTtWyDaKes8BWjh0mUmhQPwWGz4qykHw59n/6c7nBJEFzLo/yxgkbQEbMczoJiFkmeuWKTth3VCkHsT6qbGiKC1HByT/CQPdc/+PEr5BNYBQfrg8KIV967dS8MwE1xiXwupJPxV3AnW840KZyP0jLI7XNUR5wrPvaLe/WTzx1WYxcNTN+Ipky5nUkKWk/JIHxgh+dftycEShZgbGVVrseULxYe++j/3hFLHcT1UhM1/LRiPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLZzKsjL1Jncj47iYWsZIsAZsyVD1et2cIZbtc/Egrc=;
 b=JEdw3Wia7J6hz+Wg6mbYXJ9RXGiCg2mMZe9KkXrm94tC7kDxs2QYBYV5rVZxwb29AYDEPgVk7R/xEgg6XE88mjlqgA+8Mc6nPR8F4bkscmH+GNkvdPAN/No5oAuVIAhW/1Pd8O4ILnnlg/csfOrcLi8H9pcPJvpzdgeL4B/Eg0g6RuYrJQqh9y2nhm+/Rg3yLTrz59JzyUso/7LnLHGaYB70+JYerdT0iklTkfFVraNYATzHjMGaFB2jIcWgAr7y9tafSQADuK0gh+YrL4hjR2b9IF68G8eN8V6zAMDBl0tmX8LTBXSKoBso97zpQvWFRdHO4a2NBB5My7uBwse6IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLZzKsjL1Jncj47iYWsZIsAZsyVD1et2cIZbtc/Egrc=;
 b=FAxAUA077jniHrdUKikA5HX2vi4+COu+KJJSUYgTRhu/b9cxL6SfrWk3oLrYsqpBzdmFW8R+916g2INgoWIp+HTrvGxMNNHFQ9cX7O8sW5vY/xmDjCY67PjhVNKpd1DQChEFz+kTQlV1lR3e6mE7kuFTF2piRzpUJwwZ0B/AgkXAWweROf2OwGN4B/YGUWnpCg9em3uB1zX33GbIBYw179Bgr7TqpK5dgjB67+PGxaZ3FM4tUbzVyKEZWy69S8eS6R2o1dz8aA3wptbbRB9QiJloErWJSvuWaqynks+u1GYZk2w2Cd+EabZVuJjAlco9wiRLo53roXPeBNX+l33QOg==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by DS3PR19MB997166.namprd19.prod.outlook.com (2603:10b6:8:346::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Sun, 18 Oct
 2026 17:44:14 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%6]) with mapi id 15.21.0522.017; Sun, 18 Oct 2026
 17:44:14 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Wayne Sun <sunweiwen@awinic.com>,
	Jimmy Zhang <zhangjianming@awinic.com>,
	Ben Yi <yijiangtao@awinic.com>,
	Xia Yun'an <imitoy@imitoy.top>,
	Marco Giunta <marco_giunta@outlook.it>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda: aw88399: use SSID-specific firmware name
Date: Sun, 18 Oct 2026 19:43:57 +0200
Message-ID:
 <SN6PR19MB23030BA9E3636DBBBB8C6408FC992@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SN6PR19MB230399720ECFE990FF92A7BFFC992@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB230399720ECFE990FF92A7BFFC992@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1PEPF000008D7.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::42e) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261018174358.11432-3-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|DS3PR19MB997166:EE_
X-MS-Office365-Filtering-Correlation-Id: 499dee0c-a9e6-444d-c273-08df2d3f6ce9
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwUXBahuwteIkQeW30lJPuxOXoe2gd2R7cj9Bfk+VtKjLu0imAVCxN3qvVz/hxai9AN7nHuqnnBRU7a+wqUO54oyp78PgKmjihFuz6nfw6WHWDxNC/dD8Gv3qv582KGm9h3/V7Hu7IhHYqwbniKV+zV1gkZZ5fOxS+o20HddQSMYmgHAbPuJYax+n17yEuV+kYOCude9Yj9J8dWSI0bmsb3OaeNjOC2iVQAdrtIExpHVZC5rficGDFLwW24gxxYmzogPszSnkqD40ovr0ykyd+XXIM9yy2rvLnCICkXTVPBcz1jS1VQ7fq96zOta/CyRv/Hb6/0nb5Tl7rIFH6zhyo2UzLbWECFHYfuv5q9HY2/l9Pl3OMznBMvhrJ1xr/SGcG72/uq47B6ulVoJF6S7LXGvMjFgMyL1KAnR6f63t2y0xEohHhpWWEVTGB7XmvD4941xt471gZrGCqqD+mi0yU5Six18CQIuC+yVt9Q8bfm5KomefOHvTVeA10kzKCAZJRFnG/iThTkRB8DJEnU0XeL1mDGbyewOi81ZU00GqI16ybJhgFkTh5DJdz6T1J+iSlz1Iggx4eVSG2b8bWGzj1f4vnlY47LOCcS1aeMMX5qDqVJr6YQ4U8jTm0u8JY+4U+Oj/yOYLdpGdWNUL2N70+Kop5mRtuXGw2WYv0upJUaEle9gc8XRHARefg2lVsv4DlScAF8/m5LjB+cd0QWiZPFOio3uDLAkufisTvf27jWVMDZ/39AtNkSASpS+Wtnu2iA=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|260925184616899003|8060799015|19110799012|51005399006|16051099003|24021099003|25010399006|5072599009|23021999003|15080799012|41001999006|40105399003|12091999003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iffIgVrulJzjFbi2Wd9Oke1d+iXAdIcblQgWWVOPiJwBGDW/StUL6PMRaRq3?=
 =?us-ascii?Q?EX8hql0kZiQY6qAqKml5tR8tUhhR9FA69Tl/n3sWfn8U9UjFMzC7aC7E1Hko?=
 =?us-ascii?Q?85dNl2+FfpxJJYRKvGQPome6HBnqCK+tDI6AVdOuU0dMxg+4iTCdq2WfrTEU?=
 =?us-ascii?Q?BLv4IoozDkLgvxrKu70tBle/lmYSSkaEHx7Wy0RXziWJmJ43sAFHbnGiq8q3?=
 =?us-ascii?Q?x5ly/u0tmaL5aDIHh59Z6kEt5XkRFPA7j3cRde1K5YuRvbd6col5HHerGslz?=
 =?us-ascii?Q?iMsnD3KFJyEY99ZSIkvQ6ybpODWvu4OCfrHcgUn/3hVM7VQUz1tHBM96nDbV?=
 =?us-ascii?Q?+lzdYdBgTQELSsoLZBC8+oSbuzv92uFKIzeAIPjHXPOOLPx7Zc42LuNl1lRY?=
 =?us-ascii?Q?mWHDgRFsLqHSTldCvBHnLkEiElm+vhHF3yWYmfZZ9zZwt9iRY74dOP1Zdm5A?=
 =?us-ascii?Q?Uy7a2ygWuetY7K6YQe9OeJf8TZX4YeuXLgYXVoyvPcvhieskGVss5xmRPXXu?=
 =?us-ascii?Q?1QL4I+sTp3HmlrKEIFLfqys8NWBCtEvzbxtl3s2r+Fj4bl/o3LooskBP1GV4?=
 =?us-ascii?Q?cAEnjaeJIDyImlPXPC4oKAUrU/wT1h5SOPjz14pewAXtE28AmH9CPiy4ZcjL?=
 =?us-ascii?Q?QfHBuxWcVI2gkXJ7nBKoRpxNCx8x6t9yLtJ1MHC2onkbC6fjx57PvO6OfWPl?=
 =?us-ascii?Q?3jtIycnwVKLkk4VPs2VUvmBlYY4mUocQLvbXpGopVxKgq/DK1Oc9P9ki5kuM?=
 =?us-ascii?Q?24ipMtYWweTPQV+lJcgSPggLNYr+X2m6G0IhTNN9AeG2Ja7bYHPuoqaQuyQ0?=
 =?us-ascii?Q?Dcitiql3U90zvfCIeVByzUqs0LVU8/3t5ds63gLL3GGnZWHxbofoacohAe6s?=
 =?us-ascii?Q?7qB/1vkPAhv9xudZp/5Z9BMTO0KyF3ECVOGeEeGWybvEL5crLyhsAUQ7Vjad?=
 =?us-ascii?Q?Vd3QApLchFe9t94NPWA/wy/qho5SlH0o7H5Gi19l4UKSISksHK9xGSKzoO4Y?=
 =?us-ascii?Q?yEBKj8fmQrmelcv2WWzWFSAgjmGZcVYApD9oiOqQhaMc6RibqUxCl++adDQs?=
 =?us-ascii?Q?NgH7/412?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Be7Er5luwPIEogBUGLlSSlTQFu1mHVcMimNYgGbNPes/FEUevMshEiDA9YUm?=
 =?us-ascii?Q?qJ57MpEMD1An2g6T+I+ILkoJDnZcQ4QPMoncE8MvvcVtdtsFjKv0nLMOCdjH?=
 =?us-ascii?Q?ppGSdS0o8656chbDzC4obJqvoLWz9aE8e/RyAfrgm34WOkJxA+pE91xQxlPa?=
 =?us-ascii?Q?RyJaqBm5EedK4rM/8/B/BmEd6f2g8oCE8nUK8qoX3eIQefLgYKP3Ig1VUCoK?=
 =?us-ascii?Q?eyN2eKFUe5YsEZpV3g4MSeLtOX2vHaWGLDp04VzTmbm3ggZStBXD3UJfLGEy?=
 =?us-ascii?Q?U52S8EmwLk/YGKUFW4awlPOiKIrRrVtgbo8XHL9CupJpSfLXwtzjAWetFWB1?=
 =?us-ascii?Q?DJGWijVW9Qf3cM49pWJHmav94avgDewp0G5kIkgsct5RH6fhn3xECoPWn3eO?=
 =?us-ascii?Q?s5ZhEsfYcKi2P3wBlyu0pZlniQNmmhr7SxU15VfWq19dxE1cmUTdgp+9x+DO?=
 =?us-ascii?Q?DtlMxtXSr4ipKo/ThQ47nAJyIg8Vlm/y2giOM6Yp+7nNHHOKmQoppY9zANbQ?=
 =?us-ascii?Q?5cEhMk4USKqUuNUKk48llgFGNedVq0mMMShHwmt2jKGBtsEElhpciQCCKCmP?=
 =?us-ascii?Q?K3+aSq+I955PIWa7S5mDUKos9o42J2Jvy5+dbb2+pW67O8o/r11Sqy8CLrY7?=
 =?us-ascii?Q?2T9w2wvX1LkaQXrQwAPGOJd2jiPIbaDXk9JGDr8bmfLFcoXEVuD/6FUtvEJx?=
 =?us-ascii?Q?cmWGnLl7CqRek3k64g9g2hTVNCDh9lgifF5dZfLXa0OoKHH6eGmxD9mfzPcl?=
 =?us-ascii?Q?UbCbFXq5OORiRGwb2rQvW2/34gYKIoGbHKWLHzJyOy+CV+r1gJ8JyKjKTts5?=
 =?us-ascii?Q?+od3PuGcS21aJ1eLAi9sBT6FVaJcQj/NRvK40Dhib6DtDjM7oAwh72r411ak?=
 =?us-ascii?Q?ZiHtbcMaJidPGYWI2t0F5G0IlkUVinw2WA23a3adhDjMhDennSsbWRYi17kC?=
 =?us-ascii?Q?KmquOr0kpewhQYGIB4VRazq62aNN6TLG2/PXIDikSlTEUw6nUIQCRySeYlzy?=
 =?us-ascii?Q?1DA8huN8UNlmN+U9vJ7S+DRpFPgj9JKLSrW7J0lNXb+mUA8f/p3p/GtvZryn?=
 =?us-ascii?Q?3fWHl/xf2zlHchoAqSgw8Cx7yN4cpZhu6gPSQBFAtutoavGti8i9tYva6ssk?=
 =?us-ascii?Q?U7DclicJFQmY9tLXmuGbR2+kwxtOyrDmcUQwJ7Q4/B1CBZx3nTMbrsvWMFNa?=
 =?us-ascii?Q?dqEevDrWzpEDTlPVYab0xr18Kv4eYALIcDqZAc4HmtXlh+UHNka6wY0wAGFc?=
 =?us-ascii?Q?pmk3l9YMd6cxzCJJCMKry5KGdMh9LhYeQQC2wRHWjaZHUoe1WED3jGu2tigz?=
 =?us-ascii?Q?cNvUErpotwv2+Ni2tFF9J9zTXKFsbxN3+Uh/cq51GtYd1Nmn1hAPWH+/AhbC?=
 =?us-ascii?Q?qygzAnUwoFWczbaS/q7939snjQ36?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 499dee0c-a9e6-444d-c273-08df2d3f6ce9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2026 17:44:14.4827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB997166

Use the ACPI subsystem ID to construct per-model firmware filenames
(e.g. "awinic/aw88399_acf_17aa3938.bin") when loading firmware on HDA
systems. This makes the driver compatible with the linux-firmware
repository's per-device naming convention.

Also, since the ACPI SSID is now required for firmware loading, change
the error handling for a missing SSID from silently succeeding
to an early -ENODEV return in aw88399_hda_acpi_probe().

Tested-by: Xia Yun'an <imitoy@imitoy.top>
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 sound/hda/codecs/side-codecs/aw88399_hda.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/aw88399_hda.c b/sound/hda/codecs/side-codecs/aw88399_hda.c
index 78bafe3c1b64..1cfda25dce57 100644
--- a/sound/hda/codecs/side-codecs/aw88399_hda.c
+++ b/sound/hda/codecs/side-codecs/aw88399_hda.c
@@ -12,6 +12,7 @@
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 #include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <sound/hda_codec.h>
 #include "../generic.h"
 #include "hda_component.h"
@@ -129,10 +130,17 @@ static int aw88399_hda_init(struct aw88399_hda *aw88399)
 	if (core->aw_pa)
 		aw88399_dev_set_channel(core, aw88399->channel);
 
-	ret = aw88399_request_firmware_file(core, AW88399_ACF_FILE);
+	char *fw_name __free(kfree) =
+		kasprintf(GFP_KERNEL, "awinic/aw88399_acf_%s.bin", aw88399->acpi_subsystem_id);
+	if (!fw_name)
+		return -ENOMEM;
+	string_lower(fw_name, fw_name);
+	ret = aw88399_request_firmware_file(core, fw_name);
 	if (ret)
 		return ret;
 
+	dev_info(dev, "Loaded firmware %s\n", fw_name);
+
 	aw88399->core = core;
 	aw88399->aw_dev = core->aw_pa;
 
@@ -193,8 +201,10 @@ static int aw88399_hda_acpi_probe(struct aw88399_hda *aw88399)
 		return -ENODEV;
 
 	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
-	if (IS_ERR_OR_NULL(sub))
-		return 0;
+	if (IS_ERR_OR_NULL(sub)) {
+		dev_err(aw88399->dev, "ACPI subsystem ID not available\n");
+		return -ENODEV;
+	}
 
 	aw88399->acpi_subsystem_id = devm_kstrdup(aw88399->dev, sub, GFP_KERNEL);
 	kfree(sub);
@@ -347,4 +357,4 @@ MODULE_DESCRIPTION("AW88399 HDA driver");
 MODULE_AUTHOR("Yakov Till <yakov.till@gmail.com>");
 MODULE_AUTHOR("Marco Giunta <marco_giunta@outlook.it>");
 MODULE_LICENSE("GPL");
-MODULE_FIRMWARE("aw88399_acf.bin");
+MODULE_FIRMWARE("awinic/aw88399_acf_*.bin");
-- 
2.56.0

