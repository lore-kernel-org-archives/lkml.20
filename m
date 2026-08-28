Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741B0371CFF;
	Fri, 28 Aug 2026 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932063; cv=fail; b=bKZiJC673m/XhfblBT5gYB8hE+RNUG6tHXWr3rFcgSj5E0qrHoxh1JyXvCkbXRp88wsQ1cDrxx8lG353meetVtE5gehtQ5ea8BKZPovC//KYNQSTIHC/rzEKQ97T4y0t3/4VH1ciycPNx8CNWQ62E5pXsWN959g/NhJV79VILGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932063; c=relaxed/simple;
	bh=wt75hOyJkQy/IoA7xbEeApbmPOOnWW2LBMQSNHfqWbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kYlsboIN/Yk5ObA0q2SHODB3ilc6TGZVa1ZZqyZlDVWUkNEc8l2qRgTwflZjb3Ed5O16Aicnz+dGcEIOEXCxJEHsfSIxfn/3G7Go8QfcoVJAPZ8DleJzRbJ3J9z9EmBgiBO1L5GgjFp+EeY71ZyS9p8iAu+2qEh8CXiHZnQnUbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kPVZyorM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bgFaGF42; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kPVZyorM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bgFaGF42"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDqCYq1781128;
	Fri, 28 Aug 2026 10:47:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=XNjOTZPRpGh1jRvfxgQSqYXiFRwKOmTD112fJIe8/Rw=; b=
	kPVZyorMblK91bUkU2bdhpOEtGdWMibG9+SUbU9KwOMt4w7JR4tDA9VTtwjafzmJ
	hgIdLSG7brH3gefOsFXpBdNfI5P26+7WSegwXzzgAWbCBgvt/AF9QTYE95/zWVT9
	HRfWMpjN4oDCfhxjeudFqu0MrRDdas3zgIdy/ccbE+ENrtGBNdS5Ze3gumlmZFEt
	Ubi9BqcPZLSHG1uO637qwlUiOxSouMTwfaRcgHUg9tlsW6Ljma7YKGRZ8SQWZxMV
	L6uLpBSIAXSt04vjhvhhAxu3qK9ladOQlcx/W5LbyU5v693LZT6ymCpBeWgBbESO
	M7sO77XaeFbmWQXa/YT7ig==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022128.outbound.protection.outlook.com [52.101.53.128])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gb53t0hqk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 10:47:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5adMfe8flF4MnPq/4oUWYanGY/UggR1YWTHKTBSeqUSvGZUMTLXgx8e+eZDUg9rV5J/FfJJYqyx6x4WqIv/26aq//l/yMJa/7p+usU3M3ZGci/TbFJY7tBY8ZXB5dcEe8xUJ/k/hUsAsH/bNV6XCvxoZENgXiR/JDbGW8k2Zu7W1zzqvaA1mKMZnbixqCHVQmalI3kyJHtH6e15B1CNxzzK8AzysTGkFhzGMmuHKXSW4+qUWLeI9usMDXgCuU7aEzAQzGPfdZ3LRIb5YBfaED/K2m05lUDDMRTrBhDgZcNCcT9Qd6/592tihjaNJSRjX8285x23FZe3SUhmuhhTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNjOTZPRpGh1jRvfxgQSqYXiFRwKOmTD112fJIe8/Rw=;
 b=EUyDYB88sIlWiq0j1G9pV9TvZPeiZ0YK4imkfPVju0ZLAIV1n0tOEau/qeJBjMTreAhLlO2GDp7tewuAEhsPa3RSkFzcV6A/KUfH4sw8zbJRG66xOG5ZVA0QR1e9e/uXtkfuUuu0W4LwKi/LeAhxok0SrSCRg2vJHxLesYHMG+7UY7qyoqQDMPOogjZ0M3Lc4VF1eG3eaCK3V4ZR2OBAOFVufvXvt3sNnoa5NFyLvawrTkUbgMDZsp16RYNgSd1EcPhSLfGN+q3uU2/JriZzO4Tdkk6DIe7r39f+EBaW2PHNTmS84SMcaw7KMnMUCnG4mT8xdoS1D41UyJxw1Jbz9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNjOTZPRpGh1jRvfxgQSqYXiFRwKOmTD112fJIe8/Rw=;
 b=bgFaGF4221nSsCIGaP9rl3s3WUhRO1tYUsCnIhpyifbRatpiU6ABdmADfJypfxLL8SVBjGllzdtl6ykfHDL1vxN5LaaGWIm3zFB9FBws0g0CaqnedRb8O93b750wqqZtsmxBEiCDGXNSumdtX30dngD6N5rgaeSP20DOOq7CQgY=
Received: from CH0PR07CA0026.namprd07.prod.outlook.com (2603:10b6:610:32::31)
 by BY5PR19MB3985.namprd19.prod.outlook.com (2603:10b6:a03:218::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 15:47:23 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::8a) by CH0PR07CA0026.outlook.office365.com
 (2603:10b6:610:32::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 15:47:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 28 Aug 2026 15:47:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A0D5B406543;
	Fri, 28 Aug 2026 15:47:21 +0000 (UTC)
Received: from [172.17.0.2] (unknown [141.131.156.117])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A716D82024B;
	Fri, 28 Aug 2026 15:47:19 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Date: Fri, 28 Aug 2026 10:46:26 -0500
Subject: [PATCH v5 1/2] ASoC: dt-bindings: cs35l45: Adds SYNC properties
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-sound-for-next-cs35l45-sync-v4-v5-1-fe3feba709ff@opensource.cirrus.com>
References: <20260828-sound-for-next-cs35l45-sync-v4-v5-0-fe3feba709ff@opensource.cirrus.com>
In-Reply-To: <20260828-sound-for-next-cs35l45-sync-v4-v5-0-fe3feba709ff@opensource.cirrus.com>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787932037; l=1682;
 i=rriveram@opensource.cirrus.com; s=20260821; h=from:subject:message-id;
 bh=wt75hOyJkQy/IoA7xbEeApbmPOOnWW2LBMQSNHfqWbI=;
 b=Sv2jz5wehUJpHb4yXh8AAvafP3FbfILR73sDJcqMROBWI7CE2x5jjw62E4Gh/b2Eaw5g60GuV
 KQwPbONjPAFAfDE+rECcIYCvsBpTwXMKeQoDmg007hlew3WWhpmhYJ0
X-Developer-Key: i=rriveram@opensource.cirrus.com; a=ed25519;
 pk=PWYAqW73jQepp6ORjx3V81remQilskf6ccMx0Wc1wUA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|BY5PR19MB3985:EE_
X-MS-Office365-Filtering-Correlation-Id: b8730164-210c-470a-3621-08df051ba6b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|7416014|376014|23010399003|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003|16102099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	dedPHWBsWb9WBVg+41Zd0FIu4dR8+s0HqRLC4C2MLho5naowFVZc5hWCNaR0swBU2GNvfLlQqKvH3FNtd+Z/gGbm7wD2zqLEsv0VCLRq88FHmmDGHlt9W+5SXS7iZzr5J3k/+kjwFRKI6xpv8x7OVyI1fewoozIgQp1pCX7Mf9lrfBzV/yGID9jsB31HjDeqOD7eM5KVHEx58q4zACio267UR7W4xiL9xQxH4PK6cKXeE/03fxLF1grlPTY4jD3TZNm66Kw/fw2o1rVKP9V23/7q9P8Q0qtsY7m4VrUqoydp8X6yc9fiji2/XXJu64of6Fm+3qcyJw0B9Vwb9vsefEujJe84/aCzG4AXmRBmQooXSMWYMz2I1+pk6yx4stMqwCK2v1OyZcYMII7yO0rha8pPKPle8hE48TwcNv/x38CTlLSMYrCpzgoxjtwkPyyWrXEe7tunaweAJGrgxr9XpwLzlpg2k2dY2MHlQNiA3XCjZ8qpkPHzQY/D5geD/+q+FQv7zbztbgNqLRPIKtbjH65z551nsIq46LCLnm0o4BWYAVP2YP/sBwbwWsssFoKw96NohtwJeDKaSP/ijne2fJ3kcjstbgMeEvve2dpdgmNwigzHvLUtPkj7miKN1t8J1Ztwp5lw6NBoXfPlPn2hs6V3qUTRPMp7E7OBkfCLo6rIniii4e/htGe0DAxadCFWqx/sLkm5kVMhgv87zwx2cw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(7416014)(376014)(23010399003)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(16102099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xORWhrgZKAnR8bEoN8qztCUTrY3+DjK4PKqm/mL/2LzAEuF0meWnMEMd4CR1uOkbHWAA6KqxolgFfwaSoRghFNvHI2Vedk1QgO5YC+0QTiHTl4gzYiZVSrOVDABNP3nnoPhzQG3IN90fxftoDR0k2DCaa2HBZqsYnMkvl4l1bLPfv5Wpp0WbWuvOPmgLkFZ2/olY2rmX9xFzJ7GUPH1j3U8TmDIY9safnzWnmGgRU/9x7R58ZT9bgoopA34aEoGicAuMoev/cJ3fiSJlUfpHojzZUkMZkIZmqRPZ4OB9m5q0buxOPDmbZPMXSDG5AYH53q+2CR+7Mq5H9kSMzQw5TgbaRqTrWNdUtg4fS7WQkcivn1HLmylNessasPPL/wyYliWu3iQ4hlXwPz4gPpAuM5uHuiFMpxU9U6OfFtXHnL6Pq09y+CntsRy81IcJmWMx
X-Exchange-RoutingPolicyChecked:
	Cr3v6OClS/G46EkEM1sscXoZlYAquYS/LRVbajOGtBbZUW36XhmgL1/bnly9IDbUPhMPjyROuwPJH/cc9u8IjLa4KUdt2LpDoN561zb6CwSOw572fr+uTAK2YfAEo2QPZbnAI9N/VOgcWZ156pK4YMz9GUVce+qj88geUtmByUmj9CPd4Ctu7fxfIxCAQWLFBpzRyYvBg2L8xe/1VIZJAj0ZHklj62pUmXodZ79W/AhxUUWZ+Y0cuAB+PRdnr/kwgt2KVGKlCUdyztgL2qWIovTNx6fiu2FMRWZGoJGagIgi/gIl/AylnTznClWclyOohf19yybAwcy1jITEJnQeuQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:47:22.7119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8730164-210c-470a-3621-08df051ba6b7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3985
X-Authority-Analysis: v=2.4 cv=La4MLDfi c=1 sm=1 tr=0 ts=6a91ad90 cx=c_pps
 a=wiAqGZatgNl135eAsGeZeg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=KBitPqK-shNkJ_V7GXcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEzNyBTYWx0ZWRfX7FNAJffeRZXF
 0XRYC5JWZsmCtMi2CvBioJzBSEKlBAQklc0fr1bJEkKZQEJHZ8ODCfPbwmNjRvszy45UV2qQ1+l
 rZ9BJCa7DGJdOBaskSR3wqBV30XuOYqG2NUJxv3f8j/tJpwQGwnWBwSIL/+E6sYeCZYL10YjJWx
 E12G+tyEYXoX0Ocz7ln+exbmLwbyzwRhm1vjA97oGb1XTcOPEW6K5ifV9QJBZIuH9XvHOSUjfFe
 5kc/qNIT0o3T8lFsgTkXyUwScybsRvvm/4ZAs4RZotbMFaF1iPE4iIXWrnitMPfznx+DKP0uaMr
 qijJIfPkiSSrWbOsbOMzg9v+t87t+CPhVVHd3CbDUxjbtom7BWkRQ5FGIn2oQw2brItTejSo/KF
 j7pOriaCnmD8o37F85tgJCOVUHhIrzL5fVHQm4JMEHVcGNmwTC/swjK+Ub96L04F81ixS8yQYIk
 TNScAIf5Ph5qCSHdPag==
X-Proofpoint-GUID: iGF9NJDLecdq2oJIbcFfLeI-r9jqETK9
X-Proofpoint-ORIG-GUID: iGF9NJDLecdq2oJIbcFfLeI-r9jqETK9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEzNyBTYWx0ZWRfX7gVWWO11eIX7
 GnH0GMOK32h9kAVttPWluyJmHrKzJb+Oxb981QE6S1KBtbnziT9tMkRQ7cITOnZ0/CCCKA8eEss
 JHxSVviBsOhLjXSAf1RvEdNHutxxIuU=
X-Proofpoint-Spam-Reason: safe

Introduces support for the multidevice synchronization (SYNC)
bus. The properties introduced allow for the configuration
of the device's transmitter IDs.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
 .../devicetree/bindings/sound/cirrus,cs35l45.yaml    | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
index 70f6c62aedca..fd0646b609f9 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
@@ -53,6 +53,24 @@ properties:
     maximum: 3
     default: 2
 
+  cirrus,sync-lsw-txid:
+    description:
+      Transmitter ID to use for long software (LSW) data packets
+      on the SYNC bus.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+    default: 0
+
+  cirrus,sync-sw-txid:
+    description:
+      Transmitter ID to use for short software (SW) data packets
+      on the SYNC bus.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+    default: 0
+
 patternProperties:
   "^cirrus,gpio-ctrl[1-3]$":
     description:
@@ -145,6 +163,8 @@ examples:
           reset-gpios = <&gpio 110 0>;
           cirrus,asp-sdout-hiz-ctrl = <(CS35L45_ASP_TX_HIZ_UNUSED |
                                         CS35L45_ASP_TX_HIZ_DISABLED)>;
+          cirrus,sync-lsw-txid = <0x1>;
+          cirrus,sync-sw-txid = <0x1>;
           cirrus,gpio-ctrl1 {
              gpio-ctrl = <0x2>;
           };

-- 
2.43.0

