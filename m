Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE57488204;
	Mon, 31 Aug 2026 14:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184936; cv=fail; b=HPxsgik/+CpJN0xU4wV5rR3tLU0hgSP282rEULih/gxCV0l1wQdx+95ZVMdVvECZTknfL1W9qhzfj3FPFajAqi1LRW3bTrUnqvDQDDS6EvCaK/InWJVyw2FWPGmq3ighXQ0F0GUZi1GwGV9+hUWI8F0b/AyFMLckChFCtYrhiLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184936; c=relaxed/simple;
	bh=62UFh/aJaACN0fJ4IJxyJ6gPIQxQtOSwUj3B6wHxIeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bujCaaPMStRauc/I1hLcfNfOzAefKOw7nwXB4I7Iu7R1lqZzkYY+jGffaMUSSdUhaMBH1uPfpHyTmGn0XZdKu0+52wFehxPHlz49u6S6uVsBNEfjfDtP+4j4s0MNlzOv9EYpZihFr7eJx7hXksdCQyY82URFEuqOSUWhrvv0+Gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ggPsMNmN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Wb1v3m3f; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ggPsMNmN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Wb1v3m3f"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V4lW7L3908734;
	Mon, 31 Aug 2026 09:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=LrSajeq/Z45g4b2MDfVIxocskrpOdn26MQX1i/TF8eA=; b=
	ggPsMNmNX85y56EyXNRUH2BM1Dy6ENVQmsIcdAPY7QRGC2G3w0YEENfsazHAhBr4
	shFRxVO5G6fV82ocEQZFJs7QO/lIxPzxMXNMbbkivuAeOKeWRxb9geZWy7jH/F8/
	4v9WZZBARj+h+dUga9l/RaAdsWPAkIiWD4zxGy/NsTPslMAWLAy/nrkW8zKDVYzF
	HR28dwj1q20QkPtCDH807ABq5jE7DJZZvm5KWercgM2GV/K/5WL1VGc/BEIk564F
	Q+bKeX4M+EW85QIzql+q88qoX+gAOmRC0jHTdY28WC2odhBVG+7penU47suKxomc
	PctzJ9wOVjMKY8Cl2HcSEQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021099.outbound.protection.outlook.com [40.93.194.99])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gbuuh25g4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 09:02:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmvaGGaaesLCl/fqHvoMCJlycR41deg+4uEqouh4yw7y4+14KmEQCbrZkMWsttoODyFAxemqy+blREvCkDXa9pkYsTZrXYPaIxlapmDKlOe/L1EgTg1xo23/2dTJReiHAezb07NT+ACHRd05gaYI7dPMWfpOqjgqJQfkSeREAyPB3MGQI96d094YO5g67W4kYk+JuFqHIJMsSwWHWLQefildSDTOtguZ6KDCfR4gdjZk7iVHfnWY1S5yTaRRERjAlHuxmeYpL1FO/SnLlB9/wJIUpvPi6og/4xusIerFTKYP1DStLMo+iI7hFkw13cKXUVLA9PQFcS6a9X6I0eqyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrSajeq/Z45g4b2MDfVIxocskrpOdn26MQX1i/TF8eA=;
 b=q+Z3FG2nBVG1rG0wqagcUpReHHBdzFtFGNVqYrtsxuVwwxghjTlwUhgG18+vL4NUSKhn8CjGq6hN/cYBogbl0KFX2TmeGeCkZ9L7CizsQTKYxg9lICx5L7gEMT4VVV2g5LkL3PsU+s9zxqhyWWsGCB/cJeDwmAr6YxJJakuKqEFfymsmnIweqi/fqCwpTz5ZvIpz3ho3Li8X3XRXYy/zB7SX06bJpzMxr5Sjw1rz8NpipCYJWtkeU7St9gIHr21Nnd/T0YZpUk/CeWH78StnwqprWtKtRkXmgnkZnHA0H5sIzY/Yp7eiCs6KWv59VqFyHVyxiFw3HtY9t8nIwEEpLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrSajeq/Z45g4b2MDfVIxocskrpOdn26MQX1i/TF8eA=;
 b=Wb1v3m3f+VtaLWS0hBnRx/jFRZFO3U0hMHpK6u0IoFAfaV7Rn4K8NOaL6TbzJuU7L3eq+YwNrInTGL5F6vBHD5tnXWc5K+MLfJan9942rnnfiFUd+b48Lqii/NFnQ6l4w5O4GtgYIpobWjzOYwQE+uIkNOh3OUXMIBnRLF1/sdM=
Received: from PH8P221CA0048.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::29)
 by PH0PR19MB5177.namprd19.prod.outlook.com (2603:10b6:510:78::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 14:02:04 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:510:346:cafe::14) by PH8P221CA0048.outlook.office365.com
 (2603:10b6:510:346::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 14:02:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Mon, 31 Aug 2026 14:02:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E4ED440654E;
	Mon, 31 Aug 2026 14:02:00 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CD98282024C;
	Mon, 31 Aug 2026 14:02:00 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] soundwire: Add a helper function to indicate a device will detach
Date: Mon, 31 Aug 2026 15:01:56 +0100
Message-ID: <20260831140157.1736905-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|PH0PR19MB5177:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f1e6ca8f-ceea-48b8-cb64-08df07686eca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|34020700016|23010399003|82310400026|36860700016|56012099006|10067099003|11063799006|6133799003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	dcbPRZsGdcnnPIzGGdjlOWZH8l4b1moIloMaOBUp0yNImMyfB5FmMEgWTaqUyXMjbkbPzIlNV5bJywruBrEUysqYPjmOwE+GNzaM1WFjO75FS5zFRziW4U1N2K4Vn4cE7JmqP9YXdedNGVDArI3AZdKfNN8T5hPt6RKZT9SeTunR0aCuy+B0Shv5YqVi7uSpky2aPv1bzIA9dkH16suiRNZ1MfIGlqhRUzZThBPg/2GZAhDe9b0+7AYfU4ZKfgufrWuXh245l6GeZ1ZtOHbfJnJB2BQ8AdV/cTHPfWLdsPhWXfQ8R57s0cSycuW4PcELmisxKJ60I8v0SL8vnIjGRxYqLWezLnzM3zBIHSHE013QgUYK/kA1q0rg6XKXNXkN6Q0VgkW3CBr51lAozdbxDQ6nLr4auzY5bQZ55/1CJqkKGmsYD6ep7yeiOj4mmKNk4zebttUizARCiik8li07Jo6w+5R+b4IqOj4t4m5TCH4bZ/gyRlEKlYAoaLIo6vhjFoXr4qkYEOZRxKFqSB7BhReiw8jjzH2A6x6A4Rt/ncdkxdNG2MTqJ67rSAKZyAf44tp/g2F4N9ZM635RJYj1gt3u5OiDJlFAcND8ehMt7uiXxukvaK+ErCjQhjARu24EKzCO6p3dF3cAhvzlWMYVCIzN2FyuSpmbrHh66xHFYOnkD7Kf6C7sopwggBaq9Zcuf5dYYpEmKL1OYMQWC9dXpg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(34020700016)(23010399003)(82310400026)(36860700016)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uN5jkG8KBNn6emii5gKhRyYryVhKaONfXzb4AmnRF+4Nh1zZoDq4GPKW8WocUOGURkgXRvc8CWfm0Plv3ioBSdN6FQ/9jIPtzps3efy4w8deRbUEweWfsHzRhOtKAJRiWEImkDaf4nqN2NcC/TeIdGaCkccjqlG0DnEeOPhm7T/NgFStUEvogJ8wBtbRQ/qQtk2L/hDOTVmma7lKcs/X1+GSnwTW/KBg2hXykF6BBuagf208NanPHaMvD47ywxBma7j9cdsG6USVmjmH1fOtdMR9Zuj9R9s6CfhW7cROeoW6xHCjWxH4hXoK+J7vkuI7Tv+IXo9aaK4cfiD8gfsgzvwoF4z7kfSY+vSv5Vj5aY3CXZ7Zg61JX5rKfE+Dq2ua7mF+NdofOqUlr53y0TvNr+n4J09YUOMKjg9nFUC9QG5p149zx/MZJArrOpQGF1Oa
X-Exchange-RoutingPolicyChecked:
	iqnxQBoBp9K1MHDJJohmGPa1ct3Mq/MwKhSUiN3Nd2I0uY67dQbY/XWUUdwlMfcJNuX1sT/FVo64GitMLlrjpAGvVrwe4rOUPpER9dRy1S8h9LE85HufeAFv/OQbSI/YMUDJMjhszx1MZdtRXIX6fUIWMC5XMvRJ1/J5vZunukTSGckWKZI79Kbx43tyLD8FYJKq1gajisgdj05qdnuJphXai81QOPOHVUATZ60NKijvWpBB0B1EcRD5vlrim+A8obpn6Ju+USEYWNqA8aCXHR73oAt3+/rW/8xEyJ5SWf0hBKB24+uWzO3ihJQPdtJDLPoieWUb7bsf97+DvrCqNw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 14:02:02.3924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e6ca8f-ceea-48b8-cb64-08df07686eca
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5177
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyMSBTYWx0ZWRfX+jNQNVvqiL8g
 Ud7vs17Kg71om4T2cmnQMTAz6Cw4lLP1VbV+vM5ss+q2FmIX5pi+F4EzJGjmrYrQ3LGwHO4nWcO
 PPy/asrsHv/rIZhT0PDVzeY48uOAPZgWdBCwuRch/vJ/MlCWMy6SSom6hv6CK5C9ptVJFG+hP0k
 ztj9D3MbYkYORQiffxhcivFPjNbinVpUgspLMWCx4taGidaIbKbP3eDYu4wefsMInenBjh0MmS4
 iI9t6oB2OF1XZ+BlcqSVVVrvY7cDjDXXw1dPUyzPQrRDy+jymbomr+BpZ0MsTlLRoT5MtuuXk3D
 QsmSQBA1aXup44Uj9ZOKjEB578PqozrSuJlGKmBOvHcxVcPOLRl875I0OI00HTXikuGbJZENf9u
 1iEUIt5WUmwzSA7+1a9jgsb05rZHET9NM4k98qgHwTR14KPJFLNwUGoFPVheH/s+m0qrNQVYkbG
 Gt5i/9EU2HfZ79yUKbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyMSBTYWx0ZWRfX1Co1zoWPvtnD
 DNK5OX9bkoB2ZZVndhMGalxsxoP2sInkL2cXsK9kJqc8Saoz2YUc1d86n8meWNKLE0AzDvnCS+X
 aFLTiYIXMMYTg9DLaMr++2doYVG7ghM=
X-Proofpoint-GUID: e5ECu5iL4BWo6_2zVtXwhL-dHGRqbEYT
X-Proofpoint-ORIG-GUID: e5ECu5iL4BWo6_2zVtXwhL-dHGRqbEYT
X-Authority-Analysis: v=2.4 cv=d4nFDxjE c=1 sm=1 tr=0 ts=6a958960 cx=c_pps
 a=MAB4nyKqAzWELJb2TLvteg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
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

Changes since v1:
 - Correct kernel doc

 drivers/soundwire/bus.h       |  6 ------
 include/linux/soundwire/sdw.h | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 6 deletions(-)

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
index 707ca6bd1e23d..7d41df30561cf 100644
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
@@ -1214,6 +1221,25 @@ static inline int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u
 
 #endif /* CONFIG_SOUNDWIRE */
 
+/**
+ * sdw_slave_signal_unattach - Signal that the peripheral is about to detach
+ * @slave: Pointer to the SoundWire peripheral.
+ *
+ * Inform the core that the peripheral is about to detach from the bus, this
+ * is usually due to some implementation defined reset mechanism. After this
+ * sdw_slave_wait_for_init() should be called to wait for the device to
+ * return.
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

