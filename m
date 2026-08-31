Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79B8337B81;
	Mon, 31 Aug 2026 11:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177040; cv=fail; b=XCe6amqzNXpKUVKgXR3MPpNkACagnuVVhnmtChPUiLS4QgVNcfAI47sDBWfFmUN3aJBUdNGyTROZaYfFeyV5tDfVL/Kp+/NEEf/GX3NYNPZc7vPu8HcuOtYqXIREz4UJuxzsNRlyBPBJRKzqflJsCvhNW3iySGqRCOlhPwH2L8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177040; c=relaxed/simple;
	bh=bXUlBxadJiUOWAAUgdJgmgmtVqeUsKFJZuYkKdd3cQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eHe/J9p4O/BoQqvYGGhlc0hh+d/fB8xJPNVK0vh5YCYPitpG8+bj5wK+01RpljpXh520wOK1z7e+gDjBgy4+Lp6VQ6zYpmqJNkUO9IGrXpzClEbJliR8g+nXBtbq8StPG9uNI3or5li/aJD+NNa+qPaXlOgcIM4TzxIC7bfjuSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EcnZg10l; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BOJmip8q; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EcnZg10l";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="BOJmip8q"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V63T9n4037069;
	Mon, 31 Aug 2026 06:50:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Zsr/dKmIfgIzt2Od2e0GHfxmMeDQK10helf4+Crp1lE=; b=
	EcnZg10lIN4FbIrbPcvQB5086FPu07uwt/TgVjPt+nyKGGsQNqb3PvTkmzBzPhXD
	oToNABB1kR5/Sxc8PKSqOthPtlqswwE4hrHEaJDzrr5I2A/7mFJKPKMwSHrO1TGp
	njCvugmYIzXx8ae/e+yTRVHmC88hIp751Hyujbh/uzCIoFH3huvDUybzItoXFv9t
	VBYrvgY5O0ww+xL1mwc7DouToJXWphcYdZPj/+ACm/Nz4YinI9M2kkCiF6k2WxsI
	3az0I8olqCKxha4sefR8Coyfsz72N89be3Lmt7a3SeQch8BvGxYDaOVoC8R3EJsn
	8htSlGkN47EUBx5y2Kqncw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020072.outbound.protection.outlook.com [52.101.201.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gbuuh1x0s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 06:50:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXJ3wPatGCbFkGXIY1GhlREpMpy9D/WRX7QB6eo80RJatmz3Rw7MTYagW7sXqsdjl949Ob00eXZf5ZUafC8ObogGus7hnkCXDF3+UW50KHfaeOpYr7CZ5099reaFAzOR1FTl+2oImJEY46UbK3ON6dfXeusLKXQvZZopxBnxq0I8WBVSl4qEBr62PV/evaOz95oPfVcmKbzxtw5u/49MI/crRq9iX98Wb8tlLvfDzoDJy0TcYza31dLbgIHOtjyunsUSD/IIRtESSRXCI49/5VKCJ8rSH8tP36uf+afJhQoqFKJEvk90lZOsCFsrIkF10eyVjLFc4YnXOpeWkJ+6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zsr/dKmIfgIzt2Od2e0GHfxmMeDQK10helf4+Crp1lE=;
 b=YR1W6TMpZKoRW5+cT450FGgMCk2e0KugHAl/VpvTPuw0D4lYm5Fa/i8GKGAdmEus3dJSPL9chwcajDzhO/VpHJ8KWUo5MAt9MUBJnRjxt7Ct8uG+7PWIW3FSB8HoNwSnamxzHZKRv6HPwSLGo+kk+EdAsRC/lS6242dL3qzP6cjj8AZBLAwxAVhmWG7lzMmpwAb17LYyU3dYUjdGgpf3bCuTJslYWKld//V/RI+O7c8fQw5hpXvXXHCtYoM+IaUXrlV/+1K2L+OmCDujWaL4Pu+qoQpmDP3sqsTrFx5fOdtHioiywfS5pc8H6/qnwpyK/Meind8kOF7QmBtYYX8bRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zsr/dKmIfgIzt2Od2e0GHfxmMeDQK10helf4+Crp1lE=;
 b=BOJmip8qJGf3iirC37YpDU0zhoeVQ/efv62EIWmrwkRBb0Q9PDS2ZApOzXaO3H6zCvPkBoTo7mKN/tcw54i4szo/PyKdj7p2P60nuuIqOW/buzQtnCYwdmLcqR+A9LyiO9c15AYj0CVuyyr0QK5vXmrXchquqsdstpg4D82ym7I=
Received: from DS7P220CA0098.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25a::19) by
 SJ0PR19MB4464.namprd19.prod.outlook.com (2603:10b6:a03:27b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Mon, 31 Aug 2026 11:50:25 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:8:25a:cafe::2f) by DS7P220CA0098.outlook.office365.com
 (2603:10b6:8:25a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 11:50:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Mon, 31 Aug 2026 11:50:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A97B540654E;
	Mon, 31 Aug 2026 11:50:22 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9343682024C;
	Mon, 31 Aug 2026 11:50:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soundwire: Add a helper function to indicate a device will detach
Date: Mon, 31 Aug 2026 12:50:18 +0100
Message-ID: <20260831115019.1616202-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|SJ0PR19MB4464:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c0591be6-8162-4f09-7943-08df07560af6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|61400799027|36860700016|34020700016|6133799003|11063799006|10067099003|16102099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	t0HlXOA6ilco3HIWtct5pTtzcYcE6lDBE/oHt4LCufIgKFJfkgDRpd7rVw0NOb2G2//XwX+HMhaLIq5z8LPXTgvPokl1nOMuVE8ZIjPPUNBSH1pmVhe9E/CLUWtOT6JVz++8z6iO2qqDfYzsgPKp7rr+5HuGdMhs2XZ3p7PJ9nnUWlnmsZzMHDYIgTBqsfbhagFhnQOsXG6/NwL6IzskZp/kO7NVzmLZSXFtlNbB++xsSrCLRpkL3qdEZn4NzKI9IsmBFeZxHZN3+QOkBsg2G63JZ3nu55inWj3BX7XNtRqU5BwI8gEVKBS0GRqLOyzq9IPg7MlSHD9cSN7tA0ylFHk8qtmG5RN8Ma0+okgq4BUgIMvsf8rlsXr2Nup9ZjolAJ7nOXa5Mn+zUfPSfsZqVdaqUFqPwdvWaOxhnS/7h2mS1+4WEZX4pFbCWJMhfclSas6qo2yokCyNWYjkRGkSvTjeHK+jPyBMNoSxvFIb8eaCaocVO40/AtyjpWxHSbe1LIcIvNBl7svW0GEdsaJ9zUMBSqOQ7dSRf7aOURKdylZKN6O3irKQooSoKTlmsVgrYQhWwh1yB66rtqsPXabErZVbNcnrLM9aSQTiPqn1CnAfnLhnkWkZwNwNvAJKW+GC5XTAjiqiNu/8lO9IBt/QR3jtpf394gEwhoVOIxsMwXG8Yl3n02DvQfSibstbfi5hlL+YKkRHpmnRv3uqAsXlQg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(61400799027)(36860700016)(34020700016)(6133799003)(11063799006)(10067099003)(16102099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Qo4UR8ss3+M/cAC3sRjvttbIbgVT6XzqUv4aNrhL1dj9rHpGQVfb0Zo353OG3Rozu64CG79RNJifHBbolJ7yv9zbXdHIp9VALfP1hGNzlv0xen1V7ceI0fxlth9LtPpi+3WprJP18A1FDt3FTNbCOztSnEkN4rcCMXzPeRrOrrvf45R/DqE6Ym1rEfHgvJxwhFnH5pTLJlMxz5qCSSuYRp6PPrZWgfnJrMEvaiOuj+iMIt1qXiYspbkY0wNfYyW9hKAKyEssf1FjvtDfHnl8V8XgPqZewmx7oj4Y1pg4wy86Q2ll4P9S+dEzau5scGt2lFgqxlZmDwfE84/IGVg3n9EvJwZzaUSsSoGNd4sn68mjA/rZkPrcGLPjjGuiFG7ZvNrHKpRRbzByJZLTzfmzV7+csfz6bwu8X2sngp1O660oHuy/mIS1tZxHjpoOdDa2
X-Exchange-RoutingPolicyChecked:
	u+nVhwwotfxGYSklFD/VHIwB08sSG1S0xGkultso8uMQJJBjSrJdR9zAvA1cTaV4IMxwSKDToBSsjYthGFfV1159ZqKUCi942A+AJWEvvOQqG2pA7DDy+DFwaJbqJZ9nECW7GrOpplzalBCbS0FrCTy3WcE+CUsc9xZDzMdcZAk8Cluc4/qAXCBz5WHfuYeAoxiaBS+QuKtLgXqFZpg+Pydb7YBF2pWfcmhv7Un8LTJo18KkIpbJ7QkCL7Kd0bf8fUckiJQTVyt8uYKKNjtqNPZl5geI2VsFhlyIgoIEgd7wmGQfEnHiZWjxUu/FStJ9HuPTTKJ1q70J8yFfT6U8WA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:50:23.9629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0591be6-8162-4f09-7943-08df07560af6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4464
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEwMiBTYWx0ZWRfX9XTTvcwf7YGb
 2CIwU5OLY7c1kQWGieJTZ74IrZG+9jpe4zlIwkQCQLQlmlpGrM+t/JlYjwsYDAQALsf1K3Ot/rw
 jxvYUyNsf9DpDzUsB+VQaaEyg43mI5C1jR0MQDkT2EAbljbkosEAQmQDY3QTFjNzXNREJzJXVKo
 PWszUZLCU8axwxD5Nkt/HiaPPe4W5b+3r9uuz8f2KFj11z6qNElhCdOBX+g/D7AhIc1zu4TqLJ5
 ATyYlU0rSOGWuHp9jlhZL67402N/r7hsocbI1tBRB5MoGmSBmU85qBT/OwlBVHvUoLenPbRRkaI
 wKqRf0FvXWYpCcE8pqxR8mOaue+sY11uCrVy1Y4anZrqLkASKWqVn81WsC0W1ox/Zxi6rcUUkAN
 4MmxQjIqQhpqxETH3MQLPli61jap/RDLYpEOjyJ4Q1y39Bc7BEOk+UfBi+rV9p6opSq02AqzVus
 lEi4CIL+9/JoFzD1p4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEwMiBTYWx0ZWRfXyeHQWlsdXQUL
 0/7rclrVgeqdL8L8yMU3ipcriwuCyibUJWSH75PB5v1l9kn693YD1lHf0u06MEpIiecF9f/Th/4
 LoUhPge7n0Mug6n0l9NRmngQVdrRQbU=
X-Proofpoint-GUID: HYqEOS9FgmPLubwgjfd7eEZk8v5AzsMQ
X-Proofpoint-ORIG-GUID: HYqEOS9FgmPLubwgjfd7eEZk8v5AzsMQ
X-Authority-Analysis: v=2.4 cv=d4nFDxjE c=1 sm=1 tr=0 ts=6a956a88 cx=c_pps
 a=IBJHqVCGmmUWI27oiwGTEA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=8GfHkCRbLTLxf0Ih6UUA:9
X-Proofpoint-Spam-Reason: safe

SoundWire devices will sometimes need to reset themselves,
typical times might include when taking over the device to ensure
a consistent state or after downloading a firmware update to boot
into the new version. Often such a reset will also result in the
device detaching from the SoundWire bus, in this case the driver
has to be careful. Naively calling sdw_slave_wait_for_init()
after doing the reset could immediately succeed if the bus hasn't
seen the detach yet, causing the driver to proceed attempting
to communicate with the device whilst it is detached.

Add a helper function that a driver can call to indicate it is
about to initiate an action that will cause the device to detach
from the bus. This will reinit the completions in the peripheral
for device attach, ensuring that the next sdw_slave_wait_for_init()
will not complete before the detach has been seen by the core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/bus.h       |  6 ------
 include/linux/soundwire/sdw.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 44e4f51939176..59b6aee0ea6eb 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -231,12 +231,6 @@ static inline void sdw_fill_port_params(struct sdw_port_params *params,
 int sdw_bread_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr);
 int sdw_bwrite_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 value);
 
-/*
- * At the moment we only track Master-initiated hw_reset.
- * Additional fields can be added as needed
- */
-#define SDW_UNATTACH_REQUEST_MASTER_RESET	BIT(0)
-
 void sdw_clear_slave_status(struct sdw_bus *bus, u32 request);
 int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
 void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 707ca6bd1e23d..969604755ce41 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -25,6 +25,13 @@ struct device_node;
 struct sdw_bus;
 struct sdw_slave;
 
+/*
+ * At the moment we only track Master-initiated/Slave-initiated hw_reset.
+ * Additional fields can be added as needed
+ */
+#define SDW_UNATTACH_REQUEST_MASTER_RESET	BIT(0)
+#define SDW_UNATTACH_REQUEST_SLAVE_RESET	BIT(1)
+
 /* SDW spec defines and enums, as defined by MIPI 1.1. Spec */
 
 /* SDW Broadcast Device Number */
@@ -1214,6 +1221,28 @@ static inline int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u
 
 #endif /* CONFIG_SOUNDWIRE */
 
+/**
+ * sdw_slave_signal_unattach - Signal that the peripheral is about to detach
+ * @slave: Pointer to the SoundWire peripheral.
+ * @timeout_us: Timeout in microseconds.
+ *
+ * Inform the core that the peripheral is about to detach from the bus, this
+ * is usually due to some implementation defined reset mechanism. After this
+ * sdw_slave_wait_for_init() should be called to wait for the device to
+ * return.
+ *
+ * Return: Zero on success, and a negative error code on failure.
+ */
+static inline void sdw_slave_signal_unattach(struct sdw_slave *slave)
+{
+	if (!slave)
+		return;
+
+	slave->unattach_request = SDW_UNATTACH_REQUEST_SLAVE_RESET;
+	reinit_completion(&slave->enumeration_complete);
+	reinit_completion(&slave->initialization_complete);
+}
+
 /**
  * sdw_slave_wait_for_init - Wait for device initialisation
  * @slave: Pointer to the SoundWire peripheral.
-- 
2.47.3

