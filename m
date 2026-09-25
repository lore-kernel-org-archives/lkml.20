Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D95448BB6;
	Fri, 25 Sep 2026 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343080; cv=fail; b=YfdmTEUh9GtiMrtDA8SUYKlkEtAut+ZTHBByBEa7CV2K5SHQvmco+G9g7+tjn2R8BKDWLo+9Q6+knKy+Tf7j3eHOmkfysCNIdY4dDLVEOXaXwfzOniJaMctHMZgbic3jhhrBLR4wKB5mU9SO2//pspgNutwQl8+XcenLmFXBjLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343080; c=relaxed/simple;
	bh=JSJ1HUqHlj3ksImWqRqi54L5JhA7+OBkiQzSPLqmweg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qJEuBsYLZrrtU/CrkJpDvpd77xpZqSA1ygf80HxUEAJLWJJC9ZM29eT8WNVoSB3qoHJtajUXquN72yPAekG9GD/UkRKxRn1Mg2jRd5uyYeFwkzzY6OrVPsJJfpluXz4lPKOMmzqBzZwxLkLbyQQOoMolmfUXA3ti0bd6p8Uerww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=PoZ4XIbz; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=U4SHhuvr; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="PoZ4XIbz";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="U4SHhuvr"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68P927HY1889243;
	Fri, 25 Sep 2026 08:31:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=/bwZAo2Zn9T5Qh88cLStYIvaiyYIeGpu8UqAfrdPF
	Ow=; b=PoZ4XIbzw6AhGtwmK/UvfCOUopXhbRk2yqjSNJZyOZXsNOVkNgcppa7vl
	MkJNQWSPFxeDIp7DChnPsWuBPYzjI+pf62RJbzVu20TObZmqM4NCBhmXVB5ZzmQC
	RmUUpPozXc0r32VlmehVzXXmYX8b9pLKBSG1ShUOj7gMdR2uQtHUzSOF58L6XKdh
	1raIZxRoZ+oytgftYWV1DZq8cNhYa+nu74eoW47hov1t/AfqIdamBXXhVk1dwUbQ
	1NlDi20+KJ0LiKwYbcjRZq7Lo8P13HSLyFwhHTC2WM8EBaOXyS6EqpPgOlS7p9x0
	R/82b+iuDdMZ//VZ+hflbcpR3BOzw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011062.outbound.protection.outlook.com [52.101.57.62])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gwnyfs90a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 08:31:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1lPjf1zOTzaOvRPcX/UXn/cxj2QKGTAQM16cZGpxfYQfaVq57AwftA+lrgO5dOHHWjZZ1GDuW/nko0ZUQB06oRGSTT8v71AIBocc6rK69Qgv24GkxBjXMUwav1xgEOy45qy8bxnts55YBjK6xmk1xiPV1/83t6M0iUYo2UfZiGSSxUigbzANwW+HR9Uii6nrOQ4DvfUkjCK9xAr+F7Ly4rAgrRtrtzrYCJtoJcwqEvECkv148BrgdfUnwwT74/gvKN1bP08HL3L4BGI8emVvmZXsuDy5mzYRpMmr9g9igP6nhIJOs8m5GjeYcxVVkqYWzBTIF8fsxOEoTjY7ccVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bwZAo2Zn9T5Qh88cLStYIvaiyYIeGpu8UqAfrdPFOw=;
 b=fPsdxxWJ/MHmSWmrfrWQNcsMO0oeEEYDd7CurTk0k9AvZR7+yvnukIxs9AznABbQ8e9IziQe3uFKY+sAUZuMg88ULqeO9KyHCNTAjrggWUmMO3ZcK4sSIDkXTRupD/n4L9eAnm0iq2x1h8Eb4fZ3jWqFb0nCkXD49DPKV83Anc2EM23BYy460kBw5AeAZmSDLMEyAIpQSnbOcyo+J4bHLaAa6IWue6UY3btHWww2tquXtcCOlRq95n+PD0QZH5Wq87EI0ZNYTifBlcsfcPiB2ScH0SJaia++ntzOuS+HiDIkgINa0N7lrQT4QaeOw8vYohT2C0QOv50VWm6+SfAwHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bwZAo2Zn9T5Qh88cLStYIvaiyYIeGpu8UqAfrdPFOw=;
 b=U4SHhuvrzbHXQn6QUzhoxRugQeLHbkSus5q/M136dpw+8bJi4t3xIPYrfQR+LPMA764bvlxtOsDIVq6jIe57tD1u2dIL9sV2F7NAMn8RHMO9NbvG11mOPqCYE3Y2ZXnHgIBNSdWlF4QSbBfeNImoGDeC9O30tTdtsNTVzbxtfWM=
Received: from SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::32)
 by BY5PR10MB4337.namprd10.prod.outlook.com (2603:10b6:a03:201::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Fri, 25 Sep
 2026 13:30:56 +0000
Received: from BY1PEPF0002696A.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::97) by SJ0P220CA0024.outlook.office365.com
 (2603:10b6:a03:41b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 13:30:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0002696A.mail.protection.outlook.com (10.167.244.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 13:30:56 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:19 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 25 Sep 2026 08:30:18 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68PDU1n72840014;
	Fri, 25 Sep 2026 08:30:13 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <sakari.ailus@linux.intel.com>,
        <mripard@kernel.org>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <mirela.rabulea@nxp.com>,
        <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH 2/8] media: v4l: Add 10-bit RGBIr formats
Date: Fri, 25 Sep 2026 18:59:55 +0530
Message-ID: <20260925133001.2780868-3-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925133001.2780868-1-r-donadkar@ti.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002696A:EE_|BY5PR10MB4337:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab7d384-edc0-45e6-beb5-08df1b093ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|23010399003|376014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2mZiCou7TzLQFr9S+59x7SQYvTCrdNhUeoBxejxUXpiz3KOpFfXczjl935Gq+EjnvlRxY82+6Dv4y0eSs6SvqdqGyBIuofx1Ww4R2XA0vG4sGgmFcNRQMYSGQVlChmLvt/oEerJhNIws9N8gTBcRFuDxZBcImXje3XG5QgLr4G8kwQh2NW7wadp7TreL7xzjJliCWjRH7WWcw/ZMZiMTfZmJx89Ns8jWP8GE2bZ3EFVn/e/I3DDFkffXIQHdDd+jSCYHTtHA9HhD+ApDHYKImvljz/NLm4U4B3Fx7JupEq/SVOG2sFH9PpbABKpvuYb0Ay33kpzFGIQcFEeF1wg5O83bJywI0k89VA6oJzFct/0UD1H/iNlK4JCyuIPtEN2F6+i9opERDvaoAbTMcduypsxnQZUETOJnsc1xhuVpFfOTWfpUpGVUgkmKTi5tnUJkTTsF9S4XoGcr18bv01YrAaERwWQRa1IW9L3PhW3xrfX4PnrSLwyjFcX1jMcew+BSYl742qjQqIrRF4tx374i8etDzh83hZA/1uTQBNSnSL4HciFwM06a2DWWUoLAcsiWVJZaR8lpwtjsDXQQTCoerRjEwfff6+vGRGnt1ZOzntmMcLPl2FEB9UTIRCB7UrkeRrTrKfl49bLUM9M/BcmDJ616gFNhCHmtw8TJy99WSi1YieNSauUUgFaKqjBakov6yOyzdVT7yt1CKoTqahbnyw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(23010399003)(376014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ygE/iKTHB+UfhT/PLsDs2ZNxgs3S/R1CulJREjeWBaofylPjrTSj+sdLNU/czWHDhczBs0a+BOZoLE/vZbn+k0AJ4RxXhyP/G0aZHHz6QDt6aYFivmHBzKCwc1Cbo6MY27uAs3odEIAAwQPr6Cj/Y4AyfmLM++mV+wNKzVCivn2CVZpCqbxi35GLUrUrpKjhJwnb/AeOja/fUUAm3UmU8WUFVuS53XCsq/YAFdl/sq3PIO2WDtWU/D9qEEwzOQsaUgfp911VmHGqmZ++2hbhUurefCIqcSbUAl3B5A5nTR3Vq/1HpcJQGreXVXscRKEh1grU2vbsnHtTDoI+CsLIWP01B+vo9LQLlSRlLKt2EiVAvxEx2tKqZwjAfMVd1AazhJt6YWisUmEHZ06xVGaBWr3zYwhUghq/6feYfIeioHOLWGIUSb569o9DYbkGKlcn
X-Exchange-RoutingPolicyChecked:
	3cHGmMp5/nnGqCzLYj88MCo5bfh3VX8fSjLrpwLkVsRvOpick1V0T40iKEJeMSWuqncZPnteD0MDzmtpVJpUhySNkfZx/8yjtNVZXhc5WglvwocDWmNAykM1x1XmQ+0xKw5tC4lnFeCLdY8H723EWlba6mBMIuLrA+wMZEKboRyK8uPlBMw3NNA641TY/khLm6ASvhPqEU9CnubkI+koSfW4Bbcvd/pB/Aj0j02p4ZErwwJWUok5ktvb28B8vduiajlDH32sD2XJ1/vyZD9bcE9K3l6ZSGMWFsdTz38RKZ9QDX9faJZXnbLfwm5odoc8TTPeaKtutBsjK/h9bJy6Kg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:30:56.3954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab7d384-edc0-45e6-beb5-08df1b093ad0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002696A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4337
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfX/GYTp0IdtCSh
 /L5UIWNsxFbq8wUMeihZg4B5M3XKSbCxApLwJZUvDAN6cLnlrhRx9EXn9LQgIZ6rzoRh0FEqT3M
 +LolNigKIiIZQoI++u3Gi45nZmDBTYnZn3DcFazvqWpnJth0gxsfyHeVqoAeshqJCcJqy57rZpi
 HZiJV9n9k2byTnNqON3T14ht7u/2uQNSF03hra/VAVnfSFa3TbGo2iiMRh8gyvVr+b5Lt79jf/7
 ohgSRDb3zciWfCjUvGLLywxYPrwoeIrVbAu/VjRZ4S7UKhsrsvyiz4nrtZMkklbjiuMh5z67HRt
 46223StFE7hNL6wPUpLxJVFLtULNW39wo5sBIHYgbzqLuZrgg6RF8lChRSt1Bqk9eRcvNpcMfzq
 U7NUohknK5I/ET+C0cPp3Wrs1jxNbHmXQwCp4By9vBuIfqhPpBDJmGHRV7O3FVh3JXU/SEG4+Kk
 wLQ6Qe5+7yfstJCUFjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfX1SucAjkiJ2UI
 8aYhEjvLs5+FWHbjzl0CWd8Xpt7N5KBX+yeliGf9bvmVKFFVVzEPaBfotORnZhyh7mdDXBr7bEr
 0uc7IxM695Ftu47wvj87jlPTRtEfWKQ=
X-Authority-Analysis: v=2.4 cv=aeL0Dhot c=1 sm=1 tr=0 ts=6ab67795 cx=c_pps
 a=YV/sJQ11QjtKmCmeYosiFQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=pgIbZTVwUDIrv2I_aUwA:9
X-Proofpoint-GUID: 07ydTnlJH8YGMPbGA1eProK3Mjo4l3ux
X-Proofpoint-ORIG-GUID: 07ydTnlJH8YGMPbGA1eProK3Mjo4l3ux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250053

From: Jai Luthra <j-luthra@ti.com>

Some camera sensors now use an expanded CFA pattern to capture near-IR
light along with the visible spectrum (R,G,B). This allows capturing
light in both low-light and day-light scenarios using the same sensor.

Instead of having a 2x2 repetition of B,G,R like in older bayer formats,
here we have a 4x4 repetition of B,G,R,Ir where the number of G pixels
are the same, but half the B and R pixels are replaced with Ir. Thus
instead of having 4 total phases, we now have 8 total phases or
re-arrangements of this pattern.

Co-developed-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c  |  8 ++++++++
 include/uapi/linux/media-bus-format.h | 10 +++++++++-
 include/uapi/linux/videodev2.h        |  9 +++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 17ba1ae70735..97ce6e1a6781 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1435,6 +1435,14 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
 	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
 	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
+	case V4L2_PIX_FMT_SRGGI10:	descr = "10-bit Bayer RGBG/GIrGIr"; break;
+	case V4L2_PIX_FMT_SGRIG10:	descr = "10-bit Bayer GRGB/IrGIrG"; break;
+	case V4L2_PIX_FMT_SBGGI10:	descr = "10-bit Bayer BGRG/GIrGIr"; break;
+	case V4L2_PIX_FMT_SGBIG10:	descr = "10-bit Bayer GBGR/IrGIrG"; break;
+	case V4L2_PIX_FMT_SGIRG10:	descr = "10-bit Bayer GIrGIr/RGBG"; break;
+	case V4L2_PIX_FMT_SIGGR10:	descr = "10-bit Bayer IrGIrG/GRGB"; break;
+	case V4L2_PIX_FMT_SGIBG10:	descr = "10-bit Bayer GIrGIr/BGRG"; break;
+	case V4L2_PIX_FMT_SIGGB10:	descr = "10-bit Bayer IrGIrG/GBGR"; break;
 	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
 	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
 	case V4L2_PIX_FMT_SPCA505:	descr = "GSPCA SPCA505"; break;
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 6005f033e62c..c50042300a98 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -124,7 +124,7 @@
 #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
 #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
 
-/* Bayer - next is	0x3025 */
+/* Bayer - next is	0x3029 */
 #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
 #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
 #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
@@ -161,6 +161,14 @@
 #define MEDIA_BUS_FMT_SGBRG20_1X20		0x3022
 #define MEDIA_BUS_FMT_SGRBG20_1X20		0x3023
 #define MEDIA_BUS_FMT_SRGGB20_1X20		0x3024
+#define MEDIA_BUS_FMT_SRGGI10_1X10		0x3021
+#define MEDIA_BUS_FMT_SGRIG10_1X10		0x3022
+#define MEDIA_BUS_FMT_SBGGI10_1X10		0x3023
+#define MEDIA_BUS_FMT_SGBIG10_1X10		0x3024
+#define MEDIA_BUS_FMT_SGIRG10_1X10		0x3025
+#define MEDIA_BUS_FMT_SIGGR10_1X10		0x3026
+#define MEDIA_BUS_FMT_SGIBG10_1X10		0x3027
+#define MEDIA_BUS_FMT_SIGGB10_1X10		0x3028
 
 /* JPEG compressed formats - next is	0x4002 */
 #define MEDIA_BUS_FMT_JPEG_1X8			0x4001
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fa..c56af0826f59 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -744,6 +744,15 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  GBGB.. RGRG.. */
 #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
 #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
+	/* 10bit raw bayer with IR (4x4) */
+#define V4L2_PIX_FMT_SRGGI10 v4l2_fourcc('R', 'G', 'I', '0') /* 10 RGBG.. GIrGIr.. */
+#define V4L2_PIX_FMT_SGRIG10 v4l2_fourcc('G', 'R', 'I', '0') /* 10 GRGB.. IrGIrG.. */
+#define V4L2_PIX_FMT_SBGGI10 v4l2_fourcc('B', 'G', 'I', '0') /* 10 BGRG.. GIrGIr.. */
+#define V4L2_PIX_FMT_SGBIG10 v4l2_fourcc('G', 'B', 'I', '0') /* 10 GBGR.. IrGIrG.. */
+#define V4L2_PIX_FMT_SGIRG10 v4l2_fourcc('G', 'I', 'R', '0') /* 10 GIrGIr.. RGBG.. */
+#define V4L2_PIX_FMT_SIGGR10 v4l2_fourcc('I', 'G', 'R', '0') /* 10 IrGIrG.. GRGB.. */
+#define V4L2_PIX_FMT_SGIBG10 v4l2_fourcc('G', 'I', 'B', '0') /* 10 GIrGIr.. BGRG.. */
+#define V4L2_PIX_FMT_SIGGB10 v4l2_fourcc('I', 'G', 'B', '0') /* 10 IrGIrG.. GBGR.. */
 
 /* HSV formats */
 #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
-- 
2.34.1

