Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792649394;
	b=AfEBZN564gWYNAEHXMu2bhP13O1TXttLsgnmhWtvnX9PLPIm5qnhy3+vzG+LMEv24gOI
	 pQeWGv6wEUie5ly7rYj0Y21Sg6dGeXBaDT0DRNwvWKmK0syF6ZFUBMioM6hiWEl4VYj9z
	 fpanWPx7aT2zR81FS24GfocBkIAqepLDvzUnX9rmRnAt1IZjPk7sOZEtWdJRxuhMnrSbp
	 xB5YGJQgTM9EfxKmGggdk4Ihr9TmcquCjaakrKKeVcCUnoBxmWwUyIPwFUEXuK/g528a3
	 iV9aGVCEqCXDQ9blM2X1pUF3gyey5eBlWtLic+oOhhf8kaooqcgjggB4WgmS+Nt70aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649394;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=WC3+dgMuAPV0dVD+o9GkZOO0UoofpWeKaE+7sVTyIlk=;
	b=4+usRuM9QRI+G277+giLL9rIL6Yz6jKXOvPoY/7Fl8Fk1BHOx2cq/9j02c9UOhuOlsYF
	 NJgEyebawieDXmUnsEhPLSlxdsAJ8vMNgjsMFdI0DpsjYBEQ4GLpi7bce4CsUfw5tRxIw
	 40nl6qmLyJjVj0U/uSjypZk3l2i/Z5xCRNTSC4tIbE4u4NiPas5iFW1nhUYMrsTFbnVel
	 QHXxvhOh5h3eEE4MkKDfDDDIKKCVtChx73BQp+mEtfmwpkJzBENOHbZOzN1CFqM78siiw
	 m5FiiQz8ZfRokgcc2aXAY6Xvr24zLVWFH9nrFb9tWJWjCKaOJFEs1WKTEFkrIbftNpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RPWKlGEX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.54
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012054.outbound.protection.outlook.com [52.101.48.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB28C606A335;
	Thu, 22 Oct 2026 06:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB28C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RPWKlGEX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9WOrtfWczjKOXe9rMQBdWmAcOripNeRvwItDGiQjPAA3WmI4p4t4VOY+VjPi7w7DIW4zmpTwCEo2SUf3g18vZKObEvStPKTibhFB6lKQOU4JQc8jRxXKtCm7AUzhWEiPMrQn35QTruiZjienmYjt0ktMx/PDVBnRvEq2V8c8aoGvgBOddkyvwjoKYtiqKVooiEPDpovDafoGGUD4IBaXDEPMg/HW1Mz8UZEuh5+GNJ5kCJpiW1p3oQgKo+Z6H6F5JsUMcCiCR7zvQjPy+3/m6UI8jasYZblEkC8z0yqH8pi5VHHQaqoi/1S3ULAG5ykY109SQHLxQSvzs+EykndUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WC3+dgMuAPV0dVD+o9GkZOO0UoofpWeKaE+7sVTyIlk=;
 b=QzecWrK0nbbH036y54AN0JqasuVpMg5eVs0L1yRarc2lfb2cbGFm3IHbcOFXP4EF8TWW6GfXVswImhO5m1UDWKN4o0ejPYRR/vK544biRjXNSmkjxb95lftFD/A3L38ehnwzi21y2M9b9+aviyRcQlFFKgyAlQUfsBNjUYD6VbG2yQBDtl1UacaSe8rbOBHqUJp818IJlHdsRO1k1dHXUtHQcHyLPY8Z0pNSA2FnUpFVr9tkoq0KcqUdUTxZFZFCJbMltMjd0lmrNaKtD6mnCRAQat7NekXvReYfSCwHViMFwHxPIhGUgMLVGT8kxetmJxwewZWodYSkR1xQJ1z/Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WC3+dgMuAPV0dVD+o9GkZOO0UoofpWeKaE+7sVTyIlk=;
 b=RPWKlGEXIkBGaHNZR6L8+GE2O0l1F7fhlw2jFP8/YzzTHspc8TU7LMp85MaMc/HWkI1xa7WxJvg5y5D2zCYI3EjDb5FiSfztECSIAkXnpi56PrjnlzJDbrU/fScAK7HCFx3LlunuxZtmkNe+T93Vw7BtnrSTGY8P19UJ4Uk2XwM=
Received: from BL1PR13CA0111.namprd13.prod.outlook.com (2603:10b6:208:2b9::26)
 by CH1PPFF5B95D789.namprd12.prod.outlook.com (2603:10b6:61f:fc00::62a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 06:09:50 +0000
Received: from MN7PEPF0000014D.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::22) by BL1PR13CA0111.outlook.office365.com
 (2603:10b6:208:2b9::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 06:09:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN7PEPF0000014D.mail.protection.outlook.com (10.167.254.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 06:09:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 01:09:49 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 01:09:48 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Thu, 22 Oct 2026 01:09:44 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <Vijendar.Mukunda@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>
Subject: [PATCH V2 13/13] ASoC: SOF: amd: register SoundWire alt_machines for ACP7.B
Date: Thu, 22 Oct 2026 11:32:23 +0530
Message-ID: <20261022060724.1814741-14-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
References: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN7PEPF0000014D:EE_|CH1PPFF5B95D789:EE_
X-MS-Office365-Filtering-Correlation-Id: 400a92ed-c1bf-49bc-5844-08df300314f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|56012099006|11063799006|261009223027099003|18002099003|10067099003|22082099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	8jR6jNSPVXvHcVZoG9y5VWA3p7N7qTyMiDedW4/WnNyg9sHTgYV5+RKx6vXPsGP9Th2Lk7jSyr5n9UtJUmmp/ZhRqQ5OKaOAT33ARPOJ++i4ugS307r0A8+PBV0aNBukr2ykzKN/1kA+y6uhk2tYtV4fdzFHn/O1It+KNy6z2xiOyAVnnucgLG72yVkxxH2nfB83B43xjqNtOEuT+oi1B4RrwTlT/bN0Zab8c4qWyrIIZrmMdi6Aq5EhHYVV48aRE2hP3SEc4BRYVmzjlRZ1j/7BtsO98u9oq9zb4pzjXiIkT8pZkOV+hCrArZdnfjFjTtn/bCowowm9T0HtYPiIq2ZsmGoRXAnSTcB0TLbdCCsUj8nGv3FXQw5fSgqUtu91bizmdRGHUx1KTVD/4cR6zLrm66P5U5VJHONyrkGBNXIQD+TykAvob7SWCoRyUaVFs/2vYYZgWjoY5curvBQsL5WA+NTtU/CsxrAtURpAKquXOuv0CV5yAjxiNkNTqyz+T+N4yFoDiTnK7rfYeHk7sOH6JsoKfixT4onomZuO2RPqagSS/8/xxQji9EeK78BHE5PqwbHz29pXXRWpWUu/TASb7uSzf+WmAA61MZQDSYKunan7heWFlv7KZ8qGniv6m8hiT5cc45pmPXYt3QJZmvjDq1chyvKSOUGVu4UpaxxCyoWh9tEo80+OB/QUMQKphGvCMkMc3opidGnmaYBikA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(261009223027099003)(18002099003)(10067099003)(22082099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hZyS10lpTzJXjap3Dq1JmqBhkyXVY2Wep50taSQ0/Xhp1nFvgvCh1snryLDyQyyuwsenYB4YxYJ+k9ZKOuYYx3QcXxY93zY+Vn8KOhl5GqaximMOqh1TFOJgZf936HTkEOetvQZTr9sSN77SlNW47QZGKhBNYkcLlyV+W7pWxvYiqI2uhdZSNuM/Op0mNVTLCEAyq9GspBQCJmJdSkjc/0NHv0dx39DXhHPN+2yMUVNtAzn7DM5QWAKkNZCbARXSsGPQy/byKEl1fvWCoPGrDWFJq98SF8WsDqGEK+BDZlmZTzVmwMVtmycQvtU4FyziXsc5RnN1hrT+jGM5i1qKMfEIdNQUQxJn53ShDG8sU+jWhQ/uitulIYHa1aB+Gt0vWAJaJQHzfIGbYLJgKivOjUCEB81UUwkJGN55pUZp2vc0Shl+ORmKwAEjaV9QPcz5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 06:09:50.4081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 400a92ed-c1bf-49bc-5844-08df300314f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN7PEPF0000014D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFF5B95D789

Register snd_soc_acpi_amd_acp7b_sof_sdw_machines as alt_machines in
the ACP7.B SOF device descriptor so that the SOF core selects the
SoundWire machine driver when ADR devices are detected on ACP7.B
platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/pci-acp7x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/amd/pci-acp7x.c b/sound/soc/sof/amd/pci-acp7x.c
index 2999dc6d72a63..6aa16d1a12b95 100644
--- a/sound/soc/sof/amd/pci-acp7x.c
+++ b/sound/soc/sof/amd/pci-acp7x.c
@@ -47,6 +47,7 @@ static const struct sof_amd_acp_desc acp7b_chip_info = {
 
 static const struct sof_dev_desc acp7b_desc = {
 	.machines		= snd_soc_acpi_amd_acp7b_sof_machines,
+	.alt_machines		= snd_soc_acpi_amd_acp7b_sof_sdw_machines,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
-- 
2.48.1

