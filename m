Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353742;
	b=X/qN/3kOCYFlEDijK690pJGf6A7YPfXwexRlFFtqtd1gKTrwSxVmaWUgW4dx7H/XVnUg
	 DSCxtDx3CjkLbmijFuL7i18HJOwpDLIeOej3QKtnLBUu94SzML5OXITtzlD9JkduzxZj0
	 RRYXxFpmQQyqnWvO/KC+3llNkPvQTvUdr9V4VzSya6ZU2VRnpShUPTp8IXOvWMrbOipjA
	 EXIw8T8YOVAhSVrZ93wCURXscwVXSz/Sjgo3uWpaK8s915UuE7YF32L8RIvOz2i2qytnK
	 3PKux/G9viLN3VeP+/J4+mECEnZCTu0M3hOXqF3F1W+zPase7lZ3gQz/XNW6p/8qnZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353742;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=+qDr+03QOH/XEKq3rtmLQFMik+IBwzvOfDHb53yZPFc=;
	b=Qb7JuIhWHMChp6wl4xidWiKtmLie3grCDhxaeQ/+WeVyE75yQ9xjVEVb1FID8lL//pwW
	 ys3b391wJ9V+ksE60yE4exV7P/q6tHF2QHHfOje77NdyLLmv41FTTAUjLEeGx+djc/50z
	 elX+eCsJuya04S4O8MZRLr5Pj+xSfrUfYBozqGt1FEnwEqu6ngrxjEThWFJGg8nahSHWG
	 7fl7ZrDsZ03xuC3gY8tidqpbUvCUmAlYuJmrxPO97IpREKiQSdhuhRKwBB3kG5ebGzGE8
	 LZYN1tKRbLTWdvysee8tKZme2z2u8vISil/ZmueOlTneZOIJN5IyE9Vp/jldgzaNmNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bUS61jfJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.34
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011034.outbound.protection.outlook.com [52.101.52.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FC9606A32A;
	Fri, 30 Oct 2026 09:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44FC9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bUS61jfJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGFcCRRtB8Li5Us4TiryJwxiLMGuM+ArshsirrM5c1qefDi6+gjkKyz/4ZMufTGvjpvR81Hlx1nJSD8KAvCqcxeTUVb5dl0DYPyDe2zalFkUTGSbq1zxdXchr2lfQy1S43xvXT/r9mzjalNNBUtxv3YalZxqaqGMx6l5xQ2ICC1kZzftziKdfF27ic11AB8u9qwsSMchtYD4LPijCrvy1GFCuYTLw/MJKgXDIFwmBdqdlS2vkTyV89Dl5WWqsMDZFMaSx4knGl1Hi9Olih97WUu2rs8y21k6REslz6d9oGtQTULsu3uQjmdvUtSG3BVy6cuZ/uvi8tx1CH7r4t4j1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qDr+03QOH/XEKq3rtmLQFMik+IBwzvOfDHb53yZPFc=;
 b=FOumKDiY8voT2EBZ9MR8KpN9JZyN37WTv0IGRIGjdbTVV1uyNj3FhOuOfuSs+02A1XE03U7vUtj75TDhJITWr7O5HU8bZG/K/AtCiRK8WM8qOd5OPPF+227cRErNhVvGvlVGtWmFz9A8ivk3HDGa94zTjlygOu70mRfajVDpF9lkYQYpUrsX8aK9iFbHiyGEvvZAhMBaS+sY94NpF8DfsJhpE/TLBfI+6mniXmdsYS+mSV6Ozqy+dpMSFHos1J1qNO0Tjj0CPq426VTHD4uvyybmFwmkvrPK06UxrF7BhY/0BzJpyRlJT1OpQrXpJ+jQ274RiSyf7loZqvKdYw73SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qDr+03QOH/XEKq3rtmLQFMik+IBwzvOfDHb53yZPFc=;
 b=bUS61jfJPfoLZedA3lEZUlOV+V151UP1ijwKGMytTpH0xUK/ux9CHh976wbFCQw6IHxqD/0HzMOqo0oxNvwNjWcwn++XgCCkF+naj3Q4uY8PjR385+NfD2NIlLdpBwZ/jlo6j/SbyCQhsqGAHAlKR4m8ft2Z1CH+/oYB9xQusBo=
Received: from BN9PR03CA0036.namprd03.prod.outlook.com (2603:10b6:408:fb::11)
 by SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 09:48:56 +0000
Received: from BN7PEPF000000A6.namprd05.prod.outlook.com
 (2603:10b6:408:fb:cafe::2c) by BN9PR03CA0036.outlook.office365.com
 (2603:10b6:408:fb::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 30
 Oct 2026 09:48:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A6.mail.protection.outlook.com (10.167.245.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:48:56 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:48:55 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:48:51 -0500
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
Subject: [PATCH v4 07/16] ASoC: amd: acp: log ASOC_SDW_ACP_DMIC1 quirk in SOF SoundWire machine driver
Date: Fri, 30 Oct 2026 15:15:22 +0530
Message-ID: <20261030094714.1123396-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
References: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A6:EE_|SA1PR12MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: 131c5b3a-1d35-4c7b-f519-08df366b03b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|376014|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	NgZCtXFRtI+/NmB9uyWaaCv/rR8Av/Gu+exjaEKTcKB3s+0Bp2XB+zbzXstXlLEPTniB93IHj4wqRMubgApaboUug0lOFgTFPjokPTwH2UzmSBUjoBPRDkvUPhxrjaXsbpdE3qh+bLP2M/DOGsCcmMheC4fhyGpZH3MeCfr5dubIHobtcLo0jHlRK17FATrjlzGtWDa5rlHF4oELwsdt8CPSDOW/Yv4g9KI33ySa3ewzeZ0YzTPiiRDJ/gwVi9iIrJ27G67qutWPtfqaz1I1KWOLrJ6Hfs+fFLyOIQBG4Gx3SDk+zBvfdGzvvlNc+UxA+31hMf0ponkKldIJEQUNKYOWdq/qjgATsZbAAwtEAysJBZqWA1gGf1pn0NCu3BoDUrvdNjRwm+y5+k2p/uUSd587TZuU2TG8OZSbCZd55f+l9wgGPHhX3dMJLzKaKp1YZcMrPctMGafNtTaZfQC0AdcMSItLNY/y9VpIeR+3VXEGY6GgHL/L0yBKe8HeSeCRipC7zNHjykgY5t4DgSTIkrKZoLRTVm+GqWWp5KmBH5qIS0+32kU+JclN1/PV4oLiibit5NzVWHSZwnbKBSyqi0thQKcc9WgRtUXS0ebwEGcHXwp7iutPEntnSl7ysnz9Bb3HILqESVXfXndsGhqirMVrLE6x+Mc4CJKm4y2W5PG10BW5t131loDEzoV2IvYvvxjlM6+zr5nWj3XX4qBgTA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g62G91ECRHV2kFwVaPcjQPLKl3wSpkfOnBpz58V5xwrKOt44cIUCnEu3zDYMctmDq1Dloqugmno8psDxgOiOMNlLU9EUiiftcKrAVLo/aWzOAEoqsVQ1kjcO7m5L67dMQjMlCPu8eyhwRiWHOhXrVwUsbFDH05Kf28wrotlnTumPq5f5lvDy48sVyE1OdZoUazqfQLxHMdEWKiGMC6Grfpiw3f6naBN5P2qVHwK2JG+tcyMXeCe/g1X9h8dI91oKwY6hRuEKwrn3dXsQS3DupZ7bUKSz/Bp0E62fAPJxNYq3e37pAWp4KSJH2nK4/IAxd6cHdsr5ZzMn0jEs15mE/XZXJKYWtU2rROGhOYiGGlx+sUjtrzrhum2yIuGTFDdOa0vm6ciOAFz+P0mZVh6FzjV3+rpoWda5bJIChLRROLUzOe9cPDZBv6yv6G066ksN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:48:56.0794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 131c5b3a-1d35-4c7b-f519-08df366b03b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8599

Add ASOC_SDW_ACP_DMIC1 to log_quirks() so the active PDM controller
selection is visible in boot-time diagnostics alongside the other
ACP quirk bits.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 34a71f7a8c54..18603e552dee 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -28,6 +28,8 @@ static void log_quirks(struct device *dev)
 			SOC_JACK_JDSRC(sof_sdw_quirk));
 	if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC)
 		dev_dbg(dev, "quirk SOC_SDW_ACP_DMIC enabled\n");
+	if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC1)
+		dev_dbg(dev, "quirk ASOC_SDW_ACP_DMIC1 enabled\n");
 }
 
 static int sof_sdw_quirk_cb(const struct dmi_system_id *id)
-- 
2.53.0

