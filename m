Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19012010.outbound.protection.outlook.com [52.103.14.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E973DBD76;
	Sun, 18 Oct 2026 17:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.14.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345456; cv=fail; b=rZHFjuTpmjiL8Gl7cDinEwNeQ6UV61K4UF7s3rzXJoSHzkwtWmR7WdYm4vV3CNSTAc7qH/dWLdSasxxqpENWaMnOWGsbxtjjbiD4oG9TuPklI0pvXrAuQcHuxW77nwypjCtScyLZ7FNlmki1l2cluBbGOK64/TqDMWFiR7BiR/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345456; c=relaxed/simple;
	bh=WZrZMtoSjf33jnCm51r7eRd+7nJoMxFvdpGXk2ZG4Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XfJJ3XUdCd8+X9E1TTuuvq9Tw5D/82c+brwRKt4+IOVQqx146kEUpqfGsgTG3Cd4V9wOUmUwwNqZt5glaJuV7lYL6o8OqFm24PQO7OTqq5fcvq/nqsrnXqdIih+ToBsMC81uAzB8d7ucPPCPKz0dDCuLc10dzhGBKbpDvZMRqJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=EqNg8bfC; arc=fail smtp.client-ip=52.103.14.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="EqNg8bfC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4rRFMBu6ZvbZVISS6uAF08qMKrgUdKi7H03xme5LasWcTEevfn0cFKHjvLc4acSG4kCOPeoHle8y+BgH/k2ob17fiPepS7SPw9G5VLP3vMyuxs86YAfI2wM978gYc1iplbuh89CnrRf+SeMhZfpW8t/RjdtCt/g+zTFWZ9bcL/KD6epu5nsi57f4h7M2MKIYkIKUnsxcuoV3O1ixKu7Ghm6rR8/Dcx4JkTb+t9gDwnerqG6qsaywK2hYqdu/ZsrJVGqbddMeTsiuQbkKtO7/C/oIK6WgpbDNYNw0NQyMZTLfVAtFtwBBFMH0JmxEE8E1FgFFczsEHmdgOhmaFrpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DP0wV6xPxoVdeVW1dilWLDFUAtnYIEGbX75d8o4M27g=;
 b=PAqsbtGlR+rQOpsgV4rNp6/mGIgpXaS5p2Jpa6WaqptNSOgV5tt0ufVe6mUzXyFTOaokQNH7/eXqrosZoOD51UJok/452m2VpkGCI+Vtj4AKsr1fn3f6I/kfKdNUUxm5fTORuGBbSL+ZOdlpK7qfFiVhe5qsY2V7O0RCUOuGroridlai8UrlrAtpo7Wp9DcZ3vgzFzYFiHCS7FRwTfC7ENpu/9Q5a5qOlw/h2wz2pq+r9mS+NAUpkbQ6ftX2AFYLE9IgffuIszge5N/yXFfV3bbEuoqkdmN1eQVZ5R/xl5WlKwOdT2JU2HN0jIimhclPgx9qvOFq0l5lPfGM8b4tow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DP0wV6xPxoVdeVW1dilWLDFUAtnYIEGbX75d8o4M27g=;
 b=EqNg8bfCekwpKK96o4M5x6YgQF5ENu9ihfdjezE7bYh0R3fpoTGgYWBKjTR0cXS2u+5tZ9ZdZVgwL5M57K5sDw+0DSSFp+gnKKebAqvmOGr4V4EKaJXQXeurOgdDww2BBbKCYsVWFdUIUt90LpyVpstDl+XEHuA+Y17NwocsSEcj+E9rff8Rb4r1KiCdhumSQPt/A5aaQFIH/twVClyCbyam7rXFCwVUaDeNY+FxiA065Nb01j23B6NIT6h4qZyZHgvr8YAJisSViC1TGdmh+VgmdbV5b1THaYIpZebVfQAHrwdbtFTWG7xD85IU1+BgmKGeMMizTI9NFw0lJDg/Wg==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by DS3PR19MB997166.namprd19.prod.outlook.com (2603:10b6:8:346::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Sun, 18 Oct
 2026 17:44:09 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%6]) with mapi id 15.21.0522.017; Sun, 18 Oct 2026
 17:44:09 +0000
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
Subject: [PATCH 0/2] ALSA: hda: aw88399: Add per-model firmware loading
Date: Sun, 18 Oct 2026 19:43:55 +0200
Message-ID:
 <SN6PR19MB230399720ECFE990FF92A7BFFC992@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1PEPF000008D7.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::42e) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261018174358.11432-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|DS3PR19MB997166:EE_
X-MS-Office365-Filtering-Correlation-Id: d2768c29-1b8c-4cf9-9d50-08df2d3f6979
X-MS-Exchange-SLBlob-MailProps:
	Z68gl6A5j2981iOqa3TIFE7v3cGH1r/4mZ/M6s3eeJj50+a+N+kgRmxVnu/gfhiUN1EtxPwYDmJBE5olA8JbyamPAi0oV2Gi41BQBIxZAdU8T+X9Zlzz51BsADHu5VEMJ5nDqyGzuEmRP00wvhWoIyu58pyyrr8BaIu4TOQNWPCkwyqCQ+ypId8Ht5zIoCXQmIarcvki0BJGloIgu4aE0b4QlMUdf6lGvEUXUCTFCj/KTuwVR8SNO3UC0hnn4vh4HBBX1KtTNkx7vfb4tD4jMFUJ+v9dO1HOBqjrFjajcokOLWxxJIh2dOBWmfNL4jG8zQzZpgcRPtgpIEph1AWoz2PWIhqHoHCNRQqOEoCW+GtDwMHQ3MJIvi7kaQXpjBJ869fVBS7JK/nTAJbWDzNTyubl2ATB5rxC/KZ5Gvr5KD4Y0q1YMAOEIO+TSSYK7r5PQTPHfTcTiIHRLhJLvKcPhbM1rKAipxLb0RmUuTLg0Glx8uBxAghrDWzUU+0zva57hAIqWDoTQ+aRjjshaDp8zB7pIvvD6guGrzU2aK+W7HHbNCzmacLqlqSbiMGmZrRBTA2deV+RvGQlv7Ripnx+JxNr0iqTsVyWWJ6cCiO6vanq3qlfNAl8XF1dprFaP9DmM4PXSygqXC/ZZXHSi16zuLlZx4y7UTNXF+ews4cYDC2UDcA8itupAqFS6/W8fJA4Wj3dWlrI4TVCaJjxOZjhzOzhACdVc5baVd6AiCNrvr/L1EFednXEDuxMgUA8o2TCa/qJ/hT6odUN7tZHjvRvRfBEtVcbYM5a4D9Tr3OKURlX2wARTU/r7r9CyumvftoS
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|260925184616899003|8060799015|19110799012|51005399006|24021099003|25010399006|5062599005|5072599009|23021999003|15080799012|40105399003|1602099012|10035399007|3412199025|4302099013|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O/u12TtUtLFQIhiDS/ynwnBiBQQSC1miVfMr2oJOiil2RsBkxohNECYilEu3?=
 =?us-ascii?Q?onq/gUEmae3+GJu7C5TcHO4pdVpLtAzTlY2ts7zZtjqx1R/f86eZXAw1RHLx?=
 =?us-ascii?Q?Y86tkORQezFztJlc0kUTtKeI71GhxNafQVLkA01qS9TD/dVR6MpkH8t/tj2H?=
 =?us-ascii?Q?FQ8b//9QWSgTCjh5Go5Ia8gDYPszuvef4OAPpNTIIGMAP0yU5OXpgGb81zJ2?=
 =?us-ascii?Q?91JDXGM7qoIaT9XsSRynruQhGRl9xMVLMNfz5jGOVbOPPrdMKKXlzi4eA9SW?=
 =?us-ascii?Q?uuoXsrd4TndTYzGkN4kN/Lj3BxCzbEYM9OY5S9TVoRz2sTpE855SWJ9pHBzU?=
 =?us-ascii?Q?iV2Kpxh8/a2B31MzAdMjVFYv8TOFGbOYfUV2g5VLZTOs5b5QfZ4GANbMAva9?=
 =?us-ascii?Q?k3U097LOrAE/8GYy9NN7xeUS/ohXPKcBsOS0hBIMbGOgpNlelEu9HZne7uTt?=
 =?us-ascii?Q?kBNkOUY4KqDet+oTb8rUnIsGPYMvrvBVQ30MmDJAKjWpM3oBoGUiTmOvuxqz?=
 =?us-ascii?Q?NBMZJzIS975IOchhYwOYehD/sasL5dQbnGAkqNTkCKjXx/SQRjbVzSktEwks?=
 =?us-ascii?Q?dncCW9guitGS72/AWCaSd94LxdcqZ/UIVyL6JrQnQp65p0u+JJRkcWXS4LnW?=
 =?us-ascii?Q?t+Q1T2wXqz2J9weQoBsx9CbX0fAhT7nj7ksS7OSFx2G7yNeB63FOU9fsvbKn?=
 =?us-ascii?Q?2oBJWKTu95U/eRO5Numq+PITqlJmmP6AiAl8UoeAFgUFQhhhswYJdVBgzkm2?=
 =?us-ascii?Q?QUH+PI3nBTsfmmwfKX5MiDU3WBzykNi6hoS6edCncTQbV33A8PiRXhGOIgz6?=
 =?us-ascii?Q?AmPen6QP4YiA84vBSeNcx7EV4wkED9BkOj0rLJ1yh2/Fmnp8owwdVZTArHEB?=
 =?us-ascii?Q?esHCKhzUSvgcFJD7gH7vMV5m57HS8BJ9XCVIocqcWPknnlSCzpugGXa4BK7F?=
 =?us-ascii?Q?d3l6VxJOSogErLzzsfKCsHhmDaSdEY4NNmZBVvY3JtJNSW0bxLSqjEqVPcty?=
 =?us-ascii?Q?GO3IQ9w1Oez0OGp8h2OT8MKJ/w=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UfSUJJobGh6z+WMujaLjZjncMRy/CHwAIPUOZNGa0dx/O9hJp6QdcEk0wlFM?=
 =?us-ascii?Q?Vr0ZLi2h+SukgztrCa8urw15fcqvO/gjVpkr9ISUHoSzYxdupKgLw/zTe6b9?=
 =?us-ascii?Q?+kx0oNHOaHWK5SzeKcbAZcu3zHcsOuGOef69x8okWTvJhYn0/6vtRkByztXj?=
 =?us-ascii?Q?MsqmjFHRwtgRVZFxqzebj8jralV0cH5jgh2VUAbcon+5YHt/LotAFhNunsSc?=
 =?us-ascii?Q?CgVvfB4Y5oZfbUB8sml8Tqtq+eHCE0VtfJZy/u8XI/Vm8DOYn1CvJ8ibbdQD?=
 =?us-ascii?Q?kB+PUxgZqJuwRpkWp/XLrzpyarAWpE7q0FYJOkrB7O6fxYO6f/609E/ch1Oj?=
 =?us-ascii?Q?lOgCzaUUxkI2pk6KjCPWK7kUtdwcEh8SJ9QrLbtAaZCLcMDj6tL6olHpzRiC?=
 =?us-ascii?Q?mFU0WrkhhpHDrljFsouXd85qcZ3SAN+ae3jjlZ+ByY3SslopW0qnMFR7mtU0?=
 =?us-ascii?Q?x+Yy3iQSxej7g7yEOFhAqvZGgl9tAx+fwG6RDTAcQs33aqwaO59Fbo3/d+KO?=
 =?us-ascii?Q?lYiAvaDwsw6OzS9QZnPFjTZjoIquVKwIN/cwnNdUhtpNsp72YpSxWXky+sJp?=
 =?us-ascii?Q?8bf2538aXGXYeznFTALeZlqg6Kc5R8nE/ATnxOWM7EB2ayc1B0PgrTL+aJ0e?=
 =?us-ascii?Q?fRkTPmEhrKPFeQk0fUzWvMEHlE8nn05hAKr5UxbXSsT6Q1jIjV25T7GiKpdg?=
 =?us-ascii?Q?VrYmX0mmytbflPi+D2niGF9JCKSJ6FKEIDzJDF9WcrKW9r72tvii08ynLPOI?=
 =?us-ascii?Q?4uwCPdjOZdCbzK3CfRQ2ZElciNS8USU2QF5jY3Zdwq6GpAmtsD0BvHnGAOdD?=
 =?us-ascii?Q?vOvT17UsPW/GbEqy/y6l8IIVvfDfb1B6xEuUY/QBUba3up8M0gsvPAYsWeym?=
 =?us-ascii?Q?3eVlaSxkYtRylf0RvKH0iBSCegoizVgJspg2zPox/ry4FEZ3hLjgfyoaSEPF?=
 =?us-ascii?Q?OxAh9AtyXIkCwW5IMXITM9zNZN4kKhwxLgrfBb49v/DsUSYLYmzF7AOk0Zks?=
 =?us-ascii?Q?ZEUvu2z/v3owzwrRRUkfQaZTu1+T5bYoct4H2ovMRqbh68A0x1go0myacEkl?=
 =?us-ascii?Q?Q7IHceVeAgNVuGXa8K/l43ocJH2d6EswShq6eu+tETurWxu3Xs9gB/CBQATk?=
 =?us-ascii?Q?JQn8rqK/MuRvPB3oN+oR1MR/PhDCIsKFJ+k5078B2ihpiFmY0MkDVgZVz99s?=
 =?us-ascii?Q?NxuIRkmZNoSKzp31N5uYBPtiq5T9RM6mFFnpq2XFxfSzEO1fKCv7aTQXGgMa?=
 =?us-ascii?Q?2sdSzqSUisuHWPplSL6ygKrLPA3VJxLSgCTpn2esbNcmZZyymxfXyk2Zh0Hc?=
 =?us-ascii?Q?oYHIn/VbRfgEJJwyrVFdXOHBzmrGcmTEs+/4qPNdRyd8HgvF/tkq6opKyv6G?=
 =?us-ascii?Q?/QBk4UawPh/40qM5Q5CP+ZMcHnC0?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d2768c29-1b8c-4cf9-9d50-08df2d3f6979
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2026 17:44:08.8277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB997166

The AW88399 HDA side codec driver currently requests firmware using
the same hardcoded generic filename ("aw88399_acf.bin") as the ASoC driver
it was derived from.
This requires users to manually extract the firmware from the
Windows driver, rename it with this model-independent name, and place
it in /lib/firmware, which is not sustainable for distribution packaging.

This series adds support for per-model firmware filenames based on the
ACPI subsystem ID (e.g. "awinic/aw88399_acf_17aa3938.bin"), making the
driver compatible with the linux-firmware repository's per-device naming
convention.
ACF firmware binaries for the currently supported Lenovo Legion models
have been submitted to the linux-firmware ML by AWINIC [1] (currently
pending review).

The series is as follows:

* Patch 1 adds a name parameter to the shared firmware request function
  so callers can specify the filename.

* Patch 2 uses the ACPI subsystem ID to construct model-specific firmware
  names in the HDA driver.

Note: since there are still some AW88399 patches either pending merge or
that have yet to cross the ASoC/HDA bridge (see the note in [2]), I based
this series on linux-next, meaning a rebase may be needed before merging.
Apologies for the extra noise; I'm sending the series now for review
as I'd rather not miss the 7.4 merge window.

Best regards,
Marco

[1] https://lore.kernel.org/linux-firmware/4b70e056-89d9-4d92-8ecb-ecb4c7d48c8a@app.fastmail.com/
[2] https://lore.kernel.org/linux-sound/SN6PR19MB2303D726352EEE508A70D6D4FC922@SN6PR19MB2303.namprd19.prod.outlook.com/T/#u

Marco Giunta (2):
  ASoC: aw88399: pass firmware name as argument
  ALSA: hda: aw88399: use SSID-specific firmware name

 include/sound/aw88399.h                    |  2 +-
 sound/hda/codecs/side-codecs/aw88399_hda.c | 18 ++++++++++++++----
 sound/soc/codecs/aw88399-lib.c             | 10 +++++-----
 sound/soc/codecs/aw88399.c                 |  2 +-
 4 files changed, 21 insertions(+), 11 deletions(-)


base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.56.0

