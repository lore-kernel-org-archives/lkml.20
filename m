Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793880195;
	b=d8yPiIgyGmRNpFpspSraYO4nxtL7j4ceZ6/gifCx2bp/mwzbK+GXnW6Y8YDZGvYrhBD/
	 qqFZs9LLNYgDaMuemghPOzv5e6H4VZw3n5yU+HWd1csav8TtqchqjY9jdgVTEoPmyAIp6
	 LeAyaW4RPAIxOhoWrKTs+yrEtrAEvMwBsP3y3uBjgCFOY0qxr4/czQy2Iaqql1WD3Y3Oo
	 OUaOEfzFtHneyXHZ1x14nRkY4pJt0dclQq5Otsj4v7XIIOFY4a++/OQkPGahVVlgsDcLj
	 PMKbhOnXwQtbCnnPkMwhe2GKqaU4yXzQR58AoF27V9mfgux4c26wiFRfSqKA3Z/VgIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880195;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=RvfpobJLqPxP8+OSP0sL8/VtaHPGJQNFwDAQtUC+4uw=;
	b=0kvrRPzGh20ihhdPtbep1nVEpsaph1VI6XtKuf8MBZzmUfsCsT8p1wOzcjhLRzg0sD6m
	 uvB0eIb1q70DEKC7mWv3Q7aBo/s34Kgof1XAtLLXkN+CKduz8qcCaTBpak4OHIt/nlxQ0
	 aW/r1orsenKgfsllV7dQiP++F6GrFBuSXp6inf56ILUZlqMciAd53nrUc9x2fJ+a7YABD
	 +2DudPyQQpPOLCW0QbAtIOJUurxTjkA4XlN5zWT+t0sarXw2mQUTGY7G4QCVI4cnHkc+C
	 2hEidKaK64sn8tyBu9NWlONNoWC+w4akXC/P05n9kts0G8y8nnTjiz7bpinVh2SsEYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=lqElIPgr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.70
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010070.outbound.protection.outlook.com [52.101.84.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40348606A339;
	Thu,  5 Nov 2026 12:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40348606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=lqElIPgr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxtUpiPYTuGD3TH08xzZYxTSqHomwznaSyBUR8xrTWdk6HF5PQlptuvV89LzRQHOJ8qLmqpSeZZr+8seNGVhiLgH1rjyWequViD+S1NF+GslK3PUpE8fqHFne6wYV1aNu36oaBTyU/jcCaMW49X5JbXzkOaXQ0JIFRcn3MEgx3Cti90q1hU0kVjG0gQF9lTxLyiqCaXw/5kEhn7L5zLIcXjW3HVbiDhjLZXdfCagVWwqUHL5KJYvAG4POChdOkrfbsKpK1WwZs2O9angLkR9cesSBgtw3c8sQofGivgQ2qhplM5evySmpnmYzdaz85zTQWnzbsDcWRYb46Hkii4D5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvfpobJLqPxP8+OSP0sL8/VtaHPGJQNFwDAQtUC+4uw=;
 b=h9jYCY0s5JaHmOi1jSuMPxu32vbGRJ4ZBEtVWV8pycoEN8fJyBKwSeIdF0d+KSxGzpEVCy4xUwmQREZrREATCGHoeQlE+oPOmLTa7pS9PA96VxyjajWQqTP5OGhewQeABgOAwCPsLvCTjopmi7j12cxRP2kRz/0pbGLt+aq+BMClJ3PAlMQaMOfdXeJXQBjvkUKFjqvReoQ7mHigEc9LZq+Ie/5LHRg79qg1bjl2lJRwTW0Z10JMtJ0+Tzei+rDcbVU3KskuPfUeazPe3y4sNV7s5mbCZjv/mcZX61+exBZzWlCHr+zWOUP+IuGDXpeVC5vMkDOBZ/9LlKhxXa7NUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvfpobJLqPxP8+OSP0sL8/VtaHPGJQNFwDAQtUC+4uw=;
 b=lqElIPgrIzOu4xwkDev9+ZFoEEETOZujbhieD2WHXqVxWnc2nlK5QbJyeMAEeqcft2J9Qem073JFiu4t2C7x4phRER9lpbdiduQcdYt+3YxadPD7OaehEqUbFmgjG5nObG6oFXP+BYkaVVwMmcY8m81WMxyAOp1hShpvQ7Y9e4srXA/pVFve/VBGSsh/eFRF2rEVPnF8KWfkE4nxLbJeZxPe3euQ5JGCLYZXC04bxr3S6rMnY3eQxFnrR9JqVLKcSqI+QzFGAX4pzSrcj8bII9B5QqqjH4Lq48AscWq6njIymWoeZEHrCMyUGkap9FTTXcg+eGu//Su24Cb88aNkYA==
Received: from PAZP264CA0111.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1ef::13)
 by WA4PR10MB381800.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:1d0:35::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 12:03:07 +0000
Received: from MAD0EPF000008C5.eurprd05.prod.outlook.com
 (2603:10a6:102:1ef:cafe::50) by PAZP264CA0111.outlook.office365.com
 (2603:10a6:102:1ef::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 12:03:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008C5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 12:03:07 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:33 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:03 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 5 Nov 2026 13:03:02 +0100
Subject: [PATCH v5 4/8] ARM: dts: stm32: add TAMP backup register in
 stm32mp131.dtsi
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-upstream_nvram_reworked-v5-4-ddf7dbf1b298@foss.st.com>
References: <20261105-upstream_nvram_reworked-v5-0-ddf7dbf1b298@foss.st.com>
In-Reply-To: <20261105-upstream_nvram_reworked-v5-0-ddf7dbf1b298@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C5:EE_|WA4PR10MB381800:EE_
X-MS-Office365-Filtering-Correlation-Id: 041a3df2-0c92-4d63-7f5e-08df3b34c130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|10067099003|18002099003|22082099003|11063799006|261022075727099003|261021121427099003|56012099006|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	e9m3PvvGS6VCsmacThUfq9SL7ACsbJHR9SVTQIvIykfzc46SH4bsKIA9GtI+xNMwD0o/JnkTdfPreuj4JAPXLKy2X2gRJprvzVsBDQSx7d4RT/ZiCiZSpi8okRC/DtfxHeUez90Yj0O89qXKkSzTu3sKGwc9AncoMxxyNa9BHj9cCuRzRNx5UoOPi7OAOmSOUS3/Ckn5gIMM7knjP6ZGGCjvUhtrWOx/9K9OZcAuxqo7qDnG5SvKIr+PlXdLZZAd6JgAIoHDVf3ZdRdt6Q7wpqMnZVx/dBYgmtGBorHODCY5zY8gunbjaRYhy4kGTbx1WKV2mdzhNQCE9Sk5tDd79ez8qHQWenbZxr96UEbOM1GG6OeRyQ1ND/rBUf6C6hkWo7ywGPHfriitFCq8bK2RMDIigY3FySck0GZvGpfOfSPKTQ6LZ3/PYpCML8KfDkWWaFnZ3VrNRzSihFtHB6iL6eHYzpieC0C8CXsyPbV2pQINwBBOPZvYQRFhh/87N9rZLwFq0/+UpgaJr6pPhDCS3UqsU+d4Lm+4jtIDm72unCyrsi49flxsXJINrnVbYynCdKRZbwNQ3bwl+n5hE0eEUnBWB5NeQohXs4eHHLAuYw3zdrVfhO1Co/B00ehuhF6tQW5ISiYioRS7EG6Q1dvg+m/jQpYFuGbyIlw6Sg0mqGwOZa4kbUFBtif1YE9l06v+zM8kK7mwgKbRUeX/XDCERw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(11063799006)(261022075727099003)(261021121427099003)(56012099006)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	66jBSURsmHq8jpW/sI0We9iAJnhRFUdxQxMNPzLXZz20kVCNM7vdUzsLsnx/XlHc07EgexwX0UYXIdhR8QPwFLCwRfpmGVpf1gmgaDUSh/DgSZjIhu/WcFdHh4EduIS05HQiZu+DRpmhH/Zu07cBijYAeKTwAMXzHFwIpFPRJ9qderSRVG2brtPNre3KbcyOuRlIRMzsncd3JF9KcL98PWfiVnZuSm1zJebAaeMqgQRoEXMVmAR6ms32tEpJfX1BHPWyWCQbgRds621Ye2Gg2XOuC7hqJDGIlJ+quWvWoMIbbFcZ2V6P4DD3nd1QCu1iFXgTlg2aQrR0ZGGYJN81+KJlLScoZ5SOauDNaAHdO06Y5OaEkN9VcBHUaxvA1d1yE142SPjkRpVl559zhw5pLnVTj2Xd2VX5PZcFxCe4l74/ILqPpRkz4vYV4O0lXPGg
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:03:07.4319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 041a3df2-0c92-4d63-7f5e-08df3b34c130
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008C5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR10MB381800

From: Simeon Marijon <simeon.marijon@foss.st.com>

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index ae45c2023afe..e1e943e9d5a6 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1942,5 +1942,39 @@ gpioi: gpio@5000a000 {
 				gpio-ranges = <&pinctrl 0 128 8>;
 			};
 		};
+
+		tamp: tamp@5c00a000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x5c00a000 0x400>;
+			ranges;
+
+			nvram: nvram@5c00a100 {
+				compatible = "st,stm32mp15-tamp-nvram";
+				reg = <0x5c00a100 0x80>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					saes_secret_key: tamp-bkp@0 {
+						/* see saes secret key feature */
+						reg = <0x0 0x20>;
+					};
+
+					boot_mode: tamp-bkp@78 {
+						/* see boot mode selection feature */
+						reg = <0x78 0x4>;
+					};
+
+					boot_counter: tamp-bkp@7c {
+						/* see boot counter feature */
+						reg = <0x7c 0x4>;
+					};
+				};
+			};
+		};
 	};
 };

-- 
2.43.0

