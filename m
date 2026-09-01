Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19870369D4A;
	Tue,  1 Sep 2026 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275680; cv=fail; b=Xl8euppl3GWlK4o7uhcJf8NSCfvJ7ytLpRDwTTancfLvkAPUn2omfZHSxvQixdqzO02k1OLdKNy4NkGtNwWLMJ9YLuoUpNCNFKxQNynLTUgfZTTSi7E/ThP9tsRqBQfyjxYUIT/cfOAM4Msu1B4XnNo8bGS4glH+TKmdD7ZkBQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275680; c=relaxed/simple;
	bh=wBgvTlCX1DLD9GPTJORtNHe/zyWcPMd7NqUfXOn+VCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nVH7ctwTSonooZzPVMyBbrqUEBaNUp2Slcw7MIwMVyUO50iDzfeyaNS6sdbQ68sv0K6oj6s0sSCWV0ydJQJPK5aSCCdYgiAKwpAyyHMzeCZVQWjXSADnMLfkA2FNbpLZN9dBu+H1Z+12JPRmGdAn9DEF2lguSJApx5hFkSDG7EE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dPbRu163; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kgkApQil; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dPbRu163";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kgkApQil"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681EMwvH3139842;
	Tue, 1 Sep 2026 10:14:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Sreze9H44TEOyR9G
	sYjvynBflNdbPv+yIpy5+gX9Rdo=; b=dPbRu163ciJDBUsIGKenoXulmETWuEo+
	GV66YuOqD0Geq5zzYkgTMokatYac5X6G0IIZf5RWhfg6800sgxK4t1kHG1B85JfO
	iuixrDn20Qdk+ZdM/RRrWuCauv/BihpM/DkWMHl7ND5XY6aFJRLVidneuLxOzMfa
	iALP2xXlYalGVcEoGDPRSLahceiKDcZSikiQy3xoGQGLugwxVNjZyJTXOfDNvwj3
	w1ErzcdMQfiSyw1jLW6LbnVmExhwhlzeOGwa1aFFUX93zVYuhyMsSDQiB5CZeUm3
	vor44Dgz4v99/yw4KLjF9c0clUkhjgW2XTPi6EvSJ9+JgExl1mjtvg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023091.outbound.protection.outlook.com [40.93.196.91])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gduntgh1e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 10:14:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9kpDFH0EVxWKJaNqjS+fzIRCdpyn2wvdyPQ9tTqZhIf1ZGH9kaZNosPobLVYjScf2du6QzpTwml2BYq01yr0C/A3HQGc6EB59RooJLD9oa56Yt+wsRJfunkOv750bcxvwrjY9Gu2fAglhUt6zQ1xtqGpTRiKh+ouBms2HbOo32jAgb3kjAbSbbl+weIxBg6JZFfCSICczGgkyE5AKL3NEhJWsSFRBroiDpFNePb+ficyhXRjvV3KvDnGmERsGkg0ea7Wl6SWDsjs2+55xhk2+IeO3M0OXCeaOLxVZq+uO9svQHn5HCubpp+vcKimzdvWyjE9t00eI6sFPuYHdxBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sreze9H44TEOyR9GsYjvynBflNdbPv+yIpy5+gX9Rdo=;
 b=tNcq3ucTo/OO/vSlRL0dCbh3qZAY8CFxjK/WhGCfRcJ5c9857j/c7Q7KFKsVJl5csFMkQQUFBUgVBsBno8Bm8FCYVQG6OmCRFiAR3KB4HgItgn8ZnOZ1FzTkXKPDkYpc8eskhnVWlBmIgg1Dy8xrzi9wv/I4VzQqS/YUKsTxftqHaUUbc1oCmBNUDTvtV9grDUPDx8DbqQ3yEFoff883xiD8lSAy8vm+PU6ln/1PIAuetF2bTUigH2gq6oW1SuW/UD783FaPPgnvBpAaPteIV0XuidahbBuBF7gEDD2VOu6tjuClaZTipJTHC2+GSTAjolunA5Wm0HneE9tVRblczA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sreze9H44TEOyR9GsYjvynBflNdbPv+yIpy5+gX9Rdo=;
 b=kgkApQil5L7hsulyLsRCODq8DQg6Qpz6jH+8lUx7TL0o2v1+jlGxljkozewQhOqNBg7KNNb1aUErnWHz3q+T8LFh1yi+9utiN5EziebBuaheQnK4rKnQ+1D6nHLarQWHmUUutXeTrzxweNFSC8/onx+bDAqYdPG9AN08yi4gTD4=
Received: from MN0PR04CA0024.namprd04.prod.outlook.com (2603:10b6:208:52d::14)
 by DM4PR19MB7287.namprd19.prod.outlook.com (2603:10b6:8:108::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 15:14:25 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::73) by MN0PR04CA0024.outlook.office365.com
 (2603:10b6:208:52d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 15:14:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Tue, 1 Sep 2026 15:14:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4E2C9406545;
	Tue,  1 Sep 2026 15:14:21 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 40CCC820247;
	Tue,  1 Sep 2026 15:14:21 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] mfd: cs42l43: Add support for new cs42l44 variant
Date: Tue,  1 Sep 2026 16:14:17 +0100
Message-ID: <20260901151417.2546618-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|DM4PR19MB7287:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 91cb6258-d580-4bcf-f6a3-08df083bb3e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|23010399003|82310400026|34020700016|10067099003|11063799006|56012099006|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	NBLTreFm9CYyZWLZKmasa3eHhjAkhlnAd6HRZkBYpxBD6azjh8G9hfdlsmJeaykWjhY5BOwsute2iL4NhOSkGFUTUQELXgCIgvIE0kEniHSYNs703gk+CSNYjxdiJwfrtNF3EvZDrQsg74tTyBocteLl5wgl6E9wQ+p85+0p9nOOz2bkiTs/lLm4s/nH1Dm0uuMJ6mKqn8grd31q3BRxQWk4pagmmUGiiKd6b0K9ueSC98VbBcv/Z2uqLVnYR4y2l+05n0CgIFkBftlwFEhkspGympybwoxjIPGwiVmeo/CxMgVNsuXjxJp8scBa78SDhq7tm3+wSvN41AixCTNnUvmHWGZUmd0YLE4/P8rf/uf0ZmUDT+Tgk4HHolK8+CnLSTj2CGcszkeP5BJyLXifT9wCfYSsOuxeoT/+j6xCwBIyAUA5402eIgvjDn+ulbeyVYMB+dp8OhPAktrdEMdnRc72y2qbtMS8ZAQgC4tUbcu4G+U2XiZTIkinRrzrWTm6A7XWJsbjgZKnIEtOy8upmgAnmWVLKnE3MZ96vUK84C7Ws5bV8y3odE4NG3LVhQ06prVnS0LpSgHIXduX0mfQgkfKAZgiAMeYpmlc3spNJG8+BQvlGwFs5DkQtp83dYw/ABSMXCQytaWxOgX7EUbmSXeqFf/ddmt0lgWnVvt+Ckp/B8GIA0rtxaV8FrUMPsHL
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(23010399003)(82310400026)(34020700016)(10067099003)(11063799006)(56012099006)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GkZ1T+GePk6oSDoZtP3fBv7aG7yyX9AiEyul26uxBGHkVb6CdBZb7pb2G+VPQplfgfw0Ebn55B7b6tiSCQN8LIDRM0i1Rc4AjxHo8XWw+WkW55KMAiSIg59Kp8+IjCXVcp7BNxQuQidwDFpVr8n99wi/jVd0XoUxgAiHc6ihlzMqTktiNWSzCSNdd7qQB4SQICA9AlhAlXJJfxdbmjGtcDTeDmAzfZ/Pp7OVojtLYSEPKzKCU6AW5On1JSs5a8eVciUayAMtpSlkCVq1RsrDxDGLdBu7B8Pa7MtiYUoE2HML3prbPJP1Aj+zO/A3UsQNp4cckZqwh+x/uLIPBTpTGPt3Ua9UTXB6FkkIAAOKS2MzMq5Cj2rr55yzB4febhqYKPYhcQRKqR0e/GEAk239s2xbW3kjyGJDFDWNcZ92UuLNjG3EnA266YHh5X7k8r6M
X-Exchange-RoutingPolicyChecked:
	o6YRwjRh8X0wVt6vjg8Qh/eq5wLIdRyYPOE0jwsQxY3grY8/irhLJhkaZGd2y5gIeuyKiLehqSEmQGajMg/Z/HnTJwCWBOnkqYU6YQS0dptdvmhlNz40NoheyhtAzJhEzHM3nMQ6N6brTAFNO3n4Y3tl4ENPY6dKF/Et4hnhxaXSiVoTK0aOSoHFBo6lKIa4wefmj1VxcnzRBHRMa488okkkNDvAbNWwuScigBsMWOQod+d3sIKfdbjqY7CXn94S/7tVQ4/+l2F86jwK3iMocC6TrGIoDP4QkBQjL5dO93aRelW2XuwbwRqJ4Y8yhk38V6GwcOopOH1BEA/xcmOlLQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 15:14:22.1800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91cb6258-d580-4bcf-f6a3-08df083bb3e0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB7287
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzNSBTYWx0ZWRfX8z6aE5mXYZ20
 Z7TKRzsHtcM6ikKTnpZBtpmm25FEl0ec/2OKwWSc7QCY1VXRghEmkbAdEwKqZHYE4i6TTgD69rO
 2iIcv4KvGObSADGp2q9HQydze4BHQgW4nhdRXRIojN2gzjQNzId7T/ENJLsK9tx6Fr2+LTt25dt
 J/ctzxGT2zB2+EoPobDwz6frEukpWNqab2djmDjyBTfnRofAI22xWgaDFNvR6JmN1k9N4izVshn
 9ZumRjl35Szt77V4bWGe0Qlft7pEs7/O+Tvv0Gma8MoOeTFGFZMUm7+UU+11xzkOD+FcDmQxxfr
 tA5wMklBfZWSTVLqaNgeQHX6xTpgLvKN8psbRfqpx2yGmwIAsx0GD42BmVNIE40YubKvdi/Cxem
 V5V8TSA4BVWYreNvtKLvncHFCzfs1R9YyPvf7/dJGkQUrMst5nIQhJ/mIDS6JnXZcjBmrxDPddY
 dVmG/KvcJwIZvHHVJ/w==
X-Authority-Analysis: v=2.4 cv=X4Zi7mTe c=1 sm=1 tr=0 ts=6a96ebdb cx=c_pps
 a=H2sYsg3hgj+L3aiWSAFbmg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=9-cLgooicdUm-9VPlSsA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzNSBTYWx0ZWRfX9+b+TWuqqJ84
 McTP1kJM0GjgvLKO+7aRfHCKcqprzkw3+IT/kzkoKOxnpAJEjhnaurHhJWETmNbWDDVErp5r1Ml
 RB+nmjDYm6DgPfuejyaTGKFPpKbZbKQ=
X-Proofpoint-ORIG-GUID: vzH_r_l39LsxoixPRzvVonV_e-byEAar
X-Proofpoint-GUID: vzH_r_l39LsxoixPRzvVonV_e-byEAar
X-Proofpoint-Spam-Reason: safe

The cs42l44 is a cost optimised variant of cs42l43b. Add basic support
for this new device.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Rebased since v1 to no longer rely on Uwe's series.

 drivers/mfd/cs42l43-i2c.c        |  2 ++
 drivers/mfd/cs42l43-sdw.c        |  1 +
 drivers/mfd/cs42l43.c            | 18 ++++++++++++------
 include/linux/mfd/cs42l43-regs.h |  1 +
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index 4db452b41220d..0a0c34d5982e4 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -59,6 +59,7 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)
 static const struct of_device_id cs42l43_of_match[] = {
 	{ .compatible = "cirrus,cs42l43", .data = (void *)CS42L43_DEVID_VAL },
 	{ .compatible = "cirrus,cs42l43b", .data = (void *)CS42L43B_DEVID_VAL },
+	{ .compatible = "cirrus,cs42l44", .data = (void *)CS42L43B_DEVID_VAL },
 	{}
 };
 MODULE_DEVICE_TABLE(of, cs42l43_of_match);
@@ -68,6 +69,7 @@ MODULE_DEVICE_TABLE(of, cs42l43_of_match);
 static const struct acpi_device_id cs42l43_acpi_match[] = {
 	{ "CSC4243", CS42L43_DEVID_VAL },
 	{ "CSC2A3B", CS42L43B_DEVID_VAL },
+	{ "CSC4244", CS42L43B_DEVID_VAL },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, cs42l43_acpi_match);
diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 6ccfdcd3f6698..81dd19df53685 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -184,6 +184,7 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
 static const struct sdw_device_id cs42l43_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x01FA, 0x4243, (void *)CS42L43_DEVID_VAL),
 	SDW_SLAVE_ENTRY(0x01FA, 0x2A3B, (void *)CS42L43B_DEVID_VAL),
+	SDW_SLAVE_ENTRY(0x01FA, 0x4244, (void *)CS42L43B_DEVID_VAL),
 	{ }
 };
 MODULE_DEVICE_TABLE(sdw, cs42l43_sdw_id);
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 4212ebcca60b5..592677e1db41a 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -959,6 +959,7 @@ static void cs42l43_boot_work(struct work_struct *work)
 {
 	struct cs42l43 *cs42l43 = container_of(work, struct cs42l43, boot_work);
 	unsigned int devid, revid, otp;
+	bool valid_id;
 	int ret;
 
 	ret = cs42l43_wait_for_attach(cs42l43);
@@ -973,19 +974,24 @@ static void cs42l43_boot_work(struct work_struct *work)
 
 	switch (devid) {
 	case CS42L43_DEVID_VAL:
+		valid_id = (cs42l43->variant_id == CS42L43_DEVID_VAL);
+		break;
 	case CS42L43B_DEVID_VAL:
-		if (devid != cs42l43->variant_id) {
-			dev_err(cs42l43->dev,
-				"Device ID (0x%06x) does not match variant ID (0x%06lx)\n",
-				devid, cs42l43->variant_id);
-			goto err;
-		}
+	case CS42L44_DEVID_VAL:
+		valid_id = (cs42l43->variant_id == CS42L43B_DEVID_VAL);
 		break;
 	default:
 		dev_err(cs42l43->dev, "Unrecognised devid: 0x%06x\n", devid);
 		goto err;
 	}
 
+	if (!valid_id) {
+		dev_err(cs42l43->dev,
+			"Device ID (0x%06x) does not match variant ID (0x%06lx)\n",
+			devid, cs42l43->variant_id);
+		goto err;
+	}
+
 	ret = regmap_read(cs42l43->regmap, CS42L43_REVID, &revid);
 	if (ret) {
 		dev_err(cs42l43->dev, "Failed to read rev: %d\n", ret);
diff --git a/include/linux/mfd/cs42l43-regs.h b/include/linux/mfd/cs42l43-regs.h
index 68831f113589d..4c00ceae8b461 100644
--- a/include/linux/mfd/cs42l43-regs.h
+++ b/include/linux/mfd/cs42l43-regs.h
@@ -1183,6 +1183,7 @@
 
 /* CS42L43B VARIANT REGISTERS */
 #define CS42L43B_DEVID_VAL					0x0042A43B
+#define CS42L44_DEVID_VAL					0x00042A44
 
 #define CS42L43B_DECIM_VOL_CTRL_CH1_CH2				0x00008280
 #define CS42L43B_DECIM_VOL_CTRL_CH3_CH4				0x00008284
-- 
2.47.3

