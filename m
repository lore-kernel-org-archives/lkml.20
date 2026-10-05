Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4A44AE109;
	Mon,  5 Oct 2026 15:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215598; cv=fail; b=ruy4FAno2f+lNDTJzAdinqDcwRvORcShGTskXCkiaUpOcYKbS/EQ9BKoiaCU0JPJjKaAimWbUCr2Y6zTdkMq1Va6WHKU7Lal0j3ZxuPuqN1K6eQJNMqMdExur6X3As6PyAeNUIK9HazSEf8rpNcLE6LmhCcMsrt96fC7X6jwSB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215598; c=relaxed/simple;
	bh=i29Fhraj8Xvt5cmn8dprqxELpLZxPlDzEqtDmwLhpXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eSD0PafWHEVZrdZKqFUvna2/MsM031rxUwBJzACd+0eOjJev+uqRqF7iax9G6M6JPp0OZZ8JmdEA42SqtuPe2ZuLDuQpQUcmmX5ReHoLFgrJ75wSj1VhZ3MASzoZr76CAfdGoy/Q7uAfU+WbQ+Sv2k9LCwmC/FleoT7w3G7cg5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Z+OlzX7y; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TMLBIYvN; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Z+OlzX7y";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TMLBIYvN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695DUpRp1788976;
	Mon, 5 Oct 2026 10:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ZJpDBxVZa6TGcgU2s22YvN4fbyCQatLwNssHpmoI2Uc=; b=
	Z+OlzX7ydJ7mvFwtGwmY7KZzSCYoZchL09iHnrtYd6aUX4955KlXLOF9GgNJSXF/
	phWiZeVEMDeUXWRfJxdpm2ggnn35E8JZ/mIUFKaCsV09snG7i5yfsgWM2cScGM8t
	vm3mxlkD8eASucw/ETNSAqGhCZgbf9quTTYUsqD1iinM5jScF8cx3qxEs181VWdU
	5q7AcoHCSGNsjWfc1kCag+z33BRekptokFOPPDlBibdJYYgmce0PFm6VFJIOCJws
	Gq+imHgdlDm3mxDB/oWDiwrJ72x0uGrqR31QIDvb5TbMcksmX9jnOjGdFrV/DOo5
	3v1NrlvW60xjfUfGkIscYQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020085.outbound.protection.outlook.com [52.101.61.85])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h2x4ha65v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 10:53:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ok885xcVVwDrUBe2TF8+jd/yawPhiUHN1FB13H+T/3DkfmWbLlVqLgeltsDxtqgT/BthgIoakCcScMvlYu+iS3hwigI9QyuHvZgCSHByEBCtyX3O34/7+Uqt9/I0Jhpxu4rWK98S4XA+dMYdyl60WxVU/nrQkdQ/+qMw0RUvpTsNSZLCHcsLT1yikpmnbOJD6LOVZ3fTnrLQkqVH1OpSMAv8fBDwsBm+piQYE26qHGukFGZRS/GIS6ybC9B3y/Ld0xruKBn9dBJSfVFwZx4LdlpZm1zAp3603W4s8dIUZsUD8U3tAsVkswVuWXtz4yu6vKKIVomn+SxaRSZQtO1Meg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJpDBxVZa6TGcgU2s22YvN4fbyCQatLwNssHpmoI2Uc=;
 b=UXWM0t+YDbBfVy8GjoJjx9RBbSS8VadWJrTm8pjTSg0IfI32gB8wbU3HB/o/Pxj9ULYoR3hOjJpDToUoVTTE3u6QO+gfssma/uB2A1Xb3VRAZXpoHRCP+5U6IMcZrNcYIHchON1ZHouq6gfKbtYZmHZxJC2eKyxTzwG0elChRKhlHRujr9RM8P8unKSfSmN2b9Sx780FZQCZF5E9SXj+hz/lertjCooj9as98xG18VNIuPPhdxo/hdKft7miRQ3UMH74ZPp0j01XPt02L2s6+XpfYYVqafbl5X7qaPhKQuukMZMtlmlKlyCKPyYUF1ZlNUJeXPfLQTNtFQE87zJfhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJpDBxVZa6TGcgU2s22YvN4fbyCQatLwNssHpmoI2Uc=;
 b=TMLBIYvNfRofTKUNgdxVDCxBjAbeSaFsnuZi3rOASWznd03xZCQGNLRs1BtlmHNm17dIqlRIGTCkTUwD+Hq+tDZSX731P0hvf39ksrej+u2t2Ql6TmiLDL4FunvA8wNznPxBGW6U8XqEECLZa8JVN+7hnHr6unQdgHJEFQrhmbg=
Received: from MW4PR04CA0316.namprd04.prod.outlook.com (2603:10b6:303:82::21)
 by SN7PR19MB6735.namprd19.prod.outlook.com (2603:10b6:806:264::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 15:52:39 +0000
Received: from MW1PEPF00018891.namprd03.prod.outlook.com
 (2603:10b6:303:82:cafe::9e) by MW4PR04CA0316.outlook.office365.com
 (2603:10b6:303:82::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 15:52:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW1PEPF00018891.mail.protection.outlook.com (10.167.249.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 5 Oct 2026 15:52:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A05F940654A;
	Mon,  5 Oct 2026 15:52:35 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 89F53822541;
	Mon,  5 Oct 2026 15:52:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: cs35l56: Add DAI for SDCA OT25 stream
Date: Mon,  5 Oct 2026 16:52:34 +0100
Message-ID: <20261005155235.1386525-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005155235.1386525-1-rf@opensource.cirrus.com>
References: <20261005155235.1386525-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00018891:EE_|SN7PR19MB6735:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 18ad1441-b596-4d63-2611-08df22f8ae1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|23010399003|36860700016|82310400026|56012099006|11063799006|5023799004|10067099003|16102099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	QAPZJ4lwriSKhaWFiRUCKw3gL8wDTIgQfc68LQqdrg9UgExkTAdFIdPUqDkG0exSAisjh8IjlYATdhxYX+gnQngQFA2nZijKF1SN5oef5f2/eUESJcHxBpKFEDaNMSXeYbVk6UtbSFyXeIQr8hMnkjPuxWCSLo2/V3ZzEq5riFPEfznaAdTLeL+m6RHV/tBam99AqnFNT0T82BDWp2EI8jsKoa4ftEzhkmowxqH/B/TqCFFiMGW2LCA2ZicIIoLUw3zqrEwX58yjx8yH6uhBrA7R0o0Qz7wPTX8gTuOQzWXzXE8+5yNkxtuM5UmghdY1gBnK7uxP0gYGdzk4UrDWnvV7L6H7KByKdecaS49CYVCDZWVKS+0LCJV8TBli8SMcQriE6Q0JRzf1E8OpI7PIbvY7vnoKP5SrfosWFc5Hw6eeGJ0D8mxFKHUI609/5UQJW3xT3y8q4ejqXBJ069+Zi/TW2ApS44tycNE+aGlghn5aSVKSeu/0uFnHby9fshwWEil3ow5Nfw7h9czBK/F2nIa5tegDo3df/CZRCECo9+e93jhjC2lM8oD74nfluYn4ert/FOSakfWOCFpOWWa+IUOdk0Mia2pjT+Auz5BOc0sqGjpSvNzmcLstcvQ68kIX7rlYvn4evAzPfRDJnw5vpCJj0bq5rCQRuo/IFrpzSguM8Q74ZKjFvV+xsAk+4bNRK3e6FCyCGArcT7iItv15RA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(23010399003)(36860700016)(82310400026)(56012099006)(11063799006)(5023799004)(10067099003)(16102099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yVZqurxF/LtINqhAPJ58/+BGOP8Igi4zNefvicFGpCoHHyQHz0kFmRK+Wrn4U1NI0vlZHX1T7laqHIo6FfgsUoEn1ZGc7bDLpj+FAm1LTqJ9KrZNhTVIyu6DKe7P7eKLPisggECBgK4vmJE+fKTO+9DXE624YGAoeAoKy7jZLT/T62jP73FPHXwi1xaZ7GmtbUyNogfXej8T/1ahVXONETpASZ5JQ8+zNfTplASKf0mi8LBeZfGK86c8Y/bwcK8qSWz4PoJWxaDCE/VYB8WA/METRGHZHdoVHFrfExf5Gv4BC1Ixn0/H9Wmz6B0Tmsu1at4nzhNJuQ5LcSfBSk4aD3rN0jnSfDIy1nq9jOLE+/S5k7eMfn4+sX2cpVIPVKVcaUHVezOkwBgjsOzkhCwW2dj5vQTlF3Ag8xXQsHv2uri2eHGWQkDTsUrqSZSaq0qf
X-Exchange-RoutingPolicyChecked:
	F42pcz/AdvCTDiXwAbYFgepQQYqTqS0j18tvxwo4NB+G/ZtwgGLuXIUlbha9qVG667gLLpneaH4fQhl73vM95aPgGLwWraFn5qv44Zlble1v7lY8ERwfe/rnax3Sea6JSqjBHVmRBekpSZl1BU5I51dXaw9+ZHAXcr5tTgbwpOhf5X02xQt1cWHF38oepNHmkWsKTzd3JDTEfu3buQdGZLN75snajyi8HXOWjbPZuAIEJ7xcK86mrLa6ulV/at8Z85Wn76FjUhxKlqCuww3LqDWaSzzW2O6cQBJX0BboiOPTpDV1rl870fNGvH89aX9OpxctQMxFclMuQ5TH/y+3gg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 15:52:37.5207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ad1441-b596-4d63-2611-08df22f8ae1e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW1PEPF00018891.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB6735
X-Authority-Analysis: v=2.4 cv=DuLDa2/+ c=1 sm=1 tr=0 ts=6ac3c7ea cx=c_pps
 a=CX+cjZXKan4d/jn2X7CWJw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=sRoYfhtvnIxiPnEUwOQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MSBTYWx0ZWRfX5b5147/RCZIo
 H5JgLDpaTnaiOT/O4vzoGJbi9x5redR3XwjQ7EcvKZDf4igq5Nf4bon3mJRECZeKfzXJ88+GEA6
 27TZUGPWgbEaBdhUKRx2YlwohlimmTC7qzueii8VcqGLgXUIyVOcZZuLoaKuEJ9iN5JJpmBUzdK
 sUKJM2K56yN3a3jmcr447Sx7MVOnWxTUnYFdiY0gwd5K+OSjtLw1zvmTxEar6mP4NX3i6q3uEpe
 7Zg0GmIPFdV936/8dufuepHeXiJYCUKg0ieD9+1Tju+7n0qg4P5LG4hyG/r42hhizRCBAy0hcbH
 WW5KOyarH24JQzoneOBkx437QImLX345VF7VApjkgtDlOuTOmEO9wDw6efoikxMamAsZehESegR
 rE9bfgEKWpbBjMkkq6rXl7J2dk83WjZSTusd55Yxur/+Gl0bK6MFbD2bakkIhWk5TTTptyCUKQh
 SX3KYs074I47K8278KA==
X-Proofpoint-ORIG-GUID: Hwf-h8E0Aialua7h1ROjqmTfmGq2jtlV
X-Proofpoint-GUID: Hwf-h8E0Aialua7h1ROjqmTfmGq2jtlV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MSBTYWx0ZWRfX3yBQ2Ek45GPZ
 ebrVlYQmZHuMpis9lMfWvOtqlWI5Z+J8GYz05cV064KK1hwbkTzIwJjsAnBfj7ELqvc43JJiHi3
 KsgfiWo0rtGF4nNGmvzW3Kcv2siSoz0=
X-Proofpoint-Spam-Reason: safe

Add a DAI for the SDCA OT25 stream on SoundWire DP4.

The SDCA-defined OT25 stream is an amp reference feedback, typically used
for AEC. The firmware outputs this on DP4. The firmware owns all control
registers for this stream so there are no mixer controls or any other
configuration options.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h        |  1 +
 sound/soc/codecs/cs35l56-sdw.c |  9 ++++--
 sound/soc/codecs/cs35l56.c     | 54 ++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 45a5df574aa6d..747e10ec1a274 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -312,6 +312,7 @@ struct snd_ctl_elem_value;
 
 #define CS35L56_SDW1_PLAYBACK_PORT			1
 #define CS35L56_SDW1_CAPTURE_PORT			3
+#define CS35L56_OT25_CAPTURE_PORT			4
 
 #define CS35L56_NUM_BULK_SUPPLIES			3
 #define CS35L56_NUM_DSP_REGIONS				5
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 98bb4542b9143..e10f04d677f4d 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -265,11 +265,11 @@ static int cs35l56_sdw_read_prop(struct sdw_slave *peripheral)
 	if (ret == 0)
 		prop->clk_stop_mode1 = !!clock_stop_1;
 
-	ports = devm_kcalloc(cs35l56->base.dev, 2, sizeof(*ports), GFP_KERNEL);
+	ports = devm_kcalloc(cs35l56->base.dev, 3, sizeof(*ports), GFP_KERNEL);
 	if (!ports)
 		return -ENOMEM;
 
-	prop->source_ports = BIT(CS35L56_SDW1_CAPTURE_PORT);
+	prop->source_ports = BIT(CS35L56_SDW1_CAPTURE_PORT) | BIT(CS35L56_OT25_CAPTURE_PORT);
 	prop->sink_ports = BIT(CS35L56_SDW1_PLAYBACK_PORT);
 	prop->paging_support = true;
 	prop->use_domain_irq = true;
@@ -286,6 +286,11 @@ static int cs35l56_sdw_read_prop(struct sdw_slave *peripheral)
 	ports[1].num = CS35L56_SDW1_CAPTURE_PORT;
 	ports[1].type = SDW_DPN_FULL;
 	ports[1].ch_prep_timeout = 10;
+
+	/* DP4 - capture */
+	ports[2].num = CS35L56_OT25_CAPTURE_PORT;
+	ports[2].type = SDW_DPN_FULL;
+	ports[2].ch_prep_timeout = 10;
 	prop->src_dpn_prop = &ports[1];
 
 	dev_dbg(&peripheral->dev, "clock stop mode 1 supported: %s\n",
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 74129fcc79dce..dd264c310e1eb 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -32,6 +32,7 @@
 #include <sound/cs-amp-lib.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/sdw.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/tlv.h>
@@ -324,6 +325,7 @@ static const struct snd_soc_dapm_widget cs35l56_dapm_widgets[] = {
 	SND_SOC_DAPM_SIGGEN("VDDBMON ADC"),
 	SND_SOC_DAPM_SIGGEN("VBSTMON ADC"),
 	SND_SOC_DAPM_SIGGEN("TEMPMON ADC"),
+	SND_SOC_DAPM_SIGGEN("OT25 Reference"),
 
 	SND_SOC_DAPM_INPUT("Calibrate"),
 };
@@ -388,6 +390,8 @@ static const struct snd_soc_dapm_route cs35l56_audio_map[] = {
 	{ "SDW1 Capture", NULL, "SDW1 TX2 Source" },
 	{ "SDW1 Capture", NULL, "SDW1 TX3 Source" },
 	{ "SDW1 Capture", NULL, "SDW1 TX4 Source" },
+
+	{ "OT25", NULL, "OT25 Reference" },
 };
 
 static int cs35l56_dsp_event(struct snd_soc_dapm_widget *w,
@@ -722,6 +726,37 @@ static int cs35l56_sdw_dai_set_stream(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int cs35l56_ot25_dai_hw_params(struct snd_pcm_substream *substream,
+				      struct snd_pcm_hw_params *params,
+				      struct snd_soc_dai *dai)
+{
+	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(dai->component);
+	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
+	struct sdw_stream_config sconfig = { };
+	struct sdw_port_config pconfig = { };
+	int ret;
+
+	dev_dbg(cs35l56->base.dev, "%s: rate %d\n", __func__, params_rate(params));
+
+	if (!cs35l56->base.init_done)
+		return -ENODEV;
+
+	if (!sdw_stream)
+		return -EINVAL;
+
+	snd_sdw_params_to_config(substream, params, &sconfig, &pconfig);
+	pconfig.num = CS35L56_OT25_CAPTURE_PORT;
+
+	ret = sdw_stream_add_slave(cs35l56->sdw_peripheral, &sconfig, &pconfig,
+				   1, sdw_stream);
+	if (ret) {
+		dev_err(dai->dev, "Failed to add OT25 stream: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops cs35l56_sdw_dai_ops = {
 	.set_tdm_slot = cs35l56_sdw_dai_set_tdm_slot,
 	.shutdown = cs35l56_sdw_dai_shutdown,
@@ -730,6 +765,13 @@ static const struct snd_soc_dai_ops cs35l56_sdw_dai_ops = {
 	.set_stream = cs35l56_sdw_dai_set_stream,
 };
 
+static const struct snd_soc_dai_ops cs35l56_ot25_dai_ops = {
+	.shutdown = cs35l56_sdw_dai_shutdown,
+	.hw_params = cs35l56_ot25_dai_hw_params,
+	.hw_free = cs35l56_sdw_dai_hw_free,
+	.set_stream = cs35l56_sdw_dai_set_stream,
+};
+
 static struct snd_soc_dai_driver cs35l56_dai[] = {
 	{
 		.name = "cs35l56-asp1",
@@ -778,6 +820,18 @@ static struct snd_soc_dai_driver cs35l56_dai[] = {
 		.symmetric_rate = 1,
 		.ops = &cs35l56_sdw_dai_ops,
 	},
+	{
+		.name = "cs35l56-ot25",
+		.id = 3,
+		.capture = {
+			.stream_name = "OT25",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = CS35L56_RATES,
+			.formats = CS35L56_TX_FORMATS,
+		},
+		.ops = &cs35l56_ot25_dai_ops,
+	},
 };
 
 static int cs35l56_write_cal(struct cs35l56_private *cs35l56)
-- 
2.47.3

