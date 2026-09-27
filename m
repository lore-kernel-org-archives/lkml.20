Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB6B200110;
	Sun, 27 Sep 2026 01:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790472727; cv=fail; b=IKnJFxlW2II6n8VW6g5ElTKAAAr4qQ64w4dgpffvVU+Yo+U20HQV0KipnwGGJReONQEJ8n6Dep8RJ08UnxOqcR+fJAa8fU+L7z1HByAvNuJXLeX6lRhHw6+VrybJuqzmhku9MBkdbulZe8aU84eRufstpfRxoxTkDoEw3gyOwtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790472727; c=relaxed/simple;
	bh=uo0pjQCxICsjWax3U6VRIY/RReL/fHBNOypnWpUiLzY=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=HCihUBZ9JBZQwl8LNgnP/pcX886SQDBvSBabu4U0OzTJEkR7lGFMgM2iHwz1go+jmXHpr9OKkl+pVQFxPmbdaNULhE8/BPUJ4JhFDJEgenONfWR/pODUzrbOPKj35MbPxSsXAoQ7hsw0Dk3u6MctHT4/FhIuJFv06sc3n/YGafM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nEAHSmmN; arc=fail smtp.client-ip=52.101.65.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nEAHSmmN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6KvkCzU8LhSTPTSC+S5C+7qm6r/ExeMBv2tCoOEHfXGjDv33z0EcP4rNXecAbxOsaz0bR4iHG6sApRLDTuorFCwxLcoJOBdcqvWqUnCvGlJCmZGd8/kIksM2Xb4uHozOQWcMMocoEVOoQExGPD+V8DO2j3efYIV2s72DeWaRUTORsUXcDX4IdLO8ms9B38W8IoChfZMkc5G1Hh76aMrlKFai/9CE+u2EA0BG2ewkyDribt15y+Qho5FZtZvmr0mB3uvwPQXSziy9yB6CW0XtrQnfQPHSyUqZjdlhmgTNVfSj4hAcZBUnhsaK6MN6RA9ljYkeDZqyAsBJwH0zW1yjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwPijqWlKkwTkFK9qn1TJW81hQtvUqhRrIcm2We3Be4=;
 b=taDKMQcunJsxV+Do3oMY8M/vN7L9N/bH3XiyUGIeHAXsGz8Zhfi1Dy2T0Cy6p+Uj42+0nmlcqckNJRQOfdJjNT3y5ZpXSwO15w8FLKqIZ0BmBHLm/AVNE0QMB76zY5oiMMLNeJKevfBfkqtgA94sAugPXkNo5bBkn/bH9JGSuRIL8SosCQnSbxyp9GDEU5PXzlx0iRfQ6Ct4Zl3sNftWW/3hcVXWHqu38l6pb9uSeoPk5d4oA9Y2o1SQr+O/mNHto4BeG/uTYMro9c0TbuQQ18JuPBEHAGvx7ElqmNw940GuLUkhZntXxr6pTJXZdcX/Cb2+j+4fFYw0EEY7m2HxAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwPijqWlKkwTkFK9qn1TJW81hQtvUqhRrIcm2We3Be4=;
 b=nEAHSmmNwmf210gQRH5NMsodyZmqCdj+2ZTcFbP/38GrBzwQSYpbpAG+hZHtCAhfCXBKkRidhFRpjP5dmFLkkwUAkydO/UYQI9TbmMNTEW9kIFuYExN/CLE4QVQeXlha5SW1zrLLPsioXcHWPajt/tclgwITRt/GwctJm2+UAgrlQ+L/AK7chXz2QwpKBvstXH5tURfiJbFB/7vR3sL1GysOCQ09Tqu1r7H+dM40CZ7f8RXP7juFqQMJCYaPYvpPkiYxJrNeM6iUoOKqjYaV8Qor7n0gFkhQpu9qvM/5d7Cm4lkRrxTOfuo1VBiFShWPIFqs0i6C6HTmmWTzrpvUXg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AMDPR04MB11704.eurprd04.prod.outlook.com (2603:10a6:20b:716::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Sun, 27 Sep
 2026 01:32:02 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.014; Sun, 27 Sep 2026
 01:32:02 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 27 Sep 2026 09:36:23 +0800
Subject: [PATCH] ASoC: soc-generic-dmaengine-pcm: use
 dmaengine_get_dma_device() for DMA device
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-sound-dma-v1-1-8b06f971ac0e@nxp.com>
X-B4-Tracking: v=1; b=H4sIABZzuGoC/yXM0QpAMBSA4VfRubZiyZpXkYvZzjjKaAcpeXfD5
 Vd//wWMkZChyS6IeBDTEhLKPAM7mjCgIJcMspB1oaUSvOzBCTcbgdZUvu61N15B6teIns7v1Xa
 /ee8ntNs7gPt+AN7lmgltAAAA
X-Change-ID: 20260927-sound-dma-eca4f6b9faf7
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <frank.li@nxp.com>
Cc: Chancel Liu <chancel.liu@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5PR01CA0190.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AMDPR04MB11704:EE_
X-MS-Office365-Filtering-Correlation-Id: 668b975b-8459-4994-c03b-08df1c372186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|23010399003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZJsRthqUHixQQWV1o+tLJxGnKVKzg7AbW1XkGKnoQI4ouF1iRQUmo9K8z04OTUTRxxjGUc6b7IxI16dvw+vYSgH0Xq4MIdMVfodG5kmYjo9H64VG06FeoamRH3ck3VYVmgD5VCLpQ7/gqPs1AJz4MlEU2cmnvRQ868yViVYSrIAM8csDcTGfhxWvyPSeeCnyBJi+y2O2X4cV6O0mx4GaBsgGou37857wkbr8L00mVwqF28L8Ad2wgpLHB5BmyjLhthdXEytYqql9QSQLMan1R1K803GipKdkCkPORmwUXchbZWbH3wpZC/Tjnb+AxVfW6B6t1hXrmXl0MdcoAUiH+2i7ZfA4JnbVCSF6N3bp5E2c55Qc1R5DXfEsuHk5fBHBttFN5JoBGlELZgctb8RxAEXSezRI8zwjyiwKLEdw5/zW8RLHx8pJsE3ZbOkOIbVcZA3Ijpqn38g1MACDN0kN0qkq/WrShfXr8zt/sWAlu1r+BtDbthpuxPHBpOywE0QZxU4A1U1ivaz8ed5GnfqMjfvWGCmfkNk0qaT3WIEyR/ZFCAJsofUckbVuMZpOgk/V2QZ0ol7rPk5PQgf7BLGnbY5wHzjOd3dRo3Lruswwa9954wR6x8Nb756BXFIePD2Jfqd1cTrTtzHUPLZNyPkGSaYketOnwLqj/iOyJbORsyA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1d5ZFAzZ2gwNFIxTlhNNFp3RXZCc1duTldnd1NSVVB5OUU5VlNWd0lRMWlr?=
 =?utf-8?B?cEZ3blhCUy9INmtvZHFOVlQvR29Rb3ZScWs4VHd4cW1PNGZ1Zm9aSTVla0xO?=
 =?utf-8?B?aWM0VmpIWGc5VlQ1OEN2WEVzUW44Q01QL2ZUYVB1dTlnYVRwWEhseDdBbFNh?=
 =?utf-8?B?Wlp2VTA1Y2VSNDVsNVRiTDYydUc1U3E4RXVMeHdYUnJ3NElCNVhBWVRSaTNs?=
 =?utf-8?B?OUc4NVFiODV0cWF3Y1RLQktUQUMyZ0VSUGVMUWFXdUh3alIvbUxvNzI5RG5u?=
 =?utf-8?B?bVloTXZQL3VSVml6NXk3V1l2cjdET0Uvdk1mVkR1RTkwTU1ScTc4SVdLcS9h?=
 =?utf-8?B?SVlwNWthN0dCZk9YcC9ndnhEUkMxQjhWOXROT1V4czROTVZYOTJ1SXEzNmc1?=
 =?utf-8?B?bzRpSjcxeWFXQmlqcEtJSjBhWlM3TU1aU05tTlJjRVRGZVNnd1N5b2RkZ0lt?=
 =?utf-8?B?SnBIZzEzcEQvcUliNGxQQVpEc3pnbjg1R09pSUQ3ZUdmdFhBdWhmMktqQ1Ft?=
 =?utf-8?B?OGhKcktiSTA1bWswbkI2ajdGb1krckg5VE41bkRtbjN3RzBpZEZjVi9nQlZp?=
 =?utf-8?B?SjN4VHlRc2x2RmpIVVRWYVNRZUI4ZTlUbnMvSzJlRHVoa2V2bkhCQ0czWDNa?=
 =?utf-8?B?TlpPUmwxRkZLVHpjRmZrRlp4TU9JZGc5ZTJKckNqaFVCRVd5UEs0S1dZK2hy?=
 =?utf-8?B?bTVoL3ZIUlBSaVFoWjNOT3lCQytlSnkyT1NMRVpRTTBoVEM1ZGRYczIvenJ4?=
 =?utf-8?B?K1pIZW9IMjh4VUxSa3hvc2crSEYwcEhLNENoM3hHMWQ4Mjlwd3VhT0hqOW5s?=
 =?utf-8?B?a0s1VFZZQWx2WVU3eW9kZ0laSityd3k1d0dSMU92VDB6YjgyaEphK0svVitN?=
 =?utf-8?B?ZnBqVkN2dWMvNGxIWitWY2lQSlhVU2ZCVjdtRlRITWRqTENSZGRrek1vbHBr?=
 =?utf-8?B?SUxMaVFScjlZbVJJWnBaK05SNTMwTVJ5bWl0TkRwZW9YaU1Qbno3SitmQ1M0?=
 =?utf-8?B?ak9JamQvei9aV05mUVdKZnR1RlFMOVRrZHFRK1pMYzAxUDZaMnQrNTdNVzRu?=
 =?utf-8?B?OXlaSVdyTEZtMGdYNWt0eEJ0Z0xCTXhtQTdMQWsvVmlXQUpZWWszSnpGYXUx?=
 =?utf-8?B?VzFtU3JDWVBpRGxESjJZSXBoVlI1MFVZZGZPcmNiSWtQdmpoTSs4a1l4K0Q1?=
 =?utf-8?B?cHZFcTZCVVhydkdzRHduSFBwZGJIMXpTNU1EWnJqZ3lhOFdjSWhBNGc5alU5?=
 =?utf-8?B?Y2ozVVJrcVJsR3BCL2x1akVyZEtYcEI3aGpGdFhaK21GM2xPSk1LSVo5OGRu?=
 =?utf-8?B?TzF2cEhEdkNER2Z4TUdrYjU0eHlaa3BtcDZONHJtODkzT0FCcTRNbXpWL0RN?=
 =?utf-8?B?QkpncVYwaGV3S1BZeWd3WldGN3RleGV0czVVN0szc1dzQ05xSndIUWUva2JC?=
 =?utf-8?B?Z1pMZTBQU3N0Y0pCZk84R2U4Vjl5WGtjS1pYVGZtZDRZeXNRZjgzYW9PK3Mw?=
 =?utf-8?B?K1gvTHY2dTRqNVJNUEdxWUZpZVNaZVBseWs3cXl1d05wMjQrajhIT21HSEZ6?=
 =?utf-8?B?SzJ4SENlYXJ1S0xnTkVIYUR1NkZwRWRPcTBQYkVHQ0xKOGR2R3BNQ2U1emls?=
 =?utf-8?B?NXVXMnNMb1NiOVZySkk5ZVV3dlMvNDBIRTU3d3gxa3MxZUJXVkpQK1FKWGVm?=
 =?utf-8?B?YXdwbjZ2Vy9na3dieFBIZWI4c1VreEdXVzFQdnQrZ0h5MGFpMGZCRkQ2T2RS?=
 =?utf-8?B?ZXJBcjhqNGFsSk9sajhYcjRJazE4MGtWQ1pWWWRLQUU5aTd3R3FxU0R6Vm4r?=
 =?utf-8?B?clU0U3ZoQ2hxTXJlZXFBYU85WmJ4ZkVZMXpuUE84cnFlWSt0MUhJM0tpZHpQ?=
 =?utf-8?B?Q3BPV1lacDRGQjd0STdBL01UTk9mTmNnUjVrRENhejMyOVRidGJTSU81aVA2?=
 =?utf-8?B?TXo5cVh2dG1EeWcvR01RV0xUUnVDNmp6M2FrREZVaEg1TVFQc2lJYWRTbWNq?=
 =?utf-8?B?cTcrUWNnYjJYZFcvMHFJTm93aktVc1Y2QldiS21Pd0QwNzhIOXFna0NOQmJh?=
 =?utf-8?B?WlBDYU1EQVdvdmlMS01QMUZMZlNqeUxrSEsySzJMa3ZqMGxCeG9XLzhMRGNT?=
 =?utf-8?B?WkNUK2t1UWcrdHZFa2lVTGh3M1BUMFc2UjlRK2FzbFFWbkExMy9FUXg2Q0I3?=
 =?utf-8?B?ZUNublZPSmM0TjNNVUF3SnYrSDNORHRmamJIS0hHV2UzWDRESWlBL0tZMjJ1?=
 =?utf-8?B?MFpFMXA0R25vOTI5b1o0Njd4eUNSM1oxbkorNnBLaEZ1VWdRbUZqVDRWczhZ?=
 =?utf-8?B?SmJQVVM1VDVHVDllMTdGMnpwN2RsWFZaN25rR3FzL21qS1M2TC9ONDBnZG5C?=
 =?utf-8?Q?bsq5nO1hItvjsxDh0uLWH1S89TUG6vA7FG411?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668b975b-8459-4994-c03b-08df1c372186
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 01:32:02.5415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHCYixKvjUuNiT7QJPBQ5XAov+5gtgrk6KUXRwhdH/tTiaKUv1KgR/h54i0W27tTT/PW0m/TZEg/rt40QbeUyU7SiTiXjZbY4LzcyzSScRaxobuma8X2r5PrEqqmuxav
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11704

From: Peng Fan <peng.fan@nxp.com>

Replace chan->device->dev with dmaengine_get_dma_device(chan) in
dmaengine_dma_dev() so that DMA buffer allocation and mapping go
through the correct device when the DMA controller has per-channel
IOMMU domains (chan_dma_dev=true).

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 6d1dbee8f6c14..f6206ecaf26fe 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -32,7 +32,7 @@ static struct device *dmaengine_dma_dev(struct dmaengine_pcm *pcm,
 	if (!pcm->chan[substream->stream])
 		return NULL;
 
-	return pcm->chan[substream->stream]->device->dev;
+	return dmaengine_get_dma_device(pcm->chan[substream->stream]);
 }
 
 /**

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260927-sound-dma-eca4f6b9faf7

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

