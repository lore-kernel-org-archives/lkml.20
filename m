Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012033.outbound.protection.outlook.com [52.101.66.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36101539796;
	Thu,  1 Oct 2026 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894227; cv=fail; b=AxoLcoKvlP9IOy61lPQp1Xd6cv6Okgi8wMvchb3V8/nySJS/Oj3ocTwRh99uOpAPqg5KPvQO7x+yNUw8UiPrdzT4LO9Ptq6QlZoVxmat1qg91R353celogu8NuIYHxYeMkzxdfQzfQASK7+FnCvAloo/eOlhMaHRX9Nlvx54G20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894227; c=relaxed/simple;
	bh=FY/V8e6wSnFtMTLPmRhqbLFFTb2604S2NoFurWJ4eJM=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=iBJVcFprecul0+NQDvTIDhBJWN+kkL4nXFF5CGOpoSZxKsHZb9Nftjzy2SwoYKjW2Ny4WdmUKabRINv1UlMs7Aw9fb1Htbnh5Woyf9ZLukHXUnfQRM9zl6uueQy2vACfta8uxJQn+/0bB/2K+BeqokTUHTAGrvKDV7RqDPIur2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=V/HbAs9Z; arc=fail smtp.client-ip=52.101.66.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="V/HbAs9Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwbmf+f19/v5QmJUF82o7d+0DXic4H1rT3eSHMeTMI3FVHrNZ9/dMZRNwjCv2Fo8zLtFQR5Tgpm7v6Y9Zgqn9ETa3eN9DzXoqml/kT+9RnA23RULcmiYYiBgK092iwAFuQM7lggajFF0ImOzXrXJDN6lKrtfgfmmx0bOJDPDCbAzCwNMkDGNzSUUsYpvt7lXGOKN+7Ch9bj1kP8yDlNe/6MZVa6v21n+AjKUprRI/I5V/AUZRtGV0KTsJLWfx/u3u98288KXnOd62xdFQXVzTXAlU83j5NTFEsSB56ndgdC24+G5h5JlgQg3I7u+DneB0RkhWJLcwUOo7+OybvUH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEoWPDi7gBVraXgvV1RpUoGVzhNDcSz4XcUDunDVOQY=;
 b=QaNb3aa+9PTpnrtf+CTKB9TzA9bJZ7IUFwN1c/j5IfGGtbmM+A3r9YkTIB4rSxfoYugo6k/rcVmnrT4/crzKw0Ql7MoQ9sGhLw02s81dQLGafkYzbMKiOBH3IRWFJiAwoFQZv5PJ37Ytjs1pEd75hFcmtuheJ3f5ZcsZk2dBavL+jWA40BDgNC+LIDjKn+wJ85dOoJlRbTAEKbWLg7a+yv0uYo+X8Xly4JPWGbo/bipkbyccgcsPv67QN4J19g+D+TzfsgU9BDf60EpJV2EDxN2c+lMTcbYGJrMa2R26VoXCuUIE3cEA0DPE8BsM4K34drm5vSbRYLTlavY2lX6fkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEoWPDi7gBVraXgvV1RpUoGVzhNDcSz4XcUDunDVOQY=;
 b=V/HbAs9Z5idrGeAYGLUtsBRN7hVCKL9alvGsWkSwXrqHYy3zhGp+RqBaf1fSs2IvpHzgf1ORkgiq3WxkHHW5991qKSudhignzkXQrNspTD3hfv1coR63iYRix77o6tV8FEgNngFn994K2NVhfR3Zf9If8agoZlKnGK3xTAv952c=
Received: from DUZPR01CA0321.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::15) by PAVPR02MB9570.eurprd02.prod.outlook.com
 (2603:10a6:102:304::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 22:36:57 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::55) by DUZPR01CA0321.outlook.office365.com
 (2603:10a6:10:4ba::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:57 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:47 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 30/38] arm: dts: qcom: msm8916: Add newline between subnodes
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <e869c2bb5005830c9ac1d4bf998696ffc4eed335.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:47 +0200
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|PAVPR02MB9570:EE_
X-MS-Office365-Filtering-Correlation-Id: d40edee8-9368-4ab2-ceff-08df200c804d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FY98H83Tw+KAc/LyovS0w5gXyTa8IsTZLHRybg55BpUj8neyxx+zDxsAFJy/9Fyyc/LJUtLHXYzHqhccy7cx5mH36lexjzYxmkO9q+VSfApe7Cam0fTOCGd8Ww6GOjS1Wl3kPMBmVWrl5Df1xhbwyCoNjq0bS72NWsp4b9QU0xrF8Vg1kElRQEL16vDo63yXVyr0oXpAtCsSKCMRRzvm17kDLnrjHvcB4T7hzURLVVzOYrhzT/2kcCic3dTJJF9iSdl0G8j/qKPAVq+qUyFgKqYxnAhiL/BntHXGcvwXIoAFunG+pXX3EB78yNHohNuK3kN9yX+DY5AQcD+5o/SwOY1tkUddZjC0fmb/kq4DvI2MEfPJxSqc1ap+MfKFwFI1Xy8PZCB2gRsy2MxxRMwoum3Vx34BSA80SYvM+fxSu30UGNZj4n4MnVEymqVtCQu6nmYPFWYDKCnk6E9PFxqgJiqJqEeEL17qb67fsENVEFzX1X9/1R30LXJarJm9v0PcECPBVgaftlEwU8LxlEl3cUfHBbkbz8LK+GxrpJ4x9aVQKUz1xIXygbEJFGILLPzQZ9QxkLDCp+e4VnJtyhJEiSpsvHrjWdUv5e0rN4HmcwBMzCRYwvDq+1ohDvd+eZeVSt6k41lRGfiBvcjoWV1c7h6Euiy9vNDtUG0xFNgGeMOAf6LeZ4h8SpMj/PsjdJRU5LV7UIsvb4Mys/CNYCanAw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hcBon6/fvjGn9v/f0gbnjLr7RUIUUWYmxi8MZYkVgnIPT0U0KBTCVwV6MarRezOMQAmk+v8lQklPdQNgDb34Priet9Udku4D3O3kI43EbHidnOS+fB+0obkbTlu+sM8NSGIr1Xm4ep7oNkAFqe2np8QXseBFUaUlFQ1EmbNe5KHZ6P17/5r555v5T8gVIGkHInNOBex5O+uY6LIj/j15gKe8zGNDbe83fqxxZU0pEbXsxmTODkREGtZH41hSVUQLYb8+ooO8cX30Ka6gyys0PlPXU6JEk0k7Pqp5ERAOeuDwhOCMgjl/B65I/7U85+PU62SA/OkG7rNzbF2cGm4KVZ80N3t1Oamigkx1z6uLaY11+88qLBp+gT9M6zUqsLWLgSgu2l073ALHfZNUeqPtx7lD9pdmhbyN3ILXw/kOTeNA9rI4RZ4xWlIlXke7lteY
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:57.3693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d40edee8-9368-4ab2-ceff-08df200c804d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9570

There should be a newline between subnodes. Found/fixed with
dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi
index 94b7694eeeffa..f286679a6af07 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi
@@ -5,12 +5,15 @@ cpus {
 		cpu@0 {
 			enable-method = "qcom,msm8916-smp";
 		};
+
 		cpu@1 {
 			enable-method = "qcom,msm8916-smp";
 		};
+
 		cpu@2 {
 			enable-method = "qcom,msm8916-smp";
 		};
+
 		cpu@3 {
 			enable-method = "qcom,msm8916-smp";
 		};
-- 
2.43.0

