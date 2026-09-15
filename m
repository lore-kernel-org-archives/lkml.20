Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020107.outbound.protection.outlook.com [52.101.227.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085F438C438;
	Tue, 15 Sep 2026 12:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474578; cv=fail; b=WsK2MrQkqo25+Lf/I24L8y/XGrk7csjIjqbXDjxyZCcH8QMoeku/v6LzxatI05Yt1TUcGLUL74bYrBsKj22uxFUUr0qyOO1R312ZbZKXI9qmPMNN0taJlbSgum3xvG/DNDrboStMNsIh3eGLbZUW75rH4W6YX8qGWNe0T6FAb74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474578; c=relaxed/simple;
	bh=akeis8KcEPS4xkH4bKlycx02iU4oCWlCSz30X76m+zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NnUf7QkTNrYy5fw8oHFHoPsgjGN5wJtQUlD3mK1NZZzLg5k2nPgnJ8/a7gYJoJGSVQ7RMXuB3yPFmDpo+6+smoMxIsbdPHwExCqL14adBiwPsKQHNdbLe9jEfmlfCRGoM/veeRONv+GdjHmG7Vi11I6+501x+RMNLKDhl9PgSF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.227.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6RKi9JnDQiQw5PFO+JtLrwuBEkeE4pMDgGs7wAcpCO7a9VaMGm51KHvZBSoYxORPJEfeZPl8KT7uUvy2E9nf6zl3kIkUZgGqXSaAZc9ivqNNmx3pyR0im+7DLV6yQoQGM2au1BciaxMEx4T1gM9L3YL5mayjPUBhfclaLj/QTlys1TyfPkdala3gN48Yo+xqYWed3Amv/ZiCmWInKn6M2NuCtjkTAz7o9OEJAOJY0f3pzoUt2ENJAoSrc6mfu4X8bkrlKDcaUDG/LMDuOt1YTRdWD/tiBi3rQhPP3sMcn6qv93w2f3ylSgJ1WZGcNhVo3+JaxFaIS9aHaByphilXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agxyBsDJSdDneuA688UO/4gcEmIFDtUbuK6cNU0m9W0=;
 b=Z718/h2+FRB28jXtqeNbcFjoEM++FNXSrj4GXrdrqfUawoaWnq/Lbd4dt/cFxHILJmAgsQ0SC5+ePzBQ0oOlyuH/8HozIza8+EP5D89z3byQaA3V9gRdCPQB98JVo6QXJmmWCjiae5QH/zJGmNzxERNdhj4xUzqIHAyNLkpzgJOGQCG+6/C//7u+HqFZ9K4RFokTc3tOSgyR4NDRE2teGb+AoFVcOqAGI72zu7npLwRCPErG54pR6+XIjLdkzkdhcLPeOkVfrRiRuA3hOwxb6nuEdHgIaZPJfMgyEBhtrYfbsgaVgg6YQGDUXVW17mdaNKEqdBk3iUFoEQGvzF5SNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB4525.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:18c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 12:16:12 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 12:16:12 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v2 2/5] media: qcom: camss: vfe-17x: Fix write master selection for RDI lines
Date: Tue, 15 Sep 2026 17:45:54 +0530
Message-ID: <20260915121557.20910-3-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915121557.20910-1-hitesh@ebytelogic.com>
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260915121557.20910-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5P287CA0038.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::10) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ebf801-000f-48d2-e1f8-08df132321ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|376014|52116014|1800799024|56012099006|4143699003|3023799007|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uv9XXCnMWzI3MsM0dtHJmOKrKTxLwqOCgvwCnx3D0xpsamXYAtRjiyp73fnHrOHHEmsYEFi1W7lELs7itAtJZU71FJ0WqbPxe1QM3aPw6w0jZMN6dqenoVXkr4ZaLn7AU8cYKjyOXWa/YfcvF3UwoSI9Atq4tpO8A7weylCSnX7E7QCEJHUWt1BPXfUOafx9kMwzagq9r/FZe+5ZwSaTbcGiy2tBMU/pHdQ8RyMVG7xxG+7WgejwZoYuRMFU0J6jOYLAOykSM2H+AJSwbJh4V+EIVG89EbErc/nhG5910J5ei+GxIe8zQ7hkN3uS4U3r8kKRpzGzD38yEdYIZmrwQVzPCvOxrlkAXqmbTumy+U+ys5S0qgGwSlcOiQSOTneuGkhPwIAcmmHliOx3CdF1TsmJPfcILJZTrzjcg0zxZ5IqTepM3Q7o/9WyZZUPsEzkGZc/lPEkGn1cQ3TnT+kFzCHpR4Lepwf+0I8YWWDhvMoruCjf5hAphvm7FDiKD8WHRC1jEh9uJWlaIkAfGJaUS2Wl940lM+syeURTRRz46bgec/pT8mDIOm51bFCbKilYKCKSSCUmhSY8ZJZcIj6bnFGrgHM6EGNUAv5KPpZnQRVRoqRwTD9INeXhxUmMMBKVzY689CnE5wVjs3QkgDsueCSP43Is7VXAyugty+EJCsY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(376014)(52116014)(1800799024)(56012099006)(4143699003)(3023799007)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xIIGSke+EcKypwOwMTm8mehC/wa634mpL3RfSOZxjFB1/qfSxsyagsUdemen?=
 =?us-ascii?Q?Te6e4LnHGbc/me+uact11D1cPONIJ0Wlfk2LrUpZoRQqZZi0hRdxVnLO/yLJ?=
 =?us-ascii?Q?JGlO0j7hlEZMoGgizgAQLWyXEA6goRhcMY/sdK6ZOh9DPugOypyzWXT8SY9K?=
 =?us-ascii?Q?QnThDFFH/xsAVa8dvAyxdhOgdpNGOzKP21/T5sfNIb6p9dvdyGTAYAN5MK0t?=
 =?us-ascii?Q?0ob5GiAd2ZMAc3++WYTJeMRe+hHkgv9aeVzLAy2+HtSHbkcosN6UZGndnj4R?=
 =?us-ascii?Q?MILXYKQDFeu/EisnuChnLxIsghx6UleFyGvnH0AzVFVS7ySdlIx8NCjS1HFb?=
 =?us-ascii?Q?mJUhgB7IEMEZSpcXfoil8KlQVo/hY5IA8keslhnYhJynudb12WzyRlgW8tCH?=
 =?us-ascii?Q?jltTgny/E53tLdH+75NHqbYAfuNL9oR+b4xInaoeZXLmP7MRVs2W88i3+3/1?=
 =?us-ascii?Q?YjJc5jc04MAkp0PtB46qI7SODFb8QSsNxRP7z8BMVGb0XV6QdtJ5Bsd/NdK4?=
 =?us-ascii?Q?nSjDG3VCo61PDgrNljohap+Bd1OnnyBFdnReQRO/9+a6T2gKKElEYW8LIaOM?=
 =?us-ascii?Q?itEmYWAgFFfwW2IaxtFXkto0OeFc3wQXJ6fZc5aCwPUaGb1yUcTh20s77vti?=
 =?us-ascii?Q?z4GpLSZrlTANOBKN1ibyJxhrTTf9RT5CAR/xI0REwkWdQCFYastyl/NgMe6o?=
 =?us-ascii?Q?jKiZqWYZP5++gTr0DMTi1uvmoCZPAIaIhzcqo/4E4OOPmum1AwZE+QDxL/IP?=
 =?us-ascii?Q?+gx/aaG7kMzzjluC4+adhseHRXhBnjqOPBjxg9TxzQsLqA81QDO8CB1NzLQZ?=
 =?us-ascii?Q?fFNKc0e4qBC95xFVw+D1MuaigweW3oR75FVdUMio3nYXub101+jSN3vfbw82?=
 =?us-ascii?Q?vWLJ0vGchxeBT86g6oL70rXsBJ1HCVOECE9vN1YrEfJ5XXeI0xyj6J45WcJ+?=
 =?us-ascii?Q?m/Ijlg7lMF/0yOA2R8jM9f10RS/uI3nP7sw+RqQHILHiUjk34gTAtyJ4GIFC?=
 =?us-ascii?Q?4M3obkFKpgpTW5GwysbK2jYn8VlLvcy5snoaA0oLXIJ58pC+0Z51pzspO35d?=
 =?us-ascii?Q?HXx7F7swFFeKW/mtg47V/euLEw+SliJa7wlZ7njmy0VqxGXVGb6a2rTRTYxv?=
 =?us-ascii?Q?1/x+IGsY9rJpm8232oDm6N7G3uR7oouWOTq+CbfOZZgyrOfCYdasy/9PUtar?=
 =?us-ascii?Q?WFx6jALF4qXJPuR6BPKBujqsPdxPcGZV506mzYzbBETMow8MFM2evn6JTpAL?=
 =?us-ascii?Q?IVwyZE5GQ418FLAeWRKacaLEME6oQWjeWu2x3ckvSbP5WiTxaAFtDuartK1P?=
 =?us-ascii?Q?ZwQI+RayVvyuQgMe/OfWMwyGcFIEKD8Zyl5npAkkoVgCeqLbgn6eod/QVVNQ?=
 =?us-ascii?Q?FvS9xo2JX06/u32k1U/VSrxug9VaNsypsMlV8io6LzGIHySyW5AEGdlKxtwQ?=
 =?us-ascii?Q?geHYKQPidtaySkA0mEClEqfDolQKA4x7OL8xb7oFDHKxmvF54lcNAOixFZT/?=
 =?us-ascii?Q?pS95s/hLduCZMQLLRNZhBwJBoySZ3MupgQlTo5OnRbyfhhnDV+iA3apqjOkp?=
 =?us-ascii?Q?TK+uIR3bNf/duYKEEBrR5abhO6Ky1vPMBnpx71YnIl3MxSrcdzWvvRDGKYgn?=
 =?us-ascii?Q?HUZafmU/JJI5s4gCMlNhHB9hLV8gI+5WQKPsbDj8BPmyVNaEhfq+tfPgrnZ/?=
 =?us-ascii?Q?C36WmQjN6jhHvdkEeJ0o8XAtHQiBz5Uxp+3SKAKy6HsqM8Ykfb7FVChOEIso?=
 =?us-ascii?Q?sW7wZZInGemG0UuqHZaifMpDIAJ4V0FkDL9Z2ugt3tx+lwqS+UiUXGeCBYPj?=
X-MS-Exchange-AntiSpam-MessageData-1: bRi6WeVrx4vcTg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ebf801-000f-48d2-e1f8-08df132321ac
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:16:12.2397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/PXYxc1rZIgVn1vjtJz322q8BTNiXUXZnCLJW/hyrc0tWrO8ksc/PSNZ4G0kyL9ejLkg4I0AnhvLq5d3DdpSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4525

On the gen2 VFE bus there is no crossbar between the RDI paths and
the bus write masters: RDI n is served by write master n. The common
vfe_get_output_v2() reflects this by mapping line->id to write master
line->id, and every gen2 VFE except 17x uses it.

The 17x code kept its own vfe_get_output(), which reserves whichever
write master is free first. That happens to be the right one as long
as a single line streams and it is RDI0. As soon as two lines of the
same VFE stream, for instance two virtual channels demultiplexed by
the CSID to RDI0 and RDI1, the second line to start is given the
write master of the other RDI. Both write masters are then programmed
with the buffer address and frame size of the wrong line. The frames
are truncated to the smaller of the two buffers and the SMMU faults
on the larger one.

Use vfe_get_output_v2() on 17x like the other gen2 VFEs and drop the
duplicate. This also removes an error path that released
output->wm_idx[0] before it had been assigned.

The gen1 VFEs are not affected: they have a bus crossbar and any write
master can serve any line, so vfe_reserve_wm() is correct there.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 .../media/platform/qcom/camss/camss-vfe-17x.c | 41 +------------------
 1 file changed, 1 insertion(+), 40 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index c011f64f6..62c240535 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -382,45 +382,6 @@ static int vfe_halt(struct vfe_device *vfe)
 	return 0;
 }
 
-static int vfe_get_output(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output;
-	unsigned long flags;
-	int wm_idx;
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	output = &line->output;
-	if (output->state > VFE_OUTPUT_RESERVED) {
-		dev_err(vfe->camss->dev, "Output is running\n");
-		goto error;
-	}
-
-	output->wm_num = 1;
-
-	wm_idx = vfe_reserve_wm(vfe, line->id);
-	if (wm_idx < 0) {
-		dev_err(vfe->camss->dev, "Can not reserve wm\n");
-		goto error_get_wm;
-	}
-	output->wm_idx[0] = wm_idx;
-
-	output->drop_update_idx = 0;
-
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return 0;
-
-error_get_wm:
-	vfe_release_wm(vfe, output->wm_idx[0]);
-	output->state = VFE_OUTPUT_OFF;
-error:
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return -EINVAL;
-}
-
 /*
  * vfe_enable - Enable streaming on VFE line
  * @line: VFE line
@@ -441,7 +402,7 @@ static int vfe_enable(struct vfe_line *line)
 
 	mutex_unlock(&vfe->stream_lock);
 
-	ret = vfe_get_output(line);
+	ret = vfe_get_output_v2(line);
 	if (ret < 0)
 		goto error_get_output;
 
-- 
2.43.0

