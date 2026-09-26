Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azolkn19010019.outbound.protection.outlook.com [52.103.12.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D41623C8AE;
	Sat, 26 Sep 2026 12:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.12.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790425576; cv=fail; b=BtirN2Bckw2eS/Ly0V0ffxlgOtIcq2uGyYJW1TaNRLCfzAHUAd/eo+Bp3tx9aVqvXbXqHyQLOzLLqFxFqujBeD7DcRqDaUXfFQ6We27jHVEzNULjMTru2qOF/BaeKNid6bszsB2tf7qyFt9Nceb0WGJnNl/TyJyxFFLeSJFMQHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790425576; c=relaxed/simple;
	bh=xqb1aCkx93UmePFYkWQpmWWcekNzedbDzbI6lbAVE/g=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=j0intDuRNDfNT6Kb5t6ELbzzmHfGacn33MdjwbWPfvmNNFMndzg5odLlan48sj9hT+d4xoveb5sX9BkxVgfgPhani0Ah/ezmoni4WlCXaYsISPOcVUBH9VyODRcP54S0PUFg0f2TgMCPi/oU1GjbNiYduVtqtOwum+j/UEiirhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=MBIwTkJo; arc=fail smtp.client-ip=52.103.12.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="MBIwTkJo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7aEEuFsy9m65OFdrEikGnTd//QCLrwpP8VyUHGVrnfMZqwr9QtIpM50j2EM32wFe4V9HJSZ6q+mz3H5K8y643LIRM/FCsAnSxBMc7/ROfYHVB4vXFNJ0fDeNdm8Dr4m9DAKrWA7/8KT3UkkBewPytSBMILjms9cWj6RrYr3EGMm8Js3PPgu9aIX+E/FEHPoDhR+8XvMlDGBL9vkFkgqfy/+iwLLykM7r3q/2XLqXQlG3lENtMxT+7eaSfY80VX89f/ZVefgVrx50aouLva8he4bsk473yOMmLuS7SCDqV7NUIo2stlBhx/3VjYwptehrUc9Rd/soXrCZO8YhxaIxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/31ESikXFD7XUYlcdwwBv22/qen+J5klXH3M9lNhdgM=;
 b=N3clS8zQova09zs0tnK80J43viH8MyW8CA9kSmVNqrT7OO5Tnd5MOFpObwPI4XEzzAxr7pna2NprV4BqHjwcNQmwjsOpioFZ0TRbUXun7Ou4bcXLGJW5QvbucJx3a0vCUY2cVXBocR8deLCsASxrrQREvKO0UFXwHPIJ/NaPdIq3Vj1K0FHD+6DvE0dfCTNhmovYppJDaqHA9GcwH6EHSVNf1B/M9klpa+MTfArRCf+zY3rRwGaVW5fQGpFQ4GFF5HK+39G81rcvuXbTOm7f8EpMZagp1+VIQlSkAOuMUYiTYdIBXRprDxKGX/vUTzrCjbMIXN0Q4R2hG4ku9OTyTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/31ESikXFD7XUYlcdwwBv22/qen+J5klXH3M9lNhdgM=;
 b=MBIwTkJox0b5Csd0hbzqrV8AimDEdZC/CcKidOGj1HEqpsysShZECsNGvLoUxkOX1Tu5hJxGzPwaPmzdiosaQpQFEvoeHqgRfmQO/mUmVRoEok1wMAigljnoFQie8wa5e7CFPME/GoQ6d9HaueqyagIfyNY5ORgtFgtUgAoUQ6XxlcELha+wjeBYJJd04Es0N+V2mTbxR3+LbUgmwpOp7fgwgz+pwS3zuCISOZIeFVbOPBqQzUbWpb7IXzK9zNhvcP8HooGTaE/n38MfBNwBWcb1/UBAa3eAKOlsBKPMFLKOqSsZB8AAhSBsQfhOMNkR1D2fuzVoZ8rmk2WYsLo1ww==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by PH9PR19MB278024.namprd19.prod.outlook.com (2603:10b6:510:3ed::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sat, 26 Sep
 2026 12:26:11 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%5]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 12:26:11 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH 0/2] ASoC: aw88399: fix BSTS check using vendor driver logic
Date: Sat, 26 Sep 2026 14:25:57 +0200
Message-ID:
 <SN6PR19MB230304C2E75499FE23B53885FC8F2@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2PEPF00000B79.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::40d) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20260926122559.8062-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|PH9PR19MB278024:EE_
X-MS-Office365-Filtering-Correlation-Id: ad7ab12a-da16-4772-578b-08df1bc9586f
X-MS-Exchange-SLBlob-MailProps:
	8U9+OAG/EBKkI8GgeR43xRMrZ/+qH0EF+JG6abuQbr2YZ7sM51Ze5xptI9/xWBeE7LWVZgVZEQYR6viNuHHjZHUVsjTsWc1LwA3AkhdlTdVhf3haiMZ814WtQp4YX8LmtmS1hg4dsUD6R/Z35BzED6LsKoqmkrvm1wZCv3nVWgS/FjLhrcv+zaUHKw7a2DTj1N85K4W15FgoBZHzXX5d39tnYp2wEOn8VmF4yDkP2UqQEeF93216NBs1MWr4EBLo4JpMVYGENWSmgtPrzpAf565et2M1mwEm9AkmMUOoGv6l+FeooYWaV4VgVK03plq/LC6wYms+vj9oNmqKzlHGg2TPsUSGx6S5Gf6yRsGaODxlRojkA7EC9x9NKWgswApyOHStDfw+yKNiZgMUur4ycfFFuEhnqzfLY1xJLRZtOLG498X7hIBDu4amgzlGc1/0NghbZw4nbpZ3liix6Ovi3sZjFpWNTr4g9cQ/b6cujhTbaCcTzuzICKxAjwaG0tVitJRE83VuqWP9keeSLvchAMhW1okPbu6BDBfTcixUyF3Q1H4gOIcAQGjYOKBnbnYz4FECfcl2s8/1KW5YAI24c5IMb7zMllYFsqlTWx6mm/1890anQ2Jg105OF1UWm1n/Zql5bRTwk0GnYO2GwgUZtiBAvBxGHto7OGOdeHR3zES1TJCMuapYnGfBpOaak2aTqGQy+3gwA7qxxZvrXYEnu22ADCJsVfGWlmNDr6tZhm4PaWZWb0xmtThqUm+QiCF2Bs+W1bYPkqmVX+FhyUusXhp+sYIk+0SBJ0kU+0dsLb2l8XI/EUo9+ZFPYqPthjCip+craHzbbFta8FP1or8f3Q==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|12121999013|260925184616899003|5072599009|23021999003|25010399006|15080799012|55001999006|51005399006|8060799015|19110799012|40105399003|2607281247196008|10035399007|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kvVnRg07F7unHI43aW5qrK8fnafFaiZkPi/TBx7PI+rzvl/6pvJOKgEGL4sh?=
 =?us-ascii?Q?QAA1jALpAJX1gpNfN0A7z2asPIrhztOqNktw/UYJcpFXQs/MWv67q1Q/rHv9?=
 =?us-ascii?Q?frZvzS65A6er90rKNHOOY9qnZdcyqSh/s0uSwVIqcaU5pzIJRCZLSYMeT7NL?=
 =?us-ascii?Q?aw5mVJAowItU+GpZ/Z4KIHVYy0MeoOYOaUt51su7amwkjFmL6nx1uiYHxHMu?=
 =?us-ascii?Q?nfb5IcP+M2hBSGELNL2X7YterAAU9N4ICX+rwxkR2jp/b5FcDgsY40exgKLX?=
 =?us-ascii?Q?2JnlKkhJk3H6WY7zvAsWg3+W6mSHl2vkoY4ExbyA3bJFPKNLigMe8b9rFkDN?=
 =?us-ascii?Q?Tt4gTps2Tvn6nmUs/NQ1JwXE+Olt4FDnlJbxMNtCToYOzCaCCeLsEh9Dj6Uw?=
 =?us-ascii?Q?IFCuqbVrazoNWnqaEc34X1Ft+bBAMfynoHNnLaSMwsZscI+GLaNToYHxMaz6?=
 =?us-ascii?Q?d8rGyp62ztejXhooygc4+o6bHvTbGHkdJXdVVSkgy8u0EeCoJuin0xepqI0V?=
 =?us-ascii?Q?PLkaaGt2qfGrKpKpXBuNgnmFbeWdpfuRPQWN7wpzG8bifruBw3pf89YHpyv8?=
 =?us-ascii?Q?xwhxgliQ03B7SIk+xkMbYg4XEKIVjivE6erPf4iTeL3DH6Hj0auXb9wWR0ob?=
 =?us-ascii?Q?Js7sdE1XXR82PoV7a8fSt6/qbYzByMtaeZ2K2TLVNjiUbKmbYtRoCFj8sek0?=
 =?us-ascii?Q?nOS1XqdifuNxVVetTgosIiI0exwdUgQHjCSKb85QIfQxTgai+Fp2mEZgS4HZ?=
 =?us-ascii?Q?QpXlzWdOdEVnBU8EOTQAQ+f2M6k9s8dG4fWEqhyPevAWNC5xZMofor+kyMKp?=
 =?us-ascii?Q?N24V9/fAWpkRDfW18ZWRt4+x305SgUCfcGPGqxrwoXSOmMSXHqsLE38nzQLY?=
 =?us-ascii?Q?GE0gUL7Je4A58JR+j1CMczTAtnJtWb/rxAYapqagHQjso3BZKo8bd5C6SUOc?=
 =?us-ascii?Q?hY2xgk+ETMSYUaoV0C5LRfy63YoP52AoiG5S1jl8TgpaLPtuUZolCvtuO22s?=
 =?us-ascii?Q?d6MQ5oHPsrlLjRr+oapM9ucwBw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/c22kqz3cgdfGK3ph7zQDjV2GDjs+eitq+3kX7HAvrCAmGkYw2SBm2S6sc8B?=
 =?us-ascii?Q?A1X++hum3rFdUUZzyR895anFHKwwcu98X82oFPn7WvkJlEDc8AGkjrU03upt?=
 =?us-ascii?Q?O54eRVXKCrnWEw7kEhx2+4PDJfcMi6J7Cb8haMgWay4KsW7j5iYGm7e/u3Yx?=
 =?us-ascii?Q?tiNIXUmxqbelb1tGTeX4FcbYOU2O2lr/QBh1DWn+1vaMhOeXFXRtZ3cZhXHn?=
 =?us-ascii?Q?EOhoolrgNLLK4+xCSdy8QgIabQsQyM5xJsf5mOO6arFA1njXH/GA6GWLqqIa?=
 =?us-ascii?Q?3p9JzQ0TknY3sV8YhFnNS+XS9m58COFdf6IiIl+WoVXqt9QUK7FTotbgOjHo?=
 =?us-ascii?Q?iQQIdHy6Z4Tl+lnJ5k02u2D7DGeZj4W4nfCsF/SpsyEkFBY1iUYJk04bWOwg?=
 =?us-ascii?Q?TQDqVSduUQpptis99qAK8GKwDw4bZuI2dQtxjh8cO+BDiKZUNpS8tb+InNrv?=
 =?us-ascii?Q?BbCTT68t/y5f4H3rCYKZRsM5Mxjz3sT3LWYL8+In64kv1myh9tnhGG0hZcll?=
 =?us-ascii?Q?tuR5gvRxXCy5yWErhjHFZEfWigCEjaZ9LXy3gcEX68WI5sZvGvuVv8n2kTJz?=
 =?us-ascii?Q?RkSZUAXKyn0nRYeX9IUMaLW2ESaG7t40twtz3jKs/U/W5DnGQ8BnjNRxoOW8?=
 =?us-ascii?Q?iw5ekKo9Nkv78QWzmnmo/5DzCLkv6h/1c36OjEGHi9FnFZA1kw1qkiVXyVkA?=
 =?us-ascii?Q?0VkHl2w8tDfmGCI8ZX9qzuELEdxLM+OSU04cQbUztb4CjvDYQwvmmyUB6QW3?=
 =?us-ascii?Q?MJQAxKMMesX8ccMJxTGL0kqtYUrZ4GIeMlNid4ecvrnNE7BZap8QET3SVEy3?=
 =?us-ascii?Q?4v1q0laOd5/njqQ5swPzn7aPyA7m8tmSdjBbKSNsMdJniywD69LPl79E3Q9a?=
 =?us-ascii?Q?0euzWoc7fJiLzJQURAXu7Kg1xlb3k4ZLteeYz7CyuyM8XY5kUdATIB6ONllO?=
 =?us-ascii?Q?p0pWzo8RzeHXv5tbJWSzq1sZMcYDWVV0R1L/tdwY0OPy4EtdAzbD7uWVgXLh?=
 =?us-ascii?Q?xAOhzuMETgLnD23R0R67yY77/mv6UkHwPPCvBjQGVceVt1GfACjH1++1W4r5?=
 =?us-ascii?Q?pkGaN/KNaX1G8mL9FshjjPqLsnjjD24f2SP6chG/IuCD8ojgE8T7EY4qireo?=
 =?us-ascii?Q?Lpy4QaCqxBWowq1/7e0vR8ujj3xmCoQsM5krykj6wPKDoofaeAmMzseOo6fX?=
 =?us-ascii?Q?6H4y4hdA2rOfb/yYT7+Nn8Z/3IX52MgD+xMKm+tFCQ+KP2dZpk3i2L/H9L7o?=
 =?us-ascii?Q?pzXvdsHu28D/wVozQ1AbzpBzzylbTvaZbIPAvpRwjFkYiN4EhiCUzCQ9v+3c?=
 =?us-ascii?Q?Ut92yU4y3MpDEdmfEHtyw9iaXnO3OMVpLFmufaZGrzWQFeD+8mki0034uAFj?=
 =?us-ascii?Q?gcocB/aoaJEuP31z4bNYFlf6cEWh?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7ab12a-da16-4772-578b-08df1bc9586f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2026 12:26:10.3917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR19MB278024

The aw88399 sysst check requires BSTS (boost finished) to assert during
startup. On hardware where the boost converter is bypassed via external
power supply (EN_HVBAT in BSTCTRL10, i.e. register 0x69 bit 2), BSTS never
asserts and init fails.

The vendor's generic Android driver (aw883xx, [1]) handles this by reading
EN_HVBAT and conditionally skipping the BSTS check.
When the original aw88399 driver was ported to the in-tree ASoC driver,
this logic was not included.

During the development of the HDA side codec driver, I worked around this
with a per-instance bsts_unreliable flag set from the HDA scodec
driver's per-model quirk table. While functional, this approach requires
every new device where the boost converter is bypassed to carry a quirk
entry, and prevents users from testing the driver on such devices via the
model= alc269 module parameter without a custom kernel to add the entry.

This series adds the correct hardware-based check from the vendor driver
(patch 1) and removes the now-unnecessary workaround (patch 2),
simplifying the code and removing a barrier to testing on new devices.

[1] https://www.awinic.com/en/driver/AW88399QNR/594

Marco Giunta (2):
  ASoC: aw88399: skip BSTS check when boost converter is bypassed
  ASoC: aw88399: remove bsts_unreliable workaround

 include/sound/aw88399.h                    |  6 +++-
 sound/hda/codecs/side-codecs/aw88399_hda.c | 38 +++++-----------------
 sound/hda/codecs/side-codecs/aw88399_hda.h |  1 -
 sound/soc/codecs/aw88399-lib.c             | 18 ++++++----
 4 files changed, 24 insertions(+), 39 deletions(-)


base-commit: 015201f85aca1832e07e2fd4f5a8cb3e74d300c0
-- 
2.55.0

