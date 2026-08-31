Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D13F3E4C99;
	Mon, 31 Aug 2026 11:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177039; cv=fail; b=EnWvUm3JvGqvO5zx4xJjgMaf7CI0JEERXxb4OM6xO+4h43VDmX7GLeTPJuC0lGAbs3ezNOgQapmN1N2unNHnxDpEiv3Oxk4kLtRponn+v2wtH+CgkOYSoeTp/e5kit+S269Mfq51SAJ8e7+nAfu9rvxDW2Rtf3Ed8/37NioelXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177039; c=relaxed/simple;
	bh=99X0p32uogqxqo1DbwDPJ+UiQz/LTaeW33s1eqnPI8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zd8WoZ9Z9hE2Gf/Be8oqhokAxnhrZN7Zbak5j0FZd79kvh23pzn2Ny9+nuVpWGyR9gzWYL6U42hJqNTrjvVIH7vIvD2KcI5YlqC+2BLcryXm3MgohuRP144idtg6dMCQEYi6cJ3ibJFfq7irtj9Wz93e5jbEI3Md1c/ME6Lygn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Pd+X3ncH; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xISX2lL6; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Pd+X3ncH";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xISX2lL6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V4hUwq3902342;
	Mon, 31 Aug 2026 06:50:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=5nAeJKyFAyp5cm0+DNcxsZY63xKWRcYn9blbNZlEAbU=; b=
	Pd+X3ncHTHjg49nRZHNCxcXZ3Y6k2DFQ7QSs93qyj6sejwq3hsm1MLdGCUM+oi6B
	KS641IvfgkYMIKjX+GZZQAN5yoDW7DG/PS8w9Bf7lZSFGR8jWt0w+C45UFr4dRKu
	rvnANR1A1uvDOykEQUzMLMrKSbvtt5nXxzu2Ui0khErbdhPRUeYRVtCeJ0QpKTAc
	aZ4Ggm5eIU9EGStFzaCTtCRTRZvIlEOE/ck6QZwX5YAkFMb4DqdLy4ODVj2v0v8h
	T+qS61zWvCwQyVWGnyy2QvlWqTUug42LlsoqP7/ttw4NHmoqwpv/M+d5r8tmf1Dg
	P40E/vVu881tYihk+pEIeQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020138.outbound.protection.outlook.com [52.101.61.138])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gbuuh1x0m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 06:50:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCAib5JIrAzVsHYqBs5NwcKME0uMrkgxiJZvq7Rd9OLhPY3PokygXBbFGW6yZJa6W85qTJ1YLrrR2sCZoGkp/SZMVu681+TG9qLgP20eUVvLlswsVyuyhGxrDrylsiUyHunW+eifWqYwBJjEr9FIkN7SyGhjBlD0sEXwWbs6pBIuRhK4j5T1PU2tWwxmN71+VdATNo0/PIE9iamZTbLtRUg6gVwRrVm7Woofq9XjTrovdjWEvabMYm++jF/cOkA9JFKUdixxPPrWbSgAfMJOHC8AGi4MzrxaFA+pbz0/XwOE4CdYEOxUQSjiQe4ob2aL4gwMh/Cer48UAZHBSfPRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nAeJKyFAyp5cm0+DNcxsZY63xKWRcYn9blbNZlEAbU=;
 b=hWER3cSNfL6P4ePRnmPfUBcKdq5k7bWM+O/WG/NSpcJvRByrfvUXb+7f+nchoZo6UuwI90gdS/7RSBjDkQxMhV+9WVHxU0A8u9Wa5Hqn1+FdYoV2mPBSwmjtcP25KCjW9Wg9RKxwacA/ocUBOr9pTAcaAQ9vDNd8sBHse43GIHxFYIYBmQg/ipVZRmvsTvV0ivF1GjF7fdRBUjVNiUaCnhyeXnmZWzJZrKYdIzGaFxY9zOP0tNodXEmaQ233eix2levWVdNBSsLeNfoWjkhefjn1xtytk76MP4IZ1eanehZazoUb0p4m6QFGcz5L6GHwEcg6Bq0jvvAYViNOTSDcZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nAeJKyFAyp5cm0+DNcxsZY63xKWRcYn9blbNZlEAbU=;
 b=xISX2lL6gD+BbK47mlGx7LtxMqAwVv+i8HB3jR60eqrsTgamL5aXZCN4sZQA7YH2Htvc5QWyqYydugoRQsXBUU4dfoMa6c1vgPzsVUqXYeocpRO9uTwm7INWyLeOIR4yNNi956KuvogKTwEu91KnAznGYTsIN1D30F6h1+XCQjE=
Received: from CH5P223CA0008.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::29)
 by SN7PR19MB6993.namprd19.prod.outlook.com (2603:10b6:806:2a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 11:50:24 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::40) by CH5P223CA0008.outlook.office365.com
 (2603:10b6:610:1f3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 11:50:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Mon, 31 Aug 2026 11:50:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A921240654B;
	Mon, 31 Aug 2026 11:50:22 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 96D83820273;
	Mon, 31 Aug 2026 11:50:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mfd: cs42l43: Move to core detach helper
Date: Mon, 31 Aug 2026 12:50:19 +0100
Message-ID: <20260831115019.1616202-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831115019.1616202-1-ckeepax@opensource.cirrus.com>
References: <20260831115019.1616202-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|SN7PR19MB6993:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 78eed568-e2d8-4cd7-3fde-08df07560aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|34020700016|61400799027|376014|10067099003|56012099006|11063799006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6F4BnPOInpND5fj3xvB7rWBLS0tyLgsTPBT7bZKs7V9fnA8DVsywVRgS+r/sU8UWUujE8OYKrq2jC8NaUjYZE4NbUv1lfNC/H3urRl0h/1WK5PWNuzN0EhuktMeyhIUJPvDTwpWrNlBjn530ywVc+cJAKlfqXqwb2AZrriZMmUCPoWqOy9YAe18w7UBSe7ErIUy3N4emdLGmxpeJz8aG5DBDzN3vIHMugSXcqzLsIxQAbn728uK13/93bHYXlGZU1yYKGd2NOv2t+aSqCknhn8ZnpZ5SNxD52Am0orZ7nvuqvq881QXX3IopQPgG+jyA1mjXKQ9XFqVdHJZLv6u4PXKAB5UxtgGo5ozJc5mnfeI1wwtDPKIyclv7TEY/M5tqoRc64XQfElxlTg+qYVCsxtQaGTdsXDmEdUljPPM3MtnyKo2ruSqJbRLptetB+yUQKCozeh+X9vmegrKueAoAFj/f5UboEzZUrsOe/XRI05mZlBcGutuMdJx0GWm9KQ8MPwiecFUYs1l+jfZgJfV2gvvFR4p2QuIClQNK4XE8elQvLm9QdTsYxAhFPjoTkpVB93ovr8PiOic0rkKcQ4PXfllaCKWl9JhrTUXRBsNj7LO9pMlSdiwx93hqcqSXsRHfKIQGGwzGPkWaD4PuFy8aXcB5+bmu19nVOvaWrTTbloncEFPiZOemNZ9chMZ7eo3xEbJbC68ZOSa4GbikI/fXDg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(34020700016)(61400799027)(376014)(10067099003)(56012099006)(11063799006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1zq3CpD0VTQ7Kir9oTgWeiIhVe3rfSTiAw6u4jO/7Z+1Q0Fql0fzNByltUv2dbb7N9cglBPyGBLjkFI/Lyu64F+ytgdh7RKzAvAwXhnQCCL12eIzpg2hzDSVfCvn5tVK9Saw1cHy8gEmz/GG0pHn/GNQgkMEwNt5b8JTSOq32UIMC6w3QGvj+Mjrf68aL5L8U+8Q24Kk4ntXiKPc7/l12S+9nTHLUfS/GM+T/JaZR+s4HL2wDLuRT78WuKWjCW6h1x9QStUCOEHbLihhd9tUMnlRqCWWScPEWX5aXkhTRHiGJAjh/wW/Kg6YUiIyk03v2m+lkP/Xe5dH5Y+OEsmzmDwiod47OUgYlGgUIFS2U1xU+fds+RWanqY7+vZzKGDN6Ja6VZpUOqX4nF9UGAekDXZR2fFaH56WEa+fFA03O3BVKt+SYAyW2W3e/Wih+iQQ
X-Exchange-RoutingPolicyChecked:
	3atyPsaV3mbRsnHZG00WZjz9qdqoigFqrWqCzl3AYstTtX6KDgxkyxqSe+GkNGrFGz9uaU+Ch79y2bHSdsG0Zl45ujWwaleHrsAsRAvDhXb6JGg1sYcaEkseTKPNcZQYQZH+ksRR5cuXLXkgJjjmlIrPKdgPGown5Z7/sn4TEuruek2KQyN1iF73vSq9hgyaNzC9Q7/DO+br7oxfVwoGO1MFqKCsy24hc7MMXrSLSowFhMdGDZP9UcDhrx8JAZX7EAuTbq8Y3irJ4V27mMHy66/BvN0xg2n5vN7YCNlez8pGpXgOAX2nOfHUoNpwWKuG8gfLzxKG4Cb43eXFEwQkNQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:50:23.4687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78eed568-e2d8-4cd7-3fde-08df07560aa0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB6993
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEwMiBTYWx0ZWRfX7XYrreAFgNBf
 w+vcx0qUei+a3Yhjobr5qWGln5FRtM+ZGh5Gcx1D63f6s0KS/fmaj+71rj7SGaVLO5A7cUgxSOe
 nzGCNjcb6D5OyUsjigBT44CTflJWBm6P7/I7Nw6fV2WQYtRaTrzdOzQM+uHyBEqqoeuPTItLheO
 11Vh7yy+MyBTTBBhvdPzWJE1psx5GJzWY+soEodJV++Kxvr3DBzp0GjB60788ZQhkJbuSzpxY/A
 Bde5MnsdXAUKilUmgMVGVeFFWD6E/obMsjiSEPJSw7y3cCZBCDxxFy7htnt1MyPCABr+QzpaAto
 F9N2aRHrU4HNYYaZWU9i841jEkliYvebnCEtr/4yvD9jUho1+NZ0qHKHuJio8q3D7MmTQdEzhiv
 xeTMveOHqgCoDUDKwFYMvr5bVZdmCU2Xvd05ea75cOxmXIXotgS4cQOypHYWXbxZUoAeUdkACLm
 3K955YwsprXhMcWIU9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEwMiBTYWx0ZWRfXww0ZkhyaTfn4
 PB7DE3/xVJp+IV6aNvxeqHIDzQA2z/fCp29CVCeAwksGy17dbOV3oDHmxelWrn1O/jX3uF+fB6F
 wMi3Zqin72W0EEk0/pt3EeyIa3mHJ4w=
X-Proofpoint-GUID: w0wAmK-EAHoOzVE7WS8c1_7RsyN9pGZl
X-Proofpoint-ORIG-GUID: w0wAmK-EAHoOzVE7WS8c1_7RsyN9pGZl
X-Authority-Analysis: v=2.4 cv=d4nFDxjE c=1 sm=1 tr=0 ts=6a956a84 cx=c_pps
 a=GFF/Av3140jeC91+tyO9Ig==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=tnaTcVjs3Zv_HDtWNsIA:9
X-Proofpoint-Spam-Reason: safe

Now the core has a helper to signal a device will detach from
the SoundWire bus, there is no need for the cs42l43 driver code
to separately track that. Switch to using the new core helper.

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

