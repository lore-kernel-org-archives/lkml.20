Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F6847C11A;
	Thu, 24 Sep 2026 12:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251541; cv=fail; b=i9zYB3Q23sacT5KHWIKLKVS4SkzL1qkbrXGy6NhDhtwRl/wO3RVMJy+VRPGuvDc30V5xjMcjSrPBQBMDppj0IBKBCpHssb4TxUFFWFhrE/mzKtxCgIcWRvfLP3ET+n4otrrzX4/u8k4DlEnWAMnfYd26zE4irYcYhpkIlvMTXj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251541; c=relaxed/simple;
	bh=dxl1zzCcRmMG3+HBh3ePC/P5i0Zsb9aHQayitU1VJb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qOmuoDOsqkE/n8g4iNJBQVbaU2UA4izsSwPXuKcUzZzNlhZvpKC04D2d4i4975DfuN+3bWLR9lsqNAsVgwSPrBFUcAAOwvXGV9zFCrn/eD0ube3AgEANKlM5PKNtdc8GaUreLFTUw72hkz8RL6jfhNayyrr8nfcMc3QxJmHYc6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KlcMsK+G; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=azPrWi65; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KlcMsK+G";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="azPrWi65"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O4ktcl3655109;
	Thu, 24 Sep 2026 07:05:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=LOH0zNG+Gw3crtZHDZ7McgX3R2KoU4M5w4vv02hrc6E=; b=
	KlcMsK+GlsQm4ynxkZrqyGDa9HUZ+J1Y3fRkPEAlj15j7sHlF1yICdT0f0VwRHkf
	gvtESJ+WJLxpyTPnkNApBsmbF2UOzrlKRFU22BgPYDGUwdpB5iJcLQUgvKX+/9eQ
	gyuhuO1NMp4+XMS3Vn77w2K3AHfqAjFRF9uNMm5vi0E7VfrpcO6KP/jXFQ56SRE8
	85yBnXqGWCRYNaQGsTn1SkmgG9ATbbjbOxkPgtkoVZfZxrVYIOembod1yp268g72
	8VcIe5GQ4F7vpdRiVJGL+nuvBbdK51GdNtTfZjm0ik7V9MqmgKA0bC4yyqX9AlZ8
	gVvTsXz/63t/tk4dxBTf8Q==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022128.outbound.protection.outlook.com [40.107.209.128])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gsptj77wj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 07:05:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvVmyBTgv4KH7BX3Wd5iAop1C725PHkYRGXRyCOl5O/uDiGHjow+pSHUDc3iq0GeNkQcai9/Jo3m6r0lM7jl5dvWOyXVs3LS4kYi8SjQfCm07iWzbRYmL+L8a+M+VgPRLVT/C9Rb7exU4VJVkSX/yflkjYrbV646Ax5KsZuQIcYkNjuy6XLjEHeXQKoxepSTNXKHKHYvLDJPKaSRcx4yN6QaURS3q9NUt1Lz2Kf5ArbXoVj8Sm79NfhwneXLpCzOoSthPyZjQfKZP8qkPd01YjIQ4UXk+QmGTF160BOvVaGa9wqecpe7Bx1mo7gRlQ2SnwUZDXYKmEH7Wm1Yw+lK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOH0zNG+Gw3crtZHDZ7McgX3R2KoU4M5w4vv02hrc6E=;
 b=j++13uCB8EklKNm5W1Nn+xB/5T8vqYklpEf0mgC6DfVxK6KaFrYKmPd/aif1evw9YYmybF7aujUOn99JQQxTCJ9hHKEPKfKcIYfqnEQstmYuk1USlRaGwPf4qAoul7FeZRx9IuYKFtsbfIW9+6Yir56bUlSST/1Zj8iSKWQS/U749hD7zu/XfTMVOfBPmNnkLvMc/fdEu3NFfwkWnTs8r4KU3h6ZPy88ycQDlNUujiSxJq7F4makHxI/F0d7scSdhseVY52lwP/Kd6x1+Wtvy+F/Vrmzr5jvRA62kT+z4gpxtVsUykA8702fnk/C6tMTR6tU1iK9BKjH6krJBh8r5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOH0zNG+Gw3crtZHDZ7McgX3R2KoU4M5w4vv02hrc6E=;
 b=azPrWi65nm8CziF7bV3DIc+9H25Nkq2VuzhgH+u37/UX2Ze8Zg2QZkx5J+aByEdeLWYt/A9UWbBCtCHsSatcO+V+fEUW0K+t+D9NvtkOTDUbkogd5jaRsrC1wD3AtcbpjbjQLORkT6x/qL+OBwpVeeYnbrS3Xq4TkrV642BLX3M=
Received: from MN2PR07CA0019.namprd07.prod.outlook.com (2603:10b6:208:1a0::29)
 by PH7PR19MB7361.namprd19.prod.outlook.com (2603:10b6:510:270::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Thu, 24 Sep
 2026 12:05:26 +0000
Received: from BN3PEPF00022BCA.namprd03.prod.outlook.com
 (2603:10b6:208:1a0:cafe::6d) by MN2PR07CA0019.outlook.office365.com
 (2603:10b6:208:1a0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Thu,
 24 Sep 2026 12:05:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BCA.mail.protection.outlook.com (10.167.248.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 24 Sep 2026 12:05:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B55A5406542;
	Thu, 24 Sep 2026 12:05:24 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9DF1F820247;
	Thu, 24 Sep 2026 12:05:24 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND 2/2] mfd: cs42l43: Move to core detach helper
Date: Thu, 24 Sep 2026 13:05:20 +0100
Message-ID: <20260924120520.2511081-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924120520.2511081-1-ckeepax@opensource.cirrus.com>
References: <20260924120520.2511081-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCA:EE_|PH7PR19MB7361:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ab9a303c-2a43-46a8-b6cf-08df1a341e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|61400799027|82310400026|10067099003|56012099006|11063799006|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZA999Gk3YCHVOKpd0JQVtl3UX7XYA+n0wwcjMV6ivxs11Hut1iUFcsMQQCUx/sCDi4rbzLcv+4a9bBtEE3ytO9PMXypCHDUiKbq6hUXEHvsuthYWnl5UARRbeL1M4u6125oPVLkzkbVvkZmjGfJY9jjLtPV5778MctN+ITU0VLiF6tOhCFCVLKkfXfCli2qaVnBpa3O+4c2l/87eYylii+qPqZuur7GhH/9due5cE5IkDMrqIXpG0Hw64GAQ1SUqG1nKpPXHVfFHAoiCUAzZR4yD5hQgoFGfa8CKeykYHY9xzlrJyAqpoTN+cePU7JPhmqm0HFbvecubkKZMA0RnA87iqc7cGHNfDVDhndehc1ucalgocka2Ckvka1njqEGgtVnPX8ru8SI5J4cUMMk9FevQ1T3Wc6djmaMBjrQcTiAfFtngrBNpW5cszi48hW07DSzjPaLs4BOocHjgosXJh1B5uSwC2WbYKL5kIZ8JTMBmtORq2D61mhZjMcLmKY4isVBv+g5P6PitHBNSAZ2lvRAAlf29/asXrf+o+yyt4getmvtUTcoOFas3/AlseLlRkA0OirWxRJWlEJF7szexkYpOvcF2pJHy7sQFciTLLd+2e5ZrN26TxOOPl4KRsoJOnsVD6+VvoyZ8GT2VrMhm/NXWXp/NjKXgYihx2+FpX4Nzvjbl1DeRWGlrQXQ0UUW+r1aLoxRC2wkR02qIVxd7xQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(61400799027)(82310400026)(10067099003)(56012099006)(11063799006)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2YooYeInaRg3REHUlupAKjZvuL4+IaQJmGAc3ySG7fqSjMIBSD3A4TP7MdekS1R/tr20RbW0jqhGc2+ztxFXXm5jhSUnGJwuKjWIsHhUnQDyKsNPofyvqTnVq9VMvbuYvrIwdbZe94yeriw9B1aKsBodqwQi4tAlT8qgpVocH4QHwfYFwvI/x2X9ZZeN7FJBYOeXYMz5VdtCr/QZWh0Ki4mxuapqB4waJ4focAvWDFmWWoXj4wUOKmPb9wGY6MSIFeE7RXhoPm0SiPhRsgd7Stz0RMIjEhPzugt3SaGak88LgclWmgkcgaZVjPOlabJ+w2AICCqsqLFSjdlznpA3UQkU+EisqJq6jwHgVB1m7+9ge6b8Rmb7f5tSpYgA6xTsUB6FPtYm3DKFpNFWyskM139bbTu4A2y9ruqff/02ZRj2qBPsifTJF3eHhZCem9HZ
X-Exchange-RoutingPolicyChecked:
	fdFaPlc/ODYJYqkCKdReUgbZi1HuREyVNkGE4EgLotyBwBct6pjKI7Pdp+fhF1LXPPC9XAG2n+QAIiJ7hXq8VhKi0OGkh+ixe3cY5Fcm30OJhPsvVuJ6dRc9mrf43PFJ6uPvzXuf9tkioqRReFZE9+Wmtv2h3AoCkA+V/0F+7P75AClD9WQo1OeUfOj/UlyFPntlbAqNV0Zluxo+Wh9G2iZEcg7OHJMLAq88h1cMVAGlpBgrFMbQSMY1gL9vDqE8/vRb1T81diZQUFkQ6BJuQ5B4PnPwb8x6HmnWd8WJO2f6YTO7/Qn4VG3WwyAg+BaAB0fQUxzhbEPfv3fiK6d4Tg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 12:05:25.9421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9a303c-2a43-46a8-b6cf-08df1a341e75
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BCA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7361
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX59b/DnDSceeJ
 zPK1ItiHRmrZFxzUELrFgbLy9AyLEnH73IJcNkhBrUL6UIlc09jre0mGOc+zBe+SS6HcS8zKx8u
 l8oW06AGJQXJF+oGe3zWlTqaDNUrUBk=
X-Authority-Analysis: v=2.4 cv=fuZJ914f c=1 sm=1 tr=0 ts=6ab5120d cx=c_pps
 a=0+3OdmKon1akQe5K8yjQVw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=tnaTcVjs3Zv_HDtWNsIA:9
X-Proofpoint-GUID: puBOK4w9NdNfRfj5CkuLks9uA62rbehY
X-Proofpoint-ORIG-GUID: puBOK4w9NdNfRfj5CkuLks9uA62rbehY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX2TM5bH4adSld
 0ojgCcoWPUhBUYU71uV3FmYm4uwLsBycZA2Pd9/tNbarhv1Rxst8f7SwDIRX9BKmLJYUuePFV36
 od0JR6pZJbncccZOkDly0tYPaaDvUyNWPp/8Ty6L61yjyLFjO/dnYai8tpJFaJy1RRs28F9W41D
 CbZbjgS/aDtrT32XwjApPy3+fT9NVaSh0Gwd6kPucFqWvsU5yknSFmmqd29TWyUu/y5MgoNz4CC
 Rwt/o2QkXhKf7rsoXfefnhSir2DF9U9E/P4zWjQPsAsda4msEVATr8AjI+KjGlvOWZBVQtDWexA
 TDrWkcIOZ/z1jYFhskYQKE+vLMWE7RcEE9YY0lCaGyS9EGJsES/7+apmvRy3k9ugevkIUPkiQAO
 uKmUHtdGx4sPLhApSOiO4V+NaJ3DXJ+SrjioyFPKfOFlu2fDkPhBUcB6B3w1oK/4wKRp38mAnom
 LKg38gWHLXcgqKBydEA==
X-Proofpoint-Spam-Reason: safe

Now the core has a helper to signal a device will detach from
the SoundWire bus, there is no need for the cs42l43 driver code
to separately track that. Switch to using the new core helper.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/mfd/cs42l43-sdw.c   |  2 --
 drivers/mfd/cs42l43.c       | 15 +--------------
 include/linux/mfd/cs42l43.h |  1 -
 3 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 0a6999453f325..f0825d6bf7b38 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -102,8 +102,6 @@ static int cs42l43_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_statu
 		break;
 	case SDW_SLAVE_UNATTACHED:
 		dev_dbg(cs42l43->dev, "Device detach\n");
-
-		complete(&cs42l43->device_detach);
 		break;
 	default:
 		break;
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 4212ebcca60b5..f08ee598366d9 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -30,7 +30,6 @@
 #define CS42L43_RESET_DELAY_MS			20
 
 #define CS42L43_SDW_ATTACH_TIMEOUT_MS		5000
-#define CS42L43_SDW_DETACH_TIMEOUT_MS		100
 
 #define CS42L43_MCU_BOOT_STAGE1			1
 #define CS42L43_MCU_BOOT_STAGE2			2
@@ -555,7 +554,7 @@ static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
 		{ CS42L43_SFT_RESET, CS42L43_SFT_RESET_VAL },
 	};
 
-	reinit_completion(&cs42l43->device_detach);
+	sdw_slave_signal_unattach(cs42l43->sdw);
 
 	/*
 	 * Apply cache only because the soft reset will cause the device to
@@ -566,17 +565,6 @@ static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
 
 	msleep(CS42L43_RESET_DELAY_MS);
 
-	if (cs42l43->sdw) {
-		unsigned long timeout = msecs_to_jiffies(CS42L43_SDW_DETACH_TIMEOUT_MS);
-		unsigned long time;
-
-		time = wait_for_completion_timeout(&cs42l43->device_detach, timeout);
-		if (!time) {
-			dev_err(cs42l43->dev, "Timed out waiting for device detach\n");
-			return -ETIMEDOUT;
-		}
-	}
-
 	return -EAGAIN;
 }
 
@@ -1115,7 +1103,6 @@ int cs42l43_dev_probe(struct cs42l43 *cs42l43)
 	dev_set_drvdata(cs42l43->dev, cs42l43);
 
 	mutex_init(&cs42l43->pll_lock);
-	init_completion(&cs42l43->device_detach);
 	init_completion(&cs42l43->firmware_download);
 	INIT_WORK(&cs42l43->boot_work, cs42l43_boot_work);
 
diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
index 8e993fb535e68..798dc55149662 100644
--- a/include/linux/mfd/cs42l43.h
+++ b/include/linux/mfd/cs42l43.h
@@ -86,7 +86,6 @@ struct cs42l43 {
 	struct regmap_irq_chip_data *irq_data;
 
 	struct work_struct boot_work;
-	struct completion device_detach;
 	struct completion firmware_download;
 	int firmware_error;
 
-- 
2.47.3

