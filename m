Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED94D30E821;
	Fri,  4 Sep 2026 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527585; cv=fail; b=QvbrkExNDskSKhu7UeIvA/1XaL3gSN1UNTVLlVOJ/1IRBko8NhyxxUy314VZBsaKB2q954q1zyibOPt1nmwKbcsdti/bKBvkdZFL+Foe/h83IvXeRzIwdEwNzByH7V6XTxWdYhEishVnflu5Nqi+bha2eqJ7ZEy7CynHo6jeQm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527585; c=relaxed/simple;
	bh=Zblx86E60oM/SUAHfxvZesyARpJJhMMM+YpO0+5UsAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P8Ntdo6I3dxu9Tln5a1dl0pFICSIpq74J5ojw0uaUrvkUXZuCNGkA92szddfe5xF047tSI+ev4+1E3aPDCVgbI+2xnHvAuxwv+Sio8AduVmngMHTqnqCpTvXX8YN9e6l+I0nsxrcAubtbhMNYffg678NOEQOzzjeAHo5KmRVoTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oeklMF8Y; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=eTpS+S0x; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oeklMF8Y";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="eTpS+S0x"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6843rsWe1033727;
	Fri, 4 Sep 2026 08:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=h4gRr4ZQ5uvhKq3n
	Fl0l7Swu/+BIuJK6Fkv6zV/ctpU=; b=oeklMF8YoVmXMziNnLmGEfB9DlbUEP52
	BV1mhJnD6xALmMsMqaUC/UHS5o1rztBhov/MOh4olX8HyzPNKFwv0T8Kbq0xG06k
	fx/2EOxqOtXvs7sCPR66koH8vjpOc41Yz9QT6Ll6eboTEqNCUvVXh+Y8opax3yJu
	wtjy64p/b3oHATqJTTXCl0TDJ41crPBy27QwS1/Zmcr8Wp9cSYIUIxMKgiMWgrqu
	wW1JITYfek2T0wA+egMZj6uorS8aMtd8q7Q2zV+hNPbBXR8bzdFbP6o5LUOH2sSj
	zOEFkLvJxMxZ7ulpjQCjGGtyRdRKkrbwsj0yWlgWpU5MBI3E69tLaA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023140.outbound.protection.outlook.com [40.93.196.140])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gduntnhsx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 08:13:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8X9h9f2yxUPhF42OH+JSgOcCVp4UtaGx49zX31DS4ka/Bdi+UlNye4Gqc1nlz6vnxaiuo7Mcs/BTmcLLTRKcdC/L+J/WhTQpO34xsi7K3yFI9Asz8grozCBm16z3JbOTVcUEsaU3rqGbXPorZnX1Yo3kl2pVjXRI0ucJS8WMkU6LfM43oE6tlCDh9MQMC+sx1fISt2f85pR+i2g9afR5htvyq5Ze9GV/PeycQPf+BaPVlb6Xf+POYPmhiRRbT4sFUxmK//O1/DVF7IXwKly4jJCkAzRfqIsmFpYuCOnp6ZO0IRHteVC/hU7SgzRcEId1AIKY49qPQ2H51vHN+ngQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4gRr4ZQ5uvhKq3nFl0l7Swu/+BIuJK6Fkv6zV/ctpU=;
 b=x6NYe6hP9RX/kY0ja507GqaXr1xbH0DveQZGwgQhqVanV3i6alxB3LgD6XelqUvA7dshE68LZC/xg4NnKLffmSQBxCkR0TSGorymj0n2DftTK/Cd091wC3Jb2Uux9XN3q9OOsjIEuhL+HlJ1MjEGoIW2zh05JhLiDJ7KMpYwBUdlzHKPwoirBx4FmhxRlePFsvgnGBkUzrldS2GxrY4+3kjJnCvrhVb9YW7tID5z0Zgegr/mEsIsfv1pkBteSON+Y6pZcLE3mEbMWB8aS3TkkInelshxLv6fTduy/KWoOlzhUqrXdc+l+8awEwxRNA8uUEiA6kyyc8rH3Cz7Zn93FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4gRr4ZQ5uvhKq3nFl0l7Swu/+BIuJK6Fkv6zV/ctpU=;
 b=eTpS+S0xg2mBhnv9IbkezJRPyTvlR5sS5QeQldUFSAgBwfK3zTjALKT3NjOm0bb5XJywAAbao4UktZyb2wXs7rGCG7vDH2JJI2zZqGr0ENbvX15UKN4RCkSXFq+9CDQ7byo+yuf95T77lQDw1TdJHXHz0O3dW7lxKXR4LxEqYlw=
Received: from SJ0PR03CA0140.namprd03.prod.outlook.com (2603:10b6:a03:33c::25)
 by LV3PR19MB8441.namprd19.prod.outlook.com (2603:10b6:408:21b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 13:12:50 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::59) by SJ0PR03CA0140.outlook.office365.com
 (2603:10b6:a03:33c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Fri, 4
 Sep 2026 13:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 13:12:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1AB58406543;
	Fri,  4 Sep 2026 13:12:47 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0C2BD820247;
	Fri,  4 Sep 2026 13:12:47 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] mfd: cs42l43: Move cancel_work_sync() into remove
Date: Fri,  4 Sep 2026 14:12:43 +0100
Message-ID: <20260904131243.755201-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|LV3PR19MB8441:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2afc4019-4347-4066-50e1-08df0a8637d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700016|34020700016|23010399003|10067099003|56012099006|11063799006|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	kfpJSMlVhMHcJPSNDHiEsuxdrcEf7PBzfuVrrno/Cnri5yg0cbyjPXgmnTcjcmSBBoZTT9cbIdionzpOR49ZVis2+NzIhuG/GjtemecMBXgREh1LY9JMXs3R8iRLNwbqpj8lmJIFxvLsYbjIKNm+X5ozJyDpriJ4W8OCgYs2dSvLc27vsWmQ5FwqMucb2YVVrgwcfjZbyt5lNiLfT2p0l2JXcp6lBWu1WnZIKTb8PiXjpUilda7BwN0CKH94BJ+6nQNjagr2Z1bAcw9ML85nvpy8rm8cMjhHX7pErvqG3LStAzXvL3g3i2wsA5yE5xmkOOJZRzKvSZIQcO0xQvyBn0lZWiXK4nDwxszHRQbRvLSF0mNZBIUoIgaWEmeUrOHjJemK7/xwMyTi62mCzLXC7+ozZoS80w65Act9y/Nytn91rgRUuIQUKAO8RbHRlKW+ayTR3ZVhW9uqCHn6mANAbvvv4inN0asDWLYY+sv0onckEYuRajSf4pTVW+JSi+jbL76T/DPP3dktiShAHZBQvrNXpqHXjA9r+KpqPQkfk8iNNhQUDVbkZrsZO46q2Z4AQA4rH/ndNHVy3a5JglvRSDyTpTPPJNixZ/wU3qeyCan04IvlpGdlHPbZc3XooljihOp9WrqdH6Z/7pyvn4OIBj5Tjgglyw+K3mVqw1GvZNB7Mx66r6ZPO6JmRhL6xoV0M9fa3fI1WBD/6pIX3BSz0A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700016)(34020700016)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n/5UAPRTYsQBJ46aiDCAam4DP5chXIjwleAWcO719L+U8LQJHonVr8Te+6YciCYgWul8RQfNRzNqsj5EV0xqoNQ/T2Hbyn6rIEJdNRmv7zDg2jsAuoFmi2P7brbfGzkeq5unfWKhonpgEqDJ3+tbSVmsgCxZlPBbV9ItOX1n6iva1LZdvxcnq5QUG2h2ojXsHGVnGAaDX8JbtSRADSelom1XuDh05Q3noyx6rnZh+35KxCQnDGz+vjWYXlhvkxccbqEBN7KazNfMefFtxEKgzRt4pwIYZRiCTIMnJ122QP6bCDUT43+XQXHpL+K3w3J9Xya6I//8C1gU8De0VNBYgJjDdtDXYy640V4hd+KMp0UwwXKG4JlvkjcbHQkcy5abC6ooaLAbOVxyXPGSMTikPbcyhpErUuBLjEtOjGr/oIh5f4BkJIA9bAaBEloFLlHI
X-Exchange-RoutingPolicyChecked:
	iE3Vvosoioxcmpu0Ft9dGJRoFWEwiNN+7uM4YPmVt0r0JXHMrGomwcVph9DJy1cy/ITo2u7KzgZ4Cs5mbkKo7ZeecbxPEOxxZoAYvMriWPabiD71lANPBPEP4+ZONySqthgnbXJ4sznjOQlv3rLZKm4xW6PTBIwNOqxSxFEbEBKah4UBddjm1jxMi84nnzQoYk2yX6b7DAiwPnq63mWTafiBT931O4qgzi/2xHh1uPQA30PEAhBmr2kORG/KZdpfExj9GW+o5YfRujoAsnR/eGvO/iUmIicjqn6OpRAStwOsvj/cvys4oms4gYnJ7oPDeQkMEmAbMz0qlIPUX5leXg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 13:12:48.5060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2afc4019-4347-4066-50e1-08df0a8637d1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8441
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExOSBTYWx0ZWRfXx0ZQpO9+pQvg
 nH/5sOTpLWfyBicPhmHHfMVQbJ+0Uc78hELizSdLYHhHhHtsSAsJ2c0rnuYX/EsOjms5Q/J7uVO
 PyO+7/9VWNvkWQLNIhkJscni+KZeUVXrcNylgfR2KvZN7nJ2ZnfZTBXbKAhiVBxC2W2fvrnZAnV
 BODFj3Y1t6RdS9d5yDoW8S5xIaiUB0oifW2eQcusMUAS8PAamEa1YOlMIHvejGstoRPCG+R6CEn
 ZOzIkMY9dUUHmG0OlGK3R4NmGLH/nnDkk4zGLEWGfEPGwyvF7QpVSNGeNvY3dQf1mzcjqLgV6f+
 DHz7N+PY2qgeZG2vXzyf/To/5OJif6+iDs/FM4h3uXNqGm3ULF8P1I1tXWc4HCt1H5+jXt3jCfV
 MyQjUKrQuUJgcHT1EmHKdJ7LEs+fBeHdQ7R+IRj52G9X/zKc0kI93GiQz/L+xU+C5OG8Nx3N5pK
 uASZJNjOcdNvGk3Z/tQ==
X-Authority-Analysis: v=2.4 cv=X4Zi7mTe c=1 sm=1 tr=0 ts=6a9ac3dc cx=c_pps
 a=qcfn1AlnsIIAWGxC+ugzFg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=tiCUvsGRcFwTDC06RLQA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExOSBTYWx0ZWRfX/XpEGYHxj+dT
 yo04Xngs9R+4kegqLPYs0qaQFzHC7b4OSvtNnn4HrnrotrUVX6+IrtIYV9eaahEGNWiIg20Jgym
 1sxpvucRQtrogpkNw2+CWT4kfXejA8E=
X-Proofpoint-ORIG-GUID: YnuFFOr12-2on_J1mJH6ZEZSKOBsoSx3
X-Proofpoint-GUID: YnuFFOr12-2on_J1mJH6ZEZSKOBsoSx3
X-Proofpoint-Spam-Reason: safe

The cs42l43 driver kicks off a work item waiting for the device
to appear on the SoundWire bus, once the device appears the
MFD children are added and the clean up is then done through
devres. As the work is synchronised in from the devres clean
up this could lead to new devres items being added after the
clean up has started, if the driver is removed before the work
has fully completed. The work should be synchronised before any
devres clean up is started.

Fixes: 0f35dc4bd50d ("mfd: cs42l43: Use devres for remove as well")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Drop extra pm_runtime put for the case the boot work doesn't run and
   switch to flush_work such that we always know the boot work has run.

 drivers/mfd/cs42l43-i2c.c |  8 ++++++++
 drivers/mfd/cs42l43-sdw.c |  8 ++++++++
 drivers/mfd/cs42l43.c     | 12 ++++++++----
 drivers/mfd/cs42l43.h     |  1 +
 4 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index cbe05c3ea9100..36c5b03bae693 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -54,6 +54,13 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)
 	return cs42l43_dev_probe(cs42l43);
 }
 
+static void cs42l43_i2c_remove(struct i2c_client *i2c)
+{
+	struct cs42l43 *cs42l43 = dev_get_drvdata(&i2c->dev);
+
+	cs42l43_dev_remove(cs42l43);
+}
+
 #if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id cs42l43_of_match[] = {
 	{ .compatible = "cirrus,cs42l43", .data = (void *)CS42L43_DEVID_VAL },
@@ -81,6 +88,7 @@ static struct i2c_driver cs42l43_i2c_driver = {
 	},
 
 	.probe		= cs42l43_i2c_probe,
+	.remove		= cs42l43_i2c_remove,
 };
 module_i2c_driver(cs42l43_i2c_driver);
 
diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 0a6999453f325..afed34d23af80 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -180,6 +180,13 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
 	return cs42l43_dev_probe(cs42l43);
 }
 
+static void cs42l43_sdw_remove(struct sdw_slave *sdw)
+{
+	struct cs42l43 *cs42l43 = dev_get_drvdata(&sdw->dev);
+
+	cs42l43_dev_remove(cs42l43);
+}
+
 static const struct sdw_device_id cs42l43_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x01FA, 0x4243, (void *)CS42L43_DEVID_VAL),
 	SDW_SLAVE_ENTRY(0x01FA, 0x2A3B, (void *)CS42L43B_DEVID_VAL),
@@ -194,6 +201,7 @@ static struct sdw_driver cs42l43_sdw_driver = {
 	},
 
 	.probe		= cs42l43_sdw_probe,
+	.remove		= cs42l43_sdw_remove,
 	.id_table	= cs42l43_sdw_id,
 	.ops		= &cs42l43_sdw_ops,
 };
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 4212ebcca60b5..3d26c33fee1d3 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -1099,15 +1099,19 @@ static int cs42l43_power_down(struct cs42l43 *cs42l43)
 	return 0;
 }
 
-static void cs42l43_dev_remove(void *data)
+static void cs42l43_dev_power_down(void *data)
 {
 	struct cs42l43 *cs42l43 = data;
 
-	cancel_work_sync(&cs42l43->boot_work);
-
 	cs42l43_power_down(cs42l43);
 }
 
+void cs42l43_dev_remove(struct cs42l43 *cs42l43)
+{
+	flush_work(&cs42l43->boot_work);
+}
+EXPORT_SYMBOL_NS_GPL(cs42l43_dev_remove, "MFD_CS42L43");
+
 int cs42l43_dev_probe(struct cs42l43 *cs42l43)
 {
 	int i, ret;
@@ -1153,7 +1157,7 @@ int cs42l43_dev_probe(struct cs42l43 *cs42l43)
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(cs42l43->dev, cs42l43_dev_remove, cs42l43);
+	ret = devm_add_action_or_reset(cs42l43->dev, cs42l43_dev_power_down, cs42l43);
 	if (ret)
 		return ret;
 
diff --git a/drivers/mfd/cs42l43.h b/drivers/mfd/cs42l43.h
index a0068f6572e2c..862bc6fb68cb7 100644
--- a/drivers/mfd/cs42l43.h
+++ b/drivers/mfd/cs42l43.h
@@ -25,5 +25,6 @@ bool cs42l43_precious_register(struct device *dev, unsigned int reg);
 bool cs42l43_volatile_register(struct device *dev, unsigned int reg);
 
 int cs42l43_dev_probe(struct cs42l43 *cs42l43);
+void cs42l43_dev_remove(struct cs42l43 *cs42l43);
 
 #endif /* CS42L43_CORE_INT_H */
-- 
2.47.3

