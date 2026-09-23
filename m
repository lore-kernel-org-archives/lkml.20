Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EE540DB4C;
	Wed, 23 Sep 2026 19:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191707; cv=fail; b=m6hrTFRQ7hJ22zboEiB37oVZ58hIydGkJhr0JNiKK/tS6j4f29pxofHF7TeZziQT4q2J+FHXkJLmSpCghleOpNKNz8/cpn4pOTC4GVR+mI4JxTUq8kj/R97ZQlEk+gQuJrdBNB6Cvg3TBJk6WMKZaRKZAnhXvWgPxJjf4Ey1B9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191707; c=relaxed/simple;
	bh=llXWu7Dy8wP68vGNkr38/Uakefix8wwNBeO93qKAyTk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YA9nLVO+ppCupZ2M15YIzdu/0aYvYTiNm+k78Bf+HTcP09HvOqEqt1PTwP+VE2fJrtSBReX6zV4BmIPQSi2Li1kzVwOzRKo141EuQqoGHnQ5NErrTnmkWAPdWgc85kcTKvf//JSaRBMVUy3n//l9JwHx4aHagpF7NrZLlXHGGyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=bDIOz7OC; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=spWUnOcK; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="bDIOz7OC";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="spWUnOcK"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NJOp3o2057756;
	Wed, 23 Sep 2026 14:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=x6V+MLuznbIDYcZFY4UgfC23CLFbquQxxxIn5fl4E
	xU=; b=bDIOz7OCgy7AX52xmN1n+1hTxO3m8yVaq40hi0f40c+7KVSjoDh/97mMs
	Lh7sYsN/9llOHQ/r3zJWTSFHmMiVuFFHPiJAOyHqqgYksWcdxm0KJ/APs4EayKhG
	0eEqe4mQJqqpxgS4dpzSngoEdxMJNPhqj7T3khUUXHA2VYWunkQD3C9pIcGMq9KN
	TEmN1Q+OTR6cNG7ovAzE4VkgNJgBndHQy1LEDYJzHswI6mwug9UjNBUQEE64aw/5
	Zu9pXK0JK0nYx/L9aVjjEEVrmSrWd+rij1b/rr51V3vl0Im1R4BqascpREfM+4UA
	DtQHQPQ37cbbAAhhZ8NdljAOIIqNA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011009.outbound.protection.outlook.com [52.101.62.9])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycxwv6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 14:28:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPwj3nMoqqB0MhNW6iBFXxM+K8CLrfP3WaU4+/Qc3MzxD3BIDGeqsbsfI54TrP7otz0yiKizfWvEk2hdUYD9JW3jpyznQCYx6GI0M6MO1xy6zdd9XWNLx3U6UnUrVPmCitjqm+Y2F9qpgfclxWo9lMamcGnowlkS1NnG3Ne6R/PDlabJ6LIRmpNtpJ6EEocYfrNowtOIgJRcbIb6qN7IGESE2of1YgFfTc+IJ9GoerT9IhbbtEvgMxYnp+SFZ/7LS6FijtHwTZ5QoUWKx7zgxdIuxD3XYeAT08mqqoLqV+TRmjEBjWPKALrrKlMmlGMYx7HrcKmzTsZUzq6ZHuBKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6V+MLuznbIDYcZFY4UgfC23CLFbquQxxxIn5fl4ExU=;
 b=cO4HGCYwocTvk+ZhZSu0heMWbpWqKQYq2Qc0t8UDGAbzyKK6UfGtJYNggFYpw0B7ZcjcwUk287Oa0XVeuHYkwDZXOZ/besUSzB3GlxI4bky1n/geneMtzH9TapcFTjJ7IC3b41VI2I6czEvOvxjUgv0F/ZxwGoYIk4ct2AWPeqqF/jUVGADLSka2RrTkwGC12s80DRXC/jKYi5HQqrSB84c8cd7zNkvgTklm1i6CdXdehbL5Yn6zQqcUHGUbnqtxtWQQueIkxnCABBRtvn0xbjYj0NIkK2kfKNHIoI9k34VneMGosDilxtZP5g60ZOJtaaBZK+f7/TDhXVYSwLDy1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6V+MLuznbIDYcZFY4UgfC23CLFbquQxxxIn5fl4ExU=;
 b=spWUnOcKwYHRPTtmAZS1e/lcJZHjb8q3OLjE21SeDHXcyKIHBMH0PVegwVMF4+eSQNQrImnGWDuIF4UulPGINIAzQ33LMoUc7FeayGqgX/2/0uoGcg9j37yrd0PoYGSn8i0LUvGI166ZcYEB78PqIc4nCss++XBGKz42xN+Qa3w=
Received: from CH0PR04CA0028.namprd04.prod.outlook.com (2603:10b6:610:76::33)
 by SJ5PPF8CB762A0C.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 19:27:11 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::36) by CH0PR04CA0028.outlook.office365.com
 (2603:10b6:610:76::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 19:27:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 19:27:11 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 14:26:58 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 14:26:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 14:26:58 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NJQiX12642017;
	Wed, 23 Sep 2026 14:26:54 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <sebin.francis@ti.com>, <praneeth@ti.com>,
        <u-kumar1@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <s-jain1@ti.com>
Subject: [PATCH v5 2/2] arm64: dts: ti: k3-am62l3-evm: Add HDMI support
Date: Thu, 24 Sep 2026 00:56:43 +0530
Message-ID: <20260923192643.1362891-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923192643.1362891-1-s-jain1@ti.com>
References: <20260923192643.1362891-1-s-jain1@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|SJ5PPF8CB762A0C:EE_
X-MS-Office365-Filtering-Correlation-Id: bfd47039-e4d3-43e2-91a9-08df19a8aa54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|6133799003|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9NIoXb7YSFf5z8WsMHxvz2/4e3cnbaOiH/O+MRXhPCgF4MrQ6kjFBCMze8G8E7YAUEzCT2EribvW4qNFycHQ442+OnypNAQdLfkWosgyaN6RJCBAxFWmcfQtY/Vpmusj1jdzKjd4cRdKk8DVb5cI93raYY/GQtg4IsizXXWFLrSXOWXnzpnYERVo4xsWrxYwbTQQcolIbq+MDLbGcDOlx2Or36AfUPisE0lWvdOPpLnLKSw5TmYQkCfikUog5bajfDEjNiQzdJrCeN71Zm3xC3z3P1ZyOHE7SdFkpj3rKBgHOIfhzFR8iNVpe80KXLdxRbyDKlM2syeC4keYnZNDgYliZBjo1fFakSJBwCgUcQ+YB+KqDVT70P+QG5g1XUXH+Up+3U34uDKsFjRWFs/kv37NW4Z6l/ALtL604GMEI9SckAZMLMP0+QlCwKnRMNDSzfcMz9tvmt4ZAotF4R1jvetfvuLp7QynuW144wngO8CEUxSzzMyAO7nKPTXchHvjcZma1XYdl8lEJFcS+xm+nUhsZVJUrrMa6sVPjB6m7ZggpnuFAUYYLlFGXKpsgNL+TgP6p0V9lQjSALhWdWGdIweyHyUQD95z7Ahl0i7ghWdDqEf7l9issUQ9SB7EnmJ2qhw0iT/v5vmx7nly0q8Esx0r2jSpdKs8CZkRPVlsmdyiYgH3iN/l2lMsHf3JUYmiH5Q+HiKhKo0ZiIrwYcNY1A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(6133799003)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	82XQyKUVECJG630dj5ZvjUSc/VeHLVemNkKKiAe2g+udGX7jAj+bYiXnuIlrd+K1dZOP1HIcfTLlEKqPl1y+UIBdM1xLxCEPbN7kTpdFLvXWcYDll1x6qoldWyu+9Mrc1M6o5HQACU9U3218H1azumfIIMg7uNZVxcp2gqVTrVSVbOFVasYoMeXYeimjo0c/c55k6Y0Emj8DiKG515UZCrlAoTRAM5J/sWwL3YIF7ldj4CylZmrOmt315IVOekIDBc1JayTu7fiiUsvpctYSYBwjuh9AG4Cz0tiqngUNAtW2YkKurotdUbGlbz20K7Yrg4REwRoPtK3mhFdCuAydfyWiH30Ob6sOK2gDVfS+/UL+3CxtXyUZzyEkm1OQSi7CVaq5Hva8wSDbjqHE1LJSecT5JoNl1HmMYrOGrNuzhnAmOfO5KdcWIC4yOo+yjvnY
X-Exchange-RoutingPolicyChecked:
	ErIfYCq6uHrNzkawDE0CMxcISw9R+ZVxcmo9iwcUTr5vsJqe9nmSfBlEl5s8qK+XfH3lpHxBYKOQdwZgruuxuJt4ouSsczvQnLwGzFTENQlKywVPhj1Wiqpg6IZGazUdnkeHhpL94r6zz8hIifE8yWWK8g7BDgv9FY/g4NEhFoh68Zdv1lmFhnYyyaAgsfuzHldfxI6dRvtueQaLFz7Kox7ZxYWHpytT3d7rbtrGV3kBdWKY+muHrTAo/cK6GjQo6ALlns5PHLDQMOehZyPqUkc5EcLJm9IDaypf9sqoSNmXueeejgyih6K3EZ+JZAd4GoO8cqwVzKC7HDLXsofOTQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 19:27:11.1888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd47039-e4d3-43e2-91a9-08df19a8aa54
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8CB762A0C
X-Proofpoint-GUID: hbIxTRUf5QEf4Af9MAI2A5bAjXbO-N3Y
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab42853 cx=c_pps
 a=2InGsGVdz7DAox/zTLSmPw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=P1BnusSwAAAA:8
 a=XN_kXfgHb_U3ERm4QNkA:9 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfX1ptRPM9voUKA
 mZfViDnJFefGOUt96MwKVvgszlQMa3WYGVH4ny5E6JFZ7yBZKzGhEFIMeDKfvtdyNcA93n1I+op
 GGTj73lYsQm0/3I4A6O8o85IowcT1IPyZOaCRag1vL/eVMR2bmvhw814xoyEK3LcAMJ/gD5aIdi
 +LsFo9FVgmZESc6WBJ5IPJrgSg14jZ/z6e252vKPmPj+V5oX+19PTQ9qDHZso/M1Da2n+Shse9C
 7sEZfDI1GiVM2FNGglJ+waY4a0Ji3FX9bURqvIvxlCLy2zuGRVcG3Gvx7BGF2s1lFJDhBaKoY/B
 38eUar/jIiaxW8WVUQSR3bnrbbwjl1tUSg7IaDSuazrzK9iId1+D9pPw9YdpUB87TI1H5XJtNJJ
 TOUi8HWOA84Ucj5Cu7m/jk8kZvUdOT4PgTCQ3COkixPRKWOScSzXhFqTL4NeD+kCZCExlDAr5cL
 dHlIDDY1cSsPZ5tt8AQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfXzsivfOk+76If
 MFS351kzqMe3xwfgBt2P7WLSvnsjnC0Xjq+86zAsfPsR7nYCriPkhY7xn3367c3IZBuuyjmudWC
 UH4pmE0clRTUR/5jV7cljr6NQ6QeyLI=
X-Proofpoint-ORIG-GUID: hbIxTRUf5QEf4Af9MAI2A5bAjXbO-N3Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230077

From: Devarsh Thakkar <devarsht@ti.com>

Add the SII9022 HDMI bridge and HDMI connector nodes, along with the
DPI pinmux configuration connecting VOUT0 to the bridge. Enable the DSS
and hook up its DPI output port to the SII9022 bridge input, and the
bridge output to the HDMI connector.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 106 +++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index 84a0cfaaf196..8ff7c4baaadb 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -44,6 +44,22 @@ usr: button-usr {
 		};
 	};
 
+	hdmi0: connector-hdmi {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+		bootph-all;
+
+		port {
+			bootph-all;
+
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&sii9022_out>;
+				bootph-all;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -192,6 +208,41 @@ exp2: gpio@23 {
 		bootph-all;
 	};
 
+	sii9022: bridge-hdmi@3b {
+		compatible = "sil,sii9022";
+		reg = <0x3b>;
+		interrupt-parent = <&exp1>;
+		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
+		#sound-dai-cells = <0>;
+		sil,i2s-data-lanes = < 0 >;
+		bootph-all;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			bootph-all;
+
+			port@0 {
+				reg = <0>;
+				bootph-all;
+
+				sii9022_in: endpoint {
+					remote-endpoint = <&dpi_out>;
+					bootph-all;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				bootph-all;
+
+				sii9022_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+					bootph-all;
+				};
+			};
+		};
+	};
 };
 
 &i2c2 {
@@ -221,6 +272,41 @@ usb_con_hs: endpoint {
 };
 
 &pmx0 {
+	dpi_pins_default: dpi-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x00e4, PIN_OUTPUT, 1) /* (L20) GPMC0_CSn0.VOUT0_VSYNC */
+			AM62LX_IOPAD(0x00dc, PIN_OUTPUT, 1) /* (N21) GPMC0_WPn.VOUT0_HSYNC */
+			AM62LX_IOPAD(0x00e8, PIN_OUTPUT, 1) /* (L19) GPMC0_CSn1.VOUT0_PCLK */
+			AM62LX_IOPAD(0x00e0, PIN_OUTPUT, 1) /* (M21) GPMC0_DIR.VOUT0_DE */
+			AM62LX_IOPAD(0x0078, PIN_OUTPUT, 1) /* (L22) GPMC0_AD0.VOUT0_DATA0 */
+			AM62LX_IOPAD(0x007c, PIN_OUTPUT, 1) /* (L23) GPMC0_AD1.VOUT0_DATA1 */
+			AM62LX_IOPAD(0x0080, PIN_OUTPUT, 1) /* (K22) GPMC0_AD2.VOUT0_DATA2 */
+			AM62LX_IOPAD(0x0084, PIN_OUTPUT, 1) /* (J23) GPMC0_AD3.VOUT0_DATA3 */
+			AM62LX_IOPAD(0x0088, PIN_OUTPUT, 1) /* (K23) GPMC0_AD4.VOUT0_DATA4 */
+			AM62LX_IOPAD(0x008c, PIN_OUTPUT, 1) /* (H22) GPMC0_AD5.VOUT0_DATA5 */
+			AM62LX_IOPAD(0x0090, PIN_OUTPUT, 1) /* (H23) GPMC0_AD6.VOUT0_DATA6 */
+			AM62LX_IOPAD(0x0094, PIN_OUTPUT, 1) /* (J22) GPMC0_AD7.VOUT0_DATA7 */
+			AM62LX_IOPAD(0x0098, PIN_OUTPUT, 1) /* (H19) GPMC0_AD8.VOUT0_DATA8 */
+			AM62LX_IOPAD(0x009c, PIN_OUTPUT, 1) /* (H20) GPMC0_AD9.VOUT0_DATA9 */
+			AM62LX_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (H21) GPMC0_AD10.VOUT0_DATA10 */
+			AM62LX_IOPAD(0x00a4, PIN_OUTPUT, 1) /* (H18) GPMC0_AD11.VOUT0_DATA11 */
+			AM62LX_IOPAD(0x00a8, PIN_OUTPUT, 1) /* (G23) GPMC0_AD12.VOUT0_DATA12 */
+			AM62LX_IOPAD(0x00ac, PIN_OUTPUT, 1) /* (G22) GPMC0_AD13.VOUT0_DATA13 */
+			AM62LX_IOPAD(0x00b0, PIN_OUTPUT, 1) /* (F22) GPMC0_AD14.VOUT0_DATA14 */
+			AM62LX_IOPAD(0x00b4, PIN_OUTPUT, 1) /* (F23) GPMC0_AD15.VOUT0_DATA15 */
+			AM62LX_IOPAD(0x00b8, PIN_OUTPUT, 1) /* (L21) GPMC0_CLK.VOUT0_DATA16 */
+			AM62LX_IOPAD(0x00c0, PIN_OUTPUT, 1) /* (N19) GPMC0_ADVn_ALE.VOUT0_DATA17 */
+			AM62LX_IOPAD(0x00c4, PIN_OUTPUT, 1) /* (N20) GPMC0_OEn_REn.VOUT0_DATA18 */
+			AM62LX_IOPAD(0x00c8, PIN_OUTPUT, 1) /* (M19) GPMC0_WEn.VOUT0_DATA19 */
+			AM62LX_IOPAD(0x00cc, PIN_OUTPUT, 1) /* (P23) GPMC0_BE0n_CLE.VOUT0_DATA20 */
+			AM62LX_IOPAD(0x00d0, PIN_OUTPUT, 1) /* (P22) GPMC0_BE1n.VOUT0_DATA21 */
+			AM62LX_IOPAD(0x00d4, PIN_OUTPUT, 1) /* (N23) GPMC0_WAIT0.VOUT0_DATA22 */
+			AM62LX_IOPAD(0x00d8, PIN_OUTPUT, 1) /* (N22) GPMC0_WAIT1.VOUT0_DATA23 */
+			AM62LX_IOPAD(0x00ec, PIN_INPUT,  5) /* (M23) GPMC0_CSn2.VOUT0_EXTPCLKIN */
+		>;
+		bootph-all;
+	};
+
 	gpio0_ioexp_intr_pins_default: gpio0-ioexp-intr-default-pins {
 		pinctrl-single,pins = <
 			AM62LX_IOPAD(0x01b0, PIN_INPUT, 7) /* (B12) SPI0_D1.GPIO0_91 */
@@ -321,6 +407,26 @@ AM62LX_IOPAD(0x0004, PIN_OUTPUT, 0) /* (AA23) WKUP_UART0_TXD */
 	};
 };
 
+&dss {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&dpi_pins_default>;
+	bootph-all;
+};
+
+&dss_ports {
+	/* VP1: DPI Output */
+	port@0 {
+		reg = <0>;
+		bootph-all;
+
+		dpi_out: endpoint {
+			remote-endpoint = <&sii9022_in>;
+			bootph-all;
+		};
+	};
+};
+
 &sdhci0 {
 	/* eMMC */
 	pinctrl-names = "default";
