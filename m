Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A5448821D;
	Mon, 31 Aug 2026 14:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184939; cv=fail; b=j5HJVT+Zdc/xW6buww6CVLNb/qW1jb0NJBYYkY0Xr3nDg8z310apm51T2GuMVmysjuCRZ5YuVWcBFWuqxBm04agAncFrbQivOF40EVi2wSjLxoPNmXXYTWFe1njm7YzIgD7cTR5HZKyKwhPzmFozr/w8PoCdMCczifZM8Slod1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184939; c=relaxed/simple;
	bh=zVVoC+G8C8GGTV8e7v5tyHfeWPW7fKN6FF5n7jaMwfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Du73UNxqcWkie++qI7uhGQi5C2MQgx+0W/i6iY7g3ufBWExC9uCG6ywnB6eaVkBfhQtH8uzrSmUt9wzPFpPd0+L3LGE6NIFAWEl/fd6ogWVvR3t6vVei/LtwUBq5wO7vXHJqM/gMfr2cmE9lWakBeurgLmeDLdQwxRwBDGZU5QI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NwPA5F/Y; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XKtWwgTJ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NwPA5F/Y";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XKtWwgTJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V5UreI1521523;
	Mon, 31 Aug 2026 09:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Oyxe53Mv+Bf6mz5UNQBYjO9PxzTH7I96fLXSyvHjTgk=; b=
	NwPA5F/YIX1qBnXpjZzbLiVRzeLNh/irE9w/BDNsS4/zRINrNCCtqVvUR/tuUBTY
	mViouiwSuxl7nRO56ut9eWRjtT2R4UZZ5KqeFl5redAhPHjwrZt/BEeRm+uAzMtn
	fbohkuKUG8zAoVEjdNFATtgN0H9AWcCYGqd1xgflQQLrnnGlXoDoHGQRImB+TQqL
	wvlrfxg6DyTptrRDsIv/QRNCwzri1oj/M0pZEcM2dgu1czZdRwTBLCp98OtmrCnA
	be5ZSzj69OVD/0F2Rv4F9IFxYVCLD3hsrQJYujP67TV+t0sBuVFbpXcVsN5UCro3
	gyiZ8z+l9HzXQpbu35ta6A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023115.outbound.protection.outlook.com [40.93.201.115])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gbvtyt6a4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 09:02:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eT9l//s3ayAux4HsOd68d7Sn8v6yf2I5662ialBXBhUmDcF2Sh9QGYeQoA4/HctkDyABrpRNvr0cW8Ovr1naWWNea7GWMOUqQBxxyCEhKBKbW+GyefQGPZ0Se7tih3H/3QTLI8AJoaWHa/6iEUKlp3fynYLVPeuKk/QCgAUGKXcnYTbsZ7oMxnDR4Hzfq/anQUQm0DbaivScjXgUU6FIpd70I7qYKPksGzlUBo255UUj7fO01unxa7SpfBoeFEnm6whxHwbWRxEyuxLUKBBSHUrL9IK1kq/In3n/ZerdWiWSYPICishnCpgvp648k9EscuwGUjpKMyrnktB0ldeWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oyxe53Mv+Bf6mz5UNQBYjO9PxzTH7I96fLXSyvHjTgk=;
 b=TAvZ/ynmOoOiZgmyGMHJNosFoHU3NOImabSWL0NDckQPATxWlDxdJyvIcwZhQp6gRau/Jhxuhm5DGhQlTAHr1UAJnUPqASMDoy2w4XDqhgp4JuIhSgz3lEaTHIWXM958whSbQXpU4Q8/bWTDQvcQ1h7F5PdvK8vHcAP8dFuivVl43w6XrODyIZCmCKCWyGI3QGu1ZBE22YoKmn0oPBrXCu0WcG+wfJk+KkVvWTD1kqnzlg6bjULyKxjWaO0zkfSAH1+I5HIY2aLifA43vldD4NZzZGNHuN8qKV6ZPAMG1vpSSRez1A5ikWzQP0nwXgX8zokouomq3fr3fST61ad+qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oyxe53Mv+Bf6mz5UNQBYjO9PxzTH7I96fLXSyvHjTgk=;
 b=XKtWwgTJIiG57qrD8HKEfzuupDKxt7niW5l6Qd5FB/UlZ4zPEaLPPp7FwMtWsvhF70MikqjRVgcYAesnUlpo1Oi5z0QLrC0coE3Vl6QjoRVFcPO9b+dtZw9eVzYwzJOF/y15mEdyvYU7w9T3e/QNJvw9tMWm5Uve8NXpNA/YpNg=
Received: from BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::17)
 by DS7PR19MB5757.namprd19.prod.outlook.com (2603:10b6:8:74::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Mon, 31 Aug 2026 14:02:04 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::9f) by BY1P220CA0013.outlook.office365.com
 (2603:10b6:a03:59d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 14:02:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Mon, 31 Aug 2026 14:02:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E4D0A40654B;
	Mon, 31 Aug 2026 14:02:00 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D1249820273;
	Mon, 31 Aug 2026 14:02:00 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mfd: cs42l43: Move to core detach helper
Date: Mon, 31 Aug 2026 15:01:57 +0100
Message-ID: <20260831140157.1736905-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831140157.1736905-1-ckeepax@opensource.cirrus.com>
References: <20260831140157.1736905-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|DS7PR19MB5757:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 15d4ad51-dd0a-4f10-a6e9-08df07686ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700016|34020700016|23010399003|10067099003|56012099006|11063799006|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	SFP9jZAzwyOWVOctXOqh9z8hY0mIpQWgoSha8m/xHcSWrQrNUavb4KI+eYqjttUmCJTdFoiWDMMdHeRADkJIJiMYcigKENzxu90bKPF0FEg4ObKubiwe1Cmd5/sEt2MNJqIE6JgOPZwrIYnp18KKlvXjz9VqA2gjbxp/Hi0ajrsz0gK6pEG1e6mxAaMvzsTwYpFmmmv9Pma2Cw38fFjL+WnLXwA3ylC0wXqywfbWwBgaAFqQ4ZpX21vSdtst4wV4sy6X/XDaLqyCYwab9kmPky94qh6AFVc9+s7K6wSKfHN7Bp+V+c5LB+KLtZgp7XD4bIB3PE7vT2l2MtDUvWDGJrMijXsdd+qzzU/H6VYXttjeCSl5W76GKMG0dhBx07Q2DxlkrylGSvL4E1tp1zjcWyxq6zRrRL/AUesZ1MeTOXdw6/C9AP92hUkmvb5t1JuLAgZvmgCXm1PZYFgQ2eDeQPeAIDnN4HAAfMx5YfheGMNbiPRyCT8KA+B2XDUvpVNY17xAPQXXwX06HErWO+8vwIZ82oPCFTlFclzGWrbFc/QGBXyZk/wEOSRwNkDmqd+WhMQn6ekymyFf11GK0aMLIBfOZmB8J+IOCpo8rvakiouyidFEaQCYDKQiUEHFrumV3i4wnh3oFehjS7JZHdS5bmLFanpswVIaBMTM/r4qIkAsig9Tw96B0i506cvI3qt9XGACWcQs5Lt3S1qHv7aFCg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700016)(34020700016)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IIE4OmjXzMJzoguXur7oDv35vEuSLSoSvULBNa/a3TY7o7KeBbFw2mBcLFc/mRZuavoxopn3xSE03jkCW2e96bdok9EvSJkiSamy6Sdd1NXhOD8FfFFoekzNbPw2+sC8NfiE+jLdzBJrhBK3iNSsDeYM0G6tQ78uD85SErCivSH8xxlbh57sU1SjX0gvO5AwIp+Oi+h9knxuhO3WUOygistaDb4Crf8ETtYDf7c00BiyYbdBDM0iMa+Auz6evdbqB1ZhYlRnfdQEhj9qPt9ougHOgPSNGEFjobapT29IyGawGkW2+XjY/unvNyze3bofq7A/stMevZ4vMi7GN91iyFr39B5FBQ944S42TyUvVc597Wv7/ZMwI203iHlBC1TIP7xTEkaVKyW/JuWTKDzP2MydGHu8tYnnpczJJVxkS5gvkV/0FBbw+TQbtDone0Fs
X-Exchange-RoutingPolicyChecked:
	uo/VSzJumePFPq7PpmY5Js/XAfC7xUsi89gHjuNo1TLWpZ5VyN7fFXqpgMB8ZOXuei4Etz46UZgX1L+Iotu3N+vqbXPdyy7JMWwOq1fXdavsNft1qfM49X/gfbFYVfIIQi6f8bYS3mMowy0X7fP3SOxbpFtSIk543NPpcmB3rC1RQZGQaX4Vcozg4muaOtJ/t1DkabF70rzwfrFgm/j8ZVSnXB5tyeIxOJLsLjUOGc6tiLeOEN8WHutNUiXntpPW58cnfAf8odoxJltwIWZFsnXa+8qkTgdMXTYnb1lkVWg7jcVN6mBQweDzpDe2cI3KyWhVt0nVyer97KO+FNzKiA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 14:02:02.3574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d4ad51-dd0a-4f10-a6e9-08df07686ecc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB5757
X-Proofpoint-GUID: VR6J4_6iLvCPbc1hhbzf2TwzgzMKkv2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyMSBTYWx0ZWRfX1tgwhIKyQMyF
 3R7p+3suOBM+WCkQb50M9YW3uwN8AbBCOqt0uJm+0QhazbcktAPRDpg3tY4lxhEHxkgK6122Ptu
 iZsXjoUCfOnD2am6R7Nv6rlZIt5cpE1IOV0E42qqCg4b1PtV19RV/fkvMauMi+SYGp/gEvl9T7L
 V9BpMGKqnQqImICoHc2Gxc2eDsAn/vvg5/kya+sSx4WX07k4+zPclSIY1VVUTWcYQI/08ck9+BV
 +77K3egBSWMnSPkJlZBAjZpFsFCwAo4/tIdu5uZq7PjnQb2ZHlBSeZHZo92Y0+7Kf8nHCwIJmXU
 OCvF/8HBuUKvIV8iAQOK9WPfVxkZHmBHlF0k+ML7pgcsfABEOp4uBaaNFv5epDkUTZMGeI1hZjz
 7WXGfG34D24ABdwt1t9J9VQjs9Bo33ffkaRatJ5CM0AYAJxEOrUzBdZWqH9BawL+Nnj1PwyJ/R+
 T8QVeQSZKi+5SIgsWFQ==
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a958965 cx=c_pps
 a=y6Sm6l44Xb9uyrH0UefkHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=tnaTcVjs3Zv_HDtWNsIA:9
X-Proofpoint-ORIG-GUID: VR6J4_6iLvCPbc1hhbzf2TwzgzMKkv2g
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyMSBTYWx0ZWRfXxTWVnt8fEeqC
 8gT4nnpViB6i3Kcz9J0kaw57pqLr7GH5b0lDV6GvDSxVKKJD4UVjV2ReH2sM2YVsrxLDvT5kUuV
 SJLdsMsrdpM+Gx9P3DM5DTmb34DWMNA=
X-Proofpoint-Spam-Reason: safe

Now the core has a helper to signal a device will detach from
the SoundWire bus, there is no need for the cs42l43 driver code
to separately track that. Switch to using the new core helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

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

