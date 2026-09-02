Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BF44AEBE9;
	Wed,  2 Sep 2026 22:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388130; cv=fail; b=I/MKOV4McmkNjN5IRgCz+7DlMwd5yVfLdlXtwLeTz0ASKW2ry6Ib6fdZn4CVYaIfIF9QhJ+Nf7oZYnUvLG72JU3J3x2dkvsLAXnnfkktLHNTyrnxZsplL2YBDeaJlOwFlRjz6NRHLJA5i8lOi2aOdGVeMBW4hzU+s7MveccF2fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388130; c=relaxed/simple;
	bh=1MfeUONIsip8Yu3UGerF8RPLeRoXt0lR1C2S8I7Kh/s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mhucTdjuWEMGmcIYk8Z9GCVpvFqFkdH40lfR+6wFwwvlV6m9KKnHaZhAV+kxQ5aUS3upAi2vHrFusKGbiCcxNgbyhIhK/7JRoThDGnXIrv9fyC4TnMb8IfKw9p46IenqXkPOuCd3DIs9BdizXIZiQ8WFlUQtMjAX9MT0VpciGnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=PnuInwdC; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ggin8LbL; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="PnuInwdC";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ggin8LbL"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 682KH4jr3234082;
	Wed, 2 Sep 2026 17:28:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=kP2m4kTDnVnqGcitcc6gv34A31mmRQ6wetdrylneW
	3E=; b=PnuInwdCqlzmlh8xnhLPBxLrAGOsS34pZe6JTBMv/Zhp5+nY/B0eNK4KM
	jYPaeTWxjIPzOhdYJT4CJmj165EYzXbUwl78e0XtVWD0nMawKGdLUUTsMspKkNEG
	0h+hsGRcIS47UxjrsZ3k+fwUXJCmAhu/3bnHfCs2T8sSoYSWue8F7Uk0nJeMdw+x
	lAM1u4HJrD5cb/vZGqEDqzyDYX9A8kVnNTR/m0va/XMHqRzdVR0hf/tfJ81gy8P7
	efm+a5TQmygz0NxyprLfKlt4zuj1deJpc+bTdFaIMytkI4RXORiB2RPunC6ji06O
	/gn8LD8kRKmT2uB3modBgaN9PmVVw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013040.outbound.protection.outlook.com [40.93.196.40])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ge7gqfu4n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 17:28:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfO8IoDuHWmePnrUPZ5kix77/dpoq4jf3wwMnwJJChBGnZQfNGZ4TFaoabjyEZC3Wop2S46+TL7XEUBOzsnJwUt7YJmjqGkqIN9mxuunRLr0O17+r2oxFRmbZ68TSzigBKJq02lEeSjjuEmsU7ls1hDVXclbSM2noo97mmFYOpMkiiRKEkZ6Rvpek+bPNDe70OJZQAp67qHHg0xT7m4sc6HPTNvEPpWqYca4lWuS0FZa8DcEOmZGHKJKPpqjFeX5jUpgAmUkBun3lTHCS/MT+uOvyPv5kV2/O0QBEweVfVKPAF1qep/raY7t3UPs0hFUJ/odcDAepzNid1uCP/jVzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kP2m4kTDnVnqGcitcc6gv34A31mmRQ6wetdrylneW3E=;
 b=HzMBOPkRsn5OFbSg4OAIhv9hv6+Palgw8Ct+rMwLH5MJNvaP+7BlO0wceR27RwSslZGaCHwocyiEOjAFPUJ4Vk6envav/+Ra0httO+WT3LJOO/brT5AJ1ArS0Xpm2Y8d/pUSPY6oIXktF3EN0bl13cYJrHXHNIXDV0s+D48eukAtT4JJfKSYLbo+Jtz2UWMySAAsUmGJpWb0qE3f1K+p2nbWCr23oDue6NQLjgQaui3aG8lCIwjcBrqIAr7Zek5DGGD2w/zhsheEhVSIQ/pYVdDkR+lVcbKcC7JNbgC5xSjgE1XUumc2ICBatfXRto37IIPhuftfS86mk/kdEJ18Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kP2m4kTDnVnqGcitcc6gv34A31mmRQ6wetdrylneW3E=;
 b=ggin8LbLLxGNHYUG3q/zDRXP0jnEU/uPtvHumES4ZMZSg7lJ4TI/B/p5oOKrJP/6RQLO2It9S1svaAKiq6pHflBXHCHafRTXt5z2Cu+i7duvkJbEy+Hc/Z5rr+fauWti11DKjNtgqlVnP6tqp/9tq1T5Ez0fPrHm5nQDbqgdlpU=
Received: from PH7PR17CA0009.namprd17.prod.outlook.com (2603:10b6:510:324::17)
 by CO1PR10MB4673.namprd10.prod.outlook.com (2603:10b6:303:91::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 22:28:36 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:510:324:cafe::17) by PH7PR17CA0009.outlook.office365.com
 (2603:10b6:510:324::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 22:28:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 22:28:32 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 17:27:59 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 17:27:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 17:27:59 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682MRxUP1403959;
	Wed, 2 Sep 2026 17:27:59 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Srinivas Kandagatla <srini@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
Date: Wed, 2 Sep 2026 17:27:57 -0500
Message-ID: <20260902222759.736124-2-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902222759.736124-1-jm@ti.com>
References: <20260902222759.736124-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|CO1PR10MB4673:EE_
X-MS-Office365-Filtering-Correlation-Id: 164d1fe8-c437-4fb8-5293-08df0941858c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	O23f7UNB0HFg0DjjkK1EhHkMeHRjGfdRC/ahjbPPclif0isVCIVvb7fPB3In5m1Wwe0ALXGduh1Ivanagsx65Hh+IHqhbeI9VmG9pyrdNrdIoGhdb3vHlmFst7/sgNokz6ZUuMz6xkYl6/2RK9tz+X/Z81KAnqr8QDDh6dsO8GA+4ovUrkbWejC4oc4rh5sGMVjpK/TDHWrg4bpeAlq5taukboH/u2aY73sP4xe6fpsuelJEVQpSN3UUJarezYZKpJ0ZxqQcYOKFPSGS44Ki73/6pNkPsTTSMOyC97P2NIbgki/uGJ2O6J0s3UYNpvb/yDk/PIMiG4G3MHa/xUEkLRym5WbtdqtgeOnKp0S/89sHWg8q5nmPWIK35FuRrQVuDlSLYUgYwy6XL1e78z+d4Z1pNnvTDvsyObb487Q2g5MFO1ClxffzE9UR9Fw8svfimMRFDSJ8HDE+0LYGeqSsSt7S4Dd2IQMNSoBRQMtWKWdqVlhELYYW6H7bGbuIXrhocdRRIFLvdr1ugJ/hNcxDQJG3UY7DkAtvzOanmLxJ0UnmXfjE+ShAFAAQUnEoZheH/b7J+yzhUv2FXEH/0HQinF7EVy1vklZRzv6Xew3gEWEMHqPeMWOwqFEHbippUA9vFhJCjKjAORB72X4uZW1dRU6q/kg6CsiXEhXsQ2RO4c2EdLmXd2tBF7M+FIGQjgv1JYoGO/MqZe4JdjS/4h2wPQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XJo9N5mx7tWNRBrt8gizYbea9JxAGG4HxobzDV3FGZZJ22bnDSvZ9yAJZGNgeSPPoUIhrLQOsx9dGAdRUk4f/yi6/bBGfizSal/mS8sojY2DCqIKKBXH1EPJDaVgzC9iH0SNn9fv7fhyMdrhlBztb0uoy7tJ7Cq+gfqBjOhq/sdUOtt5RRpNImTImsIbukyq4zcKZbUGhPapASyiVAF99lSl/c5MQuGwnhPZoxXbp8T1KsDwff59EdX+7jt8rgQFOdRKUasTSxIo4AMZeziDRgChHS6/7KHAQtJhQLnz+TOKrkLKDj+Mu1V4Kjg05f7g4yXD/pJBdz8QtaRG4g1Imm8ytu6g5NK5iQjDqmMKBTEYJsnyECwr10c7iJBlXEFYbS+5rzNRInPaAEN80ly9Gr1FToXOArLdN2rGrfUXMVrZSXX6aIssXXEk9tKH9h7U
X-Exchange-RoutingPolicyChecked:
	4I/31Up6pm4RRPneW7eQ5AxSkuHDX8W8VY4enhNF9WqpKekjAWMkQ8OZAksZe8yliV13Yk+C2iPJ8rFWiAD7pZVV3jrrhiTlix4F2U2nxgPH8qK1t6TrTQ8JXtwC1mlJXCwyU5BtYOha+rqxNGEM/0XRwRydwlZpeG+PsmB1edDZy8PQw2FGwefNMnf7gXYdYRC4RfvIog/IbzPO4kViGyH3qEHP63JdQcnWKRzYHS7Bi2h/4oemitoGQvTpDhYKw3BcnZAk1xrNugtIthPJe/GhwFFo1jyenkSgHMAwFwsYVOa7V2N4WTZHkNDQIZ/xLNdDb6AzIO3CDmmC+Qj2Ig==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 22:28:32.7256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 164d1fe8-c437-4fb8-5293-08df0941858c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4673
X-Authority-Analysis: v=2.4 cv=fZ6dDUQF c=1 sm=1 tr=0 ts=6a98a317 cx=c_pps
 a=ir2fm1PSN58pTRYNFrLYRQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=JS_-QrVL7TsgScaScJcA:9
X-Proofpoint-GUID: 7hotUSIIMdmoRz1yUFGjU6cIbEZSVv56
X-Proofpoint-ORIG-GUID: 7hotUSIIMdmoRz1yUFGjU6cIbEZSVv56
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE5OSBTYWx0ZWRfX1HOBu2Y9NpR9
 GXk1OGgZQHsowRfWYXQJHD1NIvHyUgkXpsPZA3BGl7mLiYNg5e4pWS7uVpVADugXksZvbDy0PvB
 R0eTnsGw5wVbv9L8VatQmk1Y3fOotas=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE5OSBTYWx0ZWRfXzu2G7NuYx31n
 Z3RQ0vM8A/qRmZ+4IUOnRumYZSnwTAK0tAP0VrD6cM3puaCbr4lOmqhqslbO1XLSeNqGmaesniI
 fDQKaHwaLXgPnUNBPq4Yc96XohvULIiM0Zv7GZ5zHq7saMlqkxO1P7kRz7OhSp0zhxgaBRJLyf7
 4KUXY67mEVqn4RLyUQdamNZ+5QJIhJWTbxYAy3z9Yh43S2yO4Dm4mh/H5ANnqs1lkCN4C35adIC
 EbMo9MSL9u45zxge5ZsA1NTZvrQruAcA/vDzk1Ed3WTD7+BnJDDGnY4lo+HvkLzQrQpVDKoht79
 eTF601OxaRawmIKf0wZtaArK7qQYRk1m89cgPeVPOvx0jadAEAySU4/8u7cA9wbv42LTtISXGn2
 bw3NLExkigkMPMpQ5IUyp5umLfUMxCUsla9RX6bX+wY5w7MkRBVZK1EGK/hrMzqD1nDzBFdXmcf
 m+MOSB94rL2p45pBL6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020199

Add ti,am62p-efuse as a compatible string to the uniphier-efuse binding.
The uniphier-efuse driver can be used to read AM62P efuse registers as
well for GP_SW silicon revision detection.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 .../devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
index e27cbae2d63a0..5e1b90fc1ae45 100644
--- a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
@@ -16,7 +16,9 @@ allOf:
 
 properties:
   compatible:
-    const: socionext,uniphier-efuse
+    enum:
+      - socionext,uniphier-efuse
+      - ti,am62p-efuse
 
   reg:
     maxItems: 1
-- 
2.34.1

