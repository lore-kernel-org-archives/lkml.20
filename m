Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FF63EDAC9;
	Wed,  9 Sep 2026 21:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990536; cv=fail; b=QvGX5GYYPge8wN3k2S7AQJcF0NW1FgYJxNFATUcqsd8QSz+WI4KeWDY6UEGC8IEk9m1C8vnLV+RgG+li+PwKl9gg676mfuyO4mZqiLCQH64otVjLvGJb4ueYbRsOtIUXvUvzCEk4mpCKGdm8lh+coNkB8wh06HZJ/YXUmLNCRXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990536; c=relaxed/simple;
	bh=u2K5pUZ3UcsAEHx9b2n10XKl6P8uK9gkpLSt2/RY5Bw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZnVzM1rJ1XjtadmKRtJIsy63OHYEzHcSfE49AH0+I/97hj1R8PGPsfA8SiG4+RCTmfbPGoEgQXhpRjcKBVshrKqGC+glETU9B2/27H74oNFjuUAG7SLJZ0hikMAsYSZcuxxMW4d9043UCxSp1cd9xYJtAl1B1UwTbBWzUwzu5rQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=TkZckfgX; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gvwBoboU; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="TkZckfgX";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gvwBoboU"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689JG8VF1367536;
	Wed, 9 Sep 2026 16:48:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=jDOk0Br0mF1w3Gc21qQe/Fe5zaNIj91+alFgSMSZr
	2M=; b=TkZckfgXjsacwJEm79e27rGWa+crp4O16Jbww/xTOkqUUot+Vl0SmEQdx
	iTS7xl+tgf4+FLdgdRo7yF6fd7jNB5QcNjpRHmjxBoQZvJoCxb4JBwC2o0z/7SNb
	SKgGY+jfNZhOLK4rUyhPkQTsEK66LcFCYPA37IFAVBYjV4rI/mdk75LR35c5spPE
	47y+XJ7kxt81M6mKoocAddmzfjIFK4mJM7Vw/4T4IJrNNzkVubeykHxAGb0fvFQO
	i6JVJaGk8+lBrBxZ5ryUvtAL98KayEOl1evqzYxad9Uo7zmOdzTPd74qPhrheK+D
	r9LQJlG/HpLuwL3g0D7+sVpk53orA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011056.outbound.protection.outlook.com [52.101.52.56])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxg13hj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:48:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uy/nh5JFBrKui5hc0LkOww8vXFGvDPGh2DjCfmynVR4VksksRNhbjXn+o92vaj1UhXGNLAF9/Q0+7Jtu9N3mK8ktluAQRIYwJucYSRIqzstJq5bFN3at8nGoYRJIlXC/rvPDdKdVzSQHQK42hDODh7113nSHZoWoCDFvnqJYMjzfG7MjRLZpUJKQNIvf3XLokQCU9RD3Rz3fVsvZyRtFMmmD1kATcYgUhTQnoL9WB2l9DU9c5cCQb1Py9Q7SfZiFcVj2Md6tuOgbjuCaoD9If6KQa1UIqL5ae/qfyDa3xY8qoVFWMX00QfzYxL852csTdCdIKZJzRR5cjtTKUklF+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDOk0Br0mF1w3Gc21qQe/Fe5zaNIj91+alFgSMSZr2M=;
 b=bCOuboHAPaYn38i93EuaiX9A9Ddtl+GhqdGW50YuXcyIDH1W+fNIZ/Mk55C4iajWqErsoogieZ+mxeZeJFKCGV/lO24OQhEMuUOmDi/M0CyZ01TtaEU3qFVmkN4+pNDQmVJsmpQLMTidY888DqJ7JC6jyXDPd1sjIMj/cprl//MOT8qG5SMIuIiXB9VxgULl8Cyw1B++FxjUlfxUf3jsTCcvM18ggQtZ8Q/lXMNKWvzdFftU/KZ09Rqcz+qNpZdCXOx+sYAjYcXVPW/4yqBek3wmV5X3Ba2AHJuWAhf/1xsO+hYZNsOob7yI1wb5RJ5rGTex9PGb4CAZNPPtH620dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDOk0Br0mF1w3Gc21qQe/Fe5zaNIj91+alFgSMSZr2M=;
 b=gvwBoboU3kNzECLCWgtckiul+sIGpgtQ2oKGTvvy3aUuth+wOLzkSvM5l+24smMUSQt8p29Dx56sqO3vwqJnaVUOOIuzZQ0K7h8+3Bp/VlAS9TgQ7wTlMG7/r/1WnNspwGSI+lZshPnMbHNpoyrVl8veEtYPhpZ8aWouypvT15o=
Received: from BY3PR05CA0020.namprd05.prod.outlook.com (2603:10b6:a03:254::25)
 by SJ5PPF6A2C0CCA1.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 21:48:15 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:254:cafe::9) by BY3PR05CA0020.outlook.office365.com
 (2603:10b6:a03:254::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.5 via Frontend Transport; Wed, 9
 Sep 2026 21:48:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Wed, 9 Sep 2026 21:48:13 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:45 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 16:47:45 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Lli0N1072162;
	Wed, 9 Sep 2026 16:47:44 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Garrett
 Giordano" <ggiordano@phytec.com>,
        Wadim Egorov <w.egorov@phytec.de>,
        "Robert
 Nelson" <robertcnelson@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        "Nora
 Schiffer" <nora.schiffer@ew.tq-group.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>
Subject: [PATCH v4 10/15] arm64: dts: ti: k3-am625-sk-common: Set eMMC clock pin as OUTPUT
Date: Wed, 9 Sep 2026 16:47:38 -0500
Message-ID: <20260909214743.899477-11-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909214743.899477-1-jm@ti.com>
References: <20260909214743.899477-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|SJ5PPF6A2C0CCA1:EE_
X-MS-Office365-Filtering-Correlation-Id: f6523510-05f5-4e47-057a-08df0ebc0c78
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|7416014|36860700016|3023799007|56012099006|10067099003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	szOYCJ5Y/1BBAAH7uTAUuULA3+Bzjrow0Dy7nqFz2kVYBNibMYOklp8ZHv6YqoXKEIEpCHur+aBx/Ji2YjeT6Dao/3gqEpFVf7k0xvr0egDkjv8tA0Z3xSryS6hzpirce+I/xAvGbHNOx91h/CapkXJ18NjXeqyn6cP8E0EvEWEAZBz2/niQ+PDpXRV/Jercm4ECeSzOSF4wdAriJ9BxZ3V7JwVYY+BCThlthsNK//eI9Fw5uCMYiTTMqLKuF5Sn7cR3cqWT/oT55C/9C/DhZM4tXTbCq0WjZwhhELfO6GfiDxpTrg0v8Mb42tL6Tmca6wySA/TMsBbJ8erNBMO1NoHpiRuZAFfGO79BK4dzUZeyT/MOBmml1QlPemdP025moqHYWF2pzy+uClWOIBjzG2CZvENRztucmDViBkA61Hf9qrjfy/Apn1zk09uBqxTzJdiGwWLeRnXvMALJUo7OqOcvnrDRbmex65qoClxkCM9coVpvr6Nr/nZ0MKAt0qscoAwa5GyaBwFXsJrJyo7LPrFi27FUq7mfcRBGqlATPnrYnqW7yNB4eOXr1FAEC7xhlvCsLkF56k+NaDrMQc+0PQcG7myOO4V4W6wh5qF1BPufPnX2KzKLcmuPU56b87+CWpHz5ufyD/j0lWBLkRE+tUKOed0w4hIP4OjVgh1gVCg6zdbH7yRP7NxnzXryCF6HGoQNnhJgAETTuOtfkbnbAQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(7416014)(36860700016)(3023799007)(56012099006)(10067099003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9Xbt6PFpr1xWNNk1mmlz3Et5b0tIiUXDU+YtXLIXm7Nkxc9/6mgiJaqskGp0PCRNJ8Vi30l1ftOeuzGEE9sch5GswSnyY3WnYOe0Cc1DmCfL3Szs0dwG9Qvlw/MRPhOY6yckeMBm0wPljYLcFD5wKOZ4Fl+up9IQsCVEusOJwsXIPqoW8ofXqSfiEMvVcfVWNcEebbWWlxEMmzJa6/ic1dpO8PO/6KnKddqtlOsGQ5MoBDzmUXr6nBhAuRErX4rxF4dVx1dDpAqzPqNR850M0Tlbxf/3etPyTyPUlTk2DAUlccxzDprd3Ab0eh/my35KikCYnmMa+Ggtw3uPpvcOUbTALzyBpDbSGICKgj6pdUiIosH9PGt0LLqkNktfOgPEnpjjrOjyy2fjTS+eNlvc8kiAd5Ne549o7Dg6ukL8nS+s41RDPgAVtuUyEYXVOlB0
X-Exchange-RoutingPolicyChecked:
	ft2k9I2Eu9lVRbfih9odndiNGHWukzThPruKCFVN6oWz4NJ6CdveEhfqLdT0XY+ivK8c1qe1ycGUqrq1+c8ZsOF8RCMyXybW73Pi2/Dauh5XHahOipp/RWPkkCjSYpdD/i82HITGrXQ2dPn/G2W6qkwaCbARokExFK9TVDqvAs+Hso/R1OJjU+d25CAWlgqn9nHGvDmDqBprfBOKRsV3t/+g7ROC+XT6mIYkd0l3yVQt5+QvDLfUzqaINlsmpUnyK4HkoJ84GWXei1A7UaGbdldg+/O+6SxTuEHuk2aFuhJzr1T17IMdHr8O7jTn5M2W9rQjilNilj5uX9bUkpfirw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:48:13.4436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6523510-05f5-4e47-057a-08df0ebc0c78
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6A2C0CCA1
X-Authority-Analysis: v=2.4 cv=MpPHeGae c=1 sm=1 tr=0 ts=6aa1d422 cx=c_pps
 a=oQiTq6cBShE1BE+bdGc2Dw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=RRG0x_nvXIUYq33IBzYA:9
X-Proofpoint-ORIG-GUID: QnYdMFI2AbL7zjI4tbABSfQV8Dm1z4NM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX8OnVJhKPkDXw
 6jI9pr0YBIewI+FHRP0nn3MWJebG6glk/WSrNVYGh5ubiXNhJO8dtqam4B1pPCoqS4tta/phOqW
 5mvVYbHM3iAlWZIU9zmP/yFylZ56+0I=
X-Proofpoint-GUID: QnYdMFI2AbL7zjI4tbABSfQV8Dm1z4NM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfXwWpW+YmVjOkG
 s+Tu6R+wmD+mx2j5Zk1SmFjkSoS8UqLJmfJ1A3KZlh4ec2gn3hHscdaYo6cPxznzJkgIdu9ERvt
 DTXX0LvUQ8yU5Fp3yV3U99OH3oqEKFX+aopbrAanVdgBYFgRkiGHIbPxBlsu8z6YGm289dBlCqm
 pRA2MEqkt335v3yCvAnQfO0mRDd3hRe2TsJ9BO6CYDQ18QQSmTvwHGLbPB5OEnQQOtWh5HO9kYO
 kh9E6mOS1bZDUmcYVmKcHaemzstLybbHIiVhCDHSVRGR72hvkD1nS7L2/d/cUXGf5NDlbskaFq9
 hn4FVhh0F9HV2NjX593HpZGasLs9lJgd9O+to+N7DMUP+ecYLl0MSbymfLoZZHCs2Zb+CpRb2bU
 oszcT58Ij/OuqJqWCt7LhDCX2FezD0hQLouBbfAiNg3zw4QkKT372TZemnN/0MgRh3FSkPeROwO
 CpsmGchLp6iTCoEStVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090244

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

[0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals

Fixes: d19a66ae488a ("arm64: dts: ti: k3-am625-sk: Enable on board peripherals")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
index 9c83626826453..085b067d96fbb 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
@@ -98,7 +98,7 @@ main_mmc0_pins_default: main-mmc0-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62X_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62X_IOPAD(0x218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */
 			AM62X_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62X_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
 			AM62X_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
-- 
2.34.1

