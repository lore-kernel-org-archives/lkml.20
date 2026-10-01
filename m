Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5982C4E3257;
	Thu,  1 Oct 2026 22:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894231; cv=fail; b=ZMFOUN25TcpirxqZl8ROwB6/14FEcvd5+EXrNtp2PgzSiSUQbWMswWzq2z9OEuL6lJ/h2MVsHmEtUi5Ny6ETcIn08fROWQucQDr2cQLQDcq3WbrnvynTIFhzWADxz9Jx1faDReU9Jg6wOHJ8hwfwGqvkknWxOAB2K6FB6bD6blo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894231; c=relaxed/simple;
	bh=ewtfugx2cUWpz0oWQgUrHcYD/k2vVD7ZQ5K/5Yih0G0=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type; b=AUkIA218uhPRuq5oXbM1r3DlkaHBXkHDzVh2J9/iEoCYsJj+mNbEoPlxxKEn+RnLNwa9Z1qwMIY9YwmnWJ7nPOTmECJ6aMRUfjj9YfQc7czmIbUr3wlSJEU6QxoBKpLxcukLYR5MOjSpcb0ZECtGhQS69VPuTd77qpwMzZstB5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=eNUEmrvZ; arc=fail smtp.client-ip=52.101.70.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="eNUEmrvZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4tUo9xrgxZwhjRss4fMfJBlcm1Zl1xsZ00eVELVMUS6sP/4r4UMYzBeSbgP0eR2dBhzlFaduwfdOoLTdfIzgqlHfQIXP7+kEK19MdN5X3p1HrgifmE9ufnES9WEKwuBBrvcWPYX0H6U5r4uX4erUfUJV7QK+s0P0fqhHHJ79qJ4Hblr52WMt8m3YCoZx6IeX7ISWy2z/sSLAA6MJ7+anqcluou4SGKHr7eNBG/EQqa/1yKECKlOehxYBiBBnOgRwKA+opSFT5oNir/J3PxeYR+Niz4GQkaTB+mmHZ7ukfEouzMNFytc3yyyd5cUHx+wnkkoaGk89A7OY7Ih/StmSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/RK+ytRXnJJifP4pFNy24BueZusVegz+RPT8orF+Ro=;
 b=TNwSIXgHhJHr/SdJ9ZvVsnk9XIZ9sektJ9XcGmM5qF2UoQB6YEQlmGP5xL5uF+KQT1JO6vQany8AxkjaL4rJ2s0KqQRGYpEj3sqNQ56SoNJf42atW8yOew5QjdiY0fhNdSI7zgt2YIn7dTknlAOj/qr4kC2Od2swbvAw7R3Cg4uHffv5l6IX4/mJzxvYdW5JKIuXAU7areDeyWnZopEiz6ThkF42AcFHitQyYS44cyZGN+JPSaZu0Wot70Um1gh3uiNMEpgeJ635idA4ZkruTgnI4a6RdXTl7a7Fi4LD44egDzLBjm5XSMBRP18L8eekPf4mrBmY4sOCDBFlx+sOvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/RK+ytRXnJJifP4pFNy24BueZusVegz+RPT8orF+Ro=;
 b=eNUEmrvZzaE6zsVTCGPsAQEdadJhS9Y9Y3ZrlNXz+XRH5tUreiYdp5zpQHVVS1mMtes8Kh3WEJrP6b90iSW9bxw2uPy65KS/+6J240g23SUgKEvpZ8IaP9clTZa1Z15W6tw+a21GeeG09/OMuEJSQFn8oSKoDuNjLnu3j6wjYV0=
Received: from DUZPR01CA0308.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::19) by VI6PPF104B179E2.eurprd02.prod.outlook.com
 (2603:10a6:808:1::305) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 22:36:59 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::19) by DUZPR01CA0308.outlook.office365.com
 (2603:10a6:10:4ba::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:59 +0000
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
 2026 00:36:49 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 32/38] arm: dts: qcom: msm8660: Align closing array bracket
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <8604486885d7462b7a5113fa89573726a0fcfb7c.1790892852.git.waqar.hameed@axis.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|VI6PPF104B179E2:EE_
X-MS-Office365-Filtering-Correlation-Id: 913f5b47-2444-4869-70f9-08df200c8142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|22082099003|18002099003|11063799006|260925021311599003|10067099003|260925021911599003|260925022911599003|56012099006;
X-Microsoft-Antispam-Message-Info:
	6mXTPnvXLr2UWMA4vBgILU2/j4nbj9h6S3AND3/NvLM9qWZuIkdSEMjggfzsGFiMnWGb6xsxPvmGZsXcvFAdagSUgP7L3S3lZNVPoH5FhRN0ypdGdZRZbSOzwoD5eUMqb2HZyTCrKl2TEfJVK5Px0MZz2YnGyOET6kVJ073EFYm6Aocs0wpD5bLX3Ig4DaWViOGWb+okNxNBQ7PpzLU9r67AMiSVdMe/sCHPKuCvZ7vNfFRaGEZUin05fNfseCnV/XPYzvssz1J7xwd9QgKh0uMoe7hMVi/m5tvFMy4u7VdLl5fz6yZmve4yeqpenxiZhgEsFHGYXKT3YCWxqyr70RALshStq8e5oPWA51c2eqcr8QaHxzjIjEIEOXv9nrKev3b9tivZTtBSiGTqxlbxSeL26AThWR0xjGLHycFv/HwQkCT90y3i5nPl+TCX02cPyiUYsv3Tn1yXwgCG6omrtp3g5j0JQdbnR4JfmNCrTl64WKnqA5DheCQeNz4lCBuMx6PFQIdQiUWIanLyy1gWWy2QbXGsqxaF4ahByZ4AcAJZBM30qvhF8chHnzoKU14asnDDgXMdfOJ30O/pBXZjW5Ee+QzP2OBuAgjygx36lA7su2WzmfoZYCwVMntYVxs1wcSOilHSL9SgQyAYioPVgl+qZ5ynF5FU7kUlsxiCoUic1t/P0nYjZDD7AlbwtAJfTOS3XCRHP0W5BcGnkexIVg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(11063799006)(260925021311599003)(10067099003)(260925021911599003)(260925022911599003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	drsFmVOmWLIKnxzS+yieqQ9TW11iKkYOtBrT1J8W/RLIXmTW59Km9ts04VCWQzp7OQ9WCG2cgesnnbLM0grj9TeYy5b43B3pzloqG6rdGvxkRBHF4UEpVZ6uKtebyesKMYcj22/MDAhjsofMBfsLs6DVVXHiyhxsernx7VusD2cGuyabl6iTBs999c591TF9mEkNV9i+sLqcRTkw0DSnzG5ghEKOd/LE0GKU5mPyugG9JpTiNit/KCHtvx4KyDj/BOz3s2Xt+zTS7xmpL5xpAGqSdO+DZaErvvSMAXoAvJ1f9EERYz5GiUQNRVrkHkbuBfe9u8Wt1D6Yj5PorO7eb2agx7zg23i8nW9fznZh4YSjAqs5Qmz/848bTYDwAGHQQW9139kJTZFg3xdgT9ZTlzOsn7fdeDptO3okeoYqxxd3XABEyo0fIgVEJdHHLCWE
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:58.9727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 913f5b47-2444-4869-70f9-08df200c8142
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF104B179E2

Closing angle bracket of an array should be indented like property name.
Found/fixed with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index bd0665727277a..174af88fd7a5d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -99,7 +99,7 @@ MATRIX_KEY(0, 0, KEY_VOLUMEUP)
 		MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
 		MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
 		MATRIX_KEY(0, 3, KEY_CAMERA)
-		>;
+	>;
 	keypad,num-rows = <1>;
 	keypad,num-columns = <5>;
 
-- 
2.43.0

