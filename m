Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61BD40F742;
	Mon, 12 Oct 2026 10:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802569; cv=fail; b=jSXr3cgpsliGDHmcQ6159Tbzki2/+QfwU4Ezh4meWGxgXpnhgcc+Se5txY+BKgvQlHZ0BV/XrWdKjeYhzhXHaKnq4vY2ffCh3JNf/XGy7Ah+D2tflF/GapKZ1ibOfl9c74q/bUkyrXk8XEn3OV3zf9WS+MRbaROr12uQF1Xyjxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802569; c=relaxed/simple;
	bh=3lga1T1+mBtpHivS2GmcAUhz1+VUu3440vOCohs/API=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ADHhp3fCMeraz/9bJ7Y3m/aKgnhPfixT24/Z5ToVxGzB68lwUf6CkL93ccy3Z1cmii2dFtoUxATN700/syEkjvimERgDG6kAe0pKu3WzIVvImroN7A/cjpAxlIiSQB2GmzXQiNU9FdMbXhpJcoPUA1fAjpySzFCFUT9D2bFsy5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PVOsmIUM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=waFhkuT+; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PVOsmIUM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="waFhkuT+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CAL7q84139959;
	Mon, 12 Oct 2026 05:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=4VBcwTY1lqJKtWGcVbFboY/ouP+dIyHA3O5W4fdX6KE=; b=
	PVOsmIUMilOFPFi96VtQ/19KZ6mg9MkEL9Yh47cmU/fVc0xER+112cCQUtdfzRF0
	w8n49Pa9y8F08Mp61edjKLwfw3m8YjHdQfQkWEtz5xzYznvzpCmz1pDrYTe3ZDro
	pTwIi8tifmoSmO/kg06z0qRkYnTe6eWOH5aciZu+8iYFhRvVPQU+CGbj4GAM1hdV
	WakqeHZmCRkOTf0PNo8nJ9Q+/CaeZPPbvUVzqU0/KtmNyu9d4LliLNyKMtkf2k2Q
	OTZEnGaenU0teTnTVxrmfaBOOBVe09X50JKMp2zI9KxyinUr+lqlnPCH1T6lH0IT
	ZOM7Nvg/kpiXDtiSNYlPKQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021089.outbound.protection.outlook.com [40.93.194.89])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h7jrxa136-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 05:55:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVRVjkXXCaHzExhCNnZW4auAZeEiaN8u6eq3nQxa11BI9ic3hPMkWdVSGVb4vKDEIEl3a5fbbA7txtJOous3+pwfAIKUkMWJE9la6u31ugtne/mZpTtXsLrHkDUMlo6t1uGIY34CRfEVms3CQj+OAfegM3CkU+u8U4F93ZAml+8l7cqeHr6Y+vMblkJeZuNaUidhKZnkL/XnOAxzixN1xBSe4d8/rLgbResidoDU6pVkhub8R/IWNTOA0A77S/wbTtnEgBIPjfkKQNECJu0MRI5eoyUJyA5CzNHObzxc9vpSX5Z8Y048ReUyXKANl3sDB35QxC+4I48ATBlTqHufSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VBcwTY1lqJKtWGcVbFboY/ouP+dIyHA3O5W4fdX6KE=;
 b=ROqS1lqjtGw03zPqDvmh8Nr13ixV/jcyt7MZuTGgICRhd0EELksaAKOyodNVgBbxcBI6sS3RpNrQtgBoAhLOTSIn+MOAHfQngAfF5oj9Ba1ZYHN0e7pAbxlTc0Bzfl7pzsEcGPEEMtqF1wnlcK151VZ/Y2JXS0xzRs+ORQwIwN8k0rhUetlgbjCtC3t+Ax7nAmzc/zR9qlH6gu23RiG6x+aUuNaJFQv0jK0VmRfRsy4OHoL/lvgYAnj79j0LsLx4uwSe3qgCXnYPM9ozL4t3KWO/mXzEl4+WdiEQmlQtV7rjzVVY22YSEp/zcUwYxfsr6NQ151d4HB4CXDVjw4qloA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VBcwTY1lqJKtWGcVbFboY/ouP+dIyHA3O5W4fdX6KE=;
 b=waFhkuT+jHKUiK+uv0JYwIv8HAlKm8JS/qdvZ3PpH8Zy6kzWF+V/kCFXVzEnjZFx18czR5DyksIWVki7p45uwCAV7M/G2LV4sIYpqv5lG+Sizdxh4HhonzN/DnHrFuExqBPMTU05jEVOtHdclamBJOMD/XHXjPnuEEa6gp+iTQE=
Received: from BY3PR03CA0007.namprd03.prod.outlook.com (2603:10b6:a03:39a::12)
 by EA3PR19MB9375.namprd19.prod.outlook.com (2603:10b6:303:2b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 10:55:46 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:39a:cafe::a7) by BY3PR03CA0007.outlook.office365.com
 (2603:10b6:a03:39a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 10:55:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Mon, 12 Oct 2026 10:55:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2199A40654B;
	Mon, 12 Oct 2026 10:55:44 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 037B4822543;
	Mon, 12 Oct 2026 10:55:44 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] soundwire: bus: Expose a helper to remove devices from the bus
Date: Mon, 12 Oct 2026 11:55:39 +0100
Message-ID: <20261012105540.1686405-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012105540.1686405-1-ckeepax@opensource.cirrus.com>
References: <20261012105540.1686405-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|EA3PR19MB9375:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4d6f5100-529a-404e-b70c-08df284f5e78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|61400799027|30052699003|10067099003|16102099003|22082099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	soYw1qgPQv1UGFiawqOlwnAx2IqKkfVZX6QM9dE2zoXjHpJPOFg1vwlsRkUvyimxOi1mCRM+yTB1bouw6JfWz28B0w+M+8b/0Bwlrg2C4sIdyvPTt5a8Ltk6oycvFtCgP3WoZGU4P8Pna+TxS3P+e92WhQG7x8sxn4Zk+D9F2pR5F2vFbJdFsef3HwKFrdiK+kj50UzJEoUJT917awGhvoPKnyZlcQPVYhxZiD1HQQCnuESh8EGfWsnY5w+yZQ21UGuiT9GnE2YpljBa9xc26x3tSlGBaBahS5HmzxhfLBJzT9iLfwYHkMXyPmYCqVBP2a4TPn/LxbQJPDICyUSxthAxKO9D0OQSaHQ4hNzUipVQMob+cmxKezBihtdzItV0NVsbwrRttQSoIlIHtUq3IpaYTfs0HlpdXyBv4Io3xStEoqRDkP5bf6AZTTxrSZ2h1W09TifnILUss1BuOzZm0JE0HHmibYuvoe3SEppXvv/Yo9fhlC3L0v5QfgVjQINVJgoP4G5TfYbxORfg/YJAbZekj7OmvL2Fuiz5xNC9pLnqNu0EAnQ08a/6eQAutJUodwMgVy8l3/EXvtWHGfOus0mMR9Dff+/8AU/X+1K5SngWpKT8Yrf8fWhKVPXldyAxBMTw1eaA0oCNG5a0b+7W8pocAZCstVzw+UQGTF9Jv67M7kPqi7ob+EPlHdqkYw5XUsdwsiidUpM3zCy+9/5VNg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(61400799027)(30052699003)(10067099003)(16102099003)(22082099003)(18002099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JFrkscxQB42rw4CpEbnJtGMcI4/WKzAMyzFuFfDXrBG8Xy0RJftk2tIFmET40GMWp0fMEQCR2Zb17kXTbs2Kcnd6Hm5iC+yjguiPPJy3+3mV84sXIm6kVYxogU+5ktEbwO81TSfcmYEYtGxPuekWJBcCzyQUDGWnztBSuYmrY4kg64t8vMK9tOmFdRoNWqFF12s2umQZsBuUDZc2U1yeewBGQIvCUDK7gPgaCPFTL7Kx1rJJUpzJyNdpGRRJVKcqXr1SvQVgKhmAG+ttK5SvMVN70qaS0La8YA0bR+yuO233r87mrPWnQg55ijcFsHCTd0g35ni/PFrYs4ul1vKoVuhadB3yASIIABcikrXgGAIg6ZTGOCheeq+3XYe5Xgyb7jva1otmbVDQ/nSdvAbqI+TViBSMvnV38l+u3e1oQd718nPbJbk4prJiNn9dSAwA
X-Exchange-RoutingPolicyChecked:
	Z4gj5/CMKTdPWTuFRLtrHcognccJipxWcWnAay/I8gudfcCNCDWVqjCgWjPlIvtjJEhz7A3vzBGVFddVaL94kObT+yhCgG+UUCFFCshgMeur721nEIYaU2QMqCxsQTKcdGQTPXi+zfHHFOxK0qN6KS190AuCNoBwklFi4ViR4xvYmHysJnZSzuMIpZ+r3glzZd825LpZGu6QjREZHISKG3YIo6umGSFB1lvtLfXYaMrY/SYdOOtZrbEG4uoDE0NUhWT3BjVCK7GDLO+PsvrgL5y0Kyhut8SH42XM5H2M1CAQJKRv5tDZM7uMO/4jQeu6Z52uG6FVrUWPAGA4+0Sg5Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 10:55:45.9151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6f5100-529a-404e-b70c-08df284f5e78
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9375
X-Authority-Analysis: v=2.4 cv=A/n5rKWG c=1 sm=1 tr=0 ts=6accbcb7 cx=c_pps
 a=/L+qah5tOETEvltlblSARw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=gQeVhbwXa6W6SovQ:21 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=1N7ZiyxPLO-s3Sfvc6UA:9
X-Proofpoint-GUID: kHGHlDwPRdCkI0Ld_TLudGo6Z6FpA5D_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MyBTYWx0ZWRfX2Q/4dcop9L0V
 qXybs5VxDOQAeUc6DFvdS1X/OVzSq1V3/GvPJgDIlKiHF/Hd5OQANEhHp1GldjhxPb1qHCKnh3I
 qr79elflz6q7fN7ZOn7yjh2L4kDVZ+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MyBTYWx0ZWRfX+Za8zknArqjQ
 suxmBd5+O/ULD5oGMRjXnXlSpGx5XdTPO9oQn+iAUMKDiMSxKYjxyaAg2TjMJi3vLUQzduCJzpe
 7oSMT38Y0PcgXJ7BPXgC26Waum7xkWPb0EvszX8kIMTCEhsRym0+Apf1YJR3C3APz1OS5bIUD1K
 JOcGp8aXfOc9+7yTO6CJE4K9Dk3Fd86sSgB5wjHMmKqpvXDMQiztLrMvh0imeDDqCyrF07zsGVM
 1HKh6FRb95LAmVSiR+zD6zVkE+tQwkx+LGb4dQs+BLFv1S0zeDXzNDm3793q+fboeawAyHEDWXI
 8B5OFy7oBb/J4It40/U7sxnY9v/M7/Fqq5tz4JxBUR7tOrMygUXpDgz1RgTOxCd56QROcV/wtTW
 kk0HmmNpbOKhwTLR2YBZuaVT3RV/cp/2zE4F7aIbOQ0IgpZ8zCmYv5lJMEEfLRcEwRDDdaEbo/z
 b31+S2DZ9xqCkjRtg0w==
X-Proofpoint-ORIG-GUID: kHGHlDwPRdCkI0Ld_TLudGo6Z6FpA5D_
X-Proofpoint-Spam-Reason: safe

Some SoundWire controllers may have features such as IRQs that are
needed to support peripheral operation, it is desirable to continue
to support these whilst peripheral drivers are removed. However,
the current sdw_bus_master_delete() monolithically removes the
peripherals and destroys the controller giving no chance for the
controller driver to perform clean up after the slaves are removed,
but before it is itself destroyed.

Split out a separate helper function that only removes the
peripherals, this will allow drivers that require this to sequence
things appropriately. The functionality of the current helper is
left as is, if the peripherals have already been removed the call
to do this is a no-op which allows drivers that don't need this
functionality to remain untouched.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

 drivers/soundwire/bus.c       | 44 +++++++++++++++++++++++++----------
 include/linux/soundwire/sdw.h |  1 +
 2 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index eddff9a5fd35d..c97f6c27fa854 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -169,7 +169,6 @@ EXPORT_SYMBOL(sdw_bus_master_add);
 static int sdw_delete_slave(struct device *dev, void *data)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
-	struct sdw_bus *bus = slave->bus;
 
 	pm_runtime_disable(dev);
 
@@ -186,18 +185,38 @@ static int sdw_delete_slave(struct device *dev, void *data)
 	 */
 	device_del(dev);
 
-	mutex_lock(&bus->bus_lock);
-	if (slave->dev_num) { /* clear dev_num if assigned */
-		clear_bit(slave->dev_num, bus->assigned);
-		if (bus->ops && bus->ops->put_device_num)
-			bus->ops->put_device_num(bus, slave);
-	}
-	list_del_init(&slave->node);
-	mutex_unlock(&bus->bus_lock);
+	return 0;
+}
 
-	put_device(dev);
+/**
+ * sdw_bus_slaves_delete() - delete all peripherals on a bus
+ * @bus: bus with peripherals to be deleted
+ *
+ * Delete the child devices.
+ */
+void sdw_bus_slaves_delete(struct sdw_bus *bus)
+{
+	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
+}
+EXPORT_SYMBOL(sdw_bus_slaves_delete);
 
-	return 0;
+static void sdw_bus_slaves_put(struct sdw_bus *bus)
+{
+	struct sdw_slave *slave, *tmp;
+
+	list_for_each_entry_safe(slave, tmp, &bus->slaves, node) {
+		mutex_lock(&bus->bus_lock);
+		if (slave->dev_num) { /* clear dev_num if assigned */
+			clear_bit(slave->dev_num, bus->assigned);
+			if (bus->ops && bus->ops->put_device_num)
+				bus->ops->put_device_num(bus, slave);
+		}
+		list_del_init(&slave->node);
+		mutex_unlock(&bus->bus_lock);
+
+		/* See comment in sdw_delete_slave() */
+		put_device(&slave->dev);
+	}
 }
 
 /**
@@ -208,7 +227,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
  */
 void sdw_bus_master_delete(struct sdw_bus *bus)
 {
-	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
+	sdw_bus_slaves_delete(bus);
+	sdw_bus_slaves_put(bus);
 
 	sdw_irq_delete(bus);
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f710e5932b4b2..df9ee56493b17 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -899,6 +899,7 @@ struct sdw_master_ops {
 
 int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 		       struct fwnode_handle *fwnode);
+void sdw_bus_slaves_delete(struct sdw_bus *bus);
 void sdw_bus_master_delete(struct sdw_bus *bus);
 
 void sdw_show_ping_status(struct sdw_bus *bus, bool sync_delay);
-- 
2.47.3

