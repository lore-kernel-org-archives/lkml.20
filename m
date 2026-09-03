Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11023094.outbound.protection.outlook.com [40.107.201.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BFF377ABE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419883; cv=fail; b=PcLOWW0tjQThL9oyTrIdC7/NP3HkPvGEJAyLRZJXUHY3pwGo+jyZbmBw4v1EU6bnejvWSLKA/jMw4RIe3K4COmQnOkPuKl7Olpv/WrUsFyCGvQK/k++gt9edy0wmTxCoHnD3kCpYR4/4U0X0ar3UWEEwvzuAq5UnAugfUIAwoXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419883; c=relaxed/simple;
	bh=h0wYSWvddcu4FNKJ320iJd0b9+OJUUSc7Tcq3SM6xxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wi/DuL5D75QcpS4WCdo1gm0BvpcfX9q31fhVG3tUrdvwmz+RnprXVwznHlHMJkSuZVOhHG/qrWiqBpln+daKk34KMv1ngc7sIHT7QyJg03DaTNB4VdKhjhOBRpKdh4qukB9nS4vBTIIwlfrPBwdnxadIWzJk0AczKTzhhkrwXgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=BQ4uFsCp; arc=fail smtp.client-ip=40.107.201.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="BQ4uFsCp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGd8GvZQMNdfrjXJ7yuG3y3cPt3rTORrfncqq3J54I8IvGwk49tCOXlbw8C58+2MOeRe+PR8scABRANLvpU0LmRwq0q49Fv8YNGmggQ4HxFclzNxg1xhem28tgH+CZnRzQR5aQ3bmbL9KsKXMLW9FkkIkvVBjxyer9v/HIaByy4FWCiliJ30bJ/BkuC8EkUr7nc4GQLZIhP1uBXHwaFgNdKpy9i8FQud+OeI7/aEKPFPpvWybP8UzUYosGDGNEohxZHZeZnzf4PwcJbBd30K6Zn4V/fNNrb3z9KhvMViQ2uBAx+iW2PO4QumfK0lALYEvag3JmzirChHrxZz9n/1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saWtowz75iMq1iloAGWs25I6/Q0gn305bOnDwYHi4MI=;
 b=uoAKnoqffveUW3pQWUrhgIj6j68ehMWsSY4BeH+aZGrr2yuoQjnNV9ju8IAI/CCowNizoaudxcWPur51h/v3EuT4QW4HDQ7Ecl+/TqGv8M+z7lqD1mkm6MF+vnA3Ks1sJn/34PKGrGSniAIn9mr9rdcUkZ5iu6BIW8d0nhTk1arL3nYie9f2RxlA72cVganLJpok1OMDWvCz5NvYA2hxJ8uyQWB0G9ADRiZ4Byo9MhgKQ8uywMguZeCucfYojoqUKsyacc/4HNzx16R37Ba+/Dlpcssy4K1LeVc8vk9ntN47UfKMNR114SexJ0iDZW2cXxFVQeEzGABArBJoJDrokA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saWtowz75iMq1iloAGWs25I6/Q0gn305bOnDwYHi4MI=;
 b=BQ4uFsCpaJ6K+H6excS20lk7+BQUrHgnUIHXZQX6J3QVOLh3p4N0XLWsBr+Ng0/fxztTIfuCGj5byCn5pnn0wyg0hVP5X1aiXv7oZftHZdOsgpyTaV8XM1Y3wr9g60IzhTxwlRcONH4XSN5ZroN4wtIUWHbDS1Bwpxx5zgLKwrrhVrAS2r36FAo2TdAqMTGb5pK/kzTIP5BtubXmL1qsjR8zuyYQWaPQd5HoyGkwTIoIL2Xy/YArmYb0lle11nUhoAlQvozAilehecM/8+IxXFJaEDar730V7UAJu5q0tGI0nvql4Dk2PhkV5z6mLf5RLKFpmYbEzhZvzTVhJfxNpw==
Received: from BN1PR12CA0008.namprd12.prod.outlook.com (2603:10b6:408:e1::13)
 by CO1PR18MB4795.namprd18.prod.outlook.com (2603:10b6:303:ee::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:17:55 +0000
Received: from LV8PEPF00000065.namprd03.prod.outlook.com
 (2603:10b6:408:e1:cafe::2c) by BN1PR12CA0008.outlook.office365.com
 (2603:10b6:408:e1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 07:17:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 LV8PEPF00000065.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 07:17:54 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id C59FF40BFE05;
	Thu,  3 Sep 2026 00:17:53 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Thu, 03 Sep 2026 00:17:53 -0700
Subject: [PATCH 2/2] mailbox: axiado: fix debugfs name truncation warning
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-axiado-mailbox-fixes-v1-v1-2-f44cba251254@axiado.com>
References: <20260903-axiado-mailbox-fixes-v1-v1-0-f44cba251254@axiado.com>
In-Reply-To: <20260903-axiado-mailbox-fixes-v1-v1-0-f44cba251254@axiado.com>
To: Krishnakumar Kesavan <kkesavan@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, Swark Yang <syang@axiado.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535; i=syang@axiado.com;
 h=from:subject:message-id; bh=h0wYSWvddcu4FNKJ320iJd0b9+OJUUSc7Tcq3SM6xxk=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhqyZ8oqiF8IuOm+KD2hl33Oox3z+AcfMU5dmWG52KZF+5
 GKaWHG8o5SFQYyDQVZMkeWrzrf8k7na9zr3riyFmcPKBDKEgYtTACZy+xIjw+zYj5ERb5Or5sbx
 MvJJTstLUpp7/Z7FXZW/x9ZumxVXkMbI8GLTI8arrb67Hy5JYzsuPsUpMunnNJO+7VN5zNMWnr8
 5jwcA
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000065:EE_|CO1PR18MB4795:EE_
X-MS-Office365-Filtering-Correlation-Id: 633e6788-7e2d-4346-a482-08df098b791c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|18002099003|22082099003|3023799007|56012099006|13003099007|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	yI+x5aRgmYXBjHIhF1qgrtzqmwcj5CDgbsZT7rqPviWe8wm6vDlLu1anGT3Zht+Ok0lSMmaom7asNbd1JOjv2RixZGHDo47TxSMW2ZssyZtsM0TPwHzEAgESG+8tvrIPOvK/eWwJZdKglCM2OIzuK2UpBGAeFm8cBnK68d3UXgNlrq0qaifhsivnA+cXNsN9JmtXcS8S/dRbdLUTyds73CIClfRUUWj4oasBTEyMW9rVJFsz/YM8m25YBKngu/oCKfbtVJaqoGpzlQtZMfrgeHxBjiYJX5+S3d5yYknLxspTxl1YXiu59RWouYFYf8+Iqb0rkvHLWnOnuzqM4SKj7hXO5oAcT/p5/wl6TKMAItBuMHijbMS904pb6yskkEZ5LW0K+FAjiHySzmj/ZKE+LT4g9/ePr0MnJ0OUFtIenLfggQCz5qxOyEYhDpbZJ7DuwzDp5RXvoDaeNyqGgB4LnamCv3CfQZVTrzOtYPsgf1RzzU7oVKjLg/hjreojnqueHiWn+GJX0WjzjkyLnL/qPcmTLCTfRw5KcomuDUwNCH5j6BEorLZn2CCMG1nBIfkkGElNGsOvqMti5iQqXZwK8sheDU52frUGcfGLneToH6GzJ4y7vOt2orH5j3SoEI32nBiFC17azC68BUjjoQgWq5Jl/ZHMDxXCv9qSaWbZ5VytxTB9LXvaBMUWeaRl4Q+fIRjTp16r3rwAKvBWJAPEqg==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(3023799007)(56012099006)(13003099007)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0x7Vq2Ou2s9uatxB/yoy7TCJIKScKHtaWRFW2vBSF+jDFuw0CkK+kKsEk/C7xiGyeaJcXeqGLx7K7Gnw7GUHml/wzAZ+5ZvfGXCvXIWaUiIRAElSVyqEI1btm2bv9AD+AdwBT2yeg5AgIhvwxYtA2/26dJ6i62FWWTsgxJ6XFLNCvC7oJnt98tFYDrLbtFmeTR1ddngujGYsWcbaLazDfiVg/hLJSBFiLEV+1YlgwRjaAHXJaGEUiJVLWYpsrkAKQNkucHAa6ld5ACW15ZDcM6b7L/fFTatHo7J1mLhOLNnfNiMRPev/Kbbq6DjC84zY+bQ36vZDoIJGzkkcIYwpYkjD16f7w3j20+pKyaHke6k7E2kHtoFe+WcS8Z0f5tftQdslEnyqOyzaaCMp0WiM8J+sr0y1rZL3fMlbpxmqcXLN0Yl3UaBfzvY2HKbiWb+Z
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:17:54.5247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 633e6788-7e2d-4346-a482-08df098b791c
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF00000065.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR18MB4795

kernel test robot reported a format-truncation warning for the
snprintf() that builds each channel's debugfs entry name:

  drivers/mailbox/axiado-mailbox.c:325:39: warning: '-errors'
  directive output may be truncated writing 7 bytes into a region
  of size between 2 and 11 [-Wformat-truncation=]

AX3005 exposes 16 mailbox channels, so the longest name generated at
runtime is "chan15-errors" and already fits in the original buffer.
However, the compiler cannot infer that bound from
drv_data->num_chans and therefore assumes the unsigned channel index
may require up to 10 decimal digits. Widen the buffer to 32 bytes,
which removes the -Wformat-truncation warning with no functional
change.

Fixes: 14af7a96afa3 ("mailbox: add Axiado AX3005 mailbox driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608250447.gGkRwNAl-lkp@intel.com/
Signed-off-by: Swark Yang <syang@axiado.com>
---
 drivers/mailbox/axiado-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/axiado-mailbox.c b/drivers/mailbox/axiado-mailbox.c
index aa1dcc1b267d..a87693c639dc 100644
--- a/drivers/mailbox/axiado-mailbox.c
+++ b/drivers/mailbox/axiado-mailbox.c
@@ -379,7 +379,7 @@ static int axiado_mbox_probe(struct platform_device *pdev)
 		return ret;
 
 	for (i = 0; i < drv_data->num_chans; i++) {
-		char name[16];
+		char name[32];
 
 		ch_data[i].channel_num = i;
 		ch_data[i].chan = &mb->mbox.chans[i];

-- 
2.34.1

