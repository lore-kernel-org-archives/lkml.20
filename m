Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794579698;
	b=oQsoPXdfUJX2e5UfVX9KgPs6NccUBLidvxbRBbQjHuFSlVhrc1QL15lneyMF0x2ObC+s
	 rPBg8Ql3VrITt832vN/KbtfsAhsXG/CUriw/yKBa3kh1VJA5DNSXD/gQCFzNJnKcjrtFh
	 GMUFEJwMnihrLxeir/+rN9/gjBbW1DmKMb0FztQUj3GMkDTGmNKzULBdjfDkDkgvaV/5L
	 y/Bpql7D2wpj1JjKx57yUrNpSLloXaAqwmlWRZ20OxBL8xPPd3M5aYHAr57jwyvzdn6PU
	 CSkXeTgPMImQAczj2Y7JwEj7zk0qImgTJ/wxgSvM9bK3penPbf+hwKT2EgqqF/XceOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579698;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=p1LexfynR7XcG1TjVXrlRyFs5LjQ7N9F4zF+1/1oLXY=;
	b=EUs2cxWKNIJTjT2U8ha3uc0ghBSzUKnkQT9BOezsBkXWWPasNFbDyxDtGTNwX6tMbwef
	 aFL6Ej0dGXM22udxkHk7SZi+KVBfGc/d7HfJrS1/cQv7kg+R/pVf2PUvu3XVI0gP4jt+c
	 4HdEoMYUfJBObvnZHe6P/kDuQ/jKEEIzSzpA4pw7sJRb5XycR7P+YBsLvWTveRyIkY9jW
	 XYdI+U5orFFBnyCmcpq2XV3lgiaTxQoWWOaKjWq5ONLjKdtFBVfkHhCn/QSVnfe6cl/mW
	 btskNlSe5jJn/7jUjXhaH6oueGw4FQmpIQKs1DPthtzKUzkBjSGK27pTAhy4/b4EzUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b="KDidR/w9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.6
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013006.outbound.protection.outlook.com [52.101.72.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6F3606A32D;
	Fri, 13 Nov 2026 14:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA6F3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=KDidR/w9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKuSLziweKV8K7TWExbOxfhObQkUjiKk5WHzhwyCgtnLNneRuh4Oy6LjZISy4voE6g1OagoajY7TYeALA2YiRfVCeF6c/7mfuXAKJcm2rgNUrk02uCavN9mQxt35WXaGtjupS0nODjRAmZHNRxQfVju4N7jQu/YX+7TGu13O/rvLOrMwe7W6oLrCd7mCid+16Pkt8bqxCdQIHrGoJw3KHN9x0ygfEB4+xaDUetzlZ9WBMDIn+z4l2EWHuC0YQxnS9DMc8GXEGs0DEt9ZaExfhtoYQgdT2EyBSQx9RB/11EfloCUlS3/8uwKMyWNFVpHJ0yxnpISg2fx7w/iOxoQQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1LexfynR7XcG1TjVXrlRyFs5LjQ7N9F4zF+1/1oLXY=;
 b=WEBDo3xqlgTPthLMy/APyB6gd5LnVeMn5WDe+RVxKUD7o/WuDbR4zZqi1l8WtA/6mORUQL5mS9REF22lvi7Icej7GV5PfKz5ix9LFZDbSFkeEOSvngoWrQOpw5/AnmCsiJCyxOtDPyim76Gqd7ZyUink7eenVL4vKx7fbJ0sTPFTHSzO17+2X6HGeZYcOvmHzhE8elHVSBYuK3zOTxIDWcBJrNthi+IQN9J0zy7HorC9BSpE/KxcTeP3pFW97iUfuCuQEc9NM7Bw9aWNSvxQNCRIIwAQXpm6G/CbrDxSwIXbAWlTsDC9r8IkivB6FKDW64AaHC6C8Ye2Pdd/qpTVxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1LexfynR7XcG1TjVXrlRyFs5LjQ7N9F4zF+1/1oLXY=;
 b=KDidR/w9eB7go1GGAGgMlcVEJ4hj9amO39EKkUPZAcsafYDq4ivjl1SlqCej98RuSqo9yKP3vozhEAdItln38dAxqLDyUOAhkP7DIg87KmMT0nMmFtXy91kWwD9q9dBuvxkaD93was9LUuhD0jvxt2tRLCEi3zZpcmne6xWWRokie06k66Jna7Ss+HXiSjxGPJFYaKmiqg+mDZAR8S09Z+KtWRw6XDggTBaYocgkNsZmsQpKEhxT/0bgeJCwVhcK1rbm+TFFqPAInFCpuyG63HVDPA2TvunNm2R1pJArY8NDrKjlOkRPldP5+3BoLK/eyYuSdXI/1vexuhOz0NJyaA==
Received: from DU2P251CA0008.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::10)
 by AS2PR10MB7709.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:64f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Fri, 13 Nov
 2026 14:21:33 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::2a) by DU2P251CA0008.outlook.office365.com
 (2603:10a6:10:230::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Fri, 13
 Nov 2026 14:21:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 14:21:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 13 Nov
 2026 15:21:13 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 13 Nov
 2026 15:20:30 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] Add SCMI regulators description on STM32MP21
Date: Fri, 13 Nov 2026 15:10:38 +0100
Message-ID: <20261113141342.557258-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|AS2PR10MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: a070b65e-66c7-4b8b-cdbb-08df41916ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|18002099003|261009223027099003|261022105027099003|261026121527099003|261026140227099003|261102123227099003|261028144727099003|261021123027099003|261021121427099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	85Pm46DDdgYAh5LW7K3YbgbE/Iq6xcBITiiwKazznrnssWC+BPbU7DWnV7MTRN9BvjfQww1wZW0c87F4Mld0Rthma3IksOZ8d5G79Siz38GrTCpSsvYdjqL0GnHb772WD3vkof3/mYT/ZtRjzTKPR6ewTO1vJTeZa4IJcwxzeNzpb4rwfpGI/oIoVV10gG9j9oKtaCVghUpBtW0NAnV8w8z8zhrxNvxbPBf9wFF9fLoMkTrMhRSOaLvwzXjOdYoPHXAXlKYk1z0GPbsGQzr44O3+47dv4OJQe6hB8mPHUeAX6HP5MAIpcpkK1tcUtSmWn5ASp8QQloxFPaP9seyvVIVscyK/ldZr80PehFoK86o9N7sSYVtJCG/tQxXrZLkOfvdv6yQX8SBRUmjRjyR9VDA87E4LhjBW+odg3spQd6cTKf210NRh+xgqRUpaVYlv4GyEdaltrR4+6eiyWeDREGP7MyqhZZKCWIb0/Vjuzzi86dM5whB1Z5yuesP+0IBx3wt6PA3h/7QPSiRJ4mtgcxa+HLeOrX97QNOC6979hSTjVX5Wz+wDIrBCIA20dl6Ohdyeqb2C88yo5wlIikOHc6VTQ+HvVytm/8CFbBeWk1mrfQFglxaiALqpW+w7ukoUUQHmfsTGPVo1Dk17wUcOadI4VnIUOK+8L0LbbNhYulOdpcPOwKin2XodInGUvGslw2rB73i78K9AAqQII89eMA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(18002099003)(261009223027099003)(261022105027099003)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(261021123027099003)(261021121427099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4q762TO1+X18XlEupUgPmczU/4f6tyqHOZXKiRhU3YPuvotSe4h3D6rjKizyWBWdb036VldBiuADPcIa0EZ3L6hYRwzwbtfTrl38j12jpPYaLOGs2FKcDINzEHkR3aocEAk1kEqJzIjaNbnZ4YPch0gLcUVRNT81gaRKzvH1rk5M1eoNG3WBnJ6BbL+PQ/k5pQSpredTm6qA6INuT71wLXmje7L3ULtfPLx3HN7dbI4/YG5HL+FI4ibZBVzs4yzlr70lbOYSD0CJJBKPsNONT0358IJ4JtIve2vFvH9g6I8sxbUr6SqLKqH5Q34PdtuBA3dbqRV/E3lVvvoI1DaoroCIcbPIDFXY9paHPxHrDbyzdolJn4OLeNwMwCPZx7+iCR18SjnV1+wBPuQcC0YogbP51sGjnDGcN5xFVMmF7PUJSlZ90pXhqqwIvsiGskx7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 14:21:32.4894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a070b65e-66c7-4b8b-cdbb-08df41916ab1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7709


Add the description for SCMI regulators provided by OP-TEE firmware.
The binding file named st,stm32mp21-regulator.h will be also used in
the OP-TEE firmware.



Patrick Delaunay (3):
  dt-bindings: add STM32MP21 regulator bindings
  arm64: dts: st: add SCMI voltage domain regulators for STM32MP211
  arm64: dts: st: add SCMI regulators for stm32mp215f-dk board

 arch/arm64/boot/dts/st/stm32mp211.dtsi        | 27 +++++++++++
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts     | 23 +++++++++
 .../regulator/st,stm32mp21-regulator.h        | 48 +++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 include/dt-bindings/regulator/st,stm32mp21-regulator.h

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
branch: fsdffsf

-- 
2.43.0

