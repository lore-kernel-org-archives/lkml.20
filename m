Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0414E0B7C;
	Thu,  1 Oct 2026 22:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894223; cv=fail; b=lbjgmP0jcWUpVgc5aOw5EBYTgFqbumPT+ownXG194k21pYoTCSueTM2ZVM9qzmaU+m/aoVODOCSzvPF+EAACmtY8Sf013VJdfffCCgzDDb1+DYaK3KK2rRU0MFQ4EOWyEuMf6xBOM99wB0AF5bseUBW37GjMlKdTOFoEJ6MnlbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894223; c=relaxed/simple;
	bh=QKQPi31bCwycsS7cOsgB6u5HwxhIjYpba93vSXTvq/o=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=mSS8k1OjnPMajbf5p2sU7DpjSQz9+gdYHO0odiCm2Z2xn16YC9x9XvjqfWgPaMhrZypWz04L5nDZQwqVCBLis/lI/aA3vZ5Cycw3rimClDvh1oHov8kTgSY1FOV/jDrnpMUMZc3FLzzTimLl/SnSW9SWWeEX/hJ85FCQD/eVsH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=UuzofSlV; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="UuzofSlV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NksBG128Z+TEVV5TZTdJ1gN8tRcEkfG+nsWiZ9+nsf0kiecIAQcq3P0K9DsBj/AaK447iO9vCYaY4F+LIH0cx9zGihccFREsWFbHf5og/1DI1f1hpZMIMSeOfjonhQ6L7sPDPNQIGRoL+WaqEpcE6MKIXL7+2pm5lqUDmuV9YHF+0Gj7fUXE5wGq/ZUnD6F6w6bBLTxwqOc1TbgZHfOdda62zULmvmWt8NweMGraZG6mT4X7l+hHZyHUllvL72he+NBdLLFzneiYTSDts7rRd7WGVJ/BzrOMaMXXTmdAqQyqQpPyb4kLBxDk2wGqeyJG5HJh6tud7rMIAt0vmdnQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTy1fa51DljOvbCphdZ1RkjO+ePs1ppCtjin0uu6qyY=;
 b=XHfVmMlgAVuUAGRQhy1k7Lb3JZyLspeb9QhuXgFoDhtEHy2+RJWXgh5YwfpdShmTK4q2uAjW2JxfzzHs5QWEhVtHWjZrK7xO17RipDD2MniX5VdIDrHjYG8lZ4wpuTF3VgNE4wjq1CGiJXr+Kb/Ls6q8hgC26T8RzSuWCLTxRZK9t9HnZESPQFqoOJ4HKPgaiF9gf3shxRmDLwz81UYnqD9SHmTGN7zukjBoXa2jIxZ72ehR0NQu+n3iujjaDj4Ki+YPwV3KnMPr13aGeCmXMnXuVcACx/j6GK6AmEyl20xzCRD+63Ls0CMnXR9balLdrjJbR7+NEEdaltfuyeCYvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTy1fa51DljOvbCphdZ1RkjO+ePs1ppCtjin0uu6qyY=;
 b=UuzofSlVDTKGH329nlQEfvvWx6gT3YtfBuTB/oD3Ij7OPeAfhFXHj47XetOjyUEK4okTDT4FF4KjfOCtrR0n+69bhVO4Ypi4Dne2mgYburbefYWP2RUSPBkQxlPVcyB/7ZyGSzBWsB1Otf3159xOXBb91ocwt+8vl27o6plMTOE=
Received: from DUZPR01CA0323.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::24) by AS2PR02MB9691.eurprd02.prod.outlook.com
 (2603:10a6:20b:600::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 22:36:58 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::68) by DUZPR01CA0323.outlook.office365.com
 (2603:10a6:10:4ba::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:58 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:48 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 31/38] arm: dts: qcom: msm8960: Properly indent subnodes
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <c0ec3d5de24b709ed6103897b9c78a555243dcd7.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|AS2PR02MB9691:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bbf2f16-cde0-4457-557b-08df200c80e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|11063799006|3023799007|10067099003|260925022911599003|260925021911599003|260925021311599003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NrgTnN+JBlp5Gyi9RWWfz0NE3CStCDxZFSeTfyVm/c2/tL6FBiVluRoGnD1lPq/5r/n7FkfHH13tsdVj67aGwNixBvpZi9GO//VkrMn0g0VQoZRWiGjXGe5B3muPXr8jZ3LxbrBQyzaHeCgUX0aVvGE9xbqyYSFRi1BltjOaPfj6HZhQmh+x9uR6ZQUmj+AA78tdS/GUCItFDKV0v+7B90M6bdYFffyb4v76+oSg/j7X2V5mK1H3W50SQWANjjfXfhzTfgFfWMZN86nc4/XV4tB62Va7qq++cMGi/Jp1HEyl3cpjN6o16gIw1r62cX69r7zVhDSG3sxW0n2PLMa4Vdxdi9Zp9TQUKS4O7LWvIn/BO/vH1VzMzeUmyV8LQopJhyoDhdwTh2mEwLjOkzD5MejAfPmfVmDad6iKqKJzdiLTgudHhWc1Z2JWwdRBKnpYN46paJNB9MKn8WW+FGB8VQgcUhxXxXNRVgtdcKVZ4dqb38z7jUDO6VcwccTSfUtPPn4yfeNaI7YIHLOVi7z5VDkDn9+WDtEtFNm2cZZj1kIUSTfhJfYNYtpr5Dhs3AjYJjonTM95ipVJwDr6T9ftuEVLvXc912kWi+W9qO9MafSe8M/3nN+G0oIbnkjKe5fQxr/0Hprhu9agCrNrfCCmwI8eoeA8NQXVHTGSceGKClTRWBLZTP9ZiomyDZSsH2pzhReVGDjW7SAAQ3TGr/T+8g==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(11063799006)(3023799007)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IH67uPCyrk5o7vnu7qEcLs7gLOfQQbnbDQD03HyI6zCBC8AzfhRQELBewAWXuRwRbZwgHdvZvcTkThhVYkPAk8C6trmEbRAtfPZGaT88bRHnkBPixaNfoEsnvfrlJGZP4XIgIHEgpW26K9osw8U1zijH48mdjrfmwDTa0lc66a5ZxLNTWicgBIFxylebfJFj6pdvYcdptQKcV5fXv96gnNfUniBhrSRDhu0gQMs5T7FQMC9+CCyLikPD3f7TMIGsHw6FS2wPqE0Hrx4pgYszxyrNq9x41STCWKRHLoEWNhTmfMRBRTWP5lS2nJr/qoqeVc1EjHUBZtpj9C0k7CeJbRs5YwtyCYfMhIDKKQHrrL66/hc5oS2tS7HHr5mTznwainGYRK3ioWFEIMGXiC3HQlvUAeum2Do+KYk6RvQ2rG5DcvoO1HtnDxwXVfOD7TFD
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:58.3496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbf2f16-cde0-4457-557b-08df200c80e3
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9691

Subnodes should be indented with tabs only. Found/fixed with
dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index 1df078d7d89b8..bd0665727277a 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -58,34 +58,34 @@ &gsbi5_serial {
 
 &tlmm {
 	spi1_default: spi1-default-state {
-		 mosi-pins {
+		mosi-pins {
 			pins = "gpio6";
 			function = "gsbi1";
 			drive-strength = <12>;
 			bias-disable;
-		 };
+		};
 
-		 miso-pins {
+		miso-pins {
 			pins = "gpio7";
 			function = "gsbi1";
 			drive-strength = <12>;
 			bias-disable;
-		 };
+		};
 
-		 cs-pins {
+		cs-pins {
 			pins = "gpio8";
 			function = "gsbi1";
 			drive-strength = <12>;
 			bias-disable;
 			output-low;
-		 };
+		};
 
-		 clk-pins {
+		clk-pins {
 			pins = "gpio9";
 			function = "gsbi1";
 			drive-strength = <12>;
 			bias-disable;
-		 };
+		};
 	};
 };
 
-- 
2.43.0

