Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010000.outbound.protection.outlook.com [52.103.20.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE363939B3;
	Sat, 12 Sep 2026 19:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789239880; cv=fail; b=fjapNGwDXkF6jcfkDA6fuHNnIVUvWWYxrKXNFIRoDhU/3Fm2hS2FNX1AJKWsjbbUDUuL7t9S7UcceB/bcV7pXtamQLyW/2r19KhLn7z9VeleLtQLHun2d5dzo54GEbE3f6Ws6LB/wlDzG3FrRYVRK626EWyCco/13QT1Dn9Nvos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789239880; c=relaxed/simple;
	bh=SDofauKbK8LocVjLQDWFTOCexgk/KTgFnVO1FhAI0+8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XMQ45yyydeN/ijmJXPgqwVGlTy9abboYr+0FbJdkuFjGVg/fvYqGY8g5jlAFMu/rVs4Zbjc3FI+0d62OtBMP+fiBULjtulk2wOdu9L7ZyBqoJZH27lkVsvgJggPybfF1L7g766j6VwuPtTp3TVXGf8Ss3/nIAuwTWLpKFWJSX7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=dawghkGv; arc=fail smtp.client-ip=52.103.20.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="dawghkGv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItAtLgQ7kvZN/3HwhWwrHvqNM7ENUiOqKYqyW9Bb83rUumWZMblkaAUyfk+Cg/McupMo4mRxbLKUz2Fj4xCF5b/HNKLOHLSWEkP6JBYE7mpV3JekBv8TaMcJkZ3ssYCYpyKpElfbjK9JrVzQQ+PUx50K3rrjY8YyN0DF7c1VY3im/8KZnFgguF7TYLt+8OJtv9vRlonE1GiinbWGU2g0Oavtg0l8pm5ORyYAKquBGzb8xKnVDb/IjrltowLhv0V3/MCVp6XGqz55/zzxvy2kQXvzqdEf0Xnsfs0eWhYj9fEl+2k5hjaXoMN75dI9T/0DIyTXJID7rvB16WiFC+ZY9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6/J7CJorG8K0rK8jo5y9aWU7KrBN94CdgMqa574wXc=;
 b=oTzybOsL365jZGdg5GXTvwcKa1uuk1PnhGHWueT2lVlqUtbbKEN9e3aS4zJmvx5z4wIzpQeXwVPW8VIiAYk9GLvNDwzascIJeb0s4kAtx9bJSpHQquDKVVzJeILyd8wfWk1S9862klIpR4x8HKM4h2+MbwMxzj9fVBD9T45pCCUSsKIryNgpZtNYaXpVuA7nqRJMZ4fQr1SXin3JN00psTa9pg1XLxFO2m81c0W01t6b8Smw0TxIg/ohte8N0uNMNw7C949GKlcG1R3MtWMa9/nFKEAE88N4KMW/PqIIJmx4abCDtB/y7eODjVV5lZVrzI3PH+iZiShifZOAPAXOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6/J7CJorG8K0rK8jo5y9aWU7KrBN94CdgMqa574wXc=;
 b=dawghkGvoruDTlC1aCQpEU6WlzV/HKfX25vEXhToHZzsk4g8zq3bYz7KRcGb7OujpdkITKOkokr0D7OReStuwJMIe56i9VJ5YGc6/DOJRmDSz9zBnEL7VBePJn3aFIgArGyLLyR0s/xfVNiP7L9ZIqWTiJ7n9PlONHpzC8xRXSZtOgz4x6B742RcD097Nx/oWnSO8McJLbXLdoHYOSJWKzoHLpn1CujCjeqOuq8bXxtEu5TjiEjmAgOlRR9VtqDAiWzv1jQHaoVHR9QbwJvEnDSO3xxuTLGNNxNpbPb6r1pRM+BqwelcWgrvCTMVtL5/0KPf53RGBceidc4j+TtRcg==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by PH0PR19MB7604.namprd19.prod.outlook.com (2603:10b6:510:26f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 19:04:36 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%5]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 19:04:36 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH] ALSA: hda/scodec: imply SERIAL_MULTI_INSTANTIATE for AW88399
Date: Sat, 12 Sep 2026 21:04:21 +0200
Message-ID:
 <SN6PR19MB2303BF65050B51AE7217BB9AFCBD2@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0022.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::19) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20260912190421.23514-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|PH0PR19MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: e83e5a21-7b4b-4f70-7738-08df1100af76
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|51005399006|19110799012|8060799015|25010399006|15080799012|55001999006|5072599009|24021099003|5062599005|40105399003|2607281247196008|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EZ0Ep5eFrqq7PVuRb6MJyG1GV/7d2v7XM0lI2ZxaAmQ81mR6iQwFnVVLQcJo?=
 =?us-ascii?Q?qOEVOa1rSZvYehLyoY98MnHAQiR8cygLfzJbc50ZMO79ZNgRUOiYMQ15ptsz?=
 =?us-ascii?Q?cA1sZokUgdTdFW6b/j1cbinCm19JmwIyuJE2aCHEEaf0Q6RcvL82caBxudz6?=
 =?us-ascii?Q?OFYlUe7DTFQkBAuhwYPV6QpzR00YlSQFGDDpRh3IuvtlbP2cLco/1iVR1pY0?=
 =?us-ascii?Q?Z7pN+sbxDEw2Xtu9TL/gMu06mk/d3KVNOWxx7n0sKc0k7fIUeUHXwJCBQARC?=
 =?us-ascii?Q?BnDKVVckR4CgoV6i5jleZjHEf5FOCNuFvDV5H5bcJDgUIMXaHLRVAp6JRKfr?=
 =?us-ascii?Q?1zOT4mm0Co2546Vi+NGtR9jt86HfBDvE3EKj+QlQAxl5De8PQYN1Bi6WSxeR?=
 =?us-ascii?Q?I9SqWCAi/od29SPsFd2gl5ED/FiOiP76blT8lJGdbi+uomOHyMwCqFoFI8of?=
 =?us-ascii?Q?u2+uGM+CasnrKh52STCjAPIJrwDVEQsJ6CwbnFmbRL5d55eTFI0Vnal0ubta?=
 =?us-ascii?Q?iy8KFKexrkE/BmZCK4XM9RqF71FEcoTeO146PsBTkt4iAHHHJ57p+E/27NQk?=
 =?us-ascii?Q?tImQGrFTdDUnsbVp3fmVlJmibczlRyuxz5BeCzYq/8qFh32NmIWP5LAV3C3X?=
 =?us-ascii?Q?8Ku2J4M2xErrMeiEQoHWkwOqm6iXxo2ovLctIWuQ0uFBZk/+rBxJn+0uvl21?=
 =?us-ascii?Q?hFmGl3xCEn/a9iTwDwEDDXY4ZZnblEr3wbVeCmpkiJG5NcHqUlXl9ARPQR+q?=
 =?us-ascii?Q?Hd+cl+FKkK6VmqRQRslZuzaXLmQmZ40SZk+kURNIaS6cpQYbJl4g2VBp+nQr?=
 =?us-ascii?Q?fv1BXYGdY3CnX3K5QYPNhvOy2NDOCdyH8+gAng06iuoQ70HTHcGdHOqifFhM?=
 =?us-ascii?Q?agIk1wFgpUaQ/g/9+nmRkUr07zZjwqTKW76CvNyY2TgmVmZwVl1hqRQNQM6y?=
 =?us-ascii?Q?TGr18o9YgRnpjEPm26YM2S0L16qKjnp0ZFdW2marb/d8m+waSXQxOnl2S/Hj?=
 =?us-ascii?Q?Epp1xSmtBQ/fcO5Ga919tG6GGw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8K6Bt7SZZbVoy8TOEzdj6hHUfscXRCLlI81L7sOkyiseg63xJVkpPlxhr955?=
 =?us-ascii?Q?eYaMuXmRLLWG57RX2seBg5END7Z4KmiDbaS0265b3sGv1x5RlNpBsUgDFJct?=
 =?us-ascii?Q?5S2Mun0yikpcDzrt2BhYXpud3fFeQzMjRGOPJuBGFfUcCKVS3tHr6RRQDeuP?=
 =?us-ascii?Q?oCkj6joV+NEIaVfGKyi/n/qSHBEbk7koMcmEYcbNnHHYya3ziZQewVIKOjws?=
 =?us-ascii?Q?d3NewGVm8FbNxX3l+sOeNuAfsgj2UdDrvJmu5bOoD23RTbW8zFHhqdbrzc4E?=
 =?us-ascii?Q?VetseeBqJ7U4fMaFWhoymL/0BkGxwH6LHSNsYfsxaKSJ5hDywlrYlc0we05I?=
 =?us-ascii?Q?7WMUtLzgdahljDZi0mBy3f7nNYjeFrXD0TH2Qb6z7lR9JW9EvzHhGY5wmh7f?=
 =?us-ascii?Q?dApYPJH0+Sipla2ZZc/5cEEDvalwMjnnaIghD7kpJEia2RjBRLUGuFAC7R8s?=
 =?us-ascii?Q?cEEnLI6qNbq9H03S8HyY6TP33kiWLO+tFIrkm0/FRV8TvMppp636SlN8VyMY?=
 =?us-ascii?Q?aV68tzgiivyOFsrDJKrem+l72WeOqxFs70v8/ZxDhq2DDn3DSXwI1gdgYPAF?=
 =?us-ascii?Q?lZAeDja1jLEKL5MY7hJKUik0gDXsQnFRfspstTIQNH1jqWAAGPmzKEEHa0mZ?=
 =?us-ascii?Q?pYFFNVlXvrpVfrQaQbf76K2z677u3kvtbOdGOCG87n/mpXZh5PVzkPCkaOaq?=
 =?us-ascii?Q?UmObPFBfDLf9y4hjgpBDdn0OzzCP2O4tSRQQkdpcwywIPH3c5S2asTv18Xzx?=
 =?us-ascii?Q?hsYzp2219hqCQtccyiagerQPTqB5fX1pB+U3PPAPiftXCmUhpN/o8vu46Lzt?=
 =?us-ascii?Q?56kCwweHRBnv2UYyN7f2qpoSZUFwr3TCPLlBXa+OVVtu/bL99Uk1Ehj41fPL?=
 =?us-ascii?Q?vyXnjdW958oxQyFhhmcnEYOmH2CCWv/+plubnfKdaX1AX09U/isRXBFoFttf?=
 =?us-ascii?Q?adsSPpdwcu0qAqZhgwkRh4JM0WQUJDpWbfILFkl3vBLygD0g5edFHSaFjIgh?=
 =?us-ascii?Q?iamdzLMhhmdZj9ayrt1YJF6z1E7J4iqMli983hasmGgDkEsDMYdXXcbwzt8S?=
 =?us-ascii?Q?1hhFTYBFfRMpNACnZGjTL2KfaukEeJmrFEmya6ATyF4Jh4pVWQhPBD6o8PhM?=
 =?us-ascii?Q?4Dky5diIJTuFHU+Bsr7DF3VsdZ1iWQG+5J33s24Hc+Fqa/h3Xmv/7/bOTQLq?=
 =?us-ascii?Q?VuiDcSxS/5NsrNR8qir8QzJFJwWW8epcQTpPh767ffDUfzjyx+4h4LXJOSI2?=
 =?us-ascii?Q?6pIrfbOUYCB7p0TVe2+6x6yU8qBU/7rd3YlrPPPwOge9EHv/NGztXbdLjSly?=
 =?us-ascii?Q?BzgSzvbhHWZhuEQv7fXMc62G1j9+CQzSpFrhB1dv9zPmM0OS9PjSF77LFO/F?=
 =?us-ascii?Q?8eNHxTk=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e83e5a21-7b4b-4f70-7738-08df1100af76
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 19:04:35.8069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB7604

The AW88399 HDA side codec driver relies on the serial-multi-instantiate
driver to create I2C devices from the "AWDZ8399" ACPI HID entry.
Add imply SERIAL_MULTI_INSTANTIATE to help kernel configuration tools
suggest the correct dependency, matching the CS35L41 and CS35L56
HDA side codec entries.

Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 sound/hda/codecs/side-codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/side-codecs/Kconfig b/sound/hda/codecs/side-codecs/Kconfig
index f90f1dfcec68..b7e2a6fa4258 100644
--- a/sound/hda/codecs/side-codecs/Kconfig
+++ b/sound/hda/codecs/side-codecs/Kconfig
@@ -22,6 +22,7 @@ config SND_HDA_SCODEC_AW88399_I2C
 	depends on I2C
 	depends on ACPI
 	depends on SND_SOC
+	imply SERIAL_MULTI_INSTANTIATE
 	select SND_HDA_SCODEC_AW88399
 	select SND_SOC_AW88399_LIB
 	help

base-commit: db9952017633482f445d162a1442c917b160ef87
-- 
2.55.0

