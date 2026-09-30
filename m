Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazon11010064.outbound.protection.outlook.com [52.101.188.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C1D3F5BFC;
	Wed, 30 Sep 2026 21:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.188.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803479; cv=fail; b=PxYGRxF59UM6J/9r2E5GzOUyY/JXs1kBRmcgYCqCCCxeddwu8tCnjKcC/rjl/Xxf++SYSSlH/m8Opu8JJtiv+171R0f8d9QYGqPJLqYHb4JMmzKb5UgFp/MQUKkPSRWN7P5oGFo85ZFt91mEKd5DmF/lMJmRIX3t8JaKEO7JWL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803479; c=relaxed/simple;
	bh=2q/z+rPOw1Sti2xkTwMOlVqpkvAzyotTv8AAi28z6Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S+nXH7NxgInjEupXD6i9vV/GRNO3CvW+fqo1OHG9GhS2URbHsk5jaOYpcBX49w6n4uyRWbvAsanccToJSCUwXw1BUr7wCpFojlE79msFA6M5t88oV3ep7WeDDbIViYn0YBT+YFZrk8lgDA9hxhS0d44VsSIz5DGAHJHYhHdiQt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=nZKMP8IE; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=nZKMP8IE; arc=fail smtp.client-ip=52.101.188.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="nZKMP8IE";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="nZKMP8IE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLAZPPn/ciIhQl5N1OmJovs6J2lkrYwYOFO5H81T/bGozngHSCw92VcOi9Kos67MfmsxYUMopyDyEiDwAnJIK/7xLhwL5z6WAugkdgOCHrRO7NSpE92rpSGg1GvmeYQ3W91vaalWer8/vMwmhLpcy58xhObH1BbszqArlUDfdkofKSowBQFNd2UWesXm+1dfM9D33ihoEF3nsWtXc22dSAixbN4zE70O/68TCzRMYAZ60oEjx+TaCMuIEhoacqv/hhMZgi7fPbcgwSzh1ndjXpXSXyA7eRBnNJVjeB+vA93ioRoWEvU5NheLE/SFlclJ4+H2kbZAXcYAzej2XMY9eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5U7vHCSklMIe+qooQWw2Jmkc23yS+HsiJc4ksNSEVNQ=;
 b=umU3w5rGrihG2+d43pWIXk6tBBJt570puLFu2rNrYovw8bvgvkhbqhPKW3x4q5FxFpoop3LAlY4RtIe9DJcwrxdMdak+qIDNdxB5bkJMGtQHXH3YjodTzDdInS7T4+9wary0Dx8b0TBHW3piiI6yrqMEoCnqJcoj7SbCl0WWN5ncRBHTXBErk643sNWCUSF27VppnjL5hChOBj51ZGibVKrA5ow3u8BjKKaun+WbM16lmujhusX6vXN+J4uEapH63uGIKpFGk5Y9xpG05WuM2ryIrIjwm4zCWlzIVFOAnmSWhhp8AGew0fmTG/w0cDMnsIX+xkMHA/ia3iTvPobAUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 51.107.2.244) smtp.rcpttodomain=gmail.com smtp.mailfrom=cern.ch; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=cern.ch; dkim=pass
 (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5U7vHCSklMIe+qooQWw2Jmkc23yS+HsiJc4ksNSEVNQ=;
 b=nZKMP8IEAN7LvkID8AUy9o6+2+kLw27XUgz7iGdIeZK9ycvhusnOMb6KPQSGgwXrv75MJ26YQtTF4Lp93IXZLRLA8rVbfyIUXxuH+mSsbAkCuO9oYPB8zxF2oqHKOi9NKi74Pgs6uLYkz6u1cNmHERnPXW54LhxmnD0bJgWuZoo=
Received: from AM9P193CA0008.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::13)
 by ZR1P278MB2245.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:be::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 21:24:31 +0000
Received: from AM7PEPF00000050.EURPRD83.prod.outlook.com
 (2603:10a6:20b:21e:cafe::8b) by AM9P193CA0008.outlook.office365.com
 (2603:10a6:20b:21e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 21:24:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 51.107.2.244) smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 51.107.2.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=51.107.2.244; helo=mx2.crn.activeguard.cloud; pr=C
Received: from mx2.crn.activeguard.cloud (51.107.2.244) by
 AM7PEPF00000050.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.3
 via Frontend Transport; Wed, 30 Sep 2026 21:24:31 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=nZKMP8IE
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011027.outbound.protection.outlook.com [40.93.85.27])
	by mx2.crn.activeguard.cloud (Postfix) with ESMTPS id 95C477F37B;
	Wed, 30 Sep 2026 23:24:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5U7vHCSklMIe+qooQWw2Jmkc23yS+HsiJc4ksNSEVNQ=;
 b=nZKMP8IEAN7LvkID8AUy9o6+2+kLw27XUgz7iGdIeZK9ycvhusnOMb6KPQSGgwXrv75MJ26YQtTF4Lp93IXZLRLA8rVbfyIUXxuH+mSsbAkCuO9oYPB8zxF2oqHKOi9NKi74Pgs6uLYkz6u1cNmHERnPXW54LhxmnD0bJgWuZoo=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by ZR5P278MB2072.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 21:24:28 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%5]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 21:24:28 +0000
From: Maxim Storetvedt <mstoretv@cern.ch>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: kapenekakis@gmail.com,
	marcus@nazgul.ch,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	abel.vesa@oss.qualcomm.com,
	johan@kernel.org,
	konradybcio@kernel.org,
	kirill@korins.ky
Subject: [PATCH v8 1/3] dt-bindings: arm: Add Samsung Galaxy Book4 Edge
Date: Wed, 30 Sep 2026 23:24:02 +0200
Message-ID: <20260930212421.4810-2-mstoretv@cern.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930212421.4810-1-mstoretv@cern.ch>
References: <20260930212421.4810-1-mstoretv@cern.ch>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0214.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::9) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|ZR5P278MB2072:EE_|AM7PEPF00000050:EE_|ZR1P278MB2245:EE_
X-MS-Office365-Filtering-Correlation-Id: 80d9b1b7-4bb8-4896-3929-08df1f39377f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|786006|366016|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 sBQQuWWWjxUYF/csfNKMoqBYjqaBoxkZ7jMRxOMh+nl0Ve2lJfFBlM362ywaa6rvP+WfK5JjgFBd/QpMWGAd7jOde1NqIjnqEBU67ADtYq22hDw1HJoY+hmGKzDJZmRLKwbWEtCMjnfxPusEMBMclgySMQ9/Xr59KI02vtveaOhUDIBwVvq4x4PZ+fRMcneKAYxJtINprM0XjgNZq01At6fbDuaY7CzbufVTXVaxSY0JkMcTRji1p0rkS3AXBx+GX+xMJsS1rydkWGEp1fiMih0EUlepmaNPDyRKrP/uXu0ZC8ghyueYlcs5hFEXnTggbowggouHtBcZvwFw8ENq7CYwpWZHohOs6YRzp5Uft0nc/p+a0AZQU8Jav8JTnYr0PAl5qPnh8wtByNjIZKBQ1xMnOWKS1igwmCoobBDAeEgxx3xlvJ7MTMlvKdK06zpbXiYJnZCQGSlf0MNWpILzePJpMVc/nIXRzc3u+rxcHvgW9gIO4+vqRdahhSAsUbi/rqmxmJtYgTumCdIRMpFR1S199ul9NtWEIG4KZzl6RW80IbKsGr/imOdnqIxGEN9H5vJ419UFR1fu6+N4kkTYCLeFiCZ6hvOshEIpm3A93Xs/RmTTiBvkNMYWw5vcMIXWMX+9xda0b7dmfXXwxNqMCQBxSadBAyidPeEzl6Edpsg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(786006)(366016)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 pZ5Xc3P58DsY+1XxxSVf99DLtZt6djWHF3DKzHcjFb1KOtzBHacJW3VUZdXG8nk4074WVg57U5PePMSnPa8/DIPzsRSpk65yJQTin7bCaD2tY5jB8Y+MiWo/ygbQsWzFVt/aBRyy3vjZZZp7fOqEIDpzDP+Rzq90B4NLxxXrnwkXP7785VR4ic3tBYx4WksL0yFZArSitPAA0WuUEtw2uRnZ0CqR47//MomvmdX9+4SMsDChb6BVfRTF6Ksm7kt9G/Cy4SXR5yINmL1NTq13/XgkpYdI+oHxQKPzpMavt4zaAvcZ/QcJ9gUdCpXMQLFFUJbhdgLTve8GrxsLeW6lCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR5P278MB2072
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7PEPF00000050.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9bc79436-babf-4ee2-c741-08df1f39357d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|19092799006|1800799024|82310400026|23010399003|30052699003|376014|786006|7416014|36860700016|14060799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sOpsYRh58qTqwbGDBfSe9zrqX9laaGMuIFewb7tV2YcwZ++ztVnnvnxcto8cEDqDbn/xyZUdtGOIOzAmfccm+laHd5ZQo6lz4bU6R4Eq4G6Qhd7O34NMs1OrM/Mwf1uiiUghIXu2ixVEm/pOarx+B2deUUT2z2ex9QbUf0Dmk4uhuiqJHqdL8caK4mXOiOCcHsasEHWO92hXEDPFZFoopIuVqkO5Lmp5x19ojWhZE1OgmNQZkQ6KcXkXvG7ncTV3MKimlI1CIO4a0AQg5wtUqPyMtY3GgSq/4ugEV2BG0DxUHedjjaP9Mg3fOAqH87jF4nF0i1a9FQiqjAyU2QXkgfruTOBwXvlI7exUo+ffsOIzGNCJIISIFOjIrd/TiRAn6riC+EBQT25Gwb05fAeVfd6yZBzc2bsSRRQhYEjy8UhdHIzt5AGUBIjx6qrk68fWiySWpF0+uH6OQgk3H/fyAdOcp1oNnU2n7LTUVSKwSK1nHTOoQZYP9CDCfsY1HlY8cHD6VL7ak+Li8+GAvvOWaPdiXC3ouNu5hm56APmWvoRR9iooZdAqcoQhZDNDnLEpAoNInxD1KNllwQKP6kCteY0sQ+W5YaRHM/r9v8D2qArPLdgV+SPtCTnlL8syfMeYfTHVUUHwLgwu5IwPcWIqPWEu/AbyBc/cn86s2UvtcjA0MhqhF1plhL/4VBc1PulQ28ScOJGsgl9vGxGKtjoRew==
X-Forefront-Antispam-Report:
	CIP:51.107.2.244;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx2.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(19092799006)(1800799024)(82310400026)(23010399003)(30052699003)(376014)(786006)(7416014)(36860700016)(14060799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v8X7IJDilT5qxz11h/sDCyzAGuk6xUh1EgiByJT7ZpHqtA/Y5u6MJF7Hp8EpdHUy1CqJX+yKhgDOZpwuXNAa/+cvrwdPsieH1pe2lZo1ofhLs8bniGLkp7tDwGE1q38VfA0DrsHMErTIvmQGUU95w/4wLI/TsWdLwqpYDuds+2hY96owTee4q5c2DR02S+Vlr7eix3tPQPCsRhsT4B/9dXJ5Gtk3XqaB6SzgXXfFIeAYQZw54DhUNokSzSVyTz38u5RtL4p+r1ov3NvZRcXqXT7gK4MHYWcdAgiMrRfkXV8sPswikISm+J4zIYk0tQYf8o3mAgO0et2AgcijhVas0d3a9jidfXTwA0hpf5R8wXv8jEN1CSngmI/qVcBndnbqe+VOnA1Q9VuIPMbJRIMyEvKjXN8RORWW3HAO/evYp8MIDY7tiFE+KytR8JhShYNu
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 21:24:31.3750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d9b1b7-4bb8-4896-3929-08df1f39377f
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[51.107.2.244];Helo=[mx2.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7PEPF00000050.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB2245

Add the Samsung Galaxy Book4 Edge compatibility bindings

Signed-off-by: Maxim Storetvedt <mstoretv@cern.ch>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index cf9d940f7..439ae9778 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1226,6 +1226,13 @@ properties:
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - samsung,galaxy-book4-edge-14
+              - samsung,galaxy-book4-edge-16
+          - const: samsung,galaxy-book4-edge
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - qcom,hamoa-iot-evk
-- 
2.43.0

